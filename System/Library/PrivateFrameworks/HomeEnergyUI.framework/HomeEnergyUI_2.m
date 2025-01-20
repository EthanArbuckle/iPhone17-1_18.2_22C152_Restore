char *assignWithCopy for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_252366D40();
  v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v11 = a3[8];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(void *)v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[9];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_252366F20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  a1[a3[10]] = a2[a3[10]];
  a1[a3[11]] = a2[a3[11]];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  uint64_t v9 = sub_252366D40();
  v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  uint64_t v11 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  uint64_t v14 = sub_252366F20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v15] = a2[v15];
  uint64_t v16 = a3[13];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  return a1;
}

char *assignWithTake for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_252366D40();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  uint64_t v12 = a3[8];
  v13 = &a1[v12];
  uint64_t v14 = (uint64_t *)&a2[v12];
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *(void *)v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[9];
  v18 = &a1[v17];
  v19 = &a2[v17];
  uint64_t v20 = sub_252366F20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v21] = a2[v21];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UtilityRateInfoSnapshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25235F2A0);
}

uint64_t sub_25235F2A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252366D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[8] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = sub_252366F20();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[9];
    return v14(v16, a2, v15);
  }
}

uint64_t storeEnumTagSinglePayload for UtilityRateInfoSnapshot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25235F3E8);
}

uint64_t sub_25235F3E8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_252366D40();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[8] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = sub_252366F20();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

uint64_t sub_25235F51C()
{
  uint64_t result = sub_252366D40();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_252366F20();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UtilityRateInfoError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25235F6ECLL);
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

ValueMetadata *type metadata accessor for UtilityRateInfoError()
{
  return &type metadata for UtilityRateInfoError;
}

uint64_t sub_25235F724(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2523696A0();
  __break(1u);
  return result;
}

char *sub_25235F818(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2523696A0();
  __break(1u);
  return result;
}

uint64_t sub_25235F904(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
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
  uint64_t result = sub_2523696A0();
  __break(1u);
  return result;
}

unint64_t sub_25235FA60()
{
  unint64_t result = qword_269BFEB80;
  if (!qword_269BFEB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269BFEB80);
  }
  return result;
}

uint64_t sub_25235FAB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25235FAFC(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for EnergyForecastViewMetrics()
{
  return &type metadata for EnergyForecastViewMetrics;
}

uint64_t *sub_25235FB6C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2523670A0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    unint64_t v12 = (char *)a1 + v11;
    unint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_252366D40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v16 = a3[9];
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_252367A10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[10];
    uint64_t v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_252368FC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25235FE64(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2523670A0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = sub_252366D40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_252367A10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_252368FC0();
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    return v12(v10, v11);
  }
  else
  {
    return swift_release();
  }
}

char *sub_252360054(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2523670A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_252366D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  a1[v13] = a2[v13];
  uint64_t v14 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_252367A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  else
  {
    *(void *)uint64_t v15 = *(void *)v16;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = a3[10];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = sub_252368FC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  else
  {
    *(void *)uint64_t v19 = *(void *)v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_2523602FC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2523670A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_252366D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  if (a1 != a2)
  {
    uint64_t v16 = a3[9];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    sub_2521F9EF0((uint64_t)&a1[v16], &qword_26B226D68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_252367A10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *(void *)uint64_t v17 = *(void *)v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[10];
    uint64_t v21 = &a1[v20];
    v22 = &a2[v20];
    sub_2521F9EF0((uint64_t)&a1[v20], &qword_26B226D48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_252368FC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *(void *)uint64_t v21 = *(void *)v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_252360638(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2523670A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_252366D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  a1[v13] = a2[v13];
  uint64_t v14 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_252367A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_252368FC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  return a1;
}

char *sub_2523608F8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2523670A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_252366D40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  a1[v16] = a2[v16];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  if (a1 != a2)
  {
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    sub_2521F9EF0((uint64_t)&a1[v17], &qword_26B226D68);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_252367A10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    uint64_t v22 = a3[10];
    uint64_t v23 = &a1[v22];
    v24 = &a2[v22];
    sub_2521F9EF0((uint64_t)&a1[v22], &qword_26B226D48);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_252368FC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_252360C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252360C5C);
}

uint64_t sub_252360C5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_11:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_252366D40();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_10:
    uint64_t v10 = a1 + v13;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_11;
  }
  if (a2 == 254)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 + a3[7]);
    if (v14 >= 2) {
      return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D90);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v12 = *(void *)(v16 - 8);
    uint64_t v13 = a3[9];
    goto LABEL_10;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBCF8);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a3[10];
  return v18(v20, a2, v19);
}

uint64_t sub_252360E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252360E54);
}

uint64_t sub_252360E54(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_252366D40();
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7]) = a2 + 1;
    return result;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D90);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[9];
    goto LABEL_9;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBCF8);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[10];
  return v18(v20, a2, a2, v19);
}

uint64_t type metadata accessor for EnergyForecastChart()
{
  uint64_t result = qword_26B226AC0;
  if (!qword_26B226AC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_252361074()
{
  sub_25236125C(319, &qword_26B226C68, MEMORY[0x263F49A58], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_252366D40();
    if (v1 <= 0x3F)
    {
      sub_25236125C(319, &qword_26B226D70, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        sub_25236125C(319, (unint64_t *)&qword_26B226D50, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_25236125C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_2523612C0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2523612DC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226AF8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for FeaturedInterval(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v30 = (uint64_t)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v28 = (uint64_t)&v24 - v14;
  uint64_t v15 = *(void *)(a3 + 16);
  if (!v15) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v16 = *(void *)(sub_252367050() - 8);
  uint64_t v17 = a3 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v25 = v11;
  uint64_t v18 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v29 = *(void *)(v16 + 72);
  uint64_t v24 = a3;
  swift_bridgeObjectRetain();
  unint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v26 = v10;
  uint64_t v27 = a2;
  do
  {
    a1(v17);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v19;
    }
    if ((*v18)(v9, 1, v10) == 1)
    {
      sub_2521F9EF0((uint64_t)v9, &qword_26B226AF8);
    }
    else
    {
      uint64_t v20 = v28;
      sub_252364050((uint64_t)v9, v28, type metadata accessor for FeaturedInterval);
      sub_252364050(v20, v30, type metadata accessor for FeaturedInterval);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v19 = sub_2523591CC(0, *(void *)(v19 + 16) + 1, 1, v19);
      }
      unint64_t v22 = *(void *)(v19 + 16);
      unint64_t v21 = *(void *)(v19 + 24);
      if (v22 >= v21 >> 1) {
        unint64_t v19 = sub_2523591CC(v21 > 1, v22 + 1, 1, v19);
      }
      *(void *)(v19 + 16) = v22 + 1;
      sub_252364050(v30, v19+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v22, type metadata accessor for FeaturedInterval);
      uint64_t v10 = v26;
    }
    v17 += v29;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_25236160C@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v97 = a4;
  v103 = a3;
  v99 = a2;
  uint64_t v116 = a5;
  uint64_t v115 = type metadata accessor for FeaturedInterval(0);
  uint64_t v114 = *(void *)(v115 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v115);
  uint64_t v8 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v105 = (char *)&v93 - v9;
  uint64_t v10 = sub_2523670C0();
  uint64_t v101 = *(void *)(v10 - 8);
  uint64_t v102 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v107 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v108 = (char *)&v93 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226A80);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  v106 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v93 - v17;
  uint64_t v19 = sub_252366D40();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v112 = v19;
  uint64_t v113 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v100 = (char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v104 = (char *)&v93 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v93 - v26;
  MEMORY[0x270FA5388](v25);
  v110 = (char *)&v93 - v28;
  uint64_t v29 = sub_252367050();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  v32 = (char *)&v93 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B226C90 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_2523674B0();
  uint64_t v34 = __swift_project_value_buffer(v33, (uint64_t)qword_26B226C78);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  uint64_t v111 = a1;
  v35(v32, a1, v29);
  uint64_t v96 = v34;
  v36 = sub_252367490();
  os_log_type_t v37 = sub_2523693F0();
  BOOL v38 = os_log_type_enabled(v36, v37);
  v98 = v8;
  v109 = v27;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    v95 = v18;
    uint64_t v40 = v39;
    uint64_t v94 = swift_slowAlloc();
    v119[0] = v94;
    *(_DWORD *)uint64_t v40 = 136315394;
    uint64_t v117 = sub_252359200(0xD000000000000041, 0x8000000252379180, v119);
    sub_2523694E0();
    *(_WORD *)(v40 + 12) = 2080;
    uint64_t v41 = EnergyWindow.description.getter();
    uint64_t v117 = sub_252359200(v41, v42, v119);
    sub_2523694E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
    _os_log_impl(&dword_2521F1000, v36, v37, "\t%s Checking energyInterval: %s", (uint8_t *)v40, 0x16u);
    uint64_t v43 = v94;
    swift_arrayDestroy();
    MEMORY[0x2533B3730](v43, -1, -1);
    uint64_t v44 = v40;
    uint64_t v18 = v95;
    MEMORY[0x2533B3730](v44, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  }

  sub_252367040();
  uint64_t v46 = v112;
  uint64_t v45 = v113;
  v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v113 + 48);
  if (v47(v18, 1, v112) == 1) {
    goto LABEL_9;
  }
  v48 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  v49 = v110;
  v48(v110, v18, v46);
  uint64_t v18 = v106;
  sub_252367030();
  if (v47(v18, 1, v46) == 1)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v46);
LABEL_9:
    sub_2521F9EF0((uint64_t)v18, &qword_26B226A80);
LABEL_10:
    uint64_t v50 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v114 + 56))(v116, v50, 1, v115);
  }
  v48(v109, v18, v46);
  sub_252367020();
  uint64_t v53 = v101;
  uint64_t v52 = v102;
  (*(void (**)(char *, void, uint64_t))(v101 + 104))(v107, *MEMORY[0x263F49A70], v102);
  sub_252364260(&qword_26B226C70, MEMORY[0x263F49A78]);
  sub_252369250();
  sub_252369250();
  if (v119[0] == v117 && v119[1] == v118)
  {
    swift_bridgeObjectRelease_n();
    v54 = *(void (**)(char *, uint64_t))(v53 + 8);
    v54(v107, v52);
    v54(v108, v52);
    v55 = v103;
  }
  else
  {
    char v56 = sub_2523696F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v57 = *(void (**)(char *, uint64_t))(v53 + 8);
    v57(v107, v52);
    v57(v108, v52);
    v55 = v103;
    if ((v56 & 1) == 0)
    {
      v63 = *(void (**)(char *, uint64_t))(v45 + 8);
      v63(v109, v46);
      v64 = v110;
      goto LABEL_21;
    }
  }
  v58 = v110;
  v59 = v99;
  char v60 = sub_252366C70();
  v61 = v109;
  if ((v60 & 1) == 0)
  {
    v63 = *(void (**)(char *, uint64_t))(v45 + 8);
    v63(v109, v46);
    v64 = v58;
LABEL_21:
    v63(v64, v46);
    goto LABEL_10;
  }
  if (sub_252366C70())
  {
    v62 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v62(v104, v55, v46);
  }
  else
  {
    char v65 = sub_252366C60();
    v62 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    if (v65)
    {
      v66 = v104;
      v67 = v59;
    }
    else
    {
      v66 = v104;
      v67 = v58;
    }
    v62(v66, v67, v46);
  }
  char v68 = sub_252366C70();
  v69 = v100;
  if (v68)
  {
    v70 = v100;
    v71 = v55;
  }
  else if (sub_252366C60())
  {
    v70 = v69;
    v71 = v59;
  }
  else
  {
    v70 = v69;
    v71 = v61;
  }
  v62(v70, v71, v46);
  v72 = self;
  v73 = &selRef_systemBlackColor;
  if ((v97 & 1) == 0) {
    v73 = &selRef_systemWhiteColor;
  }
  uint64_t v74 = MEMORY[0x2533B2010]([v72 *v73]);
  v62(v105, v104, v46);
  sub_252366B80();
  uint64_t v76 = v75;
  if (qword_26B227170 != -1) {
    swift_once();
  }
  uint64_t v77 = qword_26B229B50;
  uint64_t v78 = qword_26B227148;
  swift_retain();
  swift_retain();
  if (v78 != -1) {
    swift_once();
  }
  v119[0] = qword_26B229B28;
  swift_retain();
  uint64_t v79 = sub_252367BA0();
  v80 = (int *)v115;
  uint64_t v81 = (uint64_t)v105;
  *(void *)&v105[*(int *)(v115 + 24)] = 0x4020000000000000;
  sub_252366D70();
  *(void *)(v81 + v80[5]) = v76;
  *(void *)(v81 + v80[7]) = v77;
  *(void *)(v81 + v80[8]) = v74;
  *(unsigned char *)(v81 + v80[9]) = 1;
  *(void *)(v81 + v80[10]) = v79;
  *(unsigned char *)(v81 + v80[11]) = 0;
  *(unsigned char *)(v81 + v80[12]) = 0;
  uint64_t v82 = (uint64_t)v98;
  sub_2523640B8(v81, (uint64_t)v98, type metadata accessor for FeaturedInterval);
  v83 = sub_252367490();
  os_log_type_t v84 = sub_2523693F0();
  if (os_log_type_enabled(v83, v84))
  {
    uint64_t v85 = swift_slowAlloc();
    uint64_t v86 = swift_slowAlloc();
    uint64_t v111 = v74;
    v108 = (char *)v86;
    v119[0] = v86;
    *(_DWORD *)uint64_t v85 = 136315394;
    uint64_t v117 = sub_252359200(0xD000000000000041, 0x8000000252379180, v119);
    sub_2523694E0();
    *(_WORD *)(v85 + 12) = 2080;
    uint64_t v87 = (uint64_t)v98;
    uint64_t v88 = sub_25230ADCC();
    uint64_t v117 = sub_252359200(v88, v89, v119);
    sub_2523694E0();
    swift_bridgeObjectRelease();
    sub_252364120(v87, type metadata accessor for FeaturedInterval);
    _os_log_impl(&dword_2521F1000, v83, v84, "\t\t%s made %s", (uint8_t *)v85, 0x16u);
    v90 = v108;
    swift_arrayDestroy();
    MEMORY[0x2533B3730](v90, -1, -1);
    MEMORY[0x2533B3730](v85, -1, -1);
    swift_release();

    v91 = *(void (**)(char *, uint64_t))(v45 + 8);
    v91(v100, v46);
    v91(v104, v46);
    v91(v109, v46);
    v91(v110, v46);
  }
  else
  {

    sub_252364120(v82, type metadata accessor for FeaturedInterval);
    swift_release();
    v92 = *(void (**)(char *, uint64_t))(v45 + 8);
    v92(v100, v46);
    v92(v104, v46);
    v92(v61, v46);
    v92(v110, v46);
  }
  sub_252364050((uint64_t)v105, v116, type metadata accessor for FeaturedInterval);
  uint64_t v50 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v114 + 56))(v116, v50, 1, v115);
}

double sub_2523622F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v123 = a5;
  int v124 = a6;
  LODWORD(v125) = a4;
  uint64_t v122 = a7;
  uint64_t v120 = sub_2523670C0();
  uint64_t v119 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v118 = (char *)&v110 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v116 = (uint64_t)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v110 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v110 - v17;
  uint64_t v19 = sub_252366D40();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v129 = (char *)&v110 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v127 = (char *)&v110 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v126 = (char *)&v110 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v110 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v110 - v30;
  uint64_t v121 = a3;
  uint64_t v132 = a1;
  sub_252363218(a3, a1, (uint64_t)&v110 - v30);
  sub_252367230();
  v133 = v31;
  v134 = v29;
  sub_252366BC0();
  if (qword_26B226C90 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_2523674B0();
  uint64_t v128 = __swift_project_value_buffer(v32, (uint64_t)qword_26B226C78);
  uint64_t v33 = sub_252367490();
  os_log_type_t v34 = sub_2523693F0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v130 = v20;
  uint64_t v131 = v19;
  uint64_t v115 = v16;
  if (v35)
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(void *)&v136[0] = v37;
    *(_DWORD *)uint64_t v36 = 136315394;
    uint64_t v135 = sub_252359200(0xD000000000000064, 0x8000000252379110, (uint64_t *)v136);
    uint64_t v19 = v131;
    sub_2523694E0();
    *(_WORD *)(v36 + 12) = 2048;
    uint64_t v135 = a2;
    uint64_t v20 = v130;
    sub_2523694E0();
    _os_log_impl(&dword_2521F1000, v33, v34, "%s Showing a %ld-hour chart", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533B3730](v37, -1, -1);
    MEMORY[0x2533B3730](v36, -1, -1);
  }

  BOOL v38 = v127;
  sub_2521F9E8C(v132, (uint64_t)v18, &qword_26B226C60);
  uint64_t v39 = v20 + 16;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v41 = v126;
  v40(v126, v133, v19);
  v40(v38, v134, v19);
  unint64_t v42 = sub_252367490();
  int v43 = sub_252369420();
  BOOL v44 = os_log_type_enabled(v42, (os_log_type_t)v43);
  uint64_t v117 = v40;
  if (!v44)
  {
    sub_2521F9EF0((uint64_t)v18, &qword_26B226C60);
    uint64_t v50 = *(void (**)(char *, uint64_t))(v20 + 8);
    v50(v41, v19);
    v127 = (char *)v50;
    v50(v38, v19);

    goto LABEL_12;
  }
  int v112 = v43;
  os_log_t v113 = v42;
  uint64_t v45 = swift_slowAlloc();
  uint64_t v111 = swift_slowAlloc();
  *(void *)&v136[0] = v111;
  *(_DWORD *)uint64_t v45 = 136316162;
  uint64_t v135 = sub_252359200(0xD000000000000064, 0x8000000252379110, (uint64_t *)v136);
  sub_2523694E0();
  *(_WORD *)(v45 + 12) = 2080;
  uint64_t v46 = (uint64_t)v115;
  sub_2521F9E8C((uint64_t)v18, (uint64_t)v115, &qword_26B226C60);
  uint64_t v47 = sub_2523670A0();
  uint64_t v48 = *(void *)(v47 - 8);
  int v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47);
  uint64_t v114 = v39;
  if (v49 == 1)
  {
    sub_2521F9EF0(v46, &qword_26B226C60);
LABEL_10:
    swift_bridgeObjectRelease();
    unint64_t v53 = 0xE700000000000000;
    uint64_t v51 = 0x3E5954504D453CLL;
    goto LABEL_11;
  }
  uint64_t v51 = sub_252367080();
  unint64_t v53 = v52;
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
  if (!v53) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v135 = sub_252359200(v51, v53, (uint64_t *)v136);
  sub_2523694E0();
  swift_bridgeObjectRelease();
  sub_2521F9EF0((uint64_t)v18, &qword_26B226C60);
  *(_WORD *)(v45 + 22) = 2080;
  uint64_t v54 = v119;
  v55 = v118;
  uint64_t v56 = v120;
  (*(void (**)(char *, void, uint64_t))(v119 + 104))(v118, *MEMORY[0x263F49A70], v120);
  uint64_t v57 = sub_2523670B0();
  unint64_t v59 = v58;
  (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
  uint64_t v135 = sub_252359200(v57, v59, (uint64_t *)v136);
  sub_2523694E0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v45 + 32) = 2080;
  char v60 = v126;
  uint64_t v61 = sub_252366D10();
  uint64_t v135 = sub_252359200(v61, v62, (uint64_t *)v136);
  sub_2523694E0();
  swift_bridgeObjectRelease();
  v63 = *(void (**)(char *, uint64_t))(v130 + 8);
  v63(v60, v19);
  *(_WORD *)(v45 + 42) = 2080;
  v64 = v127;
  uint64_t v65 = sub_252366D10();
  uint64_t v135 = sub_252359200(v65, v66, (uint64_t *)v136);
  sub_2523694E0();
  swift_bridgeObjectRelease();
  v127 = (char *)v63;
  v63(v64, v19);
  os_log_t v67 = v113;
  _os_log_impl(&dword_2521F1000, v113, (os_log_type_t)v112, "--Start: %s energyWindows: %s, making chart featuring %s hours from %s to %s", (uint8_t *)v45, 0x34u);
  uint64_t v68 = v111;
  swift_arrayDestroy();
  MEMORY[0x2533B3730](v68, -1, -1);
  MEMORY[0x2533B3730](v45, -1, -1);

  uint64_t v40 = v117;
LABEL_12:
  uint64_t v69 = v116;
  sub_2521F9E8C(v132, v116, &qword_26B226C60);
  uint64_t v70 = sub_2523670A0();
  uint64_t v71 = *(void *)(v70 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v69, 1, v70) == 1)
  {
    sub_2521F9EF0(v69, &qword_26B226C60);
  }
  else
  {
    uint64_t v72 = sub_252367090();
    uint64_t v73 = (*(uint64_t (**)(uint64_t, uint64_t))(v71 + 8))(v69, v70);
    if (v72)
    {
      MEMORY[0x270FA5388](v73);
      uint64_t v74 = v133;
      *(&v110 - 4) = (uint64_t)v134;
      *(&v110 - 3) = (uint64_t)v74;
      *((unsigned char *)&v110 - 16) = v125 & 1;
      unint64_t v75 = sub_2523612DC((void (*)(uint64_t))sub_252364030, (uint64_t)(&v110 - 6), v72);
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  unint64_t v75 = MEMORY[0x263F8EE78];
LABEL_17:
  swift_bridgeObjectRetain();
  uint64_t v76 = sub_252367490();
  os_log_type_t v77 = sub_2523693F0();
  BOOL v78 = os_log_type_enabled(v76, v77);
  v126 = (char *)v75;
  if (v78)
  {
    uint64_t v79 = swift_slowAlloc();
    uint64_t v128 = swift_slowAlloc();
    *(void *)&v136[0] = v128;
    *(_DWORD *)uint64_t v79 = 136315650;
    uint64_t v135 = sub_252359200(0xD000000000000064, 0x8000000252379110, (uint64_t *)v136);
    sub_2523694E0();
    *(_WORD *)(v79 + 12) = 2048;
    uint64_t v135 = *(void *)(v75 + 16);
    sub_2523694E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v79 + 22) = 2080;
    uint64_t v116 = v79 + 24;
    uint64_t v80 = v119;
    uint64_t v81 = v118;
    uint64_t v82 = v120;
    (*(void (**)(char *, void, uint64_t))(v119 + 104))(v118, *MEMORY[0x263F49A70], v120);
    uint64_t v83 = sub_2523670B0();
    unint64_t v85 = v84;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v82);
    uint64_t v135 = sub_252359200(v83, v85, (uint64_t *)v136);
    uint64_t v40 = v117;
    uint64_t v19 = v131;
    sub_2523694E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2521F1000, v76, v77, "--End: %s Found %ld %s energyIntervals", (uint8_t *)v79, 0x20u);
    uint64_t v86 = v128;
    swift_arrayDestroy();
    MEMORY[0x2533B3730](v86, -1, -1);
    MEMORY[0x2533B3730](v79, -1, -1);

    if ((v125 & 1) == 0)
    {
LABEL_19:
      if (qword_26B227158 != -1) {
        swift_once();
      }
      uint64_t v87 = &qword_26B229B38;
      goto LABEL_26;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    if ((v125 & 1) == 0) {
      goto LABEL_19;
    }
  }
  if (qword_269BFB378 != -1) {
    swift_once();
  }
  uint64_t v87 = &qword_269C02D08;
LABEL_26:
  uint64_t v125 = *v87;
  swift_retain();
  v40(v129, v133, v19);
  sub_252366B80();
  uint64_t v89 = v88;
  if (qword_26B227150 != -1) {
    swift_once();
  }
  *(void *)&v136[0] = qword_26B229B30;
  swift_retain();
  uint64_t v128 = sub_252367BA0();
  if (qword_26B226B00 != -1) {
    swift_once();
  }
  uint64_t v90 = unk_26B229B00;
  uint64_t v120 = qword_26B229AF8;
  uint64_t v91 = qword_26B226AE0;
  swift_bridgeObjectRetain();
  if (v91 != -1) {
    swift_once();
  }
  uint64_t v93 = qword_26B229AE8;
  uint64_t v92 = unk_26B229AF0;
  uint64_t v94 = qword_26B226C48;
  swift_bridgeObjectRetain();
  if (v94 != -1) {
    swift_once();
  }
  uint64_t v95 = qword_26B229B18;
  uint64_t v96 = unk_26B229B20;
  uint64_t v97 = qword_26B227160;
  swift_bridgeObjectRetain();
  if (v97 != -1) {
    swift_once();
  }
  uint64_t v98 = qword_26B229B40;
  swift_retain();
  sub_252367AA0();
  sub_2521F9EF0(v121, &qword_26B226A80);
  sub_2521F9EF0(v132, &qword_26B226C60);
  uint64_t v100 = v130;
  uint64_t v99 = v131;
  uint64_t v101 = (void (*)(char *, uint64_t))v127;
  ((void (*)(char *, uint64_t))v127)(v134, v131);
  v101(v133, v99);
  uint64_t v102 = v122;
  (*(void (**)(uint64_t, char *, uint64_t))(v100 + 32))(v122, v129, v99);
  v103 = (int *)type metadata accessor for FeaturedHoursInfo(0);
  *(void *)(v102 + v103[5]) = v89;
  *(void *)(v102 + v103[6]) = v126;
  *(void *)(v102 + v103[7]) = v128;
  v104 = (uint64_t *)(v102 + v103[8]);
  uint64_t *v104 = v120;
  v104[1] = v90;
  v105 = (uint64_t *)(v102 + v103[9]);
  uint64_t *v105 = v93;
  v105[1] = v92;
  v106 = (uint64_t *)(v102 + v103[10]);
  uint64_t *v106 = v95;
  v106[1] = v96;
  *(void *)(v102 + v103[11]) = v98;
  *(void *)(v102 + v103[12]) = v125;
  uint64_t v107 = v102 + v103[13];
  double result = *(double *)v136;
  long long v109 = v136[1];
  *(_OWORD *)uint64_t v107 = v136[0];
  *(_OWORD *)(v107 + 16) = v109;
  *(void *)(v107 + 32) = v137;
  *(unsigned char *)(v102 + v103[14]) = v123 & 1;
  *(unsigned char *)(v102 + v103[15]) = v124 & 1;
  return result;
}

uint64_t sub_252363218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v44 = (void (*)(unsigned char *, unsigned char *, uint64_t))a2;
  uint64_t v45 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v41[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C50);
  MEMORY[0x270FA5388](v7 - 8);
  int v43 = &v41[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226A80);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = &v41[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v41[-v13];
  uint64_t v15 = sub_252366D40();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v41[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v41[-v20];
  sub_2521F9E8C(a1, (uint64_t)v14, &qword_26B226A80);
  uint64_t v22 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48);
  if (v22(v14, 1, v15) == 1)
  {
    sub_2521F9EF0((uint64_t)v14, &qword_26B226A80);
    sub_2521F9E8C((uint64_t)v44, (uint64_t)v6, &qword_26B226C60);
    uint64_t v23 = sub_2523670A0();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v23) == 1)
    {
      uint64_t v25 = &qword_26B226C60;
LABEL_16:
      sub_2521F9EF0((uint64_t)v6, v25);
      goto LABEL_17;
    }
    uint64_t v35 = sub_252367090();
    (*(void (**)(unsigned char *, uint64_t))(v24 + 8))(v6, v23);
    if (!v35)
    {
LABEL_17:
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v12, 1, 1, v15);
LABEL_18:
      sub_252366CE0();
      return sub_2521F9EF0((uint64_t)v12, &qword_26B226A80);
    }
    uint64_t v36 = *(void *)(v35 + 16);
    uint64_t v37 = sub_252367050();
    uint64_t v38 = *(void *)(v37 - 8);
    if (v36)
    {
      uint64_t v6 = v43;
      (*(void (**)(unsigned char *, unint64_t, uint64_t))(*(void *)(v37 - 8) + 16))(v43, v35+ ((*(unsigned __int8 *)(*(void *)(v37 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v37 - 8) + 80)), v37);
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 1;
      uint64_t v6 = v43;
    }
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v6, v39, 1, v37);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v38 + 48))(v6, 1, v37) == 1)
    {
      uint64_t v25 = &qword_26B226C50;
      goto LABEL_16;
    }
    sub_252367040();
    (*(void (**)(unsigned char *, uint64_t))(v38 + 8))(v6, v37);
    if (v22(v12, 1, v15) == 1) {
      goto LABEL_18;
    }
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v16 + 32))(v45, v12, v15);
  }
  else
  {
    uint64_t v26 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 32);
    v26(v21, v14, v15);
    if (qword_26B226C90 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2523674B0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B226C78);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 16))(v19, v21, v15);
    uint64_t v28 = sub_252367490();
    os_log_type_t v29 = sub_252369420();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v31 = swift_slowAlloc();
      int v43 = (unsigned char *)swift_slowAlloc();
      uint64_t v47 = v43;
      *(_DWORD *)uint64_t v31 = 136315394;
      BOOL v44 = v26;
      uint64_t v46 = sub_252359200(0xD000000000000064, 0x8000000252379110, (uint64_t *)&v47);
      sub_2523694E0();
      *(_WORD *)(v31 + 12) = 2080;
      int v42 = v30;
      uint64_t v32 = sub_252366D10();
      uint64_t v46 = sub_252359200(v32, v33, (uint64_t *)&v47);
      uint64_t v26 = v44;
      sub_2523694E0();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v19, v15);
      _os_log_impl(&dword_2521F1000, v28, (os_log_type_t)v42, "FeaturedHoursInfo:%s starting at given time: %s", (uint8_t *)v31, 0x16u);
      os_log_type_t v34 = v43;
      swift_arrayDestroy();
      MEMORY[0x2533B3730](v34, -1, -1);
      MEMORY[0x2533B3730](v31, -1, -1);
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v19, v15);
    }

    return ((uint64_t (*)(uint64_t, unsigned char *, uint64_t))v26)(v45, v21, v15);
  }
}

uint64_t sub_25236387C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v69 = a1;
  uint64_t v3 = sub_252368420();
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3);
  v64 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for FeaturedHoursChart(0);
  MEMORY[0x270FA5388](v62);
  v63 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226E28);
  MEMORY[0x270FA5388](v68);
  os_log_t v67 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252368FC0();
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  unint64_t v59 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v58 = (uint64_t)&v52 - v10;
  uint64_t v57 = sub_252367A10();
  uint64_t v11 = *(void *)(v57 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v57);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v52 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226A80);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226C60);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = v22;
  uint64_t v23 = type metadata accessor for FeaturedHoursInfo(0);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v56 = (uint64_t)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v52 - v26;
  sub_2521F9E8C(v1, (uint64_t)v22, &qword_26B226C60);
  uint64_t v28 = (int *)type metadata accessor for EnergyForecastChart();
  uint64_t v29 = v28[5];
  uint64_t v54 = *(void *)(v1 + v28[6]);
  uint64_t v30 = v1 + v29;
  uint64_t v31 = sub_252366D40();
  uint64_t v32 = *(void *)(v31 - 8);
  unint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  unint64_t v53 = v19;
  v33(v19, v30, v31);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v19, 0, 1, v31);
  sub_25226E73C((uint64_t)v16);
  uint64_t v34 = v57;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x263F184F8], v57);
  LOBYTE(v31) = sub_252367A00();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v11 + 8);
  v35(v14, v34);
  v35(v16, v34);
  LODWORD(v14) = *(unsigned __int8 *)(v2 + v28[7]);
  uint64_t v36 = (int *)v62;
  uint64_t v37 = v58;
  sub_25226E9D4(v58);
  uint64_t v38 = v59;
  sub_252368FB0();
  uint64_t v39 = v38;
  LOBYTE(v34) = sub_252368FA0();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v41 = v39;
  uint64_t v42 = v61;
  v40(v41, v61);
  v40((char *)v37, v42);
  int v43 = (int)v14;
  uint64_t v44 = (uint64_t)v63;
  sub_2523622F4((uint64_t)v55, v54, (uint64_t)v53, v31 & 1, v43, v34 & 1, (uint64_t)v27);
  uint64_t v45 = v56;
  sub_2523640B8((uint64_t)v27, v56, type metadata accessor for FeaturedHoursInfo);
  *(void *)(v44 + v36[5]) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B226D80);
  swift_storeEnumTagMultiPayload();
  sub_252364050(v45, v44, type metadata accessor for FeaturedHoursInfo);
  *(unsigned char *)(v44 + v36[6]) = 0;
  uint64_t v71 = 0x3FF0000000000000;
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v64, *MEMORY[0x263F1A6C8], v66);
  sub_252220104();
  sub_252367AE0();
  uint64_t v46 = (uint64_t *)(v44 + v36[8]);
  uint64_t v70 = 0;
  sub_252368930();
  uint64_t v47 = v72;
  *uint64_t v46 = v71;
  v46[1] = v47;
  uint64_t v48 = (uint64_t *)(v44 + v36[9]);
  uint64_t v70 = 0;
  sub_252368930();
  uint64_t v49 = v72;
  *uint64_t v48 = v71;
  v48[1] = v49;
  if (qword_26B226B90 != -1) {
    swift_once();
  }
  uint64_t v71 = qword_26B229B08;
  uint64_t v72 = unk_26B229B10;
  sub_252364260(&qword_26B226B28, (void (*)(uint64_t))type metadata accessor for FeaturedHoursChart);
  sub_2521F97E4();
  uint64_t v50 = (uint64_t)v67;
  sub_2523686C0();
  sub_252364120(v44, type metadata accessor for FeaturedHoursChart);
  sub_252367D00();
  sub_2521F9EF0(v50, &qword_26B226E28);
  return sub_252364120((uint64_t)v27, type metadata accessor for FeaturedHoursInfo);
}

uint64_t sub_252364030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25236160C(a1, *(char **)(v2 + 16), *(char **)(v2 + 24), *(unsigned __int8 *)(v2 + 32), a2);
}

uint64_t sub_252364050(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2523640B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_252364120(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_252364184()
{
  unint64_t result = qword_26B226E20;
  if (!qword_26B226E20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B226E28);
    sub_252364260(&qword_26B226B28, (void (*)(uint64_t))type metadata accessor for FeaturedHoursChart);
    sub_252364260((unint64_t *)&qword_26B227128, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B226E20);
  }
  return result;
}

uint64_t sub_252364260(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t RectangularLockHistoricalUsageView.init(widgetStartDate:usageSnapshot:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for HistoricalUsageSnapshot();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252366D40();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v10;
  uint64_t v23 = a1;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, a1, v9);
  sub_252241A84(a2, (uint64_t)v8);
  uint64_t v14 = (int *)type metadata accessor for RectangularLockHistoricalUsageView();
  uint64_t v15 = (uint64_t)&a3[v14[7]];
  sub_2522EECD0(v12, (uint64_t)v8, v15);
  uint64_t v16 = type metadata accessor for UsageSnapshotDerivedInfo(0);
  v13(a3, v15 + *(int *)(v16 + 40), v9);
  sub_252241A84(a2, (uint64_t)&a3[v14[5]]);
  if (*(unsigned char *)(a2 + *(int *)(v6 + 36)) != 6)
  {
    if (qword_26B2276F8 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a2 + *(int *)(v6 + 28)) == 1)
  {
    if (qword_26B2276F8 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (qword_26B2276F8 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_8:
  uint64_t v17 = sub_2523666B0();
  uint64_t v19 = v18;
  sub_252241898(a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v23, v9);
  uint64_t v21 = (uint64_t *)&a3[v14[6]];
  *uint64_t v21 = v17;
  v21[1] = v19;
  return result;
}

uint64_t type metadata accessor for RectangularLockHistoricalUsageView()
{
  uint64_t result = qword_269BFEC00;
  if (!qword_269BFEC00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t RectangularLockHistoricalUsageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEBC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEBD0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEBD8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_2523680C0();
  *((void *)v5 + 1) = 0x3FE0000000000000;
  v5[16] = 0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEBE0);
  sub_252364890(v1, (uint64_t)&v5[*(int *)(v13 + 44)]);
  sub_2521F9E8C((uint64_t)v5, (uint64_t)v8, &qword_269BFEBC8);
  *(_WORD *)&v8[*(int *)(v6 + 36)] = 0;
  sub_2521F9EF0((uint64_t)v5, &qword_269BFEBC8);
  sub_252364FF4();
  sub_252368620();
  sub_2521F9EF0((uint64_t)v8, &qword_269BFEBD0);
  uint64_t v14 = sub_252367D30();
  char v15 = sub_252368280();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(a1, v12, v9);
  uint64_t v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269BFEBF8) + 36);
  *(void *)uint64_t v16 = v14;
  *(unsigned char *)(v16 + 8) = v15;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_252364890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC18);
  MEMORY[0x270FA5388](v60);
  uint64_t v55 = (uint64_t)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC20);
  MEMORY[0x270FA5388](v57);
  uint64_t v59 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC28);
  MEMORY[0x270FA5388](v58);
  uint64_t v54 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC30);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v53 = (uint64_t)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v52 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC38);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v62 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v56 = (char *)&v52 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBE48);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v52 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v52 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v52 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v52 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v52 - v31;
  *(void *)uint64_t v30 = sub_252367FE0();
  *((void *)v30 + 1) = 0;
  v30[16] = 1;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBE50);
  sub_2523650D4(a1, (uint64_t)&v30[*(int *)(v33 + 44)]);
  uint64_t v61 = v32;
  sub_2521F9E28((uint64_t)v30, (uint64_t)v32, &qword_269BFBE48);
  uint64_t v34 = a1 + *(int *)(type metadata accessor for RectangularLockHistoricalUsageView() + 20);
  if (*(unsigned char *)(v34 + *(int *)(type metadata accessor for HistoricalUsageSnapshot() + 36)) == 6)
  {
    *(void *)uint64_t v27 = sub_252367FE0();
    *((void *)v27 + 1) = 0x4008000000000000;
    v27[16] = 0;
    sub_252365820((uint64_t)&v27[*(int *)(v33 + 44)]);
    *(void *)uint64_t v24 = sub_252367FE0();
    *((void *)v24 + 1) = 0;
    v24[16] = 1;
    sub_252365B38(a1, (uint64_t)&v24[*(int *)(v33 + 44)]);
    sub_2521F9E8C((uint64_t)v27, (uint64_t)v21, &qword_269BFBE48);
    sub_2521F9E8C((uint64_t)v24, (uint64_t)v18, &qword_269BFBE48);
    uint64_t v35 = v55;
    sub_2521F9E8C((uint64_t)v21, v55, &qword_269BFBE48);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC40);
    sub_2521F9E8C((uint64_t)v18, v35 + *(int *)(v36 + 48), &qword_269BFBE48);
    sub_2521F9EF0((uint64_t)v18, &qword_269BFBE48);
    sub_2521F9EF0((uint64_t)v21, &qword_269BFBE48);
    sub_2521F9E8C(v35, v59, &qword_269BFEC18);
    swift_storeEnumTagMultiPayload();
    sub_2521FA070(&qword_269BFEC48, &qword_269BFEC28);
    sub_2521FA070(&qword_269BFEC50, &qword_269BFEC18);
    uint64_t v37 = v56;
    sub_252368100();
    sub_2521F9EF0(v35, &qword_269BFEC18);
    sub_2521F9EF0((uint64_t)v24, &qword_269BFBE48);
    sub_2521F9EF0((uint64_t)v27, &qword_269BFBE48);
    uint64_t v38 = (uint64_t)v37;
  }
  else
  {
    uint64_t v39 = v59;
    uint64_t v38 = (uint64_t)v56;
    if (qword_26B2276F8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_2523666B0();
    uint64_t v42 = v41;
    *(void *)uint64_t v10 = sub_252367FE0();
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC60);
    sub_2523652E8(v40, v42, (uint64_t)&v10[*(int *)(v43 + 44)]);
    swift_bridgeObjectRelease();
    uint64_t v44 = v53;
    sub_2521F9E8C((uint64_t)v10, v53, &qword_269BFEC30);
    uint64_t v45 = v54;
    sub_2521F9E8C(v44, v54, &qword_269BFEC30);
    uint64_t v46 = v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC68) + 48);
    *(void *)uint64_t v46 = 0;
    *(unsigned char *)(v46 + 8) = 1;
    sub_2521F9EF0(v44, &qword_269BFEC30);
    sub_2521F9E8C(v45, v39, &qword_269BFEC28);
    swift_storeEnumTagMultiPayload();
    sub_2521FA070(&qword_269BFEC48, &qword_269BFEC28);
    sub_2521FA070(&qword_269BFEC50, &qword_269BFEC18);
    sub_252368100();
    sub_2521F9EF0(v45, &qword_269BFEC28);
    sub_2521F9EF0((uint64_t)v10, &qword_269BFEC30);
  }
  uint64_t v47 = (uint64_t)v61;
  sub_2521F9E8C((uint64_t)v61, (uint64_t)v27, &qword_269BFBE48);
  uint64_t v48 = v62;
  sub_2521F9E8C(v38, v62, &qword_269BFEC38);
  uint64_t v49 = v63;
  sub_2521F9E8C((uint64_t)v27, v63, &qword_269BFBE48);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC58);
  sub_2521F9E8C(v48, v49 + *(int *)(v50 + 48), &qword_269BFEC38);
  sub_2521F9EF0(v38, &qword_269BFEC38);
  sub_2521F9EF0(v47, &qword_269BFBE48);
  sub_2521F9EF0(v48, &qword_269BFEC38);
  return sub_2521F9EF0((uint64_t)v27, &qword_269BFBE48);
}

unint64_t sub_252364FF4()
{
  unint64_t result = qword_269BFEBE8;
  if (!qword_269BFEBE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269BFEBD0);
    sub_2521FA070(&qword_269BFEBF0, &qword_269BFEBC8);
    sub_2521FA070(&qword_269BFBDC8, &qword_269BFBDD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269BFEBE8);
  }
  return result;
}

uint64_t sub_2523650B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2523650D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226E80);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = (uint64_t *)(a1 + *(int *)(type metadata accessor for RectangularLockHistoricalUsageView() + 24));
  uint64_t v10 = v9[1];
  uint64_t v27 = *v9;
  uint64_t v28 = v10;
  sub_2521F97E4();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_252368530();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  LODWORD(v27) = sub_252368190();
  uint64_t v16 = sub_252368480();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_2521F9838(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v27 = v16;
  uint64_t v28 = v18;
  char v29 = v22;
  uint64_t v30 = v20;
  sub_2523686F0();
  sub_2521F9838(v16, v18, v22);
  swift_bridgeObjectRelease();
  sub_2521F9E8C((uint64_t)v8, (uint64_t)v6, &qword_26B226E80);
  uint64_t v23 = v26;
  sub_2521F9E8C((uint64_t)v6, v26, &qword_26B226E80);
  uint64_t v24 = v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269BFBEC8) + 48);
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  sub_2521F9EF0((uint64_t)v8, &qword_26B226E80);
  return sub_2521F9EF0((uint64_t)v6, &qword_26B226E80);
}

uint64_t sub_2523652E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v57 = sub_2523683C0();
  uint64_t v55 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v52 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBEA8);
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v49 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFBEB0);
  MEMORY[0x270FA5388](v53);
  uint64_t v50 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC70);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v51 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269BFEC78) - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v56);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v54 = (uint64_t)&v49 - v14;
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  sub_2521F97E4();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_252368530();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  uint64_t v20 = sub_2523684B0();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  sub_2521F9838(v15, v17, v19);
  swift_bridgeObjectRelease();
  LODWORD(v61) = sub_252368190();
  uint64_t v25 = sub_252368480();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  char v31 = v30 & 1;
  sub_2521F9838(v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v61 = v25;
  uint64_t v62 = v27;
  char v63 = v31;
  uint64_t v64 = v29;
  uint64_t v32 = v49;
  sub_252368780();
  sub_2521F9838(v25, v27, v31);
  swift_bridgeObjectRelease();
  sub_2523683F0();
  uint64_t v33 = v55;
  uint64_t v34 = v52;
  uint64_t v35 = v57;
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v52, *MEMORY[0x263F1A680], v57);
  uint64_t v36 = sub_2523683E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = v58;
  uint64_t v38 = v59;
  uint64_t v40 = (uint64_t)v50;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v50, v32, v59);
  uint64_t v41 = (uint64_t *)(v40 + *(int *)(v53 + 36));
  *uint64_t v41 = KeyPath;
  v41[1] = v36;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v38);
  sub_252232FD4();
  uint64_t v42 = (uint64_t)v51;
  sub_2523686F0();
  sub_2521F9EF0(v40, &qword_269BFBEB0);
  uint64_t v43 = swift_getKeyPath();
  sub_2521F9E8C(v42, (uint64_t)v13, &qword_269BFEC70);
  uint64_t v44 = &v13[*(int *)(v56 + 44)];
  *(void *)uint64_t v44 = v43;
  v44[8] = 0;
  sub_2521F9EF0(v42, &qword_269BFEC70);
  uint64_t v45 = v54;
  sub_2521F9E28((uint64_t)v13, v54, &qword_269BFEC78);
  sub_2521F9E8C(v45, (uint64_t)v13, &qword_269BFEC78);
  uint64_t v46 = v60;
  sub_2521F9E8C((uint64_t)v13, v60, &qword_269BFEC78);
  uint64_t v47 = v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269BFEC80) + 48);
  *(void *)uint64_t v47 = 0;
  *(unsigned char *)(v47 + 8) = 1;
  sub_2521F9EF0(v45, &qword_269BFEC78);
  return sub_2521F9EF0((uint64_t)v13, &qword_269BFEC78);
}

uint64_t sub_252365820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_2523683C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252366680();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226E80);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v29 = (uint64_t)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - v11;
  type metadata accessor for RectangularLockHistoricalUsageView();
  HistoricalUsageSnapshot.summaryUsageOrSurplusForInterval(starting:useShortText:)(1, (uint64_t)v7);
  uint64_t v13 = sub_252368520();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_252368300();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F1A680], v1);
  sub_2523683E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v18 = sub_2523684C0();
  uint64_t v20 = v19;
  LOBYTE(v4) = v21;
  uint64_t v23 = v22;
  swift_release();
  sub_2521F9838(v13, v15, v17);
  swift_bridgeObjectRelease();
  uint64_t v31 = v18;
  uint64_t v32 = v20;
  char v33 = v4 & 1;
  uint64_t v34 = v23;
  sub_2523686F0();
  sub_2521F9838(v18, v20, v4 & 1);
  swift_bridgeObjectRelease();
  uint64_t v24 = v29;
  sub_2521F9E8C((uint64_t)v12, v29, &qword_26B226E80);
  uint64_t v25 = v30;
  sub_2521F9E8C(v24, v30, &qword_26B226E80);
  uint64_t v26 = v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269BFBEC8) + 48);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 1;
  sub_2521F9EF0((uint64_t)v12, &qword_26B226E80);
  return sub_2521F9EF0(v24, &qword_26B226E80);
}

uint64_t sub_252365B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = sub_2523683C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252366680();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B226E80);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v31 = (uint64_t)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - v13;
  type metadata accessor for RectangularLockHistoricalUsageView();
  HistoricalUsageSnapshot.summaryDailyUsageOrSurplusTrendShort(_:)(a1, (uint64_t)v9);
  uint64_t v15 = sub_252368520();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_252368300();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1A680], v3);
  sub_2523683E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v20 = sub_2523684C0();
  uint64_t v22 = v21;
  LOBYTE(v6) = v23;
  uint64_t v25 = v24;
  swift_release();
  sub_2521F9838(v15, v17, v19);
  swift_bridgeObjectRelease();
  uint64_t v33 = v20;
  uint64_t v34 = v22;
  char v35 = v6 & 1;
  uint64_t v36 = v25;
  sub_2523686F0();
  sub_2521F9838(v20, v22, v6 & 1);
  swift_bridgeObjectRelease();
  uint64_t v26 = v31;
  sub_2521F9E8C((uint64_t)v14, v31, &qword_26B226E80);
  uint64_t v27 = v32;
  sub_2521F9E8C(v26, v32, &qword_26B226E80);
  uint64_t v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269BFBEC8) + 48);
  *(void *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 8) = 1;
  sub_2521F9EF0((uint64_t)v14, &qword_26B226E80);
  return sub_2521F9EF0(v26, &qword_26B226E80);
}

uint64_t getEnumTagSinglePayload for RectangularLockHistoricalUsageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252365E64);
}

uint64_t sub_252365E64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252366D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for HistoricalUsageSnapshot();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UsageSnapshotDerivedInfo(0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for RectangularLockHistoricalUsageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252365FFC);
}

uint64_t sub_252365FFC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_252366D40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = type metadata accessor for HistoricalUsageSnapshot();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UsageSnapshotDerivedInfo(0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t sub_252366180()
{
  uint64_t result = sub_252366D40();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for HistoricalUsageSnapshot();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for UsageSnapshotDerivedInfo(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_252366290()
{
  unint64_t result = qword_269BFEC10;
  if (!qword_269BFEC10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269BFEBF8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269BFEBD0);
    sub_252364FF4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269BFEC10);
  }
  return result;
}

uint64_t sub_252366350()
{
  return MEMORY[0x270EEDCF0]();
}

uint64_t sub_252366360()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_252366370()
{
  return MEMORY[0x270EEDD18]();
}

uint64_t sub_252366380()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_252366390()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2523663A0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2523663B0()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_2523663C0()
{
  return MEMORY[0x270EEDFD0]();
}

uint64_t sub_2523663D0()
{
  return MEMORY[0x270EEDFF8]();
}

uint64_t sub_2523663E0()
{
  return MEMORY[0x270EEE008]();
}

uint64_t sub_2523663F0()
{
  return MEMORY[0x270EEE058]();
}

uint64_t sub_252366400()
{
  return MEMORY[0x270EEE2D0]();
}

uint64_t sub_252366410()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_252366420()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_252366430()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_252366440()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_252366450()
{
  return MEMORY[0x270EEE318]();
}

uint64_t sub_252366460()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_252366470()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_252366480()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_252366490()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_2523664A0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_2523664B0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2523664C0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2523664D0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2523664E0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_2523664F0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_252366500()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_252366510()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_252366520()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_252366530()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_252366540()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_252366550()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_252366560()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_252366570()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_252366580()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_252366590()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2523665A0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2523665B0()
{
  return MEMORY[0x270EEE9D0]();
}

uint64_t sub_2523665C0()
{
  return MEMORY[0x270EEEA10]();
}

uint64_t sub_2523665D0()
{
  return MEMORY[0x270EFEB18]();
}

uint64_t sub_2523665E0()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_2523665F0()
{
  return MEMORY[0x270EEEB88]();
}

uint64_t sub_252366600()
{
  return MEMORY[0x270EEEC00]();
}

uint64_t sub_252366610()
{
  return MEMORY[0x270EEEC70]();
}

uint64_t sub_252366620()
{
  return MEMORY[0x270EEEC90]();
}

uint64_t sub_252366630()
{
  return MEMORY[0x270EEECA8]();
}

uint64_t sub_252366640()
{
  return MEMORY[0x270EEECC0]();
}

uint64_t sub_252366650()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_252366660()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_252366670()
{
  return MEMORY[0x270EEEDA0]();
}

uint64_t sub_252366680()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_252366690()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_2523666A0()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_2523666B0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2523666C0()
{
  return MEMORY[0x270EEF010]();
}

uint64_t sub_2523666D0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_2523666E0()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2523666F0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_252366700()
{
  return MEMORY[0x270EEF0B0]();
}

uint64_t sub_252366710()
{
  return MEMORY[0x270EEF0B8]();
}

uint64_t sub_252366720()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_252366730()
{
  return MEMORY[0x270EEF318]();
}

uint64_t sub_252366780()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_2523667C0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_2523667D0()
{
  return MEMORY[0x270EEF938]();
}

uint64_t sub_2523667E0()
{
  return MEMORY[0x270EEF950]();
}

uint64_t sub_2523667F0()
{
  return MEMORY[0x270EEF9A8]();
}

uint64_t sub_252366800()
{
  return MEMORY[0x270EEFA38]();
}

uint64_t sub_252366810()
{
  return MEMORY[0x270EEFA50]();
}

uint64_t sub_252366820()
{
  return MEMORY[0x270EEFAD0]();
}

uint64_t sub_252366830()
{
  return MEMORY[0x270EEFAE0]();
}

uint64_t sub_252366840()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_252366850()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_252366860()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_252366880()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_252366890()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2523668A0()
{
  return MEMORY[0x270EF02E8]();
}

uint64_t sub_2523668B0()
{
  return MEMORY[0x270EF0310]();
}

uint64_t sub_2523668C0()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_2523668D0()
{
  return MEMORY[0x270EF0330]();
}

uint64_t sub_2523668E0()
{
  return MEMORY[0x270EF0348]();
}

uint64_t sub_2523668F0()
{
  return MEMORY[0x270EF0358]();
}

uint64_t sub_252366900()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_252366910()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_252366920()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_252366930()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_252366940()
{
  return MEMORY[0x270EF0438]();
}

uint64_t sub_252366950()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_252366960()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_252366970()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_252366980()
{
  return MEMORY[0x270EF04A8]();
}

uint64_t sub_252366990()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_2523669A0()
{
  return MEMORY[0x270EF04D0]();
}

uint64_t sub_2523669B0()
{
  return MEMORY[0x270EF04E0]();
}

uint64_t sub_2523669C0()
{
  return MEMORY[0x270EF04E8]();
}

uint64_t sub_2523669D0()
{
  return MEMORY[0x270EF04F8]();
}

uint64_t sub_2523669E0()
{
  return MEMORY[0x270EF0500]();
}

uint64_t sub_2523669F0()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_252366A00()
{
  return MEMORY[0x270EF0510]();
}

uint64_t sub_252366A10()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_252366A20()
{
  return MEMORY[0x270EF0528]();
}

uint64_t sub_252366A30()
{
  return MEMORY[0x270EF0540]();
}

uint64_t sub_252366A40()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_252366A50()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_252366A60()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_252366A70()
{
  return MEMORY[0x270EF0578]();
}

uint64_t sub_252366A80()
{
  return MEMORY[0x270EF0588]();
}

uint64_t sub_252366A90()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_252366AA0()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_252366AB0()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_252366AC0()
{
  return MEMORY[0x270EF05F0]();
}

uint64_t sub_252366AD0()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_252366AE0()
{
  return MEMORY[0x270EF0658]();
}

uint64_t sub_252366AF0()
{
  return MEMORY[0x270EF0668]();
}

uint64_t sub_252366B00()
{
  return MEMORY[0x270EF0670]();
}

uint64_t sub_252366B10()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_252366B20()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_252366B30()
{
  return MEMORY[0x270EF06C0]();
}

uint64_t sub_252366B40()
{
  return MEMORY[0x270EF06D0]();
}

uint64_t sub_252366B50()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_252366B60()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_252366B70()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_252366B80()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_252366B90()
{
  return MEMORY[0x270EF0870]();
}

uint64_t sub_252366BA0()
{
  return MEMORY[0x270EF0878]();
}

uint64_t sub_252366BB0()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_252366BC0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_252366BD0()
{
  return MEMORY[0x270EF08A8]();
}

uint64_t sub_252366BE0()
{
  return MEMORY[0x270EF08B0]();
}

uint64_t sub_252366BF0()
{
  return MEMORY[0x270EF08B8]();
}

uint64_t sub_252366C00()
{
  return MEMORY[0x270EF08C0]();
}

uint64_t sub_252366C10()
{
  return MEMORY[0x270EF08C8]();
}

uint64_t sub_252366C20()
{
  return MEMORY[0x270EF08D0]();
}

uint64_t sub_252366C30()
{
  return MEMORY[0x270EF08D8]();
}

uint64_t sub_252366C40()
{
  return MEMORY[0x270EF08E0]();
}

uint64_t sub_252366C50()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_252366C60()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_252366C70()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_252366C80()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_252366C90()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_252366CA0()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_252366CB0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_252366CC0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_252366CD0()
{
  return MEMORY[0x270EF0BA0]();
}

uint64_t sub_252366CE0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_252366CF0()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_252366D00()
{
  return MEMORY[0x270EF0C00]();
}

uint64_t sub_252366D10()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_252366D20()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_252366D30()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_252366D40()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252366D50()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_252366D60()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_252366D70()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252366D80()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252366D90()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_252366DA0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_252366DB0()
{
  return MEMORY[0x270EF1098]();
}

uint64_t sub_252366DC0()
{
  return MEMORY[0x270EF10A0]();
}

uint64_t sub_252366DD0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252366DE0()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_252366DF0()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_252366E00()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_252366E10()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_252366E20()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_252366E30()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_252366E40()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_252366E50()
{
  return MEMORY[0x270EF13A0]();
}

uint64_t sub_252366E60()
{
  return MEMORY[0x270EF13D0]();
}

uint64_t sub_252366E70()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_252366E80()
{
  return MEMORY[0x270EF1400]();
}

uint64_t sub_252366E90()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_252366EA0()
{
  return MEMORY[0x270EF1418]();
}

uint64_t sub_252366EB0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_252366EC0()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_252366ED0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_252366EE0()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_252366EF0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_252366F00()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_252366F10()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_252366F20()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_252366F30()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_252366F40()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_252366F50()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_252366F60()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_252366F70()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_252366F80()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_252366F90()
{
  return MEMORY[0x270FA06E0]();
}

uint64_t sub_252366FA0()
{
  return MEMORY[0x270FA06E8]();
}

uint64_t sub_252366FB0()
{
  return MEMORY[0x270FA06F0]();
}

uint64_t sub_252366FC0()
{
  return MEMORY[0x270FA06F8]();
}

uint64_t sub_252366FD0()
{
  return MEMORY[0x270FA0700]();
}

uint64_t sub_252366FE0()
{
  return MEMORY[0x270FA0708]();
}

uint64_t sub_252366FF0()
{
  return MEMORY[0x270FA0718]();
}

uint64_t sub_252367010()
{
  return MEMORY[0x270F3C3B0]();
}

uint64_t sub_252367020()
{
  return MEMORY[0x270F3C3B8]();
}

uint64_t sub_252367030()
{
  return MEMORY[0x270F3C3C0]();
}

uint64_t sub_252367040()
{
  return MEMORY[0x270F3C3C8]();
}

uint64_t sub_252367050()
{
  return MEMORY[0x270F3C3D0]();
}

uint64_t sub_252367060()
{
  return MEMORY[0x270F3C3D8]();
}

uint64_t sub_252367070()
{
  return MEMORY[0x270F3C3E0]();
}

uint64_t sub_252367080()
{
  return MEMORY[0x270F3C3F8]();
}

uint64_t sub_252367090()
{
  return MEMORY[0x270F3C400]();
}

uint64_t sub_2523670A0()
{
  return MEMORY[0x270F3C418]();
}

uint64_t sub_2523670B0()
{
  return MEMORY[0x270F3C420]();
}

uint64_t sub_2523670C0()
{
  return MEMORY[0x270F3C428]();
}

uint64_t sub_2523670D0()
{
  return MEMORY[0x270F272E8]();
}

uint64_t sub_2523670E0()
{
  return MEMORY[0x270F272F0]();
}

uint64_t sub_2523670F0()
{
  return MEMORY[0x270F27310]();
}

uint64_t sub_252367100()
{
  return MEMORY[0x270F27330]();
}

uint64_t sub_252367110()
{
  return MEMORY[0x270F27340]();
}

uint64_t sub_252367120()
{
  return MEMORY[0x270F27350]();
}

uint64_t sub_252367130()
{
  return MEMORY[0x270F27360]();
}

uint64_t sub_252367140()
{
  return MEMORY[0x270F27368]();
}

uint64_t sub_252367150()
{
  return MEMORY[0x270F27378]();
}

uint64_t sub_252367160()
{
  return MEMORY[0x270F27380]();
}

uint64_t sub_252367170()
{
  return MEMORY[0x270F27388]();
}

uint64_t sub_252367180()
{
  return MEMORY[0x270F27390]();
}

uint64_t sub_252367190()
{
  return MEMORY[0x270F27648]();
}

uint64_t sub_2523671A0()
{
  return MEMORY[0x270F27650]();
}

uint64_t sub_2523671B0()
{
  return MEMORY[0x270F27658]();
}

uint64_t sub_2523671C0()
{
  return MEMORY[0x270F27670]();
}

uint64_t sub_2523671D0()
{
  return MEMORY[0x270F27678]();
}

uint64_t sub_2523671E0()
{
  return MEMORY[0x270F27688]();
}

uint64_t sub_2523671F0()
{
  return MEMORY[0x270F27690]();
}

uint64_t sub_252367200()
{
  return MEMORY[0x270F27698]();
}

uint64_t sub_252367210()
{
  return MEMORY[0x270F276A0]();
}

uint64_t sub_252367220()
{
  return MEMORY[0x270F276C8]();
}

uint64_t sub_252367230()
{
  return MEMORY[0x270F276D0]();
}

uint64_t sub_252367240()
{
  return MEMORY[0x270F276E0]();
}

uint64_t sub_252367250()
{
  return MEMORY[0x270F276F0]();
}

uint64_t sub_252367260()
{
  return MEMORY[0x270F276F8]();
}

uint64_t sub_252367270()
{
  return MEMORY[0x270F27708]();
}

uint64_t sub_252367280()
{
  return MEMORY[0x270F27710]();
}

uint64_t sub_252367290()
{
  return MEMORY[0x270F27718]();
}

uint64_t sub_2523672A0()
{
  return MEMORY[0x270F27720]();
}

uint64_t sub_2523672B0()
{
  return MEMORY[0x270F27730]();
}

uint64_t sub_2523672C0()
{
  return MEMORY[0x270F27738]();
}

uint64_t sub_2523672D0()
{
  return MEMORY[0x270F27740]();
}

uint64_t sub_2523672E0()
{
  return MEMORY[0x270F27750]();
}

uint64_t sub_2523672F0()
{
  return MEMORY[0x270F27758]();
}

uint64_t sub_252367300()
{
  return MEMORY[0x270F27760]();
}

uint64_t sub_252367310()
{
  return MEMORY[0x270F27768]();
}

uint64_t sub_252367320()
{
  return MEMORY[0x270F3C4E8]();
}

uint64_t sub_252367330()
{
  return MEMORY[0x270F3C4F0]();
}

uint64_t sub_252367340()
{
  return MEMORY[0x270F3C4F8]();
}

uint64_t sub_252367350()
{
  return MEMORY[0x270F3C500]();
}

uint64_t sub_252367360()
{
  return MEMORY[0x270F3C520]();
}

uint64_t sub_252367370()
{
  return MEMORY[0x270F3C538]();
}

uint64_t sub_252367380()
{
  return MEMORY[0x270F3C548]();
}

uint64_t sub_252367390()
{
  return MEMORY[0x270F3C550]();
}

uint64_t sub_2523673A0()
{
  return MEMORY[0x270F3C6B0]();
}

uint64_t sub_2523673C0()
{
  return MEMORY[0x270F3C710]();
}

uint64_t sub_2523673D0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2523673E0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2523673F0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_252367400()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_252367410()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_252367420()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_252367430()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_252367440()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_252367450()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_252367460()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_252367470()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_252367480()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_252367490()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2523674A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2523674B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2523674C0()
{
  return MEMORY[0x270EE2AF0]();
}

uint64_t sub_2523674D0()
{
  return MEMORY[0x270EE2AF8]();
}

uint64_t sub_2523674E0()
{
  return MEMORY[0x270EE2B08]();
}

uint64_t sub_2523674F0()
{
  return MEMORY[0x270EE2B10]();
}

uint64_t sub_252367500()
{
  return MEMORY[0x270EE2B18]();
}

uint64_t sub_252367510()
{
  return MEMORY[0x270EE2B30]();
}

uint64_t sub_252367520()
{
  return MEMORY[0x270EE2B40]();
}

uint64_t sub_252367530()
{
  return MEMORY[0x270EE2B48]();
}

uint64_t sub_252367540()
{
  return MEMORY[0x270EE2B80]();
}

uint64_t sub_252367550()
{
  return MEMORY[0x270EE2B90]();
}

uint64_t sub_252367560()
{
  return MEMORY[0x270EE2BA8]();
}

uint64_t sub_252367570()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_252367580()
{
  return MEMORY[0x270EE2BF8]();
}

uint64_t sub_252367590()
{
  return MEMORY[0x270EE2C00]();
}

uint64_t sub_2523675A0()
{
  return MEMORY[0x270EE2C18]();
}

uint64_t sub_2523675B0()
{
  return MEMORY[0x270EE2C20]();
}

uint64_t sub_2523675C0()
{
  return MEMORY[0x270EE2C48]();
}

uint64_t sub_2523675D0()
{
  return MEMORY[0x270EE2C50]();
}

uint64_t sub_2523675E0()
{
  return MEMORY[0x270EE2C58]();
}

uint64_t sub_2523675F0()
{
  return MEMORY[0x270EE2C68]();
}

uint64_t sub_252367600()
{
  return MEMORY[0x270EE2C78]();
}

uint64_t sub_252367610()
{
  return MEMORY[0x270EE2C80]();
}

uint64_t sub_252367620()
{
  return MEMORY[0x270EE2C88]();
}

uint64_t sub_252367630()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_252367640()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_252367650()
{
  return MEMORY[0x270EE2CB0]();
}

uint64_t sub_252367660()
{
  return MEMORY[0x270EE2CC8]();
}

uint64_t sub_252367670()
{
  return MEMORY[0x270EE2CD8]();
}

uint64_t sub_252367680()
{
  return MEMORY[0x270EE2CF0]();
}

uint64_t sub_252367690()
{
  return MEMORY[0x270EE2CF8]();
}

uint64_t sub_2523676A0()
{
  return MEMORY[0x270EE2D00]();
}

uint64_t sub_2523676B0()
{
  return MEMORY[0x270EE2D10]();
}

uint64_t sub_2523676C0()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_2523676D0()
{
  return MEMORY[0x270EE2D28]();
}

uint64_t sub_2523676E0()
{
  return MEMORY[0x270EE2D78]();
}

uint64_t sub_2523676F0()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_252367700()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_252367710()
{
  return MEMORY[0x270EE2D98]();
}

uint64_t sub_252367720()
{
  return MEMORY[0x270EE2DB0]();
}

uint64_t sub_252367730()
{
  return MEMORY[0x270EE2DC8]();
}

uint64_t sub_252367740()
{
  return MEMORY[0x270EE2DE0]();
}

uint64_t sub_252367750()
{
  return MEMORY[0x270EE2E18]();
}

uint64_t sub_252367760()
{
  return MEMORY[0x270EE2E20]();
}

uint64_t sub_252367770()
{
  return MEMORY[0x270EE2E28]();
}

uint64_t sub_252367780()
{
  return MEMORY[0x270EE2E50]();
}

uint64_t sub_252367790()
{
  return MEMORY[0x270EE2E58]();
}

uint64_t sub_2523677A0()
{
  return MEMORY[0x270EE2E60]();
}

uint64_t sub_2523677B0()
{
  return MEMORY[0x270EE2E70]();
}

uint64_t sub_2523677C0()
{
  return MEMORY[0x270EE2E78]();
}

uint64_t sub_2523677D0()
{
  return MEMORY[0x270EE2E80]();
}

uint64_t sub_2523677E0()
{
  return MEMORY[0x270EE2E88]();
}

uint64_t sub_2523677F0()
{
  return MEMORY[0x270EE2E90]();
}

uint64_t sub_252367800()
{
  return MEMORY[0x270EE2EA0]();
}

uint64_t sub_252367810()
{
  return MEMORY[0x270EE2EA8]();
}

uint64_t sub_252367820()
{
  return MEMORY[0x270EE2EB0]();
}

uint64_t sub_252367830()
{
  return MEMORY[0x270EE2EC8]();
}

uint64_t sub_252367840()
{
  return MEMORY[0x270EE2ED0]();
}

uint64_t sub_252367850()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_252367860()
{
  return MEMORY[0x270EE2EF8]();
}

uint64_t sub_252367870()
{
  return MEMORY[0x270EE2F08]();
}

uint64_t sub_252367880()
{
  return MEMORY[0x270EE2F20]();
}

uint64_t sub_252367890()
{
  return MEMORY[0x270EE2F48]();
}

uint64_t sub_2523678A0()
{
  return MEMORY[0x270EE2F50]();
}

uint64_t sub_2523678B0()
{
  return MEMORY[0x270EE2F58]();
}

uint64_t sub_2523678C0()
{
  return MEMORY[0x270EE2F68]();
}

uint64_t sub_2523678D0()
{
  return MEMORY[0x270EE2F70]();
}

uint64_t sub_2523678E0()
{
  return MEMORY[0x270EE2F78]();
}

uint64_t sub_2523678F0()
{
  return MEMORY[0x270EE2F88]();
}

uint64_t sub_252367900()
{
  return MEMORY[0x270EE2F90]();
}

uint64_t sub_252367910()
{
  return MEMORY[0x270EE2FB8]();
}

uint64_t sub_252367920()
{
  return MEMORY[0x270EE2FC0]();
}

uint64_t sub_252367930()
{
  return MEMORY[0x270EE2FC8]();
}

uint64_t sub_252367940()
{
  return MEMORY[0x270EE2FD8]();
}

uint64_t sub_252367950()
{
  return MEMORY[0x270EE2FF8]();
}

uint64_t sub_252367960()
{
  return MEMORY[0x270EE3010]();
}

uint64_t sub_252367970()
{
  return MEMORY[0x270EE3020]();
}

uint64_t sub_252367980()
{
  return MEMORY[0x270EE3030]();
}

uint64_t sub_252367990()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_2523679A0()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_2523679B0()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_2523679C0()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_2523679D0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2523679E0()
{
  return MEMORY[0x270EFEDD0]();
}

uint64_t sub_2523679F0()
{
  return MEMORY[0x270EFEDE0]();
}

uint64_t sub_252367A00()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_252367A10()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_252367A20()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_252367A30()
{
  return MEMORY[0x270EFEF68]();
}

uint64_t sub_252367A40()
{
  return MEMORY[0x270EFEF88]();
}

uint64_t sub_252367A50()
{
  return MEMORY[0x270EFEF90]();
}

uint64_t sub_252367A60()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_252367A70()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_252367A80()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_252367A90()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_252367AA0()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_252367AB0()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_252367AC0()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_252367AD0()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_252367AE0()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_252367AF0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_252367B00()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_252367B10()
{
  return MEMORY[0x270EFF4A8]();
}

uint64_t sub_252367B20()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_252367B30()
{
  return MEMORY[0x270EFF4D8]();
}

uint64_t sub_252367B40()
{
  return MEMORY[0x270EFF4E0]();
}

uint64_t sub_252367B50()
{
  return MEMORY[0x270EFF4E8]();
}

uint64_t sub_252367B60()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_252367B70()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_252367B80()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_252367B90()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_252367BA0()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_252367BB0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_252367BC0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_252367BD0()
{
  return MEMORY[0x270EFF700]();
}

uint64_t sub_252367BE0()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_252367BF0()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_252367C00()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_252367C10()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_252367C20()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_252367C30()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_252367C40()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_252367C50()
{
  return MEMORY[0x270EFFA20]();
}

uint64_t sub_252367C60()
{
  return MEMORY[0x270EFFA28]();
}

uint64_t sub_252367C70()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_252367C80()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_252367C90()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_252367CA0()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_252367CB0()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_252367CC0()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_252367CD0()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_252367CE0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_252367CF0()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_252367D00()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_252367D10()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_252367D20()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_252367D30()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_252367D40()
{
  return MEMORY[0x270F00548]();
}

uint64_t sub_252367D50()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_252367D60()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_252367D70()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_252367D80()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_252367D90()
{
  return MEMORY[0x270F00898]();
}

uint64_t sub_252367DA0()
{
  return MEMORY[0x270F008A8]();
}

uint64_t sub_252367DB0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_252367DC0()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_252367DD0()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_252367DE0()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_252367DF0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_252367E00()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_252367E10()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_252367E20()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_252367E30()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_252367E40()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_252367E50()
{
  return MEMORY[0x270F00BA8]();
}

uint64_t sub_252367E60()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_252367E70()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_252367E80()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_252367E90()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_252367EA0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_252367EB0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_252367EC0()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_252367ED0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_252367EE0()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_252367EF0()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_252367F00()
{
  return MEMORY[0x270F07348]();
}

uint64_t sub_252367F10()
{
  return MEMORY[0x270F07350]();
}

uint64_t sub_252367F20()
{
  return MEMORY[0x270F07358]();
}

uint64_t sub_252367F30()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_252367F40()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_252367F50()
{
  return MEMORY[0x270F073E0]();
}

uint64_t sub_252367F60()
{
  return MEMORY[0x270F073F0]();
}

uint64_t sub_252367F70()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_252367F80()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_252367F90()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_252367FA0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_252367FB0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_252367FC0()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_252367FD0()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_252367FE0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_252367FF0()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_252368000()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_252368010()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_252368020()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_252368030()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_252368040()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_252368050()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_252368060()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_252368070()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_252368080()
{
  return MEMORY[0x270F01478]();
}

uint64_t sub_252368090()
{
  return MEMORY[0x270F01490]();
}

uint64_t sub_2523680A0()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_2523680B0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2523680C0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2523680D0()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_2523680E0()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_2523680F0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_252368100()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_252368110()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_252368120()
{
  return MEMORY[0x270F01938]();
}

uint64_t sub_252368130()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_252368140()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_252368150()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_252368160()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_252368170()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_252368180()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_252368190()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_2523681A0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2523681B0()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_2523681C0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_2523681D0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_2523681E0()
{
  return MEMORY[0x270F024C8]();
}

uint64_t sub_2523681F0()
{
  return MEMORY[0x270F024D0]();
}

uint64_t sub_252368200()
{
  return MEMORY[0x270F07428]();
}

uint64_t sub_252368210()
{
  return MEMORY[0x270F025F0]();
}

uint64_t sub_252368220()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_252368230()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_252368240()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_252368250()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_252368260()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_252368270()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_252368280()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_252368290()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2523682A0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2523682B0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2523682C0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2523682D0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2523682E0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_2523682F0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_252368300()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_252368310()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_252368320()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_252368330()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_252368340()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_252368350()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_252368360()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_252368370()
{
  return MEMORY[0x270F02C20]();
}

uint64_t sub_252368380()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_252368390()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2523683A0()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_2523683B0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_2523683C0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_2523683D0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_2523683E0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_2523683F0()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_252368400()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_252368410()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_252368420()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_252368430()
{
  return MEMORY[0x270F02D40]();
}

uint64_t sub_252368440()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_252368450()
{
  return MEMORY[0x270F02F18]();
}

uint64_t sub_252368460()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_252368470()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_252368480()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_252368490()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_2523684A0()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_2523684B0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_2523684C0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2523684D0()
{
  return MEMORY[0x270F030C0]();
}

uint64_t sub_2523684E0()
{
  return MEMORY[0x270F030C8]();
}

uint64_t sub_2523684F0()
{
  return MEMORY[0x270F03138]();
}

uint64_t sub_252368500()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_252368510()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_252368520()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_252368530()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_252368540()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_252368550()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_252368560()
{
  return MEMORY[0x270EE3080]();
}

uint64_t sub_252368570()
{
  return MEMORY[0x270EE3088]();
}

uint64_t sub_252368580()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_252368590()
{
  return MEMORY[0x270EE30B0]();
}

uint64_t sub_2523685A0()
{
  return MEMORY[0x270EE30C8]();
}

uint64_t sub_2523685B0()
{
  return MEMORY[0x270EE30D0]();
}

uint64_t sub_2523685C0()
{
  return MEMORY[0x270EE30D8]();
}

uint64_t sub_2523685D0()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_2523685E0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2523685F0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_252368600()
{
  return MEMORY[0x270F03358]();
}

uint64_t sub_252368610()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_252368620()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_252368630()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_252368640()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_252368650()
{
  return MEMORY[0x270F035D0]();
}

uint64_t sub_252368660()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_252368670()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_252368680()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_252368690()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_2523686A0()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_2523686B0()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_2523686C0()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2523686D0()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2523686E0()
{
  return MEMORY[0x270F03B18]();
}

uint64_t sub_2523686F0()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_252368700()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_252368710()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_252368720()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_252368730()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_252368740()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_252368750()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_252368760()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_252368770()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_252368780()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_252368790()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_2523687A0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2523687B0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2523687C0()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2523687D0()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2523687E0()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_2523687F0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_252368800()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_252368810()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_252368820()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_252368830()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_252368840()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_252368850()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_252368860()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_252368870()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_252368880()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_252368890()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_2523688A0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_2523688B0()
{
  return MEMORY[0x270F045B8]();
}

uint64_t sub_2523688C0()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_2523688D0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2523688E0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2523688F0()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_252368900()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_252368910()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_252368920()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_252368930()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_252368940()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_252368950()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_252368960()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_252368970()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_252368980()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_252368990()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_2523689A0()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_2523689B0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_2523689C0()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_2523689D0()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_2523689E0()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_2523689F0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_252368A00()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_252368A10()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_252368A20()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_252368A30()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_252368A40()
{
  return MEMORY[0x270EE3108]();
}

uint64_t sub_252368A50()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_252368A60()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_252368A70()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_252368A80()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_252368A90()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_252368AA0()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_252368AB0()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_252368AC0()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_252368AD0()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_252368AE0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_252368AF0()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_252368B00()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_252368B10()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_252368B20()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_252368B30()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_252368B40()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_252368B50()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_252368B60()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_252368B70()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_252368B80()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_252368B90()
{
  return MEMORY[0x270F26EF0]();
}

uint64_t sub_252368BA0()
{
  return MEMORY[0x270F26EF8]();
}

uint64_t sub_252368BB0()
{
  return MEMORY[0x270F26F00]();
}

uint64_t sub_252368BC0()
{
  return MEMORY[0x270F26F08]();
}

uint64_t sub_252368BD0()
{
  return MEMORY[0x270F26F10]();
}

uint64_t sub_252368BE0()
{
  return MEMORY[0x270F26F18]();
}

uint64_t sub_252368BF0()
{
  return MEMORY[0x270F26F20]();
}

uint64_t sub_252368C00()
{
  return MEMORY[0x270F26F28]();
}

uint64_t sub_252368C10()
{
  return MEMORY[0x270F26F30]();
}

uint64_t sub_252368C20()
{
  return MEMORY[0x270F26F38]();
}

uint64_t sub_252368C30()
{
  return MEMORY[0x270F26F40]();
}

uint64_t sub_252368C40()
{
  return MEMORY[0x270F26F48]();
}

uint64_t sub_252368C50()
{
  return MEMORY[0x270F26F50]();
}

uint64_t sub_252368C60()
{
  return MEMORY[0x270F26F58]();
}

uint64_t sub_252368C70()
{
  return MEMORY[0x270F26F70]();
}

uint64_t sub_252368C80()
{
  return MEMORY[0x270F26F78]();
}

uint64_t sub_252368C90()
{
  return MEMORY[0x270F26F80]();
}

uint64_t sub_252368CA0()
{
  return MEMORY[0x270F26F88]();
}

uint64_t sub_252368CB0()
{
  return MEMORY[0x270F26F90]();
}

uint64_t sub_252368CC0()
{
  return MEMORY[0x270F26F98]();
}

uint64_t sub_252368CD0()
{
  return MEMORY[0x270F26FA0]();
}

uint64_t sub_252368CE0()
{
  return MEMORY[0x270F26FA8]();
}

uint64_t sub_252368CF0()
{
  return MEMORY[0x270F26FB0]();
}

uint64_t sub_252368D00()
{
  return MEMORY[0x270F26FB8]();
}

uint64_t sub_252368D10()
{
  return MEMORY[0x270F26FC0]();
}

uint64_t sub_252368D20()
{
  return MEMORY[0x270F26FC8]();
}

uint64_t sub_252368D30()
{
  return MEMORY[0x270F26FD0]();
}

uint64_t sub_252368D40()
{
  return MEMORY[0x270F26FD8]();
}

uint64_t sub_252368D50()
{
  return MEMORY[0x270F26FE0]();
}

uint64_t sub_252368D60()
{
  return MEMORY[0x270F26FE8]();
}

uint64_t sub_252368D70()
{
  return MEMORY[0x270F26FF0]();
}

uint64_t sub_252368D80()
{
  return MEMORY[0x270F26FF8]();
}

uint64_t sub_252368DA0()
{
  return MEMORY[0x270F27010]();
}

uint64_t sub_252368DB0()
{
  return MEMORY[0x270F27018]();
}

uint64_t sub_252368DD0()
{
  return MEMORY[0x270F27058]();
}

uint64_t sub_252368DE0()
{
  return MEMORY[0x270F27060]();
}

uint64_t sub_252368DF0()
{
  return MEMORY[0x270F27068]();
}

uint64_t sub_252368E00()
{
  return MEMORY[0x270F27070]();
}

uint64_t sub_252368E10()
{
  return MEMORY[0x270F27078]();
}

uint64_t sub_252368E20()
{
  return MEMORY[0x270F27080]();
}

uint64_t sub_252368E30()
{
  return MEMORY[0x270F27088]();
}

uint64_t sub_252368E40()
{
  return MEMORY[0x270F27090]();
}

uint64_t sub_252368E50()
{
  return MEMORY[0x270F27098]();
}

uint64_t sub_252368E60()
{
  return MEMORY[0x270F270A0]();
}

uint64_t sub_252368E70()
{
  return MEMORY[0x270F270A8]();
}

uint64_t sub_252368E80()
{
  return MEMORY[0x270F270B0]();
}

uint64_t sub_252368E90()
{
  return MEMORY[0x270F270B8]();
}

uint64_t sub_252368EA0()
{
  return MEMORY[0x270F270C0]();
}

uint64_t sub_252368EB0()
{
  return MEMORY[0x270F270C8]();
}

uint64_t sub_252368EC0()
{
  return MEMORY[0x270F270D0]();
}

uint64_t sub_252368ED0()
{
  return MEMORY[0x270F270D8]();
}

uint64_t sub_252368EE0()
{
  return MEMORY[0x270F270E0]();
}

uint64_t sub_252368EF0()
{
  return MEMORY[0x270F270E8]();
}

uint64_t sub_252368F00()
{
  return MEMORY[0x270F270F0]();
}

uint64_t sub_252368F10()
{
  return MEMORY[0x270F270F8]();
}

uint64_t sub_252368F20()
{
  return MEMORY[0x270F27100]();
}

uint64_t sub_252368F30()
{
  return MEMORY[0x270F27108]();
}

uint64_t sub_252368F40()
{
  return MEMORY[0x270F27110]();
}

uint64_t sub_252368F50()
{
  return MEMORY[0x270F27118]();
}

uint64_t sub_252368F60()
{
  return MEMORY[0x270F27120]();
}

uint64_t sub_252368F70()
{
  return MEMORY[0x270F27128]();
}

uint64_t sub_252368F80()
{
  return MEMORY[0x270F07498]();
}

uint64_t sub_252368F90()
{
  return MEMORY[0x270F074A0]();
}

uint64_t sub_252368FA0()
{
  return MEMORY[0x270F07550]();
}

uint64_t sub_252368FB0()
{
  return MEMORY[0x270F07558]();
}

uint64_t sub_252368FC0()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_252368FD0()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_252368FE0()
{
  return MEMORY[0x270EF17F8]();
}

uint64_t sub_252368FF0()
{
  return MEMORY[0x270EF1808]();
}

uint64_t sub_252369000()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_252369010()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_252369020()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_252369030()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252369040()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252369050()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_252369060()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_252369070()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_252369080()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_252369090()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2523690A0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2523690B0()
{
  return MEMORY[0x270EF18E8]();
}

uint64_t sub_2523690C0()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_2523690D0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_2523690E0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_2523690F0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_252369100()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_252369110()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_252369120()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_252369130()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252369140()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_252369150()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_252369160()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_252369170()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_252369180()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_252369190()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2523691A0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2523691B0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2523691C0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2523691D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2523691E0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2523691F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252369200()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252369210()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_252369230()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_252369240()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_252369250()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_252369260()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252369270()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_252369280()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252369290()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2523692A0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2523692B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2523692D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2523692E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2523692F0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_252369300()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252369310()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_252369340()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_252369350()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_252369360()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_252369380()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_252369390()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2523693A0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2523693B0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2523693C0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2523693D0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2523693E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2523693F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252369400()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252369410()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_252369420()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252369430()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_252369440()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_252369450()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_252369460()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_252369470()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_252369480()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_252369490()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2523694A0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2523694B0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_2523694C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2523694D0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2523694E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2523694F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252369500()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_252369510()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_252369520()
{
  return MEMORY[0x270EF25E0]();
}

uint64_t sub_252369530()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_252369540()
{
  return MEMORY[0x270EF25F8]();
}

uint64_t sub_252369550()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252369570()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_252369580()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_252369590()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2523695A0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2523695B0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2523695C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2523695D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2523695E0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2523695F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252369600()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252369610()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252369620()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252369630()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252369640()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252369650()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_252369660()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252369670()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252369680()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252369690()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2523696A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2523696B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2523696C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2523696D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2523696E0()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_2523696F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252369700()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_252369710()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_252369720()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252369730()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252369760()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252369770()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252369780()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252369790()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2523697B0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2523697C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2523697D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2523697E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2523697F0()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
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

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}