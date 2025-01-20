uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t static AsyncStateValue.== infix(_:_:)(uint64_t a1, char *a2, uint64_t a3)
{
  v45 = a2;
  uint64_t v42 = *(void *)(a3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  v39 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v40 = v7;
  v41 = (char *)&v38 - v8;
  uint64_t v9 = type metadata accessor for AsyncStateValue();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v38 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v44 = *(char **)(TupleTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v19 = (char *)&v38 - v18;
  v20 = (char *)&v38 + *(int *)(v17 + 48) - v18;
  uint64_t v43 = v10;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21((char *)&v38 - v18, a1, v9);
  v21(v20, (uint64_t)v45, v9);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v21(v13, (uint64_t)v19, v9);
      uint64_t v22 = sub_24C94A340();
      uint64_t v23 = *(int *)(swift_getTupleTypeMetadata2() + 48);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v45 = &v20[v23];
        uint64_t v24 = v42;
        v25 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
        v25(v41, v13, a3);
        v44 = &v13[v23];
        v26 = v39;
        v25(v39, v20, a3);
        v27 = v41;
        char v28 = sub_24C94A580();
        v29 = *(void (**)(char *, uint64_t))(v24 + 8);
        v29(v26, a3);
        v29(v27, a3);
        v30 = *(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8);
        v30(v45, v22);
        v30(v44, v22);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(&v13[v23], v22);
      goto LABEL_13;
    case 2u:
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_14;
      }
      v31 = *(void (**)(char *, uint64_t))(v43 + 8);
      v31(v20, v9);
      v31(v19, v9);
      char v28 = 1;
      return v28 & 1;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_14;
      }
      goto LABEL_11;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_14;
      }
LABEL_11:
      (*(void (**)(char *, uint64_t))(v43 + 8))(v19, v9);
      char v28 = 1;
      break;
    default:
      v21(v15, (uint64_t)v19, v9);
      if (swift_getEnumCaseMultiPayload())
      {
        v13 = v15;
LABEL_13:
        (*(void (**)(char *, uint64_t))(v42 + 8))(v13, a3);
LABEL_14:
        (*((void (**)(char *, uint64_t))v44 + 1))(v19, TupleTypeMetadata2);
        char v28 = 0;
      }
      else
      {
        v33 = v41;
        uint64_t v32 = v42;
        v34 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
        v34(v41, v15, a3);
        v35 = v39;
        v34(v39, v20, a3);
        char v28 = sub_24C94A580();
        v36 = *(void (**)(char *, uint64_t))(v32 + 8);
        v36(v35, a3);
        v36(v33, a3);
LABEL_16:
        (*(void (**)(char *, uint64_t))(v43 + 8))(v19, v9);
      }
      break;
  }
  return v28 & 1;
}

uint64_t type metadata accessor for AsyncStateValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncStateValue.to<A>(transform:)@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v29 = a2;
  v30 = a1;
  uint64_t v9 = sub_24C94A340();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v11);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v20, v6, a3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v22 = &v20[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
      char v28 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v28(v13, v22, v9);
      uint64_t v23 = (char *)(a6 + *(int *)(swift_getTupleTypeMetadata2() + 48));
      v30(v18);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      v28(v23, v13, v9);
      type metadata accessor for AsyncStateValue();
      break;
    case 2u:
      uint64_t v24 = *((void *)v20 + 1);
      uint64_t v25 = *((void *)v20 + 4);
      *(void *)a6 = *(void *)v20;
      *(void *)(a6 + 8) = v24;
      *(_OWORD *)(a6 + 16) = *((_OWORD *)v20 + 1);
      *(void *)(a6 + 32) = v25;
      type metadata accessor for AsyncStateValue();
      break;
    case 3u:
    case 4u:
      type metadata accessor for AsyncStateValue();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
      v30(v18);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      type metadata accessor for AsyncStateValue();
      break;
  }
  return swift_storeEnumTagMultiPayload();
}

BOOL sub_24C91E8C0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24C91E8D0()
{
  return sub_24C94AB50();
}

uint64_t sub_24C91E8F8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6968736572666572 && a2 == 0xEA0000000000676ELL || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24C91EAE8(char a1)
{
  return *(void *)&aNone_2[8 * a1];
}

BOOL sub_24C91EB08(char *a1, char *a2)
{
  return sub_24C91E8C0(*a1, *a2);
}

uint64_t sub_24C91EB1C()
{
  return sub_24C91EDD8();
}

uint64_t sub_24C91EB3C()
{
  return sub_24C91E8D0();
}

uint64_t sub_24C91EB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C91F040(a1, a2, a3, (void (*)(unsigned char *, void, void, void))sub_24C91E8D0);
}

uint64_t sub_24C91EB60()
{
  return sub_24C91EAE8(*v0);
}

uint64_t sub_24C91EB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C91E8F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C91EB9C()
{
  return 0;
}

uint64_t sub_24C91EBA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C92347C();
  *a1 = result;
  return result;
}

uint64_t sub_24C91EBD4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91EC28(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91EC7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D6F44726F727265 && a2 == 0xEB000000006E6961;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024C94D320)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24C91EDD8()
{
  return sub_24C94AB70();
}

uint64_t sub_24C91EE20(char a1)
{
  if (!a1) {
    return 0x6D6F44726F727265;
  }
  if (a1 == 1) {
    return 0x646F43726F727265;
  }
  return 0xD000000000000014;
}

uint64_t sub_24C91EE88(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746C75736572 && a2 == 0xE600000000000000;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24C91EF5C(char a1)
{
  if (a1) {
    return 1702125924;
  }
  else {
    return 0x746C75736572;
  }
}

uint64_t sub_24C91EF88(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73756F6976657270 && a2 == 0xEE00746C75736552)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24C91F028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C91F040(a1, a2, a3, (void (*)(unsigned char *, void, void, void))sub_24C928888);
}

uint64_t sub_24C91F040(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void))
{
  sub_24C94AB40();
  a4(v8, *v4, *(void *)(a2 + 16), *(void *)(a2 + 24));
  return sub_24C94AB70();
}

uint64_t sub_24C91F098()
{
  return sub_24C91EE20(*v0);
}

uint64_t sub_24C91F0A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C91EC7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C91F0D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C923484();
  *a1 = result;
  return result;
}

uint64_t sub_24C91F100(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91F154(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91F1A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C91FA64(a1, a2, a3, (void (*)(unsigned char *, void, void, void))sub_24C928878);
}

uint64_t sub_24C91F1C0()
{
  return sub_24C91EF5C(*v0);
}

uint64_t sub_24C91F1D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C91EE88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C91F200(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91F254(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91F2A8()
{
  return 0;
}

uint64_t sub_24C91F2B4@<X0>(uint64_t a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24C91F374(a1, (uint64_t (*)(void, void))sub_24C91F498, a2);
}

uint64_t sub_24C91F2CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91F320(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91F374@<X0>(uint64_t a1@<X2>, uint64_t (*a2)(void, void)@<X4>, unsigned char *a3@<X8>)
{
  char v4 = a2(*(void *)(a1 + 16), *(void *)(a1 + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_24C91F3C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C91F498();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24C91F3F0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91F444(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91F498()
{
  return 1;
}

uint64_t sub_24C91F4A0()
{
  return sub_24C94AB70();
}

uint64_t sub_24C91F4E4()
{
  return sub_24C94AB50();
}

uint64_t sub_24C91F50C()
{
  return sub_24C94AB70();
}

uint64_t sub_24C91F550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C91EF88(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24C91F584(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91F5D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C91F62C(uint64_t a1, char *a2, uint64_t a3)
{
  return static AsyncStateValue.== infix(_:_:)(a1, a2, *(void *)(a3 + 16));
}

uint64_t AsyncState.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AsyncStateValue();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

double AsyncState.ttl.getter(uint64_t a1)
{
  return *(double *)(v1 + *(int *)(a1 + 36));
}

uint64_t AsyncState.init(value:ttl:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = type metadata accessor for AsyncStateValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  uint64_t result = type metadata accessor for AsyncState();
  *(double *)(a2 + *(int *)(result + 36)) = a3;
  return result;
}

uint64_t type metadata accessor for AsyncState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncState.init(ttl:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v4 = type metadata accessor for AsyncStateValue();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - v5;
  swift_storeEnumTagMultiPayload();
  return AsyncState.init(value:ttl:)((uint64_t)v6, a1, a2);
}

uint64_t AsyncState.init()@<X0>(uint64_t a1@<X8>)
{
  return AsyncState.init(ttl:)(a1, 1.79769313e308);
}

BOOL static AsyncState.== infix(_:_:)(uint64_t a1, char *a2, uint64_t a3)
{
  if ((static AsyncStateValue.== infix(_:_:)(a1, a2, a3) & 1) == 0) {
    return 0;
  }
  uint64_t v5 = type metadata accessor for AsyncState();
  return *(double *)(a1 + *(int *)(v5 + 36)) == *(double *)&a2[*(int *)(v5 + 36)];
}

BOOL sub_24C91F884(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24C91F894()
{
  return sub_24C94AB50();
}

uint64_t sub_24C91F8BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107700 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24C91F990()
{
  return sub_24C94AB70();
}

uint64_t sub_24C91F9D8(char a1)
{
  if (a1) {
    return 7107700;
  }
  else {
    return 0x65756C6176;
  }
}

BOOL sub_24C91FA04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24C91F884(*a1, *a2);
}

uint64_t sub_24C91FA18()
{
  return sub_24C91F990();
}

uint64_t sub_24C91FA3C()
{
  return sub_24C91F894();
}

uint64_t sub_24C91FA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C91FA64(a1, a2, a3, (void (*)(unsigned char *, void, void, void))sub_24C91F894);
}

uint64_t sub_24C91FA64(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void))
{
  sub_24C94AB40();
  a4(v8, *v4, *(void *)(a2 + 16), *(void *)(a2 + 24));
  return sub_24C94AB70();
}

uint64_t sub_24C91FABC()
{
  return sub_24C91F9D8(*v0);
}

uint64_t sub_24C91FACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C91F8BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C91FAFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C9234B0();
  *a1 = result;
  return result;
}

uint64_t sub_24C91FB28(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C91FB7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

BOOL sub_24C91FBD0(uint64_t a1, char *a2, uint64_t a3)
{
  return static AsyncState.== infix(_:_:)(a1, a2, *(void *)(a3 + 16));
}

double AsyncKeyedState.ttl.getter()
{
  return *(double *)v0;
}

uint64_t AsyncKeyedState.keys.getter()
{
  return sub_24C94A760();
}

double AsyncKeyedState.init()@<D0>(void *a1@<X8>)
{
  AsyncKeyedState.init(ttl:)((uint64_t)v4, 1.79769313e308);
  double result = *(double *)v4;
  uint64_t v3 = v4[1];
  *a1 = v4[0];
  a1[1] = v3;
  return result;
}

uint64_t AsyncKeyedState.init(ttl:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  type metadata accessor for AsyncState();
  swift_getTupleTypeMetadata2();
  sub_24C94A680();
  uint64_t result = sub_24C94A4E0();
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t AsyncKeyedState.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for AsyncState();
  uint64_t v8 = sub_24C94A800();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - v10;
  double v12 = *v3;
  MEMORY[0x2533011F0](a1, *((void *)v3 + 1), *(void *)(a2 + 16), v7, *(void *)(a2 + 32));
  uint64_t v13 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v7) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a3, v11, v7);
  }
  AsyncState.init(ttl:)(a3, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24C91FEFC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AsyncKeyedState();
  return AsyncKeyedState.subscript.getter(a1, v4, a2);
}

uint64_t sub_24C91FF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for AsyncKeyedState();
  return sub_24C9234BC(a1, a3, v5);
}

uint64_t AsyncKeyedState.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24C9234BC(a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8))(a2);
  uint64_t v6 = type metadata accessor for AsyncState();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(a1, v6);
}

void (*AsyncKeyedState.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x48uLL);
  *a1 = v7;
  *uint64_t v7 = a3;
  v7[1] = v3;
  uint64_t v8 = type metadata accessor for AsyncState();
  v7[2] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[3] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[4] = malloc(v10);
  uint64_t v11 = malloc(v10);
  uint64_t v12 = *(void *)(a3 + 16);
  v7[5] = v11;
  v7[6] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = v13;
  v7[7] = v13;
  v7[8] = malloc(*(void *)(v13 + 64));
  (*(void (**)(void))(v14 + 16))();
  AsyncKeyedState.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_24C9201F4;
}

void sub_24C9201F4(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = (*a1)[7];
  uint64_t v3 = (void *)(*a1)[8];
  uint64_t v5 = (void *)(*a1)[5];
  uint64_t v6 = (*a1)[6];
  uint64_t v8 = (*a1)[3];
  uint64_t v7 = (void *)(*a1)[4];
  uint64_t v9 = (*a1)[2];
  uint64_t v10 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))((*a1)[4], v5, v9);
    sub_24C9234BC((uint64_t)v7, (uint64_t)v3, v10);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v6);
    uint64_t v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
    v11(v5, v9);
  }
  else
  {
    sub_24C9234BC((*a1)[5], (uint64_t)v3, v10);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v6);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v9);
  }
  free(v3);
  free(v5);
  free(v7);
  free(v2);
}

uint64_t static AsyncKeyedState.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(double *)a1 != *(double *)a2) {
    return 0;
  }
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = type metadata accessor for AsyncState();
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9D1F0](v8, v7, a3, v9, a5, WitnessTable);
}

uint64_t sub_24C9203EC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7107700 && a2 == 0xE300000000000000;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656761726F7473 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24C9204C8(char a1)
{
  if (a1) {
    return 0x656761726F7473;
  }
  else {
    return 7107700;
  }
}

BOOL sub_24C9204F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24C91F884(*a1, *a2);
}

uint64_t sub_24C920510()
{
  return sub_24C91F990();
}

uint64_t sub_24C920524()
{
  return sub_24C91F894();
}

uint64_t sub_24C920538()
{
  return sub_24C94AB70();
}

uint64_t sub_24C920584()
{
  return sub_24C9204C8(*v0);
}

uint64_t sub_24C920598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C9203EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C9205CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C9234B0();
  *a1 = result;
  return result;
}

uint64_t sub_24C920600(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C920654(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C9206A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static AsyncKeyedState.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t AsyncKeyedState<>.encode(to:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[5];
  uint64_t v19 = a2[4];
  uint64_t v20 = v8;
  uint64_t v30 = v8;
  uint64_t v31 = v9;
  v18[1] = v10;
  v18[2] = v9;
  uint64_t v32 = v19;
  uint64_t v33 = v10;
  type metadata accessor for AsyncKeyedState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v11 = sub_24C94AA80();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v18 - v13;
  v18[0] = *(void *)(v6 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C94AB90();
  LOBYTE(v30) = 0;
  uint64_t v15 = v24;
  sub_24C94AA50();
  if (!v15)
  {
    uint64_t v30 = v18[0];
    char v29 = 1;
    type metadata accessor for AsyncState();
    sub_24C94A510();
    uint64_t v27 = v21;
    uint64_t v28 = v22;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v25 = v23;
    uint64_t v26 = WitnessTable;
    swift_getWitnessTable();
    sub_24C94AA70();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t AsyncKeyedState<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>, uint64_t a9)
{
  uint64_t v26 = a7;
  uint64_t v27 = a4;
  uint64_t v28 = a3;
  uint64_t v29 = a6;
  uint64_t v25 = a8;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v30 = a5;
  uint64_t v40 = a5;
  uint64_t v41 = a9;
  type metadata accessor for AsyncKeyedState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v11 = sub_24C94AA20();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C94AB80();
  if (v9)
  {
    uint64_t v22 = (uint64_t)a1;
  }
  else
  {
    uint64_t v24 = a1;
    uint64_t v15 = v29;
    uint64_t v16 = v31;
    LOBYTE(v38) = 0;
    sub_24C94A9E0();
    uint64_t v18 = v17;
    type metadata accessor for AsyncState();
    sub_24C94A510();
    char v37 = 1;
    uint64_t v35 = v15;
    uint64_t v36 = v26;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v33 = v27;
    uint64_t v34 = WitnessTable;
    swift_getWitnessTable();
    sub_24C94AA00();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v16);
    uint64_t v21 = v38;
    uint64_t v22 = (uint64_t)v24;
    uint64_t v23 = v25;
    *uint64_t v25 = v18;
    v23[1] = v21;
  }
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_24C920BA0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return AsyncKeyedState<>.init(from:)(a1, a2[2], a2[3], *(void *)(a3 - 8), a2[4], *(void *)(a3 - 24), *(void *)(a3 - 32), a4, a2[5]);
}

uint64_t sub_24C920BD8(void *a1, void *a2, uint64_t a3)
{
  return AsyncKeyedState<>.encode(to:)(a1, a2, a3, *(void *)(a3 - 16), *(void *)(a3 - 24), *(void *)(a3 - 32));
}

uint64_t AsyncState<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a4;
  uint64_t v12 = a3;
  uint64_t v11 = a2;
  type metadata accessor for AsyncState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_24C94AA80();
  uint64_t v13 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C94AB90();
  char v18 = 0;
  type metadata accessor for AsyncStateValue();
  uint64_t v16 = v12;
  uint64_t v17 = v14;
  swift_getWitnessTable();
  uint64_t v8 = v15;
  sub_24C94AA70();
  if (v8) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v7, v5);
  }
  uint64_t v10 = v13;
  char v18 = 1;
  sub_24C94AA50();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v5);
}

uint64_t AsyncState<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v22 = a4;
  uint64_t v27 = type metadata accessor for AsyncStateValue();
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = (char *)&v20 - v5;
  type metadata accessor for AsyncState.CodingKeys();
  swift_getWitnessTable();
  uint64_t v29 = sub_24C94AA20();
  uint64_t v23 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = type metadata accessor for AsyncState();
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v30;
  sub_24C94AB80();
  if (v11) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v12 = v10;
  uint64_t v14 = v23;
  uint64_t v13 = v24;
  char v33 = 0;
  uint64_t v15 = v27;
  uint64_t v31 = v25;
  uint64_t v32 = v26;
  swift_getWitnessTable();
  sub_24C94AA00();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v12, v28, v15);
  char v33 = 1;
  sub_24C94A9E0();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v29);
  *(void *)&v12[*(int *)(v8 + 36)] = v17;
  uint64_t v18 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v22, v12, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v8);
}

uint64_t sub_24C9211C0@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return AsyncState<>.init(from:)(a1, *(void *)(a2 - 8), *(void *)(a2 - 16), a3);
}

uint64_t sub_24C9211E8(void *a1, uint64_t a2, uint64_t a3)
{
  return AsyncState<>.encode(to:)(a1, a2, *(void *)(a3 - 8), *(void *)(a3 - 16));
}

uint64_t AsyncStateValue<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v90 = a4;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = type metadata accessor for AsyncStateValue.FailedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v81 = v7;
  uint64_t v86 = sub_24C94AA80();
  uint64_t v63 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  v85 = (char *)&v60 - v8;
  uint64_t v9 = type metadata accessor for AsyncStateValue.FetchedCodingKeys();
  uint64_t v78 = swift_getWitnessTable();
  uint64_t v79 = v9;
  uint64_t v84 = sub_24C94AA80();
  uint64_t v62 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  v82 = (char *)&v60 - v10;
  uint64_t v88 = sub_24C94A340();
  uint64_t v83 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v92 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AsyncStateValue.RefreshingCodingKeys();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v76 = v12;
  uint64_t v74 = v13;
  uint64_t v77 = sub_24C94AA80();
  uint64_t v61 = *(void *)(v77 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v77);
  v75 = (char *)&v60 - v15;
  uint64_t v89 = *(void *)(v6 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v87 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v73 = (char *)&v60 - v18;
  uint64_t v19 = type metadata accessor for AsyncStateValue.FetchingCodingKeys();
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v72 = v19;
  uint64_t v71 = v20;
  uint64_t v70 = sub_24C94AA80();
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  v68 = (char *)&v60 - v21;
  type metadata accessor for AsyncStateValue.NoneCodingKeys();
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v66 = sub_24C94AA80();
  uint64_t v65 = *(void *)(v66 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v66);
  v64 = (char *)&v60 - v23;
  uint64_t v24 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = v6;
  type metadata accessor for AsyncStateValue.CodingKeys();
  swift_getWitnessTable();
  uint64_t v97 = sub_24C94AA80();
  uint64_t v93 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v28 = (char *)&v60 - v27;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v94 = v28;
  sub_24C94AB90();
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v96, a2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v37 = v91;
      uint64_t v38 = v88;
      uint64_t v39 = &v26[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      uint64_t v40 = v89;
      uint64_t v41 = v87;
      (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v87, v26, v37);
      uint64_t v42 = v83;
      (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v92, v39, v38);
      char v103 = 3;
      uint64_t v43 = v82;
      v44 = v94;
      sub_24C94AA30();
      char v102 = 0;
      uint64_t v45 = v84;
      uint64_t v46 = v95;
      sub_24C94AA70();
      if (v46)
      {
        (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v45);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v92, v88);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v37);
      }
      else
      {
        char v101 = 1;
        sub_24C923738(&qword_26B17D510);
        uint64_t v59 = v88;
        sub_24C94AA70();
        (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v45);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v92, v59);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v87, v37);
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v44, v97);
      break;
    case 2u:
      uint64_t v47 = *((void *)v26 + 3);
      uint64_t v96 = *((void *)v26 + 2);
      char v107 = 4;
      v48 = v85;
      uint64_t v49 = v97;
      v50 = v94;
      sub_24C94AA30();
      char v106 = 0;
      uint64_t v51 = v86;
      uint64_t v52 = v95;
      sub_24C94AA40();
      if (v52)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v95 = v47;
        swift_bridgeObjectRelease();
        char v105 = 1;
        sub_24C94AA60();
        char v104 = 2;
        sub_24C94AA40();
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v48, v51);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v50, v49);
      break;
    case 3u:
      char v98 = 0;
      v53 = v64;
      uint64_t v54 = v97;
      v55 = v94;
      sub_24C94AA30();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v53, v66);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v55, v54);
      break;
    case 4u:
      char v99 = 1;
      v56 = v68;
      uint64_t v57 = v97;
      v58 = v94;
      sub_24C94AA30();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v56, v70);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v58, v57);
      break;
    default:
      uint64_t v29 = v89;
      uint64_t v30 = v73;
      uint64_t v31 = v91;
      (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v73, v26, v91);
      char v100 = 2;
      uint64_t v32 = v75;
      uint64_t v33 = v97;
      uint64_t v34 = v94;
      sub_24C94AA30();
      uint64_t v35 = v77;
      sub_24C94AA70();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v32, v35);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v34, v33);
      break;
  }
  return result;
}

uint64_t AsyncStateValue<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v88 = a3;
  uint64_t v95 = a4;
  uint64_t v6 = type metadata accessor for AsyncStateValue.FailedCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v105 = v6;
  uint64_t v106 = sub_24C94AA20();
  uint64_t v81 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v93 = (char *)&v76 - v7;
  uint64_t v8 = type metadata accessor for AsyncStateValue.FetchedCodingKeys();
  uint64_t v102 = swift_getWitnessTable();
  uint64_t v103 = v8;
  uint64_t v87 = sub_24C94AA20();
  uint64_t v80 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  v94 = (char *)&v76 - v9;
  uint64_t v10 = type metadata accessor for AsyncStateValue.RefreshingCodingKeys();
  uint64_t v11 = swift_getWitnessTable();
  uint64_t v101 = v10;
  uint64_t v100 = v11;
  uint64_t v86 = sub_24C94AA20();
  uint64_t v79 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  v92 = (char *)&v76 - v12;
  uint64_t v13 = type metadata accessor for AsyncStateValue.FetchingCodingKeys();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v99 = v13;
  uint64_t v98 = v14;
  uint64_t v85 = sub_24C94AA20();
  uint64_t v84 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v91 = (char *)&v76 - v15;
  uint64_t v16 = type metadata accessor for AsyncStateValue.NoneCodingKeys();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v97 = v16;
  uint64_t v96 = v17;
  uint64_t v83 = sub_24C94AA20();
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v90 = (char *)&v76 - v18;
  type metadata accessor for AsyncStateValue.CodingKeys();
  uint64_t v113 = swift_getWitnessTable();
  uint64_t v109 = sub_24C94AA20();
  uint64_t v107 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v20 = (char *)&v76 - v19;
  uint64_t v110 = a2;
  uint64_t v108 = type metadata accessor for AsyncStateValue();
  uint64_t v89 = *(void *)(v108 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v108);
  uint64_t v23 = (uint64_t *)((char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v76 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v76 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v76 - v30;
  uint64_t v32 = a1[3];
  v112 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v32);
  v111 = v20;
  uint64_t v33 = v118;
  sub_24C94AB80();
  if (v33) {
    goto LABEL_7;
  }
  uint64_t v78 = v29;
  uint64_t v77 = v23;
  uint64_t v113 = (uint64_t)v26;
  v118 = v31;
  uint64_t v34 = v108;
  uint64_t v35 = v109;
  uint64_t v36 = v111;
  *(void *)&long long v114 = sub_24C94AA10();
  sub_24C94A6A0();
  swift_getWitnessTable();
  *(void *)&long long v116 = sub_24C94A840();
  *((void *)&v116 + 1) = v37;
  *(void *)&long long v117 = v38;
  *((void *)&v117 + 1) = v39;
  sub_24C94A830();
  swift_getWitnessTable();
  sub_24C94A770();
  int v40 = v114;
  if (v114 == 5 || (long long v76 = v116, v114 = v116, v115 = v117, (sub_24C94A780() & 1) == 0))
  {
    uint64_t v47 = sub_24C94A8D0();
    swift_allocError();
    uint64_t v49 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC950);
    *uint64_t v49 = v34;
    sub_24C94A9C0();
    sub_24C94A8C0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, *MEMORY[0x263F8DCB0], v47);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v36, v35);
LABEL_7:
    uint64_t v50 = (uint64_t)v112;
    return __swift_destroy_boxed_opaque_existential_1(v50);
  }
  uint64_t v41 = v35;
  uint64_t v42 = v106;
  switch(v40)
  {
    case 1:
      LOBYTE(v114) = 1;
      uint64_t v52 = v91;
      sub_24C94A9B0();
      uint64_t v46 = v95;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v52, v85);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v36, v35);
      v44 = v118;
      swift_storeEnumTagMultiPayload();
      uint64_t v45 = (uint64_t)v112;
      goto LABEL_10;
    case 2:
      LOBYTE(v114) = 2;
      uint64_t v54 = v92;
      sub_24C94A9B0();
      v55 = v78;
      uint64_t v56 = v86;
      sub_24C94AA00();
      uint64_t v57 = v107;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v54, v56);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v36, v41);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v89;
      uint64_t v62 = v55;
      v44 = v118;
      (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v118, v62, v34);
      goto LABEL_14;
    case 3:
      LOBYTE(v114) = 3;
      sub_24C94A9B0();
      LOBYTE(v114) = 0;
      uint64_t v58 = v87;
      sub_24C94AA00();
      uint64_t v59 = v107;
      sub_24C94A340();
      swift_getTupleTypeMetadata2();
      LOBYTE(v114) = 1;
      sub_24C923738(qword_2697FC958);
      uint64_t v63 = v94;
      sub_24C94AA00();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v63, v58);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v41);
      uint64_t v68 = v113;
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v89;
      v44 = v118;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 32))(v118, v68, v34);
LABEL_14:
      uint64_t v45 = (uint64_t)v112;
      goto LABEL_15;
    case 4:
      LOBYTE(v114) = 4;
      uint64_t v60 = v93;
      sub_24C94A9B0();
      LOBYTE(v114) = 0;
      uint64_t v61 = v60;
      uint64_t v64 = sub_24C94A9D0();
      uint64_t v66 = v65;
      LOBYTE(v114) = 1;
      uint64_t v67 = v42;
      uint64_t v110 = sub_24C94A9F0();
      LOBYTE(v114) = 2;
      uint64_t v69 = sub_24C94A9D0();
      uint64_t v70 = (void (**)(char *, uint64_t))(v107 + 8);
      uint64_t v113 = 0;
      uint64_t v72 = v71;
      v73 = *(void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v107 = v69;
      v73(v61, v67);
      swift_unknownObjectRelease();
      (*v70)(v111, v35);
      uint64_t v74 = v77;
      *uint64_t v77 = v64;
      v74[1] = v66;
      uint64_t v75 = v107;
      v74[2] = v110;
      v74[3] = v75;
      v74[4] = v72;
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v89;
      v44 = v118;
      (*(void (**)(char *, uint64_t *, uint64_t))(v89 + 32))(v118, v74, v34);
      uint64_t v45 = (uint64_t)v112;
LABEL_15:
      uint64_t v46 = v95;
      break;
    default:
      LOBYTE(v114) = 0;
      uint64_t v43 = v90;
      sub_24C94A9B0();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v43, v83);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v36, v35);
      v44 = v118;
      swift_storeEnumTagMultiPayload();
      uint64_t v45 = (uint64_t)v112;
      uint64_t v46 = v95;
LABEL_10:
      uint64_t v53 = v89;
      break;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v46, v44, v34);
  uint64_t v50 = v45;
  return __swift_destroy_boxed_opaque_existential_1(v50);
}

uint64_t sub_24C922D4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return AsyncStateValue<>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), a4);
}

uint64_t sub_24C922D70(void *a1, uint64_t a2, uint64_t a3)
{
  return AsyncStateValue<>.encode(to:)(a1, a2, a3, *(void *)(a3 - 16));
}

uint64_t AsyncKeyedState<>.hash(into:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t AsyncKeyedState<>.hashValue.getter()
{
  return sub_24C94AB70();
}

uint64_t sub_24C922EB4()
{
  return AsyncKeyedState<>.hashValue.getter();
}

uint64_t sub_24C922EBC()
{
  return AsyncKeyedState<>.hash(into:)();
}

uint64_t sub_24C922EC4()
{
  return sub_24C94AB70();
}

uint64_t AsyncState<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for AsyncStateValue();
  AsyncStateValue<>.hash(into:)(a1, v5, a3);
  return sub_24C94AB60();
}

uint64_t AsyncState<>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  sub_24C94AB40();
  AsyncState<>.hash(into:)((uint64_t)v5, a1, a2);
  return sub_24C94AB70();
}

uint64_t sub_24C922FD8(uint64_t a1, uint64_t a2)
{
  return AsyncState<>.hashValue.getter(a1, *(void *)(a2 - 8));
}

uint64_t sub_24C922FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AsyncState<>.hash(into:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t sub_24C922FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C923420(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))AsyncState<>.hash(into:));
}

uint64_t AsyncStateValue<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v21[1] = a3;
  uint64_t v6 = sub_24C94A340();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v8);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, v4, a2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v19 = &v17[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v17, v11);
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v19, v6);
      sub_24C94AB50();
      sub_24C94A560();
      sub_24C923738(qword_26B17D518);
      sub_24C94A560();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      goto LABEL_4;
    case 2u:
      sub_24C94AB50();
      sub_24C94A610();
      swift_bridgeObjectRelease();
      sub_24C94AB50();
      sub_24C94A610();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 3u:
    case 4u:
      uint64_t result = sub_24C94AB50();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v17, v11);
      sub_24C94AB50();
      sub_24C94A560();
LABEL_4:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      break;
  }
  return result;
}

uint64_t AsyncStateValue<>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  sub_24C94AB40();
  AsyncStateValue<>.hash(into:)((uint64_t)v5, a1, a2);
  return sub_24C94AB70();
}

uint64_t sub_24C9233F8(uint64_t a1, uint64_t a2)
{
  return AsyncStateValue<>.hashValue.getter(a1, *(void *)(a2 - 8));
}

uint64_t sub_24C923400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AsyncStateValue<>.hash(into:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t sub_24C923408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C923420(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))AsyncStateValue<>.hash(into:));
}

uint64_t sub_24C923420(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a3 - 8);
  sub_24C94AB40();
  a4(v8, a2, v6);
  return sub_24C94AB70();
}

uint64_t sub_24C92347C()
{
  return 5;
}

uint64_t sub_24C923484()
{
  return 3;
}

uint64_t sub_24C92348C()
{
  return 0x73756F6976657270;
}

uint64_t sub_24C9234B0()
{
  return 2;
}

uint64_t sub_24C9234BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AsyncState();
  uint64_t v7 = sub_24C94A800();
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v11);
  uint64_t v14 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, a1, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v6);
  sub_24C94A510();
  return sub_24C94A550();
}

uint64_t type metadata accessor for AsyncKeyedState.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for AsyncState.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.FailedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.FetchedCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.RefreshingCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.FetchingCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.NoneCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AsyncStateValue.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C923738(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24C94A340();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C92377C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C923798()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9237B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9237D0()
{
  return 32;
}

__n128 sub_24C9237DC(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_24C9237E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24C9237F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64;
    uint64_t result = sub_24C94A340();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v5 = &v3;
      uint64_t v6 = "(";
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_24C9238D8(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_10;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v15 = 2;
  if (v14 > 0xFFFC) {
    uint64_t v15 = 4;
  }
  if (v14 <= 0xFC) {
LABEL_10:
  }
    uint64_t v15 = 1;
  unint64_t v16 = v15 + v13;
  unsigned int v17 = *(_DWORD *)(v6 + 80) & 0xF8 | v10;
  if (v17 > 7 || v16 > 0x18 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0)
  {
    uint64_t v20 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v20 + (((v17 | 7) + 16) & ~(unint64_t)(v17 | 7)));
    swift_retain();
    return a1;
  }
  if (v13 > 3) {
    goto LABEL_23;
  }
  unsigned int v22 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v22 > 0xFFFC)
  {
    unsigned int v23 = *(_DWORD *)&a2[v13];
    unsigned int v24 = v23 - 3;
    if (v23 < 3) {
      goto LABEL_41;
    }
    goto LABEL_28;
  }
  if (v22 > 0xFC)
  {
    unsigned int v23 = *(unsigned __int16 *)&a2[v13];
    unsigned int v24 = v23 - 3;
    if (v23 < 3) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_23:
    unsigned int v23 = a2[v13];
    unsigned int v24 = v23 - 3;
    if (v23 < 3) {
      goto LABEL_41;
    }
  }
LABEL_28:
  if (v13 <= 3) {
    uint64_t v25 = v13;
  }
  else {
    uint64_t v25 = 4;
  }
  switch(v25)
  {
    case 1:
      int v26 = *a2;
      if (v13 < 4) {
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      int v26 = *(unsigned __int16 *)a2;
      if (v13 >= 4) {
        goto LABEL_40;
      }
      goto LABEL_39;
    case 3:
      int v26 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v13 >= 4) {
        goto LABEL_40;
      }
      goto LABEL_39;
    case 4:
      int v26 = *(_DWORD *)a2;
      if (v13 < 4) {
LABEL_39:
      }
        v26 |= v24 << (8 * v13);
LABEL_40:
      unsigned int v23 = v26 + 3;
      break;
    default:
      break;
  }
LABEL_41:
  if (v23 == 2)
  {
    uint64_t v27 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v27;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    a1[4] = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      unsigned int v28 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v28 > 0xFFFC)
      {
        int v30 = 2;
        goto LABEL_64;
      }
      if (v28 > 0xFC)
      {
        LOWORD(v30) = 2;
        goto LABEL_67;
      }
    }
    *((unsigned char *)a1 + v13) = 2;
    return a1;
  }
  if (v23 == 1)
  {
    uint64_t v29 = ~v10;
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v29, (unint64_t)&a2[v11] & v29, v8);
    if (v13 > 3)
    {
LABEL_53:
      *((unsigned char *)a1 + v13) = 1;
      return a1;
    }
    int v30 = 1;
    unsigned int v31 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v31 <= 0xFFFC)
    {
      if (v31 <= 0xFC) {
        goto LABEL_53;
      }
LABEL_67:
      *(_WORD *)((char *)a1 + v13) = v30;
      return a1;
    }
LABEL_64:
    *(_DWORD *)((char *)a1 + v13) = v30;
    return a1;
  }
  if (v23)
  {
    if (v13 > 3) {
      goto LABEL_58;
    }
    unsigned int v32 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    uint64_t v33 = 2;
    if (v32 > 0xFFFC) {
      uint64_t v33 = 4;
    }
    if (v32 <= 0xFC) {
LABEL_58:
    }
      uint64_t v33 = 1;
    memcpy(a1, a2, v33 + v13);
  }
  else
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    if (v13 > 3) {
      goto LABEL_45;
    }
    unsigned int v34 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v34 > 0xFFFC)
    {
      *(_DWORD *)((char *)a1 + v13) = 0;
      return a1;
    }
    if (v34 <= 0xFC) {
LABEL_45:
    }
      *((unsigned char *)a1 + v13) = 0;
    else {
      *(_WORD *)((char *)a1 + v13) = 0;
    }
  }
  return a1;
}

void *sub_24C923D14(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_9;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
    goto LABEL_14;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_9:
    unsigned int v15 = a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
  }
LABEL_14:
  if (v13 <= 3) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a2;
      goto LABEL_22;
    case 2:
      int v18 = *(unsigned __int16 *)a2;
      goto LABEL_22;
    case 3:
      int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      goto LABEL_22;
    case 4:
      int v18 = *(_DWORD *)a2;
LABEL_22:
      int v19 = (v18 | (v16 << (8 * v13))) + 3;
      unsigned int v15 = v18 + 3;
      if (v13 < 4) {
        unsigned int v15 = v19;
      }
      break;
    default:
      break;
  }
LABEL_24:
  if (v15 == 2)
  {
    uint64_t v20 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v20;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    a1[4] = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      unsigned int v21 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v21 > 0xFFFC)
      {
        int v23 = 2;
        goto LABEL_47;
      }
      if (v21 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_50;
      }
    }
    *((unsigned char *)a1 + v13) = 2;
    return a1;
  }
  if (v15 == 1)
  {
    uint64_t v22 = ~v10;
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v22, (unint64_t)&a2[v11] & v22, v8);
    if (v13 > 3)
    {
LABEL_36:
      *((unsigned char *)a1 + v13) = 1;
      return a1;
    }
    int v23 = 1;
    unsigned int v24 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC) {
        goto LABEL_36;
      }
LABEL_50:
      *(_WORD *)((char *)a1 + v13) = v23;
      return a1;
    }
LABEL_47:
    *(_DWORD *)((char *)a1 + v13) = v23;
    return a1;
  }
  if (v15)
  {
    if (v13 > 3) {
      goto LABEL_41;
    }
    unsigned int v25 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    uint64_t v26 = 2;
    if (v25 > 0xFFFC) {
      uint64_t v26 = 4;
    }
    if (v25 <= 0xFC) {
LABEL_41:
    }
      uint64_t v26 = 1;
    memcpy(a1, a2, v26 + v13);
  }
  else
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    if (v13 > 3) {
      goto LABEL_28;
    }
    unsigned int v27 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v27 > 0xFFFC)
    {
      *(_DWORD *)((char *)a1 + v13) = 0;
      return a1;
    }
    if (v27 <= 0xFC) {
LABEL_28:
    }
      *((unsigned char *)a1 + v13) = 0;
    else {
      *(_WORD *)((char *)a1 + v13) = 0;
    }
  }
  return a1;
}

unsigned __int8 *sub_24C9240B0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  char v14 = 8 * v13;
  if (v13 > 3) {
    goto LABEL_10;
  }
  unsigned int v15 = ((1 << v14) + 1) >> v14;
  if (v15 > 0xFFFC)
  {
    unsigned int v16 = *(_DWORD *)&a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (v15 > 0xFC)
  {
    unsigned int v16 = *(unsigned __int16 *)&a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_10:
    unsigned int v16 = a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
  }
LABEL_15:
  if (v13 <= 3) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = 4;
  }
  switch(v18)
  {
    case 1:
      int v19 = *a1;
      if (v13 < 4) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 2:
      int v19 = *(unsigned __int16 *)a1;
      if (v13 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 3:
      int v19 = *(unsigned __int16 *)a1 | (a1[2] << 16);
      if (v13 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 4:
      int v19 = *(_DWORD *)a1;
      if (v13 < 4) {
LABEL_26:
      }
        v19 |= v17 << v14;
LABEL_27:
      unsigned int v16 = v19 + 3;
      break;
    default:
      break;
  }
LABEL_28:
  uint64_t v20 = ~v10;
  if (v16 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v16 != 1)
  {
    if (!v16)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_36;
    }
LABEL_33:
    if (v13 <= 3) {
      goto LABEL_37;
    }
LABEL_39:
    unsigned int v22 = a2[v13];
    unsigned int v23 = v22 - 3;
    if (v22 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v20, v8);
LABEL_36:
  if (v13 > 3) {
    goto LABEL_39;
  }
LABEL_37:
  unsigned int v21 = ((1 << v14) + 1) >> v14;
  if (v21 > 0xFFFC)
  {
    unsigned int v22 = *(_DWORD *)&a2[v13];
    unsigned int v23 = v22 - 3;
    if (v22 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  if (v21 <= 0xFC) {
    goto LABEL_39;
  }
  unsigned int v22 = *(unsigned __int16 *)&a2[v13];
  unsigned int v23 = v22 - 3;
  if (v22 < 3) {
    goto LABEL_57;
  }
LABEL_44:
  if (v13 <= 3) {
    uint64_t v24 = v13;
  }
  else {
    uint64_t v24 = 4;
  }
  switch(v24)
  {
    case 1:
      int v25 = *a2;
      if (v13 < 4) {
        goto LABEL_55;
      }
      goto LABEL_56;
    case 2:
      int v25 = *(unsigned __int16 *)a2;
      if (v13 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 3:
      int v25 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v13 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 4:
      int v25 = *(_DWORD *)a2;
      if (v13 < 4) {
LABEL_55:
      }
        v25 |= v23 << v14;
LABEL_56:
      unsigned int v22 = v25 + 3;
      break;
    default:
      break;
  }
LABEL_57:
  if (v22 == 2)
  {
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = *((void *)a2 + 1);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = *((void *)a2 + 3);
    *((void *)a1 + 4) = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      unsigned int v26 = ((1 << v14) + 1) >> v14;
      if (v26 > 0xFFFC)
      {
        int v27 = 2;
        goto LABEL_80;
      }
      if (v26 > 0xFC)
      {
        LOWORD(v27) = 2;
        goto LABEL_83;
      }
    }
    a1[v13] = 2;
    return a1;
  }
  if (v22 == 1)
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((unint64_t)&a1[v11] & v20, (unint64_t)&a2[v11] & v20, v8);
    if (v13 > 3)
    {
LABEL_69:
      a1[v13] = 1;
      return a1;
    }
    int v27 = 1;
    unsigned int v28 = ((1 << v14) + 1) >> v14;
    if (v28 <= 0xFFFC)
    {
      if (v28 <= 0xFC) {
        goto LABEL_69;
      }
LABEL_83:
      *(_WORD *)&a1[v13] = v27;
      return a1;
    }
LABEL_80:
    *(_DWORD *)&a1[v13] = v27;
    return a1;
  }
  if (v22)
  {
    if (v13 > 3) {
      goto LABEL_74;
    }
    unsigned int v29 = ((1 << v14) + 1) >> v14;
    uint64_t v30 = 2;
    if (v29 > 0xFFFC) {
      uint64_t v30 = 4;
    }
    if (v29 <= 0xFC) {
LABEL_74:
    }
      uint64_t v30 = 1;
    memcpy(a1, a2, v30 + v13);
  }
  else
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    if (v13 > 3) {
      goto LABEL_61;
    }
    unsigned int v31 = ((1 << v14) + 1) >> v14;
    if (v31 > 0xFFFC)
    {
      *(_DWORD *)&a1[v13] = 0;
      return a1;
    }
    if (v31 <= 0xFC) {
LABEL_61:
    }
      a1[v13] = 0;
    else {
      *(_WORD *)&a1[v13] = 0;
    }
  }
  return a1;
}

_OWORD *sub_24C9245CC(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_9;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
    goto LABEL_14;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_9:
    unsigned int v15 = a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_24;
    }
  }
LABEL_14:
  if (v13 <= 3) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a2;
      goto LABEL_22;
    case 2:
      int v18 = *(unsigned __int16 *)a2;
      goto LABEL_22;
    case 3:
      int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      goto LABEL_22;
    case 4:
      int v18 = *(_DWORD *)a2;
LABEL_22:
      int v19 = (v18 | (v16 << (8 * v13))) + 3;
      unsigned int v15 = v18 + 3;
      if (v13 < 4) {
        unsigned int v15 = v19;
      }
      break;
    default:
      break;
  }
LABEL_24:
  if (v15 == 2)
  {
    long long v20 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v20;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    if (v13 <= 3)
    {
      unsigned int v21 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v21 > 0xFFFC)
      {
        int v23 = 2;
        goto LABEL_47;
      }
      if (v21 > 0xFC)
      {
        LOWORD(v23) = 2;
        goto LABEL_50;
      }
    }
    *((unsigned char *)a1 + v13) = 2;
    return a1;
  }
  if (v15 == 1)
  {
    uint64_t v22 = ~v10;
    (*(void (**)(_OWORD *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))(((unint64_t)a1 + v11) & v22, (unint64_t)&a2[v11] & v22, v8);
    if (v13 > 3)
    {
LABEL_36:
      *((unsigned char *)a1 + v13) = 1;
      return a1;
    }
    int v23 = 1;
    unsigned int v24 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v24 <= 0xFFFC)
    {
      if (v24 <= 0xFC) {
        goto LABEL_36;
      }
LABEL_50:
      *(_WORD *)((char *)a1 + v13) = v23;
      return a1;
    }
LABEL_47:
    *(_DWORD *)((char *)a1 + v13) = v23;
    return a1;
  }
  if (v15)
  {
    if (v13 > 3) {
      goto LABEL_41;
    }
    unsigned int v25 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    uint64_t v26 = 2;
    if (v25 > 0xFFFC) {
      uint64_t v26 = 4;
    }
    if (v25 <= 0xFC) {
LABEL_41:
    }
      uint64_t v26 = 1;
    memcpy(a1, a2, v26 + v13);
  }
  else
  {
    (*(void (**)(_OWORD *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    if (v13 > 3) {
      goto LABEL_28;
    }
    unsigned int v27 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v27 > 0xFFFC)
    {
      *(_DWORD *)((char *)a1 + v13) = 0;
      return a1;
    }
    if (v27 <= 0xFC) {
LABEL_28:
    }
      *((unsigned char *)a1 + v13) = 0;
    else {
      *(_WORD *)((char *)a1 + v13) = 0;
    }
  }
  return a1;
}

unsigned __int8 *sub_24C924954(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  char v14 = 8 * v13;
  if (v13 > 3) {
    goto LABEL_10;
  }
  unsigned int v15 = ((1 << v14) + 1) >> v14;
  if (v15 > 0xFFFC)
  {
    unsigned int v16 = *(_DWORD *)&a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (v15 > 0xFC)
  {
    unsigned int v16 = *(unsigned __int16 *)&a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_10:
    unsigned int v16 = a1[v13];
    unsigned int v17 = v16 - 3;
    if (v16 < 3) {
      goto LABEL_28;
    }
  }
LABEL_15:
  if (v13 <= 3) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = 4;
  }
  switch(v18)
  {
    case 1:
      int v19 = *a1;
      if (v13 < 4) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 2:
      int v19 = *(unsigned __int16 *)a1;
      if (v13 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 3:
      int v19 = *(unsigned __int16 *)a1 | (a1[2] << 16);
      if (v13 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 4:
      int v19 = *(_DWORD *)a1;
      if (v13 < 4) {
LABEL_26:
      }
        v19 |= v17 << v14;
LABEL_27:
      unsigned int v16 = v19 + 3;
      break;
    default:
      break;
  }
LABEL_28:
  uint64_t v20 = ~v10;
  if (v16 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v16 != 1)
  {
    if (!v16)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_36;
    }
LABEL_33:
    if (v13 <= 3) {
      goto LABEL_37;
    }
LABEL_39:
    unsigned int v22 = a2[v13];
    unsigned int v23 = v22 - 3;
    if (v22 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v20, v8);
LABEL_36:
  if (v13 > 3) {
    goto LABEL_39;
  }
LABEL_37:
  unsigned int v21 = ((1 << v14) + 1) >> v14;
  if (v21 > 0xFFFC)
  {
    unsigned int v22 = *(_DWORD *)&a2[v13];
    unsigned int v23 = v22 - 3;
    if (v22 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  if (v21 <= 0xFC) {
    goto LABEL_39;
  }
  unsigned int v22 = *(unsigned __int16 *)&a2[v13];
  unsigned int v23 = v22 - 3;
  if (v22 < 3) {
    goto LABEL_57;
  }
LABEL_44:
  if (v13 <= 3) {
    uint64_t v24 = v13;
  }
  else {
    uint64_t v24 = 4;
  }
  switch(v24)
  {
    case 1:
      int v25 = *a2;
      if (v13 < 4) {
        goto LABEL_55;
      }
      goto LABEL_56;
    case 2:
      int v25 = *(unsigned __int16 *)a2;
      if (v13 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 3:
      int v25 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v13 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 4:
      int v25 = *(_DWORD *)a2;
      if (v13 < 4) {
LABEL_55:
      }
        v25 |= v23 << v14;
LABEL_56:
      unsigned int v22 = v25 + 3;
      break;
    default:
      break;
  }
LABEL_57:
  if (v22 == 2)
  {
    long long v26 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v26;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    if (v13 <= 3)
    {
      unsigned int v27 = ((1 << v14) + 1) >> v14;
      if (v27 > 0xFFFC)
      {
        int v28 = 2;
        goto LABEL_80;
      }
      if (v27 > 0xFC)
      {
        LOWORD(v28) = 2;
        goto LABEL_83;
      }
    }
    a1[v13] = 2;
    return a1;
  }
  if (v22 == 1)
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))((unint64_t)&a1[v11] & v20, (unint64_t)&a2[v11] & v20, v8);
    if (v13 > 3)
    {
LABEL_69:
      a1[v13] = 1;
      return a1;
    }
    int v28 = 1;
    unsigned int v29 = ((1 << v14) + 1) >> v14;
    if (v29 <= 0xFFFC)
    {
      if (v29 <= 0xFC) {
        goto LABEL_69;
      }
LABEL_83:
      *(_WORD *)&a1[v13] = v28;
      return a1;
    }
LABEL_80:
    *(_DWORD *)&a1[v13] = v28;
    return a1;
  }
  if (v22)
  {
    if (v13 > 3) {
      goto LABEL_74;
    }
    unsigned int v30 = ((1 << v14) + 1) >> v14;
    uint64_t v31 = 2;
    if (v30 > 0xFFFC) {
      uint64_t v31 = 4;
    }
    if (v30 <= 0xFC) {
LABEL_74:
    }
      uint64_t v31 = 1;
    memcpy(a1, a2, v31 + v13);
  }
  else
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    if (v13 > 3) {
      goto LABEL_61;
    }
    unsigned int v32 = ((1 << v14) + 1) >> v14;
    if (v32 > 0xFFFC)
    {
      *(_DWORD *)&a1[v13] = 0;
      return a1;
    }
    if (v32 <= 0xFC) {
LABEL_61:
    }
      a1[v13] = 0;
    else {
      *(_WORD *)&a1[v13] = 0;
    }
  }
  return a1;
}

uint64_t sub_24C924E4C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(sub_24C94A340() - 8);
  unint64_t v7 = ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(void *)(v6 + 64);
  if (v7 <= v5) {
    unint64_t v7 = v5;
  }
  if (v7 <= 0x28) {
    unint64_t v7 = 40;
  }
  if (v7 > 3)
  {
    int v8 = 4;
LABEL_9:
    char v10 = 8;
    goto LABEL_10;
  }
  unsigned int v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFC) {
    goto LABEL_13;
  }
  int v8 = v9 + 3;
  if (v9 <= 0xFC) {
    goto LABEL_9;
  }
  char v10 = 16;
LABEL_10:
  unsigned int v11 = (1 << v10) - v8;
  if ((v11 & 0x80000000) == 0)
  {
    if (v7 > 3) {
      goto LABEL_17;
    }
LABEL_14:
    unsigned int v12 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    uint64_t v13 = 2;
    if (v12 > 0xFFFC) {
      uint64_t v13 = 4;
    }
    if (v12 > 0xFC) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v11 = 0x7FFFFFFF;
  if (v7 <= 3) {
    goto LABEL_14;
  }
LABEL_17:
  uint64_t v13 = 1;
LABEL_18:
  if (!a2) {
    return 0;
  }
  if (a2 <= v11) {
    goto LABEL_37;
  }
  unint64_t v14 = v13 + v7;
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_37;
      }
      goto LABEL_29;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_37;
      }
      goto LABEL_29;
    }
    if (v17 < 2)
    {
LABEL_37:
      if (v11)
      {
        if (v7 <= 3)
        {
          unsigned int v25 = ((1 << (8 * v7)) + 1) >> (8 * v7);
          if (v25 > 0xFFFC)
          {
            unsigned int v20 = *(_DWORD *)((char *)a1 + v7);
            unsigned int v21 = ~v20;
LABEL_47:
            unsigned int v28 = 0x7FFFFFFF;
LABEL_48:
            if (v28 > v21) {
              return -v20;
            }
            else {
              return 0;
            }
          }
          int v23 = v25 + 3;
          if (v25 > 0xFC)
          {
            int v27 = *(unsigned __int16 *)((char *)a1 + v7);
            unsigned int v20 = v27 | 0xFFFF0000;
            unsigned int v21 = v27 ^ 0xFFFF;
            char v22 = 16;
          }
          else
          {
            int v26 = *((unsigned __int8 *)a1 + v7);
            unsigned int v20 = v26 | 0xFFFFFF00;
            unsigned int v21 = v26 ^ 0xFF;
            char v22 = 8;
          }
        }
        else
        {
          int v19 = *((unsigned __int8 *)a1 + v7);
          unsigned int v20 = v19 | 0xFFFFFF00;
          unsigned int v21 = v19 ^ 0xFF;
          char v22 = 8;
          int v23 = 4;
        }
        unsigned int v28 = (1 << v22) - v23;
        if ((v28 & 0x80000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_37;
  }
LABEL_29:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 > 3) {
      LODWORD(v14) = 4;
    }
    switch((int)v14)
    {
      case 2:
        LODWORD(v14) = *a1;
        break;
      case 3:
        LODWORD(v14) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v14) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v14) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v11 + (v14 | v18) + 1;
}

void sub_24C925138(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v8 = *(void *)(sub_24C94A340() - 8);
  unint64_t v9 = ((v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + *(void *)(v8 + 64);
  if (v9 <= v7) {
    unint64_t v9 = v7;
  }
  if (v9 <= 0x28) {
    unint64_t v9 = 40;
  }
  char v10 = 8 * v9;
  if (v9 > 3)
  {
    int v11 = 4;
LABEL_7:
    char v12 = 8;
    goto LABEL_8;
  }
  unsigned int v14 = ((1 << v10) + 1) >> v10;
  if (v14 > 0xFFFC) {
    goto LABEL_14;
  }
  int v11 = v14 + 3;
  if (v14 <= 0xFC) {
    goto LABEL_7;
  }
  char v12 = 16;
LABEL_8:
  unsigned int v13 = (1 << v12) - v11;
  if ((v13 & 0x80000000) == 0)
  {
    if (v9 > 3) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_14:
  unsigned int v13 = 0x7FFFFFFF;
  if (v9 > 3)
  {
LABEL_18:
    uint64_t v16 = 1;
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v15 = ((1 << v10) + 1) >> v10;
  uint64_t v16 = 2;
  if (v15 > 0xFFFC) {
    uint64_t v16 = 4;
  }
  if (v15 <= 0xFC) {
    goto LABEL_18;
  }
LABEL_19:
  size_t v17 = v16 + v9;
  if (a3 <= v13)
  {
    int v18 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v21 = ((a3 - v13 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
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
  if (v13 < a2)
  {
    unsigned int v19 = ~v13 + a2;
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
        goto LABEL_55;
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
      goto LABEL_39;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 3:
LABEL_55:
      __break(1u);
      JUMPOUT(0x24C925440);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_38;
    default:
LABEL_38:
      if (!a2) {
        return;
      }
LABEL_39:
      int v23 = -a2;
      if (v9 > 3) {
        goto LABEL_40;
      }
      unsigned int v24 = ((1 << v10) + 1) >> v10;
      if (v24 > 0xFFFC)
      {
        *(_DWORD *)&a1[v9] = v23;
      }
      else if (v24 <= 0xFC)
      {
LABEL_40:
        a1[v9] = v23;
      }
      else
      {
        *(_WORD *)&a1[v9] = v23;
      }
      return;
  }
}

uint64_t sub_24C925468(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v4 = *(void *)(sub_24C94A340() - 8);
  unint64_t v5 = ((v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + *(void *)(v4 + 64);
  if (v5 <= v3) {
    unint64_t v5 = v3;
  }
  if (v5 <= 0x28) {
    unint64_t v5 = 40;
  }
  if (v5 > 3) {
    goto LABEL_6;
  }
  unsigned int v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFC)
  {
    uint64_t result = *(unsigned int *)&a1[v5];
  }
  else
  {
    if (v7 <= 0xFC)
    {
LABEL_6:
      uint64_t result = a1[v5];
      goto LABEL_11;
    }
    uint64_t result = *(unsigned __int16 *)&a1[v5];
  }
LABEL_11:
  if (result >= 3)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a1;
        goto LABEL_20;
      case 2:
        int v9 = *(unsigned __int16 *)a1;
        goto LABEL_20;
      case 3:
        int v9 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_20;
      case 4:
        int v9 = *(_DWORD *)a1;
LABEL_20:
        unsigned int v10 = (v9 | ((result - 3) << (8 * v5))) + 3;
        unsigned int v11 = v9 + 3;
        if (v5 >= 4) {
          uint64_t result = v11;
        }
        else {
          uint64_t result = v10;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_24C9255D8(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(sub_24C94A340() - 8);
  unint64_t v7 = ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(void *)(v6 + 64);
  if (v7 <= v5) {
    unint64_t v7 = v5;
  }
  if (v7 <= 0x28) {
    size_t v8 = 40;
  }
  else {
    size_t v8 = v7;
  }
  if (a2 > 2)
  {
    unsigned int v9 = a2 - 3;
    if (v8 < 4)
    {
      int v11 = (v9 >> (8 * v8)) + 3;
      v9 &= ~(-1 << (8 * v8));
      char v12 = (int *)&a1[v8];
      unsigned int v13 = ((1 << (8 * v8)) + 1) >> (8 * v8);
      if (v13 > 0xFFFC)
      {
        *char v12 = v11;
      }
      else if (v13 > 0xFC)
      {
        *(_WORD *)char v12 = v11;
      }
      else
      {
        *(unsigned char *)char v12 = v11;
      }
    }
    else
    {
      a1[v8] = 3;
    }
    if (v8 <= 3) {
      int v14 = v8;
    }
    else {
      int v14 = 4;
    }
    bzero(a1, v8);
    switch(v14)
    {
      case 2:
        *(_WORD *)a1 = v9;
        break;
      case 3:
        *(_WORD *)a1 = v9;
        a1[2] = BYTE2(v9);
        break;
      case 4:
        *(_DWORD *)a1 = v9;
        break;
      default:
        *a1 = v9;
        break;
    }
  }
  else
  {
    if (v8 > 3)
    {
LABEL_8:
      a1[v8] = a2;
      return;
    }
    unsigned int v10 = ((1 << (8 * v8)) + 1) >> (8 * v8);
    if (v10 > 0xFFFC)
    {
      *(_DWORD *)&a1[v8] = a2;
    }
    else
    {
      if (v10 <= 0xFC) {
        goto LABEL_8;
      }
      *(_WORD *)&a1[v8] = a2;
    }
  }
}

uint64_t sub_24C9257B4()
{
  uint64_t result = type metadata accessor for AsyncStateValue();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24C925850(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_10;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v15 = 2;
  if (v14 > 0xFFFC) {
    uint64_t v15 = 4;
  }
  if (v14 <= 0xFC) {
LABEL_10:
  }
    uint64_t v15 = 1;
  unsigned int v16 = *(_DWORD *)(v6 + 80) & 0xF8 | v10;
  BOOL v17 = v16 <= 7 && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) == 0;
  if (v17 && ((v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 <= 0x18)
  {
    if (v13 > 3) {
      goto LABEL_20;
    }
    unsigned int v18 = ((1 << (8 * v13)) + 1) >> (8 * v13);
    if (v18 > 0xFFFC)
    {
      unsigned int v19 = *(_DWORD *)&a2[v13];
      unsigned int v20 = v19 - 3;
      if (v19 < 3) {
        goto LABEL_39;
      }
      goto LABEL_26;
    }
    if (v18 > 0xFC)
    {
      unsigned int v19 = *(unsigned __int16 *)&a2[v13];
      unsigned int v20 = v19 - 3;
      if (v19 < 3) {
        goto LABEL_39;
      }
    }
    else
    {
LABEL_20:
      unsigned int v19 = a2[v13];
      unsigned int v20 = v19 - 3;
      if (v19 < 3) {
        goto LABEL_39;
      }
    }
LABEL_26:
    if (v13 <= 3) {
      uint64_t v22 = v13;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *a2;
        if (v13 < 4) {
          goto LABEL_37;
        }
        goto LABEL_38;
      case 2:
        int v23 = *(unsigned __int16 *)a2;
        if (v13 >= 4) {
          goto LABEL_38;
        }
        goto LABEL_37;
      case 3:
        int v23 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v13 >= 4) {
          goto LABEL_38;
        }
        goto LABEL_37;
      case 4:
        int v23 = *(_DWORD *)a2;
        if (v13 < 4) {
LABEL_37:
        }
          v23 |= v20 << (8 * v13);
LABEL_38:
        unsigned int v19 = v23 + 3;
        break;
      default:
        break;
    }
LABEL_39:
    if (v19 != 2)
    {
      if (v19 != 1)
      {
        if (v19)
        {
          if (v13 > 3) {
            goto LABEL_59;
          }
          unsigned int v29 = ((1 << (8 * v13)) + 1) >> (8 * v13);
          uint64_t v30 = 2;
          if (v29 > 0xFFFC) {
            uint64_t v30 = 4;
          }
          if (v29 <= 0xFC) {
LABEL_59:
          }
            uint64_t v30 = 1;
          memcpy(a1, a2, v30 + v13);
          if (v13 > 3) {
            goto LABEL_64;
          }
          goto LABEL_61;
        }
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        if (v13 > 3) {
          goto LABEL_43;
        }
        unsigned int v25 = ((1 << (8 * v13)) + 1) >> (8 * v13);
        if (v25 > 0xFFFC)
        {
          *(_DWORD *)((char *)a1 + v13) = 0;
        }
        else
        {
          if (v25 <= 0xFC)
          {
LABEL_43:
            *((unsigned char *)a1 + v13) = 0;
            if (v13 > 3)
            {
LABEL_64:
              uint64_t v32 = 1;
LABEL_75:
              *(void *)(((unint64_t)a1 + v32 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v32 + 7 + v13] & 0xFFFFFFFFFFFFFFF8);
              return a1;
            }
LABEL_61:
            unsigned int v31 = ((1 << (8 * v13)) + 1) >> (8 * v13);
            uint64_t v32 = 2;
            if (v31 > 0xFFFC) {
              uint64_t v32 = 4;
            }
            if (v31 > 0xFC) {
              goto LABEL_75;
            }
            goto LABEL_64;
          }
          *(_WORD *)((char *)a1 + v13) = 0;
        }
LABEL_73:
        BOOL v33 = v25 > 0xFFFC;
        uint64_t v32 = 2;
        if (v33) {
          uint64_t v32 = 4;
        }
        goto LABEL_75;
      }
      uint64_t v27 = ~v10;
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v27, (unint64_t)&a2[v11] & v27, v8);
      if (v13 > 3) {
        goto LABEL_52;
      }
      int v28 = 1;
      unsigned int v25 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v25 <= 0xFFFC)
      {
        if (v25 <= 0xFC)
        {
LABEL_52:
          char v26 = 1;
LABEL_53:
          *((unsigned char *)a1 + v13) = v26;
          if (v13 > 3) {
            goto LABEL_64;
          }
          goto LABEL_61;
        }
LABEL_72:
        *(_WORD *)((char *)a1 + v13) = v28;
        goto LABEL_73;
      }
LABEL_69:
      *(_DWORD *)((char *)a1 + v13) = v28;
      goto LABEL_73;
    }
    uint64_t v24 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v24;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    a1[4] = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 <= 3)
    {
      unsigned int v25 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v25 > 0xFFFC)
      {
        int v28 = 2;
        goto LABEL_69;
      }
      if (v25 > 0xFC)
      {
        LOWORD(v28) = 2;
        goto LABEL_72;
      }
    }
    char v26 = 2;
    goto LABEL_53;
  }
  uint64_t v21 = *(void *)a2;
  *a1 = *(void *)a2;
  a1 = (void *)(v21 + (((v16 | 7) + 16) & ~(unint64_t)(v16 | 7)));
  swift_retain();
  return a1;
}

uint64_t sub_24C925D14(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v21 = *(void *)(v3 - 8);
  unint64_t v4 = *(void *)(v21 + 64);
  uint64_t v5 = sub_24C94A340();
  uint64_t result = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(result + 80);
  uint64_t v8 = v4 + v7;
  unint64_t v9 = ((v4 + v7) & ~v7) + *(void *)(result + 64);
  if (v9 <= v4) {
    unint64_t v9 = v4;
  }
  if (v9 <= 0x28) {
    unint64_t v9 = 40;
  }
  if (v9 > 3) {
    goto LABEL_6;
  }
  unsigned int v11 = ((1 << (8 * v9)) + 1) >> (8 * v9);
  if (v11 > 0xFFFC)
  {
    unsigned int v10 = *(_DWORD *)&a1[v9];
  }
  else
  {
    if (v11 <= 0xFC)
    {
LABEL_6:
      unsigned int v10 = a1[v9];
      goto LABEL_11;
    }
    unsigned int v10 = *(unsigned __int16 *)&a1[v9];
  }
LABEL_11:
  unsigned int v12 = v10 - 3;
  if (v10 >= 3)
  {
    if (v9 <= 3) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *a1;
        goto LABEL_20;
      case 2:
        int v14 = *(unsigned __int16 *)a1;
        goto LABEL_20;
      case 3:
        int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_20;
      case 4:
        int v14 = *(_DWORD *)a1;
LABEL_20:
        int v15 = (v14 | (v12 << (8 * v9))) + 3;
        unsigned int v10 = v14 + 3;
        if (v9 < 4) {
          unsigned int v10 = v15;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (v10 == 1)
    {
      uint64_t v19 = ~v7;
      unsigned int v20 = *(void (**)(unsigned __int8 *, uint64_t))(v21 + 8);
      uint64_t v22 = *(void *)(v5 - 8);
      v20(a1, v3);
      BOOL v17 = (unsigned __int8 *)((unint64_t)&a1[v8] & v19);
      unsigned int v16 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v22 + 8);
      uint64_t v18 = v5;
    }
    else
    {
      if (v10) {
        return result;
      }
      unsigned int v16 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v21 + 8);
      BOOL v17 = a1;
      uint64_t v18 = v3;
    }
    return v16(v17, v18);
  }
}

void *sub_24C925F98(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_9;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
  }
  else
  {
LABEL_9:
    unsigned int v15 = a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
  }
LABEL_14:
  if (v13 <= 3) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a2;
      if (v13 < 4) {
        goto LABEL_25;
      }
      goto LABEL_26;
    case 2:
      int v18 = *(unsigned __int16 *)a2;
      if (v13 >= 4) {
        goto LABEL_26;
      }
      goto LABEL_25;
    case 3:
      int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v13 >= 4) {
        goto LABEL_26;
      }
      goto LABEL_25;
    case 4:
      int v18 = *(_DWORD *)a2;
      if (v13 < 4) {
LABEL_25:
      }
        v18 |= v16 << (8 * v13);
LABEL_26:
      unsigned int v15 = v18 + 3;
      break;
    default:
      break;
  }
LABEL_27:
  switch(v15)
  {
    case 2u:
      uint64_t v19 = *((void *)a2 + 1);
      *a1 = *(void *)a2;
      a1[1] = v19;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      a1[4] = *((void *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v13 <= 3)
      {
        unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
        if (v20 > 0xFFFC)
        {
          int v23 = 2;
          goto LABEL_57;
        }
        if (v20 > 0xFC)
        {
          LOWORD(v23) = 2;
          goto LABEL_60;
        }
      }
      char v21 = 2;
      goto LABEL_41;
    case 1u:
      uint64_t v22 = ~v10;
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v22, (unint64_t)&a2[v11] & v22, v8);
      if (v13 > 3)
      {
LABEL_40:
        char v21 = 1;
LABEL_41:
        *((unsigned char *)a1 + v13) = v21;
        if (v13 > 3) {
          goto LABEL_52;
        }
        goto LABEL_49;
      }
      int v23 = 1;
      unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v20 <= 0xFFFC)
      {
        if (v20 <= 0xFC) {
          goto LABEL_40;
        }
LABEL_60:
        *(_WORD *)((char *)a1 + v13) = v23;
        goto LABEL_61;
      }
LABEL_57:
      *(_DWORD *)((char *)a1 + v13) = v23;
      goto LABEL_61;
    case 0u:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      if (v13 > 3) {
        goto LABEL_31;
      }
      unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + v13) = 0;
      }
      else
      {
        if (v20 <= 0xFC)
        {
LABEL_31:
          *((unsigned char *)a1 + v13) = 0;
          if (v13 > 3)
          {
LABEL_52:
            uint64_t v27 = 1;
            goto LABEL_63;
          }
          goto LABEL_49;
        }
        *(_WORD *)((char *)a1 + v13) = 0;
      }
LABEL_61:
      BOOL v28 = v20 > 0xFFFC;
      uint64_t v27 = 2;
      if (v28) {
        uint64_t v27 = 4;
      }
      goto LABEL_63;
  }
  if (v13 > 3) {
    goto LABEL_47;
  }
  unsigned int v24 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v25 = 2;
  if (v24 > 0xFFFC) {
    uint64_t v25 = 4;
  }
  if (v24 <= 0xFC) {
LABEL_47:
  }
    uint64_t v25 = 1;
  memcpy(a1, a2, v25 + v13);
  if (v13 > 3) {
    goto LABEL_52;
  }
LABEL_49:
  unsigned int v26 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v27 = 2;
  if (v26 > 0xFFFC) {
    uint64_t v27 = 4;
  }
  if (v26 <= 0xFC) {
    goto LABEL_52;
  }
LABEL_63:
  *(void *)(((unint64_t)a1 + v27 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v27 + 7 + v13] & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

unsigned __int8 *sub_24C9263C4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (a1 == a2) {
    goto LABEL_84;
  }
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v37 = v7 + v10;
  uint64_t v38 = v8;
  unint64_t v11 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v11 <= v7) {
    unint64_t v11 = v7;
  }
  if (v11 <= 0x28) {
    uint64_t v12 = 40;
  }
  else {
    uint64_t v12 = v11;
  }
  char v13 = 8 * v12;
  if (v12 > 3) {
    goto LABEL_10;
  }
  unsigned int v14 = ((1 << v13) + 1) >> v13;
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_10:
    unsigned int v15 = a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
  }
LABEL_15:
  if (v12 <= 3) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a1;
      if (v12 < 4) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 2:
      int v18 = *(unsigned __int16 *)a1;
      if (v12 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 3:
      int v18 = *(unsigned __int16 *)a1 | (a1[2] << 16);
      if (v12 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 4:
      int v18 = *(_DWORD *)a1;
      if (v12 < 4) {
LABEL_26:
      }
        v18 |= v16 << v13;
LABEL_27:
      unsigned int v15 = v18 + 3;
      break;
    default:
      break;
  }
LABEL_28:
  uint64_t v19 = ~v10;
  if (v15 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v15 != 1)
  {
    if (!v15)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_36;
    }
LABEL_33:
    if (v12 <= 3) {
      goto LABEL_37;
    }
LABEL_39:
    unsigned int v21 = a2[v12];
    unsigned int v22 = v21 - 3;
    if (v21 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v37] & v19, v38);
LABEL_36:
  if (v12 > 3) {
    goto LABEL_39;
  }
LABEL_37:
  unsigned int v20 = ((1 << v13) + 1) >> v13;
  if (v20 > 0xFFFC)
  {
    unsigned int v21 = *(_DWORD *)&a2[v12];
    unsigned int v22 = v21 - 3;
    if (v21 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  if (v20 <= 0xFC) {
    goto LABEL_39;
  }
  unsigned int v21 = *(unsigned __int16 *)&a2[v12];
  unsigned int v22 = v21 - 3;
  if (v21 < 3) {
    goto LABEL_57;
  }
LABEL_44:
  if (v12 <= 3) {
    uint64_t v23 = v12;
  }
  else {
    uint64_t v23 = 4;
  }
  switch(v23)
  {
    case 1:
      int v24 = *a2;
      if (v12 < 4) {
        goto LABEL_55;
      }
      goto LABEL_56;
    case 2:
      int v24 = *(unsigned __int16 *)a2;
      if (v12 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 3:
      int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v12 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 4:
      int v24 = *(_DWORD *)a2;
      if (v12 < 4) {
LABEL_55:
      }
        v24 |= v22 << v13;
LABEL_56:
      unsigned int v21 = v24 + 3;
      break;
    default:
      break;
  }
LABEL_57:
  if (v21 == 2)
  {
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = *((void *)a2 + 1);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = *((void *)a2 + 3);
    *((void *)a1 + 4) = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12 <= 3)
    {
      unsigned int v25 = ((1 << v13) + 1) >> v13;
      if (v25 > 0xFFFC)
      {
        int v26 = 2;
        goto LABEL_80;
      }
      if (v25 > 0xFC)
      {
        LOWORD(v26) = 2;
        goto LABEL_83;
      }
    }
    a1[v12] = 2;
    goto LABEL_84;
  }
  if (v21 == 1)
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((unint64_t)&a1[v37] & v19, (unint64_t)&a2[v37] & v19, v38);
    if (v12 > 3)
    {
LABEL_69:
      a1[v12] = 1;
      goto LABEL_84;
    }
    int v26 = 1;
    unsigned int v27 = ((1 << v13) + 1) >> v13;
    if (v27 <= 0xFFFC)
    {
      if (v27 <= 0xFC) {
        goto LABEL_69;
      }
LABEL_83:
      *(_WORD *)&a1[v12] = v26;
      goto LABEL_84;
    }
LABEL_80:
    *(_DWORD *)&a1[v12] = v26;
    goto LABEL_84;
  }
  if (v21)
  {
    if (v12 > 3) {
      goto LABEL_74;
    }
    unsigned int v28 = ((1 << v13) + 1) >> v13;
    uint64_t v29 = 2;
    if (v28 > 0xFFFC) {
      uint64_t v29 = 4;
    }
    if (v28 <= 0xFC) {
LABEL_74:
    }
      uint64_t v29 = 1;
    memcpy(a1, a2, v29 + v12);
  }
  else
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    if (v12 > 3)
    {
LABEL_61:
      a1[v12] = 0;
      goto LABEL_84;
    }
    unsigned int v30 = ((1 << v13) + 1) >> v13;
    if (v30 > 0xFFFC)
    {
      *(_DWORD *)&a1[v12] = 0;
    }
    else
    {
      if (v30 <= 0xFC) {
        goto LABEL_61;
      }
      *(_WORD *)&a1[v12] = 0;
    }
  }
LABEL_84:
  unint64_t v31 = *(void *)(v6 + 64);
  uint64_t v32 = *(void *)(sub_24C94A340() - 8);
  unint64_t v33 = ((v31 + *(unsigned __int8 *)(v32 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))
      + *(void *)(v32 + 64);
  if (v33 <= v31) {
    unint64_t v33 = v31;
  }
  if (v33 <= 0x28) {
    unint64_t v33 = 40;
  }
  if (v33 > 3) {
    goto LABEL_92;
  }
  unsigned int v34 = ((1 << (8 * v33)) + 1) >> (8 * v33);
  uint64_t v35 = 2;
  if (v34 > 0xFFFC) {
    uint64_t v35 = 4;
  }
  if (v34 <= 0xFC) {
LABEL_92:
  }
    uint64_t v35 = 1;
  *(void *)((unint64_t)&a1[v35 + 7 + v33] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v35 + 7 + v33] & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

_OWORD *sub_24C9269C4(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  unint64_t v12 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  if (v12 <= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 3) {
    goto LABEL_9;
  }
  unsigned int v14 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
  }
  else
  {
LABEL_9:
    unsigned int v15 = a2[v13];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_27;
    }
  }
LABEL_14:
  if (v13 <= 3) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a2;
      if (v13 < 4) {
        goto LABEL_25;
      }
      goto LABEL_26;
    case 2:
      int v18 = *(unsigned __int16 *)a2;
      if (v13 >= 4) {
        goto LABEL_26;
      }
      goto LABEL_25;
    case 3:
      int v18 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v13 >= 4) {
        goto LABEL_26;
      }
      goto LABEL_25;
    case 4:
      int v18 = *(_DWORD *)a2;
      if (v13 < 4) {
LABEL_25:
      }
        v18 |= v16 << (8 * v13);
LABEL_26:
      unsigned int v15 = v18 + 3;
      break;
    default:
      break;
  }
LABEL_27:
  switch(v15)
  {
    case 2u:
      long long v19 = *((_OWORD *)a2 + 1);
      *a1 = *(_OWORD *)a2;
      a1[1] = v19;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      if (v13 <= 3)
      {
        unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
        if (v20 > 0xFFFC)
        {
          int v23 = 2;
          goto LABEL_57;
        }
        if (v20 > 0xFC)
        {
          LOWORD(v23) = 2;
          goto LABEL_60;
        }
      }
      char v21 = 2;
      goto LABEL_41;
    case 1u:
      uint64_t v22 = ~v10;
      (*(void (**)(_OWORD *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))(((unint64_t)a1 + v11) & v22, (unint64_t)&a2[v11] & v22, v8);
      if (v13 > 3)
      {
LABEL_40:
        char v21 = 1;
LABEL_41:
        *((unsigned char *)a1 + v13) = v21;
        if (v13 > 3) {
          goto LABEL_52;
        }
        goto LABEL_49;
      }
      int v23 = 1;
      unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v20 <= 0xFFFC)
      {
        if (v20 <= 0xFC) {
          goto LABEL_40;
        }
LABEL_60:
        *(_WORD *)((char *)a1 + v13) = v23;
        goto LABEL_61;
      }
LABEL_57:
      *(_DWORD *)((char *)a1 + v13) = v23;
      goto LABEL_61;
    case 0u:
      (*(void (**)(_OWORD *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      if (v13 > 3) {
        goto LABEL_31;
      }
      unsigned int v20 = ((1 << (8 * v13)) + 1) >> (8 * v13);
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + v13) = 0;
      }
      else
      {
        if (v20 <= 0xFC)
        {
LABEL_31:
          *((unsigned char *)a1 + v13) = 0;
          if (v13 > 3)
          {
LABEL_52:
            uint64_t v27 = 1;
            goto LABEL_63;
          }
          goto LABEL_49;
        }
        *(_WORD *)((char *)a1 + v13) = 0;
      }
LABEL_61:
      BOOL v28 = v20 > 0xFFFC;
      uint64_t v27 = 2;
      if (v28) {
        uint64_t v27 = 4;
      }
      goto LABEL_63;
  }
  if (v13 > 3) {
    goto LABEL_47;
  }
  unsigned int v24 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v25 = 2;
  if (v24 > 0xFFFC) {
    uint64_t v25 = 4;
  }
  if (v24 <= 0xFC) {
LABEL_47:
  }
    uint64_t v25 = 1;
  memcpy(a1, a2, v25 + v13);
  if (v13 > 3) {
    goto LABEL_52;
  }
LABEL_49:
  unsigned int v26 = ((1 << (8 * v13)) + 1) >> (8 * v13);
  uint64_t v27 = 2;
  if (v26 > 0xFFFC) {
    uint64_t v27 = 4;
  }
  if (v26 <= 0xFC) {
    goto LABEL_52;
  }
LABEL_63:
  *(void *)(((unint64_t)a1 + v27 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v27 + 7 + v13] & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

unsigned __int8 *sub_24C926DDC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (a1 == a2) {
    goto LABEL_84;
  }
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v38 = v7 + v10;
  uint64_t v39 = v8;
  unint64_t v11 = ((v7 + v10) & ~v10) + *(void *)(v9 + 64);
  if (v11 <= v7) {
    unint64_t v11 = v7;
  }
  if (v11 <= 0x28) {
    uint64_t v12 = 40;
  }
  else {
    uint64_t v12 = v11;
  }
  char v13 = 8 * v12;
  if (v12 > 3) {
    goto LABEL_10;
  }
  unsigned int v14 = ((1 << v13) + 1) >> v13;
  if (v14 > 0xFFFC)
  {
    unsigned int v15 = *(_DWORD *)&a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  if (v14 > 0xFC)
  {
    unsigned int v15 = *(unsigned __int16 *)&a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_10:
    unsigned int v15 = a1[v12];
    unsigned int v16 = v15 - 3;
    if (v15 < 3) {
      goto LABEL_28;
    }
  }
LABEL_15:
  if (v12 <= 3) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *a1;
      if (v12 < 4) {
        goto LABEL_26;
      }
      goto LABEL_27;
    case 2:
      int v18 = *(unsigned __int16 *)a1;
      if (v12 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 3:
      int v18 = *(unsigned __int16 *)a1 | (a1[2] << 16);
      if (v12 >= 4) {
        goto LABEL_27;
      }
      goto LABEL_26;
    case 4:
      int v18 = *(_DWORD *)a1;
      if (v12 < 4) {
LABEL_26:
      }
        v18 |= v16 << v13;
LABEL_27:
      unsigned int v15 = v18 + 3;
      break;
    default:
      break;
  }
LABEL_28:
  uint64_t v19 = ~v10;
  if (v15 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v15 != 1)
  {
    if (!v15)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
      goto LABEL_36;
    }
LABEL_33:
    if (v12 <= 3) {
      goto LABEL_37;
    }
LABEL_39:
    unsigned int v21 = a2[v12];
    unsigned int v22 = v21 - 3;
    if (v21 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v38] & v19, v39);
LABEL_36:
  if (v12 > 3) {
    goto LABEL_39;
  }
LABEL_37:
  unsigned int v20 = ((1 << v13) + 1) >> v13;
  if (v20 > 0xFFFC)
  {
    unsigned int v21 = *(_DWORD *)&a2[v12];
    unsigned int v22 = v21 - 3;
    if (v21 < 3) {
      goto LABEL_57;
    }
    goto LABEL_44;
  }
  if (v20 <= 0xFC) {
    goto LABEL_39;
  }
  unsigned int v21 = *(unsigned __int16 *)&a2[v12];
  unsigned int v22 = v21 - 3;
  if (v21 < 3) {
    goto LABEL_57;
  }
LABEL_44:
  if (v12 <= 3) {
    uint64_t v23 = v12;
  }
  else {
    uint64_t v23 = 4;
  }
  switch(v23)
  {
    case 1:
      int v24 = *a2;
      if (v12 < 4) {
        goto LABEL_55;
      }
      goto LABEL_56;
    case 2:
      int v24 = *(unsigned __int16 *)a2;
      if (v12 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 3:
      int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
      if (v12 >= 4) {
        goto LABEL_56;
      }
      goto LABEL_55;
    case 4:
      int v24 = *(_DWORD *)a2;
      if (v12 < 4) {
LABEL_55:
      }
        v24 |= v22 << v13;
LABEL_56:
      unsigned int v21 = v24 + 3;
      break;
    default:
      break;
  }
LABEL_57:
  if (v21 == 2)
  {
    long long v25 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v25;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    if (v12 <= 3)
    {
      unsigned int v26 = ((1 << v13) + 1) >> v13;
      if (v26 > 0xFFFC)
      {
        int v27 = 2;
        goto LABEL_80;
      }
      if (v26 > 0xFC)
      {
        LOWORD(v27) = 2;
        goto LABEL_83;
      }
    }
    a1[v12] = 2;
    goto LABEL_84;
  }
  if (v21 == 1)
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))((unint64_t)&a1[v38] & v19, (unint64_t)&a2[v38] & v19, v39);
    if (v12 > 3)
    {
LABEL_69:
      a1[v12] = 1;
      goto LABEL_84;
    }
    int v27 = 1;
    unsigned int v28 = ((1 << v13) + 1) >> v13;
    if (v28 <= 0xFFFC)
    {
      if (v28 <= 0xFC) {
        goto LABEL_69;
      }
LABEL_83:
      *(_WORD *)&a1[v12] = v27;
      goto LABEL_84;
    }
LABEL_80:
    *(_DWORD *)&a1[v12] = v27;
    goto LABEL_84;
  }
  if (v21)
  {
    if (v12 > 3) {
      goto LABEL_74;
    }
    unsigned int v29 = ((1 << v13) + 1) >> v13;
    uint64_t v30 = 2;
    if (v29 > 0xFFFC) {
      uint64_t v30 = 4;
    }
    if (v29 <= 0xFC) {
LABEL_74:
    }
      uint64_t v30 = 1;
    memcpy(a1, a2, v30 + v12);
  }
  else
  {
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
    if (v12 > 3)
    {
LABEL_61:
      a1[v12] = 0;
      goto LABEL_84;
    }
    unsigned int v31 = ((1 << v13) + 1) >> v13;
    if (v31 > 0xFFFC)
    {
      *(_DWORD *)&a1[v12] = 0;
    }
    else
    {
      if (v31 <= 0xFC) {
        goto LABEL_61;
      }
      *(_WORD *)&a1[v12] = 0;
    }
  }
LABEL_84:
  unint64_t v32 = *(void *)(v6 + 64);
  uint64_t v33 = *(void *)(sub_24C94A340() - 8);
  unint64_t v34 = ((v32 + *(unsigned __int8 *)(v33 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))
      + *(void *)(v33 + 64);
  if (v34 <= v32) {
    unint64_t v34 = v32;
  }
  if (v34 <= 0x28) {
    unint64_t v34 = 40;
  }
  if (v34 > 3) {
    goto LABEL_92;
  }
  unsigned int v35 = ((1 << (8 * v34)) + 1) >> (8 * v34);
  uint64_t v36 = 2;
  if (v35 > 0xFFFC) {
    uint64_t v36 = 4;
  }
  if (v35 <= 0xFC) {
LABEL_92:
  }
    uint64_t v36 = 1;
  *(void *)((unint64_t)&a1[v36 + 7 + v34] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v36 + 7 + v34] & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24C9273B8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(sub_24C94A340() - 8);
  unint64_t v7 = ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(void *)(v6 + 64);
  if (v7 <= v5) {
    unint64_t v7 = v5;
  }
  if (v7 <= 0x28) {
    unint64_t v7 = 40;
  }
  char v8 = 8 * v7;
  if (v7 > 3)
  {
    int v9 = 4;
LABEL_7:
    char v10 = 8;
    goto LABEL_8;
  }
  unsigned int v12 = ((1 << v8) + 1) >> v8;
  if (v12 > 0xFFFC) {
    goto LABEL_14;
  }
  int v9 = v12 + 3;
  if (v12 <= 0xFC) {
    goto LABEL_7;
  }
  char v10 = 16;
LABEL_8:
  unsigned int v11 = (1 << v10) - v9;
  if ((v11 & 0x80000000) == 0)
  {
    if (v7 > 3) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_14:
  unsigned int v11 = 0x7FFFFFFF;
  if (v7 > 3)
  {
LABEL_18:
    uint64_t v14 = 1;
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v13 = ((1 << v8) + 1) >> v8;
  uint64_t v14 = 2;
  if (v13 > 0xFFFC) {
    uint64_t v14 = 4;
  }
  if (v13 <= 0xFC) {
    goto LABEL_18;
  }
LABEL_19:
  if (!a2) {
    return 0;
  }
  if (v11 < a2)
  {
    unint64_t v15 = ((v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v16 = v15 & 0xFFFFFFF8;
    if ((v15 & 0xFFFFFFF8) != 0) {
      unsigned int v17 = 2;
    }
    else {
      unsigned int v17 = a2 - v11 + 1;
    }
    if (v17 >= 0x10000) {
      unsigned int v18 = 4;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v17 < 0x100) {
      unsigned int v18 = 1;
    }
    if (v17 >= 2) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    switch(v19)
    {
      case 1:
        int v20 = *((unsigned __int8 *)a1 + v15);
        if (!v20) {
          break;
        }
        goto LABEL_36;
      case 2:
        int v20 = *(unsigned __int16 *)((char *)a1 + v15);
        if (v20) {
          goto LABEL_36;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24C92789CLL);
      case 4:
        int v20 = *(_DWORD *)((char *)a1 + v15);
        if (!v20) {
          break;
        }
LABEL_36:
        int v21 = v20 - 1;
        if (v16)
        {
          int v21 = 0;
          int v22 = *(_DWORD *)a1;
        }
        else
        {
          int v22 = 0;
        }
        unsigned int v41 = v11 + (v22 | v21);
        return v41 + 1;
      default:
        break;
    }
  }
  if (!v11) {
    return 0;
  }
  if (v7 > 3)
  {
    int v23 = 4;
LABEL_42:
    char v24 = 8;
    goto LABEL_43;
  }
  unsigned int v29 = ((1 << v8) + 1) >> v8;
  if (v29 > 0xFFFC)
  {
LABEL_53:
    unsigned int v25 = 0x7FFFFFFF;
    if (v7 > 3) {
      goto LABEL_45;
    }
    goto LABEL_54;
  }
  int v23 = v29 + 3;
  if (v29 <= 0xFC) {
    goto LABEL_42;
  }
  char v24 = 16;
LABEL_43:
  unsigned int v25 = (1 << v24) - v23;
  if ((v25 & 0x80000000) != 0) {
    goto LABEL_53;
  }
  if (v7 > 3)
  {
LABEL_45:
    int v26 = 4;
LABEL_46:
    char v27 = 8;
    goto LABEL_47;
  }
LABEL_54:
  unsigned int v30 = ((1 << v8) + 1) >> v8;
  if (v30 > 0xFFFC)
  {
LABEL_57:
    if (v25 != 0x7FFFFFFF) {
      return 0;
    }
    goto LABEL_58;
  }
  int v26 = v30 + 3;
  if (v30 <= 0xFC) {
    goto LABEL_46;
  }
  char v27 = 16;
LABEL_47:
  int v28 = (1 << v27) - v26;
  if (v28 < 0) {
    goto LABEL_57;
  }
  if (v28 != v25) {
    return 0;
  }
LABEL_58:
  if (v7 > 3)
  {
    int v31 = 4;
LABEL_60:
    char v32 = 8;
    goto LABEL_61;
  }
  unsigned int v34 = ((1 << v8) + 1) >> v8;
  if (v34 > 0xFFFC) {
    goto LABEL_67;
  }
  int v31 = v34 + 3;
  if (v34 <= 0xFC) {
    goto LABEL_60;
  }
  char v32 = 16;
LABEL_61:
  unsigned int v33 = (1 << v32) - v31;
  if ((v33 & 0x80000000) == 0)
  {
    if (v7 > 3) {
      goto LABEL_71;
    }
    goto LABEL_68;
  }
LABEL_67:
  unsigned int v33 = 0x7FFFFFFF;
  if (v7 > 3)
  {
LABEL_71:
    uint64_t v36 = 1;
    goto LABEL_72;
  }
LABEL_68:
  unsigned int v35 = ((1 << v8) + 1) >> v8;
  uint64_t v36 = 2;
  if (v35 > 0xFFFC) {
    uint64_t v36 = 4;
  }
  if (v35 <= 0xFC) {
    goto LABEL_71;
  }
LABEL_72:
  if (!v25) {
    return 0;
  }
  unsigned int v37 = v25 - v33;
  if (v25 <= v33) {
    goto LABEL_94;
  }
  unint64_t v38 = v36 + v7;
  char v39 = 8 * (v36 + v7);
  if (v38 > 3)
  {
LABEL_75:
    int v40 = *((unsigned __int8 *)a1 + v38);
    goto LABEL_85;
  }
  unsigned int v43 = ((v37 + ~(-1 << v39)) >> v39) + 1;
  if (HIWORD(v43))
  {
    int v40 = *(_DWORD *)((char *)a1 + v38);
  }
  else
  {
    if (v43 <= 0xFF)
    {
      if (v43 < 2)
      {
LABEL_94:
        if (v33)
        {
          if (v7 <= 3)
          {
            unsigned int v53 = ((1 << v8) + 1) >> v8;
            if (v53 > 0xFFFC)
            {
              unsigned int v48 = *(_DWORD *)((char *)a1 + v7);
              unsigned int v49 = ~v48;
LABEL_104:
              unsigned int v52 = 0x7FFFFFFF;
LABEL_105:
              if (v52 > v49) {
                return -v48;
              }
              else {
                return 0;
              }
            }
            int v51 = v53 + 3;
            if (v53 > 0xFC)
            {
              int v55 = *(unsigned __int16 *)((char *)a1 + v7);
              unsigned int v48 = v55 | 0xFFFF0000;
              unsigned int v49 = v55 ^ 0xFFFF;
              char v50 = 16;
            }
            else
            {
              int v54 = *((unsigned __int8 *)a1 + v7);
              unsigned int v48 = v54 | 0xFFFFFF00;
              unsigned int v49 = v54 ^ 0xFF;
              char v50 = 8;
            }
          }
          else
          {
            int v47 = *((unsigned __int8 *)a1 + v7);
            unsigned int v48 = v47 | 0xFFFFFF00;
            unsigned int v49 = v47 ^ 0xFF;
            char v50 = 8;
            int v51 = 4;
          }
          unsigned int v52 = (1 << v50) - v51;
          if ((v52 & 0x80000000) == 0) {
            goto LABEL_105;
          }
          goto LABEL_104;
        }
        return 0;
      }
      goto LABEL_75;
    }
    int v40 = *(unsigned __int16 *)((char *)a1 + v38);
  }
LABEL_85:
  if (!v40) {
    goto LABEL_94;
  }
  int v44 = (v40 - 1) << v39;
  if (v38 > 3) {
    int v44 = 0;
  }
  if (v38)
  {
    if (v38 <= 3) {
      int v45 = v38;
    }
    else {
      int v45 = 4;
    }
    switch(v45)
    {
      case 2:
        int v46 = *a1;
        break;
      case 3:
        int v46 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v46 = *(_DWORD *)a1;
        break;
      default:
        int v46 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v46 = 0;
  }
  unsigned int v41 = v33 + (v46 | v44);
  return v41 + 1;
}

void sub_24C9278C0(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v8 = *(void *)(sub_24C94A340() - 8);
  unint64_t v9 = ((v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + *(void *)(v8 + 64);
  if (v9 <= v7) {
    unint64_t v9 = v7;
  }
  if (v9 <= 0x28) {
    unint64_t v9 = 40;
  }
  char v10 = 8 * v9;
  if (v9 > 3)
  {
    int v11 = 4;
LABEL_7:
    char v12 = 8;
    goto LABEL_8;
  }
  unsigned int v14 = ((1 << v10) + 1) >> v10;
  if (v14 > 0xFFFC) {
    goto LABEL_14;
  }
  int v11 = v14 + 3;
  if (v14 <= 0xFC) {
    goto LABEL_7;
  }
  char v12 = 16;
LABEL_8:
  unsigned int v13 = (1 << v12) - v11;
  if ((v13 & 0x80000000) == 0)
  {
    if (v9 > 3) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_14:
  unsigned int v13 = 0x7FFFFFFF;
  if (v9 > 3)
  {
LABEL_18:
    uint64_t v16 = 1;
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v15 = ((1 << v10) + 1) >> v10;
  uint64_t v16 = 2;
  if (v15 > 0xFFFC) {
    uint64_t v16 = 4;
  }
  if (v15 <= 0xFC) {
    goto LABEL_18;
  }
LABEL_19:
  size_t v17 = ((v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v13 < a3)
  {
    if (((v9 + v16 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v18 = a3 - v13 + 1;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v18 >= 0x10000) {
      int v19 = 4;
    }
    else {
      int v19 = 2;
    }
    if (v18 < 0x100) {
      int v19 = 1;
    }
    if (v18 >= 2) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    int v21 = a2 - v13;
    if (a2 <= v13) {
      goto LABEL_32;
    }
LABEL_36:
    if (v17) {
      int v22 = 1;
    }
    else {
      int v22 = v21;
    }
    if (v17)
    {
      int v23 = ~v13 + a2;
      bzero(a1, v17);
      *(_DWORD *)a1 = v23;
    }
    switch(v20)
    {
      case 1:
        a1[v17] = v22;
        break;
      case 2:
        *(_WORD *)&a1[v17] = v22;
        break;
      case 3:
LABEL_119:
        __break(1u);
        JUMPOUT(0x24C927E64);
      case 4:
        *(_DWORD *)&a1[v17] = v22;
        break;
      default:
        return;
    }
    return;
  }
  int v20 = 0;
  int v21 = a2 - v13;
  if (a2 > v13) {
    goto LABEL_36;
  }
LABEL_32:
  switch(v20)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_45;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_45;
    case 3:
      goto LABEL_119;
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_44;
    default:
LABEL_44:
      if (!a2) {
        return;
      }
LABEL_45:
      if (v9 > 3)
      {
        int v24 = 4;
LABEL_47:
        char v25 = 8;
        goto LABEL_48;
      }
      unsigned int v33 = ((1 << v10) + 1) >> v10;
      if (v33 > 0xFFFC)
      {
LABEL_63:
        unsigned int v26 = 0x7FFFFFFF;
        if (v9 > 3) {
          goto LABEL_50;
        }
        goto LABEL_64;
      }
      int v24 = v33 + 3;
      if (v33 <= 0xFC) {
        goto LABEL_47;
      }
      char v25 = 16;
LABEL_48:
      unsigned int v26 = (1 << v25) - v24;
      if ((v26 & 0x80000000) != 0) {
        goto LABEL_63;
      }
      if (v9 > 3)
      {
LABEL_50:
        int v27 = 4;
LABEL_51:
        char v28 = 8;
        goto LABEL_52;
      }
LABEL_64:
      unsigned int v34 = ((1 << v10) + 1) >> v10;
      if (v34 > 0xFFFC) {
        goto LABEL_67;
      }
      int v27 = v34 + 3;
      if (v34 <= 0xFC) {
        goto LABEL_51;
      }
      char v28 = 16;
LABEL_52:
      int v29 = (1 << v28) - v27;
      if ((v29 & 0x80000000) == 0)
      {
        if (v29 == v26) {
          goto LABEL_54;
        }
        goto LABEL_68;
      }
LABEL_67:
      if (v26 == 0x7FFFFFFF)
      {
LABEL_54:
        if (v9 <= 3)
        {
          unsigned int v37 = ((1 << v10) + 1) >> v10;
          if (v37 > 0xFFFC) {
            goto LABEL_81;
          }
          int v30 = v37 + 3;
          if (v37 > 0xFC)
          {
            char v31 = 16;
LABEL_57:
            unsigned int v32 = (1 << v31) - v30;
            if ((v32 & 0x80000000) == 0)
            {
              if (v9 > 3) {
                goto LABEL_85;
              }
              goto LABEL_82;
            }
LABEL_81:
            unsigned int v32 = 0x7FFFFFFF;
            if (v9 > 3)
            {
LABEL_85:
              uint64_t v39 = 1;
LABEL_86:
              size_t v40 = v39 + v9;
              BOOL v41 = v26 >= v32;
              unsigned int v42 = v26 - v32;
              if (v42 != 0 && v41)
              {
                if (v40 <= 3)
                {
                  unsigned int v46 = ((v42 + ~(-1 << (8 * v40))) >> (8 * v40)) + 1;
                  if (HIWORD(v46))
                  {
                    int v43 = 4;
                  }
                  else if (v46 >= 0x100)
                  {
                    int v43 = 2;
                  }
                  else
                  {
                    int v43 = v46 > 1;
                  }
                }
                else
                {
                  int v43 = 1;
                }
              }
              else
              {
                int v43 = 0;
              }
              if (v32 < a2)
              {
                unsigned int v44 = ~v32 + a2;
                if (v40 < 4)
                {
                  int v45 = (v44 >> (8 * v40)) + 1;
                  if (v40)
                  {
                    int v47 = v44 & ~(-1 << (8 * v40));
                    bzero(a1, v40);
                    if (v40 == 3)
                    {
                      *(_WORD *)a1 = v47;
                      a1[2] = BYTE2(v47);
                    }
                    else if (v40 == 2)
                    {
                      *(_WORD *)a1 = v47;
                    }
                    else
                    {
                      *a1 = v47;
                    }
                  }
                }
                else
                {
                  bzero(a1, v40);
                  *(_DWORD *)a1 = v44;
                  int v45 = 1;
                }
                switch(v43)
                {
                  case 1:
                    a1[v40] = v45;
                    return;
                  case 2:
                    *(_WORD *)&a1[v40] = v45;
                    return;
                  case 3:
                    goto LABEL_119;
                  case 4:
                    *(_DWORD *)&a1[v40] = v45;
                    return;
                  default:
                    return;
                }
              }
              switch(v43)
              {
                case 1:
                  a1[v40] = 0;
                  goto LABEL_105;
                case 2:
                  *(_WORD *)&a1[v40] = 0;
                  goto LABEL_105;
                case 3:
                  goto LABEL_119;
                case 4:
                  *(_DWORD *)&a1[v40] = 0;
                  goto LABEL_105;
                default:
LABEL_105:
                  int v48 = -a2;
                  if (v9 > 3) {
                    goto LABEL_108;
                  }
                  unsigned int v49 = ((1 << v10) + 1) >> v10;
                  if (v49 > 0xFFFC)
                  {
                    *(_DWORD *)&a1[v9] = v48;
                  }
                  else if (v49 > 0xFC)
                  {
                    *(_WORD *)&a1[v9] = v48;
                  }
                  else
                  {
LABEL_108:
                    a1[v9] = v48;
                  }
                  break;
              }
              return;
            }
LABEL_82:
            unsigned int v38 = ((1 << v10) + 1) >> v10;
            uint64_t v39 = 2;
            if (v38 > 0xFFFC) {
              uint64_t v39 = 4;
            }
            if (v38 > 0xFC) {
              goto LABEL_86;
            }
            goto LABEL_85;
          }
        }
        else
        {
          int v30 = 4;
        }
        char v31 = 8;
        goto LABEL_57;
      }
LABEL_68:
      if (v9 > 3) {
        goto LABEL_72;
      }
      unsigned int v35 = ((1 << v10) + 1) >> v10;
      uint64_t v36 = 2;
      if (v35 > 0xFFFC) {
        uint64_t v36 = 4;
      }
      if (v35 <= 0xFC) {
LABEL_72:
      }
        uint64_t v36 = 1;
      *(void *)((unint64_t)&a1[v9 + 7 + v36] & 0xFFFFFFFFFFFFFFF8) = a2 - 1;
      return;
  }
}

uint64_t sub_24C927EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void *sub_24C927EBC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C927EEC()
{
  return swift_bridgeObjectRelease();
}

void *sub_24C927EF4(void *a1, void *a2)
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

void *sub_24C927F44(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24C927F80(uint64_t a1, int a2)
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

uint64_t sub_24C927FC8(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for AsyncKeyedState()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C92801C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_24C928034(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24C9280C4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C928190);
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

uint64_t sub_24C9281B8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24C9281C0(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JournalEncoder.Failure(unsigned int *a1, int a2)
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

unsigned char *sub_24C92821C(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24C9282B8);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C9282E0()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for SideEffectCollisionBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24C928380(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24C92844CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_24C928474(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

uint64_t sub_24C928480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t getEnumTagSinglePayload for SideEffectDisposalBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24C928518(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C9285E4);
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

uint64_t sub_24C92860C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928628()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928644()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928660()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92867C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928698()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9286B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9286D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9286EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928708()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928724()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928740()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92875C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928778()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928794()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9287B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9287CC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9287E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928804()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928820()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92883C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C928858()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9288B0()
{
  uint64_t result = sub_24C94A2B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C928980()
{
  return sub_24C94A7F0();
}

uint64_t sub_24C9289AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + qword_2697FC9F8) = a4;
  *(double *)(v10 + 16) = a5;
  uint64_t v11 = v10 + qword_2697FC9E0;
  uint64_t v12 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a1, v12);
  unsigned int v13 = (void *)(v10 + qword_2697FC9E8);
  void *v13 = a2;
  v13[1] = a3;
  *(void *)(v10 + qword_2697FC9F0) = 0;
  return v10;
}

uint64_t sub_24C928A80()
{
  uint64_t v1 = qword_2697FC9F0;
  int v2 = *(void **)(v0 + qword_2697FC9F0);
  if (v2)
  {
    objc_msgSend(v2, sel_close);
    int v3 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = 0;
  }
  uint64_t v4 = v0 + qword_2697FC9E0;
  uint64_t v5 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_24C928B40()
{
  sub_24C928A80();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for JournalFileRecorder()
{
  return __swift_instantiateGenericMetadata();
}

void **sub_24C928BB0(void **a1, void **a2)
{
  int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void sub_24C928BE0(id *a1)
{
}

void **sub_24C928BE8(void **a1, void **a2)
{
  int v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_24C928C2C(void **a1, void **a2)
{
  int v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_24C928C60(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_24C928CB0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_24C928D04(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24C928D1C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

uint64_t type metadata accessor for JournalFileRecorder.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C928D54(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_24C928D5C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_24C928D68(uint64_t a1, double a2)
{
  *(void *)(v3 + 48) = v2;
  *(double *)(v3 + 40) = a2;
  *(void *)(v3 + 32) = a1;
  id v4 = (void *)*v2;
  uint64_t v5 = sub_24C94A5E0();
  *(void *)(v3 + 56) = v5;
  *(void *)(v3 + 64) = *(void *)(v5 - 8);
  *(void *)(v3 + 72) = swift_task_alloc();
  uint64_t v6 = sub_24C94A2B0();
  *(void *)(v3 + 80) = v6;
  *(void *)(v3 + 88) = *(void *)(v6 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  *(void *)(v3 + 104) = swift_task_alloc();
  uint64_t v7 = v4[10];
  *(void *)(v3 + 112) = v7;
  *(void *)(v3 + 120) = *(void *)(v7 - 8);
  *(void *)(v3 + 128) = swift_task_alloc();
  *(void *)(v3 + 136) = v4[11];
  *(void *)(v3 + 144) = v4[12];
  uint64_t v8 = type metadata accessor for JournalEntry();
  *(void *)(v3 + 152) = v8;
  *(void *)(v3 + 160) = *(void *)(v8 - 8);
  *(void *)(v3 + 168) = swift_task_alloc();
  swift_getWitnessTable();
  uint64_t v10 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C929030, v10, v9);
}

uint64_t sub_24C929030()
{
  uint64_t v88 = v0;
  v87[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 48);
  double v5 = *(double *)(v0 + 40);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 120) + 16))(v2, *(void *)(v0 + 32), v3);
  sub_24C92C68C(v2, v3, v1, v5 - *(double *)(v4 + 16));
  sub_24C94A1F0();
  swift_allocObject();
  sub_24C94A1E0();
  swift_getWitnessTable();
  uint64_t v8 = sub_24C94A1D0();
  unint64_t v10 = v9;
  uint64_t v11 = *(void *)(v0 + 48);
  swift_release();
  uint64_t v12 = *(void **)(v11 + qword_2697FC9F0);
  if (v12)
  {
    uint64_t v14 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 72);
    uint64_t v15 = *(void *)(v0 + 56);
    id v16 = v12;
    sub_24C94A5D0();
    uint64_t v17 = sub_24C94A5B0();
    unint64_t v19 = v18;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    if (v19 >> 60 == 15)
    {
      uint64_t v21 = *(void *)(v0 + 160);
      uint64_t v20 = *(void *)(v0 + 168);
      uint64_t v22 = *(void *)(v0 + 152);
      sub_24C9299A8();
      swift_allocError();
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);

      sub_24C9299FC(v8, v10);
    }
    else
    {
      sub_24C929A54(v17, v19);
      int v48 = sub_24C932F68(v17, v19);
      sub_24C929AAC(v17, v19);
      uint64_t v49 = 0;
      switch(v19 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v17), v17))
          {
            __break(1u);
LABEL_35:
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
          }
          uint64_t v49 = HIDWORD(v17) - (int)v17;
LABEL_23:
          objc_msgSend(v16, sel_write_maxLength_, v48 + 4, v49);
          swift_release();
          sub_24C929A54(v8, v10);
          uint64_t v62 = sub_24C932F68(v8, v10);
          sub_24C9299FC(v8, v10);
          uint64_t v63 = 0;
          switch(v10 >> 62)
          {
            case 1uLL:
              if (__OFSUB__(HIDWORD(v8), v8)) {
                goto LABEL_36;
              }
              uint64_t v63 = HIDWORD(v8) - (int)v8;
LABEL_28:
              uint64_t v67 = *(void *)(v0 + 160);
              uint64_t v66 = *(void *)(v0 + 168);
              uint64_t v68 = *(void *)(v0 + 152);
              objc_msgSend(v16, sel_write_maxLength_, v62 + 4, v63);
              swift_release();
              sub_24C9299FC(v8, v10);
              sub_24C929AAC(v17, v19);

              (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
              break;
            case 2uLL:
              uint64_t v65 = *(void *)(v8 + 16);
              uint64_t v64 = *(void *)(v8 + 24);
              uint64_t v63 = v64 - v65;
              if (!__OFSUB__(v64, v65)) {
                goto LABEL_28;
              }
              goto LABEL_37;
            case 3uLL:
              goto LABEL_28;
            default:
              uint64_t v63 = BYTE6(v10);
              goto LABEL_28;
          }
          break;
        case 2uLL:
          uint64_t v61 = *(void *)(v17 + 16);
          uint64_t v60 = *(void *)(v17 + 24);
          uint64_t v49 = v60 - v61;
          if (!__OFSUB__(v60, v61)) {
            goto LABEL_23;
          }
          goto LABEL_35;
        case 3uLL:
          goto LABEL_23;
        default:
          uint64_t v49 = BYTE6(v19);
          goto LABEL_23;
      }
    }
  }
  else
  {
    uint64_t v84 = (char *)qword_2697FC9F0;
    uint64_t v23 = *(void *)(v0 + 48);
    id v24 = objc_msgSend(self, sel_defaultManager);
    uint64_t v25 = v23 + qword_2697FC9E0;
    unsigned int v26 = (void *)sub_24C94A260();
    *(void *)(v0 + 16) = 0;
    unsigned int v27 = objc_msgSend(v24, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v26, 1, 0, v0 + 16);

    char v28 = *(void **)(v0 + 16);
    if (v27)
    {
      uint64_t v82 = v11;
      uint64_t v29 = *(void *)(v0 + 48);
      type metadata accessor for JournalFile();
      uint64_t v30 = v29 + qword_2697FC9E8;
      uint64_t v31 = *(void *)(v29 + qword_2697FC9E8);
      uint64_t v32 = *(void *)(v30 + 8);
      id v33 = v28;
      sub_24C929D1C(v25, v31, v32);
      if (qword_26B17DDB8 != -1) {
        swift_once();
      }
      uint64_t v35 = *(void *)(v0 + 96);
      uint64_t v34 = *(void *)(v0 + 104);
      uint64_t v36 = *(void *)(v0 + 80);
      uint64_t v37 = *(void *)(v0 + 88);
      uint64_t v38 = sub_24C94A370();
      __swift_project_value_buffer(v38, (uint64_t)qword_26B17F260);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v35, v34, v36);
      uint64_t v39 = sub_24C94A350();
      os_log_type_t v40 = sub_24C94A790();
      BOOL v41 = os_log_type_enabled(v39, v40);
      uint64_t v43 = *(void *)(v0 + 88);
      uint64_t v42 = *(void *)(v0 + 96);
      uint64_t v44 = *(void *)(v0 + 80);
      if (v41)
      {
        int v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        v87[0] = v80;
        *(_DWORD *)int v45 = 136315138;
        uint64_t v79 = v45 + 4;
        sub_24C929AD8();
        uint64_t v46 = sub_24C94AA90();
        *(void *)(v0 + 24) = sub_24C93BCD4(v46, v47, v87);
        sub_24C94A810();
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
        v81(v42, v44);
        _os_log_impl(&dword_24C91C000, v39, v40, "Opening journal stream at %s", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253301F20](v80, -1, -1);
        MEMORY[0x253301F20](v45, -1, -1);
      }
      else
      {
        uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
        v81(*(void *)(v0 + 96), *(void *)(v0 + 80));
      }
      id v54 = objc_allocWithZone(MEMORY[0x263EFF9E0]);
      int v55 = (void *)sub_24C94A260();
      id v56 = objc_msgSend(v54, sel_initWithURL_append_, v55, 0);

      if (v56)
      {
        objc_msgSend(v56, sel_open);
        uint64_t v57 = *(void **)&v84[v82];
        *(void *)&v84[v82] = v56;
        id v85 = v56;

        sub_24C929A54(v8, v10);
        uint64_t v58 = sub_24C932F68(v8, v10);
        sub_24C9299FC(v8, v10);
        uint64_t v59 = 0;
        switch(v10 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v8), v8)) {
              goto LABEL_38;
            }
            uint64_t v59 = HIDWORD(v8) - (int)v8;
LABEL_33:
            uint64_t v75 = *(void *)(v0 + 160);
            uint64_t v83 = *(void *)(v0 + 168);
            uint64_t v76 = *(void *)(v0 + 152);
            uint64_t v77 = *(void *)(v0 + 104);
            uint64_t v78 = *(void *)(v0 + 80);
            objc_msgSend(v85, sel_write_maxLength_, v58 + 4, v59, v79);
            swift_release();
            sub_24C9299FC(v8, v10);

            v81(v77, v78);
            (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v83, v76);
            break;
          case 2uLL:
            uint64_t v74 = *(void *)(v8 + 16);
            uint64_t v73 = *(void *)(v8 + 24);
            uint64_t v59 = v73 - v74;
            if (!__OFSUB__(v73, v74)) {
              goto LABEL_33;
            }
            goto LABEL_39;
          case 3uLL:
            goto LABEL_33;
          default:
            uint64_t v59 = BYTE6(v10);
            goto LABEL_33;
        }
      }
      else
      {
        uint64_t v69 = *(void *)(v0 + 160);
        id v86 = *(id *)(v0 + 168);
        uint64_t v70 = *(void *)(v0 + 152);
        uint64_t v71 = *(void *)(v0 + 104);
        uint64_t v72 = *(void *)(v0 + 80);
        type metadata accessor for JournalFileRecorder.Failure();
        swift_getWitnessTable();
        swift_allocError();
        swift_willThrow();
        sub_24C9299FC(v8, v10);
        v81(v71, v72);
        (*(void (**)(id, uint64_t))(v69 + 8))(v86, v70);
      }
    }
    else
    {
      uint64_t v51 = *(void *)(v0 + 160);
      uint64_t v50 = *(void *)(v0 + 168);
      uint64_t v52 = *(void *)(v0 + 152);
      id v53 = v28;
      sub_24C94A230();

      swift_willThrow();
      sub_24C9299FC(v8, v10);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

unint64_t sub_24C9299A8()
{
  unint64_t result = qword_2697FCB08;
  if (!qword_2697FCB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FCB08);
  }
  return result;
}

uint64_t sub_24C9299FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24C929A54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_24C929AAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24C9299FC(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for JournalFileRecorder.Failure()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24C929AD8()
{
  unint64_t result = qword_2697FCB10[0];
  if (!qword_2697FCB10[0])
  {
    sub_24C94A2B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697FCB10);
  }
  return result;
}

unsigned char *sub_24C929B30(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24C929BCCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C929BF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C929C14()
{
  uint64_t result = type metadata accessor for JournalMode();
  if (v1 <= 0x3F)
  {
    type metadata accessor for JournalFilePlayer();
    uint64_t result = sub_24C94A800();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_24C929D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24C94A240();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C94A2B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = a2;
  v14[1] = a3;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
  sub_24C92B320();
  sub_24C94A2A0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24C94A270();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_24C929EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  return sub_24C929F78(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24C929F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7 = v6;
  uint64_t v53 = a4;
  uint64_t v13 = *(void *)(*(void *)v6 + 80);
  uint64_t v14 = *(void *)(*(void *)v6 + 96);
  uint64_t v50 = *(void *)(*(void *)v6 + 88);
  uint64_t v51 = v13;
  uint64_t v49 = v14;
  uint64_t v15 = type metadata accessor for JournalFilePlayer();
  uint64_t v16 = sub_24C94A800();
  uint64_t v42 = *(void *)(v16 - 8);
  uint64_t v43 = v16;
  MEMORY[0x270FA5388](v16);
  unint64_t v18 = (char *)&v40 - v17;
  uint64_t v19 = sub_24C94A240();
  uint64_t v45 = *(void *)(v19 - 8);
  uint64_t v46 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v44 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_24C94A2B0();
  uint64_t v47 = *(void *)(v54 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v54);
  int v48 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  BOOL v41 = (char *)&v40 - v23;
  uint64_t v24 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v24);
  unsigned int v26 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v6 + qword_2697FCBB0) = 0;
  unsigned int v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v27(v7 + *(void *)(*(void *)v7 + 136), 1, 1, v15);
  sub_24C92BF48(a1, v6 + qword_2697FCB98);
  *(double *)(v6 + qword_2697FCBA0) = a5;
  char v28 = (uint64_t *)(v6 + qword_2697FCBA8);
  uint64_t v52 = a2;
  *char v28 = a2;
  v28[1] = a3;
  uint64_t v29 = a3;
  *(void *)(v6 + *(void *)(*(void *)v6 + 144)) = v53;
  sub_24C92BF48(a1, (uint64_t)v26);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
      sub_24C92C2D0(a1);
      uint64_t v31 = (uint64_t)v48;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v48, v26, v54);
      sub_24C932140(v31, v52, a3, (uint64_t)v18, a6 - a5);
      v27((uint64_t)v18, 0, 1, v15);
      uint64_t v32 = v6 + *(void *)(*(void *)v6 + 136);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v42 + 40))(v32, v18, v43);
      swift_endAccess();
    }
    else
    {
      sub_24C92C2D0(a1);
    }
  }
  else
  {
    uint64_t v53 = *(void *)&v26[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48)];
    uint64_t v33 = v47;
    uint64_t v34 = v41;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v41, v26, v54);
    uint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    uint64_t v40 = v29;
    swift_bridgeObjectRetain();
    sub_24C94A620();
    pid_t v55 = getpid();
    sub_24C94AA90();
    sub_24C94A620();
    swift_bridgeObjectRelease();
    sub_24C94A620();
    sub_24C94A750();
    uint64_t v36 = v44;
    uint64_t v35 = v45;
    uint64_t v37 = v46;
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F06E50], v46);
    sub_24C92B320();
    uint64_t v38 = (uint64_t)v48;
    sub_24C94A2A0();
    sub_24C92C2D0(a1);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v54);
    swift_bridgeObjectRelease();
    type metadata accessor for JournalFileRecorder();
    *(void *)(v6 + qword_2697FCBB0) = sub_24C9289AC(v38, v52, v40, v53, a5);
    swift_release();
  }
  return v7;
}

uint64_t sub_24C92A54C()
{
  sub_24C92C2D0(v0 + qword_2697FCB98);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 136);
  type metadata accessor for JournalFilePlayer();
  uint64_t v2 = sub_24C94A800();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24C92A660()
{
  sub_24C92A54C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for JournalFile()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24C92A6D0()
{
  uint64_t v1 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v1);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C92BF48(v0 + qword_2697FCB98, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_24C94A2B0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  }
  else
  {
    sub_24C92C2D0((uint64_t)v3);
  }
  return EnumCaseMultiPayload == 1;
}

uint64_t sub_24C92A7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = *(void *)(*v2 + 88);
  uint64_t v8 = *(void *)(*v2 + 96);
  uint64_t v9 = type metadata accessor for JournalFilePlayer();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - v11;
  uint64_t v13 = (uint64_t)v2 + *(void *)(v5 + 136);
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v9);
  if (!result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v6;
    v15[3] = v7;
    v15[4] = v8;
    v15[5] = a1;
    v15[6] = a2;
    swift_retain();
    sub_24C932200((uint64_t)sub_24C92B2F8, (uint64_t)v15, v9);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_24C92AA2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)(v3 + *(void *)(*(void *)v3 + 144));
  swift_beginAccess();
  uint64_t v12 = *v11;
  if (*(void *)(*v11 + 16) && (unint64_t v13 = sub_24C92B65C(a1), (v14 & 1) != 0)) {
    uint64_t v15 = *(void *)(*(void *)(v12 + 56) + 8 * v13);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = swift_endAccess();
  if (__OFADD__(v15, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v27 = sub_24C94ABE0();
    uint64_t v28 = v17;
    sub_24C94A620();
    uint64_t v26 = v15 + 1;
    sub_24C94AA90();
    sub_24C94A620();
    swift_bridgeObjectRelease();
    uint64_t v18 = v28;
    uint64_t v25 = v27;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v11;
    *uint64_t v11 = 0x8000000000000000;
    sub_24C92BE18(v15 + 1, a1, isUniquelyReferenced_nonNull_native);
    *uint64_t v11 = v26;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v20 = type metadata accessor for JournalFile();
    sub_24C92BF48(v4 + qword_2697FCB98, (uint64_t)v10);
    double v21 = *(double *)(v4 + qword_2697FCBA0);
    uint64_t v22 = *v11;
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_24C929F78((uint64_t)v10, v25, v18, v22, v21, a3);
    a2[3] = v20;
    uint64_t result = swift_getWitnessTable();
    a2[4] = result;
    *a2 = v23;
  }
  return result;
}

uint64_t sub_24C92ACF4(uint64_t a1, double a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = v6;
  *((void *)v16 + 5) = *(void *)(v5 + 88);
  *((void *)v16 + 6) = *(void *)(v5 + 96);
  *((void *)v16 + 7) = v2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v16[v15], v10, v6);
  *(double *)&v16[(v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8] = a2;
  swift_retain();
  sub_24C94738C((uint64_t)v13, (uint64_t)&unk_2697FCC40, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24C92AF24(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 32) = a1;
  *(void *)(v6 + 16) = a5;
  *(void *)(v6 + 24) = a6;
  return MEMORY[0x270FA2498](sub_24C92AF48, 0, 0);
}

uint64_t sub_24C92AF48()
{
  uint64_t v1 = *(void *)(*((void *)v0 + 2) + qword_2697FCBB0);
  *((void *)v0 + 5) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *((void *)v0 + 6) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24C92B034;
    double v3 = v0[4];
    uint64_t v4 = *((void *)v0 + 3);
    return sub_24C928D68(v4, v3);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v6();
  }
}

uint64_t sub_24C92B034()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24C92B170, 0, 0);
  }
  else
  {
    swift_release();
    double v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24C92B170()
{
  swift_release();
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = sub_24C94A370();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B17F260);
  sub_24C93831C(v1);

  double v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

BOOL sub_24C92B22C()
{
  return sub_24C92A6D0();
}

uint64_t sub_24C92B254@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  return sub_24C92AA2C(a1, a2, a3);
}

uint64_t sub_24C92B278(uint64_t a1, double a2)
{
  return sub_24C92ACF4(a1, a2);
}

uint64_t sub_24C92B29C(uint64_t a1, uint64_t a2)
{
  return sub_24C92A7BC(a1, a2);
}

uint64_t sub_24C92B2C0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C92B2F8()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

unint64_t sub_24C92B320()
{
  unint64_t result = qword_26B17DE48;
  if (!qword_26B17DE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17DE48);
  }
  return result;
}

uint64_t sub_24C92B374()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24C92B44C()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(*(void *)(*(void *)(v0 + 32) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[4] = v5;
  v6[2] = v3;
  v6[3] = v4;
  v6[1] = sub_24C92B568;
  return MEMORY[0x270FA2498](sub_24C92AF48, 0, 0);
}

uint64_t sub_24C92B568()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24C92B65C(uint64_t a1)
{
  uint64_t v2 = sub_24C94AB30();
  return sub_24C92B6E4(a1, v2);
}

unint64_t sub_24C92B6A0(uint64_t a1)
{
  uint64_t v2 = sub_24C94A870();
  return sub_24C92B780(a1, v2);
}

unint64_t sub_24C92B6E4(uint64_t a1, uint64_t a2)
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

unint64_t sub_24C92B780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24C92C32C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253301530](v9, a1);
      sub_24C92C388((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24C92B848(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA8);
  uint64_t result = sub_24C94A980();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    uint64_t v34 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_24C94AB30();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24C92BAF0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEB0);
  uint64_t v6 = sub_24C94A980();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v44 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v23 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v24 = v23 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v11) {
      break;
    }
    unint64_t v26 = (void *)(v5 + 64);
    unint64_t v27 = *(void *)(v44 + 8 * v25);
    ++v14;
    if (!v27)
    {
      int64_t v14 = v25 + 1;
      if (v25 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v27 = *(void *)(v44 + 8 * v14);
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = *(void *)(v44 + 8 * v28);
        if (!v27)
        {
          while (1)
          {
            int64_t v14 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v27 = *(void *)(v44 + 8 * v14);
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v28;
      }
    }
LABEL_21:
    unint64_t v10 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v5 + 48) + 40 * v24;
    if (a2)
    {
      long long v30 = *(_OWORD *)v29;
      long long v31 = *(_OWORD *)(v29 + 16);
      uint64_t v51 = *(void *)(v29 + 32);
      long long v49 = v30;
      long long v50 = v31;
      uint64_t v32 = (long long *)(*(void *)(v5 + 56) + (v24 << 6));
      long long v34 = v32[2];
      long long v33 = v32[3];
      long long v35 = v32[1];
      long long v45 = *v32;
      long long v46 = v35;
      long long v47 = v34;
      long long v48 = v33;
    }
    else
    {
      sub_24C92C32C(v29, (uint64_t)&v49);
      sub_24C92C630(*(void *)(v5 + 56) + (v24 << 6), (uint64_t)&v45);
    }
    uint64_t result = sub_24C94A870();
    uint64_t v36 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v12 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v37) & ~*(void *)(v12 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v12 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v15 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v49;
    long long v18 = v50;
    *(void *)(v16 + 32) = v51;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    int64_t v19 = (_OWORD *)(*(void *)(v7 + 56) + (v15 << 6));
    long long v20 = v45;
    long long v21 = v46;
    long long v22 = v48;
    v19[2] = v47;
    v19[3] = v22;
    _OWORD *v19 = v20;
    v19[1] = v21;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v26 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v5 + 32);
  if (v43 >= 64) {
    bzero(v26, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v43;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24C92BE18(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_24C92B65C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24C92C140();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = 8 * v10;
    *(void *)(v16[6] + v18) = a2;
    *(void *)(v16[7] + v18) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_24C92B848(result, a3 & 1);
  uint64_t result = sub_24C92B65C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_24C94AAC0();
  __break(1u);
  return result;
}

uint64_t sub_24C92BF48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalMode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C92BFAC(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_24C92B6A0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 < v13 || (a3 & 1) != 0)
    {
      sub_24C92BAF0(v13, a3 & 1);
      unint64_t v19 = sub_24C92B6A0(a2);
      if ((v14 & 1) != (v20 & 1))
      {
LABEL_17:
        uint64_t result = sub_24C94AAC0();
        __break(1u);
        return result;
      }
      unint64_t v10 = v19;
      uint64_t v16 = (void *)*v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    sub_24C92C3DC();
  }
  uint64_t v16 = (void *)*v4;
  if ((v14 & 1) == 0)
  {
LABEL_13:
    uint64_t result = sub_24C92C32C(a2, (uint64_t)v31);
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v21 = v16[6] + 40 * v10;
    long long v22 = v31[0];
    long long v23 = v31[1];
    *(void *)(v21 + 32) = v32;
    *(_OWORD *)uint64_t v21 = v22;
    *(_OWORD *)(v21 + 16) = v23;
    unint64_t v24 = (_OWORD *)(v16[7] + (v10 << 6));
    long long v25 = *a1;
    long long v26 = a1[1];
    long long v27 = a1[3];
    v24[2] = a1[2];
    v24[3] = v27;
    *unint64_t v24 = v25;
    v24[1] = v26;
    uint64_t v28 = v16[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (!v29)
    {
      v16[2] = v30;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v17 = v16[7] + (v10 << 6);
  return sub_24C92C5D4((uint64_t)a1, v17);
}

void *sub_24C92C140()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C94A970();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24C92C2D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalMode();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C92C32C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24C92C388(uint64_t a1)
{
  return a1;
}

void *sub_24C92C3DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C94A970();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_24C92C32C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v29);
    unint64_t v17 = v15 << 6;
    uint64_t result = (void *)sub_24C92C630(*(void *)(v2 + 56) + v17, (uint64_t)v28);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v29[1];
    long long v20 = v29[0];
    *(void *)(v18 + 32) = v30;
    *(_OWORD *)uint64_t v18 = v20;
    *(_OWORD *)(v18 + 16) = v19;
    unint64_t v21 = (_OWORD *)(*(void *)(v4 + 56) + v17);
    long long v22 = v28[0];
    long long v23 = v28[1];
    long long v24 = v28[3];
    void v21[2] = v28[2];
    v21[3] = v24;
    *unint64_t v21 = v22;
    v21[1] = v23;
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24C92C5D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24C92C630(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24C92C68C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  uint64_t result = type metadata accessor for JournalEntry();
  *(double *)(a3 + *(int *)(result + 44)) = a4;
  return result;
}

uint64_t type metadata accessor for JournalEntry()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C92C734()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24C92C7D0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_24C92C8C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24C92C8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24C92C970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24C92C9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24C92CA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24C92CAE4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24C92CBF8);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_24C92CC0C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            uint64_t v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x24C92CDB8);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

uint64_t sub_24C92CDE0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v3 || (sub_24C94AAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24C94AAB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24C92CECC(char a1)
{
  if (a1) {
    return 0x6D617473656D6974;
  }
  else {
    return 0x6E6F69746361;
  }
}

uint64_t sub_24C92CF04(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  v11[0] = *(void *)(a2 + 32);
  v11[1] = v4;
  type metadata accessor for JournalEntry.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_24C94AA80();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  size_t v8 = (char *)v11 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C94AB90();
  char v13 = 0;
  uint64_t v9 = v11[3];
  sub_24C94AA70();
  if (!v9)
  {
    char v12 = 1;
    sub_24C94AA50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24C92D0A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v26 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v30 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for JournalEntry.CodingKeys();
  swift_getWitnessTable();
  uint64_t v8 = sub_24C94AA20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v8);
  int v11 = (char *)&v23 - v10;
  uint64_t v27 = a3;
  uint64_t v12 = type metadata accessor for JournalEntry();
  uint64_t v24 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int v14 = (char *)&v23 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v15 = (uint64_t)v31;
  sub_24C94AB80();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  long long v31 = a1;
  uint64_t v16 = v14;
  uint64_t v17 = v26;
  char v33 = 0;
  uint64_t v18 = v28;
  sub_24C94AA00();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v16, v30, a2);
  char v32 = 1;
  sub_24C94A9E0();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v18);
  *(void *)&v16[*(int *)(v12 + 44)] = v20;
  uint64_t v21 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v25, v16, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v16, v12);
}

BOOL sub_24C92D444(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24C91F884(*a1, *a2);
}

uint64_t sub_24C92D45C()
{
  return sub_24C91F990();
}

uint64_t sub_24C92D470()
{
  return sub_24C91F894();
}

uint64_t sub_24C92D484()
{
  return sub_24C94AB70();
}

uint64_t sub_24C92D4D0()
{
  return sub_24C92CECC(*v0);
}

uint64_t sub_24C92D4E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C92CDE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C92D518@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C9234B0();
  *a1 = result;
  return result;
}

uint64_t sub_24C92D54C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24C92D5A0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24C92D5F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24C92D0A8(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24C92D618(void *a1, uint64_t a2)
{
  return sub_24C92CF04(a1, a2);
}

uint64_t type metadata accessor for JournalEntry.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_24C92D648(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C92D714);
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

uint64_t sub_24C92D73C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92D758()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92D774()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C92D790()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24C92D80C()
{
  return sub_24C94A7F0();
}

uint64_t sub_24C92D830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10 = swift_allocObject();
  sub_24C92D8A8(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_24C92D8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v12 - 8);
  int v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C94A1F0();
  swift_allocObject();
  uint64_t v15 = sub_24C94A1E0();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a5;
  *(void *)(v5 + 48) = v15;
  *(void *)(v5 + 56) = a4;
  uint64_t v16 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a1;
  v17[5] = a2;
  v17[6] = a3;
  swift_bridgeObjectRetain();
  sub_24C94738C((uint64_t)v14, (uint64_t)&unk_2697FCD58, (uint64_t)v17);
  swift_release();
  return v6;
}

uint64_t sub_24C92DA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_24C92DA2C, 0, 0);
}

uint64_t sub_24C92DA2C()
{
  unint64_t v1 = *(sqlite3 **)(v0 + 24);
  sub_24C94A890();
  sub_24C94A620();
  sub_24C94A620();
  sub_24C94A620();
  sub_24C944330(0, 0xE000000000000000, v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24C92DCC4()
{
  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_24C92DCF4()
{
  sub_24C92DCC4();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for JournalDatabaseRecorder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C92DD44(uint64_t a1, double a2)
{
  *(void *)(v3 + 88) = v2;
  *(double *)(v3 + 80) = a2;
  *(void *)(v3 + 72) = a1;
  uint64_t v4 = *v2;
  *(void *)(v3 + 96) = *v2;
  uint64_t v5 = *(void *)(v4 + 80);
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 112) = *(void *)(v5 - 8);
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  sub_24C94A5E0();
  *(void *)(v3 + 136) = swift_task_alloc();
  swift_getWitnessTable();
  uint64_t v7 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C92DEBC, v7, v6);
}

uint64_t sub_24C92DEBC()
{
  uint64_t v24 = v0;
  unint64_t v1 = *(sqlite3 **)(*(void *)(v0 + 88) + 16);
  sub_24C944330(0x6E69676562, 0xE500000000000000, v1);
  uint64_t v3 = sub_24C94A1D0();
  unint64_t v5 = v4;
  sub_24C94A5D0();
  uint64_t v6 = sub_24C94A5C0();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v21 = v1;
    uint64_t v9 = *(void *)(v0 + 88);
    double v10 = *(double *)(v0 + 80);
    id v22 = (id)v6;
    sub_24C94A890();
    swift_bridgeObjectRelease();
    HIWORD(v23[1]) = -4864;
    swift_bridgeObjectRetain();
    sub_24C94A620();
    swift_bridgeObjectRelease();
    sub_24C94A620();
    uint64_t v19 = v23[1];
    uint64_t v20 = v23[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEC0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C94C4E0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEB8);
    uint64_t v12 = *(void *)(type metadata accessor for DatabaseBinding() - 8);
    uint64_t v13 = *(void *)(v12 + 72);
    unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_24C94C4F0;
    uint64_t v16 = (double *)(v15 + v14);
    *uint64_t v16 = v10 - *(double *)(v9 + 40);
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = (void *)((char *)v16 + v13);
    *uint64_t v17 = v22;
    v17[1] = v8;
    swift_storeEnumTagMultiPayload();
    *(void *)(inited + 32) = v15;
    sub_24C9443F4(v20, v19, inited, v21);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE60);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    sub_24C944330(0x74696D6D6F63, 0xE600000000000000, v21);
  }
  else
  {
    sub_24C944330(0x6B6361626C6C6F72, 0xE800000000000000, v1);
  }
  sub_24C9299FC(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24C92E484()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C92E4C4()
{
  long long v5 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24C92B568;
  *(void *)(v3 + 40) = v2;
  *(_OWORD *)(v3 + 24) = v5;
  return MEMORY[0x270FA2498](sub_24C92DA2C, 0, 0);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalMode(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v13 = sub_24C94A2B0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_24C94A2B0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48);
      double v10 = *(void **)((char *)a2 + v9);
      *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
      id v11 = v10;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void destroy for JournalMode(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_24C94A2B0();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    v6(a1, v5);
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v3 = sub_24C94A2B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    unint64_t v4 = *(void **)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48));
  }
}

char *initializeWithCopy for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = sub_24C94A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24C94A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48);
    uint64_t v9 = *(void **)&a2[v8];
    *(void *)&a1[v8] = v9;
    id v10 = v9;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for JournalMode(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C92C2D0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_24C94A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24C94A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48);
      uint64_t v9 = *(void **)&a2[v8];
      *(void *)&a1[v8] = v9;
      id v10 = v9;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for JournalMode()
{
  uint64_t result = qword_26B17D188;
  if (!qword_26B17D188) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *initializeWithTake for JournalMode(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v9 = sub_24C94A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24C94A2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508);
    *(void *)&a1[*(int *)(v8 + 48)] = *(void *)&a2[*(int *)(v8 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for JournalMode(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C92C2D0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = sub_24C94A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24C94A2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508);
      *(void *)&a1[*(int *)(v8 + 48)] = *(void *)&a2[*(int *)(v8 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalMode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for JournalMode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24C92ED2C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24C92ED3C()
{
  uint64_t result = sub_24C94A2B0();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v3[4] = v3;
    v3[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24C92EDE8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24C92EE64(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  return sub_24C92EEF8(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_24C92EEF8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  uint64_t v9 = v8;
  *(void *)(v9 + 40) = a1;
  *(void *)(v9 + 48) = a2;
  *(unsigned char *)(v9 + 56) = a3;
  *(double *)(v9 + 32) = a7;
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = a5;
  *(void *)(v9 + 112) = a6;
  if (a3)
  {
    if (a3 == 1)
    {
      *(void *)(v9 + 64) = 0;
      double v14 = a8 - a7;
      swift_bridgeObjectRetain();
      sub_24C930CD4(a1, a4, a5, (uint64_t)v19, v14);
      long long v15 = v19[1];
      uint64_t v16 = v20;
      *(_OWORD *)(v9 + 72) = v19[0];
      *(_OWORD *)(v9 + 88) = v15;
      *(void *)(v9 + 104) = v16;
    }
    else
    {
      *(_OWORD *)(v9 + 80) = 0u;
      *(_OWORD *)(v9 + 96) = 0u;
      *(_OWORD *)(v9 + 64) = 0u;
    }
  }
  else
  {
    type metadata accessor for JournalDatabaseRecorder();
    swift_bridgeObjectRetain();
    sub_24C92F100(a1, a2, 0);
    *(void *)(v9 + 64) = sub_24C92D830(a1, a4, a5, a2, a7);
    *(_OWORD *)(v9 + 72) = 0u;
    *(_OWORD *)(v9 + 88) = 0u;
    *(void *)(v9 + 104) = 0;
  }
  return v9;
}

uint64_t sub_24C92F064()
{
  swift_bridgeObjectRelease();
  sub_24C92F120(*(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  swift_release();
  sub_24C9301E0(*(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24C92F0B0()
{
  sub_24C92F064();
  return MEMORY[0x270FA0228](v0, 120, 7);
}

uint64_t type metadata accessor for JournalDatabase()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C92F100(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return MEMORY[0x270F9A8A0]();
  }
  return result;
}

uint64_t destroy for JournalDatabaseMode(uint64_t a1)
{
  return sub_24C92F120(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24C92F120(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t _s8DataFlow19JournalDatabaseModeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24C92F100(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JournalDatabaseMode(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24C92F100(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24C92F120(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JournalDatabaseMode(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24C92F120(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalDatabaseMode(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JournalDatabaseMode(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24C92F2BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24C92F2D4(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for JournalDatabaseMode()
{
  return &type metadata for JournalDatabaseMode;
}

BOOL sub_24C92F2FC()
{
  return *(unsigned char *)(v0 + 56) == 1;
}

uint64_t sub_24C92F30C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C92BF48(a1, (uint64_t)v10);
  uint64_t v11 = sub_24C9302FC((uint64_t)v10);
  uint64_t v13 = v12;
  char v15 = v14;
  unint64_t v16 = sub_24C930224(MEMORY[0x263F8EE78]);
  swift_allocObject();
  uint64_t v17 = sub_24C92EEF8((uint64_t)v11, v13, v15, a2, a3, v16, a4, a4);
  sub_24C92C2D0(a1);
  return v17;
}

uint64_t sub_24C92F620(uint64_t result, uint64_t a2)
{
  if (v2[11])
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)*v2;
    char v6 = (void *)swift_allocObject();
    v6[2] = v5[10];
    v6[3] = v5[11];
    v6[4] = v5[12];
    v6[5] = v4;
    v6[6] = a2;
    uint64_t v7 = (void *)type metadata accessor for JournalDatabasePlayer();
    swift_retain();
    sub_24C930D48((uint64_t)sub_24C92B2F8, (uint64_t)v6, v7);
    return swift_release();
  }
  return result;
}

uint64_t sub_24C92F7A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v4 = v3;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v3 + 112);
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_24C92B65C(a1), (v10 & 1) != 0)) {
    uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t result = swift_endAccess();
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = sub_24C94ABE0();
    uint64_t v24 = v13;
    sub_24C94A620();
    sub_24C94AA90();
    sub_24C94A620();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *(void *)(v4 + 112);
    *(void *)(v4 + 112) = 0x8000000000000000;
    sub_24C92BE18(v11 + 1, a1, isUniquelyReferenced_nonNull_native);
    *(void *)(v4 + 112) = v22;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v15 = type metadata accessor for JournalDatabase();
    uint64_t v16 = *(void *)(v4 + 40);
    uint64_t v17 = *(void *)(v4 + 48);
    double v18 = *(double *)(v4 + 32);
    uint64_t v19 = *(void *)(v4 + 112);
    char v20 = *(unsigned char *)(v4 + 56);
    sub_24C92F100(v16, v17, v20);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_24C92EEF8(v16, v17, v20, v23, v24, v19, v18, a3);
    a2[3] = v15;
    uint64_t result = swift_getWitnessTable();
    a2[4] = result;
    *a2 = v21;
  }
  return result;
}

uint64_t sub_24C92FA10(uint64_t a1, double a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  char v10 = (char *)&v18 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = v6;
  *((void *)v16 + 5) = *(void *)(v5 + 88);
  *((void *)v16 + 6) = *(void *)(v5 + 96);
  *((void *)v16 + 7) = v2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v16[v15], v10, v6);
  *(double *)&v16[(v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8] = a2;
  swift_retain();
  sub_24C94738C((uint64_t)v13, (uint64_t)&unk_2697FCD68, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24C92FC40(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 32) = a1;
  *(void *)(v6 + 16) = a5;
  *(void *)(v6 + 24) = a6;
  return MEMORY[0x270FA2498](sub_24C92FC64, 0, 0);
}

uint64_t sub_24C92FC64()
{
  if (*(void *)(*((void *)v0 + 2) + 64))
  {
    unint64_t v1 = (void *)swift_task_alloc();
    *((void *)v0 + 5) = v1;
    *unint64_t v1 = v0;
    v1[1] = sub_24C92FD38;
    double v2 = v0[4];
    uint64_t v3 = *((void *)v0 + 3);
    return sub_24C92DD44(v3, v2);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v5();
  }
}

uint64_t sub_24C92FD38()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24C92FE6C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24C92FE6C()
{
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = sub_24C94A370();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B17F260);
  sub_24C93831C(v1);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

BOOL sub_24C92FF20()
{
  return sub_24C92F2FC();
}

uint64_t sub_24C92FF48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  return sub_24C92F7A0(a1, a2, a3);
}

uint64_t sub_24C92FF6C(uint64_t a1, double a2)
{
  return sub_24C92FA10(a1, a2);
}

uint64_t sub_24C92FF90(uint64_t a1, uint64_t a2)
{
  return sub_24C92F620(a1, a2);
}

uint64_t sub_24C92FFB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C92FFEC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24C9300C4()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(*(void *)(*(void *)(v0 + 32) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[4] = v5;
  v6[2] = v3;
  v6[3] = v4;
  v6[1] = sub_24C92B568;
  return MEMORY[0x270FA2498](sub_24C92FC64, 0, 0);
}

uint64_t sub_24C9301E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_24C930224(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA8);
    uint64_t v3 = (void *)sub_24C94A990();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_24C92B65C(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

sqlite3 *sub_24C9302FC(uint64_t a1)
{
  v62[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_24C94A240();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C94A2B0();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v53 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v56 = (sqlite3 *)((char *)&v53 - v14);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v57 = (sqlite3 *)((char *)&v53 - v16);
  MEMORY[0x270FA5388](v15);
  uint64_t v58 = (char *)&v53 - v17;
  uint64_t v18 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v18);
  char v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C92BF48(a1, (uint64_t)v20);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v55 = a1;
      uint64_t v22 = v59;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v12, v20, v6);
      strcpy((char *)v62, "action.journal");
      HIBYTE(v62[1]) = -18;
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06E38], v2);
      sub_24C92B320();
      sub_24C94A2A0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_bridgeObjectRelease();
      uint64_t v23 = (void *)sub_24C94A290();
      uint64_t v24 = v60;
      uint64_t v26 = sub_24C944BC0(v23, v25, 1);
      uint64_t v60 = v24;
      if (v24)
      {
        swift_bridgeObjectRelease();
        sub_24C92C2D0(v55);
        uint64_t v27 = *(sqlite3 **)(v22 + 8);
        ((void (*)(char *, uint64_t))v27)(v9, v6);
        ((void (*)(char *, uint64_t))v27)(v12, v6);
      }
      else
      {
        uint64_t v27 = v26;
        swift_bridgeObjectRelease();
        sub_24C92C2D0(v55);
        uint64_t v51 = *(void (**)(char *, uint64_t))(v22 + 8);
        v51(v9, v6);
        v51(v12, v6);
      }
    }
    else
    {
      sub_24C92C2D0(a1);
      return 0;
    }
  }
  else
  {
    uint64_t v55 = a1;
    id v54 = *(id *)&v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17D508) + 48)];
    (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v58, v20, v6);
    v62[0] = 0;
    v62[1] = (id)0xE000000000000000;
    sub_24C94A620();
    pid_t v61 = getpid();
    sub_24C94AA90();
    sub_24C94A620();
    swift_bridgeObjectRelease();
    sub_24C94A620();
    sub_24C94A750();
    uint64_t v28 = *MEMORY[0x263F06E50];
    uint64_t v53 = v6;
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
    v29(v5, v28, v2);
    sub_24C92B320();
    sub_24C94A2A0();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v3 + 8);
    v30(v5, v2);
    swift_bridgeObjectRelease();
    strcpy((char *)v62, "action.journal");
    HIBYTE(v62[1]) = -18;
    v29(v5, *MEMORY[0x263F06E38], v2);
    char v32 = v56;
    long long v31 = v57;
    sub_24C94A2A0();
    v30(v5, v2);
    swift_bridgeObjectRelease();
    id v33 = objc_msgSend(self, sel_defaultManager);
    long long v34 = v31;
    long long v35 = (void *)sub_24C94A260();
    v62[0] = 0;
    unsigned int v36 = objc_msgSend(v33, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v35, 1, 0, v62);

    if (v36)
    {
      uint64_t v37 = v53;
      id v38 = v54;
      char v39 = v58;
      id v40 = v62[0];
      uint64_t v27 = v32;
      BOOL v41 = (void *)sub_24C94A290();
      uint64_t v42 = v60;
      uint64_t v44 = sub_24C944BC0(v41, v43, 1);
      uint64_t v60 = v42;
      uint64_t v45 = v55;
      if (v42) {

      }
      else {
        uint64_t v27 = v44;
      }
      swift_bridgeObjectRelease();
      sub_24C92C2D0(v45);
      long long v46 = *(void (**)(sqlite3 *, uint64_t))(v59 + 8);
      v46(v32, v37);
      v46(v34, v37);
      v46((sqlite3 *)v39, v37);
    }
    else
    {
      id v47 = v62[0];
      uint64_t v48 = sub_24C94A230();

      uint64_t v60 = v48;
      swift_willThrow();

      sub_24C92C2D0(v55);
      uint64_t v27 = (sqlite3 *)(v59 + 8);
      long long v49 = *(void (**)(sqlite3 *, uint64_t))(v59 + 8);
      uint64_t v50 = v53;
      v49(v32, v53);
      v49(v34, v50);
      v49((sqlite3 *)v58, v50);
    }
  }
  return v27;
}

uint64_t initializeBufferWithCopyOfBuffer for SideEffectRegistry.RegistryTask(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24C930AB4()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24C930AF0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_24C930B38(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
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

uint64_t sub_24C930BC4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t sub_24C930C1C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24C930C64(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for JournalDatabasePlayer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C930CC4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_24C930CCC(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32);
}

uint64_t sub_24C930CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  sub_24C94A1C0();
  swift_allocObject();
  uint64_t result = sub_24C94A1B0();
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  *(double *)(a4 + 24) = a5;
  *(void *)(a4 + 32) = result;
  return result;
}

uint64_t sub_24C930D48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  sub_24C94A890();
  uint64_t v5 = *v3;
  swift_bridgeObjectRelease();
  uint64_t v16 = 0x2A205443454C4553;
  unint64_t v17 = 0xEF60204D4F524620;
  swift_bridgeObjectRetain();
  sub_24C94A620();
  swift_bridgeObjectRelease();
  sub_24C94A620();
  uint64_t v6 = a3[3];
  uint64_t v12 = a3[2];
  uint64_t v13 = v6;
  uint64_t v14 = a3[4];
  uint64_t v15 = v3;
  uint64_t v7 = type metadata accessor for JournalEntry();
  uint64_t v8 = v18;
  uint64_t v9 = sub_24C944800(0x2A205443454C4553, 0xEF60204D4F524620, MEMORY[0x263F8EE78], (void (*)(sqlite3_stmt *))sub_24C93123C, (uint64_t)v11, v5, v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v8)
  {
    uint64_t v16 = v9;
    MEMORY[0x270FA5388](result);
    sub_24C94A6A0();
    swift_getWitnessTable();
    sub_24C94A670();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C930F44@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v30 = a6;
  uint64_t v29 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v28 - v13;
  uint64_t v15 = sub_24C94A5E0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sqlite3_column_type(a1, 0) == 5)
  {
    sub_24C9319AC();
    swift_allocError();
    *(_DWORD *)uint64_t v19 = 0;
LABEL_14:
    *(unsigned char *)(v19 + 4) = 0;
    return swift_willThrow();
  }
  v28[1] = a4;
  double v20 = sqlite3_column_double(a1, 0);
  if (sqlite3_column_type(a1, 1) == 5 || !sqlite3_column_text(a1, 1))
  {
    sub_24C9319AC();
    swift_allocError();
    *(_DWORD *)uint64_t v19 = 1;
    goto LABEL_14;
  }
  v28[0] = a5;
  sub_24C94A640();
  sub_24C94A5D0();
  uint64_t v21 = sub_24C94A5B0();
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if (v23 >> 60 == 15) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v21;
  }
  if (v23 >> 60 == 15) {
    unint64_t v25 = 0xC000000000000000;
  }
  else {
    unint64_t v25 = v23;
  }
  uint64_t v26 = v32;
  sub_24C94A1A0();
  uint64_t result = sub_24C9299FC(v24, v25);
  if (!v26)
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v12, v14, a3);
    return sub_24C92C68C((uint64_t)v12, a3, v30, v20);
  }
  return result;
}

uint64_t sub_24C93123C@<X0>(sqlite3_stmt *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C930F44(a1, v2[5], v2[2], v2[3], v2[4], a2);
}

uint64_t sub_24C93125C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v35 = a5;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v40 = a2;
  uint64_t v46 = sub_24C94A460();
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C94A480();
  uint64_t v47 = *(void *)(v9 - 8);
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for JournalEntry();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  long long v34 = (char *)&v34 - v13;
  uint64_t v14 = sub_24C94A4A0();
  uint64_t v41 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v38 = (char *)&v34 - v19;
  if (*(double *)(a1 + *(int *)(v11 + 44)) - *(double *)(v40 + 24) > 0.0) {
    double v20 = *(double *)(a1 + *(int *)(v11 + 44)) - *(double *)(v40 + 24);
  }
  else {
    double v20 = 0.0;
  }
  sub_24C931748();
  uint64_t v39 = sub_24C94A7D0();
  sub_24C94A490();
  MEMORY[0x253301160](v18, v20);
  uint64_t v40 = *(void *)(v15 + 8);
  ((void (*)(char *, uint64_t))v40)(v18, v14);
  uint64_t v21 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v34, a1, v11);
  unint64_t v22 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v23 = (char *)swift_allocObject();
  uint64_t v24 = v36;
  *((void *)v23 + 2) = v35;
  *((void *)v23 + 3) = v24;
  uint64_t v25 = v43;
  uint64_t v26 = v44;
  *((void *)v23 + 4) = v37;
  *((void *)v23 + 5) = v25;
  *((void *)v23 + 6) = v26;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v22], v21, v11);
  aBlock[4] = sub_24C931870;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C932770;
  aBlock[3] = &block_descriptor;
  uint64_t v27 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v28 = v42;
  sub_24C94A470();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24C9318F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE68);
  sub_24C931950();
  uint64_t v30 = v45;
  uint64_t v29 = v46;
  sub_24C94A850();
  uint64_t v32 = v38;
  uint64_t v31 = (void *)v39;
  MEMORY[0x253301470](v38, v28, v30, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v49 + 8))(v30, v29);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v48);
  return ((uint64_t (*)(char *, uint64_t))v40)(v32, v41);
}

uint64_t sub_24C931724(uint64_t a1)
{
  return sub_24C93125C(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

unint64_t sub_24C931748()
{
  unint64_t result = qword_26B17DE88;
  if (!qword_26B17DE88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B17DE88);
  }
  return result;
}

uint64_t sub_24C931788()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for JournalEntry() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24C931870()
{
  uint64_t v1 = *(void *)(type metadata accessor for JournalEntry() - 8);
  return (*(uint64_t (**)(unint64_t))(v0 + 40))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
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

unint64_t sub_24C9318F8()
{
  unint64_t result = qword_26B17DE40;
  if (!qword_26B17DE40)
  {
    sub_24C94A460();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17DE40);
  }
  return result;
}

unint64_t sub_24C931950()
{
  unint64_t result = qword_26B17DE70;
  if (!qword_26B17DE70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B17DE68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17DE70);
  }
  return result;
}

unint64_t sub_24C9319AC()
{
  unint64_t result = qword_2697FCDF0;
  if (!qword_2697FCDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FCDF0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for JournalEncoder.Failure(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24C931A9CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for JournalEncoder.Failure()
{
  return &type metadata for JournalEncoder.Failure;
}

unint64_t sub_24C931AD8()
{
  unint64_t result = qword_2697FCDF8[0];
  if (!qword_2697FCDF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697FCDF8);
  }
  return result;
}

uint64_t sub_24C931B2C()
{
  uint64_t result = sub_24C94A2B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24C931BD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24C94A2B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 44);
    uint64_t v9 = *(int *)(a3 + 48);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24C931CB0(uint64_t a1)
{
  uint64_t v2 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C931D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = *(int *)(a3 + 48);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C931DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 48)) = *(void *)(a2 + *(int *)(a3 + 48));
  return a1;
}

uint64_t sub_24C931E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 48);
  *(_OWORD *)(a1 + *(int *)(a3 + 44)) = *(_OWORD *)(a2 + *(int *)(a3 + 44));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_24C931EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 48)) = *(void *)(a2 + *(int *)(a3 + 48));
  return a1;
}

uint64_t sub_24C931F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C931F90);
}

uint64_t sub_24C931F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 44) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24C932054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C932068);
}

uint64_t sub_24C932068(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C94A2B0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 44) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for JournalFilePlayer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C932140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v10 = sub_24C94A2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a4, a1, v10);
  uint64_t result = type metadata accessor for JournalFilePlayer();
  uint64_t v12 = (void *)(a4 + *(int *)(result + 44));
  *uint64_t v12 = a2;
  v12[1] = a3;
  *(double *)(a4 + *(int *)(result + 48)) = a5;
  return result;
}

uint64_t sub_24C932200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v51 = a1;
  uint64_t v52 = a2;
  uint64_t v6 = sub_24C94A5E0();
  uint64_t v53 = *(void *)(v6 - 8);
  unint64_t v54 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C94A2B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  uint64_t v15 = *(void *)(a3 + 32);
  type metadata accessor for JournalFile();
  sub_24C929D1C(v4, *(void *)(v4 + *(int *)(a3 + 44)), *(void *)(v4 + *(int *)(a3 + 44) + 8));
  unint64_t v16 = v55;
  uint64_t v17 = sub_24C94A2C0();
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v48 = v4;
  uint64_t v49 = 0;
  uint64_t v50 = v17;
  unint64_t v55 = v18;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_24C94A5D0();
  uint64_t v20 = sub_24C94A5B0();
  unint64_t v22 = v21;
  unint64_t v23 = v54;
  uint64_t v24 = *(void (**)(char *, unint64_t))(v53 + 8);
  v24(v8, v54);
  if (v22 >> 60 == 15)
  {
    sub_24C9299A8();
    swift_allocError();
    swift_willThrow();
    return sub_24C9299FC(v50, v55);
  }
  sub_24C94A5D0();
  uint64_t v53 = sub_24C94A5B0();
  unint64_t v26 = v25;
  v24(v8, v23);
  unint64_t v54 = v26;
  if (v26 >> 60 == 15)
  {
    sub_24C9299A8();
    swift_allocError();
    swift_willThrow();
    sub_24C929AAC(v20, v22);
    return sub_24C9299FC(v50, v55);
  }
  sub_24C933124(v20, v22);
  uint64_t v27 = sub_24C932F68(v20, v22);
  sub_24C929AAC(v20, v22);
  uint64_t v28 = v50;
  unint64_t v29 = v55;
  sub_24C929A54(v50, v55);
  uint64_t v30 = sub_24C932F68(v28, v29);
  sub_24C9299FC(v28, v29);
  unint64_t v57 = v27;
  sub_24C932DA4((uint64_t)v30);
  uint64_t v31 = v57;
  uint64_t v33 = v53;
  unint64_t v32 = v54;
  sub_24C929A54(v53, v54);
  long long v34 = sub_24C932F68(v33, v32);
  sub_24C929AAC(v33, v32);
  unint64_t v57 = v31;
  sub_24C932DA4((uint64_t)v34);
  uint64_t v47 = v20;
  uint64_t v35 = (uint64_t)v57;
  sub_24C94A1C0();
  swift_allocObject();
  sub_24C94A1B0();
  uint64_t v36 = v13;
  uint64_t v46 = v15;
  type metadata accessor for JournalEntry();
  sub_24C94A6A0();
  uint64_t v37 = sub_24C9333E4(v35);
  unint64_t v38 = v22;
  unint64_t v40 = v39;
  swift_bridgeObjectRelease();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v41 = v49;
  sub_24C94A1A0();
  if (v41)
  {
    sub_24C929AAC(v47, v38);
    sub_24C9299FC(v50, v55);
    sub_24C929AAC(v53, v54);
    sub_24C9299FC(v37, v40);
    return swift_release();
  }
  else
  {
    sub_24C9299FC(v37, v40);
    uint64_t v42 = swift_release();
    MEMORY[0x270FA5388](v42);
    *(&v45 - 6) = v14;
    *(&v45 - 5) = v36;
    uint64_t v43 = v48;
    *(&v45 - 4) = v46;
    *(&v45 - 3) = v43;
    uint64_t v44 = v52;
    *(&v45 - 2) = v51;
    *(&v45 - 1) = v44;
    swift_getWitnessTable();
    sub_24C94A670();
    sub_24C929AAC(v47, v38);
    sub_24C9299FC(v50, v55);
    sub_24C929AAC(v53, v54);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24C932770(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24C9327B4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  uint64_t v44 = a2;
  uint64_t v49 = sub_24C94A460();
  uint64_t v52 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C94A480();
  uint64_t v50 = *(void *)(v12 - 8);
  uint64_t v51 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v45 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a6;
  uint64_t v14 = type metadata accessor for JournalEntry();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v41 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  unint64_t v40 = (char *)&v38 - v16;
  uint64_t v53 = sub_24C94A4A0();
  uint64_t v17 = *(void *)(v53 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v53);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v42 = (char *)&v38 - v21;
  double v22 = *(double *)(a1 + *(int *)(v14 + 44));
  uint64_t v23 = *(int *)(type metadata accessor for JournalFilePlayer() + 48);
  if (v22 - *(double *)&v44[v23] > 0.0) {
    double v24 = v22 - *(double *)&v44[v23];
  }
  else {
    double v24 = 0.0;
  }
  sub_24C931748();
  uint64_t v43 = sub_24C94A7D0();
  sub_24C94A490();
  MEMORY[0x253301160](v20, v24);
  uint64_t v44 = *(char **)(v17 + 8);
  ((void (*)(char *, uint64_t))v44)(v20, v53);
  unint64_t v25 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v40, a1, v14);
  unint64_t v26 = (*(unsigned __int8 *)(v15 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v27 = (char *)swift_allocObject();
  uint64_t v28 = v39;
  *((void *)v27 + 2) = a5;
  *((void *)v27 + 3) = v28;
  uint64_t v29 = v46;
  uint64_t v30 = v47;
  *((void *)v27 + 4) = a7;
  *((void *)v27 + 5) = v29;
  *((void *)v27 + 6) = v30;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v27[v26], v25, v14);
  aBlock[4] = sub_24C931870;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C932770;
  aBlock[3] = &block_descriptor_0;
  uint64_t v31 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  unint64_t v32 = v45;
  sub_24C94A470();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24C9318F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE68);
  sub_24C9335C8((unint64_t *)&qword_26B17DE70, &qword_26B17DE68);
  uint64_t v33 = v48;
  uint64_t v34 = v49;
  sub_24C94A850();
  uint64_t v36 = v42;
  uint64_t v35 = (void *)v43;
  MEMORY[0x253301470](v42, v32, v33, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v51);
  return ((uint64_t (*)(char *, uint64_t))v44)(v36, v53);
}

char *sub_24C932CA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE90);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24C933138(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C932DA4(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    size_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_24C932CA8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  size_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  size_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *unint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24C94A9A0();
  __break(1u);
  return result;
}

unsigned char *sub_24C932EF0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_24C933220(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_24C9332E4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_24C933360((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_24C932F68(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24C94A2F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE90);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_24C929A54(a1, a2);
        uint64_t v13 = sub_24C94A2D0();
        sub_24C9299FC(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x24C933114);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24C933124(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24C929A54(a1, a2);
  }
  return a1;
}

char *sub_24C933138(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_24C94A9A0();
  __break(1u);
  return result;
}

uint64_t sub_24C933220(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_24C9332E4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24C94A210();
  swift_allocObject();
  uint64_t result = sub_24C94A200();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24C94A2E0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24C933360(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24C94A210();
  swift_allocObject();
  uint64_t result = sub_24C94A200();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_24C9333E4(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE80);
  uint64_t v10 = sub_24C9335C8(&qword_2697FCE88, &qword_2697FCE80);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  size_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_24C932EF0(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_24C9334A4(uint64_t a1)
{
  return sub_24C9327B4(a1, *(char **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24C9334C8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for JournalEntry() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
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

uint64_t sub_24C9335C8(unint64_t *a1, uint64_t *a2)
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

uint64_t Store.objectWillChange.getter()
{
  sub_24C933ED8();
  return swift_retain();
}

void *Store.__allocating_init(feature:initialLocalState:initialSharedState:journalMode:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for JournalMode();
  MEMORY[0x270FA5388](v10 - 8);
  size_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v5 + 80);
  uint64_t v14 = type metadata accessor for RootStore();
  sub_24C92BF48(a4, (uint64_t)v12);
  uint64_t v15 = sub_24C949C48(a1, a2, a3, (uint64_t)v12);
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_allocObject();
  uint64_t v17 = sub_24C93388C((uint64_t)v15, v14, WitnessTable);
  sub_24C92C2D0(a4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a3, AssociatedTypeWitness);
  uint64_t v19 = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(a2, v19);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  return v17;
}

void *sub_24C933838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C93388C(a1, a2, a3);
}

void *sub_24C93388C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v3[3] = a1;
  v3[4] = a3;
  sub_24C94A420();
  swift_allocObject();
  swift_unknownObjectRetain();
  v3[2] = sub_24C94A410();
  v3[5] = MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_24C934334;
  *(void *)(v8 + 24) = v7;
  sub_24C94A440();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE50);
  sub_24C93437C();
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_24C933A24()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24C94A400();
    return swift_release();
  }
  return result;
}

uint64_t Store.send(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, ObjectType, v3);
}

void *Store.fragment<A>(feature:initialLocalState:stateProjection:forwardToParent:)(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *v7;
  uint64_t v16 = v7[3];
  uint64_t v15 = v7[4];
  uint64_t ObjectType = swift_getObjectType();
  long long v18 = a3[1];
  v21[0] = *a3;
  v21[1] = v18;
  return sub_24C933EE0(v16, a1, a2, v21, a4, a5, *(void *)(v14 + 80), a6, ObjectType, a7, v15);
}

uint64_t Store.subscript.getter(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v3 + 64))(a1, *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8), ObjectType, v3);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v3 + 56))(a1, *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8), ObjectType, v3);
}

uint64_t Store.binding<A>(keyPath:)(uint64_t a1)
{
  return sub_24C933D40(a1);
}

{
  return sub_24C933D40(a1);
}

uint64_t sub_24C933D40(uint64_t a1)
{
  uint64_t v3 = (void *)swift_allocObject();
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = v1;
  v3[5] = a1;
  uint64_t v4 = (void *)swift_allocObject();
  void v4[2] = 0;
  v4[3] = 0;
  v4[4] = v1;
  v4[5] = a1;
  swift_retain_n();
  swift_retain_n();
  return sub_24C94A450();
}

uint64_t Store.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Store.__deallocating_deinit()
{
  Store.deinit();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_24C933EA0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_24C933ED8();
  return swift_retain();
}

uint64_t sub_24C933ED8()
{
  return *(void *)(v0 + 16);
}

void *sub_24C933EE0(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  long long v11 = a4[1];
  v17[0] = *a4;
  v17[1] = v11;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a11 + 88))(a2, a3, v17, a5, a6, a8, a10, a9, a11);
  uint64_t v14 = v13;
  uint64_t ObjectType = swift_getObjectType();
  type metadata accessor for Store();
  swift_allocObject();
  return sub_24C93388C(v12, ObjectType, v14);
}

uint64_t sub_24C933FAC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v3 + 64))(v2, *(void *)(*MEMORY[0x263F8EA20] + *v2 + 8), ObjectType, v3);
}

uint64_t sub_24C934048(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void **)(v1 + 40);
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, uint64_t, void, uint64_t, uint64_t))(v5 + 80))(v4, a1, *(void *)(*MEMORY[0x263F8DE50] + *v4 + 8), ObjectType, v5);
}

uint64_t sub_24C9340E4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v3 + 56))(v2, *(void *)(*MEMORY[0x263F8EA20] + *v2 + 8), ObjectType, v3);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24C9341C8(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void **)(v1 + 40);
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void *, uint64_t, void, uint64_t, uint64_t))(v5 + 72))(v4, a1, *(void *)(*MEMORY[0x263F8DE50] + *v4 + 8), ObjectType, v5);
}

uint64_t sub_24C934260()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24C93426C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Store()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Store(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Store);
}

uint64_t sub_24C9342FC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C934334()
{
  return sub_24C933A24();
}

uint64_t sub_24C93433C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C934374(uint64_t a1)
{
  return sub_24C93650C(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_24C93437C()
{
  unint64_t result = qword_26B17DE58;
  if (!qword_26B17DE58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B17DE50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17DE58);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DatabaseRow.Failure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseRow.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24C934478(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t sub_24C934480(uint64_t result, char a2)
{
  *(unsigned char *)(result + 4) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseRow.Failure()
{
  return &type metadata for DatabaseRow.Failure;
}

uint64_t sub_24C93449C()
{
  uint64_t result = sub_24C94A700();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout();
    int v4 = &v3;
    swift_getTupleTypeLayout();
    uint64_t v5 = &v2;
    uint64_t v6 = &unk_24C94CA18;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24C9345BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v18 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v18;
      (**(void (***)(uint64_t, uint64_t *))(v18 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      long long v7 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
      *(void *)(a1 + 40) = a2[5];
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
      uint64_t v9 = v8[20];
      uint64_t v10 = a1 + v9;
      uint64_t v11 = (uint64_t)a2 + v9;
      uint64_t v12 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      *(unsigned char *)(a1 + v8[24]) = *((unsigned char *)a2 + v8[24]);
      *(unsigned char *)(a1 + v8[28]) = *((unsigned char *)a2 + v8[28]);
      uint64_t v13 = v8[32];
      uint64_t v14 = (void *)(a1 + v13);
      uint64_t v15 = (uint64_t *)((char *)a2 + v13);
      uint64_t v16 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      uint64_t v19 = a2[3];
      if (v19)
      {
        uint64_t v20 = a2[4];
        *(void *)(a1 + 24) = v19;
        *(void *)(a1 + 32) = v20;
        (**(void (***)(uint64_t, uint64_t *))(v19 - 8))(a1, a2);
      }
      else
      {
        long long v21 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v21;
        *(void *)(a1 + 32) = a2[4];
      }
      double v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
      uint64_t v23 = v22[12];
      uint64_t v24 = a1 + v23;
      uint64_t v25 = (uint64_t)a2 + v23;
      uint64_t v26 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
      *(unsigned char *)(a1 + v22[16]) = *((unsigned char *)a2 + v22[16]);
      *(unsigned char *)(a1 + v22[20]) = *((unsigned char *)a2 + v22[20]);
      uint64_t v27 = v22[24];
      uint64_t v28 = (void *)(a1 + v27);
      uint64_t v29 = (uint64_t *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C934880(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    if (result == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
      uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98) + 80);
      uint64_t v6 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
    else
    {
      if (result) {
        return result;
      }
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(a1);
      }
      uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98) + 48);
      uint64_t v4 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    }
    return swift_release();
  }
}

uint64_t sub_24C9349D0(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    long long v15 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1, a2);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
    uint64_t v7 = v6[20];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    uint64_t v10 = sub_24C94A700();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(unsigned char *)(a1 + v6[24]) = *(unsigned char *)(a2 + v6[24]);
    *(unsigned char *)(a1 + v6[28]) = *(unsigned char *)(a2 + v6[28]);
    uint64_t v11 = v6[32];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_retain();
  }
  else
  {
    uint64_t v16 = *(void *)(a2 + 24);
    if (v16)
    {
      uint64_t v17 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v16;
      *(void *)(a1 + 32) = v17;
      (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1, a2);
    }
    else
    {
      long long v18 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v18;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
    }
    uint64_t v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
    uint64_t v20 = v19[12];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    uint64_t v23 = sub_24C94A700();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    *(unsigned char *)(a1 + v19[16]) = *(unsigned char *)(a2 + v19[16]);
    *(unsigned char *)(a1 + v19[20]) = *(unsigned char *)(a2 + v19[20]);
    uint64_t v24 = v19[24];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (void *)(a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24C934C44(uint64_t a1, long long *a2, uint64_t a3)
{
  if ((long long *)a1 != a2)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v16 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v16;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v16 - 8))(a1, a2);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v6 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
      uint64_t v8 = v7[20];
      uint64_t v9 = a1 + v8;
      uint64_t v10 = (uint64_t)a2 + v8;
      uint64_t v11 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      *(unsigned char *)(a1 + v7[24]) = *((unsigned char *)a2 + v7[24]);
      *(unsigned char *)(a1 + v7[28]) = *((unsigned char *)a2 + v7[28]);
      uint64_t v12 = v7[32];
      uint64_t v13 = (void *)(a1 + v12);
      uint64_t v14 = (void *)((char *)a2 + v12);
      uint64_t v15 = v14[1];
      void *v13 = *v14;
      v13[1] = v15;
      swift_retain();
    }
    else
    {
      uint64_t v17 = *((void *)a2 + 3);
      if (v17)
      {
        *(void *)(a1 + 24) = v17;
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        (**(void (***)(uint64_t, long long *))(v17 - 8))(a1, a2);
      }
      else
      {
        long long v18 = *a2;
        long long v19 = a2[1];
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        *(_OWORD *)a1 = v18;
        *(_OWORD *)(a1 + 16) = v19;
      }
      uint64_t v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
      uint64_t v21 = v20[12];
      uint64_t v22 = a1 + v21;
      uint64_t v23 = (uint64_t)a2 + v21;
      uint64_t v24 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
      *(unsigned char *)(a1 + v20[16]) = *((unsigned char *)a2 + v20[16]);
      *(unsigned char *)(a1 + v20[20]) = *((unsigned char *)a2 + v20[20]);
      uint64_t v25 = v20[24];
      uint64_t v26 = (void *)(a1 + v25);
      uint64_t v27 = (void *)((char *)a2 + v25);
      uint64_t v28 = v27[1];
      void *v26 = *v27;
      v26[1] = v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C934EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    uint64_t v14 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v14;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
    uint64_t v16 = v15[20];
    uint64_t v17 = a1 + v16;
    uint64_t v18 = a2 + v16;
    uint64_t v19 = sub_24C94A700();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    *(unsigned char *)(a1 + v15[24]) = *(unsigned char *)(a2 + v15[24]);
    *(unsigned char *)(a1 + v15[28]) = *(unsigned char *)(a2 + v15[28]);
    *(_OWORD *)(a1 + v15[32]) = *(_OWORD *)(a2 + v15[32]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
    uint64_t v9 = v8[12];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_24C94A700();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *(unsigned char *)(a1 + v8[16]) = *(unsigned char *)(a2 + v8[16]);
    *(unsigned char *)(a1 + v8[20]) = *(unsigned char *)(a2 + v8[20]);
    *(_OWORD *)(a1 + v8[24]) = *(_OWORD *)(a2 + v8[24]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C9350B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a3);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      long long v13 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v13;
      uint64_t v14 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v14;
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
      uint64_t v16 = v15[20];
      uint64_t v17 = a1 + v16;
      uint64_t v18 = a2 + v16;
      uint64_t v19 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      *(unsigned char *)(a1 + v15[24]) = *(unsigned char *)(a2 + v15[24]);
      *(unsigned char *)(a1 + v15[28]) = *(unsigned char *)(a2 + v15[28]);
      *(_OWORD *)(a1 + v15[32]) = *(_OWORD *)(a2 + v15[32]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy((void *)a1, (const void *)a2, *(void *)(v5 + 64));
    }
    else
    {
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
      uint64_t v9 = v8[12];
      uint64_t v10 = a1 + v9;
      uint64_t v11 = a2 + v9;
      uint64_t v12 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      *(unsigned char *)(a1 + v8[16]) = *(unsigned char *)(a2 + v8[16]);
      *(unsigned char *)(a1 + v8[20]) = *(unsigned char *)(a2 + v8[20]);
      *(_OWORD *)(a1 + v8[24]) = *(_OWORD *)(a2 + v8[24]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for SideEffect()
{
  return __swift_instantiateGenericMetadata();
}

BOOL static SideEffectCollisionBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SideEffectCollisionBehavior.hash(into:)()
{
  return sub_24C94AB50();
}

uint64_t SideEffectCollisionBehavior.hashValue.getter()
{
  return sub_24C94AB70();
}

BOOL sub_24C935368(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24C93537C()
{
  return sub_24C94AB70();
}

uint64_t sub_24C9353C4()
{
  return sub_24C94AB50();
}

uint64_t sub_24C9353F0()
{
  return sub_24C94AB70();
}

BOOL static SideEffectDisposalBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SideEffectDisposalBehavior.hash(into:)()
{
  return sub_24C94AB50();
}

uint64_t SideEffectDisposalBehavior.hashValue.getter()
{
  return sub_24C94AB70();
}

BOOL sub_24C9354C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_24C9354DC()
{
  unint64_t result = qword_2697FCEA0;
  if (!qword_2697FCEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FCEA0);
  }
  return result;
}

unint64_t sub_24C935534()
{
  unint64_t result = qword_2697FCEA8;
  if (!qword_2697FCEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FCEA8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SideEffectCollisionBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C935654);
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

ValueMetadata *type metadata accessor for SideEffectCollisionBehavior()
{
  return &type metadata for SideEffectCollisionBehavior;
}

unsigned char *storeEnumTagSinglePayload for SideEffectDisposalBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C935758);
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

ValueMetadata *type metadata accessor for SideEffectDisposalBehavior()
{
  return &type metadata for SideEffectDisposalBehavior;
}

uint64_t destroy for DatabaseError()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8DataFlow13DatabaseErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DatabaseError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DatabaseError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseError()
{
  return &type metadata for DatabaseError;
}

uint64_t sub_24C935908(uint64_t a1, void (*a2)(sqlite3_stmt *), uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v54 = a3;
  uint64_t v50 = a2;
  uint64_t v51 = a5;
  uint64_t v48 = *(void *)(a5 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v49 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v53 = (char *)&v47 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE80);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v56 = (char *)&v47 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (uint64_t *)((char *)&v47 - v18);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v52 = a1;
  swift_bridgeObjectRetain();
  uint64_t v55 = v20;
  if (v20)
  {
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(type metadata accessor for DatabaseBinding() - 8);
    uint64_t v23 = v52 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
    uint64_t v24 = *(void *)(v22 + 72);
    while (1)
    {
      uint64_t v25 = (uint64_t)&v56[*(int *)(v12 + 48)];
      sub_24C935D44(v23, v25);
      uint64_t v26 = (uint64_t)v19 + *(int *)(v12 + 48);
      void *v19 = v21;
      sub_24C935DA8(v25, v26);
      uint64_t result = sub_24C935E0C((uint64_t)v19, (uint64_t)v15);
      uint64_t v28 = *v15 + 1;
      if (__OFADD__(*v15, 1))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
      if (v28 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_24;
      }
      if (v28 > 0x7FFFFFFF) {
        goto LABEL_25;
      }
      int v29 = sub_24C935E74((uint64_t)v15 + *(int *)(v12 + 48), v28, a4);
      if (v29) {
        break;
      }
      ++v21;
      sub_24C936228((uint64_t)v15);
      v23 += v24;
      if (v55 == v21) {
        goto LABEL_8;
      }
    }
    unsigned int v38 = v29;
    if (sqlite3_errstr(v29))
    {
      uint64_t v39 = sub_24C94A630();
      unint64_t v41 = v40;
    }
    else
    {
      uint64_t v39 = 4271950;
      unint64_t v41 = 0xE300000000000000;
    }
    sub_24C9361D4();
    swift_allocError();
    void *v45 = v38;
    v45[1] = v39;
    v45[2] = v41;
    swift_willThrow();
    sub_24C936228((uint64_t)v15);
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v30 = v51;
    uint64_t v57 = sub_24C94A4D0();
    uint64_t v31 = v49;
    unint64_t v32 = (void (**)(char *, char *, uint64_t))(v48 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v48 + 8);
    uint64_t v34 = v50;
    for (i = v53; ; (*v33)(i, v30))
    {
      int v36 = sqlite3_step(a4);
      if (v36 != 100) {
        break;
      }
      v34(a4);
      if (v6) {
        return swift_bridgeObjectRelease();
      }
      (*v32)(v31, i, v30);
      sub_24C94A6A0();
      sub_24C94A690();
    }
    unsigned int v37 = v36;
    if (v36 == 101)
    {
      return v57;
    }
    else
    {
      swift_bridgeObjectRelease();
      if (sqlite3_errstr(v37))
      {
        uint64_t v42 = sub_24C94A630();
        unint64_t v44 = v43;
      }
      else
      {
        uint64_t v42 = 4271950;
        unint64_t v44 = 0xE300000000000000;
      }
      sub_24C9361D4();
      swift_allocError();
      *uint64_t v46 = v37 | 0x8000000000000000;
      v46[1] = v42;
      v46[2] = v44;
      return swift_willThrow();
    }
  }
}

uint64_t sub_24C935D44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C935DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C935E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C935E74(uint64_t a1, unsigned int a2, sqlite3_stmt *a3)
{
  int v29 = a3;
  unsigned int v28 = a2;
  uint64_t v4 = sub_24C94A2B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_24C94A340();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for DatabaseBinding();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)&v27[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (double *)&v27[-v16];
  sub_24C935D44(a1, (uint64_t)&v27[-v16]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v20 = sqlite3_bind_double(v29, v28, *v17);
      goto LABEL_7;
    case 2u:
      uint64_t v20 = sqlite3_bind_int64(v29, v28, *(void *)v17);
      goto LABEL_7;
    case 3u:
      uint64_t v21 = v5;
      (*(void (**)(unsigned char *, double *, uint64_t))(v5 + 32))(v7, v17, v4);
      uint64_t *v15 = sub_24C94A250();
      v15[1] = v22;
      swift_storeEnumTagMultiPayload();
      uint64_t v19 = sub_24C935E74(v15, v28, v29);
      sub_24C936288((uint64_t)v15);
      (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v7, v4);
      return v19;
    case 4u:
      uint64_t v23 = (void *)sub_24C94A590();
      swift_bridgeObjectRelease();
      uint64_t v24 = (const char *)objc_msgSend(v23, sel_UTF8String);
      id v25 = v23;
      uint64_t v20 = sqlite3_bind_text(v29, v28, v24, -1, 0);
LABEL_7:
      uint64_t v19 = v20;
      break;
    default:
      (*(void (**)(unsigned char *, double *, uint64_t))(v9 + 32))(v11, v17, v8);
      sub_24C94A300();
      uint64_t *v15 = v18;
      swift_storeEnumTagMultiPayload();
      uint64_t v19 = sub_24C935E74(v15, v28, v29);
      sub_24C936288((uint64_t)v15);
      (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
      break;
  }
  return v19;
}

unint64_t sub_24C9361D4()
{
  unint64_t result = qword_2697FCEB0;
  if (!qword_2697FCEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2697FCEB0);
  }
  return result;
}

uint64_t sub_24C936228(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C936288(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DatabaseBinding();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24C9362E8(unint64_t result)
{
  if ((result >> 61) <= 4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t destroy for DatabaseStatement.Failure(unint64_t *a1)
{
  return sub_24C936310(*a1);
}

unint64_t sub_24C936310(unint64_t result)
{
  if ((result >> 61) <= 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *_s8DataFlow17DatabaseStatementV7FailureOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_24C9362E8(*a2);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

unint64_t *assignWithCopy for DatabaseStatement.Failure(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_24C9362E8(*a2);
  unint64_t v6 = *a1;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_24C936310(v6);
  return a1;
}

unint64_t *assignWithTake for DatabaseStatement.Failure(unint64_t *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_24C936310(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseStatement.Failure(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  HIDWORD(v3) = *(_DWORD *)(a1 + 4);
  LODWORD(v3) = HIDWORD(v3);
  unsigned int v2 = v3 >> 29;
  if (v2 > 0x80000000) {
    int v4 = ~v2;
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseStatement.Failure(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      HIDWORD(v3) = -a2;
      LODWORD(v3) = -a2;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(void *)unint64_t result = (unint64_t)(v3 >> 3) << 32;
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_24C9364AC(void *a1)
{
  return *a1 >> 61;
}

void *sub_24C9364B8(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_24C9364C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2 << 29;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseStatement.Failure()
{
  return &type metadata for DatabaseStatement.Failure;
}

uint64_t dispatch thunk of Feature.dispose(localState:sharedState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of Feature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t sub_24C93650C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_24C936534(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + *(int *)(a1 + 56)))(v1 + *(int *)(a1 + 52), v1 + *(int *)(a1 + 52));
}

uint64_t sub_24C936570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = v6;
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  (*(void (**)(uint64_t, char *))(v2 + *(int *)(a2 + 56)))(v2 + *(int *)(a2 + 52), v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_24C936680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4 = v3;
  v19[0] = a3;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (char *)MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v19 - v12;
  v19[1] = v11;
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, (char *)v4 + *(int *)(a2 + 52), v6);
  char v14 = sub_24C94A580();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  if (v14)
  {
    v15(v13, v6);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(v19[0], 1, 1, a2);
  }
  else
  {
    uint64_t v17 = *v4;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v13, v6);
    uint64_t v18 = v19[0];
    sub_24C9368C8(v17, (uint64_t)v10, *(uint64_t *)((char *)v4 + *(int *)(a2 + 56)), *(uint64_t *)((char *)v4 + *(int *)(a2 + 56) + 8), v19[0]);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(v18, 0, 1, a2);
    swift_retain();
    return swift_retain();
  }
}

uint64_t sub_24C9368C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v10 = (void *)MEMORY[0x263F8EA20];
  *(void *)a5 = a1;
  uint64_t v11 = *(void *)(v9 + *v10 + 8);
  uint64_t v12 = type metadata accessor for ChangeObservationContext();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(&a5[*(int *)(v12 + 52)], a2, v11);
  char v14 = &a5[*(int *)(v12 + 56)];
  *(void *)char v14 = a3;
  *((void *)v14 + 1) = a4;
  return result;
}

uint64_t ChangeObserver.store.getter()
{
  return swift_retain();
}

uint64_t ChangeObserver.__allocating_init(store:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ChangeObserver.init(store:)(a1);
  return v2;
}

void *ChangeObserver.init(store:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  v1[3] = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 88);
  type metadata accessor for Store();
  sub_24C94A8F0();
  swift_getExtendedExistentialTypeMetadata_unique();
  swift_getTupleTypeMetadata2();
  sub_24C94A680();
  v2[4] = sub_24C94A4E0();
  v2[2] = a1;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v5;
  void v8[3] = v6;
  v8[4] = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24C937830;
  *(void *)(v9 + 24) = v8;
  sub_24C94A420();
  swift_retain();
  swift_retain();
  sub_24C94A440();
  swift_release();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE50);
  sub_24C93437C();
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_24C936C28()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24C936C80();
    return swift_release();
  }
  return result;
}

uint64_t sub_24C936C80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 80);
  type metadata accessor for Store();
  sub_24C94A8F0();
  swift_bridgeObjectRetain();
  swift_getExtendedExistentialTypeMetadata_unique();
  sub_24C94A4C0();
  sub_24C94A510();
  swift_getWitnessTable();
  sub_24C94A660();
  swift_bridgeObjectRelease();
  v1[4] = v3;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C936DE0(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v30 = a1;
  uint64_t v29 = *a3;
  id v25 = a2;
  uint64_t v4 = (uint64_t)(a2 + 1);
  uint64_t v26 = *a2;
  sub_24C9382A0((uint64_t)(a2 + 1), (uint64_t)&v34 + 8);
  uint64_t v27 = (uint64_t)&v34 + 8;
  sub_24C938304((long long *)((char *)&v34 + 8), (uint64_t)v37);
  uint64_t v5 = v38;
  uint64_t v6 = v39;
  __swift_project_boxed_opaque_existential_1(v37, v38);
  uint64_t v7 = a3[2];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  uint64_t v24 = sub_24C94A800();
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v28 = v7;
  v8(v7, v5, v6);
  uint64_t v12 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
    *(void *)&long long v34 = *v25;
    uint64_t v13 = v34;
    uint64_t v14 = v27;
    sub_24C9382A0(v4, v27);
    sub_24C9382A0((uint64_t)v37, (uint64_t)v33);
    v32[0] = v13;
    uint64_t v15 = *(void *)(v29 + 80);
    type metadata accessor for Store();
    sub_24C94A8F0();
    swift_retain();
    uint64_t v40 = v15;
    swift_getExtendedExistentialTypeMetadata_unique();
    sub_24C94A510();
    sub_24C94A550();
    uint64_t v16 = (unsigned char *)v14;
  }
  else
  {
    uint64_t v35 = v5;
    uint64_t v36 = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v34);
    (*(void (**)(uint64_t *, char *, uint64_t))(v12 + 32))(boxed_opaque_existential_1, v11, v5);
    sub_24C938304(&v34, (uint64_t)v33);
    uint64_t v18 = v26;
    *(void *)&long long v34 = v26;
    sub_24C9382A0(v4, (uint64_t)&v34 + 8);
    sub_24C9382A0((uint64_t)v33, (uint64_t)v32);
    uint64_t v40 = v18;
    uint64_t v19 = *(void *)(v29 + 80);
    type metadata accessor for Store();
    sub_24C94A8F0();
    swift_retain();
    uint64_t v31 = v19;
    swift_getExtendedExistentialTypeMetadata_unique();
    sub_24C94A510();
    sub_24C94A550();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34 + 8);
    uint64_t v20 = v38;
    uint64_t v21 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    uint64_t v16 = v33;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
}

uint64_t ChangeObserver.beginTrackingChanges<A>(for:changeHandler:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v20 = a3;
  uint64_t v17 = *v4;
  uint64_t v6 = v17;
  uint64_t v18 = a2;
  unint64_t v7 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v17 - v8;
  swift_beginAccess();
  uint64_t v10 = v4[4];
  uint64_t v22 = a1;
  uint64_t v11 = sub_24C94A8F0();
  uint64_t v12 = *(void *)(v6 + 80);
  swift_retain();
  uint64_t v21 = v12;
  uint64_t ExtendedExistentialTypeMetadata_unique = swift_getExtendedExistentialTypeMetadata_unique();
  MEMORY[0x2533011F0](&v23, &v22, v10, v11, ExtendedExistentialTypeMetadata_unique, MEMORY[0x263F8DAB8]);
  swift_release();
  swift_endAccess();
  if (v26)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    uint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_24C94A890();
    sub_24C94A620();
    uint64_t v28 = a1;
    sub_24C94ABA0();
    sub_24C94AAA0();
    sub_24C94A620();
    uint64_t result = sub_24C94A960();
    __break(1u);
  }
  else
  {
    uint64_t v28 = (uint64_t *)v4[2];
    swift_retain();
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    uint64_t v14 = *(void *)(v17 + 88);
    uint64_t v23 = v12;
    unint64_t v24 = v7;
    uint64_t v25 = v14;
    uint64_t v26 = v19;
    uint64_t v26 = type metadata accessor for ChangeObservationContext();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v15 = __swift_allocate_boxed_opaque_existential_1(&v23);
    sub_24C9368C8(a1, (uint64_t)v9, v18, v20, (char *)v15);
    uint64_t v22 = a1;
    swift_beginAccess();
    sub_24C94A510();
    swift_retain();
    swift_retain();
    sub_24C94A550();
    return swift_endAccess();
  }
  return result;
}

uint64_t ChangeObserver.endTrackingChanges(for:)()
{
  return swift_endAccess();
}

Swift::Void __swiftcall ChangeObserver.publishCurrentValue()()
{
}

uint64_t ChangeObserver.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ChangeObserver.__deallocating_deinit()
{
  ChangeObserver.deinit();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_24C9377C0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C9377F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24C937830()
{
  return sub_24C936C28();
}

uint64_t sub_24C93783C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C937874()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for ChangeObservationContext()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C9378B4(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1 + 1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

uint64_t sub_24C937914()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ChangeObserver()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ChangeObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ChangeObserver);
}

uint64_t dispatch thunk of ChangeObserver.__allocating_init(store:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_24C9379B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_24C9379B8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24C937A64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 8) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    uint64_t v15 = (void *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v16 = v15[1];
    uint64_t v17 = (void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v17 = *v15;
    v17[1] = v16;
  }
  swift_retain();
  return a1;
}

uint64_t sub_24C937B94(uint64_t a1, uint64_t a2)
{
  swift_release();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));
  return swift_release();
}

void *sub_24C937C2C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  swift_retain();
  v5(v8, v9, v4);
  uint64_t v10 = *(void *)(v6 + 48) + 7;
  uint64_t v11 = (void *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  return a1;
}

void *sub_24C937CE0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_24C937DA8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_24C937E48(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  *(_OWORD *)((*(void *)(v7 + 24) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v7 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_24C937F00(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
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
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) + ((v6 + 8) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 16;
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
        JUMPOUT(0x24C938058);
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
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 8) & ~v6);
  }
  uint64_t v17 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_24C93806C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + ((v9 + 8) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (unint64_t)&a1[v9 + 8] & ~v9;
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v18 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v18 = a2 - 1;
              }
              *(void *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + ((v9 + 8) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + ((v9 + 8) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + ((v9 + 8) & ~v9) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x24C93825CLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_24C938284(uint64_t a1, void *a2)
{
  return sub_24C936DE0(a1, a2, v2);
}

uint64_t sub_24C9382A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C938304(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_24C93831C(void *a1)
{
  MEMORY[0x253301D20]();
  MEMORY[0x253301D20](a1);
  long long v2 = sub_24C94A350();
  os_log_type_t v3 = sub_24C94A7A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    unsigned int v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    MEMORY[0x253301D20](a1);
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    sub_24C94A810();
    *unsigned int v5 = v6;

    _os_log_impl(&dword_24C91C000, v2, v3, "%@", v4, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DED8);
    swift_arrayDestroy();
    MEMORY[0x253301F20](v5, -1, -1);
    MEMORY[0x253301F20](v4, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_24C9384A4()
{
  uint64_t v0 = sub_24C94A370();
  __swift_allocate_value_buffer(v0, qword_26B17F260);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B17F260);
  return sub_24C94A360();
}

uint64_t sub_24C938518()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_24C93863C(char *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24C93869C(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24C93869C(char *a1)
{
  unint64_t v2 = v1;
  uint64_t v25 = a1;
  os_log_type_t v3 = (void *)*v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v7 = (char *)v20 - v6;
  v20[2] = v3[12];
  v20[1] = v3[10];
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  unsigned int v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int v13 = (char *)v20 - v12;
  int v14 = *(void (**)(char *))((char *)v2 + v3[18]);
  int v15 = (char *)v2 + v3[21];
  swift_beginAccess();
  int v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v21 = v15;
  v16(v7, v15, AssociatedTypeWitness);
  v14(v7);
  uint64_t v23 = v5;
  uint64_t v24 = AssociatedTypeWitness;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  v14(v25);
  swift_getAssociatedConformanceWitness();
  if ((sub_24C94A580() & 1) == 0) {
    sub_24C94A400();
  }
  int v17 = *(void (**)(char *, uint64_t))(v22 + 8);
  v17(v11, v8);
  v17(v13, v8);
  uint64_t v18 = v21;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v18, v25, v24);
  return swift_endAccess();
}

uint64_t sub_24C9389C8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24C94A400();
    return swift_release();
  }
  return result;
}

uint64_t sub_24C938A24(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v70 = *v1;
  uint64_t v4 = *(void *)(v70 + 96);
  uint64_t v5 = *(void *)(v70 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v78 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v77 = (char *)&v61 - v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v65 = (char *)&v61 - v11;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v75 = *(void *)(v12 - 8);
  uint64_t v76 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v71 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v74 = (char *)&v61 - v15;
  uint64_t v73 = v4;
  uint64_t v72 = v5;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v64 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v61 - v20;
  __tp.__darwin_time_t tv_sec = 0;
  __tp.uint64_t tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  __darwin_time_t tv_sec = __tp.tv_sec;
  uint64_t tv_nsec = __tp.tv_nsec;
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  uint64_t v81 = v8;
  uint64_t v22 = sub_24C94A370();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B17F260);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v79 = a1;
  v23(v21, a1, v16);
  uint64_t v24 = sub_24C94A350();
  os_log_type_t v25 = sub_24C94A790();
  int v26 = v25;
  BOOL v27 = os_log_type_enabled(v24, v25);
  uint64_t v80 = v16;
  uint64_t v67 = v10;
  if (v27)
  {
    uint64_t v28 = swift_slowAlloc();
    __darwin_time_t v63 = swift_slowAlloc();
    __tp.__darwin_time_t tv_sec = v63;
    *(_DWORD *)uint64_t v28 = 136315394;
    LODWORD(v62) = v26;
    v83[0] = v72;
    swift_getMetatypeMetadata();
    uint64_t v29 = sub_24C94A5F0();
    v83[0] = sub_24C93BCD4(v29, v30, &__tp.tv_sec);
    sub_24C94A810();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    v23(v64, (uint64_t)v21, v80);
    uint64_t v31 = sub_24C94A5F0();
    v83[0] = sub_24C93BCD4(v31, v32, &__tp.tv_sec);
    sub_24C94A810();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v80);
    _os_log_impl(&dword_24C91C000, v24, (os_log_type_t)v62, "%s.%s", (uint8_t *)v28, 0x16u);
    __darwin_time_t v33 = v63;
    swift_arrayDestroy();
    MEMORY[0x253301F20](v33, -1, -1);
    uint64_t v34 = v28;
    uint64_t v10 = v67;
    MEMORY[0x253301F20](v34, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
  }

  uint64_t v64 = (char *)type metadata accessor for SideEffect();
  __darwin_time_t v84 = sub_24C94A4D0();
  uint64_t v35 = (void (**)(char *, char *))((char *)v2 + *(void *)(*v2 + 144));
  uint64_t v36 = *v35;
  unsigned int v37 = v65;
  __darwin_time_t v63 = *(void *)((char *)v2 + *(void *)(*v2 + 128));
  sub_24C94A3D0();
  uint64_t v38 = v74;
  ((void (*)(char *))v36)(v37);
  uint64_t v62 = *(void (**)(char *, uint64_t))(v66 + 8);
  v62(v37, v10);
  uint64_t v39 = v77;
  uint64_t v66 = *(void *)((char *)v2 + *(void *)(*v2 + 136));
  sub_24C94A3D0();
  uint64_t v40 = v71;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v71, v38, v76);
  unint64_t v41 = v81;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v81, v39, AssociatedTypeWitness);
  uint64_t v42 = v41;
  unint64_t v43 = v40;
  (*(void (**)(char *, char *, __darwin_time_t *, uint64_t, uint64_t, uint64_t))(v73 + 72))(v42, v40, &v84, v79, v72, v73);
  swift_getAssociatedConformanceWitness();
  if ((sub_24C94A580() & 1) == 0)
  {
    sub_24C94A3D0();
    v35[2](v37, v40);
    sub_24C94A3C0();
    sub_24C94A400();
    v62(v37, v67);
  }
  swift_getAssociatedConformanceWitness();
  unint64_t v44 = v77;
  if ((sub_24C94A580() & 1) == 0) {
    sub_24C94A3C0();
  }
  swift_getWitnessTable();
  uint64_t v45 = sub_24C94A8B0();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v47 = sub_24C9453E4(v45, WitnessTable, v83);
  __tp.__darwin_time_t tv_sec = v84;
  MEMORY[0x270FA5388](v47);
  *(&v61 - 2) = (uint64_t)v2;
  *(&v61 - 1) = (uint64_t)v83;
  sub_24C94A6A0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C94A670();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v48 = *v2;
  uint64_t v49 = (void (**)(uint64_t, char *, char *))((char *)v2 + *(void *)(*v2 + 152));
  uint64_t v50 = v79;
  uint64_t v51 = v81;
  if (*v49)
  {
    (*v49)(v79, v43, v81);
    uint64_t v48 = *v2;
  }
  double v52 = (double)tv_nsec / 1000000000.0 + (double)tv_sec;
  sub_24C9382A0((uint64_t)v2 + *(void *)(v48 + 184), (uint64_t)&__tp);
  uint64_t v53 = v86;
  uint64_t v54 = v87;
  __swift_project_boxed_opaque_existential_1(&__tp, v86);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v54 + 56))(v50, v53, v54, v52);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v78 + 8);
  uint64_t v56 = AssociatedTypeWitness;
  v55(v51, AssociatedTypeWitness);
  uint64_t v57 = v76;
  uint64_t v58 = *(void (**)(char *, uint64_t))(v75 + 8);
  v58(v43, v76);
  v55(v44, v56);
  v58(v74, v57);
  uint64_t v59 = type metadata accessor for StoreProxy();
  (*(void (**)(void *, uint64_t))(*(void *)(v59 - 8) + 8))(v83, v59);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
}

uint64_t sub_24C939560()
{
  uint64_t v1 = v0;
  unint64_t v2 = *(void **)v0;
  uint64_t v50 = sub_24C94A460();
  uint64_t v53 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24C94A480();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v43 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v2[10];
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v7);
  uint64_t v35 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v34 - v14;
  uint64_t v16 = (uint64_t *)(v0 + v2[18]);
  uint64_t v37 = *v16;
  uint64_t v38 = v16[3];
  uint64_t v47 = v16;
  uint64_t v46 = v2[16];
  uint64_t v36 = *(void *)(v0 + v46);
  uint64_t v48 = v2[17];
  uint64_t v40 = *(void *)(v0 + v48);
  unint64_t v44 = (char *)(v0 + v2[15]);
  uint64_t v42 = *(void (**)(char *))(v11 + 16);
  long long v54 = *(_OWORD *)(v16 + 1);
  uint64_t v39 = (char *)&v34 - v14;
  v42((char *)&v34 - v14);
  swift_getWitnessTable();
  uint64_t v17 = sub_24C94A8B0();
  uint64_t v45 = *(void *)(*(void *)v0 + 160);
  uint64_t v18 = *(void *)(v0 + v45);
  uint64_t v56 = (void *)MEMORY[0x263F8D1F0];
  uint64_t v57 = (uint64_t (*)())MEMORY[0x263F8D1F8];
  aBlock[0] = v17;
  uint64_t v19 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  sub_24C9382A0((uint64_t)aBlock, (uint64_t)v59);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  void v20[3] = 0;
  v20[4] = v18;
  sub_24C938304(v59, (uint64_t)(v20 + 5));
  swift_retain();
  sub_24C94738C((uint64_t)v9, (uint64_t)&unk_2697FCED8, (uint64_t)v20);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  sub_24C931748();
  uint64_t v34 = sub_24C94A7D0();
  uint64_t v21 = v35;
  ((void (*)(char *, char *, uint64_t))v42)(v35, v15, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v10;
  uint64_t v42 = (void (*)(char *))v2[11];
  *(void *)(v23 + 24) = v42;
  *(void *)(v23 + 32) = v2[12];
  uint64_t v41 = v2[13];
  *(void *)(v23 + 40) = v41;
  *(void *)(v23 + 48) = v37;
  *(_OWORD *)(v23 + 56) = v54;
  uint64_t v24 = v36;
  *(void *)(v23 + 72) = v38;
  *(void *)(v23 + 80) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v23 + v22, v21, v10);
  *(void *)(v23 + ((v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = v40;
  uint64_t v57 = sub_24C93D71C;
  uint64_t v58 = v23;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C932770;
  uint64_t v56 = &block_descriptor_1;
  os_log_type_t v25 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  int v26 = v43;
  sub_24C94A470();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24C9318F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE68);
  sub_24C9335C8((unint64_t *)&qword_26B17DE70, &qword_26B17DE68);
  BOOL v27 = v49;
  uint64_t v28 = v50;
  sub_24C94A850();
  uint64_t v29 = (void *)v34;
  MEMORY[0x253301490](0, v26, v27, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v52);
  unint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
  v30(v39, v10);
  swift_release();
  v30(v44, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24C93D510(*(void *)(v1 + *(void *)(*(void *)v1 + 152)));
  swift_release();
  uint64_t v31 = v1 + *(void *)(*(void *)v1 + 168);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v31, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v1 + *(void *)(*(void *)v1 + 184));
  return v1;
}

uint64_t sub_24C939D7C(void (*a1)(char *), uint64_t a2, void (*a3)(char *, char *), uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v33 = a8;
  uint64_t v34 = a2;
  uint64_t v39 = a6;
  uint64_t v30 = a4;
  uint64_t v31 = a3;
  uint64_t v35 = a1;
  uint64_t v36 = a7;
  uint64_t v38 = *(void *)(*a7 + *MEMORY[0x263EFDD98]);
  uint64_t v37 = *(void *)(v38 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t v16 = *(void (**)(void))(v14 + v15);
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x270FA5388](v11);
  uint64_t v19 = (char *)&v30 - v18;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v22 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v24 = (char *)&v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  int v26 = (char *)&v30 - v25;
  uint64_t v32 = a5;
  sub_24C94A3D0();
  v35(v19);
  BOOL v27 = *(void (**)(char *, void (*)(void)))(v17 + 8);
  uint64_t v34 = v17 + 8;
  uint64_t v35 = (void (*)(char *))v16;
  v27(v19, v16);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, AssociatedTypeWitness);
  sub_24C94A3D0();
  (*(void (**)(char *, char *, uint64_t, uint64_t))(a10 + 64))(v13, v24, v33, a10);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v38);
  swift_getAssociatedConformanceWitness();
  if ((sub_24C94A580() & 1) == 0)
  {
    sub_24C94A3D0();
    v31(v19, v24);
    sub_24C94A3C0();
    v27(v19, (void (*)(void))v35);
  }
  uint64_t v28 = *(void (**)(char *, uint64_t))(v21 + 8);
  v28(v24, AssociatedTypeWitness);
  return ((uint64_t (*)(char *, uint64_t))v28)(v26, AssociatedTypeWitness);
}

uint64_t sub_24C93A114()
{
  sub_24C939560();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for ChildStore()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C93A184(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + *(void *)(*(void *)v1 + 184));
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  uint64_t v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - v8;
  (*(void (**)(char *))(v7 + 16))((char *)&v11 - v8);
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v4);
  if ((v5 & 1) == 0) {
    return sub_24C938A24(a1);
  }
  return result;
}

uint64_t sub_24C93A2B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v24 = a1;
  uint64_t v27 = *a2;
  uint64_t v26 = *(void *)(v27 + 96);
  uint64_t v25 = *(void *)(v27 + 80);
  swift_getAssociatedTypeWitness();
  uint64_t v4 = type metadata accessor for SideEffect();
  uint64_t v22 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v23 = (char *)&v21 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v24, v4);
  uint64_t v14 = type metadata accessor for StoreProxy();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v28, a3, v14);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v17 = (v6 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (char *)swift_allocObject();
  uint64_t v19 = v27;
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = v25;
  *((void *)v18 + 5) = *(void *)(v19 + 88);
  *((void *)v18 + 6) = v26;
  *((void *)v18 + 7) = *(void *)(v19 + 104);
  *((void *)v18 + 8) = v13;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v18[v16], v23, v22);
  (*(void (**)(char *, unsigned char *, uint64_t))(v15 + 32))(&v18[v17], v28, v14);
  sub_24C93A8B4((uint64_t)v11, (uint64_t)&unk_2697FCEC0, (uint64_t)v18);
  swift_release();
  return sub_24C93D270((uint64_t)v11);
}

uint64_t sub_24C93A5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a7;
  v7[10] = v9;
  v7[7] = a5;
  v7[8] = a6;
  v7[5] = a1;
  v7[6] = a4;
  return MEMORY[0x270FA2498](sub_24C93A610, 0, 0);
}

uint64_t sub_24C93A610()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 88) = Strong;
  if (Strong)
  {
    *(void *)(v0 + 96) = *(void *)(Strong + *(void *)(*(void *)Strong + 160));
    swift_retain();
    swift_release();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v2;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    *uint64_t v2 = v0;
    v2[1] = sub_24C93A774;
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    return sub_24C93DDEC(v4, v5, AssociatedTypeWitness);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_24C93A774()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24C93A88C, 0, 0);
}

uint64_t sub_24C93A88C()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 88) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C93A8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C93D2D0(a1, (uint64_t)v8);
  uint64_t v9 = sub_24C94A700();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_24C93D270((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_24C94A6B0();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24C94A6F0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DED0);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_24C93AAA0(void *a1)
{
  uint64_t v1 = *(void *)(*a1 + *MEMORY[0x263F8EA20]);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v6 - v3;
  sub_24C94A3D0();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_24C93ABBC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  v16[0] = a1;
  v16[1] = a2;
  uint64_t v3 = *v2;
  uint64_t v4 = *a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)v16 - v8;
  uint64_t v10 = *(void *)(v4 + *MEMORY[0x263F8EA20]);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v13 = (char *)v16 - v12;
  uint64_t v14 = *(void (**)(char *))((char *)v2 + *(void *)(v3 + 144));
  sub_24C94A3D0();
  v14(v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, AssociatedTypeWitness);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_24C93ADE0(void *a1, uint64_t a2)
{
  uint64_t v20 = a2;
  v18[1] = *v2;
  uint64_t v19 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v3 = *(void *)(v19 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v18 - v5;
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(*v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v4);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v18 - v13;
  sub_24C94A3D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v19);
  swift_setAtWritableKeyPath();
  sub_24C94A3D0();
  swift_getAssociatedConformanceWitness();
  char v15 = sub_24C94A580();
  unint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  if ((v15 & 1) == 0) {
    sub_24C94A3C0();
  }
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v8);
}

uint64_t sub_24C93B058(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = (uint64_t *)(*a1 + *MEMORY[0x263F8DE50]);
  uint64_t v28 = v5[1];
  uint64_t v27 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v26 = (char *)&v22 - v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = *v5;
  uint64_t v25 = *(void *)(*v5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v22 - v15;
  unint64_t v17 = *(void (**)(char *))((char *)v3 + *(void *)(v4 + 144));
  uint64_t v23 = (void (**)(char *, char *))((char *)v3 + *(void *)(v4 + 144));
  uint64_t v24 = *(void *)((char *)v3 + *(void *)(v4 + 128));
  sub_24C94A3D0();
  v17(v10);
  uint64_t v18 = v25;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v10, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v14, v16, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v26, v29, v28);
  swift_setAtWritableKeyPath();
  swift_getAssociatedConformanceWitness();
  if ((sub_24C94A580() & 1) == 0)
  {
    sub_24C94A3D0();
    v23[2](v10, v14);
    sub_24C94A3C0();
    sub_24C94A400();
    v19(v10, AssociatedTypeWitness);
  }
  uint64_t v20 = *(void (**)(char *, uint64_t))(v18 + 8);
  v20(v14, v11);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, v11);
}

char *sub_24C93B420(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v49 = a4;
  uint64_t v50 = a5;
  uint64_t v37 = a2;
  uint64_t v41 = a1;
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v12 = *v7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = AssociatedTypeWitness;
  uint64_t v47 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = v47;
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v17 = (char *)&v37 - v16;
  uint64_t v44 = (uint64_t)&v37 - v16;
  uint64_t v48 = *(void *)(a6 - 8);
  uint64_t v18 = v48;
  MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v20;
  uint64_t v39 = *a3;
  uint64_t v40 = a3[1];
  uint64_t v21 = a3[2];
  uint64_t v22 = a3[3];
  uint64_t v38 = v21;
  uint64_t v43 = *(void *)(v12 + 88);
  uint64_t v42 = *(void *)(v12 + 104);
  v54[0] = a6;
  v54[1] = v43;
  v54[2] = a7;
  uint64_t v55 = v42;
  type metadata accessor for ChildStore();
  (*(void (**)(char *, void *, uint64_t))(v18 + 16))(v20, v41, a6);
  uint64_t v41 = *(void **)((char *)v8 + *(void *)(*v8 + 128));
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v37, AssociatedTypeWitness);
  uint64_t v23 = *(void *)((char *)v8 + *(void *)(*v8 + 160));
  sub_24C9382A0((uint64_t)v8 + *(void *)(*v8 + 184), (uint64_t)v54);
  uint64_t v24 = v55;
  uint64_t v25 = v56;
  __swift_project_boxed_opaque_existential_1(v54, v55);
  __tp.__darwin_time_t tv_sec = 0;
  __tp.uint64_t tv_nsec = 0;
  swift_retain();
  swift_retain();
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  (*(void (**)(timespec *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(v25 + 48))(&__tp, a6, a6, a7, v24, v25, (double)__tp.tv_nsec / 1000000000.0 + (double)__tp.tv_sec);
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = a6;
  v26[3] = a7;
  uint64_t v27 = v39;
  uint64_t v28 = v40;
  v26[4] = v39;
  v26[5] = v28;
  uint64_t v29 = v38;
  v26[6] = v38;
  v26[7] = v22;
  v26[8] = v8;
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = a6;
  v30[3] = a7;
  v30[4] = v8;
  v30[5] = v27;
  v30[6] = v28;
  v30[7] = v29;
  v30[8] = v22;
  StateProjection.init(get:set:)((uint64_t)sub_24C93D470, (uint64_t)v26, (uint64_t)sub_24C93D4CC, (uint64_t)v30, v52);
  v51[0] = v52[0];
  v51[1] = v52[1];
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v32 = v49;
  uint64_t v31 = v50;
  sub_24C93D500(v49);
  swift_allocObject();
  uint64_t v33 = (uint64_t)v45;
  uint64_t v34 = v44;
  uint64_t v35 = sub_24C93C520((uint64_t)v45, v41, v44, v23, &__tp, (uint64_t)v51, v32, v31);
  sub_24C93D510(v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v34, v46);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v33, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  swift_getWitnessTable();
  return v35;
}

uint64_t sub_24C93B944(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v9 = *a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v15 - v12;
  (*(void (**)(uint64_t))((char *)a6 + *(void *)(v9 + 144)))(a1);
  a2(v13);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
}

uint64_t sub_24C93BAA0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t))
{
  uint64_t v10 = *a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v17 - v13;
  uint64_t v15 = (void (**)(uint64_t, char *))((char *)a3 + *(void *)(v10 + 144));
  ((void (*)(uint64_t))*v15)(a1);
  a6(v14, a2);
  v15[2](a1, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
}

uint64_t sub_24C93BC10()
{
  return swift_retain();
}

uint64_t sub_24C93BC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24C94A8B0();
  *a1 = result;
  return result;
}

uint64_t sub_24C93BC5C@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_retain();
}

uint64_t sub_24C93BC68()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_24C93BC74(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24C93BCD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C93BDA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C93CEB4((uint64_t)v12, *a3);
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
      sub_24C93CEB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24C93BDA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C94A820();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C93BF64(a5, a6);
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
  uint64_t v8 = sub_24C94A8E0();
  if (!v8)
  {
    sub_24C94A950();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C94A9A0();
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

uint64_t sub_24C93BF64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C93BFFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C93C1DC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C93C1DC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C93BFFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C93C174(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C94A8A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C94A950();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C94A650();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C94A9A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C94A950();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C93C174(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C93C1DC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE90);
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
  uint64_t result = sub_24C94A9A0();
  __break(1u);
  return result;
}

uint64_t sub_24C93C32C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  size_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_24C93C40C;
  return v5(v2 + 32);
}

uint64_t sub_24C93C40C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

char *sub_24C93C520(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int64_t v9 = v8;
  uint64_t v56 = a7;
  uint64_t v57 = a8;
  *(void *)&long long v52 = a6;
  uint64_t v67 = a5;
  uint64_t v54 = a3;
  uint64_t v55 = a4;
  *(void *)&long long v50 = a1;
  uint64_t v64 = *(void **)v8;
  uint64_t v11 = *a2;
  uint64_t v66 = v64[12];
  uint64_t v68 = v64[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v65 = sub_24C94A3E0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = sub_24C94A380();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v62 = v13;
  uint64_t v63 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v60 = (char *)&v50 - v15;
  uint64_t v16 = *(void *)(v11 + *MEMORY[0x263EFDD98]);
  uint64_t v53 = sub_24C94A3E0();
  uint64_t v51 = swift_getWitnessTable();
  uint64_t v17 = sub_24C94A380();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v58 = v17;
  uint64_t v59 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v50 - v20;
  uint64_t v22 = *(void *)(v16 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v19);
  uint64_t v25 = (char *)&v50 - v24;
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v50 - v27;
  (*(void (**)(char *, void))(*(void *)(v68 - 8) + 16))(&v8[v64[15]], v50);
  sub_24C94A420();
  swift_allocObject();
  *((void *)v8 + 2) = sub_24C94A410();
  *(void *)&v8[*(void *)(*(void *)v8 + 128)] = a2;
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  long long v50 = *(_OWORD *)v52;
  long long v52 = *(_OWORD *)(v52 + 16);
  v29(v28, v54, AssociatedTypeWitness);
  swift_retain();
  *(void *)&v8[*(void *)(*(void *)v8 + 136)] = sub_24C94A3F0();
  uint64_t v30 = v56;
  *(void *)&v8[*(void *)(*(void *)v8 + 160)] = v55;
  uint64_t v31 = &v9[*(void *)(*(void *)v9 + 144)];
  long long v32 = v52;
  *(_OWORD *)uint64_t v31 = v50;
  *((_OWORD *)v31 + 1) = v32;
  uint64_t v33 = (uint64_t *)&v9[*(void *)(*(void *)v9 + 152)];
  uint64_t v34 = v57;
  uint64_t *v33 = v30;
  v33[1] = v34;
  swift_retain();
  sub_24C93D500(v30);
  sub_24C94A3D0();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v9[*(void *)(*(void *)v9 + 168)], v25, v16);
  *(void *)&v9[*(void *)(*(void *)v9 + 176)] = MEMORY[0x263F8EE78];
  sub_24C9382A0((uint64_t)v67, (uint64_t)&v9[*(void *)(*(void *)v9 + 184)]);
  uint64_t v69 = a2;
  sub_24C94A430();
  uint64_t v35 = swift_allocObject();
  swift_weakInit();
  uint64_t v36 = (void *)swift_allocObject();
  uint64_t v37 = v64;
  v36[2] = v68;
  uint64_t v57 = v37[11];
  uint64_t v38 = v66;
  v36[3] = v57;
  v36[4] = v38;
  uint64_t v39 = v37[13];
  v36[5] = v39;
  v36[6] = v35;
  swift_retain();
  uint64_t v40 = v58;
  swift_getWitnessTable();
  sub_24C94A440();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v21, v40);
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE50);
  sub_24C9335C8((unint64_t *)&qword_26B17DE58, &qword_26B17DE50);
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  uint64_t v69 = *(void **)&v9[*(void *)(*(void *)v9 + 136)];
  uint64_t v41 = v60;
  sub_24C94A430();
  uint64_t v42 = swift_allocObject();
  swift_weakInit();
  uint64_t v43 = (void *)swift_allocObject();
  uint64_t v44 = v57;
  v43[2] = v68;
  v43[3] = v44;
  v43[4] = v66;
  v43[5] = v39;
  v43[6] = v42;
  swift_retain();
  uint64_t v45 = v62;
  swift_getWitnessTable();
  sub_24C94A440();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v41, v45);
  swift_release();
  swift_beginAccess();
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  uint64_t v46 = v67[3];
  uint64_t v47 = v67[4];
  __swift_project_boxed_opaque_existential_1(v67, v46);
  uint64_t v48 = *(void (**)(uint64_t (*)(uint64_t), char *, uint64_t, uint64_t))(v47 + 64);
  swift_retain();
  v48(sub_24C93CE94, v9, v46, v47);
  swift_release();
  return v9;
}

char *sub_24C93CD48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_24C93C520(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_24C93CDDC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C93CE14()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C93CE4C(uint64_t a1)
{
  return sub_24C93CE7C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C93863C);
}

uint64_t sub_24C93CE64(uint64_t a1)
{
  return sub_24C93CE7C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C9389C8);
}

uint64_t sub_24C93CE7C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_24C93CE98(uint64_t a1)
{
  return sub_24C93A2B0(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24C93CEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C93CF10()
{
  swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(type metadata accessor for SideEffect() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + v3);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      uint64_t v9 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98) + 80);
      uint64_t v10 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
    else
    {
      if (EnumCaseMultiPayload) {
        goto LABEL_10;
      }
      if (*(void *)(v5 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      }
      uint64_t v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98) + 48);
      uint64_t v8 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
    swift_release();
  }
LABEL_10:
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 24, v2 | 7);
}

uint64_t sub_24C93D110(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[6];
  swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(type metadata accessor for SideEffect() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v1[8];
  uint64_t v10 = (char *)v1 + v8;
  uint64_t v11 = (char *)v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_24C92B568;
  v12[9] = v5;
  v12[10] = v6;
  v12[7] = v10;
  v12[8] = v11;
  v12[5] = a1;
  v12[6] = v9;
  return MEMORY[0x270FA2498](sub_24C93A610, 0, 0);
}

uint64_t sub_24C93D270(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C93D2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C93D338()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C93D370(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24C92B568;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697FCEC8 + dword_2697FCEC8);
  return v6(a1, v4);
}

uint64_t sub_24C93D428()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24C93D470(uint64_t a1)
{
  return sub_24C93B944(a1, *(void (**)(char *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(uint64_t **)(v1 + 64));
}

uint64_t sub_24C93D484()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24C93D4CC(uint64_t a1, uint64_t a2)
{
  return sub_24C93BAA0(a1, a2, *(uint64_t **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void (**)(char *, uint64_t))(v2 + 56));
}

uint64_t sub_24C93D500(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24C93D510(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24C93D520()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24C93D568(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24C93D7D4;
  return sub_24C93DCD4(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_24C93D62C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 88) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24C93D71C()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  return sub_24C939D7C(*(void (**)(char *))(v0 + 48), *(void *)(v0 + 56), *(void (**)(char *, char *))(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), v0 + v1, *(void **)(v0+ ((*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
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

uint64_t StateProjection.init(get:set:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_24C93D7E4()
{
  swift_release();
  return swift_release();
}

uint64_t sub_24C93D820(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_24C93D86C(void *a1, void *a2)
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

_OWORD *sub_24C93D8CC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_24C93D914(uint64_t *a1, int a2)
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

uint64_t sub_24C93D95C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for StateProjection()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C93D9B4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    long long v4 = *(_OWORD *)(a1 + 16);
    v9[0] = *(_OWORD *)a1;
    v9[1] = v4;
    long long v5 = *(_OWORD *)(a1 + 48);
    v9[2] = *(_OWORD *)(a1 + 32);
    v9[3] = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24C92BFAC(v9, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
    return sub_24C92C388(a2);
  }
  else
  {
    sub_24C94154C(a1, qword_26B17DC30);
    sub_24C940928(a2, v9);
    sub_24C92C388(a2);
    return sub_24C94154C((uint64_t)v9, qword_26B17DC30);
  }
}

uint64_t sub_24C93DA7C(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4)
{
  int v6 = *a3;
  sub_24C92C32C(a1, (uint64_t)v17);
  uint64_t v7 = *a2;
  uint64_t v11 = MEMORY[0x263F8D1F0];
  uint64_t v12 = MEMORY[0x263F8D1F8];
  *(void *)&long long v10 = v7;
  if (v6 == 1) {
    uint64_t v8 = MEMORY[0x253302020](a2 + 1);
  }
  else {
    uint64_t v8 = 0;
  }
  sub_24C938304(&v10, (uint64_t)v13);
  uint64_t v14 = v8;
  char v15 = v6;
  uint64_t v16 = a4;
  swift_beginAccess();
  swift_retain();
  sub_24C93D9B4((uint64_t)v13, (uint64_t)v17);
  return swift_endAccess();
}

uint64_t sub_24C93DB40(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24C92C32C(a1, (uint64_t)&v17);
  sub_24C92C630(a2, (uint64_t)&v20);
  sub_24C92C32C((uint64_t)&v17, (uint64_t)v14);
  sub_24C92C630((uint64_t)&v20, (uint64_t)v16);
  sub_24C9382A0((uint64_t)v16, (uint64_t)&v10);
  sub_24C9415A8((uint64_t)v16);
  __swift_project_boxed_opaque_existential_1(&v10, *((uint64_t *)&v11 + 1));
  uint64_t v5 = sub_24C94A570();
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v6 = sub_24C94A570();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  sub_24C92C388((uint64_t)v14);
  v14[0] = v17;
  v14[1] = v18;
  v16[0] = v20;
  v16[1] = v21;
  void v16[2] = v22;
  uint64_t v15 = v19;
  v16[3] = v23;
  if (v5 == v6)
  {
    long long v10 = v17;
    long long v11 = v18;
    v13[3] = v23;
    v13[0] = v20;
    v13[1] = v21;
    uint64_t v12 = v19;
    v13[2] = v22;
    char v7 = v23;
    sub_24C9415A8((uint64_t)v13);
    char v8 = v7 ^ 1;
    sub_24C92C388((uint64_t)&v10);
  }
  else
  {
    sub_24C94154C((uint64_t)v14, &qword_26B17DE90);
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_24C93DCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 40) = a4;
  *(void *)(v5 + 48) = a5;
  return MEMORY[0x270FA2498](sub_24C93DCF4, a4, 0);
}

uint64_t sub_24C93DCF4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24C940C24((uint64_t)sub_24C940C04, v4, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_retain();
  sub_24C94127C(v5, v1);
  swift_release();
  swift_release();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24C93DDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[115] = v3;
  v4[114] = a3;
  v4[113] = a2;
  v4[112] = a1;
  uint64_t v5 = sub_24C94A6C0();
  v4[116] = v5;
  v4[117] = *(void *)(v5 - 8);
  v4[118] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  v4[119] = swift_task_alloc();
  uint64_t v6 = sub_24C94A700();
  v4[120] = v6;
  v4[121] = *(void *)(v6 - 8);
  v4[122] = swift_task_alloc();
  v4[123] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for SideEffect();
  v4[124] = v7;
  v4[125] = *(void *)(v7 - 8);
  v4[126] = swift_task_alloc();
  v4[127] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C93DFD0, v3, 0);
}

uint64_t sub_24C93DFD0()
{
  uint64_t v78 = v0;
  (*(void (**)(void, void, void))(*(void *)(v0 + 1000) + 16))(*(void *)(v0 + 1016), *(void *)(v0 + 896), *(void *)(v0 + 992));
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v2 = *(void *)(v0 + 1016);
      uint64_t v3 = *(void *)(v0 + 1008);
      uint64_t v4 = *(void *)(v0 + 976);
      uint64_t v5 = *(void *)(v0 + 968);
      uint64_t v6 = *(void *)(v0 + 960);
      uint64_t v68 = *(void *)(v0 + 912);
      uint64_t v69 = *(void *)(v0 + 904);
      uint64_t v7 = *(void *)(v2 + 40);
      char v71 = *(unsigned char *)(v2 + 48);
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98);
      uint64_t v9 = v2 + v8[20];
      char v66 = *(unsigned char *)(v2 + v8[28]);
      char v67 = *(unsigned char *)(v2 + v8[24]);
      long long v10 = (uint64_t *)(v2 + v8[32]);
      uint64_t v11 = v10[1];
      uint64_t v70 = *v10;
      *(void *)(v0 + 1064) = v11;
      uint64_t v12 = *(void *)(v2 + 32);
      long long v13 = *(_OWORD *)(v2 + 16);
      *(_OWORD *)(v0 + 160) = *(_OWORD *)v2;
      *(_OWORD *)(v0 + 176) = v13;
      *(void *)(v0 + 192) = v12;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v9, v6);
      uint64_t v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
      uint64_t v15 = v3 + v14[12];
      uint64_t v16 = v14[16];
      uint64_t v17 = v14[20];
      long long v18 = (void *)(v3 + v14[24]);
      sub_24C92C32C(v0 + 160, v3);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v15, v4, v6);
      *(unsigned char *)(v3 + v16) = v67;
      *(unsigned char *)(v3 + v17) = v66;
      uint64_t v19 = type metadata accessor for StoreProxy();
      uint64_t v20 = *(void *)(v19 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v0 + 768, v69, v19);
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v68;
      *(void *)(v21 + 24) = v7;
      *(void *)(v21 + 32) = v70;
      *(void *)(v21 + 40) = v11;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v21 + 48, v0 + 768, v19);
      *(unsigned char *)(v21 + 72) = v71;
      *long long v18 = &unk_2697FCEF0;
      v18[1] = v21;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      long long v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 1072) = v22;
      *long long v22 = v0;
      v22[1] = sub_24C93EB94;
      uint64_t v23 = *(void *)(v0 + 1008);
      uint64_t v24 = *(void *)(v0 + 912);
      uint64_t v25 = *(void *)(v0 + 904);
      return sub_24C93DDEC(v23, v25, v24);
    }
    uint64_t v42 = *(void *)(v0 + 1016);
    uint64_t v43 = *(void *)(v42 + 32);
    long long v44 = *(_OWORD *)(v42 + 16);
    *(_OWORD *)(v0 + 360) = *(_OWORD *)v42;
    *(_OWORD *)(v0 + 376) = v44;
    *(void *)(v0 + 392) = v43;
    sub_24C92C32C(v0 + 360, v0 + 80);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    swift_beginAccess();
    sub_24C93D9B4((uint64_t)&v74, v0 + 80);
    swift_endAccess();
    uint64_t v45 = v0 + 360;
    goto LABEL_11;
  }
  uint64_t v27 = *(void *)(v0 + 1016);
  uint64_t v28 = *(void *)(v0 + 984);
  uint64_t v29 = *(void *)(v0 + 968);
  uint64_t v30 = *(void *)(v0 + 960);
  uint64_t v31 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98);
  int v32 = *(unsigned __int8 *)(v27 + v31[16]);
  char v72 = *(unsigned char *)(v27 + v31[20]);
  uint64_t v33 = v27 + v31[12];
  uint64_t v34 = (uint64_t *)(v27 + v31[24]);
  uint64_t v35 = v34[1];
  uint64_t v73 = *v34;
  *(void *)(v0 + 1024) = v35;
  sub_24C940654(v27, v0 + 240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v28, v33, v30);
  sub_24C9406BC(v0 + 240, v0 + 320);
  if (*(void *)(v0 + 344))
  {
    uint64_t v36 = (_OWORD *)(v0 + 16);
    uint64_t v37 = *(void *)(v0 + 920);
    long long v38 = *(_OWORD *)(v0 + 336);
    *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 320);
    *(_OWORD *)(v0 + 296) = v38;
    *(void *)(v0 + 312) = *(void *)(v0 + 352);
    swift_beginAccess();
    uint64_t v39 = *(void *)(v37 + 112);
    if (*(void *)(v39 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v40 = sub_24C92B6A0(v0 + 280);
      if (v41)
      {
        sub_24C92C630(*(void *)(v39 + 56) + (v40 << 6), v0 + 16);
      }
      else
      {
        *(_OWORD *)(v0 + 48) = 0u;
        *(_OWORD *)(v0 + 64) = 0u;
        *uint64_t v36 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 40))
      {
        sub_24C94154C(v0 + 16, qword_26B17DC30);
        if (!v32)
        {
          uint64_t v63 = *(void *)(v0 + 984);
          uint64_t v64 = *(void *)(v0 + 968);
          uint64_t v65 = *(void *)(v0 + 960);
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
          sub_24C94154C(v0 + 240, &qword_26B17DEA0);
          uint64_t v45 = v0 + 280;
LABEL_11:
          sub_24C92C388(v45);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
          return v46();
        }
        if (v32 != 1)
        {
          sub_24C92C32C(v0 + 280, v0 + 200);
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          swift_beginAccess();
          sub_24C93D9B4((uint64_t)&v74, v0 + 200);
          swift_endAccess();
        }
        goto LABEL_22;
      }
    }
    else
    {
      *(_OWORD *)(v0 + 48) = 0u;
      *(_OWORD *)(v0 + 64) = 0u;
      *uint64_t v36 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    sub_24C94154C(v0 + 16, qword_26B17DC30);
LABEL_22:
    sub_24C92C388(v0 + 280);
    goto LABEL_23;
  }
  sub_24C94154C(v0 + 320, &qword_26B17DEA0);
LABEL_23:
  uint64_t v47 = *(void *)(v0 + 968);
  uint64_t v48 = *(void *)(v0 + 960);
  uint64_t v49 = *(void *)(v0 + 952);
  uint64_t v50 = *(void *)(v0 + 912);
  uint64_t v51 = *(void *)(v0 + 904);
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 16))(v49, *(void *)(v0 + 984), v48);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v49, 0, 1, v48);
  uint64_t v52 = type metadata accessor for StoreProxy();
  uint64_t v53 = *(void *)(v52 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v0 + 816, v51, v52);
  uint64_t v54 = (void *)swift_allocObject();
  v54[2] = 0;
  void v54[3] = 0;
  v54[4] = v50;
  v54[5] = v73;
  v54[6] = v35;
  (*(void (**)(void *, uint64_t, uint64_t))(v53 + 32))(v54 + 7, v0 + 816, v52);
  swift_retain();
  uint64_t v55 = sub_24C93F54C(v49, (uint64_t)&unk_2697FCF00, (uint64_t)v54);
  *(void *)(v0 + 1032) = v55;
  sub_24C9406BC(v0 + 240, v0 + 440);
  if (*(void *)(v0 + 464))
  {
    uint64_t v56 = *(uint64_t **)(v0 + 904);
    long long v57 = *(_OWORD *)(v0 + 456);
    *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 440);
    *(_OWORD *)(v0 + 416) = v57;
    *(void *)(v0 + 432) = *(void *)(v0 + 472);
    LOBYTE(v74) = v72;
    sub_24C94A3A0();
    swift_allocObject();
    swift_retain();
    uint64_t v58 = sub_24C94A3B0();
    sub_24C93DA7C(v0 + 400, v56, (unsigned __int8 *)&v74, v58);
    swift_release();
    sub_24C92C388(v0 + 400);
  }
  else
  {
    sub_24C94154C(v0 + 440, &qword_26B17DEA0);
  }
  uint64_t v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 1040) = v59;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEC8);
  *(void *)(v0 + 1048) = v60;
  *uint64_t v59 = v0;
  v59[1] = sub_24C93E848;
  uint64_t v61 = MEMORY[0x263F8EE60] + 8;
  uint64_t v62 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v60, v55, v61, v60, v62);
}

uint64_t sub_24C93E848()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1056) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 920);
  if (v0) {
    uint64_t v4 = sub_24C93EDB4;
  }
  else {
    uint64_t v4 = sub_24C93E974;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24C93E974()
{
  uint64_t v14 = v0;
  sub_24C9406BC(v0 + 240, v0 + 120);
  if (*(void *)(v0 + 144))
  {
    long long v1 = *(_OWORD *)(v0 + 136);
    *(_OWORD *)(v0 + 560) = *(_OWORD *)(v0 + 120);
    *(_OWORD *)(v0 + 576) = v1;
    *(void *)(v0 + 592) = *(void *)(v0 + 152);
    char isCancelled = swift_task_isCancelled();
    uint64_t v3 = *(void *)(v0 + 984);
    uint64_t v4 = *(void *)(v0 + 968);
    uint64_t v5 = *(void *)(v0 + 960);
    if (isCancelled)
    {
      swift_release();
      swift_release();
      sub_24C92C388(v0 + 560);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 984);
      sub_24C92C32C(v0 + 560, v0 + 640);
      memset(v13, 0, sizeof(v13));
      swift_beginAccess();
      sub_24C93D9B4((uint64_t)v13, v0 + 640);
      swift_endAccess();
      swift_release();
      swift_release();
      sub_24C92C388(v0 + 560);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v12, v5);
    }
    uint64_t v9 = v0 + 240;
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 984);
    uint64_t v7 = *(void *)(v0 + 968);
    uint64_t v8 = *(void *)(v0 + 960);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    sub_24C94154C(v0 + 240, &qword_26B17DEA0);
    uint64_t v9 = v0 + 120;
  }
  sub_24C94154C(v9, &qword_26B17DEA0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_24C93EB94()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 920);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24C93ECA4, v1, 0);
}

uint64_t sub_24C93ECA4()
{
  uint64_t v1 = v0[126];
  uint64_t v2 = v0[125];
  uint64_t v3 = v0[124];
  uint64_t v4 = v0[122];
  uint64_t v5 = v0[121];
  uint64_t v6 = v0[120];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_24C92C388((uint64_t)(v0 + 20));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24C93EDB4()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0 + 120;
  uint64_t v2 = v0 + 240;
  *(void *)(v0 + 872) = *(void *)(v0 + 1056);
  MEMORY[0x253301D20]();
  if (swift_dynamicCast())
  {

    if (qword_26B17DDB8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24C94A370();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B17F260);
    sub_24C9406BC(v0 + 240, v0 + 600);
    uint64_t v4 = sub_24C94A350();
    os_log_type_t v5 = sub_24C94A7B0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(void *)&v34[0] = v7;
      *(_DWORD *)uint64_t v6 = 136446210;
      sub_24C9406BC(v0 + 600, v0 + 480);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA0);
      uint64_t v8 = sub_24C94A5F0();
      *(void *)(v0 + 888) = sub_24C93BCD4(v8, v9, (uint64_t *)v34);
      uint64_t v2 = v0 + 240;
      sub_24C94A810();
      uint64_t v1 = v0 + 120;
      swift_bridgeObjectRelease();
      sub_24C94154C(v0 + 600, &qword_26B17DEA0);
      _os_log_impl(&dword_24C91C000, v4, v5, "Cancelled effect with key: %{public}s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253301F20](v7, -1, -1);
      MEMORY[0x253301F20](v6, -1, -1);
    }
    else
    {
      sub_24C94154C(v0 + 600, &qword_26B17DEA0);
    }

    (*(void (**)(void, void))(*(void *)(v0 + 936) + 8))(*(void *)(v0 + 944), *(void *)(v0 + 928));
  }
  else
  {

    if (qword_26B17DDB8 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void *)(v0 + 1056);
    uint64_t v11 = sub_24C94A370();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B17F260);
    sub_24C9406BC(v0 + 240, v0 + 520);
    MEMORY[0x253301D20](v10);
    MEMORY[0x253301D20](v10);
    uint64_t v12 = sub_24C94A350();
    os_log_type_t v13 = sub_24C94A7A0();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void **)(v0 + 1056);
    if (v14)
    {
      uint64_t v16 = swift_slowAlloc();
      int v32 = (void *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(void *)&v34[0] = v33;
      *(_DWORD *)uint64_t v16 = 136446466;
      sub_24C9406BC(v0 + 520, v0 + 680);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA0);
      uint64_t v17 = sub_24C94A5F0();
      *(void *)(v0 + 864) = sub_24C93BCD4(v17, v18, (uint64_t *)v34);
      sub_24C94A810();
      swift_bridgeObjectRelease();
      sub_24C94154C(v0 + 520, &qword_26B17DEA0);
      *(_WORD *)(v16 + 12) = 2114;
      MEMORY[0x253301D20](v15);
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 880) = v19;
      sub_24C94A810();
      *int v32 = v19;

      _os_log_impl(&dword_24C91C000, v12, v13, "Effect \"%{public}s\" ended with error: %{public}@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DED8);
      swift_arrayDestroy();
      MEMORY[0x253301F20](v32, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253301F20](v33, -1, -1);
      uint64_t v20 = v16;
      uint64_t v2 = v0 + 240;
      MEMORY[0x253301F20](v20, -1, -1);
    }
    else
    {

      sub_24C94154C(v0 + 520, &qword_26B17DEA0);
    }
    uint64_t v1 = v0 + 120;
  }
  sub_24C9406BC(v2, v1);
  if (*(void *)(v0 + 144))
  {
    long long v21 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v0 + 560) = *(_OWORD *)v1;
    *(_OWORD *)(v0 + 576) = v21;
    *(void *)(v0 + 592) = *(void *)(v1 + 32);
    char isCancelled = swift_task_isCancelled();
    uint64_t v23 = *(void *)(v0 + 984);
    uint64_t v24 = *(void *)(v0 + 968);
    uint64_t v25 = *(void *)(v0 + 960);
    if ((isCancelled & 1) == 0)
    {
      sub_24C92C32C(v0 + 560, v0 + 640);
      memset(v34, 0, sizeof(v34));
      swift_beginAccess();
      sub_24C93D9B4((uint64_t)v34, v0 + 640);
      swift_endAccess();
    }
    swift_release();
    swift_release();
    sub_24C92C388(v0 + 560);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    uint64_t v26 = v2;
  }
  else
  {
    uint64_t v27 = *(void *)(v0 + 984);
    uint64_t v28 = *(void *)(v0 + 968);
    uint64_t v29 = *(void *)(v0 + 960);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    sub_24C94154C(v2, &qword_26B17DEA0);
    uint64_t v26 = v1;
  }
  sub_24C94154C(v26, &qword_26B17DEA0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_24C93F470(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_24C92B568;
  return v10(a6);
}

uint64_t sub_24C93F54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24C94A700();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24C94A6F0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24C94154C(a1, &qword_26B17DE78);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24C94A6B0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24C93F6D4(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 33) = a6;
  *(void *)(v6 + 72) = a4;
  *(void *)(v6 + 80) = a5;
  *(void *)(v6 + 64) = a3;
  *(double *)(v6 + 56) = a1;
  uint64_t v7 = sub_24C94A910();
  *(void *)(v6 + 88) = v7;
  *(void *)(v6 + 96) = *(void *)(v7 - 8);
  *(void *)(v6 + 104) = swift_task_alloc();
  *(void *)(v6 + 112) = swift_task_alloc();
  uint64_t v8 = sub_24C94A930();
  *(void *)(v6 + 120) = v8;
  *(void *)(v6 + 128) = *(void *)(v8 - 8);
  *(void *)(v6 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C93F80C, 0, 0);
}

uint64_t sub_24C93F80C()
{
  if (sub_24C94A730())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v5 = *(void *)(v0 + 88);
    uint64_t v6 = sub_24C94ABB0();
    uint64_t v8 = v7;
    sub_24C94A920();
    *(void *)(v0 + 40) = v6;
    *(void *)(v0 + 48) = v8;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v9 = sub_24C9408E0(&qword_2697FCF08, MEMORY[0x263F8F710]);
    sub_24C94AAD0();
    sub_24C9408E0(&qword_2697FCF10, MEMORY[0x263F8F6D8]);
    sub_24C94A940();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    *(void *)(v0 + 144) = v10;
    *(void *)(v0 + 152) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v10(v3, v5);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_24C93FA38;
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 120);
    return MEMORY[0x270FA2380](v13, v0 + 16, v12, v9);
  }
}

uint64_t sub_24C93FA38()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 144))(*(void *)(v2 + 112), *(void *)(v2 + 88));
    return MEMORY[0x270FA2498](sub_24C93FD94, 0, 0);
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 128);
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v5 = *(void *)(v2 + 120);
    uint64_t v6 = *(int **)(v2 + 64);
    (*(void (**)(void, void))(v2 + 144))(*(void *)(v2 + 112), *(void *)(v2 + 88));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v10 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v2 + 176) = v7;
    *uint64_t v7 = v2;
    v7[1] = sub_24C93FC3C;
    uint64_t v8 = *(void *)(v2 + 80);
    return v10(v8);
  }
}

uint64_t sub_24C93FC3C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C93FE2C, 0, 0);
  }
}

uint64_t sub_24C93FD94()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24C93FE2C()
{
  if ((*(unsigned char *)(v0 + 33) & 1) != 0 && (sub_24C94A730() & 1) == 0)
  {
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v5 = *(void *)(v0 + 88);
    uint64_t v6 = sub_24C94ABB0();
    uint64_t v8 = v7;
    sub_24C94A920();
    *(void *)(v0 + 40) = v6;
    *(void *)(v0 + 48) = v8;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v9 = sub_24C9408E0(&qword_2697FCF08, MEMORY[0x263F8F710]);
    sub_24C94AAD0();
    sub_24C9408E0(&qword_2697FCF10, MEMORY[0x263F8F6D8]);
    sub_24C94A940();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    *(void *)(v0 + 144) = v10;
    *(void *)(v0 + 152) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v10(v3, v5);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_24C93FA38;
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 120);
    return MEMORY[0x270FA2380](v13, v0 + 16, v12, v9);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
}

uint64_t sub_24C940060()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for SideEffectRegistry()
{
  return self;
}

uint64_t destroy for SideEffectRegistry.RegistryTask(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for SideEffectRegistry.RegistryTask(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SideEffectRegistry.RegistryTask(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SideEffectRegistry.RegistryTask(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SideEffectRegistry.RegistryTask()
{
  return &type metadata for SideEffectRegistry.RegistryTask;
}

uint64_t sub_24C940530()
{
  return v0;
}

uint64_t sub_24C94053C()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_24C94057C(uint64_t a1)
{
  double v4 = *(double *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = v1 + 48;
  char v8 = *(unsigned char *)(v1 + 72);
  int v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *int v9 = v2;
  v9[1] = sub_24C92B568;
  return sub_24C93F6D4(v4, a1, v5, v6, v7, v8);
}

uint64_t sub_24C940654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C9406BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C940724()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24C94076C()
{
  uint64_t v2 = *(int **)(v0 + 40);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_24C93D7D4;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24C92B568;
  return v6(v0 + 56);
}

uint64_t sub_24C940894()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEC8);
  uint64_t v2 = MEMORY[0x263F8EE60] + 8;
  uint64_t v3 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB0](v0, v2, v1, v3);
}

uint64_t sub_24C9408E0(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_24C940928@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24C92B6A0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24C92C3DC();
      uint64_t v9 = v14;
    }
    sub_24C92C388(*(void *)(v9 + 48) + 40 * v6);
    uint64_t v10 = (_OWORD *)(*(void *)(v9 + 56) + (v6 << 6));
    long long v11 = v10[1];
    *a2 = *v10;
    a2[1] = v11;
    long long v12 = v10[3];
    a2[2] = v10[2];
    a2[3] = v12;
    sub_24C940A30(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_24C940A30(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_24C94A860();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24C92C32C(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v30);
        uint64_t v12 = sub_24C94A870();
        double result = sub_24C92C388((uint64_t)v30);
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 >= v8 && v3 >= (uint64_t)v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            unint64_t v17 = v16 + 40 * v3;
            unint64_t v18 = (long long *)(v16 + 40 * v6);
            if (v3 != v6 || v17 >= (unint64_t)v18 + 40)
            {
              long long v19 = *v18;
              long long v20 = v18[1];
              *(void *)(v17 + 32) = *((void *)v18 + 4);
              *(_OWORD *)unint64_t v17 = v19;
              *(_OWORD *)(v17 + 16) = v20;
            }
            uint64_t v21 = *(void *)(a2 + 56);
            long long v22 = (long long *)(v21 + (v3 << 6));
            uint64_t v23 = (long long *)(v21 + (v6 << 6));
            if (v3 != v6 || (int64_t v3 = v6, v22 >= v23 + 4))
            {
              long long v9 = *v23;
              long long v10 = v23[1];
              long long v11 = v23[3];
              v22[2] = v23[2];
              v22[3] = v11;
              *long long v22 = v9;
              v22[1] = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v8 || v3 >= (uint64_t)v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << result) - 1;
  }
  *uint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24C940C04(uint64_t a1, uint64_t a2)
{
  return sub_24C93DB40(a1, a2, *(void **)(v2 + 16)) & 1;
}

uint64_t sub_24C940C24(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (uint64_t (*)(unsigned char *, unsigned char *))isStackAllocationSafe;
  v13[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a3 + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_24C940D9C((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, a3, v6);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    long long v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a2 = sub_24C940D9C((uint64_t)v11, v8, a3, v6);
    MEMORY[0x253301F20](v11, -1, -1);
  }
  return a2;
}

uint64_t sub_24C940D9C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(unsigned char *, unsigned char *))
{
  long long v19 = (unint64_t *)result;
  uint64_t v20 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 64);
  int64_t v23 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v12 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v13 = v12 | (v7 << 6);
LABEL_17:
    sub_24C92C32C(*(void *)(a3 + 48) + 40 * v13, (uint64_t)v22);
    sub_24C92C630(*(void *)(a3 + 56) + (v13 << 6), (uint64_t)v21);
    char v17 = a4(v22, v21);
    sub_24C9415A8((uint64_t)v21);
    double result = sub_24C92C388((uint64_t)v22);
    if (v4) {
      return result;
    }
    if (v17)
    {
      *(unint64_t *)((char *)v19 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      BOOL v14 = __OFADD__(v20++, 1);
      if (v14) {
        goto LABEL_30;
      }
    }
  }
  BOOL v14 = __OFADD__(v7++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v23) {
    return sub_24C940F9C(v19, a2, v20, a3);
  }
  unint64_t v15 = *(void *)(v8 + 8 * v7);
  if (v15)
  {
LABEL_16:
    unint64_t v11 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v7 << 6);
    goto LABEL_17;
  }
  int64_t v16 = v7 + 1;
  if (v7 + 1 >= v23) {
    return sub_24C940F9C(v19, a2, v20, a3);
  }
  unint64_t v15 = *(void *)(v8 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v7 + 2;
  if (v7 + 2 >= v23) {
    return sub_24C940F9C(v19, a2, v20, a3);
  }
  unint64_t v15 = *(void *)(v8 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v7 + 3;
  if (v7 + 3 >= v23) {
    return sub_24C940F9C(v19, a2, v20, a3);
  }
  unint64_t v15 = *(void *)(v8 + 8 * v16);
  if (v15)
  {
LABEL_15:
    int64_t v7 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v7 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v7 >= v23) {
      return sub_24C940F9C(v19, a2, v20, a3);
    }
    unint64_t v15 = *(void *)(v8 + 8 * v7);
    ++v16;
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24C940F9C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DEB0);
  uint64_t result = sub_24C94A990();
  uint64_t v8 = result;
  uint64_t v28 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v28) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v28) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v28) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v28) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v28) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    sub_24C92C32C(*(void *)(v4 + 48) + 40 * v13, (uint64_t)v38);
    sub_24C92C630(*(void *)(v4 + 56) + (v13 << 6), (uint64_t)v37);
    long long v34 = v38[0];
    long long v35 = v38[1];
    uint64_t v36 = v39;
    long long v30 = v37[0];
    long long v31 = v37[1];
    long long v32 = v37[2];
    long long v33 = v37[3];
    uint64_t result = sub_24C94A870();
    uint64_t v17 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v11 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v11 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v11 + 8 * v19);
      }
      while (v24 == -1);
      unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
    }
    *(void *)(v11 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t v25 = *(void *)(v8 + 48) + 40 * v20;
    *(_OWORD *)uint64_t v25 = v34;
    *(_OWORD *)(v25 + 16) = v35;
    *(void *)(v25 + 32) = v36;
    uint64_t v26 = (_OWORD *)(*(void *)(v8 + 56) + (v20 << 6));
    _OWORD *v26 = v30;
    v26[1] = v31;
    v26[2] = v32;
    v26[3] = v33;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24C94127C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  unint64_t v6 = (uint64_t *)(a2 + 112);
  int64_t v34 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v11 >= v34) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v23 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v34) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v23 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v34) {
          return swift_release();
        }
        unint64_t v12 = *(void *)(v23 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v34) {
            return swift_release();
          }
          unint64_t v12 = *(void *)(v23 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_24:
    sub_24C92C32C(*(void *)(a1 + 48) + 40 * v10, (uint64_t)v31);
    sub_24C92C630(*(void *)(a1 + 56) + (v10 << 6), (uint64_t)v32 + 8);
    v29[4] = v32[2];
    v29[5] = v32[3];
    uint64_t v30 = v33;
    v29[0] = v31[0];
    v29[1] = v31[1];
    _OWORD v29[2] = v32[0];
    v29[3] = v32[1];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_24C92B6A0((uint64_t)v29);
    char v16 = v15;
    swift_bridgeObjectRelease();
    if (v16)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = *v6;
      uint64_t v24 = *v6;
      *unint64_t v6 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24C92C3DC();
        uint64_t v18 = v24;
      }
      sub_24C92C388(*(void *)(v18 + 48) + 40 * v14);
      unint64_t v19 = (long long *)(*(void *)(v18 + 56) + (v14 << 6));
      long long v21 = *v19;
      long long v20 = v19[1];
      long long v22 = v19[3];
      long long v27 = v19[2];
      long long v28 = v22;
      long long v25 = v21;
      long long v26 = v20;
      sub_24C940A30(v14, v18);
      *unint64_t v6 = v18;
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    sub_24C94154C((uint64_t)&v25, qword_26B17DC30);
    swift_endAccess();
    uint64_t result = sub_24C94154C((uint64_t)v29, &qword_26B17DE90);
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v34) {
    return swift_release();
  }
  unint64_t v12 = *(void *)(v23 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v34) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v23 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24C94154C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C9415A8(uint64_t a1)
{
  return a1;
}

uint64_t Binding.init<A>(store:get:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_24C94A6E0();
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_24C94A6D0();
  int64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  void v13[2] = v12;
  v13[3] = v14;
  _OWORD v13[4] = a6;
  v13[5] = a2;
  v13[6] = a3;
  v13[7] = a1;
  swift_retain();
  sub_24C93D500(a4);
  uint64_t v15 = sub_24C94A6D0();
  char v16 = (void *)swift_allocObject();
  void v16[2] = v15;
  v16[3] = v14;
  _OWORD v16[4] = a6;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a1;
  sub_24C94A450();
  sub_24C93D510(a4);
  swift_release();
  return swift_release();
}

uint64_t sub_24C941728()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24C941770()
{
  return (*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 56));
}

uint64_t sub_24C9417A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t result = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v10 = (char *)&v11 - v9;
  if (a4)
  {
    swift_retain();
    a4(a1);
    Store.send(_:)((uint64_t)v10);
    sub_24C93D510((uint64_t)a4);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_24C9418E8()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24C941938(uint64_t a1)
{
  return sub_24C9417A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 40));
}

uint64_t *sub_24C941948(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (EnumCaseMultiPayload == 4)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3)
    {
      uint64_t v11 = sub_24C94A2B0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_24C94A340();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24C941AC0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 4)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (result == 3)
    {
      uint64_t v3 = sub_24C94A2B0();
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t v3 = sub_24C94A340();
    }
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
}

void *sub_24C941B74(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 3)
  {
    uint64_t v9 = sub_24C94A2B0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24C94A340();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24C941CA8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C936288((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3)
    {
      uint64_t v8 = sub_24C94A2B0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24C94A340();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for DatabaseBinding()
{
  uint64_t result = qword_26B17DB20;
  if (!qword_26B17DB20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_24C941E40(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v8 = sub_24C94A2B0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24C94A340();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24C941F4C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C936288((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v8 = sub_24C94A2B0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24C94A340();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24C942068()
{
  uint64_t result = sub_24C94A340();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C94A2B0();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t AsyncStateResolver.init(store:keyPath:fetchValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

Swift::Void __swiftcall AsyncStateResolver.resolve()()
{
  uint64_t v2 = v0;
  uint64_t v44 = sub_24C94A340();
  uint64_t v40 = *(void *)(v44 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v44);
  uint64_t v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  char v41 = (char *)&v36 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v36 - v8;
  uint64_t v9 = *(void *)(v2 + 24);
  uint64_t v49 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v42 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = v2;
  uint64_t v11 = type metadata accessor for AsyncStateValue();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v47 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v36 - v15;
  uint64_t v17 = type metadata accessor for AsyncState();
  uint64_t v50 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v19 = (char *)&v36 - v18;
  uint64_t v21 = *v1;
  uint64_t v20 = v1[1];
  uint64_t v22 = v1[2];
  uint64_t v45 = v1[3];
  uint64_t v46 = v22;
  uint64_t v23 = *(void *)(v21 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 64))(v20, v17, ObjectType, v23);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v37 = v12;
      uint64_t v26 = v44;
      long long v27 = &v16[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v42, v16, v9);
      uint64_t v28 = v40;
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v27, v26);
      uint64_t v36 = *(int *)(v17 + 36);
      sub_24C94A310();
      uint64_t v29 = v26;
      uint64_t v30 = v39;
      sub_24C94A330();
      int v38 = sub_24C94A320();
      long long v31 = *(void (**)(char *, uint64_t))(v28 + 8);
      v31(v30, v29);
      long long v32 = v41;
      char v41 = (char *)v31;
      v31(v32, v29);
      if (v38)
      {
        uint64_t v51 = v21;
        uint64_t v52 = v20;
        uint64_t v33 = (uint64_t)v47;
        uint64_t v53 = v46;
        uint64_t v54 = v45;
        uint64_t v34 = v49;
        long long v35 = v42;
        (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v47, v42, v9);
        swift_storeEnumTagMultiPayload();
        sub_24C942720(v33, v48, *(double *)&v19[v36]);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v33, v11);
        ((void (*)(char *, uint64_t))v41)(v43, v44);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v9);
      }
      else
      {
        ((void (*)(char *, uint64_t))v41)(v43, v44);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v9);
      }
      goto LABEL_8;
    case 2u:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
      goto LABEL_4;
    case 3u:
LABEL_4:
      uint64_t v51 = v21;
      uint64_t v52 = v20;
      uint64_t v25 = (uint64_t)v47;
      uint64_t v53 = v46;
      uint64_t v54 = v45;
      swift_storeEnumTagMultiPayload();
      sub_24C942720(v25, v48, *(double *)&v19[*(int *)(v17 + 36)]);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v25, v11);
      goto LABEL_8;
    case 4u:
LABEL_8:
      (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v17);
      break;
    default:
      (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v17);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v9);
      break;
  }
}

uint64_t sub_24C942720(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v42 = (char *)&ObjectType - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a2;
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v47 = type metadata accessor for AsyncStateValue();
  uint64_t v38 = *(void *)(v47 - 8);
  uint64_t v11 = v38;
  uint64_t v43 = *(void *)(v38 + 64);
  MEMORY[0x270FA5388](v47);
  uint64_t v45 = (char *)&ObjectType - v12;
  uint64_t v40 = v9;
  uint64_t v41 = v10;
  uint64_t v13 = type metadata accessor for AsyncState();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&ObjectType - v15;
  uint64_t v37 = *v4;
  uint64_t v39 = v4[3];
  uint64_t v17 = *(void *)(v37 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  long long v48 = *(_OWORD *)(v4 + 1);
  uint64_t v19 = (uint64_t)v45;
  v18(v45, v46, v47);
  AsyncState.init(value:ttl:)(v19, (uint64_t)v16, a3);
  (*(void (**)(void, char *, uint64_t, uint64_t, uint64_t))(v17 + 80))(v48, v16, v13, ObjectType, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v20 = sub_24C94A700();
  uint64_t v21 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v42, 1, 1, v20);
  uint64_t v22 = v45;
  uint64_t v23 = v47;
  v18(v45, v46, v47);
  sub_24C94A6E0();
  uint64_t v24 = v37;
  swift_retain();
  swift_retain();
  uint64_t v25 = v39;
  swift_retain();
  uint64_t v26 = sub_24C94A6D0();
  uint64_t v27 = v38;
  unint64_t v28 = (*(unsigned __int8 *)(v38 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  unint64_t v29 = (v43 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = MEMORY[0x263F8F500];
  *(void *)(v30 + 16) = v26;
  *(void *)(v30 + 24) = v31;
  uint64_t v32 = v44;
  uint64_t v33 = v40;
  *(void *)(v30 + 32) = *(void *)(v44 + 16);
  *(void *)(v30 + 40) = v33;
  uint64_t v34 = v41;
  *(void *)(v30 + 48) = *(void *)(v32 + 32);
  *(void *)(v30 + 56) = v34;
  *(void *)(v30 + 64) = v24;
  *(_OWORD *)(v30 + 72) = v48;
  *(void *)(v30 + 88) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v30 + v28, v22, v23);
  *(double *)(v30 + v29) = a3;
  sub_24C94738C(v21, (uint64_t)&unk_2697FCF28, v30);
  return swift_release();
}

Swift::Void __swiftcall AsyncStateResolver.refresh()()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v3;
  uint64_t v5 = type metadata accessor for AsyncStateValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = type metadata accessor for AsyncState();
  uint64_t v32 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v14 = *v1;
  uint64_t v15 = v1[1];
  uint64_t v16 = v1[2];
  uint64_t v28 = v1[3];
  uint64_t v29 = v16;
  uint64_t v17 = *(void *)(v14 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 64))(v15, v11, ObjectType, v17);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v13, v5);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v24 = sub_24C94A340();
      uint64_t v25 = &v10[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      uint64_t v19 = v26;
      uint64_t v20 = v27;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v10, v2);
      uint64_t v33 = v14;
      uint64_t v34 = v15;
      uint64_t v21 = (uint64_t)v30;
      uint64_t v35 = v29;
      uint64_t v36 = v28;
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v30, v19, v2);
      swift_storeEnumTagMultiPayload();
      sub_24C942720(v21, v31, *(double *)&v13[*(int *)(v11 + 36)]);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v21, v5);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v2);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v25, v24);
      return;
    case 2u:
      (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
      goto LABEL_5;
    case 3u:
LABEL_5:
      uint64_t v33 = v14;
      uint64_t v34 = v15;
      uint64_t v22 = (uint64_t)v30;
      uint64_t v35 = v29;
      uint64_t v36 = v28;
      swift_storeEnumTagMultiPayload();
      sub_24C942720(v22, v31, *(double *)&v13[*(int *)(v11 + 36)]);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v22, v5);
      goto LABEL_6;
    case 4u:
LABEL_6:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
      break;
    default:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v2);
      break;
  }
}

Swift::Void __swiftcall AsyncStateResolver.reset()()
{
  uint64_t v1 = type metadata accessor for AsyncState();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - v3;
  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t ObjectType = swift_getObjectType();
  AsyncState.init()((uint64_t)v4);
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(v7 + 80))(v6, v4, v1, ObjectType, v7);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_24C94305C()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24C9430A0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_24C943100(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24C943178(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t type metadata accessor for AsyncStateResolver()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C9431E0(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v9 + 80) = v18;
  *(void *)(v9 + 88) = v19;
  *(void *)(v9 + 64) = v16;
  *(void *)(v9 + 72) = v17;
  *(double *)(v9 + 56) = a1;
  *(void *)(v9 + 40) = a8;
  *(void *)(v9 + 48) = a9;
  *(void *)(v9 + 24) = a6;
  *(void *)(v9 + 32) = a7;
  *(void *)(v9 + 16) = a5;
  *(void *)(v9 + 96) = *(void *)(v17 - 8);
  uint64_t v11 = swift_task_alloc();
  *(void *)(v9 + 104) = v11;
  *(void *)(v9 + 112) = sub_24C94A6E0();
  *(void *)(v9 + 120) = sub_24C94A6D0();
  uint64_t v14 = (uint64_t (*)(uint64_t))((char *)a7 + *a7);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v9 + 128) = v12;
  *uint64_t v12 = v9;
  v12[1] = sub_24C943358;
  return v14(v11);
}

uint64_t sub_24C943358()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24C94A6B0();
    uint64_t v5 = v4;
    *(void *)(v2 + 152) = v3;
    *(void *)(v2 + 160) = v4;
    uint64_t v6 = sub_24C9436C0;
    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v6 = sub_24C9434A0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  return MEMORY[0x270FA2498](v6, v7, v5);
}

uint64_t sub_24C9434A0()
{
  *(void *)(v0 + 144) = sub_24C94A6D0();
  uint64_t v2 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C94352C, v2, v1);
}

uint64_t sub_24C94352C()
{
  uint64_t v14 = *((void *)v0 + 13);
  uint64_t v2 = *((void *)v0 + 10);
  uint64_t v1 = *((void *)v0 + 11);
  uint64_t v4 = *((void *)v0 + 8);
  uint64_t v3 = *((void *)v0 + 9);
  double v5 = v0[7];
  uint64_t v7 = *((void *)v0 + 5);
  uint64_t v6 = (char *)*((void *)v0 + 6);
  uint64_t v8 = *((void *)v0 + 3);
  uint64_t v9 = *((void *)v0 + 4);
  uint64_t v10 = *((void *)v0 + 2);
  swift_release();
  sub_24C943CAC(v10, v8, v5, v9, v7, v6, v14, v4, v3, v2, v1);
  uint64_t v12 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C943630, v12, v11);
}

uint64_t sub_24C943630()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[9];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24C9436C0()
{
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = sub_24C94A370();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B17F260);
  sub_24C93831C(v1);
  *(void *)(v0 + 168) = sub_24C94A220();
  return MEMORY[0x270FA2498](sub_24C943780, 0, 0);
}

uint64_t sub_24C943780()
{
  *(void *)(v0 + 176) = sub_24C94A6D0();
  uint64_t v2 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C94380C, v2, v1);
}

uint64_t sub_24C94380C()
{
  uint64_t v14 = (void *)*((void *)v0 + 21);
  uint64_t v1 = *((void *)v0 + 10);
  uint64_t v2 = *((void *)v0 + 11);
  uint64_t v4 = *((void *)v0 + 8);
  uint64_t v3 = *((void *)v0 + 9);
  double v5 = v0[7];
  uint64_t v7 = *((void *)v0 + 5);
  uint64_t v6 = (char *)*((void *)v0 + 6);
  uint64_t v9 = *((void *)v0 + 3);
  uint64_t v8 = *((void *)v0 + 4);
  uint64_t v10 = *((void *)v0 + 2);
  swift_release();
  sub_24C943F9C(v10, v9, v5, v8, v7, v6, v14, v4, v3, v1, v2);
  uint64_t v11 = *((void *)v0 + 19);
  uint64_t v12 = *((void *)v0 + 20);
  return MEMORY[0x270FA2498](sub_24C9438E4, v11, v12);
}

uint64_t sub_24C9438E4()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[17];
  swift_release();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24C943960()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(type metadata accessor for AsyncStateValue() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 96) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
      uint64_t v7 = sub_24C94A340();
      uint64_t v8 = v0 + v4 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v8, v7);
      break;
    case 0:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
      break;
  }
  return MEMORY[0x270FA0238](v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_24C943B30(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AsyncStateValue() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  uint64_t v9 = (int *)v1[10];
  uint64_t v13 = (uint64_t)v1 + v4;
  uint64_t v14 = v1[11];
  double v10 = *(double *)((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24C92B568;
  return sub_24C9431E0(v10, a1, v5, v6, v7, v8, v9, v14, v13);
}

uint64_t sub_24C943CAC(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v37 = a7;
  uint64_t v39 = a6;
  uint64_t v36 = type metadata accessor for AsyncStateValue();
  MEMORY[0x270FA5388](v36);
  uint64_t v34 = (char *)&v33 - v16;
  uint64_t v17 = type metadata accessor for AsyncState();
  uint64_t v40 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v35 = (uint64_t)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v33 - v20;
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v42 = a8;
  uint64_t v43 = a9;
  uint64_t v44 = a10;
  uint64_t v45 = a11;
  type metadata accessor for AsyncStateResolver();
  uint64_t v24 = *(void (**)(uint64_t))(v22 + 64);
  uint64_t v25 = type metadata accessor for AsyncState();
  uint64_t v38 = a2;
  uint64_t v26 = a2;
  uint64_t v27 = v25;
  v24(v26);
  if ((static AsyncStateValue.== infix(_:_:)((uint64_t)v21, v39, a9) & 1) == 0) {
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v21, v41);
  }
  sub_24C94A340();
  swift_getTupleTypeMetadata2();
  uint64_t v28 = (uint64_t)v34;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a9 - 8) + 16))(v34, v37, a9);
  sub_24C94A330();
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = v35;
  AsyncState.init(value:ttl:)(v28, v35, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 80))(v38, v29, v27, ObjectType, v22);
  uint64_t v30 = v41;
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v31(v29, v41);
  return ((uint64_t (*)(char *, uint64_t))v31)(v21, v30);
}

uint64_t sub_24C943F9C(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, char *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v49 = a2;
  id v43 = a7;
  uint64_t v46 = a6;
  uint64_t v45 = type metadata accessor for AsyncStateValue();
  MEMORY[0x270FA5388](v45);
  uint64_t v16 = (uint64_t *)((char *)&v39 - v15);
  uint64_t v17 = type metadata accessor for AsyncState();
  uint64_t v47 = *(void *)(v17 - 8);
  uint64_t v48 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v44 = (uint64_t)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v22 = *(void *)(a1 + 24);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v50 = a8;
  uint64_t v51 = a9;
  uint64_t v52 = a10;
  uint64_t v53 = a11;
  type metadata accessor for AsyncStateResolver();
  uint64_t v25 = *(void (**)(uint64_t))(v23 + 64);
  uint64_t v40 = type metadata accessor for AsyncState();
  uint64_t v41 = v22;
  uint64_t v42 = ObjectType;
  v25(v49);
  if ((static AsyncStateValue.== infix(_:_:)((uint64_t)v21, v46, a9) & 1) == 0) {
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v48);
  }
  id v26 = v43;
  id v27 = objc_msgSend(v43, sel_domain);
  uint64_t v28 = sub_24C94A5A0();
  uint64_t v46 = v29;

  id v39 = objc_msgSend(v26, sel_code);
  id v30 = objc_msgSend(v26, sel_localizedDescription);
  uint64_t v31 = sub_24C94A5A0();
  uint64_t v33 = v32;

  uint64_t v34 = v46;
  *uint64_t v16 = v28;
  v16[1] = (uint64_t)v34;
  void v16[2] = (uint64_t)v39;
  v16[3] = v31;
  _OWORD v16[4] = v33;
  swift_storeEnumTagMultiPayload();
  uint64_t v35 = v44;
  AsyncState.init(value:ttl:)((uint64_t)v16, v44, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 80))(v49, v35, v40, v42, v23);
  uint64_t v36 = v48;
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  v37(v35, v48);
  return ((uint64_t (*)(char *, uint64_t))v37)(v21, v36);
}

uint64_t getEnumTagSinglePayload for DatabaseConnection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseConnection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseConnection()
{
  return &type metadata for DatabaseConnection;
}

uint64_t sub_24C944330(uint64_t a1, uint64_t a2, sqlite3 *a3)
{
  uint64_t v4 = sub_24C94A600();
  unsigned int v5 = sqlite3_exec(a3, (const char *)(v4 + 32), 0, 0, 0);
  uint64_t result = swift_release();
  if (v5)
  {
    if (sqlite3_errstr(v5))
    {
      uint64_t v7 = sub_24C94A630();
      unint64_t v9 = v8;
    }
    else
    {
      unint64_t v9 = 0xE300000000000000;
      uint64_t v7 = 4271950;
    }
    sub_24C9449CC();
    swift_allocError();
    *(void *)uint64_t v10 = v5;
    *(void *)(v10 + 8) = v7;
    *(void *)(v10 + 16) = v9;
    *(unsigned char *)(v10 + 24) = 1;
    return swift_willThrow();
  }
  return result;
}

void sub_24C9443F4(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3 *a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE80);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v50 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t *)((char *)&v50 - v16);
  uint64_t v18 = sub_24C944894(a1, a2, a4);
  if (v4) {
    return;
  }
  uint64_t v19 = v18;
  uint64_t v52 = *(void *)(a3 + 16);
  if (!v52) {
    goto LABEL_21;
  }
  uint64_t v56 = v15;
  uint64_t v50 = 0;
  uint64_t v20 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v21 = 0;
  uint64_t v53 = a3;
  uint64_t v51 = a3 + 32;
  while (1)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)(v20 + 8 * v21);
    uint64_t v24 = *(void *)(v23 + 16);
    uint64_t v54 = v21;
    uint64_t v55 = v23;
    swift_bridgeObjectRetain_n();
    if (v24)
    {
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)(type metadata accessor for DatabaseBinding() - 8);
      uint64_t v27 = v55 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
      uint64_t v28 = *(void *)(v26 + 72);
      while (1)
      {
        uint64_t v29 = (uint64_t)&v56[*(int *)(v9 + 48)];
        sub_24C935D44(v27, v29);
        uint64_t v30 = (uint64_t)v17 + *(int *)(v9 + 48);
        *uint64_t v17 = v25;
        sub_24C935DA8(v29, v30);
        sub_24C935E0C((uint64_t)v17, (uint64_t)v12);
        uint64_t v31 = *v12 + 1;
        if (__OFADD__(*v12, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          return;
        }
        if (v31 < (uint64_t)0xFFFFFFFF80000000) {
          goto LABEL_32;
        }
        if (v31 > 0x7FFFFFFF) {
          goto LABEL_33;
        }
        int v32 = sub_24C935E74((uint64_t)v12 + *(int *)(v9 + 48), v31, v22);
        if (v32) {
          break;
        }
        ++v25;
        sub_24C936228((uint64_t)v12);
        v27 += v28;
        if (v24 == v25) {
          goto LABEL_11;
        }
      }
      unsigned int v35 = v32;
      if (sqlite3_errstr(v32))
      {
        uint64_t v36 = sub_24C94A630();
        unint64_t v38 = v37;
      }
      else
      {
        uint64_t v36 = 4271950;
        unint64_t v38 = 0xE300000000000000;
      }
      uint64_t v19 = v22;
      sub_24C9361D4();
      swift_allocError();
      void *v39 = v35;
      v39[1] = v36;
      v39[2] = v38;
      swift_willThrow();
      sub_24C936228((uint64_t)v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    uint64_t v19 = v22;
    int v33 = sqlite3_step(v22);
    if (v33 != 101)
    {
      unsigned int v40 = v33;
      if (sqlite3_errstr(v33))
      {
        uint64_t v41 = sub_24C94A630();
        unint64_t v43 = v42;
      }
      else
      {
        uint64_t v41 = 4271950;
        unint64_t v43 = 0xE300000000000000;
      }
      sub_24C9361D4();
      swift_allocError();
      uint64_t *v48 = v40 | 0x4000000000000000;
      v48[1] = v41;
      v48[2] = v43;
      swift_willThrow();
LABEL_19:
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    int v34 = sqlite3_reset(v22);
    if (v34) {
      break;
    }
    uint64_t v21 = v54 + 1;
    uint64_t v20 = v51;
    if (v54 + 1 == v52) {
      goto LABEL_20;
    }
  }
  unsigned int v44 = v34;
  if (sqlite3_errstr(v34))
  {
    uint64_t v45 = sub_24C94A630();
    unint64_t v47 = v46;
  }
  else
  {
    uint64_t v45 = 4271950;
    unint64_t v47 = 0xE300000000000000;
  }
  sub_24C9361D4();
  swift_allocError();
  *uint64_t v49 = v44 | 0x6000000000000000;
  v49[1] = v45;
  v49[2] = v47;
  swift_willThrow();
LABEL_20:
  swift_bridgeObjectRelease();
LABEL_21:
  sub_24C944A20(v19);
}

uint64_t sub_24C944800(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(sqlite3_stmt *), uint64_t a5, sqlite3 *a6, uint64_t a7)
{
  uint64_t v12 = sub_24C944894(a1, a2, a6);
  if (!v7)
  {
    uint64_t v13 = v12;
    a7 = sub_24C935908(a3, a4, a5, v12, a7);
    sub_24C944A20(v13);
  }
  return a7;
}

sqlite3_stmt *sub_24C944894(uint64_t a1, uint64_t a2, sqlite3 *a3)
{
  v12[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  v12[0] = 0;
  uint64_t v4 = sub_24C94A600();
  unsigned int v5 = sqlite3_prepare_v2(a3, (const char *)(v4 + 32), -1, v12, 0);
  swift_release();
  if (v5)
  {
    if (sqlite3_errstr(v5))
    {
      uint64_t v6 = sub_24C94A630();
      unint64_t v8 = v7;
    }
    else
    {
      unint64_t v8 = 0xE300000000000000;
      uint64_t v6 = 4271950;
    }
    sub_24C9449CC();
    swift_allocError();
    *(void *)uint64_t v10 = v5;
    *(void *)(v10 + 8) = v6;
    *(void *)(v10 + 16) = v8;
    char v11 = 2;
  }
  else
  {
    uint64_t result = v12[0];
    if (v12[0]) {
      return result;
    }
    sub_24C9449CC();
    swift_allocError();
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    *(void *)uint64_t v10 = 1;
    char v11 = 4;
  }
  *(unsigned char *)(v10 + 24) = v11;
  return (sqlite3_stmt *)swift_willThrow();
}

unint64_t sub_24C9449CC()
{
  unint64_t result = qword_2697FCF30;
  if (!qword_2697FCF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FCF30);
  }
  return result;
}

void sub_24C944A20(sqlite3_stmt *a1)
{
  uint64_t v2 = sub_24C94A370();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = sqlite3_finalize(a1);
  if (v6)
  {
    unsigned int v7 = v6;
    if (qword_26B17DDB8 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26B17F260);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    if (sqlite3_errstr(v7))
    {
      uint64_t v9 = sub_24C94A630();
      unint64_t v11 = v10;
    }
    else
    {
      unint64_t v11 = 0xE300000000000000;
      uint64_t v9 = 4271950;
    }
    uint64_t v12 = v7 | 0x2000000000000000;
    sub_24C9361D4();
    uint64_t v13 = (void *)swift_allocError();
    *uint64_t v14 = v12;
    v14[1] = v9;
    _OWORD v14[2] = v11;
    sub_24C93831C(v13);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

sqlite3 *sub_24C944BC0(void *a1, void *a2, char a3)
{
  uint64_t v49 = a1;
  ppDb[1] = *(sqlite3 **)MEMORY[0x263EF8340];
  uint64_t v6 = sub_24C94A240();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24C94A2B0();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v20 = (char *)&v45 - v19;
  ppDb[0] = 0;
  if (a3)
  {
    if (a3 == 1)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = (uint64_t)v49;
    }
    else
    {
      a2 = (void *)0xE800000000000000;
      uint64_t v21 = 0x3A79726F6D656D3ALL;
    }
  }
  else
  {
    uint64_t v45 = v17;
    uint64_t v46 = v7;
    uint64_t v47 = v18;
    uint64_t v48 = v3;
    id v22 = objc_msgSend(self, sel_defaultManager);
    v51[0] = 0;
    id v23 = objc_msgSend(v22, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 9, 1, 0, 0, v51);

    id v24 = v51[0];
    if (!v23)
    {
      id v44 = v51[0];
      sub_24C94A230();

      return (sqlite3 *)swift_willThrow();
    }
    sub_24C94A280();
    id v25 = v24;

    v51[0] = v49;
    v51[1] = a2;
    uint64_t v26 = v46;
    (*(void (**)(char *, void, uint64_t))(v46 + 104))(v9, *MEMORY[0x263F06E50], v6);
    sub_24C92B320();
    sub_24C94A2A0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v6);
    sub_24C94A270();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v28 = v13;
    uint64_t v29 = v45;
    v27(v28, v45);
    uint64_t v21 = sub_24C94A290();
    a2 = v30;
    v27(v16, v29);
    v27(v20, v29);
  }
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_24C94A370();
  __swift_project_value_buffer(v31, (uint64_t)qword_26B17F260);
  swift_bridgeObjectRetain_n();
  int v32 = sub_24C94A350();
  os_log_type_t v33 = sub_24C94A7B0();
  if (os_log_type_enabled(v32, v33))
  {
    int v34 = (uint8_t *)swift_slowAlloc();
    unsigned int v35 = (void *)swift_slowAlloc();
    v51[0] = v35;
    *(_DWORD *)int v34 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_24C93BCD4(v21, (unint64_t)a2, (uint64_t *)v51);
    sub_24C94A810();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24C91C000, v32, v33, "Opening database connection: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253301F20](v35, -1, -1);
    MEMORY[0x253301F20](v34, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v36 = sub_24C94A600();
  swift_bridgeObjectRelease();
  unsigned int v37 = sqlite3_open_v2((const char *)(v36 + 32), ppDb, 65542, 0);
  swift_release();
  if (v37)
  {
    if (sqlite3_errstr(v37))
    {
      uint64_t v38 = sub_24C94A630();
      unint64_t v40 = v39;
    }
    else
    {
      unint64_t v40 = 0xE300000000000000;
      uint64_t v38 = 4271950;
    }
    sub_24C9449CC();
    swift_allocError();
    *(void *)uint64_t v43 = v37;
    *(void *)(v43 + 8) = v38;
    *(void *)(v43 + 16) = v40;
    *(unsigned char *)(v43 + 24) = 0;
  }
  else
  {
    unint64_t result = ppDb[0];
    if (ppDb[0]) {
      return result;
    }
    sub_24C9449CC();
    swift_allocError();
    *(void *)(v42 + 8) = 0;
    *(void *)(v42 + 16) = 0;
    *(void *)uint64_t v42 = 0;
    *(unsigned char *)(v42 + 24) = 4;
  }
  return (sqlite3 *)swift_willThrow();
}

uint64_t sub_24C945178(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 < 4u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DatabaseConnection.Failure(uint64_t a1)
{
  return sub_24C9451B4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_24C9451B4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 < 4u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_24C945178(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_24C945178(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24C9451B4(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DatabaseConnection.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24C9451B4(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatabaseConnection.Failure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DatabaseConnection.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24C9453A0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_24C9453B8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseConnection.Failure()
{
  return &type metadata for DatabaseConnection.Failure;
}

uint64_t sub_24C9453E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, void *a3@<X8>)
{
  a3[2] = 0;
  swift_unknownObjectWeakInit();
  *a3 = a1;
  a3[2] = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t StoreProxy.send(_:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24C945470, 0, 0);
}

uint64_t sub_24C945470()
{
  sub_24C94A6E0();
  *(void *)(v0 + 40) = sub_24C94A6D0();
  uint64_t v2 = sub_24C94A6B0();
  return MEMORY[0x270FA2498](sub_24C945504, v2, v1);
}

uint64_t sub_24C945504()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  swift_release();
  sub_24C9455A0(v1, v2, *(void *)(v3 + 16));
  return MEMORY[0x270FA2498](sub_24C94558C, 0, 0);
}

uint64_t sub_24C94558C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24C9455A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  unsigned __int8 v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v37 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  sub_24C94A740();
  if (v3)
  {
    unint64_t v40 = v13;
    if (qword_26B17DDB8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24C94A370();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B17F260);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v17(v10, a2, a3);
    uint64_t v18 = sub_24C94A350();
    os_log_type_t v19 = sub_24C94A7A0();
    os_log_t v41 = v18;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      id v39 = v3;
      uint64_t v43 = v38;
      *(_DWORD *)uint64_t v20 = 136446210;
      unsigned int v37 = v20 + 4;
      v17(v40, (uint64_t)v10, a3);
      uint64_t v21 = sub_24C94A5F0();
      uint64_t v42 = sub_24C93BCD4(v21, v22, (uint64_t *)&v43);
      sub_24C94A810();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a3);
      os_log_t v23 = v41;
      _os_log_impl(&dword_24C91C000, v41, v19, "Task cancelled, preventing store action send: %{public}s", v20, 0xCu);
      id v24 = v38;
      swift_arrayDestroy();
      MEMORY[0x253301F20](v24, -1, -1);
      MEMORY[0x253301F20](v20, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a3);
    }
  }
  else if (MEMORY[0x253302020](a1 + 8))
  {
    uint64_t v25 = *(void *)(a1 + 16);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(a2, ObjectType, v25);
    swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v40 = v13;
    if (qword_26B17DDB8 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_24C94A370();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B17F260);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v28(v15, a2, a3);
    uint64_t v29 = sub_24C94A350();
    os_log_type_t v30 = sub_24C94A7A0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      int v32 = swift_slowAlloc();
      id v39 = 0;
      os_log_t v41 = v32;
      uint64_t v43 = (uint8_t *)v32;
      *(_DWORD *)uint64_t v31 = 136446210;
      unsigned int v37 = v31 + 4;
      uint64_t v38 = v31;
      v28(v40, (uint64_t)v15, a3);
      uint64_t v33 = sub_24C94A5F0();
      uint64_t v42 = sub_24C93BCD4(v33, v34, (uint64_t *)&v43);
      sub_24C94A810();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, a3);
      unsigned int v35 = v38;
      _os_log_impl(&dword_24C91C000, v29, v30, "Store deallocated, not able to send: %{public}s", v38, 0xCu);
      os_log_t v36 = v41;
      swift_arrayDestroy();
      MEMORY[0x253301F20](v36, -1, -1);
      MEMORY[0x253301F20](v35, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, a3);
    }
  }
}

uint64_t sub_24C945AB8()
{
  return swift_unknownObjectWeakDestroy();
}

void *sub_24C945AC0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyInit();
  a1[2] = a2[2];
  return a1;
}

void *sub_24C945AFC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyAssign();
  a1[2] = a2[2];
  return a1;
}

void *sub_24C945B38(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeInit();
  a1[2] = a2[2];
  return a1;
}

void *sub_24C945B74(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeAssign();
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_24C945BB0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 16) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)(a1 + 8) & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24C945BFC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = 1;
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for StoreProxy()
{
  return __swift_instantiateGenericMetadata();
}

void *AsyncKeyedStateResolver.__allocating_init(store:keyPath:fetchValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  uint64_t v8 = sub_24C946C88(a1, a2, a3, a4);
  swift_release();
  swift_release();
  swift_release();
  return v8;
}

void *AsyncKeyedStateResolver.init(store:keyPath:fetchValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = sub_24C946C88(a1, a2, a3, a4);
  swift_release();
  swift_release();
  swift_release();
  return v4;
}

uint64_t AsyncKeyedStateResolver.keys.getter()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = type metadata accessor for AsyncStateResolver();
  nullsub_1(v2, v3, v4, *(void *)(v1 + 112));
  sub_24C94A4F0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  return sub_24C94A760();
}

uint64_t AsyncKeyedStateResolver.resolver(for:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v48 = a2;
  uint64_t v5 = (void *)*v2;
  uint64_t v6 = v5[11];
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  unsigned __int8 v10 = (char *)&v35 - v9;
  uint64_t v45 = v3 + 4;
  swift_beginAccess();
  uint64_t v11 = v3[4];
  uint64_t v12 = v5[10];
  uint64_t v13 = v5[13];
  uint64_t v14 = v5[15];
  uint64_t v46 = v5[12];
  uint64_t v47 = v12;
  uint64_t v49 = v12;
  uint64_t v50 = v46;
  uint64_t v51 = v13;
  uint64_t v52 = v14;
  uint64_t v15 = type metadata accessor for AsyncStateResolver();
  uint64_t v16 = v5[14];
  uint64_t v17 = a1;
  uint64_t v18 = a1;
  uint64_t v44 = v15;
  uint64_t v19 = v16;
  MEMORY[0x2533011F0](&v53, v18, v11, v6);
  uint64_t v20 = v53;
  if (v53)
  {
    uint64_t v21 = v55;
    uint64_t v22 = v56;
    uint64_t v23 = v54;
  }
  else
  {
    swift_endAccess();
    uint64_t v36 = v3[2];
    uint64_t v37 = v3[3];
    id v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    uint64_t v40 = v14;
    os_log_t v41 = v24;
    uint64_t v42 = v17;
    uint64_t v43 = v7 + 16;
    uint64_t v25 = ((uint64_t (*)(char *, uint64_t, uint64_t))v24)(v10, v17, v6);
    uint64_t v26 = *(unsigned __int8 *)(v7 + 80);
    MEMORY[0x270FA5388](v25);
    uint64_t v27 = (uint64_t *)((char *)&v35 - ((v8 + 63) & 0xFFFFFFFFFFFFFFF0));
    void *v27 = v47;
    v27[1] = v6;
    v27[2] = v46;
    v27[3] = v13;
    uint64_t v39 = v19;
    unsigned char v27[4] = v19;
    v27[5] = v14;
    uint64_t v38 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 32);
    uint64_t v29 = v28;
    v38(v27 + 6, v28, v6);
    swift_getKeyPath();
    uint64_t v30 = v36;
    swift_retain();
    uint64_t v37 = sub_24C94A900();
    swift_release();
    v41(v29, v42, v6);
    uint64_t v31 = (void *)swift_allocObject();
    _OWORD v31[2] = v47;
    v31[3] = v6;
    v31[4] = v46;
    v31[5] = v13;
    uint64_t v32 = v40;
    v31[6] = v39;
    v31[7] = v32;
    v31[8] = v3;
    v38((void *)((char *)v31 + ((v26 + 72) & ~v26)), v29, v6);
    AsyncStateResolver.init(store:keyPath:fetchValue:)(v30, v37, (uint64_t)&unk_2697FCF48, (uint64_t)v31, &v53);
    uint64_t v20 = v53;
    uint64_t v23 = v54;
    uint64_t v21 = v55;
    uint64_t v22 = v56;
    v41(v29, v42, v6);
    uint64_t v53 = v20;
    uint64_t v54 = v23;
    uint64_t v55 = v21;
    uint64_t v56 = v22;
    swift_beginAccess();
    sub_24C94A510();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24C94A550();
  }
  uint64_t result = swift_endAccess();
  unint64_t v34 = v48;
  void *v48 = v20;
  v34[1] = v23;
  v34[2] = v21;
  v34[3] = v22;
  return result;
}

uint64_t sub_24C946280@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AsyncKeyedState();
  return AsyncKeyedState.subscript.getter(a1, v4, a2);
}

uint64_t sub_24C9462F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for AsyncKeyedState();
  return sub_24C9234BC(a1, a3, v5);
}

uint64_t sub_24C946358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_24C94A6E0();
  v3[5] = sub_24C94A6D0();
  uint64_t v5 = sub_24C94A6B0();
  void v3[6] = v5;
  v3[7] = v4;
  return MEMORY[0x270FA2498](sub_24C9463F4, v5, v4);
}

uint64_t sub_24C9463F4()
{
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0[3] + 40) + **(int **)(v0[3] + 40));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24C9464CC;
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  return v5(v3, v2);
}

uint64_t sub_24C9464CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v5 = sub_24C94666C;
  }
  else {
    uint64_t v5 = sub_24C946608;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24C946608()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C94666C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Void __swiftcall AsyncKeyedStateResolver.refresh()()
{
}

Swift::Void __swiftcall AsyncKeyedStateResolver.resolve()()
{
}

uint64_t sub_24C946700()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C94685C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  uint64_t v9 = type metadata accessor for AsyncStateResolver();
  return a8(v9);
}

Swift::Void __swiftcall AsyncKeyedStateResolver.reset()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 120);
  v12[2] = *(double *)(*v0 + 80);
  long long v13 = *(_OWORD *)(v1 + 96);
  uint64_t v14 = v2;
  type metadata accessor for AsyncStateResolver();
  swift_getTupleTypeMetadata2();
  sub_24C94A680();
  uint64_t v3 = sub_24C94A4E0();
  swift_beginAccess();
  v0[4] = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[2];
  uint64_t v5 = *(void *)(v4 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = swift_unknownObjectRetain();
  sub_24C946AA8(v7, ObjectType, v5);
  swift_unknownObjectRelease();
  uint64_t v8 = *(void *)(v4 + 24);
  uint64_t v9 = *(void *)(v4 + 32);
  uint64_t v10 = swift_getObjectType();
  swift_unknownObjectRetain();
  AsyncKeyedState.init(ttl:)((uint64_t)v12, v12[0]);
  swift_bridgeObjectRelease();
  *(double *)uint64_t v11 = v12[0];
  *(double *)&v11[1] = v12[1];
  sub_24C946B60(v8, v11, v10, v9);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t sub_24C946AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 64);
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v8 = type metadata accessor for AsyncKeyedState();
  return v6(v7, v8, a2, a3);
}

uint64_t sub_24C946B60(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(v4 + 24);
  v12[1] = a2[1];
  uint64_t v9 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(a4 + 80);
  v12[0] = v7;
  uint64_t v10 = type metadata accessor for AsyncKeyedState();
  return v9(v8, v12, v10, a3, a4);
}

uint64_t AsyncKeyedStateResolver.deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AsyncKeyedStateResolver.__deallocating_deinit()
{
  AsyncKeyedStateResolver.deinit();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

void *sub_24C946C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[2] = a1;
  v4[3] = a2;
  v4[5] = a3;
  v4[6] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  type metadata accessor for AsyncStateResolver();
  swift_getTupleTypeMetadata2();
  sub_24C94A680();
  v4[4] = sub_24C94A4E0();
  return v4;
}

unint64_t sub_24C946DC4(uint64_t a1)
{
  return ((*(void *)(*(void *)(*(void *)(a1 + 8) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
}

uint64_t sub_24C946E24(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + a1 - 40) - 8) + 8))();
}

__n128 sub_24C946E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + a1 - 40) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t))v5)(a2, a1);
  unint64_t v6 = (*(void *)(v5 + 48) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  long long v10 = *(_OWORD *)(v7 + 16);
  __n128 result = *(__n128 *)(v7 + 32);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v7;
  *(_OWORD *)(v8 + 16) = v10;
  *(__n128 *)(v8 + 32) = result;
  return result;
}

uint64_t sub_24C946EDC()
{
  return sub_24C94A580() & 1;
}

uint64_t sub_24C946F20()
{
  return sub_24C94A570();
}

__n128 sub_24C946F54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 8) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  (*(void (**)(uint64_t, unint64_t))(v4 + 32))(a2, a1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
  uint64_t v6 = a2 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v8 = *(_OWORD *)(a1 + 16);
  __n128 result = *(__n128 *)(a1 + 32);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 16) = v8;
  *(__n128 *)(v6 + 32) = result;
  return result;
}

uint64_t sub_24C946FE0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24C9470A4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v1
     + ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24C92B568;
  return sub_24C946358(a1, v4, v5);
}

uint64_t sub_24C947188(uint64_t a1)
{
  return sub_24C9471E0(a1, (uint64_t (*)(uint64_t))AsyncStateResolver.refresh());
}

uint64_t sub_24C9471B4(uint64_t a1)
{
  return sub_24C9471E0(a1, (uint64_t (*)(uint64_t))AsyncStateResolver.resolve());
}

uint64_t sub_24C9471E0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  return sub_24C94685C(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a2);
}

uint64_t sub_24C947208()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AsyncKeyedStateResolver()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for AsyncKeyedStateResolver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncKeyedStateResolver);
}

uint64_t dispatch thunk of AsyncKeyedStateResolver.__allocating_init(store:keyPath:fetchValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t static EmptyState.== infix(_:_:)()
{
  return 1;
}

ValueMetadata *type metadata accessor for EmptyState()
{
  return &type metadata for EmptyState;
}

uint64_t sub_24C9472CC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C94738C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C94A700();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24C94A6F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24C93D270(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24C94A6B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24C947534(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + *(void *)(*(void *)v1 + 144));
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  uint64_t v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - v8;
  (*(void (**)(char *))(v7 + 16))((char *)&v11 - v8);
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v4);
  if ((v5 & 1) == 0) {
    return sub_24C9476B8(a1);
  }
  return result;
}

uint64_t sub_24C947660()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24C94A400();
    return swift_release();
  }
  return result;
}

uint64_t sub_24C9476B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v76 = *MEMORY[0x263EF8340];
  v61.isa = v1->isa;
  uint64_t v4 = *((void *)v61.isa + 11);
  uint64_t v5 = *((void *)v61.isa + 10);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v60 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v53 - v9;
  uint64_t v65 = swift_getAssociatedTypeWitness();
  uint64_t v70 = *(void *)(v65 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v65);
  long long v57 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v69 = (char *)&v53 - v12;
  uint64_t v64 = v4;
  uint64_t v13 = v5;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v56 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v53 - v18;
  __tp.__darwin_time_t tv_sec = 0;
  __tp.uint64_t tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  __darwin_time_t tv_sec = __tp.tv_sec;
  uint64_t tv_nsec = __tp.tv_nsec;
  if (qword_26B17DDB8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_24C94A370();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B17F260);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v21(v19, a1, v14);
  uint64_t v22 = sub_24C94A350();
  os_log_type_t v23 = sub_24C94A790();
  int v55 = v23;
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v68 = v14;
  uint64_t v63 = a1;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    __darwin_time_t v54 = swift_slowAlloc();
    __tp.__darwin_time_t tv_sec = v54;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v66 = v6;
    os_log_t v53 = v22;
    v71[0] = v13;
    swift_getMetatypeMetadata();
    uint64_t v26 = sub_24C94A5F0();
    v71[0] = sub_24C93BCD4(v26, v27, &__tp.tv_sec);
    sub_24C94A810();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    v21(v56, (uint64_t)v19, v68);
    uint64_t v28 = sub_24C94A5F0();
    v71[0] = sub_24C93BCD4(v28, v29, &__tp.tv_sec);
    uint64_t v30 = v68;
    sub_24C94A810();
    uint64_t v31 = v66;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v30);
    os_log_t v32 = v53;
    _os_log_impl(&dword_24C91C000, v53, (os_log_type_t)v55, "%s.%s", (uint8_t *)v25, 0x16u);
    __darwin_time_t v33 = v54;
    swift_arrayDestroy();
    MEMORY[0x253301F20](v33, -1, -1);
    uint64_t v34 = v25;
    a1 = v63;
    MEMORY[0x253301F20](v34, -1, -1);
  }
  else
  {
    uint64_t v31 = v6;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  }
  uint64_t v56 = (char *)type metadata accessor for SideEffect();
  __darwin_time_t v72 = sub_24C94A4D0();
  uint64_t v35 = v69;
  sub_24C94A3D0();
  uint64_t v36 = v62;
  sub_24C94A3D0();
  (*(void (**)(char *, char *, __darwin_time_t *, uint64_t, uint64_t, uint64_t))(v64 + 72))(v36, v35, &v72, a1, v13, v64);
  uint64_t v37 = v57;
  sub_24C94A3D0();
  uint64_t v38 = v65;
  swift_getAssociatedConformanceWitness();
  char v39 = sub_24C94A580();
  uint64_t v40 = *(char **)(v70 + 8);
  v70 += 8;
  long long v57 = v40;
  ((void (*)(char *, uint64_t))v40)(v37, v38);
  if ((v39 & 1) == 0) {
    sub_24C94A3C0();
  }
  os_log_t v41 = v60;
  sub_24C94A3D0();
  uint64_t v42 = AssociatedTypeWitness;
  swift_getAssociatedConformanceWitness();
  char v43 = sub_24C94A580();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v66 = v31 + 8;
  v44(v41, v42);
  if ((v43 & 1) == 0) {
    sub_24C94A3C0();
  }
  double v45 = (double)tv_nsec / 1000000000.0 + (double)tv_sec;
  swift_getWitnessTable();
  uint64_t v46 = sub_24C94A8B0();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v48 = sub_24C9453E4(v46, WitnessTable, v71);
  __tp.__darwin_time_t tv_sec = v72;
  MEMORY[0x270FA5388](v48);
  *(&v53 - 2) = v2;
  *(&v53 - 1) = (os_log_t)v71;
  sub_24C94A6A0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C94A670();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24C9382A0((uint64_t)v2 + *((void *)v2->isa + 18), (uint64_t)&__tp);
  uint64_t v49 = v74;
  uint64_t v50 = v75;
  __swift_project_boxed_opaque_existential_1(&__tp, v74);
  (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v50 + 56))(v63, v49, v50, v45);
  v44(v36, AssociatedTypeWitness);
  ((void (*)(char *, uint64_t))v57)(v69, v65);
  uint64_t v51 = type metadata accessor for StoreProxy();
  (*(void (**)(void *, uint64_t))(*(void *)(v51 - 8) + 8))(v71, v51);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
}

uint64_t sub_24C948014(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v30 = *(void *)(*a2 + 88);
  uint64_t v29 = *(void *)(v6 + 80);
  swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for SideEffect();
  uint64_t v27 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  uint64_t v28 = (char *)&v26 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE78);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24C94A700();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  uint64_t v16 = type metadata accessor for StoreProxy();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 16))(v31, a3, v16);
  sub_24C94A6E0();
  swift_retain();
  uint64_t v18 = sub_24C94A6D0();
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v20 = (v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = (char *)swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8F500];
  *((void *)v21 + 2) = v18;
  *((void *)v21 + 3) = v22;
  os_log_type_t v23 = v28;
  uint64_t v24 = v30;
  *((void *)v21 + 4) = v29;
  *((void *)v21 + 5) = v24;
  *((void *)v21 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v21[v19], v23, v27);
  (*(void (**)(char *, unsigned char *, uint64_t))(v17 + 32))(&v21[v20], v31, v16);
  sub_24C94738C((uint64_t)v14, (uint64_t)&unk_2697FCF58, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_24C948304(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = *a4;
  sub_24C94A6E0();
  v6[6] = sub_24C94A6D0();
  uint64_t v8 = sub_24C94A6B0();
  v6[7] = v8;
  v6[8] = v7;
  return MEMORY[0x270FA2498](sub_24C9483C8, v8, v7);
}

uint64_t sub_24C9483C8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *uint64_t v1 = v0;
  v1[1] = sub_24C9484A4;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  return sub_24C93DDEC(v3, v4, AssociatedTypeWitness);
}

uint64_t sub_24C9484A4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_24C9485C4, v3, v2);
}

uint64_t sub_24C9485C4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C948624(void *a1)
{
  uint64_t v1 = *(void *)(*a1 + *MEMORY[0x263F8EA20]);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v6 - v3;
  sub_24C94A3D0();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_24C948740(void *a1)
{
  uint64_t v1 = *(void *)(*a1 + *MEMORY[0x263F8EA20]);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v6 - v3;
  sub_24C94A3D0();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_24C94885C(void *a1, uint64_t a2)
{
  uint64_t v20 = a2;
  v18[1] = *v2;
  uint64_t v19 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v3 = *(void *)(v19 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v18 - v5;
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(*v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v4);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v18 - v13;
  sub_24C94A3D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v19);
  swift_setAtWritableKeyPath();
  sub_24C94A3D0();
  swift_getAssociatedConformanceWitness();
  char v15 = sub_24C94A580();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  if ((v15 & 1) == 0) {
    sub_24C94A3C0();
  }
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v8);
}

uint64_t sub_24C948AD4(void *a1, uint64_t a2)
{
  uint64_t v20 = a2;
  v18[1] = *v2;
  uint64_t v19 = *(void *)(*a1 + *MEMORY[0x263F8DE50] + 8);
  uint64_t v3 = *(void *)(v19 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v18 - v5;
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(*v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v4);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v18 - v13;
  sub_24C94A3D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v19);
  swift_setAtWritableKeyPath();
  sub_24C94A3D0();
  swift_getAssociatedConformanceWitness();
  char v15 = sub_24C94A580();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  if ((v15 & 1) == 0) {
    sub_24C94A3C0();
  }
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v8);
}

char *sub_24C948D4C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v13 = *(void **)v7;
  uint64_t v22 = *a3;
  uint64_t v23 = a3[3];
  uint64_t v14 = *(void *)(*(void *)v7 + 80);
  uint64_t v15 = *(void *)(*(void *)v7 + 88);
  v30[0] = a6;
  v30[1] = v14;
  v30[2] = a7;
  uint64_t v31 = v15;
  type metadata accessor for ChildStore();
  uint64_t v16 = *(void **)(v7 + v13[14]);
  uint64_t v17 = *(void *)(v7 + v13[16]);
  sub_24C9382A0(v7 + v13[18], (uint64_t)v30);
  uint64_t v18 = v31;
  uint64_t v19 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  __tp.__darwin_time_t tv_sec = 0;
  __tp.uint64_t tv_nsec = 0;
  swift_retain();
  swift_retain();
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  (*(void (**)(timespec *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(v19 + 48))(&__tp, a6, a6, a7, v18, v19, (double)__tp.tv_nsec / 1000000000.0 + (double)__tp.tv_sec);
  uint64_t v26 = v22;
  long long v27 = *(_OWORD *)(a3 + 1);
  uint64_t v28 = v23;
  swift_retain();
  swift_retain();
  sub_24C93D500(a4);
  uint64_t v20 = sub_24C93CD48(a1, v16, a2, v17, &__tp, (uint64_t)&v26, a4, a5);
  sub_24C93D510(a4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  swift_getWitnessTable();
  return v20;
}

uint64_t *sub_24C948FA0()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v0 + *(void *)(*v0 + 144));
  return v0;
}

uint64_t sub_24C9490AC()
{
  sub_24C948FA0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for RootStore()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C949130(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24C949190(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C94926C;
  return v6(a1);
}

uint64_t sub_24C94926C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_24C949364(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v62 = a4;
  uint64_t v50 = a3;
  uint64_t v51 = a2;
  uint64_t v49 = a1;
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)v4;
  uint64_t v7 = v6[10];
  uint64_t v60 = v6[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v61 = sub_24C94A3E0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = sub_24C94A380();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v58 = v9;
  uint64_t v59 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v56 = (char *)&v48 - v11;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v48 = sub_24C94A3E0();
  uint64_t v53 = swift_getWitnessTable();
  uint64_t v13 = sub_24C94A380();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v54 = v13;
  uint64_t v55 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v52 = (char *)&v48 - v15;
  uint64_t v16 = type metadata accessor for JournalMode();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v17);
  uint64_t v23 = (char *)&v48 - v22;
  uint64_t v24 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v48 - v25;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(&v5[v6[13]], v49, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v50, v12);
  *(void *)&v5[*(void *)(*(void *)v5 + 112)] = sub_24C94A3F0();
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v51, AssociatedTypeWitness);
  *(void *)&v5[*(void *)(*(void *)v5 + 120)] = sub_24C94A3F0();
  sub_24C94A420();
  swift_allocObject();
  *((void *)v5 + 2) = sub_24C94A410();
  type metadata accessor for SideEffectRegistry();
  uint64_t v27 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v27 + 112) = MEMORY[0x263F8EE80];
  *(void *)&v5[*(void *)(*(void *)v5 + 128)] = v27;
  uint64_t v28 = &v5[*(void *)(*(void *)v5 + 136)];
  *(void *)uint64_t v28 = MEMORY[0x263F8EE78];
  sub_24C92BF48(v62, (uint64_t)v19);
  __tp.double tv_sec = 0;
  __tp.uint64_t tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &__tp);
  double tv_sec = (double)__tp.tv_sec;
  double v30 = (double)__tp.tv_nsec / 1000000000.0;
  uint64_t v31 = v60;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v32 = type metadata accessor for JournalDatabase();
  uint64_t v33 = sub_24C92F30C((uint64_t)v19, 1953460050, 0xE400000000000000, v30 + tv_sec);
  uint64_t v34 = (uint64_t *)&v5[*(void *)(*(void *)v5 + 144)];
  v34[3] = v32;
  _OWORD v34[4] = swift_getWitnessTable();
  *uint64_t v34 = v33;
  __tp.double tv_sec = *(void *)&v5[*(void *)(*(void *)v5 + 112)];
  uint64_t v35 = v52;
  sub_24C94A430();
  uint64_t v36 = swift_allocObject();
  swift_weakInit();
  uint64_t v37 = (void *)swift_allocObject();
  v37[2] = v7;
  void v37[3] = v31;
  _OWORD v37[4] = v36;
  swift_retain();
  uint64_t v38 = v54;
  swift_getWitnessTable();
  sub_24C94A440();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v38);
  swift_release();
  uint64_t v51 = v28;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE50);
  sub_24C93437C();
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  __tp.double tv_sec = *(void *)&v5[*(void *)(*(void *)v5 + 120)];
  char v39 = v56;
  sub_24C94A430();
  uint64_t v40 = swift_allocObject();
  swift_weakInit();
  os_log_t v41 = (void *)swift_allocObject();
  uint64_t v42 = v60;
  v41[2] = v7;
  v41[3] = v42;
  v41[4] = v40;
  swift_retain();
  uint64_t v43 = v58;
  swift_getWitnessTable();
  sub_24C94A440();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v43);
  swift_release();
  swift_beginAccess();
  sub_24C94A390();
  swift_endAccess();
  swift_release();
  sub_24C9382A0((uint64_t)v34, (uint64_t)&__tp);
  uint64_t v44 = v64;
  uint64_t v45 = v65;
  __swift_project_boxed_opaque_existential_1(&__tp, v64);
  uint64_t v46 = *(void (**)(uint64_t (*)(), char *, uint64_t, uint64_t))(v45 + 64);
  swift_retain();
  v46(sub_24C94A194, v5, v44, v45);
  swift_release();
  sub_24C92C2D0(v62);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&__tp);
  return v5;
}

char *sub_24C949C48(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  return sub_24C949364(a1, a2, a3, a4);
}

uint64_t sub_24C949CAC(uint64_t a1)
{
  return sub_24C948014(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24C949CC8()
{
  swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(type metadata accessor for SideEffect() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + v3);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      uint64_t v9 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697FCE98) + 80);
      uint64_t v10 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
    else
    {
      if (EnumCaseMultiPayload) {
        goto LABEL_10;
      }
      if (*(void *)(v5 + 24)) {
        __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      }
      uint64_t v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B17DE98) + 48);
      uint64_t v8 = sub_24C94A700();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
    swift_release();
  }
LABEL_10:
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 24, v2 | 7);
}

uint64_t sub_24C949EC4(uint64_t a1)
{
  uint64_t v3 = v2;
  swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(type metadata accessor for SideEffect() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (void *)v1[6];
  uint64_t v10 = (uint64_t)v1 + v6;
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_24C92B568;
  return sub_24C948304(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_24C94A014()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C94A04C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24C92B568;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697FCF60 + dword_2697FCF60);
  return v6(a1, v4);
}

uint64_t sub_24C94A104()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C94A13C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24C94A174()
{
  return sub_24C947660();
}

uint64_t sub_24C94A1A0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24C94A1B0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24C94A1C0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24C94A1D0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24C94A1E0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24C94A1F0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24C94A200()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24C94A210()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24C94A220()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24C94A230()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24C94A240()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24C94A250()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24C94A260()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24C94A270()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_24C94A280()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24C94A290()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_24C94A2A0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_24C94A2B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24C94A2C0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24C94A2D0()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_24C94A2E0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24C94A2F0()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_24C94A300()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24C94A310()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24C94A320()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24C94A330()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24C94A340()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24C94A350()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C94A360()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C94A370()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C94A380()
{
  return MEMORY[0x270EE3968]();
}

uint64_t sub_24C94A390()
{
  return MEMORY[0x270EE3BA0]();
}

uint64_t sub_24C94A3A0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_24C94A3B0()
{
  return MEMORY[0x270EE3BC8]();
}

uint64_t sub_24C94A3C0()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24C94A3D0()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_24C94A3E0()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_24C94A3F0()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t sub_24C94A400()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_24C94A410()
{
  return MEMORY[0x270EE3CE8]();
}

uint64_t sub_24C94A420()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_24C94A430()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_24C94A440()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24C94A450()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_24C94A460()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24C94A470()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24C94A480()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24C94A490()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24C94A4A0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24C94A4B0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24C94A4C0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_24C94A4D0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_24C94A4E0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24C94A4F0()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_24C94A500()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_24C94A510()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24C94A520()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_24C94A540()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24C94A550()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24C94A560()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24C94A570()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24C94A580()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24C94A590()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C94A5A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C94A5B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_24C94A5C0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24C94A5D0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24C94A5E0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24C94A5F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24C94A600()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24C94A610()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C94A620()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C94A630()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24C94A640()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_24C94A650()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C94A660()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_24C94A670()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_24C94A680()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24C94A690()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24C94A6A0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24C94A6B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24C94A6C0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24C94A6D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24C94A6E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24C94A6F0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24C94A700()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24C94A730()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24C94A740()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24C94A750()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24C94A760()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_24C94A770()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24C94A780()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24C94A790()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24C94A7A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C94A7B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24C94A7C0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24C94A7D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24C94A7E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24C94A7F0()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_24C94A800()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24C94A810()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C94A820()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C94A830()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24C94A840()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24C94A850()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24C94A860()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24C94A870()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24C94A880()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24C94A890()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C94A8A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C94A8B0()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_24C94A8C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24C94A8D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24C94A8E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C94A8F0()
{
  return MEMORY[0x270F9EB50]();
}

uint64_t sub_24C94A900()
{
  return MEMORY[0x270F9EB70]();
}

uint64_t sub_24C94A910()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24C94A920()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24C94A930()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24C94A940()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24C94A950()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C94A960()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C94A970()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24C94A980()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24C94A990()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24C94A9A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C94A9B0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24C94A9C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24C94A9D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24C94A9E0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24C94A9F0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24C94AA00()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24C94AA10()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24C94AA20()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24C94AA30()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24C94AA40()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24C94AA50()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24C94AA60()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24C94AA70()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24C94AA80()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24C94AA90()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24C94AAA0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24C94AAB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C94AAC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24C94AAD0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24C94AAF0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C94AB00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C94AB10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C94AB20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24C94AB30()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24C94AB40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C94AB50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C94AB60()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24C94AB70()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24C94AB80()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24C94AB90()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24C94ABA0()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_24C94ABB0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_24C94ABE0()
{
  return MEMORY[0x270FA0128]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x270FA0368]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}