unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

BOOL static SubscriptionState.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24F37D1A8(char a1)
{
  return *(void *)&aUnknown_0[8 * a1];
}

BOOL sub_24F37D1C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F37D1E0()
{
  return sub_24F386000();
}

uint64_t sub_24F37D210()
{
  return sub_24F37D1A8(*v0);
}

uint64_t sub_24F37D218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F37DB20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F37D240()
{
  return 0;
}

void sub_24F37D24C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F37D258(uint64_t a1)
{
  unint64_t v2 = sub_24F37D874();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37D294(uint64_t a1)
{
  unint64_t v2 = sub_24F37D874();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37D2D0()
{
  return 0;
}

void sub_24F37D2DC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F37D2E8(uint64_t a1)
{
  unint64_t v2 = sub_24F37D91C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37D324(uint64_t a1)
{
  unint64_t v2 = sub_24F37D91C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37D360@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24F37D390(uint64_t a1)
{
  unint64_t v2 = sub_24F37D970();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37D3CC(uint64_t a1)
{
  unint64_t v2 = sub_24F37D970();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37D408(uint64_t a1)
{
  unint64_t v2 = sub_24F37D8C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37D444(uint64_t a1)
{
  unint64_t v2 = sub_24F37D8C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SubscriptionState.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03158);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03160);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03168);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03170);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F37D874();
  sub_24F386030();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24F37D91C();
      sub_24F385F60();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24F37D8C8();
      v15 = v21;
      sub_24F385F60();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24F37D970();
    sub_24F385F60();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
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

unint64_t sub_24F37D874()
{
  unint64_t result = qword_269A03178;
  if (!qword_269A03178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03178);
  }
  return result;
}

unint64_t sub_24F37D8C8()
{
  unint64_t result = qword_269A03180;
  if (!qword_269A03180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03180);
  }
  return result;
}

unint64_t sub_24F37D91C()
{
  unint64_t result = qword_269A03188;
  if (!qword_269A03188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03188);
  }
  return result;
}

unint64_t sub_24F37D970()
{
  unint64_t result = qword_269A03190;
  if (!qword_269A03190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03190);
  }
  return result;
}

void *SubscriptionState.init(from:)(void *a1)
{
  return sub_24F37DC80(a1);
}

void *sub_24F37D9DC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24F37DC80(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24F37DA08(void *a1)
{
  return SubscriptionState.encode(to:)(a1, *v1);
}

uint64_t SubscriptionState.hash(into:)()
{
  return sub_24F386000();
}

uint64_t SubscriptionState.hashValue.getter()
{
  return sub_24F386010();
}

uint64_t sub_24F37DA94()
{
  return sub_24F386010();
}

uint64_t sub_24F37DADC()
{
  return sub_24F386010();
}

uint64_t sub_24F37DB20(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6269726373627573 && a2 == 0xEA00000000006465 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7263736275736E75 && a2 == 0xEC00000064656269)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F385FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24F37DC80(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A031E8);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A031F0);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A031F8);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03200);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F37D874();
  uint64_t v12 = (uint64_t)v30;
  sub_24F386020();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  v30 = a1;
  v14 = v11;
  uint64_t v15 = sub_24F385F50();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24F385ED0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A03208);
    *uint64_t v11 = &type metadata for SubscriptionState;
    sub_24F385F10();
    sub_24F385EC0();
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
      sub_24F37D91C();
      sub_24F385F00();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24F37D8C8();
      sub_24F385F00();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24F37D970();
    sub_24F385F00();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24F37E1F4()
{
  unint64_t result = qword_269A03198;
  if (!qword_269A03198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03198);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState()
{
  return &type metadata for SubscriptionState;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18FitnessTrainerTips17SubscriptionStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F37E3C0);
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

uint64_t sub_24F37E3E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F37E3F0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionState.CodingKeys()
{
  return &type metadata for SubscriptionState.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnknownCodingKeys()
{
  return &type metadata for SubscriptionState.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.SubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.SubscribedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionState.UnsubscribedCodingKeys()
{
  return &type metadata for SubscriptionState.UnsubscribedCodingKeys;
}

unint64_t sub_24F37E43C()
{
  unint64_t result = qword_269A031A0;
  if (!qword_269A031A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031A0);
  }
  return result;
}

unint64_t sub_24F37E494()
{
  unint64_t result = qword_269A031A8;
  if (!qword_269A031A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031A8);
  }
  return result;
}

unint64_t sub_24F37E4EC()
{
  unint64_t result = qword_269A031B0;
  if (!qword_269A031B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031B0);
  }
  return result;
}

unint64_t sub_24F37E544()
{
  unint64_t result = qword_269A031B8;
  if (!qword_269A031B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031B8);
  }
  return result;
}

unint64_t sub_24F37E59C()
{
  unint64_t result = qword_269A031C0;
  if (!qword_269A031C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031C0);
  }
  return result;
}

unint64_t sub_24F37E5F4()
{
  unint64_t result = qword_269A031C8;
  if (!qword_269A031C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031C8);
  }
  return result;
}

unint64_t sub_24F37E64C()
{
  unint64_t result = qword_269A031D0;
  if (!qword_269A031D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031D0);
  }
  return result;
}

unint64_t sub_24F37E6A4()
{
  unint64_t result = qword_269A031D8;
  if (!qword_269A031D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031D8);
  }
  return result;
}

unint64_t sub_24F37E6FC()
{
  unint64_t result = qword_269A031E0;
  if (!qword_269A031E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A031E0);
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

uint64_t sub_24F37E7B4(char a1)
{
  uint64_t result = 0xD000000000000017;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000019;
    }
    else {
      return 0x6570704177656976;
    }
  }
  return result;
}

uint64_t sub_24F37E81C()
{
  return sub_24F37E7B4(*v0);
}

uint64_t sub_24F37E824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F37FD9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F37E84C(uint64_t a1)
{
  unint64_t v2 = sub_24F37EEF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37E888(uint64_t a1)
{
  unint64_t v2 = sub_24F37EEF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37E8C4(uint64_t a1)
{
  unint64_t v2 = sub_24F37F040();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37E900(uint64_t a1)
{
  unint64_t v2 = sub_24F37F040();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37E93C()
{
  return 1;
}

uint64_t sub_24F37E944()
{
  return sub_24F386010();
}

uint64_t sub_24F37E988()
{
  return sub_24F386000();
}

uint64_t sub_24F37E9B0()
{
  return sub_24F386010();
}

uint64_t sub_24F37E9F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F37FEFC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F37EA20(uint64_t a1)
{
  unint64_t v2 = sub_24F37EF98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37EA5C(uint64_t a1)
{
  unint64_t v2 = sub_24F37EF98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37EA98(uint64_t a1)
{
  unint64_t v2 = sub_24F37EF44();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37EAD4(uint64_t a1)
{
  unint64_t v2 = sub_24F37EF44();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TrainerTipUpsellMonitorAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2138);
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2128);
  uint64_t v25 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v24 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2120);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2130);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v1;
  uint64_t v14 = v1[1];
  int v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F37EEF0();
  sub_24F386030();
  if (v15 == 2)
  {
    LOBYTE(v29) = 0;
    sub_24F37F040();
    sub_24F385F60();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  if (v15 == 3)
  {
    LOBYTE(v29) = 2;
    sub_24F37EF44();
    uint64_t v16 = v23;
    sub_24F385F60();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  LOBYTE(v29) = 1;
  sub_24F37EF98();
  uint64_t v18 = v24;
  sub_24F385F60();
  uint64_t v29 = v13;
  uint64_t v30 = v14;
  char v31 = v15 & 1;
  sub_24F37EFEC();
  uint64_t v19 = v28;
  sub_24F385F90();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_24F37EEF0()
{
  unint64_t result = qword_26B1F20B0;
  if (!qword_26B1F20B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20B0);
  }
  return result;
}

unint64_t sub_24F37EF44()
{
  unint64_t result = qword_26B1F20C8;
  if (!qword_26B1F20C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20C8);
  }
  return result;
}

unint64_t sub_24F37EF98()
{
  unint64_t result = qword_269A03210;
  if (!qword_269A03210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03210);
  }
  return result;
}

unint64_t sub_24F37EFEC()
{
  unint64_t result = qword_269A03218;
  if (!qword_269A03218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03218);
  }
  return result;
}

unint64_t sub_24F37F040()
{
  unint64_t result = qword_269A03220;
  if (!qword_269A03220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03220);
  }
  return result;
}

uint64_t TrainerTipUpsellMonitorAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03228);
  uint64_t v32 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388]();
  v36 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03230);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03238);
  uint64_t v31 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03240);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_24F37EEF0();
  uint64_t v16 = v40;
  sub_24F386020();
  if (!v16)
  {
    uint64_t v17 = v36;
    uint64_t v40 = v12;
    uint64_t v18 = sub_24F385F50();
    if (*(void *)(v18 + 16) == 1)
    {
      if (*(unsigned char *)(v18 + 32))
      {
        if (*(unsigned char *)(v18 + 32) == 1)
        {
          LOBYTE(v38) = 1;
          sub_24F37EF98();
          uint64_t v19 = v14;
          sub_24F385F00();
          uint64_t v20 = v35;
          sub_24F37F65C();
          uint64_t v26 = v33;
          sub_24F385F40();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v11);
          long long v27 = v38;
          char v28 = v39;
          uint64_t v29 = (uint64_t)v37;
LABEL_12:
          *(_OWORD *)uint64_t v20 = v27;
          *(unsigned char *)(v20 + 16) = v28;
          return __swift_destroy_boxed_opaque_existential_1(v29);
        }
        LOBYTE(v38) = 2;
        sub_24F37EF44();
        sub_24F385F00();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v30);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v11);
        long long v27 = 0uLL;
        char v28 = 3;
      }
      else
      {
        LOBYTE(v38) = 0;
        sub_24F37F040();
        sub_24F385F00();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v8);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v11);
        long long v27 = 0uLL;
        char v28 = 2;
      }
      uint64_t v29 = (uint64_t)v37;
      uint64_t v20 = v35;
      goto LABEL_12;
    }
    uint64_t v21 = sub_24F385ED0();
    swift_allocError();
    uint64_t v22 = v11;
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A03208);
    *uint64_t v24 = &type metadata for TrainerTipUpsellMonitorAction;
    sub_24F385F10();
    sub_24F385EC0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v22);
  }
  uint64_t v29 = (uint64_t)v37;
  return __swift_destroy_boxed_opaque_existential_1(v29);
}

unint64_t sub_24F37F65C()
{
  unint64_t result = qword_269A03248;
  if (!qword_269A03248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03248);
  }
  return result;
}

uint64_t sub_24F37F6B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TrainerTipUpsellMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_24F37F6C8(void *a1)
{
  return TrainerTipUpsellMonitorAction.encode(to:)(a1);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 < 2) {
    return 0;
  }
  unsigned int v4 = (v3 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v4 - 1;
  if (v4 <= 1) {
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_24F37F784(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24F37F7A0(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(unsigned char *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction()
{
  return &type metadata for TrainerTipUpsellMonitorAction;
}

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F37F8A4);
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

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.CodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.PresentTrainerTipUpsellCodingKeys;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F37F9DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F37FA04()
{
  return 0;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.TrainerTipPlayerDismissedCodingKeys;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorAction.ViewAppearedCodingKeys;
}

unint64_t sub_24F37FA30()
{
  unint64_t result = qword_269A03250;
  if (!qword_269A03250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03250);
  }
  return result;
}

unint64_t sub_24F37FA88()
{
  unint64_t result = qword_269A03258;
  if (!qword_269A03258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03258);
  }
  return result;
}

unint64_t sub_24F37FAE0()
{
  unint64_t result = qword_26B1F2098;
  if (!qword_26B1F2098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F2098);
  }
  return result;
}

unint64_t sub_24F37FB38()
{
  unint64_t result = qword_26B1F2090;
  if (!qword_26B1F2090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F2090);
  }
  return result;
}

unint64_t sub_24F37FB90()
{
  unint64_t result = qword_26B1F20A8;
  if (!qword_26B1F20A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20A8);
  }
  return result;
}

unint64_t sub_24F37FBE8()
{
  unint64_t result = qword_26B1F20A0;
  if (!qword_26B1F20A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20A0);
  }
  return result;
}

unint64_t sub_24F37FC40()
{
  unint64_t result = qword_26B1F20D8;
  if (!qword_26B1F20D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20D8);
  }
  return result;
}

unint64_t sub_24F37FC98()
{
  unint64_t result = qword_26B1F20D0;
  if (!qword_26B1F20D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20D0);
  }
  return result;
}

unint64_t sub_24F37FCF0()
{
  unint64_t result = qword_26B1F20C0;
  if (!qword_26B1F20C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20C0);
  }
  return result;
}

unint64_t sub_24F37FD48()
{
  unint64_t result = qword_26B1F20B8;
  if (!qword_26B1F20B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20B8);
  }
  return result;
}

uint64_t sub_24F37FD9C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x800000024F387EC0 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024F387EE0 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24F385FA0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24F37FEFC(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F385FA0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F37FF6C()
{
  return 12383;
}

double TrainerTipUpsellConfiguration.interval.getter()
{
  return *(double *)v0;
}

uint64_t TrainerTipUpsellConfiguration.nativeRulesEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t TrainerTipUpsellConfiguration.placementIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

double TrainerTipUpsellConfiguration.minimumRatioComplete.getter()
{
  return *(double *)(v0 + 32);
}

uint64_t TrainerTipUpsellConfiguration.subscriptionCheckEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

void __swiftcall TrainerTipUpsellConfiguration.init(interval:nativeRulesEnabled:placementIdentifier:minimumRatioComplete:subscriptionCheckEnabled:)(FitnessTrainerTips::TrainerTipUpsellConfiguration *__return_ptr retstr, Swift::Double interval, Swift::Bool nativeRulesEnabled, Swift::String placementIdentifier, Swift::Double minimumRatioComplete, Swift::Bool subscriptionCheckEnabled)
{
  retstr->interval = interval;
  retstr->nativeRulesEnabled = nativeRulesEnabled;
  retstr->placementIdentifier = placementIdentifier;
  retstr->minimumRatioComplete = minimumRatioComplete;
  retstr->subscriptionCheckEnabled = subscriptionCheckEnabled;
}

uint64_t initializeBufferWithCopyOfBuffer for TrainerTipUpsellConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrainerTipUpsellConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TrainerTipUpsellConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellConfiguration()
{
  return &type metadata for TrainerTipUpsellConfiguration;
}

double TrainerTipPlayerDismissedEvent.elapsedTime.getter()
{
  return *(double *)v0;
}

double TrainerTipPlayerDismissedEvent.duration.getter()
{
  return *(double *)(v0 + 8);
}

uint64_t TrainerTipPlayerDismissedEvent.isUpsellEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

FitnessTrainerTips::TrainerTipPlayerDismissedEvent __swiftcall TrainerTipPlayerDismissedEvent.init(elapsedTime:duration:isUpsellEnabled:)(Swift::Double elapsedTime, Swift::Double duration, Swift::Bool isUpsellEnabled)
{
  *(Swift::Double *)uint64_t v3 = elapsedTime;
  *(Swift::Double *)(v3 + 8) = duration;
  *(unsigned char *)(v3 + 16) = isUpsellEnabled;
  result.duration = duration;
  result.elapsedTime = elapsedTime;
  result.isUpsellEnabled = isUpsellEnabled;
  return result;
}

uint64_t sub_24F380210(char a1)
{
  return *(void *)&aElapsedtdurati[8 * a1];
}

uint64_t sub_24F380230()
{
  return sub_24F380210(*v0);
}

uint64_t sub_24F380238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F38097C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F380260(uint64_t a1)
{
  unint64_t v2 = sub_24F380470();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38029C(uint64_t a1)
{
  unint64_t v2 = sub_24F380470();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TrainerTipPlayerDismissedEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03260);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F380470();
  sub_24F386030();
  char v11 = 0;
  sub_24F385F80();
  if (!v1)
  {
    char v10 = 1;
    sub_24F385F80();
    char v9 = 2;
    sub_24F385F70();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F380470()
{
  unint64_t result = qword_269A03268;
  if (!qword_269A03268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03268);
  }
  return result;
}

uint64_t TrainerTipPlayerDismissedEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A03270);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F380470();
  sub_24F386020();
  if (!v2)
  {
    char v18 = 0;
    sub_24F385F30();
    uint64_t v10 = v9;
    char v17 = 1;
    sub_24F385F30();
    uint64_t v13 = v12;
    char v16 = 2;
    char v14 = sub_24F385F20();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v13;
    *(unsigned char *)(a2 + 16) = v14 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24F380698@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TrainerTipPlayerDismissedEvent.init(from:)(a1, a2);
}

uint64_t sub_24F3806B0(void *a1)
{
  return TrainerTipPlayerDismissedEvent.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for TrainerTipPlayerDismissedEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipPlayerDismissedEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
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
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipPlayerDismissedEvent()
{
  return &type metadata for TrainerTipPlayerDismissedEvent;
}

unsigned char *storeEnumTagSinglePayload for TrainerTipPlayerDismissedEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F38083CLL);
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

ValueMetadata *type metadata accessor for TrainerTipPlayerDismissedEvent.CodingKeys()
{
  return &type metadata for TrainerTipPlayerDismissedEvent.CodingKeys;
}

unint64_t sub_24F380878()
{
  unint64_t result = qword_269A03278;
  if (!qword_269A03278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03278);
  }
  return result;
}

unint64_t sub_24F3808D0()
{
  unint64_t result = qword_269A03280;
  if (!qword_269A03280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03280);
  }
  return result;
}

unint64_t sub_24F380928()
{
  unint64_t result = qword_269A03288;
  if (!qword_269A03288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A03288);
  }
  return result;
}

uint64_t sub_24F38097C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5464657370616C65 && a2 == 0xEB00000000656D69;
  if (v3 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_24F385FA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C657370557369 && a2 == 0xEF64656C62616E45)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F385FA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24F380AEC()
{
  uint64_t v0 = sub_24F385DF0();
  __swift_allocate_value_buffer(v0, qword_269A046A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A046A8);
  return sub_24F385DE0();
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

uint64_t TrainerTipUpsellMonitorFeature.environment.getter@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = v1[5];
  long long v13 = v1[4];
  long long v2 = v13;
  long long v14 = v3;
  long long v5 = v1[7];
  long long v15 = v1[6];
  long long v4 = v15;
  long long v16 = v5;
  long long v6 = v1[1];
  v10[0] = *v1;
  v10[1] = v6;
  long long v8 = v1[3];
  long long v11 = v1[2];
  long long v7 = v11;
  long long v12 = v8;
  *a1 = v10[0];
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  a1[7] = v5;
  return sub_24F383D38((uint64_t)v10);
}

__n128 TrainerTipUpsellMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

uint64_t TrainerTipUpsellMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(unsigned char *a1, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2110);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  long long v12 = &v73[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  long long v15 = &v73[-v14];
  uint64_t result = MEMORY[0x270FA5388](v13);
  char v18 = &v73[-v17];
  uint64_t v19 = *a4;
  uint64_t v20 = a4[1];
  int v21 = *((unsigned __int8 *)a4 + 16);
  long long v22 = v4[5];
  long long v79 = v4[4];
  long long v80 = v22;
  long long v23 = v4[7];
  long long v81 = v4[6];
  long long v82 = v23;
  long long v24 = v4[1];
  long long v75 = *v4;
  long long v76 = v24;
  long long v25 = v4[3];
  long long v77 = v4[2];
  long long v78 = v25;
  if (v21 == 2)
  {
    v42 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2118);
    v43 = &v12[v42[16]];
    v44 = &v12[v42[20]];
    v45 = &v12[v42[24]];
    char v74 = 1;
    sub_24F3813AC();
    sub_24F385EB0();
    sub_24F385E70();
    uint64_t v46 = *MEMORY[0x263F39590];
    uint64_t v47 = sub_24F385E20();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v43, v46, v47);
    uint64_t v48 = *MEMORY[0x263F39578];
    uint64_t v49 = sub_24F385E10();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v44, v48, v49);
    v50 = (_OWORD *)swift_allocObject();
    long long v51 = v80;
    v50[5] = v79;
    v50[6] = v51;
    long long v52 = v82;
    v50[7] = v81;
    v50[8] = v52;
    long long v53 = v76;
    v50[1] = v75;
    v50[2] = v53;
    long long v54 = v78;
    v50[3] = v77;
    v50[4] = v54;
    void *v45 = &unk_269A03298;
    v45[1] = v50;
    (*(void (**)(unsigned char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F39530], v8);
    unint64_t v39 = *a3;
    sub_24F383D38((uint64_t)&v75);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v39 = sub_24F384238(0, *(void *)(v39 + 16) + 1, 1, v39);
    }
    unint64_t v56 = *(void *)(v39 + 16);
    unint64_t v55 = *(void *)(v39 + 24);
    if (v56 >= v55 >> 1) {
      unint64_t v39 = sub_24F384238(v55 > 1, v56 + 1, 1, v39);
    }
    *(void *)(v39 + 16) = v56 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, unsigned char *, uint64_t))(v9 + 32))(v39+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v56, v12, v8);
  }
  else if (v21 == 3)
  {
    if (*a1) {
      return result;
    }
    *a1 = 1;
    uint64_t v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2118);
    long long v27 = &v18[v26[16]];
    char v28 = &v18[v26[20]];
    uint64_t v29 = &v18[v26[24]];
    char v74 = 0;
    sub_24F3813AC();
    sub_24F385EB0();
    sub_24F385E70();
    uint64_t v30 = *MEMORY[0x263F39590];
    uint64_t v31 = sub_24F385E20();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v27, v30, v31);
    uint64_t v32 = *MEMORY[0x263F39570];
    uint64_t v33 = sub_24F385E10();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v28, v32, v33);
    uint64_t v34 = (_OWORD *)swift_allocObject();
    long long v35 = v80;
    v34[5] = v79;
    v34[6] = v35;
    long long v36 = v82;
    v34[7] = v81;
    v34[8] = v36;
    long long v37 = v76;
    v34[1] = v75;
    v34[2] = v37;
    long long v38 = v78;
    v34[3] = v77;
    v34[4] = v38;
    void *v29 = &unk_269A032B8;
    v29[1] = v34;
    (*(void (**)(unsigned char *, void, uint64_t))(v9 + 104))(v18, *MEMORY[0x263F39530], v8);
    unint64_t v39 = *a3;
    sub_24F383D38((uint64_t)&v75);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v39 = sub_24F384238(0, *(void *)(v39 + 16) + 1, 1, v39);
    }
    unint64_t v41 = *(void *)(v39 + 16);
    unint64_t v40 = *(void *)(v39 + 24);
    if (v41 >= v40 >> 1) {
      unint64_t v39 = sub_24F384238(v40 > 1, v41 + 1, 1, v39);
    }
    *(void *)(v39 + 16) = v41 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, unsigned char *, uint64_t))(v9 + 32))(v39+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v41, v18, v8);
  }
  else
  {
    char v57 = v21 & 1;
    v58 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2118);
    v59 = &v15[v58[16]];
    v60 = &v15[v58[20]];
    v61 = &v15[v58[24]];
    char v74 = 2;
    sub_24F3813AC();
    sub_24F385EB0();
    sub_24F385E70();
    uint64_t v62 = *MEMORY[0x263F39590];
    uint64_t v63 = sub_24F385E20();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 104))(v59, v62, v63);
    uint64_t v64 = *MEMORY[0x263F39578];
    uint64_t v65 = sub_24F385E10();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 104))(v60, v64, v65);
    uint64_t v66 = swift_allocObject();
    long long v67 = v80;
    *(_OWORD *)(v66 + 80) = v79;
    *(_OWORD *)(v66 + 96) = v67;
    long long v68 = v82;
    *(_OWORD *)(v66 + 112) = v81;
    *(_OWORD *)(v66 + 128) = v68;
    long long v69 = v76;
    *(_OWORD *)(v66 + 16) = v75;
    *(_OWORD *)(v66 + 32) = v69;
    long long v70 = v78;
    *(_OWORD *)(v66 + 48) = v77;
    *(_OWORD *)(v66 + 64) = v70;
    *(void *)(v66 + 144) = v19;
    *(void *)(v66 + 152) = v20;
    *(unsigned char *)(v66 + 160) = v57;
    void *v61 = &unk_269A032A8;
    v61[1] = v66;
    (*(void (**)(unsigned char *, void, uint64_t))(v9 + 104))(v15, *MEMORY[0x263F39530], v8);
    unint64_t v39 = *a3;
    sub_24F383D38((uint64_t)&v75);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v39 = sub_24F384238(0, *(void *)(v39 + 16) + 1, 1, v39);
    }
    unint64_t v72 = *(void *)(v39 + 16);
    unint64_t v71 = *(void *)(v39 + 24);
    if (v72 >= v71 >> 1) {
      unint64_t v39 = sub_24F384238(v71 > 1, v72 + 1, 1, v39);
    }
    *(void *)(v39 + 16) = v72 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, unsigned char *, uint64_t))(v9 + 32))(v39+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v72, v15, v8);
  }
  *a3 = v39;
  return result;
}

unint64_t sub_24F3813AC()
{
  unint64_t result = qword_26B1F20F0;
  if (!qword_26B1F20F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20F0);
  }
  return result;
}

uint64_t sub_24F381400(uint64_t a1, uint64_t a2)
{
  v2[18] = a1;
  v2[19] = sub_24F385E60();
  v2[20] = sub_24F385E50();
  long long v6 = (uint64_t (*)(void *))(*(void *)(a2 + 80) + **(int **)(a2 + 80));
  long long v4 = (void *)swift_task_alloc();
  v2[21] = v4;
  *long long v4 = v2;
  v4[1] = sub_24F3814FC;
  return v6(v2 + 7);
}

uint64_t sub_24F3814FC()
{
  long long v2 = (void *)*v1;
  v2[22] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F385E30();
  v2[23] = v4;
  v2[24] = v3;
  if (v0) {
    long long v5 = sub_24F381CBC;
  }
  else {
    long long v5 = sub_24F38165C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F38165C()
{
  uint64_t v1 = v0[10];
  long long v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F385E80();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F385E50();
  v0[25] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  long long v6 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v6;
  *long long v6 = v0;
  v6[1] = sub_24F38184C;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 12, v5, v7);
}

uint64_t sub_24F38184C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24F381990, v3, v2);
}

uint64_t sub_24F381990()
{
  int v1 = *(unsigned __int8 *)(v0 + 112);
  if (v1 == 2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 96);
    *(unsigned char *)(v0 + 136) = v1 & 1;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032C0);
    *uint64_t v4 = v0;
    v4[1] = sub_24F381AB0;
    return MEMORY[0x270F252C8](v0 + 120, v5);
  }
}

uint64_t sub_24F381AB0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_24F381BD0, v3, v2);
}

uint64_t sub_24F381BD0()
{
  uint64_t v1 = sub_24F385E50();
  v0[25] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F38184C;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 12, v1, v3);
}

uint64_t sub_24F381CBC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F381D20(uint64_t a1, _OWORD *a2, char a3, double a4, double a5)
{
  *(void *)(v5 + 192) = a1;
  *(void *)(v5 + 200) = sub_24F385E60();
  *(void *)(v5 + 208) = sub_24F385E50();
  long long v10 = a2[5];
  *(_OWORD *)(v5 + 80) = a2[4];
  *(_OWORD *)(v5 + 96) = v10;
  long long v11 = a2[7];
  *(_OWORD *)(v5 + 112) = a2[6];
  *(_OWORD *)(v5 + 128) = v11;
  long long v12 = a2[1];
  *(_OWORD *)(v5 + 16) = *a2;
  *(_OWORD *)(v5 + 32) = v12;
  long long v13 = a2[3];
  *(_OWORD *)(v5 + 48) = a2[2];
  *(_OWORD *)(v5 + 64) = v13;
  *(double *)(v5 + 144) = a4;
  *(double *)(v5 + 152) = a5;
  *(unsigned char *)(v5 + 160) = a3;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v5 + 216) = v14;
  void *v14 = v5;
  v14[1] = sub_24F381E24;
  return sub_24F382284((long long *)(v5 + 144));
}

uint64_t sub_24F381E24(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24F385E30();
    uint64_t v7 = v6;
    uint64_t v8 = sub_24F382220;
    uint64_t v9 = v5;
    uint64_t v10 = v7;
  }
  else
  {
    *(unsigned char *)(v4 + 161) = a1 & 1;
    uint64_t v11 = sub_24F385E30();
    uint64_t v10 = v12;
    *(void *)(v4 + 232) = v11;
    *(void *)(v4 + 240) = v12;
    uint64_t v8 = sub_24F381F88;
    uint64_t v9 = v11;
  }
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24F381F88()
{
  if (*(unsigned char *)(v0 + 161) == 1)
  {
    *(void *)(v0 + 168) = 0;
    *(void *)(v0 + 176) = 0;
    *(unsigned char *)(v0 + 184) = 2;
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v1;
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032C0);
    void *v1 = v0;
    v1[1] = sub_24F38209C;
    return MEMORY[0x270F252C8](v0 + 168, v2);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24F38209C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 240);
  uint64_t v3 = *(void *)(v1 + 232);
  return MEMORY[0x270FA2498](sub_24F3821BC, v3, v2);
}

uint64_t sub_24F3821BC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F382220()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F382284(long long *a1)
{
  *(void *)(v2 + 304) = v1;
  long long v3 = *a1;
  *(unsigned char *)(v2 + 233) = *((unsigned char *)a1 + 16);
  long long v4 = *v1;
  *(_OWORD *)(v2 + 312) = v3;
  *(_OWORD *)(v2 + 328) = v4;
  uint64_t v5 = (int *)*((void *)v1 + 4);
  *(void *)(v2 + 344) = v5;
  long long v6 = *(long long *)((char *)v1 + 56);
  *(_OWORD *)(v2 + 352) = *(long long *)((char *)v1 + 40);
  *(_OWORD *)(v2 + 368) = v6;
  *(void *)(v2 + 384) = *((void *)v1 + 9);
  long long v7 = v1[5];
  long long v8 = v1[7];
  *(_OWORD *)(v2 + 160) = v1[6];
  *(_OWORD *)(v2 + 176) = v8;
  *(_OWORD *)(v2 + 144) = v7;
  uint64_t v11 = (uint64_t (*)(void))((char *)v5 + *v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 392) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24F38239C;
  return v11();
}

uint64_t sub_24F38239C(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    long long v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6(0);
  }
  else
  {
    *(unsigned char *)(v4 + 234) = a1 & 1;
    return MEMORY[0x270FA2498](sub_24F3824F0, 0, 0);
  }
}

uint64_t sub_24F3824F0()
{
  if (*(unsigned char *)(v0 + 234) != 1)
  {
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24F385DF0();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A046A8);
    uint64_t v4 = sub_24F385DD0();
    os_log_type_t v5 = sub_24F385E90();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_15;
    }
    long long v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v6 = 0;
    long long v7 = "[TrainerTipUpsellMonitorFeature] Platform does not support tips upsell, skipping upsell";
    goto LABEL_14;
  }
  if (*(unsigned char *)(v0 + 233) == 1)
  {
    uint64_t v10 = (uint64_t (*)(void))(*(void *)(v0 + 328) + **(int **)(v0 + 328));
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v1;
    void *v1 = v0;
    v1[1] = sub_24F38275C;
    return v10();
  }
  if (qword_269A03150 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24F385DF0();
  __swift_project_value_buffer(v8, (uint64_t)qword_269A046A8);
  uint64_t v4 = sub_24F385DD0();
  os_log_type_t v5 = sub_24F385E90();
  if (os_log_type_enabled(v4, v5))
  {
    long long v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v6 = 0;
    long long v7 = "[TrainerTipUpsellMonitorFeature] Options do not contain upsell, skipping upsell";
LABEL_14:
    _os_log_impl(&dword_24F37B000, v4, v5, v7, v6, 2u);
    MEMORY[0x25335B8A0](v6, -1, -1);
  }
LABEL_15:

  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9(0);
}

uint64_t sub_24F38275C(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    long long v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6(0);
  }
  else
  {
    *(unsigned char *)(v4 + 235) = a1 & 1;
    return MEMORY[0x270FA2498](sub_24F3828B0, 0, 0);
  }
}

uint64_t sub_24F3828B0()
{
  if (*(unsigned char *)(v0 + 235))
  {
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24F385DF0();
    __swift_project_value_buffer(v1, (uint64_t)qword_269A046A8);
    uint64_t v2 = sub_24F385DD0();
    os_log_type_t v3 = sub_24F385E90();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_24F37B000, v2, v3, "[TrainerTipUpsellMonitorFeature] forcing tips upsell with user default, requesting upsell", v4, 2u);
      MEMORY[0x25335B8A0](v4, -1, -1);
    }

    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v5(1);
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 376) + **(int **)(v0 + 376));
    long long v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v7;
    void *v7 = v0;
    v7[1] = sub_24F382A88;
    return v8(v0 + 192);
  }
}

uint64_t sub_24F382A88()
{
  *(void *)(*(void *)v1 + 416) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24F383610;
  }
  else {
    uint64_t v2 = sub_24F382B9C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24F382B9C()
{
  uint64_t v1 = *(void *)(v0 + 192);
  *(void *)(v0 + 424) = v1;
  int v2 = *(unsigned __int8 *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  *(void *)(v0 + 432) = v4;
  *(void *)(v0 + 440) = v3;
  uint64_t v5 = *(void *)(v0 + 224);
  *(void *)(v0 + 448) = v5;
  int v6 = *(unsigned __int8 *)(v0 + 232);
  *(unsigned char *)(v0 + 236) = v6;
  if (v2 == 1)
  {
    if (v6)
    {
      uint64_t v20 = (uint64_t (*)(void))(*(void *)(v0 + 360) + **(int **)(v0 + 360));
      long long v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 456) = v7;
      void *v7 = v0;
      v7[1] = sub_24F382E54;
      return v20();
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 304);
      long long v15 = *(_OWORD *)(v0 + 344);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 328);
      long long v16 = *(_OWORD *)(v0 + 360);
      long long v17 = *(_OWORD *)(v0 + 376);
      *(_OWORD *)(v0 + 32) = *(_OWORD *)(v14 + 16);
      *(_OWORD *)(v0 + 48) = v15;
      *(_OWORD *)(v0 + 64) = v16;
      *(_OWORD *)(v0 + 80) = v17;
      long long v18 = *(_OWORD *)(v0 + 160);
      *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
      *(_OWORD *)(v0 + 112) = v18;
      *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 176);
      *(void *)(v0 + 240) = v1;
      *(unsigned char *)(v0 + 248) = 1;
      *(void *)(v0 + 256) = v4;
      *(void *)(v0 + 264) = v3;
      *(void *)(v0 + 272) = v5;
      *(unsigned char *)(v0 + 280) = 0;
      uint64_t v19 = (void *)swift_task_alloc();
      *(void *)(v0 + 472) = v19;
      *uint64_t v19 = v0;
      v19[1] = sub_24F3831E4;
      return sub_24F383DD8((void *)(v0 + 240));
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24F385DF0();
    __swift_project_value_buffer(v9, (uint64_t)qword_269A046A8);
    uint64_t v10 = sub_24F385DD0();
    os_log_type_t v11 = sub_24F385E90();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_24F37B000, v10, v11, "[TrainerTipUpsellMonitorFeature] native rules not enabled, requesting upsell", v12, 2u);
      MEMORY[0x25335B8A0](v12, -1, -1);
    }

    long long v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v13(1);
  }
}

uint64_t sub_24F382E54(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 464) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24F38317C;
  }
  else
  {
    *(unsigned char *)(v4 + 237) = a1;
    uint64_t v5 = sub_24F382F7C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24F382F7C()
{
  if (*(unsigned char *)(v0 + 237) == 1)
  {
    swift_bridgeObjectRelease();
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24F385DF0();
    __swift_project_value_buffer(v1, (uint64_t)qword_269A046A8);
    int v2 = sub_24F385DD0();
    os_log_type_t v3 = sub_24F385E90();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_24F37B000, v2, v3, "[TrainerTipUpsellMonitorFeature] subscription status not allowed, not requesting upsell", v4, 2u);
      MEMORY[0x25335B8A0](v4, -1, -1);
    }

    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5(0);
  }
  else
  {
    char v7 = *(unsigned char *)(v0 + 236);
    uint64_t v8 = *(void *)(v0 + 448);
    uint64_t v10 = *(void *)(v0 + 432);
    uint64_t v9 = *(void *)(v0 + 440);
    uint64_t v11 = *(void *)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 304);
    long long v13 = *(_OWORD *)(v0 + 344);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 328);
    long long v14 = *(_OWORD *)(v0 + 360);
    long long v15 = *(_OWORD *)(v0 + 376);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v12 + 16);
    *(_OWORD *)(v0 + 48) = v13;
    *(_OWORD *)(v0 + 64) = v14;
    *(_OWORD *)(v0 + 80) = v15;
    long long v16 = *(_OWORD *)(v0 + 160);
    *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v0 + 112) = v16;
    *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 176);
    *(void *)(v0 + 240) = v11;
    *(unsigned char *)(v0 + 248) = 1;
    *(void *)(v0 + 256) = v10;
    *(void *)(v0 + 264) = v9;
    *(void *)(v0 + 272) = v8;
    *(unsigned char *)(v0 + 280) = v7;
    long long v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v17;
    *long long v17 = v0;
    v17[1] = sub_24F3831E4;
    return sub_24F383DD8((void *)(v0 + 240));
  }
}

uint64_t sub_24F38317C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24F3831E4(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 480) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24F38362C;
  }
  else
  {
    *(unsigned char *)(v4 + 238) = a1 & 1;
    uint64_t v5 = sub_24F383310;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24F383310()
{
  int v1 = *(unsigned __int8 *)(v0 + 238);
  swift_bridgeObjectRelease();
  if (v1 != 1)
  {
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24F385DF0();
    __swift_project_value_buffer(v8, (uint64_t)qword_269A046A8);
    uint64_t v4 = sub_24F385DD0();
    os_log_type_t v9 = sub_24F385E90();
    if (os_log_type_enabled(v4, v9))
    {
      uint64_t v6 = swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      uint64_t v10 = "[TrainerTipUpsellMonitorFeature] interval not expired, not requesting upsell";
      uint64_t v11 = v4;
      os_log_type_t v12 = v9;
      long long v13 = (uint8_t *)v6;
      uint32_t v14 = 2;
LABEL_16:
      _os_log_impl(&dword_24F37B000, v11, v12, v10, v13, v14);
      uint64_t v7 = 0;
      goto LABEL_17;
    }
LABEL_18:
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  double v2 = *(double *)(v0 + 320);
  if (v2 <= 0.0 || *(double *)(v0 + 448) > *(double *)(v0 + 312) / v2)
  {
    if (qword_269A03150 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24F385DF0();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A046A8);
    uint64_t v4 = sub_24F385DD0();
    os_log_type_t v16 = sub_24F385E90();
    if (os_log_type_enabled(v4, v16))
    {
      uint64_t v18 = *(void *)(v0 + 312);
      uint64_t v17 = *(void *)(v0 + 320);
      uint64_t v6 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 134218240;
      *(void *)(v0 + 288) = v18;
      sub_24F385EA0();
      *(_WORD *)(v6 + 12) = 2048;
      *(void *)(v0 + 296) = v17;
      sub_24F385EA0();
      uint64_t v10 = "[TrainerTipUpsellMonitorFeature] minimum ratio complete not reached, not requesting upsell - elapsedTime = %"
            "f, duration = %f";
      uint64_t v11 = v4;
      os_log_type_t v12 = v16;
      long long v13 = (uint8_t *)v6;
      uint32_t v14 = 22;
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  if (qword_269A03150 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24F385DF0();
  __swift_project_value_buffer(v3, (uint64_t)qword_269A046A8);
  uint64_t v4 = sub_24F385DD0();
  os_log_type_t v5 = sub_24F385E90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_24F37B000, v4, v5, "[TrainerTipUpsellMonitorFeature] all checks passed, requesting upsell", (uint8_t *)v6, 2u);
    uint64_t v7 = 1;
LABEL_17:
    MEMORY[0x25335B8A0](v6, -1, -1);
    goto LABEL_20;
  }
  uint64_t v7 = 1;
LABEL_20:

  uint64_t v19 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v19(v7);
}

uint64_t sub_24F383610()
{
  return (*(uint64_t (**)(void))(v0 + 8))(0);
}

uint64_t sub_24F38362C()
{
  swift_bridgeObjectRelease();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24F383694(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F385DC0();
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = *(void *)(v4 - 8);
  *(void *)(v2 + 32) = swift_task_alloc();
  *(void *)(v2 + 40) = sub_24F385E60();
  *(void *)(v2 + 48) = sub_24F385E50();
  os_log_type_t v5 = *(int **)(a2 + 96);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a2 + 112);
  uint64_t v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 72) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24F3837E0;
  return v8();
}

uint64_t sub_24F3837E0()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F385E30();
  v2[11] = v4;
  v2[12] = v3;
  if (v0) {
    os_log_type_t v5 = sub_24F383C24;
  }
  else {
    os_log_type_t v5 = sub_24F383940;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F383940()
{
  int v1 = (int *)v0[7];
  sub_24F385DB0();
  os_log_type_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[13] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F383A20;
  uint64_t v3 = v0[4];
  return v5(v3);
}

uint64_t sub_24F383A20()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[2];
  if (v0)
  {
    MEMORY[0x25335B7F0](v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[11];
    uint64_t v8 = v3[12];
    uint64_t v9 = sub_24F38507C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[11];
    uint64_t v8 = v3[12];
    uint64_t v9 = sub_24F383BB4;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_24F383BB4()
{
  swift_release();
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F383C24()
{
  swift_release();
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F383C94()
{
  return objectdestroyTm(144);
}

uint64_t sub_24F383C9C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F385078;
  return sub_24F383694(a1, v1 + 16);
}

uint64_t sub_24F383D38(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F383DD8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A032D8);
  uint64_t v4 = swift_task_alloc();
  v2[2] = v4;
  uint64_t v5 = sub_24F385DC0();
  v2[3] = v5;
  v2[4] = *(void *)(v5 - 8);
  v2[5] = swift_task_alloc();
  v2[6] = swift_task_alloc();
  v2[7] = *a1;
  uint64_t v8 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 16) + **(int **)(v1 + 16));
  uint64_t v6 = (void *)swift_task_alloc();
  v2[8] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24F383F60;
  return v8(v4);
}

uint64_t sub_24F383F60()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24F3841BC;
  }
  else {
    uint64_t v2 = sub_24F384074;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24F384074()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24F384EB8(v3);
    BOOL v4 = 1;
  }
  else
  {
    double v5 = *(double *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v3, v1);
    sub_24F385DB0();
    sub_24F385DA0();
    double v9 = v8;
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v10(v7, v1);
    v10(v6, v1);
    BOOL v4 = v5 < v9;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v11(v4);
}

uint64_t sub_24F3841BC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24F384238(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1F2140);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2110) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24F385EE0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2110) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24F384F18(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24F3844A8()
{
  return objectdestroyTm(161);
}

uint64_t sub_24F3844B0(uint64_t a1)
{
  BOOL v4 = (_OWORD *)(v1 + 16);
  double v5 = *(double *)(v1 + 144);
  double v6 = *(double *)(v1 + 152);
  char v7 = *(unsigned char *)(v1 + 160);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24F384570;
  return sub_24F381D20(a1, v4, v7, v5, v6);
}

uint64_t sub_24F384570()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24F384664()
{
  return objectdestroyTm(144);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24F3846E8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F385078;
  return sub_24F381400(a1, v1 + 16);
}

unint64_t sub_24F384788()
{
  unint64_t result = qword_26B1F20E8;
  if (!qword_26B1F20E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20E8);
  }
  return result;
}

unint64_t sub_24F3847E0()
{
  unint64_t result = qword_26B1F20E0;
  if (!qword_26B1F20E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20E0);
  }
  return result;
}

unint64_t sub_24F384838()
{
  unint64_t result = qword_26B1F2100;
  if (!qword_26B1F2100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F2100);
  }
  return result;
}

unint64_t sub_24F384890()
{
  unint64_t result = qword_26B1F2108;
  if (!qword_26B1F2108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F2108);
  }
  return result;
}

uint64_t destroy for TrainerTipUpsellMonitorEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for TrainerTipUpsellMonitorEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v3 = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TrainerTipUpsellMonitorEnvironment(void *a1, void *a2)
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
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

_OWORD *assignWithTake for TrainerTipUpsellMonitorEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainerTipUpsellMonitorEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorFeature()
{
  return &type metadata for TrainerTipUpsellMonitorFeature;
}

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F384D74);
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

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorFeature.TaskIdentifier()
{
  return &type metadata for TrainerTipUpsellMonitorFeature.TaskIdentifier;
}

unint64_t sub_24F384DB0()
{
  unint64_t result = qword_26B1F20F8;
  if (!qword_26B1F20F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F20F8);
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

uint64_t sub_24F384EB8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F384F18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2110) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24F385EF0();
  __break(1u);
  return result;
}

BOOL static TrainerTipUpsellMonitorError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrainerTipUpsellMonitorError.hash(into:)()
{
  return sub_24F386000();
}

uint64_t TrainerTipUpsellMonitorError.hashValue.getter()
{
  return sub_24F386010();
}

unint64_t sub_24F38510C()
{
  unint64_t result = qword_269A032E0;
  if (!qword_269A032E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A032E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F38523CLL);
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

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorError()
{
  return &type metadata for TrainerTipUpsellMonitorError;
}

uint64_t TrainerTipUpsellMonitorLocalState.isActivated.getter()
{
  return *v0;
}

uint64_t TrainerTipUpsellMonitorLocalState.isActivated.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*TrainerTipUpsellMonitorLocalState.isActivated.modify())()
{
  return nullsub_1;
}

FitnessTrainerTips::TrainerTipUpsellMonitorLocalState __swiftcall TrainerTipUpsellMonitorLocalState.init(isActivated:)(FitnessTrainerTips::TrainerTipUpsellMonitorLocalState isActivated)
{
  v1->isActivated = isActivated.isActivated;
  return isActivated;
}

uint64_t sub_24F3852B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F385B2C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F3852DC(uint64_t a1)
{
  unint64_t v2 = sub_24F385488();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F385318(uint64_t a1)
{
  unint64_t v2 = sub_24F385488();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TrainerTipUpsellMonitorLocalState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032E8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F385488();
  sub_24F386030();
  sub_24F385F70();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24F385488()
{
  unint64_t result = qword_269A032F0;
  if (!qword_269A032F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A032F0);
  }
  return result;
}

uint64_t TrainerTipUpsellMonitorLocalState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F385488();
  sub_24F386020();
  if (!v2)
  {
    char v9 = sub_24F385F20();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24F385630@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TrainerTipUpsellMonitorLocalState.init(from:)(a1, a2);
}

uint64_t sub_24F385648(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A032E8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F385488();
  sub_24F386030();
  sub_24F385F70();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static TrainerTipUpsellMonitorLocalState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_24F385794(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F385918);
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

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorLocalState()
{
  return &type metadata for TrainerTipUpsellMonitorLocalState;
}

unsigned char *storeEnumTagSinglePayload for TrainerTipUpsellMonitorLocalState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3859ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorLocalState.CodingKeys()
{
  return &type metadata for TrainerTipUpsellMonitorLocalState.CodingKeys;
}

unint64_t sub_24F385A28()
{
  unint64_t result = qword_269A03300;
  if (!qword_269A03300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03300);
  }
  return result;
}

unint64_t sub_24F385A80()
{
  unint64_t result = qword_269A03308;
  if (!qword_269A03308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03308);
  }
  return result;
}

unint64_t sub_24F385AD8()
{
  unint64_t result = qword_269A03310;
  if (!qword_269A03310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A03310);
  }
  return result;
}

uint64_t sub_24F385B2C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6176697463417369 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F385FA0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F385BC4()
{
  return 0x6176697463417369;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchForceTrainerTipUpsellEnabled.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchLastTrainerTipUpsellViewedDate.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchPlatformSupportsTrainerTipUpsell.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchSubscriptionStatus.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.fetchTrainerTipUpsellConfiguration.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.makeTrainerTipPlayerDismissedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.presentTrainerTipUpsell.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_retain();
  return v1;
}

uint64_t TrainerTipUpsellMonitorEnvironment.updateLastTrainerTipUpsellViewedDate.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  return v1;
}

__n128 TrainerTipUpsellMonitorEnvironment.init(fetchForceTrainerTipUpsellEnabled:fetchLastTrainerTipUpsellViewedDate:fetchPlatformSupportsTrainerTipUpsell:fetchSubscriptionStatus:fetchTrainerTipUpsellConfiguration:makeTrainerTipPlayerDismissedStream:presentTrainerTipUpsell:updateLastTrainerTipUpsellViewedDate:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, __n128 a12, uint64_t a13, uint64_t a14)
{
  __n128 result = a12;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(__n128 *)(a9 + 96) = a12;
  *(void *)(a9 + 112) = a13;
  *(void *)(a9 + 120) = a14;
  return result;
}

ValueMetadata *type metadata accessor for TrainerTipUpsellMonitorEnvironment()
{
  return &type metadata for TrainerTipUpsellMonitorEnvironment;
}

uint64_t sub_24F385DA0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24F385DB0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24F385DC0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F385DD0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F385DE0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F385DF0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F385E10()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F385E20()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F385E30()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F385E50()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F385E60()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F385E70()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F385E80()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24F385E90()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24F385EA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24F385EB0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F385EC0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F385ED0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F385EE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F385EF0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F385F00()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F385F10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F385F20()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F385F30()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24F385F40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F385F50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F385F60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F385F70()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F385F80()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24F385F90()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F385FA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F385FB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24F385FC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24F385FD0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24F385FE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24F385FF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F386000()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F386010()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F386020()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F386030()
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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