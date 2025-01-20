uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

BOOL static FeatureEligibility.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FeatureEligibility.hash(into:)()
{
  return sub_24DE12260();
}

uint64_t sub_24DE0DEB4(char a1)
{
  return *(void *)&aInvalid_0[8 * a1];
}

BOOL sub_24DE0DED4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24DE0DEEC()
{
  return sub_24DE12260();
}

uint64_t sub_24DE0DF1C()
{
  return sub_24DE0DEB4(*v0);
}

uint64_t sub_24DE0DF24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24DE0F9CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24DE0DF4C()
{
  return 0;
}

void sub_24DE0DF58(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24DE0DF64(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E838();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0DFA0(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E838();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE0DFDC()
{
  return 0;
}

void sub_24DE0DFE8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24DE0DFF4(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E8E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0E030(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E8E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE0E06C(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E9DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0E0A8(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E9DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE0E0E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24DE0E114(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E934();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0E150(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E934();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE0E18C(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E88C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0E1C8(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E88C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE0E204(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E988();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE0E240(uint64_t a1)
{
  unint64_t v2 = sub_24DE0E988();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FeatureEligibility.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D18);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388]();
  v35 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D20);
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  MEMORY[0x270FA5388]();
  v32 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D28);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388]();
  v29 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D30);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388]();
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D38);
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D40);
  uint64_t v38 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  MEMORY[0x270FA5388]();
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24DE0E838();
  sub_24DE12290();
  switch(v18)
  {
    case 1:
      char v41 = 1;
      sub_24DE0E988();
      uint64_t v21 = v39;
      sub_24DE12230();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
      goto LABEL_8;
    case 2:
      char v42 = 2;
      sub_24DE0E934();
      v22 = v29;
      uint64_t v21 = v39;
      sub_24DE12230();
      uint64_t v24 = v30;
      uint64_t v23 = v31;
      goto LABEL_7;
    case 3:
      char v43 = 3;
      sub_24DE0E8E0();
      v22 = v32;
      uint64_t v21 = v39;
      sub_24DE12230();
      uint64_t v24 = v33;
      uint64_t v23 = v34;
      goto LABEL_7;
    case 4:
      char v44 = 4;
      sub_24DE0E88C();
      v22 = v35;
      uint64_t v21 = v39;
      sub_24DE12230();
      uint64_t v24 = v36;
      uint64_t v23 = v37;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v21);
      break;
    default:
      char v40 = 0;
      sub_24DE0E9DC();
      uint64_t v19 = v39;
      sub_24DE12230();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v19);
      break;
  }
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24DE0E838()
{
  unint64_t result = qword_269892D48;
  if (!qword_269892D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D48);
  }
  return result;
}

unint64_t sub_24DE0E88C()
{
  unint64_t result = qword_269892D50;
  if (!qword_269892D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D50);
  }
  return result;
}

unint64_t sub_24DE0E8E0()
{
  unint64_t result = qword_269892D58;
  if (!qword_269892D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D58);
  }
  return result;
}

unint64_t sub_24DE0E934()
{
  unint64_t result = qword_269892D60;
  if (!qword_269892D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D60);
  }
  return result;
}

unint64_t sub_24DE0E988()
{
  unint64_t result = qword_269892D68;
  if (!qword_269892D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D68);
  }
  return result;
}

unint64_t sub_24DE0E9DC()
{
  unint64_t result = qword_269892D70;
  if (!qword_269892D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892D70);
  }
  return result;
}

uint64_t FeatureEligibility.hashValue.getter()
{
  return sub_24DE12270();
}

uint64_t FeatureEligibility.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v54 = a2;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D78);
  uint64_t v43 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388]();
  v53 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D80);
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388]();
  v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D88);
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x270FA5388]();
  v51 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D90);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892D98);
  uint64_t v42 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892DA0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_24DE0E838();
  uint64_t v18 = v56;
  sub_24DE12280();
  if (v18)
  {
LABEL_7:
    uint64_t v33 = v55;
    return __swift_destroy_boxed_opaque_existential_1(v33);
  }
  uint64_t v39 = v10;
  char v40 = v12;
  uint64_t v19 = v9;
  uint64_t v21 = v51;
  v20 = v52;
  uint64_t v41 = 0;
  uint64_t v56 = v14;
  v22 = v53;
  uint64_t v23 = v54;
  uint64_t v24 = v16;
  uint64_t v25 = sub_24DE12220();
  if (*(void *)(v25 + 16) != 1)
  {
    uint64_t v30 = sub_24DE121C0();
    swift_allocError();
    v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269892DA8);
    void *v32 = &type metadata for FeatureEligibility;
    sub_24DE12210();
    sub_24DE121B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v16, v13);
    goto LABEL_7;
  }
  char v26 = *(unsigned char *)(v25 + 32);
  switch(v26)
  {
    case 1:
      char v58 = 1;
      sub_24DE0E988();
      uint64_t v35 = v41;
      sub_24DE12200();
      if (v35) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
      goto LABEL_19;
    case 2:
      char v59 = 2;
      sub_24DE0E934();
      uint64_t v36 = v41;
      sub_24DE12200();
      if (v36) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v48);
      goto LABEL_19;
    case 3:
      char v60 = 3;
      sub_24DE0E8E0();
      uint64_t v37 = v41;
      sub_24DE12200();
      if (v37) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v46);
LABEL_19:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      goto LABEL_21;
    case 4:
      char v61 = 4;
      sub_24DE0E88C();
      uint64_t v38 = v41;
      sub_24DE12200();
      if (v38) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v22, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      uint64_t v23 = v54;
      goto LABEL_21;
    default:
      char v27 = *(unsigned char *)(v25 + 32);
      char v57 = 0;
      sub_24DE0E9DC();
      v29 = v40;
      uint64_t v28 = v41;
      sub_24DE12200();
      if (v28)
      {
LABEL_16:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
        uint64_t v33 = v55;
        return __swift_destroy_boxed_opaque_existential_1(v33);
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      char v26 = v27;
LABEL_21:
      *uint64_t v23 = v26;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1(v55);
      break;
  }
  return result;
}

uint64_t sub_24DE0F1D0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return FeatureEligibility.init(from:)(a1, a2);
}

uint64_t sub_24DE0F1E8(void *a1)
{
  return FeatureEligibility.encode(to:)(a1);
}

uint64_t sub_24DE0F200()
{
  return sub_24DE12270();
}

uint64_t sub_24DE0F248()
{
  return sub_24DE12270();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_24DE0F2E0()
{
  unint64_t result = qword_269892DB0;
  if (!qword_269892DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DB0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibility()
{
  return &type metadata for FeatureEligibility;
}

uint64_t _s22FaceTimeFeatureControl18FeatureEligibilityOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22FaceTimeFeatureControl18FeatureEligibilityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24DE0F4BCLL);
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

uint64_t sub_24DE0F4E4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24DE0F4EC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibility.CodingKeys()
{
  return &type metadata for FeatureEligibility.CodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.InvalidCodingKeys()
{
  return &type metadata for FeatureEligibility.InvalidCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.UnknownCodingKeys()
{
  return &type metadata for FeatureEligibility.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.MaybeCodingKeys()
{
  return &type metadata for FeatureEligibility.MaybeCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.EligibleCodingKeys()
{
  return &type metadata for FeatureEligibility.EligibleCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibility.NotEligibleCodingKeys()
{
  return &type metadata for FeatureEligibility.NotEligibleCodingKeys;
}

unint64_t sub_24DE0F558()
{
  unint64_t result = qword_269892DB8;
  if (!qword_269892DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DB8);
  }
  return result;
}

unint64_t sub_24DE0F5B0()
{
  unint64_t result = qword_269892DC0;
  if (!qword_269892DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DC0);
  }
  return result;
}

unint64_t sub_24DE0F608()
{
  unint64_t result = qword_269892DC8;
  if (!qword_269892DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DC8);
  }
  return result;
}

unint64_t sub_24DE0F660()
{
  unint64_t result = qword_269892DD0;
  if (!qword_269892DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DD0);
  }
  return result;
}

unint64_t sub_24DE0F6B8()
{
  unint64_t result = qword_269892DD8;
  if (!qword_269892DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DD8);
  }
  return result;
}

unint64_t sub_24DE0F710()
{
  unint64_t result = qword_269892DE0;
  if (!qword_269892DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DE0);
  }
  return result;
}

unint64_t sub_24DE0F768()
{
  unint64_t result = qword_269892DE8;
  if (!qword_269892DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DE8);
  }
  return result;
}

unint64_t sub_24DE0F7C0()
{
  unint64_t result = qword_269892DF0;
  if (!qword_269892DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DF0);
  }
  return result;
}

unint64_t sub_24DE0F818()
{
  unint64_t result = qword_269892DF8;
  if (!qword_269892DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892DF8);
  }
  return result;
}

unint64_t sub_24DE0F870()
{
  unint64_t result = qword_269892E00;
  if (!qword_269892E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E00);
  }
  return result;
}

unint64_t sub_24DE0F8C8()
{
  unint64_t result = qword_269892E08;
  if (!qword_269892E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E08);
  }
  return result;
}

unint64_t sub_24DE0F920()
{
  unint64_t result = qword_269892E10;
  if (!qword_269892E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E10);
  }
  return result;
}

unint64_t sub_24DE0F978()
{
  unint64_t result = qword_269892E18;
  if (!qword_269892E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E18);
  }
  return result;
}

uint64_t sub_24DE0F9CC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64696C61766E69 && a2 == 0xE700000000000000;
  if (v3 || (sub_24DE12240() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000 || (sub_24DE12240() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656279616DLL && a2 == 0xE500000000000000 || (sub_24DE12240() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xE800000000000000 || (sub_24DE12240() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6967696C45746F6ELL && a2 == 0xEB00000000656C62)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24DE12240();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

FaceTimeFeatureControl::FeatureEligibility __swiftcall FeatureEligibilityChecker.getEligibilityForDomain(_:)(FaceTimeFeatureControl::FeatureEligibilityDomain a1)
{
  int v2 = v1;
  int domain_answer = os_eligibility_get_domain_answer();
  *int v2 = domain_answer != 0;
  return (char)domain_answer;
}

uint64_t sub_24DE0FC88(FaceTimeFeatureControl::FeatureEligibilityDomain a1)
{
  return FeatureEligibilityChecker.getEligibilityForDomain(_:)(a1);
}

uint64_t dispatch thunk of FeatureEligibilityChecking.getEligibilityForDomain(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for FeatureEligibilityChecker()
{
  return &type metadata for FeatureEligibilityChecker;
}

uint64_t sub_24DE0FCC4()
{
  uint64_t v0 = sub_24DE120F0();
  __swift_allocate_value_buffer(v0, qword_26B1A2C90);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1A2C90);
  return sub_24DE120E0();
}

uint64_t sub_24DE0FD48()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269892E38);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24DE12C50;
  *(void *)(v0 + 32) = sub_24DE12130();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_24DE12130();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_24DE12130();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = sub_24DE12130();
  *(void *)(v0 + 88) = v4;
  *(void *)(v0 + 96) = sub_24DE12130();
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 112) = sub_24DE12130();
  *(void *)(v0 + 120) = v6;
  *(void *)(v0 + 128) = sub_24DE12130();
  *(void *)(v0 + 136) = v7;
  *(void *)(v0 + 144) = sub_24DE12130();
  *(void *)(v0 + 152) = v8;
  *(void *)(v0 + 160) = sub_24DE12130();
  *(void *)(v0 + 168) = v9;
  *(void *)(v0 + 176) = sub_24DE12130();
  *(void *)(v0 + 184) = v10;
  *(void *)(v0 + 192) = sub_24DE12130();
  *(void *)(v0 + 200) = v11;
  *(void *)(v0 + 208) = sub_24DE12130();
  *(void *)(v0 + 216) = v12;
  *(void *)(v0 + 224) = sub_24DE12130();
  *(void *)(v0 + 232) = v13;
  uint64_t result = sub_24DE12130();
  *(void *)(v0 + 240) = result;
  *(void *)(v0 + 248) = v15;
  qword_269894250 = v0;
  return result;
}

uint64_t DeviceRestrictionController.init(profileConnection:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::Void __swiftcall DeviceRestrictionController.setRestrictionsActive(_:)(Swift::Bool a1)
{
  if (qword_26B1A2C88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24DE120F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1A2C90);
  uint64_t v3 = sub_24DE120D0();
  os_log_type_t v4 = sub_24DE12170();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_24DE12180();
    _os_log_impl(&dword_24DE0C000, v3, v4, "Setting device restrictions active=%{BOOL}d", v5, 8u);
    MEMORY[0x25332C380](v5, -1, -1);
  }

  sub_24DE10130(a1);
}

void sub_24DE10130(char a1)
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  if (*v1)
  {
    id v3 = *v1;
    if (sub_24DE1042C(a1 & 1))
    {
      os_log_type_t v4 = (void *)sub_24DE12100();
      swift_bridgeObjectRelease();
    }
    else
    {
      os_log_type_t v4 = 0;
    }
    uint64_t v9 = (void *)sub_24DE12120();
    uint64_t v10 = (void *)sub_24DE12120();
    v19[0] = 0;
    unsigned int v11 = objc_msgSend(v3, sel_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_, v4, v9, v10, 0, 0, 0, 0, v19);

    if (v11)
    {
      id v12 = v19[0];
    }
    else
    {
      id v13 = v19[0];
      uint64_t v14 = (void *)sub_24DE120C0();

      swift_willThrow();
      if (qword_26B1A2C88 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_24DE120F0();
      __swift_project_value_buffer(v15, (uint64_t)qword_26B1A2C90);
      uint64_t v16 = sub_24DE120D0();
      os_log_type_t v17 = sub_24DE12160();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_24DE0C000, v16, v17, "Unable to apply restrictions with MCProfileConnection", v18, 2u);
        MEMORY[0x25332C380](v18, -1, -1);
      }
    }
  }
  else
  {
    if (qword_26B1A2C88 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24DE120F0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1A2C90);
    uint64_t v6 = sub_24DE120D0();
    os_log_type_t v7 = sub_24DE12160();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24DE0C000, v6, v7, "Unable to get MCProfileConnection", v8, 2u);
      MEMORY[0x25332C380](v8, -1, -1);
    }
  }
}

uint64_t sub_24DE1042C(char a1)
{
  if (a1)
  {
    id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
    if (qword_269892D10 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_269894250;
    uint64_t v3 = *(void *)(qword_269894250 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v4 = v2 + 40;
      do
      {
        swift_bridgeObjectRetain();
        uint64_t v5 = (void *)sub_24DE12120();
        objc_msgSend(v1, sel_MCSetBoolRestriction_value_, v5, 0);
        swift_bridgeObjectRelease();

        v4 += 16;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease_n();
    }
    if (qword_26B1A2C88 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24DE120F0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B1A2C90);
    id v7 = v1;
    uint64_t v8 = sub_24DE120D0();
    os_log_type_t v9 = sub_24DE12170();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v21 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_24DE10FA4();
      id v12 = v7;
      uint64_t v13 = sub_24DE12140();
      sub_24DE107E0(v13, v14, &v21);
      sub_24DE12180();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24DE0C000, v8, v9, "Set device restrictions. Updating configuration to mcFeaturesSettings %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25332C380](v11, -1, -1);
      MEMORY[0x25332C380](v10, -1, -1);
    }
    else
    {
    }
    uint64_t v21 = 0;
    id v20 = v7;
    sub_24DE12110();

    return v21;
  }
  else
  {
    if (qword_26B1A2C88 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24DE120F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B1A2C90);
    uint64_t v16 = sub_24DE120D0();
    os_log_type_t v17 = sub_24DE12170();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24DE0C000, v16, v17, "Remove device restrictions. Updating configuration to nil", v18, 2u);
      MEMORY[0x25332C380](v18, -1, -1);
    }

    return 0;
  }
}

Swift::Void __swiftcall DeviceRestrictionController.resetRestrictions()()
{
}

uint64_t sub_24DE107E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24DE108B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24DE10FE4((uint64_t)v12, *a3);
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
      sub_24DE10FE4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1(v12);
  return v7;
}

uint64_t sub_24DE108B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24DE12190();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24DE10A70(a5, a6);
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
  uint64_t v8 = sub_24DE121D0();
  if (!v8)
  {
    sub_24DE121E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24DE121F0();
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

uint64_t sub_24DE10A70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24DE10B08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24DE10CE8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24DE10CE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24DE10B08(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24DE10C80(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24DE121A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24DE121E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24DE12150();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24DE121F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24DE121E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24DE10C80(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269892E30);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24DE10CE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269892E30);
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
  uint64_t result = sub_24DE121F0();
  __break(1u);
  return result;
}

void **initializeBufferWithCopyOfBuffer for DeviceRestrictionController(void **a1, void **a2)
{
  unint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for DeviceRestrictionController(id *a1)
{
}

void **assignWithCopy for DeviceRestrictionController(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for DeviceRestrictionController(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceRestrictionController(uint64_t *a1, unsigned int a2)
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
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceRestrictionController(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for DeviceRestrictionController()
{
  return &type metadata for DeviceRestrictionController;
}

unint64_t sub_24DE10FA4()
{
  unint64_t result = qword_269892E28;
  if (!qword_269892E28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269892E28);
  }
  return result;
}

uint64_t sub_24DE10FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static FeatureEligibilityDomain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeatureEligibilityDomain.hash(into:)()
{
  return sub_24DE12260();
}

uint64_t sub_24DE1108C(char a1)
{
  if (a1) {
    return 0x69486F5477617264;
  }
  else {
    return 0x6F4365746F6D6572;
  }
}

BOOL sub_24DE110DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24DE110F4()
{
  return sub_24DE1108C(*v0);
}

uint64_t sub_24DE110FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24DE11FA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24DE11124(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24DE11130(uint64_t a1)
{
  unint64_t v2 = sub_24DE1153C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE1116C(uint64_t a1)
{
  unint64_t v2 = sub_24DE1153C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE111A8(uint64_t a1)
{
  unint64_t v2 = sub_24DE11590();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE111E4(uint64_t a1)
{
  unint64_t v2 = sub_24DE11590();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24DE11220(uint64_t a1)
{
  unint64_t v2 = sub_24DE115E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24DE1125C(uint64_t a1)
{
  unint64_t v2 = sub_24DE115E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FeatureEligibilityDomain.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E40);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E48);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E50);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  size_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24DE1153C();
  sub_24DE12290();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24DE11590();
    unint64_t v14 = v18;
    sub_24DE12230();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24DE115E4();
    sub_24DE12230();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24DE1153C()
{
  unint64_t result = qword_269892E58;
  if (!qword_269892E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E58);
  }
  return result;
}

unint64_t sub_24DE11590()
{
  unint64_t result = qword_269892E60;
  if (!qword_269892E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E60);
  }
  return result;
}

unint64_t sub_24DE115E4()
{
  unint64_t result = qword_269892E68;
  if (!qword_269892E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E68);
  }
  return result;
}

uint64_t FeatureEligibilityDomain.hashValue.getter()
{
  return sub_24DE12270();
}

uint64_t FeatureEligibilityDomain.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E70);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E78);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269892E80);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24DE1153C();
  size_t v11 = v32;
  sub_24DE12280();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  unint64_t v14 = v10;
  uint64_t v15 = sub_24DE12220();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24DE121C0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269892DA8);
    void *v22 = &type metadata for FeatureEligibilityDomain;
    sub_24DE12210();
    sub_24DE121B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24DE11590();
    uint64_t v18 = v14;
    sub_24DE12200();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24DE115E4();
    sub_24DE12200();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24DE11AD8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return FeatureEligibilityDomain.init(from:)(a1, a2);
}

uint64_t sub_24DE11AF0(void *a1)
{
  return FeatureEligibilityDomain.encode(to:)(a1);
}

unint64_t sub_24DE11B0C()
{
  unint64_t result = qword_269892E88;
  if (!qword_269892E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E88);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain()
{
  return &type metadata for FeatureEligibilityDomain;
}

uint64_t _s22FaceTimeFeatureControl24FeatureEligibilityDomainOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22FaceTimeFeatureControl24FeatureEligibilityDomainOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24DE11CD4);
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

unsigned char *sub_24DE11CFC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.CodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.CodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.RemoteControlCodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.RemoteControlCodingKeys;
}

ValueMetadata *type metadata accessor for FeatureEligibilityDomain.DrawToHighlightCodingKeys()
{
  return &type metadata for FeatureEligibilityDomain.DrawToHighlightCodingKeys;
}

unint64_t sub_24DE11D3C()
{
  unint64_t result = qword_269892E90;
  if (!qword_269892E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E90);
  }
  return result;
}

unint64_t sub_24DE11D94()
{
  unint64_t result = qword_269892E98;
  if (!qword_269892E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892E98);
  }
  return result;
}

unint64_t sub_24DE11DEC()
{
  unint64_t result = qword_269892EA0;
  if (!qword_269892EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892EA0);
  }
  return result;
}

unint64_t sub_24DE11E44()
{
  unint64_t result = qword_269892EA8;
  if (!qword_269892EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892EA8);
  }
  return result;
}

unint64_t sub_24DE11E9C()
{
  unint64_t result = qword_269892EB0;
  if (!qword_269892EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892EB0);
  }
  return result;
}

unint64_t sub_24DE11EF4()
{
  unint64_t result = qword_269892EB8;
  if (!qword_269892EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892EB8);
  }
  return result;
}

unint64_t sub_24DE11F4C()
{
  unint64_t result = qword_269892EC0;
  if (!qword_269892EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269892EC0);
  }
  return result;
}

uint64_t sub_24DE11FA0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F4365746F6D6572 && a2 == 0xED00006C6F72746ELL;
  if (v3 || (sub_24DE12240() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69486F5477617264 && a2 == 0xEF746867696C6867)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24DE12240();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24DE120C0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24DE120D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24DE120E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24DE120F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24DE12100()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24DE12110()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_24DE12120()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24DE12130()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24DE12140()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24DE12150()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24DE12160()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24DE12170()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24DE12180()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24DE12190()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24DE121A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24DE121B0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24DE121C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24DE121D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24DE121E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24DE121F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24DE12200()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24DE12210()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24DE12220()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24DE12230()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24DE12240()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24DE12250()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24DE12260()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24DE12270()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24DE12280()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24DE12290()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}