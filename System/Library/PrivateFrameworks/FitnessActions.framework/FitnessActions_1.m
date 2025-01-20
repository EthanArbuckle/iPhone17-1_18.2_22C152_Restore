unint64_t sub_24E96D644()
{
  unint64_t result;

  result = qword_269909888;
  if (!qword_269909888)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909888);
  }
  return result;
}

unint64_t sub_24E96D698()
{
  unint64_t result = qword_269909890;
  if (!qword_269909890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909890);
  }
  return result;
}

uint64_t sub_24E96D6EC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24E96D734()
{
  unint64_t result = qword_269909898;
  if (!qword_269909898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909898);
  }
  return result;
}

unint64_t sub_24E96D788()
{
  unint64_t result = qword_2699098A0;
  if (!qword_2699098A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699098A0);
  }
  return result;
}

uint64_t sub_24E96D7DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_24E96D844()
{
  unint64_t result = qword_2699098D0;
  if (!qword_2699098D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699098D0);
  }
  return result;
}

uint64_t sub_24E96D898(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E96D900(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for SharingButtonLoadState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t type metadata accessor for SharingButtonState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SharingButtonState.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E96D994()
{
  return sub_24E96D6EC(&qword_26B1C3C60, (void (*)(uint64_t))type metadata accessor for SharingButtonLoadState);
}

uint64_t sub_24E96D9DC()
{
  return sub_24E96D6EC(qword_2699098F0, (void (*)(uint64_t))type metadata accessor for SharingDetail);
}

uint64_t sub_24E96DA24()
{
  return swift_getWitnessTable();
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingButtonLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for SharingDetail(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = *(int *)(v7 + 20);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      uint64_t v14 = sub_24E97D9E0();
      v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for SharingButtonLoadState(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharingDetail(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 20);
    uint64_t v5 = sub_24E97D9E0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *initializeWithCopy for SharingButtonLoadState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharingDetail(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    uint64_t v9 = *(int *)(v6 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24E97D9E0();
    v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithCopy for SharingButtonLoadState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharingDetail(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v17 = *(int *)(v6 + 20);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      uint64_t v20 = sub_24E97D9E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
      return a1;
    }
    sub_24E97217C((uint64_t)a1, type metadata accessor for SharingDetail);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v11 = *(int *)(v6 + 20);
  uint64_t v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24E97D9E0();
  v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

_OWORD *initializeWithTake for SharingButtonLoadState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharingDetail(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v8 = *(int *)(v6 + 20);
    int v9 = (char *)a1 + v8;
    int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24E97D9E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithTake for SharingButtonLoadState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharingDetail(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v16 = a2[1];
      *a1 = *a2;
      a1[1] = v16;
      swift_bridgeObjectRelease();
      uint64_t v17 = *(int *)(v6 + 20);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      uint64_t v20 = sub_24E97D9E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
      return a1;
    }
    sub_24E97217C((uint64_t)a1, type metadata accessor for SharingDetail);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v11 = *(int *)(v6 + 20);
  uint64_t v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24E97D9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingButtonLoadState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E96E340);
}

uint64_t sub_24E96E340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharingDetail(0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SharingButtonLoadState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E96E3C0);
}

uint64_t sub_24E96E3C0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for SharingDetail(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24E96E444(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharingDetail(0);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 2, v2);
}

uint64_t sub_24E96E4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharingDetail(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 2, v4);
}

uint64_t sub_24E96E51C()
{
  uint64_t result = type metadata accessor for SharingDetail(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingDetail(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_24E97D9E0();
    int v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for SharingDetail(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24E97D9E0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for SharingDetail(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24E97D9E0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for SharingDetail(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E97D9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for SharingDetail(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24E97D9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for SharingDetail(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24E97D9E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingDetail(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E96E944);
}

uint64_t sub_24E96E944(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24E97D9E0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SharingDetail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E96EA08);
}

uint64_t sub_24E96EA08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24E97D9E0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24E96EAB0()
{
  uint64_t result = sub_24E97D9E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24E96EB48()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_24E97DB20();
    if (v1 <= 0x3F)
    {
      sub_24E97DB00();
      if (v2 <= 0x3F)
      {
        sub_24E8D1CE4();
        if (v3 <= 0x3F)
        {
          type metadata accessor for SharingButtonLoadState(319);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

uint64_t *sub_24E96ECC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v64 = *(void *)(a3 + 16);
  uint64_t v68 = *(void *)(v64 - 8);
  uint64_t v3 = *(void *)(v68 + 64);
  uint64_t v4 = sub_24E97DB20();
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  int v5 = *(_DWORD *)(v62 + 80);
  uint64_t v60 = v3 + v5;
  uint64_t v6 = *(void *)(v62 + 64);
  uint64_t v65 = sub_24E97DB00();
  uint64_t v7 = *(void *)(v65 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  uint64_t v10 = v8;
  uint64_t v11 = v6 + v8;
  uint64_t v12 = *(void *)(v7 + 64);
  uint64_t v61 = v12 + v8;
  unint64_t v13 = (v12 + v10 + ((v11 + (v60 & ~(unint64_t)v5)) & ~v10)) & ~v10;
  if (v9) {
    size_t v14 = *(void *)(*(void *)(v65 - 8) + 64);
  }
  else {
    size_t v14 = v12 + 1;
  }
  if (v9 >= 2) {
    size_t v15 = v14;
  }
  else {
    size_t v15 = v14 + 1;
  }
  uint64_t v16 = sub_24E97D9E0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(_DWORD *)(v17 + 80);
  uint64_t v19 = v18 | 7 | (v5 | v8 | *(unsigned char *)(v68 + 80));
  if (((v18 + 16) & ~v18) + *(void *)(v17 + 64) + (((v18 | 7) + v15 + v13) & ~(v18 | 7)) <= 0x18
    && ((v5 | v8 | *(_DWORD *)(v68 + 80) | *(_DWORD *)(v17 + 80)) & 0x100000) == 0
    && v19 == 7)
  {
    uint64_t v56 = *(_DWORD *)(v17 + 80);
    uint64_t v57 = v18 | 7;
    size_t v54 = v15;
    int v58 = *(_DWORD *)(v17 + 84);
    uint64_t __n = ((v18 + 16) & ~v18) + *(void *)(*(void *)(v16 - 8) + 64);
    uint64_t v52 = v18 + 16;
    uint64_t v59 = *(void *)(v16 - 8);
    uint64_t v53 = v16;
    unint64_t v24 = ~(unint64_t)v8;
    uint64_t v55 = ~(v18 | 7);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v68 + 16))(a1, a2, v64);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v62 + 16))(((unint64_t)a1 + v60) & ~(unint64_t)v5, ((unint64_t)a2 + v60) & ~(unint64_t)v5, v63);
    unint64_t v25 = ((((unint64_t)a1 + v60) & ~(unint64_t)v5) + v11) & ~v10;
    unint64_t v26 = ((((unint64_t)a2 + v60) & ~(unint64_t)v5) + v11) & v24;
    v27 = *(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16);
    v27(v25, v26, v65);
    v28 = (void *)((v61 + v25) & v24);
    v29 = (unsigned __int8 *)((v61 + v26) & v24);
    unsigned int v50 = v9;
    if (v9 > 1)
    {
      uint64_t v37 = v9;
      uint64_t v30 = v7;
      unsigned int v38 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v7 + 48))(v29, v37, v65);
      v23 = a1;
      uint64_t v33 = v59;
      size_t v32 = v14;
      size_t v31 = v54;
      if (v38 >= 2)
      {
LABEL_36:
        memcpy(v28, v29, v31);
        int v39 = v58;
        uint64_t v40 = v56;
        uint64_t v41 = v57;
        uint64_t v42 = v55;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v30 = v7;
      size_t v32 = v14;
      size_t v31 = v15;
      v23 = a1;
      uint64_t v33 = v59;
      if (v29[v14])
      {
        int v34 = (v29[v14] - 1) << (8 * v14);
        if (v14 > 3) {
          int v34 = 0;
        }
        if (v14)
        {
          int v35 = v14 <= 3 ? v14 : 4;
          switch(v35)
          {
            case 2:
              int v36 = *(unsigned __int16 *)v29;
              break;
            case 3:
              int v36 = *(unsigned __int16 *)v29 | (v29[2] << 16);
              break;
            case 4:
              int v36 = *(_DWORD *)v29;
              break;
            default:
              int v36 = *v29;
              break;
          }
        }
        else
        {
          int v36 = 0;
        }
        if ((v36 | v34) != 0xFFFFFFFF) {
          goto LABEL_36;
        }
      }
    }
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v30 + 48))(v29, 1, v65))
    {
      memcpy(v28, v29, v32);
    }
    else
    {
      v27((unint64_t)v28, (unint64_t)v29, v65);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v28, 0, 1, v65);
    }
    int v39 = v58;
    uint64_t v40 = v56;
    uint64_t v41 = v57;
    uint64_t v42 = v55;
    uint64_t v33 = v59;
    if (v50 <= 1) {
      *((unsigned char *)v28 + v32) = 0;
    }
LABEL_37:
    uint64_t v43 = ~v40;
    v44 = (void *)(((unint64_t)v28 + v31 + v41) & v42);
    unint64_t v45 = (unint64_t)&v29[v31 + v41];
    v46 = (void *)(v45 & v42);
    if (v39 < 0)
    {
      if ((*(unsigned int (**)(unint64_t))(v33 + 48))(((unint64_t)v46 + v52) & v43))
      {
LABEL_41:
        memcpy(v44, v46, __n);
        return v23;
      }
    }
    else
    {
      unint64_t v47 = *(void *)((v45 & v42) + 8);
      if (v47 >= 0xFFFFFFFF) {
        LODWORD(v47) = -1;
      }
      if (v47 != -1) {
        goto LABEL_41;
      }
    }
    void *v44 = *v46;
    v44[1] = v46[1];
    v48 = *(void (**)(unint64_t, unint64_t, uint64_t))(v33 + 16);
    swift_bridgeObjectRetain();
    v48(((unint64_t)v44 + v52) & v43, ((unint64_t)v46 + v52) & v43, v53);
    return v23;
  }
  uint64_t v22 = *a2;
  *a1 = *a2;
  v23 = (uint64_t *)(v22 + ((v19 + 16) & ~v19));
  swift_retain();
  return v23;
}

uint64_t sub_24E96F21C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_24E97DB20();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v4 + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = sub_24E97DB00();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = (v8 + v9 + v13) & ~v13;
  size_t v15 = *(void (**)(unint64_t, uint64_t))(v11 + 8);
  v15(v14, v10);
  uint64_t v16 = *(void *)(v11 + 64);
  uint64_t v17 = (unsigned __int16 *)((v16 + v13 + v14) & ~v13);
  unsigned int v18 = *(_DWORD *)(v11 + 84);
  if (v18) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = v16 + 1;
  }
  if (v18 > 1)
  {
    if ((*(unsigned int (**)(unsigned __int16 *, void, uint64_t))(v12 + 48))(v17, *(unsigned int *)(v12 + 84), v10) >= 2)goto LABEL_23; {
    goto LABEL_21;
    }
  }
  if (!*((unsigned char *)v17 + v19)) {
    goto LABEL_21;
  }
  int v20 = (*((unsigned __int8 *)v17 + v19) - 1) << (8 * v19);
  if (v19 > 3) {
    int v20 = 0;
  }
  if (v19)
  {
    int v21 = v19 <= 3 ? v19 : 4;
    switch(v21)
    {
      case 2:
        int v22 = *v17;
        break;
      case 3:
        int v22 = *v17 | (*((unsigned __int8 *)v17 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)v17;
        break;
      default:
        int v22 = *(unsigned __int8 *)v17;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  if ((v22 | v20) == 0xFFFFFFFF)
  {
LABEL_21:
    if (!(*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v10)) {
      v15((unint64_t)v17, v10);
    }
  }
LABEL_23:
  uint64_t v23 = sub_24E97D9E0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v24;
  BOOL v26 = v18 >= 2;
  uint64_t v27 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v28 = v27 | 7;
  if (v26) {
    v29 = v17;
  }
  else {
    v29 = (unsigned __int16 *)((char *)v17 + 1);
  }
  uint64_t v30 = (char *)v29 + v19 + v28;
  uint64_t v31 = (unint64_t)v30 & ~v28;
  uint64_t v32 = ~v27;
  if ((*(_DWORD *)(v24 + 84) & 0x80000000) != 0)
  {
    uint64_t v36 = *(void *)(v23 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v24 + 48))((v27 + v31 + 16) & v32);
    uint64_t v25 = v36;
    if (result) {
      return result;
    }
    goto LABEL_32;
  }
  unint64_t v33 = *(void *)(((unint64_t)v30 & ~v28) + 8);
  if (v33 >= 0xFFFFFFFF) {
    LODWORD(v33) = -1;
  }
  uint64_t result = (v33 + 1);
  if (v33 == -1)
  {
LABEL_32:
    uint64_t v37 = v25;
    swift_bridgeObjectRelease();
    int v35 = *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8);
    return v35((v27 + v31 + 16) & v32, v23);
  }
  return result;
}

uint64_t sub_24E96F578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_24E97DB20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = a1;
  uint64_t v13 = (v6 + v10 + a1) & ~v10;
  uint64_t v14 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v13, v14, v7);
  uint64_t v15 = *(void *)(v9 + 48);
  uint64_t v16 = sub_24E97DB00();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v17;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (v15 + v19 + v13) & ~v19;
  uint64_t v21 = (v15 + v19 + v14) & ~v19;
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v46(v20, v21, v16);
  size_t v22 = *(void *)(v17 + 64);
  uint64_t v23 = (void *)((v22 + v19 + v20) & ~v19);
  uint64_t v24 = (unsigned __int16 *)((v22 + v19 + v21) & ~v19);
  unsigned int v25 = *(_DWORD *)(v17 + 84);
  if (v25) {
    size_t v26 = v22;
  }
  else {
    size_t v26 = v22 + 1;
  }
  if (v25 <= 1)
  {
    uint64_t v27 = v12;
    if (*((unsigned char *)v24 + v26))
    {
      int v28 = (*((unsigned __int8 *)v24 + v26) - 1) << (8 * v26);
      if (v26 > 3) {
        int v28 = 0;
      }
      if (v26)
      {
        int v29 = v26 <= 3 ? v26 : 4;
        switch(v29)
        {
          case 2:
            int v30 = *v24;
            break;
          case 3:
            int v30 = *v24 | (*((unsigned __int8 *)v24 + 2) << 16);
            break;
          case 4:
            int v30 = *(_DWORD *)v24;
            break;
          default:
            int v30 = *(unsigned __int8 *)v24;
            break;
        }
      }
      else
      {
        int v30 = 0;
      }
      if ((v30 | v28) != 0xFFFFFFFF) {
        goto LABEL_25;
      }
    }
LABEL_15:
    if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v18 + 48))(v24, 1, v16))
    {
      memcpy(v23, v24, v26);
      if (v25 > 1) {
        goto LABEL_29;
      }
    }
    else
    {
      v46((uint64_t)v23, (uint64_t)v24, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v23, 0, 1, v16);
      if (v25 > 1) {
        goto LABEL_29;
      }
    }
    *((unsigned char *)v23 + v26) = 0;
    goto LABEL_29;
  }
  uint64_t v27 = v12;
  if ((*(unsigned int (**)(unsigned __int16 *, void, uint64_t))(v18 + 48))(v24, *(unsigned int *)(v18 + 84), v16) < 2)goto LABEL_15; {
LABEL_25:
  }
  if (v25 >= 2) {
    size_t v31 = v26;
  }
  else {
    size_t v31 = v26 + 1;
  }
  memcpy(v23, v24, v31);
LABEL_29:
  if (v25 >= 2) {
    size_t v32 = v26;
  }
  else {
    size_t v32 = v26 + 1;
  }
  uint64_t v33 = sub_24E97D9E0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(unsigned __int8 *)(v34 + 80);
  size_t v36 = (v35 | 7) + v32;
  uint64_t v37 = (void *)(((unint64_t)v23 + v36) & ~(v35 | 7));
  unint64_t v38 = (unint64_t)v24 + v36;
  int v39 = (void *)(v38 & ~(v35 | 7));
  uint64_t v40 = ~v35;
  uint64_t v41 = v35 + 16;
  uint64_t v42 = *(void *)(v34 + 64);
  if ((*(_DWORD *)(v34 + 84) & 0x80000000) == 0)
  {
    unint64_t v43 = *(void *)((v38 & ~(v35 | 7)) + 8);
    if (v43 >= 0xFFFFFFFF) {
      LODWORD(v43) = -1;
    }
    if (v43 != -1) {
      goto LABEL_36;
    }
LABEL_38:
    *uint64_t v37 = *v39;
    v37[1] = v39[1];
    v44 = *(void (**)(unint64_t, unint64_t, uint64_t))(v34 + 16);
    swift_bridgeObjectRetain();
    v44(((unint64_t)v37 + v41) & v40, ((unint64_t)v39 + v41) & v40, v33);
    return v27;
  }
  if (!(*(unsigned int (**)(unint64_t))(v34 + 48))(((unint64_t)v39 + v41) & v40)) {
    goto LABEL_38;
  }
LABEL_36:
  memcpy(v37, v39, (v41 & ~v35) + v42);
  return v27;
}

uint64_t sub_24E96F988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_24E97DB20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v61 = a1;
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v7);
  uint64_t v13 = *(void *)(v9 + 40);
  uint64_t v14 = sub_24E97DB00();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = v15;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v13 + v17 + v11) & ~v17;
  uint64_t v19 = (v13 + v17 + v12) & ~v17;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 24);
  v20(v18, v19, v14);
  size_t v21 = *(void *)(v15 + 64);
  size_t v22 = (unsigned __int16 *)((v21 + v17 + v18) & ~v17);
  uint64_t v23 = (unsigned __int8 *)((v21 + v17 + v19) & ~v17);
  uint64_t v24 = *(unsigned int *)(v15 + 84);
  if (v24) {
    size_t v25 = v21;
  }
  else {
    size_t v25 = v21 + 1;
  }
  if (v24 <= 1)
  {
    char v26 = 8 * v25;
    if (*((unsigned char *)v22 + v25))
    {
      int v27 = (*((unsigned __int8 *)v22 + v25) - 1) << v26;
      if (v25 > 3) {
        int v27 = 0;
      }
      if (v25)
      {
        int v28 = v25 <= 3 ? v25 : 4;
        switch(v28)
        {
          case 2:
            int v29 = *v22;
            break;
          case 3:
            int v29 = *v22 | (*((unsigned __int8 *)v22 + 2) << 16);
            break;
          case 4:
            int v29 = *(_DWORD *)v22;
            break;
          default:
            int v29 = *(unsigned __int8 *)v22;
            break;
        }
      }
      else
      {
        int v29 = 0;
      }
      if ((v29 | v27) != 0xFFFFFFFF)
      {
        if (v23[v25])
        {
          int v33 = (v23[v25] - 1) << v26;
          if (v25 > 3) {
            int v33 = 0;
          }
          if (v25)
          {
            int v34 = v25 <= 3 ? v25 : 4;
            switch(v34)
            {
              case 2:
                int v35 = *(unsigned __int16 *)v23;
                break;
              case 3:
                int v35 = *(unsigned __int16 *)v23 | (v23[2] << 16);
                break;
              case 4:
                int v35 = *(_DWORD *)v23;
                break;
              default:
                int v35 = *v23;
                break;
            }
          }
          else
          {
            int v35 = 0;
          }
          if ((v35 | v33) != 0xFFFFFFFF) {
            goto LABEL_62;
          }
        }
LABEL_66:
        if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v16 + 48))(v23, 1, v14))
        {
          memcpy(v22, v23, v25);
          if (v24 > 1) {
            goto LABEL_69;
          }
        }
        else
        {
          (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v16 + 16))(v22, v23, v14);
          (*(void (**)(unsigned __int16 *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v14);
          if (v24 > 1) {
            goto LABEL_69;
          }
        }
        *((unsigned char *)v22 + v25) = 0;
        goto LABEL_69;
      }
    }
    uint64_t v60 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v20;
    if (v23[v25])
    {
      int v36 = (v23[v25] - 1) << v26;
      if (v25 > 3) {
        int v36 = 0;
      }
      if (v25)
      {
        int v37 = v25 <= 3 ? v25 : 4;
        switch(v37)
        {
          case 2:
            int v38 = *(unsigned __int16 *)v23;
            break;
          case 3:
            int v38 = *(unsigned __int16 *)v23 | (v23[2] << 16);
            break;
          case 4:
            int v38 = *(_DWORD *)v23;
            break;
          default:
            int v38 = *v23;
            break;
        }
      }
      else
      {
        int v38 = 0;
      }
      if ((v38 | v36) != 0xFFFFFFFF)
      {
        int v30 = *(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
LABEL_49:
        if (!v30(v22, 1, v14)) {
          (*(void (**)(unsigned __int16 *, uint64_t))(v16 + 8))(v22, v14);
        }
        goto LABEL_62;
      }
    }
LABEL_51:
    int v39 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
    int v40 = v39(v22, 1, v14);
    int v41 = v39((unsigned __int16 *)v23, 1, v14);
    if (v40)
    {
      if (!v41)
      {
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v16 + 16))(v22, v23, v14);
        (*(void (**)(unsigned __int16 *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v14);
        goto LABEL_69;
      }
    }
    else
    {
      if (!v41)
      {
        v60(v22, v23, v14);
        goto LABEL_69;
      }
      (*(void (**)(unsigned __int16 *, uint64_t))(v16 + 8))(v22, v14);
    }
    memcpy(v22, v23, v25);
    goto LABEL_69;
  }
  uint64_t v60 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v20;
  int v30 = *(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
  unsigned int v31 = v30(v22, v24, v14);
  unsigned int v32 = v30((unsigned __int16 *)v23, v24, v14);
  if (v31 < 2)
  {
    if (v32 >= 2) {
      goto LABEL_49;
    }
    goto LABEL_51;
  }
  if (v32 < 2) {
    goto LABEL_66;
  }
LABEL_62:
  if (v24 >= 2) {
    size_t v42 = v25;
  }
  else {
    size_t v42 = v25 + 1;
  }
  memcpy(v22, v23, v42);
LABEL_69:
  if (v24 >= 2) {
    size_t v43 = v25;
  }
  else {
    size_t v43 = v25 + 1;
  }
  uint64_t v44 = sub_24E97D9E0();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(unsigned __int8 *)(v45 + 80);
  size_t v47 = (v46 | 7) + v43;
  v48 = (void *)(((unint64_t)v22 + v47) & ~(v46 | 7));
  v49 = (void *)((unint64_t)&v23[v47] & ~(v46 | 7));
  uint64_t v50 = *(unsigned int *)(v45 + 84);
  uint64_t v51 = ~v46;
  uint64_t v52 = v46 + 16;
  size_t v53 = ((v46 + 16) & ~v46) + *(void *)(v45 + 64);
  if ((v50 & 0x80000000) != 0)
  {
    uint64_t v56 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v45 + 48);
    int v57 = v56(((unint64_t)v48 + v52) & v51, v50, v44);
    int v55 = v56(((unint64_t)v49 + v52) & v51, v50, v44);
    if (!v57)
    {
LABEL_76:
      if (!v55)
      {
        void *v48 = *v49;
        v48[1] = v49[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 24))(((unint64_t)v48 + v52) & v51, ((unint64_t)v49 + v52) & v51, v44);
        return v61;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v45 + 8))(((unint64_t)v48 + v52) & v51, v44);
      goto LABEL_80;
    }
  }
  else
  {
    unint64_t v54 = *(void *)(((unint64_t)&v23[v47] & ~(v46 | 7)) + 8);
    if (v54 >= 0xFFFFFFFF) {
      LODWORD(v54) = -1;
    }
    int v55 = v54 + 1;
    if (v48[1] > 0xFFFFFFFEuLL) {
      goto LABEL_76;
    }
  }
  if (!v55)
  {
    void *v48 = *v49;
    v48[1] = v49[1];
    int v58 = *(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 16);
    swift_bridgeObjectRetain();
    v58(((unint64_t)v48 + v52) & v51, ((unint64_t)v49 + v52) & v51, v44);
    return v61;
  }
LABEL_80:
  memcpy(v48, v49, v53);
  return v61;
}

uint64_t sub_24E9700BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_24E97DB20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = a1;
  uint64_t v13 = (v6 + v10 + a1) & ~v10;
  uint64_t v14 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v13, v14, v7);
  uint64_t v15 = *(void *)(v9 + 32);
  uint64_t v16 = sub_24E97DB00();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v17;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (v15 + v19 + v13) & ~v19;
  uint64_t v21 = (v15 + v19 + v14) & ~v19;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32);
  v45(v20, v21, v16);
  size_t v22 = *(void *)(v17 + 64);
  uint64_t v23 = (void *)((v22 + v19 + v20) & ~v19);
  uint64_t v24 = (unsigned __int16 *)((v22 + v19 + v21) & ~v19);
  unsigned int v25 = *(_DWORD *)(v17 + 84);
  if (v25) {
    size_t v26 = v22;
  }
  else {
    size_t v26 = v22 + 1;
  }
  if (v25 <= 1)
  {
    uint64_t v27 = v12;
    if (*((unsigned char *)v24 + v26))
    {
      int v28 = (*((unsigned __int8 *)v24 + v26) - 1) << (8 * v26);
      if (v26 > 3) {
        int v28 = 0;
      }
      if (v26)
      {
        int v29 = v26 <= 3 ? v26 : 4;
        switch(v29)
        {
          case 2:
            int v30 = *v24;
            break;
          case 3:
            int v30 = *v24 | (*((unsigned __int8 *)v24 + 2) << 16);
            break;
          case 4:
            int v30 = *(_DWORD *)v24;
            break;
          default:
            int v30 = *(unsigned __int8 *)v24;
            break;
        }
      }
      else
      {
        int v30 = 0;
      }
      if ((v30 | v28) != 0xFFFFFFFF) {
        goto LABEL_25;
      }
    }
LABEL_15:
    if ((*(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v18 + 48))(v24, 1, v16))
    {
      memcpy(v23, v24, v26);
      if (v25 > 1) {
        goto LABEL_29;
      }
    }
    else
    {
      v45((uint64_t)v23, (uint64_t)v24, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v23, 0, 1, v16);
      if (v25 > 1) {
        goto LABEL_29;
      }
    }
    *((unsigned char *)v23 + v26) = 0;
    goto LABEL_29;
  }
  uint64_t v27 = v12;
  if ((*(unsigned int (**)(unsigned __int16 *, void, uint64_t))(v18 + 48))(v24, *(unsigned int *)(v18 + 84), v16) < 2)goto LABEL_15; {
LABEL_25:
  }
  if (v25 >= 2) {
    size_t v31 = v26;
  }
  else {
    size_t v31 = v26 + 1;
  }
  memcpy(v23, v24, v31);
LABEL_29:
  if (v25 >= 2) {
    size_t v32 = v26;
  }
  else {
    size_t v32 = v26 + 1;
  }
  uint64_t v33 = sub_24E97D9E0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(unsigned __int8 *)(v34 + 80);
  size_t v36 = (v35 | 7) + v32;
  int v37 = (_OWORD *)(((unint64_t)v23 + v36) & ~(v35 | 7));
  unint64_t v38 = (unint64_t)v24 + v36;
  int v39 = (_OWORD *)(v38 & ~(v35 | 7));
  uint64_t v40 = ~v35;
  uint64_t v41 = v35 + 16;
  uint64_t v42 = *(void *)(v34 + 64);
  if ((*(_DWORD *)(v34 + 84) & 0x80000000) == 0)
  {
    unint64_t v43 = *(void *)((v38 & ~(v35 | 7)) + 8);
    if (v43 >= 0xFFFFFFFF) {
      LODWORD(v43) = -1;
    }
    if (v43 != -1) {
      goto LABEL_36;
    }
LABEL_38:
    *int v37 = *v39;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v34 + 32))(((unint64_t)v37 + v41) & v40, ((unint64_t)v39 + v41) & v40, v33);
    return v27;
  }
  if (!(*(unsigned int (**)(unint64_t))(v34 + 48))(((unint64_t)v39 + v41) & v40)) {
    goto LABEL_38;
  }
LABEL_36:
  memcpy(v37, v39, (v41 & ~v35) + v42);
  return v27;
}

uint64_t sub_24E9704B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_24E97DB20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v60 = a1;
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
  uint64_t v13 = *(void *)(v9 + 24);
  uint64_t v14 = sub_24E97DB00();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = v15;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v13 + v17 + v11) & ~v17;
  uint64_t v19 = (v13 + v17 + v12) & ~v17;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40);
  v20(v18, v19, v14);
  size_t v21 = *(void *)(v15 + 64);
  size_t v22 = (unsigned __int16 *)((v21 + v17 + v18) & ~v17);
  uint64_t v23 = (unsigned __int8 *)((v21 + v17 + v19) & ~v17);
  uint64_t v24 = *(unsigned int *)(v15 + 84);
  if (v24) {
    size_t v25 = v21;
  }
  else {
    size_t v25 = v21 + 1;
  }
  if (v24 <= 1)
  {
    char v26 = 8 * v25;
    if (*((unsigned char *)v22 + v25))
    {
      int v27 = (*((unsigned __int8 *)v22 + v25) - 1) << v26;
      if (v25 > 3) {
        int v27 = 0;
      }
      if (v25)
      {
        int v28 = v25 <= 3 ? v25 : 4;
        switch(v28)
        {
          case 2:
            int v29 = *v22;
            break;
          case 3:
            int v29 = *v22 | (*((unsigned __int8 *)v22 + 2) << 16);
            break;
          case 4:
            int v29 = *(_DWORD *)v22;
            break;
          default:
            int v29 = *(unsigned __int8 *)v22;
            break;
        }
      }
      else
      {
        int v29 = 0;
      }
      if ((v29 | v27) != 0xFFFFFFFF)
      {
        if (v23[v25])
        {
          int v33 = (v23[v25] - 1) << v26;
          if (v25 > 3) {
            int v33 = 0;
          }
          if (v25)
          {
            int v34 = v25 <= 3 ? v25 : 4;
            switch(v34)
            {
              case 2:
                int v35 = *(unsigned __int16 *)v23;
                break;
              case 3:
                int v35 = *(unsigned __int16 *)v23 | (v23[2] << 16);
                break;
              case 4:
                int v35 = *(_DWORD *)v23;
                break;
              default:
                int v35 = *v23;
                break;
            }
          }
          else
          {
            int v35 = 0;
          }
          if ((v35 | v33) != 0xFFFFFFFF) {
            goto LABEL_62;
          }
        }
LABEL_66:
        if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v16 + 48))(v23, 1, v14))
        {
          memcpy(v22, v23, v25);
          if (v24 > 1) {
            goto LABEL_69;
          }
        }
        else
        {
          (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v16 + 32))(v22, v23, v14);
          (*(void (**)(unsigned __int16 *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v14);
          if (v24 > 1) {
            goto LABEL_69;
          }
        }
        *((unsigned char *)v22 + v25) = 0;
        goto LABEL_69;
      }
    }
    uint64_t v59 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v20;
    if (v23[v25])
    {
      int v36 = (v23[v25] - 1) << v26;
      if (v25 > 3) {
        int v36 = 0;
      }
      if (v25)
      {
        int v37 = v25 <= 3 ? v25 : 4;
        switch(v37)
        {
          case 2:
            int v38 = *(unsigned __int16 *)v23;
            break;
          case 3:
            int v38 = *(unsigned __int16 *)v23 | (v23[2] << 16);
            break;
          case 4:
            int v38 = *(_DWORD *)v23;
            break;
          default:
            int v38 = *v23;
            break;
        }
      }
      else
      {
        int v38 = 0;
      }
      if ((v38 | v36) != 0xFFFFFFFF)
      {
        int v30 = *(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
LABEL_49:
        if (!v30(v22, 1, v14)) {
          (*(void (**)(unsigned __int16 *, uint64_t))(v16 + 8))(v22, v14);
        }
        goto LABEL_62;
      }
    }
LABEL_51:
    int v39 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
    int v40 = v39(v22, 1, v14);
    int v41 = v39((unsigned __int16 *)v23, 1, v14);
    if (v40)
    {
      if (!v41)
      {
        (*(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v16 + 32))(v22, v23, v14);
        (*(void (**)(unsigned __int16 *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v14);
        goto LABEL_69;
      }
    }
    else
    {
      if (!v41)
      {
        v59(v22, v23, v14);
        goto LABEL_69;
      }
      (*(void (**)(unsigned __int16 *, uint64_t))(v16 + 8))(v22, v14);
    }
    memcpy(v22, v23, v25);
    goto LABEL_69;
  }
  uint64_t v59 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v20;
  int v30 = *(unsigned int (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
  unsigned int v31 = v30(v22, v24, v14);
  unsigned int v32 = v30((unsigned __int16 *)v23, v24, v14);
  if (v31 < 2)
  {
    if (v32 >= 2) {
      goto LABEL_49;
    }
    goto LABEL_51;
  }
  if (v32 < 2) {
    goto LABEL_66;
  }
LABEL_62:
  if (v24 >= 2) {
    size_t v42 = v25;
  }
  else {
    size_t v42 = v25 + 1;
  }
  memcpy(v22, v23, v42);
LABEL_69:
  if (v24 >= 2) {
    size_t v43 = v25;
  }
  else {
    size_t v43 = v25 + 1;
  }
  uint64_t v44 = sub_24E97D9E0();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(unsigned __int8 *)(v45 + 80);
  size_t v47 = (v46 | 7) + v43;
  v48 = (void *)(((unint64_t)v22 + v47) & ~(v46 | 7));
  v49 = (void *)((unint64_t)&v23[v47] & ~(v46 | 7));
  uint64_t v50 = *(unsigned int *)(v45 + 84);
  uint64_t v51 = ~v46;
  uint64_t v52 = v46 + 16;
  size_t v53 = ((v46 + 16) & ~v46) + *(void *)(v45 + 64);
  if ((v50 & 0x80000000) != 0)
  {
    uint64_t v56 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v45 + 48);
    int v57 = v56(((unint64_t)v48 + v52) & v51, v50, v44);
    int v55 = v56(((unint64_t)v49 + v52) & v51, v50, v44);
    if (!v57)
    {
LABEL_76:
      if (!v55)
      {
        void *v48 = *v49;
        v48[1] = v49[1];
        swift_bridgeObjectRelease();
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 40))(((unint64_t)v48 + v52) & v51, ((unint64_t)v49 + v52) & v51, v44);
        return v60;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v45 + 8))(((unint64_t)v48 + v52) & v51, v44);
      goto LABEL_80;
    }
  }
  else
  {
    unint64_t v54 = *(void *)(((unint64_t)&v23[v47] & ~(v46 | 7)) + 8);
    if (v54 >= 0xFFFFFFFF) {
      LODWORD(v54) = -1;
    }
    int v55 = v54 + 1;
    if (v48[1] > 0xFFFFFFFEuLL) {
      goto LABEL_76;
    }
  }
  if (!v55)
  {
    *(_OWORD *)v48 = *(_OWORD *)v49;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 32))(((unint64_t)v48 + v52) & v51, ((unint64_t)v49 + v52) & v51, v44);
    return v60;
  }
LABEL_80:
  memcpy(v48, v49, v53);
  return v60;
}

uint64_t sub_24E970BD0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v53 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v53 - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v51 = sub_24E97DB20();
  uint64_t v6 = *(void *)(v51 - 8);
  unsigned int v52 = *(_DWORD *)(v6 + 84);
  unsigned int v54 = v5;
  if (v52 <= v5) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v50 = sub_24E97DB00();
  uint64_t v8 = *(void *)(v50 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  int v11 = v9 - 1;
  if (!v9) {
    int v11 = 0;
  }
  unsigned int v12 = v11 - 1;
  BOOL v13 = v9 < 2;
  if (v9 < 2) {
    unsigned int v12 = 0;
  }
  unsigned int v49 = v12;
  if (v12 <= v10) {
    unsigned int v14 = v10;
  }
  else {
    unsigned int v14 = v12;
  }
  uint64_t v15 = *(void *)(sub_24E97D9E0() - 8);
  uint64_t v16 = v15;
  unsigned int v17 = *(_DWORD *)(v15 + 84);
  if (v17 <= 0x7FFFFFFF) {
    int v18 = 0x7FFFFFFF;
  }
  else {
    int v18 = *(_DWORD *)(v15 + 84);
  }
  unsigned int v19 = v18 - 2;
  if (v19 <= v14) {
    unsigned int v19 = v14;
  }
  uint64_t v20 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v21 = *(void *)(v6 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = *(void *)(v8 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v25 = *(void *)(v15 + 64);
  if (v9) {
    BOOL v26 = v9 < 2;
  }
  else {
    BOOL v26 = v13 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v27 = *(void *)(v4 + 64) + v20;
  uint64_t v28 = v23 + v22;
  uint64_t v29 = v24 | 7;
  uint64_t v30 = v24 + 16;
  unsigned int v31 = a1;
  if (a2 <= v19) {
    goto LABEL_42;
  }
  uint64_t v32 = (v30 & ~v24) + v25 + ((v26 + v23 + v29 + ((v28 + ((v21 + v22 + (v27 & ~v20)) & ~v22)) & ~v22)) & ~v29);
  char v33 = 8 * v32;
  if (v32 > 3) {
    goto LABEL_25;
  }
  unsigned int v35 = ((a2 - v19 + ~(-1 << v33)) >> v33) + 1;
  if (HIWORD(v35))
  {
    int v34 = *(_DWORD *)((char *)a1 + v32);
    if (!v34) {
      goto LABEL_42;
    }
    goto LABEL_32;
  }
  if (v35 > 0xFF)
  {
    int v34 = *(unsigned __int16 *)((char *)a1 + v32);
    if (!*(unsigned __int16 *)((char *)a1 + v32)) {
      goto LABEL_42;
    }
    goto LABEL_32;
  }
  if (v35 >= 2)
  {
LABEL_25:
    int v34 = *((unsigned __int8 *)a1 + v32);
    if (!*((unsigned char *)a1 + v32)) {
      goto LABEL_42;
    }
LABEL_32:
    int v36 = (v34 - 1) << v33;
    if (v32 > 3) {
      int v36 = 0;
    }
    if (v32)
    {
      if (v32 <= 3) {
        int v37 = v32;
      }
      else {
        int v37 = 4;
      }
      switch(v37)
      {
        case 2:
          int v38 = *a1;
          break;
        case 3:
          int v38 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v38 = *(_DWORD *)a1;
          break;
        default:
          int v38 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v38 = 0;
    }
    return v19 + (v38 | v36) + 1;
  }
LABEL_42:
  if (v54 == v19)
  {
    uint64_t v39 = v53;
    int v40 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v4 + 48);
    uint64_t v41 = v54;
    return v40(v31, v41, v39);
  }
  unsigned int v31 = (unsigned __int16 *)(((unint64_t)a1 + v27) & ~v20);
  if (v52 == v19)
  {
    int v40 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
    uint64_t v41 = v52;
    uint64_t v39 = v51;
    goto LABEL_50;
  }
  unsigned int v31 = (unsigned __int16 *)(((unint64_t)v31 + v21 + v22) & ~v22);
  if (v9 == v19)
  {
    int v40 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v41 = v9;
    uint64_t v39 = v50;
LABEL_50:
    return v40(v31, v41, v39);
  }
  unint64_t v43 = ((unint64_t)v31 + v28) & ~v22;
  if (v49 == v19)
  {
    if (v9 < 2) {
      return 0;
    }
    unsigned int v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v43, v9, v50);
    BOOL v45 = v44 >= 2;
    uint64_t result = v44 - 2;
    if (result == 0 || !v45) {
      return 0;
    }
  }
  else
  {
    unint64_t v46 = v29 + v13 + v23 + (v9 == 0) + v43;
    if ((v17 & 0x80000000) != 0)
    {
      unsigned int v48 = (*(uint64_t (**)(unint64_t))(v16 + 48))((v30 + (v46 & ~v29)) & ~v24);
    }
    else
    {
      unint64_t v47 = *(void *)((v46 & ~v29) + 8);
      if (v47 >= 0xFFFFFFFF) {
        LODWORD(v47) = -1;
      }
      unsigned int v48 = v47 + 1;
    }
    if (v48 >= 3) {
      return v48 - 2;
    }
    else {
      return 0;
    }
  }
  return result;
}

void sub_24E971098(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v69 = *(void *)(a4 + 16);
  uint64_t v4 = *(void *)(v69 - 8);
  uint64_t v68 = v4;
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  uint64_t v66 = sub_24E97DB20();
  uint64_t v6 = *(void *)(v66 - 8);
  uint64_t v74 = v6;
  unsigned int v67 = *(_DWORD *)(v6 + 84);
  if (v67 <= v5) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v65 = sub_24E97DB00();
  uint64_t v8 = *(void *)(v65 - 8);
  uint64_t v73 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  unsigned int v11 = v9 - 1;
  if (!v9) {
    unsigned int v11 = 0;
  }
  unsigned int v63 = v11;
  unsigned int v12 = v11 - 1;
  BOOL v13 = v9 < 2;
  if (v9 < 2) {
    unsigned int v12 = 0;
  }
  unsigned int v64 = v12;
  if (v12 <= v10) {
    unsigned int v14 = v10;
  }
  else {
    unsigned int v14 = v12;
  }
  uint64_t v15 = sub_24E97D9E0();
  unsigned int v16 = 0;
  uint64_t v17 = *(void *)(v15 - 8);
  unsigned int v18 = *(_DWORD *)(v17 + 84);
  uint64_t v19 = *(void *)(v4 + 64);
  uint64_t v20 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v21 = *(void *)(v6 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = *(void *)(v8 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v17 + 80);
  if (v18 <= 0x7FFFFFFF) {
    unsigned int v25 = 0x7FFFFFFF;
  }
  else {
    unsigned int v25 = *(_DWORD *)(v17 + 84);
  }
  if (v25 - 2 <= v14) {
    unsigned int v26 = v14;
  }
  else {
    unsigned int v26 = v25 - 2;
  }
  uint64_t v27 = v19 + v20;
  uint64_t v28 = v23 + v22;
  uint64_t v29 = (v23 + v22 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & ~v22;
  uint64_t v30 = v24 | 7;
  uint64_t v31 = v24 + 16;
  size_t v32 = ((v24 + 16) & ~v24) + *(void *)(*(void *)(v15 - 8) + 64);
  if (v9) {
    BOOL v33 = v9 < 2;
  }
  else {
    BOOL v33 = v13 + 1;
  }
  size_t v34 = ((v33 + v23 + v30 + v29) & ~v30) + v32;
  if (a3 > v26)
  {
    if (v34 <= 3)
    {
      unsigned int v35 = ((a3 - v26 + ~(-1 << (8 * v34))) >> (8 * v34)) + 1;
      if (HIWORD(v35))
      {
        unsigned int v16 = 4;
      }
      else if (v35 >= 0x100)
      {
        unsigned int v16 = 2;
      }
      else
      {
        unsigned int v16 = v35 > 1;
      }
    }
    else
    {
      unsigned int v16 = 1;
    }
  }
  if (v26 < a2)
  {
    unsigned int v36 = ~v26 + a2;
    if (v34 < 4)
    {
      int v39 = (v36 >> (8 * v34)) + 1;
      int v37 = a1;
      if (v34)
      {
        unsigned int v45 = v16;
        int v46 = v36 & ~(-1 << (8 * v34));
        bzero(a1, v34);
        if (v34 == 3)
        {
          *(_WORD *)a1 = v46;
          a1[2] = BYTE2(v46);
          unsigned int v16 = v45;
        }
        else
        {
          unsigned int v16 = v45;
          if (v34 == 2) {
            *(_WORD *)a1 = v46;
          }
          else {
            *a1 = v46;
          }
        }
      }
    }
    else
    {
      int v37 = a1;
      unsigned int v38 = v16;
      bzero(a1, v34);
      unsigned int v16 = v38;
      *(_DWORD *)a1 = v36;
      int v39 = 1;
    }
    switch(v16)
    {
      case 1u:
        v37[v34] = v39;
        return;
      case 2u:
        *(_WORD *)&v37[v34] = v39;
        return;
      case 3u:
        goto LABEL_112;
      case 4u:
        *(_DWORD *)&v37[v34] = v39;
        return;
      default:
        return;
    }
  }
  uint64_t v40 = ~v20;
  uint64_t v41 = ~v22;
  uint64_t v42 = ~v24;
  uint64_t v43 = v16;
  unsigned int v44 = a1;
  switch(v43)
  {
    case 1:
      a1[v34] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_43;
    case 2:
      *(_WORD *)&a1[v34] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_43;
    case 3:
LABEL_112:
      __break(1u);
      JUMPOUT(0x24E971774);
    case 4:
      *(_DWORD *)&a1[v34] = 0;
      goto LABEL_42;
    default:
LABEL_42:
      if (!a2) {
        return;
      }
LABEL_43:
      if (v5 == v26)
      {
        uint64_t v47 = v69;
        unsigned int v48 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v68 + 56);
        uint64_t v49 = a2;
        uint64_t v50 = v5;
LABEL_52:
        v48(v44, v49, v50, v47);
        return;
      }
      unsigned int v44 = (unsigned char *)((unint64_t)&a1[v27] & v40);
      if (v67 == v26)
      {
        unsigned int v48 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v74 + 56);
        uint64_t v49 = a2;
        uint64_t v50 = v67;
        uint64_t v47 = v66;
        goto LABEL_52;
      }
      unsigned int v44 = (unsigned char *)((unint64_t)&v44[v21 + v22] & v41);
      if (v9 == v26)
      {
        unsigned int v48 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v73 + 56);
        uint64_t v49 = a2;
LABEL_51:
        uint64_t v50 = v9;
        uint64_t v47 = v65;
        goto LABEL_52;
      }
      unint64_t v51 = (unint64_t)&v44[v28] & v41;
      if (v64 == v26)
      {
        if (v9) {
          size_t v52 = v23;
        }
        else {
          size_t v52 = (v23 + 1);
        }
        if (a2 + 1 <= v63)
        {
          if (a2 == -1 || v9 < 2) {
            return;
          }
          uint64_t v49 = a2 + 2;
          unsigned int v48 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v73 + 56);
          unsigned int v44 = (unsigned char *)((unint64_t)&v44[v28] & v41);
          goto LABEL_51;
        }
        if (v52 <= 3) {
          int v53 = ~(-1 << (8 * v52));
        }
        else {
          int v53 = -1;
        }
        if (v52)
        {
          int v54 = v53 & (a2 - v63);
          if (v52 <= 3) {
            int v55 = v52;
          }
          else {
            int v55 = 4;
          }
          bzero((void *)((unint64_t)&v44[v28] & v41), v52);
          switch(v55)
          {
            case 2:
              *(_WORD *)unint64_t v51 = v54;
              break;
            case 3:
              *(_WORD *)unint64_t v51 = v54;
              *(unsigned char *)(v51 + 2) = BYTE2(v54);
              break;
            case 4:
              *(_DWORD *)unint64_t v51 = v54;
              break;
            default:
              *(unsigned char *)unint64_t v51 = v54;
              break;
          }
        }
      }
      else
      {
        uint64_t v56 = (unsigned char *)((v30 + v13 + v23 + (v9 == 0) + v51) & ~v30);
        if (v25 - 2 >= a2)
        {
          if (a2 + 2 <= v25)
          {
            if (a2 != -2)
            {
              if ((v18 & 0x80000000) != 0)
              {
                uint64_t v62 = *(void (**)(unint64_t, void))(v17 + 56);
                v62((unint64_t)&v56[v31] & v42, a2 + 2);
              }
              else if (((a2 + 2) & 0x80000000) != 0)
              {
                *(void *)uint64_t v56 = a2 - 2147483646;
                *((void *)v56 + 1) = 0;
              }
              else
              {
                *((void *)v56 + 1) = a2 + 1;
              }
            }
          }
          else
          {
            if (v32 <= 3) {
              int v60 = ~(-1 << (8 * v32));
            }
            else {
              int v60 = -1;
            }
            if (v32)
            {
              int v58 = v60 & (a2 - v25 + 1);
              if (v32 <= 3) {
                int v61 = v32;
              }
              else {
                int v61 = 4;
              }
              bzero(v56, v32);
              switch(v61)
              {
                case 2:
LABEL_102:
                  *(_WORD *)uint64_t v56 = v58;
                  break;
                case 3:
LABEL_103:
                  *(_WORD *)uint64_t v56 = v58;
                  v56[2] = BYTE2(v58);
                  break;
                case 4:
LABEL_104:
                  *(_DWORD *)uint64_t v56 = v58;
                  break;
                default:
LABEL_97:
                  *uint64_t v56 = v58;
                  break;
              }
            }
          }
        }
        else
        {
          if (v32 <= 3) {
            int v57 = ~(-1 << (8 * v32));
          }
          else {
            int v57 = -1;
          }
          if (v32)
          {
            int v58 = v57 & (a2 - v25 + 1);
            if (v32 <= 3) {
              int v59 = v32;
            }
            else {
              int v59 = 4;
            }
            bzero(v56, v32);
            switch(v59)
            {
              case 2:
                goto LABEL_102;
              case 3:
                goto LABEL_103;
              case 4:
                goto LABEL_104;
              default:
                goto LABEL_97;
            }
          }
        }
      }
      return;
  }
}

unsigned char *sub_24E9717CC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E971898);
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

unsigned char *storeEnumTagSinglePayload for SharingDetail.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E97198CLL);
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

ValueMetadata *type metadata accessor for SharingDetail.CodingKeys()
{
  return &type metadata for SharingDetail.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SharingButtonLoadState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E971A90);
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

ValueMetadata *type metadata accessor for SharingButtonLoadState.CodingKeys()
{
  return &type metadata for SharingButtonLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for SharingButtonLoadState.IdleCodingKeys()
{
  return &type metadata for SharingButtonLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for SharingButtonLoadState.FetchingCodingKeys()
{
  return &type metadata for SharingButtonLoadState.FetchingCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SharingButtonLoadState.FetchedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E971B84);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingButtonLoadState.FetchedCodingKeys()
{
  return &type metadata for SharingButtonLoadState.FetchedCodingKeys;
}

unint64_t sub_24E971BC0()
{
  unint64_t result = qword_269909978;
  if (!qword_269909978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909978);
  }
  return result;
}

unint64_t sub_24E971C18()
{
  unint64_t result = qword_269909980;
  if (!qword_269909980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909980);
  }
  return result;
}

unint64_t sub_24E971C70()
{
  unint64_t result = qword_269909988;
  if (!qword_269909988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909988);
  }
  return result;
}

uint64_t sub_24E971CC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E971CE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E971CFC()
{
  return swift_getWitnessTable();
}

unint64_t sub_24E971D1C()
{
  unint64_t result = qword_269909990;
  if (!qword_269909990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909990);
  }
  return result;
}

unint64_t sub_24E971D74()
{
  unint64_t result = qword_269909998;
  if (!qword_269909998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909998);
  }
  return result;
}

unint64_t sub_24E971DCC()
{
  unint64_t result = qword_2699099A0;
  if (!qword_2699099A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099A0);
  }
  return result;
}

unint64_t sub_24E971E24()
{
  unint64_t result = qword_2699099A8;
  if (!qword_2699099A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099A8);
  }
  return result;
}

unint64_t sub_24E971E7C()
{
  unint64_t result = qword_2699099B0;
  if (!qword_2699099B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099B0);
  }
  return result;
}

unint64_t sub_24E971ED4()
{
  unint64_t result = qword_2699099B8;
  if (!qword_2699099B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099B8);
  }
  return result;
}

unint64_t sub_24E971F2C()
{
  unint64_t result = qword_2699099C0;
  if (!qword_2699099C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099C0);
  }
  return result;
}

unint64_t sub_24E971F84()
{
  unint64_t result = qword_2699099C8;
  if (!qword_2699099C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099C8);
  }
  return result;
}

unint64_t sub_24E971FDC()
{
  unint64_t result = qword_2699099D0;
  if (!qword_2699099D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099D0);
  }
  return result;
}

unint64_t sub_24E972034()
{
  unint64_t result = qword_2699099D8;
  if (!qword_2699099D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099D8);
  }
  return result;
}

uint64_t sub_24E972088(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657A696C61636F6CLL && a2 == 0xEE00656C74695464;
  if (v3 || (sub_24E97EAC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E97EAC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E97217C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_24E9721DC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_24E972238(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26B1C4A28, &qword_26B1C4878).n128_u64[0];
  return result;
}

__n128 sub_24E972238@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_24E97E790();
    uint64_t v28 = (void *)sub_24E97DEA0();
    sub_24E97DB50();

    uint64_t v19 = a16;
  }
  sub_24E97DCE0();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  uint64_t v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *uint64_t v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t static LabelStyle<>.expandable<A>(_:axis:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a4, v9, a3);
  uint64_t result = type metadata accessor for ExpandableLabelStyle();
  *(unsigned char *)(a4 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t ExpandableLabelStyle.init(_:axis:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t result = type metadata accessor for ExpandableLabelStyle();
  *(unsigned char *)(a4 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t type metadata accessor for ExpandableLabelStyle()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static LabelStyle<>.expandable.getter@<X0>(uint64_t a1@<X8>)
{
  sub_24E97DCF0();
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099E0);
  *(unsigned char *)(a1 + *(int *)(result + 36)) = 2;
  return result;
}

uint64_t ExpandableLabelStyle<>.init()@<X0>(uint64_t a1@<X8>)
{
  sub_24E97DCF0();
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099E0);
  *(unsigned char *)(a1 + *(int *)(result + 36)) = 2;
  return result;
}

uint64_t sub_24E97263C(uint64_t a1)
{
  uint64_t v2 = 0x7FF0000000000000;
  if (*(unsigned char *)(v1 + *(int *)(a1 + 36)) != 2)
  {
    int v3 = sub_24E97DEB0();
    if (v3 != sub_24E97DEB0()) {
      return 0;
    }
  }
  return v2;
}

uint64_t ExpandableLabelStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v38 = a1;
  uint64_t v4 = sub_24E97DE00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A08);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v8);
  unsigned int v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4868);
  MEMORY[0x270FA5388](v11);
  BOOL v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = *(void *)(a2 + 16);
  uint64_t v14 = v37;
  unint64_t v15 = sub_24E972A7C();
  uint64_t v35 = *(void *)(a2 + 24);
  unint64_t v36 = v15;
  uint64_t v44 = v11;
  uint64_t v45 = v14;
  unint64_t v46 = v15;
  uint64_t v47 = v35;
  uint64_t v39 = MEMORY[0x263F1A8C0];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v40 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v35 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v38, v4);
  sub_24E97E160();
  uint64_t v22 = sub_24E97263C(a2);
  LOBYTE(v7) = v23 & 1;
  uint64_t v24 = sub_24E97263C(a2);
  LOBYTE(a2) = v25 & 1;
  uint64_t v26 = sub_24E97E260();
  __n128 v28 = sub_24E972238(0.0, 1, 0.0, 1, *(double *)&v22, (char)v7, 0.0, 1, (uint64_t)v13, 0.0, 1, *(double *)&v24, a2, v26, v27, &qword_26B1C4A08, &qword_26B1C4868);
  (*(void (**)(char *, uint64_t, __n128))(v41 + 8))(v10, v42, v28);
  unint64_t v30 = v36;
  uint64_t v29 = v37;
  uint64_t v31 = v35;
  sub_24E97DFB0();
  sub_24E972B54((uint64_t)v13);
  uint64_t v44 = v11;
  uint64_t v45 = v29;
  unint64_t v46 = v30;
  uint64_t v47 = v31;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_24E8C8040(v19, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  long long v33 = *(void (**)(char *, uint64_t))(v40 + 8);
  v33(v19, OpaqueTypeMetadata2);
  sub_24E8C8040(v21, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v21, OpaqueTypeMetadata2);
}

unint64_t sub_24E972A7C()
{
  unint64_t result = qword_26B1C4860;
  if (!qword_26B1C4860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C4868);
    sub_24E972AF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C4860);
  }
  return result;
}

unint64_t sub_24E972AF8()
{
  unint64_t result = qword_26B1C4A00;
  if (!qword_26B1C4A00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C4A08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C4A00);
  }
  return result;
}

uint64_t sub_24E972B54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E972BB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E972BFC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E972C94(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0xFD) {
    unsigned int v7 = 253;
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
  uint64_t v9 = v6 + 1;
  char v10 = 8 * (v6 + 1);
  if ((v6 + 1) <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if (v5 >= 0xFD) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      unsigned int v15 = *((unsigned __int8 *)a1 + v6);
      BOOL v16 = v15 >= 2;
      unsigned int v17 = v15 - 2;
      if (!v16) {
        unsigned int v17 = -1;
      }
      if (v17 + 1 >= 2) {
        return v17;
      }
      else {
        return 0;
      }
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
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
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24E972E20(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFD) {
    unsigned int v8 = 253;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v10 = v9 + 1;
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
      if (v9 != -1)
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
      bzero(a1, v9 + 1);
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
      JUMPOUT(0x24E97305CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 < 0xFD)
        {
          a1[v9] = a2 + 2;
        }
        else
        {
          uint64_t v18 = *(void (**)(void))(v6 + 56);
          v18();
        }
      }
      return;
  }
}

uint64_t sub_24E973084()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t ViewStackButton.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = sub_24E8C837C;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_24E973150()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t ViewStackButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099E8);
  MEMORY[0x270FA5388](v27);
  char v23 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099F0);
  MEMORY[0x270FA5388](v24);
  uint64_t v25 = (uint64_t)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269907D58);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269907D60);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  size_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v12 = v1[1];
  char v13 = *((unsigned char *)v1 + 16);
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269907D40);
  sub_24E8C4F04(&qword_269907D48, &qword_269907D40);
  sub_24E97DC00();
  sub_24E8C43C4();
  swift_getKeyPath();
  sub_24E97E330();
  swift_release();
  swift_release();
  sub_24E97E2C0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v14 = *v6;
      int v15 = (char *)v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269907D68) + 48);
      uint64_t v16 = sub_24E97DAD0();
      (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
      goto LABEL_4;
    case 2u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3u:
    case 4u:
LABEL_7:
      swift_storeEnumTagMultiPayload();
      sub_24E973710();
      uint64_t result = sub_24E97DDD0();
      break;
    default:
      uint64_t v14 = *v6;
LABEL_4:
      uint64_t v17 = (uint64_t)v23;
      if (v14 < 1)
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A48);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 1, 1, v21);
      }
      else
      {
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v11;
        *(void *)(v18 + 24) = v12;
        *(unsigned char *)(v18 + 32) = v13;
        MEMORY[0x270FA5388](v18);
        *(&v22 - 4) = v14;
        *(&v22 - 3) = v11;
        *(&v22 - 2) = v12;
        *((unsigned char *)&v22 - 8) = v13;
        sub_24E8C43D4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A18);
        sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
        sub_24E97E180();
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A48);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
      }
      sub_24E9736A8(v17, v25);
      swift_storeEnumTagMultiPayload();
      sub_24E973710();
      sub_24E97DDD0();
      uint64_t result = sub_24E9737A8(v17);
      break;
  }
  return result;
}

uint64_t sub_24E9736A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E973710()
{
  unint64_t result = qword_2699099F8;
  if (!qword_2699099F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699099E8);
    sub_24E8C4F04(&qword_26B1C4A40, &qword_26B1C4A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699099F8);
  }
  return result;
}

uint64_t sub_24E9737A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699099E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E973808()
{
  return swift_release();
}

uint64_t sub_24E9738D0()
{
  sub_24E8C43C4();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_24E97390C()
{
  return sub_24E973808();
}

uint64_t sub_24E973918()
{
  return sub_24E97E150();
}

uint64_t sub_24E9739A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E9739BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24E97DB20();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24E97E4F0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_24E97E4D0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_24E97E4C0();
  sub_24E97E4B0();
  sub_24E97E490();
  sub_24E97E4B0();
  sub_24E97E4E0();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269907D40);
  sub_24E8C4F04(&qword_269907D48, &qword_269907D40);
  sub_24E97DC00();
  sub_24E8C43C4();
  swift_getKeyPath();
  sub_24E97E330();
  swift_release();
  swift_release();
  uint64_t result = sub_24E97DF50();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_24E973C58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24E97E130();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ViewStackButton()
{
  return &type metadata for ViewStackButton;
}

unint64_t sub_24E973CB0()
{
  unint64_t result = qword_269909A00;
  if (!qword_269909A00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A08);
    sub_24E973710();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A00);
  }
  return result;
}

uint64_t sub_24E973D2C@<X0>(uint64_t a1@<X8>)
{
  return sub_24E9739BC(a1);
}

BOOL sub_24E973D3C(unsigned __int8 a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  int v3 = a1;
  sub_24E97EB40();
  sub_24E97EB50();
  uint64_t v4 = sub_24E97EB90();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(unsigned __int8 *)(v8 + v11);
    BOOL result = v12 == v3;
    if (v12 == v3) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_24E973E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24E97EB40();
    sub_24E97E520();
    uint64_t v6 = sub_24E97EB90();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24E97EAC0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24E97EAC0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t StackButton.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = sub_24E8C837C;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_24E973FC4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E973FFC(uint64_t a1, char a2, char a3)
{
  if ((a2 & 1) == 0 && a3 != 4)
  {
    sub_24E8C43D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269909AB0);
    sub_24E8C4F04(&qword_269909AB8, &qword_269909AB0);
    sub_24E97DC00();
    sub_24E8C43C4();
    sub_24E97E340();
    return swift_release();
  }
  return result;
}

uint64_t sub_24E974100@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  int v40 = a5;
  uint64_t v37 = a1;
  uint64_t v39 = a6;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B18);
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (uint64_t)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B20);
  MEMORY[0x270FA5388](v32);
  unint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B08);
  MEMORY[0x270FA5388](v35);
  long long v33 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AF8);
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B28);
  MEMORY[0x270FA5388](v15);
  BOOL v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A18);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    MEMORY[0x270FA5388](v20);
    v31[-4] = a3;
    v31[-3] = a4;
    LOBYTE(v31[-2]) = v40 & 1;
    sub_24E97E150();
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v17, v22, v18);
    swift_storeEnumTagMultiPayload();
    sub_24E976CD0();
    sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
    sub_24E97DDD0();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  }
  uint64_t v23 = v19;
  v31[0] = v17;
  v31[1] = v15;
  char v24 = v40;
  v31[2] = v13;
  if (v37 == 52)
  {
    MEMORY[0x270FA5388](v20);
    v31[-4] = a3;
    v31[-3] = a4;
    LOBYTE(v31[-2]) = v24 & 1;
    sub_24E97E150();
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v11, v22, v18);
    swift_storeEnumTagMultiPayload();
    sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
    uint64_t v27 = (uint64_t)v33;
    sub_24E97DDD0();
    sub_24E8C4738(v27, v36, &qword_269909B08);
    swift_storeEnumTagMultiPayload();
    sub_24E976CF8();
    uint64_t v25 = (uint64_t)v38;
  }
  else
  {
    uint64_t v25 = (uint64_t)v38;
    if (v37 != 37)
    {
      MEMORY[0x270FA5388](v20);
      v31[-4] = a3;
      v31[-3] = a4;
      LOBYTE(v31[-2]) = v29 & 1;
      sub_24E97E150();
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v36, v22, v18);
      swift_storeEnumTagMultiPayload();
      sub_24E976CF8();
      sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
      sub_24E97DDD0();
      goto LABEL_9;
    }
    MEMORY[0x270FA5388](v20);
    v31[-4] = a3;
    v31[-3] = a4;
    LOBYTE(v31[-2]) = v26 & 1;
    sub_24E97E150();
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v11, v22, v18);
    swift_storeEnumTagMultiPayload();
    sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
    uint64_t v27 = (uint64_t)v33;
    sub_24E97DDD0();
    sub_24E8C4738(v27, v36, &qword_269909B08);
    swift_storeEnumTagMultiPayload();
    sub_24E976CF8();
  }
  sub_24E97DDD0();
  sub_24E8C4FA0(v27, &qword_269909B08);
LABEL_9:
  uint64_t v30 = v31[0];
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v18);
  sub_24E8C4738(v25, v30, &qword_269909AF8);
  swift_storeEnumTagMultiPayload();
  sub_24E976CD0();
  sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
  sub_24E97DDD0();
  return sub_24E8C4FA0(v25, &qword_269909AF8);
}

uint64_t sub_24E974914@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24E97E130();
  *a1 = result;
  return result;
}

uint64_t sub_24E974954@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24E97DB20();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24E97E4F0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24E97E480();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269909AB0);
  sub_24E8C4F04(&qword_269909AB8, &qword_269909AB0);
  sub_24E97DC00();
  sub_24E8C43C4();
  swift_getKeyPath();
  sub_24E97E330();
  swift_release();
  swift_release();
  uint64_t result = sub_24E97E510();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_24E974B5C()
{
  return swift_release();
}

uint64_t sub_24E974C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24E97E130();
  *a1 = result;
  return result;
}

uint64_t sub_24E974C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24E97DB20();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24E97E4F0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24E97E480();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269909AB0);
  sub_24E8C4F04(&qword_269909AB8, &qword_269909AB0);
  sub_24E97DC00();
  sub_24E8C43C4();
  swift_getKeyPath();
  sub_24E97E330();
  swift_release();
  swift_release();
  uint64_t result = sub_24E97E510();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t StackButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A10);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  uint64_t v7 = *(void *)(v1 + 8);
  char v8 = *(unsigned char *)(v1 + 16);
  sub_24E974FA8(v6, v7, v8, (uint64_t)v5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v7;
  *(unsigned char *)(v9 + 32) = v8;
  sub_24E8C4738((uint64_t)v5, a1, &qword_269909A10);
  uint64_t v10 = (uint64_t (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269909A18) + 36));
  *uint64_t v10 = sub_24E97662C;
  v10[1] = (uint64_t (*)())v9;
  v10[2] = 0;
  v10[3] = 0;
  sub_24E8C43D4();
  return sub_24E8C4FA0((uint64_t)v5, &qword_269909A10);
}

uint64_t sub_24E974FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v139 = a4;
  int v6 = a3 & 1;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AC0);
  MEMORY[0x270FA5388](v130);
  uint64_t v131 = (uint64_t)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AA8);
  uint64_t v115 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  v114 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AC8);
  MEMORY[0x270FA5388](v116);
  v118 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C47D8);
  MEMORY[0x270FA5388](v10 - 8);
  v111 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A48);
  uint64_t v113 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  v112 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A98);
  MEMORY[0x270FA5388](v123);
  v119 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AD0);
  MEMORY[0x270FA5388](v122);
  uint64_t v124 = (uint64_t)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A88);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v126 = v15;
  uint64_t v127 = v16;
  MEMORY[0x270FA5388](v15);
  v121 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A78);
  MEMORY[0x270FA5388](v128);
  v125 = (char *)&v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A68);
  MEMORY[0x270FA5388](v138);
  v129 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909AD8);
  MEMORY[0x270FA5388](v136);
  uint64_t v137 = (uint64_t)&v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A58);
  uint64_t v132 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  uint64_t v22 = (char *)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A48);
  uint64_t v23 = MEMORY[0x270FA5388](v135);
  uint64_t v25 = (char *)&v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v133 = (uint64_t)&v101 - v26;
  uint64_t started = type metadata accessor for StartWorkoutDetailLoadState(0);
  MEMORY[0x270FA5388](started - 8);
  char v29 = (char *)&v101 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269909AB0);
  sub_24E8C4F04(&qword_269909AB8, &qword_269909AB0);
  sub_24E97DC00();
  uint64_t v30 = a1;
  sub_24E8C43C4();
  swift_getKeyPath();
  sub_24E97E330();
  swift_release();
  swift_release();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4D00);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v29, 2, v31))
  {
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = 0;
    *(_WORD *)(v32 + 24) = 1025;
    *(void *)(v32 + 32) = a1;
    *(void *)(v32 + 40) = a2;
    *(unsigned char *)(v32 + 48) = v6 != 0;
    uint64_t v33 = MEMORY[0x270FA5388](a1);
    *(&v101 - 6) = 0;
    *((unsigned char *)&v101 - 40) = 1;
    *(&v101 - 4) = v33;
    *(&v101 - 3) = a2;
    LOBYTE(v100) = v6 != 0;
    sub_24E8C43D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269909AE0);
    sub_24E976C2C(&qword_269909AE8, &qword_269909AE0, (void (*)(void))sub_24E976CD0);
    sub_24E97E180();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v35 = swift_allocObject();
    *(unsigned char *)(v35 + 16) = 1;
    uint64_t v36 = v132;
    uint64_t v37 = v134;
    (*(void (**)(char *, char *, uint64_t))(v132 + 16))(v25, v22, v134);
    uint64_t v38 = (uint64_t *)&v25[*(int *)(v135 + 36)];
    *uint64_t v38 = KeyPath;
    v38[1] = (uint64_t)sub_24E9770D8;
    v38[2] = v35;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v37);
    uint64_t v39 = v133;
    sub_24E8C4E48((uint64_t)v25, v133, &qword_269909A48);
    sub_24E8C4738(v39, v137, &qword_269909A48);
    swift_storeEnumTagMultiPayload();
    sub_24E9768AC();
    sub_24E976970();
    sub_24E97DDD0();
    return sub_24E8C4FA0(v39, &qword_269909A48);
  }
  else
  {
    v107 = v25;
    v108 = v22;
    uint64_t v110 = a2;
    char v41 = v29[25];
    v109 = v29;
    if (v41)
    {
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = 0;
      *(_WORD *)(v42 + 24) = 1025;
      uint64_t v43 = v110;
      *(void *)(v42 + 32) = a1;
      *(void *)(v42 + 40) = v43;
      *(unsigned char *)(v42 + 48) = v6 != 0;
      MEMORY[0x270FA5388](v42);
      uint64_t v44 = v31;
      *(&v101 - 6) = 0;
      *((unsigned char *)&v101 - 40) = 1;
      *(&v101 - 4) = a1;
      *(&v101 - 3) = v45;
      LOBYTE(v100) = v6 != 0;
      sub_24E8C43D4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269909AE0);
      sub_24E976C2C(&qword_269909AE8, &qword_269909AE0, (void (*)(void))sub_24E976CD0);
      unint64_t v46 = v108;
      sub_24E97E180();
      uint64_t v47 = swift_getKeyPath();
      uint64_t v48 = swift_allocObject();
      *(unsigned char *)(v48 + 16) = 1;
      uint64_t v49 = v132;
      uint64_t v50 = (uint64_t)v107;
      uint64_t v51 = v134;
      (*(void (**)(char *, char *, uint64_t))(v132 + 16))(v107, v46, v134);
      size_t v52 = (uint64_t *)(v50 + *(int *)(v135 + 36));
      *size_t v52 = v47;
      v52[1] = (uint64_t)sub_24E976E64;
      v52[2] = v48;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v51);
      uint64_t v53 = v133;
      sub_24E8C4E48(v50, v133, &qword_269909A48);
      sub_24E8C4738(v53, v131, &qword_269909A48);
      swift_storeEnumTagMultiPayload();
      sub_24E9769AC();
      sub_24E9768AC();
      uint64_t v54 = (uint64_t)v129;
      uint64_t v55 = v44;
      sub_24E97DDD0();
      uint64_t v56 = v109;
      sub_24E8C4FA0(v53, &qword_269909A48);
      uint64_t v57 = v137;
    }
    else
    {
      uint64_t v103 = v31;
      uint64_t v105 = *(void *)v29;
      uint64_t v102 = *((void *)v29 + 1);
      uint64_t v104 = *((void *)v29 + 2);
      unsigned int v58 = v29[24];
      uint64_t v59 = v110;
      sub_24E8C43D4();
      sub_24E97DC00();
      sub_24E8C43C4();
      swift_getKeyPath();
      sub_24E97E330();
      swift_release();
      swift_release();
      unsigned int v106 = v58;
      BOOL v60 = sub_24E973D3C(v58, v141);
      swift_bridgeObjectRelease();
      if (v60)
      {
        sub_24E8C43D4();
        sub_24E97DC00();
        sub_24E8C43C4();
        swift_getKeyPath();
        sub_24E97E330();
        swift_release();
        swift_release();
        if ((v140 & 0xFE) == 2)
        {
          uint64_t v61 = swift_allocObject();
          *(void *)(v61 + 16) = 0;
          *(_WORD *)(v61 + 24) = 1025;
          *(void *)(v61 + 32) = a1;
          *(void *)(v61 + 40) = v59;
          *(unsigned char *)(v61 + 48) = v6 != 0;
          MEMORY[0x270FA5388](v61);
          *(&v101 - 6) = 0;
          *((unsigned char *)&v101 - 40) = 1;
          *(&v101 - 4) = a1;
          *(&v101 - 3) = v59;
          LOBYTE(v100) = v6 != 0;
          sub_24E8C43D4();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269909AE0);
          sub_24E976C2C(&qword_269909AE8, &qword_269909AE0, (void (*)(void))sub_24E976CD0);
          uint64_t v62 = v108;
          sub_24E97E180();
          uint64_t v63 = swift_getKeyPath();
          uint64_t v64 = swift_allocObject();
          *(unsigned char *)(v64 + 16) = 1;
          uint64_t v65 = v132;
          uint64_t v66 = (uint64_t)v107;
          uint64_t v67 = v134;
          (*(void (**)(char *, char *, uint64_t))(v132 + 16))(v107, v62, v134);
          uint64_t v68 = (uint64_t *)(v66 + *(int *)(v135 + 36));
          *uint64_t v68 = v63;
          v68[1] = (uint64_t)sub_24E9770D8;
          v68[2] = v64;
          (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v67);
          uint64_t v69 = v66;
          uint64_t v70 = v133;
          sub_24E8C4E48(v69, v133, &qword_269909A48);
          sub_24E8C4738(v70, v124, &qword_269909A48);
          swift_storeEnumTagMultiPayload();
          sub_24E9768AC();
          sub_24E976AE0();
          v71 = v121;
          sub_24E97DDD0();
          sub_24E8C4FA0(v70, &qword_269909A48);
          uint64_t v72 = (uint64_t)v71;
          uint64_t v57 = v137;
          uint64_t v73 = v131;
          uint64_t v54 = (uint64_t)v129;
          uint64_t v75 = (uint64_t)v125;
          uint64_t v74 = v126;
          uint64_t v76 = v102;
        }
        else
        {
          uint64_t v79 = v124;
          uint64_t v75 = (uint64_t)v125;
          if (v140)
          {
            v89 = v111;
            sub_24E97DBB0();
            uint64_t v90 = sub_24E97DBD0();
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56))(v89, 0, 1, v90);
            uint64_t v91 = swift_allocObject();
            uint64_t v92 = v110;
            *(void *)(v91 + 16) = v30;
            *(void *)(v91 + 24) = v92;
            *(unsigned char *)(v91 + 32) = v6 != 0;
            *(unsigned char *)(v91 + 33) = v106;
            MEMORY[0x270FA5388](v91);
            *(&v101 - 4) = v30;
            *(&v101 - 3) = v93;
            LOBYTE(v100) = v6 != 0;
            sub_24E8C43D4();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4A18);
            sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
            v94 = v112;
            sub_24E97E170();
            uint64_t v79 = v124;
            uint64_t v95 = v113;
            uint64_t v96 = v117;
            (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v118, v94, v117);
            swift_storeEnumTagMultiPayload();
            sub_24E8C4F04(&qword_26B1C4A40, &qword_26B1C4A48);
            sub_24E976B80();
            uint64_t v88 = (uint64_t)v119;
            sub_24E97DDD0();
            (*(void (**)(char *, uint64_t))(v95 + 8))(v94, v96);
            uint64_t v76 = v102;
          }
          else
          {
            uint64_t v80 = v105;
            uint64_t v81 = v104;
            uint64_t v141 = v104;
            swift_getKeyPath();
            uint64_t v82 = swift_allocObject();
            uint64_t v83 = v110;
            *(void *)(v82 + 16) = v30;
            *(void *)(v82 + 24) = v83;
            *(unsigned char *)(v82 + 32) = v6 != 0;
            uint64_t v76 = v102;
            *(void *)(v82 + 40) = v80;
            *(void *)(v82 + 48) = v76;
            *(void *)(v82 + 56) = v81;
            uint64_t v84 = v106;
            *(unsigned char *)(v82 + 64) = v106;
            sub_24E8C43D4();
            swift_bridgeObjectRetain();
            sub_24E8DA4B0(v80, v76, v81, v84, 0);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4B18);
            sub_24E8C4F04(&qword_269909B10, &qword_26B1C4B18);
            uint64_t v100 = sub_24E8C4F04(&qword_269909A50, &qword_269909A58);
            v85 = v114;
            sub_24E97E230();
            uint64_t v86 = v115;
            uint64_t v87 = v120;
            (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v118, v85, v120);
            swift_storeEnumTagMultiPayload();
            sub_24E8C4F04(&qword_26B1C4A40, &qword_26B1C4A48);
            sub_24E976B80();
            uint64_t v88 = (uint64_t)v119;
            sub_24E97DDD0();
            (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);
          }
          sub_24E8C4738(v88, v79, &qword_269909A98);
          swift_storeEnumTagMultiPayload();
          sub_24E9768AC();
          sub_24E976AE0();
          v97 = v121;
          sub_24E97DDD0();
          sub_24E8C4FA0(v88, &qword_269909A98);
          uint64_t v72 = (uint64_t)v97;
          uint64_t v57 = v137;
          uint64_t v73 = v131;
          uint64_t v54 = (uint64_t)v129;
          uint64_t v74 = v126;
        }
        sub_24E8C4E48(v72, v75, &qword_269909A88);
        uint64_t v77 = 0;
        uint64_t v78 = v127;
      }
      else
      {
        uint64_t v77 = 1;
        uint64_t v57 = v137;
        uint64_t v73 = v131;
        uint64_t v54 = (uint64_t)v129;
        uint64_t v75 = (uint64_t)v125;
        uint64_t v74 = v126;
        uint64_t v78 = v127;
        uint64_t v76 = v102;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v75, v77, 1, v74);
      sub_24E8C4738(v75, v73, &qword_269909A78);
      swift_storeEnumTagMultiPayload();
      sub_24E9769AC();
      sub_24E9768AC();
      sub_24E97DDD0();
      sub_24E8DA6D0(v105, v76, v104, v106, 0);
      sub_24E8C4FA0(v75, &qword_269909A78);
      uint64_t v56 = v109;
      uint64_t v55 = v103;
    }
    v98 = &v56[*(int *)(v55 + 48)];
    sub_24E8C4738(v54, v57, &qword_269909A68);
    swift_storeEnumTagMultiPayload();
    sub_24E9768AC();
    sub_24E976970();
    sub_24E97DDD0();
    sub_24E8C4FA0(v54, &qword_269909A68);
    uint64_t v99 = sub_24E97DAD0();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v99 - 8) + 8))(v98, v99);
  }
}

uint64_t sub_24E976438(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v12 = *a1;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(unsigned char *)(v13 + 24) = 0;
  *(unsigned char *)(v13 + 25) = a8;
  *(void *)(v13 + 32) = a2;
  *(void *)(v13 + 40) = a3;
  *(unsigned char *)(v13 + 48) = a4 & 1;
  sub_24E8C43D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269909AE0);
  sub_24E976C2C(&qword_269909AE8, &qword_269909AE0, (void (*)(void))sub_24E976CD0);
  return sub_24E97E180();
}

uint64_t sub_24E976550()
{
  return swift_release();
}

uint64_t sub_24E976624()
{
  return objectdestroy_2Tm_1(33);
}

uint64_t sub_24E97662C()
{
  return sub_24E976550();
}

uint64_t sub_24E976638()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24E976654@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909A10);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  uint64_t v7 = *(void *)(v1 + 8);
  char v8 = *(unsigned char *)(v1 + 16);
  sub_24E974FA8(v6, v7, v8, (uint64_t)v5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v7;
  *(unsigned char *)(v9 + 32) = v8;
  sub_24E8C4738((uint64_t)v5, a1, &qword_269909A10);
  uint64_t v10 = (uint64_t (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269909A18) + 36));
  *uint64_t v10 = sub_24E9770D4;
  v10[1] = (uint64_t (*)())v9;
  v10[2] = 0;
  v10[3] = 0;
  sub_24E8C43D4();
  return sub_24E8C4FA0((uint64_t)v5, &qword_269909A10);
}

ValueMetadata *type metadata accessor for StackButton()
{
  return &type metadata for StackButton;
}

unint64_t sub_24E976784()
{
  unint64_t result = qword_269909A20;
  if (!qword_269909A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A18);
    sub_24E976800();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A20);
  }
  return result;
}

unint64_t sub_24E976800()
{
  unint64_t result = qword_269909A28;
  if (!qword_269909A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A10);
    sub_24E976A58(&qword_269909A30, &qword_269909A38, (void (*)(void))sub_24E9768AC, (void (*)(void))sub_24E976970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A28);
  }
  return result;
}

unint64_t sub_24E9768AC()
{
  unint64_t result = qword_269909A40;
  if (!qword_269909A40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A48);
    sub_24E8C4F04(&qword_269909A50, &qword_269909A58);
    sub_24E8C4F04(&qword_269907088, &qword_269907090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A40);
  }
  return result;
}

uint64_t sub_24E976970()
{
  return sub_24E976A58(&qword_269909A60, &qword_269909A68, (void (*)(void))sub_24E9769AC, (void (*)(void))sub_24E9768AC);
}

unint64_t sub_24E9769AC()
{
  unint64_t result = qword_269909A70;
  if (!qword_269909A70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A78);
    sub_24E976A58(&qword_269909A80, &qword_269909A88, (void (*)(void))sub_24E9768AC, (void (*)(void))sub_24E976AE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A70);
  }
  return result;
}

uint64_t sub_24E976A58(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24E976AE0()
{
  unint64_t result = qword_269909A90;
  if (!qword_269909A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909A98);
    sub_24E8C4F04(&qword_26B1C4A40, &qword_26B1C4A48);
    sub_24E976B80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909A90);
  }
  return result;
}

unint64_t sub_24E976B80()
{
  unint64_t result = qword_269909AA0;
  if (!qword_269909AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909AA8);
    sub_24E8C4F04(&qword_269909A50, &qword_269909A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909AA0);
  }
  return result;
}

uint64_t sub_24E976C18()
{
  return objectdestroy_2Tm_1(33);
}

uint64_t sub_24E976C2C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E976CD0()
{
  return sub_24E976C2C(&qword_269909AF0, &qword_269909AF8, (void (*)(void))sub_24E976CF8);
}

unint64_t sub_24E976CF8()
{
  unint64_t result = qword_269909B00;
  if (!qword_269909B00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269909B08);
    sub_24E8C4F04(&qword_26B1C4A10, &qword_26B1C4A18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B00);
  }
  return result;
}

uint64_t sub_24E976D90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E97DD60();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24E976DC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E97DD60();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24E976DF0()
{
  return sub_24E97DD70();
}

uint64_t sub_24E976E18()
{
  return sub_24E97DD70();
}

unsigned char *sub_24E976E40(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_24E976E54()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24E976E64(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24E976E7C()
{
  sub_24E8C43C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t sub_24E976EC8(uint64_t *a1)
{
  return sub_24E976438(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64));
}

uint64_t sub_24E976EE0()
{
  return objectdestroy_2Tm_1(34);
}

uint64_t objectdestroy_2Tm_1(uint64_t a1)
{
  sub_24E8C43C4();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24E976F30()
{
  return sub_24E974B5C();
}

uint64_t sub_24E976F40()
{
  return sub_24E97E150();
}

uint64_t sub_24E976FC4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24E976FD8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24E976FE8@<X0>(uint64_t a1@<X8>)
{
  return sub_24E974954(a1);
}

uint64_t sub_24E977024()
{
  return sub_24E973FFC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(unsigned char *)(v0 + 25));
}

uint64_t sub_24E97703C@<X0>(uint64_t a1@<X8>)
{
  return sub_24E974100(*(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned __int8 *)(v1 + 48), a1);
}

uint64_t sub_24E977050@<X0>(uint64_t a1@<X8>)
{
  return sub_24E974C78(a1);
}

uint64_t sub_24E97705C@<X0>(uint64_t a1@<X8>)
{
  return sub_24E974954(a1);
}

uint64_t sub_24E977094@<X0>(uint64_t a1@<X8>)
{
  return sub_24E974954(a1);
}

BOOL static CreatePlanHandoffAlertIconState.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t CreatePlanHandoffAlertIconState.hash(into:)()
{
  return sub_24E97EB50();
}

uint64_t sub_24E977114(char a1)
{
  if (a1) {
    return 0x656D7269666E6F63;
  }
  else {
    return 0x4F6D7269666E6F63;
  }
}

uint64_t sub_24E97715C()
{
  return sub_24E977114(*v0);
}

uint64_t sub_24E977164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E977750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E97718C(uint64_t a1)
{
  unint64_t v2 = sub_24E9775EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9771C8(uint64_t a1)
{
  unint64_t v2 = sub_24E9775EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E977204(uint64_t a1)
{
  unint64_t v2 = sub_24E977694();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E977240(uint64_t a1)
{
  unint64_t v2 = sub_24E977694();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E97727C(uint64_t a1)
{
  unint64_t v2 = sub_24E977640();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9772B8(uint64_t a1)
{
  unint64_t v2 = sub_24E977640();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CreatePlanHandoffAlertIconState.hashValue.getter()
{
  return sub_24E97EB90();
}

uint64_t CreatePlanHandoffAlertIconState.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B30);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B38);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909B40);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E9775EC();
  sub_24E97EBE0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24E977640();
    sub_24E97E9F0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24E977694();
    sub_24E97E9F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24E9775EC()
{
  unint64_t result = qword_269909B48;
  if (!qword_269909B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B48);
  }
  return result;
}

unint64_t sub_24E977640()
{
  unint64_t result = qword_269909B50;
  if (!qword_269909B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B50);
  }
  return result;
}

unint64_t sub_24E977694()
{
  unint64_t result = qword_269909B58;
  if (!qword_269909B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B58);
  }
  return result;
}

uint64_t CreatePlanHandoffAlertIconState.init(from:)(uint64_t a1)
{
  return sub_24E97785C(a1) & 1;
}

uint64_t sub_24E977704@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24E97785C(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24E977734(void *a1)
{
  return CreatePlanHandoffAlertIconState.encode(to:)(a1, *v1);
}

uint64_t sub_24E977750(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4F6D7269666E6F63 && a2 == 0xEF6563697665446ELL;
  if (v3 || (sub_24E97EAC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D7269666E6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E97EAC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E97785C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BA0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BA8);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BB0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24E9775EC();
  uint64_t v12 = v26;
  sub_24E97EBD0();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24E97E9D0();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24E97E890();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699072A0);
    void *v18 = &type metadata for CreatePlanHandoffAlertIconState;
    sub_24E97E920();
    sub_24E97E880();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_24E977640();
    sub_24E97E910();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24E977694();
    sub_24E97E910();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24E977CB0()
{
  unint64_t result = qword_269909B60;
  if (!qword_269909B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B60);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreatePlanHandoffAlertIconState()
{
  return &type metadata for CreatePlanHandoffAlertIconState;
}

unsigned char *_s14FitnessActions31CreatePlanHandoffAlertIconStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E977DE4);
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

ValueMetadata *type metadata accessor for CreatePlanHandoffAlertIconState.CodingKeys()
{
  return &type metadata for CreatePlanHandoffAlertIconState.CodingKeys;
}

ValueMetadata *type metadata accessor for CreatePlanHandoffAlertIconState.ConfirmOnDeviceCodingKeys()
{
  return &type metadata for CreatePlanHandoffAlertIconState.ConfirmOnDeviceCodingKeys;
}

ValueMetadata *type metadata accessor for CreatePlanHandoffAlertIconState.ConfirmedCodingKeys()
{
  return &type metadata for CreatePlanHandoffAlertIconState.ConfirmedCodingKeys;
}

unint64_t sub_24E977E40()
{
  unint64_t result = qword_269909B68;
  if (!qword_269909B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B68);
  }
  return result;
}

unint64_t sub_24E977E98()
{
  unint64_t result = qword_269909B70;
  if (!qword_269909B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B70);
  }
  return result;
}

unint64_t sub_24E977EF0()
{
  unint64_t result = qword_269909B78;
  if (!qword_269909B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B78);
  }
  return result;
}

unint64_t sub_24E977F48()
{
  unint64_t result = qword_269909B80;
  if (!qword_269909B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B80);
  }
  return result;
}

unint64_t sub_24E977FA0()
{
  unint64_t result = qword_269909B88;
  if (!qword_269909B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B88);
  }
  return result;
}

unint64_t sub_24E977FF8()
{
  unint64_t result = qword_269909B90;
  if (!qword_269909B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B90);
  }
  return result;
}

unint64_t sub_24E978050()
{
  unint64_t result = qword_269909B98;
  if (!qword_269909B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909B98);
  }
  return result;
}

uint64_t sub_24E9780A4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_24E97EB40();
    swift_bridgeObjectRetain();
    sub_24E97E520();
    uint64_t v18 = sub_24E97EB90();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_24E97EAC0() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        char v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_24E97EAC0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    unint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 4;
  if (v3 + 4 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_24E97832C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 56;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(result + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_23;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
    if (v13 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (v14) {
      goto LABEL_22;
    }
    int64_t v4 = v13 + 1;
    if (v13 + 1 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_22;
    }
    int64_t v4 = v13 + 2;
    if (v13 + 2 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_22;
    }
    int64_t v15 = v13 + 3;
    if (v15 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v4 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_33;
        }
        if (v4 >= v9) {
          return 1;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v4 = v15;
LABEL_22:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_23:
    int v16 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v12);
    sub_24E97EB40();
    sub_24E97EB50();
    unint64_t result = sub_24E97EB90();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    uint64_t v19 = *(void *)(a2 + 48);
  }
  while (*(unsigned __int8 *)(v19 + v18) == v16);
  uint64_t v20 = ~v17;
  while (1)
  {
    unint64_t v18 = (v18 + 1) & v20;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    if (*(unsigned __int8 *)(v19 + v18) == v16) {
      goto LABEL_7;
    }
  }
}

uint64_t sub_24E978510(char a1)
{
  uint64_t result = 0xD000000000000010;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000012;
    }
    else {
      return 0x6570704177656976;
    }
  }
  return result;
}

uint64_t sub_24E978578()
{
  return sub_24E978510(*v0);
}

uint64_t sub_24E978580@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E979E58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E9785A8(uint64_t a1)
{
  unint64_t v2 = sub_24E978B84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9785E4(uint64_t a1)
{
  unint64_t v2 = sub_24E978B84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E978620(uint64_t a1)
{
  unint64_t v2 = sub_24E978C80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E97865C(uint64_t a1)
{
  unint64_t v2 = sub_24E978C80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E978698(uint64_t a1)
{
  unint64_t v2 = sub_24E978C2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E9786D4(uint64_t a1)
{
  unint64_t v2 = sub_24E978C2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E978710(uint64_t a1)
{
  unint64_t v2 = sub_24E978BD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E97874C(uint64_t a1)
{
  unint64_t v2 = sub_24E978BD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpNextQueueMonitorAction.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4C88);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v22 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4C78);
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v6);
  BOOL v23 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4C70);
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4C80);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E978B84();
  sub_24E97EBE0();
  if (!v15)
  {
    char v29 = 0;
    sub_24E978C80();
    sub_24E97E9F0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  if (v15 == 1)
  {
    char v31 = 2;
    sub_24E978BD8();
    int v16 = v22;
    sub_24E97E9F0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  char v30 = 1;
  sub_24E978C2C();
  unint64_t v18 = v23;
  sub_24E97E9F0();
  uint64_t v28 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4B28);
  sub_24E9792BC(&qword_26B1C4B30);
  uint64_t v19 = v27;
  sub_24E97EA90();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24E978B84()
{
  unint64_t result = qword_26B1C3FE0;
  if (!qword_26B1C3FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FE0);
  }
  return result;
}

unint64_t sub_24E978BD8()
{
  unint64_t result = qword_26B1C3FF8;
  if (!qword_26B1C3FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FF8);
  }
  return result;
}

unint64_t sub_24E978C2C()
{
  unint64_t result = qword_26B1C3FC8;
  if (!qword_26B1C3FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FC8);
  }
  return result;
}

unint64_t sub_24E978C80()
{
  unint64_t result = qword_269909BB8;
  if (!qword_269909BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909BB8);
  }
  return result;
}

uint64_t UpNextQueueMonitorAction.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BC0);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v33 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BC8);
  uint64_t v31 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BD0);
  uint64_t v28 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269909BD8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24E978B84();
  uint64_t v15 = v35;
  sub_24E97EBD0();
  if (v15) {
    goto LABEL_9;
  }
  int v16 = v33;
  uint64_t v35 = v11;
  uint64_t v17 = sub_24E97E9D0();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v20 = sub_24E97E890();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699072A0);
    *uint64_t v22 = &type metadata for UpNextQueueMonitorAction;
    sub_24E97E920();
    sub_24E97E880();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v10);
LABEL_9:
    uint64_t v23 = (uint64_t)v34;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  if (*(unsigned char *)(v17 + 32))
  {
    if (*(unsigned char *)(v17 + 32) == 1)
    {
      char v38 = 1;
      sub_24E978C2C();
      uint64_t v18 = v10;
      uint64_t v19 = v13;
      sub_24E97E910();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C4B28);
      sub_24E9792BC(&qword_269909BE0);
      uint64_t v25 = v27;
      sub_24E97E9C0();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v25);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v18);
      uint64_t v26 = v36;
    }
    else
    {
      char v39 = 2;
      sub_24E978BD8();
      sub_24E97E910();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v10);
      uint64_t v26 = 1;
    }
  }
  else
  {
    char v37 = 0;
    sub_24E978C80();
    sub_24E97E910();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v10);
    uint64_t v26 = 0;
  }
  uint64_t v23 = (uint64_t)v34;
  *uint64_t v32 = v26;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24E9792BC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C4B28);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E979320@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UpNextQueueMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_24E979338(void *a1)
{
  return UpNextQueueMonitorAction.encode(to:)(a1);
}

uint64_t UpNextQueueMonitorAction.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  if (!*v1 || v3 == 1) {
    return sub_24E97EB50();
  }
  sub_24E97EB50();
  return sub_24E91D85C(a1, v3);
}

uint64_t UpNextQueueMonitorAction.hashValue.getter()
{
  unint64_t v1 = *v0;
  sub_24E97EB40();
  sub_24E97EB50();
  if (v1 > 1) {
    sub_24E91D85C((uint64_t)v3, v1);
  }
  return sub_24E97EB90();
}

uint64_t sub_24E979448()
{
  unint64_t v1 = *v0;
  sub_24E97EB40();
  sub_24E97EB50();
  if (v1 > 1) {
    sub_24E91D85C((uint64_t)v3, v1);
  }
  return sub_24E97EB90();
}

uint64_t sub_24E9794BC(uint64_t a1)
{
  uint64_t v3 = *v1;
  if (!*v1 || v3 == 1) {
    return sub_24E97EB50();
  }
  sub_24E97EB50();
  return sub_24E91D85C(a1, v3);
}

uint64_t sub_24E97953C()
{
  unint64_t v1 = *v0;
  sub_24E97EB40();
  sub_24E97EB50();
  if (v1 > 1) {
    sub_24E91D85C((uint64_t)v3, v1);
  }
  return sub_24E97EB90();
}

uint64_t _s14FitnessActions24UpNextQueueMonitorActionO2eeoiySbAC_ACtFZ_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = *a2;
  if (!*a1)
  {
    if (!v3)
    {
      unint64_t v2 = 0;
      char v4 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v2 != 1)
  {
    if (v3 >= 2)
    {
      sub_24E94D998(*a2);
      sub_24E94D998(v2);
      char v4 = sub_24E9780A4(v2, v3);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
LABEL_8:
    sub_24E94D998(*a2);
    sub_24E94D998(v2);
    char v4 = 0;
    goto LABEL_10;
  }
  unint64_t v2 = 1;
  char v4 = 1;
LABEL_10:
  sub_24E94D9A8(v2);
  sub_24E94D9A8(v3);
  return v4 & 1;
}

unint64_t sub_24E979664()
{
  unint64_t result = qword_269909BE8;
  if (!qword_269909BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909BE8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UpNextQueueMonitorAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for UpNextQueueMonitorAction(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for UpNextQueueMonitorAction(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for UpNextQueueMonitorAction(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpNextQueueMonitorAction(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UpNextQueueMonitorAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_24E9798A8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24E9798C0(void *result, int a2)
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
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for UpNextQueueMonitorAction()
{
  return &type metadata for UpNextQueueMonitorAction;
}

unsigned char *storeEnumTagSinglePayload for UpNextQueueMonitorAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E9799BCLL);
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

ValueMetadata *type metadata accessor for UpNextQueueMonitorAction.CodingKeys()
{
  return &type metadata for UpNextQueueMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for UpNextQueueMonitorAction.FetchUpNextItemsCodingKeys()
{
  return &type metadata for UpNextQueueMonitorAction.FetchUpNextItemsCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UpNextQueueMonitorAction.UpNextItemsUpdatedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E979AA0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpNextQueueMonitorAction.UpNextItemsUpdatedCodingKeys()
{
  return &type metadata for UpNextQueueMonitorAction.UpNextItemsUpdatedCodingKeys;
}

ValueMetadata *type metadata accessor for UpNextQueueMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for UpNextQueueMonitorAction.ViewAppearedCodingKeys;
}

unint64_t sub_24E979AEC()
{
  unint64_t result = qword_269909BF0;
  if (!qword_269909BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909BF0);
  }
  return result;
}

unint64_t sub_24E979B44()
{
  unint64_t result = qword_269909BF8;
  if (!qword_269909BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269909BF8);
  }
  return result;
}

unint64_t sub_24E979B9C()
{
  unint64_t result = qword_26B1C3FC0;
  if (!qword_26B1C3FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FC0);
  }
  return result;
}

unint64_t sub_24E979BF4()
{
  unint64_t result = qword_26B1C3FB8;
  if (!qword_26B1C3FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FB8);
  }
  return result;
}

unint64_t sub_24E979C4C()
{
  unint64_t result = qword_26B1C3FD8;
  if (!qword_26B1C3FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FD8);
  }
  return result;
}

unint64_t sub_24E979CA4()
{
  unint64_t result = qword_26B1C3FD0;
  if (!qword_26B1C3FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FD0);
  }
  return result;
}

unint64_t sub_24E979CFC()
{
  unint64_t result = qword_26B1C4008;
  if (!qword_26B1C4008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C4008);
  }
  return result;
}

unint64_t sub_24E979D54()
{
  unint64_t result = qword_26B1C4000;
  if (!qword_26B1C4000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C4000);
  }
  return result;
}

unint64_t sub_24E979DAC()
{
  unint64_t result = qword_26B1C3FF0;
  if (!qword_26B1C3FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FF0);
  }
  return result;
}

unint64_t sub_24E979E04()
{
  unint64_t result = qword_26B1C3FE8;
  if (!qword_26B1C3FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C3FE8);
  }
  return result;
}

uint64_t sub_24E979E58(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024E98EF40 || (sub_24E97EAC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024E98EF60 || (sub_24E97EAC0() & 1) != 0)
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
    char v5 = sub_24E97EAC0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t ActionContext.identifier.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v8 = *(void *)(a1 + 16);
  if (EnumCaseMultiPayload != 1) {
    return (*(uint64_t (**)(uint64_t, char *, void))(*(void *)(v8 - 8) + 32))(a2, v5, *(void *)(a1 + 16));
  }
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = &v5[*(int *)(swift_getTupleTypeMetadata2() + 48)];
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a2, v5, v8);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v10, v9);
}

uint64_t ActionContext.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v9 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v6);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v16, v2, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = &v16[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v16, v10);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v18, v4);
    sub_24E97EB50();
    sub_24E97E450();
    sub_24E97E450();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v16, v10);
    sub_24E97EB50();
    sub_24E97E450();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

uint64_t static ActionContext.== infix(_:_:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  uint64_t v58 = *(void *)(a4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v61 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v56 = (char *)v55 - v8;
  uint64_t v66 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  BOOL v60 = (char *)v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v59 = (char *)v55 - v12;
  uint64_t v67 = v13;
  uint64_t v68 = v14;
  uint64_t v65 = v14;
  uint64_t v69 = v15;
  uint64_t v70 = v16;
  uint64_t v57 = v17;
  uint64_t v71 = v17;
  uint64_t v72 = v18;
  uint64_t v73 = v19;
  uint64_t v74 = v20;
  v55[1] = v20;
  uint64_t v21 = type metadata accessor for ActionContext();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v55 - v26;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v29 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v32 = (char *)v55 - v31;
  uint64_t v33 = (char *)v55 + *(int *)(v30 + 48) - v31;
  uint64_t v62 = v22;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v34((char *)v55 - v31, v63, v21);
  v34(v33, (uint64_t)v64, v21);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v50 = v59;
    v34(v27, (uint64_t)v32, v21);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v51 = v66;
      (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v50, v33, a3);
      char v48 = sub_24E97E470();
      size_t v52 = *(void (**)(char *, uint64_t))(v51 + 8);
      v52(v50, a3);
      v52(v27, a3);
      uint64_t v29 = v62;
      goto LABEL_11;
    }
    uint64_t v25 = v27;
    goto LABEL_8;
  }
  v34(v25, (uint64_t)v32, v21);
  uint64_t v35 = v65;
  uint64_t v36 = *(int *)(swift_getTupleTypeMetadata2() + 48);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v58 + 8))(&v25[v36], v35);
LABEL_8:
    (*(void (**)(char *, uint64_t))(v66 + 8))(v25, a3);
    char v48 = 0;
    uint64_t v21 = TupleTypeMetadata2;
    goto LABEL_11;
  }
  uint64_t v64 = &v33[v36];
  uint64_t v37 = v66;
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v60, v33, a3);
  uint64_t v38 = v58;
  char v39 = &v25[v36];
  int v40 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  char v41 = v56;
  v40(v56, v39, v65);
  v40(v61, v64, v65);
  char v42 = sub_24E97E470();
  uint64_t v43 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v66 = v37 + 8;
  v43(v25, a3);
  uint64_t v44 = v65;
  uint64_t v45 = v62;
  uint64_t v46 = a3;
  if (v42)
  {
    uint64_t v47 = v61;
    char v48 = sub_24E97E470();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v38 + 8);
    v49(v47, v44);
    v49(v41, v44);
    v43(v60, v46);
    uint64_t v29 = v62;
  }
  else
  {
    uint64_t v53 = *(void (**)(char *, uint64_t))(v38 + 8);
    v53(v61, v65);
    v53(v41, v44);
    v43(v60, a3);
    char v48 = 0;
    uint64_t v29 = v45;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v21);
  return v48 & 1;
}

uint64_t type metadata accessor for ActionContext()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E97AA28(char a1)
{
  if (a1) {
    return 0x6574617473;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24E97AA60(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24E97EAC0() & 1) != 0)
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
    char v6 = sub_24E97EAC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E97AB4C(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_24E97ADC0(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void))sub_24E8F819C);
}

uint64_t sub_24E97AB68(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_24E97AE60(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_24E8F81AC);
}

uint64_t sub_24E97AB80(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_24E97AEBC(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void, void, void, void))sub_24E8F81AC);
}

uint64_t sub_24E97AB98(void *a1, uint64_t a2)
{
  return sub_24E97AF3C(a1, a2, (uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E97AA28);
}

uint64_t sub_24E97ABB4@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_24E97AFE0(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_24E8FFCCC, a2);
}

uint64_t sub_24E97ABCC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E97AC20(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E97AC74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E8C67EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24E97ACC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E8C5528();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24E97AD00(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E97AD54(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24E97ADA8(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_24E97ADC0(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void))sub_24E97D9A4);
}

uint64_t sub_24E97ADC0(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void, void, void, void))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]) & 1;
}

uint64_t sub_24E97AE0C()
{
  return sub_24E8F8CF0();
}

uint64_t sub_24E97AE48(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_24E97AE60(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_24E97D998);
}

uint64_t sub_24E97AE60(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void, void, void, void, void))
{
  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
}

uint64_t sub_24E97AEA4(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_24E97AEBC(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void, void, void, void))sub_24E97D998);
}

uint64_t sub_24E97AEBC(uint64_t a1, void *a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void, void, void, void, void, void, void))
{
  sub_24E97EB40();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
  return sub_24E97EB90();
}

uint64_t sub_24E97AF24(void *a1, uint64_t a2)
{
  return sub_24E97AF3C(a1, a2, (uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_24E97D9B0);
}

uint64_t sub_24E97AF3C(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

uint64_t sub_24E97AF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E97AA60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E97AFC8@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_24E97AFE0(a1, (uint64_t (*)(void, void, void, void, void, void, void, void))sub_24E97D9BC, a2);
}

uint64_t sub_24E97AFE0@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  *a3 = result;
  return result;
}

uint64_t sub_24E97B024(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E97B078(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t ActionContext.encode(to:)(void *a1, void *a2)
{
  uint64_t v57 = a1;
  uint64_t v4 = a2[2];
  uint64_t v3 = a2[3];
  uint64_t v5 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[6];
  uint64_t v8 = a2[7];
  uint64_t v9 = a2[9];
  uint64_t v61 = a2[8];
  uint64_t v62 = v5;
  uint64_t v63 = v4;
  uint64_t v64 = v3;
  uint64_t v65 = v5;
  uint64_t v66 = v6;
  uint64_t v10 = v5;
  uint64_t v71 = v6;
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  uint64_t v69 = v61;
  uint64_t v70 = v9;
  uint64_t v56 = v9;
  uint64_t v48 = type metadata accessor for ActionContext.StateCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v49 = sub_24E97EAA0();
  uint64_t v51 = *(void *)(v49 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v49);
  uint64_t v59 = (char *)&v40 - v12;
  uint64_t v46 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v11);
  BOOL v60 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v4;
  uint64_t v64 = v3;
  uint64_t v65 = v10;
  uint64_t v66 = v6;
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  uint64_t v14 = v61;
  uint64_t v69 = v61;
  uint64_t v70 = v9;
  uint64_t v15 = type metadata accessor for ActionContext.IdentifierCodingKeys();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v44 = v15;
  uint64_t v42 = v16;
  uint64_t v45 = sub_24E97EAA0();
  uint64_t v41 = *(void *)(v45 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v45);
  uint64_t v43 = (char *)&v40 - v18;
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v55 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  size_t v52 = (char *)&v40 - v22;
  uint64_t v23 = *(a2 - 1);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v4;
  uint64_t v64 = v3;
  uint64_t v50 = v3;
  uint64_t v65 = v62;
  uint64_t v66 = v71;
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  uint64_t v69 = v14;
  uint64_t v70 = v56;
  type metadata accessor for ActionContext.CodingKeys();
  swift_getWitnessTable();
  uint64_t v62 = sub_24E97EAA0();
  uint64_t v56 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v27 = (char *)&v40 - v26;
  __swift_project_boxed_opaque_existential_1(v57, v57[3]);
  sub_24E97EBE0();
  (*(void (**)(char *, uint64_t, void *))(v23 + 16))(v25, v58, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = v50;
    uint64_t v29 = &v25[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    uint64_t v30 = v53;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v55, v25, v4);
    uint64_t v31 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v60, v29, v28);
    LOBYTE(v63) = 1;
    sub_24E97E9F0();
    LOBYTE(v63) = 0;
    uint64_t v32 = v49;
    uint64_t v33 = v54;
    sub_24E97EA90();
    if (!v33)
    {
      LOBYTE(v63) = 1;
      sub_24E97EA90();
    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v59, v32);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v60, v28);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v55, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v27, v62);
  }
  else
  {
    uint64_t v35 = v41;
    uint64_t v36 = v53;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v52, v25, v4);
    LOBYTE(v63) = 0;
    uint64_t v37 = v43;
    uint64_t v38 = v62;
    sub_24E97E9F0();
    uint64_t v39 = v45;
    sub_24E97EA90();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v39);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v52, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v27, v38);
  }
}

uint64_t type metadata accessor for ActionContext.StateCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ActionContext.IdentifierCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ActionContext.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t ActionContext.hashValue.getter(uint64_t a1)
{
  sub_24E97EB40();
  ActionContext.hash(into:)((uint64_t)v3, a1);
  return sub_24E97EB90();
}

uint64_t ActionContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t v92 = a1;
  uint64_t v65 = a9;
  *(void *)&long long v86 = a2;
  *((void *)&v86 + 1) = a3;
  *(void *)&long long v87 = a4;
  *((void *)&v87 + 1) = a5;
  uint64_t v88 = a6;
  uint64_t v89 = a7;
  uint64_t v90 = a8;
  uint64_t v91 = a10;
  uint64_t v80 = type metadata accessor for ActionContext.StateCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v68 = sub_24E97E9E0();
  uint64_t v69 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v79 = (char *)&v59 - v17;
  *(void *)&long long v86 = a2;
  *((void *)&v86 + 1) = a3;
  *(void *)&long long v87 = a4;
  *((void *)&v87 + 1) = a5;
  uint64_t v88 = a6;
  uint64_t v89 = a7;
  uint64_t v81 = a6;
  uint64_t v90 = a8;
  uint64_t v91 = a10;
  uint64_t v18 = type metadata accessor for ActionContext.IdentifierCodingKeys();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v73 = v18;
  uint64_t v72 = v19;
  uint64_t v67 = sub_24E97E9E0();
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v77 = (char *)&v59 - v20;
  *(void *)&long long v86 = a2;
  *((void *)&v86 + 1) = a3;
  *(void *)&long long v87 = a4;
  *((void *)&v87 + 1) = a5;
  uint64_t v88 = a6;
  uint64_t v89 = a7;
  uint64_t v90 = a8;
  uint64_t v91 = a10;
  uint64_t v21 = a8;
  type metadata accessor for ActionContext.CodingKeys();
  uint64_t v82 = swift_getWitnessTable();
  uint64_t v78 = sub_24E97E9E0();
  uint64_t v76 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v23 = (char *)&v59 - v22;
  uint64_t v70 = a2;
  *(void *)&long long v86 = a2;
  *((void *)&v86 + 1) = a3;
  uint64_t v62 = a3;
  uint64_t v71 = a4;
  *(void *)&long long v87 = a4;
  *((void *)&v87 + 1) = a5;
  uint64_t v88 = v81;
  uint64_t v89 = a7;
  uint64_t v63 = a7;
  uint64_t v90 = v21;
  uint64_t v91 = a10;
  uint64_t v24 = v92;
  uint64_t v75 = type metadata accessor for ActionContext();
  uint64_t v64 = *(void *)(v75 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v75);
  uint64_t v27 = (char *)&v59 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v59 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v59 - v31;
  __swift_project_boxed_opaque_existential_1(v24, v24[3]);
  uint64_t v81 = v23;
  uint64_t v33 = v83;
  sub_24E97EBD0();
  if (!v33)
  {
    uint64_t v61 = v30;
    uint64_t v35 = v77;
    uint64_t v82 = (uint64_t)v27;
    BOOL v60 = v32;
    uint64_t v37 = v78;
    uint64_t v36 = v79;
    uint64_t v83 = 0;
    uint64_t v38 = v81;
    *(void *)&long long v84 = sub_24E97E9D0();
    sub_24E97E610();
    swift_getWitnessTable();
    *(void *)&long long v86 = sub_24E97E800();
    *((void *)&v86 + 1) = v39;
    *(void *)&long long v87 = v40;
    *((void *)&v87 + 1) = v41;
    sub_24E97E7F0();
    swift_getWitnessTable();
    sub_24E97E740();
    char v42 = v84;
    if (v84 == 2
      || (v59 = v86, v84 = v86, v85 = v87, v43 = sub_24E97E750(), uint64_t v38 = v81, (v43 & 1) == 0))
    {
      uint64_t v47 = sub_24E97E890();
      swift_allocError();
      uint64_t v49 = v48;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699072A0);
      uint64_t *v49 = v75;
      sub_24E97E920();
      sub_24E97E880();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, *MEMORY[0x263F8DCB0], v47);
      swift_willThrow();
    }
    else if (v42)
    {
      LOBYTE(v84) = 1;
      uint64_t v51 = v83;
      sub_24E97E910();
      if (!v51)
      {
        LOBYTE(v84) = 0;
        uint64_t v52 = v82;
        uint64_t v53 = v68;
        sub_24E97E9C0();
        uint64_t v57 = v36;
        swift_getTupleTypeMetadata2();
        LOBYTE(v84) = 1;
        sub_24E97E9C0();
        uint64_t v58 = v76;
        (*(void (**)(char *, uint64_t))(v69 + 8))(v57, v53);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v58 + 8))(v81, v37);
        uint64_t v54 = v75;
        swift_storeEnumTagMultiPayload();
        uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
        uint64_t v56 = v60;
        v55(v60, v52, v54);
        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v84) = 0;
      uint64_t v44 = v83;
      sub_24E97E910();
      if (!v44)
      {
        uint64_t v45 = v61;
        uint64_t v46 = v67;
        sub_24E97E9C0();
        (*(void (**)(char *, uint64_t))(v66 + 8))(v35, v46);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v81, v37);
        uint64_t v54 = v75;
        swift_storeEnumTagMultiPayload();
        uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
        uint64_t v56 = v60;
        v55(v60, (uint64_t)v45, v54);
LABEL_15:
        v55(v65, (uint64_t)v56, v54);
        goto LABEL_10;
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v38, v37);
LABEL_10:
    uint64_t v34 = (uint64_t)v92;
    return __swift_destroy_boxed_opaque_existential_1(v34);
  }
  uint64_t v34 = (uint64_t)v24;
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t sub_24E97C1B8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return ActionContext.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(char **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 64), a3, *(void *)(a2 + 72));
}

uint64_t sub_24E97C1F0(void *a1, void *a2)
{
  return ActionContext.encode(to:)(a1, a2);
}

uint64_t sub_24E97C210(uint64_t a1, uint64_t a2)
{
  sub_24E97EB40();
  ActionContext.hash(into:)((uint64_t)v4, a2);
  return sub_24E97EB90();
}

uint64_t sub_24E97C254()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97C270(uint64_t a1, char *a2, uint64_t a3)
{
  return static ActionContext.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24)) & 1;
}

uint64_t sub_24E97C2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 72);
}

uint64_t sub_24E97C2B4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v3[4] = *(void *)(result - 8) + 64;
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v3[5] = v3;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_24E97C398(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v9;
  unint64_t v11 = v6 + v9;
  uint64_t v12 = (v6 + v10) & ~v10;
  if (v12 + *(void *)(v8 + 64) <= v6) {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v13 = v12 + *(void *)(v8 + 64);
  }
  int v14 = *(_DWORD *)(v5 + 80) | v9;
  uint64_t v15 = (*(unsigned char *)(v5 + 80) | v9);
  int v16 = v14 & 0x100000;
  if (v15 > 7 || v16 != 0 || (unint64_t)(v13 + 1) > 0x18)
  {
    uint64_t v19 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v19 + ((v15 + 16) & ~v15));
    swift_retain();
  }
  else
  {
    unsigned int v20 = a2[v13];
    if (v20 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          goto LABEL_22;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v22 = *(_DWORD *)a2;
LABEL_22:
          int v23 = (v22 | ((v20 - 2) << (8 * v13))) + 2;
          unsigned int v24 = v22 + 2;
          if (v13 >= 4) {
            unsigned int v20 = v24;
          }
          else {
            unsigned int v20 = v23;
          }
          break;
        default:
          break;
      }
    }
    (*(void (**)(void *, unsigned __int8 *))(v5 + 16))(a1, a2);
    if (v20 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)v4 + v11) & ~v10, (unint64_t)&a2[v11] & ~v10, v7);
      *((unsigned char *)v4 + v13) = 1;
    }
    else
    {
      *((unsigned char *)v4 + v13) = 0;
    }
  }
  return v4;
}

uint64_t sub_24E97C5AC(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v15 = *(void *)(v4 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v6 = v3 + v5;
  unint64_t v7 = ((v3 + v5) & ~v5) + *(void *)(v15 + 64);
  if (v7 <= v3) {
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  }
  unsigned int v8 = a1[v7];
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a1;
        goto LABEL_12;
      case 2:
        int v10 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v10 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v10 = *(_DWORD *)a1;
LABEL_12:
        int v11 = (v10 | ((v8 - 2) << (8 * v7))) + 2;
        unsigned int v12 = v10 + 2;
        if (v7 >= 4) {
          unsigned int v8 = v12;
        }
        else {
          unsigned int v8 = v11;
        }
        break;
      default:
        break;
    }
  }
  uint64_t result = (*(uint64_t (**)(unsigned __int8 *))(*(void *)(*(void *)(a2 + 16) - 8) + 8))(a1);
  if (v8 == 1)
  {
    int v14 = *(uint64_t (**)(unint64_t, uint64_t))(v15 + 8);
    return v14((unint64_t)&a1[v6] & ~v5, v4);
  }
  return result;
}

uint64_t sub_24E97C784(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v5 + v8;
  uint64_t v10 = *(void *)(v7 + 64);
  if (((v5 + v8) & ~v8) + v10 <= v5) {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v11 = ((v5 + v8) & ~v8) + v10;
  }
  unsigned int v12 = a2[v11];
  if (v12 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *a2;
        goto LABEL_13;
      case 2:
        int v14 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v14 = *(_DWORD *)a2;
LABEL_13:
        int v15 = (v14 | ((v12 - 2) << (8 * v11))) + 2;
        unsigned int v16 = v14 + 2;
        if (v11 >= 4) {
          unsigned int v12 = v16;
        }
        else {
          unsigned int v12 = v15;
        }
        break;
      default:
        break;
    }
  }
  (*(void (**)(uint64_t, unsigned __int8 *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
  if (v12 == 1)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16))((v9 + a1) & ~v8, (unint64_t)&a2[v9] & ~v8, v6);
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(a1 + v11) = v17;
  return a1;
}

unsigned __int8 *sub_24E97C954(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 + 16);
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v6 - 8);
    unint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = *(void *)(v5 - 8);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v11 = v8 + v10;
    uint64_t v12 = (v8 + v10) & ~v10;
    if (v12 + *(void *)(v9 + 64) <= v8) {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v13 = v12 + *(void *)(v9 + 64);
    }
    unsigned int v14 = a1[v13];
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a1;
          goto LABEL_14;
        case 2:
          int v16 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v16 = *(_DWORD *)a1;
LABEL_14:
          int v17 = (v16 | ((v14 - 2) << (8 * v13))) + 2;
          unsigned int v18 = v16 + 2;
          if (v13 >= 4) {
            unsigned int v14 = v18;
          }
          else {
            unsigned int v14 = v17;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v19 = ~v10;
    (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
    if (v14 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v19, v5);
    }
    unsigned int v20 = a2[v13];
    if (v20 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          goto LABEL_28;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v22 = *(_DWORD *)a2;
LABEL_28:
          int v23 = (v22 | ((v20 - 2) << (8 * v13))) + 2;
          unsigned int v24 = v22 + 2;
          if (v13 >= 4) {
            unsigned int v20 = v24;
          }
          else {
            unsigned int v20 = v23;
          }
          break;
        default:
          break;
      }
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v6);
    if (v20 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((unint64_t)&a1[v11] & v19, (unint64_t)&a2[v11] & v19, v5);
      char v25 = 1;
    }
    else
    {
      char v25 = 0;
    }
    a1[v13] = v25;
  }
  return a1;
}

uint64_t sub_24E97CC00(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v5 + v8;
  uint64_t v10 = *(void *)(v7 + 64);
  if (((v5 + v8) & ~v8) + v10 <= v5) {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v11 = ((v5 + v8) & ~v8) + v10;
  }
  unsigned int v12 = a2[v11];
  if (v12 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *a2;
        goto LABEL_13;
      case 2:
        int v14 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v14 = *(_DWORD *)a2;
LABEL_13:
        int v15 = (v14 | ((v12 - 2) << (8 * v11))) + 2;
        unsigned int v16 = v14 + 2;
        if (v11 >= 4) {
          unsigned int v12 = v16;
        }
        else {
          unsigned int v12 = v15;
        }
        break;
      default:
        break;
    }
  }
  (*(void (**)(uint64_t, unsigned __int8 *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1, a2);
  if (v12 == 1)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 32))((v9 + a1) & ~v8, (unint64_t)&a2[v9] & ~v8, v6);
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(a1 + v11) = v17;
  return a1;
}

unsigned __int8 *sub_24E97CDD0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 + 16);
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v6 - 8);
    unint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = *(void *)(v5 - 8);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v11 = v8 + v10;
    uint64_t v12 = (v8 + v10) & ~v10;
    if (v12 + *(void *)(v9 + 64) <= v8) {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v13 = v12 + *(void *)(v9 + 64);
    }
    unsigned int v14 = a1[v13];
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a1;
          goto LABEL_14;
        case 2:
          int v16 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v16 = *(_DWORD *)a1;
LABEL_14:
          int v17 = (v16 | ((v14 - 2) << (8 * v13))) + 2;
          unsigned int v18 = v16 + 2;
          if (v13 >= 4) {
            unsigned int v14 = v18;
          }
          else {
            unsigned int v14 = v17;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v19 = ~v10;
    (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
    if (v14 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v19, v5);
    }
    unsigned int v20 = a2[v13];
    if (v20 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          goto LABEL_28;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v22 = *(_DWORD *)a2;
LABEL_28:
          int v23 = (v22 | ((v20 - 2) << (8 * v13))) + 2;
          unsigned int v24 = v22 + 2;
          if (v13 >= 4) {
            unsigned int v20 = v24;
          }
          else {
            unsigned int v20 = v23;
          }
          break;
        default:
          break;
      }
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v6);
    if (v20 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))((unint64_t)&a1[v11] & v19, (unint64_t)&a2[v11] & v19, v5);
      char v25 = 1;
    }
    else
    {
      char v25 = 0;
    }
    a1[v13] = v25;
  }
  return a1;
}

uint64_t sub_24E97D07C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (((v3 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= v3)
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  else {
    unint64_t v4 = ((v3 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
  }
       + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_23;
  }
  unint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 < 2)
    {
LABEL_23:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_23;
  }
LABEL_15:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_24E97D1FC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v6 = ((v5 + *(unsigned __int8 *)(*(void *)(*(void *)(a4 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a4 + 24) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  if (v6 <= v5) {
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  }
  size_t v7 = v6 + 1;
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v7 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << (8 * v7)) - 254) >> (8 * v7)) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v9 = a2 - 255;
    if (v7 < 4)
    {
      int v10 = (v9 >> (8 * v7)) + 1;
      if (v6 != -1)
      {
        int v12 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if (v7 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v7 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v6 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v7] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v7] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x24E97D410);
      case 4:
        *(_DWORD *)&a1[v7] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v7] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v6] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_24E97D438(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (((v2 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80))
     + *(void *)(*(void *)(*(void *)(a2 + 24) - 8) + 64) <= v2)
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  else {
    unint64_t v3 = ((v2 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80))
  }
       + *(void *)(*(void *)(*(void *)(a2 + 24) - 8) + 64);
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_24E97D53C(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 > 1)
  {
    uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
    unint64_t v6 = *(void *)(v4 + 64);
    if (((v6 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= v6)
      size_t v7 = *(void *)(v4 + 64);
    else {
      size_t v7 = ((v6 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
    }
         + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
    unsigned int v8 = a2 - 2;
    if (v7 < 4)
    {
      unsigned int v9 = v8 >> (8 * v7);
      int v10 = v8 & ~(-1 << (8 * v7));
      a1[v7] = v9 + 2;
      bzero(a1, v7);
      if (v7 == 3)
      {
        *(_WORD *)a1 = v10;
        a1[2] = BYTE2(v10);
      }
      else if (v7 == 2)
      {
        *(_WORD *)a1 = v10;
      }
      else
      {
        *a1 = v10;
      }
    }
    else
    {
      a1[v7] = 2;
      bzero(a1, v7);
      *(_DWORD *)a1 = v8;
    }
  }
  else
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    if (((v5 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) > v5)
      unint64_t v5 = ((v5 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
         + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
    a1[v5] = a2;
  }
}

uint64_t sub_24E97D6D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

unsigned char *sub_24E97D6E4(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E97D780);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *sub_24E97D7A8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E97D874);
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

uint64_t sub_24E97D89C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D8B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D8D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D8F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D90C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D928()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D944()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D960()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D97C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E97D998()
{
  return sub_24E8F81AC();
}

BOOL sub_24E97D9A4(int a1, int a2)
{
  return sub_24E8F819C(a1, a2);
}

uint64_t sub_24E97D9B0(char a1)
{
  return sub_24E97AA28(a1);
}

uint64_t sub_24E97D9E0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E97D9F0()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24E97DA00()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_24E97DA10()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24E97DA20()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24E97DA30()
{
  return MEMORY[0x270EF0578]();
}

uint64_t sub_24E97DA40()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_24E97DA50()
{
  return MEMORY[0x270EF0600]();
}

uint64_t sub_24E97DA60()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_24E97DA70()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_24E97DA80()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24E97DA90()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24E97DAA0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24E97DAB0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24E97DAC0()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_24E97DAD0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E97DAE0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24E97DAF0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24E97DB00()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E97DB10()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24E97DB20()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24E97DB30()
{
  return MEMORY[0x270F5D370]();
}

uint64_t sub_24E97DB40()
{
  return MEMORY[0x270F61F58]();
}

uint64_t sub_24E97DB50()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24E97DB60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E97DB70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E97DB80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E97DB90()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_24E97DBA0()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_24E97DBB0()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24E97DBC0()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24E97DBD0()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24E97DBE0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24E97DBF0()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_24E97DC00()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24E97DC10()
{
  return MEMORY[0x270EFF390]();
}

uint64_t sub_24E97DC20()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24E97DC30()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24E97DC40()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24E97DC50()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24E97DC60()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24E97DC70()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_24E97DC80()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_24E97DC90()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_24E97DCA0()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_24E97DCB0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24E97DCC0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24E97DCD0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24E97DCE0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24E97DCF0()
{
  return MEMORY[0x270F00800]();
}

uint64_t sub_24E97DD00()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24E97DD10()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24E97DD20()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24E97DD30()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24E97DD40()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24E97DD50()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24E97DD60()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24E97DD70()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24E97DD80()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24E97DD90()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24E97DDA0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24E97DDB0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24E97DDC0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24E97DDD0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24E97DDE0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24E97DDF0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_24E97DE00()
{
  return MEMORY[0x270F02018]();
}

uint64_t sub_24E97DE10()
{
  return MEMORY[0x270F02580]();
}

uint64_t sub_24E97DE20()
{
  return MEMORY[0x270F02588]();
}

uint64_t sub_24E97DE30()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_24E97DE40()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_24E97DE50()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_24E97DE60()
{
  return MEMORY[0x270F02908]();
}

uint64_t sub_24E97DE70()
{
  return MEMORY[0x270F02910]();
}

uint64_t sub_24E97DE80()
{
  return MEMORY[0x270F02918]();
}

uint64_t sub_24E97DE90()
{
  return MEMORY[0x270F02920]();
}

uint64_t sub_24E97DEA0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24E97DEB0()
{
  return MEMORY[0x270F02A10]();
}

uint64_t sub_24E97DEC0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24E97DED0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24E97DEE0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24E97DEF0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24E97DF00()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24E97DF10()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24E97DF20()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24E97DF30()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24E97DF40()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24E97DF50()
{
  return MEMORY[0x270F2B438]();
}

uint64_t sub_24E97DF60()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24E97DF70()
{
  return MEMORY[0x270F2B458]();
}

uint64_t sub_24E97DF80()
{
  return MEMORY[0x270F87730]();
}

uint64_t sub_24E97DF90()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24E97DFA0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24E97DFB0()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24E97DFC0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24E97DFD0()
{
  return MEMORY[0x270F036A0]();
}

uint64_t sub_24E97DFE0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24E97DFF0()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_24E97E000()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_24E97E010()
{
  return MEMORY[0x270F039F0]();
}

uint64_t sub_24E97E020()
{
  return MEMORY[0x270F03A00]();
}

uint64_t sub_24E97E030()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_24E97E040()
{
  return MEMORY[0x270F03E20]();
}

uint64_t sub_24E97E050()
{
  return MEMORY[0x270F03F78]();
}

uint64_t sub_24E97E060()
{
  return MEMORY[0x270F03F98]();
}

uint64_t sub_24E97E070()
{
  return MEMORY[0x270F03FA8]();
}

uint64_t sub_24E97E080()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24E97E090()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_24E97E0A0()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24E97E0B0()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24E97E0C0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24E97E0D0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24E97E0E0()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24E97E0F0()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24E97E100()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24E97E110()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24E97E120()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24E97E130()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24E97E140()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24E97E150()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24E97E160()
{
  return MEMORY[0x270F04758]();
}

uint64_t sub_24E97E170()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24E97E180()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24E97E190()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_24E97E1A0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_24E97E1B0()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_24E97E1C0()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_24E97E1D0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_24E97E1E0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_24E97E1F0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_24E97E200()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24E97E210()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24E97E220()
{
  return MEMORY[0x270F25280]();
}

uint64_t sub_24E97E230()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24E97E240()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_24E97E250()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24E97E260()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24E97E270()
{
  return MEMORY[0x270F05188]();
}

uint64_t sub_24E97E280()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24E97E290()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24E97E2A0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_24E97E2B0()
{
  return MEMORY[0x270F25288]();
}

uint64_t sub_24E97E2C0()
{
  return MEMORY[0x270F252A0]();
}

uint64_t sub_24E97E2D0()
{
  return MEMORY[0x270F252B0]();
}

uint64_t sub_24E97E2E0()
{
  return MEMORY[0x270F252C0]();
}

uint64_t sub_24E97E300()
{
  return MEMORY[0x270F252D0]();
}

uint64_t sub_24E97E310()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24E97E320()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24E97E330()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24E97E340()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24E97E350()
{
  return MEMORY[0x270F253D0]();
}

uint64_t sub_24E97E360()
{
  return MEMORY[0x270F253E8]();
}

uint64_t sub_24E97E370()
{
  return MEMORY[0x270F45990]();
}

uint64_t sub_24E97E380()
{
  return MEMORY[0x270F45998]();
}

uint64_t sub_24E97E390()
{
  return MEMORY[0x270F45A10]();
}

uint64_t sub_24E97E3A0()
{
  return MEMORY[0x270F45A30]();
}

uint64_t sub_24E97E3B0()
{
  return MEMORY[0x270F45A40]();
}

uint64_t sub_24E97E3C0()
{
  return MEMORY[0x270F45A60]();
}

uint64_t sub_24E97E3D0()
{
  return MEMORY[0x270F45D88]();
}

uint64_t sub_24E97E3E0()
{
  return MEMORY[0x270F45DA8]();
}

uint64_t sub_24E97E3F0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24E97E400()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_24E97E420()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24E97E430()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24E97E440()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24E97E450()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24E97E460()
{
  return MEMORY[0x270F9D400]();
}

uint64_t sub_24E97E470()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24E97E480()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24E97E490()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_24E97E4A0()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24E97E4B0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24E97E4C0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24E97E4D0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24E97E4E0()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24E97E4F0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24E97E500()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E97E510()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24E97E520()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E97E530()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E97E540()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24E97E550()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_24E97E560()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24E97E5A0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24E97E5B0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24E97E5C0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_24E97E5D0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_24E97E5E0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24E97E5F0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24E97E600()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_24E97E610()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24E97E620()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E97E640()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24E97E650()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24E97E660()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24E97E670()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_24E97E680()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_24E97E690()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24E97E6A0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24E97E6B0()
{
  return MEMORY[0x270F9DF18]();
}

uint64_t sub_24E97E6C0()
{
  return MEMORY[0x270F9DF20]();
}

uint64_t sub_24E97E6D0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24E97E6E0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24E97E6F0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24E97E700()
{
  return MEMORY[0x270F9E0B0]();
}

uint64_t sub_24E97E710()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_24E97E720()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24E97E730()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24E97E740()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24E97E750()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24E97E760()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_24E97E770()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24E97E780()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E97E790()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E97E7A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E97E7B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E97E7C0()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_24E97E7D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E97E7E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E97E7F0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24E97E800()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24E97E810()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24E97E820()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_24E97E830()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24E97E840()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24E97E850()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_24E97E860()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E97E870()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_24E97E880()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24E97E890()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24E97E8A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E97E8B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E97E8C0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E97E8D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E97E8E0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E97E8F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E97E900()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_24E97E910()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24E97E920()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24E97E930()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24E97E940()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_24E97E950()
{
  return MEMORY[0x270F9F288]();
}

uint64_t sub_24E97E960()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24E97E970()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24E97E980()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24E97E990()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24E97E9A0()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_24E97E9B0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24E97E9C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24E97E9D0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24E97E9E0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24E97E9F0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24E97EA00()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24E97EA10()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_24E97EA20()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_24E97EA30()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24E97EA40()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24E97EA50()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24E97EA60()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24E97EA70()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_24E97EA80()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24E97EA90()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24E97EAA0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24E97EAB0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24E97EAC0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E97EAD0()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_24E97EAE0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E97EAF0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24E97EB00()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E97EB10()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E97EB20()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E97EB30()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E97EB40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E97EB50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E97EB60()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24E97EB70()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24E97EB80()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24E97EB90()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E97EBA0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24E97EBB0()
{
  return MEMORY[0x270F9FD00]();
}

uint64_t sub_24E97EBC0()
{
  return MEMORY[0x270F9FD08]();
}

uint64_t sub_24E97EBD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24E97EBE0()
{
  return MEMORY[0x270F9FD98]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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