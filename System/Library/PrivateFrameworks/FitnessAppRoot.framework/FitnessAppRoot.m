uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_24EA068B8();
}

uint64_t dispatch thunk of TabBarItemProtocol.allowsPinnedPlacement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TabBarItemProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TabBarItemProtocol.isSelectable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of TabBarItemProtocol.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of TabBarItemProtocol.systemImageName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of TabBarItemProtocol.title(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24E9A84D8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E9A84F8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_24E9A8534(uint64_t a1, uint64_t a2)
{
  return sub_24E9A86B4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24E9A8554(uint64_t a1, uint64_t a2)
{
  return sub_24E9A86B4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24E9A8578(uint64_t a1, id *a2)
{
  uint64_t result = sub_24EA06918();
  *a2 = 0;
  return result;
}

uint64_t sub_24E9A85F0(uint64_t a1, id *a2)
{
  char v3 = sub_24EA06928();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24E9A8670@<X0>(uint64_t *a1@<X8>)
{
  sub_24EA06938();
  uint64_t v2 = sub_24EA06908();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24E9A86B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24EA06938();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24E9A86F8()
{
  sub_24EA06938();
  sub_24EA06968();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E9A874C()
{
  sub_24EA06938();
  sub_24EA07048();
  sub_24EA06968();
  uint64_t v0 = sub_24EA07088();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24E9A87C4()
{
  uint64_t v0 = sub_24EA06938();
  uint64_t v2 = v1;
  if (v0 == sub_24EA06938() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24EA07028();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24E9A8854@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EA06938();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24E9A8880(uint64_t a1)
{
  uint64_t v2 = sub_24E9A8BE0((unint64_t *)&qword_26991DDA8, type metadata accessor for Key);
  uint64_t v3 = sub_24E9A8BE0((unint64_t *)&unk_26991DDB0, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24E9A893C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24EA06908();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24E9A8984(uint64_t a1)
{
  uint64_t v2 = sub_24E9A8BE0((unint64_t *)&unk_26B1CD780, type metadata accessor for AttributeName);
  uint64_t v3 = sub_24E9A8BE0((unint64_t *)&unk_26991DDC0, type metadata accessor for AttributeName);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SignOutAnimationState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_24E9A8AA8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E9A8AC8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
}

void sub_24E9A8B08(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24E9A8B50()
{
  return sub_24E9A8BE0(&qword_26991DD78, type metadata accessor for AttributeName);
}

uint64_t sub_24E9A8B98()
{
  return sub_24E9A8BE0(&qword_26991DD80, type metadata accessor for AttributeName);
}

uint64_t sub_24E9A8BE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E9A8C28()
{
  return sub_24E9A8BE0(&qword_26991DD88, type metadata accessor for Key);
}

uint64_t sub_24E9A8C70()
{
  return sub_24E9A8BE0(&qword_26991DD90, type metadata accessor for Key);
}

uint64_t sub_24E9A8CB8()
{
  return sub_24E9A8BE0((unint64_t *)&unk_26991DD98, type metadata accessor for Key);
}

uint64_t sub_24E9A8D00()
{
  return sub_24E9A8BE0(&qword_26B1CD790, type metadata accessor for AttributeName);
}

uint64_t sub_24E9A8D50(char a1)
{
  return *(void *)&aSignedinsigned[8 * a1];
}

BOOL sub_24E9A8D70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E9A8D84()
{
  return sub_24EA07088();
}

uint64_t sub_24E9A8DCC()
{
  return sub_24EA07058();
}

uint64_t sub_24E9A8DF8()
{
  return sub_24EA07088();
}

uint64_t sub_24E9A8E3C()
{
  return sub_24E9A8D50(*v0);
}

uint64_t sub_24E9A8E44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9AA424(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9A8E6C()
{
  return 0;
}

void sub_24E9A8E78(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24E9A8E84(uint64_t a1)
{
  unint64_t v2 = sub_24E9A9784();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9A8EC0(uint64_t a1)
{
  unint64_t v2 = sub_24E9A9784();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9A8EFC()
{
  return 0;
}

uint64_t sub_24E9A8F08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24E9A8F38(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24E9A8F44(uint64_t a1)
{
  unint64_t v2 = sub_24E9A983C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9A8F80(uint64_t a1)
{
  unint64_t v2 = sub_24E9A983C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9A8FBC()
{
  return 1;
}

uint64_t sub_24E9A8FD0(uint64_t a1)
{
  unint64_t v2 = sub_24E9A9890();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9A900C(uint64_t a1)
{
  unint64_t v2 = sub_24E9A9890();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9A9048()
{
  return sub_24EA07088();
}

uint64_t sub_24E9A908C()
{
  return sub_24EA07058();
}

uint64_t sub_24E9A90B4()
{
  return sub_24EA07088();
}

uint64_t sub_24E9A90F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9AA58C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9A9120(uint64_t a1)
{
  unint64_t v2 = sub_24E9A98E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9A915C(uint64_t a1)
{
  unint64_t v2 = sub_24E9A98E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AccountState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE30);
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  MEMORY[0x270FA5388](v2);
  v32 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE38);
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  MEMORY[0x270FA5388](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE40);
  uint64_t v31 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24EA05C78();
  uint64_t v33 = *(void *)(v9 - 8);
  uint64_t v34 = v9;
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE48);
  uint64_t v41 = *(void *)(v15 - 8);
  uint64_t v42 = v15;
  MEMORY[0x270FA5388](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9A9784();
  sub_24EA070A8();
  sub_24E9A97D8(v40, (uint64_t)v14);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      char v44 = 1;
      sub_24E9A9890();
      uint64_t v19 = v42;
      sub_24EA06F98();
      uint64_t v20 = v36;
      sub_24EA06FB8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v17, v19);
    }
    else
    {
      char v45 = 2;
      sub_24E9A983C();
      v28 = v32;
      uint64_t v29 = v42;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v39);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v17, v29);
    }
  }
  else
  {
    uint64_t v22 = v31;
    uint64_t v23 = v33;
    v24 = v14;
    uint64_t v25 = v34;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v11, v24, v34);
    char v43 = 0;
    sub_24E9A98E4();
    uint64_t v26 = v42;
    sub_24EA06F98();
    sub_24E9AA954(&qword_26991DE70, MEMORY[0x263F06A30]);
    uint64_t v27 = v37;
    sub_24EA06FE8();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v27);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v17, v26);
  }
}

uint64_t type metadata accessor for AccountState()
{
  uint64_t result = qword_26B1CC898;
  if (!qword_26B1CC898) {
    return swift_getSingletonMetadata();
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

unint64_t sub_24E9A9784()
{
  unint64_t result = qword_26991DE50;
  if (!qword_26991DE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DE50);
  }
  return result;
}

uint64_t sub_24E9A97D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E9A983C()
{
  unint64_t result = qword_26991DE58;
  if (!qword_26991DE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DE58);
  }
  return result;
}

unint64_t sub_24E9A9890()
{
  unint64_t result = qword_26991DE60;
  if (!qword_26991DE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DE60);
  }
  return result;
}

unint64_t sub_24E9A98E4()
{
  unint64_t result = qword_26991DE68;
  if (!qword_26991DE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DE68);
  }
  return result;
}

uint64_t AccountState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE78);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v59 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE80);
  uint64_t v55 = *(void *)(v50 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v58 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE88);
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v57 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE90);
  uint64_t v56 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AccountState();
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v17 = (char *)&v47 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v47 - v18;
  uint64_t v20 = a1[3];
  v61 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24E9A9784();
  uint64_t v21 = v62;
  sub_24EA07098();
  if (v21) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  }
  v47 = v14;
  v48 = v17;
  uint64_t v22 = v57;
  uint64_t v23 = v58;
  v49 = v19;
  uint64_t v62 = v11;
  v24 = v59;
  uint64_t v25 = v60;
  uint64_t v26 = sub_24EA06F78();
  if (*(void *)(v26 + 16) != 1)
  {
    uint64_t v33 = sub_24EA06DC8();
    swift_allocError();
    uint64_t v34 = v8;
    uint64_t v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *uint64_t v36 = v62;
    sub_24EA06F18();
    sub_24EA06DB8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v36, *MEMORY[0x263F8DCB0], v33);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v10, v34);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  }
  if (*(unsigned char *)(v26 + 32))
  {
    if (*(unsigned char *)(v26 + 32) == 1)
    {
      char v64 = 1;
      sub_24E9A9890();
      uint64_t v27 = v23;
      sub_24EA06F08();
      uint64_t v28 = v8;
      uint64_t v29 = v50;
      uint64_t v30 = sub_24EA06F38();
      uint64_t v31 = v27;
      uint64_t v32 = v56;
      uint64_t v44 = v43;
      v59 = (char *)v30;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v31, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v28);
      uint64_t v45 = (uint64_t)v47;
      void *v47 = v59;
      *(void *)(v45 + 8) = v44;
      swift_storeEnumTagMultiPayload();
      uint64_t v46 = (uint64_t)v49;
      sub_24E9AA0E4(v45, (uint64_t)v49);
    }
    else
    {
      char v65 = 2;
      sub_24E9A983C();
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v24, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v10, v8);
      uint64_t v46 = (uint64_t)v49;
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v41 = (uint64_t)v61;
    uint64_t v38 = v25;
  }
  else
  {
    char v63 = 0;
    sub_24E9A98E4();
    sub_24EA06F08();
    uint64_t v37 = v8;
    uint64_t v38 = v25;
    sub_24EA05C78();
    sub_24E9AA954(&qword_26991DEA0, MEMORY[0x263F06A30]);
    uint64_t v39 = (uint64_t)v48;
    uint64_t v40 = v52;
    sub_24EA06F68();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v22, v40);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v10, v37);
    uint64_t v41 = (uint64_t)v61;
    swift_storeEnumTagMultiPayload();
    uint64_t v46 = (uint64_t)v49;
    sub_24E9AA0E4(v39, (uint64_t)v49);
  }
  sub_24E9AA0E4(v46, v38);
  return __swift_destroy_boxed_opaque_existential_1(v41);
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

uint64_t sub_24E9AA0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E9AA148@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AccountState.init(from:)(a1, a2);
}

uint64_t sub_24E9AA160(void *a1)
{
  return AccountState.encode(to:)(a1);
}

uint64_t AccountState.hash(into:)()
{
  uint64_t v1 = sub_24EA05C78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9A97D8(v0, (uint64_t)v7);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_24EA07058();
      sub_24EA06968();
      return swift_bridgeObjectRelease();
    }
    else
    {
      return sub_24EA07058();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_24EA07058();
    sub_24E9AA954(&qword_26991DEA8, MEMORY[0x263F06A30]);
    sub_24EA068A8();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t AccountState.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t sub_24E9AA3A0()
{
  return sub_24EA07088();
}

uint64_t sub_24E9AA3E4()
{
  return sub_24EA07088();
}

uint64_t sub_24E9AA424(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E4964656E676973 && a2 == 0xE800000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E4964656E676973 && a2 == 0xEF74736575477341 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E676953746F6ELL && a2 == 0xEB000000006E4964)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24E9AA58C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24E9AA5FC()
{
  return 12383;
}

uint64_t _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05C78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccountState();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1CCCC8);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_24E9A97D8(a1, (uint64_t)v17);
  sub_24E9A97D8(a2, (uint64_t)v18);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_24E9A97D8((uint64_t)v17, (uint64_t)v13);
    if (!swift_getEnumCaseMultiPayload())
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      char v24 = sub_24EA05C58();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
      v25(v7, v4);
      v25(v13, v4);
      sub_24E9AAD2C((uint64_t)v17);
      return v24 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    goto LABEL_15;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      goto LABEL_19;
    }
LABEL_15:
    sub_24E9AB6BC((uint64_t)v17);
    goto LABEL_16;
  }
  sub_24E9A97D8((uint64_t)v17, (uint64_t)v11);
  uint64_t v21 = *v11;
  uint64_t v20 = v11[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (v21 == *(void *)v18 && v20 == *((void *)v18 + 1))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  char v23 = sub_24EA07028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
LABEL_19:
    sub_24E9AAD2C((uint64_t)v17);
    char v24 = 1;
    return v24 & 1;
  }
  sub_24E9AAD2C((uint64_t)v17);
LABEL_16:
  char v24 = 0;
  return v24 & 1;
}

uint64_t sub_24E9AA90C()
{
  return sub_24E9AA954(&qword_26991DEB0, (void (*)(uint64_t))type metadata accessor for AccountState);
}

uint64_t sub_24E9AA954(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for AccountState(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_24EA05C78();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for AccountState(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_24EA05C78();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for AccountState(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24EA05C78();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for AccountState(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9AAD2C((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24EA05C78();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24E9AAD2C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for AccountState(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_24EA05C78();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for AccountState(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9AAD2C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_24EA05C78();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AccountState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24E9AAF58()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24E9AAF68()
{
  uint64_t result = sub_24EA05C78();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccountState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9AB154);
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

uint64_t sub_24E9AB17C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E9AB184(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountState.CodingKeys()
{
  return &type metadata for AccountState.CodingKeys;
}

uint64_t sub_24E9AB1A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountState.SignedInCodingKeys()
{
  return &type metadata for AccountState.SignedInCodingKeys;
}

uint64_t getEnumTagSinglePayload for SignOutLocalState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *_s14FitnessAppRoot12AccountStateO18SignedInCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9AB2ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountState.SignedInAsGuestCodingKeys()
{
  return &type metadata for AccountState.SignedInAsGuestCodingKeys;
}

ValueMetadata *type metadata accessor for AccountState.NotSignedInCodingKeys()
{
  return &type metadata for AccountState.NotSignedInCodingKeys;
}

unint64_t sub_24E9AB2F8()
{
  unint64_t result = qword_26991DEB8;
  if (!qword_26991DEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEB8);
  }
  return result;
}

unint64_t sub_24E9AB350()
{
  unint64_t result = qword_26991DEC0;
  if (!qword_26991DEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEC0);
  }
  return result;
}

unint64_t sub_24E9AB3A8()
{
  unint64_t result = qword_26991DEC8;
  if (!qword_26991DEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEC8);
  }
  return result;
}

unint64_t sub_24E9AB400()
{
  unint64_t result = qword_26991DED0;
  if (!qword_26991DED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DED0);
  }
  return result;
}

unint64_t sub_24E9AB458()
{
  unint64_t result = qword_26991DED8;
  if (!qword_26991DED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DED8);
  }
  return result;
}

unint64_t sub_24E9AB4B0()
{
  unint64_t result = qword_26991DEE0;
  if (!qword_26991DEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEE0);
  }
  return result;
}

unint64_t sub_24E9AB508()
{
  unint64_t result = qword_26991DEE8;
  if (!qword_26991DEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEE8);
  }
  return result;
}

unint64_t sub_24E9AB560()
{
  unint64_t result = qword_26991DEF0;
  if (!qword_26991DEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEF0);
  }
  return result;
}

unint64_t sub_24E9AB5B8()
{
  unint64_t result = qword_26991DEF8;
  if (!qword_26991DEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DEF8);
  }
  return result;
}

unint64_t sub_24E9AB610()
{
  unint64_t result = qword_26991DF00;
  if (!qword_26991DF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DF00);
  }
  return result;
}

unint64_t sub_24E9AB668()
{
  unint64_t result = qword_26991DF08;
  if (!qword_26991DF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DF08);
  }
  return result;
}

uint64_t sub_24E9AB6BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1CCCC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SidebarState.selectedItem.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_24EA06CA8();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t SidebarState.selectedItem.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 40);
  uint64_t v5 = sub_24EA06CA8();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*SidebarState.selectedItem.modify())()
{
  return nullsub_1;
}

uint64_t SidebarState.isSidebarVisible.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 44));
}

uint64_t SidebarState.isSidebarVisible.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 44)) = result;
  return result;
}

uint64_t (*SidebarState.isSidebarVisible.modify())()
{
  return nullsub_1;
}

uint64_t SidebarState.rootItemShouldScrollToOrigin.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 48));
}

uint64_t SidebarState.rootItemShouldScrollToOrigin.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 48)) = result;
  return result;
}

uint64_t (*SidebarState.rootItemShouldScrollToOrigin.modify())()
{
  return nullsub_1;
}

uint64_t SidebarState.init(items:locale:selectedItem:isSidebarVisible:rootItemShouldScrollToOrigin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for SidebarState();
  uint64_t v15 = (char *)a7 + v14[10];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56))(v15, 1, 1, a6);
  *a7 = a1;
  uint64_t v16 = (char *)a7 + v14[9];
  uint64_t v17 = sub_24EA05CD8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v16, a2, v17);
  uint64_t v18 = sub_24EA06CA8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v15, a3, v18);
  *((unsigned char *)a7 + v14[11]) = a4;
  *((unsigned char *)a7 + v14[12]) = a5;
  return result;
}

uint64_t type metadata accessor for SidebarState()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24E9ABA04(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24E9ABA14()
{
  return sub_24EA07058();
}

uint64_t sub_24E9ABA3C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736D657469 && a2 == 0xE500000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xEC0000006D657449 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EA155E0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000024EA15600)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24E9ABC38()
{
  return sub_24EA07088();
}

unint64_t sub_24E9ABC80(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 2:
      unint64_t result = 0x64657463656C6573;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      unint64_t result = 0x736D657469;
      break;
  }
  return result;
}

BOOL sub_24E9ABD34(char *a1, char *a2)
{
  return sub_24E9ABA04(*a1, *a2);
}

uint64_t sub_24E9ABD48()
{
  return sub_24E9ABC38();
}

uint64_t sub_24E9ABD54()
{
  return sub_24E9ABA14();
}

uint64_t sub_24E9ABD60()
{
  return sub_24EA07088();
}

unint64_t sub_24E9ABDA8()
{
  return sub_24E9ABC80(*v0);
}

uint64_t sub_24E9ABDB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9ABA3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9ABDE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E9AE168();
  *a1 = result;
  return result;
}

uint64_t sub_24E9ABE10(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9ABE64(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t SidebarState.encode(to:)(void *a1, uint64_t a2)
{
  v11[0] = a2;
  uint64_t v12 = *(void *)(a2 + 24);
  type metadata accessor for SidebarState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EA06FF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v11 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = v3;
  int v8 = (uint64_t *)v11[1];
  sub_24EA070A8();
  uint64_t v16 = *v8;
  char v15 = 0;
  sub_24EA06A58();
  uint64_t v14 = *(void *)(v12 + 16);
  swift_getWitnessTable();
  uint64_t v9 = v13;
  sub_24EA06FE8();
  if (v9) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  }
  uint64_t v13 = v4;
  LOBYTE(v16) = 1;
  sub_24EA05CD8();
  sub_24E9AC7B8(&qword_26991DF10);
  sub_24EA06FE8();
  LOBYTE(v16) = 2;
  sub_24EA06FA8();
  LOBYTE(v16) = 3;
  sub_24EA06FC8();
  LOBYTE(v16) = 4;
  sub_24EA06FC8();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v6, v7);
}

uint64_t type metadata accessor for SidebarState.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SidebarState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a4;
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)&v35 - v8;
  uint64_t v42 = sub_24EA05CD8();
  uint64_t v39 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SidebarState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v45 = sub_24EA06F88();
  uint64_t v40 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v43 = a3;
  uint64_t v12 = type metadata accessor for SidebarState();
  uint64_t v36 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v35 - v14;
  uint64_t v16 = (char *)&v35 + *(int *)(v13 + 40) - v14;
  uint64_t v17 = *(void (**)(void))(*(void *)(a2 - 8) + 56);
  uint64_t v50 = v16;
  v17();
  uint64_t v18 = a1[3];
  uint64_t v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  uint64_t v44 = v11;
  uint64_t v19 = v49;
  sub_24EA07098();
  if (v19)
  {
    uint64_t v23 = v47;
    uint64_t v22 = v48;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v50, v22);
  }
  else
  {
    uint64_t v20 = v41;
    uint64_t v21 = v42;
    v49 = v15;
    uint64_t v35 = v12;
    sub_24EA06A58();
    char v52 = 0;
    uint64_t v51 = *(void *)(v43 + 8);
    swift_getWitnessTable();
    sub_24EA06F68();
    char v24 = (char *)v49;
    void *v49 = v53;
    LOBYTE(v53) = 1;
    sub_24E9AC7B8(qword_26991DF18);
    uint64_t v25 = v20;
    sub_24EA06F68();
    uint64_t v27 = v47;
    uint64_t v26 = v48;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v24[*(int *)(v35 + 36)], v25, v21);
    LOBYTE(v53) = 2;
    uint64_t v28 = v38;
    sub_24EA06F28();
    (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v50, v28, v26);
    LOBYTE(v53) = 3;
    char v29 = sub_24EA06F48();
    uint64_t v30 = v35;
    uint64_t v31 = v49;
    *((unsigned char *)v49 + *(int *)(v35 + 44)) = v29 & 1;
    LOBYTE(v53) = 4;
    char v32 = sub_24EA06F48();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v45);
    *((unsigned char *)v31 + *(int *)(v30 + 48)) = v32 & 1;
    uint64_t v33 = v36;
    (*(void (**)(uint64_t, void *, uint64_t))(v36 + 16))(v37, v31, v30);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    return (*(uint64_t (**)(void *, uint64_t))(v33 + 8))(v31, v30);
  }
}

uint64_t sub_24E9AC7B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EA05CD8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E9AC7FC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return SidebarState.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E9AC81C(void *a1, uint64_t a2)
{
  return SidebarState.encode(to:)(a1, a2);
}

uint64_t static SidebarState.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  v61 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24EA06CA8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v62 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v63 = TupleTypeMetadata2;
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v52 - v12;
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v52 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v52 - v20;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = *(void *)(*(void *)(a4 + 24) + 8);
  if ((sub_24EA06A78() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v56 = v25;
  v57 = v16;
  uint64_t v58 = v9;
  v59 = v19;
  uint64_t v26 = v21;
  uint64_t v60 = v13;
  uint64_t v27 = v65;
  uint64_t v28 = v24;
  char v29 = (int *)type metadata accessor for SidebarState();
  uint64_t v30 = v23;
  if ((MEMORY[0x2533452D0](v22 + v29[9], v23 + v29[9]) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v31 = v29[10];
  uint64_t v52 = v22;
  char v32 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
  uint64_t v33 = v26;
  uint64_t v34 = v58;
  v32(v26, v22 + v31, v58);
  uint64_t v35 = v29[10];
  uint64_t v53 = v30;
  uint64_t v36 = v59;
  v32(v59, v30 + v35, v34);
  uint64_t v37 = v60;
  uint64_t v38 = &v60[*(int *)(v63 + 48)];
  v32(v60, (uint64_t)v33, v34);
  uint64_t v55 = v38;
  v32(v38, (uint64_t)v36, v34);
  uint64_t v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v54(v37, 1, v24) != 1)
  {
    uint64_t v40 = v57;
    v32(v57, (uint64_t)v37, v34);
    uint64_t v41 = v55;
    uint64_t v42 = (void (**)(char *, uint64_t))(v27 + 8);
    if (v54(v55, 1, v24) != 1)
    {
      uint64_t v45 = v27 + 32;
      uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
      uint64_t v46 = v33;
      uint64_t v47 = v61;
      v44(v61, v41, v28);
      LODWORD(v65) = sub_24EA068D8();
      uint64_t v48 = *(void (**)(char *, uint64_t))(v45 - 24);
      v48(v47, v28);
      v49 = *(void (**)(char *, uint64_t))(v64 + 8);
      v49(v59, v34);
      v49(v46, v34);
      v48(v40, v28);
      v49(v37, v34);
      if ((v65 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v43 = *(void (**)(char *, uint64_t))(v64 + 8);
    v43(v59, v34);
    v43(v33, v34);
    (*v42)(v40, v24);
LABEL_8:
    (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v63);
    goto LABEL_11;
  }
  uint64_t v39 = *(void (**)(char *, uint64_t))(v64 + 8);
  v39(v36, v34);
  v39(v33, v34);
  if (v54(v55, 1, v24) != 1) {
    goto LABEL_8;
  }
  v39(v60, v34);
LABEL_10:
  if (*(unsigned __int8 *)(v52 + v29[11]) == *(unsigned __int8 *)(v53 + v29[11]))
  {
    char v50 = *(unsigned char *)(v52 + v29[12]) ^ *(unsigned char *)(v53 + v29[12]) ^ 1;
    return v50 & 1;
  }
LABEL_11:
  char v50 = 0;
  return v50 & 1;
}

uint64_t sub_24E9ACD78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SidebarState.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t sub_24E9ACD84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24E9ACD8C()
{
  uint64_t result = sub_24EA05CD8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24EA06CA8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24E9ACE74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v12;
  if (*(_DWORD *)(v11 + 84)) {
    size_t v14 = *(void *)(v11 + 64);
  }
  else {
    size_t v14 = *(void *)(v11 + 64) + 1;
  }
  int v15 = (v12 | *(_DWORD *)(v7 + 80)) & 0x100000;
  uint64_t v16 = *a2;
  *a1 = *a2;
  if ((v12 | v8) > 7
    || v15 != 0
    || ((v9 + ((v8 + 8) & ~v8) + v12) & ~(unint64_t)v12) + v14 + 2 > 0x18)
  {
    uint64_t v19 = v16 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16));
    swift_retain();
  }
  else
  {
    uint64_t v20 = ~v8;
    uint64_t v30 = v10;
    uint64_t v31 = a1;
    uint64_t v21 = (char *)a1 + v8;
    uint64_t v22 = (char *)a2 + v8;
    uint64_t v23 = (unint64_t)(v21 + 8) & v20;
    uint64_t v24 = (unint64_t)(v22 + 8) & v20;
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    swift_bridgeObjectRetain();
    v25(v23, v24, v6);
    uint64_t v26 = (char *)((v23 + v9 + v13) & ~v13);
    uint64_t v27 = (const void *)((v24 + v9 + v13) & ~v13);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v27, 1, v30))
    {
      memcpy(v26, v27, v14);
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v11 + 16))(v26, v27, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v26, 0, 1, v30);
    }
    uint64_t v28 = &v26[v14];
    char *v28 = *((unsigned char *)v27 + v14);
    v28[1] = *((unsigned char *)v27 + v14 + 1);
    return v31;
  }
  return (uint64_t *)v19;
}

uint64_t sub_24E9AD0C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (v7 + *(void *)(v6 + 56) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = v9;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8);
  if (!result)
  {
    int v12 = *(uint64_t (**)(unint64_t, uint64_t))(v13 + 8);
    return v12(v10, v8);
  }
  return result;
}

void *sub_24E9AD1F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v9 = v7 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = ((unint64_t)a1 + v10 + 8) & ~v10;
  uint64_t v12 = ((unint64_t)a2 + v10 + 8) & ~v10;
  swift_bridgeObjectRetain();
  v8(v11, v12, v6);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v9 + 48) + v15;
  uint64_t v17 = (char *)((v16 + v11) & ~v15);
  uint64_t v18 = (char *)((v16 + v12) & ~v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    int v19 = *(_DWORD *)(v14 + 84);
    size_t v20 = *(void *)(v14 + 64);
    if (v19) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v20 + 1;
    }
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v18, v13);
    uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v22 = v14 + 56;
    v23(v17, 0, 1, v13);
    int v19 = *(_DWORD *)(v22 + 28);
    size_t v20 = *(void *)(v22 + 8);
  }
  if (v19) {
    size_t v24 = v20;
  }
  else {
    size_t v24 = v20 + 1;
  }
  uint64_t v25 = &v17[v24];
  uint64_t v26 = &v18[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  return a1;
}

void *sub_24E9AD398(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 40);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  uint64_t v17 = (char *)((v16 + v10) & ~v15);
  uint64_t v18 = (char *)((v16 + v11) & ~v15);
  int v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(v17, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (v11)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v18, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v17, v18, v13);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v24 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v14 + 64) + 1;
  }
  uint64_t v25 = &v17[v24];
  uint64_t v26 = &v18[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  return a1;
}

void *sub_24E9AD5B4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 32);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  uint64_t v17 = (char *)((v16 + v10) & ~v15);
  uint64_t v18 = (char *)((v16 + v11) & ~v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    int v19 = *(_DWORD *)(v14 + 84);
    uint64_t v20 = *(void *)(v14 + 64);
    if (v19) {
      size_t v21 = *(void *)(v14 + 64);
    }
    else {
      size_t v21 = v20 + 1;
    }
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v18, v13);
    size_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v22 = v14 + 56;
    v23(v17, 0, 1, v13);
    int v19 = *(_DWORD *)(v22 + 28);
    uint64_t v20 = *(void *)(v22 + 8);
  }
  if (v19) {
    uint64_t v24 = v20;
  }
  else {
    uint64_t v24 = v20 + 1;
  }
  uint64_t v25 = &v17[v24];
  uint64_t v26 = &v18[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  return a1;
}

void *sub_24E9AD744(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 24);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  uint64_t v17 = (char *)((v16 + v10) & ~v15);
  uint64_t v18 = (char *)((v16 + v11) & ~v15);
  int v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(v17, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (v11)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v18, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v17, v18, v13);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v24 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v14 + 64) + 1;
  }
  uint64_t v25 = &v17[v24];
  uint64_t v26 = &v18[v24];
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  return a1;
}

uint64_t sub_24E9AD958(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_24EA05CD8() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  unsigned int v13 = v9 - 1;
  if (!v9) {
    unsigned int v13 = 0;
  }
  if (v7 <= v13) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v6 + 84);
  }
  if (v14 <= 0x7FFFFFFF) {
    unsigned int v15 = 0x7FFFFFFF;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = 2;
  if (!v9) {
    uint64_t v16 = 3;
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v15) {
    goto LABEL_31;
  }
  uint64_t v17 = v16 + *(void *)(v8 + 64) + ((v11 + ((v10 + 8) & ~v10) + v12) & ~v12);
  char v18 = 8 * v17;
  if (v17 > 3) {
    goto LABEL_14;
  }
  unsigned int v20 = ((a2 - v15 + ~(-1 << v18)) >> v18) + 1;
  if (HIWORD(v20))
  {
    int v19 = *(_DWORD *)((char *)a1 + v17);
    if (v19) {
      goto LABEL_21;
    }
LABEL_31:
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v24 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v24) = -1;
      }
      return (v24 + 1);
    }
    uint64_t v26 = ((unint64_t)a1 + v10 + 8) & ~v10;
    if (v7 == v15)
    {
      uint64_t v27 = *(uint64_t (**)(uint64_t))(v6 + 48);
      return v27(v26);
    }
    if (v9 >= 2)
    {
      unsigned int v28 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v8 + 48))((v26 + v11 + v12) & ~v12, v9, *(void *)(a3 + 16), v6);
      if (v28 >= 2) {
        return v28 - 1;
      }
      else {
        return 0;
      }
    }
    return 0;
  }
  if (v20 > 0xFF)
  {
    int v19 = *(unsigned __int16 *)((char *)a1 + v17);
    if (*(unsigned __int16 *)((char *)a1 + v17)) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
  if (v20 < 2) {
    goto LABEL_31;
  }
LABEL_14:
  int v19 = *((unsigned __int8 *)a1 + v17);
  if (!*((unsigned char *)a1 + v17)) {
    goto LABEL_31;
  }
LABEL_21:
  int v21 = (v19 - 1) << v18;
  if (v17 > 3) {
    int v21 = 0;
  }
  if (v17)
  {
    if (v17 <= 3) {
      int v22 = v17;
    }
    else {
      int v22 = 4;
    }
    switch(v22)
    {
      case 2:
        int v23 = *a1;
        break;
      case 3:
        int v23 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v23 = *(_DWORD *)a1;
        break;
      default:
        int v23 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v23 = 0;
  }
  return v15 + (v23 | v21) + 1;
}

void sub_24E9ADC10(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v8 = 0;
  uint64_t v9 = *(void *)(sub_24EA05CD8() - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = *(void *)(v9 + 64);
  uint64_t v15 = *(unsigned __int8 *)(v11 + 80);
  unsigned int v16 = v12 - 1;
  if (!v12) {
    unsigned int v16 = 0;
  }
  if (v10 <= v16) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v9 + 84);
  }
  if (v17 <= 0x7FFFFFFF) {
    unsigned int v18 = 0x7FFFFFFF;
  }
  else {
    unsigned int v18 = v17;
  }
  uint64_t v19 = 2;
  if (!v12) {
    uint64_t v19 = 3;
  }
  size_t v20 = v19 + *(void *)(v11 + 64) + ((v14 + ((v13 + 8) & ~v13) + v15) & ~v15);
  if (a3 <= v18) {
    goto LABEL_19;
  }
  if (v20 <= 3)
  {
    unsigned int v21 = ((a3 - v18 + ~(-1 << (8 * v20))) >> (8 * v20)) + 1;
    if (HIWORD(v21))
    {
      int v8 = 4;
      if (v18 >= a2) {
        goto LABEL_27;
      }
      goto LABEL_20;
    }
    if (v21 >= 0x100) {
      int v8 = 2;
    }
    else {
      int v8 = v21 > 1;
    }
LABEL_19:
    if (v18 >= a2) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  int v8 = 1;
  if (v18 >= a2)
  {
LABEL_27:
    switch(v8)
    {
      case 1:
        a1[v20] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 2:
        *(_WORD *)&a1[v20] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_32;
      case 3:
        goto LABEL_54;
      case 4:
        *(_DWORD *)&a1[v20] = 0;
        goto LABEL_31;
      default:
LABEL_31:
        if (a2)
        {
LABEL_32:
          if ((v17 & 0x80000000) != 0)
          {
            uint64_t v26 = (unint64_t)&a1[v13 + 8] & ~v13;
            if (v10 == v18)
            {
              uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v9 + 56);
              v27(v26, a2);
            }
            else if (v12 >= 2)
            {
              uint64_t v28 = (v26 + v14 + v15) & ~v15;
              char v29 = *(void (**)(uint64_t, void, uint64_t))(v11 + 56);
              v29(v28, (a2 + 1), v12);
            }
          }
          else
          {
            if ((a2 & 0x80000000) != 0) {
              uint64_t v25 = a2 ^ 0x80000000;
            }
            else {
              uint64_t v25 = (a2 - 1);
            }
            *(void *)a1 = v25;
          }
        }
        break;
    }
    return;
  }
LABEL_20:
  unsigned int v22 = ~v18 + a2;
  if (v20 < 4)
  {
    int v23 = (v22 >> (8 * v20)) + 1;
    if (v20)
    {
      int v24 = v22 & ~(-1 << (8 * v20));
      bzero(a1, v20);
      if (v20 == 3)
      {
        *(_WORD *)a1 = v24;
        a1[2] = BYTE2(v24);
      }
      else if (v20 == 2)
      {
        *(_WORD *)a1 = v24;
      }
      else
      {
        *a1 = v24;
      }
    }
  }
  else
  {
    bzero(a1, v20);
    *(_DWORD *)a1 = v22;
    int v23 = 1;
  }
  switch(v8)
  {
    case 1:
      a1[v20] = v23;
      break;
    case 2:
      *(_WORD *)&a1[v20] = v23;
      break;
    case 3:
LABEL_54:
      __break(1u);
      JUMPOUT(0x24E9ADF60);
    case 4:
      *(_DWORD *)&a1[v20] = v23;
      break;
    default:
      return;
  }
}

uint64_t sub_24E9ADF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t getEnumTagSinglePayload for SignOutAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24E9AE020(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24E9AE0ECLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_24E9AE114()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9AE130()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9AE14C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9AE168()
{
  return 5;
}

uint64_t static Color.keyTint.getter()
{
  return sub_24E9AE1A8(0.650980392, 1.0, 0.0);
}

uint64_t static Color.meditationTeal.getter()
{
  return sub_24E9AE1A8(0.419607843, 0.984313725, 0.97254902);
}

uint64_t sub_24E9AE1A8(double a1, double a2, double a3)
{
  uint64_t v6 = sub_24EA06418();
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v9 + 104))(v8, *MEMORY[0x263F1B388]);
  return MEMORY[0x253345A80](v8, a1, a2, a3, 1.0);
}

uint64_t static ShapeStyle<>.keyTint.getter()
{
  return sub_24E9AE1A8(0.650980392, 1.0, 0.0);
}

uint64_t static ShapeStyle<>.meditationTeal.getter()
{
  return sub_24E9AE1A8(0.419607843, 0.984313725, 0.97254902);
}

BOOL static TabBarItemStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E9AE2E0(char a1)
{
  return *(void *)&aAutomatiimageo[8 * a1];
}

uint64_t sub_24E9AE300(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE978();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9AE33C(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE978();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9AE380()
{
  return sub_24E9AE2E0(*v0);
}

uint64_t sub_24E9AE388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9AF4E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9AE3B0(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE87C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9AE3EC(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE87C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9AE428(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE924();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9AE464(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE924();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9AE4A0(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE8D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9AE4DC(uint64_t a1)
{
  unint64_t v2 = sub_24E9AE8D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabBarItemStyle.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E020);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  int v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E028);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E030);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E038);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9AE87C();
  sub_24EA070A8();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_24E9AE924();
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_24E9AE8D0();
      unsigned int v17 = v23;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_24E9AE978();
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_24E9AE87C()
{
  unint64_t result = qword_26991E040;
  if (!qword_26991E040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E040);
  }
  return result;
}

unint64_t sub_24E9AE8D0()
{
  unint64_t result = qword_26991E048;
  if (!qword_26991E048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E048);
  }
  return result;
}

unint64_t sub_24E9AE924()
{
  unint64_t result = qword_26991E050;
  if (!qword_26991E050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E050);
  }
  return result;
}

unint64_t sub_24E9AE978()
{
  unint64_t result = qword_26991E058;
  if (!qword_26991E058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E058);
  }
  return result;
}

uint64_t TabBarItemStyle.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E060);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E068);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E070);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E078);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9AE87C();
  uint64_t v12 = (uint64_t)v39;
  sub_24EA07098();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_24EA06F78();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_24EA06DC8();
    swift_allocError();
    int v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *int v23 = &type metadata for TabBarItemStyle;
    sub_24EA06F18();
    sub_24EA06DB8();
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
      sub_24E9AE924();
      uint64_t v18 = v30;
      sub_24EA06F08();
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
      sub_24E9AE8D0();
      uint64_t v25 = v30;
      sub_24EA06F08();
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
    sub_24E9AE978();
    uint64_t v24 = v30;
    sub_24EA06F08();
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

uint64_t sub_24E9AEF84@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TabBarItemStyle.init(from:)(a1, a2);
}

uint64_t sub_24E9AEF9C(void *a1)
{
  return TabBarItemStyle.encode(to:)(a1);
}

uint64_t TabBarItemStyle.hash(into:)()
{
  return sub_24EA07058();
}

uint64_t TabBarItemStyle.hashValue.getter()
{
  return sub_24EA07088();
}

unint64_t sub_24E9AF02C()
{
  unint64_t result = qword_26991E080;
  if (!qword_26991E080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E080);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabBarItemStyle()
{
  return &type metadata for TabBarItemStyle;
}

unsigned char *_s14FitnessAppRoot15TabBarItemStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9AF164);
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

ValueMetadata *type metadata accessor for TabBarItemStyle.CodingKeys()
{
  return &type metadata for TabBarItemStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for TabBarItemStyle.AutomaticCodingKeys()
{
  return &type metadata for TabBarItemStyle.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for TabBarItemStyle.ImageOnlyCodingKeys()
{
  return &type metadata for TabBarItemStyle.ImageOnlyCodingKeys;
}

ValueMetadata *type metadata accessor for TabBarItemStyle.TitleOnlyCodingKeys()
{
  return &type metadata for TabBarItemStyle.TitleOnlyCodingKeys;
}

unint64_t sub_24E9AF1D0()
{
  unint64_t result = qword_26991E088;
  if (!qword_26991E088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E088);
  }
  return result;
}

unint64_t sub_24E9AF228()
{
  unint64_t result = qword_26991E090;
  if (!qword_26991E090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E090);
  }
  return result;
}

unint64_t sub_24E9AF280()
{
  unint64_t result = qword_26991E098;
  if (!qword_26991E098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E098);
  }
  return result;
}

unint64_t sub_24E9AF2D8()
{
  unint64_t result = qword_26991E0A0;
  if (!qword_26991E0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0A0);
  }
  return result;
}

unint64_t sub_24E9AF330()
{
  unint64_t result = qword_26991E0A8;
  if (!qword_26991E0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0A8);
  }
  return result;
}

unint64_t sub_24E9AF388()
{
  unint64_t result = qword_26991E0B0;
  if (!qword_26991E0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0B0);
  }
  return result;
}

unint64_t sub_24E9AF3E0()
{
  unint64_t result = qword_26991E0B8;
  if (!qword_26991E0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0B8);
  }
  return result;
}

unint64_t sub_24E9AF438()
{
  unint64_t result = qword_26991E0C0;
  if (!qword_26991E0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0C0);
  }
  return result;
}

unint64_t sub_24E9AF490()
{
  unint64_t result = qword_26991E0C8;
  if (!qword_26991E0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0C8);
  }
  return result;
}

uint64_t sub_24E9AF4E4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6E4F6567616D69 && a2 == 0xE900000000000079 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6E4F656C746974 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t DynamicContentState.init(locale:networkConditions:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for DynamicContentState();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for DynamicContentState()
{
  uint64_t result = qword_26B1CD260;
  if (!qword_26B1CD260) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E9AF710(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x656C61636F6CLL;
  }
}

BOOL sub_24E9AF748(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24E9AF760()
{
  return sub_24E9AF710(*v0);
}

uint64_t sub_24E9AF768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9B0794(a1, a2);
  *a3 = result;
  return result;
}

void sub_24E9AF790(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24E9AF79C(uint64_t a1)
{
  unint64_t v2 = sub_24E9AF9CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9AF7D8(uint64_t a1)
{
  unint64_t v2 = sub_24E9AF9CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicContentState.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9AF9CC();
  sub_24EA070A8();
  v10[15] = 0;
  sub_24EA05CD8();
  sub_24E9AC7B8(&qword_26991DF10);
  sub_24EA06FE8();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for DynamicContentState() + 20));
    v10[13] = 1;
    sub_24E9AFA20();
    sub_24EA06FE8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24E9AF9CC()
{
  unint64_t result = qword_26991E0D8;
  if (!qword_26991E0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0D8);
  }
  return result;
}

unint64_t sub_24E9AFA20()
{
  unint64_t result = qword_26991E0E0;
  if (!qword_26991E0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0E0);
  }
  return result;
}

uint64_t DynamicContentState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v22 = sub_24EA05CD8();
  uint64_t v20 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E0E8);
  uint64_t v21 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DynamicContentState();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9AF9CC();
  sub_24EA07098();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v11 = v10;
  uint64_t v12 = v20;
  char v26 = 0;
  sub_24E9AC7B8(qword_26991DF18);
  uint64_t v13 = v22;
  sub_24EA06F68();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v18 = (uint64_t)v11;
  v14(v11, v5, v13);
  char v24 = 1;
  sub_24E9AFDB0();
  sub_24EA06F68();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v23);
  uint64_t v16 = v18;
  uint64_t v15 = v19;
  *(unsigned char *)(v18 + *(int *)(v8 + 20)) = v25;
  sub_24E9AFE04(v16, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24E9AFE68(v16);
}

unint64_t sub_24E9AFDB0()
{
  unint64_t result = qword_26991E0F0;
  if (!qword_26991E0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0F0);
  }
  return result;
}

uint64_t sub_24E9AFE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E9AFE68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicContentState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E9AFEC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicContentState.init(from:)(a1, a2);
}

uint64_t sub_24E9AFEDC(void *a1)
{
  return DynamicContentState.encode(to:)(a1);
}

BOOL static DynamicContentState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x2533452D0]() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for DynamicContentState();
  return *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20));
}

BOOL sub_24E9AFF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (MEMORY[0x2533452D0]() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

void *initializeBufferWithCopyOfBuffer for DynamicContentState(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24EA05CD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for DynamicContentState(uint64_t a1)
{
  uint64_t v2 = sub_24EA05CD8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9B02CC);
}

uint64_t sub_24E9B02CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 3) {
      return v10 - 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for DynamicContentState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9B039C);
}

uint64_t sub_24E9B039C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24EA05CD8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t sub_24E9B0458()
{
  uint64_t result = sub_24EA05CD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicContentState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9B0648);
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

unsigned char *sub_24E9B0670(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentState.CodingKeys()
{
  return &type metadata for DynamicContentState.CodingKeys;
}

unint64_t sub_24E9B0690()
{
  unint64_t result = qword_26991E0F8;
  if (!qword_26991E0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E0F8);
  }
  return result;
}

unint64_t sub_24E9B06E8()
{
  unint64_t result = qword_26991E100;
  if (!qword_26991E100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E100);
  }
  return result;
}

unint64_t sub_24E9B0740()
{
  unint64_t result = qword_26991E108;
  if (!qword_26991E108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E108);
  }
  return result;
}

uint64_t sub_24E9B0794(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EA15620)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_24E9B0874(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x5374754F6E676973;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x6570704177656976;
      break;
  }
  return result;
}

unint64_t sub_24E9B0934()
{
  return sub_24E9B0874(*v0);
}

uint64_t sub_24E9B093C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9B309C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24E9B0964(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24E9B0970(uint64_t a1)
{
  unint64_t v2 = sub_24E9B138C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B09AC(uint64_t a1)
{
  unint64_t v2 = sub_24E9B138C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9B09E8(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1594();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B0A24(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1594();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9B0A60(uint64_t a1)
{
  unint64_t v2 = sub_24E9B14EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B0A9C(uint64_t a1)
{
  unint64_t v2 = sub_24E9B14EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9B0AD8(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1540();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B0B14(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1540();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9B0B50(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1444();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B0B8C(uint64_t a1)
{
  unint64_t v2 = sub_24E9B1444();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9B0BC8(uint64_t a1)
{
  unint64_t v2 = sub_24E9B15E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9B0C04(uint64_t a1)
{
  unint64_t v2 = sub_24E9B15E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SignOutAction.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E110);
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  char v42 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E118);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v36 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E120);
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v37 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v34);
  uint64_t v35 = (uint64_t)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E128);
  uint64_t v32 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  unsigned int v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E130);
  uint64_t v31 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E138);
  uint64_t v46 = *(void *)(v17 - 8);
  uint64_t v47 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9B138C();
  sub_24EA070A8();
  sub_24E9B13E0(v45, (uint64_t)v16);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      long long v45 = *(_OWORD *)v16;
      uint64_t v24 = *((void *)v16 + 2);
      char v25 = v16[24];
      LOBYTE(v48) = 4;
      sub_24E9B1444();
      char v26 = v42;
      uint64_t v22 = v47;
      sub_24EA06F98();
      long long v48 = v45;
      uint64_t v49 = v24;
      char v50 = v25;
      sub_24E9B1498();
      uint64_t v27 = v44;
      sub_24EA06FE8();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v27);
      goto LABEL_4;
    case 2u:
      LOBYTE(v48) = 0;
      sub_24E9B15E8();
      uint64_t v29 = v47;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v11);
      goto LABEL_8;
    case 3u:
      LOBYTE(v48) = 1;
      sub_24E9B1594();
      uint64_t v29 = v47;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
      goto LABEL_8;
    case 4u:
      LOBYTE(v48) = 3;
      sub_24E9B14EC();
      uint64_t v30 = v36;
      uint64_t v29 = v47;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v30, v39);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v19, v29);
      break;
    default:
      uint64_t v20 = v35;
      sub_24E9B20B4((uint64_t)v16, v35, (uint64_t (*)(void))type metadata accessor for AccountState);
      LOBYTE(v48) = 2;
      sub_24E9B1540();
      uint64_t v21 = v37;
      uint64_t v22 = v47;
      sub_24EA06F98();
      sub_24E9B211C(&qword_26991E168);
      uint64_t v23 = v41;
      sub_24EA06FE8();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v23);
      sub_24E9B263C(v20, (uint64_t (*)(void))type metadata accessor for AccountState);
LABEL_4:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v19, v22);
      break;
  }
  return result;
}

uint64_t type metadata accessor for SignOutAction()
{
  uint64_t result = qword_26991E1C0;
  if (!qword_26991E1C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24E9B138C()
{
  unint64_t result = qword_26991E140;
  if (!qword_26991E140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E140);
  }
  return result;
}

uint64_t sub_24E9B13E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SignOutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E9B1444()
{
  unint64_t result = qword_26991E148;
  if (!qword_26991E148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E148);
  }
  return result;
}

unint64_t sub_24E9B1498()
{
  unint64_t result = qword_26991E150;
  if (!qword_26991E150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E150);
  }
  return result;
}

unint64_t sub_24E9B14EC()
{
  unint64_t result = qword_26991E158;
  if (!qword_26991E158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E158);
  }
  return result;
}

unint64_t sub_24E9B1540()
{
  unint64_t result = qword_26991E160;
  if (!qword_26991E160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E160);
  }
  return result;
}

unint64_t sub_24E9B1594()
{
  unint64_t result = qword_26991E170;
  if (!qword_26991E170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E170);
  }
  return result;
}

unint64_t sub_24E9B15E8()
{
  unint64_t result = qword_26991E178;
  if (!qword_26991E178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E178);
  }
  return result;
}

uint64_t SignOutAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E180);
  uint64_t v69 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v62 = (char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E188);
  uint64_t v64 = *(void *)(v4 - 8);
  uint64_t v65 = v4;
  MEMORY[0x270FA5388](v4);
  v61 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E190);
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  MEMORY[0x270FA5388](v6);
  v68 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E198);
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v56 = v8;
  MEMORY[0x270FA5388](v8);
  v67 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E1A0);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v60 = (char *)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E1A8);
  uint64_t v66 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SignOutAction();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v50 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v50 - v21;
  uint64_t v23 = a1[3];
  v70 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_24E9B138C();
  uint64_t v24 = (uint64_t)v74;
  sub_24EA07098();
  if (v24) {
    goto LABEL_10;
  }
  uint64_t v52 = v20;
  uint64_t v51 = v17;
  char v25 = v67;
  char v26 = v68;
  uint64_t v27 = v69;
  v74 = v22;
  uint64_t v28 = sub_24EA06F78();
  if (*(void *)(v28 + 16) != 1)
  {
    uint64_t v34 = sub_24EA06DC8();
    swift_allocError();
    uint64_t v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *uint64_t v36 = v14;
    sub_24EA06F18();
    sub_24EA06DB8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x263F8DCB0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v11);
LABEL_10:
    uint64_t v40 = (uint64_t)v70;
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
  v50[1] = v28;
  uint64_t v29 = v27;
  uint64_t v31 = v64;
  uint64_t v30 = v65;
  switch(*(unsigned char *)(v28 + 32))
  {
    case 1:
      LOBYTE(v71) = 1;
      sub_24E9B1594();
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v25, v56);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v11);
      uint64_t v33 = (uint64_t)v74;
      swift_storeEnumTagMultiPayload();
      goto LABEL_12;
    case 2:
      LOBYTE(v71) = 2;
      sub_24E9B1540();
      uint64_t v37 = v26;
      sub_24EA06F08();
      type metadata accessor for AccountState();
      sub_24E9B211C(&qword_26991E1B8);
      uint64_t v38 = (uint64_t)v52;
      uint64_t v39 = v58;
      sub_24EA06F68();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v11);
      uint64_t v40 = (uint64_t)v70;
      swift_storeEnumTagMultiPayload();
      uint64_t v33 = (uint64_t)v74;
      sub_24E9B20B4(v38, (uint64_t)v74, (uint64_t (*)(void))type metadata accessor for SignOutAction);
      goto LABEL_13;
    case 3:
      LOBYTE(v71) = 3;
      sub_24E9B14EC();
      uint64_t v41 = v61;
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v11);
      uint64_t v33 = (uint64_t)v74;
      swift_storeEnumTagMultiPayload();
      goto LABEL_12;
    case 4:
      LOBYTE(v71) = 4;
      sub_24E9B1444();
      char v42 = v62;
      sub_24EA06F08();
      sub_24E9B2060();
      uint64_t v44 = v59;
      sub_24EA06F68();
      long long v45 = v42;
      uint64_t v46 = v66;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v45, v44);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v13, v11);
      uint64_t v47 = v72;
      char v48 = v73;
      uint64_t v49 = (uint64_t)v51;
      *uint64_t v51 = v71;
      *(void *)(v49 + 16) = v47;
      *(unsigned char *)(v49 + 24) = v48;
      swift_storeEnumTagMultiPayload();
      uint64_t v33 = (uint64_t)v74;
      sub_24E9B20B4(v49, (uint64_t)v74, (uint64_t (*)(void))type metadata accessor for SignOutAction);
      goto LABEL_12;
    default:
      LOBYTE(v71) = 0;
      sub_24E9B15E8();
      uint64_t v32 = v60;
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v11);
      uint64_t v33 = (uint64_t)v74;
      swift_storeEnumTagMultiPayload();
LABEL_12:
      uint64_t v40 = (uint64_t)v70;
LABEL_13:
      sub_24E9B20B4(v33, v63, (uint64_t (*)(void))type metadata accessor for SignOutAction);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v40);
}

unint64_t sub_24E9B2060()
{
  unint64_t result = qword_26991E1B0;
  if (!qword_26991E1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1B0);
  }
  return result;
}

uint64_t sub_24E9B20B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9B211C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AccountState();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E9B2160@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutAction.init(from:)(a1, a2);
}

uint64_t sub_24E9B2178(void *a1)
{
  return SignOutAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SignOutAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = type metadata accessor for AccountState();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        uint64_t v10 = sub_24EA05C78();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for SignOutAction(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (!result)
  {
    type metadata accessor for AccountState();
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result == 1)
    {
      return swift_bridgeObjectRelease();
    }
    else if (!result)
    {
      uint64_t v3 = sub_24EA05C78();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      return v4(a1, v3);
    }
  }
  return result;
}

void *initializeWithCopy for SignOutAction(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for AccountState();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v8 = sub_24EA05C78();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for SignOutAction(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9B263C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SignOutAction);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for AccountState();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        uint64_t v8 = sub_24EA05C78();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24E9B263C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeWithTake for SignOutAction(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for AccountState();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24EA05C78();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for SignOutAction(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9B263C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for SignOutAction);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for AccountState();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        uint64_t v7 = sub_24EA05C78();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24E9B28C8()
{
  uint64_t result = type metadata accessor for AccountState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SignOutAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24E9B2A24);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignOutAction.CodingKeys()
{
  return &type metadata for SignOutAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.ViewAppearedCodingKeys()
{
  return &type metadata for SignOutAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.FetchAccountStateCodingKeys()
{
  return &type metadata for SignOutAction.FetchAccountStateCodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.UpdateAccountStateCodingKeys()
{
  return &type metadata for SignOutAction.UpdateAccountStateCodingKeys;
}

ValueMetadata *type metadata accessor for SignOutAction.SignOutSelectedCodingKeys()
{
  return &type metadata for SignOutAction.SignOutSelectedCodingKeys;
}

unsigned char *_s14FitnessAppRoot13SignOutActionO28UpdateAccountStateCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9B2B3CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SignOutAction.UpdateSignOutAnimationCodingKeys()
{
  return &type metadata for SignOutAction.UpdateSignOutAnimationCodingKeys;
}

unint64_t sub_24E9B2B78()
{
  unint64_t result = qword_26991E1D0;
  if (!qword_26991E1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1D0);
  }
  return result;
}

unint64_t sub_24E9B2BD0()
{
  unint64_t result = qword_26991E1D8;
  if (!qword_26991E1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1D8);
  }
  return result;
}

unint64_t sub_24E9B2C28()
{
  unint64_t result = qword_26991E1E0;
  if (!qword_26991E1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1E0);
  }
  return result;
}

unint64_t sub_24E9B2C80()
{
  unint64_t result = qword_26991E1E8;
  if (!qword_26991E1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1E8);
  }
  return result;
}

unint64_t sub_24E9B2CD8()
{
  unint64_t result = qword_26991E1F0;
  if (!qword_26991E1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1F0);
  }
  return result;
}

unint64_t sub_24E9B2D30()
{
  unint64_t result = qword_26991E1F8;
  if (!qword_26991E1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E1F8);
  }
  return result;
}

unint64_t sub_24E9B2D88()
{
  unint64_t result = qword_26991E200;
  if (!qword_26991E200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E200);
  }
  return result;
}

unint64_t sub_24E9B2DE0()
{
  unint64_t result = qword_26991E208;
  if (!qword_26991E208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E208);
  }
  return result;
}

unint64_t sub_24E9B2E38()
{
  unint64_t result = qword_26991E210;
  if (!qword_26991E210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E210);
  }
  return result;
}

unint64_t sub_24E9B2E90()
{
  unint64_t result = qword_26991E218;
  if (!qword_26991E218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E218);
  }
  return result;
}

unint64_t sub_24E9B2EE8()
{
  unint64_t result = qword_26991E220;
  if (!qword_26991E220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E220);
  }
  return result;
}

unint64_t sub_24E9B2F40()
{
  unint64_t result = qword_26991E228;
  if (!qword_26991E228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E228);
  }
  return result;
}

unint64_t sub_24E9B2F98()
{
  unint64_t result = qword_26991E230;
  if (!qword_26991E230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E230);
  }
  return result;
}

unint64_t sub_24E9B2FF0()
{
  unint64_t result = qword_26991E238;
  if (!qword_26991E238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E238);
  }
  return result;
}

unint64_t sub_24E9B3048()
{
  unint64_t result = qword_26991E240[0];
  if (!qword_26991E240[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26991E240);
  }
  return result;
}

uint64_t sub_24E9B309C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EA15640 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EA15660 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x5374754F6E676973 && a2 == 0xEF64657463656C65 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024EA15680)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t SidebarModalitiesEnvironment.init(resolveSidebarModalities:navigateToItem:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_24E9B32C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t destroy for DynamicContentEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DynamicContentEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for DynamicContentEnvironment(void *a1, void *a2)
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

_OWORD *assignWithTake for DynamicContentEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicContentEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DynamicContentEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SidebarModalitiesEnvironment()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SidebarTabView.init(store:viewBuilder:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

id SidebarTabView.makeUIViewController(context:)()
{
  return sub_24E9B365C();
}

id sub_24E9B34B8()
{
  return sub_24E9B365C();
}

uint64_t sub_24E9B34CC()
{
  return sub_24EA061D8();
}

uint64_t sub_24E9B3508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_24E9B3584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

uint64_t sub_24E9B3600()
{
  return sub_24EA06378();
}

void sub_24E9B361C()
{
}

id sub_24E9B365C()
{
  unint64_t v1 = *(void (**)(void))v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  type metadata accessor for SidebarTabController();
  swift_retain();
  swift_retain();
  return SidebarTabController.__allocating_init(store:viewBuilder:)(v1, v2, v4, v3);
}

uint64_t sub_24E9B36C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9B36E4()
{
  return MEMORY[0x263F1BB58];
}

uint64_t type metadata accessor for SidebarTabView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TabBarViewController.descriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TabBarViewController.selectedIndex.getter()
{
  uint64_t v1 = v0 + qword_26991E358;
  swift_beginAccess();
  return *(void *)v1;
}

char *TabBarViewController.__allocating_init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return TabBarViewController.init(store:viewBuilder:)(a1, a2, a3, a4);
}

char *TabBarViewController.init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = *MEMORY[0x263F8EED0] & *v4;
  uint64_t v9 = qword_26991E360;
  id v10 = objc_allocWithZone((Class)type metadata accessor for TabBarController());
  uint64_t v11 = v4;
  *(void *)((char *)v4 + v9) = objc_msgSend(v10, sel_init);
  uint64_t v12 = qword_26991E350;
  uint64_t v13 = *(void *)(v8 + 80);
  uint64_t v14 = *(void *)(v8 + 88);
  type metadata accessor for TabBarItemDescriptor();
  *(void *)((char *)v11 + v12) = sub_24EA06A18();
  uint64_t v15 = (char *)v11 + qword_26991E358;
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  *((unsigned char *)v11 + qword_26991E368) = 0;
  type metadata accessor for TabBarFeature();
  swift_getWitnessTable();
  sub_24EA06748();
  a1();
  *(void *)((char *)v11 + qword_26991E370) = sub_24EA06728();
  uint64_t v16 = (void *)((char *)v11 + qword_26991E378);
  *uint64_t v16 = a3;
  v16[1] = a4;
  swift_retain();

  v28.receiver = v11;
  v28.super_class = ObjectType;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v28, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v18 = *(void **)&v17[qword_26991E360];
  uint64_t v19 = v17;
  objc_msgSend(v18, sel_setDelegate_, v19);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = v13;
  v21[3] = v14;
  v21[4] = v20;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v13;
  v23[3] = v14;
  v23[4] = v22;
  sub_24EA06A58();
  swift_retain();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v25 = (void *)swift_allocObject();
  v25[2] = v13;
  v25[3] = v14;
  v25[4] = v24;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return v19;
}

uint64_t sub_24E9B3C90()
{
  return sub_24E9B4608();
}

uint64_t sub_24E9B3C9C()
{
  return sub_24E9B468C();
}

uint64_t sub_24E9B3CA8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

uint64_t sub_24E9B3CE8(uint64_t a1)
{
  swift_beginAccess();
  type metadata accessor for TabBarItemDescriptor();
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  if (sub_24EA06BF8()) {
    objc_msgSend(*(id *)(v1 + qword_26991E360), sel_setSelectedIndex_, a1);
  }
  uint64_t v3 = v1 + qword_26991E358;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 8) = 0;
  return result;
}

uint64_t sub_24E9B3E40()
{
  return sub_24EA068D8() & 1;
}

uint64_t sub_24E9B3EE0()
{
  return sub_24EA068B8();
}

void sub_24E9B3F6C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a3 + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x253346E30](v8);
  if (v9)
  {
    id v10 = (void *)v9;
    a6(v7);
  }
}

id sub_24E9B3FDC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v4 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v40 = *(void *)(v4 + 0x50);
  uint64_t v39 = *(void *)(v4 + 88);
  type metadata accessor for TabBarItemDescriptor();
  uint64_t v5 = sub_24EA06EC8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v52 = a1;
  uint64_t v12 = (void *)((char *)v2 + qword_26991E350);
  char v42 = (void *)((char *)v2 + qword_26991E350);
  swift_beginAccess();
  uint64_t v54 = *v12;
  uint64_t v13 = sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA068C8();
  swift_getWitnessTable();
  sub_24EA06ED8();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t v15 = sub_24EA06EA8();
  v14(v11, v5);
  uint64_t v16 = v40;
  uint64_t v50 = v40;
  uint64_t v17 = v39;
  uint64_t v51 = v39;
  uint64_t v52 = v15;
  sub_24EA06EB8();
  sub_24EA06A58();
  swift_getWitnessTable();
  uint64_t v18 = sub_24EA06998();
  swift_bridgeObjectRelease();
  uint64_t v52 = v18;
  swift_getWitnessTable();
  uint64_t v19 = sub_24EA06B48();
  uint64_t v52 = *v42;
  uint64_t v47 = v16;
  uint64_t v48 = v17;
  uint64_t v49 = v19;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v20 = sub_24EA06DE8();
  swift_bridgeObjectRelease();
  uint64_t v54 = v20;
  uint64_t v21 = sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
  swift_getTupleTypeMetadata2();
  sub_24EA06A18();
  uint64_t v53 = sub_24EA06858();
  uint64_t v46 = v2;
  sub_24EA06868();
  sub_24EA069A8();
  swift_bridgeObjectRelease();
  uint64_t v22 = v52;
  uint64_t v23 = v41;
  uint64_t v52 = v41;
  uint64_t v44 = v22;
  long long v45 = v2;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v26 = sub_24E9CAE88((void (*)(char *, char *))sub_24E9B7470, (uint64_t)v43, v13, v21, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v25);
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void **)((char *)v2 + qword_26991E360);
  id v28 = objc_msgSend(v27, sel_selectedViewController);
  uint64_t v29 = v28;
  if (v28)
  {
    id v30 = objc_msgSend(v28, sel__uip_tabElement);

    if (v30)
    {
      id v31 = objc_msgSend(v30, sel_identifier);

      uint64_t v29 = (void *)sub_24EA06938();
      id v30 = v32;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    id v30 = 0;
  }
  *char v42 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)sub_24EA069C8();
  objc_msgSend(v27, sel_setViewControllers_, v33);

  if (v30)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_24E9B6E18(v26, (uint64_t)v29, (uint64_t)v30);
    char v36 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if ((v36 & 1) == 0) {
      return objc_msgSend(v27, sel_setSelectedIndex_, v34, v39, v40);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v37 = (char *)v2 + qword_26991E358;
  id result = (id)swift_beginAccess();
  if (v37[8]) {
    return result;
  }
  uint64_t v34 = *(void *)v37;
  return objc_msgSend(v27, sel_setSelectedIndex_, v34, v39, v40);
}

uint64_t sub_24E9B45FC()
{
  return sub_24E9B4608();
}

uint64_t sub_24E9B4608()
{
  return sub_24EA068D8() & 1;
}

uint64_t sub_24E9B4680()
{
  return sub_24E9B468C();
}

uint64_t sub_24E9B468C()
{
  return sub_24EA068B8();
}

uint64_t sub_24E9B46EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

void sub_24E9B472C(uint64_t a1, char *a2, uint64_t a3)
{
  char v3 = *a2;
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x253346E30](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_24E9B4788(v3);
  }
}

uint64_t sub_24E9B4788(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v5 = sub_24EA067D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24EA067F8();
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v34 = v11;
    id v14 = objc_msgSend(*(id *)((char *)v2 + qword_26991E360), sel_selectedViewController);
    if (v14)
    {
      uint64_t v15 = v14;
      self;
      uint64_t v16 = (void *)swift_dynamicCastObjCClass();
      if (v16)
      {
        uint64_t v17 = v16;
        id v32 = v15;
        uint64_t v33 = v6;
        id v18 = objc_msgSend(v16, sel_viewControllers);
        sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
        unint64_t v19 = sub_24EA069D8();

        if (v19 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v20 = sub_24EA06E58();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (v20 == 1)
        {
          sub_24E9DAFA8(1);
          sub_24E9B72B4(0, (unint64_t *)&qword_26991E470);
          uint64_t v21 = (void *)sub_24EA06C48();
          uint64_t v22 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v23 = (void *)swift_allocObject();
          v23[2] = *(void *)(v4 + 80);
          v23[3] = *(void *)(v4 + 88);
          v23[4] = v22;
          uint64_t v39 = sub_24E9B74C4;
          uint64_t v40 = v23;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v36 = 1107296256;
          uint64_t v37 = sub_24E9FA34C;
          uint64_t v38 = &block_descriptor_52;
          uint64_t v24 = _Block_copy(&aBlock);
          swift_release();
          sub_24EA067E8();
          uint64_t aBlock = MEMORY[0x263F8EE78];
          sub_24E9B7308((unint64_t *)&qword_26991E478, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
          sub_24E9B7350();
          sub_24EA06CF8();
          MEMORY[0x253346260](0, v13, v8, v24);
          _Block_release(v24);
        }
        else
        {

          sub_24E9B72B4(0, (unint64_t *)&qword_26991E470);
          uint64_t v21 = (void *)sub_24EA06C48();
          uint64_t v28 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v29 = (void *)swift_allocObject();
          v29[2] = *(void *)(v4 + 80);
          v29[3] = *(void *)(v4 + 88);
          v29[4] = v28;
          uint64_t v39 = sub_24E9B73F4;
          uint64_t v40 = v29;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v36 = 1107296256;
          uint64_t v37 = sub_24E9FA34C;
          uint64_t v38 = &block_descriptor_45;
          id v30 = _Block_copy(&aBlock);
          swift_release();
          sub_24EA067E8();
          uint64_t aBlock = MEMORY[0x263F8EE78];
          sub_24E9B7308((unint64_t *)&qword_26991E478, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
          sub_24E9B7350();
          sub_24EA06CF8();
          MEMORY[0x253346260](0, v13, v8, v30);

          _Block_release(v30);
        }
        uint64_t v6 = v33;
        goto LABEL_12;
      }
    }
    sub_24E9B72B4(0, (unint64_t *)&qword_26991E470);
    uint64_t v21 = (void *)sub_24EA06C48();
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v26 = (void *)swift_allocObject();
    v26[2] = *(void *)(v4 + 80);
    v26[3] = *(void *)(v4 + 88);
    v26[4] = v25;
    uint64_t v39 = sub_24E9B74C4;
    uint64_t v40 = v26;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    uint64_t v37 = sub_24E9FA34C;
    uint64_t v38 = &block_descriptor;
    uint64_t v27 = _Block_copy(&aBlock);
    swift_release();
    sub_24EA067E8();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_24E9B7308((unint64_t *)&qword_26991E478, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
    sub_24E9B7350();
    sub_24EA06CF8();
    MEMORY[0x253346260](0, v13, v8, v27);
    _Block_release(v27);
LABEL_12:

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v9);
  }
  return result;
}

void sub_24E9B4ECC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_24E9B6FAC();
}

Swift::Void __swiftcall TabBarViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  v42.receiver = v0;
  v42.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v42, sel_viewDidLoad);
  uint64_t v2 = *(void **)&v0[qword_26991E360];
  objc_msgSend(v0, sel_addChildViewController_, v2);
  id v3 = objc_msgSend(v2, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(v2, sel_view);
  if (!v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  objc_msgSend(v6, sel_addSubview_, v7);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD820);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24EA09540;
  id v10 = objc_msgSend(v2, sel_view);
  if (!v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_topAnchor);

  id v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v14 = v13;
  id v15 = objc_msgSend(v13, sel_topAnchor);

  id v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(void *)(v9 + 32) = v16;
  id v17 = objc_msgSend(v2, sel_view);
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v18 = v17;
  id v19 = objc_msgSend(v17, sel_bottomAnchor);

  id v20 = objc_msgSend(v1, sel_view);
  if (!v20)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v20, sel_bottomAnchor);

  id v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v22);
  *(void *)(v9 + 40) = v23;
  id v24 = objc_msgSend(v2, sel_view);
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v25 = v24;
  id v26 = objc_msgSend(v24, sel_leadingAnchor);

  id v27 = objc_msgSend(v1, sel_view);
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v28 = v27;
  id v29 = objc_msgSend(v27, sel_leadingAnchor);

  id v30 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v29);
  *(void *)(v9 + 48) = v30;
  id v31 = objc_msgSend(v2, sel_view);
  if (!v31)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v32 = v31;
  id v33 = objc_msgSend(v31, sel_trailingAnchor);

  id v34 = objc_msgSend(v1, sel_view);
  if (v34)
  {
    char v35 = v34;
    uint64_t v36 = self;
    id v37 = objc_msgSend(v35, sel_trailingAnchor);

    id v38 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v37);
    *(void *)(v9 + 56) = v38;
    uint64_t v41 = v9;
    sub_24EA069E8();
    sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD770);
    uint64_t v39 = (void *)sub_24EA069C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_activateConstraints_, v39);

    v40.receiver = v2;
    v40.super_class = (Class)type metadata accessor for TabBarController();
    objc_msgSendSuper2(&v40, sel_didMoveToParentViewController_, v1);
    sub_24E9DB2E0();
    sub_24EA066F8();
    return;
  }
LABEL_23:
  __break(1u);
}

void sub_24E9B534C(void *a1)
{
  id v1 = a1;
  TabBarViewController.viewDidLoad()();
}

Swift::Bool __swiftcall TabBarViewController.tabBarController(_:shouldSelect:)(UITabBarController *_, UIViewController *shouldSelect)
{
  return sub_24E9B70B8(shouldSelect);
}

uint64_t sub_24E9B539C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  char v9 = sub_24E9B70B8(v7);

  return v9 & 1;
}

Swift::Void __swiftcall TabBarViewController.tabBarController(_:didSelect:)(UITabBarController *_, UIViewController *didSelect)
{
  uint64_t v5 = type metadata accessor for TabBarAction();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (uint64_t *)((char *)&v15 - v7);
  if (*(unsigned char *)(v2 + qword_26991E368))
  {
    *(unsigned char *)(v2 + qword_26991E368) = 0;
  }
  else if (*(UITabBarController **)(v2 + qword_26991E360) == _)
  {
    char v9 = [(UITabBarController *)_ viewControllers];
    if (v9)
    {
      id v10 = v9;
      sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
      unint64_t v11 = sub_24EA069D8();

      sub_24E9B55D8((uint64_t)didSelect, v11);
      uint64_t v13 = v12;
      LOBYTE(v10) = v14;
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        sub_24EA06718();
        void *v8 = v13;
        swift_storeEnumTagMultiPayload();
        sub_24EA067A8();
        swift_release();
        (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
      }
    }
  }
}

void sub_24E9B55D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x2533463B0](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
      char v6 = sub_24EA06C88();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x2533463B0](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          char v9 = v8;
          char v10 = sub_24EA06C88();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_24EA06E58();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_24E9B5774(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(sub_24EA05DA8() - 8);
  uint64_t v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = *(void *)(v4 + 72);
  sub_24E9B7308((unint64_t *)&unk_26B1CCB30, MEMORY[0x263F3E140]);
  uint64_t v7 = 0;
  while ((sub_24EA068D8() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7) {
      return 0;
    }
  }
  return v7;
}

void sub_24E9B5898(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = a3;
  uint64_t v7 = a4;
  id v8 = a1;
  TabBarViewController.tabBarController(_:didSelect:)(v6, v7);
}

uint64_t sub_24E9B5914(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarAction();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - v4;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253346E30](a1 + 16);
  if (result)
  {
    uint64_t v7 = (void *)result;
    swift_retain();

    sub_24EA06718();
    swift_release();
    swift_storeEnumTagMultiPayload();
    sub_24EA067A8();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_24E9B5A4C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - v6;
  uint64_t v8 = sub_24EA06EB8();
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)v17 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v17 - v9, a1, v8);
  LODWORD(v8) = swift_getEnumCaseMultiPayload();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B1CD740);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v13 = &v10[*(int *)(TupleTypeMetadata3 + 48)];
  if (v8 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  else
  {
    int v15 = v10[*(int *)(TupleTypeMetadata3 + 64) + 8];
    id v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v16(v7, v13, v4);
    if (v15 == 1)
    {
      v16(a2, v7, v4);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    }
  }
}

BOOL sub_24E9B5CCC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarItemDescriptor();
  sub_24EA07008();
  uint64_t v3 = *(void *)(v2 - 8);
  swift_allocObject();
  uint64_t v4 = sub_24EA069F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_24E9CAE5C(v4);
  swift_getWitnessTable();
  sub_24EA06B38();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  LOBYTE(v2) = sub_24EA06B78();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

void sub_24E9B5EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  MEMORY[0x270FA5388](v4);
  swift_beginAccess();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA06BD8();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    sub_24EA06A88();
    swift_endAccess();
    id v5 = objc_msgSend(*(id *)(a3 + qword_26991E360), sel_viewControllers);
    if (!v5)
    {
LABEL_8:
      sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
      swift_getWitnessTable();
      sub_24EA06868();
      sub_24EA06888();
      return;
    }
    uint64_t v6 = v5;
    sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
    uint64_t v7 = sub_24EA069D8();

    if ((v7 & 0xC000000000000001) == 0)
    {
      if ((v9 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v9 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v8 = *(id *)(v7 + 8 * v9 + 32);
LABEL_7:
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      __break(1u);
      return;
    }
    MEMORY[0x2533463B0](v9, v7);
    goto LABEL_7;
  }
}

void sub_24E9B6154(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  v80 = a4;
  id v83 = a2;
  uint64_t v6 = *(void *)((*MEMORY[0x263F8EED0] & *a3) + 0x50);
  uint64_t v79 = *(void *)((*MEMORY[0x263F8EED0] & *a3) + 0x58);
  uint64_t v7 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v78 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v74 = (char *)&v68 - v8;
  uint64_t v9 = sub_24EA05CD8();
  uint64_t v75 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = *(const char **)(v6 - 8);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v68 - v13;
  uint64_t v15 = sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v17 = a1;
  MEMORY[0x253345E80](&v81, a1, v83, v7, v15, WitnessTable);
  id v18 = v81;
  if (v81)
  {
    id v19 = v80;
LABEL_25:
    *id v19 = v18;
    return;
  }
  v70 = v14;
  long long v71 = v12;
  id v20 = v76;
  uint64_t v72 = v9;
  uint64_t v73 = v6;
  uint64_t v21 = *(uint64_t (**)(uint64_t, void, void, void))((char *)a3 + qword_26991E378);
  uint64_t v69 = v7;
  uint64_t v22 = v17 + *(int *)(v7 + 36);
  id v83 = (id)v21(v22, 0, 0, 0);
  id v23 = objc_msgSend(v83, sel_tabBarItem);
  if (!v23)
  {
    __break(1u);
    goto LABEL_27;
  }
  id v24 = v23;
  uint64_t v68 = v17;
  uint64_t v25 = v20;
  id v26 = (void (*)(char *, uint64_t, uint64_t))*((void *)v20 + 2);
  id v27 = v70;
  uint64_t v77 = v22;
  uint64_t v28 = v73;
  v26(v70, v22, v73);
  uint64_t v29 = sub_24EA06718();
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = v79;
  *(&v68 - 2) = v28;
  *(&v68 - 1) = v30;
  swift_getKeyPath();
  uint64_t v31 = v28;
  uint64_t v32 = v30;
  id v33 = v71;
  sub_24EA06798();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 88))(v33, v31, v32);
  uint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v33, v72);
  (*((void (**)(char *, uint64_t))v25 + 1))(v27, v31);
  if (v35)
  {
    uint64_t v36 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = 0;
  }
  objc_msgSend(v24, sel_setTitle_, v36);

  (*(void (**)(uint64_t, uint64_t))(v32 + 80))(v31, v32);
  id v37 = v83;
  if (!v38)
  {
LABEL_10:
    id v43 = objc_msgSend(v37, sel_tabBarItem);
    if (v43)
    {
      uint64_t v44 = v43;
      v81 = 0;
      unint64_t v82 = 0xE000000000000000;
      sub_24EA06D78();
      v76 = "init(nibName:bundle:)";
      sub_24EA06978();
      sub_24EA07018();
      long long v45 = (void *)sub_24EA06908();
      swift_bridgeObjectRelease();
      objc_msgSend(v44, sel_setAccessibilityIdentifier_, v45);

      uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v32 + 56);
      v46(v31, v32);
      id v47 = objc_msgSend(v37, sel_tabBarItem);
      if (v47)
      {
        uint64_t v48 = v47;
        id v49 = objc_msgSend(v47, sel_title);

        if (v49)
        {
          sub_24EA06938();
          uint64_t v51 = v50;
        }
        else
        {
          uint64_t v51 = 0;
        }
        uint64_t v52 = v74;
        uint64_t v53 = v69;
        (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v74, v68, v69);
        if (!v51) {
          v46(v31, v79);
        }
        (*(void (**)(char *, uint64_t))(v78 + 8))(v52, v53);
        id v54 = v83;
        id v55 = objc_msgSend(v83, sel_tabBarItem);
        if (v55)
        {
          uint64_t v56 = v55;
          id v57 = objc_msgSend(v55, sel_image);

          id v58 = objc_allocWithZone(MEMORY[0x263F83120]);
          uint64_t v59 = (void *)sub_24EA06908();
          swift_bridgeObjectRelease();
          uint64_t v60 = (void *)sub_24EA06908();
          swift_bridgeObjectRelease();
          id v61 = objc_msgSend(v58, sel_initWithIdentifier_title_image_, v59, v60, v57);

          objc_msgSend(v54, sel__uip_setTabElement_, v61);
          id v62 = objc_msgSend(v54, sel__uip_tabElement);
          uint64_t v63 = v73;
          if (v62)
          {
            uint64_t v64 = v62;
            v81 = 0;
            unint64_t v82 = 0xE000000000000000;
            sub_24EA06D78();
            sub_24EA06978();
            sub_24EA07018();
            uint64_t v65 = (void *)sub_24EA06908();
            swift_bridgeObjectRelease();
            objc_msgSend(v64, sel_setAccessibilityIdentifier_, v65);
          }
          if ((*(uint64_t (**)(uint64_t))(v79 + 48))(v63))
          {
            id v18 = v83;
            id v66 = objc_msgSend(v83, sel__uip_tabElement);
            if (v66)
            {
              v67 = v66;
              objc_msgSend(v66, sel__setTabBarPlacement_, 1);
            }
            id v19 = v80;
          }
          else
          {
            id v19 = v80;
            id v18 = v83;
          }
          goto LABEL_25;
        }
        goto LABEL_29;
      }
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v39 = objc_msgSend(v83, sel_tabBarItem);
  if (v39)
  {
    objc_super v40 = v39;
    uint64_t v41 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(self, sel_systemImageNamed_, v41);

    objc_msgSend(v40, sel_setImage_, v42);
    goto LABEL_10;
  }
LABEL_30:
  __break(1u);
}

id TabBarViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TabBarViewController.init(nibName:bundle:)()
{
}

void sub_24E9B6A28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  sub_24E9B71B8();
}

id TabBarViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24E9B6AD4(uint64_t a1)
{
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E9B6B44()
{
  type metadata accessor for TabBarFeature();
  return swift_getWitnessTable();
}

uint64_t sub_24E9B6B8C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

uint64_t sub_24E9B6BCC()
{
  return 24;
}

uint64_t sub_24E9B6BD8()
{
  return swift_release();
}

uint64_t sub_24E9B6BE0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_24E9B6BF8()
{
  return sub_24E9B4608() & 1;
}

uint64_t sub_24E9B6C1C()
{
  return sub_24E9B468C();
}

__n128 sub_24E9B6C3C(__n128 *a1, uint64_t a2)
{
  *(void *)a2 = a1[1].n128_u64[0];
  __n128 result = *a1;
  *(__n128 *)(a2 + 8) = *a1;
  return result;
}

uint64_t sub_24E9B6C50()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24E9B6C88(uint64_t a1, uint64_t *a2)
{
  sub_24E9B3F6C(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9B3CE8);
}

uint64_t sub_24E9B6CBC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

uint64_t sub_24E9B6CFC()
{
  return 24;
}

uint64_t sub_24E9B6D10()
{
  swift_release();
  return swift_deallocObject();
}

void sub_24E9B6D48(uint64_t a1, uint64_t *a2)
{
  sub_24E9B3F6C(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9B3FDC);
}

uint64_t sub_24E9B6D7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

uint64_t sub_24E9B6DBC()
{
  return 24;
}

uint64_t sub_24E9B6DC8()
{
  return sub_24E9B4608() & 1;
}

uint64_t sub_24E9B6DEC()
{
  return sub_24E9B468C();
}

void sub_24E9B6E0C(uint64_t a1, char *a2)
{
  sub_24E9B472C(a1, a2, *(void *)(v2 + 32));
}

uint64_t sub_24E9B6E18(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24EA06E58();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_3:
      uint64_t v7 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v8 = (id)MEMORY[0x2533463B0](v7, a1);
        }
        else {
          id v8 = *(id *)(a1 + 8 * v7 + 32);
        }
        uint64_t v9 = v8;
        id v10 = objc_msgSend(v8, sel__uip_tabElement);
        if (v10)
        {
          uint64_t v11 = v10;
          id v12 = objc_msgSend(v10, sel_identifier);

          uint64_t v13 = sub_24EA06938();
          uint64_t v15 = v14;

          if (v13 == a2 && v15 == a3)
          {

            swift_bridgeObjectRelease();
            return v7;
          }
          char v17 = sub_24EA07028();

          swift_bridgeObjectRelease();
          if (v17) {
            return v7;
          }
          uint64_t v18 = v7 + 1;
          if (__OFADD__(v7, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        else
        {

          uint64_t v18 = v7 + 1;
          if (__OFADD__(v7, 1)) {
            goto LABEL_21;
          }
        }
        ++v7;
      }
      while (v18 != v6);
    }
  }
  return 0;
}

void sub_24E9B6FAC()
{
  uint64_t v1 = qword_26991E360;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TabBarController()), sel_init);
  uint64_t v2 = qword_26991E350;
  type metadata accessor for TabBarItemDescriptor();
  *(void *)&v0[v2] = sub_24EA06A18();
  char v3 = &v0[qword_26991E358];
  *(void *)char v3 = 0;
  v3[8] = 1;
  v0[qword_26991E368] = 0;

  sub_24EA06E48();
  __break(1u);
}

uint64_t sub_24E9B70B8(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = a1;
    id v6 = objc_msgSend(v4, sel_viewControllers);
    sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
    unint64_t v7 = sub_24EA069D8();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_24EA06E58();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
    }
    *(unsigned char *)(v1 + qword_26991E368) = v8 > 1;
  }
  return 1;
}

void sub_24E9B71B8()
{
}

uint64_t sub_24E9B71EC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TabBarViewController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for TabBarViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TabBarViewController);
}

uint64_t dispatch thunk of TabBarViewController.__allocating_init(store:viewBuilder:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_24E9B72B4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24E9B7308(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24E9B7350()
{
  unint64_t result = qword_26991E488;
  if (!qword_26991E488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991E480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E488);
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

uint64_t sub_24E9B73F4()
{
  return sub_24E9B5914(*(void *)(v0 + 32));
}

uint64_t sub_24E9B7414@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_24E9B5A4C(a1, a2);
}

BOOL sub_24E9B7430(uint64_t a1)
{
  return sub_24E9B5CCC(a1);
}

void sub_24E9B7454(uint64_t a1, uint64_t a2)
{
  sub_24E9B5EA0(a1, a2, *(void *)(v2 + 16));
}

void sub_24E9B7470(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_24E9B6154(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t NetworkUnavailableView.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24EA05CD8();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t NetworkUnavailableView.body.getter()
{
  return sub_24EA060E8();
}

uint64_t sub_24E9B7628()
{
  return sub_24EA064E8();
}

uint64_t sub_24E9B76A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24EA068F8();
  MEMORY[0x270FA5388](v8 - 8);
  sub_24EA068E8();
  type metadata accessor for LocalizableBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = sub_24EA06958();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v12;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  return result;
}

id sub_24E9B7850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24EA068F8();
  MEMORY[0x270FA5388](v8 - 8);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    id v10 = result;
    MobileGestalt_get_wapiCapability();

    sub_24EA068E8();
    type metadata accessor for LocalizableBundle();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    id result = (id)sub_24EA06958();
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v13;
    *(unsigned char *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24E9B7A4C@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9B7850(*(void *)(v1 + 16), a1);
}

uint64_t sub_24E9B7A54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9B7A78()
{
  return sub_24EA060E8();
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t initializeWithCopy for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for NetworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkUnavailableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9B7D74);
}

uint64_t sub_24E9B7D74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for NetworkUnavailableView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9B7DF4);
}

uint64_t sub_24E9B7DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for NetworkUnavailableView()
{
  uint64_t result = qword_26B1CD3F0;
  if (!qword_26B1CD3F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E9B7EB0()
{
  uint64_t result = sub_24EA05CD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E9B7F3C()
{
  return sub_24E9B7F78(&qword_26991E4A0, &qword_26991E4A8);
}

uint64_t sub_24E9B7F78(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24E9B7FBC@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9B76A0(*(void *)(v1 + 16), a1);
}

uint64_t DynamicContentEnvironment.init(handleNetworkStatusChange:makeNetworkConditionsUpdatedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentEnvironment()
{
  return &type metadata for DynamicContentEnvironment;
}

id sub_24E9B7FE8(void *a1)
{
  id v1 = a1;
  id v2 = FloatingTabBarController.supportedInterfaceOrientations.getter();

  return v2;
}

id FloatingTabBarController.supportedInterfaceOrientations.getter()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v2 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_supportedInterfaceOrientations);

    return v4;
  }
  else
  {
    v6.receiver = v0;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, sel_supportedInterfaceOrientations);
  }
}

uint64_t FloatingTabBarController.selectedViewController.getter()
{
  id v1 = (unint64_t *)(v0 + qword_26991E4B0);
  swift_beginAccess();
  id v2 = 0;
  if (v1[1]) {
    return (uint64_t)v2;
  }
  unint64_t v3 = *v1;
  swift_beginAccess();
  type metadata accessor for TabBarItemDescriptor();
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  id v2 = 0;
  if ((sub_24EA06BF8() & 1) == 0) {
    return (uint64_t)v2;
  }
  id v4 = (uint64_t *)(v0 + qword_26991E4C8);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x2533463B0](v3);
    goto LABEL_7;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 8 * v3 + 32);
LABEL_7:
    id v2 = v7;
    swift_endAccess();
    return (uint64_t)v2;
  }
  __break(1u);
  return result;
}

id sub_24E9B8244(void *a1)
{
  id v1 = a1;
  uint64_t v2 = FloatingTabBarController.keyCommands.getter();

  if (v2)
  {
    sub_24E9B72B4(0, &qword_26991E4D0);
    unint64_t v3 = (void *)sub_24EA069C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

uint64_t FloatingTabBarController.keyCommands.getter()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (!v2)
  {
    v9.receiver = v0;
    v9.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v9, sel_keyCommands);
    if (v7)
    {
      unint64_t v3 = v7;
      sub_24E9B72B4(0, &qword_26991E4D0);
      uint64_t v6 = sub_24EA069D8();
      goto LABEL_6;
    }
    return 0;
  }
  unint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_keyCommands);
  if (!v4)
  {

    return 0;
  }
  uint64_t v5 = v4;
  sub_24E9B72B4(0, &qword_26991E4D0);
  uint64_t v6 = sub_24EA069D8();

LABEL_6:
  return v6;
}

id sub_24E9B83B4(void *a1)
{
  id v1 = a1;
  FloatingTabBarController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E5F0);
  uint64_t v2 = (void *)sub_24EA069C8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t FloatingTabBarController.preferredFocusEnvironments.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E4D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EA097F0;
  *(void *)(inited + 32) = FloatingTabBarController.selectedViewController.getter();
  sub_24EA069E8();
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (*(void *)(inited + 32))
  {
    uint64_t v2 = swift_unknownObjectRetain();
    MEMORY[0x253345FC0](v2);
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24EA06A08();
    }
    sub_24EA06A28();
    sub_24EA069E8();
    uint64_t v1 = v4;
  }
  swift_bridgeObjectRelease();
  return v1;
}

id sub_24E9B8500(void *a1)
{
  id v1 = a1;
  id v2 = FloatingTabBarController.childForStatusBarStyle.getter();

  return v2;
}

id FloatingTabBarController.childForStatusBarStyle.getter()
{
  return sub_24E9B869C((SEL *)&selRef_childViewControllerForStatusBarStyle);
}

id sub_24E9B8550(void *a1)
{
  id v1 = a1;
  id v2 = FloatingTabBarController.childForStatusBarHidden.getter();

  return v2;
}

id FloatingTabBarController.childForStatusBarHidden.getter()
{
  return sub_24E9B869C((SEL *)&selRef_childViewControllerForStatusBarHidden);
}

uint64_t sub_24E9B85A0(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = FloatingTabBarController.prefersHomeIndicatorAutoHidden.getter();

  return v2 & 1;
}

id FloatingTabBarController.prefersHomeIndicatorAutoHidden.getter()
{
  ObjectType = (objc_class *)swift_getObjectType();
  unsigned __int8 v2 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (v2)
  {
    unint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_prefersHomeIndicatorAutoHidden);
  }
  else
  {
    v6.receiver = v0;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, sel_prefersHomeIndicatorAutoHidden);
  }
  return v4;
}

id sub_24E9B864C(void *a1)
{
  id v1 = a1;
  id v2 = FloatingTabBarController.childForHomeIndicatorAutoHidden.getter();

  return v2;
}

id FloatingTabBarController.childForHomeIndicatorAutoHidden.getter()
{
  return sub_24E9B869C((SEL *)&selRef_childViewControllerForHomeIndicatorAutoHidden);
}

id sub_24E9B869C(SEL *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id result = (id)FloatingTabBarController.selectedViewController.getter();
  if (!result)
  {
    v5.receiver = v1;
    v5.super_class = ObjectType;
    return objc_msgSendSuper2(&v5, *a1);
  }
  return result;
}

uint64_t FloatingTabBarController.selectedItem.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_26991E4B0;
  swift_beginAccess();
  if (*(unsigned char *)(v3 + 8) == 1
    || (swift_beginAccess(),
        uint64_t v4 = type metadata accessor for TabBarItemDescriptor(),
        sub_24EA06A58(),
        swift_getWitnessTable(),
        sub_24EA06B58(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750),
        (sub_24EA06BF8() & 1) == 0))
  {
    uint64_t v6 = type metadata accessor for TabBarItemDescriptor();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
  }
  else
  {
    swift_beginAccess();
    sub_24EA06A88();
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, 0, 1, v4);
  }
}

uint64_t FloatingTabBarController.selectedIndex.getter()
{
  uint64_t v1 = v0 + qword_26991E4B0;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t FloatingTabBarController.descriptors.getter()
{
  return sub_24E9B8968();
}

uint64_t FloatingTabBarController.viewControllers.getter()
{
  return sub_24E9B8968();
}

uint64_t sub_24E9B8968()
{
  return swift_bridgeObjectRetain();
}

id sub_24E9B89B0()
{
  uint64_t v1 = qword_26991E4F0;
  id v2 = *(void **)(v0 + qword_26991E4F0);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_26991E4F0);
  }
  else
  {
    id v4 = sub_24E9B8A10();
    objc_super v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_24E9B8A10()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15890]), sel_init);
  objc_msgSend(v0, sel_setMass_, 2.0);
  objc_msgSend(v0, sel_setStiffness_, 300.0);
  objc_msgSend(v0, sel_setDamping_, 50.0);
  id v1 = v0;
  objc_msgSend(v1, sel_durationForEpsilon_, 2.22044605e-16);
  objc_msgSend(v1, sel_setDuration_);

  id v2 = objc_allocWithZone(MEMORY[0x263F15808]);
  id v3 = v1;
  LODWORD(v4) = 1045220557;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 1.0;
  id v7 = objc_msgSend(v2, sel_initWithControlPoints__::, 0.0, v4, v5, v6);
  objc_msgSend(v3, sel_setTimingFunction_, v7);

  return v3;
}

char *FloatingTabBarController.__allocating_init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return FloatingTabBarController.init(store:viewBuilder:)(a1, a2, a3, a4);
}

char *FloatingTabBarController.init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = *MEMORY[0x263F8EED0] & *v4;
  swift_unknownObjectWeakInit();
  uint64_t v9 = qword_26991E4E8;
  type metadata accessor for FloatingTitleView();
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v11 = v4;
  *(void *)((char *)v4 + v9) = objc_msgSend(v10, sel_init);
  id v12 = (char *)v11 + qword_26991E4B0;
  *(void *)id v12 = 0;
  v12[8] = 1;
  uint64_t v13 = qword_26991E4B8;
  uint64_t v14 = *(void *)(v8 + 80);
  uint64_t v15 = *(void *)(v8 + 88);
  type metadata accessor for TabBarItemDescriptor();
  *(void *)((char *)v11 + v13) = sub_24EA06A18();
  *(void *)((char *)v11 + qword_26991E4C8) = MEMORY[0x263F8EE78];
  *(void *)((char *)v11 + qword_26991E4F0) = 0;
  type metadata accessor for TabBarFeature();
  swift_getWitnessTable();
  sub_24EA06748();
  a1();
  *(void *)((char *)v11 + qword_26991E4F8) = sub_24EA06728();
  id v16 = (void *)((char *)v11 + qword_26991E500);
  *id v16 = a3;
  v16[1] = a4;
  swift_retain();

  v27.receiver = v11;
  v27.super_class = ObjectType;
  char v17 = (char *)objc_msgSendSuper2(&v27, sel_initWithNibName_bundle_, 0, 0);
  *(void *)(*(void *)&v17[qword_26991E4E8] + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8) = &off_270073B40;
  swift_unknownObjectWeakAssign();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v19 = (void *)swift_allocObject();
  v19[2] = v14;
  v19[3] = v15;
  v19[4] = v18;
  sub_24EA06A58();
  id v20 = v17;
  swift_retain();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v14;
  v22[3] = v15;
  v22[4] = v21;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v24 = (void *)swift_allocObject();
  v24[2] = v14;
  v24[3] = v15;
  v24[4] = v23;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return v20;
}

uint64_t sub_24E9B9054(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  uint64_t v5 = *(void *)(v4 + 0x50);
  uint64_t v73 = *(void *)(v4 + 88);
  uint64_t v6 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v66 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v70 = (uint64_t)v61 - v9;
  uint64_t v71 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v61 - v10;
  uint64_t v12 = sub_24EA06EC8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v61 - v17;
  uint64_t result = (uint64_t)objc_msgSend(v2, sel_isViewLoaded);
  if (result)
  {
    uint64_t v62 = v7;
    uint64_t v63 = v11;
    uint64_t v67 = v5;
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24EA05DF8();
    uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26B1CF2C0);
    v61[1] = "lable";
    v61[2] = v21;
    sub_24EA05DB8();
    uint64_t v75 = a1;
    uint64_t v72 = v2;
    uint64_t v22 = (uint64_t *)&v2[qword_26991E4B8];
    swift_beginAccess();
    uint64_t v74 = *v22;
    uint64_t v23 = sub_24EA06A58();
    swift_getWitnessTable();
    v61[3] = swift_getWitnessTable();
    sub_24EA068C8();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_24EA06ED8();
    uint64_t v69 = a1;
    id v24 = *(void (**)(char *, uint64_t))(v13 + 8);
    v24(v16, v12);
    uint64_t v25 = sub_24EA06EA8();
    uint64_t v26 = ((uint64_t (*)(char *, uint64_t))v24)(v18, v12);
    uint64_t v75 = v25;
    MEMORY[0x270FA5388](v26);
    uint64_t v27 = v67;
    uint64_t v28 = v73;
    v61[-2] = v67;
    v61[-1] = v28;
    sub_24EA06EB8();
    sub_24EA06A58();
    swift_getWitnessTable();
    uint64_t v29 = sub_24EA06998();
    swift_bridgeObjectRelease();
    uint64_t v75 = v29;
    uint64_t v65 = swift_getWitnessTable();
    uint64_t v30 = sub_24EA06B48();
    uint64_t v64 = v22;
    uint64_t v31 = *v22;
    unint64_t v32 = (unint64_t)v72;
    uint64_t v75 = v31;
    MEMORY[0x270FA5388](v31);
    v61[-4] = v27;
    v61[-3] = v28;
    v61[-2] = v30;
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v33 = sub_24EA06DE8();
    swift_bridgeObjectRelease();
    uint64_t v74 = v33;
    uint64_t v34 = sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
    swift_getTupleTypeMetadata2();
    sub_24EA06A18();
    uint64_t v77 = sub_24EA06858();
    MEMORY[0x270FA5388](v77);
    v61[-2] = v32;
    sub_24EA06868();
    sub_24EA069A8();
    uint64_t v35 = swift_bridgeObjectRelease();
    uint64_t v36 = v75;
    uint64_t v75 = v69;
    MEMORY[0x270FA5388](v35);
    v61[-2] = v36;
    v61[-1] = v32;
    uint64_t v37 = swift_getWitnessTable();
    uint64_t v39 = sub_24E9CAE88((void (*)(char *, char *))sub_24E9BF308, (uint64_t)&v61[-4], v23, v34, MEMORY[0x263F8E628], v37, MEMORY[0x263F8E658], v38);
    swift_bridgeObjectRelease();
    uint64_t v40 = v70;
    FloatingTabBarController.selectedItem.getter(v70);
    uint64_t v41 = v71;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v40, 1, v6) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v40, v62);
      uint64_t v42 = v69;
    }
    else
    {
      id v43 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v63, v40, v6);
      uint64_t v44 = v69;
      uint64_t v74 = v69;
      sub_24EA06BD8();
      uint64_t v42 = v44;
      if (v76 != 1)
      {
        sub_24E9BA4AC(v75);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v6);
        goto LABEL_26;
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v6);
    }
    uint64_t v45 = FloatingTabBarController.selectedViewController.getter();
    if (v45)
    {
      uint64_t v46 = (void *)v45;
      sub_24EA05DB8();
      objc_msgSend(v46, sel_willMoveToParentViewController_, 0);
      uint64_t result = (uint64_t)objc_msgSend(v46, sel_view);
      if (!result) {
        goto LABEL_34;
      }
      id v47 = (void *)result;
      objc_msgSend((id)result, sel_removeFromSuperview);

      objc_msgSend(v46, sel_removeFromParentViewController);
    }
    unint64_t v48 = v32 + qword_26991E4B0;
    swift_beginAccess();
    uint64_t v49 = v67;
    if ((*(unsigned char *)(v48 + 8) & 1) == 0)
    {
      unint64_t v50 = *(void *)v48;
      uint64_t result = sub_24E9BEA38(v50, v42, v67, v73);
      if (result)
      {
        if ((v39 & 0xC000000000000001) == 0)
        {
          if ((v50 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v50 < *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            uint64_t v51 = *(void **)(v39 + 8 * v50 + 32);
LABEL_21:
            id v52 = v51;
LABEL_22:
            id v53 = v52;
            sub_24E9BC2F4(v53, 0);
            id v54 = objc_msgSend(v53, sel_contentScrollViewForEdge_, 1);

            if (!v54)
            {
              id v55 = *(void **)(v32 + qword_26991E4E8);
              sub_24E9DC844();
              objc_msgSend(v55, sel_setNeedsLayout);
            }

            goto LABEL_26;
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
        goto LABEL_30;
      }
    }
    unint64_t v50 = v32;
    sub_24E9BA4AC(0);
    if (sub_24E9BEA38(0, v42, v49, v73))
    {
      if ((v39 & 0xC000000000000001) != 0)
      {
        unint64_t v60 = 0;
LABEL_31:
        id v52 = (id)MEMORY[0x2533463B0](v60, v39);
        goto LABEL_22;
      }
      if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v51 = *(void **)(v39 + 32);
        goto LABEL_21;
      }
      __break(1u);
LABEL_30:
      unint64_t v60 = v50;
      goto LABEL_31;
    }
LABEL_26:
    unint64_t v56 = v32;
    id v57 = v64;
    uint64_t v58 = swift_bridgeObjectRetain();
    MEMORY[0x253346040](v58, v6);
    swift_bridgeObjectRelease();
    uint64_t *v57 = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v59 = (uint64_t *)(v56 + qword_26991E4C8);
    swift_beginAccess();
    uint64_t *v59 = v39;
    swift_bridgeObjectRelease();
    return sub_24E9BC7B8(v42);
  }
  return result;
}

void sub_24E9B9AA4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a3 + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x253346E30](v8);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    a6(v7);
  }
}

void *sub_24E9B9B14(uint64_t a1)
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24EA05DF8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    uint64_t v4 = &v1[qword_26991E4B0];
    swift_beginAccess();
    return sub_24E9BA9CC(a1, (v4[8] & 1) == 0, 0, 0);
  }
  else
  {
    return (void *)sub_24E9BA4AC(a1);
  }
}

void sub_24E9B9C44(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x253346E30](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_24E9B9CA0(v3);
  }
}

uint64_t sub_24E9B9CA0(uint64_t result)
{
  if ((result & 1) == 0) {
    return result;
  }
  id v2 = v1;
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_isViewLoaded);
  if (!result) {
    return result;
  }
  uint64_t v3 = FloatingTabBarController.selectedViewController.getter();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      if (qword_26B1CD710 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_24EA05DF8();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B1CF2C0);
      sub_24EA05DB8();
      id v8 = objc_msgSend(v6, sel_viewControllers);
      sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
      unint64_t v9 = sub_24EA069D8();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_24EA06E58();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v10 != 1)
      {
        id v12 = objc_msgSend(v6, sel_popToRootViewControllerAnimated_, 1);
LABEL_15:

        goto LABEL_16;
      }
      id v11 = objc_msgSend(v6, sel_topViewController);
      if (v11)
      {
        id v12 = v11;
        id v13 = objc_msgSend(v11, sel_contentScrollViewForEdge_, 1);
        if (v13)
        {
          id v14 = v13;
          objc_msgSend(v13, sel__scrollToTopIfPossible_, 1);

          uint64_t v4 = v14;
        }
        goto LABEL_15;
      }
    }
LABEL_16:
  }
  return sub_24E9BB614(v2);
}

void sub_24E9B9ED8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_24E9BEC2C();
}

Swift::Void __swiftcall FloatingTabBarController.viewDidLoad()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_viewDidLoad);
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24EA05DF8();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  sub_24EA066F8();
}

void sub_24E9B9FD8(void *a1)
{
  id v1 = a1;
  FloatingTabBarController.viewDidLoad()();
}

Swift::Void __swiftcall FloatingTabBarController.viewWillAppear(_:)(Swift::Bool a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for TabBarAction();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v8 - v6;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  objc_msgSendSuper2(&v8, sel_viewWillAppear_, a1);
  sub_24EA06718();
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_24E9BA178(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  FloatingTabBarController.viewWillAppear(_:)(a3);
}

void __swiftcall FloatingTabBarController.contentScrollView(for:)(UIScrollView_optional *__return_ptr retstr, NSDirectionalRectEdge a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_contentScrollViewForEdge_, a2);
  }
  else
  {
    v7.receiver = v2;
    v7.super_class = ObjectType;
    [(UIScrollView_optional *)&v7 contentScrollViewForEdge:a2];
  }
}

id sub_24E9BA260(void *a1, uint64_t a2, NSDirectionalRectEdge a3)
{
  id v4 = a1;
  FloatingTabBarController.contentScrollView(for:)(v5, a3);
  objc_super v7 = v6;

  return v7;
}

Swift::Void __swiftcall FloatingTabBarController._observeScrollViewDidScroll(_:)(UIScrollView_optional *a1)
{
  uint64_t v3 = FloatingTabBarController.selectedViewController.getter();
  if (v3)
  {
    id v13 = (id)v3;
    self;
    id v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_topViewController);

      if (v5)
      {
        if (!a1)
        {
          __break(1u);
          return;
        }
        id v6 = [(UIScrollView_optional *)a1 delegate];
        if (!v6 || (id v7 = v6, v8 = *(id *)(v1 + qword_26991E4E8), swift_unknownObjectRelease(), v7 != v8))
        {
          if (qword_26B1CD710 != -1) {
            swift_once();
          }
          uint64_t v9 = sub_24EA05DF8();
          __swift_project_value_buffer(v9, (uint64_t)qword_26B1CF2C0);
          uint64_t v10 = sub_24EA05DD8();
          os_log_type_t v11 = sub_24EA06C08();
          if (os_log_type_enabled(v10, v11))
          {
            id v12 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v12 = 0;
            _os_log_impl(&dword_24E9A6000, v10, v11, "[FloatingTabBarController] Delegate for scroll view doesn't match floating title view", v12, 2u);
            MEMORY[0x253346D80](v12, -1, -1);
          }
        }
      }
    }
  }
}

void sub_24E9BA440(void *a1, uint64_t a2, UIScrollView_optional *a3)
{
  id v5 = a3;
  id v6 = a1;
  FloatingTabBarController._observeScrollViewDidScroll(_:)(a3);
}

uint64_t sub_24E9BA4AC(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50);
  uint64_t v5 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58);
  uint64_t v6 = type metadata accessor for TabBarItemDescriptor();
  v28[0] = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)v28 - v7;
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24EA05DF8();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  uint64_t v10 = (char *)v1 + qword_26991E4B0;
  swift_beginAccess();
  *(void *)uint64_t v10 = a1;
  v10[8] = 0;
  os_log_type_t v11 = (void *)((char *)v2 + qword_26991E4B8);
  swift_beginAccess();
  *(void *)&long long v31 = *v11;
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  long long v31 = v29;
  uint64_t v30 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  uint64_t result = sub_24EA06BF8();
  if (result)
  {
    swift_beginAccess();
    uint64_t v13 = *v11;
    sub_24EA06A88();
    uint64_t v14 = swift_endAccess();
    *(void *)&long long v29 = v13;
    MEMORY[0x270FA5388](v14);
    v28[-2] = v4;
    v28[-1] = v5;
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    *(void *)&long long v31 = sub_24EA06DE8();
    swift_getWitnessTable();
    swift_getWitnessTable();
    sub_24EA06BD8();
    swift_bridgeObjectRelease();
    if ((BYTE8(v29) & 1) == 0)
    {
      uint64_t v15 = *(void *)((char *)v2 + qword_26991E4E8);
      uint64_t v16 = v29;
      uint64_t v17 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar;
      id v18 = *(id *)(v15 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar);
      uint64_t v19 = sub_24EA05D38();
      char v21 = v20;

      if ((v21 & 1) != 0 || v16 != v19)
      {
        uint64_t v22 = *(id *)(v15 + v17);
        sub_24EA05D28();
      }
      else
      {
        uint64_t v22 = sub_24EA05DD8();
        os_log_type_t v23 = sub_24EA06C28();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          *(void *)&long long v31 = v25;
          *(_DWORD *)uint64_t v24 = 134218242;
          *(void *)&long long v29 = v16;
          sub_24EA06CB8();
          *(_WORD *)(v24 + 12) = 2080;
          *(void *)&long long v29 = v16;
          BYTE8(v29) = 0;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
          uint64_t v26 = sub_24EA06C98();
          *(void *)&long long v29 = sub_24E9CEF50(v26, v27, (uint64_t *)&v31);
          sub_24EA06CB8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24E9A6000, v22, v23, "[FloatingTabBarController] New visible index %ld matches displayed index %s", (uint8_t *)v24, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x253346D80](v25, -1, -1);
          MEMORY[0x253346D80](v24, -1, -1);
        }
      }
    }
    return (*(uint64_t (**)(char *, uint64_t))(v28[0] + 8))(v8, v6);
  }
  return result;
}

void *sub_24E9BA9CC(uint64_t a1, char a2, uint64_t (*a3)(id), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v94 = a4;
  v95 = a3;
  uint64_t v8 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v4) + 0x58);
  uint64_t v92 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v4) + 0x50);
  uint64_t v93 = v8;
  uint64_t v9 = type metadata accessor for TabBarItemDescriptor();
  v90 = *(void (***)(void, void))(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v11 = (char *)&v86 - v10;
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24EA05DF8();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = MEMORY[0x253346040](v13, v9);
  swift_bridgeObjectRelease();
  if (v14 > a1)
  {
    uint64_t v91 = a1;
    uint64_t v15 = &v4[qword_26991E4B0];
    uint64_t result = (void *)swift_beginAccess();
    uint64_t v17 = *(void *)v15;
    char v18 = v15[8];
    if ((v18 & 1) == 0 && v17 == v91)
    {
      if (v95) {
        return (void *)v95(result);
      }
      return result;
    }
    swift_unknownObjectWeakInit();
    if ((a2 & 1) == 0)
    {
      long long v31 = sub_24EA05DD8();
      os_log_type_t v32 = sub_24EA06C28();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        *(double *)&uint64_t v34 = COERCE_DOUBLE(swift_slowAlloc());
        double v108 = *(double *)&v34;
        *(_DWORD *)uint64_t v33 = 136315394;
        uint64_t v96 = v17;
        LOBYTE(v97) = v18;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
        uint64_t v35 = sub_24EA06C98();
        uint64_t v96 = sub_24E9CEF50(v35, v36, (uint64_t *)&v108);
        sub_24EA06CB8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 12) = 2048;
        uint64_t v37 = v91;
        uint64_t v96 = v91;
        sub_24EA06CB8();
        _os_log_impl(&dword_24E9A6000, v31, v32, "[FloatingTabBarController] Non-animated transition between item %s and %ld", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253346D80](v34, -1, -1);
        MEMORY[0x253346D80](v33, -1, -1);
      }
      else
      {

        uint64_t v37 = v91;
      }
      sub_24E9BD6F0((uint64_t)v103, v37, v95);
      return (void *)swift_unknownObjectWeakDestroy();
    }
    uint64_t v25 = (unint64_t *)&v5[qword_26991E4C8];
    swift_beginAccess();
    unint64_t v26 = *v25;
    uint64_t v88 = v17;
    if (v18)
    {
      swift_bridgeObjectRetain();
      LODWORD(v87) = 0;
      v89 = 0;
      double v27 = 0.0;
      double v28 = 0.0;
      double v29 = 0.0;
      uint64_t v30 = v90;
    }
    else
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24EA06A88();
      swift_endAccess();
      sub_24E9BD824((uint64_t)v11, v17, v26, v104);
      double v27 = *(double *)v104;
      double v28 = *(double *)&v104[1];
      double v29 = *(double *)&v104[2];
      char v38 = v105;
      v89 = v106;
      uint64_t v30 = v90;
      ((void (**)(char *, uint64_t))v90)[1](v11, v9);
      LODWORD(v87) = v38 & 1;
    }
    swift_beginAccess();
    uint64_t v39 = v91;
    sub_24EA06A88();
    swift_endAccess();
    sub_24E9BD824((uint64_t)v11, v39, v26, v107);
    uint64_t v40 = (void *)v107[4];
    swift_bridgeObjectRelease();
    ((void (**)(char *, uint64_t))v30)[1](v11, v9);
    uint64_t v41 = v88;
    id v42 = v89;
    if (v89)
    {
      type metadata accessor for FloatingTabBarController.FloatingTabBarTransitionElement();
      uint64_t v43 = sub_24EA06CA8();
      (*(void (**)(double *, void *, uint64_t))(*(void *)(v43 - 8) + 32))(&v108, v107, v43);
      uint64_t v44 = v113;
      if (v113)
      {
        double v45 = v108;
        double v46 = v109;
        double v47 = v110;
        char v48 = v111;
        v114[0] = *(_DWORD *)v112;
        *(_DWORD *)((char *)v114 + 3) = *(_DWORD *)&v112[3];
        if ((v27 != v108 || v28 != v109) && v87 != (v111 & 1) && v29 != v110)
        {
          id v61 = v42;
          sub_24E9BF1EC((uint64_t)v107);
          objc_msgSend(v44, sel_contentSize);
          double v63 = v62;
          objc_msgSend(v44, sel_bounds);
          if (CGRectGetHeight(v115) < v63)
          {
            v89 = v44;
            v90 = (void (**)(void, void))v61;
            uint64_t v64 = sub_24EA05DD8();
            os_log_type_t v65 = sub_24EA06C28();
            if (os_log_type_enabled(v64, v65))
            {
              uint64_t v66 = swift_slowAlloc();
              uint64_t v87 = swift_slowAlloc();
              v102[0] = v87;
              *(_DWORD *)uint64_t v66 = 136315394;
              uint64_t v86 = v66 + 4;
              uint64_t v96 = v41;
              LOBYTE(v97) = v18;
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
              uint64_t v67 = sub_24EA06C98();
              uint64_t v96 = sub_24E9CEF50(v67, v68, v102);
              sub_24EA06CB8();
              swift_bridgeObjectRelease();
              *(_WORD *)(v66 + 12) = 2048;
              uint64_t v96 = v91;
              sub_24EA06CB8();
              _os_log_impl(&dword_24E9A6000, v64, v65, "[FloatingTabBarController] Animating transition between item %s and %ld", (uint8_t *)v66, 0x16u);
              uint64_t v69 = v87;
              swift_arrayDestroy();
              MEMORY[0x253346D80](v69, -1, -1);
              MEMORY[0x253346D80](v66, -1, -1);
            }

            uint64_t v70 = v95;
            uint64_t v71 = self;
            objc_msgSend(v71, sel_begin);
            id v72 = objc_msgSend(v5, sel_traitCollection);
            sub_24EA05CE8();
            double v74 = v73;

            uint64_t v75 = *(void *)&v5[qword_26991E4E8];
            if (v47 >= v29)
            {
              *(unsigned char *)(v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen) = 0;
              *(unsigned char *)(v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) = 0;
              uint64_t v78 = v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset;
              *(void *)uint64_t v78 = 0;
              *(unsigned char *)(v78 + 8) = 1;
              uint64_t v79 = v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint;
              *(void *)uint64_t v79 = 0;
              *(void *)(v79 + 8) = 0;
              *(unsigned char *)(v79 + 16) = 1;
            }
            else
            {
              *(unsigned char *)(v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) = 1;
              uint64_t v76 = v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset;
              *(double *)uint64_t v76 = v74;
              *(unsigned char *)(v76 + 8) = 0;
              uint64_t v77 = v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint;
              *(double *)uint64_t v77 = v45;
              *(double *)(v77 + 8) = v46 + v74;
              *(unsigned char *)(v77 + 16) = 0;
              *(unsigned char *)(v75 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen) = 1;
            }
            uint64_t v80 = v91;
            v81 = v89;
            id v42 = v40;
            sub_24E9BD6F0((uint64_t)v103, v80, v70);
            objc_msgSend(v81, sel_setContentOffset_animated_, 0, v45, v46 + v74);
            objc_msgSend(v81, sel_setContentOffset_animated_, 0, v45, v46 + v74);
            uint64_t v82 = swift_allocObject();
            *(void *)(v82 + 16) = v5;
            *(void *)(v82 + 24) = v81;
            *(double *)(v82 + 32) = v45;
            *(double *)(v82 + 40) = v46;
            *(double *)(v82 + 48) = v47;
            *(unsigned char *)(v82 + 56) = v48;
            *(_DWORD *)(v82 + 57) = v114[0];
            *(_DWORD *)(v82 + 60) = *(_DWORD *)((char *)v114 + 3);
            *(void *)(v82 + 64) = v81;
            v100 = sub_24E9BF260;
            uint64_t v101 = v82;
            uint64_t v96 = MEMORY[0x263EF8330];
            uint64_t v97 = 1107296256;
            v98 = sub_24E9FA34C;
            v99 = &block_descriptor_44;
            id v83 = _Block_copy(&v96);
            sub_24E9BF1EC((uint64_t)v107);
            sub_24E9BF1EC((uint64_t)v107);
            v84 = v5;
            swift_release();
            objc_msgSend(v71, sel_setCompletionBlock_, v83);
            _Block_release(v83);
            objc_msgSend(v71, sel_commit);
            id v85 = v90;

            sub_24E9BF1A8((uint64_t)v107);
            sub_24E9BF1A8((uint64_t)v107);

            goto LABEL_28;
          }
          sub_24E9BF1A8((uint64_t)v107);
        }
      }
    }
    uint64_t v49 = sub_24EA05DD8();
    os_log_type_t v50 = sub_24EA06C28();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v102[0] = v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v96 = v41;
      LOBYTE(v97) = v18;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
      uint64_t v53 = sub_24EA06C98();
      uint64_t v96 = sub_24E9CEF50(v53, v54, v102);
      sub_24EA06CB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2048;
      uint64_t v55 = v91;
      uint64_t v96 = v91;
      sub_24EA06CB8();
      _os_log_impl(&dword_24E9A6000, v49, v50, "[FloatingTabBarController] Transitioning between item %s and %ld without custom animation", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253346D80](v52, -1, -1);
      uint64_t v56 = v51;
      id v42 = v89;
      MEMORY[0x253346D80](v56, -1, -1);
    }
    else
    {

      uint64_t v55 = v91;
    }
    id v57 = v95;
    uint64_t v58 = *(unsigned char **)&v5[qword_26991E4E8];
    v58[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating] = 0;
    uint64_t v59 = &v58[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset];
    *(void *)uint64_t v59 = 0;
    v59[8] = 1;
    unint64_t v60 = &v58[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint];
    *(void *)unint64_t v60 = 0;
    *((void *)v60 + 1) = 0;
    v60[16] = 1;
    sub_24E9BD6F0((uint64_t)v103, v55, v57);
    sub_24E9DC844();
    objc_msgSend(v58, sel_setNeedsLayout);
    sub_24E9BF1A8((uint64_t)v107);
LABEL_28:

    return (void *)swift_unknownObjectWeakDestroy();
  }
  uint64_t v19 = v4;
  char v20 = sub_24EA05DD8();
  os_log_type_t v21 = sub_24EA06C08();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 134218240;
    uint64_t v96 = a1;
    sub_24EA06CB8();
    *(_WORD *)(v22 + 12) = 2048;
    uint64_t v23 = swift_bridgeObjectRetain();
    uint64_t v24 = MEMORY[0x253346040](v23, v9);
    swift_bridgeObjectRelease();
    uint64_t v96 = v24;
    sub_24EA06CB8();

    _os_log_impl(&dword_24E9A6000, v20, v21, "[FloatingTabBarController] Failed to select item at index out of bounds: %ld. Descriptor count: %ld", (uint8_t *)v22, 0x16u);
    MEMORY[0x253346D80](v22, -1, -1);
  }
  else
  {

    char v20 = v19;
  }

  return (void *)sub_24E9BA4AC(a1);
}

uint64_t sub_24E9BB614(void *a1)
{
  uint64_t v1 = *MEMORY[0x263F8EED0] & *a1;
  uint64_t v2 = sub_24EA067D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24EA067F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9B72B4(0, (unint64_t *)&qword_26991E470);
  uint64_t v10 = (void *)sub_24EA06C48();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = *(void *)(v1 + 80);
  v12[3] = *(void *)(v1 + 88);
  v12[4] = v11;
  aBlock[4] = sub_24E9BF12C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E9FA34C;
  aBlock[3] = &block_descriptor_0;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  sub_24EA067E8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24E9BF150();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
  sub_24E9B7350();
  sub_24EA06CF8();
  MEMORY[0x253346260](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24E9BB8FC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - v6;
  uint64_t v8 = sub_24EA06EB8();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v17 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v17 - v9, a1, v8);
  LODWORD(v8) = swift_getEnumCaseMultiPayload();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B1CD740);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v13 = &v10[*(int *)(TupleTypeMetadata3 + 48)];
  if (v8 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  else
  {
    int v15 = v10[*(int *)(TupleTypeMetadata3 + 64) + 8];
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v16(v7, v13, v4);
    if (v15 == 1)
    {
      v16(a2, v7, v4);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    }
  }
}

uint64_t sub_24E9BBB7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  MEMORY[0x270FA5388](v4);
  swift_beginAccess();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t result = sub_24EA06BD8();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    sub_24EA06A88();
    swift_endAccess();
    uint64_t v6 = (uint64_t *)(a3 + qword_26991E4C8);
    uint64_t result = swift_beginAccess();
    uint64_t v7 = *v6;
    if ((*v6 & 0xC000000000000001) == 0)
    {
      if ((v9 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v9 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v8 = *(id *)(v7 + 8 * v9 + 32);
LABEL_6:
        swift_endAccess();
        sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
        swift_getWitnessTable();
        sub_24EA06868();
        return sub_24EA06888();
      }
      __break(1u);
      return result;
    }
    MEMORY[0x2533463B0]();
    goto LABEL_6;
  }
  return result;
}

void sub_24E9BBDF4(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  double v47 = a4;
  id v49 = a2;
  uint64_t v6 = *MEMORY[0x263F8EED0] & *a3;
  uint64_t v7 = sub_24EA05CD8();
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v6 + 80);
  uint64_t v46 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = *(void *)(v6 + 88);
  uint64_t v15 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v16 = sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = a1;
  MEMORY[0x253345E80](v48, a1, v49, v15, v16, WitnessTable);
  id v19 = (id)v48[0];
  if (v48[0]) {
    goto LABEL_12;
  }
  id v42 = v13;
  uint64_t v43 = v10;
  uint64_t v20 = v46;
  uint64_t v21 = v18 + *(int *)(v15 + 36);
  id v49 = (id)(*(uint64_t (**)(uint64_t, void *, _UNKNOWN **, void))((char *)a3 + qword_26991E500))(v21, a3, &protocol witness table for FloatingTabBarController<A>, *(void *)((char *)a3 + qword_26991E4E8));
  id v22 = objc_msgSend(v49, sel_tabBarItem);
  if (!v22)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v23 = v22;
  uint64_t v24 = v20;
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  unint64_t v26 = v42;
  uint64_t v41 = v21;
  v25(v42, v21, v11);
  uint64_t v27 = sub_24EA06718();
  MEMORY[0x270FA5388](v27);
  *(&v41 - 2) = v11;
  *(&v41 - 1) = v14;
  uint64_t v28 = v14;
  swift_getKeyPath();
  double v29 = v43;
  sub_24EA06798();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 88))(v29, v11, v28);
  uint64_t v31 = v30;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v45);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v11);
  if (v31)
  {
    os_log_type_t v32 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v32 = 0;
  }
  objc_msgSend(v23, sel_setTitle_, v32);

  if (((*(uint64_t (**)(uint64_t, uint64_t))(v28 + 48))(v11, v28) & 1) == 0
    || ((*(void (**)(uint64_t, uint64_t))(v28 + 80))(v11, v28), !v33))
  {
LABEL_10:
    id v19 = v49;
    id v38 = objc_msgSend(v49, sel_tabBarItem);
    if (v38)
    {
      uint64_t v39 = v38;
      v48[0] = 0;
      v48[1] = 0xE000000000000000;
      sub_24EA06D78();
      sub_24EA06978();
      sub_24EA07018();
      uint64_t v40 = (void *)sub_24EA06908();
      swift_bridgeObjectRelease();
      objc_msgSend(v39, sel_setAccessibilityIdentifier_, v40);

LABEL_12:
      void *v47 = v19;
      return;
    }
    goto LABEL_14;
  }
  id v34 = objc_msgSend(v49, sel_tabBarItem);
  if (v34)
  {
    uint64_t v35 = v34;
    unint64_t v36 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
    id v37 = objc_msgSend(self, sel_systemImageNamed_, v36);

    objc_msgSend(v35, sel_setImage_, v37);
    goto LABEL_10;
  }
LABEL_15:
  __break(1u);
}

id sub_24E9BC2F4(void *a1, uint64_t (*a2)(id))
{
  uint64_t v3 = v2;
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24EA05DF8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  objc_msgSend(v2, sel_addChildViewController_, a1);
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = result;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = result;
  objc_msgSend(v8, sel_addSubview_, result);

  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  char v10 = result;
  objc_msgSend(result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD820);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_24EA09540;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v12 = result;
  id v13 = objc_msgSend(result, sel_topAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v14 = result;
  id v15 = objc_msgSend(result, sel_topAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v11 + 32) = v16;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v17 = result;
  id v18 = objc_msgSend(result, sel_bottomAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v19 = result;
  id v20 = objc_msgSend(result, sel_bottomAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v11 + 40) = v21;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v22 = result;
  id v23 = objc_msgSend(result, sel_leadingAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v24 = result;
  id v25 = objc_msgSend(result, sel_leadingAnchor);

  id v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);
  *(void *)(v11 + 48) = v26;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v27 = result;
  id v28 = objc_msgSend(result, sel_trailingAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  double v29 = result;
  uint64_t v30 = self;
  id v31 = objc_msgSend(v29, sel_trailingAnchor);

  id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(void *)(v11 + 56) = v32;
  sub_24EA069E8();
  sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD770);
  uint64_t v33 = (void *)sub_24EA069C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v33);

  objc_msgSend(a1, sel_didMoveToParentViewController_, v3);
  id result = objc_msgSend(a1, sel_setNeedsFocusUpdate);
  if (a2) {
    return (id)a2(result);
  }
  return result;
}

uint64_t sub_24E9BC7B8(uint64_t a1)
{
  v6[4] = a1;
  type metadata accessor for TabBarItemDescriptor();
  uint64_t v1 = sub_24EA06A58();
  uint64_t v2 = sub_24EA05DA8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9CAE88((void (*)(char *, char *))sub_24E9BF328, (uint64_t)v6, v1, v2, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v4);
  swift_beginAccess();
  sub_24EA05D58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E9BC914@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v5 = *MEMORY[0x263F8EED0] & *a2;
  uint64_t v6 = sub_24EA05CF8();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v60 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24EA068F8();
  MEMORY[0x270FA5388](v8 - 8);
  double v47 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_24EA05CD8();
  uint64_t v10 = *(void *)(v66 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v66);
  id v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v5 + 80);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v46 - v16;
  uint64_t v18 = *(void *)(v5 + 88);
  uint64_t v19 = *(int *)(type metadata accessor for TabBarItemDescriptor() + 36);
  unint64_t v54 = a1;
  id v20 = &a1[v19];
  os_log_type_t v50 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v15 + 16);
  uint64_t v51 = v15 + 16;
  v50(v17, v20, v14);
  uint64_t v62 = *(void *)((char *)a2 + qword_26991E4F8);
  sub_24EA06718();
  uint64_t v67 = v14;
  uint64_t v68 = v18;
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v52 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 88);
  uint64_t v53 = v18 + 88;
  uint64_t v21 = v52(v13, v14, v18);
  unint64_t v23 = v22;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  double v63 = v13;
  id v25 = v13;
  id v26 = v20;
  uint64_t v59 = v10 + 8;
  id v49 = v24;
  v24(v25, v66);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v15 + 8);
  id v57 = v17;
  uint64_t v58 = v15 + 8;
  char v48 = v27;
  v27(v17, v14);
  if (v23) {
    uint64_t v28 = v21;
  }
  else {
    uint64_t v28 = 0;
  }
  if (v23) {
    unint64_t v29 = v23;
  }
  else {
    unint64_t v29 = 0xE000000000000000;
  }
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 64);
  char v31 = v30(v14, v18);
  unint64_t v64 = v29;
  uint64_t v65 = v28;
  if (v31)
  {
    sub_24EA068E8();
    type metadata accessor for LocalizableBundle();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v33 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v34 = sub_24EA06718();
    uint64_t v46 = v30;
    MEMORY[0x270FA5388](v34);
    swift_getKeyPath();
    sub_24EA06798();
    swift_release();
    swift_release();
    sub_24EA06958();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E5F8);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_24EA097F0;
    *(void *)(v35 + 56) = MEMORY[0x263F8D310];
    *(void *)(v35 + 64) = sub_24E9BF26C();
    unint64_t v36 = v64;
    *(void *)(v35 + 32) = v65;
    *(void *)(v35 + 40) = v36;
    uint64_t v30 = v46;
    uint64_t v37 = sub_24EA06948();
    unint64_t v64 = v38;
    uint64_t v65 = v37;
    swift_bridgeObjectRelease();
  }
  double v47 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 56))(v14, v18);
  uint64_t v46 = v39;
  LODWORD(v54) = *v54;
  char v40 = v30(v14, v18);
  uint64_t v41 = (unsigned int *)MEMORY[0x263F3E0B8];
  if ((v40 & 1) == 0) {
    uint64_t v41 = (unsigned int *)MEMORY[0x263F3E0C0];
  }
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v60, *v41, v56);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v18 + 72))(&v69, v14, v18);
  LODWORD(v56) = v69;
  (*(void (**)(uint64_t, uint64_t))(v18 + 80))(v14, v18);
  id v42 = v57;
  v50(v57, v26, v14);
  uint64_t v43 = sub_24EA06718();
  MEMORY[0x270FA5388](v43);
  swift_getKeyPath();
  uint64_t v44 = v63;
  sub_24EA06798();
  swift_release();
  swift_release();
  v52(v44, v14, v18);
  v49(v44, v66);
  v48(v42, v14);
  return sub_24EA05D88();
}

void *sub_24E9BCFF8(void *a1)
{
  unsigned __int8 v3 = objc_msgSend(a1, sel__isScrollViewScrollObserver_, v1);
  uint64_t v4 = v1 + qword_26991E4E0;
  uint64_t v5 = (void *)MEMORY[0x253346E30](v1 + qword_26991E4E0);
  if (v5)
  {
    uint64_t v6 = v5;
    if (v3)
    {
    }
    else
    {
      objc_msgSend(v5, sel_setDelegate_, MEMORY[0x253346E30](*(void *)(v1 + qword_26991E4E8) + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate));

      swift_unknownObjectRelease();
    }
  }
  uint64_t v7 = *(char **)(v1 + qword_26991E4E8);
  uint64_t v8 = (char *)objc_msgSend(a1, sel_delegate);
  if (!v8 || (uint64_t v9 = v8, swift_unknownObjectRelease(), v9 != v7))
  {
    id v10 = objc_msgSend(a1, sel_delegate);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
  }
  id result = objc_msgSend(a1, sel_setDelegate_, v7);
  if ((v3 & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x253346E30](v4);
    if (v12)
    {
      id v13 = v12;
      objc_msgSend(v12, sel__removeScrollViewScrollObserver_, v1);
    }
    objc_msgSend(a1, sel__addScrollViewScrollObserver_, v1);
    swift_unknownObjectWeakAssign();
    sub_24EA05D38();
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = *(void **)&v7[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView];
      *(void *)&v7[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView] = a1;

      id v16 = a1;
    }
    objc_msgSend(a1, sel_contentSize);
    double v18 = v17;
    objc_msgSend(a1, sel_bounds);
    if (CGRectGetHeight(v20) >= v18)
    {
      sub_24E9DC844();
      return objc_msgSend(v7, sel_setNeedsLayout);
    }
    else
    {
      return sub_24E9DC9E8(a1);
    }
  }
  return result;
}

void sub_24E9BD228(uint64_t (*a1)(id))
{
  uint64_t v2 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (v2)
  {
    id v3 = v2;
    sub_24E9BE920(v2, a1);
  }
  else if (a1)
  {
    ((void (*)(void))a1)();
  }
}

void sub_24E9BD2AC(uint64_t (*a1)(id))
{
  uint64_t v2 = (void *)FloatingTabBarController.selectedViewController.getter();
  if (v2)
  {
    id v3 = v2;
    sub_24E9BC2F4(v2, a1);
  }
  else if (a1)
  {
    ((void (*)(void))a1)();
  }
}

id FloatingTabBarController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void FloatingTabBarController.init(nibName:bundle:)()
{
}

void sub_24E9BD3E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  sub_24E9BEEF0();
}

id FloatingTabBarController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24E9BD494(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + qword_26991E4F0);
}

uint64_t sub_24E9BD534(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarAction();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v8 - v4);
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24EA05DF8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  sub_24EA06718();
  *uint64_t v5 = a1;
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  return (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_24E9BD6F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(id))
{
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x253346E30](a1);
  if (v6)
  {
    id v7 = (void *)v6;
    sub_24E9BD228(0);
  }
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x253346E30](a1);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_24E9BA4AC(a2);
  }
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x253346E30](a1);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    sub_24E9BD2AC(a3);
  }
  swift_beginAccess();
  uint64_t v12 = (void *)MEMORY[0x253346E30](a1);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v12, sel_view);

    if (v14)
    {
      objc_msgSend(v14, sel_layoutIfNeeded);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_24E9BD824(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v93 = a1;
  uint64_t v94 = a4;
  uint64_t v90 = *MEMORY[0x263F8EED0] & *v4;
  uint64_t v8 = v90;
  uint64_t v86 = sub_24EA05CF8();
  uint64_t v91 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v87 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24EA05DA8();
  uint64_t v88 = *(void *)(v10 - 8);
  uint64_t v89 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v92 = (char *)v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24EA068F8();
  MEMORY[0x270FA5388](v12 - 8);
  id v85 = (char *)v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24EA05CD8();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  double v17 = (char *)v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(v8 + 80);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v22 = (char *)v77 - v21;
  if (!(a3 >> 62))
  {
    uint64_t v23 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_39:
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v72 = sub_24EA05DF8();
    __swift_project_value_buffer(v72, (uint64_t)qword_26B1CF2C0);
    swift_bridgeObjectRetain_n();
    uint64_t v43 = sub_24EA05DD8();
    os_log_type_t v73 = sub_24EA06C08();
    if (!os_log_type_enabled(v43, v73))
    {

      swift_bridgeObjectRelease_n();
LABEL_49:
      uint64_t v58 = 0;
      BOOL v61 = 0;
      id v53 = 0;
      uint64_t v63 = 0;
      uint64_t v65 = 0;
      goto LABEL_50;
    }
    uint64_t v74 = swift_slowAlloc();
    *(_DWORD *)uint64_t v74 = 134218240;
    uint64_t v95 = a2;
    sub_24EA06CB8();
    *(_WORD *)(v74 + 12) = 2048;
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_24EA06E58();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v75 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v95 = v75;
    sub_24EA06CB8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E9A6000, v43, v73, "[FloatingTabBarController] Failed to make transition element for item at index: %ld. View controller count: %ld", (uint8_t *)v74, 0x16u);
    uint64_t v46 = v74;
    goto LABEL_47;
  }
  v84 = v20;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_24EA06E58();
  swift_bridgeObjectRelease();
  if (v23 < 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  CGRect v20 = v84;
  if (a2 < 0) {
    goto LABEL_39;
  }
LABEL_3:
  if (v23 <= a2) {
    goto LABEL_39;
  }
  v84 = v20;
  if ((a3 & 0xC000000000000001) != 0)
  {
LABEL_35:
    id v24 = (id)MEMORY[0x2533463B0](a2, a3);
    goto LABEL_7;
  }
  if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a2)
  {
    __break(1u);
    goto LABEL_37;
  }
  id v24 = *(id *)(a3 + 8 * a2 + 32);
LABEL_7:
  id v25 = v24;
  self;
  id v26 = (void *)swift_dynamicCastObjCClass();
  if (!v26 || (id v27 = objc_msgSend(v26, sel_topViewController)) == 0)
  {
    uint64_t v28 = v25;
    goto LABEL_19;
  }
  uint64_t v28 = v27;
  id v29 = objc_msgSend(v27, sel_contentScrollViewForEdge_, 1);
  if (!v29)
  {

LABEL_19:
    if (qword_26B1CD710 == -1)
    {
LABEL_20:
      uint64_t v42 = sub_24EA05DF8();
      __swift_project_value_buffer(v42, (uint64_t)qword_26B1CF2C0);
      uint64_t v43 = sub_24EA05DD8();
      os_log_type_t v44 = sub_24EA06C08();
      if (!os_log_type_enabled(v43, v44))
      {
LABEL_48:

        goto LABEL_49;
      }
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_24E9A6000, v43, v44, "[FloatingTabBarController] Failed to make transition element for non-scrollable controller", v45, 2u);
      uint64_t v46 = (uint64_t)v45;
LABEL_47:
      MEMORY[0x253346D80](v46, -1, -1);
      goto LABEL_48;
    }
LABEL_37:
    swift_once();
    goto LABEL_20;
  }
  id v81 = v28;
  id v82 = v29;
  id v83 = v25;
  uint64_t v30 = *(void *)(v90 + 88);
  uint64_t v90 = v93 + *(int *)(type metadata accessor for TabBarItemDescriptor() + 36);
  (*(void (**)(char *))(v19 + 16))(v22);
  v77[1] = *(void *)((char *)v5 + qword_26991E4F8);
  uint64_t v31 = sub_24EA06718();
  MEMORY[0x270FA5388](v31);
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 88))(v17, v18, v30);
  unint64_t v34 = v33;
  v84[1](v17, v14);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  if (v34) {
    uint64_t v35 = (void (**)(char *, uint64_t))v32;
  }
  else {
    uint64_t v35 = 0;
  }
  if (v34) {
    unint64_t v36 = v34;
  }
  else {
    unint64_t v36 = 0xE000000000000000;
  }
  uint64_t v78 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 64);
  uint64_t v79 = v30 + 64;
  char v37 = v78(v18, v30);
  v84 = v35;
  unint64_t v80 = v36;
  if (v37)
  {
    sub_24EA068E8();
    type metadata accessor for LocalizableBundle();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v39 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v40 = sub_24EA06718();
    MEMORY[0x270FA5388](v40);
    swift_getKeyPath();
    sub_24EA06798();
    swift_release();
    swift_release();
    sub_24EA06958();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E5F8);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_24EA097F0;
    *(void *)(v41 + 56) = MEMORY[0x263F8D310];
    *(void *)(v41 + 64) = sub_24E9BF26C();
    *(void *)(v41 + 32) = v84;
    *(void *)(v41 + 40) = v36;
    swift_bridgeObjectRetain();
    id v85 = (char *)sub_24EA06948();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    id v85 = (char *)v35;
  }
  uint64_t v48 = v86;
  double v47 = v87;
  (*(void (**)(uint64_t, uint64_t))(v30 + 56))(v18, v30);
  char v49 = v78(v18, v30);
  os_log_type_t v50 = (unsigned int *)MEMORY[0x263F3E0B8];
  if ((v49 & 1) == 0) {
    os_log_type_t v50 = (unsigned int *)MEMORY[0x263F3E0C0];
  }
  (*(void (**)(char *, void, uint64_t))(v91 + 104))(v47, *v50, v48);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v30 + 72))(&v95, v18, v30);
  (*(void (**)(uint64_t, uint64_t))(v30 + 80))(v18, v30);
  uint64_t v51 = (uint64_t)v92;
  sub_24EA05D88();
  uint64_t v52 = *(void **)((char *)v5 + qword_26991E4E8);
  id v53 = v82;
  objc_msgSend(v82, sel_contentOffset);
  uint64_t v56 = sub_24E9DB8F4(v51, v54, v55);
  if (v57)
  {
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_24EA05DF8();
    __swift_project_value_buffer(v66, (uint64_t)qword_26B1CF2C0);
    uint64_t v67 = sub_24EA05DD8();
    os_log_type_t v68 = sub_24EA06C08();
    BOOL v69 = os_log_type_enabled(v67, v68);
    id v70 = v83;
    if (v69)
    {
      uint64_t v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v71 = 0;
      _os_log_impl(&dword_24E9A6000, v67, v68, "[FloatingTabBarController] Failed to make transition element for item with invalid height", v71, 2u);
      MEMORY[0x253346D80](v71, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v51, v89);
    goto LABEL_49;
  }
  uint64_t v58 = v56;
  double v59 = *(double *)&v56;
  objc_msgSend(v52, sel_heightExtension);
  BOOL v61 = (v60 + v59) * 0.5 < v59;
  objc_msgSend(v53, sel_contentOffset);
  uint64_t v63 = v62;
  uint64_t v65 = v64;

  (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v51, v89);
LABEL_50:
  uint64_t v76 = v94;
  *uint64_t v94 = v63;
  v76[1] = v65;
  v76[2] = v58;
  v76[3] = v61;
  v76[4] = v53;
}

void sub_24E9BE360(uint64_t a1, void *a2, double *a3)
{
  *(unsigned char *)(*(void *)(a1 + qword_26991E4E8) + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen) = 0;
  double v4 = *a3;
  double v5 = a3[1];
  id v6 = sub_24E9B89B0();
  objc_msgSend(a2, sel__setContentOffset_animated_animationCurve_animationAdjustsForContentOffsetDelta_animation_, 1, 3, 0, v6, v4, v5);
}

uint64_t sub_24E9BE3F4(uint64_t a1, uint64_t a2)
{
  return sub_24E9BED64(a2);
}

uint64_t sub_24E9BE3FC(uint64_t a1, uint64_t a2)
{
  return sub_24E9BEFF4(a2);
}

uint64_t sub_24E9BE404(uint64_t a1, uint64_t a2)
{
  return sub_24E9BF128(a2);
}

Swift::Void __swiftcall FloatingTabBarController.contentScrollViewsDidChange()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = FloatingTabBarController.selectedViewController.getter();
  if (!v2) {
    goto LABEL_14;
  }
  id v16 = (id)v2;
  self;
  uint64_t v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3 || (id v4 = objc_msgSend(v3, sel_topViewController)) == 0)
  {

LABEL_14:
    v17.receiver = v0;
    v17.super_class = ObjectType;
    objc_msgSendSuper2(&v17, sel_viewWillLayoutSubviews);
    return;
  }
  double v5 = v4;
  id v6 = objc_msgSend(v4, sel_contentScrollViewForEdge_, 1);
  id v7 = objc_msgSend(v5, sel_contentScrollViewForEdge_, 4);
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      sub_24E9B72B4(0, &qword_26B1CD758);
      id v9 = v6;
      id v10 = v8;
      if ((sub_24EA06C88() & 1) == 0)
      {
        if (qword_26B1CD710 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_24EA05DF8();
        __swift_project_value_buffer(v11, (uint64_t)qword_26B1CF2C0);
        uint64_t v12 = sub_24EA05DD8();
        os_log_type_t v13 = sub_24EA06C28();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_24E9A6000, v12, v13, "[TabBarController] Different scroll views found for top and bottom edge. Picking tallest.", v14, 2u);
          MEMORY[0x253346D80](v14, -1, -1);
        }
      }
    }
    else
    {
      id v15 = v6;
    }
    sub_24E9BCFF8(v6);
  }
  else
  {
  }
}

uint64_t sub_24E9BE650(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarAction();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v8 - v4;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253346E30](a1 + 16);
  if (result)
  {
    id v7 = (void *)result;
    swift_retain();

    sub_24EA06718();
    swift_release();
    swift_storeEnumTagMultiPayload();
    sub_24EA067A8();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_24E9BE78C()
{
  return 24;
}

uint64_t sub_24E9BE798()
{
  return swift_release();
}

uint64_t sub_24E9BE7A0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  return swift_retain();
}

__n128 sub_24E9BE7C0(__n128 *a1, uint64_t a2)
{
  *(void *)a2 = a1[1].n128_u64[0];
  __n128 result = *a1;
  *(__n128 *)(a2 + 8) = *a1;
  return result;
}

uint64_t sub_24E9BE7D4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24E9BE80C(uint64_t a1, uint64_t *a2)
{
  sub_24E9B9AA4(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9B9054);
}

uint64_t sub_24E9BE844()
{
  return 24;
}

uint64_t sub_24E9BE858()
{
  swift_release();
  return swift_deallocObject();
}

void sub_24E9BE890(uint64_t a1, uint64_t *a2)
{
  sub_24E9B9AA4(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9B9B14);
}

uint64_t sub_24E9BE8C8()
{
  return 24;
}

void sub_24E9BE8DC(uint64_t a1, unsigned __int8 *a2)
{
  sub_24E9B9C44(a1, a2, *(void *)(v2 + 32));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_24E9BE920(void *a1, uint64_t (*a2)(id))
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24EA05DF8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  objc_msgSend(a1, sel_willMoveToParentViewController_, 0);
  id result = objc_msgSend(a1, sel_view);
  if (result)
  {
    id v6 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    id result = objc_msgSend(a1, sel_removeFromParentViewController);
    if (a2) {
      return (id)a2(result);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E9BEA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v16 - v10;
  *(void *)&long long v17 = a2;
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  long long v17 = v18;
  v16[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  if ((sub_24EA06BF8() & 1) != 0
    && (sub_24EA06A88(), char v12 = *v11, (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8), (v12 & 1) == 0))
  {
    sub_24EA06A88();
    uint64_t v14 = &v11[*(int *)(v8 + 36)];
    char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
    (*(void (**)(char *, uint64_t))(*(void *)(a3 - 8) + 8))(v14, a3);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

void sub_24E9BEC2C()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = qword_26991E4E8;
  type metadata accessor for FloatingTitleView();
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v2 = &v0[qword_26991E4B0];
  *(void *)uint64_t v2 = 0;
  v2[8] = 1;
  uint64_t v3 = qword_26991E4B8;
  type metadata accessor for TabBarItemDescriptor();
  *(void *)&v0[v3] = sub_24EA06A18();
  *(void *)&v0[qword_26991E4C8] = MEMORY[0x263F8EE78];
  *(void *)&v0[qword_26991E4F0] = 0;

  sub_24EA06E48();
  __break(1u);
}

uint64_t sub_24E9BED64(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + qword_26991E4C8);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24EA06E58();
    swift_bridgeObjectRelease();
    if (v5 < 0)
    {
      __break(1u);
LABEL_17:
      id v8 = (id)MEMORY[0x2533463B0](a1);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v4 = 1;
  if (a1 < 0 || v5 <= a1) {
    return v4;
  }
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *v3;
  if ((*v3 & 0xC000000000000001) != 0) {
    goto LABEL_17;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a1)
  {
    id v8 = *(id *)(v7 + 8 * a1 + 32);
LABEL_8:
    uint64_t v9 = v8;
    swift_endAccess();
    self;
    uint64_t v10 = (void *)swift_dynamicCastObjCClass();
    if (v10)
    {
      id v11 = objc_msgSend(v10, sel_topViewController);
      if (v11)
      {
        char v12 = v11;
        id v13 = objc_msgSend(v11, sel_navigationItem);
        id v14 = objc_msgSend(v13, sel_searchController);

        if (!v14) {
          return 1;
        }
        uint64_t v4 = 0;
        uint64_t v9 = v14;
      }
    }

    return v4;
  }
  __break(1u);
  return result;
}

void sub_24E9BEEF0()
{
}

uint64_t sub_24E9BEF20()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FloatingTabBarController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for FloatingTabBarController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FloatingTabBarController);
}

uint64_t dispatch thunk of FloatingTabBarController.__allocating_init(store:viewBuilder:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_24E9BEFF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarAction();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v7 - v4);
  sub_24EA06718();
  *uint64_t v5 = a1;
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  return (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24E9BF12C()
{
  return sub_24E9BE650(*(void *)(v0 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_24E9BF150()
{
  unint64_t result = qword_26991E478;
  if (!qword_26991E478)
  {
    sub_24EA067D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E478);
  }
  return result;
}

uint64_t sub_24E9BF1A8(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for FloatingTabBarController.FloatingTabBarTransitionElement()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9BF1EC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  return a1;
}

uint64_t sub_24E9BF218()
{
  return swift_deallocObject();
}

void sub_24E9BF260()
{
  sub_24E9BE360(*(void *)(v0 + 16), *(void **)(v0 + 24), (double *)(v0 + 32));
}

unint64_t sub_24E9BF26C()
{
  unint64_t result = qword_26991E600[0];
  if (!qword_26991E600[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26991E600);
  }
  return result;
}

BOOL sub_24E9BF2C0(unsigned char *a1)
{
  return (*a1 & 1) == 0;
}

uint64_t sub_24E9BF2D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_24E9BB8FC(a1, a2);
}

uint64_t sub_24E9BF2EC(uint64_t a1, uint64_t a2)
{
  return sub_24E9BBB7C(a1, a2, *(void *)(v2 + 16));
}

void sub_24E9BF308(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_24E9BBDF4(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_24E9BF328@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24E9BC914(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_24E9BF348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void sub_24E9BF350(uint64_t a1)
{
}

uint64_t sub_24E9BF358(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  id v4 = v3;
  return a1;
}

uint64_t sub_24E9BF3A0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void **)(a2 + 32);
  id v4 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v3;
  id v5 = v3;

  return a1;
}

uint64_t sub_24E9BF3F8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t sub_24E9BF444(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24E9BF48C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t TabBarItemDescriptor.isHidden.getter()
{
  return *v0;
}

uint64_t TabBarItemDescriptor.item.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t TabBarItemDescriptor.init(isHidden:item:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  *a4 = a1;
  id v6 = &a4[*(int *)(type metadata accessor for TabBarItemDescriptor() + 36)];
  uint64_t v7 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);
  return v7(v6, a2, a3);
}

uint64_t type metadata accessor for TabBarItemDescriptor()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24E9BF5E0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24E9BF5F0()
{
  return sub_24EA07058();
}

uint64_t sub_24E9BF618(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E65646469487369 && a2 == 0xE800000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1835365481 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E9BF6F4()
{
  return sub_24EA07088();
}

uint64_t sub_24E9BF73C(char a1)
{
  if (a1) {
    return 1835365481;
  }
  else {
    return 0x6E65646469487369;
  }
}

BOOL sub_24E9BF76C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24E9BF5E0(*a1, *a2);
}

uint64_t sub_24E9BF780()
{
  return sub_24E9BF6F4();
}

uint64_t sub_24E9BF790()
{
  return sub_24E9BF5F0();
}

uint64_t sub_24E9BF7A0()
{
  return sub_24EA07088();
}

uint64_t sub_24E9BF7E8()
{
  return sub_24E9BF73C(*v0);
}

uint64_t sub_24E9BF7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9BF618(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9BF828@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E9C08B8();
  *a1 = result;
  return result;
}

uint64_t sub_24E9BF854(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9BF8A8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t TabBarItemDescriptor.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  v11[0] = *(void *)(a2 + 24);
  v11[1] = v4;
  type metadata accessor for TabBarItemDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_24EA06FF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v11 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EA070A8();
  char v13 = 0;
  uint64_t v9 = v11[3];
  sub_24EA06FC8();
  if (!v9)
  {
    char v12 = 1;
    sub_24EA06FE8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for TabBarItemDescriptor.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TabBarItemDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v19 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v22 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TabBarItemDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v24 = sub_24EA06F88();
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v23 = a3;
  uint64_t v10 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v18 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v18 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v13 = v25;
  sub_24EA07098();
  if (!v13)
  {
    uint64_t v25 = v10;
    uint64_t v14 = v21;
    id v15 = v22;
    char v27 = 0;
    *char v12 = sub_24EA06F48() & 1;
    char v26 = 1;
    sub_24EA06F68();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v24);
    uint64_t v17 = v25;
    (*(void (**)(unsigned char *, char *, uint64_t))(v19 + 32))(&v12[*(int *)(v25 + 36)], v15, a2);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v18 + 32))(v20, v12, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9BFDE4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return TabBarItemDescriptor.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E9BFE04(void *a1, uint64_t a2)
{
  return TabBarItemDescriptor.encode(to:)(a1, a2);
}

uint64_t TabBarItemDescriptor.hash(into:)()
{
  return sub_24EA068A8();
}

uint64_t static TabBarItemDescriptor.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  type metadata accessor for TabBarItemDescriptor();
  return sub_24EA068D8() & 1;
}

uint64_t TabBarItemDescriptor.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t sub_24E9BFF60()
{
  return sub_24EA07088();
}

uint64_t sub_24E9BFFA4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9BFFC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static TabBarItemDescriptor.== infix(_:_:)(a1, a2);
}

uint64_t sub_24E9BFFCC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24E9C0068(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = ~v5;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 1) & (unint64_t)~v5) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *BOOL v3 = *a2;
    BOOL v3 = (uint64_t *)(v9 + ((v5 + 16) & v6));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 1) & v6, ((unint64_t)a2 + v5 + 1) & v6);
  }
  return v3;
}

uint64_t sub_24E9C014C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

unsigned char *sub_24E9C0188(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24E9C01F8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24E9C0268(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unsigned char *sub_24E9C02D8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_24E9C0348(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 1) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)&a1[v9];
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)&a1[v9];
      if (!*(_WORD *)&a1[v9]) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if (v5 > 0xFE) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((unint64_t)&a1[v6 + 1] & ~v6);
      }
      unsigned int v15 = *a1;
      BOOL v16 = v15 >= 2;
      int v17 = (v15 + 2147483646) & 0x7FFFFFFF;
      if (v16) {
        return (v17 + 1);
      }
      else {
        return 0;
      }
    }
  }
  int v11 = a1[v9];
  if (!a1[v9]) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v9) = *(unsigned __int16 *)a1 | (a1[2] << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24E9C04F0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 1) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x24E9C0748);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 > 0xFE)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 1] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else
        {
          *a1 = a2 + 1;
        }
      }
      return;
  }
}

unsigned char *sub_24E9C0770(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9C083CLL);
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

uint64_t sub_24E9C0864()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9C0880()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9C089C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9C08B8()
{
  return 2;
}

uint64_t sub_24E9C08C0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EA07048();
  sub_24E9C2684(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_24EA07058();
  uint64_t v4 = sub_24EA05CB8();
  sub_24E9C2A68(&qword_26B1CCB18, MEMORY[0x263F07508]);
  sub_24EA068A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return sub_24EA07088();
}

uint64_t sub_24E9C09EC(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9C2684(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_24EA07058();
  uint64_t v4 = sub_24EA05CB8();
  sub_24E9C2A68(&qword_26B1CCB18, MEMORY[0x263F07508]);
  sub_24EA068A8();
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
}

uint64_t sub_24E9C0B04(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EA07048();
  sub_24E9C2684(v1, (uint64_t)v3, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_24EA07058();
  uint64_t v4 = sub_24EA05CB8();
  sub_24E9C2A68(&qword_26B1CCB18, MEMORY[0x263F07508]);
  sub_24EA068A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return sub_24EA07088();
}

uint64_t sub_24E9C0C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CC8A8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  BOOL v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_24E9C2684(a1, (uint64_t)v11, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  sub_24E9C2684(a2, v12, type metadata accessor for DynamicContentFeature.TaskIdentifier);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_24EA05C98();
  int v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t DynamicContentFeature.init(environment:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = (_OWORD *)(a2 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20));
  long long v4 = a1[1];
  *int v3 = *a1;
  v3[1] = v4;
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for DynamicContentFeature(uint64_t a1)
{
  return sub_24E9C15E4(a1, qword_26B1CD360);
}

uint64_t DynamicContentFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned __int8 *a4)
{
  uint64_t v78 = a3;
  uint64_t v6 = type metadata accessor for DynamicContentFeature(0);
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v75 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v67 - v10;
  uint64_t v12 = type metadata accessor for DynamicContentFeature.TaskIdentifier(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  int v17 = (char *)&v67 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD730);
  uint64_t v76 = *(void *)(v18 - 8);
  uint64_t v77 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v67 - v22;
  uint64_t v24 = sub_24EA05CB8();
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v67 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v29 = *a4;
  if (v29 == 2)
  {
    uint64_t v73 = v26;
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
    uint64_t v31 = v28;
    BOOL v69 = v11;
    uint64_t v70 = v4;
    uint64_t v32 = v25;
    v30(v28, v4, v25);
    unint64_t v33 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
    uint64_t v67 = &v23[v33[16]];
    os_log_type_t v68 = &v23[v33[20]];
    uint64_t v71 = &v23[v33[24]];
    uint64_t v72 = v31;
    uint64_t v74 = v32;
    v30(v17, (uint64_t)v31, v32);
    sub_24E9C2684((uint64_t)v17, (uint64_t)v15, type metadata accessor for DynamicContentFeature.TaskIdentifier);
    sub_24E9C2A68(&qword_26B1CD340, (void (*)(uint64_t))type metadata accessor for DynamicContentFeature.TaskIdentifier);
    sub_24EA06D68();
    sub_24E9C26EC((uint64_t)v17);
    sub_24EA06AD8();
    uint64_t v34 = *MEMORY[0x263F39590];
    uint64_t v35 = sub_24EA06778();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v67, v34, v35);
    uint64_t v36 = *MEMORY[0x263F39570];
    uint64_t v37 = sub_24EA06768();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v68, v36, v37);
    uint64_t v38 = (uint64_t)v69;
    sub_24E9C2684(v70, (uint64_t)v69, type metadata accessor for DynamicContentFeature);
    unint64_t v39 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    uint64_t v40 = swift_allocObject();
    sub_24E9C2420(v38, v40 + v39);
    uint64_t v41 = v71;
    *(void *)uint64_t v71 = &unk_26991E728;
    *((void *)v41 + 1) = v40;
    uint64_t v42 = v76;
    uint64_t v43 = v77;
    (*(void (**)(char *, void, uint64_t))(v76 + 104))(v23, *MEMORY[0x263F39530], v77);
    os_log_type_t v44 = v78;
    unint64_t v45 = *v78;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v45 = sub_24E9C3680(0, *(void *)(v45 + 16) + 1, 1, v45, (uint64_t *)&unk_26B1CD808, &qword_26B1CD730);
    }
    unint64_t v47 = *(void *)(v45 + 16);
    unint64_t v46 = *(void *)(v45 + 24);
    if (v47 >= v46 >> 1) {
      unint64_t v45 = sub_24E9C3680(v46 > 1, v47 + 1, 1, v45, (uint64_t *)&unk_26B1CD808, &qword_26B1CD730);
    }
    *(void *)(v45 + 16) = v47 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v45+ ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(void *)(v42 + 72) * v47, v23, v43);
    *os_log_type_t v44 = v45;
    return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v72, v74);
  }
  else
  {
    char v49 = v29 & 1;
    os_log_type_t v50 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
    uint64_t v51 = &v21[v50[16]];
    uint64_t v52 = &v21[v50[20]];
    id v53 = &v21[v50[24]];
    *(_OWORD *)uint64_t v21 = 0u;
    *((_OWORD *)v21 + 1) = 0u;
    *((void *)v21 + 4) = 0;
    sub_24E9C2684(v4, (uint64_t)v9, type metadata accessor for DynamicContentFeature);
    unint64_t v54 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    uint64_t v55 = v54 + v7;
    uint64_t v56 = swift_allocObject();
    sub_24E9C2420((uint64_t)v9, v56 + v54);
    *(unsigned char *)(v56 + v55) = v49;
    *(void *)id v53 = &unk_26991E718;
    *((void *)v53 + 1) = v56;
    sub_24EA06AD8();
    uint64_t v57 = *MEMORY[0x263F39588];
    uint64_t v58 = sub_24EA06778();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v58 - 8) + 104))(v51, v57, v58);
    uint64_t v59 = *MEMORY[0x263F39578];
    uint64_t v60 = sub_24EA06768();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104))(v52, v59, v60);
    uint64_t v61 = v76;
    uint64_t v62 = v77;
    (*(void (**)(char *, void, uint64_t))(v76 + 104))(v21, *MEMORY[0x263F39530], v77);
    uint64_t v63 = v78;
    unint64_t v64 = *v78;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v64 = sub_24E9C3680(0, *(void *)(v64 + 16) + 1, 1, v64, (uint64_t *)&unk_26B1CD808, &qword_26B1CD730);
    }
    unint64_t v66 = *(void *)(v64 + 16);
    unint64_t v65 = *(void *)(v64 + 24);
    if (v66 >= v65 >> 1) {
      unint64_t v64 = sub_24E9C3680(v65 > 1, v66 + 1, 1, v64, (uint64_t *)&unk_26B1CD808, &qword_26B1CD730);
    }
    *(void *)(v64 + 16) = v66 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v61 + 32))(v64+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v66, v21, v62);
    *uint64_t v63 = v64;
  }
  return result;
}

uint64_t type metadata accessor for DynamicContentFeature.TaskIdentifier(uint64_t a1)
{
  return sub_24E9C15E4(a1, (uint64_t *)&unk_26B1CD350);
}

uint64_t sub_24E9C15E4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E9C161C(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  v2[14] = sub_24EA06AC8();
  v2[15] = sub_24EA06AB8();
  uint64_t v4 = sub_24EA06A98();
  v2[16] = v4;
  v2[17] = v3;
  return MEMORY[0x270FA2498](sub_24E9C16B8, v4, v3);
}

uint64_t sub_24E9C16B8()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = v1 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20);
  uint64_t v5 = (uint64_t (*)(uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24E9C17A4;
  return v5(v0 + 16);
}

uint64_t sub_24E9C17A4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_24E9C1F38;
  }
  else {
    uint64_t v5 = sub_24E9C18E0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24E9C18E0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[10] = swift_getAssociatedTypeWitness();
  v0[11] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  sub_24EA06B08();
  swift_task_dealloc();
  uint64_t v5 = sub_24EA06AB8();
  v0[20] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[21] = v6;
  void *v6 = v0;
  v6[1] = sub_24E9C1AC4;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 23, v5, v7);
}

uint64_t sub_24E9C1AC4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_24E9C1C08, v3, v2);
}

uint64_t sub_24E9C1C08()
{
  int v1 = *(unsigned __int8 *)(v0 + 184);
  if (v1 == 2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    *(unsigned char *)(v0 + 185) = v1 & 1;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E740);
    *uint64_t v4 = v0;
    v4[1] = sub_24E9C1D2C;
    return MEMORY[0x270F252C8](v0 + 185, v5);
  }
}

uint64_t sub_24E9C1D2C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_24E9C1E4C, v3, v2);
}

uint64_t sub_24E9C1E4C()
{
  uint64_t v1 = sub_24EA06AB8();
  v0[20] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[21] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E9C1AC4;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 23, v1, v3);
}

uint64_t sub_24E9C1F38()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E9C1F9C(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 64) = a3;
  *(void *)(v3 + 16) = a2;
  sub_24EA06AC8();
  *(void *)(v3 + 24) = sub_24EA06AB8();
  uint64_t v5 = sub_24EA06A98();
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v4;
  return MEMORY[0x270FA2498](sub_24E9C2038, v5, v4);
}

uint64_t sub_24E9C2038()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for DynamicContentFeature(0) + 20));
  uint64_t v6 = (uint64_t (*)(uint64_t))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24E9C211C;
  uint64_t v4 = *(unsigned __int8 *)(v0 + 64);
  return v6(v4);
}

uint64_t sub_24E9C211C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_24E9C22BC;
  }
  else {
    uint64_t v5 = sub_24E9C2258;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24E9C2258()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E9C22BC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E9C2320()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for DynamicContentFeature(0) - 8) + 80);
  uint64_t v2 = v0 + ((v1 + 16) & ~v1);
  uint64_t v3 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9C2420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicContentFeature(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E9C2484(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for DynamicContentFeature(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  char v7 = *(unsigned char *)(v1 + v5 + *(void *)(v4 + 64));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24E9C2588;
  return sub_24E9C1F9C(a1, v6, v7);
}

uint64_t sub_24E9C2588()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E9C2684(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9C26EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicContentFeature.TaskIdentifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E9C2748()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for DynamicContentFeature(0) - 8) + 80);
  uint64_t v2 = v0 + ((v1 + 16) & ~v1);
  uint64_t v3 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9C2844(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for DynamicContentFeature(0) - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_24E9C3BA4;
  return sub_24E9C161C(a1, v5);
}

unint64_t sub_24E9C291C()
{
  unint64_t result = qword_26B1CD2B8[0];
  if (!qword_26B1CD2B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1CD2B8);
  }
  return result;
}

unint64_t sub_24E9C2974()
{
  unint64_t result = qword_26B1CD2B0;
  if (!qword_26B1CD2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD2B0);
  }
  return result;
}

unint64_t sub_24E9C29CC()
{
  unint64_t result = qword_26B1CD728;
  if (!qword_26B1CD728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD728);
  }
  return result;
}

uint64_t sub_24E9C2A20()
{
  return sub_24E9C2A68(&qword_26B1CD258, (void (*)(uint64_t))type metadata accessor for DynamicContentState);
}

uint64_t sub_24E9C2A68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for DynamicContentFeature(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_24EA05CB8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    uint64_t v11 = *((void *)v10 + 3);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
    *((void *)v9 + 3) = v11;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for DynamicContentFeature(uint64_t a1)
{
  uint64_t v2 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 24);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v9 + 8);
  *(void *)(v8 + 24) = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  _OWORD *v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t assignWithTake for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + v7) = *v9;
  swift_release();
  *(_OWORD *)(v8 + 16) = v9[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9C2EA4);
}

uint64_t sub_24E9C2EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CB8();
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
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DynamicContentFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9C2F78);
}

uint64_t sub_24E9C2F78(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24EA05CB8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24E9C3034()
{
  uint64_t result = sub_24EA05CB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24E9C30C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_24EA05CB8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_24E9C3178(uint64_t a1)
{
  uint64_t v2 = sub_24EA05CB8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24E9C31DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24E9C3240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24E9C32A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24E9C3308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24E9C336C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CCB10);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_24E9C33DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CCB10);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t sub_24E9C345C(uint64_t a1)
{
  uint64_t result = sub_24EA05CB8();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t sub_24E9C3500()
{
  return sub_24E9C2A68(&qword_26B1CD348, (void (*)(uint64_t))type metadata accessor for DynamicContentFeature.TaskIdentifier);
}

void *sub_24E9C3548(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD800);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24E9C38EC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E9C366C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E9C3680(a1, a2, a3, a4, &qword_26991E730, &qword_26991E738);
}

uint64_t sub_24E9C3680(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
    uint64_t result = sub_24EA06E38();
    __break(1u);
    return result;
  }
  void v16[2] = v11;
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
    sub_24E9C39FC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_24E9C38EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_26B1CD400);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24EA06E98();
  __break(1u);
  return result;
}

uint64_t sub_24E9C39FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  uint64_t result = sub_24EA06E98();
  __break(1u);
  return result;
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

uint64_t sub_24E9C3BA8()
{
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  if (v1) {
    return v1(*v0);
  }
  return result;
}

uint64_t sub_24E9C3BE0()
{
  unint64_t v1 = (uint64_t (*)(void))v0[3];
  if (v1) {
    return v1(*v0);
  }
  return result;
}

uint64_t sub_24E9C3C18()
{
  return sub_24E9C3BA8();
}

uint64_t sub_24E9C3C54()
{
  return sub_24E9C3BE0();
}

id HeadlessFeatureHosting<>.attach<A>(store:onAppear:onDisappear:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10 = (void *)sub_24E9C3F88(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v10;
}

uint64_t HeadlessFeatureHosting<>.onAppear()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a1, a3);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    do
    {
      sub_24E9C4148(v5, (uint64_t)v9);
      uint64_t v6 = v10;
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      v5 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t HeadlessFeatureHosting<>.onDisappear()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a1, a3);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    do
    {
      sub_24E9C4148(v5, (uint64_t)v9);
      uint64_t v6 = v10;
      uint64_t v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      v5 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

id sub_24E9C3E90@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = (void *)sub_24E9C3F88(a1, a2, a3, a4, a5, a6, a9, a7, a10, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>);
  *a8 = v11;
  return v11;
}

uint64_t sub_24E9C3EF0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_24E9C4248(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_24E9C3F88(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = v10;
  uint64_t v17 = a1();
  BOOL v18 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a10 + 24);
  sub_24E9C4210(a3);
  sub_24E9C4210(a5);
  uint64_t v28 = v17;
  swift_retain();
  sub_24E9C4210(a3);
  sub_24E9C4210(a5);
  uint64_t v19 = (void (*)(unsigned char *, void))v18(v30, a7, a10);
  unint64_t v21 = v20;
  uint64_t v22 = (void *)*v20;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v21 = (uint64_t)v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v22 = sub_24E9C3548(0, v22[2] + 1, 1, v22);
    *unint64_t v21 = (uint64_t)v22;
  }
  unint64_t v25 = v22[2];
  unint64_t v24 = v22[3];
  if (v25 >= v24 >> 1) {
    *unint64_t v21 = (uint64_t)sub_24E9C3548((void *)(v24 > 1), v25 + 1, 1, v22);
  }
  v29[0] = v28;
  v29[1] = a3;
  v29[2] = a4;
  v29[3] = a5;
  v29[4] = a6;
  uint64_t v26 = type metadata accessor for HeadlessFeature();
  sub_24E9C3EF0(v25, (uint64_t)v29, v21, v26, (uint64_t)&off_270073EB0);
  v19(v30, 0);
  swift_release();
  sub_24E9C4238(a3);
  sub_24E9C4238(a5);
  return v11;
}

uint64_t sub_24E9C4148(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t dispatch thunk of HeadlessFeatureProtocol.onAppeared()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HeadlessFeatureProtocol.onDisappeared()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of HeadlessFeatureHosting.headlessFeatures.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_24E9C4210(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for HeadlessFeature()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9C4238(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24E9C4248(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24E9C4260(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 8)) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

void *sub_24E9C42C0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v5 = a2 + 1;
  uint64_t v4 = a2[1];
  swift_retain();
  if (v4)
  {
    uint64_t v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  uint64_t v7 = a2[3];
  if (v7)
  {
    uint64_t v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

void *sub_24E9C4354(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      uint64_t v5 = a2[2];
      a1[1] = v4;
      a1[2] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  uint64_t v7 = a2[3];
  if (!a1[3])
  {
    if (v7)
    {
      uint64_t v9 = a2[4];
      a1[3] = v7;
      a1[4] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[4];
  a1[3] = v7;
  a1[4] = v8;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_24E9C444C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      uint64_t v5 = a2[2];
      a1[1] = v4;
      a1[2] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  uint64_t v7 = a2[3];
  if (!a1[3])
  {
    if (v7)
    {
      uint64_t v9 = a2[4];
      a1[3] = v7;
      a1[4] = v9;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[4];
  a1[3] = v7;
  a1[4] = v8;
  swift_release();
  return a1;
}

uint64_t sub_24E9C4524(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24E9C456C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

__n128 SignOutFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v4;
  return result;
}

uint64_t SignOutFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  double v108 = a3;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E738);
  uint64_t v109 = *(void *)(v107 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v107);
  uint64_t v10 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v95 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v95 - v15;
  MEMORY[0x270FA5388](v14);
  BOOL v18 = (char *)&v95 - v17;
  uint64_t v19 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = v4[1];
  long long v111 = *v4;
  long long v112 = v22;
  long long v23 = v4[3];
  long long v113 = v4[2];
  long long v114 = v23;
  sub_24E9C73E0(a4, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for SignOutAction);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      uint64_t v25 = *((void *)v21 + 2);
      char v26 = v21[24];
      *(_OWORD *)a1 = *(_OWORD *)v21;
      *(void *)(a1 + 16) = v25;
      *(unsigned char *)(a1 + 24) = v26;
      break;
    case 2:
      uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
      uint64_t v28 = &v18[v27[16]];
      int v29 = &v18[v27[20]];
      uint64_t v30 = &v18[v27[24]];
      char v110 = 1;
      unint64_t v106 = sub_24E9C4F98();
      sub_24EA06D68();
      uint64_t v31 = *MEMORY[0x263F39580];
      uint64_t v32 = sub_24EA06778();
      uint64_t v33 = *(void *)(v32 - 8);
      uint64_t v34 = *(void (**)(char *, void, uint64_t))(v33 + 104);
      unsigned int v105 = v31;
      v103 = v34;
      uint64_t v104 = v32;
      uint64_t v102 = v33 + 104;
      ((void (*)(char *, uint64_t))v34)(v28, v31);
      uint64_t v35 = *MEMORY[0x263F39570];
      uint64_t v36 = sub_24EA06768();
      uint64_t v37 = *(void *)(v36 - 8);
      uint64_t v38 = *(void (**)(char *, void, uint64_t))(v37 + 104);
      unsigned int v101 = v35;
      uint64_t v99 = v37 + 104;
      v100 = v38;
      v38(v29, v35, v36);
      unint64_t v39 = (_OWORD *)swift_allocObject();
      long long v40 = v112;
      v39[1] = v111;
      v39[2] = v40;
      long long v41 = v114;
      v39[3] = v113;
      v39[4] = v41;
      *(void *)uint64_t v30 = &unk_26991E778;
      *((void *)v30 + 1) = v39;
      sub_24E9C6B04((uint64_t)&v111);
      sub_24EA06AD8();
      uint64_t v42 = v109;
      uint64_t v43 = *(void (**)(void))(v109 + 104);
      unsigned int v98 = *MEMORY[0x263F39530];
      uint64_t v97 = (void (*)(char *, void, uint64_t))v43;
      v43(v18);
      unint64_t v44 = *v108;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v44 = sub_24E9C366C(0, *(void *)(v44 + 16) + 1, 1, v44);
      }
      unint64_t v46 = *(void *)(v44 + 16);
      unint64_t v45 = *(void *)(v44 + 24);
      if (v46 >= v45 >> 1) {
        unint64_t v44 = sub_24E9C366C(v45 > 1, v46 + 1, 1, v44);
      }
      *(void *)(v44 + 16) = v46 + 1;
      uint64_t v48 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32);
      uint64_t v47 = v42 + 32;
      unint64_t v95 = (*(unsigned __int8 *)(v47 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 48);
      uint64_t v49 = *(void *)(v47 + 40);
      uint64_t v50 = v107;
      uint64_t v109 = v47;
      uint64_t v96 = v48;
      v48(v44 + v95 + v49 * v46, v18, v107);
      uint64_t v51 = v108;
      *double v108 = v44;
      uint64_t v52 = &v16[v27[16]];
      id v53 = &v16[v27[20]];
      unint64_t v54 = &v16[v27[24]];
      char v110 = 2;
      sub_24EA06D68();
      v103(v52, v105, v104);
      v100(v53, v101, v36);
      uint64_t v55 = (_OWORD *)swift_allocObject();
      long long v56 = v112;
      v55[1] = v111;
      v55[2] = v56;
      long long v57 = v114;
      v55[3] = v113;
      v55[4] = v57;
      *(void *)unint64_t v54 = &unk_26991E788;
      *((void *)v54 + 1) = v55;
      sub_24E9C6B04((uint64_t)&v111);
      sub_24EA06AD8();
      v97(v16, v98, v50);
      unint64_t v58 = *v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v58 = sub_24E9C366C(0, *(void *)(v58 + 16) + 1, 1, v58);
      }
      unint64_t v60 = *(void *)(v58 + 16);
      unint64_t v59 = *(void *)(v58 + 24);
      if (v60 >= v59 >> 1) {
        unint64_t v58 = sub_24E9C366C(v59 > 1, v60 + 1, 1, v58);
      }
      *(void *)(v58 + 16) = v60 + 1;
      uint64_t result = v96(v58 + v95 + v60 * v49, v16, v50);
      *uint64_t v51 = v58;
      break;
    case 3:
      uint64_t v61 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
      uint64_t v62 = &v13[v61[16]];
      uint64_t v63 = &v13[v61[20]];
      unint64_t v64 = &v13[v61[24]];
      char v110 = 0;
      sub_24E9C4F98();
      sub_24EA06D68();
      uint64_t v65 = *MEMORY[0x263F39590];
      uint64_t v66 = sub_24EA06778();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 104))(v62, v65, v66);
      uint64_t v67 = (_OWORD *)swift_allocObject();
      long long v68 = v112;
      v67[1] = v111;
      v67[2] = v68;
      long long v69 = v114;
      v67[3] = v113;
      v67[4] = v69;
      *(void *)unint64_t v64 = &unk_26991E768;
      *((void *)v64 + 1) = v67;
      sub_24E9C6B04((uint64_t)&v111);
      sub_24EA06AD8();
      uint64_t v70 = *MEMORY[0x263F39578];
      uint64_t v71 = sub_24EA06768();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v71 - 8) + 104))(v63, v70, v71);
      uint64_t v72 = v109;
      uint64_t v73 = v107;
      (*(void (**)(char *, void, uint64_t))(v109 + 104))(v13, *MEMORY[0x263F39530], v107);
      uint64_t v74 = v108;
      unint64_t v75 = *v108;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v75 = sub_24E9C366C(0, *(void *)(v75 + 16) + 1, 1, v75);
      }
      unint64_t v77 = *(void *)(v75 + 16);
      unint64_t v76 = *(void *)(v75 + 24);
      if (v77 >= v76 >> 1) {
        unint64_t v75 = sub_24E9C366C(v76 > 1, v77 + 1, 1, v75);
      }
      *(void *)(v75 + 16) = v77 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v72 + 32))(v75+ ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))+ *(void *)(v72 + 72) * v77, v13, v73);
      unint64_t *v74 = v75;
      break;
    case 4:
      *(unsigned char *)(a2 + *(int *)(type metadata accessor for SignOutState() + 20)) = 0;
      uint64_t v78 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
      uint64_t v79 = &v10[v78[16]];
      unint64_t v80 = &v10[v78[20]];
      id v81 = &v10[v78[24]];
      char v110 = 3;
      sub_24E9C4F98();
      sub_24EA06D68();
      uint64_t v82 = *MEMORY[0x263F39580];
      uint64_t v83 = sub_24EA06778();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v83 - 8) + 104))(v79, v82, v83);
      v84 = (_OWORD *)swift_allocObject();
      long long v85 = v112;
      v84[1] = v111;
      v84[2] = v85;
      long long v86 = v114;
      v84[3] = v113;
      v84[4] = v86;
      *(void *)id v81 = &unk_26991E758;
      *((void *)v81 + 1) = v84;
      sub_24E9C6B04((uint64_t)&v111);
      sub_24EA06AD8();
      uint64_t v87 = *MEMORY[0x263F39578];
      uint64_t v88 = sub_24EA06768();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v88 - 8) + 104))(v80, v87, v88);
      uint64_t v89 = v109;
      uint64_t v90 = v107;
      (*(void (**)(char *, void, uint64_t))(v109 + 104))(v10, *MEMORY[0x263F39530], v107);
      uint64_t v91 = v108;
      unint64_t v92 = *v108;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v92 = sub_24E9C366C(0, *(void *)(v92 + 16) + 1, 1, v92);
      }
      unint64_t v94 = *(void *)(v92 + 16);
      unint64_t v93 = *(void *)(v92 + 24);
      if (v94 >= v93 >> 1) {
        unint64_t v92 = sub_24E9C366C(v93 > 1, v94 + 1, 1, v92);
      }
      *(void *)(v92 + 16) = v94 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v89 + 32))(v92+ ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80))+ *(void *)(v89 + 72) * v94, v10, v90);
      *uint64_t v91 = v92;
      break;
    default:
      uint64_t result = sub_24E9C6B64((uint64_t)v21, a2);
      break;
  }
  return result;
}

unint64_t sub_24E9C4F98()
{
  unint64_t result = qword_26991E748;
  if (!qword_26991E748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26991E748);
  }
  return result;
}

uint64_t sub_24E9C4FEC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = type metadata accessor for SignOutAction();
  v2[4] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7C0);
  v2[5] = v4;
  v2[6] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v2[7] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7C8);
  v2[8] = v6;
  v2[9] = *(void *)(v6 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = sub_24EA06AC8();
  v2[12] = sub_24EA06AB8();
  uint64_t v9 = (uint64_t (*)(uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  v2[13] = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24E9C51D8;
  return v9(v5);
}

uint64_t sub_24E9C51D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24EA06A98();
  *(void *)(v1 + 112) = v3;
  *(void *)(v1 + 120) = v2;
  return MEMORY[0x270FA2498](sub_24E9C531C, v3, v2);
}

uint64_t sub_24E9C531C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  sub_24EA06AE8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_24EA06AB8();
  v0[16] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24E9C5410;
  uint64_t v6 = v0[8];
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 19, v4, v7, v6);
}

uint64_t sub_24E9C5410()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = *(void *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_24E9C5554, v3, v2);
}

uint64_t sub_24E9C5554()
{
  if (*(unsigned char *)(v0 + 152) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7B8);
    *uint64_t v3 = v0;
    v3[1] = sub_24E9C569C;
    uint64_t v5 = *(void *)(v0 + 32);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24E9C569C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24E9C7448(v2, (uint64_t (*)(void))type metadata accessor for SignOutAction);
  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_24E9C57F4, v4, v3);
}

uint64_t sub_24E9C57F4()
{
  uint64_t v1 = sub_24EA06AB8();
  v0[16] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E9C5410;
  uint64_t v3 = v0[8];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 19, v1, v4, v3);
}

uint64_t sub_24E9C58BC(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for SignOutAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EA06AC8();
  v2[16] = sub_24EA06AB8();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C59EC;
  return v6(v2 + 7);
}

uint64_t sub_24E9C59EC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24EA06A98();
  *(void *)(v1 + 144) = v3;
  *(void *)(v1 + 152) = v2;
  return MEMORY[0x270FA2498](sub_24E9C5B30, v3, v2);
}

uint64_t sub_24E9C5B30()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EA06B08();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EA06AB8();
  v0[20] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[21] = (uint64_t)v6;
  void *v6 = v0;
  v6[1] = sub_24E9C5D20;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 23, v5, v7);
}

uint64_t sub_24E9C5D20()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return MEMORY[0x270FA2498](sub_24E9C5E64, v3, v2);
}

uint64_t sub_24E9C5E64()
{
  if (*(unsigned char *)(v0 + 184) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7B8);
    *uint64_t v3 = v0;
    v3[1] = sub_24E9C5F7C;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24E9C5F7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24E9C7448(v2, (uint64_t (*)(void))type metadata accessor for SignOutAction);
  uint64_t v3 = *(void *)(v1 + 152);
  uint64_t v4 = *(void *)(v1 + 144);
  return MEMORY[0x270FA2498](sub_24E9C60D4, v4, v3);
}

uint64_t sub_24E9C60D4()
{
  uint64_t v1 = sub_24EA06AB8();
  v0[20] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[21] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E9C5D20;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 23, v1, v3);
}

uint64_t sub_24E9C61C0(uint64_t a1, void *a2)
{
  v2[2] = a1;
  v2[3] = type metadata accessor for SignOutAction();
  v2[4] = swift_task_alloc();
  type metadata accessor for AccountState();
  uint64_t v4 = swift_task_alloc();
  v2[5] = v4;
  v2[6] = sub_24EA06AC8();
  v2[7] = sub_24EA06AB8();
  uint64_t v7 = (uint64_t (*)(uint64_t))(*a2 + *(int *)*a2);
  uint64_t v5 = (void *)swift_task_alloc();
  v2[8] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E9C6318;
  return v7(v4);
}

uint64_t sub_24E9C6318()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EA06A98();
  v2[10] = v4;
  v2[11] = v3;
  if (v0) {
    uint64_t v5 = sub_24E9C6744;
  }
  else {
    uint64_t v5 = sub_24E9C6478;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24E9C6478()
{
  sub_24E9C73E0(v0[5], v0[4], (uint64_t (*)(void))type metadata accessor for AccountState);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7B8);
  void *v1 = v0;
  v1[1] = sub_24E9C6558;
  uint64_t v3 = v0[4];
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24E9C6558()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24E9C7448(v2, (uint64_t (*)(void))type metadata accessor for SignOutAction);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_24E9C66B0, v4, v3);
}

uint64_t sub_24E9C66B0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  sub_24E9C7448(v1, (uint64_t (*)(void))type metadata accessor for AccountState);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24E9C6744()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E9C67BC(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_24EA06AC8();
  v2[3] = sub_24EA06AB8();
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C68A4;
  return v6();
}

uint64_t sub_24E9C68A4()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24EA06A98();
  if (v0) {
    uint64_t v4 = sub_24E9C6A00;
  }
  else {
    uint64_t v4 = sub_24E9C2258;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24E9C6A00()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E9C6A68(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C3BA4;
  return sub_24E9C67BC(a1, v1 + 16);
}

uint64_t sub_24E9C6B04(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E9C6B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E9C6BCC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C2588;
  return sub_24E9C61C0(a1, (void *)(v1 + 16));
}

uint64_t sub_24E9C6C6C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C3BA4;
  return sub_24E9C4FEC(a1, v1 + 16);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9C6D5C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E9C3BA4;
  return sub_24E9C58BC(a1, v1 + 16);
}

uint64_t sub_24E9C6DF8()
{
  return sub_24E9C6F28(&qword_26991E790, (void (*)(uint64_t))type metadata accessor for SignOutAction);
}

uint64_t sub_24E9C6E40()
{
  return sub_24E9C6F28(&qword_26991E798, (void (*)(uint64_t))type metadata accessor for SignOutAction);
}

unint64_t sub_24E9C6E8C()
{
  unint64_t result = qword_26991E7A0;
  if (!qword_26991E7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E7A0);
  }
  return result;
}

uint64_t sub_24E9C6EE0()
{
  return sub_24E9C6F28(&qword_26991E7A8, (void (*)(uint64_t))type metadata accessor for SignOutState);
}

uint64_t sub_24E9C6F28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for SignOutEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SignOutEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SignOutEnvironment(void *a1, void *a2)
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
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for SignOutEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SignOutEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignOutEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignOutFeature()
{
  return &type metadata for SignOutFeature;
}

uint64_t getEnumTagSinglePayload for SignOutFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SignOutFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9C7350);
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

ValueMetadata *type metadata accessor for SignOutFeature.TaskIdentifier()
{
  return &type metadata for SignOutFeature.TaskIdentifier;
}

unint64_t sub_24E9C738C()
{
  unint64_t result = qword_26991E7B0;
  if (!qword_26991E7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E7B0);
  }
  return result;
}

uint64_t sub_24E9C73E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9C7448(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E9C74AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_24E9C74E4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  uint64_t v4 = sub_24EA067C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, WitnessTable);
}

uint64_t sub_24E9C7560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  BOOL v18 = (void *)swift_allocObject();
  v18[2] = a7;
  v18[3] = a8;
  v18[4] = a1;
  v18[5] = a2;
  sub_24EA067C8();
  swift_getWitnessTable();
  uint64_t result = sub_24EA05E78();
  *(void *)a9 = result;
  *(void *)(a9 + 8) = v20;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  return result;
}

uint64_t HeadlessFeatureViewModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v33 = a3;
  swift_getWitnessTable();
  sub_24EA060D8();
  uint64_t v5 = sub_24EA05F68();
  uint64_t v32 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v28 - v6;
  uint64_t v8 = sub_24EA05F68();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v29 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v31 = (char *)&v28 - v12;
  long long v13 = v3[1];
  long long v38 = *v3;
  long long v39 = v13;
  long long v40 = v3[2];
  uint64_t v41 = *((void *)v3 + 6);
  uint64_t v14 = swift_allocObject();
  uint64_t v16 = *(void *)(a2 + 16);
  uint64_t v15 = *(void *)(a2 + 24);
  *(void *)(v14 + 16) = v16;
  *(void *)(v14 + 24) = v15;
  long long v17 = v3[1];
  *(_OWORD *)(v14 + 32) = *v3;
  *(_OWORD *)(v14 + 48) = v17;
  *(_OWORD *)(v14 + 64) = v3[2];
  *(void *)(v14 + 80) = *((void *)v3 + 6);
  sub_24E9C7A9C((uint64_t)&v38);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24EA063E8();
  swift_release();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v15;
  long long v20 = v39;
  *(_OWORD *)(v19 + 32) = v38;
  *(_OWORD *)(v19 + 48) = v20;
  *(_OWORD *)(v19 + 64) = v40;
  *(void *)(v19 + 80) = v41;
  sub_24E9C7A9C((uint64_t)&v38);
  uint64_t v21 = MEMORY[0x263F1A240];
  uint64_t v36 = WitnessTable;
  uint64_t v37 = MEMORY[0x263F1A240];
  uint64_t v22 = swift_getWitnessTable();
  long long v23 = v29;
  sub_24EA06348();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v5);
  uint64_t v34 = v22;
  uint64_t v35 = v21;
  swift_getWitnessTable();
  unint64_t v24 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v25 = v31;
  v24(v31, v23, v8);
  char v26 = *(void (**)(char *, uint64_t))(v9 + 8);
  v26(v23, v8);
  v24(v33, v25, v8);
  return ((uint64_t (*)(char *, uint64_t))v26)(v25, v8);
}

uint64_t sub_24E9C79E0()
{
  return swift_release();
}

uint64_t sub_24E9C79E8()
{
  return sub_24E9C7B80((uint64_t (*)(uint64_t))HeadlessFeatureViewModifier.onAppeared());
}

Swift::Void __swiftcall HeadlessFeatureViewModifier.onAppeared()()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 24);
  if (v1)
  {
    uint64_t v2 = sub_24E9C74E4();
    v1(v2, v3, v4, v5);
    swift_release();
  }
}

uint64_t sub_24E9C7A9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  sub_24E9C7B00();
  sub_24E9C4210(v2);
  sub_24E9C4210(v3);
  return a1;
}

uint64_t sub_24E9C7B00()
{
  return swift_retain();
}

uint64_t objectdestroyTm_0()
{
  sub_24E9C79E0();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  if (*(void *)(v0 + 72)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_24E9C7B68()
{
  return sub_24E9C7B80((uint64_t (*)(uint64_t))HeadlessFeatureViewModifier.onDisappeared());
}

uint64_t sub_24E9C7B80(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for HeadlessFeatureViewModifier();
  return a1(v2);
}

Swift::Void __swiftcall HeadlessFeatureViewModifier.onDisappeared()()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 40);
  if (v1)
  {
    uint64_t v2 = sub_24E9C74E4();
    v1(v2, v3, v4, v5, v6, v7, v8);
    swift_release();
  }
}

uint64_t sub_24E9C7C6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9C7CB8()
{
  return sub_24EA05EF8();
}

uint64_t sub_24E9C7CE0(uint64_t a1)
{
  uint64_t result = sub_24E9C79E0();
  if (*(void *)(a1 + 24)) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + 40))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_24E9C7D48(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[3];
  if (v7)
  {
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  }
  uint64_t v9 = a2[5];
  if (v9)
  {
    uint64_t v10 = a2[6];
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  }
  return a1;
}

uint64_t sub_24E9C7DF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  uint64_t v7 = a2[3];
  if (*(void *)(a1 + 24))
  {
    if (v7)
    {
      uint64_t v8 = a2[4];
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
LABEL_8:
  uint64_t v10 = a2[5];
  if (!*(void *)(a1 + 40))
  {
    if (v10)
    {
      uint64_t v12 = a2[6];
      *(void *)(a1 + 40) = v10;
      *(void *)(a1 + 48) = v12;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v11 = a2[6];
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  swift_retain();
  swift_release();
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

uint64_t sub_24E9C7F20(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24E9C79E0();
  uint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = v10;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  swift_release();
  return a1;
}

uint64_t sub_24E9C8008(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_24E9C8064(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for HeadlessFeatureViewModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9C80DC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9C81D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9C8210()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

ValueMetadata *type metadata accessor for SidebarToolbarLeadItemButtonStyle()
{
  return &type metadata for SidebarToolbarLeadItemButtonStyle;
}

uint64_t sub_24E9C8248()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9C8264()
{
  return sub_24EA05EC8();
}

uint64_t sub_24E9C828C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24EA06168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7D0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EA06178();
  sub_24E9C846C();
  sub_24E9C84C4();
  sub_24EA06318();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  uint64_t v10 = (uint64_t (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26991E7E8) + 36));
  *uint64_t v10 = sub_24E9C8264;
  v10[1] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_24E9C846C()
{
  unint64_t result = qword_26991E7D8;
  if (!qword_26991E7D8)
  {
    sub_24EA06168();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E7D8);
  }
  return result;
}

unint64_t sub_24E9C84C4()
{
  unint64_t result = qword_26991E7E0;
  if (!qword_26991E7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E7E0);
  }
  return result;
}

unint64_t sub_24E9C851C()
{
  unint64_t result = qword_26991E7F0;
  if (!qword_26991E7F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991E7E8);
    sub_24EA06168();
    sub_24E9C846C();
    sub_24E9C84C4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E7F0);
  }
  return result;
}

uint64_t sub_24E9C85E4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for OutlineHoverModifier(uint64_t a1)
{
  sub_24E9C8630(*(void *)a1, *(unsigned char *)(a1 + 8));
  return swift_release();
}

uint64_t sub_24E9C8630(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for OutlineHoverModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24E9C85E4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OutlineHoverModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24E9C85E4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24E9C8630(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for OutlineHoverModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24E9C8630(v6, v7);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(void *)(a1 + 24) = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OutlineHoverModifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OutlineHoverModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OutlineHoverModifier()
{
  return &type metadata for OutlineHoverModifier;
}

uint64_t sub_24E9C8830()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9C884C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned __int8 a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int v50 = a3;
  uint64_t v53 = a2;
  uint64_t v54 = a6;
  uint64_t v47 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E7F8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E800);
  MEMORY[0x270FA5388](v48);
  long long v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E808);
  MEMORY[0x270FA5388](v51);
  uint64_t v52 = (uint64_t)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v49 = a4 & 1;
  LOBYTE(v58) = a4;
  uint64_t v59 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
  sub_24EA06518();
  int v46 = v55;
  uint64_t v15 = sub_24EA06618();
  uint64_t v45 = v16;
  double v17 = 0.0;
  sub_24EA05E98();
  uint64_t v18 = v58;
  uint64_t v19 = v60;
  uint64_t v20 = v61;
  uint64_t v21 = v62;
  uint64_t v22 = sub_24EA06448();
  unsigned __int8 v55 = a4;
  uint64_t v56 = a5;
  sub_24EA06518();
  if (v57) {
    double v17 = 1.0;
  }
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E818);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v11, v47, v23);
  unint64_t v24 = &v11[*(int *)(v9 + 44)];
  *(void *)unint64_t v24 = 0xC004000000000000;
  uint64_t v25 = v59;
  *((void *)v24 + 1) = v18;
  *((void *)v24 + 2) = v25;
  *((void *)v24 + 3) = v19;
  *((void *)v24 + 4) = v20;
  *((void *)v24 + 5) = v21;
  *((void *)v24 + 6) = v22;
  uint64_t v26 = a5;
  *((double *)v24 + 7) = v17;
  *((void *)v24 + 8) = sub_24E9C93CC;
  *((void *)v24 + 9) = 0;
  uint64_t v27 = v45;
  *((void *)v24 + 10) = v15;
  *((void *)v24 + 11) = v27;
  uint64_t v28 = sub_24EA06618();
  uint64_t v30 = v29;
  unsigned __int8 v55 = a4;
  uint64_t v56 = v26;
  sub_24EA06518();
  if (v57 == 1)
  {
    sub_24EA06428();
    uint64_t v31 = sub_24EA06458();
    swift_release();
  }
  else
  {
    uint64_t v31 = sub_24EA06438();
  }
  if (v46) {
    double v32 = 1.16;
  }
  else {
    double v32 = 1.0;
  }
  sub_24E9C8E28((uint64_t)v11, (uint64_t)v13, &qword_26991E7F8);
  uint64_t v33 = &v13[*(int *)(v48 + 36)];
  *(void *)uint64_t v33 = v31;
  *(_OWORD *)(v33 + 8) = xmmword_24EA0A080;
  *((void *)v33 + 3) = 0x4022000000000000;
  *((void *)v33 + 4) = sub_24E9C8264;
  *((void *)v33 + 5) = 0;
  *((void *)v33 + 6) = v28;
  *((void *)v33 + 7) = v30;
  sub_24E9C92D0((uint64_t)v11, &qword_26991E7F8);
  sub_24EA06698();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v38 = v52;
  sub_24E9C8E28((uint64_t)v13, v52, &qword_26991E800);
  uint64_t v39 = v38 + *(int *)(v51 + 36);
  *(double *)uint64_t v39 = v32;
  *(double *)(v39 + 8) = v32;
  *(void *)(v39 + 16) = v35;
  *(void *)(v39 + 24) = v37;
  sub_24E9C92D0((uint64_t)v13, &qword_26991E800);
  char v40 = v50 & 1;
  uint64_t v41 = v53;
  sub_24E9C85E4(v53, v50 & 1);
  char v42 = sub_24E9C8E8C(v41, v40);
  sub_24E9C8630(v41, v40);
  unsigned __int8 v55 = v42 & 1;
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v41;
  *(unsigned char *)(v43 + 24) = v40;
  *(unsigned char *)(v43 + 32) = v49;
  *(void *)(v43 + 40) = v26;
  sub_24E9C85E4(v41, v40);
  sub_24E9C90F0();
  swift_retain();
  sub_24EA06408();
  swift_release();
  return sub_24E9C92D0(v38, &qword_26991E808);
}

uint64_t sub_24E9C8CD4()
{
  return swift_release();
}

uint64_t sub_24E9C8D70(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  sub_24E9C85E4(a1, a2 & 1);
  sub_24E9C8E8C(a1, v3);
  sub_24E9C8630(a1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
  return sub_24EA06528();
}

uint64_t sub_24E9C8E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24E9C884C(a1, *(void *)v2, *(unsigned __int8 *)(v2 + 8), *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_24E9C8E28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9C8E8C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_24EA05FD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_24EA06C18();
  uint64_t v9 = sub_24EA06268();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_24E9CEF50(1819242306, 0xE400000000000000, &v15);
    sub_24EA06CB8();
    _os_log_impl(&dword_24E9A6000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253346D80](v12, -1, -1);
    MEMORY[0x253346D80](v11, -1, -1);
  }

  sub_24EA05FC8();
  swift_getAtKeyPath();
  sub_24E9C8630(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_24E9C9090()
{
  sub_24E9C8630(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9C90D4()
{
  return sub_24E9C8CD4();
}

unint64_t sub_24E9C90F0()
{
  unint64_t result = qword_26991E820;
  if (!qword_26991E820)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991E808);
    sub_24E9C916C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E820);
  }
  return result;
}

unint64_t sub_24E9C916C()
{
  unint64_t result = qword_26991E828;
  if (!qword_26991E828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991E800);
    sub_24E9C920C();
    sub_24E9B7F78(&qword_26991E850, &qword_26991E858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E828);
  }
  return result;
}

unint64_t sub_24E9C920C()
{
  unint64_t result = qword_26991E830;
  if (!qword_26991E830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991E7F8);
    sub_24E9B7F78(&qword_26991E838, &qword_26991E818);
    sub_24E9B7F78(&qword_26991E840, &qword_26991E848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E830);
  }
  return result;
}

uint64_t sub_24E9C92D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E9C932C()
{
  return sub_24E9C8D70(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24E9C935C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t HeadlessFeatureAttaching.attach<A>(store:onAppear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(a7 + 8))(a1, a2, a3, a4, 0, 0, a6);
}

uint64_t View.attach<A>(store:onAppear:onDisappear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  swift_retain();
  sub_24E9C4210(a3);
  sub_24E9C4210(a5);
  sub_24E9C7560(a1, a2, a3, a4, a5, a6, a8, a10, (uint64_t)v28);
  uint64_t v17 = v30;
  uint64_t v18 = v32;
  v22[0] = v28[0];
  v22[1] = v28[1];
  char v23 = v29;
  uint64_t v24 = v30;
  uint64_t v25 = v31;
  uint64_t v26 = v32;
  uint64_t v27 = v33;
  uint64_t v19 = type metadata accessor for HeadlessFeatureViewModifier();
  MEMORY[0x2533459E0](v22, a7, v19, a9);
  sub_24E9C79E0();
  sub_24E9C4238(v17);
  return sub_24E9C4238(v18);
}

uint64_t dispatch thunk of HeadlessFeatureAttaching.attach<A>(store:onAppear:onDisappear:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 8))();
}

uint64_t sub_24E9C955C()
{
  return swift_getWitnessTable();
}

id sub_24E9C964C(void *a1, uint64_t a2, SEL *a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_24E9C96A0(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  uint64_t v9 = (objc_class *)type metadata accessor for VibrantSegmentedControl();
  v13.receiver = a1;
  v13.super_class = v9;
  os_log_type_t v10 = *a4;
  id v11 = a1;
  LODWORD(v10) = objc_msgSendSuper2(&v13, v10);
  v12.receiver = v11;
  v12.super_class = v9;
  objc_msgSendSuper2(&v12, *a5, a3);
  if (v10 != [v11 *a4]) {
    sub_24E9CA334(objc_msgSend(v11, sel_state));
  }
}

id sub_24E9C974C(double a1, double a2, double a3, double a4)
{
  v4[OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  id v9 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setApportionsSegmentWidthsByContent_, 1);
  os_log_type_t v10 = self;
  id v11 = v9;
  id v12 = objc_msgSend(v10, sel_systemFillColor);
  objc_msgSend(v11, sel_setSelectedSegmentTintColor_, v12);

  objc_msgSend(v11, sel_setTransparentBackground_, 1);
  objc_msgSend(v11, sel__setAlwaysEmitValueChanged_, 1);

  return v11;
}

void sub_24E9C98F8(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  id v7 = a1;
  id v8 = a1;
  id v9 = objc_msgSend(v3, sel_titleTextAttributesForState_, objc_msgSend(v3, sel_state));
  if (!v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    goto LABEL_13;
  }
  os_log_type_t v10 = v9;
  type metadata accessor for Key(0);
  sub_24E9CAA34();
  uint64_t v11 = sub_24EA06848();

  if (!*(void *)(v11 + 16))
  {
    long long v20 = 0u;
    long long v21 = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  id v12 = (id)*MEMORY[0x263F814F0];
  unint64_t v13 = sub_24E9DDE14((uint64_t)v12);
  if ((v14 & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;

    goto LABEL_12;
  }
  sub_24E9CA9D8(*(void *)(v11 + 56) + 32 * v13, (uint64_t)&v20);

  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_13:
    sub_24E9CA978((uint64_t)&v20);
    goto LABEL_14;
  }
  sub_24E9B72B4(0, &qword_26991E870);
  if (swift_dynamicCast())
  {
    if (v7)
    {
      uint64_t v15 = self;
      id v16 = v8;
      id v17 = objc_msgSend(v15, sel_configurationWithFont_, v18);
      id v7 = objc_msgSend(v16, sel_imageWithConfiguration_, v17);
    }
  }
LABEL_14:
  v19.receiver = v4;
  v19.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  objc_msgSendSuper2(&v19, sel_insertSegmentWithImage_atIndex_animated_, v7, a2, a3 & 1);
}

void sub_24E9C9B84(id a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v3, sel_titleTextAttributesForState_, objc_msgSend(v3, sel_state));
  if (v6)
  {
    id v7 = v6;
    type metadata accessor for Key(0);
    sub_24E9CAA34();
    uint64_t v8 = sub_24EA06848();

    if (a1) {
      a1 = sub_24E9CA7B8(v8);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a1;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  objc_msgSendSuper2(&v10, sel_setImage_forSegmentAtIndex_, a1, a2);
}

void sub_24E9C9F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  objc_super v5 = (void *)sub_24E9CA104(v4);
  swift_bridgeObjectRelease();
  if (v5)
  {
    objc_msgSend(v2, sel_bounds);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    objc_msgSend(v5, sel_locationInView_, v2);
    v19.x = v14;
    v19.y = v15;
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    if (!CGRectContainsPoint(v20, v19)) {
      *((unsigned char *)v2 + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
    }
    sub_24E9B72B4(0, &qword_26991E878);
    sub_24E9CAA8C();
    id v16 = (void *)sub_24EA06B18();
    v17.receiver = v2;
    v17.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
    objc_msgSendSuper2(&v17, sel_touchesEnded_withEvent_, v16, a2);
  }
  else
  {
    *((unsigned char *)v2 + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
    sub_24E9B72B4(0, &qword_26991E878);
    sub_24E9CAA8C();
    id v16 = (void *)sub_24EA06B18();
    v18.receiver = v2;
    v18.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
    objc_msgSendSuper2(&v18, sel_touchesEnded_withEvent_, v16, a2);
  }
}

uint64_t sub_24E9CA104(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_24EA06D08();
    uint64_t v5 = v4;
    uint64_t v6 = sub_24EA06D58();
    char v8 = MEMORY[0x253346320](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_24E9CAD6C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_24E9CAAF4(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_24E9CAD6C(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_24E9CAD78(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24E9CA334(id a1)
{
  unint64_t v2 = v1;
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_titleTextAttributesForState_, a1);
  if (result)
  {
    uint64_t v5 = (void *)result;
    type metadata accessor for Key(0);
    sub_24E9CAA34();
    uint64_t v6 = MEMORY[0x263F8EE58];
    uint64_t v7 = sub_24EA06848();

    if (objc_msgSend(v2, sel_state) == a1)
    {
      uint64_t result = (uint64_t)objc_msgSend(v2, sel_numberOfSegments);
      if (result < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v8 = result;
      if (result)
      {
        uint64_t v9 = 0;
        double v10 = &off_265320000;
        uint64_t v11 = (void *)*MEMORY[0x263F814F0];
        uint64_t v12 = v6 + 8;
        for (id i = objc_msgSend(v2, sel_imageForSegmentAtIndex_, 0, *MEMORY[0x263F814F0]);
              ;
              id i = objc_msgSend(v2, (SEL)v10[292], v9, v22))
        {
          id v15 = i;
          if (v15) {
            break;
          }
LABEL_10:
          if (v8 == ++v9) {
            return swift_bridgeObjectRelease();
          }
        }
        id v16 = v15;
        if (*(void *)(v7 + 16))
        {
          id v17 = v11;
          unint64_t v18 = sub_24E9DDE14((uint64_t)v17);
          if (v19)
          {
            sub_24E9CA9D8(*(void *)(v7 + 56) + 32 * v18, (uint64_t)&v24);
          }
          else
          {
            long long v24 = 0u;
            long long v25 = 0u;
          }

          if (*((void *)&v25 + 1))
          {
            sub_24E9B72B4(0, &qword_26991E870);
            if (swift_dynamicCast())
            {
              uint64_t v20 = v12;
              id v21 = objc_msgSend(self, sel_configurationWithFont_, v23);
              id v14 = objc_msgSend(v16, sel_imageWithConfiguration_, v21);

              uint64_t v12 = v20;
              uint64_t v11 = v22;
              double v10 = &off_265320000;
              goto LABEL_9;
            }
LABEL_8:
            id v14 = v16;
LABEL_9:
            objc_msgSend(v2, sel_setImage_forSegmentAtIndex_, v14, v9);

            goto LABEL_10;
          }
        }
        else
        {
          long long v24 = 0u;
          long long v25 = 0u;
        }
        sub_24E9CA978((uint64_t)&v24);
        goto LABEL_8;
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_24E9CA5B4(uint64_t a1, id a2)
{
  uint64_t v3 = v2;
  if (objc_msgSend(v3, sel_state) == a2)
  {
    unint64_t v5 = (unint64_t)objc_msgSend(v3, sel_numberOfSegments);
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = 0;
        uint64_t v8 = (void *)*MEMORY[0x263F814F0];
        uint64_t v9 = &off_265320000;
        double v10 = &off_265320000;
        for (id i = objc_msgSend(v3, sel_imageForSegmentAtIndex_, 0, MEMORY[0x263F8EE58] + 8);
              ;
              id i = objc_msgSend(v3, (SEL)v9[292], v7, v21))
        {
          id v13 = i;
          if (v13) {
            break;
          }
LABEL_9:
          if (v6 == ++v7) {
            return;
          }
        }
        id v14 = v13;
        if (a1 && *(void *)(a1 + 16))
        {
          id v15 = v8;
          unint64_t v16 = sub_24E9DDE14((uint64_t)v15);
          if (v17)
          {
            sub_24E9CA9D8(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v23);
          }
          else
          {
            long long v23 = 0u;
            long long v24 = 0u;
          }

          if (*((void *)&v24 + 1))
          {
            sub_24E9B72B4(0, &qword_26991E870);
            if (swift_dynamicCast())
            {
              unint64_t v18 = v10;
              char v19 = v8;
              id v20 = objc_msgSend(self, sel_configurationWithFont_, v22);
              id v12 = objc_msgSend(v14, sel_imageWithConfiguration_, v20);

              uint64_t v8 = v19;
              double v10 = v18;
              uint64_t v9 = &off_265320000;

              goto LABEL_8;
            }
LABEL_7:
            id v12 = v14;
LABEL_8:
            objc_msgSend(v3, (SEL)v10[293], v12, v7);

            goto LABEL_9;
          }
        }
        else
        {
          long long v23 = 0u;
          long long v24 = 0u;
        }
        sub_24E9CA978((uint64_t)&v23);
        goto LABEL_7;
      }
    }
  }
}

id sub_24E9CA7B8(uint64_t a1)
{
  unint64_t v2 = v1;
  if (!a1 || !*(void *)(a1 + 16))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    goto LABEL_9;
  }
  id v4 = (id)*MEMORY[0x263F814F0];
  unint64_t v5 = sub_24E9DDE14((uint64_t)v4);
  if ((v6 & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;

    goto LABEL_9;
  }
  sub_24E9CA9D8(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v11);

  if (!*((void *)&v12 + 1))
  {
LABEL_9:
    sub_24E9CA978((uint64_t)&v11);
    return v2;
  }
  sub_24E9B72B4(0, &qword_26991E870);
  if ((swift_dynamicCast() & 1) == 0) {
    return v2;
  }
  id v7 = objc_msgSend(self, sel_configurationWithFont_, v10);
  id v8 = objc_msgSend(v2, sel_imageWithConfiguration_, v7);

  return v8;
}

id sub_24E9CA920()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VibrantSegmentedControl()
{
  return self;
}

uint64_t sub_24E9CA978(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991E868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E9CA9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24E9CAA34()
{
  unint64_t result = qword_26991DDA8;
  if (!qword_26991DDA8)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991DDA8);
  }
  return result;
}

unint64_t sub_24E9CAA8C()
{
  unint64_t result = qword_26991E880;
  if (!qword_26991E880)
  {
    sub_24E9B72B4(255, &qword_26991E878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991E880);
  }
  return result;
}

void sub_24E9CAAF4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x253346350](a1, a2, v7);
      sub_24E9B72B4(0, &qword_26991E878);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_24EA06D28() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_24EA06D38();
  sub_24E9B72B4(0, &qword_26991E878);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24EA06C78();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_24EA06C88();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_24EA06C88();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  id v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_24E9CAD6C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E9CAD78(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

id SidebarTabController.__allocating_init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return SidebarTabController.init(store:viewBuilder:)(a1, a2, a3, a4);
}

uint64_t sub_24E9CAE5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E9CAE88(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  char v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_24EA06B88();
  if (!v18) {
    return sub_24EA06A18();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_24EA06E18();
  uint64_t v32 = sub_24EA06E28();
  sub_24EA06DF8();
  uint64_t v36 = v8;
  uint64_t result = sub_24EA06B68();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_24EA06BE8();
      uint64_t v22 = v12;
      long long v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_24EA06E08();
      sub_24EA06B98();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

id sub_24E9CB288(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SidebarTabController.keyCommands.getter();

  if (v2)
  {
    sub_24E9B72B4(0, &qword_26991E4D0);
    uint64_t v3 = (void *)sub_24EA069C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t SidebarTabController.keyCommands.getter()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (void *)SidebarTabController.selectedViewController.getter();
  if (!v2)
  {
    v9.receiver = v0;
    v9.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v9, sel_keyCommands);
    if (v7)
    {
      uint64_t v3 = v7;
      sub_24E9B72B4(0, &qword_26991E4D0);
      uint64_t v6 = sub_24EA069D8();
      goto LABEL_6;
    }
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_keyCommands);
  if (!v4)
  {

    return 0;
  }
  char v5 = v4;
  sub_24E9B72B4(0, &qword_26991E4D0);
  uint64_t v6 = sub_24EA069D8();

LABEL_6:
  return v6;
}

uint64_t SidebarTabController.selectedViewController.getter()
{
  id v1 = (unint64_t *)(v0 + qword_26991E888);
  swift_beginAccess();
  id v2 = 0;
  if (v1[1]) {
    return (uint64_t)v2;
  }
  unint64_t v3 = *v1;
  swift_beginAccess();
  type metadata accessor for TabBarItemDescriptor();
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  id v2 = 0;
  if ((sub_24EA06BF8() & 1) == 0) {
    return (uint64_t)v2;
  }
  id v4 = (uint64_t *)(v0 + qword_26991E8A0);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x2533463B0](v3);
    goto LABEL_7;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 8 * v3 + 32);
LABEL_7:
    id v2 = v7;
    swift_endAccess();
    return (uint64_t)v2;
  }
  __break(1u);
  return result;
}

id sub_24E9CB5AC(void *a1)
{
  id v1 = a1;
  SidebarTabController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E5F0);
  id v2 = (void *)sub_24EA069C8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t SidebarTabController.preferredFocusEnvironments.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E4D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EA097F0;
  *(void *)(inited + 32) = SidebarTabController.selectedViewController.getter();
  sub_24EA069E8();
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (*(void *)(inited + 32))
  {
    uint64_t v2 = swift_unknownObjectRetain();
    MEMORY[0x253345FC0](v2);
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24EA06A08();
    }
    sub_24EA06A28();
    sub_24EA069E8();
    uint64_t v1 = v4;
  }
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t SidebarTabController.selectedItem.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_26991E888;
  swift_beginAccess();
  if (*(unsigned char *)(v3 + 8) == 1
    || (swift_beginAccess(),
        uint64_t v4 = type metadata accessor for TabBarItemDescriptor(),
        sub_24EA06A58(),
        swift_getWitnessTable(),
        sub_24EA06B58(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750),
        (sub_24EA06BF8() & 1) == 0))
  {
    uint64_t v6 = type metadata accessor for TabBarItemDescriptor();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
  }
  else
  {
    swift_beginAccess();
    sub_24EA06A88();
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a1, 0, 1, v4);
  }
}

uint64_t SidebarTabController.selectedIndex.getter()
{
  uint64_t v1 = v0 + qword_26991E888;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SidebarTabController.descriptors.getter()
{
  return sub_24E9B8968();
}

uint64_t SidebarTabController.viewControllers.getter()
{
  return sub_24E9B8968();
}

id SidebarTabController.init(store:viewBuilder:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = *MEMORY[0x263F8EED0] & *v4;
  uint64_t v8 = (char *)v4 + qword_26991E888;
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = qword_26991E890;
  uint64_t v10 = *(void *)(v7 + 80);
  uint64_t v11 = *(void *)(v7 + 88);
  type metadata accessor for TabBarItemDescriptor();
  uint64_t v12 = v4;
  *(void *)((char *)v4 + v9) = sub_24EA06A18();
  *(void *)((char *)v12 + qword_26991E8A0) = MEMORY[0x263F8EE78];
  type metadata accessor for TabBarFeature();
  swift_getWitnessTable();
  sub_24EA06748();
  a1();
  *(void *)((char *)v12 + qword_26991E8B0) = sub_24EA06728();
  uint64_t v13 = (void *)((char *)v12 + qword_26991E8B8);
  *uint64_t v13 = a3;
  v13[1] = a4;
  swift_retain();

  v25.receiver = v12;
  v25.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v25, sel_initWithNibName_bundle_, 0, 0);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = v10;
  v16[3] = v11;
  v16[4] = v15;
  sub_24EA06A58();
  id v17 = v14;
  swift_retain();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v10;
  v19[3] = v11;
  v19[4] = v18;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = v10;
  v21[3] = v11;
  v21[4] = v20;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return v17;
}

uint64_t sub_24E9CBDB8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  uint64_t v5 = *(void *)(v4 + 0x50);
  uint64_t v6 = *(void *)(v4 + 88);
  uint64_t v7 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v8 = sub_24EA06CA8();
  uint64_t v60 = *(void *)(v8 - 8);
  uint64_t v61 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v67 = (uint64_t)v57 - v10;
  uint64_t v11 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v62 = (char *)v57 - v12;
  uint64_t v13 = sub_24EA06EC8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v57 - v18;
  uint64_t result = (uint64_t)objc_msgSend(v2, sel_isViewLoaded);
  if (result)
  {
    uint64_t v58 = v11;
    uint64_t v63 = v5;
    uint64_t v64 = v6;
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_24EA05DF8();
    uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B1CF2C0);
    v57[1] = "ibrantSegmentedControl.swift";
    v57[2] = v22;
    sub_24EA05DB8();
    uint64_t v69 = a1;
    long long v23 = (uint64_t *)&v2[qword_26991E890];
    uint64_t v65 = (uint64_t *)&v2[qword_26991E890];
    swift_beginAccess();
    uint64_t v68 = *v23;
    uint64_t v24 = sub_24EA06A58();
    swift_getWitnessTable();
    uint64_t v66 = a1;
    v57[3] = swift_getWitnessTable();
    sub_24EA068C8();
    v57[4] = swift_getWitnessTable();
    sub_24EA06ED8();
    objc_super v25 = *(void (**)(char *, uint64_t))(v14 + 8);
    v25(v17, v13);
    uint64_t v26 = sub_24EA06EA8();
    uint64_t v27 = ((uint64_t (*)(char *, uint64_t))v25)(v19, v13);
    uint64_t v69 = v26;
    MEMORY[0x270FA5388](v27);
    uint64_t v59 = v2;
    uint64_t v28 = v63;
    uint64_t v29 = v64;
    v57[-2] = v63;
    v57[-1] = v29;
    sub_24EA06EB8();
    sub_24EA06A58();
    swift_getWitnessTable();
    uint64_t v30 = sub_24EA06998();
    swift_bridgeObjectRelease();
    uint64_t v69 = v30;
    v57[5] = swift_getWitnessTable();
    uint64_t v31 = sub_24EA06B48();
    uint64_t v69 = *v65;
    MEMORY[0x270FA5388](v69);
    v57[-4] = v28;
    v57[-3] = v29;
    unint64_t v32 = (unint64_t)v59;
    v57[-2] = v31;
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v33 = sub_24EA06DE8();
    swift_bridgeObjectRelease();
    uint64_t v68 = v33;
    uint64_t v34 = sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
    swift_getTupleTypeMetadata2();
    sub_24EA06A18();
    uint64_t v71 = sub_24EA06858();
    MEMORY[0x270FA5388](v71);
    v57[-2] = v32;
    sub_24EA06868();
    sub_24EA069A8();
    uint64_t v35 = swift_bridgeObjectRelease();
    uint64_t v36 = v69;
    uint64_t v69 = v66;
    MEMORY[0x270FA5388](v35);
    v57[-2] = v36;
    v57[-1] = v32;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v39 = sub_24E9CAE88((void (*)(char *, char *))sub_24E9CFB04, (uint64_t)&v57[-4], v24, v34, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v38);
    swift_bridgeObjectRelease();
    uint64_t v40 = v67;
    SidebarTabController.selectedItem.getter(v67);
    uint64_t v41 = v58;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v40, 1, v7) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v40, v61);
      uint64_t v42 = v66;
    }
    else
    {
      uint64_t v43 = v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v62, v40, v7);
      uint64_t v44 = v66;
      uint64_t v68 = v66;
      sub_24EA06BD8();
      uint64_t v42 = v44;
      if (v70 != 1)
      {
        sub_24E9CCF7C(v69);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v7);
        goto LABEL_24;
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v7);
    }
    uint64_t v45 = SidebarTabController.selectedViewController.getter();
    uint64_t v46 = v64;
    if (v45)
    {
      uint64_t v47 = (void *)v45;
      sub_24EA05DB8();
      objc_msgSend(v47, sel_willMoveToParentViewController_, 0);
      uint64_t result = (uint64_t)objc_msgSend(v47, sel_view);
      if (!result) {
        goto LABEL_32;
      }
      uint64_t v48 = (void *)result;
      objc_msgSend((id)result, sel_removeFromSuperview);

      objc_msgSend(v47, sel_removeFromParentViewController);
    }
    unint64_t v49 = v32 + qword_26991E888;
    swift_beginAccess();
    uint64_t v50 = v63;
    if ((*(unsigned char *)(v49 + 8) & 1) != 0
      || (v51 = *(void *)v49, uint64_t result = sub_24E9CF6C0(v51, v42, v63, v46), (result & 1) == 0))
    {
      unint64_t v51 = v32;
      sub_24E9CCF7C(0);
      if ((sub_24E9CF6C0(0, v42, v50, v46) & 1) == 0)
      {
LABEL_24:
        *uint64_t v65 = v42;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        unsigned __int8 v55 = (uint64_t *)(v32 + qword_26991E8A0);
        swift_beginAccess();
        *unsigned __int8 v55 = v39;
        return swift_bridgeObjectRelease();
      }
      if ((v39 & 0xC000000000000001) != 0)
      {
        unint64_t v56 = 0;
LABEL_29:
        id v53 = (id)MEMORY[0x2533463B0](v56, v39);
        goto LABEL_22;
      }
      if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v52 = *(void **)(v39 + 32);
        goto LABEL_21;
      }
      __break(1u);
    }
    else if ((v39 & 0xC000000000000001) == 0)
    {
      if ((v51 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v51 < *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v52 = *(void **)(v39 + 8 * v51 + 32);
LABEL_21:
        id v53 = v52;
LABEL_22:
        id v54 = v53;
        sub_24E9CE3C0(v54, 0);

        goto LABEL_24;
      }
      __break(1u);
LABEL_32:
      __break(1u);
      return result;
    }
    unint64_t v56 = v51;
    goto LABEL_29;
  }
  return result;
}

void sub_24E9CC77C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a3 + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x253346E30](v8);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    a6(v7);
  }
}

uint64_t sub_24E9CC7EC(uint64_t a1)
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24EA05DF8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    uint64_t v4 = &v1[qword_26991E888];
    swift_beginAccess();
    return sub_24E9CD058(a1, (v4[8] & 1) == 0, 0);
  }
  else
  {
    return sub_24E9CCF7C(a1);
  }
}

void sub_24E9CC91C(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x253346E30](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_24E9CC978(v3);
  }
}

uint64_t sub_24E9CC978(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = v1;
    uint64_t result = (uint64_t)objc_msgSend(v1, sel_isViewLoaded);
    if (result)
    {
      uint64_t v3 = SidebarTabController.selectedViewController.getter();
      if (v3)
      {
        uint64_t v4 = (void *)v3;
        self;
        uint64_t v5 = (void *)swift_dynamicCastObjCClass();
        if (v5)
        {
          uint64_t v6 = v5;
          id v7 = objc_msgSend(v5, sel_viewControllers);
          sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
          unint64_t v8 = sub_24EA069D8();

          if (v8 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v9 = sub_24EA06E58();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (v9 != 1)
          {

            if (qword_26B1CD710 != -1) {
              swift_once();
            }
            uint64_t v10 = sub_24EA05DF8();
            __swift_project_value_buffer(v10, (uint64_t)qword_26B1CF2C0);
            sub_24EA05DB8();
            id v11 = objc_msgSend(v6, sel_topViewController);
            if (v11)
            {
              uint64_t v12 = v11;
              id v13 = objc_msgSend(v11, sel_contentScrollViewForEdge_, 1);
              if (v13)
              {
                id v14 = v13;
                objc_msgSend(v13, sel__scrollToTopIfPossible_, 0);

                uint64_t v4 = v14;
              }
            }
          }
        }
      }
      return sub_24E9CD530(v2);
    }
  }
  return result;
}

void sub_24E9CCBA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_24E9CF8B4();
}

Swift::Void __swiftcall SidebarTabController.viewDidLoad()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_viewDidLoad);
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24EA05DF8();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  sub_24EA066F8();
}

void sub_24E9CCCA8(void *a1)
{
  id v1 = a1;
  SidebarTabController.viewDidLoad()();
}

Swift::Void __swiftcall SidebarTabController.viewWillAppear(_:)(Swift::Bool a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for TabBarAction();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v8 - v6;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  objc_msgSendSuper2(&v8, sel_viewWillAppear_, a1);
  sub_24EA06718();
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_24E9CCE48(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  SidebarTabController.viewWillAppear(_:)(a3);
}

void __swiftcall SidebarTabController.contentScrollView(for:)(UIScrollView_optional *__return_ptr retstr, NSDirectionalRectEdge a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = (void *)SidebarTabController.selectedViewController.getter();
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_contentScrollViewForEdge_, a2);
  }
  else
  {
    v7.receiver = v2;
    v7.super_class = ObjectType;
    [(UIScrollView_optional *)&v7 contentScrollViewForEdge:a2];
  }
}

id sub_24E9CCF30(void *a1, uint64_t a2, NSDirectionalRectEdge a3)
{
  id v4 = a1;
  SidebarTabController.contentScrollView(for:)(v5, a3);
  objc_super v7 = v6;

  return v7;
}

uint64_t sub_24E9CCF7C(uint64_t a1)
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24EA05DF8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  uint64_t v4 = v1 + qword_26991E888;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t sub_24E9CD058(uint64_t a1, char a2, uint64_t (*a3)(id))
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24EA05DF8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = MEMORY[0x253346040](v8, v7);
  swift_bridgeObjectRelease();
  if (v9 > a1)
  {
    uint64_t v10 = &v3[qword_26991E888];
    uint64_t result = swift_beginAccess();
    if ((v10[8] & 1) == 0 && *(void *)v10 == a1)
    {
      if (a3) {
        return a3((id)result);
      }
      return result;
    }
    swift_unknownObjectWeakInit();
    uint64_t v18 = sub_24EA05DD8();
    os_log_type_t v19 = sub_24EA06C28();
    BOOL v20 = os_log_type_enabled(v18, v19);
    if (a2)
    {
      if (v20)
      {
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v30 = v22;
        *(_DWORD *)uint64_t v21 = 136315394;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
        uint64_t v23 = sub_24EA06C98();
        sub_24E9CEF50(v23, v24, &v30);
        sub_24EA06CB8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        sub_24EA06CB8();
        os_log_type_t v25 = v19;
        uint64_t v26 = "[SidebarTabController] Transitioning between item %s and %ld without custom animation";
LABEL_17:
        _os_log_impl(&dword_24E9A6000, v18, v25, v26, (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253346D80](v22, -1, -1);
        MEMORY[0x253346D80](v21, -1, -1);
      }
    }
    else if (v20)
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v30 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD740);
      uint64_t v27 = sub_24EA06C98();
      sub_24E9CEF50(v27, v28, &v30);
      sub_24EA06CB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2048;
      sub_24EA06CB8();
      os_log_type_t v25 = v19;
      uint64_t v26 = "[SidebarTabController] Non-animated transition between item %s and %ld";
      goto LABEL_17;
    }

    sub_24E9CEB84((uint64_t)v31, a1, a3);
    return swift_unknownObjectWeakDestroy();
  }
  uint64_t v12 = v3;
  id v13 = sub_24EA05DD8();
  os_log_type_t v14 = sub_24EA06C08();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 134218240;
    sub_24EA06CB8();
    *(_WORD *)(v15 + 12) = 2048;
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x253346040](v16, v7);
    swift_bridgeObjectRelease();
    uint64_t v32 = v17;
    sub_24EA06CB8();

    _os_log_impl(&dword_24E9A6000, v13, v14, "[SidebarTabController] Failed to select item at index out of bounds: %ld. Descriptor count: %ld", (uint8_t *)v15, 0x16u);
    MEMORY[0x253346D80](v15, -1, -1);
  }
  else
  {

    id v13 = v12;
  }

  return sub_24E9CCF7C(a1);
}

uint64_t sub_24E9CD530(void *a1)
{
  uint64_t v1 = *MEMORY[0x263F8EED0] & *a1;
  uint64_t v2 = sub_24EA067D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24EA067F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9B72B4(0, (unint64_t *)&qword_26991E470);
  uint64_t v10 = (void *)sub_24EA06C48();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = *(void *)(v1 + 80);
  v12[3] = *(void *)(v1 + 88);
  v12[4] = v11;
  aBlock[4] = sub_24E9CFA84;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E9FA34C;
  aBlock[3] = &block_descriptor_1;
  id v13 = _Block_copy(aBlock);
  swift_release();
  sub_24EA067E8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24E9BF150();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
  sub_24E9B7350();
  sub_24EA06CF8();
  MEMORY[0x253346260](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24E9CD818@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - v6;
  uint64_t v8 = sub_24EA06EB8();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v17 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v17 - v9, a1, v8);
  LODWORD(v8) = swift_getEnumCaseMultiPayload();
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B1CD740);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  id v13 = &v10[*(int *)(TupleTypeMetadata3 + 48)];
  if (v8 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  else
  {
    int v15 = v10[*(int *)(TupleTypeMetadata3 + 64) + 8];
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v16(v7, v13, v4);
    if (v15 == 1)
    {
      v16(a2, v7, v4);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    }
  }
}

BOOL sub_24E9CDA98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarItemDescriptor();
  sub_24EA07008();
  uint64_t v3 = *(void *)(v2 - 8);
  swift_allocObject();
  sub_24EA069F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, a1, v2);
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B38();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  LOBYTE(v2) = sub_24EA06B78();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

uint64_t sub_24E9CDC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for TabBarItemDescriptor();
  MEMORY[0x270FA5388](v4);
  swift_beginAccess();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t result = sub_24EA06BD8();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    sub_24EA06A88();
    swift_endAccess();
    uint64_t v6 = (uint64_t *)(a3 + qword_26991E8A0);
    uint64_t result = swift_beginAccess();
    uint64_t v7 = *v6;
    if ((*v6 & 0xC000000000000001) == 0)
    {
      if ((v9 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v9 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v8 = *(id *)(v7 + 8 * v9 + 32);
LABEL_6:
        swift_endAccess();
        sub_24E9B72B4(255, (unint64_t *)&unk_26B1CD760);
        swift_getWitnessTable();
        sub_24EA06868();
        return sub_24EA06888();
      }
      __break(1u);
      return result;
    }
    MEMORY[0x2533463B0]();
    goto LABEL_6;
  }
  return result;
}

void sub_24E9CDED4(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v47 = a4;
  id v49 = a2;
  uint64_t v6 = *MEMORY[0x263F8EED0] & *a3;
  uint64_t v7 = sub_24EA05CD8();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v6 + 80);
  uint64_t v44 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v41 - v12;
  uint64_t v14 = *(void *)(v6 + 88);
  uint64_t v15 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v16 = sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x253345E80](v48, a1, v49, v15, v16, WitnessTable);
  id v18 = (id)v48[0];
  if (v48[0])
  {
    os_log_type_t v19 = v47;
LABEL_13:
    *os_log_type_t v19 = v18;
    return;
  }
  uint64_t v42 = v13;
  uint64_t v43 = v10;
  uint64_t v20 = a1 + *(int *)(v15 + 36);
  id v49 = (id)(*(uint64_t (**)(uint64_t))((char *)a3 + qword_26991E8B8))(v20);
  id v21 = objc_msgSend(v49, sel_tabBarItem);
  if (!v21)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v22 = v21;
  uint64_t v23 = v44;
  unint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
  os_log_type_t v25 = v42;
  uint64_t v41 = v20;
  uint64_t v26 = v20;
  uint64_t v27 = v11;
  v24(v42, v26, v11);
  uint64_t v28 = sub_24EA06718();
  MEMORY[0x270FA5388](v28);
  *(&v41 - 2) = v11;
  *(&v41 - 1) = v14;
  swift_getKeyPath();
  uint64_t v29 = v43;
  sub_24EA06798();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 88))(v29, v27, v14);
  uint64_t v31 = v30;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v46);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v27);
  if (v31)
  {
    uint64_t v32 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = 0;
  }
  objc_msgSend(v22, sel_setTitle_, v32);

  if (((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 48))(v27, v14) & 1) == 0
    || ((*(void (**)(uint64_t, uint64_t))(v14 + 80))(v27, v14), !v33))
  {
LABEL_11:
    id v38 = objc_msgSend(v49, sel_tabBarItem);
    if (v38)
    {
      uint64_t v39 = v38;
      v48[0] = 0;
      v48[1] = 0xE000000000000000;
      sub_24EA06D78();
      sub_24EA06978();
      sub_24EA07018();
      uint64_t v40 = (void *)sub_24EA06908();
      swift_bridgeObjectRelease();
      objc_msgSend(v39, sel_setAccessibilityIdentifier_, v40);

      os_log_type_t v19 = v47;
      id v18 = v49;
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  id v34 = objc_msgSend(v49, sel_tabBarItem);
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
    id v37 = objc_msgSend(self, sel_systemImageNamed_, v36);

    objc_msgSend(v35, sel_setImage_, v37);
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
}

id sub_24E9CE3C0(void *a1, uint64_t (*a2)(id))
{
  uint64_t v3 = v2;
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24EA05DF8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  objc_msgSend(v2, sel_addChildViewController_, a1);
  id result = objc_msgSend(v2, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = result;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = result;
  objc_msgSend(v8, sel_addSubview_, result);

  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  char v10 = result;
  objc_msgSend(result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD820);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_24EA09540;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v12 = result;
  id v13 = objc_msgSend(result, sel_topAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v14 = result;
  id v15 = objc_msgSend(result, sel_topAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v11 + 32) = v16;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v17 = result;
  id v18 = objc_msgSend(result, sel_bottomAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  os_log_type_t v19 = result;
  id v20 = objc_msgSend(result, sel_bottomAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v11 + 40) = v21;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v22 = result;
  id v23 = objc_msgSend(result, sel_leadingAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v24 = result;
  id v25 = objc_msgSend(result, sel_leadingAnchor);

  id v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);
  *(void *)(v11 + 48) = v26;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v27 = result;
  id v28 = objc_msgSend(result, sel_trailingAnchor);

  id result = objc_msgSend(v3, sel_view);
  if (!result)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  uint64_t v29 = result;
  uint64_t v30 = self;
  id v31 = objc_msgSend(v29, sel_trailingAnchor);

  id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(void *)(v11 + 56) = v32;
  sub_24EA069E8();
  sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD770);
  uint64_t v33 = (void *)sub_24EA069C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v33);

  objc_msgSend(v3, sel_setAdditionalSafeAreaInsets_, 100.0, 0.0, 0.0, 0.0);
  objc_msgSend(a1, sel_didMoveToParentViewController_, v3);
  id result = objc_msgSend(a1, sel_setNeedsFocusUpdate);
  if (a2) {
    return (id)a2(result);
  }
  return result;
}

void sub_24E9CE8A8(uint64_t (*a1)(id))
{
  uint64_t v2 = (void *)SidebarTabController.selectedViewController.getter();
  if (v2)
  {
    id v3 = v2;
    sub_24E9CF5A8(v2, a1);
  }
  else if (a1)
  {
    ((void (*)(void))a1)();
  }
}

void sub_24E9CE92C(uint64_t (*a1)(id))
{
  uint64_t v2 = (void *)SidebarTabController.selectedViewController.getter();
  if (v2)
  {
    id v3 = v2;
    sub_24E9CE3C0(v2, a1);
  }
  else if (a1)
  {
    ((void (*)(void))a1)();
  }
}

id SidebarTabController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SidebarTabController.init(nibName:bundle:)()
{
}

void sub_24E9CEA68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  sub_24E9CF9A0();
}

id SidebarTabController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24E9CEB14()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_24E9CEB84(uint64_t a1, uint64_t a2, uint64_t (*a3)(id))
{
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x253346E30](a1);
  if (v6)
  {
    id v7 = (void *)v6;
    sub_24E9CE8A8(0);
  }
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x253346E30](a1);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_24E9CCF7C(a2);
  }
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x253346E30](a1);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    sub_24E9CE92C(a3);
  }
  swift_beginAccess();
  uint64_t v12 = (void *)MEMORY[0x253346E30](a1);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v12, sel_view);

    if (v14)
    {
      objc_msgSend(v14, sel_layoutIfNeeded);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_24E9CECB8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TabBarAction();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - v4;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253346E30](a1 + 16);
  if (result)
  {
    id v7 = (void *)result;
    swift_retain();

    sub_24EA06718();
    swift_release();
    swift_storeEnumTagMultiPayload();
    sub_24EA067A8();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_24E9CEDF4()
{
  return 24;
}

uint64_t sub_24E9CEE00()
{
  return swift_release();
}

uint64_t sub_24E9CEE08(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  return swift_retain();
}

__n128 sub_24E9CEE28(__n128 *a1, uint64_t a2)
{
  *(void *)a2 = a1[1].n128_u64[0];
  __n128 result = *a1;
  *(__n128 *)(a2 + 8) = *a1;
  return result;
}

uint64_t sub_24E9CEE3C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24E9CEE74(uint64_t a1, uint64_t *a2)
{
  sub_24E9CC77C(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9CBDB8);
}

uint64_t sub_24E9CEEAC()
{
  return 24;
}

uint64_t sub_24E9CEEC0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_24E9CEEF8(uint64_t a1, uint64_t *a2)
{
  sub_24E9CC77C(a1, a2, v2[4], v2[2], v2[3], (void (*)(uint64_t))sub_24E9CC7EC);
}

uint64_t sub_24E9CEF30()
{
  return 24;
}

void sub_24E9CEF44(uint64_t a1, unsigned __int8 *a2)
{
  sub_24E9CC91C(a1, a2, *(void *)(v2 + 32));
}

uint64_t sub_24E9CEF50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E9CF024(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E9CA9D8((uint64_t)v12, *a3);
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
      sub_24E9CA9D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24E9CF024(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24EA06CC8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E9CF1E0(a5, a6);
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
  uint64_t v8 = sub_24EA06DD8();
  if (!v8)
  {
    sub_24EA06E38();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24EA06E98();
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

uint64_t sub_24E9CF1E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E9CF278(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E9CF458(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E9CF458(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E9CF278(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E9CF3F0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24EA06D88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24EA06E38();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24EA06988();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24EA06E98();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24EA06E38();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E9CF3F0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26991E948);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E9CF458(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26991E948);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_24EA06E98();
  __break(1u);
  return result;
}

id sub_24E9CF5A8(void *a1, uint64_t (*a2)(id))
{
  if (qword_26B1CD710 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24EA05DF8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B1CF2C0);
  sub_24EA05DB8();
  objc_msgSend(a1, sel_willMoveToParentViewController_, 0);
  id result = objc_msgSend(a1, sel_view);
  if (result)
  {
    unint64_t v6 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    id result = objc_msgSend(a1, sel_removeFromParentViewController);
    if (a2) {
      return (id)a2(result);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E9CF6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)v16 - v10;
  *(void *)&long long v17 = a2;
  sub_24EA06A58();
  swift_getWitnessTable();
  sub_24EA06B58();
  long long v17 = v18;
  v16[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
  if ((sub_24EA06BF8() & 1) != 0
    && (sub_24EA06A88(), char v12 = *v11, (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8), (v12 & 1) == 0))
  {
    sub_24EA06A88();
    id v14 = &v11[*(int *)(v8 + 36)];
    char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
    (*(void (**)(char *, uint64_t))(*(void *)(a3 - 8) + 8))(v14, a3);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

void sub_24E9CF8B4()
{
  uint64_t v1 = &v0[qword_26991E888];
  *(void *)uint64_t v1 = 0;
  v1[8] = 1;
  uint64_t v2 = qword_26991E890;
  type metadata accessor for TabBarItemDescriptor();
  *(void *)&v0[v2] = sub_24EA06A18();
  *(void *)&v0[qword_26991E8A0] = MEMORY[0x263F8EE78];

  sub_24EA06E48();
  __break(1u);
}

void sub_24E9CF9A0()
{
}

uint64_t sub_24E9CF9D0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SidebarTabController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for SidebarTabController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SidebarTabController);
}

uint64_t dispatch thunk of SidebarTabController.__allocating_init(store:viewBuilder:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_24E9CFA84()
{
  return sub_24E9CECB8(*(void *)(v0 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_24E9CFAA8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_24E9CD818(a1, a2);
}

BOOL sub_24E9CFAC4(uint64_t a1)
{
  return sub_24E9CDA98(a1);
}

uint64_t sub_24E9CFAE8(uint64_t a1, uint64_t a2)
{
  return sub_24E9CDC5C(a1, a2, *(void *)(v2 + 16));
}

void sub_24E9CFB04(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_24E9CDED4(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_24E9CFB48(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024EA162C0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74497463656C6573 && a2 == 0xEA00000000006D65 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E497463656C6573 && a2 == 0xEB00000000786564 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x800000024EA162E0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_24E9CFD78(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74497463656C6573;
      break;
    case 2:
      unint64_t result = 0x6E497463656C6573;
      break;
    case 3:
      unint64_t result = 0xD000000000000024;
      break;
    case 4:
      unint64_t result = 0x6570704177656976;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E9CFE40()
{
  return sub_24E9CFD78(*v0);
}

uint64_t sub_24E9CFE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9CFB48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9CFE7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9CFED0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9CFF24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9AA58C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9CFF58@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E9A8FBC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24E9CFF88(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9CFFDC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D0030@<X0>(uint64_t a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24E9D0240(a1, (uint64_t (*)(void, void))sub_24E9A8FBC, a2);
}

uint64_t sub_24E9D0048(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D009C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D00F0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D0144(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D0198(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D01EC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D0240@<X0>(uint64_t a1@<X2>, uint64_t (*a2)(void, void)@<X4>, unsigned char *a3@<X8>)
{
  char v4 = a2(*(void *)(a1 + 16), *(void *)(a1 + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_24E9D028C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D02E0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t TabBarAction.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v76 = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v6 = type metadata accessor for TabBarAction.ViewAppearedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v72 = v6;
  uint64_t v7 = sub_24EA06FF8();
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v67 = (char *)&v46 - v8;
  uint64_t v9 = type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys();
  uint64_t v65 = swift_getWitnessTable();
  uint64_t v66 = v9;
  uint64_t v10 = sub_24EA06FF8();
  uint64_t v63 = *(void *)(v10 - 8);
  uint64_t v64 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v62 = (char *)&v46 - v11;
  uint64_t v12 = type metadata accessor for TabBarAction.SelectIndexCodingKeys();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v59 = v12;
  uint64_t v57 = v13;
  uint64_t v14 = sub_24EA06FF8();
  uint64_t v60 = *(void *)(v14 - 8);
  uint64_t v61 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v58 = (char *)&v46 - v15;
  uint64_t v16 = type metadata accessor for TabBarAction.SelectItemCodingKeys();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v53 = v16;
  uint64_t v51 = v17;
  uint64_t v56 = sub_24EA06FF8();
  uint64_t v55 = *(void *)(v56 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v56);
  uint64_t v52 = (char *)&v46 - v19;
  uint64_t v54 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v50 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TabBarAction.HandleActionAtIndexCodingKeys();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v49 = sub_24EA06FF8();
  uint64_t v48 = *(void *)(v49 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v49);
  uint64_t v47 = (char *)&v46 - v22;
  uint64_t v23 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v21);
  id v25 = (char *)&v46 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v4;
  type metadata accessor for TabBarAction.CodingKeys();
  swift_getWitnessTable();
  uint64_t v26 = sub_24EA06FF8();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v74 = v26;
  uint64_t v75 = v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v46 - v28;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v73 = v29;
  sub_24EA070A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v77, v76);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v35 = v54;
      uint64_t v36 = v50;
      (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v50, v25, v3);
      char v79 = 1;
      id v37 = v52;
      id v32 = v73;
      uint64_t v31 = v74;
      sub_24EA06F98();
      uint64_t v38 = v56;
      sub_24EA06FE8();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v38);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v3);
      return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v32, v31);
    case 2u:
      char v80 = 2;
      uint64_t v30 = v58;
      id v32 = v73;
      uint64_t v31 = v74;
      sub_24EA06F98();
      uint64_t v33 = v61;
      sub_24EA06FD8();
      uint64_t v34 = v60;
      goto LABEL_5;
    case 3u:
      char v81 = 3;
      uint64_t v40 = v62;
      uint64_t v42 = v73;
      uint64_t v41 = v74;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v40, v64);
      return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v42, v41);
    case 4u:
      char v82 = 4;
      uint64_t v43 = v67;
      uint64_t v44 = v73;
      uint64_t v45 = v74;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v43, v70);
      return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v44, v45);
    default:
      char v78 = 0;
      uint64_t v30 = v47;
      id v32 = v73;
      uint64_t v31 = v74;
      sub_24EA06F98();
      uint64_t v33 = v49;
      sub_24EA06FD8();
      uint64_t v34 = v48;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v33);
      return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v32, v31);
  }
}

uint64_t type metadata accessor for TabBarAction.ViewAppearedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TabBarAction.SelectIndexCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TabBarAction.SelectItemCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TabBarAction.HandleActionAtIndexCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TabBarAction.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TabBarAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v86 = a4;
  uint64_t v99 = type metadata accessor for TabBarAction.ViewAppearedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = sub_24EA06F88();
  uint64_t v97 = *(void *)(v7 - 8);
  uint64_t v98 = v7;
  MEMORY[0x270FA5388](v7);
  v84 = (char *)&v69 - v8;
  uint64_t v9 = type metadata accessor for TabBarAction.ScrolledToSelectedIndexContentOffsetCodingKeys();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v95 = v9;
  uint64_t v93 = v10;
  uint64_t v94 = sub_24EA06F88();
  uint64_t v79 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  uint64_t v83 = (char *)&v69 - v11;
  uint64_t v12 = type metadata accessor for TabBarAction.SelectIndexCodingKeys();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v92 = v12;
  uint64_t v91 = v13;
  uint64_t v78 = sub_24EA06F88();
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  char v82 = (char *)&v69 - v14;
  uint64_t v15 = type metadata accessor for TabBarAction.SelectItemCodingKeys();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v90 = v15;
  uint64_t v89 = v16;
  uint64_t v76 = sub_24EA06F88();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  char v81 = (char *)&v69 - v17;
  uint64_t v18 = type metadata accessor for TabBarAction.HandleActionAtIndexCodingKeys();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v88 = v18;
  uint64_t v87 = v19;
  uint64_t v75 = sub_24EA06F88();
  uint64_t v73 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  char v80 = (char *)&v69 - v20;
  type metadata accessor for TabBarAction.CodingKeys();
  uint64_t v106 = swift_getWitnessTable();
  uint64_t v102 = sub_24EA06F88();
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v22 = (char *)&v69 - v21;
  uint64_t v103 = a2;
  uint64_t v104 = a3;
  uint64_t v23 = type metadata accessor for TabBarAction();
  uint64_t v85 = *(void *)(v23 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (uint64_t *)((char *)&v69 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v69 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  id v32 = (uint64_t *)((char *)&v69 - v31);
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v69 - v33;
  uint64_t v35 = a1;
  uint64_t v36 = a1[3];
  unsigned int v105 = v35;
  __swift_project_boxed_opaque_existential_1(v35, v36);
  unsigned int v101 = v22;
  uint64_t v37 = v111;
  sub_24EA07098();
  if (v37) {
    goto LABEL_7;
  }
  uint64_t v70 = v32;
  uint64_t v72 = v29;
  uint64_t v71 = v26;
  uint64_t v106 = (uint64_t)v34;
  uint64_t v111 = v23;
  uint64_t v39 = v101;
  uint64_t v38 = v102;
  *(void *)&long long v107 = sub_24EA06F78();
  sub_24EA06A58();
  swift_getWitnessTable();
  *(void *)&long long v109 = sub_24EA06CE8();
  *((void *)&v109 + 1) = v40;
  *(void *)&long long v110 = v41;
  *((void *)&v110 + 1) = v42;
  sub_24EA06CD8();
  swift_getWitnessTable();
  sub_24EA06BA8();
  if (v107 == 5 || (long long v69 = v109, v107 = v109, v108 = v110, (sub_24EA06BC8() & 1) == 0))
  {
    uint64_t v48 = sub_24EA06DC8();
    swift_allocError();
    uint64_t v50 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *uint64_t v50 = v111;
    sub_24EA06F18();
    sub_24EA06DB8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v48 - 8) + 104))(v50, *MEMORY[0x263F8DCB0], v48);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v38);
LABEL_7:
    uint64_t v51 = (uint64_t)v105;
    return __swift_destroy_boxed_opaque_existential_1(v51);
  }
  uint64_t v43 = v98;
  uint64_t v44 = v97;
  uint64_t v45 = v94;
  switch((int)v98)
  {
    case 1:
      LOBYTE(v107) = 1;
      uint64_t v53 = v81;
      sub_24EA06F08();
      uint64_t v54 = v72;
      uint64_t v55 = v76;
      sub_24EA06F68();
      uint64_t v56 = v100;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v53, v55);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v39, v38);
      uint64_t v66 = v111;
      swift_storeEnumTagMultiPayload();
      uint64_t v67 = v85;
      uint64_t v68 = v106;
      (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))(v106, v54, v66);
      goto LABEL_15;
    case 2:
      LOBYTE(v107) = 2;
      uint64_t v57 = v82;
      sub_24EA06F08();
      uint64_t v58 = v78;
      uint64_t v63 = sub_24EA06F58();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v57, v58);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v38);
      uint64_t v65 = v71;
      *uint64_t v71 = v63;
      uint64_t v66 = v111;
      goto LABEL_14;
    case 3:
      LOBYTE(v107) = 3;
      uint64_t v59 = v83;
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v59, v45);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v38);
      uint64_t v68 = v106;
      uint64_t v66 = v111;
      goto LABEL_13;
    case 4:
      LOBYTE(v107) = 4;
      uint64_t v60 = v84;
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v60, v43);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v38);
      uint64_t v68 = v106;
      uint64_t v66 = v111;
LABEL_13:
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = (uint64_t)v105;
      uint64_t v62 = v86;
      uint64_t v67 = v85;
      break;
    default:
      LOBYTE(v107) = 0;
      uint64_t v46 = v80;
      sub_24EA06F08();
      uint64_t v47 = v75;
      uint64_t v64 = sub_24EA06F58();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v46, v47);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v38);
      uint64_t v65 = v70;
      uint64_t *v70 = v64;
      uint64_t v66 = v111;
LABEL_14:
      swift_storeEnumTagMultiPayload();
      uint64_t v67 = v85;
      uint64_t v68 = v106;
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(v85 + 32))(v106, v65, v66);
LABEL_15:
      uint64_t v61 = (uint64_t)v105;
      uint64_t v62 = v86;
      break;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v62, v68, v66);
  uint64_t v51 = v61;
  return __swift_destroy_boxed_opaque_existential_1(v51);
}

uint64_t type metadata accessor for TabBarAction()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9D1988@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return TabBarAction.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E9D19A8(void *a1, uint64_t a2)
{
  return TabBarAction.encode(to:)(a1, a2);
}

uint64_t TabBarAction.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, a2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
      sub_24EA07058();
      sub_24EA068A8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      break;
    case 3u:
    case 4u:
      goto LABEL_4;
    default:
      sub_24EA07058();
LABEL_4:
      uint64_t result = sub_24EA07058();
      break;
  }
  return result;
}

uint64_t static TabBarAction.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v33 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = v5;
  uint64_t v6 = type metadata accessor for TabBarAction();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v34 = (char *)&v30 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v30 - v13);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v16 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v19 = (char *)&v30 - v18;
  uint64_t v20 = (char *)&v30 + *(int *)(v17 + 48) - v18;
  uint64_t v35 = v7;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21((char *)&v30 - v18, v36, v6);
  v21(v20, v37, v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v23 = v34;
      v21(v34, (uint64_t)v19, v6);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v24 = v33;
        uint64_t v25 = v31;
        (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v31, v20, a3);
        uint64_t v26 = v23;
        char v27 = sub_24EA068D8();
        uint64_t v28 = *(void (**)(char *, uint64_t))(v24 + 8);
        v28(v25, a3);
        v28(v26, a3);
        goto LABEL_13;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v23, a3);
      goto LABEL_15;
    case 2u:
      v21((char *)v10, (uint64_t)v19, v6);
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_15;
      }
      uint64_t v22 = *v10;
      goto LABEL_8;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_15;
      }
      goto LABEL_12;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_15;
      }
LABEL_12:
      char v27 = 1;
      goto LABEL_13;
    default:
      v21((char *)v14, (uint64_t)v19, v6);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_15:
        char v27 = 0;
      }
      else
      {
        uint64_t v22 = *v14;
LABEL_8:
        char v27 = v22 == *(void *)v20;
LABEL_13:
        uint64_t v16 = v35;
        TupleTypeMetadata2 = v6;
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, TupleTypeMetadata2);
      return v27 & 1;
  }
}

uint64_t TabBarAction.hashValue.getter(uint64_t a1)
{
  sub_24EA07048();
  TabBarAction.hash(into:)((uint64_t)v3, a1);
  return sub_24EA07088();
}

uint64_t sub_24E9D2030(uint64_t a1, uint64_t a2)
{
  sub_24EA07048();
  TabBarAction.hash(into:)((uint64_t)v4, a2);
  return sub_24EA07088();
}

uint64_t sub_24E9D2074()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D2090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static TabBarAction.== infix(_:_:)(a1, a2, *(void *)(a3 + 16));
}

uint64_t sub_24E9D209C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_24E9D2138(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v5 > 3)
  {
    unint64_t v6 = v5 + 1;
    int v7 = *(_DWORD *)(v4 + 80);
    int v8 = v7 & 0x1000F8;
    goto LABEL_9;
  }
  unsigned int v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  int v7 = *(_DWORD *)(v4 + 80);
  if (v9 > 0xFFFC)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0) {
      goto LABEL_27;
    }
    unsigned int v11 = *(_DWORD *)&a2[v5];
    unsigned int v12 = v11 - 3;
    if (v11 < 3) {
      goto LABEL_40;
    }
    goto LABEL_30;
  }
  int v8 = v7 & 0x1000F8;
  if (v9 > 0xFC)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0) {
      goto LABEL_27;
    }
    unsigned int v11 = *(unsigned __int16 *)&a2[v5];
    unsigned int v12 = v11 - 3;
    if (v11 < 3) {
      goto LABEL_40;
    }
LABEL_30:
    if (v5 <= 3) {
      uint64_t v17 = v5;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *a2;
        goto LABEL_38;
      case 2:
        int v18 = *(unsigned __int16 *)a2;
        goto LABEL_38;
      case 3:
        int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_38;
      case 4:
        int v18 = *(_DWORD *)a2;
LABEL_38:
        int v19 = (v18 | (v12 << (8 * v5))) + 3;
        unsigned int v11 = v18 + 3;
        if (v5 < 4) {
          unsigned int v11 = v19;
        }
        break;
      default:
        goto LABEL_40;
    }
    goto LABEL_40;
  }
  unint64_t v6 = v5 + 1;
LABEL_9:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    uint64_t v15 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v15 + (((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)));
    swift_retain();
    return v3;
  }
  unsigned int v11 = a2[v5];
  unsigned int v12 = v11 - 3;
  if (v11 >= 3) {
    goto LABEL_30;
  }
LABEL_40:
  if (v11 == 2)
  {
    *(void *)__dst = *(void *)a2;
    if (v5 <= 3)
    {
      unsigned int v20 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v20 > 0xFFFC)
      {
        int v21 = 2;
        goto LABEL_63;
      }
      if (v20 > 0xFC)
      {
        LOWORD(v21) = 2;
        goto LABEL_66;
      }
    }
    __dst[v5] = 2;
    return v3;
  }
  if (v11 == 1)
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 > 3)
    {
LABEL_52:
      *((unsigned char *)v3 + v5) = 1;
      return v3;
    }
    int v21 = 1;
    unsigned int v22 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v22 <= 0xFFFC)
    {
      if (v22 <= 0xFC) {
        goto LABEL_52;
      }
LABEL_66:
      *(_WORD *)((char *)v3 + v5) = v21;
      return v3;
    }
LABEL_63:
    *(_DWORD *)((char *)v3 + v5) = v21;
    return v3;
  }
  if (v11)
  {
    if (v5 > 3) {
      goto LABEL_57;
    }
    unsigned int v23 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    uint64_t v24 = 2;
    if (v23 > 0xFFFC) {
      uint64_t v24 = 4;
    }
    if (v23 <= 0xFC) {
LABEL_57:
    }
      uint64_t v24 = 1;
    memcpy(__dst, a2, v24 + v5);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    if (v5 > 3) {
      goto LABEL_44;
    }
    unsigned int v25 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v25 > 0xFFFC)
    {
      *(_DWORD *)&__dst[v5] = 0;
      return v3;
    }
    if (v25 <= 0xFC) {
LABEL_44:
    }
      __dst[v5] = 0;
    else {
      *(_WORD *)&__dst[v5] = 0;
    }
  }
  return v3;
}

unsigned __int8 *sub_24E9D245C(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  if (v2 <= 3)
  {
    unsigned int v5 = ((1 << (8 * v2)) + 1) >> (8 * v2);
    if (v5 > 0xFFFC)
    {
      unsigned int v3 = *(_DWORD *)&result[v2];
      unsigned int v4 = v3 - 3;
      if (v3 >= 3) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    if (v5 > 0xFC)
    {
      unsigned int v3 = *(unsigned __int16 *)&result[v2];
      unsigned int v4 = v3 - 3;
      if (v3 >= 3) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 3;
  if (v3 >= 3)
  {
LABEL_12:
    if (v2 <= 3) {
      uint64_t v6 = v2;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *result;
        goto LABEL_20;
      case 2:
        int v7 = *(unsigned __int16 *)result;
        goto LABEL_20;
      case 3:
        int v7 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_20;
      case 4:
        int v7 = *(_DWORD *)result;
LABEL_20:
        int v8 = (v7 | (v4 << (8 * v2))) + 3;
        int v9 = v7 + 3;
        if (v2 < 4) {
          int v9 = v8;
        }
        if (v9 == 1) {
          return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
        }
        return result;
      default:
        return result;
    }
  }
LABEL_9:
  if (v3 == 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

char *sub_24E9D25B0(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_7;
  }
  unsigned int v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFC)
  {
    unsigned int v6 = *(_DWORD *)&a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  if (v5 > 0xFC)
  {
    unsigned int v6 = *(unsigned __int16 *)&a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_7:
    unsigned int v6 = a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
  }
LABEL_12:
  if (v4 <= 3) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = 4;
  }
  switch(v8)
  {
    case 1:
      int v9 = *a2;
      goto LABEL_20;
    case 2:
      int v9 = *(unsigned __int16 *)a2;
      goto LABEL_20;
    case 3:
      int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      goto LABEL_20;
    case 4:
      int v9 = *(_DWORD *)a2;
LABEL_20:
      int v10 = (v9 | (v7 << (8 * v4))) + 3;
      unsigned int v6 = v9 + 3;
      if (v4 < 4) {
        unsigned int v6 = v10;
      }
      break;
    default:
      break;
  }
LABEL_22:
  if (v6 == 2)
  {
    *(void *)__dst = *(void *)a2;
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFC)
      {
        int v12 = 2;
        goto LABEL_45;
      }
      if (v11 > 0xFC)
      {
        LOWORD(v12) = 2;
        goto LABEL_48;
      }
    }
    __dst[v4] = 2;
    return __dst;
  }
  if (v6 == 1)
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(__dst);
    if (v4 > 3)
    {
LABEL_34:
      __dst[v4] = 1;
      return __dst;
    }
    int v12 = 1;
    unsigned int v13 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v13 <= 0xFFFC)
    {
      if (v13 <= 0xFC) {
        goto LABEL_34;
      }
LABEL_48:
      *(_WORD *)&__dst[v4] = v12;
      return __dst;
    }
LABEL_45:
    *(_DWORD *)&__dst[v4] = v12;
    return __dst;
  }
  if (v6)
  {
    if (v4 > 3) {
      goto LABEL_39;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v15 = 2;
    if (v14 > 0xFFFC) {
      uint64_t v15 = 4;
    }
    if (v14 <= 0xFC) {
LABEL_39:
    }
      uint64_t v15 = 1;
    memcpy(__dst, a2, v15 + v4);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    if (v4 > 3) {
      goto LABEL_26;
    }
    unsigned int v16 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v16 > 0xFFFC)
    {
      *(_DWORD *)&__dst[v4] = 0;
      return __dst;
    }
    if (v16 <= 0xFC) {
LABEL_26:
    }
      __dst[v4] = 0;
    else {
      *(_WORD *)&__dst[v4] = 0;
    }
  }
  return __dst;
}

char *sub_24E9D285C(char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst == (char *)__src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v9 = ((1 << v8) + 1) >> v8;
    if (v9 > 0xFFFC)
    {
      unsigned int v10 = *(_DWORD *)&__dst[v7];
      unsigned int v11 = v10 - 3;
      if (v10 < 3) {
        goto LABEL_9;
      }
    }
    else
    {
      if (v9 <= 0xFC) {
        goto LABEL_8;
      }
      unsigned int v10 = *(unsigned __int16 *)&__dst[v7];
      unsigned int v11 = v10 - 3;
      if (v10 < 3) {
        goto LABEL_9;
      }
    }
LABEL_14:
    if (v7 <= 3) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *__dst;
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)__dst;
        goto LABEL_22;
      case 3:
        int v13 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
        goto LABEL_22;
      case 4:
        int v13 = *(_DWORD *)__dst;
LABEL_22:
        int v14 = (v13 | (v11 << v8)) + 3;
        int v15 = v13 + 3;
        if (v7 < 4) {
          int v15 = v14;
        }
        if (v15 == 1) {
          goto LABEL_25;
        }
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
  }
LABEL_8:
  unsigned int v10 = __dst[v7];
  unsigned int v11 = v10 - 3;
  if (v10 >= 3) {
    goto LABEL_14;
  }
LABEL_9:
  if (v10 == 1) {
LABEL_25:
  }
    (*(void (**)(char *, uint64_t))(v6 + 8))(__dst, v5);
  if (v7 > 3) {
    goto LABEL_29;
  }
LABEL_26:
  unsigned int v16 = ((1 << v8) + 1) >> v8;
  if (v16 > 0xFFFC)
  {
    unsigned int v17 = *(_DWORD *)&__src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
    goto LABEL_34;
  }
  if (v16 > 0xFC)
  {
    unsigned int v17 = *(unsigned __int16 *)&__src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
  }
  else
  {
LABEL_29:
    unsigned int v17 = __src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
  }
LABEL_34:
  if (v7 <= 3) {
    uint64_t v19 = v7;
  }
  else {
    uint64_t v19 = 4;
  }
  switch(v19)
  {
    case 1:
      int v20 = *__src;
      goto LABEL_42;
    case 2:
      int v20 = *(unsigned __int16 *)__src;
      goto LABEL_42;
    case 3:
      int v20 = *(unsigned __int16 *)__src | (__src[2] << 16);
      goto LABEL_42;
    case 4:
      int v20 = *(_DWORD *)__src;
LABEL_42:
      int v21 = (v20 | (v18 << v8)) + 3;
      unsigned int v17 = v20 + 3;
      if (v7 < 4) {
        unsigned int v17 = v21;
      }
      break;
    default:
      break;
  }
LABEL_44:
  if (v17 == 2)
  {
    *(void *)__dst = *(void *)__src;
    if (v7 <= 3)
    {
      unsigned int v22 = ((1 << v8) + 1) >> v8;
      if (v22 > 0xFFFC)
      {
        int v23 = 2;
        goto LABEL_67;
      }
      if (v22 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_70;
      }
    }
    __dst[v7] = 2;
    return __dst;
  }
  if (v17 == 1)
  {
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
    if (v7 > 3)
    {
LABEL_56:
      __dst[v7] = 1;
      return __dst;
    }
    int v23 = 1;
    unsigned int v24 = ((1 << v8) + 1) >> v8;
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC) {
        goto LABEL_56;
      }
LABEL_70:
      *(_WORD *)&__dst[v7] = v23;
      return __dst;
    }
LABEL_67:
    *(_DWORD *)&__dst[v7] = v23;
    return __dst;
  }
  if (v17)
  {
    if (v7 > 3) {
      goto LABEL_61;
    }
    unsigned int v25 = ((1 << v8) + 1) >> v8;
    uint64_t v26 = 2;
    if (v25 > 0xFFFC) {
      uint64_t v26 = 4;
    }
    if (v25 <= 0xFC) {
LABEL_61:
    }
      uint64_t v26 = 1;
    memcpy(__dst, __src, v26 + v7);
  }
  else
  {
    *(void *)__dst = *(void *)__src;
    if (v7 > 3) {
      goto LABEL_48;
    }
    unsigned int v27 = ((1 << v8) + 1) >> v8;
    if (v27 > 0xFFFC)
    {
      *(_DWORD *)&__dst[v7] = 0;
      return __dst;
    }
    if (v27 <= 0xFC) {
LABEL_48:
    }
      __dst[v7] = 0;
    else {
      *(_WORD *)&__dst[v7] = 0;
    }
  }
  return __dst;
}

char *sub_24E9D2C1C(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_7;
  }
  unsigned int v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFC)
  {
    unsigned int v6 = *(_DWORD *)&a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  if (v5 > 0xFC)
  {
    unsigned int v6 = *(unsigned __int16 *)&a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_7:
    unsigned int v6 = a2[v4];
    unsigned int v7 = v6 - 3;
    if (v6 < 3) {
      goto LABEL_22;
    }
  }
LABEL_12:
  if (v4 <= 3) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = 4;
  }
  switch(v8)
  {
    case 1:
      int v9 = *a2;
      goto LABEL_20;
    case 2:
      int v9 = *(unsigned __int16 *)a2;
      goto LABEL_20;
    case 3:
      int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      goto LABEL_20;
    case 4:
      int v9 = *(_DWORD *)a2;
LABEL_20:
      int v10 = (v9 | (v7 << (8 * v4))) + 3;
      unsigned int v6 = v9 + 3;
      if (v4 < 4) {
        unsigned int v6 = v10;
      }
      break;
    default:
      break;
  }
LABEL_22:
  if (v6 == 2)
  {
    *(void *)__dst = *(void *)a2;
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFC)
      {
        int v12 = 2;
        goto LABEL_45;
      }
      if (v11 > 0xFC)
      {
        LOWORD(v12) = 2;
        goto LABEL_48;
      }
    }
    __dst[v4] = 2;
    return __dst;
  }
  if (v6 == 1)
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(__dst);
    if (v4 > 3)
    {
LABEL_34:
      __dst[v4] = 1;
      return __dst;
    }
    int v12 = 1;
    unsigned int v13 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v13 <= 0xFFFC)
    {
      if (v13 <= 0xFC) {
        goto LABEL_34;
      }
LABEL_48:
      *(_WORD *)&__dst[v4] = v12;
      return __dst;
    }
LABEL_45:
    *(_DWORD *)&__dst[v4] = v12;
    return __dst;
  }
  if (v6)
  {
    if (v4 > 3) {
      goto LABEL_39;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v15 = 2;
    if (v14 > 0xFFFC) {
      uint64_t v15 = 4;
    }
    if (v14 <= 0xFC) {
LABEL_39:
    }
      uint64_t v15 = 1;
    memcpy(__dst, a2, v15 + v4);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    if (v4 > 3) {
      goto LABEL_26;
    }
    unsigned int v16 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v16 > 0xFFFC)
    {
      *(_DWORD *)&__dst[v4] = 0;
      return __dst;
    }
    if (v16 <= 0xFC) {
LABEL_26:
    }
      __dst[v4] = 0;
    else {
      *(_WORD *)&__dst[v4] = 0;
    }
  }
  return __dst;
}

char *sub_24E9D2EC8(char *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst == (char *)__src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v9 = ((1 << v8) + 1) >> v8;
    if (v9 > 0xFFFC)
    {
      unsigned int v10 = *(_DWORD *)&__dst[v7];
      unsigned int v11 = v10 - 3;
      if (v10 < 3) {
        goto LABEL_9;
      }
    }
    else
    {
      if (v9 <= 0xFC) {
        goto LABEL_8;
      }
      unsigned int v10 = *(unsigned __int16 *)&__dst[v7];
      unsigned int v11 = v10 - 3;
      if (v10 < 3) {
        goto LABEL_9;
      }
    }
LABEL_14:
    if (v7 <= 3) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *__dst;
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)__dst;
        goto LABEL_22;
      case 3:
        int v13 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
        goto LABEL_22;
      case 4:
        int v13 = *(_DWORD *)__dst;
LABEL_22:
        int v14 = (v13 | (v11 << v8)) + 3;
        int v15 = v13 + 3;
        if (v7 < 4) {
          int v15 = v14;
        }
        if (v15 == 1) {
          goto LABEL_25;
        }
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
  }
LABEL_8:
  unsigned int v10 = __dst[v7];
  unsigned int v11 = v10 - 3;
  if (v10 >= 3) {
    goto LABEL_14;
  }
LABEL_9:
  if (v10 == 1) {
LABEL_25:
  }
    (*(void (**)(char *, uint64_t))(v6 + 8))(__dst, v5);
  if (v7 > 3) {
    goto LABEL_29;
  }
LABEL_26:
  unsigned int v16 = ((1 << v8) + 1) >> v8;
  if (v16 > 0xFFFC)
  {
    unsigned int v17 = *(_DWORD *)&__src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
    goto LABEL_34;
  }
  if (v16 > 0xFC)
  {
    unsigned int v17 = *(unsigned __int16 *)&__src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
  }
  else
  {
LABEL_29:
    unsigned int v17 = __src[v7];
    unsigned int v18 = v17 - 3;
    if (v17 < 3) {
      goto LABEL_44;
    }
  }
LABEL_34:
  if (v7 <= 3) {
    uint64_t v19 = v7;
  }
  else {
    uint64_t v19 = 4;
  }
  switch(v19)
  {
    case 1:
      int v20 = *__src;
      goto LABEL_42;
    case 2:
      int v20 = *(unsigned __int16 *)__src;
      goto LABEL_42;
    case 3:
      int v20 = *(unsigned __int16 *)__src | (__src[2] << 16);
      goto LABEL_42;
    case 4:
      int v20 = *(_DWORD *)__src;
LABEL_42:
      int v21 = (v20 | (v18 << v8)) + 3;
      unsigned int v17 = v20 + 3;
      if (v7 < 4) {
        unsigned int v17 = v21;
      }
      break;
    default:
      break;
  }
LABEL_44:
  if (v17 == 2)
  {
    *(void *)__dst = *(void *)__src;
    if (v7 <= 3)
    {
      unsigned int v22 = ((1 << v8) + 1) >> v8;
      if (v22 > 0xFFFC)
      {
        int v23 = 2;
        goto LABEL_67;
      }
      if (v22 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_70;
      }
    }
    __dst[v7] = 2;
    return __dst;
  }
  if (v17 == 1)
  {
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 > 3)
    {
LABEL_56:
      __dst[v7] = 1;
      return __dst;
    }
    int v23 = 1;
    unsigned int v24 = ((1 << v8) + 1) >> v8;
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC) {
        goto LABEL_56;
      }
LABEL_70:
      *(_WORD *)&__dst[v7] = v23;
      return __dst;
    }
LABEL_67:
    *(_DWORD *)&__dst[v7] = v23;
    return __dst;
  }
  if (v17)
  {
    if (v7 > 3) {
      goto LABEL_61;
    }
    unsigned int v25 = ((1 << v8) + 1) >> v8;
    uint64_t v26 = 2;
    if (v25 > 0xFFFC) {
      uint64_t v26 = 4;
    }
    if (v25 <= 0xFC) {
LABEL_61:
    }
      uint64_t v26 = 1;
    memcpy(__dst, __src, v26 + v7);
  }
  else
  {
    *(void *)__dst = *(void *)__src;
    if (v7 > 3) {
      goto LABEL_48;
    }
    unsigned int v27 = ((1 << v8) + 1) >> v8;
    if (v27 > 0xFFFC)
    {
      *(_DWORD *)&__dst[v7] = 0;
      return __dst;
    }
    if (v27 <= 0xFC) {
LABEL_48:
    }
      __dst[v7] = 0;
    else {
      *(_WORD *)&__dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_24E9D3288(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (v3 <= 8) {
    unint64_t v3 = 8;
  }
  if (v3 > 3)
  {
    int v4 = 4;
LABEL_7:
    char v6 = 8;
    goto LABEL_8;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFC) {
    goto LABEL_11;
  }
  int v4 = v5 + 3;
  if (v5 <= 0xFC) {
    goto LABEL_7;
  }
  char v6 = 16;
LABEL_8:
  unsigned int v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3) {
      goto LABEL_15;
    }
LABEL_12:
    unsigned int v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    uint64_t v9 = 2;
    if (v8 > 0xFFFC) {
      uint64_t v9 = 4;
    }
    if (v8 > 0xFC) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_11:
  unsigned int v7 = 0x7FFFFFFF;
  if (v3 <= 3) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v9 = 1;
LABEL_16:
  if (!a2) {
    return 0;
  }
  if (a2 <= v7) {
    goto LABEL_35;
  }
  unint64_t v10 = v9 + v3;
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_35:
      if (v7)
      {
        if (v3 <= 3)
        {
          unsigned int v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFC)
          {
            unsigned int v16 = *(_DWORD *)((char *)a1 + v3);
            unsigned int v17 = ~v16;
LABEL_45:
            unsigned int v24 = 0x7FFFFFFF;
LABEL_46:
            if (v24 > v17) {
              return -v16;
            }
            else {
              return 0;
            }
          }
          int v19 = v21 + 3;
          if (v21 > 0xFC)
          {
            int v23 = *(unsigned __int16 *)((char *)a1 + v3);
            unsigned int v16 = v23 | 0xFFFF0000;
            unsigned int v17 = v23 ^ 0xFFFF;
            char v18 = 16;
          }
          else
          {
            int v22 = *((unsigned __int8 *)a1 + v3);
            unsigned int v16 = v22 | 0xFFFFFF00;
            unsigned int v17 = v22 ^ 0xFF;
            char v18 = 8;
          }
        }
        else
        {
          int v15 = *((unsigned __int8 *)a1 + v3);
          unsigned int v16 = v15 | 0xFFFFFF00;
          unsigned int v17 = v15 ^ 0xFF;
          char v18 = 8;
          int v19 = 4;
        }
        unsigned int v24 = (1 << v18) - v19;
        if ((v24 & 0x80000000) == 0) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      return 0;
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_35;
  }
LABEL_27:
  int v14 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v14 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v10 | v14) + 1;
}

void sub_24E9D34EC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  char v6 = 8 * v5;
  if (v5 > 3)
  {
    int v7 = 4;
LABEL_5:
    char v8 = 8;
    goto LABEL_6;
  }
  unsigned int v10 = ((1 << v6) + 1) >> v6;
  if (v10 > 0xFFFC) {
    goto LABEL_12;
  }
  int v7 = v10 + 3;
  if (v10 <= 0xFC) {
    goto LABEL_5;
  }
  char v8 = 16;
LABEL_6:
  unsigned int v9 = (1 << v8) - v7;
  if ((v9 & 0x80000000) == 0)
  {
    if (v5 > 3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_12:
  unsigned int v9 = 0x7FFFFFFF;
  if (v5 > 3)
  {
LABEL_16:
    uint64_t v12 = 1;
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v11 = ((1 << v6) + 1) >> v6;
  uint64_t v12 = 2;
  if (v11 > 0xFFFC) {
    uint64_t v12 = 4;
  }
  if (v11 <= 0xFC) {
    goto LABEL_16;
  }
LABEL_17:
  size_t v13 = v12 + v5;
  if (a3 <= v9)
  {
    int v14 = 0;
  }
  else if (v13 <= 3)
  {
    unsigned int v17 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v17))
    {
      int v14 = 4;
    }
    else if (v17 >= 0x100)
    {
      int v14 = 2;
    }
    else
    {
      int v14 = v17 > 1;
    }
  }
  else
  {
    int v14 = 1;
  }
  if (v9 < a2)
  {
    unsigned int v15 = ~v9 + a2;
    if (v13 < 4)
    {
      int v16 = (v15 >> (8 * v13)) + 1;
      if (v13)
      {
        int v18 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v13 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v13] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v16;
        return;
      case 3:
        goto LABEL_53;
      case 4:
        *(_DWORD *)&a1[v13] = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_53:
      __break(1u);
      JUMPOUT(0x24E9D378CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (!a2) {
        return;
      }
LABEL_37:
      int v19 = -a2;
      if (v5 > 3) {
        goto LABEL_38;
      }
      unsigned int v20 = ((1 << v6) + 1) >> v6;
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)&a1[v5] = v19;
      }
      else if (v20 <= 0xFC)
      {
LABEL_38:
        a1[v5] = v19;
      }
      else
      {
        *(_WORD *)&a1[v5] = v19;
      }
      return;
  }
}

uint64_t sub_24E9D37B4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  if (v3 > 3) {
    goto LABEL_4;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFC)
  {
    uint64_t v4 = *(unsigned int *)&a1[v3];
  }
  else
  {
    if (v5 <= 0xFC)
    {
LABEL_4:
      uint64_t v4 = a1[v3];
      goto LABEL_9;
    }
    uint64_t v4 = *(unsigned __int16 *)&a1[v3];
  }
LABEL_9:
  int v6 = v4 - 3;
  if (v4 >= 3)
  {
    if (v3 <= 3) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_18;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_18;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_18;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_18:
        unsigned int v9 = (v8 | (v6 << (8 * v3))) + 3;
        LODWORD(v4) = v8 + 3;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v9;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_24E9D38AC(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v5 = 8;
  }
  else {
    size_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 2)
  {
    unsigned int v6 = a2 - 3;
    if (v5 < 4)
    {
      int v8 = (v6 >> (8 * v5)) + 3;
      v6 &= ~(-1 << (8 * v5));
      unsigned int v9 = (int *)&a1[v5];
      unsigned int v10 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v10 > 0xFFFC)
      {
        *unsigned int v9 = v8;
      }
      else if (v10 > 0xFC)
      {
        *(_WORD *)unsigned int v9 = v8;
      }
      else
      {
        *(unsigned char *)unsigned int v9 = v8;
      }
    }
    else
    {
      a1[v5] = 3;
    }
    if (v5 <= 3) {
      int v11 = v5;
    }
    else {
      int v11 = 4;
    }
    bzero(a1, v5);
    switch(v11)
    {
      case 2:
        *(_WORD *)a1 = v6;
        break;
      case 3:
        *(_WORD *)a1 = v6;
        a1[2] = BYTE2(v6);
        break;
      case 4:
        *(_DWORD *)a1 = v6;
        break;
      default:
        *a1 = v6;
        break;
    }
  }
  else
  {
    if (v5 > 3)
    {
LABEL_6:
      a1[v5] = a2;
      return;
    }
    unsigned int v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v7 > 0xFFFC)
    {
      *(_DWORD *)&a1[v5] = a2;
    }
    else
    {
      if (v7 <= 0xFC) {
        goto LABEL_6;
      }
      *(_WORD *)&a1[v5] = a2;
    }
  }
}

unsigned char *sub_24E9D3A28(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24E9D3AF4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_24E9D3B20(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9D3BBCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E9D3BE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C00()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C1C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C38()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C54()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C70()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3C8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3CA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3CC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3CE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3CFC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3D18()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3D34()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3D50()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3D6C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3D88()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D3DAC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EA16310)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E9D3EA4(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x6570704177656976;
  }
}

uint64_t sub_24E9D3EE8()
{
  return sub_24E9D3EA4(*v0);
}

uint64_t sub_24E9D3EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9D3DAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9D3F28(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D3F7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D3FD0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D4024(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9D4078@<X0>(unsigned char *a1@<X8>)
{
  char v2 = sub_24E9A8FBC();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 & 1;
  return result;
}

uint64_t sub_24E9D40C0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9D4114(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t SidebarModalitiesAction.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v39 = a2;
  uint64_t v35 = type metadata accessor for SidebarModalitiesAction.ModalitySelectedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v38 = sub_24EA06FF8();
  uint64_t v36 = *(void *)(v38 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v38);
  uint64_t v34 = (char *)&v27 - v7;
  uint64_t v41 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v33 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SidebarModalitiesAction.ViewAppearedCodingKeys();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v31 = v9;
  uint64_t v29 = v10;
  uint64_t v30 = sub_24EA06FF8();
  uint64_t v28 = *(void *)(v30 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v30);
  unsigned int v27 = (char *)&v27 - v12;
  uint64_t v13 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v4;
  type metadata accessor for SidebarModalitiesAction.CodingKeys();
  swift_getWitnessTable();
  uint64_t v43 = sub_24EA06FF8();
  uint64_t v40 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  unsigned int v17 = (char *)&v27 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v18 = v41;
  sub_24EA070A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v42, v39);
  int v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v42 = v3;
  if (v19(v15, 1, v3) == 1)
  {
    char v44 = 0;
    unsigned int v20 = v27;
    uint64_t v21 = v43;
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, v21);
  }
  else
  {
    uint64_t v23 = v40;
    unsigned int v24 = v33;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v33, v15, v42);
    char v45 = 1;
    unsigned int v25 = v34;
    sub_24EA06F98();
    uint64_t v26 = v38;
    sub_24EA06FE8();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v26);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v42);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v17, v43);
  }
}

uint64_t type metadata accessor for SidebarModalitiesAction.ModalitySelectedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SidebarModalitiesAction.ViewAppearedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SidebarModalitiesAction.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SidebarModalitiesAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v52 = a4;
  uint64_t v7 = type metadata accessor for SidebarModalitiesAction.ModalitySelectedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v57 = v7;
  uint64_t v48 = sub_24EA06F88();
  uint64_t v50 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v58 = (char *)&v42 - v8;
  uint64_t v9 = type metadata accessor for SidebarModalitiesAction.ViewAppearedCodingKeys();
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v55 = v9;
  uint64_t v47 = sub_24EA06F88();
  uint64_t v46 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v53 = (char *)&v42 - v10;
  type metadata accessor for SidebarModalitiesAction.CodingKeys();
  swift_getWitnessTable();
  uint64_t v62 = sub_24EA06F88();
  uint64_t v59 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v12 = (char *)&v42 - v11;
  uint64_t v60 = a2;
  uint64_t v49 = a3;
  uint64_t v13 = type metadata accessor for SidebarModalitiesAction();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v42 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v61 = v12;
  int v19 = v67;
  sub_24EA07098();
  if (!v19)
  {
    uint64_t v43 = v16;
    char v44 = v18;
    uint64_t v20 = v60;
    uint64_t v45 = 0;
    uint64_t v67 = a1;
    uint64_t v21 = v61;
    uint64_t v22 = v62;
    *(void *)&long long v63 = sub_24EA06F78();
    sub_24EA06A58();
    swift_getWitnessTable();
    *(void *)&long long v65 = sub_24EA06CE8();
    *((void *)&v65 + 1) = v23;
    *(void *)&long long v66 = v24;
    *((void *)&v66 + 1) = v25;
    sub_24EA06CD8();
    swift_getWitnessTable();
    sub_24EA06BA8();
    char v26 = v63;
    if (v63 == 2 || (long long v42 = v65, v63 = v65, v64 = v66, (sub_24EA06BC8() & 1) == 0))
    {
      uint64_t v30 = sub_24EA06DC8();
      swift_allocError();
      uint64_t v32 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
      uint64_t *v32 = v13;
      sub_24EA06F18();
      sub_24EA06DB8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v21, v22);
    }
    else
    {
      if (v26)
      {
        LOBYTE(v63) = 1;
        uint64_t v35 = v58;
        uint64_t v36 = v45;
        sub_24EA06F08();
        if (!v36)
        {
          uint64_t v37 = v48;
          sub_24EA06F68();
          uint64_t v38 = v59;
          (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v37);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v22);
          uint64_t v39 = v43;
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v43, 0, 1, v20);
          uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
          uint64_t v41 = v44;
          v40(v44, v39, v13);
          v40(v52, v41, v13);
          goto LABEL_14;
        }
      }
      else
      {
        LOBYTE(v63) = 0;
        unsigned int v27 = v53;
        uint64_t v28 = v45;
        sub_24EA06F08();
        if (!v28)
        {
          (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v47);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v59 + 8))(v21, v22);
          uint64_t v29 = v44;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v44, 1, 1, v20);
          (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v52, v29, v13);
LABEL_14:
          uint64_t v33 = (uint64_t)v67;
          return __swift_destroy_boxed_opaque_existential_1(v33);
        }
      }
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v21, v22);
    }
    a1 = v67;
  }
  uint64_t v33 = (uint64_t)a1;
  return __swift_destroy_boxed_opaque_existential_1(v33);
}

uint64_t type metadata accessor for SidebarModalitiesAction()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9D4E84@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return SidebarModalitiesAction.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E9D4EA4(void *a1, uint64_t a2)
{
  return SidebarModalitiesAction.encode(to:)(a1, a2);
}

uint64_t sub_24E9D4EBC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24E9D4F38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_24E9D5074(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_24E9D5138(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_24E9D5230(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_24E9D539C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_24E9D5494(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_24E9D5600(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_24E9D57A0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x24E9D59DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_24E9D5A04(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t sub_24E9D5A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

unsigned char *sub_24E9D5A64(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9D5B30);
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

unsigned char *sub_24E9D5B58(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9D5BF4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E9D5C1C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5C38()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5C54()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5C70()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5C8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5CA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5CC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5CE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9D5CFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  type metadata accessor for SidebarModalitiesFeature();
  swift_getWitnessTable();
  uint64_t v4 = sub_24EA067C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, WitnessTable);
}

uint64_t sub_24E9D5DA8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EA05E68();
  return a2(v3);
}

uint64_t SidebarModalitiesView.init(store:textViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = type metadata accessor for SidebarModalitiesView();
  sub_24EA05E58();
  int v15 = (void *)swift_allocObject();
  v15[2] = a5;
  v15[3] = a6;
  v15[4] = a1;
  v15[5] = a2;
  type metadata accessor for SidebarModalitiesFeature();
  swift_getWitnessTable();
  sub_24EA067C8();
  swift_getWitnessTable();
  uint64_t result = sub_24EA05E78();
  *(void *)a7 = result;
  *(void *)(a7 + 8) = v17;
  *(unsigned char *)(a7 + 16) = v18 & 1;
  int v19 = (void *)(a7 + *(int *)(v14 + 40));
  *int v19 = a3;
  v19[1] = a4;
  return result;
}

uint64_t type metadata accessor for SidebarModalitiesView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9D5F9C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t SidebarModalitiesView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v75 = a1;
  uint64_t v5 = v2;
  uint64_t v77 = v2;
  uint64_t v74 = type metadata accessor for SidebarModality();
  uint64_t v6 = sub_24EA06A58();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991EB50);
  uint64_t v7 = sub_24EA06CA8();
  sub_24E9B7F78(&qword_26991EB58, &qword_26991EB50);
  uint64_t v105 = *(void *)(v5 + 24);
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeMetadata2();
  swift_getWitnessTable();
  uint64_t v104 = v105;
  sub_24EA065D8();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  swift_getWitnessTable();
  uint64_t v98 = v105;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v100 = OpaqueTypeMetadata2;
  unsigned int v101 = (uint64_t (*)())v7;
  uint64_t v79 = (uint64_t (*)())v7;
  uint64_t v72 = swift_getOpaqueTypeConformance2();
  uint64_t v102 = v72;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v71 = WitnessTable;
  v61[1] = swift_getOpaqueTypeMetadata2();
  uint64_t v8 = sub_24EA065F8();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  long long v63 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v62 = (char *)v61 - v12;
  uint64_t v13 = *(void *)(a1 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v11);
  long long v65 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v15 = sub_24EA06758();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v61 - v16;
  v61[0] = v6;
  uint64_t v18 = sub_24EA066C8();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v61 - v20;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991EB60);
  uint64_t v74 = v8;
  uint64_t v69 = sub_24EA06098();
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v67 = (char *)v61 - v22;
  sub_24E9D5CFC();
  uint64_t v70 = v3;
  uint64_t v80 = v3;
  uint64_t v81 = v77;
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  sub_24EA066B8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v24 = MEMORY[0x263F1A820];
  uint64_t v25 = MEMORY[0x263F1BA00];
  switch((int)EnumCaseMultiPayload)
  {
    case 1:
      uint64_t v26 = *(void *)v17;
      uint64_t v27 = sub_24EA05C88();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      uint64_t EnumCaseMultiPayload = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(&v17[*(int *)(TupleTypeMetadata2 + 48)], v27);
      goto LABEL_4;
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    case 3:
    case 4:
LABEL_6:
      uint64_t v47 = sub_24EA06438();
      uint64_t v48 = v65;
      uint64_t v49 = v75;
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v65, v76, v75);
      unint64_t v50 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
      uint64_t v51 = swift_allocObject();
      uint64_t v52 = v77;
      *(void *)(v51 + 16) = v70;
      *(void *)(v51 + 24) = v52;
      (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v51 + v50, v48, v49);
      uint64_t v100 = v47;
      unsigned int v101 = sub_24E9D8E10;
      uint64_t v102 = v51;
      sub_24E9D8D98();
      uint64_t WitnessTable = 0;
      uint64_t v104 = 0;
      uint64_t v85 = OpaqueTypeMetadata2;
      uint64_t v86 = v79;
      uint64_t v35 = v72;
      uint64_t v39 = v71;
      uint64_t v87 = v72;
      uint64_t v88 = v71;
      uint64_t v53 = swift_getOpaqueTypeConformance2();
      uint64_t v82 = v24;
      uint64_t v83 = v53;
      uint64_t v84 = v25;
      swift_getWitnessTable();
      uint64_t v44 = v24;
      uint64_t v45 = v67;
      sub_24E9D6C7C((uint64_t)&v100, v66);
      swift_release();
      swift_release();
      break;
    default:
      uint64_t v26 = *(void *)v17;
LABEL_4:
      uint64_t v29 = MEMORY[0x270FA5388](EnumCaseMultiPayload);
      uint64_t v30 = v77;
      v61[-4] = v70;
      v61[-3] = v30;
      uint64_t v31 = v76;
      v61[-2] = v26;
      v61[-1] = v31;
      MEMORY[0x270FA5388](v29);
      v61[-4] = v33;
      v61[-3] = v32;
      v61[-2] = v34;
      uint64_t v100 = OpaqueTypeMetadata2;
      unsigned int v101 = v79;
      uint64_t v35 = v72;
      uint64_t v36 = v71;
      uint64_t v102 = v72;
      uint64_t WitnessTable = v71;
      uint64_t v37 = swift_getOpaqueTypeConformance2();
      uint64_t v38 = (uint64_t)v63;
      sub_24E9D8BD0((uint64_t)sub_24E9D7870);
      swift_bridgeObjectRelease();
      uint64_t v94 = v24;
      uint64_t v95 = v37;
      uint64_t v39 = v36;
      uint64_t v96 = MEMORY[0x263F1BA00];
      uint64_t v40 = v74;
      uint64_t v41 = swift_getWitnessTable();
      long long v42 = v62;
      sub_24E9C74A8(v38, v40, v41);
      uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v43(v38, v40);
      sub_24E9C74A8(v42, v40, v41);
      sub_24E9D8D98();
      uint64_t v44 = v24;
      uint64_t v45 = v67;
      sub_24E9D8CA0(v38, v66, v40);
      uint64_t v46 = v38;
      uint64_t v25 = MEMORY[0x263F1BA00];
      v43(v46, v40);
      v43((uint64_t)v42, v40);
      break;
  }
  uint64_t v54 = v69;
  uint64_t v55 = v68;
  unint64_t v56 = sub_24E9D8D98();
  uint64_t v100 = OpaqueTypeMetadata2;
  unsigned int v101 = v79;
  uint64_t v102 = v35;
  uint64_t WitnessTable = v39;
  uint64_t v57 = swift_getOpaqueTypeConformance2();
  uint64_t v91 = v44;
  uint64_t v92 = v57;
  uint64_t v93 = v25;
  uint64_t v58 = swift_getWitnessTable();
  unint64_t v89 = v56;
  uint64_t v90 = v58;
  uint64_t v59 = swift_getWitnessTable();
  sub_24E9C74A8(v45, v54, v59);
  return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v45, v54);
}

uint64_t sub_24E9D6B54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SidebarModalitiesAction();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - v5;
  type metadata accessor for SidebarModalitiesView();
  sub_24E9D5CFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(v6, 1, 1, a2);
  sub_24EA067A8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24E9D6C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA06078();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24EA06088();
}

uint64_t sub_24E9D6D74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v84 = a1;
  uint64_t v98 = a5;
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v97 = sub_24EA065A8();
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v95 = (char *)v62 - v8;
  uint64_t v94 = sub_24EA06258();
  uint64_t v93 = *(void *)(v94 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v94);
  uint64_t v90 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v88 = (char *)v62 - v11;
  uint64_t v116 = *(void *)(a4 + 24);
  uint64_t v12 = v116;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v91 = sub_24EA05E38();
  uint64_t v89 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v87 = (char *)v62 - v14;
  uint64_t v101 = type metadata accessor for SidebarModalitiesView();
  uint64_t v82 = *(void *)(v101 - 8);
  uint64_t v83 = *(void *)(v82 + 64);
  MEMORY[0x270FA5388](v101);
  uint64_t v78 = (char *)v62 - v15;
  type metadata accessor for SidebarModality();
  uint64_t v16 = sub_24EA06A58();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991EB50);
  uint64_t v18 = sub_24E9B7F78(&qword_26991EB58, &qword_26991EB50);
  uint64_t v111 = v17;
  uint64_t v112 = v7;
  uint64_t v113 = v18;
  uint64_t v114 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v111 = v17;
  uint64_t v112 = v7;
  uint64_t v113 = v18;
  uint64_t v114 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v111 = OpaqueTypeMetadata2;
  uint64_t v112 = a3;
  uint64_t v113 = OpaqueTypeConformance2;
  uint64_t v114 = v12;
  uint64_t v21 = swift_getOpaqueTypeMetadata2();
  uint64_t v72 = v21;
  uint64_t v73 = v16;
  uint64_t v71 = swift_getWitnessTable();
  uint64_t v111 = v16;
  uint64_t v112 = a3;
  uint64_t v113 = v21;
  uint64_t v114 = v71;
  uint64_t v115 = v12;
  uint64_t v22 = sub_24EA065D8();
  uint64_t v86 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v99 = (char *)v62 - v23;
  uint64_t v111 = OpaqueTypeMetadata2;
  uint64_t v112 = a3;
  uint64_t v113 = OpaqueTypeConformance2;
  uint64_t v114 = v12;
  uint64_t v64 = v12;
  uint64_t v66 = swift_getOpaqueTypeConformance2();
  uint64_t v110 = v66;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v111 = v22;
  uint64_t v112 = v7;
  uint64_t v25 = v22;
  uint64_t v69 = v22;
  uint64_t v65 = v7;
  uint64_t v113 = v24;
  uint64_t v114 = WitnessTable;
  uint64_t v26 = v24;
  uint64_t v68 = v24;
  uint64_t v67 = WitnessTable;
  uint64_t v27 = swift_getOpaqueTypeMetadata2();
  uint64_t v77 = v27;
  uint64_t v85 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v100 = (char *)v62 - v28;
  uint64_t v111 = v25;
  uint64_t v112 = v7;
  uint64_t v113 = v26;
  uint64_t v114 = WitnessTable;
  uint64_t v29 = swift_getOpaqueTypeConformance2();
  uint64_t v76 = v29;
  uint64_t v109 = v12;
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v111 = v27;
  uint64_t v112 = v7;
  uint64_t v113 = v29;
  uint64_t v114 = v75;
  uint64_t v79 = MEMORY[0x263F1AD98];
  uint64_t v80 = swift_getOpaqueTypeMetadata2();
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v80);
  uint64_t v70 = (char *)v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v74 = (char *)v62 - v32;
  uint64_t v111 = v84;
  uint64_t v107 = a3;
  uint64_t v108 = a4;
  uint64_t v33 = a4;
  v62[1] = swift_getKeyPath();
  uint64_t v34 = v82;
  uint64_t v35 = v78;
  uint64_t v36 = v101;
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v78, v102, v101);
  unint64_t v37 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = a3;
  *(void *)(v38 + 24) = a4;
  uint64_t v63 = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v38 + v37, v35, v36);
  swift_bridgeObjectRetain();
  sub_24EA065B8();
  uint64_t v39 = v87;
  sub_24E9D5DA8(v36, MEMORY[0x263F183D8]);
  sub_24E9D5CFC();
  uint64_t v105 = a3;
  uint64_t v106 = a4;
  swift_getKeyPath();
  uint64_t v40 = v88;
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v41 = v90;
  uint64_t v42 = v69;
  uint64_t v43 = v65;
  uint64_t v44 = v68;
  uint64_t v45 = v67;
  sub_24E9E87AC();
  uint64_t v46 = v40;
  uint64_t v47 = v40;
  uint64_t v48 = v41;
  uint64_t v49 = v41;
  unint64_t v50 = v99;
  MEMORY[0x253345960](v39, v46, v48, v42, v43, v44, v45);
  (*(void (**)(char *, uint64_t))(v93 + 8))(v49, v94);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v47, v43);
  (*(void (**)(char *, uint64_t))(v89 + 8))(v39, v91);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v50, v42);
  sub_24E9D5CFC();
  uint64_t v103 = v63;
  uint64_t v104 = v33;
  swift_getKeyPath();
  uint64_t v51 = v95;
  sub_24EA067B8();
  swift_release();
  swift_release();
  uint64_t v52 = v70;
  uint64_t v53 = v77;
  uint64_t v54 = v76;
  uint64_t v55 = v75;
  unint64_t v56 = v100;
  sub_24EA06388();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v51, v97);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v56, v53);
  uint64_t v111 = v53;
  uint64_t v112 = v43;
  uint64_t v113 = v54;
  uint64_t v114 = v55;
  uint64_t v57 = swift_getOpaqueTypeConformance2();
  uint64_t v58 = v74;
  uint64_t v59 = v80;
  sub_24E9C74A8(v52, v80, v57);
  uint64_t v60 = *(void (**)(char *, uint64_t))(v81 + 8);
  v60(v52, v59);
  sub_24E9C74A8(v58, v59, v57);
  return ((uint64_t (*)(char *, uint64_t))v60)(v58, v59);
}

uint64_t sub_24E9D7870@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9D6D74(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_24E9D787C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v73 = a1;
  uint64_t v80 = a5;
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v79 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v76 = (char *)&v52 - v8;
  uint64_t v83 = *(void *)(a4 + 24);
  uint64_t v92 = v83;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = sub_24EA05E38();
  uint64_t v77 = *(void *)(v9 - 8);
  uint64_t v78 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v75 = (char *)&v52 - v10;
  uint64_t v60 = a4;
  uint64_t v58 = type metadata accessor for SidebarModality();
  uint64_t v56 = *(void *)(v58 - 8);
  uint64_t v59 = *(void *)(v56 + 64);
  MEMORY[0x270FA5388](v58);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v53 = (char *)&v52 - v11;
  uint64_t v55 = type metadata accessor for SidebarModalitiesView();
  uint64_t v54 = *(void *)(v55 - 8);
  uint64_t v13 = *(void *)(v54 + 64);
  MEMORY[0x270FA5388](v55);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v52 = (char *)&v52 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EB50);
  uint64_t v74 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v65 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24E9B7F78(&qword_26991EB58, &qword_26991EB50);
  uint64_t v88 = v16;
  uint64_t v89 = v7;
  uint64_t v63 = v16;
  uint64_t v62 = v7;
  uint64_t v64 = v18;
  uint64_t v19 = WitnessTable;
  uint64_t v90 = v18;
  uint64_t v91 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v67 = OpaqueTypeMetadata2;
  uint64_t v72 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v61 = (char *)&v52 - v21;
  uint64_t v88 = v16;
  uint64_t v89 = v7;
  uint64_t v90 = v18;
  uint64_t v91 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v88 = OpaqueTypeMetadata2;
  uint64_t v89 = a3;
  uint64_t v90 = OpaqueTypeConformance2;
  uint64_t v91 = v83;
  uint64_t v69 = MEMORY[0x263F1A910];
  uint64_t v70 = swift_getOpaqueTypeMetadata2();
  uint64_t v71 = *(void *)(v70 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v70);
  uint64_t v57 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v66 = (char *)&v52 - v24;
  uint64_t v25 = v54;
  uint64_t v26 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v15, v82, v55);
  uint64_t v27 = v56;
  uint64_t v28 = v73;
  uint64_t v29 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v12, v73, v58);
  unint64_t v30 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v31 = v27;
  unint64_t v32 = (v13 + *(unsigned __int8 *)(v27 + 80) + v30) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = v60;
  *(void *)(v33 + 16) = a3;
  *(void *)(v33 + 24) = v34;
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v33 + v30, v52, v26);
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v33 + v32, v53, v29);
  uint64_t v84 = a3;
  uint64_t v85 = v34;
  uint64_t v35 = a3;
  uint64_t v86 = v82;
  uint64_t v87 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991EB78);
  sub_24E9B7F78(&qword_26991EB80, &qword_26991EB78);
  uint64_t v36 = v65;
  sub_24EA06538();
  unint64_t v37 = v75;
  sub_24E9D5DA8(v26, MEMORY[0x263F183D8]);
  uint64_t v38 = *(void *)(v35 - 8);
  uint64_t v39 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v76, v28, v35);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v35);
  uint64_t v40 = v61;
  uint64_t v41 = v63;
  uint64_t v42 = v62;
  sub_24EA06398();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v39, v42);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v37, v78);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v36, v41);
  uint64_t v43 = v57;
  uint64_t v44 = v67;
  uint64_t v45 = OpaqueTypeConformance2;
  uint64_t v46 = v83;
  sub_24EA06328();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v40, v44);
  uint64_t v88 = v44;
  uint64_t v89 = v35;
  uint64_t v90 = v45;
  uint64_t v91 = v46;
  uint64_t v47 = swift_getOpaqueTypeConformance2();
  uint64_t v48 = v66;
  uint64_t v49 = v70;
  sub_24E9C74A8(v43, v70, v47);
  unint64_t v50 = *(void (**)(char *, uint64_t))(v71 + 8);
  v50(v43, v49);
  sub_24E9C74A8(v48, v49, v47);
  return ((uint64_t (*)(char *, uint64_t))v50)(v48, v49);
}

uint64_t sub_24E9D8140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SidebarModalitiesAction();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - v7;
  type metadata accessor for SidebarModalitiesView();
  sub_24E9D5CFC();
  uint64_t v9 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v8, a2, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, a3);
  sub_24EA067A8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24E9D82B4()
{
  return sub_24EA064E8();
}

uint64_t sub_24E9D8350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t))(a1 + *(int *)(type metadata accessor for SidebarModalitiesView() + 40));
  uint64_t v6 = type metadata accessor for SidebarModality();
  uint64_t result = v5(a2 + *(int *)(v6 + 40));
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v8;
  *(unsigned char *)(a3 + 16) = v9 & 1;
  *(void *)(a3 + 24) = v10;
  return result;
}

uint64_t sub_24E9D83DC@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v65 = a5;
  uint64_t v66 = a2;
  uint64_t v58 = sub_24EA06418();
  uint64_t v56 = *(void *)(v58 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v58);
  uint64_t v59 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v8);
  v51[0] = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24EA06CA8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v16 = (char *)v51 - v15;
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v63 = (char *)v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v51 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v51 - v22;
  uint64_t v55 = *(int *)(type metadata accessor for SidebarModality() + 36);
  char v67 = *(unsigned char *)(a1 + v55);
  sub_24E9E42FC();
  uint64_t v64 = sub_24EA064C8();
  v51[1] = a4;
  uint64_t v24 = type metadata accessor for SidebarModalitiesView();
  sub_24E9D5DA8(v24, MEMORY[0x263F183D0]);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v57 = a1;
  v25(v21, a1, a3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v21, 0, 1, a3);
  uint64_t v53 = TupleTypeMetadata2;
  uint64_t v26 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v27 = v61;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v28(v16, v23, v12);
  uint64_t v60 = v26;
  uint64_t v29 = v26;
  uint64_t v30 = v12;
  v28(v29, v21, v12);
  uint64_t v54 = v10;
  uint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v66 = v16;
  uint64_t v62 = a3;
  if (v31(v16, 1, a3) == 1)
  {
    unint64_t v32 = v66;
    uint64_t v33 = *(void (**)(char *, uint64_t))(v27 + 8);
    v33(v21, v12);
    v33(v23, v12);
    if (v31(v60, 1, v62) == 1)
    {
      v33(v32, v12);
LABEL_8:
      uint64_t result = sub_24EA06468();
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  uint64_t v34 = v27;
  v28(v63, v66, v12);
  uint64_t v35 = v60;
  uint64_t v36 = v62;
  if (v31(v60, 1, v62) == 1)
  {
    unint64_t v32 = v66;
    unint64_t v37 = *(void (**)(char *, uint64_t))(v34 + 8);
    v37(v21, v12);
    v37(v23, v12);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v63, v36);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v52 + 8))(v32, v53);
    goto LABEL_9;
  }
  uint64_t v38 = v54;
  uint64_t v39 = v51[0];
  (*(void (**)(void, char *, uint64_t))(v54 + 32))(v51[0], v35, v36);
  uint64_t v40 = v63;
  char v41 = sub_24EA068D8();
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v42(v39, v36);
  uint64_t v43 = *(void (**)(char *, uint64_t))(v34 + 8);
  v43(v21, v30);
  v43(v23, v30);
  v42((uint64_t)v40, v36);
  v43(v66, v30);
  if (v41) {
    goto LABEL_8;
  }
LABEL_9:
  int v45 = *(unsigned __int8 *)(v57 + v55);
  uint64_t v46 = v59;
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v59, *MEMORY[0x263F1B388], v58);
  if (v45 == 6)
  {
    v47.n128_u64[0] = 0x3FDADADADADADADBLL;
    v48.n128_u64[0] = 0x3FEF7F7F7F7F7F7FLL;
    v49.n128_u64[0] = 0x3FEF1F1F1F1F1F1FLL;
  }
  else
  {
    v47.n128_u64[0] = 0x3FE4D4D4D4D4D4D5;
    v48.n128_u64[0] = 1.0;
    v49.n128_u64[0] = 0;
  }
  uint64_t result = MEMORY[0x253345A80](v46, v47, v48, v49, 1.0);
LABEL_13:
  unint64_t v50 = v65;
  *uint64_t v65 = v64;
  v50[1] = result;
  return result;
}

uint64_t sub_24E9D89F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24EA05CD8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24EA068F8();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24EA068E8();
  type metadata accessor for LocalizableBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  type metadata accessor for SidebarModalitiesView();
  sub_24E9D5CFC();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  sub_24EA06958();
  sub_24E9DA730();
  uint64_t result = sub_24EA062D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_24E9D8BC4@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9D89F0(a1);
}

uint64_t sub_24E9D8BD0(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  v2(v1);
  return sub_24EA065E8();
}

uint64_t sub_24E9D8CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24EA06078();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24EA06088();
}

unint64_t sub_24E9D8D98()
{
  unint64_t result = qword_26991EB68;
  if (!qword_26991EB68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991EB60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EB68);
  }
  return result;
}

uint64_t sub_24E9D8E10()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for SidebarModalitiesView() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_24E9D6B54(v3, v1);
}

uint64_t sub_24E9D8E94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9D8EDC()
{
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t result = sub_24EA05E68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E9D8FC4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v8;
  uint64_t v10 = ~(v8 | 7);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v11 = *(void *)(v6 + 64);
  }
  else {
    size_t v11 = *(void *)(v6 + 64) + 1;
  }
  size_t v12 = v11 + 7;
  unint64_t v13 = ((((v8 + 8 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)v8)
        + v11
        + (((v8 | 7) + 17) & ~(v8 | 7))
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  int v14 = v8 & 0x100000;
  if (v9 > 7 || v14 != 0 || v13 > 0x18)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = v17 + ((v9 + 16) & v10);
  }
  else
  {
    uint64_t v34 = v9 + 8;
    size_t v35 = ((v9 + 8 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v9) + v11;
    uint64_t v33 = ~v9;
    uint64_t v18 = *a2;
    uint64_t v19 = a2[1];
    char v20 = *((unsigned char *)a2 + 16);
    sub_24E9C7B00();
    *(void *)a1 = v18;
    *(void *)(a1 + 8) = v19;
    uint64_t v21 = v5;
    *(unsigned char *)(a1 + 16) = v20;
    uint64_t v22 = (a1 + 24) & v10;
    uint64_t v23 = (unint64_t)(a2 + 3) & v10;
    unint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    if (v32(v23, 1, v21))
    {
      memcpy((void *)v22, (const void *)v23, v11);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v22, v23, v21);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v21);
    }
    uint64_t v24 = (void *)((v12 + v22) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)((v12 + v23) & 0xFFFFFFFFFFFFFFF8);
    void *v24 = *v25;
    uint64_t v26 = (void *)(((unint64_t)v24 + v34) & v33);
    uint64_t v27 = (const void *)(((unint64_t)v25 + v34) & v33);
    swift_retain();
    if (v32((uint64_t)v27, 1, v21))
    {
      memcpy(v26, v27, v11);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v26, v27, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v21);
    }
    uint64_t v28 = (void *)(((v23 | 7) + v35) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = v28[1];
    uint64_t v30 = (void *)(((v22 | 7) + v35) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v30 = *v28;
    v30[1] = v29;
  }
  swift_retain();
  return a1;
}

uint64_t sub_24E9D925C(uint64_t a1, uint64_t a2)
{
  sub_24E9C79E0();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (a1 + (v6 | 7) + 17) & ~(v6 | 7);
  int v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v9 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v9 = *(void *)(v5 + 64) + 1;
  }
  swift_release();
  unint64_t v10 = (v6 + 8 + (((v7 | 7) + v9) & 0xFFFFFFFFFFFFFFF8)) & ~v6;
  if (!v8(v10, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v10, v4);
  }
  return swift_release();
}

uint64_t sub_24E9D93C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v11 | 7) + 17;
  uint64_t v13 = (v12 + a1) & ~(v11 | 7);
  uint64_t v14 = ((unint64_t)a2 + v12) & ~(v11 | 7);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v32 = a1;
  if (v31(v14, 1, v9))
  {
    int v15 = *(_DWORD *)(v10 + 84);
    size_t v16 = *(void *)(v10 + 64);
    if (v15) {
      size_t v17 = *(void *)(v10 + 64);
    }
    else {
      size_t v17 = v16 + 1;
    }
    memcpy((void *)v13, (const void *)v14, v17);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
    int v15 = *(_DWORD *)(v10 + 84);
    size_t v16 = *(void *)(v10 + 64);
  }
  if (!v15) {
    ++v16;
  }
  uint64_t v18 = v13 | 7;
  uint64_t v19 = (void *)(((v13 | 7) + v16) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = v14 | 7;
  uint64_t v21 = (void *)(((v14 | 7) + v16) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v19 = *v21;
  uint64_t v22 = (void *)(((unint64_t)v19 + v11 + 8) & ~v11);
  uint64_t v23 = (const void *)(((unint64_t)v21 + v11 + 8) & ~v11);
  swift_retain();
  if (v31((uint64_t)v23, 1, v9))
  {
    memcpy(v22, v23, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v22, v23, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  }
  size_t v24 = ((v11 + 8 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v11) + v16;
  size_t v25 = v18 + v24;
  uint64_t v26 = (uint64_t *)((v20 + v24) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  uint64_t v29 = (void *)(v25 & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v29 = v28;
  v29[1] = v27;
  swift_retain();
  return v32;
}

uint64_t sub_24E9D960C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_24E9C79E0();
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v11 | 7) + 17;
  uint64_t v37 = a1;
  uint64_t v13 = (v12 + a1) & ~(v11 | 7);
  uint64_t v14 = ((unint64_t)v4 + v12) & ~(v11 | 7);
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v4) = v15(v13, 1, v9);
  int v16 = v15(v14, 1, v9);
  if (v4)
  {
    if (!v16)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
      goto LABEL_12;
    }
    int v17 = *(_DWORD *)(v10 + 84);
    size_t v18 = *(void *)(v10 + 64);
  }
  else
  {
    if (!v16)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v13, v14, v9);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    int v17 = *(_DWORD *)(v10 + 84);
    size_t v18 = *(void *)(v10 + 64);
  }
  if (v17) {
    size_t v19 = v18;
  }
  else {
    size_t v19 = v18 + 1;
  }
  memcpy((void *)v13, (const void *)v14, v19);
LABEL_12:
  if (*(_DWORD *)(v10 + 84)) {
    size_t v20 = *(void *)(v10 + 64);
  }
  else {
    size_t v20 = *(void *)(v10 + 64) + 1;
  }
  uint64_t v36 = v13 | 7;
  uint64_t v21 = (void *)(((v13 | 7) + v20) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v35 = v14 | 7;
  uint64_t v22 = (void *)(((v14 | 7) + v20) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v21 = *v22;
  swift_retain();
  swift_release();
  uint64_t v23 = v11 + 8;
  unint64_t v24 = (unint64_t)v21 + v11 + 8;
  uint64_t v25 = ~v11;
  uint64_t v26 = (void *)(v24 & ~v11);
  uint64_t v27 = (const void *)(((unint64_t)v22 + v11 + 8) & ~v11);
  int v28 = v15((uint64_t)v26, 1, v9);
  int v29 = v15((uint64_t)v27, 1, v9);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 24))(v26, v27, v9);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
    goto LABEL_20;
  }
  if (v29)
  {
LABEL_20:
    memcpy(v26, v27, v20);
    goto LABEL_21;
  }
  (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v26, v27, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
LABEL_21:
  size_t v30 = ((v23 + ((v20 + 7) & 0xFFFFFFFFFFFFFFF8)) & v25) + v20;
  uint64_t v31 = (void *)((v36 + v30) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v32 = (void *)((v35 + v30) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  swift_retain();
  swift_release();
  return v37;
}

uint64_t sub_24E9D9940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 | 7) + 17;
  uint64_t v8 = (v7 + a1) & ~(v6 | 7);
  uint64_t v9 = (v7 + a2) & ~(v6 | 7);
  uint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22(v9, 1, v4))
  {
    int v10 = *(_DWORD *)(v5 + 84);
    size_t v11 = *(void *)(v5 + 64);
    if (v10) {
      size_t v12 = *(void *)(v5 + 64);
    }
    else {
      size_t v12 = v11 + 1;
    }
    memcpy((void *)v8, (const void *)v9, v12);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v8, v9, v4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
    int v10 = *(_DWORD *)(v5 + 84);
    size_t v11 = *(void *)(v5 + 64);
  }
  if (v10) {
    size_t v13 = v11;
  }
  else {
    size_t v13 = v11 + 1;
  }
  uint64_t v14 = v8 | 7;
  int v15 = (void *)(((v8 | 7) + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = v9 | 7;
  int v17 = (void *)(((v9 | 7) + v13) & 0xFFFFFFFFFFFFFFF8);
  *int v15 = *v17;
  size_t v18 = (void *)(((unint64_t)v15 + v6 + 8) & ~v6);
  size_t v19 = (const void *)(((unint64_t)v17 + v6 + 8) & ~v6);
  if (v22((uint64_t)v19, 1, v4))
  {
    memcpy(v18, v19, v13);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v18, v19, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v18, 0, 1, v4);
  }
  size_t v20 = ((v6 + 8 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v6) + v13;
  *(_OWORD *)((v14 + v20) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v16 + v20) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24E9D9B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + 17;
  uint64_t v11 = (v10 + a1) & ~(v9 | 7);
  uint64_t v12 = (v10 + v4) & ~(v9 | 7);
  size_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  LODWORD(v4) = v13(v11, 1, v7);
  int v14 = v13(v12, 1, v7);
  if (v4)
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  if (v15) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v16 + 1;
  }
  memcpy((void *)v11, (const void *)v12, v17);
LABEL_12:
  if (*(_DWORD *)(v8 + 84)) {
    size_t v18 = *(void *)(v8 + 64);
  }
  else {
    size_t v18 = *(void *)(v8 + 64) + 1;
  }
  uint64_t v30 = v11 | 7;
  size_t v19 = (void *)(((v11 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v29 = v12 | 7;
  size_t v20 = (void *)(((v12 | 7) + v18) & 0xFFFFFFFFFFFFFFF8);
  *size_t v19 = *v20;
  swift_release();
  uint64_t v21 = v9 + 8;
  uint64_t v28 = ~v9;
  uint64_t v22 = (void *)(((unint64_t)v19 + v9 + 8) & ~v9);
  uint64_t v23 = (const void *)(((unint64_t)v20 + v9 + 8) & ~v9);
  int v24 = v13((uint64_t)v22, 1, v7);
  int v25 = v13((uint64_t)v23, 1, v7);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(v22, v23, v7);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v22, v7);
    goto LABEL_20;
  }
  if (v25)
  {
LABEL_20:
    memcpy(v22, v23, v18);
    goto LABEL_21;
  }
  (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v22, v23, v7);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v22, 0, 1, v7);
LABEL_21:
  size_t v26 = ((v21 + ((v18 + 7) & 0xFFFFFFFFFFFFFFF8)) & v28) + v18;
  *(_OWORD *)((v30 + v26) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v29 + v26) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_24E9D9E94(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    int v8 = 2147483646;
  }
  else {
    int v8 = v7;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = v7;
  }
  uint64_t v10 = *(unsigned __int8 *)(v4 + 80);
  if (v6) {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = v10 | 7;
  uint64_t v13 = v11 + 7;
  unint64_t v14 = ((v10 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10) + v11;
  if (v9 < a2)
  {
    unint64_t v15 = ((v14 + ((v12 + 17) & ~v12) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v16 = a2 - v9;
    int v17 = v15 & 0xFFFFFFF8;
    if ((v15 & 0xFFFFFFF8) != 0) {
      unsigned int v18 = 2;
    }
    else {
      unsigned int v18 = v16 + 1;
    }
    if (v18 >= 0x10000) {
      unsigned int v19 = 4;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v18 < 0x100) {
      unsigned int v19 = 1;
    }
    if (v18 >= 2) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    switch(v20)
    {
      case 1:
        int v21 = *((unsigned __int8 *)a1 + v15);
        if (!*((unsigned char *)a1 + v15)) {
          break;
        }
        goto LABEL_31;
      case 2:
        int v21 = *(unsigned __int16 *)((char *)a1 + v15);
        if (*(_WORD *)((char *)a1 + v15)) {
          goto LABEL_31;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24E9DA098);
      case 4:
        int v21 = *(_DWORD *)((char *)a1 + v15);
        if (!v21) {
          break;
        }
LABEL_31:
        int v23 = v21 - 1;
        if ((v15 & 0xFFFFFFF8) != 0)
        {
          int v23 = 0;
          int v17 = *a1;
        }
        return v9 + (v17 | v23) + 1;
      default:
        break;
    }
  }
  uint64_t v24 = ((unint64_t)a1 + v12 + 17) & ~v12;
  if (v8 == v9)
  {
    if (v7 < 0x7FFFFFFE)
    {
      unint64_t v27 = *(void *)((v13 + v24) & 0xFFFFFFFFFFFFFFF8);
      if (v27 >= 0xFFFFFFFF) {
        LODWORD(v27) = -1;
      }
      if ((v27 + 1) >= 2) {
        return v27;
      }
      else {
        return 0;
      }
    }
    else
    {
      unsigned int v25 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v24);
      if (v25 >= 2) {
        return v25 - 1;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    unint64_t v26 = *(void *)(((v24 | 7) + v14) & 0xFFFFFFFFFFFFFFF8);
    if (v26 >= 0xFFFFFFFF) {
      LODWORD(v26) = -1;
    }
    return (v26 + 1);
  }
}

void sub_24E9DA0AC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v8 = v7;
  int v9 = *(_DWORD *)(v7 + 84);
  unsigned int v10 = v9 - 1;
  if (!v9) {
    unsigned int v10 = 0;
  }
  if (v10 <= 0x7FFFFFFE) {
    int v11 = 2147483646;
  }
  else {
    int v11 = v10;
  }
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  else {
    unsigned int v12 = v10;
  }
  uint64_t v13 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = v13 | 7;
  size_t v15 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v9) {
    ++v15;
  }
  size_t v16 = ((v13 + ((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v13) + v15;
  unint64_t v17 = ((v16 + ((v14 + 17) & ~v14) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v12 < a3)
  {
    unsigned int v18 = a3 - v12;
    if (((v16 + ((v14 + 17) & ~v14) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v19 = v18 + 1;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v19 >= 0x10000) {
      int v20 = 4;
    }
    else {
      int v20 = 2;
    }
    if (v19 < 0x100) {
      int v20 = 1;
    }
    if (v19 >= 2) {
      int v6 = v20;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v12)
  {
    if (((v16 + ((v14 + 17) & ~v14) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v21 = a2 - v12;
    }
    else {
      int v21 = 1;
    }
    if (((v16 + ((v14 + 17) & ~v14) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      unsigned int v22 = ~v12 + a2;
      bzero(a1, ((v16 + ((v14 + 17) & ~v14) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v22;
    }
    switch(v6)
    {
      case 1:
        a1[v17] = v21;
        return;
      case 2:
        *(_WORD *)&a1[v17] = v21;
        return;
      case 3:
        goto LABEL_65;
      case 4:
        *(_DWORD *)&a1[v17] = v21;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 3:
LABEL_65:
      __break(1u);
      JUMPOUT(0x24E9DA3B4);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_37;
    default:
LABEL_37:
      if (a2)
      {
LABEL_38:
        unint64_t v23 = (unint64_t)&a1[v14 + 17] & ~v14;
        if (v11 == v12)
        {
          if (v10 < 0x7FFFFFFE)
          {
            uint64_t v28 = (void *)((v15 + 7 + v23) & 0xFFFFFFFFFFFFFFF8);
            if (a2 > 0x7FFFFFFE)
            {
              void *v28 = 0;
              *(_DWORD *)uint64_t v28 = a2 - 0x7FFFFFFF;
            }
            else
            {
              void *v28 = a2;
            }
          }
          else if (v10 >= a2)
          {
            uint64_t v29 = a2 + 1;
            uint64_t v30 = *(void (**)(unint64_t, uint64_t))(v8 + 56);
            unint64_t v31 = (unint64_t)&a1[v14 + 17] & ~v14;
            v30(v31, v29);
          }
          else
          {
            if (v15 <= 3) {
              int v24 = ~(-1 << (8 * v15));
            }
            else {
              int v24 = -1;
            }
            if (v15)
            {
              int v25 = v24 & (~v10 + a2);
              if (v15 <= 3) {
                int v26 = v15;
              }
              else {
                int v26 = 4;
              }
              bzero((void *)((unint64_t)&a1[v14 + 17] & ~v14), v15);
              switch(v26)
              {
                case 2:
                  *(_WORD *)unint64_t v23 = v25;
                  break;
                case 3:
                  *(_WORD *)unint64_t v23 = v25;
                  *(unsigned char *)(v23 + 2) = BYTE2(v25);
                  break;
                case 4:
                  *(_DWORD *)unint64_t v23 = v25;
                  break;
                default:
                  *(unsigned char *)unint64_t v23 = v25;
                  break;
              }
            }
          }
        }
        else
        {
          unint64_t v27 = (void *)(((v23 | 7) + v16) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            *unint64_t v27 = a2 ^ 0x80000000;
            v27[1] = 0;
          }
          else
          {
            *unint64_t v27 = a2 - 1;
          }
        }
      }
      return;
  }
}

uint64_t sub_24E9DA3EC()
{
  return swift_getWitnessTable();
}

unint64_t sub_24E9DA730()
{
  unint64_t result = qword_26991EB70;
  if (!qword_26991EB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EB70);
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for SidebarModalitiesView();
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  sub_24E9C79E0();
  uint64_t v4 = v3 + *(int *)(v2 + 36);
  uint64_t v5 = *(void *)(v1 - 8);
  int v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v4, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v1);
  }
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t v7 = sub_24EA05E68();
  swift_release();
  uint64_t v8 = v4 + *(int *)(v7 + 40);
  if (!v6(v8, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v1);
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9DA984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for SidebarModalitiesView() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_24E9D787C(a1, v8, v5, v6, a2);
}

uint64_t sub_24E9DAA20()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for SidebarModalitiesView();
  uint64_t v15 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v13 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v16 = type metadata accessor for SidebarModality();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v16 - 8) + 80);
  uint64_t v14 = (v15 + 32) & ~v15;
  sub_24E9C79E0();
  uint64_t v4 = v0 + v14 + *(int *)(v2 + 36);
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v4, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v1);
  }
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t v7 = sub_24EA05E68();
  swift_release();
  uint64_t v8 = v4 + *(int *)(v7 + 40);
  if (!v6(v8, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v1);
  }
  swift_release();
  uint64_t v9 = v0 + ((v14 + v13 + v3) & ~v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v1);
  uint64_t v10 = v9 + *(int *)(v16 + 40);
  uint64_t v11 = sub_24EA05C28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  return swift_deallocObject();
}

uint64_t sub_24E9DACFC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for SidebarModalitiesView() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for SidebarModality() - 8);
  uint64_t v6 = v0 + ((v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24E9D8140(v0 + v3, v6, v1);
}

uint64_t sub_24E9DADEC()
{
  return sub_24E9D82B4();
}

uint64_t sub_24E9DADF8@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9D8350(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_24E9DAE04@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E9D83DC(*(void *)(v1 + 32), *(char **)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_24E9DAE10()
{
  unint64_t result = qword_26991EB90;
  if (!qword_26991EB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991EB88);
    sub_24E9B7F78(&qword_26991EB98, &qword_26991EBA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EB90);
  }
  return result;
}

uint64_t sub_24E9DAEB0()
{
  uint64_t v0 = sub_24EA05DF8();
  __swift_allocate_value_buffer(v0, qword_26B1CF2C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1CF2C0);
  return sub_24EA05DE8();
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

uint64_t TabBarFeatureEnvironment.init(itemActionHandler:resolveUpNextCount:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t type metadata accessor for TabBarFeatureEnvironment()
{
  return __swift_instantiateGenericMetadata();
}

void sub_24E9DAFA8(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(v2, sel_selectedViewController);
  if (!v4) {
    return;
  }
  id v19 = v4;
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = objc_msgSend(v5, sel_topViewController);
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_contentScrollViewForEdge_, 4);
  if (!v8)
  {
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24EA05DF8();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B1CF2C0);
    id v12 = v7;
    uint64_t v13 = sub_24EA05DD8();
    os_log_type_t v14 = sub_24EA06C28();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138412290;
      id v17 = v12;
      sub_24EA06CB8();
      *uint64_t v16 = v7;

      _os_log_impl(&dword_24E9A6000, v13, v14, "[TabBarController] Cannot find scroll view in %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991EBA8);
      swift_arrayDestroy();
      MEMORY[0x253346D80](v16, -1, -1);
      MEMORY[0x253346D80](v15, -1, -1);

      return;
    }

LABEL_12:
    uint64_t v10 = v19;
    goto LABEL_13;
  }
  id v18 = v8;
  objc_msgSend(v8, sel_adjustedContentInset);
  objc_msgSend(v18, sel_setContentOffset_animated_, a1 & 1, 0.0, -v9);

  uint64_t v10 = v18;
LABEL_13:
}

void sub_24E9DB2E0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_parentViewController);
  if (!v2) {
    id v2 = v0;
  }
  id v3 = objc_msgSend(v2, sel_navigationItem);
  id v4 = objc_msgSend(v1, sel_selectedViewController);
  if (v4
    && (uint64_t v5 = v4,
        id v6 = objc_msgSend(v4, sel_navigationItem),
        v5,
        id v7 = objc_msgSend(v6, sel_title),
        v6,
        v7))
  {
    sub_24EA06938();

    id v9 = (id)sub_24EA06908();
    swift_bridgeObjectRelease();
    id v8 = v9;
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  objc_msgSend(v3, sel_setTitle_);
}

id sub_24E9DB574()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TabBarController()
{
  return self;
}

unint64_t sub_24E9DB5D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1CCB40);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    id v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7C0);
  uint64_t v6 = sub_24EA06E88();
  id v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24E9C8E28(v12, (uint64_t)v5, qword_26B1CCB40);
    unint64_t result = sub_24E9DDD78((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_24EA05DA8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_24E9DB7C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD7D0);
  uint64_t v2 = sub_24EA06E88();
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
    sub_24E9C8E28(v6, (uint64_t)&v13, &qword_26B1CD7A8);
    uint64_t v7 = v13;
    unint64_t result = sub_24E9DDE14(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_24E9DEF4C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_24E9DB8F4(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_height);
  double v8 = v7;
  objc_msgSend(v3, sel_heightExtension);
  double v10 = v8 + v9;
  BOOL v11 = &v3[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_initialYContentOffsets];
  swift_beginAccess();
  uint64_t v12 = *(void *)v11;
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_24E9DDD78(a1), (v14 & 1) != 0))
  {
    double v15 = *(double *)(*(void *)(v12 + 56) + 8 * v13);
    swift_endAccess();
    double v16 = a3 - v15;
    objc_msgSend(v4, sel_height);
    if (v17 <= v10 - v16) {
      double v17 = v10 - v16;
    }
    if (v10 >= v17) {
      double v10 = v17;
    }
  }
  else
  {
    swift_endAccess();
  }
  return *(void *)&v10;
}

uint64_t sub_24E9DB9E4()
{
  uint64_t v0 = sub_24EA05DA8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v19 - v5;
  uint64_t result = sub_24EA05D48();
  uint64_t v8 = result;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v10 = *(void *)(result + 16);
  if (v10)
  {
    unint64_t v11 = 0;
    uint64_t v24 = v1 + 16;
    int v25 = (void (**)(char *, char *, uint64_t))(v1 + 32);
    BOOL v20 = (uint64_t (**)(char *, uint64_t))(v1 + 8);
    uint64_t v21 = v10;
    uint64_t v22 = result;
    unint64_t v23 = v4;
    while (v11 < *(void *)(v8 + 16))
    {
      unint64_t v12 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
      uint64_t v13 = *(void *)(v1 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v6, v8 + v12 + v13 * v11, v0);
      if (sub_24EA05D98())
      {
        uint64_t result = (*v20)(v6, v0);
      }
      else
      {
        char v14 = *v25;
        (*v25)(v4, v6, v0);
        uint64_t v15 = v26;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24E9DE1E4(0, *(void *)(v15 + 16) + 1, 1);
          uint64_t v15 = v26;
        }
        unint64_t v17 = *(void *)(v15 + 16);
        unint64_t v16 = *(void *)(v15 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_24E9DE1E4(v16 > 1, v17 + 1, 1);
          uint64_t v15 = v26;
        }
        *(void *)(v15 + 16) = v17 + 1;
        unint64_t v18 = v15 + v12 + v17 * v13;
        uint64_t v4 = v23;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v14)(v18, v23, v0);
        uint64_t v26 = v15;
        uint64_t v10 = v21;
        uint64_t v8 = v22;
      }
      if (v10 == ++v11)
      {
        uint64_t v9 = v26;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

void sub_24E9DBC40(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v11 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar;
  sub_24EA05D78();
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_init);
  char v14 = &v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_layout];
  *(_OWORD *)char v14 = xmmword_24EA0AF90;
  *((_OWORD *)v14 + 1) = xmmword_24EA0AFA0;
  *((_OWORD *)v14 + 2) = xmmword_24EA0AFB0;
  *((_OWORD *)v14 + 3) = xmmword_24EA0AFC0;
  uint64_t v15 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  unint64_t v16 = &v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint];
  *(void *)unint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  v16[16] = 1;
  unint64_t v17 = &v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset];
  *(void *)unint64_t v17 = 0;
  v17[8] = 1;
  unint64_t v18 = &v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delta];
  *(void *)unint64_t v18 = 0;
  v18[8] = 1;
  uint64_t v19 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_initialYContentOffsets;
  *(void *)&v13[v19] = sub_24E9DB5D0(MEMORY[0x263F8EE78]);
  v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating] = 0;
  v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isBouncing] = 0;
  v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen] = 0;
  *(void *)&v13[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView] = 0;
  swift_unknownObjectWeakInit();

  v52.receiver = v13;
  v52.super_class = ObjectType;
  BOOL v20 = (char *)objc_msgSendSuper2(&v52, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v20, sel_setClipsToBounds_, 0);
  uint64_t v21 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel;
  uint64_t v22 = *(void **)&v20[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel];
  objc_msgSend(v22, sel_setAutoresizingMask_, 2);
  uint64_t v23 = *MEMORY[0x263F83268];
  id v24 = v22;
  unint64_t v25 = (unint64_t)objc_msgSend(v24, sel_accessibilityTraits);
  if ((v23 & ~v25) != 0) {
    uint64_t v26 = v23;
  }
  else {
    uint64_t v26 = 0;
  }
  objc_msgSend(v24, sel_setAccessibilityTraits_, v26 | v25);

  id v27 = objc_msgSend(v20, sel_traitCollection);
  uint64_t v28 = (void *)sub_24EA06C68();

  uint64_t v29 = self;
  uint64_t v30 = *MEMORY[0x263F835E0];
  sub_24EA06938();
  unint64_t v31 = (void *)sub_24EA06908();
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v29, sel__preferredFontForTextStyle_design_variant_weight_maximumContentSizeCategory_compatibleWithTraitCollection_, v30, v31, 0, *MEMORY[0x263F83468], v28, *MEMORY[0x263F81800]);

  if (v32)
  {
    id v33 = objc_msgSend(v32, sel_fontDescriptor);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD818);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24EA097F0;
    uint64_t v35 = (void *)*MEMORY[0x263F81748];
    *(void *)(inited + 64) = MEMORY[0x263F8D310];
    *(void *)(inited + 32) = v35;
    *(void *)(inited + 40) = 1819308129;
    *(void *)(inited + 48) = 0xE400000000000000;
    id v36 = v35;
    sub_24E9DB7C4(inited);
    type metadata accessor for AttributeName(0);
    sub_24E9DEF04((unint64_t *)&unk_26B1CD780, 255, type metadata accessor for AttributeName);
    uint64_t v37 = (void *)sub_24EA06838();
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v33, sel_fontDescriptorByAddingAttributes_, v37);

    id v39 = *(id *)&v20[v21];
    id v40 = objc_msgSend(v29, sel_fontWithDescriptor_size_, v38, 0.0);
    objc_msgSend(v39, sel_setFont_, v40);

    char v41 = *(void **)&v20[v21];
    uint64_t v42 = self;
    id v43 = v41;
    id v44 = objc_msgSend(v42, sel_labelColor);
    objc_msgSend(v43, sel_setTextColor_, v44);

    id v45 = *(id *)&v20[v21];
    uint64_t v46 = (void *)sub_24EA06908();
    objc_msgSend(v45, sel_setText_, v46);

    objc_msgSend(v20, sel_addSubview_, *(void *)&v20[v21]);
    uint64_t v47 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar;
    __n128 v48 = *(void **)&v20[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar];
    objc_msgSend(v48, sel_setAutoresizingMask_, 2);
    sub_24E9DEF04(&qword_26991EC88, v49, (void (*)(uint64_t))type metadata accessor for FloatingTitleView);
    unint64_t v50 = v20;
    id v51 = v48;
    sub_24EA05D68();

    objc_msgSend(v50, sel_addSubview_, *(void *)&v20[v47]);
    objc_msgSend(v50, sel_setDirectionalLayoutMargins_, 0.0, 20.0, 0.0, 20.0);
    objc_msgSend(v50, sel_setHideStandardTitle_, 1);
    objc_msgSend(v50, sel_setHideBackButton_, 1);
    objc_msgSend(v50, sel_setHideLeadingBarButtons_, 1);
    objc_msgSend(v50, sel_setHideCenterBarButtons_, 1);
    objc_msgSend(v50, sel_setHideTrailingBarButtons_, 1);
    sub_24E9DC844();
    objc_msgSend(v50, sel_setNeedsLayout);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24E9DC2A0(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F83468];
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  id v2 = v1;
  return sub_24EA05E08();
}

id sub_24E9DC340()
{
  uint64_t v1 = v0;
  v42.receiver = v0;
  v42.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v42, sel_layoutSubviews);
  id v2 = objc_msgSend(v0, sel_superview);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_setClipsToBounds_, 0);
  }
  objc_msgSend(v1, sel_frame);
  double v5 = v4;
  objc_msgSend(v1, sel_directionalLayoutMargins);
  double v7 = v5 - v6;
  objc_msgSend(v1, sel_directionalLayoutMargins);
  double v9 = v7 - v8;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel];
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v10, sel_sizeThatFits_, v11, v12);
  objc_msgSend(v1, sel_directionalLayoutMargins);
  double v14 = v13;
  objc_msgSend(v10, sel_frame);
  objc_msgSend(v10, sel_setFrame_, v14);
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar];
  objc_msgSend(v1, sel_directionalLayoutMargins);
  double v17 = v16;
  objc_msgSend(v15, sel_frame);
  double v19 = v18;
  objc_msgSend(v15, sel_intrinsicContentSize);
  objc_msgSend(v15, sel_setFrame_, v17, v19, v9, v20);
  uint64_t v21 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isBouncing;
  if (v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isBouncing] == 1
    && (v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delta + 8] & 1) == 0)
  {
    objc_msgSend(v10, sel__lastLineBaseline);
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v10, sel_bounds);
    CGRectGetHeight(v43);
    id v22 = objc_msgSend(v1, sel_traitCollection);
    sub_24EA05CE8();

    objc_msgSend(v10, sel_center);
    objc_msgSend(v10, sel_setCenter_);
    objc_msgSend(v10, sel_frame);
    CGFloat v23 = CGRectGetMaxY(v44) + -20.0;
    double v24 = v23 / 44.0;
    BOOL v25 = v23 < 0.0;
    double v26 = 0.0;
    if (v25) {
      double v24 = 0.0;
    }
    if (v24 > 0.0) {
      double v26 = v24;
    }
    if (v26 > 1.0) {
      double v26 = 1.0;
    }
    objc_msgSend(v10, sel_setAlpha_, v26);
    objc_msgSend(v10, sel_frame);
    fmax(CGRectGetMaxY(v45) + 6.0, 6.0);
    objc_msgSend(v15, sel_frame);
    objc_msgSend(v15, sel_setFrame_);
    v1[v21] = 0;
  }
  else
  {
    sub_24E9DC844();
  }
  objc_msgSend(v15, sel_frame);
  double v27 = CGRectGetHeight(v46) + 6.0 + 10.0;
  objc_msgSend(v10, sel__lastLineBaseline);
  objc_msgSend(v1, sel_bounds);
  id v28 = objc_msgSend(v1, sel_traitCollection);
  sub_24EA05CE8();
  double v30 = v29;

  objc_msgSend(v10, sel_frame);
  double v31 = v30 + CGRectGetHeight(v47);
  objc_msgSend(v1, sel_height);
  double v33 = v32;
  objc_msgSend(v1, sel_heightExtension);
  if (v33 + v34 != v27 + v31)
  {
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_24EA05DF8();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B1CF2C0);
    id v36 = sub_24EA05DD8();
    os_log_type_t v37 = sub_24EA06C28();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v38 = 0;
      _os_log_impl(&dword_24E9A6000, v36, v37, "[FloatingTitleView] Height changed. Clearing initial offsets", v38, 2u);
      MEMORY[0x253346D80](v38, -1, -1);
    }

    unint64_t v39 = sub_24E9DB5D0(MEMORY[0x263F8EE78]);
    id v40 = (unint64_t *)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_initialYContentOffsets];
    swift_beginAccess();
    *id v40 = v39;
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v1, sel_setHeight_, v27);
  return objc_msgSend(v1, sel_setHeightExtension_, v31);
}

id sub_24E9DC844()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_sizeThatFits_, v2, v3);
  double v4 = *(void **)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar];
  objc_msgSend(v0, sel_frame);
  CGRectGetMaxY(v11);
  objc_msgSend(v4, sel_intrinsicContentSize);
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v4, sel_frame);
  CGRectGetMinY(v12);
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v1, sel_setFrame_);
  objc_msgSend(v1, sel_frame);
  CGFloat v5 = CGRectGetMaxY(v13) + -20.0;
  double v6 = v5 / 44.0;
  BOOL v7 = v5 < 0.0;
  double v8 = 0.0;
  if (v7) {
    double v6 = 0.0;
  }
  if (v6 > 0.0) {
    double v8 = v6;
  }
  if (v8 > 1.0) {
    double v8 = 1.0;
  }
  return objc_msgSend(v1, sel_setAlpha_, v8);
}

void *sub_24E9DC9E8(id a1)
{
  double v2 = v1;
  uint64_t v4 = sub_24EA05DA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  double v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  CGRect v11 = (char *)&v73 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  double v14 = (char *)&v73 - v13;
  uint64_t result = (void *)MEMORY[0x270FA5388](v12);
  double v17 = (char *)&v73 - v16;
  if (v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen]) {
    return result;
  }
  double v18 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar];
  uint64_t v19 = sub_24EA05D38();
  if (v20)
  {
    sub_24E9DC844();
LABEL_16:
    return objc_msgSend(v2, sel_setNeedsLayout);
  }
  unint64_t v79 = v19;
  uint64_t v21 = sub_24E9DB9E4();
  if (v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating] == 1)
  {
    uint64_t result = (void *)swift_bridgeObjectRelease();
    if ((v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint + 16] & 1) != 0
      || (v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset + 8] & 1) != 0)
    {
      return result;
    }
    objc_msgSend(a1, sel_contentOffset);
    id v22 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel];
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel], sel_frame);
    CGRectGetMaxY(v87);
    objc_msgSend(v18, sel_frame);
    objc_msgSend(v18, sel_setFrame_);
    objc_msgSend(v18, sel_frame);
    CGRectGetMinY(v88);
    objc_msgSend(v22, sel_frame);
    CGRectGetHeight(v89);
    objc_msgSend(v22, sel_frame);
    objc_msgSend(v22, sel_setFrame_);
    objc_msgSend(v22, sel_frame);
    double v23 = CGRectGetMaxY(v90) + -20.0;
    if (v23 < 0.0) {
      double v24 = 0.0;
    }
    else {
      double v24 = v23 / 44.0;
    }
    if (v24 <= 0.0) {
      double v24 = 0.0;
    }
    if (v24 > 1.0) {
      double v24 = 1.0;
    }
    objc_msgSend(v22, sel_setAlpha_, v24);
    goto LABEL_16;
  }
  uint64_t v83 = v8;
  uint64_t v25 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView;
  double v26 = *(void **)&v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView];
  uint64_t v80 = v5;
  if (v26)
  {
    uint64_t v82 = v21;
    uint64_t v75 = v18;
    id v27 = v26;
    id v28 = objc_msgSend(a1, sel_window);

    if (v28 && v27 == a1)
    {
      __n128 v48 = *(void **)&v1[v25];
      *(void *)&v1[v25] = 0;

      objc_msgSend(v1, sel_height);
      double v50 = v49;
      objc_msgSend(v1, sel_heightExtension);
      double v52 = v50 + v51;
      objc_msgSend(v1, sel_frame);
      double v53 = v52 - CGRectGetHeight(v92);
      if (v53 > 0.0) {
        double v54 = v53;
      }
      else {
        double v54 = 0.0;
      }
      uint64_t result = objc_msgSend(a1, sel_adjustedContentInset);
      if ((v79 & 0x8000000000000000) != 0)
      {
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
      uint64_t v5 = v80;
      if (v79 >= *(void *)(v82 + 16))
      {
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
      double v56 = -(v55 + v54);
      (*(void (**)(char *, unint64_t, uint64_t))(v80 + 16))(v17, v82+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(void *)(v80 + 72) * v79, v4);
      swift_bridgeObjectRelease();
      uint64_t v57 = &v1[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_initialYContentOffsets];
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v84 = *(void *)v57;
      *(void *)uint64_t v57 = 0x8000000000000000;
      sub_24E9DE870((uint64_t)v17, isUniquelyReferenced_nonNull_native, v56);
      *(void *)uint64_t v57 = v84;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v17, v4);
      swift_endAccess();

      double v18 = v75;
    }
    else
    {

      swift_bridgeObjectRelease();
      uint64_t v5 = v80;
      double v18 = v75;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v1, sel_height);
  double v30 = v29;
  objc_msgSend(v1, sel_heightExtension);
  CGFloat v32 = v30 + v31;
  objc_msgSend(v1, sel_bounds);
  if (v32 > CGRectGetHeight(v91)
    || (id v33 = objc_msgSend(a1, sel_window), v33, !v33)
    || (objc_msgSend(a1, sel_adjustedContentInset), double v35 = -v34, objc_msgSend(a1, sel_contentOffset), v36 >= v35))
  {
    sub_24E9DC844();
    return objc_msgSend(v2, sel_setNeedsLayout);
  }
  uint64_t result = (void *)sub_24EA05D48();
  os_log_type_t v37 = result;
  uint64_t v38 = MEMORY[0x263F8EE78];
  uint64_t v85 = MEMORY[0x263F8EE78];
  uint64_t v39 = result[2];
  uint64_t v78 = v4;
  if (v39)
  {
    uint64_t v74 = a1;
    uint64_t v75 = v18;
    uint64_t v73 = v11;
    unint64_t v40 = 0;
    uint64_t v81 = (uint64_t (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v82 = v5 + 16;
    uint64_t v76 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
    uint64_t v77 = v39;
    while (v40 < v37[2])
    {
      unint64_t v41 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v42 = *(void *)(v5 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, (unint64_t)v37 + v41 + v42 * v40, v4);
      if (sub_24EA05D98())
      {
        uint64_t result = (void *)(*v76)(v14, v4);
      }
      else
      {
        CGRect v43 = *v81;
        (*v81)(v83, v14, v4);
        uint64_t v44 = v85;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24E9DE1E4(0, *(void *)(v44 + 16) + 1, 1);
          uint64_t v44 = v85;
        }
        unint64_t v46 = *(void *)(v44 + 16);
        unint64_t v45 = *(void *)(v44 + 24);
        if (v46 >= v45 >> 1)
        {
          sub_24E9DE1E4(v45 > 1, v46 + 1, 1);
          uint64_t v44 = v85;
        }
        *(void *)(v44 + 16) = v46 + 1;
        unint64_t v47 = v44 + v41 + v46 * v42;
        uint64_t v4 = v78;
        uint64_t result = (void *)v43((char *)v47, v83, v78);
        uint64_t v85 = v44;
        uint64_t v5 = v80;
        uint64_t v39 = v77;
      }
      if (v39 == ++v40)
      {
        uint64_t v38 = v85;
        CGRect v11 = v73;
        a1 = v74;
        goto LABEL_46;
      }
    }
    __break(1u);
    goto LABEL_56;
  }
LABEL_46:
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if ((v79 & 0x8000000000000000) != 0)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  if (v79 >= *(void *)(v38 + 16))
  {
LABEL_59:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v11, v38+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v79, v4);
  swift_release();
  uint64_t v59 = sub_24EA05D48();
  uint64_t v60 = sub_24E9B5774((uint64_t)v11, v59);
  uint64_t v61 = v4;
  char v63 = v62;
  swift_bridgeObjectRelease();
  if (v63) {
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v61);
  }
  uint64_t v64 = &v2[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate];
  if (MEMORY[0x253346E30](&v2[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate])
    && (uint64_t v65 = *((void *)v64 + 1),
        uint64_t ObjectType = swift_getObjectType(),
        char v67 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 8))(v2, v60, ObjectType, v65),
        swift_unknownObjectRelease(),
        (v67 & 1) != 0))
  {
    objc_msgSend(a1, sel_contentOffset);
    double v69 = v68;
    double v71 = v70;
    objc_msgSend(a1, sel_adjustedContentInset);
    sub_24E9DD288(v69, v71, -v72);
  }
  else
  {
    sub_24E9DC844();
    objc_msgSend(v2, sel_setNeedsLayout);
  }
  return (void *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v78);
}

id sub_24E9DD288(double a1, double a2, double a3)
{
  v3[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isBouncing] = 1;
  uint64_t v4 = (double *)&v3[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delta];
  *uint64_t v4 = a2 - a3;
  *((unsigned char *)v4 + 8) = 0;
  uint64_t v5 = *(void **)&v3[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel];
  objc_msgSend(v5, sel__lastLineBaseline);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v5, sel_bounds);
  CGRectGetHeight(v14);
  id v6 = objc_msgSend(v3, sel_traitCollection);
  sub_24EA05CE8();

  objc_msgSend(v5, sel_center);
  objc_msgSend(v5, sel_setCenter_);
  objc_msgSend(v5, sel_frame);
  CGFloat v7 = CGRectGetMaxY(v15) + -20.0;
  double v8 = v7 / 44.0;
  BOOL v9 = v7 < 0.0;
  double v10 = 0.0;
  if (v9) {
    double v8 = 0.0;
  }
  if (v8 > 0.0) {
    double v10 = v8;
  }
  if (v10 > 1.0) {
    double v10 = 1.0;
  }
  objc_msgSend(v5, sel_setAlpha_, v10);
  CGRect v11 = *(void **)&v3[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar];
  objc_msgSend(v5, sel_frame);
  CGRectGetMaxY(v16);
  objc_msgSend(v11, sel_frame);
  objc_msgSend(v11, sel_setFrame_);
  return objc_msgSend(v3, sel_setNeedsLayout);
}

uint64_t type metadata accessor for FloatingTitleView()
{
  return self;
}

uint64_t sub_24E9DD50C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate;
  uint64_t result = MEMORY[0x253346E30](v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate);
  if (result)
  {
    uint64_t v6 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, ObjectType, v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24E9DD5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate;
  uint64_t result = MEMORY[0x253346E30](v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate);
  if (result)
  {
    uint64_t v6 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24))(v2, a2, ObjectType, v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_24E9DD7BC(void *a1, char a2)
{
  uint64_t v5 = (void *)MEMORY[0x253346E30](v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate);
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_scrollViewDidEndDragging_willDecelerate_)) {
      objc_msgSend(v6, sel_scrollViewDidEndDragging_willDecelerate_, a1, a2 & 1);
    }
    swift_unknownObjectRelease();
  }
  if ((a2 & 1) == 0
    && *(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) == 1
    && (*(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen) & 1) == 0)
  {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) = 0;
    uint64_t v7 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset;
    *(void *)uint64_t v7 = 0;
    *(unsigned char *)(v7 + 8) = 1;
    uint64_t v8 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint;
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
    *(unsigned char *)(v8 + 16) = 1;
    id v9 = a1;
    sub_24E9DC9E8(v9);
  }
}

void sub_24E9DDB9C(void *a1, SEL *a2)
{
  uint64_t v5 = (void *)MEMORY[0x253346E30](v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate);
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, *a2)) {
      objc_msgSend(v6, *a2, a1);
    }
    swift_unknownObjectRelease();
  }
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) == 1
    && (*(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen) & 1) == 0)
  {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating) = 0;
    uint64_t v7 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset;
    *(void *)uint64_t v7 = 0;
    *(unsigned char *)(v7 + 8) = 1;
    uint64_t v8 = v2 + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint;
    *(void *)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
    *(unsigned char *)(v8 + 16) = 1;
    id v9 = a1;
    sub_24E9DC9E8(v9);
  }
}

uint64_t getEnumTagSinglePayload for FloatingTitleView.Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FloatingTitleView.Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FloatingTitleView.Layout()
{
  return &type metadata for FloatingTitleView.Layout;
}

unint64_t sub_24E9DDD78(uint64_t a1)
{
  sub_24EA05DA8();
  sub_24E9DEF04(&qword_26B1CCB28, 255, MEMORY[0x263F3E140]);
  uint64_t v2 = sub_24EA06898();
  return sub_24E9DDEA8(a1, v2);
}

unint64_t sub_24E9DDE14(uint64_t a1)
{
  sub_24EA06938();
  sub_24EA07048();
  sub_24EA06968();
  uint64_t v2 = sub_24EA07088();
  swift_bridgeObjectRelease();
  return sub_24E9DE06C(a1, v2);
}

unint64_t sub_24E9DDEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24EA05DA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    CGRect v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24E9DEF04((unint64_t *)&unk_26B1CCB30, 255, MEMORY[0x263F3E140]);
      char v15 = sub_24EA068D8();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_24E9DE06C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24EA06938();
    uint64_t v8 = v7;
    if (v6 == sub_24EA06938() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24EA07028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24EA06938();
          uint64_t v15 = v14;
          if (v13 == sub_24EA06938() && v15 == v16) {
            break;
          }
          char v18 = sub_24EA07028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_24E9DE1E4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E9DE204(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24E9DE204(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD7F8);
  uint64_t v10 = *(void *)(sub_24EA05DA8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24EA05DA8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  char v18 = (char *)v13 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24EA06E98();
  __break(1u);
  return result;
}

uint64_t sub_24E9DE444(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24EA05DA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7C0);
  int v44 = a2;
  uint64_t v10 = sub_24EA06E78();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    unint64_t v40 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v42 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v41 = (unint64_t)(v12 + 63) >> 6;
    CGRect v43 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    unint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v46 = v5;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v41) {
          goto LABEL_34;
        }
        unint64_t v23 = v42[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v41) {
            goto LABEL_34;
          }
          unint64_t v23 = v42[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v41)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v40;
              if (v44)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v9 + 32);
                if (v38 >= 64) {
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v42 = -1 << v38;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v42[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v41) {
                  goto LABEL_34;
                }
                unint64_t v23 = v42[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = v9;
      uint64_t v26 = *(void *)(v9 + 48);
      uint64_t v27 = v6;
      uint64_t v28 = *(void *)(v6 + 72);
      uint64_t v29 = v26 + v28 * v21;
      if (v44) {
        (*v45)(v8, v29, v46);
      }
      else {
        (*v43)(v8, v29, v46);
      }
      uint64_t v30 = *(void *)(*(void *)(v25 + 56) + 8 * v21);
      sub_24E9DEF04(&qword_26B1CCB28, 255, MEMORY[0x263F3E140]);
      uint64_t result = sub_24EA06898();
      uint64_t v31 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v16 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v45)(*(void *)(v11 + 48) + v28 * v19, v8, v46);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v30;
      ++*(void *)(v11 + 16);
      uint64_t v6 = v27;
      uint64_t v9 = v25;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24E9DE870(uint64_t a1, char a2, double a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_24EA05DA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24E9DDD78(a1);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    char v18 = v13;
    uint64_t v19 = v12[3];
    if (v19 >= result && (a2 & 1) != 0)
    {
LABEL_7:
      unint64_t v20 = *v4;
      if (v18)
      {
LABEL_8:
        *(double *)(v20[7] + 8 * v14) = a3;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= result && (a2 & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_24E9DEACC();
      goto LABEL_7;
    }
    sub_24E9DE444(result, a2 & 1);
    uint64_t result = sub_24E9DDD78(a1);
    if ((v18 & 1) == (v21 & 1))
    {
      unint64_t v14 = result;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      return sub_24E9DEA14(v14, (uint64_t)v11, v20, a3);
    }
  }
  uint64_t result = sub_24EA07038();
  __break(1u);
  return result;
}

uint64_t sub_24E9DEA14(unint64_t a1, uint64_t a2, void *a3, double a4)
{
  a3[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a3[6];
  uint64_t v9 = sub_24EA05DA8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(double *)(a3[7] + 8 * a1) = a4;
  uint64_t v11 = a3[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a3[2] = v13;
  }
  return result;
}

void *sub_24E9DEACC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EA05DA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7C0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24EA06E68();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v6 + 56) + v18);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    *(void *)(*(void *)(v8 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_24E9DED6C()
{
  *(void *)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar;
  sub_24EA05D78();
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v2 = &v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_layout];
  *uint64_t v2 = xmmword_24EA0AF90;
  v2[1] = xmmword_24EA0AFA0;
  v2[2] = xmmword_24EA0AFB0;
  v2[3] = xmmword_24EA0AFC0;
  uint64_t v3 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v4 = &v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationStartingPoint];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v5 = &v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_animationOffset];
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  uint64_t v6 = &v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delta];
  *(void *)uint64_t v6 = 0;
  void v6[8] = 1;
  uint64_t v7 = OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_initialYContentOffsets;
  *(void *)&v0[v7] = sub_24E9DB5D0(MEMORY[0x263F8EE78]);
  v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isAnimating] = 0;
  v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isBouncing] = 0;
  v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_isFrozen] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView] = 0;
  swift_unknownObjectWeakInit();

  sub_24EA06E48();
  __break(1u);
}

uint64_t sub_24E9DEF04(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_24E9DEF4C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24E9DEF5C(uint64_t a1)
{
  return a1;
}

double SignOutAnimationState.horizontalOffset.getter()
{
  return *(double *)v0;
}

double SignOutAnimationState.firstLineVerticalOffset.getter()
{
  return *(double *)(v0 + 8);
}

double SignOutAnimationState.secondLineVerticalOffset.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t SignOutAnimationState.isSecondLineVisible.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t SignOutAnimationState.init(horizontalOffset:firstLineVerticalOffset:secondLineVerticalOffset:isSecondLineVisible:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(unsigned char *)(a2 + 24) = result;
  return result;
}

uint64_t SignOutAnimationState.hash(into:)()
{
  return sub_24EA07068();
}

unint64_t sub_24E9DF024(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E9DF0AC()
{
  return sub_24E9DF024(*v0);
}

uint64_t sub_24E9DF0B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9DFB60(a1, a2);
  *a3 = result;
  return result;
}

void sub_24E9DF0DC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24E9DF0E8(uint64_t a1)
{
  unint64_t v2 = sub_24E9DF740();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9DF124(uint64_t a1)
{
  unint64_t v2 = sub_24E9DF740();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SignOutAnimationState.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EC90);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v10 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9DF740();
  sub_24EA070A8();
  uint64_t v13 = v9;
  HIBYTE(v12) = 0;
  sub_24E9DF794();
  sub_24EA06FE8();
  if (!v2)
  {
    uint64_t v13 = v8;
    HIBYTE(v12) = 1;
    sub_24EA06FE8();
    uint64_t v13 = v10;
    HIBYTE(v12) = 2;
    sub_24EA06FE8();
    LOBYTE(v13) = 3;
    sub_24EA06FC8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SignOutAnimationState.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t SignOutAnimationState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ECA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9DF740();
  sub_24EA07098();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_24E9DF7E8();
    sub_24EA06F68();
    uint64_t v9 = v15;
    HIBYTE(v14) = 1;
    sub_24EA06F68();
    uint64_t v10 = v15;
    HIBYTE(v14) = 2;
    sub_24EA06F68();
    uint64_t v12 = v15;
    LOBYTE(v15) = 3;
    char v13 = sub_24EA06F48();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v13 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9DF614@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutAnimationState.init(from:)(a1, a2);
}

uint64_t sub_24E9DF62C(void *a1)
{
  return SignOutAnimationState.encode(to:)(a1);
}

uint64_t sub_24E9DF644()
{
  return sub_24EA07088();
}

uint64_t sub_24E9DF6A4()
{
  return sub_24EA07088();
}

uint64_t _s14FitnessAppRoot21SignOutAnimationStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && *(double *)(a1 + 8) == *(double *)(a2 + 8)
    && *(double *)(a1 + 16) == *(double *)(a2 + 16))
  {
    return (*(unsigned __int8 *)(a2 + 24) ^ *(unsigned __int8 *)(a1 + 24) ^ 1) & 1;
  }
  else
  {
    return 0;
  }
}

unint64_t sub_24E9DF740()
{
  unint64_t result = qword_26991EC98;
  if (!qword_26991EC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EC98);
  }
  return result;
}

unint64_t sub_24E9DF794()
{
  unint64_t result = qword_26991ECA0;
  if (!qword_26991ECA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECA0);
  }
  return result;
}

unint64_t sub_24E9DF7E8()
{
  unint64_t result = qword_26991ECB0;
  if (!qword_26991ECB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECB0);
  }
  return result;
}

unint64_t sub_24E9DF840()
{
  unint64_t result = qword_26991ECB8;
  if (!qword_26991ECB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECB8);
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SignOutAnimationState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SignOutAnimationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignOutAnimationState()
{
  return &type metadata for SignOutAnimationState;
}

unsigned char *storeEnumTagSinglePayload for SignOutAnimationState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9DFA20);
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

ValueMetadata *type metadata accessor for SignOutAnimationState.CodingKeys()
{
  return &type metadata for SignOutAnimationState.CodingKeys;
}

unint64_t sub_24E9DFA5C()
{
  unint64_t result = qword_26991ECC0;
  if (!qword_26991ECC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECC0);
  }
  return result;
}

unint64_t sub_24E9DFAB4()
{
  unint64_t result = qword_26991ECC8;
  if (!qword_26991ECC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECC8);
  }
  return result;
}

unint64_t sub_24E9DFB0C()
{
  unint64_t result = qword_26991ECD0;
  if (!qword_26991ECD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECD0);
  }
  return result;
}

uint64_t sub_24E9DFB60(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024EA16590 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EA165B0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EA165D0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024EA165F0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

BOOL static NetworkConditions.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24E9DFD0C(char a1)
{
  return *(void *)&aAvailablunavai[8 * a1];
}

uint64_t sub_24E9DFD2C(uint64_t a1)
{
  unint64_t v2 = sub_24E9E03A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9DFD68(uint64_t a1)
{
  unint64_t v2 = sub_24E9E03A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9DFDA4()
{
  return sub_24E9DFD0C(*v0);
}

uint64_t sub_24E9DFDAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9E04C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9DFDD4(uint64_t a1)
{
  unint64_t v2 = sub_24E9E02A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9DFE10(uint64_t a1)
{
  unint64_t v2 = sub_24E9E02A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9DFE4C(uint64_t a1)
{
  unint64_t v2 = sub_24E9E0350();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9DFE88(uint64_t a1)
{
  unint64_t v2 = sub_24E9E0350();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9DFEC4(uint64_t a1)
{
  unint64_t v2 = sub_24E9E02FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9DFF00(uint64_t a1)
{
  unint64_t v2 = sub_24E9E02FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NetworkConditions.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ECD8);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ECE0);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ECE8);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ECF0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9E02A8();
  sub_24EA070A8();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24E9E0350();
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24E9E02FC();
      uint64_t v15 = v21;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24E9E03A4();
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24E9E02A8()
{
  unint64_t result = qword_26991ECF8;
  if (!qword_26991ECF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ECF8);
  }
  return result;
}

unint64_t sub_24E9E02FC()
{
  unint64_t result = qword_26991ED00;
  if (!qword_26991ED00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED00);
  }
  return result;
}

unint64_t sub_24E9E0350()
{
  unint64_t result = qword_26991ED08;
  if (!qword_26991ED08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED08);
  }
  return result;
}

unint64_t sub_24E9E03A4()
{
  unint64_t result = qword_26991ED10;
  if (!qword_26991ED10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED10);
  }
  return result;
}

void *NetworkConditions.init(from:)(void *a1)
{
  return sub_24E9E0628(a1);
}

void *sub_24E9E0410@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24E9E0628(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24E9E043C(void *a1)
{
  return NetworkConditions.encode(to:)(a1, *v1);
}

uint64_t NetworkConditions.hash(into:)()
{
  return sub_24EA07058();
}

uint64_t NetworkConditions.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t sub_24E9E04C8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616C696176616E75 && a2 == 0xEB00000000656C62 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24E9E0628(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ED60);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ED68);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ED70);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991ED78);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9E02A8();
  uint64_t v12 = (uint64_t)v30;
  sub_24EA07098();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_24EA06F78();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24EA06DC8();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    void *v11 = &type metadata for NetworkConditions;
    sub_24EA06F18();
    sub_24EA06DB8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_24E9E0350();
      sub_24EA06F08();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24E9E02FC();
      sub_24EA06F08();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24E9E03A4();
    sub_24EA06F08();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24E9E0B9C()
{
  unint64_t result = qword_26B1CD250;
  if (!qword_26B1CD250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD250);
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConditions()
{
  return &type metadata for NetworkConditions;
}

unsigned char *_s14FitnessAppRoot17NetworkConditionsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9E0CD0);
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

ValueMetadata *type metadata accessor for NetworkConditions.CodingKeys()
{
  return &type metadata for NetworkConditions.CodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.AvailableCodingKeys()
{
  return &type metadata for NetworkConditions.AvailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnavailableCodingKeys()
{
  return &type metadata for NetworkConditions.UnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for NetworkConditions.UnknownCodingKeys()
{
  return &type metadata for NetworkConditions.UnknownCodingKeys;
}

unint64_t sub_24E9E0D3C()
{
  unint64_t result = qword_26991ED18;
  if (!qword_26991ED18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED18);
  }
  return result;
}

unint64_t sub_24E9E0D94()
{
  unint64_t result = qword_26991ED20;
  if (!qword_26991ED20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED20);
  }
  return result;
}

unint64_t sub_24E9E0DEC()
{
  unint64_t result = qword_26991ED28;
  if (!qword_26991ED28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED28);
  }
  return result;
}

unint64_t sub_24E9E0E44()
{
  unint64_t result = qword_26991ED30;
  if (!qword_26991ED30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED30);
  }
  return result;
}

unint64_t sub_24E9E0E9C()
{
  unint64_t result = qword_26991ED38;
  if (!qword_26991ED38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED38);
  }
  return result;
}

unint64_t sub_24E9E0EF4()
{
  unint64_t result = qword_26991ED40;
  if (!qword_26991ED40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED40);
  }
  return result;
}

unint64_t sub_24E9E0F4C()
{
  unint64_t result = qword_26991ED48;
  if (!qword_26991ED48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED48);
  }
  return result;
}

unint64_t sub_24E9E0FA4()
{
  unint64_t result = qword_26991ED50;
  if (!qword_26991ED50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED50);
  }
  return result;
}

unint64_t sub_24E9E0FFC()
{
  unint64_t result = qword_26991ED58;
  if (!qword_26991ED58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED58);
  }
  return result;
}

uint64_t Array<A>.indexOf(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA06CA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a3);
    v15[1] = a2;
    sub_24EA06A58();
    swift_getWitnessTable();
    sub_24EA06BD8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a3);
    return v15[2];
  }
}

uint64_t DynamicContentContainerViewController.TabItem.init(titleLocalizationKey:systemImageName:bundle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t result = type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v12 = (void *)(a5 + *(int *)(result + 36));
  *uint64_t v12 = a2;
  v12[1] = a3;
  *(void *)(a5 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t type metadata accessor for DynamicContentContainerViewController.TabItem()
{
  return __swift_instantiateGenericMetadata();
}

id sub_24E9E1354(uint64_t a1)
{
  id v2 = *(id *)(v1 + *(int *)(a1 + 36) + 8);
  if (v2)
  {
    swift_bridgeObjectRetain();
    int v3 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(self, sel__systemImageNamed_, v3);
  }
  return v2;
}

uint64_t sub_24E9E13D4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + *(void *)((*MEMORY[0x263F8EED0] & *(void *)*a1) + 0x80);
  swift_beginAccess();
  uint64_t result = MEMORY[0x253346E30](v3);
  *a2 = result;
  return result;
}

uint64_t sub_24E9E1448()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t DynamicContentContainerViewController.currentViewController.getter()
{
  uint64_t v1 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  swift_beginAccess();
  return MEMORY[0x253346E30](v1);
}

void DynamicContentContainerViewController.currentViewController.setter(void *a1)
{
}

void (*DynamicContentContainerViewController.currentViewController.modify(void *a1))(id **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x80);
  v3[5] = v4;
  uint64_t v5 = (char *)v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x253346E30](v5);
  return sub_24E9E163C;
}

void sub_24E9E163C(id **a1, char a2)
{
  uint64_t v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();
  }
  free(v3);
}

uint64_t DynamicContentContainerViewController.headlessFeatures.getter()
{
  sub_24E9E338C();
  return swift_bridgeObjectRetain();
}

uint64_t DynamicContentContainerViewController.headlessFeatures.setter(uint64_t a1)
{
  uint64_t v3 = (void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x88));
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*DynamicContentContainerViewController.headlessFeatures.modify())()
{
  return j__swift_endAccess;
}

id DynamicContentContainerViewController.__allocating_init(store:tabItem:contentViewController:offlineContentViewController:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_24E9E33F0(a1, a2, a3, a4);

  type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v11 = sub_24EA06CA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a2, v11);
  swift_release();
  return v10;
}

id DynamicContentContainerViewController.init(store:tabItem:contentViewController:offlineContentViewController:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = sub_24E9E33F0(a1, a2, a3, a4);

  type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v8 = sub_24EA06CA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
  swift_release();
  return v7;
}

void sub_24E9E196C(uint64_t a1, char *a2, uint64_t a3)
{
  char v3 = *a2;
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x253346E30](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_24E9E19C8(v3);
  }
}

void sub_24E9E19C8(char a1)
{
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24EA05DF8();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1CF2C0);
    sub_24EA05DC8();
    uint64_t v4 = *MEMORY[0x263F8EED0] & *v1;
    uint64_t v5 = 104;
    if (a1 == 1) {
      uint64_t v6 = 112;
    }
    else {
      uint64_t v6 = 104;
    }
    if (a1 != 1) {
      uint64_t v5 = 112;
    }
    id v7 = *(void **)((char *)v1 + *(void *)(v4 + v6));
    uint64_t v8 = *(void **)((char *)v1 + *(void *)(v4 + v5));
    sub_24E9E2290(v7, v8);
  }
}

uint64_t sub_24E9E1B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_24EA068D8() & 1;
}

void sub_24E9E1B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x253346E30](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_24E9E1BB8();
  }
}

id sub_24E9E1BB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *(void *)v0;
  uint64_t v3 = sub_24EA05CD8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v25 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24EA068F8();
  uint64_t v5 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v9 = sub_24EA06CA8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v23 - v15;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, &v1[*(void *)(v2 + 120)], v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v8) == 1) {
    return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, v8);
  id result = objc_msgSend(v1, sel_tabBarItem);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v18 = result;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v16, v24);
  id v19 = *(id *)&v16[*(int *)(v8 + 40)];
  sub_24EA06718();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  sub_24EA06958();
  uint64_t v20 = (void *)sub_24EA06908();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setTitle_, v20);

  id result = objc_msgSend(v1, sel_tabBarItem);
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v21 = result;
  id v22 = sub_24E9E1354(v8);
  objc_msgSend(v21, sel_setImage_, v22);

  return (id)(*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v8);
}

void sub_24E9E1FE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_24E9E3894();
}

Swift::Void __swiftcall DynamicContentContainerViewController.viewDidLoad()()
{
  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_24EA066F8();
}

void sub_24E9E207C(void *a1)
{
  id v1 = a1;
  DynamicContentContainerViewController.viewDidLoad()();
}

Swift::Void __swiftcall DynamicContentContainerViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v5.receiver = v2;
  v5.super_class = ObjectType;
  objc_msgSendSuper2(&v5, sel_viewWillAppear_, a1);
  sub_24EA06718();
  sub_24EA067A8();
  swift_release();
  HeadlessFeatureHosting<>.onAppear()((uint64_t)ObjectType, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>);
}

void sub_24E9E2180(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  DynamicContentContainerViewController.viewWillAppear(_:)(a3);
}

Swift::Void __swiftcall DynamicContentContainerViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  HeadlessFeatureHosting<>.onDisappear()((uint64_t)ObjectType, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>, (uint64_t)&protocol witness table for DynamicContentContainerViewController<A, B>);
  v4.receiver = v1;
  v4.super_class = ObjectType;
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1);
}

void sub_24E9E223C(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  DynamicContentContainerViewController.viewDidDisappear(_:)(a3);
}

void sub_24E9E2290(void *a1, void *a2)
{
  id v3 = v2;
  uint64_t v6 = (char *)v2 + *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x80);
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x253346E30](v6);
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD760);
  id v9 = a1;
  id v10 = v8;
  LOBYTE(v8) = sub_24EA06C88();

  if ((v8 & 1) == 0)
  {
LABEL_3:
    if (qword_26B1CD710 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24EA05DF8();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B1CF2C0);
    sub_24EA05DC8();
    objc_msgSend(a2, sel_willMoveToParentViewController_, 0);
    id v12 = objc_msgSend(a2, sel_view);
    if (v12)
    {
      uint64_t v13 = v12;
      objc_msgSend(v12, sel_removeFromSuperview);

      objc_msgSend(a2, sel_removeFromParentViewController);
      objc_msgSend(v3, sel_addChildViewController_, a1);
      id v14 = objc_msgSend(v3, sel_view);
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = objc_msgSend(a1, sel_view);
        if (v16)
        {
          uint64_t v17 = v16;
          objc_msgSend(v15, sel_addSubview_, v16);

          id v18 = objc_msgSend(a1, sel_view);
          if (v18)
          {
            id v19 = v18;
            objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD820);
            uint64_t v20 = swift_allocObject();
            *(_OWORD *)(v20 + 16) = xmmword_24EA09540;
            id v21 = objc_msgSend(a1, sel_view);
            if (v21)
            {
              id v22 = v21;
              id v23 = objc_msgSend(v21, sel_topAnchor);

              id v24 = objc_msgSend(v3, sel_view);
              if (v24)
              {
                uint64_t v25 = v24;
                id v26 = objc_msgSend(v24, sel_topAnchor);

                id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
                *(void *)(v20 + 32) = v27;
                id v28 = objc_msgSend(a1, sel_view);
                if (v28)
                {
                  uint64_t v29 = v28;
                  id v30 = objc_msgSend(v28, sel_bottomAnchor);

                  id v31 = objc_msgSend(v3, sel_view);
                  if (v31)
                  {
                    char v32 = v31;
                    id v33 = objc_msgSend(v31, sel_bottomAnchor);

                    id v34 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v33);
                    *(void *)(v20 + 40) = v34;
                    id v35 = objc_msgSend(a1, sel_view);
                    if (v35)
                    {
                      BOOL v36 = v35;
                      id v37 = objc_msgSend(v35, sel_leadingAnchor);

                      id v38 = objc_msgSend(v3, sel_view);
                      if (v38)
                      {
                        uint64_t v39 = v38;
                        id v40 = objc_msgSend(v38, sel_leadingAnchor);

                        id v41 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v40);
                        *(void *)(v20 + 48) = v41;
                        id v42 = objc_msgSend(a1, sel_view);
                        if (v42)
                        {
                          CGRect v43 = v42;
                          id v44 = objc_msgSend(v42, sel_trailingAnchor);

                          id v45 = objc_msgSend(v3, sel_view);
                          if (v45)
                          {
                            uint64_t v46 = v45;
                            unint64_t v47 = self;
                            id v48 = objc_msgSend(v46, sel_trailingAnchor);

                            id v49 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v48);
                            *(void *)(v20 + 56) = v49;
                            sub_24EA069E8();
                            sub_24E9B72B4(0, (unint64_t *)&unk_26B1CD770);
                            double v50 = (void *)sub_24EA069C8();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v47, sel_activateConstraints_, v50, v20);

                            objc_msgSend(a1, sel_didMoveToParentViewController_, v3);
                            swift_unknownObjectWeakAssign();
                            return;
                          }
LABEL_30:
                          __break(1u);
                          return;
                        }
LABEL_29:
                        __break(1u);
                        goto LABEL_30;
                      }
LABEL_28:
                      __break(1u);
                      goto LABEL_29;
                    }
LABEL_27:
                    __break(1u);
                    goto LABEL_28;
                  }
LABEL_26:
                  __break(1u);
                  goto LABEL_27;
                }
LABEL_25:
                __break(1u);
                goto LABEL_26;
              }
LABEL_24:
              __break(1u);
              goto LABEL_25;
            }
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
}

void __swiftcall DynamicContentContainerViewController.contentScrollView(for:)(UIScrollView_optional *__return_ptr retstr, NSDirectionalRectEdge a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  objc_super v5 = (char *)v2 + *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x80);
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x253346E30](v5);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_contentScrollViewForEdge_, a2);
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = ObjectType;
    [(UIScrollView_optional *)&v8 contentScrollViewForEdge:a2];
  }
}

id sub_24E9E28F0(void *a1, uint64_t a2, NSDirectionalRectEdge a3)
{
  id v4 = a1;
  DynamicContentContainerViewController.contentScrollView(for:)(v5, a3);
  uint64_t v7 = v6;

  return v7;
}

id sub_24E9E293C(void *a1)
{
  id v1 = a1;
  id v2 = DynamicContentContainerViewController.supportedInterfaceOrientations.getter();

  return v2;
}

id DynamicContentContainerViewController.supportedInterfaceOrientations.getter()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v2 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x253346E30](v2);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_supportedInterfaceOrientations);
  }
  else
  {
    v7.receiver = v0;
    v7.super_class = ObjectType;
    return objc_msgSendSuper2(&v7, sel_supportedInterfaceOrientations);
  }
  return v5;
}

id sub_24E9E2A28(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DynamicContentContainerViewController.keyCommands.getter();

  if (v2)
  {
    sub_24E9B72B4(0, &qword_26991E4D0);
    id v3 = (void *)sub_24EA069C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t DynamicContentContainerViewController.keyCommands.getter()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x253346E30](v2);
  if (!v3)
  {
    v10.receiver = v0;
    v10.super_class = ObjectType;
    id v8 = objc_msgSendSuper2(&v10, sel_keyCommands);
    if (v8)
    {
      id v4 = v8;
      sub_24E9B72B4(0, &qword_26991E4D0);
      uint64_t v7 = sub_24EA069D8();
      goto LABEL_6;
    }
    return 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(v3, sel_keyCommands);
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = v5;
  sub_24E9B72B4(0, &qword_26991E4D0);
  uint64_t v7 = sub_24EA069D8();

LABEL_6:
  return v7;
}

id sub_24E9E2BD8(void *a1)
{
  id v1 = a1;
  DynamicContentContainerViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E5F0);
  uint64_t v2 = (void *)sub_24EA069C8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DynamicContentContainerViewController.preferredFocusEnvironments.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E4D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EA097F0;
  uint64_t v2 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  swift_beginAccess();
  *(void *)(inited + 32) = MEMORY[0x253346E30](v2);
  sub_24EA069E8();
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (*(void *)(inited + 32))
  {
    uint64_t v4 = swift_unknownObjectRetain();
    MEMORY[0x253345FC0](v4);
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24EA06A08();
    }
    sub_24EA06A28();
    sub_24EA069E8();
    uint64_t v3 = v6;
  }
  swift_bridgeObjectRelease();
  return v3;
}

id sub_24E9E2D64(void *a1)
{
  id v1 = a1;
  id v2 = DynamicContentContainerViewController.childForStatusBarStyle.getter();

  return v2;
}

id DynamicContentContainerViewController.childForStatusBarStyle.getter()
{
  return sub_24E9E2F40((SEL *)&selRef_childViewControllerForStatusBarStyle);
}

id sub_24E9E2DB4(void *a1)
{
  id v1 = a1;
  id v2 = DynamicContentContainerViewController.childForStatusBarHidden.getter();

  return v2;
}

id DynamicContentContainerViewController.childForStatusBarHidden.getter()
{
  return sub_24E9E2F40((SEL *)&selRef_childViewControllerForStatusBarHidden);
}

uint64_t sub_24E9E2E04(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = DynamicContentContainerViewController.prefersHomeIndicatorAutoHidden.getter();

  return v2 & 1;
}

id DynamicContentContainerViewController.prefersHomeIndicatorAutoHidden.getter()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  unsigned __int8 v2 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80);
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x253346E30](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_prefersHomeIndicatorAutoHidden);
  }
  else
  {
    v7.receiver = v0;
    v7.super_class = ObjectType;
    return objc_msgSendSuper2(&v7, sel_prefersHomeIndicatorAutoHidden);
  }
  return v5;
}

id sub_24E9E2EF0(void *a1)
{
  id v1 = a1;
  id v2 = DynamicContentContainerViewController.childForHomeIndicatorAutoHidden.getter();

  return v2;
}

id DynamicContentContainerViewController.childForHomeIndicatorAutoHidden.getter()
{
  return sub_24E9E2F40((SEL *)&selRef_childViewControllerForHomeIndicatorAutoHidden);
}

id sub_24E9E2F40(SEL *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x80);
  swift_beginAccess();
  id result = (id)MEMORY[0x253346E30](v4);
  if (!result)
  {
    v6.receiver = v1;
    v6.super_class = ObjectType;
    return objc_msgSendSuper2(&v6, *a1);
  }
  return result;
}

id DynamicContentContainerViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    objc_super v6 = (void *)sub_24EA06908();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DynamicContentContainerViewController.init(nibName:bundle:)()
{
}

void sub_24E9E3094(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  sub_24E9E3950();
}

id DynamicContentContainerViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24E9E3140(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  swift_release();

  uint64_t v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x78);
  type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v4 = sub_24EA06CA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E9E32C0()
{
  sub_24E9E338C();
  return swift_bridgeObjectRetain();
}

void (*sub_24E9E32EC(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = DynamicContentContainerViewController.headlessFeatures.modify();
  return sub_24E9E3344;
}

void sub_24E9E3344(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_24E9E338C()
{
  id v1 = (char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x88);
  swift_beginAccess();
  return *(void *)v1;
}

id sub_24E9E33F0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v28[0] = swift_getObjectType();
  id v9 = (void *)MEMORY[0x263F8EED0];
  uint64_t v10 = *MEMORY[0x263F8EED0] & *v4;
  uint64_t v11 = sub_24EA05CD8();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)((char *)v4 + *(void *)((*v9 & *v4) + 0x88)) = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD738);
  swift_allocObject();
  id v14 = v4;
  v28[1] = a1;
  swift_retain();
  *(void *)((char *)v14 + *(void *)((*v9 & *v14) + 0x60)) = sub_24EA06738();
  uint64_t v15 = (char *)v14 + *(void *)((*v9 & *v14) + 0x78);
  uint64_t v16 = *(void *)(v10 + 80);
  uint64_t v17 = *(void *)(v10 + 88);
  type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t v18 = sub_24EA06CA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v15, a2, v18);
  *(void *)((char *)v14 + *(void *)((*v9 & *v14) + 0x68)) = a3;
  *(void *)((char *)v14 + *(void *)((*v9 & *v14) + 0x70)) = a4;
  id v19 = a3;
  id v20 = a4;

  v33.receiver = v14;
  v33.super_class = (Class)v28[0];
  id v21 = objc_msgSendSuper2(&v33, sel_initWithNibName_bundle_, 0, 0);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v23 = (void *)swift_allocObject();
  v23[2] = v16;
  v23[3] = v17;
  v23[4] = v22;
  sub_24E9E0B9C();
  id v24 = v21;
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v31 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v26 = (void *)swift_allocObject();
  v26[2] = v16;
  v26[3] = v17;
  v26[4] = v25;
  sub_24E9E42A4(&qword_26B1CCB20, MEMORY[0x263F07690]);
  swift_retain();
  sub_24EA06708();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  sub_24E9E1BB8();

  (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
  return v24;
}

void sub_24E9E3894()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  swift_unknownObjectWeakInit();
  *(void *)((char *)v0 + *(void *)((*v1 & *v0) + 0x88)) = MEMORY[0x263F8EE78];

  sub_24EA06E48();
  __break(1u);
}

void sub_24E9E3950()
{
}

uint64_t sub_24E9E3988()
{
  return 16;
}

__n128 sub_24E9E3994(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E9E39A0()
{
  type metadata accessor for DynamicContentContainerViewController.TabItem();
  uint64_t result = sub_24EA06CA8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for DynamicContentContainerViewController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DynamicContentContainerViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DynamicContentContainerViewController);
}

uint64_t dispatch thunk of DynamicContentContainerViewController.__allocating_init(store:tabItem:contentViewController:offlineContentViewController:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_24E9E3AB8()
{
  uint64_t result = sub_24EA068F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24E9E3B5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24EA068F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = *(int *)(a3 + 40);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v13;
    swift_bridgeObjectRetain();
    id v14 = v13;
  }
  return a1;
}

void sub_24E9E3C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 40));
}

uint64_t sub_24E9E3CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v12;
  swift_bridgeObjectRetain();
  id v13 = v12;
  return a1;
}

uint64_t sub_24E9E3D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = *(void **)(a2 + v10);
  uint64_t v12 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = v11;
  id v13 = v11;

  return a1;
}

uint64_t sub_24E9E3E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 40);
  *(_OWORD *)(a1 + *(int *)(a3 + 36)) = *(_OWORD *)(a2 + *(int *)(a3 + 36));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_24E9E3E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA068F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 40);
  id v13 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);

  return a1;
}

uint64_t sub_24E9E3F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9E3F44);
}

uint64_t sub_24E9E3F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA068F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 40));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24E9E4004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9E4018);
}

uint64_t sub_24E9E4018(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24EA068F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24E9E40D4()
{
  return sub_24E9E42A4(&qword_26991ED80, (void (*)(uint64_t))type metadata accessor for DynamicContentFeature);
}

uint64_t sub_24E9E411C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EA06798();
  *a1 = v3;
  return result;
}

uint64_t sub_24E9E415C()
{
  return 8;
}

uint64_t sub_24E9E4168()
{
  return swift_release();
}

uint64_t sub_24E9E4170(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_24E9E417C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E9E1B04(a1, a2, a3, &qword_26B1CD838) & 1;
}

uint64_t sub_24E9E41A0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_26B1CD838);
}

uint64_t sub_24E9E41AC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24E9E41E4(uint64_t a1, char *a2)
{
  sub_24E9E196C(a1, a2, *(void *)(v2 + 32));
}

uint64_t sub_24E9E41F0()
{
  return sub_24EA06798();
}

uint64_t sub_24E9E4218()
{
  return 8;
}

uint64_t sub_24E9E4224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E9E1B04(a1, a2, a3, (uint64_t *)&unk_26B1CD828) & 1;
}

uint64_t sub_24E9E4248(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, (uint64_t *)&unk_26B1CD828);
}

void *sub_24E9E4254(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24E9E4260()
{
  swift_release();
  return swift_deallocObject();
}

void sub_24E9E4298(uint64_t a1, uint64_t a2)
{
  sub_24E9E1B5C(a1, a2, *(void *)(v2 + 32));
}

uint64_t sub_24E9E42A4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24E9E42FC()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x642E657275676966;
      break;
    case 4:
      unint64_t result = 0xD000000000000025;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0x656D2E656C707061;
      break;
    case 7:
      unint64_t result = 0x702E657275676966;
      break;
    case 8:
    case 0xA:
      unint64_t result = 0x722E657275676966;
      break;
    case 9:
      unint64_t result = 0xD000000000000022;
      break;
    case 0xB:
      unint64_t result = 0x792E657275676966;
      break;
    default:
      unint64_t result = 0x632E657275676966;
      break;
  }
  return result;
}

uint64_t sub_24E9E4498()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for LocalizableBundle()
{
  return self;
}

uint64_t SidebarModality.item.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SidebarModality.init(item:kind:name:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7 = *a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t v8 = type metadata accessor for SidebarModality();
  *(unsigned char *)(a5 + *(int *)(v8 + 36)) = v7;
  uint64_t v9 = a5 + *(int *)(v8 + 40);
  uint64_t v10 = sub_24EA05C28();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  return v11(v9, a3, v10);
}

uint64_t type metadata accessor for SidebarModality()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9E45F8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24E9E4710(char a1)
{
  return *(void *)&aItem_1[8 * a1];
}

uint64_t sub_24E9E4728()
{
  return sub_24E9E4710(*v0);
}

uint64_t sub_24E9E4734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9E45F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9E4764@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E9E5F80();
  *a1 = result;
  return result;
}

uint64_t sub_24E9E4790(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9E47E4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t SidebarModality.encode(to:)(void *a1, uint64_t a2)
{
  v10[0] = a2;
  v10[2] = *(void *)(a2 + 16);
  type metadata accessor for SidebarModality.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EA06FF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v10 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = v10[1];
  sub_24EA070A8();
  char v14 = 0;
  uint64_t v8 = v10[3];
  sub_24EA06FE8();
  if (!v8)
  {
    char v13 = *(unsigned char *)(v7 + *(int *)(v10[0] + 36));
    char v12 = 1;
    sub_24E9E4A94();
    sub_24EA06FE8();
    char v11 = 2;
    sub_24EA05C28();
    sub_24E9E51D8(&qword_26991ED90);
    sub_24EA06FE8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t type metadata accessor for SidebarModality.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24E9E4A94()
{
  unint64_t result = qword_26991ED88;
  if (!qword_26991ED88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED88);
  }
  return result;
}

uint64_t SidebarModality.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a4;
  uint64_t v27 = sub_24EA05C28();
  uint64_t v25 = *(void *)(v27 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v7);
  char v32 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SidebarModality.CodingKeys();
  swift_getWitnessTable();
  uint64_t v34 = sub_24EA06F88();
  uint64_t v28 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  char v11 = (char *)&v24 - v10;
  uint64_t v31 = a3;
  uint64_t v12 = type metadata accessor for SidebarModality();
  uint64_t v24 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)&v24 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  objc_super v33 = v11;
  uint64_t v15 = v35;
  sub_24EA07098();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v16 = v14;
  uint64_t v18 = v29;
  uint64_t v17 = v30;
  char v39 = 0;
  sub_24EA06F68();
  id v19 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  id v20 = v16;
  v19(v16, v32, a2);
  char v37 = 1;
  sub_24E9E4F80();
  sub_24EA06F68();
  v16[*(int *)(v12 + 36)] = v38;
  char v36 = 2;
  sub_24E9E51D8(&qword_26991EDA0);
  uint64_t v21 = v27;
  sub_24EA06F68();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v33, v34);
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v20[*(int *)(v12 + 40)], v17, v21);
  uint64_t v22 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v26, v20, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v20, v12);
}

unint64_t sub_24E9E4F80()
{
  unint64_t result = qword_26991ED98;
  if (!qword_26991ED98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991ED98);
  }
  return result;
}

uint64_t sub_24E9E4FD4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return SidebarModality.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E9E4FF4(void *a1, uint64_t a2)
{
  return SidebarModality.encode(to:)(a1, a2);
}

uint64_t SidebarModality.hash(into:)()
{
  return sub_24EA068A8();
}

uint64_t static SidebarModality.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24EA068D8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for SidebarModality();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 36)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 36))) {
    return 0;
  }
  uint64_t v5 = *(int *)(v4 + 40);
  return MEMORY[0x270EEEC38](a1 + v5, a2 + v5);
}

uint64_t SidebarModality.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t sub_24E9E5188()
{
  return sub_24EA07088();
}

uint64_t sub_24E9E51CC(uint64_t a1, uint64_t a2)
{
  return static SidebarModality.== infix(_:_:)(a1, a2);
}

uint64_t sub_24E9E51D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EA05C28();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E9E521C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E5238()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24EA05C28();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_24E9E530C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24EA05C28();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || ((v10 + v7 + 1) & (unint64_t)~v10) + *(void *)(*(void *)(v8 - 8) + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    uint64_t v15 = v8;
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v7 + v10 + 1) & ~v10, ((unint64_t)a2 + v7 + v10 + 1) & ~v10, v15);
  }
  return a1;
}

uint64_t sub_24E9E549C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_24EA05C28();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (a1 + *(unsigned __int8 *)(v6 + 80) + v4 + 1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v9, v8);
}

uint64_t sub_24E9E5544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = (unsigned char *)(v6 + a2);
  *(unsigned char *)(v6 + a1) = *v8;
  uint64_t v9 = sub_24EA05C28();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((*(unsigned __int8 *)(v10 + 80) + 1 + v7) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (unint64_t)&v8[*(unsigned __int8 *)(v10 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_24E9E5600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = (unsigned char *)(v6 + a2);
  *(unsigned char *)(v6 + a1) = *v8;
  uint64_t v9 = sub_24EA05C28();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 24))((*(unsigned __int8 *)(v10 + 80) + 1 + v7) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (unint64_t)&v8[*(unsigned __int8 *)(v10 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_24E9E56BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = (unsigned char *)(v6 + a2);
  *(unsigned char *)(v6 + a1) = *v8;
  uint64_t v9 = sub_24EA05C28();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))((*(unsigned __int8 *)(v10 + 80) + 1 + v7) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (unint64_t)&v8[*(unsigned __int8 *)(v10 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_24E9E5778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = (unsigned char *)(v6 + a2);
  *(unsigned char *)(v6 + a1) = *v8;
  uint64_t v9 = sub_24EA05C28();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40))((*(unsigned __int8 *)(v10 + 80) + 1 + v7) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (unint64_t)&v8[*(unsigned __int8 *)(v10 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_24E9E5834(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_24EA05C28();
  uint64_t v9 = *(void *)(v8 - 8);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v10 = v7;
  }
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= 0xF4) {
    unsigned int v13 = 244;
  }
  else {
    unsigned int v13 = v10;
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v13) {
    goto LABEL_28;
  }
  uint64_t v14 = ((v12 + v11 + 1) & ~v12) + *(void *)(*(void *)(v8 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v18 = ((a2 - v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v18 < 2)
    {
LABEL_28:
      if (v7 == v13)
      {
        uint64_t v22 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
        return v22(a1, v7, v5);
      }
      else
      {
        id v23 = (unsigned __int8 *)a1 + v11;
        if (v10 > 0xF4)
        {
          uint64_t v25 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v25((unint64_t)&v23[v12 + 1] & ~v12);
        }
        else
        {
          unsigned int v24 = *v23;
          if (v24 >= 0xC) {
            return v24 - 11;
          }
          else {
            return 0;
          }
        }
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_28;
  }
LABEL_18:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v20 = v14;
    }
    else {
      int v20 = 4;
    }
    switch(v20)
    {
      case 2:
        int v21 = *a1;
        break;
      case 3:
        int v21 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v21 = *(_DWORD *)a1;
        break;
      default:
        int v21 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v21 = 0;
  }
  return v13 + (v21 | v19) + 1;
}

void sub_24E9E5AE4(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v26 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(sub_24EA05C28() - 8);
  uint64_t v11 = v10;
  if (v9 <= *(_DWORD *)(v10 + 84)) {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  else {
    unsigned int v12 = v9;
  }
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v10 + 64);
  if (v12 <= 0xF4) {
    unsigned int v16 = 244;
  }
  else {
    unsigned int v16 = v12;
  }
  size_t v17 = ((v14 + v13 + 1) & ~v14) + v15;
  if (a3 <= v16)
  {
    int v18 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v21 = ((a3 - v16 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v21))
    {
      int v18 = 4;
    }
    else if (v21 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v21 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v16 < a2)
  {
    unsigned int v19 = ~v16 + a2;
    if (v17 < 4)
    {
      int v20 = (v19 >> (8 * v17)) + 1;
      if (v17)
      {
        int v22 = v19 & ~(-1 << (8 * v17));
        bzero(a1, v17);
        if (v17 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v17 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v17] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v17] = v20;
        return;
      case 3:
        goto LABEL_46;
      case 4:
        *(_DWORD *)&a1[v17] = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x24E9E5E10);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v9 == v16)
        {
          id v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
          v23(a1, a2, v9, v7);
        }
        else
        {
          unsigned int v24 = &a1[v13];
          if (v12 > 0xF4)
          {
            uint64_t v25 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
            v25((unint64_t)&v24[v14 + 1] & ~v14, a2);
          }
          else
          {
            unsigned char *v24 = a2 + 11;
          }
        }
      }
      return;
  }
}

unsigned char *sub_24E9E5E38(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9E5F04);
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

uint64_t sub_24E9E5F2C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E5F48()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E5F64()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E5F80()
{
  return 3;
}

unint64_t sub_24E9E5F88()
{
  return 0xD000000000000011;
}

uint64_t sub_24E9E5FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9E7104(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9E5FD0(uint64_t a1)
{
  unint64_t v2 = sub_24E9E6438();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9E600C(uint64_t a1)
{
  unint64_t v2 = sub_24E9E6438();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9E6048(uint64_t a1)
{
  unint64_t v2 = sub_24E9E64F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9E6084(uint64_t a1)
{
  unint64_t v2 = sub_24E9E64F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AnotherNavigationSplitViewAction.encode(to:)(void *a1)
{
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EE30);
  uint64_t v23 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  int v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24EA061A8();
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unsigned int v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EE38);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unsigned int v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9E6438();
  uint64_t v13 = v20;
  sub_24EA070A8();
  sub_24E9E648C(v21, (uint64_t)v9);
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  uint64_t v16 = v19;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v19);
  sub_24E9E64F0();
  sub_24EA06F98();
  sub_24E9E6904(&qword_26991EE50);
  sub_24EA06FE8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v12, v15);
}

uint64_t type metadata accessor for AnotherNavigationSplitViewAction()
{
  uint64_t result = qword_26991EE70;
  if (!qword_26991EE70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24E9E6438()
{
  unint64_t result = qword_26991EE40;
  if (!qword_26991EE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE40);
  }
  return result;
}

uint64_t sub_24E9E648C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnotherNavigationSplitViewAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E9E64F0()
{
  unint64_t result = qword_26991EE48;
  if (!qword_26991EE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE48);
  }
  return result;
}

uint64_t AnotherNavigationSplitViewAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EE58);
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991EE60);
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9E6438();
  uint64_t v29 = v10;
  uint64_t v11 = v28;
  sub_24EA07098();
  if (!v11)
  {
    uint64_t v28 = a1;
    uint64_t v12 = v6;
    uint64_t v14 = v26;
    uint64_t v13 = v27;
    uint64_t v15 = sub_24EA06F78();
    uint64_t v16 = *(void *)(v15 + 16);
    uint64_t v23 = v15;
    if (v16 == 1)
    {
      sub_24E9E64F0();
      sub_24EA06F08();
      uint64_t v17 = v25;
      sub_24EA061A8();
      sub_24E9E6904(&qword_26991EE68);
      sub_24EA06F68();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v12);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v29, v13);
      a1 = v28;
      sub_24E9E6948((uint64_t)v5, v24);
    }
    else
    {
      uint64_t v18 = sub_24EA06DC8();
      swift_allocError();
      uint64_t v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
      *uint64_t v20 = v3;
      sub_24EA06F18();
      sub_24EA06DB8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
      swift_willThrow();
      uint64_t v21 = v25;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v29, v13);
      a1 = v28;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9E6904(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EA061A8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E9E6948(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnotherNavigationSplitViewAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E9E69AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AnotherNavigationSplitViewAction.init(from:)(a1, a2);
}

uint64_t sub_24E9E69C4(void *a1)
{
  return AnotherNavigationSplitViewAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AnotherNavigationSplitViewAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_24EA061A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for AnotherNavigationSplitViewAction(uint64_t a1)
{
  uint64_t v2 = sub_24EA061A8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA061A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA061A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA061A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA061A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA061A8();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AnotherNavigationSplitViewAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA061A8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t sub_24E9E6D68(uint64_t a1)
{
  uint64_t result = sub_24EA061A8();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewAction.CodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewAction.CodingKeys;
}

unsigned char *_s14FitnessAppRoot32AnotherNavigationSplitViewActionO10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9E6EBCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewAction.VisibilityChangedCodingKeys;
}

unint64_t sub_24E9E6EF8()
{
  unint64_t result = qword_26991EE80;
  if (!qword_26991EE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE80);
  }
  return result;
}

unint64_t sub_24E9E6F50()
{
  unint64_t result = qword_26991EE88;
  if (!qword_26991EE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE88);
  }
  return result;
}

unint64_t sub_24E9E6FA8()
{
  unint64_t result = qword_26991EE90;
  if (!qword_26991EE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE90);
  }
  return result;
}

unint64_t sub_24E9E7000()
{
  unint64_t result = qword_26991EE98;
  if (!qword_26991EE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EE98);
  }
  return result;
}

unint64_t sub_24E9E7058()
{
  unint64_t result = qword_26991EEA0;
  if (!qword_26991EEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991EEA0);
  }
  return result;
}

unint64_t sub_24E9E70B0()
{
  unint64_t result = qword_26991EEA8[0];
  if (!qword_26991EEA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26991EEA8);
  }
  return result;
}

uint64_t sub_24E9E7104(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024EA16870)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t dispatch thunk of ScrollViewObserving.contentScrollViewsDidChange()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24E9E71A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C65536D657469 && a2 == 0xEC00000064657463)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24E9E723C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9E71A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9E7270(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9E72C4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E9E7318(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9E736C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t SidebarAction.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v25 = a2;
  uint64_t v26 = v4;
  uint64_t v31 = type metadata accessor for SidebarAction.ItemSelectedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = sub_24EA06FF8();
  uint64_t v34 = *(void *)(v28 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v28);
  uint64_t v29 = (char *)&v23 - v7;
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v24 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SidebarAction.CodingKeys();
  swift_getWitnessTable();
  uint64_t v13 = sub_24EA06FF8();
  uint64_t v30 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v23 - v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = v27;
  uint64_t v16 = v28;
  uint64_t v18 = v13;
  uint64_t v19 = v24;
  sub_24EA070A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v33, v25);
  uint64_t v20 = v12;
  uint64_t v21 = v29;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v20, v3);
  sub_24EA06F98();
  sub_24EA06FE8();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v16);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v15, v18);
}

uint64_t type metadata accessor for SidebarAction.ItemSelectedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SidebarAction.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SidebarAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v33 = type metadata accessor for SidebarAction();
  uint64_t v26 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v29 = (char *)&v24 - v3;
  type metadata accessor for SidebarAction.ItemSelectedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = sub_24EA06F88();
  uint64_t v30 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  char v32 = (char *)&v24 - v4;
  type metadata accessor for SidebarAction.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_24EA06F88();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v8 = v40;
  sub_24EA07098();
  if (!v8)
  {
    uint64_t v25 = 0;
    id v40 = a1;
    uint64_t v9 = v35;
    *(void *)&long long v36 = sub_24EA06F78();
    sub_24EA06A58();
    swift_getWitnessTable();
    *(void *)&long long v38 = sub_24EA06CE8();
    *((void *)&v38 + 1) = v10;
    *(void *)&long long v39 = v11;
    *((void *)&v39 + 1) = v12;
    sub_24EA06CD8();
    swift_getWitnessTable();
    sub_24EA06BA8();
    if ((v36 & 1) != 0 || (v24 = v38, long long v36 = v38, v37 = v39, (sub_24EA06BC8() & 1) == 0))
    {
      uint64_t v15 = sub_24EA06DC8();
      swift_allocError();
      uint64_t v17 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
      uint64_t *v17 = v33;
      sub_24EA06F18();
      sub_24EA06DB8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCB0], v15);
      swift_willThrow();
    }
    else
    {
      uint64_t v13 = v32;
      uint64_t v14 = v25;
      sub_24EA06F08();
      if (!v14)
      {
        uint64_t v21 = v28;
        uint64_t v20 = v29;
        sub_24EA06F68();
        uint64_t v22 = v13;
        uint64_t v23 = v34;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v22, v21);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v9);
        (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v27, v20, v33);
        uint64_t v18 = (uint64_t)v40;
        return __swift_destroy_boxed_opaque_existential_1(v18);
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v9);
    a1 = v40;
  }
  uint64_t v18 = (uint64_t)a1;
  return __swift_destroy_boxed_opaque_existential_1(v18);
}

uint64_t type metadata accessor for SidebarAction()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9E7CF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SidebarAction.init(from:)(a1, a2);
}

uint64_t sub_24E9E7D10(void *a1, uint64_t a2)
{
  return SidebarAction.encode(to:)(a1, a2);
}

uint64_t sub_24E9E7D28(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_24E9E7DD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(void *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(uint64_t *, void, void, uint64_t))(v5 + 56))(v3, 0, 0, v4);
  }
  else
  {
    uint64_t v9 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_24E9E7EB8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24E9E7EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(uint64_t, void, void, uint64_t))(v5 + 56))(a1, 0, 0, v4);
  return a1;
}

uint64_t sub_24E9E7F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24E9E7FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(uint64_t, void, void, uint64_t))(v5 + 56))(a1, 0, 0, v4);
  return a1;
}

uint64_t sub_24E9E8084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24E9E80D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 48))();
}

uint64_t sub_24E9E8100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a4 + 16) - 8) + 56))();
}

unsigned char *sub_24E9E8130(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E9E81CCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E9E81F4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E8210()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E822C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E8248()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E8264()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E8280()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9E829C()
{
  return 0x656C65536D657469;
}

uint64_t AnotherNavigationSplitViewFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_24EA061A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9E648C(a4, (uint64_t)v15);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v15, v6);
  sub_24EA06188();
  sub_24E9E8528(&qword_26991F030, MEMORY[0x263F1A3C8]);
  LOBYTE(a4) = sub_24EA068D8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v12, v6);
  *a2 = (a4 & 1) == 0;
  return result;
}

uint64_t sub_24E9E8498()
{
  return sub_24E9E8528(&qword_26991F038, (void (*)(uint64_t))type metadata accessor for AnotherNavigationSplitViewAction);
}

uint64_t sub_24E9E84E0()
{
  return sub_24E9E8528(&qword_26991F040, (void (*)(uint64_t))type metadata accessor for AnotherNavigationSplitViewAction);
}

uint64_t sub_24E9E8528(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24E9E8574()
{
  unint64_t result = qword_26991F048;
  if (!qword_26991F048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F048);
  }
  return result;
}

uint64_t sub_24E9E85C8(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_24EA061A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = type metadata accessor for AnotherNavigationSplitViewAction();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9E648C(a4, (uint64_t)v15);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v15, v6);
  sub_24EA06188();
  sub_24E9E8528(&qword_26991F030, MEMORY[0x263F1A3C8]);
  LOBYTE(a4) = sub_24EA068D8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v12, v6);
  *a2 = (a4 & 1) == 0;
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewFeature()
{
  return &type metadata for AnotherNavigationSplitViewFeature;
}

uint64_t sub_24E9E87B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  type metadata accessor for SidebarFeature();
  swift_getWitnessTable();
  uint64_t v4 = sub_24EA067C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, WitnessTable);
}

uint64_t sub_24E9E8860()
{
  return sub_24EA05E28();
}

uint64_t sub_24E9E88F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
  sub_24EA05E18();
  return v1;
}

uint64_t sub_24E9E8950()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
  sub_24EA05E28();
  return v1;
}

uint64_t sub_24E9E89B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
  sub_24EA06518();
  return v1;
}

uint64_t sub_24E9E8A0C()
{
  return sub_24EA06528();
}

uint64_t SidebarView.init(store:signOutViewBuilder:currentTimeViewBuilder:modalitiesViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = type metadata accessor for SidebarView();
  sub_24EA05E58();
  uint64_t v19 = a9 + *(int *)(v18 + 100);
  *(unsigned char *)uint64_t v19 = sub_24EA05E48() & 1;
  *(void *)(v19 + 8) = v20;
  *(unsigned char *)(v19 + 16) = v21 & 1;
  uint64_t v22 = a9 + *(int *)(v18 + 104);
  sub_24EA06508();
  *(unsigned char *)uint64_t v22 = a10;
  *(void *)(v22 + 8) = a11;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a10;
  v23[3] = a11;
  v23[4] = a12;
  v23[5] = a13;
  v23[6] = a14;
  v23[7] = a15;
  v23[8] = a16;
  v23[9] = a17;
  v23[10] = a1;
  v23[11] = a2;
  type metadata accessor for SidebarFeature();
  swift_getWitnessTable();
  sub_24EA067C8();
  swift_getWitnessTable();
  uint64_t result = sub_24EA05E78();
  *(void *)a9 = result;
  *(void *)(a9 + 8) = v25;
  *(unsigned char *)(a9 + 16) = v26 & 1;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a8;
  return result;
}

uint64_t type metadata accessor for SidebarView()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E9E8C64()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9E8C9C()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t SidebarView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v144 = a2;
  uint64_t v142 = *(void *)(a1 - 8);
  uint64_t v143 = *(void *)(v142 + 64);
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  v141 = (char *)v111 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = v2;
  v161 = (void *)v2;
  uint64_t v6 = v4;
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v8 = sub_24EA065A8();
  uint64_t v139 = *(void *)(v8 - 8);
  uint64_t v140 = v8;
  MEMORY[0x270FA5388](v8);
  v138 = (char *)v111 - v9;
  uint64_t v10 = sub_24EA06258();
  uint64_t v136 = *(void *)(v10 - 8);
  uint64_t v137 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v134 = (char *)v111 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v11);
  v131 = (char *)v111 - v13;
  uint64_t v14 = *(void *)(v5 + 48);
  uint64_t v156 = *(void *)(v14 + 24);
  uint64_t v152 = v14;
  uint64_t v203 = v156;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = sub_24EA05E38();
  uint64_t v132 = *(void *)(v16 - 8);
  uint64_t v133 = v16;
  MEMORY[0x270FA5388](v16);
  v153 = (char *)v111 - v17;
  uint64_t v158 = sub_24EA06A58();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F050);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F058);
  uint64_t v21 = sub_24E9B7F78(&qword_26991F060, &qword_26991F058);
  uint64_t v198 = v20;
  uint64_t v199 = v21;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v198 = v19;
  uint64_t v199 = v7;
  uint64_t v200 = OpaqueTypeConformance2;
  uint64_t v201 = WitnessTable;
  uint64_t v150 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v198 = v19;
  uint64_t v199 = v7;
  uint64_t v200 = OpaqueTypeConformance2;
  uint64_t v201 = WitnessTable;
  uint64_t v24 = swift_getOpaqueTypeConformance2();
  uint64_t v198 = OpaqueTypeMetadata2;
  uint64_t v199 = v6;
  uint64_t v159 = v6;
  uint64_t v25 = v156;
  uint64_t v200 = v24;
  uint64_t v201 = v156;
  swift_getOpaqueTypeMetadata2();
  uint64_t v26 = sub_24EA05F68();
  uint64_t v27 = v158;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v198 = v27;
  uint64_t v199 = AssociatedTypeWitness;
  uint64_t v200 = v26;
  uint64_t v201 = v28;
  uint64_t v202 = AssociatedConformanceWitness;
  sub_24EA065D8();
  uint64_t v30 = v161;
  uint64_t v158 = v161[5];
  swift_getTupleTypeMetadata2();
  uint64_t v125 = sub_24EA06658();
  uint64_t v124 = swift_getWitnessTable();
  uint64_t v31 = sub_24EA06588();
  uint64_t v128 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  v151 = (char *)v111 - v32;
  uint64_t v155 = MEMORY[0x263F1B6E0];
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v198 = v31;
  uint64_t v199 = v7;
  uint64_t v34 = v31;
  uint64_t v122 = v31;
  uint64_t v123 = v33;
  uint64_t v157 = v7;
  uint64_t v35 = v33;
  uint64_t v36 = v150;
  uint64_t v200 = v33;
  uint64_t v201 = v150;
  uint64_t v37 = swift_getOpaqueTypeMetadata2();
  uint64_t v130 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  v149 = (char *)v111 - v38;
  uint64_t v198 = v34;
  uint64_t v199 = v7;
  uint64_t v200 = v35;
  uint64_t v201 = v36;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v197 = v25;
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v198 = v37;
  uint64_t v199 = v7;
  uint64_t v41 = v37;
  uint64_t v112 = v37;
  uint64_t v113 = v40;
  uint64_t v200 = v39;
  uint64_t v201 = v40;
  uint64_t v42 = v39;
  uint64_t v114 = v39;
  uint64_t v43 = v40;
  uint64_t v147 = swift_getOpaqueTypeMetadata2();
  uint64_t v129 = *(void *)(v147 - 8);
  MEMORY[0x270FA5388](v147);
  v127 = (char *)v111 - v44;
  uint64_t v45 = v30[7];
  uint64_t v198 = v30[3];
  uint64_t v199 = v45;
  uint64_t v46 = v198;
  uint64_t v146 = v198;
  uint64_t v47 = v45;
  uint64_t v156 = v45;
  swift_getOpaqueTypeMetadata2();
  uint64_t v198 = v46;
  uint64_t v199 = v47;
  swift_getOpaqueTypeConformance2();
  sub_24EA05EB8();
  uint64_t v48 = v30[4];
  sub_24EA06CA8();
  uint64_t v154 = v30[8];
  uint64_t v196 = v154;
  swift_getWitnessTable();
  sub_24EA06588();
  swift_getWitnessTable();
  sub_24EA05EB8();
  swift_getTupleTypeMetadata2();
  uint64_t v49 = sub_24EA06058();
  uint64_t v198 = v41;
  uint64_t v199 = v157;
  uint64_t v200 = v42;
  uint64_t v201 = v43;
  uint64_t v50 = swift_getOpaqueTypeConformance2();
  uint64_t v51 = swift_getWitnessTable();
  uint64_t v52 = v147;
  uint64_t v198 = v147;
  uint64_t v199 = v49;
  v111[1] = v49;
  v111[2] = v51;
  uint64_t v200 = v50;
  uint64_t v201 = v51;
  v111[3] = v50;
  uint64_t v53 = v51;
  uint64_t v54 = swift_getOpaqueTypeMetadata2();
  uint64_t v118 = v54;
  uint64_t v126 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  v148 = (char *)v111 - v55;
  uint64_t v198 = v52;
  uint64_t v199 = v49;
  uint64_t v200 = v50;
  uint64_t v201 = v53;
  uint64_t v117 = swift_getOpaqueTypeConformance2();
  uint64_t v198 = v54;
  uint64_t v199 = MEMORY[0x263F8D4F8];
  uint64_t v200 = v117;
  uint64_t v201 = MEMORY[0x263F8D510];
  uint64_t v119 = MEMORY[0x263F1B260];
  uint64_t v56 = swift_getOpaqueTypeMetadata2();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v120 = v56;
  uint64_t v121 = v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  uint64_t v115 = (char *)v111 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v58);
  uint64_t v116 = (char *)v111 - v60;
  sub_24EA06008();
  uint64_t v61 = v158;
  uint64_t v62 = v159;
  uint64_t v63 = v146;
  uint64_t v187 = v159;
  uint64_t v188 = v146;
  uint64_t v64 = v48;
  uint64_t v145 = v48;
  uint64_t v189 = v48;
  uint64_t v190 = v158;
  uint64_t v65 = v152;
  uint64_t v66 = v156;
  uint64_t v191 = v152;
  uint64_t v192 = v156;
  uint64_t v155 = v161[9];
  uint64_t v67 = v154;
  uint64_t v193 = v154;
  uint64_t v194 = v155;
  uint64_t v195 = v160;
  sub_24EA06578();
  sub_24E9E8860();
  sub_24E9E87B0();
  uint64_t v179 = v62;
  uint64_t v180 = v63;
  uint64_t v181 = v64;
  uint64_t v182 = v61;
  uint64_t v68 = v61;
  uint64_t v183 = v65;
  uint64_t v184 = v66;
  uint64_t v185 = v67;
  uint64_t v186 = v155;
  swift_getKeyPath();
  double v69 = v131;
  sub_24EA06798();
  swift_release();
  swift_release();
  double v70 = v134;
  sub_24EA06248();
  double v71 = v153;
  double v72 = v69;
  uint64_t v73 = v69;
  uint64_t v74 = v70;
  uint64_t v75 = v70;
  uint64_t v76 = v122;
  uint64_t v77 = v157;
  uint64_t v78 = v151;
  MEMORY[0x253345960](v153, v72, v74, v122, v157, v123, v150);
  (*(void (**)(char *, uint64_t))(v136 + 8))(v75, v137);
  (*(void (**)(char *, uint64_t))(v135 + 8))(v73, v77);
  (*(void (**)(char *, uint64_t))(v132 + 8))(v71, v133);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v78, v76);
  sub_24E9E87B0();
  uint64_t v79 = v159;
  uint64_t v171 = v159;
  uint64_t v172 = v63;
  uint64_t v173 = v145;
  uint64_t v174 = v68;
  uint64_t v80 = v152;
  uint64_t v175 = v152;
  uint64_t v81 = v156;
  uint64_t v176 = v156;
  uint64_t v177 = v154;
  uint64_t v178 = v155;
  swift_getKeyPath();
  uint64_t v82 = v138;
  sub_24EA067B8();
  swift_release();
  swift_release();
  uint64_t v83 = v127;
  uint64_t v84 = v112;
  uint64_t v85 = v149;
  sub_24EA06388();
  (*(void (**)(char *, uint64_t))(v139 + 8))(v82, v140);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v85, v84);
  uint64_t v162 = v79;
  uint64_t v163 = v63;
  uint64_t v86 = v145;
  uint64_t v164 = v145;
  uint64_t v165 = v158;
  uint64_t v166 = v80;
  uint64_t v167 = v81;
  uint64_t v87 = v154;
  uint64_t v88 = v155;
  uint64_t v168 = v154;
  uint64_t v169 = v155;
  uint64_t v89 = v160;
  uint64_t v170 = v160;
  swift_checkMetadataState();
  uint64_t v90 = v147;
  sub_24EA063C8();
  (*(void (**)(char *, uint64_t))(v129 + 8))(v83, v90);
  CGRect v91 = v161;
  LOBYTE(v198) = sub_24E9E88F0() & 1;
  uint64_t v93 = v141;
  uint64_t v92 = v142;
  (*(void (**)(char *, uint64_t, void *))(v142 + 16))(v141, v89, v91);
  uint64_t v94 = v92;
  unint64_t v95 = (*(unsigned __int8 *)(v92 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  uint64_t v96 = (char *)swift_allocObject();
  uint64_t v97 = v146;
  *((void *)v96 + 2) = v159;
  *((void *)v96 + 3) = v97;
  uint64_t v98 = v158;
  *((void *)v96 + 4) = v86;
  *((void *)v96 + 5) = v98;
  uint64_t v99 = v156;
  *((void *)v96 + 6) = v80;
  *((void *)v96 + 7) = v99;
  *((void *)v96 + 8) = v87;
  *((void *)v96 + 9) = v88;
  (*(void (**)(char *, char *, void *))(v94 + 32))(&v96[v95], v93, v91);
  uint64_t v100 = v115;
  uint64_t v102 = v117;
  uint64_t v101 = v118;
  uint64_t v103 = MEMORY[0x263F8D4F8];
  uint64_t v104 = MEMORY[0x263F8D510];
  uint64_t v105 = v148;
  sub_24EA063F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v126 + 8))(v105, v101);
  uint64_t v198 = v101;
  uint64_t v199 = v103;
  uint64_t v200 = v102;
  uint64_t v201 = v104;
  uint64_t v106 = swift_getOpaqueTypeConformance2();
  uint64_t v107 = v116;
  uint64_t v108 = v120;
  sub_24E9C74A8(v100, v120, v106);
  uint64_t v109 = *(void (**)(char *, uint64_t))(v121 + 8);
  v109(v100, v108);
  sub_24E9C74A8(v107, v108, v106);
  return ((uint64_t (*)(char *, uint64_t))v109)(v107, v108);
}

uint64_t sub_24E9E9B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void, void)@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v81 = a7;
  uint64_t v94 = a6;
  uint64_t v80 = a4;
  uint64_t v93 = a3;
  uint64_t v95 = a1;
  uint64_t v89 = a8;
  uint64_t v82 = a5;
  uint64_t v88 = *(void *)(a5 - 8);
  uint64_t v96 = a9;
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v87 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v86 = (char *)&v67 - v12;
  uint64_t v108 = v13;
  uint64_t v109 = v14;
  uint64_t v110 = v15;
  uint64_t v111 = v16;
  uint64_t v112 = v17;
  uint64_t v113 = v18;
  uint64_t v19 = v17;
  uint64_t v114 = v20;
  uint64_t v115 = v21;
  uint64_t v79 = type metadata accessor for SidebarView();
  uint64_t v84 = *(void *)(v79 - 8);
  uint64_t v85 = *(void *)(v84 + 64);
  MEMORY[0x270FA5388](v79);
  uint64_t v83 = (char *)&v67 - v22;
  uint64_t v90 = sub_24EA06A58();
  uint64_t v23 = *(void *)(v19 + 32);
  uint64_t v92 = v19;
  uint64_t v72 = v23;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F050);
  uint64_t v26 = sub_24EA06CA8();
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F058);
  uint64_t v28 = sub_24E9B7F78(&qword_26991F060, &qword_26991F058);
  uint64_t v108 = v27;
  uint64_t v109 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v30 = *(void *)(v19 + 24);
  void v107[5] = v30;
  uint64_t v76 = v30;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v108 = v25;
  uint64_t v109 = v26;
  uint64_t v110 = OpaqueTypeConformance2;
  uint64_t v111 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v77 = OpaqueTypeMetadata2;
  uint64_t v108 = v25;
  uint64_t v109 = v26;
  uint64_t v110 = OpaqueTypeConformance2;
  uint64_t v111 = WitnessTable;
  uint64_t v75 = swift_getOpaqueTypeConformance2();
  uint64_t v108 = OpaqueTypeMetadata2;
  uint64_t v109 = a2;
  uint64_t v110 = v75;
  uint64_t v111 = v30;
  uint64_t v74 = MEMORY[0x263F1A910];
  swift_getOpaqueTypeMetadata2();
  uint64_t v33 = sub_24EA05F68();
  uint64_t v69 = v33;
  uint64_t v34 = v90;
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v71 = v35;
  uint64_t v36 = a2;
  uint64_t v73 = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v108 = v34;
  uint64_t v109 = AssociatedTypeWitness;
  uint64_t v110 = v33;
  uint64_t v111 = v35;
  uint64_t v112 = AssociatedConformanceWitness;
  uint64_t v91 = sub_24EA065D8();
  uint64_t v78 = *(void *)(v91 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v91);
  uint64_t v68 = (char *)&v67 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  double v70 = (char *)&v67 - v40;
  uint64_t v41 = v79;
  uint64_t v42 = v95;
  sub_24E9E87B0();
  uint64_t v97 = v36;
  uint64_t v98 = v93;
  uint64_t v43 = v80;
  uint64_t v99 = v80;
  uint64_t v44 = v82;
  uint64_t v100 = v82;
  uint64_t v101 = v92;
  uint64_t v102 = v94;
  uint64_t v45 = v81;
  uint64_t v46 = v96;
  uint64_t v103 = v81;
  uint64_t v104 = v96;
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v105 = v107[0];
  uint64_t v47 = v84;
  uint64_t v48 = v83;
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v83, v42, v41);
  unint64_t v49 = (*(unsigned __int8 *)(v47 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  uint64_t v50 = (char *)swift_allocObject();
  uint64_t v51 = v93;
  *((void *)v50 + 2) = v36;
  *((void *)v50 + 3) = v51;
  *((void *)v50 + 4) = v43;
  *((void *)v50 + 5) = v44;
  uint64_t v52 = v94;
  *((void *)v50 + 6) = v92;
  *((void *)v50 + 7) = v52;
  *((void *)v50 + 8) = v45;
  *((void *)v50 + 9) = v46;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v50[v49], v48, v41);
  uint64_t v108 = v77;
  uint64_t v109 = v36;
  uint64_t v110 = v75;
  uint64_t v111 = v76;
  v107[3] = swift_getOpaqueTypeConformance2();
  v107[4] = MEMORY[0x263F18C10];
  uint64_t v53 = swift_getWitnessTable();
  uint64_t v54 = v68;
  sub_24EA065C8();
  v107[2] = v53;
  uint64_t v55 = v91;
  uint64_t v93 = swift_getWitnessTable();
  uint64_t v56 = v70;
  sub_24E9C74A8(v54, v55, v93);
  uint64_t v57 = v78;
  uint64_t v94 = *(uint64_t (**)(void, void))(v78 + 8);
  uint64_t v58 = v94(v54, v55);
  uint64_t v59 = v87;
  (*(void (**)(uint64_t))(v95 + 56))(v58);
  uint64_t v60 = v86;
  sub_24E9C74A8(v59, v44, v96);
  uint64_t v61 = v88;
  uint64_t v62 = *(void (**)(char *, uint64_t))(v88 + 8);
  v62(v59, v44);
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  uint64_t v64 = v91;
  v63(v54, v56, v91);
  uint64_t v108 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v59, v60, v44);
  uint64_t v109 = (uint64_t)v59;
  v107[0] = v64;
  v107[1] = v44;
  uint64_t v105 = v93;
  uint64_t v106 = v96;
  sub_24E9EB614((uint64_t)&v108, 2uLL, (uint64_t)v107);
  v62(v60, v44);
  uint64_t v65 = (uint64_t (*)(char *, uint64_t))v94;
  v94(v56, v64);
  v62(v59, v44);
  return v65(v54, v64);
}

uint64_t sub_24E9EA3DC()
{
  return sub_24E9EE5E4((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E9E9B60);
}

uint64_t sub_24E9EA3F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v93 = a8;
  uint64_t v92 = a6;
  uint64_t v91 = a5;
  uint64_t v94 = a4;
  uint64_t v128 = a2;
  uint64_t v129 = a1;
  uint64_t v121 = a9;
  uint64_t v90 = a11;
  uint64_t v88 = a10;
  uint64_t v125 = sub_24EA06CA8();
  uint64_t v120 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v117 = (char *)&v83 - v17;
  uint64_t v18 = *(void *)(a7 + 24);
  uint64_t v89 = a7;
  uint64_t v151 = v18;
  uint64_t v19 = v18;
  uint64_t v105 = v18;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v119 = sub_24EA05E38();
  uint64_t v118 = *(void *)(v119 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v119);
  uint64_t v116 = (char *)&v83 - v21;
  uint64_t v130 = *(void *)(a3 - 8);
  uint64_t v87 = *(void *)(v130 + 64);
  MEMORY[0x270FA5388](v20);
  v127 = (char *)&v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = a3;
  uint64_t v144 = a4;
  uint64_t v145 = a5;
  uint64_t v146 = a6;
  uint64_t v147 = a7;
  uint64_t v148 = a8;
  uint64_t v149 = a10;
  uint64_t v150 = a11;
  uint64_t v124 = type metadata accessor for SidebarView();
  uint64_t v123 = *(void *)(v124 - 8);
  uint64_t v23 = *(void *)(v123 + 64);
  MEMORY[0x270FA5388](v124);
  uint64_t v25 = (char *)&v83 - v24;
  uint64_t v84 = (char *)&v83 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F058);
  uint64_t v101 = v26;
  uint64_t v114 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v97 = (char *)&v83 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F050);
  uint64_t v115 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v103 = (char *)&v83 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_24E9B7F78(&qword_26991F060, &qword_26991F058);
  uint64_t v143 = v26;
  uint64_t v144 = v102;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v28;
  uint64_t v99 = v28;
  uint64_t v32 = v125;
  uint64_t v143 = v28;
  uint64_t v144 = v125;
  uint64_t v33 = OpaqueTypeConformance2;
  uint64_t v100 = OpaqueTypeConformance2;
  uint64_t v34 = WitnessTable;
  uint64_t v145 = OpaqueTypeConformance2;
  uint64_t v146 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v106 = OpaqueTypeMetadata2;
  uint64_t v113 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v98 = (char *)&v83 - v36;
  uint64_t v143 = v31;
  uint64_t v144 = v32;
  uint64_t v145 = v33;
  uint64_t v146 = v34;
  uint64_t v104 = swift_getOpaqueTypeConformance2();
  uint64_t v143 = OpaqueTypeMetadata2;
  uint64_t v144 = a3;
  uint64_t v122 = a3;
  uint64_t v145 = v104;
  uint64_t v146 = v19;
  uint64_t v109 = MEMORY[0x263F1A910];
  uint64_t v107 = swift_getOpaqueTypeMetadata2();
  uint64_t v111 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v95 = (char *)&v83 - v37;
  uint64_t v110 = sub_24EA05F68();
  uint64_t v112 = *(void *)(v110 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v110);
  uint64_t v96 = (char *)&v83 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  uint64_t v108 = (char *)&v83 - v40;
  uint64_t v41 = v123;
  uint64_t v42 = v25;
  uint64_t v43 = v124;
  (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v42, v128, v124);
  uint64_t v44 = v130;
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v130 + 16);
  uint64_t v85 = v130 + 16;
  uint64_t v86 = v45;
  v45(v127, v129, a3);
  unint64_t v46 = (*(unsigned __int8 *)(v41 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  unint64_t v83 = (v23 + *(unsigned __int8 *)(v44 + 80) + v46) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v47 = (char *)swift_allocObject();
  uint64_t v48 = v94;
  *((void *)v47 + 2) = a3;
  *((void *)v47 + 3) = v48;
  uint64_t v49 = v91;
  uint64_t v50 = v92;
  *((void *)v47 + 4) = v91;
  *((void *)v47 + 5) = v50;
  uint64_t v51 = v89;
  uint64_t v52 = v93;
  *((void *)v47 + 6) = v89;
  *((void *)v47 + 7) = v52;
  uint64_t v53 = v88;
  uint64_t v54 = v90;
  *((void *)v47 + 8) = v88;
  *((void *)v47 + 9) = v54;
  (*(void (**)(char *, char *, uint64_t))(v123 + 32))(&v47[v46], v84, v43);
  uint64_t v55 = v122;
  (*(void (**)(char *, char *, uint64_t))(v130 + 32))(&v47[v83], v127, v122);
  uint64_t v131 = v55;
  uint64_t v132 = v48;
  uint64_t v133 = v49;
  uint64_t v134 = v50;
  uint64_t v135 = v51;
  uint64_t v136 = v52;
  uint64_t v137 = v53;
  uint64_t v138 = v54;
  uint64_t v56 = v129;
  uint64_t v139 = v129;
  uint64_t v140 = v128;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F070);
  sub_24E9B7F78(&qword_26991F078, &qword_26991F070);
  uint64_t v57 = v97;
  sub_24EA06538();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F080);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_24EA097F0;
  uint64_t v59 = v51;
  uint64_t v60 = *(uint64_t (**)(uint64_t, uint64_t))(v51 + 56);
  uint64_t v61 = v56;
  uint64_t v62 = v122;
  *(void *)(v58 + 32) = v60(v122, v59);
  *(void *)(v58 + 40) = v63;
  uint64_t v64 = v103;
  uint64_t v65 = v101;
  sub_24EA062E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v57, v65);
  uint64_t v66 = v116;
  sub_24E9E8860();
  uint64_t v67 = v117;
  v86(v117, v61, v62);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v130 + 56))(v67, 0, 1, v62);
  uint64_t v68 = v98;
  uint64_t v69 = v99;
  uint64_t v70 = v125;
  sub_24EA06398();
  (*(void (**)(char *, uint64_t))(v120 + 8))(v67, v70);
  (*(void (**)(char *, uint64_t))(v118 + 8))(v66, v119);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v64, v69);
  uint64_t v71 = v95;
  uint64_t v72 = v106;
  uint64_t v73 = v104;
  uint64_t v74 = v105;
  sub_24EA06328();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v68, v72);
  sub_24EA06288();
  uint64_t v143 = v72;
  uint64_t v144 = v62;
  uint64_t v145 = v73;
  uint64_t v146 = v74;
  uint64_t v75 = swift_getOpaqueTypeConformance2();
  uint64_t v76 = v96;
  uint64_t v77 = v107;
  sub_24EA063B8();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v71, v77);
  uint64_t v141 = v75;
  uint64_t v142 = MEMORY[0x263F18C10];
  uint64_t v78 = v110;
  uint64_t v79 = swift_getWitnessTable();
  uint64_t v80 = v108;
  sub_24E9C74A8(v76, v78, v79);
  uint64_t v81 = *(void (**)(char *, uint64_t))(v112 + 8);
  v81(v76, v78);
  sub_24E9C74A8(v80, v78, v79);
  return ((uint64_t (*)(char *, uint64_t))v81)(v80, v78);
}

uint64_t sub_24E9EB038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v21 = a8;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v15 = type metadata accessor for SidebarAction();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v20 - v17;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = v21;
  uint64_t v30 = a9;
  uint64_t v31 = a10;
  type metadata accessor for SidebarView();
  sub_24E9E87B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v18, v23, a3);
  sub_24EA067A8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_24E9EB1A0()
{
  return sub_24EA064E8();
}

uint64_t sub_24E9EB258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v43 = a2;
  uint64_t v46 = a1;
  uint64_t v47 = a9;
  uint64_t v39 = *(void *)(a7 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v37 = (char *)&v36 - v18;
  uint64_t v45 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v44 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_24EA05CD8();
  uint64_t v41 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = a3;
  unint64_t v57 = a4;
  uint64_t v58 = a5;
  uint64_t v59 = a6;
  uint64_t v60 = a7;
  uint64_t v61 = a8;
  uint64_t v62 = a10;
  uint64_t v63 = a11;
  type metadata accessor for SidebarView();
  sub_24E9E87B0();
  uint64_t v48 = a3;
  unint64_t v49 = a4;
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v52 = a7;
  uint64_t v53 = a8;
  uint64_t v54 = a10;
  uint64_t v55 = a11;
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v22 = v46;
  uint64_t v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(a7 + 88))(v21, a3, a7);
  unint64_t v25 = v24;
  uint64_t v26 = v21;
  uint64_t v27 = v45;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v42);
  uint64_t v28 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v44, v22, a3);
  if (!v25)
  {
    uint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    sub_24EA06978();
    uint64_t v29 = v37;
    sub_24EA06D98();
    uint64_t v30 = AssociatedTypeWitness;
    sub_24EA07018();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v30);
    sub_24EA06978();
    uint64_t v23 = v56;
    unint64_t v25 = v57;
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, a3);
  uint64_t v56 = v23;
  unint64_t v57 = v25;
  sub_24E9DA730();
  uint64_t result = sub_24EA062D8();
  uint64_t v32 = v47;
  uint64_t *v47 = result;
  v32[1] = v33;
  *((unsigned char *)v32 + 16) = v34 & 1;
  v32[3] = v35;
  return result;
}

uint64_t sub_24E9EB614(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_24EA06668();
}

uint64_t sub_24E9EB7D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v46 = a8;
  uint64_t v50 = a6;
  uint64_t v41 = a5;
  uint64_t v44 = a2;
  uint64_t v48 = a1;
  uint64_t v55 = a9;
  uint64_t v56 = a10;
  uint64_t v39 = a4;
  sub_24EA06CA8();
  uint64_t v77 = a8;
  swift_getWitnessTable();
  uint64_t v53 = sub_24EA06588();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v51 = sub_24EA05EB8();
  uint64_t v54 = *(void *)(v51 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v51);
  uint64_t v47 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v49 = (char *)&v37 - v17;
  uint64_t v18 = sub_24EA060C8();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v75 = a3;
  uint64_t v76 = a7;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v75 = a3;
  uint64_t v76 = a7;
  uint64_t v38 = a3;
  uint64_t v40 = a7;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = sub_24EA05EB8();
  uint64_t v43 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v37 - v23;
  uint64_t v42 = (uint64_t)&v37 - v23;
  sub_24EA060A8();
  uint64_t v25 = v44;
  uint64_t v66 = v44;
  uint64_t v67 = a3;
  uint64_t v68 = a4;
  uint64_t v69 = a5;
  uint64_t v26 = v50;
  uint64_t v70 = v50;
  uint64_t v71 = a7;
  uint64_t v27 = v46;
  uint64_t v72 = v46;
  uint64_t v73 = v56;
  uint64_t v28 = v48;
  uint64_t v74 = v48;
  sub_24EA05EA8();
  OpaqueTypeMetadata2 = swift_getWitnessTable();
  uint64_t v29 = v43;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v24, v22, v19);
  uint64_t v43 = *(void *)(v29 + 8);
  ((void (*)(char *, uint64_t))v43)(v22, v19);
  sub_24EA060B8();
  uint64_t v57 = v25;
  uint64_t v58 = v38;
  uint64_t v59 = v39;
  uint64_t v60 = v41;
  uint64_t v61 = v26;
  uint64_t v62 = v40;
  uint64_t v63 = v27;
  uint64_t v64 = v56;
  uint64_t v65 = v28;
  uint64_t v30 = v47;
  sub_24EA05EA8();
  uint64_t v31 = v51;
  swift_getWitnessTable();
  uint64_t v32 = v54;
  uint64_t v33 = (uint64_t)v49;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v49, v30, v31);
  char v34 = *(void (**)(char *, uint64_t))(v32 + 8);
  v34(v30, v31);
  uint64_t v35 = v42;
  sub_24E9EC550(v42, v33, v19, v31);
  v34((char *)v33, v31);
  return ((uint64_t (*)(uint64_t, uint64_t))v43)(v35, v19);
}

uint64_t sub_24E9EBD48()
{
  return sub_24E9EE5E4((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E9EB7D8);
}

uint64_t sub_24E9EBD60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v31 = a6;
  uint64_t v32 = a8;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v28 = a2;
  uint64_t v35 = a9;
  uint64_t v34 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v15;
  uint64_t v37 = v16;
  uint64_t v33 = MEMORY[0x263F1B1E0];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v18 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v28 - v23;
  (*(void (**)(uint64_t))(a1 + 24))(v22);
  uint64_t v36 = v28;
  uint64_t v37 = a3;
  uint64_t v38 = v29;
  uint64_t v39 = v30;
  uint64_t v40 = v31;
  uint64_t v41 = a7;
  uint64_t v42 = v32;
  uint64_t v43 = a10;
  type metadata accessor for SidebarView();
  sub_24E9E8950();
  sub_24EA063A8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, a3);
  uint64_t v36 = a3;
  uint64_t v37 = a7;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_24E9C74A8(v21, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v26(v21, OpaqueTypeMetadata2);
  sub_24E9C74A8(v24, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v26)(v24, OpaqueTypeMetadata2);
}

uint64_t sub_24E9EBFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v25 = a5;
  uint64_t v26 = a1;
  uint64_t v29 = a9;
  uint64_t v24 = a10;
  sub_24EA06CA8();
  uint64_t v39 = a8;
  swift_getWitnessTable();
  uint64_t v14 = sub_24EA06588();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v24 - v19;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = v25;
  uint64_t v34 = v27;
  uint64_t v35 = v28;
  uint64_t v36 = a8;
  uint64_t v37 = v24;
  uint64_t v38 = v26;
  sub_24EA05FF8();
  sub_24EA06578();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9C74A8(v18, v14, WitnessTable);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v15 + 8);
  v22(v18, v14);
  sub_24E9C74A8(v20, v14, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v22)(v20, v14);
}

uint64_t sub_24E9EC1FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v34 = a3;
  uint64_t v35 = a5;
  uint64_t v33 = a2;
  uint64_t v38 = a9;
  uint64_t v13 = *(void *)(a4 - 8);
  uint64_t v32 = a10;
  uint64_t v14 = MEMORY[0x270FA5388](a1);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = sub_24EA06CA8();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v32 - v24;
  uint64_t v40 = v33;
  uint64_t v41 = v34;
  uint64_t v42 = a4;
  uint64_t v43 = v35;
  uint64_t v44 = v36;
  uint64_t v45 = v37;
  uint64_t v37 = a8;
  uint64_t v46 = a8;
  uint64_t v47 = v32;
  type metadata accessor for SidebarView();
  if (sub_24E9E89B4())
  {
    (*(void (**)(void))(a1 + 40))();
    uint64_t v36 = v25;
    uint64_t v26 = v37;
    sub_24E9C74A8(v16, a4, v37);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v13 + 8);
    v27(v16, a4);
    sub_24E9C74A8(v18, a4, v26);
    v27(v18, a4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v23, 0, 1, a4);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v36, v23, v19);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
    v28(v23, v19);
    uint64_t v29 = v26;
    uint64_t v25 = v36;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v23, 1, 1, a4);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v25, v23, v19);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
    v28(v23, v19);
    uint64_t v29 = v37;
  }
  uint64_t v39 = v29;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9C74A8(v25, v19, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v28)(v25, v19);
}

uint64_t sub_24E9EC550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v11 = (char *)&v13 + *(int *)(v9 + 48) - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v13 - v10, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v11, a2, a4);
  return sub_24EA06068();
}

uint64_t sub_24E9EC674()
{
  return swift_release();
}

uint64_t sub_24E9EC704()
{
  return sub_24E9EC674();
}

uint64_t sub_24E9EC7D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9EC828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 96);
}

uint64_t sub_24E9EC830()
{
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t result = sub_24EA05E68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E9EC930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  unint64_t v9 = v7 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v10 = *(void *)(v5 + 64);
  }
  else {
    size_t v10 = *(void *)(v5 + 64) + 1;
  }
  size_t v11 = v10 + 7;
  uint64_t v12 = v7 + 8;
  unint64_t v13 = (((v9 & (v7 + 72))
        + ((v12 + ((v10 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)v7)
        + v10
        + 31) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  int v14 = v7 & 0x100000;
  if (v8 > 7 || v14 != 0 || v13 > 0x18)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    uint64_t v18 = v17 + (v9 & (v8 + 16));
  }
  else
  {
    uint64_t v47 = ~v8;
    size_t v48 = ((v8 + 8 + ((v10 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v8) + v10;
    uint64_t v19 = *(void *)a2;
    uint64_t v20 = *(void *)(a2 + 8);
    uint64_t v49 = *(void *)(a3 + 16);
    char v21 = *(unsigned char *)(a2 + 16);
    sub_24E9C7B00();
    *(void *)a1 = v19;
    *(void *)(a1 + 8) = v20;
    *(unsigned char *)(a1 + 16) = v21;
    uint64_t v45 = a1;
    unint64_t v22 = a1 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
    *(void *)(v22 + 24) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
    *(void *)(v22 + 32) = v23;
    uint64_t v24 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v26 = v25[1];
    void *v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (void *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = (void *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = (void *)(v9 & ((unint64_t)v27 + 23));
    uint64_t v31 = v9 & ((unint64_t)v28 + 23);
    uint64_t v32 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
    swift_retain();
    uint64_t v33 = (const void *)v31;
    uint64_t v34 = v49;
    swift_retain();
    swift_retain();
    uint64_t v46 = v32;
    if (v32(v33, 1, v49))
    {
      memcpy(v30, v33, v10);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v30, v33, v49);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v30, 0, 1, v49);
    }
    uint64_t v50 = v30;
    uint64_t v35 = (void *)(((unint64_t)v30 + v11) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v36 = v33;
    uint64_t v37 = (void *)(((unint64_t)v33 + v11) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v35 = *v37;
    uint64_t v38 = (void *)(((unint64_t)v35 + v12) & v47);
    uint64_t v39 = (const void *)(((unint64_t)v37 + v12) & v47);
    swift_retain();
    uint64_t v18 = v45;
    if (v46(v39, 1, v34))
    {
      memcpy(v38, v39, v10);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v38, v39, v34);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v38, 0, 1, v34);
    }
    unint64_t v40 = ((unint64_t)v50 + v48 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v41 = ((unint64_t)v36 + v48 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v40 = *(unsigned char *)v41;
    *(void *)(v40 + 8) = *(void *)(v41 + 8);
    *(unsigned char *)(v40 + 16) = *(unsigned char *)(v41 + 16);
    unint64_t v42 = ((unint64_t)v50 + v48 + 31) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v43 = ((unint64_t)v36 + v48 + 31) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v42 = *(unsigned char *)v43;
    *(void *)(v42 + 8) = *(void *)(v43 + 8);
    swift_retain();
  }
  swift_retain();
  return v18;
}

uint64_t sub_24E9ECC68(uint64_t a1, uint64_t a2)
{
  sub_24E9C79E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = ((((((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + (v6 | 7) + 16) & ~(v6 | 7);
  uint64_t v8 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v8(v7, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v9 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v9 = *(void *)(v5 + 64) + 1;
  }
  swift_release();
  unint64_t v10 = (v6 + 8 + (((v7 | 7) + v9) & 0xFFFFFFFFFFFFFFF8)) & ~v6;
  if (!v8(v10, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v10, v4);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_24E9ECE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v42 = a1;
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(void *)(v9 + 24) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(void *)(v9 + 32) = v10;
  size_t v11 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  int v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = *(void *)(a3 + 16);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(_DWORD *)(v18 + 80);
  unint64_t v20 = *(_DWORD *)(v18 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = ((unint64_t)v14 + v19 + 16) & v20;
  uint64_t v22 = ((unint64_t)v15 + v19 + 16) & v20;
  uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v41 = v23;
  if (v23((const void *)v22, 1, v17))
  {
    int v24 = *(_DWORD *)(v18 + 84);
    size_t v25 = *(void *)(v18 + 64);
    if (v24) {
      size_t v26 = *(void *)(v18 + 64);
    }
    else {
      size_t v26 = v25 + 1;
    }
    memcpy((void *)v21, (const void *)v22, v26);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v22, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
    int v24 = *(_DWORD *)(v18 + 84);
    size_t v25 = *(void *)(v18 + 64);
  }
  if (!v24) {
    ++v25;
  }
  uint64_t v27 = (void *)(((v21 | 7) + v25) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v28 = (void *)(((v22 | 7) + v25) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v27 = *v28;
  uint64_t v29 = v19 + 8;
  uint64_t v30 = ~v19;
  uint64_t v31 = (void *)(((unint64_t)v27 + v19 + 8) & ~v19);
  uint64_t v32 = (const void *)(((unint64_t)v28 + v19 + 8) & ~v19);
  swift_retain();
  if (v41(v32, 1, v17))
  {
    memcpy(v31, v32, v25);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v31, v32, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v31, 0, 1, v17);
  }
  size_t v33 = ((v29 + ((v25 + 7) & 0xFFFFFFFFFFFFFFF8)) & v30) + v25;
  size_t v34 = v33 + v21;
  size_t v35 = v33 + v22;
  unint64_t v36 = (v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v36 = *(unsigned char *)v37;
  *(void *)(v36 + 8) = *(void *)(v37 + 8);
  *(unsigned char *)(v36 + 16) = *(unsigned char *)(v37 + 16);
  unint64_t v38 = (v34 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v39 = (v35 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v38 = *(unsigned char *)v39;
  *(void *)(v38 + 8) = *(void *)(v39 + 8);
  swift_retain();
  swift_retain();
  return v42;
}

uint64_t sub_24E9ED0F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_24E9C79E0();
  uint64_t v46 = a1;
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(void *)(v9 + 24) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(void *)(v9 + 32) = v10;
  swift_retain();
  swift_release();
  size_t v11 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  int v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = *(void *)(a3 + 16);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(_DWORD *)(v18 + 80);
  unint64_t v20 = *(_DWORD *)(v18 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = ((unint64_t)v14 + v19 + 16) & v20;
  uint64_t v22 = ((unint64_t)v15 + v19 + 16) & v20;
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v15) = v23(v21, 1, v17);
  int v24 = v23(v22, 1, v17);
  if (v15)
  {
    if (!v24)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v22, v17);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
      goto LABEL_12;
    }
    int v25 = *(_DWORD *)(v18 + 84);
    size_t v26 = *(void *)(v18 + 64);
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 24))(v21, v22, v17);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
    int v25 = *(_DWORD *)(v18 + 84);
    size_t v26 = *(void *)(v18 + 64);
  }
  if (v25) {
    size_t v27 = v26;
  }
  else {
    size_t v27 = v26 + 1;
  }
  memcpy((void *)v21, (const void *)v22, v27);
LABEL_12:
  if (*(_DWORD *)(v18 + 84)) {
    size_t v28 = *(void *)(v18 + 64);
  }
  else {
    size_t v28 = *(void *)(v18 + 64) + 1;
  }
  uint64_t v44 = v22;
  uint64_t v45 = v21;
  uint64_t v29 = (void *)(((v21 | 7) + v28) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v30 = (void *)(((v22 | 7) + v28) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v29 = *v30;
  swift_retain();
  swift_release();
  uint64_t v31 = v19 + 8;
  uint64_t v43 = ~v19;
  uint64_t v32 = (void *)(((unint64_t)v29 + v19 + 8) & ~v19);
  size_t v33 = (const void *)(((unint64_t)v30 + v19 + 8) & ~v19);
  LODWORD(v29) = v23((uint64_t)v32, 1, v17);
  int v34 = v23((uint64_t)v33, 1, v17);
  if (!v29)
  {
    if (!v34)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v32, v33, v17);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v32, v17);
    goto LABEL_20;
  }
  if (v34)
  {
LABEL_20:
    memcpy(v32, v33, v28);
    goto LABEL_21;
  }
  (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v32, v33, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v32, 0, 1, v17);
LABEL_21:
  size_t v35 = ((v31 + ((v28 + 7) & 0xFFFFFFFFFFFFFFF8)) & v43) + v28;
  size_t v36 = v35 + v45;
  size_t v37 = v35 + v44;
  unint64_t v38 = (v35 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v39 = (v35 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v38 = *(unsigned char *)v39;
  *(void *)(v38 + 8) = *(void *)(v39 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v38 + 16) = *(unsigned char *)(v39 + 16);
  unint64_t v40 = (v36 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (v37 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v40 = *(unsigned char *)v41;
  *(void *)(v40 + 8) = *(void *)(v41 + 8);
  swift_retain();
  swift_release();
  return v46;
}

__n128 sub_24E9ED4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24) = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  uint64_t v3 = (_OWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v4 = (_OWORD *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v3 = *v4;
  uint64_t v5 = (_OWORD *)(((unint64_t)v3 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (_OWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  unint64_t v10 = *(_DWORD *)(v8 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = ((unint64_t)v5 + v9 + 16) & v10;
  uint64_t v12 = ((unint64_t)v6 + v9 + 16) & v10;
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v13(v12, 1, v7))
  {
    int v14 = *(_DWORD *)(v8 + 84);
    size_t v15 = *(void *)(v8 + 64);
    if (v14) {
      size_t v16 = *(void *)(v8 + 64);
    }
    else {
      size_t v16 = v15 + 1;
    }
    memcpy((void *)v11, (const void *)v12, v16);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    int v14 = *(_DWORD *)(v8 + 84);
    size_t v15 = *(void *)(v8 + 64);
  }
  if (!v14) {
    ++v15;
  }
  uint64_t v17 = (void *)(((v11 | 7) + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (void *)(((v12 | 7) + v15) & 0xFFFFFFFFFFFFFFF8);
  void *v17 = *v18;
  uint64_t v19 = v9 + 8;
  uint64_t v30 = ~v9;
  unint64_t v20 = (void *)(((unint64_t)v17 + v9 + 8) & ~v9);
  uint64_t v21 = (const void *)(((unint64_t)v18 + v9 + 8) & ~v9);
  if (v13((uint64_t)v21, 1, v7))
  {
    memcpy(v20, v21, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v20, v21, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v7);
  }
  size_t v22 = ((v19 + ((v15 + 7) & 0xFFFFFFFFFFFFFFF8)) & v30) + v15;
  size_t v23 = v22 + v11;
  size_t v24 = v22 + v12;
  unint64_t v25 = (v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v27 = *(_OWORD *)v26;
  *(unsigned char *)(v25 + 16) = *(unsigned char *)(v26 + 16);
  *(_OWORD *)unint64_t v25 = v27;
  size_t v28 = (__n128 *)((v24 + 31) & 0xFFFFFFFFFFFFFFF8);
  __n128 result = *v28;
  *(__n128 *)((v23 + 31) & 0xFFFFFFFFFFFFFFF8) = *v28;
  return result;
}

uint64_t sub_24E9ED784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  v4 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24) = *(_OWORD *)(v4 + 24);
  swift_release();
  uint64_t v7 = (_OWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v4 + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  swift_release();
  uint64_t v9 = (_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v10 = (_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v9 = *v10;
  swift_release();
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(_DWORD *)(v12 + 80);
  unint64_t v14 = *(_DWORD *)(v12 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = ((unint64_t)v9 + v13 + 16) & v14;
  uint64_t v16 = ((unint64_t)v10 + v13 + 16) & v14;
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v9) = v17(v15, 1, v11);
  int v18 = v17(v16, 1, v11);
  if (v9)
  {
    if (!v18)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v16, v11);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
      goto LABEL_12;
    }
    int v19 = *(_DWORD *)(v12 + 84);
    size_t v20 = *(void *)(v12 + 64);
  }
  else
  {
    if (!v18)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v15, v16, v11);
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
    int v19 = *(_DWORD *)(v12 + 84);
    size_t v20 = *(void *)(v12 + 64);
  }
  if (v19) {
    size_t v21 = v20;
  }
  else {
    size_t v21 = v20 + 1;
  }
  memcpy((void *)v15, (const void *)v16, v21);
LABEL_12:
  if (*(_DWORD *)(v12 + 84)) {
    size_t v22 = *(void *)(v12 + 64);
  }
  else {
    size_t v22 = *(void *)(v12 + 64) + 1;
  }
  uint64_t v38 = v16;
  uint64_t v39 = v15;
  size_t v23 = (void *)(((v15 | 7) + v22) & 0xFFFFFFFFFFFFFFF8);
  size_t v24 = (void *)(((v16 | 7) + v22) & 0xFFFFFFFFFFFFFFF8);
  *size_t v23 = *v24;
  swift_release();
  uint64_t v25 = v13 + 8;
  uint64_t v37 = ~v13;
  unint64_t v26 = (void *)(((unint64_t)v23 + v13 + 8) & ~v13);
  long long v27 = (const void *)(((unint64_t)v24 + v13 + 8) & ~v13);
  LODWORD(v24) = v17((uint64_t)v26, 1, v11);
  int v28 = v17((uint64_t)v27, 1, v11);
  if (!v24)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v26, v27, v11);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v26, v11);
    goto LABEL_20;
  }
  if (v28)
  {
LABEL_20:
    memcpy(v26, v27, v22);
    goto LABEL_21;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v26, v27, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
LABEL_21:
  size_t v29 = ((v25 + ((v22 + 7) & 0xFFFFFFFFFFFFFFF8)) & v37) + v22;
  size_t v30 = v29 + v39;
  size_t v31 = v29 + v38;
  unint64_t v32 = (v29 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (v29 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v32 = *(unsigned char *)v33;
  *(void *)(v32 + 8) = *(void *)(v33 + 8);
  swift_release();
  *(unsigned char *)(v32 + 16) = *(unsigned char *)(v33 + 16);
  unint64_t v34 = (v30 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v31 + 31) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v34 = *(unsigned char *)v35;
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  swift_release();
  return a1;
}

uint64_t sub_24E9EDB38(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  if (v6) {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v9 | 7;
  if (v8 < a2)
  {
    unint64_t v12 = ((v10 + ((v9 + 72) & ~v11) + ((v9 + ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v9) + 31) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    unsigned int v13 = a2 - v8;
    uint64_t v14 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = v13 + 1;
    }
    if (v15 >= 0x10000) {
      unsigned int v16 = 4;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v15 < 0x100) {
      unsigned int v16 = 1;
    }
    if (v15 >= 2) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    switch(v17)
    {
      case 1:
        int v18 = *(unsigned __int8 *)(a1 + v12);
        if (!v18) {
          break;
        }
        goto LABEL_28;
      case 2:
        int v18 = *(unsigned __int16 *)(a1 + v12);
        if (v18) {
          goto LABEL_28;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24E9EDCFCLL);
      case 4:
        int v18 = *(_DWORD *)(a1 + v12);
        if (!v18) {
          break;
        }
LABEL_28:
        int v20 = v18 - 1;
        if (v14)
        {
          int v20 = 0;
          LODWORD(v14) = *(_DWORD *)a1;
        }
        return v8 + (v14 | v20) + 1;
      default:
        break;
    }
  }
  unint64_t v21 = a1 & 0xFFFFFFFFFFFFFFF8;
  if ((v7 & 0x80000000) != 0)
  {
    unsigned int v23 = (*(uint64_t (**)(unint64_t))(v5 + 48))((((((v21 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                 + v11
                                                                 + 16) & ~v11);
    if (v23 >= 2) {
      return v23 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    unint64_t v22 = *(void *)(v21 + 24);
    if (v22 >= 0xFFFFFFFF) {
      LODWORD(v22) = -1;
    }
    return (v22 + 1);
  }
}

void sub_24E9EDD10(unint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = v11 | 7;
  size_t v13 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v13;
  }
  size_t v14 = ((v13 + ((v11 + 72) & ~(v11 | 7)) + ((v11 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v11) + 31) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v10 < a3)
  {
    unsigned int v15 = a3 - v10;
    if (((v13
         + ((v11 + 72) & ~(v11 | 7))
         + ((v11 + ((v13 + 7) & 0xFFFFFFF8) + 8) & ~v11)
         + 31) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v16 = v15 + 1;
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v6 = v17;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v13
         + ((v11 + 72) & ~(v11 | 7))
         + ((v11 + ((v13 + 7) & 0xFFFFFFF8) + 8) & ~v11)
         + 31) & 0xFFFFFFF8) == 0xFFFFFFF0)
      int v18 = a2 - v10;
    else {
      int v18 = 1;
    }
    if (((v13
         + ((v11 + 72) & ~(v11 | 7))
         + ((v11 + ((v13 + 7) & 0xFFFFFFF8) + 8) & ~v11)
         + 31) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v19 = ~v10 + a2;
      bzero((void *)a1, v14);
      *(_DWORD *)a1 = v19;
    }
    switch(v6)
    {
      case 1:
        *(unsigned char *)(a1 + v14) = v18;
        return;
      case 2:
        *(_WORD *)(a1 + v14) = v18;
        return;
      case 3:
        goto LABEL_59;
      case 4:
        *(_DWORD *)(a1 + v14) = v18;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      *(unsigned char *)(a1 + v14) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)(a1 + v14) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_59:
      __break(1u);
      JUMPOUT(0x24E9EDFD4);
    case 4:
      *(_DWORD *)(a1 + v14) = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        unint64_t v20 = a1 & 0xFFFFFFFFFFFFFFF8;
        if ((v9 & 0x80000000) != 0)
        {
          unint64_t v22 = (unsigned char *)((((((v20 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v12 + 16) & ~v12);
          if (v9 >= a2)
          {
            uint64_t v26 = a2 + 1;
            long long v27 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
            v27((((((v20 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v12 + 16) & ~v12, v26);
          }
          else
          {
            if (v13 <= 3) {
              int v23 = ~(-1 << (8 * v13));
            }
            else {
              int v23 = -1;
            }
            if (v13)
            {
              int v24 = v23 & (~v9 + a2);
              if (v13 <= 3) {
                int v25 = v13;
              }
              else {
                int v25 = 4;
              }
              bzero(v22, v13);
              switch(v25)
              {
                case 2:
                  *(_WORD *)unint64_t v22 = v24;
                  break;
                case 3:
                  *(_WORD *)unint64_t v22 = v24;
                  void v22[2] = BYTE2(v24);
                  break;
                case 4:
                  *(_DWORD *)unint64_t v22 = v24;
                  break;
                default:
                  *unint64_t v22 = v24;
                  break;
              }
            }
          }
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v21 = a2 ^ 0x80000000;
            *(void *)(v20 + 32) = 0;
          }
          else
          {
            uint64_t v21 = a2 - 1;
          }
          *(void *)(v20 + 24) = v21;
        }
      }
      return;
  }
}

uint64_t sub_24E9EE00C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9EE530()
{
  return sub_24E9E8A0C();
}

uint64_t sub_24E9EE59C()
{
  return sub_24E9EE5E4((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E9EBD60);
}

uint64_t sub_24E9EE5B4()
{
  return sub_24E9EE5E4((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E9EBFEC);
}

uint64_t sub_24E9EE5CC()
{
  return sub_24E9EE5E4((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E9EC1FC);
}

uint64_t sub_24E9EE5E4(uint64_t (*a1)(void, void, void, void, void, void, void, void, void))
{
  return a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t objectdestroy_3Tm()
{
  long long v9 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = type metadata accessor for SidebarView();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  sub_24E9C79E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v2 + *(int *)(v1 + 96);
  uint64_t v4 = *(void *)(v9 - 8);
  uint64_t v5 = *(unsigned int (**)(uint64_t, uint64_t, void))(v4 + 48);
  if (!v5(v3, 1, v9)) {
    (*(void (**)(uint64_t, void))(v4 + 8))(v3, v9);
  }
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t v6 = sub_24EA05E68();
  swift_release();
  uint64_t v7 = v3 + *(int *)(v6 + 40);
  if (!v5(v7, 1, v9)) {
    (*(void (**)(uint64_t, void))(v4 + 8))(v7, v9);
  }
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9EE864@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v10 = v2[9];
  uint64_t v12 = *(void *)(type metadata accessor for SidebarView() - 8);
  return sub_24E9EA3F4(a1, (uint64_t)v2 + ((*(unsigned __int8 *)(v12 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v4, v5, v6, v7, v8, v9, a2, v11, v10);
}

uint64_t sub_24E9EE938()
{
  long long v11 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = type metadata accessor for SidebarView();
  uint64_t v13 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v10 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v2 = v11;
  uint64_t v3 = *(void *)(v11 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = (v13 + 80) & ~v13;
  sub_24E9C79E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v12 + *(int *)(v1 + 96);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v6(v5, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_24EA06CA8();
  swift_getWitnessTable();
  uint64_t v7 = sub_24EA05E68();
  swift_release();
  uint64_t v8 = v5 + *(int *)(v7 + 40);
  if (!v6(v8, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, v2);
  }
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + ((v12 + v10 + v4) & ~v4), v2);
  return swift_deallocObject();
}

uint64_t sub_24E9EEBD0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v9 = *(void *)(type metadata accessor for SidebarView() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  return sub_24E9EB038((uint64_t)v0 + v10, (uint64_t)v0+ ((v10 + *(void *)(v9 + 64) + *(unsigned __int8 *)(*(void *)(v1 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24E9EECEC()
{
  return sub_24E9EB1A0();
}

uint64_t sub_24E9EED24@<X0>(uint64_t *a1@<X8>)
{
  return sub_24E9EB258(*(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1, *(void *)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t sub_24E9EED5C@<X0>(uint64_t *a1@<X8>)
{
  (*(void (**)(void))(*(void *)(v1 + 48) + 80))(*(void *)(v1 + 16));
  if (v3) {
    uint64_t result = sub_24EA064C8();
  }
  else {
    uint64_t result = 0;
  }
  *a1 = result;
  return result;
}

unint64_t sub_24E9EEDB0()
{
  unint64_t result = qword_26991F090;
  if (!qword_26991F090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F088);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F090);
  }
  return result;
}

double SignOutLocalState.signOutAnimationState.getter@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)(v1 + 16);
  char v3 = *(unsigned char *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(double *)(a1 + 16) = result;
  *(unsigned char *)(a1 + 24) = v3;
  return result;
}

double SignOutLocalState.signOutAnimationState.setter(uint64_t a1)
{
  double result = *(double *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(double *)(v1 + 16) = result;
  *(unsigned char *)(v1 + 24) = v3;
  return result;
}

uint64_t (*SignOutLocalState.signOutAnimationState.modify())()
{
  return nullsub_1;
}

double SignOutLocalState.init(signOutAnimationState:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = *(double *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(double *)(a2 + 16) = result;
  *(unsigned char *)(a2 + 24) = v3;
  return result;
}

unint64_t sub_24E9EEE90()
{
  return 0xD000000000000015;
}

uint64_t sub_24E9EEEAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9EF528(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9EEED8(uint64_t a1)
{
  unint64_t v2 = sub_24E9EF0BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9EEF14(uint64_t a1)
{
  unint64_t v2 = sub_24E9EF0BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SignOutLocalState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F098);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)v1;
  uint64_t v7 = *(void *)(v1 + 16);
  char v8 = *(unsigned char *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9EF0BC();
  sub_24EA070A8();
  v10[1] = v10[0];
  uint64_t v11 = v7;
  char v12 = v8;
  sub_24E9B1498();
  sub_24EA06FE8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24E9EF0BC()
{
  unint64_t result = qword_26991F0A0;
  if (!qword_26991F0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0A0);
  }
  return result;
}

uint64_t SignOutLocalState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F0A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9EF0BC();
  sub_24EA07098();
  if (!v2)
  {
    sub_24E9B2060();
    sub_24EA06F68();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = v13;
    char v10 = v14;
    *(_OWORD *)a2 = v12;
    *(void *)(a2 + 16) = v9;
    *(unsigned char *)(a2 + 24) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9EF28C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutLocalState.init(from:)(a1, a2);
}

uint64_t sub_24E9EF2A4(void *a1)
{
  return SignOutLocalState.encode(to:)(a1);
}

uint64_t static SignOutLocalState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(double *)a1 == *(double *)a2;
  if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    BOOL v2 = 0;
  }
  if (*(double *)(a1 + 16) != *(double *)(a2 + 16)) {
    BOOL v2 = 0;
  }
  return v2 & (*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24) ^ 1u);
}

uint64_t sub_24E9EF2FC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(double *)a1 == *(double *)a2;
  if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    BOOL v2 = 0;
  }
  if (*(double *)(a1 + 16) != *(double *)(a2 + 16)) {
    BOOL v2 = 0;
  }
  return v2 & (*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24) ^ 1u);
}

ValueMetadata *type metadata accessor for SignOutLocalState()
{
  return &type metadata for SignOutLocalState;
}

unsigned char *storeEnumTagSinglePayload for SignOutLocalState.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E9EF3E8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SignOutLocalState.CodingKeys()
{
  return &type metadata for SignOutLocalState.CodingKeys;
}

unint64_t sub_24E9EF424()
{
  unint64_t result = qword_26991F0B0;
  if (!qword_26991F0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0B0);
  }
  return result;
}

unint64_t sub_24E9EF47C()
{
  unint64_t result = qword_26991F0B8;
  if (!qword_26991F0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0B8);
  }
  return result;
}

unint64_t sub_24E9EF4D4()
{
  unint64_t result = qword_26991F0C0;
  if (!qword_26991F0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0C0);
  }
  return result;
}

uint64_t sub_24E9EF528(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024EA16890)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t SignOutState.accountState.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9F03A4(v1, a1, (uint64_t (*)(void))type metadata accessor for AccountState);
}

uint64_t SignOutState.accountState.setter(uint64_t a1)
{
  return sub_24E9C6B64(a1, v1);
}

uint64_t (*SignOutState.accountState.modify())()
{
  return nullsub_1;
}

uint64_t SignOutState.isSidebarVisible.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SignOutState() + 20));
}

uint64_t type metadata accessor for SignOutState()
{
  uint64_t result = qword_26991F0E8;
  if (!qword_26991F0E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SignOutState.isSidebarVisible.setter(char a1)
{
  uint64_t result = type metadata accessor for SignOutState();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*SignOutState.isSidebarVisible.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SignOutState.init(accountState:isSidebarVisible:locale:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24E9AA0E4(a1, a4);
  uint64_t v7 = type metadata accessor for SignOutState();
  *(unsigned char *)(a4 + *(int *)(v7 + 20)) = a2;
  uint64_t v8 = a4 + *(int *)(v7 + 24);
  uint64_t v9 = sub_24EA05CD8();
  char v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  return v10(v8, a3, v9);
}

uint64_t SignOutState.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EA05C78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E9F03A4(v1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for AccountState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_24EA07058();
      sub_24EA06968();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24EA07058();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_24EA07058();
    sub_24E9F04B4(&qword_26991DEA8, MEMORY[0x263F06A30]);
    sub_24EA068A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  type metadata accessor for SignOutState();
  sub_24EA07068();
  sub_24EA05CD8();
  sub_24E9F04B4(&qword_26991F0C8, MEMORY[0x263F07690]);
  return sub_24EA068A8();
}

uint64_t static SignOutState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (_s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(a1, a2))
  {
    uint64_t v4 = type metadata accessor for SignOutState();
    if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    {
      JUMPOUT(0x2533452D0);
    }
  }
  return 0;
}

uint64_t sub_24E9EFA78(char a1)
{
  if (!a1) {
    return 0x53746E756F636361;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0x656C61636F6CLL;
}

uint64_t sub_24E9EFAD8()
{
  return sub_24E9EFA78(*v0);
}

uint64_t sub_24E9EFAE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9F11A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9EFB08(uint64_t a1)
{
  unint64_t v2 = sub_24E9F0350();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9EFB44(uint64_t a1)
{
  unint64_t v2 = sub_24E9F0350();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SignOutState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F0D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F0350();
  sub_24EA070A8();
  v8[15] = 0;
  type metadata accessor for AccountState();
  sub_24E9F04B4(&qword_26991E168, (void (*)(uint64_t))type metadata accessor for AccountState);
  sub_24EA06FE8();
  if (!v1)
  {
    type metadata accessor for SignOutState();
    v8[14] = 1;
    sub_24EA06FC8();
    v8[13] = 2;
    sub_24EA05CD8();
    sub_24E9F04B4(&qword_26991DF10, MEMORY[0x263F07690]);
    sub_24EA06FE8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SignOutState.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t SignOutState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v25 = sub_24EA05CD8();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v27);
  int v28 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F0E0);
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SignOutState();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F0350();
  sub_24EA07098();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v12 = v26;
  uint64_t v13 = (uint64_t)v11;
  uint64_t v14 = (uint64_t)a1;
  char v32 = 0;
  sub_24E9F04B4(&qword_26991E1B8, (void (*)(uint64_t))type metadata accessor for AccountState);
  uint64_t v15 = (uint64_t)v28;
  sub_24EA06F68();
  sub_24E9AA0E4(v15, v13);
  char v31 = 1;
  char v16 = sub_24EA06F48();
  int v28 = (char *)v9;
  *(unsigned char *)(v13 + *(int *)(v9 + 20)) = v16 & 1;
  char v30 = 2;
  sub_24E9F04B4(qword_26991DF18, MEMORY[0x263F07690]);
  int v17 = v5;
  uint64_t v18 = v13;
  uint64_t v19 = v25;
  uint64_t v20 = v29;
  sub_24EA06F68();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v18 + *((int *)v28 + 6), v17, v19);
  sub_24E9F03A4(v18, v24, (uint64_t (*)(void))type metadata accessor for SignOutState);
  __swift_destroy_boxed_opaque_existential_1(v14);
  return sub_24E9F040C(v18, (uint64_t (*)(void))type metadata accessor for SignOutState);
}

uint64_t sub_24E9F0224@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SignOutState.init(from:)(a1, a2);
}

uint64_t sub_24E9F023C(void *a1)
{
  return SignOutState.encode(to:)(a1);
}

uint64_t sub_24E9F0254()
{
  return sub_24EA07088();
}

uint64_t sub_24E9F0298()
{
  return sub_24EA07088();
}

uint64_t sub_24E9F02D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(a1, a2) & 1) != 0
    && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20)))
  {
    JUMPOUT(0x2533452D0);
  }
  return 0;
}

unint64_t sub_24E9F0350()
{
  unint64_t result = qword_26991F0D8;
  if (!qword_26991F0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0D8);
  }
  return result;
}

uint64_t sub_24E9F03A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9F040C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E9F046C()
{
  return sub_24E9F04B4(&qword_26991E7A8, (void (*)(uint64_t))type metadata accessor for SignOutState);
}

uint64_t sub_24E9F04B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for SignOutState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for AccountState();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      uint64_t v9 = sub_24EA05C78();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v12 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_24EA05CD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for SignOutState(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AccountState();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v5 = sub_24EA05C78();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_24EA05CD8();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *initializeWithCopy for SignOutState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AccountState();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_24EA05C78();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 24);
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

void *assignWithCopy for SignOutState(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9F040C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for AccountState);
    uint64_t v6 = type metadata accessor for AccountState();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v8 = sub_24EA05C78();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

char *initializeWithTake for SignOutState(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AccountState();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24EA05C78();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *assignWithTake for SignOutState(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E9F040C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for AccountState);
    uint64_t v6 = type metadata accessor for AccountState();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24EA05C78();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignOutState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9F0C50);
}

uint64_t sub_24E9F0C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AccountState();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_24EA05CD8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for SignOutState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9F0D9C);
}

uint64_t sub_24E9F0D9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for AccountState();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  else
  {
    uint64_t v11 = sub_24EA05CD8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_24E9F0EC4()
{
  uint64_t result = type metadata accessor for AccountState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24EA05CD8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SignOutState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9F1060);
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

ValueMetadata *type metadata accessor for SignOutState.CodingKeys()
{
  return &type metadata for SignOutState.CodingKeys;
}

unint64_t sub_24E9F109C()
{
  unint64_t result = qword_26991F0F8;
  if (!qword_26991F0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F0F8);
  }
  return result;
}

unint64_t sub_24E9F10F4()
{
  unint64_t result = qword_26991F100;
  if (!qword_26991F100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F100);
  }
  return result;
}

unint64_t sub_24E9F114C()
{
  unint64_t result = qword_26991F108;
  if (!qword_26991F108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F108);
  }
  return result;
}

uint64_t sub_24E9F11A0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x53746E756F636361 && a2 == 0xEC00000065746174;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EA155E0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24E9F12F0(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0x6570704177656976;
  }
}

uint64_t sub_24E9F1334()
{
  return sub_24E9F12F0(*v0);
}

uint64_t sub_24E9F133C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9F2460(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9F1364(uint64_t a1)
{
  unint64_t v2 = sub_24E9F17E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F13A0(uint64_t a1)
{
  unint64_t v2 = sub_24E9F17E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9F13E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9F2558(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9F140C(uint64_t a1)
{
  unint64_t v2 = sub_24E9F183C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F1448(uint64_t a1)
{
  unint64_t v2 = sub_24E9F183C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9F1484(uint64_t a1)
{
  unint64_t v2 = sub_24E9F1890();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F14C0(uint64_t a1)
{
  unint64_t v2 = sub_24E9F1890();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicContentAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7E8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD7E0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD7D8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F17E8();
  sub_24EA070A8();
  if (v12 == 2)
  {
    char v21 = 0;
    sub_24E9F1890();
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  else
  {
    char v22 = 1;
    sub_24E9F183C();
    uint64_t v14 = v18;
    sub_24EA06F98();
    uint64_t v15 = v20;
    sub_24EA06FC8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

unint64_t sub_24E9F17E8()
{
  unint64_t result = qword_26B1CD270;
  if (!qword_26B1CD270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD270);
  }
  return result;
}

unint64_t sub_24E9F183C()
{
  unint64_t result = qword_26991F110;
  if (!qword_26991F110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F110);
  }
  return result;
}

unint64_t sub_24E9F1890()
{
  unint64_t result = qword_26B1CD288;
  if (!qword_26B1CD288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD288);
  }
  return result;
}

uint64_t DynamicContentAction.init(from:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F118);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F120);
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F128);
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F17E8();
  uint64_t v13 = v30;
  sub_24EA07098();
  if (!v13)
  {
    uint64_t v14 = v29;
    uint64_t v24 = v7;
    char v30 = a1;
    uint64_t v15 = sub_24EA06F78();
    if (*(void *)(v15 + 16) == 1)
    {
      a1 = v30;
      if (*(unsigned char *)(v15 + 32))
      {
        char v32 = 1;
        sub_24E9F183C();
        sub_24EA06F08();
        uint64_t v20 = v25;
        char v21 = sub_24EA06F48();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v20);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
        a1 = v30;
        char v22 = v21 & 1;
      }
      else
      {
        char v31 = 0;
        sub_24E9F1890();
        sub_24EA06F08();
        (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v24);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
        char v22 = 2;
      }
      *uint64_t v27 = v22;
    }
    else
    {
      uint64_t v16 = sub_24EA06DC8();
      swift_allocError();
      uint64_t v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
      *uint64_t v18 = &type metadata for DynamicContentAction;
      sub_24EA06F18();
      sub_24EA06DB8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
      a1 = v30;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9F1D78@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return DynamicContentAction.init(from:)(a1, a2);
}

uint64_t sub_24E9F1D90(void *a1)
{
  return DynamicContentAction.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for DynamicContentAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24E9F1E64);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for DynamicContentAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x24E9F1F4CLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24E9F1F74(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_24E9F1F90(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentAction()
{
  return &type metadata for DynamicContentAction;
}

unsigned char *storeEnumTagSinglePayload for DynamicContentAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9F2084);
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

ValueMetadata *type metadata accessor for DynamicContentAction.CodingKeys()
{
  return &type metadata for DynamicContentAction.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicContentAction.ViewAppearedCodingKeys()
{
  return &type metadata for DynamicContentAction.ViewAppearedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DynamicContentAction.NetworkConditionsUpdatedCodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E9F2168);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicContentAction.NetworkConditionsUpdatedCodingKeys()
{
  return &type metadata for DynamicContentAction.NetworkConditionsUpdatedCodingKeys;
}

unint64_t sub_24E9F21A4()
{
  unint64_t result = qword_26991F130;
  if (!qword_26991F130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F130);
  }
  return result;
}

unint64_t sub_24E9F21FC()
{
  unint64_t result = qword_26991F138;
  if (!qword_26991F138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F138);
  }
  return result;
}

unint64_t sub_24E9F2254()
{
  unint64_t result = qword_26B1CD298;
  if (!qword_26B1CD298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD298);
  }
  return result;
}

unint64_t sub_24E9F22AC()
{
  unint64_t result = qword_26B1CD290;
  if (!qword_26B1CD290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD290);
  }
  return result;
}

unint64_t sub_24E9F2304()
{
  unint64_t result = qword_26B1CD2A8;
  if (!qword_26B1CD2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD2A8);
  }
  return result;
}

unint64_t sub_24E9F235C()
{
  unint64_t result = qword_26B1CD2A0;
  if (!qword_26B1CD2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD2A0);
  }
  return result;
}

unint64_t sub_24E9F23B4()
{
  unint64_t result = qword_26B1CD280;
  if (!qword_26B1CD280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD280);
  }
  return result;
}

unint64_t sub_24E9F240C()
{
  unint64_t result = qword_26B1CD278;
  if (!qword_26B1CD278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1CD278);
  }
  return result;
}

uint64_t sub_24E9F2460(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EA168B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E9F2558(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656E696C66666FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24E9F25E0()
{
  return 0x656E696C66666FLL;
}

ValueMetadata *type metadata accessor for SidebarToolbarLeadItemLabelStyle()
{
  return &type metadata for SidebarToolbarLeadItemLabelStyle;
}

uint64_t sub_24E9F2608()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9F2624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v64 = a1;
  uint64_t v62 = sub_24EA06148();
  uint64_t v61 = *(void *)(v62 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v62);
  uint64_t v60 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v59 = (char *)&v51 - v4;
  *(void *)&long long v55 = sub_24EA06418();
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  char v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_24EA06128();
  uint64_t v7 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  unsigned int v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F148);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F150);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F158) - 8;
  MEMORY[0x270FA5388](v56);
  uint64_t v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F160) - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v52 = (uint64_t)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F168) - 8;
  uint64_t v21 = MEMORY[0x270FA5388](v58);
  uint64_t v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v57 = (uint64_t)&v51 - v24;
  sub_24EA06138();
  sub_24EA06618();
  sub_24EA05F08();
  uint64_t v25 = v51;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v51);
  uint64_t v26 = &v13[*(int *)(v11 + 44)];
  long long v27 = v69;
  *(_OWORD *)uint64_t v26 = v68;
  *((_OWORD *)v26 + 1) = v27;
  *((_OWORD *)v26 + 2) = v70;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  LOBYTE(v25) = sub_24EA06278();
  sub_24E9C8E28((uint64_t)v13, (uint64_t)v17, &qword_26991F148);
  v17[*(int *)(v15 + 44)] = v25;
  sub_24E9C92D0((uint64_t)v13, &qword_26991F148);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F170);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_24EA0C950;
  uint64_t v29 = *MEMORY[0x263F1B388];
  char v30 = *(void (**)(char *, uint64_t, uint64_t))(v53 + 104);
  uint64_t v31 = v55;
  v30(v6, v29, v55);
  *(void *)(v28 + 32) = MEMORY[0x253345A80](v6, 0.517647059, 0.537254902, 0.576470588, 1.0);
  v30(v6, v29, v31);
  *(void *)(v28 + 40) = MEMORY[0x253345A80](v6, 0.647058824, 0.670588235, 0.721568627, 1.0);
  uint64_t v71 = v28;
  sub_24EA069E8();
  uint64_t v32 = v71;
  sub_24EA06688();
  sub_24EA06678();
  MEMORY[0x253345C10](v32);
  sub_24EA05F28();
  uint64_t v33 = v71;
  long long v55 = v72;
  uint64_t v34 = v73;
  uint64_t v35 = v74;
  sub_24E9C8E28((uint64_t)v17, (uint64_t)v19, &qword_26991F150);
  size_t v36 = &v19[*(int *)(v56 + 44)];
  *(void *)size_t v36 = v33;
  *(_OWORD *)(v36 + 8) = v55;
  *((void *)v36 + 3) = v34;
  *((void *)v36 + 4) = v35;
  sub_24E9C92D0((uint64_t)v17, &qword_26991F150);
  uint64_t v37 = v52;
  sub_24E9C8E28((uint64_t)v19, v52, &qword_26991F158);
  *(_WORD *)(v37 + *(int *)(v54 + 44)) = 256;
  sub_24E9C92D0((uint64_t)v19, &qword_26991F158);
  uint64_t KeyPath = swift_getKeyPath();
  char v65 = 0;
  sub_24EA06508();
  LOBYTE(v29) = v66;
  uint64_t v39 = v67;
  sub_24E9C8E28(v37, (uint64_t)v23, &qword_26991F160);
  unint64_t v40 = &v23[*(int *)(v58 + 44)];
  *(void *)unint64_t v40 = KeyPath;
  v40[8] = 0;
  v40[16] = v29;
  *((void *)v40 + 3) = v39;
  sub_24E9C92D0(v37, &qword_26991F160);
  uint64_t v41 = v57;
  sub_24E9F2E2C((uint64_t)v23, v57);
  uint64_t v42 = v59;
  sub_24EA06158();
  sub_24E9C8E28(v41, (uint64_t)v23, &qword_26991F168);
  uint64_t v43 = v61;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  uint64_t v45 = v60;
  uint64_t v46 = v62;
  v44(v60, v42, v62);
  uint64_t v47 = v63;
  sub_24E9C8E28((uint64_t)v23, v63, &qword_26991F168);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F178);
  v44((char *)(v47 + *(int *)(v48 + 48)), v45, v46);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v43 + 8);
  v49(v42, v46);
  sub_24E9C92D0(v41, &qword_26991F168);
  v49(v45, v46);
  return sub_24E9C92D0((uint64_t)v23, &qword_26991F168);
}

uint64_t sub_24E9F2DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_24EA05FE8();
  *(void *)(a2 + 8) = 0x4028000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F140);
  return sub_24E9F2624(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_24E9F2DFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EA05FB8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24E9F2E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E9F2E98()
{
  unint64_t result = qword_26991F180;
  if (!qword_26991F180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F180);
  }
  return result;
}

uint64_t sub_24E9F2EF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F39578];
  uint64_t v3 = sub_24EA06768();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_24E9F2F6C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    sub_24EA07058();
  }
  return sub_24EA07058();
}

BOOL sub_24E9F2FAC(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if ((a2 & 1) == 0)
  {
    if ((a4 & 1) == 0) {
      return a1 == a3;
    }
    return 0;
  }
  return (a4 & 1) != 0;
}

uint64_t sub_24E9F2FD4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_24EA07058();
  }
  sub_24EA07058();
  return sub_24EA07088();
}

uint64_t sub_24E9F3038()
{
  return sub_24E9F2FD4(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_24E9F304C(uint64_t a1)
{
  return sub_24E9F2F6C(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

uint64_t sub_24E9F3060()
{
  sub_24EA07048();
  sub_24E9F2F6C((uint64_t)v2, *(void *)v0, *(unsigned char *)(v0 + 8));
  return sub_24EA07088();
}

BOOL sub_24E9F30AC(uint64_t a1, uint64_t a2)
{
  return sub_24E9F2FAC(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

__n128 TabBarFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t TabBarFeature.reduce(localState:sharedState:sideEffects:action:)(void (*a1)(char *, char *, uint64_t), char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = v5;
  uint64_t v107 = a4;
  uint64_t v101 = a3;
  uint64_t v104 = a2;
  uint64_t v91 = a1;
  uint64_t v7 = *(void *)(a5 + 16);
  uint64_t v8 = *(void *)(a5 + 24);
  uint64_t v92 = (char *)a5;
  uint64_t v9 = type metadata accessor for TabBarAction();
  uint64_t v97 = sub_24EA066D8();
  uint64_t v95 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v96 = (char *)&v88 - v10;
  uint64_t v106 = v8;
  uint64_t v11 = type metadata accessor for TabBarItemDescriptor();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v88 - v13;
  uint64_t v105 = v7;
  uint64_t v103 = *(void *)(v7 - 8);
  uint64_t v15 = *(void *)(v103 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v94 = (char *)&v88 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v93 = (char *)&v88 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v102 = (char *)&v88 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v88 - v25;
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v24);
  char v30 = (uint64_t *)((char *)&v88 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (uint64_t *)((char *)&v88 - v31);
  uint64_t v33 = *v6;
  uint64_t v100 = v6[1];
  uint64_t v34 = v6[2];
  uint64_t v35 = v6[3];
  uint64_t v98 = v33;
  uint64_t v99 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))((char *)&v88 - v31, v107, v9);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v107 = v35;
      uint64_t v80 = v103;
      uint64_t v81 = v105;
      uint64_t v82 = (*(uint64_t (**)(char *, uint64_t *, uint64_t))(v103 + 32))(v17, v32, v105);
      uint64_t v102 = (char *)&v88;
      *(void *)&long long v112 = *(void *)v104;
      MEMORY[0x270FA5388](v82);
      uint64_t v83 = v106;
      *(&v88 - 4) = v81;
      *(&v88 - 3) = v83;
      *(&v88 - 2) = (uint64_t)v17;
      sub_24EA06A58();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_24EA06BB8();
      swift_bridgeObjectRelease();
      if ((BYTE8(v108) & 1) == 0)
      {
        uint64_t v84 = v108;
        *(void *)&long long v108 = v98;
        *((void *)&v108 + 1) = v100;
        uint64_t v109 = v99;
        uint64_t v110 = v107;
        *char v30 = v84;
        swift_storeEnumTagMultiPayload();
        TabBarFeature.reduce(localState:sharedState:sideEffects:action:)(v91, v104, v101, v30, v92);
        (*(void (**)(void *, uint64_t))(v27 + 8))(v30, v9);
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v17, v81);
      break;
    case 2u:
      uint64_t v85 = *v32;
      uint64_t v86 = v104;
      *(void *)&long long v112 = *(void *)v104;
      sub_24EA06A58();
      swift_getWitnessTable();
      sub_24EA06B58();
      long long v112 = v108;
      uint64_t v111 = v85;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD750);
      uint64_t result = sub_24EA06BF8();
      if (result)
      {
        uint64_t result = type metadata accessor for TabBarState();
        uint64_t v87 = *(int *)(result + 40);
        if (*(void *)&v86[v87] == v85) {
          v86[*(int *)(result + 44)] = 1;
        }
        else {
          *(void *)&v86[v87] = v85;
        }
      }
      break;
    case 3u:
      uint64_t result = type metadata accessor for TabBarState();
      v104[*(int *)(result + 44)] = 0;
      break;
    case 4u:
      char v65 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
      char v66 = v96;
      uint64_t v67 = &v96[v65[16]];
      long long v68 = &v96[v65[20]];
      long long v69 = &v96[v65[24]];
      *(void *)&long long v108 = 0;
      BYTE8(v108) = 1;
      uint64_t v70 = v105;
      uint64_t v71 = v106;
      type metadata accessor for TabBarFeature.TaskIdentifier();
      uint64_t v72 = v35;
      swift_getWitnessTable();
      sub_24EA06EF8();
      uint64_t v73 = *MEMORY[0x263F39580];
      uint64_t v74 = sub_24EA06778();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v74 - 8) + 104))(v67, v73, v74);
      uint64_t v75 = (void *)swift_allocObject();
      v75[2] = v70;
      v75[3] = v71;
      uint64_t v76 = v99;
      uint64_t v77 = v100;
      v75[4] = v98;
      v75[5] = v77;
      v75[6] = v76;
      v75[7] = v72;
      *(void *)long long v69 = &unk_26991F198;
      *((void *)v69 + 1) = v75;
      swift_retain();
      swift_retain();
      sub_24EA06AD8();
      uint64_t v78 = *MEMORY[0x263F39578];
      uint64_t v79 = sub_24EA06768();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 104))(v68, v78, v79);
      (*(void (**)(char *, void, uint64_t))(v95 + 104))(v66, *MEMORY[0x263F39530], v97);
      sub_24EA06A58();
      uint64_t result = sub_24EA06A48();
      break;
    default:
      uint64_t v107 = v35;
      uint64_t v36 = *v32;
      sub_24EA06A88();
      uint64_t v37 = &v14[*(int *)(v11 + 36)];
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v103 + 32);
      uint64_t v90 = v26;
      uint64_t v39 = v26;
      uint64_t v40 = v105;
      v38(v39, v37, v105);
      uint64_t v91 = v38;
      uint64_t v41 = v106;
      type metadata accessor for TabBarState();
      sub_24EA06A88();
      v38(v102, &v14[*(int *)(v11 + 36)], v40);
      uint64_t v42 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
      uint64_t v43 = v96;
      uint64_t v92 = &v96[v42[12]];
      uint64_t v44 = &v96[v42[16]];
      uint64_t v104 = &v96[v42[20]];
      uint64_t v89 = &v96[v42[24]];
      *(void *)&long long v108 = v36;
      BYTE8(v108) = 0;
      type metadata accessor for TabBarFeature.TaskIdentifier();
      swift_getWitnessTable();
      sub_24EA06EF8();
      uint64_t v45 = *MEMORY[0x263F39580];
      uint64_t v46 = sub_24EA06778();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v44, v45, v46);
      uint64_t v47 = v103;
      uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
      uint64_t v49 = v93;
      v48(v93, v90, v40);
      uint64_t v50 = v94;
      v48(v94, v102, v40);
      uint64_t v51 = *(unsigned __int8 *)(v47 + 80);
      uint64_t v52 = (v51 + 64) & ~v51;
      uint64_t v53 = (v15 + v51 + v52) & ~v51;
      uint64_t v54 = (char *)swift_allocObject();
      *((void *)v54 + 2) = v40;
      *((void *)v54 + 3) = v41;
      uint64_t v55 = v100;
      *((void *)v54 + 4) = v98;
      *((void *)v54 + 5) = v55;
      uint64_t v56 = &v54[v52];
      uint64_t v57 = v107;
      *((void *)v54 + 6) = v99;
      *((void *)v54 + 7) = v57;
      uint64_t v58 = v49;
      uint64_t v59 = v91;
      v91(v56, v58, v40);
      v59(&v54[v53], v50, v40);
      uint64_t v60 = v89;
      *(void *)uint64_t v89 = &unk_26991F1A8;
      *((void *)v60 + 1) = v54;
      swift_retain();
      swift_retain();
      sub_24EA06AD8();
      uint64_t v61 = *MEMORY[0x263F39578];
      uint64_t v62 = sub_24EA06768();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v62 - 8) + 104))(v104, v61, v62);
      (*(void (**)(char *, void, uint64_t))(v95 + 104))(v43, *MEMORY[0x263F39530], v97);
      sub_24EA06A58();
      sub_24EA06A48();
      uint64_t v63 = *(void (**)(char *, uint64_t))(v103 + 8);
      v63(v102, v40);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v63)(v90, v40);
      break;
  }
  return result;
}

uint64_t type metadata accessor for TabBarFeature.TaskIdentifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9F3B94(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = sub_24EA06AC8();
  v7[3] = sub_24EA06AB8();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v11 = (void *)swift_task_alloc();
  v7[4] = v11;
  void *v11 = v7;
  v11[1] = sub_24E9C68A4;
  return v13(a6, a7);
}

uint64_t sub_24E9F3CA4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = sub_24EA06AC8();
  v4[3] = sub_24EA06AB8();
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  void *v6 = v4;
  v6[1] = sub_24E9F3D98;
  return v8();
}

uint64_t sub_24E9F3D98()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24EA06A98();
  return MEMORY[0x270FA2498](sub_24E9F43D4, v1, v0);
}

uint64_t sub_24E9F3ED4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9F3F14(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  char v6 = (int *)v1[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24E9C3BA4;
  return sub_24E9F3CA4(a1, v4, v5, v6);
}

uint64_t sub_24E9F3FE4()
{
  return sub_24EA068D8() & 1;
}

uint64_t sub_24E9F4058()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = (*(void *)(v2 + 64) + v3 + v4) & ~v3;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v4;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v6, v1);
  v7(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_24E9F414C(uint64_t a1)
{
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80);
  uint64_t v5 = (v4 + 64) & ~v4;
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(*(void *)(v1[2] - 8) + 64) + v4 + v5) & ~v4);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24E9C2588;
  return sub_24E9F3B94(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t TabBarFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24E9F429C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return nullsub_1(a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t sub_24E9F42AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F42C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F42E4()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for TabBarFeature()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_24E9F432C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E9F434C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_24E9F437C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E9F4398(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

uint64_t sub_24E9F43B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F43D8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1B0);
  unint64_t v5 = sub_24E9F5D90();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, v5);
}

uint64_t DynamicContentContainerView.init(store:contentViewBuilder:offlineContentViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, void (*a4)(uint64_t)@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  *(void *)a5 = sub_24E9F4578;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  type metadata accessor for DynamicContentContainerView();
  uint64_t v10 = swift_retain();
  uint64_t v11 = a3(v10);
  a4(v11);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24E9F4540()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9F4578()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for DynamicContentContainerView()
{
  return swift_getGenericMetadata();
}

uint64_t DynamicContentContainerView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v36 = *(void *)(v4 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v5 + 24);
  uint64_t v32 = *(void *)(v5 + 16);
  uint64_t v9 = v32;
  uint64_t v10 = v8;
  uint64_t v31 = v8;
  sub_24EA06098();
  uint64_t v35 = sub_24EA06498();
  uint64_t v38 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v33 = (char *)&v31 - v11;
  uint64_t v12 = sub_24EA05F68();
  uint64_t v39 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v34 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v37 = (char *)&v31 - v15;
  uint64_t v41 = v9;
  uint64_t v42 = v10;
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v43 = v17;
  uint64_t v44 = v16;
  uint64_t v45 = v2;
  uint64_t v49 = v17;
  uint64_t v50 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24EA06488();
  uint64_t v19 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v2, a1);
  unint64_t v20 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = v31;
  *((void *)v21 + 2) = v32;
  *((void *)v21 + 3) = v22;
  *((void *)v21 + 4) = v17;
  *((void *)v21 + 5) = v16;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v21[v20], v19, a1);
  uint64_t v48 = WitnessTable;
  uint64_t v23 = v35;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = v33;
  uint64_t v26 = v34;
  sub_24EA063E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v23);
  uint64_t v46 = v24;
  uint64_t v47 = MEMORY[0x263F1A240];
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = v37;
  sub_24E9C74A8(v26, v12, v27);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v39 + 8);
  v29(v26, v12);
  sub_24E9C74A8(v28, v12, v27);
  return ((uint64_t (*)(char *, uint64_t))v29)(v28, v12);
}

uint64_t sub_24E9F49AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v42 = a6;
  uint64_t v38 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v37 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v35 = (char *)&v35 - v14;
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v35 - v19;
  uint64_t v21 = sub_24EA06098();
  uint64_t v39 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v35 - v22;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v47 = a4;
  uint64_t v48 = a5;
  uint64_t v24 = type metadata accessor for DynamicContentContainerView();
  uint64_t v25 = a1;
  sub_24E9F43D8();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  if (v45 == 1)
  {
    uint64_t v26 = a1 + *(int *)(v24 + 56);
    uint64_t v27 = v35;
    uint64_t v28 = v41;
    sub_24E9C74A8(v26, a3, v41);
    uint64_t v29 = (uint64_t)v37;
    sub_24E9C74A8(v27, a3, v28);
    uint64_t v30 = v40;
    sub_24E9D8CA0(v29, a2, a3);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v31(v29, a3);
    v31((uint64_t)v27, a3);
  }
  else
  {
    uint64_t v30 = v40;
    sub_24E9C74A8(v25 + *(int *)(v24 + 52), a2, v40);
    sub_24E9C74A8(v20, a2, v30);
    uint64_t v28 = v41;
    sub_24E9D6C7C((uint64_t)v18, a2);
    uint64_t v32 = *(void (**)(char *, uint64_t))(v36 + 8);
    v32(v18, a2);
    v32(v20, a2);
  }
  uint64_t v43 = v30;
  uint64_t v44 = v28;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9C74A8(v23, v21, WitnessTable);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v23, v21);
}

uint64_t sub_24E9F4D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9F49AC(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_24E9F4D6C()
{
  return swift_release();
}

uint64_t sub_24E9F4DC8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v5 = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (int *)(type metadata accessor for DynamicContentContainerView() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  sub_24E9C79E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v3 + v2[15], v1);
  (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(v3 + v2[16]);
  return swift_deallocObject();
}

uint64_t sub_24E9F4F08()
{
  type metadata accessor for DynamicContentContainerView();
  return sub_24E9F4D6C();
}

uint64_t sub_24E9F4FAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9F4FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_24E9F4FFC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24E9F50D8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v9 + v11;
  if ((v11 | v8) > 7
    || ((*(_DWORD *)(v10 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v9 + v11 + ((v8 + 17) & ~v8)) & ~v11) + *(void *)(*(void *)(v5 - 8) + 64) > 0x18)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    a1 = v15 + (((v11 | v8) & 0xF8 ^ 0x1F8) & ((v11 | v8) + 16));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v8;
    uint64_t v22 = ~v11;
    uint64_t v23 = v5;
    uint64_t v17 = *a2;
    uint64_t v18 = a2[1];
    char v19 = *((unsigned char *)a2 + 16);
    uint64_t v21 = v6;
    sub_24E9C7B00();
    *(void *)a1 = v17;
    *(void *)(a1 + 8) = v18;
    *(unsigned char *)(a1 + 16) = v19;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))((a1 + v8 + 17) & v16, ((unint64_t)a2 + v8 + 17) & v16, v21);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((((a1 + v8 + 17) & v16) + v12) & v22, ((((unint64_t)a2 + v8 + 17) & v16) + v12) & v22, v23);
  }
  return a1;
}

uint64_t sub_24E9F52A4(uint64_t a1, uint64_t a2)
{
  sub_24E9C79E0();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  uint64_t v7 = *(void *)(*(void *)(a2 + 24) - 8);
  unint64_t v8 = *(uint64_t (**)(unint64_t))(v7 + 8);
  unint64_t v9 = (v6 + *(void *)(v5 + 56) + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return v8(v9);
}

uint64_t sub_24E9F536C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 17 + a1) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 17) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v12, v13);
  uint64_t v14 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v14 + 16))((*(void *)(v10 + 48) + *(unsigned __int8 *)(v14 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), (*(void *)(v10 + 48) + *(unsigned __int8 *)(v14 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  return a1;
}

uint64_t sub_24E9F545C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_24E9C79E0();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 17 + a1) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 17) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  uint64_t v14 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v14 + 24))((*(void *)(v10 + 40) + *(unsigned __int8 *)(v14 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), (*(void *)(v10 + 40) + *(unsigned __int8 *)(v14 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  return a1;
}

uint64_t sub_24E9F5558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 + 17 + a1) & ~v7;
  uint64_t v9 = (v7 + 17 + a2) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 32))((*(void *)(v6 + 32) + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (*(void *)(v6 + 32) + *(unsigned __int8 *)(v10 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

uint64_t sub_24E9F5634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 17 + a1) & ~v9;
  uint64_t v11 = (v9 + 17 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))((*(void *)(v8 + 24) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_24E9F5724(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(v4 + 64);
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  if (v5 <= v8) {
    unsigned int v12 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v4 + 84);
  }
  if (v12 <= 0xFE) {
    unsigned int v13 = 254;
  }
  else {
    unsigned int v13 = v12;
  }
  if (!a2) {
    return 0;
  }
  int v14 = a2 - v13;
  if (a2 <= v13) {
    goto LABEL_28;
  }
  uint64_t v15 = ((v10 + v11 + ((v9 + 17) & ~v9)) & ~v11) + *(void *)(*(void *)(v6 - 8) + 64);
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((v14 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_28:
      if (v12 > 0xFE)
      {
        uint64_t v24 = ((unint64_t)a1 + v9 + 17) & ~v9;
        if (v5 == v13) {
          return (*(uint64_t (**)(uint64_t))(v4 + 48))(v24);
        }
        else {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))((v24 + v10 + v11) & ~v11, v8, v6);
        }
      }
      else
      {
        unsigned int v23 = *((unsigned __int8 *)a1 + 16);
        if (v23 > 1) {
          return (v23 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_28;
  }
LABEL_18:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = v15;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v13 + (v22 | v20) + 1;
}

void sub_24E9F5964(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v13 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v6 + 84);
  }
  if (v13 <= 0xFE) {
    unsigned int v14 = 254;
  }
  else {
    unsigned int v14 = v13;
  }
  size_t v15 = ((v11 + v12 + ((v10 + 17) & ~v10)) & ~v12) + *(void *)(*(void *)(v8 - 8) + 64);
  BOOL v16 = a3 >= v14;
  unsigned int v17 = a3 - v14;
  if (v17 != 0 && v16)
  {
    if (v15 <= 3)
    {
      unsigned int v21 = ((v17 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
      if (HIWORD(v21))
      {
        int v18 = 4;
      }
      else if (v21 >= 0x100)
      {
        int v18 = 2;
      }
      else
      {
        int v18 = v21 > 1;
      }
    }
    else
    {
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 0;
  }
  if (v14 < a2)
  {
    unsigned int v19 = ~v14 + a2;
    if (v15 < 4)
    {
      int v20 = (v19 >> (8 * v15)) + 1;
      if (v15)
      {
        int v22 = v19 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v15] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v20;
        return;
      case 3:
        goto LABEL_48;
      case 4:
        *(_DWORD *)&a1[v15] = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x24E9F5C88);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v13 > 0xFE)
        {
          unint64_t v23 = (unint64_t)&a1[v10 + 17] & ~v10;
          if (v7 == v14)
          {
            uint64_t v24 = *(void (**)(unint64_t))(v6 + 56);
            v24(v23);
          }
          else
          {
            unint64_t v25 = (v23 + v11 + v12) & ~v12;
            uint64_t v26 = *(void (**)(unint64_t))(v9 + 56);
            v26(v25);
          }
        }
        else if (a2 > 0xFE)
        {
          a1[16] = 0;
          *(void *)a1 = a2 - 255;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          a1[16] = -(char)a2;
        }
      }
      return;
  }
}

uint64_t sub_24E9F5CB0()
{
  return swift_getWitnessTable();
}

unint64_t sub_24E9F5D90()
{
  unint64_t result = qword_26991F1B8;
  if (!qword_26991F1B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F1B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F1B8);
  }
  return result;
}

BOOL static TabBarStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24E9F5E04(char a1)
{
  if (a1) {
    return 0x647261646E617473;
  }
  else {
    return 0x676E6974616F6C66;
  }
}

uint64_t sub_24E9F5E34()
{
  return sub_24E9F5E04(*v0);
}

uint64_t sub_24E9F5E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9F6C64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9F5E64(uint64_t a1)
{
  unint64_t v2 = sub_24E9F6270();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F5EA0(uint64_t a1)
{
  unint64_t v2 = sub_24E9F6270();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9F5EDC(uint64_t a1)
{
  unint64_t v2 = sub_24E9F6318();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F5F18(uint64_t a1)
{
  unint64_t v2 = sub_24E9F6318();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E9F5F54(uint64_t a1)
{
  unint64_t v2 = sub_24E9F62C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F5F90(uint64_t a1)
{
  unint64_t v2 = sub_24E9F62C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabBarStyle.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1C0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  int v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1C8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1D0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F6270();
  sub_24EA070A8();
  unsigned int v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24E9F62C4();
    unsigned int v14 = v18;
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24E9F6318();
    sub_24EA06F98();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24E9F6270()
{
  unint64_t result = qword_26991F1D8;
  if (!qword_26991F1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F1D8);
  }
  return result;
}

unint64_t sub_24E9F62C4()
{
  unint64_t result = qword_26991F1E0;
  if (!qword_26991F1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F1E0);
  }
  return result;
}

unint64_t sub_24E9F6318()
{
  unint64_t result = qword_26991F1E8;
  if (!qword_26991F1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F1E8);
  }
  return result;
}

uint64_t TabBarStyle.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1F0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F1F8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F200);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F6270();
  uint64_t v11 = v32;
  sub_24EA07098();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  unsigned int v14 = v10;
  uint64_t v15 = sub_24EA06F78();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24EA06DC8();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *char v22 = &type metadata for TabBarStyle;
    sub_24EA06F18();
    sub_24EA06DB8();
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
    sub_24E9F62C4();
    int v18 = v14;
    sub_24EA06F08();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24E9F6318();
    sub_24EA06F08();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24E9F67C4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TabBarStyle.init(from:)(a1, a2);
}

uint64_t sub_24E9F67DC(void *a1)
{
  return TabBarStyle.encode(to:)(a1);
}

uint64_t TabBarStyle.hash(into:)()
{
  return sub_24EA07058();
}

uint64_t TabBarStyle.hashValue.getter()
{
  return sub_24EA07088();
}

unint64_t sub_24E9F686C()
{
  unint64_t result = qword_26991F208;
  if (!qword_26991F208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F208);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabBarStyle()
{
  return &type metadata for TabBarStyle;
}

unsigned char *_s14FitnessAppRoot11TabBarStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9F69A4);
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

ValueMetadata *type metadata accessor for TabBarStyle.CodingKeys()
{
  return &type metadata for TabBarStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for TabBarStyle.FloatingCodingKeys()
{
  return &type metadata for TabBarStyle.FloatingCodingKeys;
}

ValueMetadata *type metadata accessor for TabBarStyle.StandardCodingKeys()
{
  return &type metadata for TabBarStyle.StandardCodingKeys;
}

unint64_t sub_24E9F6A00()
{
  unint64_t result = qword_26991F210;
  if (!qword_26991F210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F210);
  }
  return result;
}

unint64_t sub_24E9F6A58()
{
  unint64_t result = qword_26991F218;
  if (!qword_26991F218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F218);
  }
  return result;
}

unint64_t sub_24E9F6AB0()
{
  unint64_t result = qword_26991F220;
  if (!qword_26991F220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F220);
  }
  return result;
}

unint64_t sub_24E9F6B08()
{
  unint64_t result = qword_26991F228;
  if (!qword_26991F228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F228);
  }
  return result;
}

unint64_t sub_24E9F6B60()
{
  unint64_t result = qword_26991F230;
  if (!qword_26991F230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F230);
  }
  return result;
}

unint64_t sub_24E9F6BB8()
{
  unint64_t result = qword_26991F238;
  if (!qword_26991F238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F238);
  }
  return result;
}

unint64_t sub_24E9F6C10()
{
  unint64_t result = qword_26991F240;
  if (!qword_26991F240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26991F240);
  }
  return result;
}

uint64_t sub_24E9F6C64(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x676E6974616F6C66 && a2 == 0xE800000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647261646E617473 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t SignOutEnvironment.init(fetchAccountState:makeAccountChangedStream:makeRemoteBrowsingIdentityUpdatedStream:signOut:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

ValueMetadata *type metadata accessor for SignOutEnvironment()
{
  return &type metadata for SignOutEnvironment;
}

uint64_t sub_24E9F6D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return sub_24EA07058();
  }
  sub_24EA07058();
  return sub_24EA06968();
}

uint64_t sub_24E9F6DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return a4 == 0;
  }
  if (!a4) {
    return 0;
  }
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  return sub_24EA07028();
}

uint64_t sub_24E9F6E24(uint64_t a1, uint64_t a2)
{
  sub_24EA07048();
  sub_24E9F6D78((uint64_t)v5, a1, a2);
  return sub_24EA07088();
}

uint64_t sub_24E9F6E8C()
{
  return sub_24E9F6E24(*v0, v0[1]);
}

uint64_t sub_24E9F6E9C(uint64_t a1)
{
  return sub_24E9F6D78(a1, *v1, v1[1]);
}

uint64_t sub_24E9F6EAC()
{
  sub_24EA07048();
  sub_24E9F6D78((uint64_t)v2, *v0, v0[1]);
  return sub_24EA07088();
}

uint64_t sub_24E9F6EF4(uint64_t *a1, uint64_t *a2)
{
  return sub_24E9F6DE8(*a1, a1[1], *a2, a2[1]);
}

__n128 SidebarModalitiesFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SidebarModalitiesFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v63 = a3;
  uint64_t v55 = (char *)a2;
  uint64_t v7 = *(void *)(a5 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v56 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v50 - v11;
  uint64_t v14 = *(void *)(v13 + 24);
  uint64_t v15 = type metadata accessor for SidebarModalitiesAction();
  uint64_t v16 = sub_24EA066D8();
  uint64_t v61 = *(void *)(v16 - 8);
  uint64_t v62 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v50 - v18;
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v50 - v20;
  uint64_t v22 = v5[1];
  uint64_t v23 = v5[2];
  uint64_t v57 = *v5;
  uint64_t v58 = v23;
  uint64_t v24 = v5[3];
  uint64_t v59 = v22;
  uint64_t v60 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v21, a4, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v21, 1, v7) == 1)
  {
    uint64_t v26 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
    uint64_t v27 = &v19[v26[16]];
    uint64_t v28 = (uint64_t)&v19[v26[20]];
    uint64_t v29 = &v19[v26[24]];
    type metadata accessor for SidebarModalitiesFeature.TaskIdentifier();
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    swift_getWitnessTable();
    sub_24EA06EF8();
    uint64_t v30 = *MEMORY[0x263F39580];
    uint64_t v31 = sub_24EA06778();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v27, v30, v31);
    uint64_t v32 = (void *)swift_allocObject();
    v32[2] = v7;
    v32[3] = v14;
    uint64_t v33 = v58;
    uint64_t v34 = v59;
    uint64_t v35 = v60;
    v32[4] = v57;
    v32[5] = v34;
    v32[6] = v33;
    v32[7] = v35;
    *(void *)uint64_t v29 = &unk_26991F260;
    *((void *)v29 + 1) = v32;
    swift_retain();
    swift_retain();
    sub_24E9F2EF4();
    sub_24E9F2EF8(v28);
    (*(void (**)(char *, void, uint64_t))(v61 + 104))(v19, *MEMORY[0x263F39530], v62);
    sub_24EA06A58();
    return sub_24EA06A48();
  }
  else
  {
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v53 = v8 + 32;
    uint64_t v54 = v37;
    v37(v12, v21, v7);
    v55[*(int *)(type metadata accessor for SidebarModalitiesState() + 44)] = 0;
    uint64_t v38 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1CD7B0);
    uint64_t v52 = &v19[v38[12]];
    uint64_t v39 = &v19[v38[16]];
    uint64_t v55 = &v19[v38[20]];
    uint64_t v40 = &v19[v38[24]];
    uint64_t v50 = v12;
    uint64_t v51 = v40;
    uint64_t v64 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 56))(v7, v14);
    uint64_t v65 = v41;
    type metadata accessor for SidebarModalitiesFeature.TaskIdentifier();
    swift_getWitnessTable();
    sub_24EA06EF8();
    swift_bridgeObjectRelease();
    uint64_t v42 = *MEMORY[0x263F39580];
    uint64_t v43 = sub_24EA06778();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v39, v42, v43);
    uint64_t v44 = v56;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v56, v12, v7);
    unint64_t v45 = (*(unsigned __int8 *)(v8 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v46 = (char *)swift_allocObject();
    *((void *)v46 + 2) = v7;
    *((void *)v46 + 3) = v14;
    uint64_t v48 = v59;
    uint64_t v47 = v60;
    *((void *)v46 + 4) = v57;
    *((void *)v46 + 5) = v48;
    *((void *)v46 + 6) = v58;
    *((void *)v46 + 7) = v47;
    v54(&v46[v45], v44, v7);
    uint64_t v49 = v51;
    *(void *)uint64_t v51 = &unk_26991F250;
    *((void *)v49 + 1) = v46;
    swift_retain();
    swift_retain();
    sub_24E9F2EF4();
    sub_24E9F2EF8((uint64_t)v55);
    (*(void (**)(char *, void, uint64_t))(v61 + 104))(v19, *MEMORY[0x263F39530], v62);
    sub_24EA06A58();
    sub_24EA06A48();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v50, v7);
  }
}

uint64_t type metadata accessor for SidebarModalitiesFeature.TaskIdentifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9F751C(uint64_t a1, int *a2)
{
  v2[2] = sub_24EA06AC8();
  v2[3] = sub_24EA06AB8();
  char v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_24E9F3D98;
  return v6();
}

uint64_t sub_24E9F7610(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = sub_24EA06AC8();
  v6[3] = sub_24EA06AB8();
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v9 = (void *)swift_task_alloc();
  v6[4] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_24E9C68A4;
  return v11(a6);
}

uint64_t sub_24E9F7710()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24E9F77DC(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  char v6 = (int *)v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24E9C2588;
  return sub_24E9F7610(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24E9F78E8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9F7928(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E9C3BA4;
  return sub_24E9F751C(a1, v4);
}

uint64_t SidebarModalitiesFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24E9F7A08()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F7A24()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F7A40()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for SidebarModalitiesFeature()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_24E9F7A74(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24E9F7AA4()
{
  return swift_bridgeObjectRelease();
}

void *sub_24E9F7AAC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_24E9F7AF0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24E9F7B24(uint64_t a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_24E9F7B74(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
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

uint64_t sub_24E9F7BC8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24E9F7BE0(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

uint64_t sub_24E9F7C00()
{
  return swift_getWitnessTable();
}

uint64_t TabBarState.descriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TabBarState.upNextCount.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t TabBarState.selectedIndex.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

uint64_t TabBarState.selectedIndex.setter(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + *(int *)(a2 + 40)) = result;
  return result;
}

uint64_t (*TabBarState.selectedIndex.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t TabBarState.shouldScrollToOrigin.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 44));
}

uint64_t TabBarState.shouldScrollToOrigin.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 44)) = result;
  return result;
}

uint64_t (*TabBarState.shouldScrollToOrigin.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t TabBarState.init(descriptors:selectedIndex:locale:upNextCount:shouldScrollToOrigin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  *a6 = a1;
  uint64_t v11 = (int *)type metadata accessor for TabBarState();
  *(void *)((char *)a6 + v11[10]) = a2;
  uint64_t v12 = (char *)a6 + v11[12];
  uint64_t v13 = sub_24EA05CD8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a3, v13);
  uint64_t v14 = (char *)a6 + v11[9];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a4, v15);
  *((unsigned char *)a6 + v11[11]) = a5;
  return result;
}

uint64_t type metadata accessor for TabBarState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9F7E20(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7470697263736564 && a2 == 0xEB0000000073726FLL;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F437478654E7075 && a2 == 0xEB00000000746E75 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xED00007865646E49 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024EA168D0 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_24E9F8050(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F437478654E7075;
      break;
    case 2:
      unint64_t result = 0x64657463656C6573;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x656C61636F6CLL;
      break;
    default:
      unint64_t result = 0x7470697263736564;
      break;
  }
  return result;
}

unint64_t sub_24E9F811C()
{
  return sub_24E9F8050(*v0);
}

uint64_t sub_24E9F8128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9F7E20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9F8158(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9F81AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t TabBarState.encode(to:)(void *a1, uint64_t a2)
{
  v10[0] = a2;
  type metadata accessor for TabBarState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EA06FF8();
  uint64_t v11 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v10 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v6 = (uint64_t *)v10[1];
  sub_24EA070A8();
  uint64_t v15 = *v6;
  char v14 = 0;
  type metadata accessor for TabBarItemDescriptor();
  sub_24EA06A58();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v7 = v12;
  sub_24EA06FE8();
  if (v7) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v5, v3);
  }
  uint64_t v9 = v11;
  LOBYTE(v15) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  sub_24E9F8B10(&qword_26991F368);
  sub_24EA06FE8();
  LOBYTE(v15) = 2;
  sub_24EA06FD8();
  LOBYTE(v15) = 3;
  sub_24EA06FC8();
  LOBYTE(v15) = 4;
  sub_24EA05CD8();
  sub_24E9AC7B8(&qword_26991DF10);
  sub_24EA06FE8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v5, v3);
}

uint64_t type metadata accessor for TabBarState.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TabBarState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v31 = sub_24EA05CD8();
  uint64_t v28 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v30 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v33 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TabBarState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v39 = sub_24EA06F88();
  uint64_t v32 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v12 = (int *)type metadata accessor for TabBarState();
  uint64_t v13 = *((void *)v12 - 1);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v16 = a1[3];
  uint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  uint64_t v38 = v11;
  uint64_t v17 = v41;
  sub_24EA07098();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  }
  uint64_t v19 = v32;
  uint64_t v18 = v33;
  uint64_t v41 = v13;
  uint64_t v21 = v34;
  uint64_t v20 = v35;
  type metadata accessor for TabBarItemDescriptor();
  sub_24EA06A58();
  char v43 = 0;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA06F68();
  uint64_t v37 = v15;
  *(void *)uint64_t v15 = v44;
  LOBYTE(v44) = 1;
  sub_24E9F8B10(&qword_26991F370);
  sub_24EA06F68();
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v37[v12[9]], v18, v20);
  LOBYTE(v44) = 2;
  *(void *)&v37[v12[10]] = sub_24EA06F58();
  LOBYTE(v44) = 3;
  uint64_t v22 = v12;
  v37[v12[11]] = sub_24EA06F48() & 1;
  LOBYTE(v44) = 4;
  sub_24E9AC7B8(qword_26991DF18);
  uint64_t v24 = v30;
  uint64_t v23 = v31;
  sub_24EA06F68();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v38, v39);
  uint64_t v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v37[v22[12]], v24, v23);
  uint64_t v26 = v41;
  (*(void (**)(uint64_t, char *, int *))(v41 + 16))(v29, v25, v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  return (*(uint64_t (**)(char *, int *))(v26 + 8))(v25, v22);
}

uint64_t sub_24E9F8B10(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1CD718);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E9F8B78@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return TabBarState.init(from:)(a1, *(void *)(a2 + 16), *(char **)(a2 + 24), a3);
}

uint64_t sub_24E9F8B98(void *a1, uint64_t a2)
{
  return TabBarState.encode(to:)(a1, a2);
}

uint64_t TabBarState.hash(into:)()
{
  return sub_24EA068A8();
}

uint64_t static TabBarState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TabBarItemDescriptor();
  swift_getWitnessTable();
  if (sub_24EA06A78())
  {
    uint64_t v4 = type metadata accessor for TabBarState();
    if ((sub_24EA066A8() & 1) != 0
      && *(void *)(a1 + *(int *)(v4 + 40)) == *(void *)(a2 + *(int *)(v4 + 40))
      && *(unsigned __int8 *)(a1 + *(int *)(v4 + 44)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 44)))
    {
      JUMPOUT(0x2533452D0);
    }
  }
  return 0;
}

uint64_t TabBarState.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t sub_24E9F8E48()
{
  return sub_24EA07088();
}

uint64_t sub_24E9F8E8C(uint64_t a1, uint64_t a2)
{
  return static TabBarState.== infix(_:_:)(a1, a2);
}

unint64_t sub_24E9F8E98()
{
  unint64_t result = qword_26991F378;
  if (!qword_26991F378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1CD718);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F378);
  }
  return result;
}

uint64_t sub_24E9F8F04()
{
  return swift_getWitnessTable();
}

void sub_24E9F8F20()
{
  sub_24E9F9864();
  if (v0 <= 0x3F)
  {
    sub_24EA05CD8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_24E9F9010(void *a1, void *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a3[9];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[11];
    *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v13 = a3[12];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_24EA05CD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_24E9F9148(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 48);
  uint64_t v7 = sub_24EA05CD8();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *sub_24E9F920C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[12];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

void *sub_24E9F92FC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v10 = a3[12];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

void *sub_24E9F93FC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[12];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

void *sub_24E9F94E8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[12];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24EA05CD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_24E9F95DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E9F95F0);
}

uint64_t sub_24E9F95F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24EA05CD8();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 48);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_24E9F9720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E9F9734);
}

void *sub_24E9F9734(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1CD718);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 36);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24EA05CD8();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 48);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_24E9F9864()
{
  if (!qword_26B1CD720)
  {
    unint64_t v0 = sub_24EA066C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1CD720);
    }
  }
}

unsigned char *sub_24E9F98C4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9F9990);
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

uint64_t sub_24E9F99B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F99D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9F99F0()
{
  return swift_getWitnessTable();
}

uint64_t AnotherNavigationSplitViewState.isSidebarVisible.getter()
{
  return *v0;
}

uint64_t AnotherNavigationSplitViewState.isSidebarVisible.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*AnotherNavigationSplitViewState.isSidebarVisible.modify())(void, void, void)
{
  return nullsub_1;
}

FitnessAppRoot::AnotherNavigationSplitViewState __swiftcall AnotherNavigationSplitViewState.init(isSidebarVisible:)(FitnessAppRoot::AnotherNavigationSplitViewState isSidebarVisible)
{
  v1->isSidebarVisible = isSidebarVisible.isSidebarVisible;
  return isSidebarVisible;
}

unint64_t sub_24E9F9A44()
{
  return 0xD000000000000010;
}

uint64_t sub_24E9F9A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9FA2C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E9F9A8C(uint64_t a1)
{
  unint64_t v2 = sub_24E9F9C38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9F9AC8(uint64_t a1)
{
  unint64_t v2 = sub_24E9F9C38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AnotherNavigationSplitViewState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F400);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F9C38();
  sub_24EA070A8();
  sub_24EA06FC8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24E9F9C38()
{
  unint64_t result = qword_26991F408;
  if (!qword_26991F408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F408);
  }
  return result;
}

uint64_t AnotherNavigationSplitViewState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F410);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F9C38();
  sub_24EA07098();
  if (!v2)
  {
    char v9 = sub_24EA06F48();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24E9F9DE0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return AnotherNavigationSplitViewState.init(from:)(a1, a2);
}

uint64_t sub_24E9F9DF8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F400);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9F9C38();
  sub_24EA070A8();
  sub_24EA06FC8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static AnotherNavigationSplitViewState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for AnotherNavigationSplitViewState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AnotherNavigationSplitViewState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9FA0B0);
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

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewState()
{
  return &type metadata for AnotherNavigationSplitViewState;
}

unsigned char *storeEnumTagSinglePayload for AnotherNavigationSplitViewState.CodingKeys(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E9FA184);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnotherNavigationSplitViewState.CodingKeys()
{
  return &type metadata for AnotherNavigationSplitViewState.CodingKeys;
}

unint64_t sub_24E9FA1C0()
{
  unint64_t result = qword_26991F418;
  if (!qword_26991F418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F418);
  }
  return result;
}

unint64_t sub_24E9FA218()
{
  unint64_t result = qword_26991F420;
  if (!qword_26991F420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F420);
  }
  return result;
}

unint64_t sub_24E9FA270()
{
  unint64_t result = qword_26991F428;
  if (!qword_26991F428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F428);
  }
  return result;
}

uint64_t sub_24E9FA2C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024EA155E0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24EA07028();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24E9FA34C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24E9FA390()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4A8);
  uint64_t v5 = sub_24E9B7F78(&qword_26991F4B0, &qword_26991F4A8);
  return MEMORY[0x270EFF108](v1, v2, v3, v4, v5);
}

uint64_t sub_24E9FA420()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
  sub_24EA05E28();
  return v1;
}

uint64_t SignOutView.init(store:monogramViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v10 = sub_24EA05E48();
  uint64_t v12 = v11;
  char v13 = v10 & 1;
  char v15 = v14 & 1;
  sub_24EA06508();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a5 = sub_24E9F4578;
  *(void *)(a5 + 8) = result;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = a3;
  *(void *)(a5 + 32) = a4;
  *(unsigned char *)(a5 + 40) = v13;
  *(void *)(a5 + 48) = v12;
  *(unsigned char *)(a5 + 56) = v15;
  *(unsigned char *)(a5 + 64) = v17;
  *(void *)(a5 + 72) = v18;
  return result;
}

uint64_t sub_24E9FA54C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t SignOutView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F430);
  uint64_t v73 = *(void *)(a1 + 16);
  uint64_t v76 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F438);
  sub_24EA06098();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F440);
  uint64_t v5 = sub_24EA06098();
  uint64_t v6 = sub_24E9B7F78(&qword_26991F448, &qword_26991F430);
  uint64_t v79 = *(void *)(a1 + 24);
  uint64_t v92 = v79;
  unint64_t v93 = sub_24E9FAF38();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v91 = sub_24E9FAFD8();
  *(void *)&long long v94 = v4;
  *((void *)&v94 + 1) = v5;
  *(void *)&long long v95 = v6;
  *((void *)&v95 + 1) = swift_getWitnessTable();
  uint64_t v62 = sub_24EA064F8();
  uint64_t v61 = swift_getWitnessTable();
  uint64_t v7 = sub_24EA06548();
  uint64_t v66 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v59 = (char *)v58 - v8;
  uint64_t v9 = swift_getWitnessTable();
  unint64_t v10 = sub_24E9FB14C();
  *(void *)&long long v94 = v7;
  *((void *)&v94 + 1) = &type metadata for SidebarToolbarLeadItemButtonStyle;
  *(void *)&long long v95 = v9;
  *((void *)&v95 + 1) = v10;
  uint64_t v11 = v9;
  v58[3] = v10;
  v58[4] = v9;
  unint64_t v12 = v10;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v63 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  char v15 = (char *)v58 - v14;
  *(void *)&long long v94 = v7;
  *((void *)&v94 + 1) = &type metadata for SidebarToolbarLeadItemButtonStyle;
  *(void *)&long long v95 = v11;
  *((void *)&v95 + 1) = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v94 = OpaqueTypeMetadata2;
  *((void *)&v94 + 1) = OpaqueTypeConformance2;
  uint64_t v17 = OpaqueTypeConformance2;
  v58[1] = OpaqueTypeConformance2;
  uint64_t v18 = swift_getOpaqueTypeMetadata2();
  uint64_t v65 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v58 - v19;
  *(void *)&long long v94 = OpaqueTypeMetadata2;
  *((void *)&v94 + 1) = v17;
  uint64_t v21 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v94 = v18;
  *((void *)&v94 + 1) = v21;
  v58[2] = v21;
  uint64_t v22 = swift_getOpaqueTypeMetadata2();
  uint64_t v67 = v22;
  uint64_t v71 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v78 = (char *)v58 - v23;
  *(void *)&long long v94 = v18;
  *((void *)&v94 + 1) = v21;
  uint64_t v64 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v94 = v22;
  *((void *)&v94 + 1) = MEMORY[0x263F8D4F8];
  *(void *)&long long v95 = v64;
  *((void *)&v95 + 1) = MEMORY[0x263F8D510];
  uint64_t v72 = MEMORY[0x263F1B260];
  uint64_t v69 = swift_getOpaqueTypeMetadata2();
  uint64_t v74 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v60 = (char *)v58 - v24;
  v58[0] = sub_24EA05F68();
  uint64_t v75 = *(void *)(v58[0] - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v58[0]);
  long long v68 = (char *)v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v70 = (char *)v58 - v27;
  long long v28 = v2[3];
  long long v96 = v2[2];
  long long v97 = v28;
  long long v98 = v2[4];
  long long v29 = v2[1];
  long long v94 = *v2;
  long long v95 = v29;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v73;
  uint64_t v32 = v79;
  *(void *)(v30 + 16) = v73;
  *(void *)(v30 + 24) = v32;
  long long v33 = v2[3];
  *(_OWORD *)(v30 + 64) = v2[2];
  *(_OWORD *)(v30 + 80) = v33;
  *(_OWORD *)(v30 + 96) = v2[4];
  long long v34 = v2[1];
  *(_OWORD *)(v30 + 32) = *v2;
  *(_OWORD *)(v30 + 48) = v34;
  uint64_t v80 = v31;
  uint64_t v81 = v32;
  uint64_t v82 = &v94;
  sub_24E9FB460((uint64_t)&v94);
  uint64_t v35 = v59;
  sub_24EA06538();
  sub_24EA06338();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v35, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F080);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_24EA097F0;
  strcpy((char *)(v36 + 32), "SignOutButton");
  *(_WORD *)(v36 + 46) = -4864;
  sub_24EA062E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v15, OpaqueTypeMetadata2);
  long long v87 = v96;
  long long v88 = v97;
  long long v89 = v98;
  long long v85 = v94;
  long long v86 = v95;
  sub_24E9FA420();
  sub_24EA063A8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v20, v18);
  LOBYTE(v85) = BYTE8(v96) & 1;
  *((void *)&v85 + 1) = v97;
  LOBYTE(v86) = BYTE8(v97) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
  sub_24EA05E18();
  LOBYTE(v85) = v99;
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = v79;
  *(void *)(v37 + 16) = v31;
  *(void *)(v37 + 24) = v38;
  long long v39 = v97;
  *(_OWORD *)(v37 + 64) = v96;
  *(_OWORD *)(v37 + 80) = v39;
  *(_OWORD *)(v37 + 96) = v98;
  long long v40 = v95;
  *(_OWORD *)(v37 + 32) = v94;
  *(_OWORD *)(v37 + 48) = v40;
  sub_24E9FB460((uint64_t)&v94);
  uint64_t v41 = v60;
  uint64_t v42 = v67;
  uint64_t v43 = MEMORY[0x263F8D4F8];
  uint64_t v44 = v64;
  uint64_t v45 = MEMORY[0x263F8D510];
  uint64_t v46 = v78;
  sub_24EA063F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v46, v42);
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v31;
  *(void *)(v47 + 24) = v38;
  long long v48 = v97;
  *(_OWORD *)(v47 + 64) = v96;
  *(_OWORD *)(v47 + 80) = v48;
  *(_OWORD *)(v47 + 96) = v98;
  long long v49 = v95;
  *(_OWORD *)(v47 + 32) = v94;
  *(_OWORD *)(v47 + 48) = v49;
  sub_24E9FB460((uint64_t)&v94);
  *(void *)&long long v85 = v42;
  *((void *)&v85 + 1) = v43;
  *(void *)&long long v86 = v44;
  *((void *)&v86 + 1) = v45;
  uint64_t v50 = swift_getOpaqueTypeConformance2();
  uint64_t v52 = v68;
  uint64_t v51 = v69;
  sub_24EA063E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v41, v51);
  uint64_t v83 = v50;
  uint64_t v84 = MEMORY[0x263F1A240];
  uint64_t v53 = v58[0];
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v55 = v70;
  sub_24E9C74A8(v52, v53, v54);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v75 + 8);
  v56(v52, v53);
  sub_24E9C74A8(v55, v53, v54);
  return ((uint64_t (*)(char *, uint64_t))v56)(v55, v53);
}

unint64_t sub_24E9FAF38()
{
  unint64_t result = qword_26991F450;
  if (!qword_26991F450)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F438);
    sub_24E9B7F78(&qword_26991F458, &qword_26991F460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F450);
  }
  return result;
}

unint64_t sub_24E9FAFD8()
{
  unint64_t result = qword_26991F468;
  if (!qword_26991F468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F440);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F470);
    sub_24E9FB0AC();
    swift_getOpaqueTypeConformance2();
    sub_24E9B7F78(&qword_26991F490, &qword_26991F498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F468);
  }
  return result;
}

unint64_t sub_24E9FB0AC()
{
  unint64_t result = qword_26991F478;
  if (!qword_26991F478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F470);
    sub_24E9B7F78(&qword_26991F480, &qword_26991F488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F478);
  }
  return result;
}

unint64_t sub_24E9FB14C()
{
  unint64_t result = qword_26991F4A0;
  if (!qword_26991F4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F4A0);
  }
  return result;
}

uint64_t sub_24E9FB1A4()
{
  return sub_24E9FE344((_OWORD *)(v0 + 32));
}

uint64_t sub_24E9FB1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v19[0] = a1;
  v19[1] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F430);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F438);
  sub_24EA06098();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F440);
  uint64_t v7 = sub_24EA06098();
  uint64_t v8 = sub_24E9B7F78(&qword_26991F448, &qword_26991F430);
  v19[19] = a3;
  v19[20] = sub_24E9FAF38();
  v19[17] = swift_getWitnessTable();
  v19[18] = sub_24E9FAFD8();
  v19[13] = v6;
  v19[14] = v7;
  v19[15] = v8;
  v19[16] = swift_getWitnessTable();
  uint64_t v9 = sub_24EA064F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  char v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)v19 - v14;
  v19[10] = a2;
  v19[11] = a3;
  v19[12] = v19[0];
  v19[4] = a2;
  v19[5] = a3;
  v19[6] = v19[0];
  sub_24EA064E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9C74A8(v13, v9, WitnessTable);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  sub_24E9C74A8(v15, v9, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v9);
}

uint64_t sub_24E9FB454@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9FB1C8(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_24E9FB460(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E9FB4C0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_24EA06008();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4C8);
  return sub_24E9FB524(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_24E9FB524@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v137 = a2;
  uint64_t v3 = sub_24EA05CD8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v135 = (char *)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24EA068F8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v134 = (char *)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_24EA06568();
  uint64_t v130 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  uint64_t v138 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = type metadata accessor for AccountState();
  uint64_t v8 = MEMORY[0x270FA5388](v141);
  uint64_t v142 = (char *)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v140 = (char *)&v124 - v10;
  uint64_t v11 = sub_24EA06298();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v124 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_24EA05D08();
  uint64_t v15 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v17 = (char *)&v124 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4D0);
  MEMORY[0x270FA5388](v128);
  uint64_t v19 = (char *)&v124 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4D8);
  MEMORY[0x270FA5388](v126);
  uint64_t v125 = (char *)&v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4E0);
  MEMORY[0x270FA5388](v127);
  uint64_t v139 = (char *)&v124 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4E8);
  MEMORY[0x270FA5388](v129);
  uint64_t v133 = (uint64_t)&v124 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4F0);
  uint64_t v23 = MEMORY[0x270FA5388](v132);
  uint64_t v136 = (uint64_t)&v124 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v131 = (uint64_t)&v124 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v143 = (uint64_t)&v124 - v27;
  long long v28 = a1[3];
  long long v148 = a1[2];
  long long v149 = v28;
  long long v150 = a1[4];
  long long v29 = a1[1];
  long long v146 = *a1;
  long long v147 = v29;
  uint64_t v30 = type metadata accessor for SignOutView();
  sub_24E9FC61C(v30);
  sub_24EA05D18();
  uint64_t v31 = *((void *)a1 + 9);
  LOBYTE(v146) = a1[4] & 1;
  *((void *)&v146 + 1) = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
  sub_24EA06518();
  int v32 = v145;
  uint64_t v33 = sub_24EA062A8();
  if (v32 == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F1A680], v11);
    uint64_t v34 = sub_24EA062B8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v33 = v34;
  }
  uint64_t v35 = v138;
  uint64_t v36 = (uint64_t)v125;
  uint64_t v37 = v124;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v17, v37);
  long long v39 = (uint64_t *)&v19[*(int *)(v128 + 36)];
  *long long v39 = KeyPath;
  v39[1] = v33;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v37);
  uint64_t v40 = *((void *)a1 + 6);
  char v41 = *((unsigned char *)a1 + 56) & 1;
  LOBYTE(v146) = *((unsigned char *)a1 + 40) & 1;
  *((void *)&v146 + 1) = v40;
  LOBYTE(v147) = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
  sub_24EA05E18();
  if (v145 == 1) {
    int v42 = sub_24EA060F8();
  }
  else {
    int v42 = sub_24EA06118();
  }
  int v43 = v42;
  uint64_t v44 = v127;
  uint64_t v45 = v126;
  sub_24E9C8E28((uint64_t)v19, v36, &qword_26991F4D0);
  *(_DWORD *)(v36 + *(int *)(v45 + 36)) = v43;
  sub_24E9C92D0((uint64_t)v19, &qword_26991F4D0);
  long long v46 = a1[3];
  long long v148 = a1[2];
  long long v149 = v46;
  long long v150 = a1[4];
  long long v47 = a1[1];
  long long v146 = *a1;
  long long v147 = v47;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v48 = v145;
  long long v49 = a1[3];
  long long v148 = a1[2];
  long long v149 = v49;
  long long v150 = a1[4];
  long long v50 = a1[1];
  long long v146 = *a1;
  long long v147 = v50;
  sub_24E9FA390();
  swift_getKeyPath();
  uint64_t v51 = (uint64_t)v140;
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v52 = (uint64_t)v142;
  swift_storeEnumTagMultiPayload();
  LOBYTE(v43) = _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(v51, v52);
  sub_24E9C7448(v52, (uint64_t (*)(void))type metadata accessor for AccountState);
  sub_24E9C7448(v51, (uint64_t (*)(void))type metadata accessor for AccountState);
  double v53 = 13.0;
  if ((v43 & 1) == 0)
  {
    long long v54 = a1[3];
    long long v148 = a1[2];
    long long v149 = v54;
    long long v150 = a1[4];
    long long v55 = a1[1];
    long long v146 = *a1;
    long long v147 = v55;
    sub_24E9FA390();
    swift_getKeyPath();
    sub_24EA06788();
    swift_release();
    swift_release();
    double v53 = *((double *)&v146 + 1);
  }
  uint64_t v56 = v139;
  sub_24E9C8E28(v36, (uint64_t)v139, &qword_26991F4D8);
  uint64_t v57 = (double *)&v56[*(int *)(v44 + 36)];
  *(void *)uint64_t v57 = v48;
  v57[1] = v53;
  sub_24E9C92D0(v36, &qword_26991F4D8);
  long long v58 = a1[3];
  long long v148 = a1[2];
  long long v149 = v58;
  long long v150 = a1[4];
  long long v59 = a1[1];
  long long v146 = *a1;
  long long v147 = v59;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v60 = (void (**)(char *, uint64_t))(v130 + 8);
  uint64_t v61 = v144;
  sub_24EA06558();
  uint64_t v62 = sub_24EA06638();
  uint64_t v63 = (uint64_t *)*v60;
  (*v60)(v35, v61);
  long long v64 = a1[3];
  long long v148 = a1[2];
  long long v149 = v64;
  long long v150 = a1[4];
  long long v65 = a1[1];
  long long v146 = *a1;
  long long v147 = v65;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v66 = v146;
  uint64_t v67 = v139;
  uint64_t v68 = v133;
  sub_24E9C8E28((uint64_t)v139, v133, &qword_26991F4E0);
  uint64_t v69 = (uint64_t *)(v68 + *(int *)(v129 + 36));
  *uint64_t v69 = v62;
  v69[1] = v66;
  sub_24E9C92D0((uint64_t)v67, &qword_26991F4E0);
  sub_24EA06558();
  double v70 = 0.0;
  uint64_t v71 = sub_24EA06638();
  uint64_t v139 = (char *)v63;
  ((void (*)(char *, uint64_t))v63)(v35, v61);
  long long v72 = a1[3];
  long long v148 = a1[2];
  long long v149 = v72;
  long long v150 = a1[4];
  long long v73 = a1[1];
  long long v146 = *a1;
  long long v147 = v73;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v74 = *((void *)&v146 + 1);
  uint64_t v75 = v131;
  sub_24E9C8E28(v68, v131, &qword_26991F4E8);
  uint64_t v76 = (uint64_t *)(v75 + *(int *)(v132 + 36));
  uint64_t *v76 = v71;
  v76[1] = v74;
  sub_24E9C92D0(v68, &qword_26991F4E8);
  sub_24E9FECB0(v75, v143, &qword_26991F4F0);
  sub_24EA068E8();
  type metadata accessor for LocalizableBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v78 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  long long v79 = a1[3];
  long long v148 = a1[2];
  long long v149 = v79;
  long long v150 = a1[4];
  long long v80 = a1[1];
  long long v146 = *a1;
  long long v147 = v80;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  *(void *)&long long v146 = sub_24EA06958();
  *((void *)&v146 + 1) = v81;
  sub_24E9DA730();
  uint64_t v82 = sub_24EA062D8();
  uint64_t v84 = v83;
  char v86 = v85 & 1;
  LODWORD(v146) = sub_24EA06108();
  uint64_t v134 = (char *)sub_24EA062C8();
  uint64_t v133 = v87;
  char v89 = v88;
  uint64_t v135 = v90;
  sub_24E9FED14(v82, v84, v86);
  swift_bridgeObjectRelease();
  long long v91 = a1[3];
  long long v148 = a1[2];
  long long v149 = v91;
  long long v150 = a1[4];
  long long v92 = a1[1];
  long long v146 = *a1;
  long long v147 = v92;
  sub_24E9FA390();
  swift_getKeyPath();
  uint64_t v93 = (uint64_t)v140;
  sub_24EA06798();
  swift_release();
  swift_release();
  uint64_t v94 = (uint64_t)v142;
  swift_storeEnumTagMultiPayload();
  LOBYTE(v82) = _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0(v93, v94);
  sub_24E9C7448(v94, (uint64_t (*)(void))type metadata accessor for AccountState);
  sub_24E9C7448(v93, (uint64_t (*)(void))type metadata accessor for AccountState);
  if ((v82 & 1) == 0)
  {
    long long v95 = a1[3];
    long long v148 = a1[2];
    long long v149 = v95;
    long long v150 = a1[4];
    long long v96 = a1[1];
    long long v146 = *a1;
    long long v147 = v96;
    sub_24E9FA390();
    swift_getKeyPath();
    sub_24EA06788();
    swift_release();
    swift_release();
    if (BYTE8(v147)) {
      double v70 = 1.0;
    }
    else {
      double v70 = 0.0;
    }
  }
  long long v97 = a1[3];
  long long v148 = a1[2];
  long long v149 = v97;
  long long v150 = a1[4];
  long long v98 = a1[1];
  long long v146 = *a1;
  long long v147 = v98;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v99 = v145;
  long long v100 = a1[3];
  long long v148 = a1[2];
  long long v149 = v100;
  long long v150 = a1[4];
  long long v101 = a1[1];
  long long v146 = *a1;
  long long v147 = v101;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v102 = v147;
  long long v103 = a1[3];
  long long v148 = a1[2];
  long long v149 = v103;
  long long v150 = a1[4];
  long long v104 = a1[1];
  long long v146 = *a1;
  long long v147 = v104;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v105 = v138;
  sub_24EA06558();
  uint64_t v106 = sub_24EA06638();
  uint64_t v107 = v144;
  long long v108 = v139;
  ((void (*)(char *, uint64_t))v139)(v105, v144);
  long long v109 = a1[3];
  long long v148 = a1[2];
  long long v149 = v109;
  long long v150 = a1[4];
  long long v110 = a1[1];
  long long v146 = *a1;
  long long v147 = v110;
  sub_24E9FA390();
  swift_getKeyPath();
  uint64_t v111 = v105;
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v112 = v146;
  sub_24EA06558();
  uint64_t v113 = sub_24EA06638();
  ((void (*)(char *, uint64_t))v108)(v111, v107);
  long long v114 = a1[3];
  long long v148 = a1[2];
  long long v149 = v114;
  long long v150 = a1[4];
  long long v115 = a1[1];
  long long v146 = *a1;
  long long v147 = v115;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06788();
  swift_release();
  swift_release();
  uint64_t v116 = v147;
  uint64_t v117 = v143;
  uint64_t v118 = v136;
  sub_24E9C8E28(v143, v136, &qword_26991F4F0);
  uint64_t v119 = v137;
  sub_24E9C8E28(v118, v137, &qword_26991F4F0);
  uint64_t v120 = v119 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26991F4F8) + 48);
  uint64_t v121 = (uint64_t)v134;
  uint64_t v122 = v133;
  *(void *)uint64_t v120 = v134;
  *(void *)(v120 + 8) = v122;
  *(unsigned char *)(v120 + 16) = v89 & 1;
  *(void *)(v120 + 24) = v135;
  *(double *)(v120 + 32) = v70;
  *(void *)(v120 + 40) = v99;
  *(void *)(v120 + 48) = v102;
  *(void *)(v120 + 56) = v106;
  *(void *)(v120 + 64) = v112;
  *(void *)(v120 + 72) = v113;
  *(void *)(v120 + 80) = v116;
  sub_24E9FED24(v121, v122, v89 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24E9C92D0(v117, &qword_26991F4F0);
  sub_24E9FED14(v121, v122, v89 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_24E9C92D0(v118, &qword_26991F4F0);
}

uint64_t sub_24E9FC61C(uint64_t a1)
{
  uint64_t v3 = sub_24EA05CD8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v51 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24EA068F8();
  MEMORY[0x270FA5388](v5 - 8);
  long long v50 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_24EA05C38();
  uint64_t v37 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24EA05C48();
  uint64_t v39 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24EA05C78();
  uint64_t v36 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *v1;
  uint64_t v17 = v1[1];
  int v19 = *((unsigned __int8 *)v1 + 16);
  uint64_t v21 = v1[3];
  uint64_t v20 = v1[4];
  int v22 = *((unsigned __int8 *)v1 + 40);
  uint64_t v23 = v1[6];
  int v24 = *((unsigned __int8 *)v1 + 56);
  int v25 = *((unsigned __int8 *)v1 + 64);
  uint64_t v26 = v1[9];
  uint64_t v52 = *v1;
  uint64_t v53 = v17;
  int v41 = v19;
  char v54 = v19;
  uint64_t v42 = v21;
  uint64_t v43 = v20;
  uint64_t v55 = v21;
  uint64_t v56 = v20;
  int v44 = v22;
  char v57 = v22;
  uint64_t v45 = v23;
  uint64_t v58 = v23;
  int v46 = v24;
  int v47 = v25;
  char v59 = v24;
  char v60 = v25;
  uint64_t v48 = v26;
  uint64_t v49 = a1;
  uint64_t v61 = v26;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1) {
      swift_bridgeObjectRelease();
    }
    sub_24EA068E8();
    type metadata accessor for LocalizableBundle();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v34 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v52 = v18;
    uint64_t v53 = v17;
    char v54 = v41;
    uint64_t v55 = v42;
    uint64_t v56 = v43;
    char v57 = v44;
    uint64_t v58 = v45;
    char v59 = v46;
    char v60 = v47;
    uint64_t v61 = v48;
    sub_24E9FA390();
    swift_getKeyPath();
    sub_24EA06798();
    swift_release();
    swift_release();
    return sub_24EA06958();
  }
  else
  {
    uint64_t v29 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v13, v16, v11);
    uint64_t v30 = v37;
    uint64_t v31 = v38;
    (*(void (**)(char *, void, uint64_t))(v37 + 104))(v8, *MEMORY[0x263F06A08], v38);
    MEMORY[0x253345210](v8);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
    sub_24E9FED34(&qword_26991F500, MEMORY[0x263F06A18]);
    uint64_t v32 = v40;
    sub_24EA05C68();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v32);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v11);
    return v52;
  }
}

uint64_t sub_24E9FCBC8(long long *a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F438);
  sub_24EA06098();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F440);
  uint64_t v5 = sub_24EA06098();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v21 - v10;
  long long v12 = a1[3];
  long long v24 = a1[2];
  long long v25 = v12;
  long long v26 = a1[4];
  long long v13 = a1[1];
  long long v22 = *a1;
  long long v23 = v13;
  uint64_t v14 = type metadata accessor for SignOutView();
  sub_24E9FCDBC(v14, (uint64_t)v9);
  unint64_t v15 = sub_24E9FAF38();
  v21[2] = a3;
  v21[3] = v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v17 = sub_24E9FAFD8();
  v21[0] = WitnessTable;
  v21[1] = v17;
  uint64_t v18 = swift_getWitnessTable();
  sub_24E9C74A8(v9, v5, v18);
  int v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v5);
  sub_24E9C74A8(v11, v5, v18);
  return ((uint64_t (*)(char *, uint64_t))v19)(v11, v5);
}

uint64_t sub_24E9FCDBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v99 = a2;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4B8);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  char v86 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F440);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  char v85 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v89 = (uint64_t)&v76 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v84 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_24EA05F58();
  uint64_t v82 = *(void *)(v83 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v80 = (char *)&v76 - v13;
  uint64_t v79 = sub_24EA064B8();
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v77 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F438);
  uint64_t v16 = sub_24EA06098();
  uint64_t v92 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  long long v91 = (char *)&v76 - v18;
  uint64_t v76 = *(void *)(v15 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  long long v23 = (char *)&v76 - v22;
  uint64_t v24 = type metadata accessor for AccountState();
  MEMORY[0x270FA5388](v24);
  long long v26 = (char *)&v76 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = v16;
  uint64_t v98 = v5;
  uint64_t v96 = sub_24EA06098();
  uint64_t v95 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v94 = (char *)&v76 - v27;
  LOBYTE(v27) = *((unsigned char *)v2 + 16);
  long long v28 = (void (*)(void))*((void *)v2 + 3);
  uint64_t v29 = *((void *)v2 + 4);
  char v30 = *((unsigned char *)v2 + 40);
  uint64_t v31 = *((void *)v2 + 6);
  char v32 = *((unsigned char *)v2 + 56);
  char v33 = *((unsigned char *)v2 + 64);
  uint64_t v34 = *((void *)v2 + 9);
  long long v110 = *v2;
  LOBYTE(v111) = v27;
  uint64_t v112 = v28;
  uint64_t v113 = v29;
  char v114 = v30;
  uint64_t v115 = v31;
  char v116 = v32;
  char v117 = v33;
  uint64_t v118 = v34;
  uint64_t v93 = a1;
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v36 = sub_24EA064A8();
      uint64_t v37 = sub_24EA062A8();
      uint64_t KeyPath = swift_getKeyPath();
      *(void *)&long long v110 = v36;
      *((void *)&v110 + 1) = KeyPath;
      uint64_t v111 = v37;
      uint64_t v39 = *(void *)(v93 + 24);
      unint64_t v40 = sub_24E9FAF38();
      uint64_t v41 = (uint64_t)v91;
      sub_24E9D8CA0((uint64_t)&v110, v15, v90);
      uint64_t v102 = v39;
      unint64_t v103 = v40;
      uint64_t v42 = v97;
      swift_getWitnessTable();
      sub_24E9FAFD8();
      uint64_t v43 = v94;
      sub_24E9D6C7C(v41, v42);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v41, v42);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      sub_24EA064A8();
      uint64_t v48 = v78;
      uint64_t v49 = v77;
      uint64_t v50 = v79;
      (*(void (**)(char *, void, uint64_t))(v78 + 104))(v77, *MEMORY[0x263F1B4B8], v79);
      uint64_t v51 = sub_24EA064D8();
      swift_release();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
      int v52 = sub_24EA060F8();
      *(void *)&long long v110 = v51;
      DWORD2(v110) = v52;
      uint64_t v53 = v80;
      sub_24EA05F48();
      char v54 = v81;
      sub_24EA05F38();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v82 + 8);
      uint64_t v56 = v83;
      v55(v53, v83);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26991F470);
      sub_24E9FB0AC();
      char v57 = v86;
      sub_24EA06368();
      v55(v54, v56);
      swift_release();
      uint64_t v58 = (uint64_t)v84;
      sub_24EA06038();
      uint64_t v59 = sub_24EA06048();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v58, 0, 1, v59);
      uint64_t v60 = swift_getKeyPath();
      uint64_t v61 = v98;
      uint64_t v62 = (uint64_t)v85;
      uint64_t v63 = (uint64_t *)&v85[*(int *)(v98 + 36)];
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F498);
      sub_24E9C8E28(v58, (uint64_t)v63 + *(int *)(v64 + 28), &qword_26991F4C0);
      *uint64_t v63 = v60;
      uint64_t v65 = v87;
      uint64_t v66 = v88;
      (*(void (**)(uint64_t, char *, uint64_t))(v87 + 16))(v62, v57, v88);
      sub_24E9C92D0(v58, &qword_26991F4C0);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v57, v66);
      uint64_t v67 = v89;
      sub_24E9FECB0(v62, v89, &qword_26991F440);
      uint64_t v39 = *(void *)(v93 + 24);
      unint64_t v68 = sub_24E9FAF38();
      uint64_t v108 = v39;
      unint64_t v109 = v68;
      uint64_t v69 = v97;
      swift_getWitnessTable();
      sub_24E9FAFD8();
      uint64_t v43 = v94;
      sub_24E9D8CA0(v67, v69, v61);
      sub_24E9C92D0(v67, &qword_26991F440);
    }
  }
  else
  {
    v28();
    uint64_t v39 = *(void *)(v93 + 24);
    sub_24E9C74A8(v21, v15, v39);
    int v44 = *(void (**)(char *, uint64_t))(v76 + 8);
    v44(v21, v15);
    sub_24E9C74A8(v23, v15, v39);
    unint64_t v45 = sub_24E9FAF38();
    uint64_t v46 = (uint64_t)v91;
    sub_24E9D6C7C((uint64_t)v21, v15);
    v44(v21, v15);
    uint64_t v100 = v39;
    unint64_t v101 = v45;
    uint64_t v47 = v97;
    swift_getWitnessTable();
    sub_24E9FAFD8();
    uint64_t v43 = v94;
    sub_24E9D6C7C(v46, v47);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v46, v47);
    v44(v23, v15);
    sub_24E9C7448((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for AccountState);
  }
  unint64_t v70 = sub_24E9FAF38();
  uint64_t v106 = v39;
  unint64_t v107 = v70;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v72 = sub_24E9FAFD8();
  uint64_t v104 = WitnessTable;
  unint64_t v105 = v72;
  uint64_t v73 = v96;
  uint64_t v74 = swift_getWitnessTable();
  sub_24E9C74A8(v43, v73, v74);
  return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v43, v73);
}

uint64_t sub_24E9FD904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_24EA067D8();
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v64 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v60 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24EA067F8();
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  MEMORY[0x270FA5388](v10);
  char v57 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24EA06818();
  uint64_t v58 = *(void *)(v12 - 8);
  uint64_t v59 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v56 = (char *)&v53 - v16;
  uint64_t v17 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for AccountState();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  long long v23 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v53 - v24;
  long long v26 = *(_OWORD *)(a3 + 48);
  long long v67 = *(_OWORD *)(a3 + 32);
  long long v68 = v26;
  long long v69 = *(_OWORD *)(a3 + 64);
  long long v27 = *(_OWORD *)(a3 + 16);
  long long aBlock = *(_OWORD *)a3;
  long long v66 = v27;
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  type metadata accessor for SignOutView();
  sub_24E9FA390();
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  swift_release();
  swift_storeEnumTagMultiPayload();
  LOBYTE(a5) = _s14FitnessAppRoot12AccountStateO2eeoiySbAC_ACtFZ_0((uint64_t)v25, (uint64_t)v23);
  sub_24E9C7448((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for AccountState);
  sub_24E9C7448((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for AccountState);
  if (a5)
  {
    uint64_t v28 = *(void *)(a3 + 72);
    LOBYTE(aBlock) = *(unsigned char *)(a3 + 64) & 1;
    *((void *)&aBlock + 1) = v28;
    char v70 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
    return sub_24EA06528();
  }
  else
  {
    uint64_t v30 = *(void *)(a3 + 48);
    char v31 = *(unsigned char *)(a3 + 56);
    char v33 = v31 & 1;
    LOBYTE(aBlock) = *(unsigned char *)(a3 + 40) & 1;
    char v32 = aBlock;
    *((void *)&aBlock + 1) = v30;
    LOBYTE(v66) = v31 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
    sub_24EA05E18();
    uint64_t v34 = *(void *)(a3 + 72);
    LOBYTE(aBlock) = *(unsigned char *)(a3 + 64) & 1;
    *((void *)&aBlock + 1) = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E810);
    sub_24EA06528();
    LOBYTE(aBlock) = v32;
    *((void *)&aBlock + 1) = v30;
    LOBYTE(v66) = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991F068);
    sub_24EA05E18();
    long long v35 = *(_OWORD *)(a3 + 48);
    long long v67 = *(_OWORD *)(a3 + 32);
    long long v68 = v35;
    long long v69 = *(_OWORD *)(a3 + 64);
    long long v36 = *(_OWORD *)(a3 + 16);
    long long aBlock = *(_OWORD *)a3;
    long long v66 = v36;
    if (v70 == 1)
    {
      sub_24E9FA390();
      *(_OWORD *)uint64_t v19 = xmmword_24EA0D4E0;
      *((void *)v19 + 2) = 0xC02E000000000000;
      v19[24] = 0;
      swift_storeEnumTagMultiPayload();
      sub_24EA067A8();
      swift_release();
      sub_24E9C7448((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SignOutAction);
      sub_24E9FEB4C();
      uint64_t v37 = (void *)sub_24EA06C48();
      sub_24EA06808();
      uint64_t v38 = v56;
      MEMORY[0x253345E30](v15, 0.25);
      uint64_t v39 = v59;
      uint64_t v58 = *(void *)(v58 + 8);
      ((void (*)(char *, uint64_t))v58)(v15, v59);
      uint64_t v40 = swift_allocObject();
      uint64_t v41 = v55;
      *(void *)(v40 + 16) = v54;
      *(void *)(v40 + 24) = v41;
      long long v42 = *(_OWORD *)(a3 + 48);
      *(_OWORD *)(v40 + 64) = *(_OWORD *)(a3 + 32);
      *(_OWORD *)(v40 + 80) = v42;
      *(_OWORD *)(v40 + 96) = *(_OWORD *)(a3 + 64);
      long long v43 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v40 + 32) = *(_OWORD *)a3;
      *(_OWORD *)(v40 + 48) = v43;
      *(void *)&long long v67 = sub_24E9FEC0C;
      *((void *)&v67 + 1) = v40;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      int v44 = &block_descriptor_24;
    }
    else
    {
      sub_24E9FA390();
      *(void *)uint64_t v19 = 0;
      *((void *)v19 + 1) = 0;
      *((void *)v19 + 2) = 0;
      v19[24] = 1;
      swift_storeEnumTagMultiPayload();
      sub_24EA067A8();
      swift_release();
      sub_24E9C7448((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SignOutAction);
      sub_24E9FEB4C();
      uint64_t v37 = (void *)sub_24EA06C48();
      sub_24EA06808();
      uint64_t v38 = v56;
      MEMORY[0x253345E30](v15, 0.25);
      uint64_t v39 = v59;
      uint64_t v58 = *(void *)(v58 + 8);
      ((void (*)(char *, uint64_t))v58)(v15, v59);
      uint64_t v45 = swift_allocObject();
      uint64_t v46 = v55;
      *(void *)(v45 + 16) = v54;
      *(void *)(v45 + 24) = v46;
      long long v47 = *(_OWORD *)(a3 + 48);
      *(_OWORD *)(v45 + 64) = *(_OWORD *)(a3 + 32);
      *(_OWORD *)(v45 + 80) = v47;
      *(_OWORD *)(v45 + 96) = *(_OWORD *)(a3 + 64);
      long long v48 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v45 + 32) = *(_OWORD *)a3;
      *(_OWORD *)(v45 + 48) = v48;
      *(void *)&long long v67 = sub_24E9FEB90;
      *((void *)&v67 + 1) = v45;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      int v44 = &block_descriptor_2;
    }
    *(void *)&long long v66 = sub_24E9FA34C;
    *((void *)&v66 + 1) = v44;
    uint64_t v49 = _Block_copy(&aBlock);
    sub_24E9FB460(a3);
    swift_release();
    uint64_t v50 = v57;
    sub_24EA067E8();
    *(void *)&long long aBlock = MEMORY[0x263F8EE78];
    sub_24E9FED34((unint64_t *)&qword_26991E478, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991E480);
    sub_24E9B7F78((unint64_t *)&qword_26991E488, &qword_26991E480);
    uint64_t v51 = v60;
    uint64_t v52 = v64;
    sub_24EA06CF8();
    MEMORY[0x253346240](v38, v50, v51, v49);
    _Block_release(v49);

    (*(void (**)(char *, uint64_t))(v63 + 8))(v51, v52);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v50, v62);
    return ((uint64_t (*)(char *, uint64_t))v58)(v38, v39);
  }
}

uint64_t sub_24E9FE114(uint64_t a1, uint64_t a2)
{
  return sub_24E9FD904(a1, a2, v2 + 32, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_24E9FE120(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = a1[3];
  v8[2] = a1[2];
  v8[3] = v5;
  v8[4] = a1[4];
  long long v6 = a1[1];
  v8[0] = *a1;
  v8[1] = v6;
  type metadata accessor for SignOutView();
  sub_24E9FA390();
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = 0x4022000000000000;
  v4[24] = 1;
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  return sub_24E9C7448((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SignOutAction);
}

uint64_t sub_24E9FE230(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = a1[3];
  v8[2] = a1[2];
  v8[3] = v5;
  v8[4] = a1[4];
  long long v6 = a1[1];
  v8[0] = *a1;
  v8[1] = v6;
  type metadata accessor for SignOutView();
  sub_24E9FA390();
  *(_OWORD *)uint64_t v4 = xmmword_24EA0D4F0;
  *((void *)v4 + 2) = 0xC02E000000000000;
  v4[24] = 0;
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  return sub_24E9C7448((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SignOutAction);
}

uint64_t sub_24E9FE344(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for SignOutAction();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = a1[3];
  v8[2] = a1[2];
  v8[3] = v5;
  v8[4] = a1[4];
  long long v6 = a1[1];
  v8[0] = *a1;
  v8[1] = v6;
  type metadata accessor for SignOutView();
  sub_24E9FA390();
  swift_storeEnumTagMultiPayload();
  sub_24EA067A8();
  swift_release();
  return sub_24E9C7448((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SignOutAction);
}

uint64_t sub_24E9FE448()
{
  return sub_24E9FE344((_OWORD *)(v0 + 32));
}

uint64_t sub_24E9FE46C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9FE4B4()
{
  sub_24E9C79E0();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24E9FE508(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 48) = a2[6];
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24E9FE5A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 48) = a2[6];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
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

uint64_t sub_24E9FE684(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24E9C79E0();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_24E9FE714(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24E9FE75C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SignOutView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9FE7C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E9FEAB8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F4C0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24E9C8E28(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26991F4C0);
  return sub_24EA05F88();
}

unint64_t sub_24E9FEB4C()
{
  unint64_t result = qword_26991E470;
  if (!qword_26991E470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26991E470);
  }
  return result;
}

uint64_t sub_24E9FEB90()
{
  return sub_24E9FE230((_OWORD *)(v0 + 32));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t objectdestroy_3Tm_0()
{
  sub_24E9C79E0();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24E9FEC0C()
{
  return sub_24E9FE120((_OWORD *)(v0 + 32));
}

uint64_t sub_24E9FEC18@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9FB4C0(*(long long **)(v1 + 32), a1);
}

uint64_t sub_24E9FEC24()
{
  return sub_24E9FCBC8(*(long long **)(v0 + 32), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24E9FEC30()
{
  return sub_24EA05F78();
}

uint64_t sub_24E9FEC58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EA05F98();
  *a1 = result;
  return result;
}

uint64_t sub_24E9FEC84()
{
  return sub_24EA05FA8();
}

uint64_t sub_24E9FECB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E9FED14(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24E9FED24(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24E9FED34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E9FED84()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F510);
  unint64_t v5 = sub_24E9FF530();
  return MEMORY[0x270EFF108](v1, v2, v3, v4, v5);
}

uint64_t AnotherNavigationSplitView.init(store:sidebarViewBuilder:detailViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a7 = sub_24E9F4578;
  *(void *)(a7 + 8) = result;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = a3;
  *(void *)(a7 + 32) = a4;
  *(void *)(a7 + 40) = a5;
  *(void *)(a7 + 48) = a6;
  return result;
}

uint64_t sub_24E9FEE70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t AnotherNavigationSplitView.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F508);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = a1[2];
  uint64_t v25 = a1[3];
  uint64_t v26 = v6;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  v24[1] = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[2] = v7;
  v24[0] = v8;
  *(void *)&long long v28 = v6;
  *((void *)&v28 + 1) = MEMORY[0x263F1BA08];
  uint64_t v29 = v25;
  uint64_t v30 = v7;
  uint64_t v31 = MEMORY[0x263F1BA00];
  uint64_t v32 = v8;
  uint64_t v9 = sub_24EA06028();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v24 - v14;
  char v16 = *((unsigned char *)v2 + 16);
  uint64_t v17 = *((void *)v2 + 3);
  uint64_t v18 = *((void *)v2 + 4);
  uint64_t v19 = *((void *)v2 + 5);
  uint64_t v20 = *((void *)v2 + 6);
  long long v28 = *v2;
  LOBYTE(v29) = v16;
  uint64_t v30 = v17;
  uint64_t v31 = v18;
  uint64_t v32 = v19;
  uint64_t v33 = v20;
  sub_24E9FED84();
  sub_24EA061A8();
  sub_24EA06598();
  sub_24EA06018();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E9C74A8(v13, v9, WitnessTable);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v13, v9);
  sub_24E9C74A8(v15, v9, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v22)(v15, v9);
}

uint64_t sub_24E9FF128()
{
  swift_getKeyPath();
  sub_24EA06798();
  swift_release();
  if (v1 == 1) {
    return sub_24EA06198();
  }
  else {
    return sub_24EA06188();
  }
}

uint64_t sub_24E9FF19C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24EA061A8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_24E9FF208()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9FF250()
{
  sub_24E9C79E0();
  swift_release();
  return swift_release();
}

uint64_t sub_24E9FF29C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = a2[3];
  uint64_t v7 = a2[6];
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24E9FF31C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24E9C7B00();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24E9C79E0();
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24E9FF3B0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24E9C79E0();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t sub_24E9FF418(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24E9FF460(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AnotherNavigationSplitView()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E9FF4C4()
{
  return swift_getWitnessTable();
}

unint64_t sub_24E9FF530()
{
  unint64_t result = qword_26991F518[0];
  if (!qword_26991F518[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26991F510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26991F518);
  }
  return result;
}

uint64_t SidebarModalitiesState.selectedItem.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_24EA06CA8();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t SidebarModalitiesState.selectedItem.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 40);
  uint64_t v5 = sub_24EA06CA8();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*SidebarModalitiesState.selectedItem.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SidebarModalitiesState.isSidebarVisible.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 44));
}

uint64_t SidebarModalitiesState.isSidebarVisible.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 44)) = result;
  return result;
}

uint64_t (*SidebarModalitiesState.isSidebarVisible.modify())(void, void, void)
{
  return nullsub_1;
}

uint64_t SidebarModalitiesState.init(locale:modalities:selectedItem:isSidebarVisible:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for SidebarModalitiesState();
  uint64_t v13 = a6 + v12[10];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v13, 1, 1, a5);
  uint64_t v14 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a6, a1, v14);
  uint64_t v15 = a6 + v12[9];
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v16 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a2, v16);
  uint64_t v17 = sub_24EA06CA8();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v13, a3, v17);
  *(unsigned char *)(a6 + v12[11]) = a4;
  return result;
}

uint64_t type metadata accessor for SidebarModalitiesState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E9FF8D4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974696C61646F6DLL && a2 == 0xEA00000000007365 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xEC0000006D657449 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EA155E0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_24E9FFA84(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6974696C61646F6DLL;
      break;
    case 2:
      unint64_t result = 0x64657463656C6573;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x656C61636F6CLL;
      break;
  }
  return result;
}

unint64_t sub_24E9FFB24()
{
  return sub_24E9FFA84(*v0);
}

uint64_t sub_24E9FFB30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E9FF8D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9FFB60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EA02164();
  *a1 = result;
  return result;
}

uint64_t sub_24E9FFB8C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E9FFBE0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t SidebarModalitiesState.encode(to:)(void *a1, uint64_t a2)
{
  v14[3] = a2;
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 + 24);
  v14[1] = *(void *)(a2 + 16);
  v14[2] = v5;
  type metadata accessor for SidebarModalitiesState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v6 = sub_24EA06FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EA070A8();
  char v21 = 0;
  sub_24EA05CD8();
  sub_24E9AC7B8(&qword_26991DF10);
  uint64_t v10 = v15;
  sub_24EA06FE8();
  if (v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v15 = v7;
  v14[0] = v3;
  char v21 = 1;
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_24EA066C8();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v16 = v12;
  uint64_t v17 = v13;
  swift_getWitnessTable();
  sub_24EA06FE8();
  char v21 = 2;
  sub_24EA06FA8();
  char v21 = 3;
  sub_24EA06FC8();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v9, v6);
}

uint64_t type metadata accessor for SidebarModalitiesState.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SidebarModalitiesState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v41 = a4;
  uint64_t v7 = sub_24EA06CA8();
  uint64_t v56 = *(void *)(v7 - 8);
  uint64_t v57 = v7;
  MEMORY[0x270FA5388](v7);
  long long v43 = (char *)&v39 - v8;
  uint64_t v9 = type metadata accessor for SidebarModality();
  uint64_t v10 = sub_24EA06A58();
  uint64_t v51 = v9;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v50 = v10;
  uint64_t v11 = sub_24EA066C8();
  uint64_t v45 = *(void *)(v11 - 8);
  uint64_t v46 = v11;
  MEMORY[0x270FA5388](v11);
  int v44 = (char *)&v39 - v12;
  uint64_t v52 = sub_24EA05CD8();
  uint64_t v47 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v49 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SidebarModalitiesState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v53 = sub_24EA06F88();
  uint64_t v48 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v42 = a3;
  uint64_t v16 = type metadata accessor for SidebarModalitiesState();
  uint64_t v40 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v39 - v18;
  uint64_t v20 = (char *)&v39 + *(int *)(v17 + 40) - v18;
  char v21 = *(void (**)(void))(*(void *)(a2 - 8) + 56);
  uint64_t v55 = v20;
  v21();
  uint64_t v22 = a1[3];
  uint64_t v54 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  long long v23 = v15;
  uint64_t v24 = v58;
  sub_24EA07098();
  if (v24)
  {
    uint64_t v28 = v56;
    uint64_t v27 = v57;
    uint64_t v29 = v55;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v29, v27);
  }
  else
  {
    uint64_t v58 = v19;
    uint64_t v39 = v16;
    char v63 = 0;
    sub_24E9AC7B8(qword_26991DF18);
    uint64_t v25 = v49;
    uint64_t v26 = v52;
    sub_24EA06F68();
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v58, v25, v26);
    char v63 = 1;
    uint64_t v62 = swift_getWitnessTable();
    uint64_t v30 = swift_getWitnessTable();
    uint64_t v61 = swift_getWitnessTable();
    uint64_t v31 = swift_getWitnessTable();
    uint64_t v59 = v30;
    uint64_t v60 = v31;
    uint64_t v32 = v46;
    swift_getWitnessTable();
    uint64_t v33 = v44;
    sub_24EA06F68();
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(&v58[*(int *)(v39 + 36)], v33, v32);
    char v63 = 2;
    uint64_t v34 = v43;
    sub_24EA06F28();
    (*(void (**)(char *, char *, uint64_t))(v56 + 40))(v55, v34, v57);
    char v63 = 3;
    LOBYTE(v25) = sub_24EA06F48();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v23, v53);
    uint64_t v35 = v39;
    long long v36 = v58;
    v58[*(int *)(v39 + 44)] = v25 & 1;
    uint64_t v37 = v40;
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 16))(v41, v36, v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v36, v35);
  }
}

uint64_t sub_24EA00794@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return SidebarModalitiesState.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24EA007B4(void *a1, uint64_t a2)
{
  return SidebarModalitiesState.encode(to:)(a1, a2);
}

uint64_t static SidebarModalitiesState.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = a4;
  uint64_t v62 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v8;
  uint64_t v9 = sub_24EA06CA8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v61 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v48 - v12;
  uint64_t v14 = *(void *)(v9 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v48 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v48 - v21;
  if ((MEMORY[0x2533452D0](a1, a2) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v54 = v17;
  uint64_t v55 = v9;
  uint64_t v57 = v20;
  uint64_t v58 = v22;
  uint64_t v53 = v7;
  uint64_t v59 = TupleTypeMetadata2;
  uint64_t v60 = v14;
  uint64_t v56 = v13;
  uint64_t v23 = v63;
  uint64_t v24 = type metadata accessor for SidebarModalitiesState();
  type metadata accessor for SidebarModality();
  uint64_t v25 = a2;
  sub_24EA06A58();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  if ((sub_24EA066A8() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v26 = *(int *)(v24 + 40);
  uint64_t v49 = a1;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v28 = v58;
  uint64_t v29 = v55;
  v27(v58, a1 + v26, v55);
  uint64_t v30 = *(int *)(v24 + 40);
  uint64_t v50 = v25;
  uint64_t v31 = v25 + v30;
  uint64_t v32 = v57;
  v27(v57, v31, v29);
  uint64_t v33 = v56;
  uint64_t v34 = &v56[*(int *)(v59 + 48)];
  v27(v56, (uint64_t)v28, v29);
  uint64_t v52 = v34;
  v27(v34, (uint64_t)v32, v29);
  uint64_t v35 = v62;
  uint64_t v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48);
  if (v51(v33, 1, v23) == 1)
  {
    long long v36 = *(void (**)(char *, uint64_t))(v60 + 8);
    v36(v32, v29);
    v36(v28, v29);
    if (v51(v52, 1, v23) == 1)
    {
      v36(v33, v29);
LABEL_12:
      char v40 = *(unsigned char *)(v49 + *(int *)(v24 + 44)) ^ *(unsigned char *)(v50 + *(int *)(v24 + 44)) ^ 1;
      return v40 & 1;
    }
    goto LABEL_8;
  }
  uint64_t v48 = v24;
  uint64_t v37 = v54;
  v27(v54, (uint64_t)v33, v29);
  uint64_t v38 = v52;
  if (v51(v52, 1, v23) == 1)
  {
    uint64_t v39 = *(void (**)(char *, uint64_t))(v60 + 8);
    v39(v57, v29);
    v39(v58, v29);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v23);
LABEL_8:
    (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v59);
    goto LABEL_9;
  }
  uint64_t v42 = v35;
  long long v43 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  int v44 = v53;
  v43(v53, v38, v23);
  char v45 = sub_24EA068D8();
  uint64_t v46 = *(void (**)(char *, uint64_t))(v42 + 8);
  v46(v44, v23);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v60 + 8);
  v47(v57, v29);
  v47(v58, v29);
  v46(v37, v23);
  v47(v33, v29);
  uint64_t v24 = v48;
  if (v45) {
    goto LABEL_12;
  }
LABEL_9:
  char v40 = 0;
  return v40 & 1;
}

uint64_t sub_24EA00D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static SidebarModalitiesState.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t sub_24EA00D64()
{
  uint64_t result = sub_24EA05CD8();
  if (v1 <= 0x3F)
  {
    type metadata accessor for SidebarModality();
    sub_24EA06A58();
    swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t result = sub_24EA066C8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_24EA06CA8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void *sub_24EA00EE8(void *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24EA05CD8();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = &a2[v8];
    uint64_t v11 = *(void *)(a3 + 16);
    type metadata accessor for SidebarModality();
    sub_24EA06A58();
    swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t v12 = sub_24EA066C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    uint64_t v13 = *(int *)(a3 + 40);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = &a2[v13];
    uint64_t v16 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(&a2[v13], 1, v11))
    {
      uint64_t v17 = sub_24EA06CA8();
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v15, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v11);
    }
    *((unsigned char *)a1 + *(int *)(a3 + 44)) = a2[*(int *)(a3 + 44)];
  }
  return a1;
}

uint64_t sub_24EA0114C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = *(void *)(a2 + 16);
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v7 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 40);
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v6);
  if (!result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v6);
  }
  return result;
}

uint64_t sub_24EA012DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a3 + 16);
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v11 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a2 + v12, 1, v10))
  {
    uint64_t v16 = sub_24EA06CA8();
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v13, v14, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v10);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_24EA014F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a3 + 16);
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v11 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v8, v9, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = *(void *)(v10 - 8);
  uint64_t v16 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16((const void *)(a1 + v12), 1, v10);
  int v18 = v16(v14, 1, v10);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 24))(v13, v14, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v13, v10);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = sub_24EA06CA8();
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v13, v14, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v10);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_24EA01768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a3 + 16);
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v11 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a2 + v12, 1, v10))
  {
    uint64_t v16 = sub_24EA06CA8();
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v13, v14, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v10);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_24EA0197C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EA05CD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a3 + 16);
  type metadata accessor for SidebarModality();
  sub_24EA06A58();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v11 = sub_24EA066C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v8, v9, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = *(void *)(v10 - 8);
  uint64_t v16 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16((const void *)(a1 + v12), 1, v10);
  int v18 = v16(v14, 1, v10);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 40))(v13, v14, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v13, v10);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = sub_24EA06CA8();
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v13, v14, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v10);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 44)) = *(unsigned char *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_24EA01BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EA01C08);
}

uint64_t sub_24EA01C08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24EA05CD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) != a2)
  {
    type metadata accessor for SidebarModality();
    sub_24EA06A58();
    swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t v10 = sub_24EA066C8();
    if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)(v10 - 8);
      uint64_t v13 = a3[9];
    }
    else
    {
      uint64_t v14 = sub_24EA06CA8();
      if (*(_DWORD *)(*(void *)(v14 - 8) + 84) != a2)
      {
        unsigned int v15 = *(unsigned __int8 *)(a1 + a3[11]);
        BOOL v16 = v15 >= 2;
        int v17 = (v15 + 2147483646) & 0x7FFFFFFF;
        if (v16) {
          return (v17 + 1);
        }
        else {
          return 0;
        }
      }
      uint64_t v11 = v14;
      uint64_t v12 = *(void *)(v14 - 8);
      uint64_t v13 = a3[10];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1 + v13, a2, v11);
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  return v8(a1, a2, v6);
}

uint64_t sub_24EA01E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EA01E18);
}

uint64_t sub_24EA01E18(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_24EA05CD8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) != a3)
  {
    type metadata accessor for SidebarModality();
    sub_24EA06A58();
    swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t v12 = sub_24EA066C8();
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)(v12 - 8);
      uint64_t v15 = a4[9];
    }
    else
    {
      uint64_t result = sub_24EA06CA8();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(unsigned char *)(a1 + a4[11]) = a2 + 1;
        return result;
      }
      uint64_t v13 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[10];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a1 + v15, a2, a2, v13);
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
  return v10(a1, a2, a2, v8);
}

unsigned char *sub_24EA0201C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EA020E8);
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

uint64_t sub_24EA02110()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EA0212C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EA02148()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EA02164()
{
  return 4;
}

uint64_t SidebarFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  return sub_24EA02194(a1, a2, a3, a4, *(void *)(a5 + 16), *(void *)(a5 + 24));
}

uint64_t SidebarFeature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24EA02188(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  return sub_24EA02194(a1, a2, a3, a4, *(void *)(a5 + 16), *(void *)(a5 + 24));
}

uint64_t sub_24EA02194(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v62 = a2;
  uint64_t v63 = a4;
  uint64_t v8 = sub_24EA06CA8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v51 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v11 = (char *)&v47 - v10;
  uint64_t v60 = *(void *)(v8 - 8);
  uint64_t v12 = v60;
  uint64_t v13 = MEMORY[0x270FA5388](v9);
  uint64_t v59 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  int v17 = (char *)&v47 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v47 - v19;
  uint64_t v21 = *(void *)(a5 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v18);
  uint64_t v48 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v47 - v24;
  uint64_t v26 = type metadata accessor for SidebarAction();
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v47 - v27;
  (*(void (**)(char *, char *))(v29 + 16))((char *)&v47 - v27, v63);
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  uint64_t v57 = v21 + 32;
  v56(v25, v28, a5);
  uint64_t v49 = a6;
  uint64_t v30 = type metadata accessor for SidebarState();
  uint64_t v31 = v62;
  *(unsigned char *)(v62 + *(int *)(v30 + 44)) = 0;
  uint64_t v50 = v30;
  uint64_t v54 = (char *)(v31 + *(int *)(v30 + 40));
  uint64_t v55 = v12;
  uint64_t v32 = *(void (**)(char *))(v12 + 16);
  v32(v20);
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  uint64_t v61 = v25;
  v33(v17, v25, a5);
  uint64_t v52 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
  uint64_t v53 = v21 + 56;
  v52(v17, 0, 1, a5);
  uint64_t v34 = &v11[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v58 = v20;
  ((void (*)(char *, char *, uint64_t))v32)(v11, v20, v8);
  ((void (*)(char *, char *, uint64_t))v32)(v34, v17, v8);
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  uint64_t v63 = v11;
  if (v35(v11, 1, a5) == 1)
  {
    long long v36 = v63;
    uint64_t v37 = *(void (**)(char *, uint64_t))(v60 + 8);
    v37(v17, v8);
    v37(v58, v8);
    if (v35(v34, 1, a5) == 1)
    {
      v37(v36, v8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v61, a5);
LABEL_10:
      *(unsigned char *)(v62 + *(int *)(v50 + 48)) = 1;
      return result;
    }
    uint64_t v41 = v36;
    goto LABEL_7;
  }
  uint64_t v39 = v58;
  ((void (*)(char *, char *, uint64_t))v32)(v59, v63, v8);
  char v40 = (void (**)(char *, uint64_t))(v21 + 8);
  if (v35(v34, 1, a5) == 1)
  {
    uint64_t v37 = *(void (**)(char *, uint64_t))(v60 + 8);
    v37(v17, v8);
    v37(v39, v8);
    (*v40)(v59, a5);
    uint64_t v41 = v63;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v41, TupleTypeMetadata2);
    goto LABEL_11;
  }
  uint64_t v42 = v48;
  v56(v48, v34, a5);
  long long v43 = v59;
  char v44 = sub_24EA068D8();
  char v45 = *v40;
  (*v40)(v42, a5);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v60 + 8);
  v37(v17, v8);
  v37(v39, v8);
  v45(v43, a5);
  v37(v63, v8);
  if (v44)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v45)(v61, a5);
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v46 = v54;
  v37(v54, v8);
  v56(v46, v61, a5);
  return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v52)(v46, 0, 1, a5);
}

uint64_t sub_24EA027D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EA027F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EA0280C()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for SidebarFeature()
{
  return __swift_instantiateGenericMetadata();
}

BOOL static SidebarModalityKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SidebarModalityKind.hash(into:)()
{
  return sub_24EA07058();
}

uint64_t sub_24EA02880(char a1)
{
  return *(void *)&aCooldowncore[8 * a1];
}

uint64_t sub_24EA028A0()
{
  return sub_24EA02880(*v0);
}

uint64_t sub_24EA028A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EA057B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EA028D0(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_24EA028DC(uint64_t a1)
{
  unint64_t v2 = sub_24EA03A60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02918(uint64_t a1)
{
  unint64_t v2 = sub_24EA03A60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02954(uint64_t a1)
{
  unint64_t v2 = sub_24EA03E50();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02990(uint64_t a1)
{
  unint64_t v2 = sub_24EA03E50();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA029CC(uint64_t a1)
{
  unint64_t v2 = sub_24EA03DFC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02A08(uint64_t a1)
{
  unint64_t v2 = sub_24EA03DFC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02A44(uint64_t a1)
{
  unint64_t v2 = sub_24EA03DA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02A80(uint64_t a1)
{
  unint64_t v2 = sub_24EA03DA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02ABC(uint64_t a1)
{
  unint64_t v2 = sub_24EA03D54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02AF8(uint64_t a1)
{
  unint64_t v2 = sub_24EA03D54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02B34(uint64_t a1)
{
  unint64_t v2 = sub_24EA03D00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02B70(uint64_t a1)
{
  unint64_t v2 = sub_24EA03D00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02BAC(uint64_t a1)
{
  unint64_t v2 = sub_24EA03CAC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02BE8(uint64_t a1)
{
  unint64_t v2 = sub_24EA03CAC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02C24(uint64_t a1)
{
  unint64_t v2 = sub_24EA03C58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02C60(uint64_t a1)
{
  unint64_t v2 = sub_24EA03C58();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02C9C(uint64_t a1)
{
  unint64_t v2 = sub_24EA03C04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02CD8(uint64_t a1)
{
  unint64_t v2 = sub_24EA03C04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02D14(uint64_t a1)
{
  unint64_t v2 = sub_24EA03BB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02D50(uint64_t a1)
{
  unint64_t v2 = sub_24EA03BB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02D8C(uint64_t a1)
{
  unint64_t v2 = sub_24EA03B5C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02DC8(uint64_t a1)
{
  unint64_t v2 = sub_24EA03B5C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02E04(uint64_t a1)
{
  unint64_t v2 = sub_24EA03B08();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02E40(uint64_t a1)
{
  unint64_t v2 = sub_24EA03B08();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EA02E7C(uint64_t a1)
{
  unint64_t v2 = sub_24EA03AB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EA02EB8(uint64_t a1)
{
  unint64_t v2 = sub_24EA03AB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SidebarModalityKind.hashValue.getter()
{
  return sub_24EA07088();
}

uint64_t SidebarModalityKind.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6A0);
  uint64_t v73 = *(void *)(v4 - 8);
  uint64_t v74 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v72 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6A8);
  uint64_t v70 = *(void *)(v6 - 8);
  uint64_t v71 = v6;
  MEMORY[0x270FA5388](v6);
  long long v69 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6B0);
  uint64_t v67 = *(void *)(v8 - 8);
  uint64_t v68 = v8;
  MEMORY[0x270FA5388](v8);
  long long v66 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6B8);
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v65 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v63 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6C0);
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v62 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v60 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6C8);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v57 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6D0);
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v54 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6D8);
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v51 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6E0);
  uint64_t v49 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v48 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6E8);
  uint64_t v46 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  char v45 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6F0);
  uint64_t v44 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F6F8);
  uint64_t v43 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v43 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F700);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v76 = v25;
  uint64_t v77 = v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EA03A60();
  uint64_t v75 = v28;
  sub_24EA070A8();
  switch(v29)
  {
    case 1:
      char v79 = 1;
      sub_24EA03DFC();
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v19);
      goto LABEL_15;
    case 2:
      char v80 = 2;
      sub_24EA03DA8();
      uint64_t v35 = v45;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v35, v47);
      goto LABEL_15;
    case 3:
      char v81 = 3;
      sub_24EA03D54();
      long long v36 = v48;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v36, v50);
      goto LABEL_15;
    case 4:
      char v82 = 4;
      sub_24EA03D00();
      uint64_t v37 = v51;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v53);
      goto LABEL_15;
    case 5:
      char v83 = 5;
      sub_24EA03CAC();
      uint64_t v38 = v54;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v56);
      goto LABEL_15;
    case 6:
      char v84 = 6;
      sub_24EA03C58();
      uint64_t v39 = v57;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v59);
      goto LABEL_15;
    case 7:
      char v85 = 7;
      sub_24EA03C04();
      char v40 = v60;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      uint64_t v42 = v61;
      uint64_t v41 = v62;
      goto LABEL_14;
    case 8:
      char v86 = 8;
      sub_24EA03BB0();
      char v40 = v63;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      uint64_t v42 = v64;
      uint64_t v41 = v65;
      goto LABEL_14;
    case 9:
      char v87 = 9;
      sub_24EA03B5C();
      char v40 = v66;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      uint64_t v42 = v67;
      uint64_t v41 = v68;
      goto LABEL_14;
    case 10:
      char v88 = 10;
      sub_24EA03B08();
      char v40 = v69;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      uint64_t v42 = v70;
      uint64_t v41 = v71;
      goto LABEL_14;
    case 11:
      char v89 = 11;
      sub_24EA03AB4();
      char v40 = v72;
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      sub_24EA06F98();
      uint64_t v42 = v73;
      uint64_t v41 = v74;
LABEL_14:
      (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
LABEL_15:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v34, v33);
      break;
    default:
      char v78 = 0;
      sub_24EA03E50();
      uint64_t v30 = v75;
      uint64_t v31 = v76;
      sub_24EA06F98();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v22);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v30, v31);
      break;
  }
  return result;
}

unint64_t sub_24EA03A60()
{
  unint64_t result = qword_26991F708;
  if (!qword_26991F708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F708);
  }
  return result;
}

unint64_t sub_24EA03AB4()
{
  unint64_t result = qword_26991F710;
  if (!qword_26991F710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F710);
  }
  return result;
}

unint64_t sub_24EA03B08()
{
  unint64_t result = qword_26991F718;
  if (!qword_26991F718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F718);
  }
  return result;
}

unint64_t sub_24EA03B5C()
{
  unint64_t result = qword_26991F720;
  if (!qword_26991F720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F720);
  }
  return result;
}

unint64_t sub_24EA03BB0()
{
  unint64_t result = qword_26991F728;
  if (!qword_26991F728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F728);
  }
  return result;
}

unint64_t sub_24EA03C04()
{
  unint64_t result = qword_26991F730;
  if (!qword_26991F730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F730);
  }
  return result;
}

unint64_t sub_24EA03C58()
{
  unint64_t result = qword_26991F738;
  if (!qword_26991F738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F738);
  }
  return result;
}

unint64_t sub_24EA03CAC()
{
  unint64_t result = qword_26991F740;
  if (!qword_26991F740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F740);
  }
  return result;
}

unint64_t sub_24EA03D00()
{
  unint64_t result = qword_26991F748;
  if (!qword_26991F748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F748);
  }
  return result;
}

unint64_t sub_24EA03D54()
{
  unint64_t result = qword_26991F750;
  if (!qword_26991F750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F750);
  }
  return result;
}

unint64_t sub_24EA03DA8()
{
  unint64_t result = qword_26991F758;
  if (!qword_26991F758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F758);
  }
  return result;
}

unint64_t sub_24EA03DFC()
{
  unint64_t result = qword_26991F760;
  if (!qword_26991F760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F760);
  }
  return result;
}

unint64_t sub_24EA03E50()
{
  unint64_t result = qword_26991F768;
  if (!qword_26991F768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F768);
  }
  return result;
}

uint64_t SidebarModalityKind.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  char v82 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F770);
  uint64_t v73 = *(void *)(v3 - 8);
  uint64_t v74 = v3;
  MEMORY[0x270FA5388](v3);
  char v85 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F778);
  uint64_t v71 = *(void *)(v5 - 8);
  uint64_t v72 = v5;
  MEMORY[0x270FA5388](v5);
  char v81 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F780);
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  MEMORY[0x270FA5388](v7);
  char v80 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F788);
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  char v79 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F790);
  uint64_t v67 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  char v78 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F798);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v75 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7A0);
  uint64_t v64 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  char v84 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7A8);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  char v83 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7B0);
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v77 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7B8);
  uint64_t v57 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v76 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7C0);
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7C8);
  uint64_t v54 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26991F7D0);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  char v86 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_24EA03A60();
  uint64_t v26 = v87;
  sub_24EA07098();
  if (v26) {
    goto LABEL_6;
  }
  uint64_t v51 = v20;
  uint64_t v50 = v18;
  uint64_t v27 = v83;
  uint64_t v28 = v84;
  uint64_t v29 = v85;
  uint64_t v87 = v22;
  uint64_t v30 = v24;
  uint64_t v31 = sub_24EA06F78();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v37 = sub_24EA06DC8();
    swift_allocError();
    uint64_t v39 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26991DE98);
    *uint64_t v39 = &type metadata for SidebarModalityKind;
    sub_24EA06F18();
    sub_24EA06DB8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v30, v21);
LABEL_6:
    uint64_t v40 = (uint64_t)v86;
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
  char v32 = *(unsigned char *)(v31 + 32);
  switch(v32)
  {
    case 1:
      v88[5] = 1;
      sub_24EA03DFC();
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v55 + 8);
      uint64_t v35 = v17;
      long long v36 = (char **)v88;
      goto LABEL_16;
    case 2:
      v88[6] = 2;
      sub_24EA03DA8();
      uint64_t v42 = v76;
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v57 + 8);
      uint64_t v35 = v42;
      long long v36 = (char **)&v89;
      goto LABEL_16;
    case 3:
      v88[7] = 3;
      sub_24EA03D54();
      uint64_t v43 = v77;
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v59 + 8);
      uint64_t v35 = v43;
      long long v36 = (char **)&v98;
      goto LABEL_16;
    case 4:
      char v90 = 4;
      sub_24EA03D00();
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v61 + 8);
      uint64_t v35 = v27;
      long long v36 = (char **)&v99;
      goto LABEL_16;
    case 5:
      char v91 = 5;
      sub_24EA03CAC();
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v64 + 8);
      uint64_t v35 = v28;
      long long v36 = (char **)&v100;
      goto LABEL_16;
    case 6:
      char v92 = 6;
      sub_24EA03C58();
      uint64_t v44 = v75;
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v65 + 8);
      uint64_t v35 = v44;
      long long v36 = (char **)&v101;
      goto LABEL_16;
    case 7:
      char v93 = 7;
      sub_24EA03C04();
      char v45 = v78;
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v68);
      goto LABEL_21;
    case 8:
      char v94 = 8;
      sub_24EA03BB0();
      uint64_t v46 = v79;
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v52 + 8);
      uint64_t v35 = v46;
      long long v36 = &v85;
      goto LABEL_16;
    case 9:
      char v95 = 9;
      sub_24EA03B5C();
      uint64_t v48 = v80;
      sub_24EA06F08();
      uint64_t v49 = v69;
      uint64_t v47 = v70;
      goto LABEL_19;
    case 10:
      char v96 = 10;
      sub_24EA03B08();
      uint64_t v48 = v81;
      sub_24EA06F08();
      uint64_t v49 = v71;
      uint64_t v47 = v72;
LABEL_19:
      uint64_t v34 = *(void (**)(char *, uint64_t))(v49 + 8);
      uint64_t v35 = v48;
      goto LABEL_20;
    case 11:
      char v97 = 11;
      sub_24EA03AB4();
      sub_24EA06F08();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v29, v74);
      goto LABEL_21;
    default:
      v88[4] = 0;
      sub_24EA03E50();
      uint64_t v33 = v51;
      sub_24EA06F08();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v54 + 8);
      uint64_t v35 = v33;
      long long v36 = &v82;
LABEL_16:
      uint64_t v47 = (uint64_t)*(v36 - 32);
LABEL_20:
      v34(v35, v47);
LABEL_21:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v30, v21);
      uint64_t v40 = (uint64_t)v86;
      *char v82 = v32;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v40);
}

unint64_t sub_24EA04B78()
{
  unint64_t result = qword_26991F7D8;
  if (!qword_26991F7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F7D8);
  }
  return result;
}

uint64_t sub_24EA04BCC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SidebarModalityKind.init(from:)(a1, a2);
}

uint64_t sub_24EA04BE4(void *a1)
{
  return SidebarModalityKind.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SidebarModalityKind()
{
  return &type metadata for SidebarModalityKind;
}

uint64_t _s14FitnessAppRoot19SidebarModalityKindOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14FitnessAppRoot19SidebarModalityKindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x24EA04D70);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CodingKeys()
{
  return &type metadata for SidebarModalityKind.CodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CooldownCodingKeys()
{
  return &type metadata for SidebarModalityKind.CooldownCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CoreCodingKeys()
{
  return &type metadata for SidebarModalityKind.CoreCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.CyclingCodingKeys()
{
  return &type metadata for SidebarModalityKind.CyclingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.DanceCodingKeys()
{
  return &type metadata for SidebarModalityKind.DanceCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.HiitCodingKeys()
{
  return &type metadata for SidebarModalityKind.HiitCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.KickboxingCodingKeys()
{
  return &type metadata for SidebarModalityKind.KickboxingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.MeditationCodingKeys()
{
  return &type metadata for SidebarModalityKind.MeditationCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.PilatesCodingKeys()
{
  return &type metadata for SidebarModalityKind.PilatesCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.RowingCodingKeys()
{
  return &type metadata for SidebarModalityKind.RowingCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.StrengthCodingKeys()
{
  return &type metadata for SidebarModalityKind.StrengthCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.TreadmillCodingKeys()
{
  return &type metadata for SidebarModalityKind.TreadmillCodingKeys;
}

ValueMetadata *type metadata accessor for SidebarModalityKind.YogaCodingKeys()
{
  return &type metadata for SidebarModalityKind.YogaCodingKeys;
}

unint64_t sub_24EA04E6C()
{
  unint64_t result = qword_26991F7E0;
  if (!qword_26991F7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F7E0);
  }
  return result;
}

unint64_t sub_24EA04EC4()
{
  unint64_t result = qword_26991F7E8;
  if (!qword_26991F7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F7E8);
  }
  return result;
}

unint64_t sub_24EA04F1C()
{
  unint64_t result = qword_26991F7F0;
  if (!qword_26991F7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F7F0);
  }
  return result;
}

unint64_t sub_24EA04F74()
{
  unint64_t result = qword_26991F7F8;
  if (!qword_26991F7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F7F8);
  }
  return result;
}

unint64_t sub_24EA04FCC()
{
  unint64_t result = qword_26991F800;
  if (!qword_26991F800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F800);
  }
  return result;
}

unint64_t sub_24EA05024()
{
  unint64_t result = qword_26991F808;
  if (!qword_26991F808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F808);
  }
  return result;
}

unint64_t sub_24EA0507C()
{
  unint64_t result = qword_26991F810;
  if (!qword_26991F810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F810);
  }
  return result;
}

unint64_t sub_24EA050D4()
{
  unint64_t result = qword_26991F818;
  if (!qword_26991F818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F818);
  }
  return result;
}

unint64_t sub_24EA0512C()
{
  unint64_t result = qword_26991F820;
  if (!qword_26991F820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F820);
  }
  return result;
}

unint64_t sub_24EA05184()
{
  unint64_t result = qword_26991F828;
  if (!qword_26991F828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F828);
  }
  return result;
}

unint64_t sub_24EA051DC()
{
  unint64_t result = qword_26991F830;
  if (!qword_26991F830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F830);
  }
  return result;
}

unint64_t sub_24EA05234()
{
  unint64_t result = qword_26991F838;
  if (!qword_26991F838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F838);
  }
  return result;
}

unint64_t sub_24EA0528C()
{
  unint64_t result = qword_26991F840;
  if (!qword_26991F840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F840);
  }
  return result;
}

unint64_t sub_24EA052E4()
{
  unint64_t result = qword_26991F848;
  if (!qword_26991F848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F848);
  }
  return result;
}

unint64_t sub_24EA0533C()
{
  unint64_t result = qword_26991F850;
  if (!qword_26991F850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F850);
  }
  return result;
}

unint64_t sub_24EA05394()
{
  unint64_t result = qword_26991F858;
  if (!qword_26991F858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F858);
  }
  return result;
}

unint64_t sub_24EA053EC()
{
  unint64_t result = qword_26991F860;
  if (!qword_26991F860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F860);
  }
  return result;
}

unint64_t sub_24EA05444()
{
  unint64_t result = qword_26991F868;
  if (!qword_26991F868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F868);
  }
  return result;
}

unint64_t sub_24EA0549C()
{
  unint64_t result = qword_26991F870;
  if (!qword_26991F870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F870);
  }
  return result;
}

unint64_t sub_24EA054F4()
{
  unint64_t result = qword_26991F878;
  if (!qword_26991F878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F878);
  }
  return result;
}

unint64_t sub_24EA0554C()
{
  unint64_t result = qword_26991F880;
  if (!qword_26991F880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F880);
  }
  return result;
}

unint64_t sub_24EA055A4()
{
  unint64_t result = qword_26991F888;
  if (!qword_26991F888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F888);
  }
  return result;
}

unint64_t sub_24EA055FC()
{
  unint64_t result = qword_26991F890;
  if (!qword_26991F890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F890);
  }
  return result;
}

unint64_t sub_24EA05654()
{
  unint64_t result = qword_26991F898;
  if (!qword_26991F898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F898);
  }
  return result;
}

unint64_t sub_24EA056AC()
{
  unint64_t result = qword_26991F8A0;
  if (!qword_26991F8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F8A0);
  }
  return result;
}

unint64_t sub_24EA05704()
{
  unint64_t result = qword_26991F8A8;
  if (!qword_26991F8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F8A8);
  }
  return result;
}

unint64_t sub_24EA0575C()
{
  unint64_t result = qword_26991F8B0;
  if (!qword_26991F8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26991F8B0);
  }
  return result;
}

uint64_t sub_24EA057B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F646C6F6F63 && a2 == 0xE800000000000000;
  if (v3 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701998435 && a2 == 0xE400000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696C637963 && a2 == 0xE700000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65636E6164 && a2 == 0xE500000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953065320 && a2 == 0xE400000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x69786F626B63696BLL && a2 == 0xEA0000000000676ELL || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x697461746964656DLL && a2 == 0xEA00000000006E6FLL || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x736574616C6970 && a2 == 0xE700000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x676E69776F72 && a2 == 0xE600000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6874676E65727473 && a2 == 0xE800000000000000 || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6C696D6461657274 && a2 == 0xE90000000000006CLL || (sub_24EA07028() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 1634168697 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_24EA07028();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_24EA05C28()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24EA05C38()
{
  return MEMORY[0x270EEF3D0]();
}

uint64_t sub_24EA05C48()
{
  return MEMORY[0x270EEF3D8]();
}

uint64_t sub_24EA05C58()
{
  return MEMORY[0x270EEF408]();
}

uint64_t sub_24EA05C68()
{
  return MEMORY[0x270EEF448]();
}

uint64_t sub_24EA05C78()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_24EA05C88()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24EA05C98()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24EA05CB8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24EA05CC8()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24EA05CD8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24EA05CE8()
{
  return MEMORY[0x270F2B258]();
}

uint64_t sub_24EA05CF8()
{
  return MEMORY[0x270F2B268]();
}

uint64_t sub_24EA05D08()
{
  return MEMORY[0x270F2B270]();
}

uint64_t sub_24EA05D18()
{
  return MEMORY[0x270F2B280]();
}

uint64_t sub_24EA05D28()
{
  return MEMORY[0x270F2B298]();
}

uint64_t sub_24EA05D38()
{
  return MEMORY[0x270F2B2A0]();
}

uint64_t sub_24EA05D48()
{
  return MEMORY[0x270F2B2A8]();
}

uint64_t sub_24EA05D58()
{
  return MEMORY[0x270F2B2B0]();
}

uint64_t sub_24EA05D68()
{
  return MEMORY[0x270F2B2B8]();
}

uint64_t sub_24EA05D78()
{
  return MEMORY[0x270F2B2C0]();
}

uint64_t sub_24EA05D88()
{
  return MEMORY[0x270F2B358]();
}

uint64_t sub_24EA05D98()
{
  return MEMORY[0x270F2B360]();
}

uint64_t sub_24EA05DA8()
{
  return MEMORY[0x270F2B368]();
}

uint64_t sub_24EA05DB8()
{
  return MEMORY[0x270F5EA30]();
}

uint64_t sub_24EA05DC8()
{
  return MEMORY[0x270F2CE90]();
}

uint64_t sub_24EA05DD8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24EA05DE8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24EA05DF8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24EA05E08()
{
  return MEMORY[0x270F81A20]();
}

uint64_t sub_24EA05E18()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_24EA05E28()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_24EA05E38()
{
  return MEMORY[0x270EFED60]();
}

uint64_t sub_24EA05E48()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_24EA05E58()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_24EA05E68()
{
  return MEMORY[0x270EFED78]();
}

uint64_t sub_24EA05E78()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_24EA05E98()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24EA05EA8()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_24EA05EB8()
{
  return MEMORY[0x270EFF180]();
}

uint64_t sub_24EA05EC8()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_24EA05ED8()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24EA05EE8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24EA05EF8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24EA05F08()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24EA05F18()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_24EA05F28()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_24EA05F38()
{
  return MEMORY[0x270EFFCB0]();
}

uint64_t sub_24EA05F48()
{
  return MEMORY[0x270EFFCD8]();
}

uint64_t sub_24EA05F58()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_24EA05F68()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24EA05F78()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_24EA05F88()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_24EA05F98()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24EA05FA8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24EA05FB8()
{
  return MEMORY[0x270F00E70]();
}

uint64_t sub_24EA05FC8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24EA05FD8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24EA05FE8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24EA05FF8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24EA06008()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24EA06018()
{
  return MEMORY[0x270F01570]();
}

uint64_t sub_24EA06028()
{
  return MEMORY[0x270F01588]();
}

uint64_t sub_24EA06038()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_24EA06048()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_24EA06058()
{
  return MEMORY[0x270F01640]();
}

uint64_t sub_24EA06068()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_24EA06078()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24EA06088()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24EA06098()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24EA060A8()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_24EA060B8()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_24EA060C8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_24EA060D8()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_24EA060E8()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_24EA060F8()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24EA06108()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_24EA06118()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24EA06128()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_24EA06138()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_24EA06148()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_24EA06158()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_24EA06168()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24EA06178()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24EA06188()
{
  return MEMORY[0x270F02630]();
}

uint64_t sub_24EA06198()
{
  return MEMORY[0x270F02640]();
}

uint64_t sub_24EA061A8()
{
  return MEMORY[0x270F02650]();
}

uint64_t sub_24EA061B8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24EA061C8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24EA061D8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24EA061F8()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24EA06208()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24EA06218()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24EA06238()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24EA06248()
{
  return MEMORY[0x270F02740]();
}

uint64_t sub_24EA06258()
{
  return MEMORY[0x270F02748]();
}

uint64_t sub_24EA06268()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24EA06278()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24EA06288()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24EA06298()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24EA062A8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24EA062B8()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24EA062C8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24EA062D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24EA062E8()
{
  return MEMORY[0x270F2B458]();
}

uint64_t sub_24EA062F8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24EA06308()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24EA06318()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24EA06328()
{
  return MEMORY[0x270F033E8]();
}

uint64_t sub_24EA06338()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24EA06348()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_24EA06358()
{
  return MEMORY[0x270F03598]();
}

uint64_t sub_24EA06368()
{
  return MEMORY[0x270F036A8]();
}

uint64_t sub_24EA06378()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24EA06388()
{
  return MEMORY[0x270F03AC8]();
}

uint64_t sub_24EA06398()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_24EA063A8()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_24EA063B8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_24EA063C8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_24EA063D8()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24EA063E8()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24EA063F8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24EA06408()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24EA06418()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24EA06428()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24EA06438()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24EA06448()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24EA06458()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24EA06468()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24EA06478()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24EA06488()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24EA06498()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24EA064A8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24EA064B8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24EA064C8()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24EA064D8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24EA064E8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24EA064F8()
{
  return MEMORY[0x270F04788]();
}

uint64_t sub_24EA06508()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24EA06518()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24EA06528()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24EA06538()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24EA06548()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_24EA06558()
{
  return MEMORY[0x270F04A68]();
}

uint64_t sub_24EA06568()
{
  return MEMORY[0x270F04AA0]();
}

uint64_t sub_24EA06578()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24EA06588()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24EA06598()
{
  return MEMORY[0x270F25280]();
}

uint64_t sub_24EA065A8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_24EA065B8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24EA065C8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24EA065D8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_24EA065E8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24EA065F8()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_24EA06608()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_24EA06618()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24EA06628()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_24EA06638()
{
  return MEMORY[0x270F05128]();
}

uint64_t sub_24EA06648()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_24EA06658()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24EA06668()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24EA06678()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_24EA06688()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_24EA06698()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24EA066A8()
{
  return MEMORY[0x270F25288]();
}

uint64_t sub_24EA066B8()
{
  return MEMORY[0x270F252A0]();
}

uint64_t sub_24EA066C8()
{
  return MEMORY[0x270F252B0]();
}

uint64_t sub_24EA066D8()
{
  return MEMORY[0x270F252C0]();
}

uint64_t sub_24EA066F8()
{
  return MEMORY[0x270F252E0]();
}

uint64_t sub_24EA06708()
{
  return MEMORY[0x270F252E8]();
}

uint64_t sub_24EA06718()
{
  return MEMORY[0x270F252F0]();
}

uint64_t sub_24EA06728()
{
  return MEMORY[0x270F252F8]();
}

uint64_t sub_24EA06738()
{
  return MEMORY[0x270F25300]();
}

uint64_t sub_24EA06748()
{
  return MEMORY[0x270F25308]();
}

uint64_t sub_24EA06758()
{
  return MEMORY[0x270F25340]();
}

uint64_t sub_24EA06768()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24EA06778()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24EA06788()
{
  return MEMORY[0x270F253A8]();
}

uint64_t sub_24EA06798()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24EA067A8()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24EA067B8()
{
  return MEMORY[0x270F253D0]();
}

uint64_t sub_24EA067C8()
{
  return MEMORY[0x270F253E8]();
}

uint64_t sub_24EA067D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24EA067E8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24EA067F8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24EA06808()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24EA06818()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24EA06828()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24EA06838()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24EA06848()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24EA06858()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24EA06868()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24EA06878()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24EA06888()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24EA06898()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24EA068A8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EA068B8()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24EA068C8()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_24EA068D8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24EA068E8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24EA068F8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24EA06908()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24EA06918()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24EA06928()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24EA06938()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24EA06948()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24EA06958()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24EA06968()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EA06978()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24EA06988()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24EA06998()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_24EA069A8()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_24EA069B8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24EA069C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24EA069D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24EA069E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24EA069F8()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24EA06A08()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24EA06A18()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24EA06A28()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24EA06A38()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24EA06A48()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24EA06A58()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24EA06A68()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_24EA06A78()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_24EA06A88()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_24EA06A98()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EA06AB8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EA06AC8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EA06AD8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24EA06AE8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24EA06B08()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24EA06B18()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24EA06B28()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24EA06B38()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24EA06B48()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_24EA06B58()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_24EA06B68()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24EA06B78()
{
  return MEMORY[0x270FA2BA8]();
}

uint64_t sub_24EA06B88()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24EA06B98()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24EA06BA8()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24EA06BB8()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_24EA06BC8()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24EA06BD8()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_24EA06BE8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24EA06BF8()
{
  return MEMORY[0x270F9E320]();
}

uint64_t sub_24EA06C08()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24EA06C18()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24EA06C28()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24EA06C38()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24EA06C48()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24EA06C58()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24EA06C68()
{
  return MEMORY[0x270F825A0]();
}

uint64_t sub_24EA06C78()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24EA06C88()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24EA06C98()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_24EA06CA8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24EA06CB8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24EA06CC8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24EA06CD8()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24EA06CE8()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24EA06CF8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24EA06D08()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_24EA06D18()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_24EA06D28()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_24EA06D38()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_24EA06D48()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_24EA06D58()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_24EA06D68()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24EA06D78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24EA06D88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24EA06D98()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_24EA06DA8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24EA06DB8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EA06DC8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EA06DD8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24EA06DE8()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_24EA06DF8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24EA06E08()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24EA06E18()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24EA06E28()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24EA06E38()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24EA06E48()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24EA06E58()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24EA06E68()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24EA06E78()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24EA06E88()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24EA06E98()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24EA06EA8()
{
  return MEMORY[0x270F9F0F8]();
}

uint64_t sub_24EA06EB8()
{
  return MEMORY[0x270F9F108]();
}

uint64_t sub_24EA06EC8()
{
  return MEMORY[0x270F9F118]();
}

uint64_t sub_24EA06ED8()
{
  return MEMORY[0x270F9F120]();
}

uint64_t sub_24EA06EF8()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_24EA06F08()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EA06F18()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EA06F28()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24EA06F38()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EA06F48()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EA06F58()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24EA06F68()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EA06F78()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EA06F88()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24EA06F98()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EA06FA8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24EA06FB8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EA06FC8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EA06FD8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24EA06FE8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EA06FF8()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24EA07008()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24EA07018()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24EA07028()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EA07038()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24EA07048()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EA07058()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EA07068()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24EA07078()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24EA07088()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EA07098()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EA070A8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24EA070B8()
{
  return MEMORY[0x270F9FDD0]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x270F961A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}