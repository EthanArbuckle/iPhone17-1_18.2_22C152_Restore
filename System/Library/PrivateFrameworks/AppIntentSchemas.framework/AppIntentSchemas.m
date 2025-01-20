uint64_t PropertySchema.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PropertySchema.type.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A8E028(v1 + 16, a1);
}

uint64_t sub_247A8E028(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t PropertySchema.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL PropertySchema.isOptional.getter()
{
  sub_247A8E028(v0 + 16, (uint64_t)v3);
  BOOL v1 = v3[40] == 5;
  sub_247A8E0FC((uint64_t)v3);
  return v1;
}

uint64_t sub_247A8E0FC(uint64_t a1)
{
  return a1;
}

void PropertySchema.defaultValue.getter(void *a1@<X8>)
{
}

uint64_t PropertySchema.init(_:ofType:title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  uint64_t result = sub_247A8E1B8(a3, (uint64_t)(a6 + 2));
  a6[8] = a4;
  a6[9] = a5;
  return result;
}

uint64_t sub_247A8E1B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t static PropertySchema.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_247AB7690(), uint64_t result = 0, (v5 & 1) != 0))
  {
    if (static ValueType.== infix(_:_:)((uint64_t)(a1 + 2), (uint64_t)(a2 + 2)))
    {
      if (a1[8] == a2[8] && a1[9] == a2[9])
      {
        return 1;
      }
      else
      {
        return sub_247AB7690();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL sub_247A8E2B4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_247A8E2C4()
{
  return sub_247AB76F0();
}

uint64_t sub_247A8E2EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701869940 && a2 == 0xE400000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_247AB7690();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_247A8E41C()
{
  return 3;
}

uint64_t sub_247A8E424()
{
  return sub_247AB7700();
}

uint64_t sub_247A8E46C()
{
  return 0;
}

uint64_t sub_247A8E478(char a1)
{
  if (!a1) {
    return 1701667182;
  }
  if (a1 == 1) {
    return 1701869940;
  }
  return 0x656C746974;
}

BOOL sub_247A8E4BC(char *a1, char *a2)
{
  return sub_247A8E2B4(*a1, *a2);
}

uint64_t sub_247A8E4C8()
{
  return sub_247A8E424();
}

uint64_t sub_247A8E4D0()
{
  return sub_247A8E2C4();
}

uint64_t sub_247A8E4D8()
{
  return sub_247AB7700();
}

uint64_t sub_247A8E51C()
{
  return sub_247A8E478(*v0);
}

uint64_t sub_247A8E524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A8E2EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A8E54C()
{
  return sub_247A8E46C();
}

uint64_t sub_247A8E56C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A8E41C();
  *a1 = result;
  return result;
}

uint64_t sub_247A8E594(uint64_t a1)
{
  unint64_t v2 = sub_247A8E808();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A8E5D0(uint64_t a1)
{
  unint64_t v2 = sub_247A8E808();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PropertySchema.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B260);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A8E808();
  sub_247AB7720();
  v10[15] = 0;
  sub_247AB7660();
  if (!v1)
  {
    v10[14] = 1;
    sub_247A8E854();
    sub_247AB7680();
    v10[13] = 2;
    sub_247AB7660();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v3);
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

unint64_t sub_247A8E808()
{
  unint64_t result = qword_26929B268;
  if (!qword_26929B268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B268);
  }
  return result;
}

unint64_t sub_247A8E854()
{
  unint64_t result = qword_26929B270;
  if (!qword_26929B270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B270);
  }
  return result;
}

uint64_t PropertySchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B278);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A8E808();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v13[0] = 0;
  v14[0] = sub_247AB75F0();
  v14[1] = v6;
  char v16 = 1;
  sub_247A8EAF8();
  sub_247AB7610();
  sub_247A8E1B8((uint64_t)v13, (uint64_t)v15);
  v13[0] = 2;
  uint64_t v7 = sub_247AB75F0();
  uint64_t v9 = v8;
  uint64_t v10 = OUTLINED_FUNCTION_1();
  v11(v10);
  v15[6] = v7;
  v15[7] = v9;
  sub_247A8EB44((uint64_t)v14, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_247A8EB7C((uint64_t)v14);
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

unint64_t sub_247A8EAF8()
{
  unint64_t result = qword_26929B280;
  if (!qword_26929B280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B280);
  }
  return result;
}

uint64_t sub_247A8EB44(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247A8EB7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_247A8EBAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PropertySchema.init(from:)(a1, a2);
}

uint64_t sub_247A8EBC4(void *a1)
{
  return PropertySchema.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for PropertySchema(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PropertySchema(uint64_t a1)
{
  swift_bridgeObjectRelease();
  switch(*(unsigned char *)(a1 + 56))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(a1 + 16);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PropertySchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  int v6 = *(unsigned __int8 *)(a2 + 56);
  swift_bridgeObjectRetain();
  switch(v6)
  {
    case 1:
      long long v7 = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 40) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, v5);
      *(unsigned char *)(a1 + 56) = 1;
      break;
    case 2:
      *(void *)(a1 + 16) = *(void *)v5;
      *(unsigned char *)(a1 + 56) = 2;
      swift_bridgeObjectRetain();
      break;
    case 4:
      *(void *)(a1 + 16) = *(void *)v5;
      char v9 = 4;
      goto LABEL_7;
    case 5:
      *(void *)(a1 + 16) = *(void *)v5;
      char v9 = 5;
LABEL_7:
      *(unsigned char *)(a1 + 56) = v9;
      swift_retain();
      break;
    default:
      long long v8 = *(_OWORD *)(v5 + 16);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
      *(_OWORD *)(a1 + 32) = v8;
      *(_OWORD *)(a1 + 41) = *(_OWORD *)(v5 + 25);
      break;
  }
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PropertySchema(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v4 = (void *)(a2 + 16);
    sub_247A8E0FC(a1 + 16);
    switch(*(unsigned char *)(a2 + 56))
    {
      case 1:
        uint64_t v5 = *(void *)(a2 + 40);
        *(void *)(a1 + 40) = v5;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 16, a2 + 16);
        *(unsigned char *)(a1 + 56) = 1;
        break;
      case 2:
        *(void *)(a1 + 16) = *v4;
        *(unsigned char *)(a1 + 56) = 2;
        swift_bridgeObjectRetain();
        break;
      case 4:
        *(void *)(a1 + 16) = *v4;
        char v8 = 4;
        goto LABEL_8;
      case 5:
        *(void *)(a1 + 16) = *v4;
        char v8 = 5;
LABEL_8:
        *(unsigned char *)(a1 + 56) = v8;
        swift_retain();
        break;
      default:
        long long v6 = *(_OWORD *)v4;
        long long v7 = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = v7;
        break;
    }
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for PropertySchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_247A8E0FC(a1 + 16);
    long long v5 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v5;
    *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  }
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PropertySchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PropertySchema(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PropertySchema()
{
  return &type metadata for PropertySchema;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PropertySchema.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PropertySchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A8F1C8);
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

uint64_t sub_247A8F1F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247A8F1FC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PropertySchema.CodingKeys()
{
  return &type metadata for PropertySchema.CodingKeys;
}

unint64_t sub_247A8F218()
{
  unint64_t result = qword_26929B288;
  if (!qword_26929B288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B288);
  }
  return result;
}

unint64_t sub_247A8F268()
{
  unint64_t result = qword_26929B290;
  if (!qword_26929B290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B290);
  }
  return result;
}

unint64_t sub_247A8F2B8()
{
  unint64_t result = qword_26929B298;
  if (!qword_26929B298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B298);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

char *static PropertyBuilder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t result = (char *)swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 8 * v4 + 32);
      uint64_t v7 = *(void *)(v6 + 16);
      int64_t v8 = *((void *)v5 + 2);
      int64_t v9 = v8 + v7;
      if (__OFADD__(v8, v7)) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!result || v9 > *((void *)v5 + 3) >> 1)
      {
        if (v8 <= v9) {
          int64_t v10 = v8 + v7;
        }
        else {
          int64_t v10 = v8;
        }
        unint64_t result = sub_247A8F5E0(result, v10, 1, v5);
        uint64_t v5 = result;
      }
      if (*(void *)(v6 + 16))
      {
        if ((*((void *)v5 + 3) >> 1) - *((void *)v5 + 2) < v7) {
          goto LABEL_22;
        }
        unint64_t result = (char *)swift_arrayInitWithCopy();
        if (v7)
        {
          uint64_t v11 = *((void *)v5 + 2);
          BOOL v12 = __OFADD__(v11, v7);
          uint64_t v13 = v11 + v7;
          if (v12) {
            goto LABEL_23;
          }
          *((void *)v5 + 2) = v13;
        }
      }
      else if (v7)
      {
        goto LABEL_21;
      }
      unint64_t result = (char *)swift_bridgeObjectRelease();
      if (v1 == ++v4)
      {
        swift_bridgeObjectRelease();
        return v5;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  else
  {
    return (char *)MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t static PropertyBuilder.buildExpression(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247AB7BC0;
  sub_247A8EB44(a1, v2 + 32);
  return v2;
}

void sub_247A8F4E4(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_1_0();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_3();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2F0);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 136);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[136 * v9] <= v13) {
      memmove(v13, v14, 136 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

char *sub_247A8F5E0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[80 * v8] <= v12) {
      memmove(v12, v13, 80 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for PropertyBuilder()
{
  return &type metadata for PropertyBuilder;
}

void sub_247A8F700()
{
}

void sub_247A8F714()
{
}

void sub_247A8F728()
{
  OUTLINED_FUNCTION_4();
  if (v4)
  {
    OUTLINED_FUNCTION_1_0();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_3();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    uint64_t v5 = v2;
  }
  uint64_t v8 = *((void *)v0 + 2);
  if (v5 <= v8) {
    uint64_t v9 = *((void *)v0 + 2);
  }
  else {
    uint64_t v9 = v5;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(v3);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  uint64_t v13 = v0 + 32;
  if (v1)
  {
    if (v10 != v0 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_247A8F810()
{
}

void sub_247A8F824(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_1_0();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_3();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2C8);
    size_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 208);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[208 * v9] <= v13) {
      memmove(v13, v14, 208 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_247A8F91C()
{
}

void sub_247A8F930()
{
}

void sub_247A8F944()
{
  OUTLINED_FUNCTION_4();
  if (v4)
  {
    OUTLINED_FUNCTION_1_0();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_3();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    uint64_t v5 = v2;
  }
  uint64_t v8 = *((void *)v0 + 2);
  if (v5 <= v8) {
    uint64_t v9 = *((void *)v0 + 2);
  }
  else {
    uint64_t v9 = v5;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(v3);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v12 = v10 + 32;
  uint64_t v13 = v0 + 32;
  if (v1)
  {
    if (v10 != v0 || &v13[48 * v8] <= v12) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_247A8FA30()
{
}

void sub_247A8FA44()
{
  OUTLINED_FUNCTION_4();
  if (v5)
  {
    OUTLINED_FUNCTION_1_0();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_3();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    uint64_t v6 = v3;
  }
  uint64_t v9 = v0[2];
  if (v6 <= v9) {
    uint64_t v10 = v0[2];
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(v4);
    size_t v11 = (void *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    size_t v11 = (void *)MEMORY[0x263F8EE78];
  }
  if (v2)
  {
    if (v11 != v0 || &v0[5 * v9 + 4] <= v11 + 4) {
      memmove(v11 + 4, v0 + 4, 40 * v9);
    }
    v0[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(v1);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void *sub_247A8FB54(void *__src, uint64_t a2, void *__dst)
{
  if (__dst != __src || (char *)__src + 40 * a2 <= __dst) {
    return OUTLINED_FUNCTION_0_0(__src, a2, __dst);
  }
  return __src;
}

void *OUTLINED_FUNCTION_0_0(void *__src, uint64_t a2, void *__dst)
{
  return memmove(__dst, __src, 40 * a2);
}

uint64_t SummaryString.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SummaryString.parameters.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *char v1 = a1;
  return result;
}

uint64_t (*SummaryString.parameters.modify())()
{
  return nullsub_1;
}

uint64_t SummaryString.formatString.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SummaryString.formatString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*SummaryString.formatString.modify())()
{
  return nullsub_1;
}

AppIntentSchemas::SummaryString __swiftcall SummaryString.init(stringLiteral:)(Swift::String stringLiteral)
{
  *(void *)uint64_t v1 = MEMORY[0x263F8EE78];
  *(Swift::String *)(v1 + 8) = stringLiteral;
  result.parameters = (Swift::OpaquePointer)stringLiteral._countAndFlagsBits;
  result.formatString._countAndFlagsBits = (uint64_t)stringLiteral._object;
  return result;
}

AppIntentSchemas::SummaryString __swiftcall SummaryString.init(stringInterpolation:)(AppIntentSchemas::SummaryString stringInterpolation)
{
  uint64_t v2 = *((void *)stringInterpolation.parameters._rawValue + 2);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)stringInterpolation.parameters._rawValue;
  *(void *)(v1 + 16) = v2;
  return stringInterpolation;
}

AppIntentSchemas::SummaryString::StringInterpolation __swiftcall SummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(Swift::Int literalCapacity, Swift::Int interpolationCount)
{
  *uint64_t v2 = MEMORY[0x263F8EE78];
  v2[1] = 0;
  v2[2] = 0xE000000000000000;
  if (interpolationCount + 0x4000000000000000 < 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  BOOL v4 = __OFADD__(literalCapacity, 2 * interpolationCount);
  literalCapacity += 2 * interpolationCount;
  if (v4)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  MEMORY[0x24C565F50](literalCapacity);
  sub_247A8FD44(interpolationCount);
LABEL_6:
  result.formatString._object = v5;
  result.formatString._countAndFlagsBits = interpolationCount;
  result.parameters._rawValue = (void *)literalCapacity;
  return result;
}

void sub_247A8FD44(uint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || a1 > *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v3 + 16) <= a1) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = *(void *)(v3 + 16);
    }
    sub_247A8F4E4(isUniquelyReferenced_nonNull_native, v5, 0, (char *)v3);
    uint64_t v3 = v6;
  }
  *uint64_t v1 = v3;
}

Swift::Void __swiftcall SummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

unint64_t sub_247A8FE40()
{
  unint64_t result = qword_26929B2F8;
  if (!qword_26929B2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B2F8);
  }
  return result;
}

void SummaryString.StringInterpolation.appendInterpolation(_:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_247AB74F0();
  swift_bridgeObjectRelease();
  sub_247AB74F0();
  sub_247AB74F0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247AB7BC0;
  sub_247A8FF58(a1, inited + 32);
  sub_247A90704(inited);
}

uint64_t sub_247A8FF58(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_247A8FFB8(Swift::String *a1)
{
}

uint64_t static SummaryString.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  if ((sub_247A97AF4(*a1, *a2) & 1) == 0) {
    return 0;
  }
  if (v2 == v4 && v3 == v5) {
    return 1;
  }
  return sub_247AB7690();
}

BOOL sub_247A90054(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_247A90064()
{
  return sub_247AB76F0();
}

uint64_t sub_247A9008C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x745374616D726F66 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247A901A0()
{
  return 2;
}

uint64_t sub_247A901A8()
{
  return sub_247AB7700();
}

uint64_t sub_247A901F0(char a1)
{
  if (a1) {
    return 0x745374616D726F66;
  }
  else {
    return 0x6574656D61726170;
  }
}

BOOL sub_247A90234(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_247A90054(*a1, *a2);
}

uint64_t sub_247A90240()
{
  return sub_247A901A8();
}

uint64_t sub_247A90248()
{
  return sub_247A90064();
}

uint64_t sub_247A90250()
{
  return sub_247A901F0(*v0);
}

uint64_t sub_247A90258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A9008C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A90280@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A901A0();
  *a1 = result;
  return result;
}

uint64_t sub_247A902A8(uint64_t a1)
{
  unint64_t v2 = sub_247A907EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A902E4(uint64_t a1)
{
  unint64_t v2 = sub_247A907EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SummaryString.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B300);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  v13[1] = v1[2];
  v13[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A907EC();
  sub_247AB7720();
  uint64_t v16 = v11;
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
  sub_247A908CC(&qword_26929B318, (void (*)(void))sub_247A90880);
  sub_247AB7680();
  if (!v2)
  {
    char v14 = 1;
    sub_247AB7660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t SummaryString.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B328);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A907EC();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
  sub_247A908CC(&qword_26929B330, (void (*)(void))sub_247A9093C);
  sub_247AB7610();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_247AB75F0();
  uint64_t v8 = v7;
  uint64_t v9 = OUTLINED_FUNCTION_1_1();
  v10(v9);
  *a2 = v12;
  a2[1] = v6;
  a2[2] = v8;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247A906C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return SummaryString.init(from:)(a1, a2);
}

uint64_t sub_247A906DC(void *a1)
{
  return SummaryString.encode(to:)(a1);
}

unint64_t sub_247A906F8(Swift::String *a1)
{
  return (unint64_t)SummaryString.init(stringLiteral:)(*a1);
}

void sub_247A90704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_247A8F4E4(isUniquelyReferenced_nonNull_native, v8, 1, (char *)v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v10 = *(void *)(v3 + 16);
  BOOL v11 = __OFADD__(v10, v2);
  uint64_t v12 = v10 + v2;
  if (!v11)
  {
    *(void *)(v3 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

unint64_t sub_247A907EC()
{
  unint64_t result = qword_26929B308;
  if (!qword_26929B308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B308);
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

unint64_t sub_247A90880()
{
  unint64_t result = qword_26929B320;
  if (!qword_26929B320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B320);
  }
  return result;
}

uint64_t sub_247A908CC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929B310);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A9093C()
{
  unint64_t result = qword_26929B338;
  if (!qword_26929B338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B338);
  }
  return result;
}

uint64_t sub_247A90988()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_247A90998()
{
  unint64_t result = qword_26929B340;
  if (!qword_26929B340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B340);
  }
  return result;
}

unint64_t sub_247A909E8()
{
  unint64_t result = qword_26929B348;
  if (!qword_26929B348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B348);
  }
  return result;
}

unint64_t sub_247A90A38()
{
  unint64_t result = qword_26929B350;
  if (!qword_26929B350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B350);
  }
  return result;
}

unint64_t sub_247A90A88()
{
  unint64_t result = qword_26929B358;
  if (!qword_26929B358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B358);
  }
  return result;
}

uint64_t sub_247A90AD4()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_247A90AE0()
{
  return MEMORY[0x263F8D390];
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SummaryString()
{
  return &type metadata for SummaryString;
}

uint64_t destroy for SummaryString.StringInterpolation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16AppIntentSchemas13SummaryStringVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s16AppIntentSchemas13SummaryStringVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s16AppIntentSchemas13SummaryStringVwta_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16AppIntentSchemas13SummaryStringVwet_0(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_247A90C90(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SummaryString.StringInterpolation()
{
  return &type metadata for SummaryString.StringInterpolation;
}

uint64_t getEnumTagSinglePayload for SummaryString.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SummaryString.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A90E34);
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

unsigned char *sub_247A90E5C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SummaryString.CodingKeys()
{
  return &type metadata for SummaryString.CodingKeys;
}

unint64_t sub_247A90E7C()
{
  unint64_t result = qword_26929B360;
  if (!qword_26929B360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B360);
  }
  return result;
}

unint64_t sub_247A90ECC()
{
  unint64_t result = qword_26929B368;
  if (!qword_26929B368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B368);
  }
  return result;
}

unint64_t sub_247A90F1C()
{
  unint64_t result = qword_26929B370;
  if (!qword_26929B370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B370);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

void static CaseBuilder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v4 + 16);
      if (__OFADD__(v7, v6)) {
        break;
      }
      swift_bridgeObjectRetain();
      if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v6 > *(void *)(v4 + 24) >> 1)
      {
        sub_247A8F700();
        uint64_t v4 = v8;
      }
      if (*(void *)(v5 + 16))
      {
        if ((*(void *)(v4 + 24) >> 1) - *(void *)(v4 + 16) < v6) {
          goto LABEL_18;
        }
        swift_arrayInitWithCopy();
        if (v6)
        {
          uint64_t v9 = *(void *)(v4 + 16);
          BOOL v10 = __OFADD__(v9, v6);
          uint64_t v11 = v9 + v6;
          if (v10) {
            goto LABEL_19;
          }
          *(void *)(v4 + 16) = v11;
        }
      }
      else if (v6)
      {
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      if (v1 == ++v3)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
}

uint64_t static CaseBuilder.buildExpression(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2E8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247AB7BC0;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  return v3;
}

ValueMetadata *type metadata accessor for CaseBuilder()
{
  return &type metadata for CaseBuilder;
}

uint64_t Summary.summaryString.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  return sub_247A91148(v2);
}

uint64_t sub_247A91148(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t Summary.otherParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Summary.parameters.getter()
{
  if (*v0) {
    uint64_t v1 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_247A90704(v2);
  return v4;
}

__n128 Summary.init(_:otherParameters:)@<Q0>(__n128 *a1@<X0>, uint64_t (*a2)(unsigned char *)@<X1>, __n128 *a3@<X8>)
{
  __n128 v7 = *a1;
  unint64_t v4 = a1[1].n128_u64[0];
  uint64_t v5 = a2(v8);
  sub_247A91A78((uint64_t)v8);
  __n128 result = v7;
  *a3 = v7;
  a3[1].n128_u64[0] = v4;
  a3[1].n128_u64[1] = v5;
  return result;
}

uint64_t static Summary.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v8 = a2[3];
  if (!*a1)
  {
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  uint64_t v10 = OUTLINED_FUNCTION_1_2();
  if (!v6)
  {
    sub_247A91148(v10);
LABEL_13:
    sub_247A91148(v6);
    sub_247A91AD8(v3);
    uint64_t v14 = v6;
LABEL_16:
    sub_247A91AD8(v14);
    return 0;
  }
  sub_247A91148(v10);
  uint64_t v11 = OUTLINED_FUNCTION_1_2();
  sub_247A91148(v11);
  sub_247A91148(v6);
  if ((sub_247A97AF4(v3, v6) & 1) == 0)
  {
    sub_247A91AD8(v6);
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = OUTLINED_FUNCTION_1_2();
    goto LABEL_16;
  }
  if (v2 != v7 || v4 != v9)
  {
    char v13 = sub_247AB7690();
    sub_247A91AD8(v6);
    if (v13) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  sub_247A91AD8(v6);
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247A91AD8(v3);
LABEL_19:
  return sub_247A97AF4(v5, v8);
}

uint64_t sub_247A913DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x537972616D6D7573 && a2 == 0xED0000676E697274;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726150726568746FLL && a2 == 0xEF73726574656D61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247A91514(char a1)
{
  if (a1) {
    return 0x726150726568746FLL;
  }
  else {
    return 0x537972616D6D7573;
  }
}

uint64_t sub_247A91564()
{
  return sub_247A91514(*v0);
}

uint64_t sub_247A9156C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A913DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A91594(uint64_t a1)
{
  unint64_t v2 = sub_247A91B18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A915D0(uint64_t a1)
{
  unint64_t v2 = sub_247A91B18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Summary.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B380);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v14 = *v1;
  uint64_t v10 = *((void *)v1 + 2);
  uint64_t v13 = *((void *)v1 + 3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A91B18();
  sub_247AB7720();
  long long v15 = v14;
  uint64_t v16 = v10;
  char v17 = 0;
  sub_247A91B64();
  sub_247AB7650();
  if (!v2)
  {
    *(void *)&long long v15 = v13;
    char v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
    sub_247A908CC(&qword_26929B318, (void (*)(void))sub_247A90880);
    sub_247AB7680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t Summary.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B398);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A91B18();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_247A91BB0();
  sub_247AB75E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
  sub_247A91148(v9);
  sub_247A908CC(&qword_26929B330, (void (*)(void))sub_247A9093C);
  sub_247AB7610();
  uint64_t v6 = OUTLINED_FUNCTION_2_1();
  v7(v6);
  sub_247A91148(v9);
  swift_bridgeObjectRetain();
  sub_247A91AD8(v9);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v9;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_247A91AD8(v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247A91A48@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return Summary.init(from:)(a1, a2);
}

uint64_t sub_247A91A60(void *a1)
{
  return Summary.encode(to:)(a1);
}

uint64_t sub_247A91A78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B378);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247A91AD8(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_247A91B18()
{
  unint64_t result = qword_26929B388;
  if (!qword_26929B388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B388);
  }
  return result;
}

unint64_t sub_247A91B64()
{
  unint64_t result = qword_26929B390;
  if (!qword_26929B390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B390);
  }
  return result;
}

unint64_t sub_247A91BB0()
{
  unint64_t result = qword_26929B3A0;
  if (!qword_26929B3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3A0);
  }
  return result;
}

unint64_t sub_247A91BFC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_247A91C2C();
  unint64_t result = sub_247A91C78();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_247A91C2C()
{
  unint64_t result = qword_26929B3A8;
  if (!qword_26929B3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3A8);
  }
  return result;
}

unint64_t sub_247A91C78()
{
  unint64_t result = qword_26929B3B0;
  if (!qword_26929B3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3B0);
  }
  return result;
}

uint64_t destroy for Summary(void *a1)
{
  if (*a1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Summary(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    uint64_t v5 = a2[2];
    *a1 = *a2;
    a1[1] = v4;
    a1[2] = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
  }
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for Summary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  if (v4)
  {
    if (v5)
    {
      *a1 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_247A91E5C((uint64_t)a1);
      uint64_t v6 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v6;
    }
  }
  else if (v5)
  {
    *a1 = v5;
    a1[1] = a2[1];
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *(_OWORD *)a2;
    a1[2] = a2[2];
    *(_OWORD *)a1 = v7;
  }
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247A91E5C(uint64_t a1)
{
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

void *assignWithTake for Summary(void *a1, uint64_t a2)
{
  if (!*a1) {
    goto LABEL_5;
  }
  if (!*(void *)a2)
  {
    sub_247A91E5C((uint64_t)a1);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = *(void *)(a2 + 16);
    goto LABEL_6;
  }
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  a1[1] = *(void *)(a2 + 8);
  a1[2] = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  a1[3] = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Summary(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Summary(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Summary()
{
  return &type metadata for Summary;
}

unsigned char *storeEnumTagSinglePayload for Summary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A92094);
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

ValueMetadata *type metadata accessor for Summary.CodingKeys()
{
  return &type metadata for Summary.CodingKeys;
}

unint64_t sub_247A920D0()
{
  unint64_t result = qword_26929B3B8;
  if (!qword_26929B3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3B8);
  }
  return result;
}

unint64_t sub_247A92120()
{
  unint64_t result = qword_26929B3C0;
  if (!qword_26929B3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3C0);
  }
  return result;
}

unint64_t sub_247A92170()
{
  unint64_t result = qword_26929B3C8;
  if (!qword_26929B3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t static AppIntentDomains.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t AppIntentDomains.Error.hash(into:)()
{
  return sub_247AB76F0();
}

uint64_t AppIntentDomains.Error.hashValue.getter()
{
  return sub_247AB7700();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return 1;
}

uint64_t sub_247A9225C()
{
  return AppIntentDomains.Error.hashValue.getter();
}

uint64_t sub_247A92274()
{
  return AppIntentDomains.Error.hash(into:)();
}

uint64_t sub_247A922A0()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_247A92304(v0);
}

uint64_t sub_247A922CC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247A92304(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_247A9234C())()
{
  return j__swift_endAccess;
}

uint64_t AppIntentDomains.__allocating_init(domains:)(uint64_t a1)
{
  OUTLINED_FUNCTION_3_0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t AppIntentDomains.init(domains:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

void static AppIntentDomains.load()()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B3D0);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = sub_247AB7480();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  type metadata accessor for AppIntentDomains();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v14 = sub_247A92DF4(0xD000000000000010, 0x8000000247AB80E0, 1852797802, 0xE400000000000000, v13);
  if (!v14)
  {
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v3);
    goto LABEL_6;
  }
  long long v15 = v14;
  uint64_t v27 = v0;
  sub_247AB7470();

  uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v16(v1, v9, v3);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
LABEL_6:
    sub_247A92EB0(v1);
    sub_247A92F10();
    swift_allocError();
    swift_willThrow();
    goto LABEL_7;
  }
  v16((uint64_t)v11, (char *)v1, v3);
  uint64_t v17 = v27;
  uint64_t v18 = sub_247AB7490();
  if (v17)
  {
    uint64_t v20 = OUTLINED_FUNCTION_1_3();
    v21(v20);
LABEL_7:

    return;
  }
  uint64_t v22 = v18;
  unint64_t v23 = v19;
  sub_247AB7460();
  swift_allocObject();
  sub_247AB7450();
  sub_247A92F84();
  sub_247AB7440();
  uint64_t v24 = OUTLINED_FUNCTION_1_3();
  v25(v24);
  swift_release();
  sub_247A92FD0(v22, v23);
}

uint64_t type metadata accessor for AppIntentDomains()
{
  return self;
}

uint64_t sub_247A926DC()
{
  return sub_247AB76F0();
}

uint64_t sub_247A92704(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x736E69616D6F64 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247A9278C()
{
  return sub_247AB7700();
}

uint64_t sub_247A927D0()
{
  return 0x736E69616D6F64;
}

uint64_t sub_247A927F4()
{
  return sub_247AB7700();
}

uint64_t sub_247A92838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A92704(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A92864()
{
  return sub_247A8E46C();
}

uint64_t sub_247A92880@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_5();
  *a1 = result & 1;
  return result;
}

uint64_t sub_247A928AC(uint64_t a1)
{
  unint64_t v2 = sub_247A93028();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A928E8(uint64_t a1)
{
  unint64_t v2 = sub_247A93028();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppIntentDomains.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AppIntentDomains.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_3_0();
  return MEMORY[0x270FA0228](v0);
}

uint64_t sub_247A92974(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B3E8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A93028();
  sub_247AB7720();
  swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B3F8);
  sub_247A930C0(&qword_26929B400, (void (*)(void))sub_247A93074);
  sub_247AB7680();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t AppIntentDomains.__allocating_init(from:)(void *a1)
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = swift_allocObject();
  AppIntentDomains.init(from:)(a1);
  return v2;
}

uint64_t AppIntentDomains.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B410);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A93028();
  sub_247AB7710();
  if (v2)
  {
    type metadata accessor for AppIntentDomains();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B3F8);
    sub_247A930C0(&qword_26929B418, (void (*)(void))sub_247A93130);
    sub_247AB7610();
    uint64_t v6 = OUTLINED_FUNCTION_2_1();
    v7(v6);
    *(void *)(v1 + 16) = v8;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_247A92CB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_247A92CF4()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t static AppIntentDomains.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v6 = sub_247A9828C(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_247A92DD0(uint64_t *a1, uint64_t *a2)
{
  return static AppIntentDomains.== infix(_:_:)(*a1, *a2) & 1;
}

id sub_247A92DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v6 = (void *)sub_247AB74C0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_247AB74C0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_247A92EB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B3D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247A92F10()
{
  unint64_t result = qword_26929B3D8;
  if (!qword_26929B3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3D8);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_247A92F84()
{
  unint64_t result = qword_26929B3E0;
  if (!qword_26929B3E0)
  {
    type metadata accessor for AppIntentDomains();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3E0);
  }
  return result;
}

uint64_t sub_247A92FD0(uint64_t a1, unint64_t a2)
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

unint64_t sub_247A93028()
{
  unint64_t result = qword_26929B3F0;
  if (!qword_26929B3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B3F0);
  }
  return result;
}

unint64_t sub_247A93074()
{
  unint64_t result = qword_26929B408;
  if (!qword_26929B408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B408);
  }
  return result;
}

uint64_t sub_247A930C0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929B3F8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A93130()
{
  unint64_t result = qword_26929B420;
  if (!qword_26929B420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B420);
  }
  return result;
}

unint64_t sub_247A93180()
{
  unint64_t result = qword_26929B428;
  if (!qword_26929B428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B428);
  }
  return result;
}

uint64_t sub_247A931CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247A922CC();
  *a1 = result;
  return result;
}

uint64_t method lookup function for AppIntentDomains(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppIntentDomains);
}

uint64_t dispatch thunk of AppIntentDomains.domains.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of AppIntentDomains.domains.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of AppIntentDomains.domains.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of AppIntentDomains.__allocating_init(domains:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AppIntentDomains.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AppIntentDomains.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_247A93300()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppIntentDomains.Error()
{
  return &type metadata for AppIntentDomains.Error;
}

uint64_t getEnumTagSinglePayload for ParameterSummaryWrapper.Base(unsigned int *a1, int a2)
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

unsigned char *_s16AppIntentSchemas16AppIntentDomainsC5ErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A93404);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppIntentDomains.CodingKeys()
{
  return &type metadata for AppIntentDomains.CodingKeys;
}

unint64_t sub_247A93440()
{
  unint64_t result = qword_26929B430;
  if (!qword_26929B430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B430);
  }
  return result;
}

unint64_t sub_247A93490()
{
  unint64_t result = qword_26929B438;
  if (!qword_26929B438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B438);
  }
  return result;
}

unint64_t sub_247A934E0()
{
  unint64_t result = qword_26929B440;
  if (!qword_26929B440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B440);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t static ParameterBuilder.buildBlock(_:_:)(uint64_t a1, void *a2, uint64_t a3)
{
  sub_247A935FC((uint64_t)a2, a1);
  uint64_t v5 = a2[3];
  uint64_t v6 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  swift_bridgeObjectRetain();
  sub_247A90704(v7);
  return a3;
}

uint64_t sub_247A935FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static ParameterBuilder.buildBlock(_:)(uint64_t a1)
{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for ParameterBuilder()
{
  return &type metadata for ParameterBuilder;
}

uint64_t ParameterSchema.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ParameterSchema.type.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A8E028(v1 + 16, a1);
}

uint64_t ParameterSchema.supportedUTTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ParameterSchema.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ParameterSchema.displayName.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[11];
  uint64_t v3 = v1[12];
  uint64_t v4 = v1[13];
  uint64_t v5 = v1[14];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_247A9370C(v2, v3);
}

uint64_t sub_247A9370C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t ParameterSchema.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL ParameterSchema.isOptional.getter()
{
  sub_247A8E028(v0 + 16, (uint64_t)v3);
  BOOL v1 = v3[40] == 5;
  sub_247A8E0FC((uint64_t)v3);
  return v1;
}

void ParameterSchema.defaultValue.getter(void *a1@<X8>)
{
}

__n128 ParameterSchema.init(_:ofType:supportedUTTypes:title:displayName:description:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, __n128 *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  __n128 v18 = *a7;
  unint64_t v15 = a7[1].n128_u64[0];
  unint64_t v16 = a7[1].n128_u64[1];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  sub_247A8E1B8(a3, a9 + 16);
  *(void *)(a9 + 64) = a4;
  *(void *)(a9 + 72) = a5;
  *(void *)(a9 + 80) = a6;
  __n128 result = v18;
  *(__n128 *)(a9 + 88) = v18;
  *(void *)(a9 + 104) = v15;
  *(void *)(a9 + 112) = v16;
  *(void *)(a9 + 120) = a8;
  *(void *)(a9 + 128) = a10;
  return result;
}

uint64_t static ParameterSchema.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    sub_247AB7690();
    uint64_t result = OUTLINED_FUNCTION_7();
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  if ((static ValueType.== infix(_:_:)((uint64_t)(a1 + 2), (uint64_t)(a2 + 2)) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = a2[8];
  if (!a1[8])
  {
    if (!v7) {
      goto LABEL_12;
    }
    return 0;
  }
  if (!v7) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  char v9 = sub_247A97FA0(v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0) {
    return 0;
  }
LABEL_12:
  if (a1[9] != a2[9] || a1[10] != a2[10])
  {
    sub_247AB7690();
    uint64_t result = OUTLINED_FUNCTION_7();
    if ((v11 & 1) == 0) {
      return result;
    }
  }
  uint64_t v12 = a1[12];
  uint64_t v13 = a1[13];
  uint64_t v14 = a1[14];
  uint64_t v15 = a2[12];
  uint64_t v16 = a2[13];
  uint64_t v17 = a2[14];
  if (!v12)
  {
    if (!v15)
    {
LABEL_34:
      if (a1[15] == a2[15] && a1[16] == a2[16]) {
        return 1;
      }
      return sub_247AB7690();
    }
    goto LABEL_31;
  }
  if (!v15)
  {
LABEL_31:
    uint64_t v22 = OUTLINED_FUNCTION_5_0();
    sub_247A9370C(v22, v23);
    uint64_t v24 = OUTLINED_FUNCTION_6();
    sub_247A9370C(v24, v25);
    uint64_t v26 = OUTLINED_FUNCTION_5_0();
    sub_247A9444C(v26, v27);
    uint64_t v28 = OUTLINED_FUNCTION_6();
    sub_247A9444C(v28, v29);
    return 0;
  }
  BOOL v18 = a1[11] == a2[11] && v12 == v15;
  if (v18 || (sub_247AB7690(), uint64_t result = OUTLINED_FUNCTION_7(), (v19 & 1) != 0))
  {
    if (v13 == v16 && v14 == v17) {
      goto LABEL_34;
    }
    sub_247AB7690();
    uint64_t result = OUTLINED_FUNCTION_7();
    if (v21) {
      goto LABEL_34;
    }
  }
  return result;
}

uint64_t sub_247A93A48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701869940 && a2 == 0xE400000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000247ABDFA0 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
        if (v8 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v10 = sub_247AB7690();
          swift_bridgeObjectRelease();
          if (v10) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_247A93CC4()
{
  return 6;
}

unint64_t sub_247A93CCC(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701869940;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x656C746974;
      break;
    case 4:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 5:
      unint64_t result = 0x7470697263736564;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_247A93D94()
{
  return sub_247A93CCC(*v0);
}

uint64_t sub_247A93D9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A93A48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A93DC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A93CC4();
  *a1 = result;
  return result;
}

uint64_t sub_247A93DEC(uint64_t a1)
{
  unint64_t v2 = sub_247A94490();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A93E28(uint64_t a1)
{
  unint64_t v2 = sub_247A94490();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ParameterSchema.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B448);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A94490();
  sub_247AB7720();
  LOBYTE(v13[0]) = 0;
  OUTLINED_FUNCTION_3_1();
  if (!v2)
  {
    LOBYTE(v13[0]) = 1;
    sub_247A8E854();
    sub_247AB7680();
    *(void *)&v13[0] = *(void *)(v3 + 64);
    char v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B458);
    sub_247A94528(&qword_26929B460, &qword_26929B468);
    sub_247AB7650();
    LOBYTE(v13[0]) = 3;
    OUTLINED_FUNCTION_3_1();
    long long v11 = *(_OWORD *)(v3 + 104);
    v13[0] = *(_OWORD *)(v3 + 88);
    v13[1] = v11;
    char v14 = 4;
    sub_247A944DC();
    sub_247AB7650();
    LOBYTE(v13[0]) = 5;
    OUTLINED_FUNCTION_3_1();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t ParameterSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B478);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A94490();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v20[0]) = 0;
  v21[0] = OUTLINED_FUNCTION_2_3();
  v21[1] = v11;
  char v19 = 1;
  sub_247A8EAF8();
  OUTLINED_FUNCTION_4_0();
  sub_247AB7610();
  sub_247A8E1B8((uint64_t)v20, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B458);
  char v19 = 2;
  sub_247A94528(&qword_26929B480, &qword_26929B488);
  sub_247AB75E0();
  v22[6] = *(void *)&v20[0];
  LOBYTE(v20[0]) = 3;
  v22[7] = OUTLINED_FUNCTION_2_3();
  v22[8] = v12;
  char v19 = 4;
  sub_247A945EC();
  OUTLINED_FUNCTION_4_0();
  sub_247AB75E0();
  long long v23 = v20[0];
  long long v24 = v20[1];
  LOBYTE(v20[0]) = 5;
  uint64_t v13 = OUTLINED_FUNCTION_2_3();
  char v14 = v10;
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v5);
  uint64_t v25 = v13;
  uint64_t v26 = v16;
  sub_247A8FF58((uint64_t)v21, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_247A94638((uint64_t)v21);
}

uint64_t sub_247A94418@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ParameterSchema.init(from:)(a1, a2);
}

uint64_t sub_247A94430(void *a1)
{
  return ParameterSchema.encode(to:)(a1);
}

uint64_t sub_247A9444C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_247A94490()
{
  unint64_t result = qword_26929B450;
  if (!qword_26929B450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B450);
  }
  return result;
}

unint64_t sub_247A944DC()
{
  unint64_t result = qword_26929B470;
  if (!qword_26929B470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B470);
  }
  return result;
}

uint64_t sub_247A94528(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929B458);
    sub_247A945A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247A945A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_247AB74A0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A945EC()
{
  unint64_t result = qword_26929B490;
  if (!qword_26929B490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B490);
  }
  return result;
}

uint64_t sub_247A94638(uint64_t a1)
{
  return a1;
}

uint64_t destroy for ParameterSchema(uint64_t a1)
{
  swift_bridgeObjectRelease();
  switch(*(unsigned char *)(a1 + 56))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(a1 + 16);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 96))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParameterSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  int v6 = *(unsigned __int8 *)(a2 + 56);
  swift_bridgeObjectRetain();
  switch(v6)
  {
    case 1:
      long long v7 = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 40) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, v5);
      *(unsigned char *)(a1 + 56) = 1;
      break;
    case 2:
      *(void *)(a1 + 16) = *(void *)v5;
      *(unsigned char *)(a1 + 56) = 2;
      swift_bridgeObjectRetain();
      break;
    case 4:
      *(void *)(a1 + 16) = *(void *)v5;
      char v9 = 4;
      goto LABEL_7;
    case 5:
      *(void *)(a1 + 16) = *(void *)v5;
      char v9 = 5;
LABEL_7:
      *(unsigned char *)(a1 + 56) = v9;
      swift_retain();
      break;
    default:
      long long v8 = *(_OWORD *)(v5 + 16);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
      *(_OWORD *)(a1 + 32) = v8;
      *(_OWORD *)(a1 + 41) = *(_OWORD *)(v5 + 25);
      break;
  }
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11)
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = v11;
    uint64_t v12 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v13;
  }
  uint64_t v14 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParameterSchema(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v4 = (void *)(a2 + 16);
    sub_247A8E0FC(a1 + 16);
    switch(*(unsigned char *)(a2 + 56))
    {
      case 1:
        uint64_t v5 = *(void *)(a2 + 40);
        *(void *)(a1 + 40) = v5;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 16, a2 + 16);
        *(unsigned char *)(a1 + 56) = 1;
        break;
      case 2:
        *(void *)(a1 + 16) = *v4;
        *(unsigned char *)(a1 + 56) = 2;
        swift_bridgeObjectRetain();
        break;
      case 4:
        *(void *)(a1 + 16) = *v4;
        char v8 = 4;
        goto LABEL_8;
      case 5:
        *(void *)(a1 + 16) = *v4;
        char v8 = 5;
LABEL_8:
        *(unsigned char *)(a1 + 56) = v8;
        swift_retain();
        break;
      default:
        long long v6 = *(_OWORD *)v4;
        long long v7 = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = v7;
        break;
    }
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v9 = (_OWORD *)(a1 + 88);
  uint64_t v10 = (_OWORD *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96))
  {
    if (v11)
    {
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_247A94B08(a1 + 88);
      long long v12 = *(_OWORD *)(a2 + 104);
      *char v9 = *v10;
      *(_OWORD *)(a1 + 104) = v12;
    }
  }
  else if (v11)
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 104);
    *char v9 = *v10;
    *(_OWORD *)(a1 + 104) = v13;
  }
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247A94B08(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy136_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

uint64_t assignWithTake for ParameterSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_247A8E0FC(a1 + 16);
    long long v5 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v5;
    *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 96)) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 96);
  if (!v7)
  {
    sub_247A94B08(a1 + 88);
LABEL_7:
    long long v9 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v9;
    goto LABEL_8;
  }
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterSchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 136))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParameterSchema(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParameterSchema()
{
  return &type metadata for ParameterSchema;
}

uint64_t getEnumTagSinglePayload for ParameterSchema.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ParameterSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x247A94E40);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParameterSchema.CodingKeys()
{
  return &type metadata for ParameterSchema.CodingKeys;
}

unint64_t sub_247A94E7C()
{
  unint64_t result = qword_26929B498;
  if (!qword_26929B498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B498);
  }
  return result;
}

unint64_t sub_247A94ECC()
{
  unint64_t result = qword_26929B4A0;
  if (!qword_26929B4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4A0);
  }
  return result;
}

unint64_t sub_247A94F1C()
{
  unint64_t result = qword_26929B4A8;
  if (!qword_26929B4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_247AB75F0();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_247AB7660();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return 0;
}

uint64_t dispatch thunk of ParameterSummary.parameters.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ParameterSummary.summaryString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ParameterSummary.otherParameters.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t initializeWithCopy for ParameterSummaryWrapper(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ParameterSummaryWrapper(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
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
          *unint64_t result = *a2;
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ParameterSummaryWrapper(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterSummaryWrapper(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParameterSummaryWrapper(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParameterSummaryWrapper()
{
  return &type metadata for ParameterSummaryWrapper;
}

uint64_t sub_247A953D0()
{
  uint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_247A95428(char a1)
{
  if (a1) {
    return 0x64616F6C796170;
  }
  else {
    return 1702060386;
  }
}

uint64_t sub_247A95458(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_247AB1AB0(*a1, *a2);
}

uint64_t sub_247A95464()
{
  return sub_247AB538C(*v0);
}

uint64_t sub_247A9546C(uint64_t a1)
{
  return sub_247AB38E0(a1, *v1);
}

uint64_t sub_247A95474(uint64_t a1)
{
  return sub_247AB3C94(a1, *v1);
}

BOOL sub_247A9547C(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_247A95488()
{
  return 0;
}

uint64_t sub_247A95490@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A953D0();
  *a1 = result;
  return result;
}

uint64_t sub_247A954C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247A95428(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247A954EC()
{
  return sub_247A95428(*v0);
}

uint64_t sub_247A954F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A95424();
  *a1 = result;
  return result;
}

uint64_t sub_247A9551C(uint64_t a1)
{
  unint64_t v2 = sub_247A95B64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A95558(uint64_t a1)
{
  unint64_t v2 = sub_247A95B64();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_247A9559C@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_247A9547C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_247A955CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247A95488();
  *a1 = result;
  return result;
}

uint64_t sub_247A955F4()
{
  return sub_247AB7540();
}

uint64_t sub_247A95654()
{
  return sub_247AB7520();
}

uint64_t sub_247A956A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B4B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95B64();
  sub_247AB7710();
  if (!v2)
  {
    sub_247A95BB0();
    sub_247AB7610();
    char v15 = 1;
    uint64_t v11 = &type metadata for Summary;
    unint64_t v12 = sub_247A95BFC();
    *(void *)&long long v10 = swift_allocObject();
    sub_247A91C2C();
    sub_247AB7610();
    uint64_t v6 = OUTLINED_FUNCTION_1_4();
    v7(v6);
    sub_247A95CE8(&v10, (uint64_t)v13);
    long long v8 = v13[1];
    *(_OWORD *)a2 = v13[0];
    *(_OWORD *)(a2 + 16) = v8;
    *(void *)(a2 + 32) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247A95870(void *a1)
{
  long long v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B4D0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95B64();
  sub_247AB7720();
  sub_247A935FC((uint64_t)v3, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B4D8);
  if (swift_dynamicCast())
  {
    sub_247A95D64();
    sub_247AB7680();
    if (!v2)
    {
      v18[55] = 1;
      sub_247A91C78();
      sub_247AB7680();
    }
    uint64_t v6 = OUTLINED_FUNCTION_2_4();
    v7(v6);
    sub_247A91AD8(v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_247AB7590();
    swift_allocError();
    long long v10 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B4E0);
    uint64_t v11 = v3[3];
    unint64_t v12 = __swift_project_boxed_opaque_existential_1(v3, v11);
    v10[3] = v11;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_0, v12, v11);
    sub_247AB7560();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCE0], v8);
    swift_willThrow();
    uint64_t v14 = OUTLINED_FUNCTION_2_4();
    v15(v14);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t sub_247A95B34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247A956A4(a1, a2);
}

uint64_t sub_247A95B4C(void *a1)
{
  return sub_247A95870(a1);
}

unint64_t sub_247A95B64()
{
  unint64_t result = qword_26929B4B8;
  if (!qword_26929B4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4B8);
  }
  return result;
}

unint64_t sub_247A95BB0()
{
  unint64_t result = qword_26929B4C0;
  if (!qword_26929B4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4C0);
  }
  return result;
}

unint64_t sub_247A95BFC()
{
  unint64_t result = qword_26929B4C8;
  if (!qword_26929B4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4C8);
  }
  return result;
}

uint64_t sub_247A95C48()
{
  if (*(void *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x24C5663E0);
  }
  return result;
}

uint64_t sub_247A95CE8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unsigned int v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_247A95D64()
{
  unint64_t result = qword_26929B4E8;
  if (!qword_26929B4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ParameterSummaryWrapper.Base(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A95E4CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParameterSummaryWrapper.Base()
{
  return &type metadata for ParameterSummaryWrapper.Base;
}

unsigned char *storeEnumTagSinglePayload for ParameterSummaryWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A95F50);
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

ValueMetadata *type metadata accessor for ParameterSummaryWrapper.CodingKeys()
{
  return &type metadata for ParameterSummaryWrapper.CodingKeys;
}

unint64_t sub_247A95F8C()
{
  unint64_t result = qword_26929B4F0;
  if (!qword_26929B4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4F0);
  }
  return result;
}

unint64_t sub_247A95FDC()
{
  unint64_t result = qword_26929B4F8;
  if (!qword_26929B4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B4F8);
  }
  return result;
}

unint64_t sub_247A9602C()
{
  unint64_t result = qword_26929B500;
  if (!qword_26929B500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B500);
  }
  return result;
}

unint64_t sub_247A9607C()
{
  unint64_t result = qword_26929B508;
  if (!qword_26929B508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B508);
  }
  return result;
}

unint64_t sub_247A960C8()
{
  unint64_t result = qword_26929B510;
  if (!qword_26929B510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B510);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return v0;
}

uint64_t CaseSchema._name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

AppIntentSchemas::CaseSchema __swiftcall CaseSchema.init(_:)(AppIntentSchemas::CaseSchema result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t static CaseSchema.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_247AB7690();
  }
}

uint64_t sub_247A961A8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656D616E5FLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247A96228()
{
  return 0x656D616E5FLL;
}

uint64_t sub_247A96240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A961A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A9626C(uint64_t a1)
{
  unint64_t v2 = sub_247A963E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A962A8(uint64_t a1)
{
  unint64_t v2 = sub_247A963E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CaseSchema.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B518);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A963E0();
  sub_247AB7720();
  sub_247AB7660();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v1);
}

unint64_t sub_247A963E0()
{
  unint64_t result = qword_26929B520;
  if (!qword_26929B520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B520);
  }
  return result;
}

uint64_t CaseSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B528);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A963E0();
  sub_247AB7710();
  if (!v2)
  {
    uint64_t v6 = sub_247AB75F0();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_2_5();
    v10(v9);
    *a2 = v6;
    a2[1] = v8;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247A96540@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CaseSchema.init(from:)(a1, a2);
}

uint64_t sub_247A96558(void *a1)
{
  return CaseSchema.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for CaseSchema(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CaseSchema()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for CaseSchema(void *a1, void *a2)
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

void *assignWithTake for CaseSchema(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CaseSchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CaseSchema(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CaseSchema()
{
  return &type metadata for CaseSchema;
}

unsigned char *storeEnumTagSinglePayload for CaseSchema.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A96758);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CaseSchema.CodingKeys()
{
  return &type metadata for CaseSchema.CodingKeys;
}

unint64_t sub_247A96794()
{
  unint64_t result = qword_26929B530;
  if (!qword_26929B530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B530);
  }
  return result;
}

unint64_t sub_247A967E4()
{
  unint64_t result = qword_26929B538;
  if (!qword_26929B538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B538);
  }
  return result;
}

unint64_t sub_247A96834()
{
  unint64_t result = qword_26929B540;
  if (!qword_26929B540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B540);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return v0;
}

uint64_t EntitySystemProtocol.hash(into:)()
{
  return sub_247AB76F0();
}

uint64_t static EntitySystemProtocol.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_247A96904(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701603686 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247A9697C()
{
  return 1701603686;
}

uint64_t sub_247A9698C()
{
  return 1;
}

uint64_t sub_247A969AC()
{
  return 0;
}

uint64_t sub_247A969BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A96904(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A969E8(uint64_t a1)
{
  unint64_t v2 = sub_247A96C78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A96A24(uint64_t a1)
{
  unint64_t v2 = sub_247A96C78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A96A64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A9698C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_247A96A90(uint64_t a1)
{
  unint64_t v2 = sub_247A96CC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A96ACC(uint64_t a1)
{
  unint64_t v2 = sub_247A96CC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EntitySystemProtocol.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B548);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_6();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B550);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_6();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A96C78();
  sub_247AB7720();
  sub_247A96CC4();
  sub_247AB7630();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
}

unint64_t sub_247A96C78()
{
  unint64_t result = qword_26929B558;
  if (!qword_26929B558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B558);
  }
  return result;
}

unint64_t sub_247A96CC4()
{
  unint64_t result = qword_26929B560;
  if (!qword_26929B560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B560);
  }
  return result;
}

uint64_t EntitySystemProtocol.hashValue.getter()
{
  return sub_247AB7700();
}

uint64_t EntitySystemProtocol.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B568);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_6();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B570);
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_6();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A96C78();
  sub_247AB7710();
  if (v1) {
    goto LABEL_6;
  }
  uint64_t v26 = v14;
  uint64_t v15 = sub_247AB7620();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16
    || (sub_247A9739C(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
        uint64_t v18 = v17,
        unint64_t v20 = v19,
        swift_bridgeObjectRelease(),
        v18 != v20 >> 1))
  {
    uint64_t v21 = sub_247AB7570();
    swift_allocError();
    long long v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *long long v23 = &type metadata for EntitySystemProtocol;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v9);
LABEL_6:
    uint64_t v25 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v25);
  }
  sub_247A96CC4();
  sub_247AB75B0();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v8, v3);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v14, v9);
  uint64_t v25 = (uint64_t)a1;
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

uint64_t sub_247A97060()
{
  return EntitySystemProtocol.hashValue.getter();
}

uint64_t sub_247A97078()
{
  return EntitySystemProtocol.hash(into:)();
}

uint64_t sub_247A97090(void *a1)
{
  return EntitySystemProtocol.init(from:)(a1);
}

uint64_t sub_247A970A8(void *a1)
{
  return EntitySystemProtocol.encode(to:)(a1);
}

unint64_t sub_247A970C4()
{
  unint64_t result = qword_26929B580;
  if (!qword_26929B580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B580);
  }
  return result;
}

ValueMetadata *type metadata accessor for EntitySystemProtocol()
{
  return &type metadata for EntitySystemProtocol;
}

unsigned char *_s16AppIntentSchemas20EntitySystemProtocolOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A971C0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for EntitySystemProtocol.CodingKeys()
{
  return &type metadata for EntitySystemProtocol.CodingKeys;
}

ValueMetadata *type metadata accessor for EntitySystemProtocol.FileCodingKeys()
{
  return &type metadata for EntitySystemProtocol.FileCodingKeys;
}

unint64_t sub_247A9720C()
{
  unint64_t result = qword_26929B588;
  if (!qword_26929B588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B588);
  }
  return result;
}

unint64_t sub_247A9725C()
{
  unint64_t result = qword_26929B590;
  if (!qword_26929B590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B590);
  }
  return result;
}

unint64_t sub_247A972AC()
{
  unint64_t result = qword_26929B598;
  if (!qword_26929B598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B598);
  }
  return result;
}

unint64_t sub_247A972FC()
{
  unint64_t result = qword_26929B5A0;
  if (!qword_26929B5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5A0);
  }
  return result;
}

unint64_t sub_247A9734C()
{
  unint64_t result = qword_26929B5A8;
  if (!qword_26929B5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5A8);
  }
  return result;
}

uint64_t sub_247A9739C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_247A97430(void *a1@<X8>)
{
  sub_247A8E028(v1, (uint64_t)v5);
  if (v6 == 4)
  {
    uint64_t v4 = *(void *)(*(void *)v5 + 64);
    if (v4)
    {
      a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B648);
      *a1 = v4;
    }
    else
    {
      OUTLINED_FUNCTION_38();
    }
    swift_bridgeObjectRetain();
    swift_release();
  }
  else if (v6)
  {
    OUTLINED_FUNCTION_38();
    sub_247A8E0FC((uint64_t)v5);
  }
  else
  {
    unsigned __int8 v3 = v5[0];
    if (v5[0] == 2)
    {
      OUTLINED_FUNCTION_38();
    }
    else
    {
      a1[3] = MEMORY[0x263F8D4F8];
      *(unsigned char *)a1 = v3 & 1;
    }
  }
}

uint64_t static ValueType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_247A8E028(a1, (uint64_t)&v43);
  uint64_t v3 = sub_247A8E028(a2, (uint64_t)&v49);
  switch(v48)
  {
    case 1:
      OUTLINED_FUNCTION_24(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42[0]);
      if (v52 == 1)
      {
        sub_247A95CE8(v42, (uint64_t)&v36);
        sub_247A95CE8((long long *)&v49, (uint64_t)&v30);
        sub_247A935FC((uint64_t)&v36, (uint64_t)&v25);
        sub_247A935FC((uint64_t)&v30, (uint64_t)&v20);
        LOBYTE(v11) = sub_247AAC830((uint64_t)&v25, (uint64_t)&v20);
        sub_247A98DF4((uint64_t)&v20);
        sub_247A98DF4((uint64_t)&v25);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
        goto LABEL_45;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      goto LABEL_33;
    case 2:
      OUTLINED_FUNCTION_24(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42[0]);
      if (v52 == 2)
      {
        LOBYTE(v11) = sub_247A983DC(*(uint64_t *)&v42[0], v49);
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      goto LABEL_33;
    case 3:
      OUTLINED_FUNCTION_24(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42[0]);
      if (v52 != 3) {
        goto LABEL_33;
      }
      LOBYTE(v11) = LOBYTE(v42[0]) == v49;
      goto LABEL_45;
    case 4:
      OUTLINED_FUNCTION_24(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42[0]);
      if (v52 != 4) {
        goto LABEL_32;
      }
      uint64_t v12 = *(void **)(*(void *)&v42[0] + 64);
      uint64_t v13 = v49;
      uint64_t v11 = *(void **)(v49 + 64);
      sub_247A8E028(*(void *)&v42[0] + 16, (uint64_t)&v36);
      sub_247A8E028(v13 + 16, (uint64_t)&v30);
      if (static ValueType.== infix(_:_:)(&v36, &v30))
      {
        if (v12)
        {
          if (v11) {
            LOBYTE(v11) = sub_247A98494(v12, v11);
          }
          swift_bridgeObjectRetain();
          sub_247A8E0FC((uint64_t)&v30);
          sub_247A8E0FC((uint64_t)&v36);
          swift_release();
          swift_release();
LABEL_16:
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
        swift_bridgeObjectRetain();
        sub_247A8E0FC((uint64_t)&v30);
        sub_247A8E0FC((uint64_t)&v36);
        swift_release();
        swift_release();
        if (!v11)
        {
          LOBYTE(v11) = 1;
LABEL_45:
          sub_247A8E0FC((uint64_t)&v43);
          return v11 & 1;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_247A8E0FC((uint64_t)&v30);
        sub_247A8E0FC((uint64_t)&v36);
        swift_release();
        swift_release();
      }
      LOBYTE(v11) = 0;
      goto LABEL_45;
    case 5:
      OUTLINED_FUNCTION_24(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42[0]);
      if (v52 == 5)
      {
        uint64_t v14 = v49;
        sub_247A8E028(*(void *)&v42[0] + 16, (uint64_t)&v36);
        sub_247A8E028(v14 + 16, (uint64_t)&v30);
        LOBYTE(v11) = static ValueType.== infix(_:_:)(&v36, &v30);
        sub_247A8E0FC((uint64_t)&v30);
        sub_247A8E0FC((uint64_t)&v36);
        swift_release();
        swift_release();
        goto LABEL_45;
      }
LABEL_32:
      swift_release();
      goto LABEL_33;
    case 6:
      if (v46 | v47 | v43 | v45 | v44)
      {
        uint64_t v15 = v46 | v47 | v45 | v44;
        BOOL v16 = v43 == 1 && v15 == 0;
        if (v16)
        {
          OUTLINED_FUNCTION_8();
          if (!v16 || v49 != 1) {
            goto LABEL_33;
          }
        }
        else if (v43 != 2 || v15)
        {
          if (v43 != 3 || v15)
          {
            if (v43 != 4 || v15)
            {
              if (v43 != 5 || v15)
              {
                if (v43 != 6 || v15)
                {
                  if (v43 != 7 || v15)
                  {
                    if (v43 != 8 || v15)
                    {
                      if (v43 != 9 || v15)
                      {
                        if (v43 != 10 || v15)
                        {
                          if (v43 != 11 || v15)
                          {
                            if (v43 != 12 || v15)
                            {
                              if (v43 != 13 || v15)
                              {
                                if (v43 != 14 || v15)
                                {
                                  OUTLINED_FUNCTION_8();
                                  if (!v16 || v49 != 15) {
                                    goto LABEL_33;
                                  }
                                }
                                else
                                {
                                  OUTLINED_FUNCTION_8();
                                  if (!v16 || v49 != 14) {
                                    goto LABEL_33;
                                  }
                                }
                              }
                              else
                              {
                                OUTLINED_FUNCTION_8();
                                if (!v16 || v49 != 13) {
                                  goto LABEL_33;
                                }
                              }
                            }
                            else
                            {
                              OUTLINED_FUNCTION_8();
                              if (!v16 || v49 != 12) {
                                goto LABEL_33;
                              }
                            }
                          }
                          else
                          {
                            OUTLINED_FUNCTION_8();
                            if (!v16 || v49 != 11) {
                              goto LABEL_33;
                            }
                          }
                        }
                        else
                        {
                          OUTLINED_FUNCTION_8();
                          if (!v16 || v49 != 10) {
                            goto LABEL_33;
                          }
                        }
                      }
                      else
                      {
                        OUTLINED_FUNCTION_8();
                        if (!v16 || v49 != 9) {
                          goto LABEL_33;
                        }
                      }
                    }
                    else
                    {
                      OUTLINED_FUNCTION_8();
                      if (!v16 || v49 != 8) {
                        goto LABEL_33;
                      }
                    }
                  }
                  else
                  {
                    OUTLINED_FUNCTION_8();
                    if (!v16 || v49 != 7) {
                      goto LABEL_33;
                    }
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_8();
                  if (!v16 || v49 != 6) {
                    goto LABEL_33;
                  }
                }
              }
              else
              {
                OUTLINED_FUNCTION_8();
                if (!v16 || v49 != 5) {
                  goto LABEL_33;
                }
              }
            }
            else
            {
              OUTLINED_FUNCTION_8();
              if (!v16 || v49 != 4) {
                goto LABEL_33;
              }
            }
          }
          else
          {
            OUTLINED_FUNCTION_8();
            if (!v16 || v49 != 3) {
              goto LABEL_33;
            }
          }
        }
        else
        {
          OUTLINED_FUNCTION_8();
          if (!v16 || v49 != 2) {
            goto LABEL_33;
          }
        }
        int8x16_t v18 = vorrq_s8(v50, v51);
        if (vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))
        {
LABEL_33:
          sub_247A97A94((uint64_t)&v43);
          LOBYTE(v11) = 0;
          return v11 & 1;
        }
      }
      else
      {
        OUTLINED_FUNCTION_8();
        if (!v16) {
          goto LABEL_33;
        }
        int8x16_t v17 = vorrq_s8(v50, v51);
        if (*(void *)&vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) | v49) {
          goto LABEL_33;
        }
      }
LABEL_42:
      sub_247A8E0FC((uint64_t)&v43);
      LOBYTE(v11) = 1;
      return v11 & 1;
    default:
      if (!v52) {
        goto LABEL_42;
      }
      goto LABEL_33;
  }
}

uint64_t sub_247A97A94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B5B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247A97AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247AB74A0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v56 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v55 = (char *)&v43 - v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2) {
      return 1;
    }
    uint64_t v11 = 0;
    uint64_t v12 = a1 + 32;
    uint64_t v49 = &v70;
    uint64_t v50 = a2 + 32;
    char v48 = &v59;
    v53 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v54 = v6 + 16;
    while (1)
    {
      sub_247A8FF58(v12 + 136 * v11, (uint64_t)v69);
      sub_247A8FF58(v50 + 136 * v11, (uint64_t)v58);
      BOOL v13 = v69[0] == v58[0] && v69[1] == v58[1];
      if (!v13 && (sub_247AB7690() & 1) == 0 || (static ValueType.== infix(_:_:)(v49, v48) & 1) == 0) {
        break;
      }
      uint64_t v14 = v60;
      uint64_t v57 = v71;
      if (v71)
      {
        if (!v60) {
          break;
        }
        uint64_t v15 = *(void *)(v57 + 16);
        if (v15 != *(void *)(v60 + 16)) {
          break;
        }
        if (v15 && v57 != v60)
        {
          uint64_t v44 = v12;
          uint64_t v45 = v11;
          uint64_t v46 = v10;
          uint64_t v47 = v6;
          unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
          int8x16_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
          uint64_t v51 = *(void *)(v6 + 72);
          char v52 = v17;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          while (1)
          {
            int8x16_t v18 = v55;
            unint64_t v19 = v52;
            v52(v55, v57 + v16, v4);
            uint64_t v20 = v56;
            v19(v56, v14 + v16, v4);
            sub_247A9EDF0();
            char v21 = sub_247AB74B0();
            uint64_t v22 = *v53;
            (*v53)(v20, v4);
            v22(v18, v4);
            if ((v21 & 1) == 0) {
              break;
            }
            v16 += v51;
            if (!--v15)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v10 = v46;
              uint64_t v6 = v47;
              uint64_t v12 = v44;
              uint64_t v11 = v45;
              goto LABEL_21;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          break;
        }
      }
      else if (v60)
      {
        break;
      }
LABEL_21:
      BOOL v23 = v72 == v61 && v73 == v62;
      if (!v23 && (sub_247AB7690() & 1) == 0) {
        break;
      }
      uint64_t v24 = v74;
      uint64_t v25 = v75;
      uint64_t v26 = v76;
      uint64_t v27 = v77;
      uint64_t v28 = v65;
      uint64_t v29 = v66;
      if (v75)
      {
        if (!v64) {
          goto LABEL_52;
        }
        if (v74 != v63 || v75 != v64)
        {
          uint64_t v31 = v65;
          uint64_t v32 = v66;
          uint64_t v33 = v76;
          uint64_t v34 = v77;
          char v35 = sub_247AB7690();
          uint64_t v27 = v34;
          uint64_t v26 = v33;
          uint64_t v29 = v32;
          uint64_t v28 = v31;
          if ((v35 & 1) == 0) {
            break;
          }
        }
        BOOL v36 = v26 == v28 && v27 == v29;
        if (!v36 && (sub_247AB7690() & 1) == 0) {
          break;
        }
      }
      else if (v64)
      {
LABEL_52:
        sub_247A9370C(v74, v75);
        uint64_t v39 = OUTLINED_FUNCTION_35();
        sub_247A9370C(v39, v40);
        sub_247A9444C(v24, v25);
        uint64_t v41 = OUTLINED_FUNCTION_35();
        sub_247A9444C(v41, v42);
        break;
      }
      BOOL v37 = v78 == v67 && v79 == v68;
      if (!v37 && (sub_247AB7690() & 1) == 0) {
        break;
      }
      ++v11;
      sub_247A94638((uint64_t)v58);
      sub_247A94638((uint64_t)v69);
      uint64_t result = 1;
      if (v11 == v10) {
        return result;
      }
    }
    sub_247A94638((uint64_t)v58);
    sub_247A94638((uint64_t)v69);
  }
  return 0;
}

uint64_t sub_247A97EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        sub_247A9EC64(v3, (uint64_t)v11);
        sub_247A9EC64(v4, (uint64_t)v10);
        char v6 = sub_247AAC830(v11, v10);
        sub_247A98DF4((uint64_t)v10);
        sub_247A98DF4((uint64_t)v11);
        BOOL v8 = v5-- != 0;
        if ((v6 & 1) == 0) {
          break;
        }
        v3 += 40;
        v4 += 40;
      }
      while (v8);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_247A97FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247AB74A0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      uint64_t v13 = v7 + 16;
      uint64_t v31 = v8;
      uint64_t v32 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v33 = v13;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(char *, uint64_t))(v13 - 8);
      uint64_t v16 = v11 - 1;
      int8x16_t v17 = v8;
      do
      {
        uint64_t v18 = a1;
        unint64_t v19 = v10;
        uint64_t v20 = v10;
        char v21 = v32;
        v32(v19, a1 + v12, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v12, v4);
        uint64_t v10 = v20;
        sub_247A9EDF0();
        char v23 = sub_247AB74B0();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24(v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v12 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_247A98168(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = a1 + 32;
    for (uint64_t i = a2 + 32; ; i += 80)
    {
      sub_247A8EB44(v3, (uint64_t)v11);
      sub_247A8EB44(i, (uint64_t)v9);
      BOOL v5 = v11[0] == v9[0] && v11[1] == v9[1];
      if (!v5 && (sub_247AB7690() & 1) == 0 || (static ValueType.== infix(_:_:)(v12, v10) & 1) == 0) {
        break;
      }
      if (v12[6] == v10[6] && v12[7] == v10[7])
      {
        sub_247A8EB7C((uint64_t)v9);
        sub_247A8EB7C((uint64_t)v11);
      }
      else
      {
        char v7 = sub_247AB7690();
        sub_247A8EB7C((uint64_t)v9);
        sub_247A8EB7C((uint64_t)v11);
        if ((v7 & 1) == 0) {
          return 0;
        }
      }
      v3 += 80;
      if (!--v2) {
        return 1;
      }
    }
    sub_247A8EB7C((uint64_t)v9);
    sub_247A8EB7C((uint64_t)v11);
  }
  return 0;
}

uint64_t sub_247A9828C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v3 = v2 - 1;
      uint64_t v4 = (char *)(a1 + 57);
      BOOL v5 = (char *)(a2 + 57);
      do
      {
        char v6 = *(v4 - 1);
        char v7 = *v4;
        uint64_t v18 = *(void *)(v4 - 25);
        long long v19 = *(_OWORD *)(v4 - 17);
        char v20 = v6;
        char v21 = v7;
        char v8 = *(v5 - 1);
        char v9 = *v5;
        uint64_t v14 = *(void *)(v5 - 25);
        long long v15 = *(_OWORD *)(v5 - 17);
        char v16 = v8;
        char v17 = v9;
        char v10 = static DomainSchema.== infix(_:_:)((uint64_t)&v18, (uint64_t)&v14);
        BOOL v12 = v3-- != 0;
        if ((v10 & 1) == 0) {
          break;
        }
        v4 += 32;
        v5 += 32;
      }
      while (v12);
    }
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_247A98358(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = (void *)(a1 + 40);
    for (uint64_t i = (void *)(a2 + 40); ; i += 2)
    {
      BOOL v5 = *(v3 - 1) == *(i - 1) && *v3 == *i;
      if (!v5 && (sub_247AB7690() & 1) == 0) {
        break;
      }
      v3 += 2;
      if (!--v2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_247A983DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        sub_247A8E028(v3, (uint64_t)v11);
        sub_247A8E028(v4, (uint64_t)v10);
        char v6 = static ValueType.== infix(_:_:)(v11, v10);
        sub_247A8E0FC((uint64_t)v10);
        sub_247A8E0FC((uint64_t)v11);
        BOOL v8 = v5-- != 0;
        if ((v6 & 1) == 0) {
          break;
        }
        v4 += 48;
        v3 += 48;
      }
      while (v8);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_247A98494(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_247AB7690();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  BOOL v8 = a1 + 7;
  char v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = sub_247AB7690();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

void ValueType.init(from:)()
{
  OUTLINED_FUNCTION_14();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B5B8);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_6();
  uint64_t v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_247A98E48();
  sub_247AB7710();
  if (!v0)
  {
    sub_247A98E94();
    sub_247AB7610();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
    sub_247A9869C((uint64_t)v12, v4);
    sub_247A98EE0((uint64_t)v12);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_15();
}

void sub_247A9869C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_247A9EA74(a1, (uint64_t)v11);
  switch(v14)
  {
    case 1:
      v9[0] = v11[0];
      v9[1] = v11[1];
      uint64_t v10 = v12;
      sub_247A95CE8(v9, a2);
      char v3 = 1;
      break;
    case 2:
      *(void *)a2 = *(void *)&v11[0];
      char v3 = 2;
      break;
    case 3:
      *(unsigned char *)a2 = v11[0];
      char v3 = 3;
      break;
    case 4:
      uint64_t v4 = v13;
      uint64_t v5 = swift_allocObject();
      sub_247A8E1B8((uint64_t)v11, v5 + 16);
      *(void *)(v5 + 64) = v4;
      *(void *)a2 = v5;
      char v3 = 4;
      break;
    case 5:
      uint64_t v6 = swift_allocObject();
      sub_247A8E1B8((uint64_t)v11, v6 + 16);
      *(void *)a2 = v6;
      char v3 = 5;
      break;
    default:
      switch(LOBYTE(v11[0]))
      {
        case 3:
          *(void *)(a2 + 32) = 0;
          OUTLINED_FUNCTION_38();
          goto LABEL_26;
        case 4:
          uint64_t v7 = 1;
          goto LABEL_25;
        case 5:
          uint64_t v7 = 2;
          goto LABEL_25;
        case 6:
          uint64_t v7 = 3;
          goto LABEL_25;
        case 7:
          uint64_t v7 = 4;
          goto LABEL_25;
        case 8:
          uint64_t v7 = 5;
          goto LABEL_25;
        case 9:
          OUTLINED_FUNCTION_37(6);
          *(unsigned char *)(a2 + 40) = v8;
          return;
        case 0xA:
          uint64_t v7 = 7;
          goto LABEL_25;
        case 0xB:
          uint64_t v7 = 8;
          goto LABEL_25;
        case 0xC:
          uint64_t v7 = 9;
          goto LABEL_25;
        case 0xD:
          uint64_t v7 = 10;
          goto LABEL_25;
        case 0xE:
          uint64_t v7 = 11;
          goto LABEL_25;
        case 0xF:
          uint64_t v7 = 12;
          goto LABEL_25;
        case 0x10:
          uint64_t v7 = 13;
          goto LABEL_25;
        case 0x11:
          uint64_t v7 = 14;
          goto LABEL_25;
        case 0x12:
          uint64_t v7 = 15;
LABEL_25:
          OUTLINED_FUNCTION_37(v7);
LABEL_26:
          char v3 = 6;
          goto LABEL_27;
        default:
          *(unsigned char *)a2 = v11[0];
          *(unsigned char *)(a2 + 40) = 0;
          return;
      }
  }
LABEL_27:
  *(unsigned char *)(a2 + 40) = v3;
}

uint64_t ValueType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B5D0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A98E48();
  sub_247AB7720();
  sub_247A989E8((uint64_t)v8);
  sub_247A98F10();
  sub_247AB7680();
  sub_247A98EE0((uint64_t)v8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t sub_247A989E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_247A8E028(v1, (uint64_t)&v10);
  switch(v14)
  {
    case 1:
      uint64_t result = sub_247A95CE8(&v10, a1);
      char v4 = 1;
      goto LABEL_6;
    case 2:
      *(void *)a1 = v10;
      char v4 = 2;
      goto LABEL_6;
    case 3:
      *(unsigned char *)a1 = v10;
      char v4 = 3;
LABEL_6:
      *(unsigned char *)(a1 + 56) = v4;
      return result;
    case 4:
      uint64_t v5 = *(void *)(v10 + 64);
      sub_247A8E028(v10 + 16, a1);
      *(void *)(a1 + 48) = v5;
      *(unsigned char *)(a1 + 56) = 4;
      swift_bridgeObjectRetain();
      return swift_release();
    case 5:
      sub_247A8E028(v10 + 16, a1);
      *(unsigned char *)(a1 + 56) = 5;
      return swift_release();
    case 6:
      if (v12 | v13 | (unint64_t)v10 | v11 | *((void *)&v10 + 1))
      {
        uint64_t v6 = v12 | v13 | v11 | *((void *)&v10 + 1);
        if ((void)v10 == 1 && v6 == 0)
        {
          char v9 = 4;
        }
        else if ((void)v10 == 2 && v6 == 0)
        {
          char v9 = 5;
        }
        else if ((void)v10 != 3 || v6)
        {
          if ((void)v10 != 4 || v6)
          {
            if ((void)v10 != 5 || v6)
            {
              if ((void)v10 != 6 || v6)
              {
                if ((void)v10 != 7 || v6)
                {
                  if ((void)v10 != 8 || v6)
                  {
                    if ((void)v10 != 9 || v6)
                    {
                      if ((void)v10 != 10 || v6)
                      {
                        if ((void)v10 != 11 || v6)
                        {
                          if ((void)v10 != 12 || v6)
                          {
                            if ((void)v10 != 13 || v6)
                            {
                              if ((void)v10 != 14 || v6) {
                                char v9 = 18;
                              }
                              else {
                                char v9 = 17;
                              }
                            }
                            else
                            {
                              char v9 = 16;
                            }
                          }
                          else
                          {
                            char v9 = 15;
                          }
                        }
                        else
                        {
                          char v9 = 14;
                        }
                      }
                      else
                      {
                        char v9 = 13;
                      }
                    }
                    else
                    {
                      char v9 = 12;
                    }
                  }
                  else
                  {
                    char v9 = 11;
                  }
                }
                else
                {
                  char v9 = 10;
                }
              }
              else
              {
                char v9 = 9;
              }
            }
            else
            {
              char v9 = 8;
            }
          }
          else
          {
            char v9 = 7;
          }
        }
        else
        {
          char v9 = 6;
        }
      }
      else
      {
        char v9 = 3;
      }
      *(unsigned char *)a1 = v9;
      goto LABEL_26;
    default:
      *(unsigned char *)a1 = v10;
LABEL_26:
      *(unsigned char *)(a1 + 56) = 0;
      return result;
  }
}

BOOL sub_247A98C38()
{
  uint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_247A98C80()
{
  return sub_247A98C38();
}

uint64_t sub_247A98C9C()
{
  return 0x72657070617277;
}

BOOL sub_247A98CC0@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_247A98C38();
  *a1 = result;
  return result;
}

uint64_t sub_247A98CF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247A98C9C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_247A98D20@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_247A98C80();
  *a1 = result;
  return result;
}

uint64_t sub_247A98D4C(uint64_t a1)
{
  unint64_t v2 = sub_247A98E48();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A98D88(uint64_t a1)
{
  unint64_t v2 = sub_247A98E48();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247A98DC4()
{
}

uint64_t sub_247A98DDC(void *a1)
{
  return ValueType.encode(to:)(a1);
}

uint64_t sub_247A98DF4(uint64_t a1)
{
  return a1;
}

unint64_t sub_247A98E48()
{
  unint64_t result = qword_26929B5C0;
  if (!qword_26929B5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5C0);
  }
  return result;
}

unint64_t sub_247A98E94()
{
  unint64_t result = qword_26929B5C8;
  if (!qword_26929B5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5C8);
  }
  return result;
}

uint64_t sub_247A98EE0(uint64_t a1)
{
  return a1;
}

unint64_t sub_247A98F10()
{
  unint64_t result = qword_26929B5D8;
  if (!qword_26929B5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5D8);
  }
  return result;
}

uint64_t sub_247A98F5C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72657070617277 && a2 == 0xE700000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746C7561666564 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247A99054(char a1)
{
  if (a1) {
    return 0x746C7561666564;
  }
  else {
    return 0x72657070617277;
  }
}

uint64_t sub_247A99084(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x766974696D697270 && a2 == 0xE900000000000065;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x616D65686373 && a2 == 0xE600000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6F696E75 && a2 == 0xE500000000000000;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6D6572757361656DLL && a2 == 0xEB00000000746E65;
        if (v8 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x7961727261 && a2 == 0xE500000000000000;
          if (v9 || (sub_247AB7690() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6C616E6F6974706FLL && a2 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_247AB7690();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_247A99300(char a1)
{
  uint64_t result = 0x766974696D697270;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x616D65686373;
      break;
    case 2:
      uint64_t result = 0x6E6F696E75;
      break;
    case 3:
      uint64_t result = 0x6D6572757361656DLL;
      break;
    case 4:
      uint64_t result = 0x7961727261;
      break;
    case 5:
      uint64_t result = 0x6C616E6F6974706FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247A993CC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x72657070617277 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_247A99454()
{
  OUTLINED_FUNCTION_14();
  uint64_t v50 = v1;
  uint64_t v54 = v0;
  char v3 = v2;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6A0);
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v6);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6A8);
  OUTLINED_FUNCTION_0();
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11((uint64_t)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6B0);
  OUTLINED_FUNCTION_0();
  v44[6] = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v12);
  v44[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6B8);
  OUTLINED_FUNCTION_0();
  v44[3] = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_27();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6C0);
  OUTLINED_FUNCTION_0();
  v44[2] = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_13();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6C8);
  OUTLINED_FUNCTION_0();
  v44[1] = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B6D0);
  OUTLINED_FUNCTION_0();
  uint64_t v52 = v21;
  uint64_t v53 = v22;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_6();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_247A9DE1C();
  uint64_t v51 = v25;
  sub_247AB7720();
  sub_247A9EA74(v54, (uint64_t)v58);
  switch(v60)
  {
    case 1:
      v56[0] = v58[0];
      v56[1] = v58[1];
      uint64_t v57 = v59;
      sub_247A9E944();
      OUTLINED_FUNCTION_32();
      sub_247A9EBCC();
      sub_247AB7680();
      OUTLINED_FUNCTION_3_2();
      v31();
      sub_247A98DF4((uint64_t)v56);
      goto LABEL_10;
    case 2:
      uint64_t v32 = *(void *)&v58[0];
      LOBYTE(v56[0]) = 2;
      sub_247A9E8F8();
      OUTLINED_FUNCTION_29();
      *(void *)&v56[0] = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26929B670);
      sub_247A9EB5C(&qword_26929B6E8, (void (*)(void))sub_247A8E854);
      sub_247AB7680();
      OUTLINED_FUNCTION_3_2();
      v33();
      goto LABEL_14;
    case 3:
      char v34 = v58[0];
      LOBYTE(v56[0]) = 3;
      sub_247A9E860();
      OUTLINED_FUNCTION_34();
      LOBYTE(v56[0]) = v34;
      sub_247A9EB10();
      uint64_t v35 = v45;
      sub_247AB7680();
      uint64_t v28 = OUTLINED_FUNCTION_21();
      uint64_t v30 = v35;
      goto LABEL_6;
    case 4:
      sub_247A8E1B8((uint64_t)v58, (uint64_t)v56);
      sub_247A9E814();
      OUTLINED_FUNCTION_29();
      sub_247A8E854();
      uint64_t v36 = v50;
      sub_247AB7680();
      if (v36)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_2();
        v37();
        sub_247A8E0FC((uint64_t)v56);
        uint64_t v38 = OUTLINED_FUNCTION_39();
LABEL_11:
        v40(v38, v39);
      }
      else
      {
        char v55 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26929B648);
        sub_247A9EAAC(&qword_26929B6D8);
        sub_247AB7650();
        OUTLINED_FUNCTION_3_2();
        v42();
        sub_247A8E0FC((uint64_t)v56);
LABEL_14:
        OUTLINED_FUNCTION_39();
        OUTLINED_FUNCTION_3_2();
        v43();
        swift_bridgeObjectRelease();
      }
      break;
    case 5:
      sub_247A8E1B8((uint64_t)v58, (uint64_t)v56);
      sub_247A9E7A8();
      OUTLINED_FUNCTION_32();
      sub_247A8E854();
      sub_247AB7680();
      OUTLINED_FUNCTION_3_2();
      v41();
      sub_247A8E0FC((uint64_t)v56);
LABEL_10:
      uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      uint64_t v38 = v18;
      uint64_t v39 = v25;
      goto LABEL_11;
    default:
      char v27 = v58[0];
      LOBYTE(v56[0]) = 0;
      sub_247A9E9DC();
      OUTLINED_FUNCTION_34();
      LOBYTE(v56[0]) = v27;
      sub_247A9EC18();
      sub_247AB7680();
      uint64_t v28 = OUTLINED_FUNCTION_22();
      uint64_t v30 = v18;
LABEL_6:
      v29(v28, v30);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v15, v26);
      break;
  }
  OUTLINED_FUNCTION_15();
}

void sub_247A99B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_14();
  uint64_t v74 = v10;
  uint64_t v15 = v14;
  v69 = v16;
  v68[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B5F8);
  OUTLINED_FUNCTION_0();
  uint64_t v70 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v19);
  v68[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B600);
  OUTLINED_FUNCTION_0();
  v68[13] = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_11((uint64_t)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B608);
  OUTLINED_FUNCTION_0();
  v68[11] = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_11((uint64_t)v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v68[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B610);
  OUTLINED_FUNCTION_0();
  v68[9] = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2_6();
  uint64_t v71 = v28;
  v68[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B618);
  OUTLINED_FUNCTION_0();
  v68[6] = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_26();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B620);
  OUTLINED_FUNCTION_0();
  v68[5] = v32;
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_1_5();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B628);
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v35;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_13();
  uint64_t v38 = v15[3];
  uint64_t v73 = v15;
  __swift_project_boxed_opaque_existential_1(v15, v38);
  sub_247A9DE1C();
  uint64_t v39 = v74;
  sub_247AB7710();
  if (v39) {
    goto LABEL_7;
  }
  v68[3] = v12;
  v68[2] = v31;
  v68[4] = v11;
  uint64_t v74 = v36;
  uint64_t v40 = sub_247AB7620();
  uint64_t v41 = *(void *)(v40 + 16);
  if (!v41
    || (v68[1] = 0,
        uint64_t v42 = *(unsigned __int8 *)(v40 + 32),
        sub_247A97398(1, v41, v40, v40 + 32, 0, (2 * v41) | 1),
        uint64_t v44 = v43,
        unint64_t v46 = v45,
        swift_bridgeObjectRelease(),
        v44 != v46 >> 1))
  {
    uint64_t v49 = sub_247AB7570();
    swift_allocError();
    uint64_t v51 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *uint64_t v51 = &unk_26FBF1B60;
    sub_247AB75C0();
    OUTLINED_FUNCTION_16();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v49 - 8) + 104))(v51, *MEMORY[0x263F8DCB0], v49);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v13, v34);
LABEL_7:
    uint64_t v52 = (uint64_t)v73;
    goto LABEL_8;
  }
  switch(v42)
  {
    case 1:
      LOBYTE(v75[0]) = 1;
      sub_247A9E944();
      OUTLINED_FUNCTION_9();
      sub_247A9E990();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_3_2();
      v55();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_2();
      v56();
      char v57 = 1;
      goto LABEL_14;
    case 2:
      LOBYTE(v75[0]) = 2;
      sub_247A9E8F8();
      OUTLINED_FUNCTION_9();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26929B670);
      sub_247A9EB5C(&qword_26929B678, (void (*)(void))sub_247A8EAF8);
      sub_247AB7610();
      OUTLINED_FUNCTION_3_2();
      v53();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_2();
      v54();
      *(void *)&v75[0] = a10;
      char v57 = 2;
      goto LABEL_14;
    case 3:
      LOBYTE(v75[0]) = 3;
      sub_247A9E860();
      OUTLINED_FUNCTION_9();
      sub_247A9E8AC();
      sub_247AB7610();
      OUTLINED_FUNCTION_3_2();
      v58();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_2();
      v59();
      LOBYTE(v75[0]) = a10;
      char v57 = 3;
      goto LABEL_14;
    case 4:
      LOBYTE(v75[0]) = 4;
      sub_247A9E814();
      OUTLINED_FUNCTION_9();
      sub_247A8EAF8();
      sub_247AB7610();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26929B648);
      sub_247A9EAAC(&qword_26929B650);
      sub_247AB75E0();
      OUTLINED_FUNCTION_3_2();
      v63();
      swift_unknownObjectRelease();
      uint64_t v64 = OUTLINED_FUNCTION_30();
      v65(v64);
      char v76 = 4;
      sub_247A9E7F4(v75, v77);
      uint64_t v66 = (uint64_t)v73;
      uint64_t v67 = v69;
      goto LABEL_16;
    case 5:
      LOBYTE(v75[0]) = 5;
      sub_247A9E7A8();
      OUTLINED_FUNCTION_9();
      sub_247A8EAF8();
      sub_247AB7610();
      uint64_t v60 = OUTLINED_FUNCTION_31();
      v61(v60);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_2();
      v62();
      char v57 = 5;
LABEL_14:
      char v76 = v57;
      break;
    default:
      LOBYTE(v75[0]) = 0;
      sub_247A9E9DC();
      OUTLINED_FUNCTION_9();
      sub_247A9EA28();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_3_2();
      v47();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_3_2();
      v48();
      LOBYTE(v75[0]) = a10;
      char v76 = 0;
      break;
  }
  sub_247A9E7F4(v75, v77);
  uint64_t v66 = (uint64_t)v73;
  uint64_t v67 = v69;
LABEL_16:
  sub_247A9E7F4(v77, v67);
  uint64_t v52 = v66;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v52);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_247A9A55C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746C7561666564 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247A9A5E4()
{
  return 0x746C7561666564;
}

uint64_t sub_247A9A5FC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7630441 && a2 == 0xE300000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C62756F64 && a2 == 0xE600000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1819242338 && a2 == 0xE400000000000000;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x676E69727473 && a2 == 0xE600000000000000;
        if (v8 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000014 && a2 == 0x8000000247ABE010 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000010 && a2 == 0x8000000247ABE030 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 1702125924 && a2 == 0xE400000000000000;
          if (v9 || (sub_247AB7690() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x706D6F4365746164 && a2 == 0xEE0073746E656E6FLL;
            if (v10 || (sub_247AB7690() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 7107189 && a2 == 0xE300000000000000;
              if (v11 || (sub_247AB7690() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                BOOL v12 = a1 == 1701603686 && a2 == 0xE400000000000000;
                if (v12 || (sub_247AB7690() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else
                {
                  BOOL v13 = a1 == 0x6E6F73726570 && a2 == 0xE600000000000000;
                  if (v13 || (sub_247AB7690() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x72616D6563616C70 && a2 == 0xE90000000000006BLL;
                    if (v14 || (sub_247AB7690() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 11;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x79636E6572727563 && a2 == 0xEE00746E756F6D41;
                      if (v15 || (sub_247AB7690() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 12;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000;
                        if (v16 || (sub_247AB7690() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 13;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
                          if (v17 || (sub_247AB7690() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 14;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x746163696C707061 && a2 == 0xEB000000006E6F69;
                            if (v18 || (sub_247AB7690() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 15;
                            }
                            else if (a1 == 0x6E65727275636572 && a2 == 0xEE00656C75526563)
                            {
                              swift_bridgeObjectRelease();
                              return 16;
                            }
                            else
                            {
                              char v20 = sub_247AB7690();
                              swift_bridgeObjectRelease();
                              if (v20) {
                                return 16;
                              }
                              else {
                                return 17;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_247A9ACC4()
{
  return 17;
}

uint64_t sub_247A9ACCC(char a1)
{
  uint64_t result = 7630441;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656C62756F64;
      break;
    case 2:
      uint64_t result = 1819242338;
      break;
    case 3:
      uint64_t result = 0x676E69727473;
      break;
    case 4:
      uint64_t result = 0xD000000000000014;
      break;
    case 5:
      uint64_t result = 0xD000000000000010;
      break;
    case 6:
      uint64_t result = 1702125924;
      break;
    case 7:
      uint64_t result = 0x706D6F4365746164;
      break;
    case 8:
      uint64_t result = 7107189;
      break;
    case 9:
      uint64_t result = 1701603686;
      break;
    case 10:
      uint64_t result = 0x6E6F73726570;
      break;
    case 11:
      uint64_t result = 0x72616D6563616C70;
      break;
    case 12:
      uint64_t result = 0x79636E6572727563;
      break;
    case 13:
      uint64_t result = 0x6E6F697461727564;
      break;
    case 14:
      uint64_t v3 = 0x7265706D6574;
      goto LABEL_17;
    case 15:
      uint64_t v3 = 0x63696C707061;
LABEL_17:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
      break;
    case 16:
      uint64_t result = 0x6E65727275636572;
      break;
    default:
      return result;
  }
  return result;
}

void sub_247A9AED4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v60 = v0;
  char v61 = v1;
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8D0);
  OUTLINED_FUNCTION_0();
  v59[45] = v5;
  v59[46] = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_18(v6, v59[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8D8);
  OUTLINED_FUNCTION_0();
  v59[42] = v8;
  v59[43] = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_20(v9, v59[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8E0);
  OUTLINED_FUNCTION_0();
  v59[39] = v11;
  v59[40] = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_17(v12, v59[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8E8);
  OUTLINED_FUNCTION_0();
  v59[36] = v14;
  v59[37] = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_19(v15, v59[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8F0);
  OUTLINED_FUNCTION_0();
  v59[33] = v17;
  v59[34] = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2_6();
  v59[32] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B8F8);
  OUTLINED_FUNCTION_0();
  v59[30] = v20;
  v59[31] = v19;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_11((uint64_t)v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v59[28] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B900);
  OUTLINED_FUNCTION_0();
  v59[27] = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v24);
  v59[25] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B908);
  OUTLINED_FUNCTION_0();
  v59[24] = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v27);
  v59[22] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B910);
  OUTLINED_FUNCTION_0();
  v59[21] = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v30);
  v59[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B918);
  OUTLINED_FUNCTION_0();
  v59[18] = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v33);
  v59[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B920);
  OUTLINED_FUNCTION_0();
  v59[15] = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v36);
  v59[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B928);
  OUTLINED_FUNCTION_0();
  v59[12] = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v39);
  v59[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B930);
  OUTLINED_FUNCTION_0();
  v59[9] = v40;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v42);
  v59[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B938);
  OUTLINED_FUNCTION_0();
  v59[6] = v43;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v45);
  v59[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B940);
  OUTLINED_FUNCTION_0();
  v59[3] = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B948);
  OUTLINED_FUNCTION_0();
  v59[2] = v48;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B950);
  OUTLINED_FUNCTION_0();
  v59[1] = v50;
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_1_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B958);
  OUTLINED_FUNCTION_0();
  v59[48] = v52;
  v59[49] = v53;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_26();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_247A9F958();
  sub_247AB7720();
  switch(v61)
  {
    case 3:
      sub_247A9FE64();
      sub_247AB7630();
      OUTLINED_FUNCTION_7_0();
      goto LABEL_20;
    case 4:
      sub_247A9FE18();
      sub_247AB7630();
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_3_2();
      v56();
      goto LABEL_21;
    case 5:
      sub_247A9FD80();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 6:
      sub_247A9FD34();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 7:
      sub_247A9FCE8();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 8:
      sub_247A9FC9C();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 9:
      sub_247A9FC50();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 10:
      sub_247A9FC04();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 11:
      sub_247A9FBB8();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 12:
      sub_247A9FB6C();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_10();
      goto LABEL_20;
    case 13:
      sub_247A9FB20();
      OUTLINED_FUNCTION_6_0();
      goto LABEL_20;
    case 14:
      sub_247A9FAD4();
      OUTLINED_FUNCTION_6_0();
      goto LABEL_20;
    case 15:
      sub_247A9FA88();
      OUTLINED_FUNCTION_6_0();
      goto LABEL_20;
    case 16:
      sub_247A9FA3C();
      OUTLINED_FUNCTION_6_0();
      goto LABEL_20;
    case 17:
      sub_247A9F9F0();
      OUTLINED_FUNCTION_6_0();
      goto LABEL_20;
    case 18:
      sub_247A9F9A4();
      OUTLINED_FUNCTION_6_0();
LABEL_20:
      OUTLINED_FUNCTION_3_2();
      v57();
LABEL_21:
      OUTLINED_FUNCTION_3_2();
      v58();
      break;
    default:
      sub_247A9FDCC();
      sub_247AB7630();
      sub_247AB7640();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_3_2();
      v54();
      OUTLINED_FUNCTION_3_2();
      v55();
      break;
  }
  OUTLINED_FUNCTION_15();
}

void sub_247A9B930()
{
  OUTLINED_FUNCTION_14();
  BOOL v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_18(v5, v93);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7D0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_20(v9, v94);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_17(v13, v95);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B7F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B800);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B808);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B810);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B818);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_19(v20, v96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B820);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_2_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B828);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B830);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_1_5();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929B838);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1_6();
  uint64_t v30 = v29 - v28;
  uint64_t v98 = (uint64_t)v2;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_247A9F958();
  sub_247AB7710();
  if (!v0)
  {
    uint64_t v31 = sub_247AB7620();
    uint64_t v32 = *(void *)(v31 + 16);
    if (v32
      && (uint64_t v97 = *(unsigned __int8 *)(v31 + 32),
          sub_247A97398(1, v32, v31, v31 + 32, 0, (2 * v32) | 1),
          uint64_t v34 = v33,
          unint64_t v36 = v35,
          swift_bridgeObjectRelease(),
          v34 == v36 >> 1))
    {
      switch(v97)
      {
        case 1:
          sub_247A9FE18();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v45();
          swift_unknownObjectRelease();
          uint64_t v46 = OUTLINED_FUNCTION_1_7();
          v47(v46);
          break;
        case 2:
          sub_247A9FDCC();
          OUTLINED_FUNCTION_5_1();
          sub_247AB75D0();
          OUTLINED_FUNCTION_3_2();
          v90();
          swift_unknownObjectRelease();
          uint64_t v91 = OUTLINED_FUNCTION_36();
          v92(v91);
          break;
        case 3:
          sub_247A9FD80();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v48();
          swift_unknownObjectRelease();
          uint64_t v49 = OUTLINED_FUNCTION_1_7();
          v50(v49);
          break;
        case 4:
          sub_247A9FD34();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v51();
          swift_unknownObjectRelease();
          uint64_t v52 = OUTLINED_FUNCTION_1_7();
          v53(v52);
          break;
        case 5:
          sub_247A9FCE8();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v54();
          swift_unknownObjectRelease();
          uint64_t v55 = OUTLINED_FUNCTION_1_7();
          v56(v55);
          break;
        case 6:
          sub_247A9FC9C();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v57();
          swift_unknownObjectRelease();
          uint64_t v58 = OUTLINED_FUNCTION_1_7();
          v59(v58);
          break;
        case 7:
          sub_247A9FC50();
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_22();
          OUTLINED_FUNCTION_3_2();
          v60();
          swift_unknownObjectRelease();
          uint64_t v61 = OUTLINED_FUNCTION_1_7();
          v62(v61);
          break;
        case 8:
          sub_247A9FC04();
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v63();
          swift_unknownObjectRelease();
          uint64_t v64 = OUTLINED_FUNCTION_1_7();
          v65(v64);
          break;
        case 9:
          sub_247A9FBB8();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v66();
          swift_unknownObjectRelease();
          uint64_t v67 = OUTLINED_FUNCTION_1_7();
          v68(v67);
          break;
        case 10:
          sub_247A9FB6C();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v69();
          swift_unknownObjectRelease();
          uint64_t v70 = OUTLINED_FUNCTION_1_7();
          v71(v70);
          break;
        case 11:
          sub_247A9FB20();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v72();
          swift_unknownObjectRelease();
          uint64_t v73 = OUTLINED_FUNCTION_1_7();
          v74(v73);
          break;
        case 12:
          sub_247A9FAD4();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v75();
          swift_unknownObjectRelease();
          uint64_t v76 = OUTLINED_FUNCTION_1_7();
          v77(v76);
          break;
        case 13:
          sub_247A9FA88();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v78();
          swift_unknownObjectRelease();
          uint64_t v79 = OUTLINED_FUNCTION_1_7();
          v80(v79);
          break;
        case 14:
          sub_247A9FA3C();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v81();
          swift_unknownObjectRelease();
          uint64_t v82 = OUTLINED_FUNCTION_1_7();
          v83(v82);
          break;
        case 15:
          sub_247A9F9F0();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_3_2();
          v84();
          swift_unknownObjectRelease();
          uint64_t v85 = OUTLINED_FUNCTION_1_7();
          v86(v85);
          break;
        case 16:
          sub_247A9F9A4();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_3_2();
          v87();
          swift_unknownObjectRelease();
          uint64_t v88 = OUTLINED_FUNCTION_1_7();
          v89(v88);
          break;
        default:
          sub_247A9FE64();
          OUTLINED_FUNCTION_4_1();
          OUTLINED_FUNCTION_7_0();
          OUTLINED_FUNCTION_3_2();
          v37();
          swift_unknownObjectRelease();
          uint64_t v38 = OUTLINED_FUNCTION_1_7();
          v39(v38);
          break;
      }
    }
    else
    {
      uint64_t v40 = v30;
      uint64_t v41 = v24;
      uint64_t v42 = sub_247AB7570();
      swift_allocError();
      uint64_t v44 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
      *uint64_t v44 = &unk_26FBF20C0;
      sub_247AB75C0();
      OUTLINED_FUNCTION_16();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v42 - 8) + 104))(v44, *MEMORY[0x263F8DCB0], v42);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v40, v41);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v98);
  OUTLINED_FUNCTION_15();
}

uint64_t destroy for ValueType(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 >= 6) {
    unsigned int v1 = *(_DWORD *)result + 6;
  }
  switch(v1)
  {
    case 1u:
      uint64_t result = __swift_destroy_boxed_opaque_existential_1(result);
      break;
    case 2u:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4u:
    case 5u:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for ValueType(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 6) {
    unsigned int v3 = *(_DWORD *)a2 + 6;
  }
  switch(v3)
  {
    case 0u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 40) = 0;
      return a1;
    case 1u:
      long long v5 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v5;
      (**(void (***)(uint64_t))(v5 - 8))(a1);
      char v6 = 1;
      goto LABEL_9;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 2;
      swift_bridgeObjectRetain();
      return a1;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v6 = 3;
LABEL_9:
      *(unsigned char *)(a1 + 40) = v6;
      return a1;
    case 4u:
      *(void *)a1 = *(void *)a2;
      char v7 = 4;
      goto LABEL_12;
    case 5u:
      *(void *)a1 = *(void *)a2;
      char v7 = 5;
LABEL_12:
      *(unsigned char *)(a1 + 40) = v7;
      swift_retain();
      break;
    default:
      long long v4 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v4;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      break;
  }
  return a1;
}

uint64_t assignWithCopy for ValueType(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 1u:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      case 2u:
        swift_bridgeObjectRelease();
        break;
      case 4u:
      case 5u:
        swift_release();
        break;
      default:
        break;
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 40);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 0u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 40) = 0;
        return a1;
      case 1u:
        uint64_t v6 = *((void *)a2 + 3);
        *(void *)(a1 + 24) = v6;
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
        char v7 = 1;
        goto LABEL_15;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 40) = 2;
        swift_bridgeObjectRetain();
        return a1;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v7 = 3;
LABEL_15:
        *(unsigned char *)(a1 + 40) = v7;
        return a1;
      case 4u:
        *(void *)a1 = *(void *)a2;
        char v8 = 4;
        goto LABEL_18;
      case 5u:
        *(void *)a1 = *(void *)a2;
        char v8 = 5;
LABEL_18:
        *(unsigned char *)(a1 + 40) = v8;
        swift_retain();
        break;
      default:
        long long v9 = *a2;
        long long v10 = a2[1];
        *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
        *(_OWORD *)a1 = v9;
        *(_OWORD *)(a1 + 16) = v10;
        break;
    }
  }
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

uint64_t assignWithTake for ValueType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 1u:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      case 2u:
        swift_bridgeObjectRelease();
        break;
      case 4u:
      case 5u:
        swift_release();
        break;
      default:
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 0u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 40) = 0;
        return a1;
      case 1u:
        long long v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v7 = 1;
        goto LABEL_17;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v7 = 2;
        goto LABEL_17;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v7 = 3;
        goto LABEL_17;
      case 4u:
        *(void *)a1 = *(void *)a2;
        char v7 = 4;
        goto LABEL_17;
      case 5u:
        *(void *)a1 = *(void *)a2;
        char v7 = 5;
LABEL_17:
        *(unsigned char *)(a1 + 40) = v7;
        break;
      default:
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v9;
        *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 7) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ValueType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247A9CD34(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 6) {
    return (*(_DWORD *)a1 + 6);
  }
  return result;
}

uint64_t sub_247A9CD50(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

void type metadata accessor for ValueType()
{
}

uint64_t sub_247A9CD84(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 56);
  if (v1 >= 6) {
    unsigned int v1 = *(_DWORD *)result + 6;
  }
  switch(v1)
  {
    case 1u:
LABEL_10:
      uint64_t result = __swift_destroy_boxed_opaque_existential_1(result);
      break;
    case 2u:
      goto LABEL_15;
    case 4u:
      switch(*(unsigned char *)(result + 40))
      {
        case 1:
          __swift_destroy_boxed_opaque_existential_1(result);
          break;
        case 2:
          swift_bridgeObjectRelease();
          break;
        case 4:
        case 5:
          swift_release();
          break;
        default:
          break;
      }
LABEL_15:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 5u:
      switch(*(unsigned char *)(result + 40))
      {
        case 1:
          goto LABEL_10;
        case 2:
          goto LABEL_15;
        case 4:
        case 5:
          uint64_t result = swift_release();
          break;
        default:
          return result;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247A9CF04(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 56);
  if (v4 >= 6) {
    unsigned int v4 = *(_DWORD *)a2 + 6;
  }
  switch(v4)
  {
    case 1u:
      long long v5 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v5;
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      char v6 = 1;
      goto LABEL_25;
    case 2u:
      *(void *)a1 = *(void *)a2;
      char v7 = 2;
      goto LABEL_18;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v6 = 3;
      goto LABEL_25;
    case 4u:
      switch(*(unsigned char *)(a2 + 40))
      {
        case 1:
          long long v8 = *(_OWORD *)(a2 + 24);
          *(_OWORD *)(a1 + 24) = v8;
          (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1, a2);
          *(unsigned char *)(a1 + 40) = 1;
          break;
        case 2:
          *(void *)a1 = *(void *)a2;
          *(unsigned char *)(a1 + 40) = 2;
          swift_bridgeObjectRetain();
          break;
        case 4:
          *(void *)a1 = *(void *)a2;
          char v11 = 4;
          goto LABEL_16;
        case 5:
          *(void *)a1 = *(void *)a2;
          char v11 = 5;
LABEL_16:
          *(unsigned char *)(a1 + 40) = v11;
          swift_retain();
          break;
        default:
          long long v10 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v10;
          *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
          break;
      }
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      char v7 = 4;
LABEL_18:
      *(unsigned char *)(a1 + 56) = v7;
      swift_bridgeObjectRetain();
      break;
    case 5u:
      switch(*(unsigned char *)(a2 + 40))
      {
        case 1:
          long long v9 = *(_OWORD *)(a2 + 24);
          *(_OWORD *)(a1 + 24) = v9;
          (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
          *(unsigned char *)(a1 + 40) = 1;
          break;
        case 2:
          *(void *)a1 = *(void *)a2;
          *(unsigned char *)(a1 + 40) = 2;
          swift_bridgeObjectRetain();
          break;
        case 4:
          *(void *)a1 = *(void *)a2;
          char v13 = 4;
          goto LABEL_23;
        case 5:
          *(void *)a1 = *(void *)a2;
          char v13 = 5;
LABEL_23:
          *(unsigned char *)(a1 + 40) = v13;
          swift_retain();
          break;
        default:
          long long v12 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v12;
          *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
          break;
      }
      char v6 = 5;
LABEL_25:
      *(unsigned char *)(a1 + 56) = v6;
      break;
    default:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 56) = 0;
      break;
  }
  return a1;
}

uint64_t sub_247A9D1C8(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 1u:
LABEL_5:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      case 2u:
        goto LABEL_12;
      case 4u:
        switch(*(unsigned char *)(a1 + 40))
        {
          case 1:
            __swift_destroy_boxed_opaque_existential_1(a1);
            break;
          case 2:
            swift_bridgeObjectRelease();
            break;
          case 4:
          case 5:
            swift_release();
            break;
          default:
            break;
        }
LABEL_12:
        swift_bridgeObjectRelease();
        break;
      case 5u:
        switch(*(unsigned char *)(a1 + 40))
        {
          case 1:
            goto LABEL_5;
          case 2:
            goto LABEL_12;
          case 4:
          case 5:
            swift_release();
            break;
          default:
            goto LABEL_13;
        }
        break;
      default:
        break;
    }
LABEL_13:
    unsigned int v5 = *((unsigned __int8 *)a2 + 56);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 1u:
        uint64_t v6 = *((void *)a2 + 3);
        *(void *)(a1 + 24) = v6;
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
        char v7 = 1;
        goto LABEL_37;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v8 = 2;
        goto LABEL_30;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v7 = 3;
        goto LABEL_37;
      case 4u:
        switch(*((unsigned char *)a2 + 40))
        {
          case 1:
            uint64_t v9 = *((void *)a2 + 3);
            *(void *)(a1 + 24) = v9;
            *(void *)(a1 + 32) = *((void *)a2 + 4);
            (**(void (***)(uint64_t, long long *))(v9 - 8))(a1, a2);
            *(unsigned char *)(a1 + 40) = 1;
            break;
          case 2:
            *(void *)a1 = *(void *)a2;
            *(unsigned char *)(a1 + 40) = 2;
            swift_bridgeObjectRetain();
            break;
          case 4:
            *(void *)a1 = *(void *)a2;
            char v13 = 4;
            goto LABEL_28;
          case 5:
            *(void *)a1 = *(void *)a2;
            char v13 = 5;
LABEL_28:
            *(unsigned char *)(a1 + 40) = v13;
            swift_retain();
            break;
          default:
            long long v11 = *a2;
            long long v12 = a2[1];
            *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
            *(_OWORD *)a1 = v11;
            *(_OWORD *)(a1 + 16) = v12;
            break;
        }
        *(void *)(a1 + 48) = *((void *)a2 + 6);
        char v8 = 4;
LABEL_30:
        *(unsigned char *)(a1 + 56) = v8;
        swift_bridgeObjectRetain();
        break;
      case 5u:
        switch(*((unsigned char *)a2 + 40))
        {
          case 1:
            uint64_t v10 = *((void *)a2 + 3);
            *(void *)(a1 + 24) = v10;
            *(void *)(a1 + 32) = *((void *)a2 + 4);
            (**(void (***)(uint64_t, long long *))(v10 - 8))(a1, a2);
            *(unsigned char *)(a1 + 40) = 1;
            break;
          case 2:
            *(void *)a1 = *(void *)a2;
            *(unsigned char *)(a1 + 40) = 2;
            swift_bridgeObjectRetain();
            break;
          case 4:
            *(void *)a1 = *(void *)a2;
            char v16 = 4;
            goto LABEL_35;
          case 5:
            *(void *)a1 = *(void *)a2;
            char v16 = 5;
LABEL_35:
            *(unsigned char *)(a1 + 40) = v16;
            swift_retain();
            break;
          default:
            long long v14 = *a2;
            long long v15 = a2[1];
            *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
            *(_OWORD *)a1 = v14;
            *(_OWORD *)(a1 + 16) = v15;
            break;
        }
        char v7 = 5;
LABEL_37:
        *(unsigned char *)(a1 + 56) = v7;
        break;
      default:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 56) = 0;
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_247A9D5DC(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 6) {
      unsigned int v4 = *(_DWORD *)a1 + 6;
    }
    switch(v4)
    {
      case 1u:
LABEL_5:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      case 2u:
        goto LABEL_12;
      case 4u:
        switch(*(unsigned char *)(a1 + 40))
        {
          case 1:
            __swift_destroy_boxed_opaque_existential_1(a1);
            break;
          case 2:
            swift_bridgeObjectRelease();
            break;
          case 4:
          case 5:
            swift_release();
            break;
          default:
            break;
        }
LABEL_12:
        swift_bridgeObjectRelease();
        break;
      case 5u:
        switch(*(unsigned char *)(a1 + 40))
        {
          case 1:
            goto LABEL_5;
          case 2:
            goto LABEL_12;
          case 4:
          case 5:
            swift_release();
            break;
          default:
            goto LABEL_13;
        }
        break;
      default:
        break;
    }
LABEL_13:
    unsigned int v5 = *(unsigned __int8 *)(a2 + 56);
    if (v5 >= 6) {
      unsigned int v5 = *(_DWORD *)a2 + 6;
    }
    switch(v5)
    {
      case 1u:
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v6 = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v6 = 2;
        break;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v6 = 3;
        break;
      case 4u:
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        char v6 = 4;
        break;
      case 5u:
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v9;
        *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
        char v6 = 5;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    *(unsigned char *)(a1 + 56) = v6;
  }
  return a1;
}

uint64_t sub_247A9D7FC(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 6) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_247A9D838(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247A9D888(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 56);
  if (result >= 6) {
    return (*(_DWORD *)a1 + 6);
  }
  return result;
}

uint64_t sub_247A9D8A4(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(void *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 56) = a2;
  return result;
}

void type metadata accessor for ValueType.CodableWrapper()
{
}

ValueMetadata *type metadata accessor for ValueType.CodingKeys()
{
  return &type metadata for ValueType.CodingKeys;
}

unint64_t sub_247A9D8F4()
{
  unint64_t result = qword_26929B5E0;
  if (!qword_26929B5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5E0);
  }
  return result;
}

uint64_t sub_247A9D940()
{
  return sub_247A99054(*v0);
}

uint64_t sub_247A9D948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A98F5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A9D970(uint64_t a1)
{
  unint64_t v2 = sub_247A9E814();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9D9AC(uint64_t a1)
{
  unint64_t v2 = sub_247A9E814();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9D9E8()
{
  return sub_247A8E424();
}

uint64_t sub_247A9DA08()
{
  return sub_247A99300(*v0);
}

uint64_t sub_247A9DA10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A99084(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A9DA38(uint64_t a1)
{
  unint64_t v2 = sub_247A9DE1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DA74(uint64_t a1)
{
  unint64_t v2 = sub_247A9DE1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DAB0()
{
  return sub_247A9278C();
}

uint64_t sub_247A9DAC8(uint64_t a1)
{
  unint64_t v2 = sub_247A9E860();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DB04(uint64_t a1)
{
  unint64_t v2 = sub_247A9E860();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DB40(uint64_t a1)
{
  unint64_t v2 = sub_247A9E7A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DB7C(uint64_t a1)
{
  unint64_t v2 = sub_247A9E7A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DBB8(uint64_t a1)
{
  unint64_t v2 = sub_247A9E9DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DBF4(uint64_t a1)
{
  unint64_t v2 = sub_247A9E9DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DC30(uint64_t a1)
{
  unint64_t v2 = sub_247A9E944();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DC6C(uint64_t a1)
{
  unint64_t v2 = sub_247A9E944();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DCA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A993CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A9DCD4(uint64_t a1)
{
  unint64_t v2 = sub_247A9E8F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DD10(uint64_t a1)
{
  unint64_t v2 = sub_247A9E8F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247A9DD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_247A99B68(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_247A9DD64()
{
}

unint64_t sub_247A9DD80()
{
  unint64_t result = qword_26929B5E8;
  if (!qword_26929B5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5E8);
  }
  return result;
}

unint64_t sub_247A9DDD0()
{
  unint64_t result = qword_26929B5F0;
  if (!qword_26929B5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B5F0);
  }
  return result;
}

unint64_t sub_247A9DE1C()
{
  unint64_t result = qword_26929B630;
  if (!qword_26929B630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B630);
  }
  return result;
}

uint64_t sub_247A9DE68(uint64_t a1)
{
  unint64_t v2 = sub_247A9F9F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DEA4(uint64_t a1)
{
  unint64_t v2 = sub_247A9F9F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DEE0(uint64_t a1)
{
  unint64_t v2 = sub_247A9FCE8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DF1C(uint64_t a1)
{
  unint64_t v2 = sub_247A9FCE8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9DF5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A9A55C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A9DF88(uint64_t a1)
{
  unint64_t v2 = sub_247A9FDCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9DFC4(uint64_t a1)
{
  unint64_t v2 = sub_247A9FDCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E000()
{
  return sub_247A9ACCC(*v0);
}

uint64_t sub_247A9E008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A9A5FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A9E030@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A9ACC4();
  *a1 = result;
  return result;
}

uint64_t sub_247A9E058(uint64_t a1)
{
  unint64_t v2 = sub_247A9F958();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E094(uint64_t a1)
{
  unint64_t v2 = sub_247A9F958();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E0D0(uint64_t a1)
{
  unint64_t v2 = sub_247A9FAD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E10C(uint64_t a1)
{
  unint64_t v2 = sub_247A9FAD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E148(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E184(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E1C0(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC50();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E1FC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC50();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E238(uint64_t a1)
{
  unint64_t v2 = sub_247A9FE18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E274(uint64_t a1)
{
  unint64_t v2 = sub_247A9FE18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E2B0(uint64_t a1)
{
  unint64_t v2 = sub_247A9FA88();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E2EC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FA88();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E328(uint64_t a1)
{
  unint64_t v2 = sub_247A9FBB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E364(uint64_t a1)
{
  unint64_t v2 = sub_247A9FBB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E3A0(uint64_t a1)
{
  unint64_t v2 = sub_247A9FE64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E3DC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FE64();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E418(uint64_t a1)
{
  unint64_t v2 = sub_247A9FB6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E454(uint64_t a1)
{
  unint64_t v2 = sub_247A9FB6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E490(uint64_t a1)
{
  unint64_t v2 = sub_247A9FB20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E4CC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FB20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E508(uint64_t a1)
{
  unint64_t v2 = sub_247A9F9A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E544(uint64_t a1)
{
  unint64_t v2 = sub_247A9F9A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E580(uint64_t a1)
{
  unint64_t v2 = sub_247A9FD80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E5BC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FD80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E5F8(uint64_t a1)
{
  unint64_t v2 = sub_247A9FD34();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E634(uint64_t a1)
{
  unint64_t v2 = sub_247A9FD34();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E670(uint64_t a1)
{
  unint64_t v2 = sub_247A9FA3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E6AC(uint64_t a1)
{
  unint64_t v2 = sub_247A9FA3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A9E6E8(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A9E724(uint64_t a1)
{
  unint64_t v2 = sub_247A9FC04();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247A9E760(unsigned char *a1@<X8>)
{
  sub_247A9B930();
  if (!v1) {
    *a1 = v3;
  }
}

void sub_247A9E78C()
{
}

unint64_t sub_247A9E7A8()
{
  unint64_t result = qword_26929B638;
  if (!qword_26929B638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B638);
  }
  return result;
}

_OWORD *sub_247A9E7F4(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(_OWORD *)((char *)a2 + 41) = *(long long *)((char *)a1 + 41);
  a2[1] = v3;
  a2[2] = v4;
  *a2 = v2;
  return a2;
}

unint64_t sub_247A9E814()
{
  unint64_t result = qword_26929B640;
  if (!qword_26929B640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B640);
  }
  return result;
}

unint64_t sub_247A9E860()
{
  unint64_t result = qword_26929B658;
  if (!qword_26929B658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B658);
  }
  return result;
}

unint64_t sub_247A9E8AC()
{
  unint64_t result = qword_26929B660;
  if (!qword_26929B660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B660);
  }
  return result;
}

unint64_t sub_247A9E8F8()
{
  unint64_t result = qword_26929B668;
  if (!qword_26929B668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B668);
  }
  return result;
}

unint64_t sub_247A9E944()
{
  unint64_t result = qword_26929B680;
  if (!qword_26929B680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B680);
  }
  return result;
}

unint64_t sub_247A9E990()
{
  unint64_t result = qword_26929B688;
  if (!qword_26929B688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B688);
  }
  return result;
}

unint64_t sub_247A9E9DC()
{
  unint64_t result = qword_26929B690;
  if (!qword_26929B690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B690);
  }
  return result;
}

unint64_t sub_247A9EA28()
{
  unint64_t result = qword_26929B698;
  if (!qword_26929B698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B698);
  }
  return result;
}

uint64_t sub_247A9EA74(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247A9EAAC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929B648);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A9EB10()
{
  unint64_t result = qword_26929B6E0;
  if (!qword_26929B6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B6E0);
  }
  return result;
}

uint64_t sub_247A9EB5C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929B670);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A9EBCC()
{
  unint64_t result = qword_26929B6F0;
  if (!qword_26929B6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B6F0);
  }
  return result;
}

unint64_t sub_247A9EC18()
{
  unint64_t result = qword_26929B6F8;
  if (!qword_26929B6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B6F8);
  }
  return result;
}

uint64_t sub_247A9EC64(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247A9ECC0()
{
  switch(*(unsigned char *)(v0 + 56))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_247A9ED54()
{
  switch(*(unsigned char *)(v0 + 56))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

unint64_t sub_247A9EDF0()
{
  unint64_t result = qword_26929B700;
  if (!qword_26929B700)
  {
    sub_247AB74A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B700);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ValueType.CodableWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x247A9EF0CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.CodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.CodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.PrimitiveCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.PrimitiveCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.SchemaCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.SchemaCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.UnionCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.UnionCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.MeasurementCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.MeasurementCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ValueType.CodableWrapper.ArrayCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A9F050);
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

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.ArrayCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.ArrayCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.CodableWrapper.OptionalCodingKeys()
{
  return &type metadata for ValueType.CodableWrapper.OptionalCodingKeys;
}

uint64_t sub_247A9F098(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xEE)
  {
    unsigned int v2 = a2 + 18;
    if (a2 + 18 >= 0xFFFF00) {
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
        return (*a1 | (v5 << 8)) - 18;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x247A9F164);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 18;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 2) {
    int v8 = ((v7 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v8 = -2;
  }
  if (v8 < 0) {
    int v8 = -1;
  }
  unsigned int v9 = v8 + 1;
  unsigned int v10 = v8 - 15;
  if (v9 >= 0x11) {
    return v10;
  }
  else {
    return 0;
  }
}

unsigned char *sub_247A9F178(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 18;
  if (a3 + 18 >= 0xFFFF00) {
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
  if (a3 >= 0xEE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v7 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x247A9F24CLL);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

uint64_t sub_247A9F274(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    int v2 = ((v1 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v2 = -2;
  }
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

unsigned char *sub_247A9F2A4(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 2;
  }
  return result;
}

void type metadata accessor for ValueType.PrimitiveWrapper()
{
}

unint64_t sub_247A9F2CC()
{
  unint64_t result = qword_26929B708;
  if (!qword_26929B708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B708);
  }
  return result;
}

unint64_t sub_247A9F31C()
{
  unint64_t result = qword_26929B710;
  if (!qword_26929B710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B710);
  }
  return result;
}

unint64_t sub_247A9F36C()
{
  unint64_t result = qword_26929B718;
  if (!qword_26929B718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B718);
  }
  return result;
}

unint64_t sub_247A9F3BC()
{
  unint64_t result = qword_26929B720;
  if (!qword_26929B720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B720);
  }
  return result;
}

unint64_t sub_247A9F40C()
{
  unint64_t result = qword_26929B728;
  if (!qword_26929B728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B728);
  }
  return result;
}

unint64_t sub_247A9F45C()
{
  unint64_t result = qword_26929B730;
  if (!qword_26929B730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B730);
  }
  return result;
}

unint64_t sub_247A9F4AC()
{
  unint64_t result = qword_26929B738;
  if (!qword_26929B738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B738);
  }
  return result;
}

unint64_t sub_247A9F4FC()
{
  unint64_t result = qword_26929B740;
  if (!qword_26929B740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B740);
  }
  return result;
}

unint64_t sub_247A9F54C()
{
  unint64_t result = qword_26929B748;
  if (!qword_26929B748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B748);
  }
  return result;
}

unint64_t sub_247A9F59C()
{
  unint64_t result = qword_26929B750;
  if (!qword_26929B750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B750);
  }
  return result;
}

unint64_t sub_247A9F5EC()
{
  unint64_t result = qword_26929B758;
  if (!qword_26929B758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B758);
  }
  return result;
}

unint64_t sub_247A9F63C()
{
  unint64_t result = qword_26929B760;
  if (!qword_26929B760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B760);
  }
  return result;
}

unint64_t sub_247A9F68C()
{
  unint64_t result = qword_26929B768;
  if (!qword_26929B768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B768);
  }
  return result;
}

unint64_t sub_247A9F6DC()
{
  unint64_t result = qword_26929B770;
  if (!qword_26929B770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B770);
  }
  return result;
}

unint64_t sub_247A9F72C()
{
  unint64_t result = qword_26929B778;
  if (!qword_26929B778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B778);
  }
  return result;
}

unint64_t sub_247A9F77C()
{
  unint64_t result = qword_26929B780;
  if (!qword_26929B780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B780);
  }
  return result;
}

unint64_t sub_247A9F7CC()
{
  unint64_t result = qword_26929B788;
  if (!qword_26929B788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B788);
  }
  return result;
}

unint64_t sub_247A9F81C()
{
  unint64_t result = qword_26929B790;
  if (!qword_26929B790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B790);
  }
  return result;
}

unint64_t sub_247A9F86C()
{
  unint64_t result = qword_26929B798;
  if (!qword_26929B798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B798);
  }
  return result;
}

unint64_t sub_247A9F8BC()
{
  unint64_t result = qword_26929B7A0;
  if (!qword_26929B7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B7A0);
  }
  return result;
}

unint64_t sub_247A9F90C()
{
  unint64_t result = qword_26929B7A8;
  if (!qword_26929B7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B7A8);
  }
  return result;
}

unint64_t sub_247A9F958()
{
  unint64_t result = qword_26929B840;
  if (!qword_26929B840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B840);
  }
  return result;
}

unint64_t sub_247A9F9A4()
{
  unint64_t result = qword_26929B848;
  if (!qword_26929B848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B848);
  }
  return result;
}

unint64_t sub_247A9F9F0()
{
  unint64_t result = qword_26929B850;
  if (!qword_26929B850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B850);
  }
  return result;
}

unint64_t sub_247A9FA3C()
{
  unint64_t result = qword_26929B858;
  if (!qword_26929B858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B858);
  }
  return result;
}

unint64_t sub_247A9FA88()
{
  unint64_t result = qword_26929B860;
  if (!qword_26929B860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B860);
  }
  return result;
}

unint64_t sub_247A9FAD4()
{
  unint64_t result = qword_26929B868;
  if (!qword_26929B868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B868);
  }
  return result;
}

unint64_t sub_247A9FB20()
{
  unint64_t result = qword_26929B870;
  if (!qword_26929B870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B870);
  }
  return result;
}

unint64_t sub_247A9FB6C()
{
  unint64_t result = qword_26929B878;
  if (!qword_26929B878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B878);
  }
  return result;
}

unint64_t sub_247A9FBB8()
{
  unint64_t result = qword_26929B880;
  if (!qword_26929B880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B880);
  }
  return result;
}

unint64_t sub_247A9FC04()
{
  unint64_t result = qword_26929B888;
  if (!qword_26929B888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B888);
  }
  return result;
}

unint64_t sub_247A9FC50()
{
  unint64_t result = qword_26929B890;
  if (!qword_26929B890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B890);
  }
  return result;
}

unint64_t sub_247A9FC9C()
{
  unint64_t result = qword_26929B898;
  if (!qword_26929B898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B898);
  }
  return result;
}

unint64_t sub_247A9FCE8()
{
  unint64_t result = qword_26929B8A0;
  if (!qword_26929B8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8A0);
  }
  return result;
}

unint64_t sub_247A9FD34()
{
  unint64_t result = qword_26929B8A8;
  if (!qword_26929B8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8A8);
  }
  return result;
}

unint64_t sub_247A9FD80()
{
  unint64_t result = qword_26929B8B0;
  if (!qword_26929B8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8B0);
  }
  return result;
}

unint64_t sub_247A9FDCC()
{
  unint64_t result = qword_26929B8B8;
  if (!qword_26929B8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8B8);
  }
  return result;
}

unint64_t sub_247A9FE18()
{
  unint64_t result = qword_26929B8C0;
  if (!qword_26929B8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8C0);
  }
  return result;
}

unint64_t sub_247A9FE64()
{
  unint64_t result = qword_26929B8C8;
  if (!qword_26929B8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B8C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ValueType.PrimitiveWrapper.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 16) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v5 = v6 - 17;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ValueType.PrimitiveWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x247AA0004);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.CodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.CodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.IntCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.IntCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.DoubleCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.DoubleCodingKeys;
}

unsigned char *_s16AppIntentSchemas9ValueTypeO10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247AA00F8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.BoolCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.BoolCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.StringCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.StringCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.StringSearchCriteriaCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.StringSearchCriteriaCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.AttributedStringCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.AttributedStringCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.DateCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.DateCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.DateComponentsCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.DateComponentsCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.UrlCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.UrlCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.FileCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.FileCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.PersonCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.PersonCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.PlacemarkCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.PlacemarkCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.CurrencyAmountCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.CurrencyAmountCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.DurationCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.DurationCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.TemperatureCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.TemperatureCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.ApplicationCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.ApplicationCodingKeys;
}

ValueMetadata *type metadata accessor for ValueType.PrimitiveWrapper.RecurrenceRuleCodingKeys()
{
  return &type metadata for ValueType.PrimitiveWrapper.RecurrenceRuleCodingKeys;
}

unint64_t sub_247AA0214()
{
  unint64_t result = qword_26929B960;
  if (!qword_26929B960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B960);
  }
  return result;
}

unint64_t sub_247AA0264()
{
  unint64_t result = qword_26929B968;
  if (!qword_26929B968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B968);
  }
  return result;
}

unint64_t sub_247AA02B4()
{
  unint64_t result = qword_26929B970;
  if (!qword_26929B970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B970);
  }
  return result;
}

unint64_t sub_247AA0304()
{
  unint64_t result = qword_26929B978;
  if (!qword_26929B978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B978);
  }
  return result;
}

unint64_t sub_247AA0354()
{
  unint64_t result = qword_26929B980;
  if (!qword_26929B980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B980);
  }
  return result;
}

unint64_t sub_247AA03A4()
{
  unint64_t result = qword_26929B988;
  if (!qword_26929B988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B988);
  }
  return result;
}

unint64_t sub_247AA03F4()
{
  unint64_t result = qword_26929B990;
  if (!qword_26929B990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B990);
  }
  return result;
}

unint64_t sub_247AA0444()
{
  unint64_t result = qword_26929B998;
  if (!qword_26929B998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B998);
  }
  return result;
}

unint64_t sub_247AA0494()
{
  unint64_t result = qword_26929B9A0;
  if (!qword_26929B9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9A0);
  }
  return result;
}

unint64_t sub_247AA04E4()
{
  unint64_t result = qword_26929B9A8;
  if (!qword_26929B9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9A8);
  }
  return result;
}

unint64_t sub_247AA0534()
{
  unint64_t result = qword_26929B9B0;
  if (!qword_26929B9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9B0);
  }
  return result;
}

unint64_t sub_247AA0584()
{
  unint64_t result = qword_26929B9B8;
  if (!qword_26929B9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9B8);
  }
  return result;
}

unint64_t sub_247AA05D4()
{
  unint64_t result = qword_26929B9C0;
  if (!qword_26929B9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9C0);
  }
  return result;
}

unint64_t sub_247AA0624()
{
  unint64_t result = qword_26929B9C8;
  if (!qword_26929B9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9C8);
  }
  return result;
}

unint64_t sub_247AA0674()
{
  unint64_t result = qword_26929B9D0;
  if (!qword_26929B9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9D0);
  }
  return result;
}

unint64_t sub_247AA06C4()
{
  unint64_t result = qword_26929B9D8;
  if (!qword_26929B9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9D8);
  }
  return result;
}

unint64_t sub_247AA0714()
{
  unint64_t result = qword_26929B9E0;
  if (!qword_26929B9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9E0);
  }
  return result;
}

unint64_t sub_247AA0764()
{
  unint64_t result = qword_26929B9E8;
  if (!qword_26929B9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9E8);
  }
  return result;
}

unint64_t sub_247AA07B4()
{
  unint64_t result = qword_26929B9F0;
  if (!qword_26929B9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9F0);
  }
  return result;
}

unint64_t sub_247AA0804()
{
  unint64_t result = qword_26929B9F8;
  if (!qword_26929B9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929B9F8);
  }
  return result;
}

unint64_t sub_247AA0854()
{
  unint64_t result = qword_26929BA00;
  if (!qword_26929BA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA00);
  }
  return result;
}

unint64_t sub_247AA08A4()
{
  unint64_t result = qword_26929BA08;
  if (!qword_26929BA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA08);
  }
  return result;
}

unint64_t sub_247AA08F4()
{
  unint64_t result = qword_26929BA10;
  if (!qword_26929BA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA10);
  }
  return result;
}

unint64_t sub_247AA0944()
{
  unint64_t result = qword_26929BA18;
  if (!qword_26929BA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA18);
  }
  return result;
}

unint64_t sub_247AA0994()
{
  unint64_t result = qword_26929BA20;
  if (!qword_26929BA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA20);
  }
  return result;
}

unint64_t sub_247AA09E4()
{
  unint64_t result = qword_26929BA28;
  if (!qword_26929BA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA28);
  }
  return result;
}

unint64_t sub_247AA0A34()
{
  unint64_t result = qword_26929BA30;
  if (!qword_26929BA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA30);
  }
  return result;
}

unint64_t sub_247AA0A84()
{
  unint64_t result = qword_26929BA38;
  if (!qword_26929BA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA38);
  }
  return result;
}

unint64_t sub_247AA0AD4()
{
  unint64_t result = qword_26929BA40;
  if (!qword_26929BA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA40);
  }
  return result;
}

unint64_t sub_247AA0B24()
{
  unint64_t result = qword_26929BA48;
  if (!qword_26929BA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA48);
  }
  return result;
}

unint64_t sub_247AA0B74()
{
  unint64_t result = qword_26929BA50;
  if (!qword_26929BA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA50);
  }
  return result;
}

unint64_t sub_247AA0BC4()
{
  unint64_t result = qword_26929BA58;
  if (!qword_26929BA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA58);
  }
  return result;
}

unint64_t sub_247AA0C14()
{
  unint64_t result = qword_26929BA60;
  if (!qword_26929BA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA60);
  }
  return result;
}

unint64_t sub_247AA0C64()
{
  unint64_t result = qword_26929BA68;
  if (!qword_26929BA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA68);
  }
  return result;
}

unint64_t sub_247AA0CB4()
{
  unint64_t result = qword_26929BA70;
  if (!qword_26929BA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA70);
  }
  return result;
}

unint64_t sub_247AA0D04()
{
  unint64_t result = qword_26929BA78;
  if (!qword_26929BA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA78);
  }
  return result;
}

unint64_t sub_247AA0D54()
{
  unint64_t result = qword_26929BA80;
  if (!qword_26929BA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA80);
  }
  return result;
}

unint64_t sub_247AA0DA4()
{
  unint64_t result = qword_26929BA88;
  if (!qword_26929BA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BA88);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_247AB75B0();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_247AB75B0();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_247AB7630();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_247AB75B0();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_247AB7560();
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 216) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_247AB7610();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  return sub_247A8E028(v31 - 144, (uint64_t)&a31);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_247AB7630();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_247AB7630();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_247AB7630();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

double OUTLINED_FUNCTION_37@<D0>(uint64_t a1@<X8>)
{
  *(void *)uint64_t v1 = a1;
  double result = 0.0;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  return result;
}

double OUTLINED_FUNCTION_38()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

uint64_t static ValueDisplayName.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_247AB7690(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_247AB7690();
    }
  }
  return result;
}

uint64_t sub_247AA122C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702195828 && a2 == 0xE400000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65736C6166 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247AA1304(char a1)
{
  if (a1) {
    return 0x65736C6166;
  }
  else {
    return 1702195828;
  }
}

uint64_t sub_247AA1330(uint64_t a1, uint64_t a2)
{
  if (a1 == 1819242338 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247AA13A8()
{
  return 1819242338;
}

uint64_t sub_247AA13B8()
{
  return sub_247AA1304(*v0);
}

uint64_t sub_247AA13C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AA122C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AA13E8(uint64_t a1)
{
  unint64_t v2 = sub_247AA172C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA1424(uint64_t a1)
{
  unint64_t v2 = sub_247AA172C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA1464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AA1330(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247AA1490(uint64_t a1)
{
  unint64_t v2 = sub_247AA16E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA14CC(uint64_t a1)
{
  unint64_t v2 = sub_247AA16E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ValueDisplayName.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BA90);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_26();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BA98);
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v8;
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v1;
  v15[1] = v1[2];
  v15[2] = v12;
  v15[0] = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AA16E0();
  sub_247AB7720();
  sub_247AA172C();
  sub_247AB7630();
  char v19 = 0;
  uint64_t v13 = v15[3];
  sub_247AB7660();
  if (!v13)
  {
    char v18 = 1;
    sub_247AB7660();
  }
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v11, v7);
}

unint64_t sub_247AA16E0()
{
  unint64_t result = qword_26929BAA0;
  if (!qword_26929BAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAA0);
  }
  return result;
}

unint64_t sub_247AA172C()
{
  unint64_t result = qword_26929BAA8;
  if (!qword_26929BAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAA8);
  }
  return result;
}

uint64_t ValueDisplayName.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BAB0);
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_26();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BAB8);
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AA16E0();
  sub_247AB7710();
  if (v2) {
    goto LABEL_6;
  }
  uint64_t v37 = a1;
  uint64_t v38 = v8;
  uint64_t v13 = sub_247AB7620();
  uint64_t v14 = *(void *)(v13 + 16);
  if (!v14
    || (sub_247A97398(1, v14, v13, v13 + 32, 0, (2 * v14) | 1),
        uint64_t v16 = v15,
        unint64_t v18 = v17,
        swift_bridgeObjectRelease(),
        v16 != v18 >> 1))
  {
    uint64_t v21 = sub_247AB7570();
    swift_allocError();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *uint64_t v23 = &type metadata for ValueDisplayName;
    uint64_t v24 = v38;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v24);
    a1 = v37;
LABEL_6:
    uint64_t v34 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v34);
  }
  sub_247AA172C();
  uint64_t v19 = v3;
  sub_247AB75B0();
  char v43 = 0;
  uint64_t v20 = sub_247AB75F0();
  uint64_t v27 = v26;
  uint64_t v36 = v20;
  char v42 = 1;
  uint64_t v28 = sub_247AB75F0();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  uint64_t v41 = v30;
  v29(v19, v5);
  swift_unknownObjectRelease();
  uint64_t v31 = OUTLINED_FUNCTION_2_7();
  v32(v31);
  uint64_t v33 = v39;
  uint64_t v34 = (uint64_t)v37;
  *uint64_t v39 = v36;
  v33[1] = v27;
  uint64_t v35 = v41;
  v33[2] = v28;
  v33[3] = v35;
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t sub_247AA1B3C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ValueDisplayName.init(from:)(a1, a2);
}

uint64_t sub_247AA1B54(void *a1)
{
  return ValueDisplayName.encode(to:)(a1);
}

uint64_t destroy for ValueDisplayName()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ValueDisplayName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ValueDisplayName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ValueDisplayName(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueDisplayName(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ValueDisplayName(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueDisplayName()
{
  return &type metadata for ValueDisplayName;
}

unsigned char *storeEnumTagSinglePayload for ValueDisplayName.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247AA1DD0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueDisplayName.CodingKeys()
{
  return &type metadata for ValueDisplayName.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ValueDisplayName.BoolCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AA1ED4);
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

ValueMetadata *type metadata accessor for ValueDisplayName.BoolCodingKeys()
{
  return &type metadata for ValueDisplayName.BoolCodingKeys;
}

unint64_t sub_247AA1F10()
{
  unint64_t result = qword_26929BAC0;
  if (!qword_26929BAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAC0);
  }
  return result;
}

unint64_t sub_247AA1F60()
{
  unint64_t result = qword_26929BAC8;
  if (!qword_26929BAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAC8);
  }
  return result;
}

unint64_t sub_247AA1FB0()
{
  unint64_t result = qword_26929BAD0;
  if (!qword_26929BAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAD0);
  }
  return result;
}

unint64_t sub_247AA2000()
{
  unint64_t result = qword_26929BAD8;
  if (!qword_26929BAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAD8);
  }
  return result;
}

unint64_t sub_247AA2050()
{
  unint64_t result = qword_26929BAE0;
  if (!qword_26929BAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAE0);
  }
  return result;
}

unint64_t sub_247AA20A0()
{
  unint64_t result = qword_26929BAE8;
  if (!qword_26929BAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BAE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0;
}

BOOL static MeasurementType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MeasurementType.hash(into:)()
{
  return sub_247AB76F0();
}

uint64_t sub_247AA2144(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6172656C65636361 && a2 == 0xEC0000006E6F6974;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C676E61 && a2 == 0xE500000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1634038369 && a2 == 0xE400000000000000;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x8000000247ABE050 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6973726570736964 && a2 == 0xEA00000000006E6FLL;
        if (v8 || (sub_247AB7690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000;
          if (v9 || (sub_247AB7690() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6369727463656C65 && a2 == 0xEE00656772616843;
            if (v10 || (sub_247AB7690() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x6369727463656C65 && a2 == 0xEF746E6572727543;
              if (v11 || (sub_247AB7690() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000247ABE070 || (sub_247AB7690() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else if (a1 == 0xD000000000000012 && a2 == 0x8000000247ABE090 || (sub_247AB7690() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                BOOL v12 = a1 == 0x796772656E65 && a2 == 0xE600000000000000;
                if (v12 || (sub_247AB7690() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  BOOL v13 = a1 == 0x636E657571657266 && a2 == 0xE900000000000079;
                  if (v13 || (sub_247AB7690() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 11;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x696666456C657566 && a2 == 0xEE0079636E656963;
                    if (v14 || (sub_247AB7690() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 12;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x616E696D756C6C69 && a2 == 0xEB0000000065636ELL;
                      if (v15 || (sub_247AB7690() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 13;
                      }
                      else if (a1 == 0xD000000000000012 && a2 == 0x8000000247ABE0B0 || (sub_247AB7690() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 14;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x6874676E656CLL && a2 == 0xE600000000000000;
                        if (v16 || (sub_247AB7690() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 15;
                        }
                        else
                        {
                          BOOL v17 = a1 == 1936941421 && a2 == 0xE400000000000000;
                          if (v17 || (sub_247AB7690() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 16;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x7265776F70 && a2 == 0xE500000000000000;
                            if (v18 || (sub_247AB7690() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 17;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x6572757373657270 && a2 == 0xE800000000000000;
                              if (v19 || (sub_247AB7690() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 18;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x6465657073 && a2 == 0xE500000000000000;
                                if (v20 || (sub_247AB7690() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 19;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
                                  if (v21 || (sub_247AB7690() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 20;
                                  }
                                  else if (a1 == 0x656D756C6F76 && a2 == 0xE600000000000000)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 21;
                                  }
                                  else
                                  {
                                    char v23 = sub_247AB7690();
                                    swift_bridgeObjectRelease();
                                    if (v23) {
                                      return 21;
                                    }
                                    else {
                                      return 22;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_247AA29EC()
{
  return 22;
}

unint64_t sub_247AA29F4(char a1)
{
  unint64_t result = 0x6172656C65636361;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C676E61;
      break;
    case 2:
      unint64_t result = 1634038369;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6973726570736964;
      break;
    case 5:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 6:
    case 7:
      unint64_t result = 0x6369727463656C65;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 9:
    case 14:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0x796772656E65;
      break;
    case 11:
      unint64_t result = 0x636E657571657266;
      break;
    case 12:
      unint64_t result = 0x696666456C657566;
      break;
    case 13:
      unint64_t result = 0x616E696D756C6C69;
      break;
    case 15:
      unint64_t result = 0x6874676E656CLL;
      break;
    case 16:
      unint64_t result = 1936941421;
      break;
    case 17:
      unint64_t result = 0x7265776F70;
      break;
    case 18:
      unint64_t result = 0x6572757373657270;
      break;
    case 19:
      unint64_t result = 0x6465657073;
      break;
    case 20:
      unint64_t result = 0x74617265706D6574;
      break;
    case 21:
      unint64_t result = 0x656D756C6F76;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247AA2C94(uint64_t a1)
{
  unint64_t v2 = sub_247AA4B24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2CD0(uint64_t a1)
{
  unint64_t v2 = sub_247AA4B24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA2D0C(uint64_t a1)
{
  unint64_t v2 = sub_247AA4AD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2D48(uint64_t a1)
{
  unint64_t v2 = sub_247AA4AD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA2D84(uint64_t a1)
{
  unint64_t v2 = sub_247AA4A8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2DC0(uint64_t a1)
{
  unint64_t v2 = sub_247AA4A8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_247AA2DFC()
{
  return sub_247AA29F4(*v0);
}

uint64_t sub_247AA2E04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AA2144(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AA2E2C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AA29EC();
  *a1 = result;
  return result;
}

uint64_t sub_247AA2E54(uint64_t a1)
{
  unint64_t v2 = sub_247AA449C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2E90(uint64_t a1)
{
  unint64_t v2 = sub_247AA449C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA2ECC(uint64_t a1)
{
  unint64_t v2 = sub_247AA4A40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2F08(uint64_t a1)
{
  unint64_t v2 = sub_247AA4A40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA2F44(uint64_t a1)
{
  unint64_t v2 = sub_247AA49F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2F80(uint64_t a1)
{
  unint64_t v2 = sub_247AA49F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA2FBC(uint64_t a1)
{
  unint64_t v2 = sub_247AA49A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA2FF8(uint64_t a1)
{
  unint64_t v2 = sub_247AA49A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA3034(uint64_t a1)
{
  unint64_t v2 = sub_247AA495C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3070(uint64_t a1)
{
  unint64_t v2 = sub_247AA495C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA30AC(uint64_t a1)
{
  unint64_t v2 = sub_247AA4910();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA30E8(uint64_t a1)
{
  unint64_t v2 = sub_247AA4910();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA3124(uint64_t a1)
{
  unint64_t v2 = sub_247AA48C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3160(uint64_t a1)
{
  unint64_t v2 = sub_247AA48C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA319C(uint64_t a1)
{
  unint64_t v2 = sub_247AA4878();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA31D8(uint64_t a1)
{
  unint64_t v2 = sub_247AA4878();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA3214(uint64_t a1)
{
  unint64_t v2 = sub_247AA482C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3250(uint64_t a1)
{
  unint64_t v2 = sub_247AA482C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA328C(uint64_t a1)
{
  unint64_t v2 = sub_247AA47E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA32C8(uint64_t a1)
{
  unint64_t v2 = sub_247AA47E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA3304(uint64_t a1)
{
  unint64_t v2 = sub_247AA4794();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3340(uint64_t a1)
{
  unint64_t v2 = sub_247AA4794();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA337C(uint64_t a1)
{
  unint64_t v2 = sub_247AA4748();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA33B8(uint64_t a1)
{
  unint64_t v2 = sub_247AA4748();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA33F4(uint64_t a1)
{
  unint64_t v2 = sub_247AA46FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3430(uint64_t a1)
{
  unint64_t v2 = sub_247AA46FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA346C(uint64_t a1)
{
  unint64_t v2 = sub_247AA46B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA34A8(uint64_t a1)
{
  unint64_t v2 = sub_247AA46B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA34E4(uint64_t a1)
{
  unint64_t v2 = sub_247AA4664();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3520(uint64_t a1)
{
  unint64_t v2 = sub_247AA4664();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA355C(uint64_t a1)
{
  unint64_t v2 = sub_247AA4618();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3598(uint64_t a1)
{
  unint64_t v2 = sub_247AA4618();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA35D4(uint64_t a1)
{
  unint64_t v2 = sub_247AA45CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3610(uint64_t a1)
{
  unint64_t v2 = sub_247AA45CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA364C(uint64_t a1)
{
  unint64_t v2 = sub_247AA4580();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3688(uint64_t a1)
{
  unint64_t v2 = sub_247AA4580();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA36C4(uint64_t a1)
{
  unint64_t v2 = sub_247AA4534();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3700(uint64_t a1)
{
  unint64_t v2 = sub_247AA4534();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA373C(uint64_t a1)
{
  unint64_t v2 = sub_247AA44E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA3778(uint64_t a1)
{
  unint64_t v2 = sub_247AA44E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MeasurementType.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BAF0);
  OUTLINED_FUNCTION_0();
  uint64_t v129 = v5;
  uint64_t v130 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_18(v6, v87[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BAF8);
  OUTLINED_FUNCTION_0();
  uint64_t v126 = v8;
  uint64_t v127 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_20(v9, v87[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB00);
  OUTLINED_FUNCTION_0();
  uint64_t v123 = v11;
  uint64_t v124 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_17(v12, v87[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB08);
  OUTLINED_FUNCTION_0();
  uint64_t v120 = v14;
  uint64_t v121 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_19(v15, v87[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB10);
  OUTLINED_FUNCTION_0();
  uint64_t v117 = v17;
  uint64_t v118 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_10_0(v18, v87[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB18);
  OUTLINED_FUNCTION_0();
  uint64_t v114 = v20;
  uint64_t v115 = v19;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_11((uint64_t)v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v113[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB20);
  OUTLINED_FUNCTION_0();
  v113[0] = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v24);
  v112[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB28);
  OUTLINED_FUNCTION_0();
  v112[0] = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v27);
  v111[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB30);
  OUTLINED_FUNCTION_0();
  v111[0] = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v30);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB38);
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v33);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB40);
  OUTLINED_FUNCTION_0();
  uint64_t v107 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v36);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB48);
  OUTLINED_FUNCTION_0();
  uint64_t v105 = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v39);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB50);
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v40;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v42);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB58);
  OUTLINED_FUNCTION_0();
  uint64_t v101 = v43;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v45);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB60);
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v48);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB68);
  OUTLINED_FUNCTION_0();
  uint64_t v97 = v49;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v51);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB70);
  OUTLINED_FUNCTION_0();
  uint64_t v95 = v52;
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v54);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB78);
  OUTLINED_FUNCTION_0();
  uint64_t v93 = v55;
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v57);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB80);
  OUTLINED_FUNCTION_0();
  uint64_t v91 = v58;
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v60);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB88);
  OUTLINED_FUNCTION_0();
  uint64_t v89 = v61;
  MEMORY[0x270FA5388](v62);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v63);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB90);
  OUTLINED_FUNCTION_0();
  uint64_t v88 = v65;
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_1_6();
  uint64_t v69 = v68 - v67;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BB98);
  OUTLINED_FUNCTION_0();
  v87[1] = v71;
  MEMORY[0x270FA5388](v72);
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BBA0);
  OUTLINED_FUNCTION_0();
  v132[0] = v73;
  v132[1] = v74;
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_1_6();
  uint64_t v77 = v76 - v75;
  uint64_t v78 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AA449C();
  uint64_t v131 = v77;
  sub_247AB7720();
  switch(v78)
  {
    case 1:
      char v134 = 1;
      sub_247AA4AD8();
      sub_247AB7630();
      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v69, v64);
      goto LABEL_27;
    case 2:
      char v134 = 2;
      sub_247AA4A8C();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = v111;
      goto LABEL_18;
    case 3:
      char v134 = 3;
      sub_247AA4A40();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = v112;
      goto LABEL_18;
    case 4:
      char v134 = 4;
      sub_247AA49F4();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = v113;
      goto LABEL_18;
    case 5:
      char v134 = 5;
      sub_247AA49A8();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v114;
      goto LABEL_18;
    case 6:
      char v134 = 6;
      sub_247AA495C();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v117;
      goto LABEL_18;
    case 7:
      char v134 = 7;
      sub_247AA4910();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v120;
      goto LABEL_18;
    case 8:
      char v134 = 8;
      sub_247AA48C4();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v123;
      goto LABEL_18;
    case 9:
      char v134 = 9;
      sub_247AA4878();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v126;
      goto LABEL_18;
    case 10:
      char v134 = 10;
      sub_247AA482C();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v129;
      goto LABEL_18;
    case 11:
      char v134 = 11;
      sub_247AA47E0();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = v132;
      goto LABEL_18;
    case 12:
      char v134 = 12;
      sub_247AA4794();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = (uint64_t *)&v133;
      goto LABEL_18;
    case 13:
      char v134 = 13;
      sub_247AA4748();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v135;
      goto LABEL_18;
    case 14:
      char v134 = 14;
      sub_247AA46FC();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v136;
      goto LABEL_18;
    case 15:
      char v134 = 15;
      sub_247AA46B0();
      OUTLINED_FUNCTION_6_0();
      uint64_t v79 = OUTLINED_FUNCTION_10();
      uint64_t v82 = &v137;
LABEL_18:
      uint64_t v81 = *(v82 - 32);
      break;
    case 16:
      char v134 = 16;
      sub_247AA4664();
      uint64_t v83 = v113[2];
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v114;
      uint64_t v81 = v115;
      goto LABEL_25;
    case 17:
      char v134 = 17;
      sub_247AA4618();
      uint64_t v83 = v116;
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v117;
      uint64_t v81 = v118;
      goto LABEL_25;
    case 18:
      char v134 = 18;
      sub_247AA45CC();
      uint64_t v83 = v119;
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v120;
      uint64_t v81 = v121;
      goto LABEL_25;
    case 19:
      char v134 = 19;
      sub_247AA4580();
      uint64_t v83 = v122;
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v123;
      uint64_t v81 = v124;
      goto LABEL_25;
    case 20:
      char v134 = 20;
      sub_247AA4534();
      uint64_t v83 = v125;
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v126;
      uint64_t v81 = v127;
      goto LABEL_25;
    case 21:
      char v134 = 21;
      sub_247AA44E8();
      uint64_t v83 = v128;
      OUTLINED_FUNCTION_6_0();
      uint64_t v84 = v129;
      uint64_t v81 = v130;
LABEL_25:
      v80 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
      uint64_t v79 = v83;
      break;
    default:
      char v134 = 0;
      sub_247AA4B24();
      sub_247AB7630();
      uint64_t v79 = OUTLINED_FUNCTION_5_2();
      uint64_t v81 = v70;
      break;
  }
  v80(v79, v81);
LABEL_27:
  OUTLINED_FUNCTION_3_2();
  return v85();
}

unint64_t sub_247AA449C()
{
  unint64_t result = qword_26929BBA8;
  if (!qword_26929BBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBA8);
  }
  return result;
}

unint64_t sub_247AA44E8()
{
  unint64_t result = qword_26929BBB0;
  if (!qword_26929BBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBB0);
  }
  return result;
}

unint64_t sub_247AA4534()
{
  unint64_t result = qword_26929BBB8;
  if (!qword_26929BBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBB8);
  }
  return result;
}

unint64_t sub_247AA4580()
{
  unint64_t result = qword_26929BBC0;
  if (!qword_26929BBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBC0);
  }
  return result;
}

unint64_t sub_247AA45CC()
{
  unint64_t result = qword_26929BBC8;
  if (!qword_26929BBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBC8);
  }
  return result;
}

unint64_t sub_247AA4618()
{
  unint64_t result = qword_26929BBD0;
  if (!qword_26929BBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBD0);
  }
  return result;
}

unint64_t sub_247AA4664()
{
  unint64_t result = qword_26929BBD8;
  if (!qword_26929BBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBD8);
  }
  return result;
}

unint64_t sub_247AA46B0()
{
  unint64_t result = qword_26929BBE0;
  if (!qword_26929BBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBE0);
  }
  return result;
}

unint64_t sub_247AA46FC()
{
  unint64_t result = qword_26929BBE8;
  if (!qword_26929BBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBE8);
  }
  return result;
}

unint64_t sub_247AA4748()
{
  unint64_t result = qword_26929BBF0;
  if (!qword_26929BBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBF0);
  }
  return result;
}

unint64_t sub_247AA4794()
{
  unint64_t result = qword_26929BBF8;
  if (!qword_26929BBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BBF8);
  }
  return result;
}

unint64_t sub_247AA47E0()
{
  unint64_t result = qword_26929BC00;
  if (!qword_26929BC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC00);
  }
  return result;
}

unint64_t sub_247AA482C()
{
  unint64_t result = qword_26929BC08;
  if (!qword_26929BC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC08);
  }
  return result;
}

unint64_t sub_247AA4878()
{
  unint64_t result = qword_26929BC10;
  if (!qword_26929BC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC10);
  }
  return result;
}

unint64_t sub_247AA48C4()
{
  unint64_t result = qword_26929BC18;
  if (!qword_26929BC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC18);
  }
  return result;
}

unint64_t sub_247AA4910()
{
  unint64_t result = qword_26929BC20;
  if (!qword_26929BC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC20);
  }
  return result;
}

unint64_t sub_247AA495C()
{
  unint64_t result = qword_26929BC28;
  if (!qword_26929BC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC28);
  }
  return result;
}

unint64_t sub_247AA49A8()
{
  unint64_t result = qword_26929BC30;
  if (!qword_26929BC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC30);
  }
  return result;
}

unint64_t sub_247AA49F4()
{
  unint64_t result = qword_26929BC38;
  if (!qword_26929BC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC38);
  }
  return result;
}

unint64_t sub_247AA4A40()
{
  unint64_t result = qword_26929BC40;
  if (!qword_26929BC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC40);
  }
  return result;
}

unint64_t sub_247AA4A8C()
{
  unint64_t result = qword_26929BC48;
  if (!qword_26929BC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC48);
  }
  return result;
}

unint64_t sub_247AA4AD8()
{
  unint64_t result = qword_26929BC50;
  if (!qword_26929BC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC50);
  }
  return result;
}

unint64_t sub_247AA4B24()
{
  unint64_t result = qword_26929BC58;
  if (!qword_26929BC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BC58);
  }
  return result;
}

uint64_t MeasurementType.hashValue.getter()
{
  return sub_247AB7700();
}

uint64_t MeasurementType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v151 = a2;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC60);
  OUTLINED_FUNCTION_0();
  uint64_t v139 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_18(v6, v96[0]);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC68);
  OUTLINED_FUNCTION_0();
  uint64_t v137 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_6();
  uint64_t v150 = v9;
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC70);
  OUTLINED_FUNCTION_0();
  uint64_t v135 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_6();
  uint64_t v149 = v12;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC78);
  OUTLINED_FUNCTION_0();
  uint64_t v133 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_20(v15, v96[0]);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC80);
  OUTLINED_FUNCTION_0();
  uint64_t v131 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2_6();
  uint64_t v148 = v18;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC88);
  OUTLINED_FUNCTION_0();
  uint64_t v129 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2_6();
  uint64_t v147 = v21;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC90);
  OUTLINED_FUNCTION_0();
  uint64_t v127 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_17(v24, v96[0]);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BC98);
  OUTLINED_FUNCTION_0();
  uint64_t v125 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_2_6();
  uint64_t v146 = v27;
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCA0);
  OUTLINED_FUNCTION_0();
  uint64_t v123 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2_6();
  uint64_t v145 = v30;
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCA8);
  OUTLINED_FUNCTION_0();
  uint64_t v121 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_19(v33, v96[0]);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCB0);
  OUTLINED_FUNCTION_0();
  uint64_t v119 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_2_6();
  uint64_t v144 = v36;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCB8);
  OUTLINED_FUNCTION_0();
  uint64_t v117 = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_2_6();
  uint64_t v143 = v39;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCC0);
  OUTLINED_FUNCTION_0();
  uint64_t v115 = v40;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_2_6();
  uint64_t v154 = v42;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCC8);
  OUTLINED_FUNCTION_0();
  uint64_t v114 = v43;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_2_6();
  uint64_t v153 = v45;
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCD0);
  OUTLINED_FUNCTION_0();
  uint64_t v111 = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_2_6();
  uint64_t v152 = v48;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCD8);
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v49;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_10_0(v51, v96[0]);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCE0);
  OUTLINED_FUNCTION_0();
  uint64_t v107 = v52;
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_2_6();
  uint64_t v142 = v54;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCE8);
  OUTLINED_FUNCTION_0();
  uint64_t v105 = v55;
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_2_6();
  uint64_t v141 = v57;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCF0);
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v58;
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_11((uint64_t)v96 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BCF8);
  OUTLINED_FUNCTION_0();
  uint64_t v101 = v61;
  MEMORY[0x270FA5388](v62);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(v63);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BD00);
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v64;
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_13();
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BD08);
  OUTLINED_FUNCTION_0();
  uint64_t v98 = v67;
  MEMORY[0x270FA5388](v68);
  OUTLINED_FUNCTION_1_6();
  uint64_t v71 = v70 - v69;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BD10);
  OUTLINED_FUNCTION_0();
  uint64_t v74 = v73;
  MEMORY[0x270FA5388](v75);
  OUTLINED_FUNCTION_1_6();
  uint64_t v78 = v77 - v76;
  uint64_t v79 = a1[3];
  v155 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v79);
  sub_247AA449C();
  uint64_t v80 = v156;
  sub_247AB7710();
  if (v80) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
  }
  v96[2] = v71;
  v96[1] = v66;
  v96[3] = v2;
  uint64_t v156 = v74;
  uint64_t v81 = sub_247AB7620();
  uint64_t v82 = *(void *)(v81 + 16);
  if (!v82)
  {
LABEL_8:
    uint64_t v90 = sub_247AB7570();
    swift_allocError();
    uint64_t v92 = v91;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *uint64_t v92 = &type metadata for MeasurementType;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v90 - 8) + 104))(v92, *MEMORY[0x263F8DCB0], v90);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v78, v72);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
  }
  uint64_t v97 = v78;
  uint64_t v83 = v72;
  v96[0] = 0;
  uint64_t v84 = *(unsigned __int8 *)(v81 + 32);
  sub_247A97398(1, v82, v81, v81 + 32, 0, (2 * v82) | 1);
  uint64_t v86 = v85;
  unint64_t v88 = v87;
  swift_bridgeObjectRelease();
  if (v86 != v88 >> 1)
  {
    uint64_t v72 = v83;
    uint64_t v78 = v97;
    goto LABEL_8;
  }
  uint64_t v89 = v151;
  switch(v84)
  {
    case 1:
      char v157 = 1;
      sub_247AA4AD8();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 2:
      char v157 = 2;
      sub_247AA4A8C();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 3:
      char v157 = 3;
      sub_247AA4A40();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 4:
      char v157 = 4;
      sub_247AA49F4();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 5:
      char v157 = 5;
      sub_247AA49A8();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 6:
      char v157 = 6;
      sub_247AA495C();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 7:
      char v157 = 7;
      sub_247AA4910();
      OUTLINED_FUNCTION_2_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 8:
      char v157 = 8;
      sub_247AA48C4();
      OUTLINED_FUNCTION_2_8();
      break;
    case 9:
      char v157 = 9;
      sub_247AA4878();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 10:
      char v157 = 10;
      sub_247AA482C();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 11:
      char v157 = 11;
      sub_247AA47E0();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 12:
      char v157 = 12;
      sub_247AA4794();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 13:
      char v157 = 13;
      sub_247AA4748();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 14:
      char v157 = 14;
      sub_247AA46FC();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 15:
      char v157 = 15;
      sub_247AA46B0();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 16:
      char v157 = 16;
      sub_247AA4664();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 17:
      char v157 = 17;
      sub_247AA4618();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 18:
      char v157 = 18;
      sub_247AA45CC();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 19:
      char v157 = 19;
      sub_247AA4580();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 20:
      char v157 = 20;
      sub_247AA4534();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    case 21:
      char v157 = 21;
      sub_247AA44E8();
      OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_5_2();
      break;
    default:
      char v157 = 0;
      sub_247AA4B24();
      OUTLINED_FUNCTION_2_8();
      break;
  }
  OUTLINED_FUNCTION_3_2();
  v94();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_2();
  v95();
  *uint64_t v89 = v84;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v155);
}

uint64_t sub_247AA5BC4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return MeasurementType.init(from:)(a1, a2);
}

uint64_t sub_247AA5BDC(void *a1)
{
  return MeasurementType.encode(to:)(a1);
}

unint64_t sub_247AA5BFC()
{
  unint64_t result = qword_26929BD18;
  if (!qword_26929BD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD18);
  }
  return result;
}

ValueMetadata *type metadata accessor for MeasurementType()
{
  return &type metadata for MeasurementType;
}

uint64_t _s16AppIntentSchemas15MeasurementTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEB)
  {
    if (a2 + 21 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 21) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 22;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x16;
  int v5 = v6 - 22;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s16AppIntentSchemas15MeasurementTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 21 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 21) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEA)
  {
    unsigned int v6 = ((a2 - 235) >> 8) + 1;
    *unint64_t result = a2 + 21;
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
        JUMPOUT(0x247AA5DB4);
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
          *unint64_t result = a2 + 21;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MeasurementType.CodingKeys()
{
  return &type metadata for MeasurementType.CodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.AccelerationCodingKeys()
{
  return &type metadata for MeasurementType.AccelerationCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.AngleCodingKeys()
{
  return &type metadata for MeasurementType.AngleCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.AreaCodingKeys()
{
  return &type metadata for MeasurementType.AreaCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.ConcentrationMassCodingKeys()
{
  return &type metadata for MeasurementType.ConcentrationMassCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.DispersionCodingKeys()
{
  return &type metadata for MeasurementType.DispersionCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.DurationCodingKeys()
{
  return &type metadata for MeasurementType.DurationCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.ElectricChargeCodingKeys()
{
  return &type metadata for MeasurementType.ElectricChargeCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.ElectricCurrentCodingKeys()
{
  return &type metadata for MeasurementType.ElectricCurrentCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.ElectricPotentialDifferenceCodingKeys()
{
  return &type metadata for MeasurementType.ElectricPotentialDifferenceCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.ElectricResistanceCodingKeys()
{
  return &type metadata for MeasurementType.ElectricResistanceCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.EnergyCodingKeys()
{
  return &type metadata for MeasurementType.EnergyCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.FrequencyCodingKeys()
{
  return &type metadata for MeasurementType.FrequencyCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.FuelEfficiencyCodingKeys()
{
  return &type metadata for MeasurementType.FuelEfficiencyCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.IlluminanceCodingKeys()
{
  return &type metadata for MeasurementType.IlluminanceCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.InformationStorageCodingKeys()
{
  return &type metadata for MeasurementType.InformationStorageCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.LengthCodingKeys()
{
  return &type metadata for MeasurementType.LengthCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.MassCodingKeys()
{
  return &type metadata for MeasurementType.MassCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.PowerCodingKeys()
{
  return &type metadata for MeasurementType.PowerCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.PressureCodingKeys()
{
  return &type metadata for MeasurementType.PressureCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.SpeedCodingKeys()
{
  return &type metadata for MeasurementType.SpeedCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.TemperatureCodingKeys()
{
  return &type metadata for MeasurementType.TemperatureCodingKeys;
}

ValueMetadata *type metadata accessor for MeasurementType.VolumeCodingKeys()
{
  return &type metadata for MeasurementType.VolumeCodingKeys;
}

unint64_t sub_247AA5F50()
{
  unint64_t result = qword_26929BD20;
  if (!qword_26929BD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD20);
  }
  return result;
}

unint64_t sub_247AA5FA0()
{
  unint64_t result = qword_26929BD28;
  if (!qword_26929BD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD28);
  }
  return result;
}

unint64_t sub_247AA5FF0()
{
  unint64_t result = qword_26929BD30;
  if (!qword_26929BD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD30);
  }
  return result;
}

unint64_t sub_247AA6040()
{
  unint64_t result = qword_26929BD38;
  if (!qword_26929BD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD38);
  }
  return result;
}

unint64_t sub_247AA6090()
{
  unint64_t result = qword_26929BD40;
  if (!qword_26929BD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD40);
  }
  return result;
}

unint64_t sub_247AA60E0()
{
  unint64_t result = qword_26929BD48;
  if (!qword_26929BD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD48);
  }
  return result;
}

unint64_t sub_247AA6130()
{
  unint64_t result = qword_26929BD50;
  if (!qword_26929BD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD50);
  }
  return result;
}

unint64_t sub_247AA6180()
{
  unint64_t result = qword_26929BD58;
  if (!qword_26929BD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD58);
  }
  return result;
}

unint64_t sub_247AA61D0()
{
  unint64_t result = qword_26929BD60;
  if (!qword_26929BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD60);
  }
  return result;
}

unint64_t sub_247AA6220()
{
  unint64_t result = qword_26929BD68;
  if (!qword_26929BD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD68);
  }
  return result;
}

unint64_t sub_247AA6270()
{
  unint64_t result = qword_26929BD70;
  if (!qword_26929BD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD70);
  }
  return result;
}

unint64_t sub_247AA62C0()
{
  unint64_t result = qword_26929BD78;
  if (!qword_26929BD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD78);
  }
  return result;
}

unint64_t sub_247AA6310()
{
  unint64_t result = qword_26929BD80;
  if (!qword_26929BD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD80);
  }
  return result;
}

unint64_t sub_247AA6360()
{
  unint64_t result = qword_26929BD88;
  if (!qword_26929BD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD88);
  }
  return result;
}

unint64_t sub_247AA63B0()
{
  unint64_t result = qword_26929BD90;
  if (!qword_26929BD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD90);
  }
  return result;
}

unint64_t sub_247AA6400()
{
  unint64_t result = qword_26929BD98;
  if (!qword_26929BD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BD98);
  }
  return result;
}

unint64_t sub_247AA6450()
{
  unint64_t result = qword_26929BDA0;
  if (!qword_26929BDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDA0);
  }
  return result;
}

unint64_t sub_247AA64A0()
{
  unint64_t result = qword_26929BDA8;
  if (!qword_26929BDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDA8);
  }
  return result;
}

unint64_t sub_247AA64F0()
{
  unint64_t result = qword_26929BDB0;
  if (!qword_26929BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDB0);
  }
  return result;
}

unint64_t sub_247AA6540()
{
  unint64_t result = qword_26929BDB8;
  if (!qword_26929BDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDB8);
  }
  return result;
}

unint64_t sub_247AA6590()
{
  unint64_t result = qword_26929BDC0;
  if (!qword_26929BDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDC0);
  }
  return result;
}

unint64_t sub_247AA65E0()
{
  unint64_t result = qword_26929BDC8;
  if (!qword_26929BDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDC8);
  }
  return result;
}

unint64_t sub_247AA6630()
{
  unint64_t result = qword_26929BDD0;
  if (!qword_26929BDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDD0);
  }
  return result;
}

unint64_t sub_247AA6680()
{
  unint64_t result = qword_26929BDD8;
  if (!qword_26929BDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDD8);
  }
  return result;
}

unint64_t sub_247AA66D0()
{
  unint64_t result = qword_26929BDE0;
  if (!qword_26929BDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDE0);
  }
  return result;
}

unint64_t sub_247AA6720()
{
  unint64_t result = qword_26929BDE8;
  if (!qword_26929BDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDE8);
  }
  return result;
}

unint64_t sub_247AA6770()
{
  unint64_t result = qword_26929BDF0;
  if (!qword_26929BDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDF0);
  }
  return result;
}

unint64_t sub_247AA67C0()
{
  unint64_t result = qword_26929BDF8;
  if (!qword_26929BDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BDF8);
  }
  return result;
}

unint64_t sub_247AA6810()
{
  unint64_t result = qword_26929BE00;
  if (!qword_26929BE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE00);
  }
  return result;
}

unint64_t sub_247AA6860()
{
  unint64_t result = qword_26929BE08;
  if (!qword_26929BE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE08);
  }
  return result;
}

unint64_t sub_247AA68B0()
{
  unint64_t result = qword_26929BE10;
  if (!qword_26929BE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE10);
  }
  return result;
}

unint64_t sub_247AA6900()
{
  unint64_t result = qword_26929BE18;
  if (!qword_26929BE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE18);
  }
  return result;
}

unint64_t sub_247AA6950()
{
  unint64_t result = qword_26929BE20;
  if (!qword_26929BE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE20);
  }
  return result;
}

unint64_t sub_247AA69A0()
{
  unint64_t result = qword_26929BE28;
  if (!qword_26929BE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE28);
  }
  return result;
}

unint64_t sub_247AA69F0()
{
  unint64_t result = qword_26929BE30;
  if (!qword_26929BE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE30);
  }
  return result;
}

unint64_t sub_247AA6A40()
{
  unint64_t result = qword_26929BE38;
  if (!qword_26929BE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE38);
  }
  return result;
}

unint64_t sub_247AA6A90()
{
  unint64_t result = qword_26929BE40;
  if (!qword_26929BE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE40);
  }
  return result;
}

unint64_t sub_247AA6AE0()
{
  unint64_t result = qword_26929BE48;
  if (!qword_26929BE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE48);
  }
  return result;
}

unint64_t sub_247AA6B30()
{
  unint64_t result = qword_26929BE50;
  if (!qword_26929BE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE50);
  }
  return result;
}

unint64_t sub_247AA6B80()
{
  unint64_t result = qword_26929BE58;
  if (!qword_26929BE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE58);
  }
  return result;
}

unint64_t sub_247AA6BD0()
{
  unint64_t result = qword_26929BE60;
  if (!qword_26929BE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE60);
  }
  return result;
}

unint64_t sub_247AA6C20()
{
  unint64_t result = qword_26929BE68;
  if (!qword_26929BE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE68);
  }
  return result;
}

unint64_t sub_247AA6C70()
{
  unint64_t result = qword_26929BE70;
  if (!qword_26929BE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE70);
  }
  return result;
}

unint64_t sub_247AA6CC0()
{
  unint64_t result = qword_26929BE78;
  if (!qword_26929BE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE78);
  }
  return result;
}

unint64_t sub_247AA6D10()
{
  unint64_t result = qword_26929BE80;
  if (!qword_26929BE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE80);
  }
  return result;
}

unint64_t sub_247AA6D60()
{
  unint64_t result = qword_26929BE88;
  if (!qword_26929BE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE88);
  }
  return result;
}

unint64_t sub_247AA6DB0()
{
  unint64_t result = qword_26929BE90;
  if (!qword_26929BE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BE90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return sub_247AB75B0();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_247AB75B0();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return v0;
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return v0;
}

void IntentSystemProtocol.init(from:)()
{
  OUTLINED_FUNCTION_14();
  int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BE98);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_247AA6FB8();
  sub_247AB7710();
  if (!v0)
  {
    sub_247AA7004();
    sub_247AB7610();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    sub_247AA7050((uint64_t)v10, v5);
    sub_247AA7128((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  OUTLINED_FUNCTION_15();
}

unint64_t sub_247AA6FB8()
{
  unint64_t result = qword_26929BEA0;
  if (!qword_26929BEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BEA0);
  }
  return result;
}

unint64_t sub_247AA7004()
{
  unint64_t result = qword_26929BEA8;
  if (!qword_26929BEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BEA8);
  }
  return result;
}

uint64_t sub_247AA7050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_247AA96CC(a1, (uint64_t)v7);
  if (v9)
  {
    v5[0] = v7[0];
    v5[1] = v7[1];
    uint64_t v6 = v8;
    return sub_247A95CE8(v5, a2);
  }
  else
  {
    switch(LOBYTE(v7[0]))
    {
      case 1:
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = 0;
        *(void *)(a2 + 16) = 0;
        long long v4 = xmmword_247ABBB60;
        goto LABEL_8;
      case 2:
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = 0;
        *(void *)(a2 + 16) = 0;
        long long v4 = xmmword_247ABBB50;
        goto LABEL_8;
      case 3:
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = 0;
        *(void *)(a2 + 16) = 0;
        long long v4 = xmmword_247ABBB40;
LABEL_8:
        *(_OWORD *)(a2 + 24) = v4;
        break;
      default:
        *(void *)(a2 + 32) = 0;
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;
        break;
    }
  }
  return result;
}

uint64_t sub_247AA7128(uint64_t a1)
{
  return a1;
}

uint64_t IntentSystemProtocol.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BEB0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AA6FB8();
  sub_247AB7720();
  sub_247AA7274(v8);
  sub_247AA732C();
  sub_247AB7680();
  sub_247AA7128((uint64_t)v8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t sub_247AA7274@<X0>(char *a1@<X8>)
{
  uint64_t result = sub_247AA764C(v1, (uint64_t)&v6);
  switch(v7)
  {
    case 0:
      char v4 = 0;
      *a1 = 0;
      break;
    case 1:
      char v4 = 0;
      char v5 = 1;
      goto LABEL_7;
    case 2:
      char v4 = 0;
      char v5 = 2;
      goto LABEL_7;
    case 3:
      char v4 = 0;
      char v5 = 3;
LABEL_7:
      *a1 = v5;
      break;
    default:
      uint64_t result = sub_247A95CE8(&v6, (uint64_t)a1);
      char v4 = 1;
      break;
  }
  a1[40] = v4;
  return result;
}

unint64_t sub_247AA732C()
{
  unint64_t result = qword_26929BEB8;
  if (!qword_26929BEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BEB8);
  }
  return result;
}

BOOL sub_247AA7378()
{
  uint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_247AA73C0()
{
  return sub_247AA7378();
}

BOOL sub_247AA73DC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_247AA7378();
  *a1 = result;
  return result;
}

BOOL sub_247AA7410@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_247AA73C0();
  *a1 = result;
  return result;
}

uint64_t sub_247AA743C(uint64_t a1)
{
  unint64_t v2 = sub_247AA6FB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA7478(uint64_t a1)
{
  unint64_t v2 = sub_247AA6FB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247AA74B4()
{
}

uint64_t sub_247AA74CC(void *a1)
{
  return IntentSystemProtocol.encode(to:)(a1);
}

uint64_t static IntentSystemProtocol.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_247AA764C(a1, (uint64_t)v10);
  sub_247AA764C(a2, (uint64_t)&v12);
  switch(v11)
  {
    case 0:
      if (v13) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 1:
      if (v13 != 1) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 2:
      if (v13 != 2) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 3:
      if (v13 != 3) {
        goto LABEL_12;
      }
LABEL_9:
      sub_247AA76E4((uint64_t)v10);
      char v3 = 1;
      break;
    default:
      sub_247AA764C((uint64_t)v10, (uint64_t)v9);
      if (v13 >= 4)
      {
        sub_247A95CE8(v9, (uint64_t)v8);
        sub_247A95CE8(&v12, (uint64_t)v7);
        sub_247A935FC((uint64_t)v8, (uint64_t)v6);
        sub_247A935FC((uint64_t)v7, (uint64_t)v5);
        char v3 = sub_247AAC830(v6, v5);
        sub_247A98DF4((uint64_t)v5);
        sub_247A98DF4((uint64_t)v6);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
        sub_247AA76E4((uint64_t)v10);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
LABEL_12:
        sub_247AA7684((uint64_t)v10);
        char v3 = 0;
      }
      break;
  }
  return v3 & 1;
}

uint64_t sub_247AA764C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247AA7684(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BEC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247AA76E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_247AA7714(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x766974696D697270 && a2 == 0xE900000000000065;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616D65686373 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247AA7808(char a1)
{
  if (a1) {
    return 0x616D65686373;
  }
  else {
    return 0x766974696D697270;
  }
}

void sub_247AA7840()
{
  OUTLINED_FUNCTION_14();
  uint64_t v17 = v0;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_2();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF20);
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_13();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF28);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_26();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_247AA928C();
  sub_247AB7720();
  sub_247AA96CC(v17, (uint64_t)v20);
  unint64_t v13 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  if (v22)
  {
    v18[0] = v20[0];
    v18[1] = v20[1];
    uint64_t v19 = v21;
    sub_247AA95D0();
    sub_247AB7630();
    sub_247A9EBCC();
    sub_247AB7680();
    OUTLINED_FUNCTION_3_2();
    v14();
    sub_247A98DF4((uint64_t)v18);
  }
  else
  {
    char v15 = v20[0];
    sub_247AA9634();
    sub_247AB7630();
    LOBYTE(v18[0]) = v15;
    sub_247AA9704();
    sub_247AB7680();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v2, v6);
  }
  (*v13)(v1, v9);
  OUTLINED_FUNCTION_15();
}

void sub_247AA7AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  OUTLINED_FUNCTION_14();
  uint64_t v16 = v15;
  uint64_t v40 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BEE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BEE8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1_5();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BEF0);
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_26();
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_247AA928C();
  sub_247AB7710();
  if (v13) {
    goto LABEL_8;
  }
  uint64_t v42 = v16;
  uint64_t v23 = sub_247AB7620();
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = v20;
  if (!v24)
  {
    uint64_t v26 = v14;
    goto LABEL_7;
  }
  uint64_t v26 = v14;
  char v27 = *(unsigned char *)(v23 + 32);
  sub_247A97398(1, v24, v23, v23 + 32, 0, (2 * v24) | 1);
  uint64_t v29 = v28;
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  if (v29 != v31 >> 1)
  {
LABEL_7:
    uint64_t v32 = sub_247AB7570();
    swift_allocError();
    uint64_t v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *uint64_t v34 = &unk_26FBF2A90;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCB0], v32);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v26, v25);
    uint64_t v16 = v42;
LABEL_8:
    uint64_t v35 = (uint64_t)v16;
    goto LABEL_9;
  }
  if (v27)
  {
    LOBYTE(v43) = 1;
    sub_247AA95D0();
    sub_247AB75B0();
    sub_247A9E990();
    sub_247AB7610();
    OUTLINED_FUNCTION_3_2();
    v36();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6_1();
    v37();
    char v44 = 1;
  }
  else
  {
    LOBYTE(v43) = 0;
    sub_247AA9634();
    sub_247AB75B0();
    sub_247AA9680();
    sub_247AB7610();
    OUTLINED_FUNCTION_3_2();
    v38();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6_1();
    v39();
    LOBYTE(v43) = a13;
    char v44 = 0;
  }
  sub_247AA961C(&v43, v45);
  sub_247AA961C(v45, v40);
  uint64_t v35 = (uint64_t)v42;
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1(v35);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_247AA7FE8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1852141679 && a2 == 0xE400000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6574656C6564 && a2 == 0xE600000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x686372616573 && a2 == 0xE600000000000000;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6174536F69647561 && a2 == 0xED0000676E697472)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_247AB7690();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_247AA81A4()
{
  return 4;
}

uint64_t sub_247AA81AC(char a1)
{
  uint64_t result = 1852141679;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6574656C6564;
      break;
    case 2:
      uint64_t result = 0x686372616573;
      break;
    case 3:
      uint64_t result = 0x6174536F69647561;
      break;
    default:
      return result;
  }
  return result;
}

void sub_247AA823C()
{
  OUTLINED_FUNCTION_14();
  char v33 = v3;
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFD8);
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v7;
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_6();
  uint64_t v30 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFE0);
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v10;
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_6();
  uint64_t v27 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFE8);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v13;
  uint64_t v26 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_2();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFF0);
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_13();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFF8);
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_27();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_247AA9C6C();
  sub_247AB7720();
  switch(v33)
  {
    case 1:
      sub_247AA9D50();
      OUTLINED_FUNCTION_7_1();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v0, v26);
      break;
    case 2:
      sub_247AA9D04();
      uint64_t v21 = v27;
      OUTLINED_FUNCTION_7_1();
      uint64_t v23 = v28;
      uint64_t v22 = v29;
      goto LABEL_5;
    case 3:
      sub_247AA9CB8();
      uint64_t v21 = v30;
      OUTLINED_FUNCTION_7_1();
      uint64_t v23 = v31;
      uint64_t v22 = v32;
LABEL_5:
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
      break;
    default:
      sub_247AA9D9C();
      OUTLINED_FUNCTION_7_1();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v2, v14);
      break;
  }
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v17);
  OUTLINED_FUNCTION_15();
}

void sub_247AA8538()
{
  OUTLINED_FUNCTION_14();
  uint64_t v60 = v0;
  char v4 = v3;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF88);
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_6();
  uint64_t v58 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF90);
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v9;
  uint64_t v54 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_6();
  uint64_t v55 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929BF98);
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v12;
  uint64_t v52 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_27();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFA0);
  OUTLINED_FUNCTION_0();
  uint64_t v50 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_26();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929BFA8);
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_247AA9C6C();
  uint64_t v21 = v60;
  sub_247AB7710();
  if (v21) {
    goto LABEL_7;
  }
  uint64_t v47 = v13;
  uint64_t v48 = v1;
  uint64_t v49 = v2;
  uint64_t v22 = v58;
  uint64_t v23 = v59;
  uint64_t v60 = v4;
  uint64_t v24 = v20;
  uint64_t v25 = sub_247AB7620();
  uint64_t v26 = *(void *)(v25 + 16);
  if (!v26
    || (uint64_t v46 = 0,
        uint64_t v27 = *(unsigned __int8 *)(v25 + 32),
        sub_247A97398(1, v26, v25, v25 + 32, 0, (2 * v26) | 1),
        uint64_t v29 = v28,
        unint64_t v31 = v30,
        swift_bridgeObjectRelease(),
        v29 != v31 >> 1))
  {
    uint64_t v33 = sub_247AB7570();
    swift_allocError();
    uint64_t v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *uint64_t v35 = &unk_26FBF2D60;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x263F8DCB0], v33);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v16);
    char v4 = v60;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    goto LABEL_8;
  }
  uint64_t v32 = v56;
  switch(v27)
  {
    case 1:
      sub_247AA9D50();
      OUTLINED_FUNCTION_9_0();
      goto LABEL_13;
    case 2:
      sub_247AA9D04();
      OUTLINED_FUNCTION_9_0();
      goto LABEL_13;
    case 3:
      sub_247AA9CB8();
      uint64_t v36 = v46;
      sub_247AB75B0();
      if (v36)
      {
        swift_unknownObjectRelease();
        uint64_t v37 = OUTLINED_FUNCTION_1_9();
        v38(v37);
        char v4 = v60;
        goto LABEL_7;
      }
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v23);
      swift_unknownObjectRelease();
      uint64_t v43 = OUTLINED_FUNCTION_1_9();
      v44(v43);
      uint64_t v42 = (uint64_t)v60;
LABEL_15:
      __swift_destroy_boxed_opaque_existential_1(v42);
      break;
    default:
      sub_247AA9D9C();
      OUTLINED_FUNCTION_9_0();
LABEL_13:
      OUTLINED_FUNCTION_3_2();
      v39();
      swift_unknownObjectRelease();
      uint64_t v40 = OUTLINED_FUNCTION_1_9();
      v41(v40);
      uint64_t v42 = (uint64_t)v60;
      goto LABEL_15;
  }
LABEL_8:
  OUTLINED_FUNCTION_15();
}

uint64_t destroy for IntentSystemProtocol(uint64_t a1)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for IntentSystemProtocol(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  return a1;
}

uint64_t assignWithCopy for IntentSystemProtocol(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t assignWithTake for IntentSystemProtocol(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentSystemProtocol(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IntentSystemProtocol(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_247AA8C84(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double sub_247AA8C9C(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

void type metadata accessor for IntentSystemProtocol()
{
}

uint64_t sub_247AA8CD4(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t sub_247AA8CF8(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    *(unsigned char *)a1 = *(unsigned char *)a2;
  }
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t sub_247AA8D88(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(unsigned char *)a1 = *(unsigned char *)a2;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t sub_247AA8E50(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(unsigned char *)a1 = *(unsigned char *)a2;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t sub_247AA8EE8(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_247AA8F24(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)double result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247AA8F70(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_247AA8F8C(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

void type metadata accessor for IntentSystemProtocol.CodableWrapper()
{
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.CodingKeys()
{
  return &type metadata for IntentSystemProtocol.CodingKeys;
}

unint64_t sub_247AA8FD8()
{
  unint64_t result = qword_26929BEC8;
  if (!qword_26929BEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BEC8);
  }
  return result;
}

uint64_t sub_247AA9024()
{
  return sub_247AA7808(*v0);
}

uint64_t sub_247AA902C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AA7714(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AA9054(uint64_t a1)
{
  unint64_t v2 = sub_247AA928C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA9090(uint64_t a1)
{
  unint64_t v2 = sub_247AA928C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA90CC(uint64_t a1)
{
  unint64_t v2 = sub_247AA9634();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA9108(uint64_t a1)
{
  unint64_t v2 = sub_247AA9634();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA9144(uint64_t a1)
{
  unint64_t v2 = sub_247AA95D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA9180(uint64_t a1)
{
  unint64_t v2 = sub_247AA95D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247AA91BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_247AA7AB4(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_247AA91D4()
{
}

unint64_t sub_247AA91F0()
{
  unint64_t result = qword_26929BED0;
  if (!qword_26929BED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BED0);
  }
  return result;
}

unint64_t sub_247AA9240()
{
  unint64_t result = qword_26929BED8;
  if (!qword_26929BED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BED8);
  }
  return result;
}

unint64_t sub_247AA928C()
{
  unint64_t result = qword_26929BEF8;
  if (!qword_26929BEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BEF8);
  }
  return result;
}

uint64_t sub_247AA92D8(uint64_t a1)
{
  unint64_t v2 = sub_247AA9CB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA9314(uint64_t a1)
{
  unint64_t v2 = sub_247AA9CB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA9350()
{
  return sub_247AA81AC(*v0);
}

uint64_t sub_247AA9358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AA7FE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AA9380@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AA81A4();
  *a1 = result;
  return result;
}

uint64_t sub_247AA93A8(uint64_t a1)
{
  unint64_t v2 = sub_247AA9C6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA93E4(uint64_t a1)
{
  unint64_t v2 = sub_247AA9C6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA9420(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D50();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA945C(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D50();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA9498(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA94D4(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AA9510(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AA954C(uint64_t a1)
{
  unint64_t v2 = sub_247AA9D04();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_247AA9588(unsigned char *a1@<X8>)
{
  sub_247AA8538();
  if (!v1) {
    *a1 = v3;
  }
}

void sub_247AA95B4()
{
}

unint64_t sub_247AA95D0()
{
  unint64_t result = qword_26929BF00;
  if (!qword_26929BF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF00);
  }
  return result;
}

_OWORD *sub_247AA961C(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

unint64_t sub_247AA9634()
{
  unint64_t result = qword_26929BF08;
  if (!qword_26929BF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF08);
  }
  return result;
}

unint64_t sub_247AA9680()
{
  unint64_t result = qword_26929BF10;
  if (!qword_26929BF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF10);
  }
  return result;
}

uint64_t sub_247AA96CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_247AA9704()
{
  unint64_t result = qword_26929BF30;
  if (!qword_26929BF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF30);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for IntentSystemProtocol.CodableWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AA981CLL);
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

ValueMetadata *type metadata accessor for IntentSystemProtocol.CodableWrapper.CodingKeys()
{
  return &type metadata for IntentSystemProtocol.CodableWrapper.CodingKeys;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.CodableWrapper.PrimitiveCodingKeys()
{
  return &type metadata for IntentSystemProtocol.CodableWrapper.PrimitiveCodingKeys;
}

unsigned char *_s16AppIntentSchemas20IntentSystemProtocolO10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247AA9900);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.CodableWrapper.SchemaCodingKeys()
{
  return &type metadata for IntentSystemProtocol.CodableWrapper.SchemaCodingKeys;
}

void type metadata accessor for IntentSystemProtocol.PrimitiveWrapper()
{
}

unint64_t sub_247AA9950()
{
  unint64_t result = qword_26929BF38;
  if (!qword_26929BF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF38);
  }
  return result;
}

unint64_t sub_247AA99A0()
{
  unint64_t result = qword_26929BF40;
  if (!qword_26929BF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF40);
  }
  return result;
}

unint64_t sub_247AA99F0()
{
  unint64_t result = qword_26929BF48;
  if (!qword_26929BF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF48);
  }
  return result;
}

unint64_t sub_247AA9A40()
{
  unint64_t result = qword_26929BF50;
  if (!qword_26929BF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF50);
  }
  return result;
}

unint64_t sub_247AA9A90()
{
  unint64_t result = qword_26929BF58;
  if (!qword_26929BF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF58);
  }
  return result;
}

unint64_t sub_247AA9AE0()
{
  unint64_t result = qword_26929BF60;
  if (!qword_26929BF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF60);
  }
  return result;
}

unint64_t sub_247AA9B30()
{
  unint64_t result = qword_26929BF68;
  if (!qword_26929BF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF68);
  }
  return result;
}

unint64_t sub_247AA9B80()
{
  unint64_t result = qword_26929BF70;
  if (!qword_26929BF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF70);
  }
  return result;
}

unint64_t sub_247AA9BD0()
{
  unint64_t result = qword_26929BF78;
  if (!qword_26929BF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF78);
  }
  return result;
}

unint64_t sub_247AA9C20()
{
  unint64_t result = qword_26929BF80;
  if (!qword_26929BF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BF80);
  }
  return result;
}

unint64_t sub_247AA9C6C()
{
  unint64_t result = qword_26929BFB0;
  if (!qword_26929BFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BFB0);
  }
  return result;
}

unint64_t sub_247AA9CB8()
{
  unint64_t result = qword_26929BFB8;
  if (!qword_26929BFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BFB8);
  }
  return result;
}

unint64_t sub_247AA9D04()
{
  unint64_t result = qword_26929BFC0;
  if (!qword_26929BFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BFC0);
  }
  return result;
}

unint64_t sub_247AA9D50()
{
  unint64_t result = qword_26929BFC8;
  if (!qword_26929BFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BFC8);
  }
  return result;
}

unint64_t sub_247AA9D9C()
{
  unint64_t result = qword_26929BFD0;
  if (!qword_26929BFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929BFD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EnumSchema.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s16AppIntentSchemas20IntentSystemProtocolO16PrimitiveWrapperO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AA9F3CLL);
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

ValueMetadata *type metadata accessor for IntentSystemProtocol.PrimitiveWrapper.CodingKeys()
{
  return &type metadata for IntentSystemProtocol.PrimitiveWrapper.CodingKeys;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.PrimitiveWrapper.OpenCodingKeys()
{
  return &type metadata for IntentSystemProtocol.PrimitiveWrapper.OpenCodingKeys;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.PrimitiveWrapper.DeleteCodingKeys()
{
  return &type metadata for IntentSystemProtocol.PrimitiveWrapper.DeleteCodingKeys;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.PrimitiveWrapper.SearchCodingKeys()
{
  return &type metadata for IntentSystemProtocol.PrimitiveWrapper.SearchCodingKeys;
}

ValueMetadata *type metadata accessor for IntentSystemProtocol.PrimitiveWrapper.AudioStartingCodingKeys()
{
  return &type metadata for IntentSystemProtocol.PrimitiveWrapper.AudioStartingCodingKeys;
}

unint64_t sub_247AA9FB8()
{
  unint64_t result = qword_26929C000;
  if (!qword_26929C000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C000);
  }
  return result;
}

unint64_t sub_247AAA008()
{
  unint64_t result = qword_26929C008;
  if (!qword_26929C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C008);
  }
  return result;
}

unint64_t sub_247AAA058()
{
  unint64_t result = qword_26929C010;
  if (!qword_26929C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C010);
  }
  return result;
}

unint64_t sub_247AAA0A8()
{
  unint64_t result = qword_26929C018;
  if (!qword_26929C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C018);
  }
  return result;
}

unint64_t sub_247AAA0F8()
{
  unint64_t result = qword_26929C020;
  if (!qword_26929C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C020);
  }
  return result;
}

unint64_t sub_247AAA148()
{
  unint64_t result = qword_26929C028;
  if (!qword_26929C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C028);
  }
  return result;
}

unint64_t sub_247AAA198()
{
  unint64_t result = qword_26929C030;
  if (!qword_26929C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C030);
  }
  return result;
}

unint64_t sub_247AAA1E8()
{
  unint64_t result = qword_26929C038;
  if (!qword_26929C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C038);
  }
  return result;
}

unint64_t sub_247AAA238()
{
  unint64_t result = qword_26929C040;
  if (!qword_26929C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C040);
  }
  return result;
}

unint64_t sub_247AAA288()
{
  unint64_t result = qword_26929C048;
  if (!qword_26929C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C048);
  }
  return result;
}

unint64_t sub_247AAA2D8()
{
  unint64_t result = qword_26929C050;
  if (!qword_26929C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C050);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_247AB7630();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_247AB75B0();
}

uint64_t EnumSchema.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnumSchema._displayRepresentation.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnumSchema._cases.getter()
{
  return swift_bridgeObjectRetain();
}

void EnumSchema._visibility.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

uint64_t EnumSchema.init(_:displayRepresentation:cases:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  uint64_t result = a5();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = result;
  *(unsigned char *)(a6 + 40) = 1;
  return result;
}

uint64_t static EnumSchema.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  int v9 = *(unsigned __int8 *)(a2 + 40);
  BOOL v10 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v10 || (v11 = sub_247AB7690(), uint64_t result = 0, (v11 & 1) != 0))
  {
    BOOL v13 = v2 == v6 && v4 == v7;
    if (v13 || (v14 = sub_247AB7690(), uint64_t result = 0, (v14 & 1) != 0))
    {
      if (sub_247A98358(v3, v8)) {
        return v5 ^ v9 ^ 1u;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_247AAA524(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000247ABE0D0 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x73657361635FLL && a2 == 0xE600000000000000;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6C6962697369765FLL && a2 == 0xEB00000000797469)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_247AB7690();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_247AAA6C8(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x73657361635FLL;
      break;
    case 3:
      unint64_t result = 0x6C6962697369765FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_247AAA758()
{
  return sub_247AAA6C8(*v0);
}

uint64_t sub_247AAA760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AAA524(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AAA788(uint64_t a1)
{
  unint64_t v2 = sub_247AAAA20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AAA7C4(uint64_t a1)
{
  unint64_t v2 = sub_247AAAA20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EnumSchema.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C058);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v16 = *(void *)(v1 + 24);
  uint64_t v17 = v9;
  uint64_t v15 = *(void *)(v1 + 32);
  HIDWORD(v14) = *(unsigned __int8 *)(v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAAA20();
  sub_247AB7720();
  char v24 = 0;
  uint64_t v10 = v18;
  sub_247AB7660();
  if (!v10)
  {
    uint64_t v11 = v15;
    char v12 = BYTE4(v14);
    char v23 = 1;
    sub_247AB7660();
    uint64_t v19 = v11;
    char v22 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C068);
    sub_247AAAE1C(&qword_26929C070, (void (*)(void))sub_247AAAA6C);
    sub_247AB7680();
    char v21 = v12;
    char v20 = 3;
    sub_247AAAAB8();
    sub_247AB7680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_247AAAA20()
{
  unint64_t result = qword_26929C060;
  if (!qword_26929C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C060);
  }
  return result;
}

unint64_t sub_247AAAA6C()
{
  unint64_t result = qword_26929C078;
  if (!qword_26929C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C078);
  }
  return result;
}

unint64_t sub_247AAAAB8()
{
  unint64_t result = qword_26929C080;
  if (!qword_26929C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C080);
  }
  return result;
}

uint64_t EnumSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C088);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAAA20();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_247AB75F0();
  uint64_t v8 = v7;
  uint64_t v15 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_247AB75F0();
  uint64_t v16 = v10;
  uint64_t v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C068);
  sub_247AAAE1C(&qword_26929C090, (void (*)(void))sub_247AAAE8C);
  swift_bridgeObjectRetain();
  sub_247AB7610();
  sub_247AAAED8();
  swift_bridgeObjectRetain();
  sub_247AB7610();
  uint64_t v12 = OUTLINED_FUNCTION_0_2();
  v13(v12);
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = v17;
  *(unsigned char *)(a2 + 40) = v18;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AAAE1C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929C068);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247AAAE8C()
{
  unint64_t result = qword_26929C098;
  if (!qword_26929C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C098);
  }
  return result;
}

unint64_t sub_247AAAED8()
{
  unint64_t result = qword_26929C0A0;
  if (!qword_26929C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0A0);
  }
  return result;
}

uint64_t sub_247AAAF28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EnumSchema.init(from:)(a1, a2);
}

uint64_t sub_247AAAF40(void *a1)
{
  return EnumSchema.encode(to:)(a1);
}

uint64_t EnumSchema.init<A>(_:displayRepresentation:cases:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_247AB7500();
  uint64_t v13 = a4(v12);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a1, a5);
  *(void *)a6 = v15;
  *(void *)(a6 + 8) = v16;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = v13;
  *(unsigned char *)(a6 + 40) = 0;
  return result;
}

uint64_t destroy for EnumSchema()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EnumSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EnumSchema(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for EnumSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnumSchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnumSchema(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumSchema()
{
  return &type metadata for EnumSchema;
}

unsigned char *storeEnumTagSinglePayload for EnumSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AAB320);
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

ValueMetadata *type metadata accessor for EnumSchema.CodingKeys()
{
  return &type metadata for EnumSchema.CodingKeys;
}

unint64_t sub_247AAB35C()
{
  unint64_t result = qword_26929C0A8;
  if (!qword_26929C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0A8);
  }
  return result;
}

unint64_t sub_247AAB3AC()
{
  unint64_t result = qword_26929C0B0;
  if (!qword_26929C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0B0);
  }
  return result;
}

unint64_t sub_247AAB3FC()
{
  unint64_t result = qword_26929C0B8;
  if (!qword_26929C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return v0;
}

uint64_t EntitySchema.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EntitySchema._displayRepresentation.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EntitySchema._properties.getter()
{
  return swift_bridgeObjectRetain();
}

void EntitySchema._systemProtocol.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

void EntitySchema._visibility.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 41);
}

uint64_t EntitySchema.init(_:displayRepresentation:systemProtocol:properties:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X8>)
{
  char v12 = *a5;
  uint64_t result = a6();
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = result;
  *(unsigned char *)(a7 + 40) = v12;
  *(unsigned char *)(a7 + 41) = 1;
  return result;
}

uint64_t static EntitySchema.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  int v10 = *(unsigned __int8 *)(a2 + 40);
  int v11 = *(unsigned __int8 *)(a2 + 41);
  BOOL v12 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v12 || (v13 = sub_247AB7690(), uint64_t result = 0, (v13 & 1) != 0))
  {
    BOOL v15 = v2 == v7 && v4 == v8;
    if (v15 || (v16 = sub_247AB7690(), uint64_t result = 0, (v16 & 1) != 0))
    {
      if ((sub_247A98168(v3, v9) & 1) == 0) {
        return 0;
      }
      if (v5)
      {
        if (!v10) {
          return 0;
        }
      }
      else if (v10)
      {
        return 0;
      }
      return v6 ^ v11 ^ 1u;
    }
  }
  return result;
}

uint64_t sub_247AAB638(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000247ABE0D0 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x747265706F72705FLL && a2 == 0xEB00000000736569;
    if (v6 || (sub_247AB7690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x506D65747379735FLL && a2 == 0xEF6C6F636F746F72;
      if (v7 || (sub_247AB7690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6C6962697369765FLL && a2 == 0xEB00000000797469)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_247AB7690();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t sub_247AAB880()
{
  return 5;
}

unint64_t sub_247AAB888(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x747265706F72705FLL;
      break;
    case 3:
      unint64_t result = 0x506D65747379735FLL;
      break;
    case 4:
      unint64_t result = 0x6C6962697369765FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_247AAB94C()
{
  return sub_247AAB888(*v0);
}

uint64_t sub_247AAB954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AAB638(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AAB97C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AAB880();
  *a1 = result;
  return result;
}

uint64_t sub_247AAB9A4(uint64_t a1)
{
  unint64_t v2 = sub_247AABC7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AAB9E0(uint64_t a1)
{
  unint64_t v2 = sub_247AABC7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EntitySchema.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C0C0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v19 = v9;
  uint64_t v17 = *(void *)(v1 + 32);
  LODWORD(v9) = *(unsigned __int8 *)(v1 + 40);
  int v15 = *(unsigned __int8 *)(v1 + 41);
  int v16 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AABC7C();
  sub_247AB7720();
  char v28 = 0;
  uint64_t v10 = v20;
  sub_247AB7660();
  if (!v10)
  {
    uint64_t v11 = v17;
    char v12 = v15;
    char v13 = v16;
    char v27 = 1;
    sub_247AB7660();
    uint64_t v21 = v11;
    char v26 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C0D0);
    sub_247AAC0C4(&qword_26929C0D8, (void (*)(void))sub_247AABCC8);
    sub_247AB7680();
    char v25 = v13;
    char v24 = 3;
    sub_247AABD14();
    sub_247AB7650();
    char v23 = v12;
    char v22 = 4;
    sub_247AAAAB8();
    sub_247AB7680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_247AABC7C()
{
  unint64_t result = qword_26929C0C8;
  if (!qword_26929C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0C8);
  }
  return result;
}

unint64_t sub_247AABCC8()
{
  unint64_t result = qword_26929C0E0;
  if (!qword_26929C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0E0);
  }
  return result;
}

unint64_t sub_247AABD14()
{
  unint64_t result = qword_26929C0E8;
  if (!qword_26929C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C0E8);
  }
  return result;
}

uint64_t EntitySchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C0F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AABC7C();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_247AB75F0();
  uint64_t v8 = v7;
  uint64_t v15 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_247AB75F0();
  uint64_t v16 = v10;
  uint64_t v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C0D0);
  sub_247AAC0C4(&qword_26929C0F8, (void (*)(void))sub_247AAC134);
  swift_bridgeObjectRetain();
  sub_247AB7610();
  sub_247AAC180();
  swift_bridgeObjectRetain();
  sub_247AB75E0();
  sub_247AAAED8();
  sub_247AB7610();
  uint64_t v12 = OUTLINED_FUNCTION_0_3();
  v13(v12);
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = v17;
  *(unsigned char *)(a2 + 40) = v19;
  *(unsigned char *)(a2 + 41) = v18;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AAC0C4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929C0D0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247AAC134()
{
  unint64_t result = qword_26929C100;
  if (!qword_26929C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C100);
  }
  return result;
}

unint64_t sub_247AAC180()
{
  unint64_t result = qword_26929C108;
  if (!qword_26929C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C108);
  }
  return result;
}

uint64_t sub_247AAC1D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EntitySchema.init(from:)(a1, a2);
}

uint64_t sub_247AAC1E8(void *a1)
{
  return EntitySchema.encode(to:)(a1);
}

uint64_t EntitySchema.init<A>(_:displayRepresentation:systemProtocol:properties:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t (*a5)(uint64_t)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char v12 = *a4;
  uint64_t v13 = sub_247AB7500();
  uint64_t v14 = a5(v13);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 8))(a1, a6);
  *(void *)a7 = v17;
  *(void *)(a7 + 8) = v18;
  *(void *)(a7 + 16) = a2;
  *(void *)(a7 + 24) = a3;
  *(void *)(a7 + 32) = v14;
  *(unsigned char *)(a7 + 40) = v12;
  *(unsigned char *)(a7 + 41) = 0;
  return result;
}

uint64_t EntitySchema.properties(properties:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v7 = v2[3];
  char v9 = *((unsigned char *)v2 + 40);
  char v10 = *((unsigned char *)v2 + 41);
  swift_bridgeObjectRetain();
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t result = a1(v11);
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = result;
  *(unsigned char *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 41) = v10;
  return result;
}

uint64_t initializeWithCopy for EntitySchema(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EntitySchema(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  return a1;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for EntitySchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  return a1;
}

uint64_t getEnumTagSinglePayload for EntitySchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 42))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntitySchema(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 42) = 1;
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
    *(unsigned char *)(result + 42) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EntitySchema()
{
  return &type metadata for EntitySchema;
}

uint64_t getEnumTagSinglePayload for EntitySchema.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EntitySchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AAC6CCLL);
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

ValueMetadata *type metadata accessor for EntitySchema.CodingKeys()
{
  return &type metadata for EntitySchema.CodingKeys;
}

unint64_t sub_247AAC708()
{
  unint64_t result = qword_26929C110;
  if (!qword_26929C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C110);
  }
  return result;
}

unint64_t sub_247AAC758()
{
  unint64_t result = qword_26929C118;
  if (!qword_26929C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C118);
  }
  return result;
}

unint64_t sub_247AAC7A8()
{
  unint64_t result = qword_26929C120;
  if (!qword_26929C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C120);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return v0;
}

uint64_t dispatch thunk of Schema.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for SchemaWrapper()
{
  return &type metadata for SchemaWrapper;
}

uint64_t sub_247AAC830(uint64_t a1, uint64_t a2)
{
  sub_247A935FC(a1, (uint64_t)v17);
  sub_247A935FC(a2, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
  if (OUTLINED_FUNCTION_4_2())
  {
    if (OUTLINED_FUNCTION_3_3())
    {
      BOOL v3 = __src[0] == v15[0] && __src[1] == v15[1];
      if (v3 || (sub_247AB7690())
        && (__src[2] == v15[2] ? (BOOL v4 = __src[3] == v15[3]) : (BOOL v4 = 0), v4 || (sub_247AB7690() & 1) != 0))
      {
        char v5 = sub_247A98358(__src[4], v15[4]);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v5) {
          char v6 = LOBYTE(__src[5]) ^ LOBYTE(v15[5]) ^ 1;
        }
        else {
          char v6 = 0;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v6 = 0;
      }
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (OUTLINED_FUNCTION_4_2())
  {
    if (OUTLINED_FUNCTION_3_3())
    {
      __dst[0] = __src[0];
      __dst[1] = __src[1];
      __dst[2] = __src[2];
      __dst[3] = __src[3];
      __dst[4] = __src[4];
      LOWORD(__dst[5]) = __src[5];
      v13[0] = v15[0];
      v13[1] = v15[1];
      _OWORD v13[2] = v15[2];
      void v13[3] = v15[3];
      v13[4] = v15[4];
      LOWORD(v13[5]) = v15[5];
      char v6 = static EntitySchema.== infix(_:_:)((uint64_t)__dst, (uint64_t)v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_28:
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (!OUTLINED_FUNCTION_4_2())
  {
LABEL_25:
    if (OUTLINED_FUNCTION_4_2())
    {
      uint64_t v7 = __src[0];
      uint64_t v8 = __src[1];
      char v9 = __src[2];
      char v10 = BYTE1(__src[2]);
      uint64_t v11 = __src[3];
      if (OUTLINED_FUNCTION_3_3())
      {
        __dst[0] = v7;
        __dst[1] = v8;
        LOBYTE(__dst[2]) = v9;
        BYTE1(__dst[2]) = v10;
        __dst[3] = v11;
        v13[0] = v15[0];
        v13[1] = v15[1];
        LOWORD(v13[2]) = v15[2];
        void v13[3] = v15[3];
        char v6 = static VersionedSchema.== infix(_:_:)((uint64_t)__dst, (uint64_t)v13);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_247AADB6C((uint64_t)v17);
    char v6 = 0;
    return v6 & 1;
  }
  if (!OUTLINED_FUNCTION_3_3())
  {
    sub_247AADA34((uint64_t)__src);
    goto LABEL_25;
  }
  memcpy(__dst, __src, 0xC9uLL);
  memcpy(v13, v15, 0xC9uLL);
  char v6 = static IntentSchema.== infix(_:_:)(__dst, v13);
  sub_247AADA34((uint64_t)v13);
  sub_247AADA34((uint64_t)__dst);
LABEL_30:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v6 & 1;
}

uint64_t sub_247AACBEC()
{
  uint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

unint64_t sub_247AACC44(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_247AACC54(uint64_t result)
{
  return result;
}

uint64_t sub_247AACC5C()
{
  return sub_247AB37C8();
}

uint64_t sub_247AACC64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AACBEC();
  *a1 = result;
  return result;
}

uint64_t sub_247AACC94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AACC40();
  *a1 = result;
  return result;
}

uint64_t sub_247AACCBC(uint64_t a1)
{
  unint64_t v2 = sub_247AAD650();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AACCF8(uint64_t a1)
{
  unint64_t v2 = sub_247AAD650();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AACD34()
{
  return sub_247AB37E8();
}

uint64_t sub_247AACD3C()
{
  return sub_247AB3C98();
}

unint64_t sub_247AACD44@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_247AACC44(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_247AACD70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247AACC54(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_247AACD9C()
{
  return sub_247AB7540();
}

uint64_t sub_247AACDFC()
{
  return sub_247AB7520();
}

uint64_t sub_247AACE4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C128);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAD650();
  sub_247AB7710();
  if (!v2)
  {
    char v21 = 0;
    sub_247AAD69C();
    sub_247AB7610();
    switch((char)v16)
    {
      case 1:
        OUTLINED_FUNCTION_12();
        uint64_t v17 = &type metadata for EntitySchema;
        uint64_t v18 = &protocol witness table for EntitySchema;
        uint64_t v7 = swift_allocObject();
        OUTLINED_FUNCTION_9_1(v7);
        sub_247AAD8A8();
        goto LABEL_6;
      case 2:
        OUTLINED_FUNCTION_12();
        uint64_t v17 = &type metadata for IntentSchema;
        uint64_t v18 = &protocol witness table for IntentSchema;
        uint64_t v8 = swift_allocObject();
        OUTLINED_FUNCTION_9_1(v8);
        sub_247AAD854();
        goto LABEL_6;
      case 3:
        OUTLINED_FUNCTION_12();
        uint64_t v17 = &type metadata for VersionedSchema;
        uint64_t v18 = &protocol witness table for VersionedSchema;
        uint64_t v11 = swift_allocObject();
        OUTLINED_FUNCTION_9_1(v11);
        sub_247AAD728();
        OUTLINED_FUNCTION_5_3();
        uint64_t v12 = OUTLINED_FUNCTION_2_1();
        v13(v12);
        goto LABEL_8;
      default:
        OUTLINED_FUNCTION_12();
        uint64_t v17 = &type metadata for EnumSchema;
        uint64_t v18 = &protocol witness table for EnumSchema;
        uint64_t v6 = swift_allocObject();
        OUTLINED_FUNCTION_9_1(v6);
        sub_247AAD950();
LABEL_6:
        OUTLINED_FUNCTION_5_3();
        uint64_t v9 = OUTLINED_FUNCTION_1_4();
        v10(v9);
LABEL_8:
        sub_247A95CE8(&v16, (uint64_t)v19);
        long long v14 = v19[1];
        *(_OWORD *)a2 = v19[0];
        *(_OWORD *)(a2 + 16) = v14;
        *(void *)(a2 + 32) = v20;
        break;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247AAD0F8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C160);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAD650();
  sub_247AB7720();
  uint64_t v11 = (void *)v3;
  sub_247A935FC(v3, (uint64_t)v53);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
  int v12 = OUTLINED_FUNCTION_2_9();
  uint64_t v48 = v7;
  if (v12)
  {
    uint64_t v13 = v52[1];
    uint64_t v14 = v52[3];
    uint64_t v46 = v52[2];
    uint64_t v47 = (char *)v52[0];
    uint64_t v15 = v52[4];
    char v16 = v52[5];
    v50[0] = 0;
    char v51 = 0;
    sub_247AAD99C();
    OUTLINED_FUNCTION_11_0();
    uint64_t v17 = v54;
    sub_247AB7680();
    if (!v17)
    {
      *(void *)uint64_t v50 = v47;
      *(void *)&v50[8] = v13;
      *(void *)&v50[16] = v46;
      *(void *)&v50[24] = v14;
      *(void *)&v50[32] = v15;
      v50[40] = v16;
      OUTLINED_FUNCTION_13_0();
      sub_247AADB20();
      OUTLINED_FUNCTION_11_0();
      sub_247AB7680();
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v10, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  }
  uint64_t v46 = v5;
  uint64_t v18 = v54;
  uint64_t v47 = v10;
  if (OUTLINED_FUNCTION_2_9())
  {
    uint64_t v19 = v52[1];
    uint64_t v20 = v52[3];
    uint64_t v44 = v52[2];
    uint64_t v45 = v52[0];
    uint64_t v21 = v52[4];
    char v22 = v52[5];
    char v23 = BYTE1(v52[5]);
    v50[0] = 1;
    char v51 = 0;
    sub_247AAD99C();
    OUTLINED_FUNCTION_7_2();
    if (!v2)
    {
      *(void *)uint64_t v50 = v45;
      *(void *)&v50[8] = v19;
      *(void *)&v50[16] = v44;
      *(void *)&v50[24] = v20;
      *(void *)&v50[32] = v21;
      v50[40] = v22;
      v50[41] = v23;
      OUTLINED_FUNCTION_13_0();
      sub_247AADAD4();
      OUTLINED_FUNCTION_10_1();
    }
    uint64_t v24 = OUTLINED_FUNCTION_1_10();
    v25(v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (!OUTLINED_FUNCTION_2_9())
  {
    if (!OUTLINED_FUNCTION_2_9())
    {
      uint64_t v36 = sub_247AB7590();
      swift_allocError();
      uint64_t v38 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26929B4E0);
      uint64_t v39 = v11;
      uint64_t v40 = v11[3];
      uint64_t v41 = __swift_project_boxed_opaque_existential_1(v39, v40);
      v38[3] = v40;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v38);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v40 - 8) + 16))(boxed_opaque_existential_0, v41, v40);
      sub_247AB7560();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCE0], v36);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v46);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    }
    uint64_t v30 = v52[0];
    uint64_t v29 = v52[1];
    char v31 = v52[2];
    char v32 = BYTE1(v52[2]);
    uint64_t v33 = v52[3];
    v50[0] = 3;
    char v51 = 0;
    sub_247AAD99C();
    OUTLINED_FUNCTION_7_2();
    if (!v2)
    {
      *(void *)uint64_t v50 = v30;
      *(void *)&v50[8] = v29;
      v50[16] = v31;
      v50[17] = v32;
      *(void *)&v50[24] = v33;
      OUTLINED_FUNCTION_13_0();
      sub_247AAD9E8();
      OUTLINED_FUNCTION_10_1();
    }
    uint64_t v34 = OUTLINED_FUNCTION_1_10();
    v35(v34);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  memcpy(v50, v52, sizeof(v50));
  char v51 = 2;
  char v49 = 0;
  sub_247AAD99C();
  uint64_t v28 = v46;
  char v27 = v47;
  sub_247AB7680();
  if (v18)
  {
    sub_247AADA34((uint64_t)v50);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v28);
  }
  else
  {
    OUTLINED_FUNCTION_13_0();
    sub_247AADA88();
    sub_247AB7680();
    uint64_t v43 = v48;
    sub_247AADA34((uint64_t)v50);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v27, v28);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
}

uint64_t sub_247AAD61C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247AACE4C(a1, a2);
}

uint64_t sub_247AAD634(void *a1)
{
  return sub_247AAD0F8(a1);
}

unint64_t sub_247AAD650()
{
  unint64_t result = qword_26929C130;
  if (!qword_26929C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C130);
  }
  return result;
}

unint64_t sub_247AAD69C()
{
  unint64_t result = qword_26929C138;
  if (!qword_26929C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C138);
  }
  return result;
}

uint64_t sub_247AAD6E8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_247AAD728()
{
  unint64_t result = qword_26929C140;
  if (!qword_26929C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C140);
  }
  return result;
}

uint64_t sub_247AAD774()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 96)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 144) >= 5uLL) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  }
  switch(*(unsigned char *)(v0 + 200))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(v0 + 160);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 217, 7);
}

unint64_t sub_247AAD854()
{
  unint64_t result = qword_26929C148;
  if (!qword_26929C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C148);
  }
  return result;
}

uint64_t sub_247AAD8A0()
{
  return objectdestroy_5Tm(58);
}

unint64_t sub_247AAD8A8()
{
  unint64_t result = qword_26929C150;
  if (!qword_26929C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C150);
  }
  return result;
}

uint64_t sub_247AAD8F4()
{
  return objectdestroy_5Tm(57);
}

uint64_t objectdestroy_5Tm(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

unint64_t sub_247AAD950()
{
  unint64_t result = qword_26929C158;
  if (!qword_26929C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C158);
  }
  return result;
}

unint64_t sub_247AAD99C()
{
  unint64_t result = qword_26929C168;
  if (!qword_26929C168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C168);
  }
  return result;
}

unint64_t sub_247AAD9E8()
{
  unint64_t result = qword_26929C170;
  if (!qword_26929C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C170);
  }
  return result;
}

uint64_t sub_247AADA34(uint64_t a1)
{
  return a1;
}

unint64_t sub_247AADA88()
{
  unint64_t result = qword_26929C178;
  if (!qword_26929C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C178);
  }
  return result;
}

unint64_t sub_247AADAD4()
{
  unint64_t result = qword_26929C180;
  if (!qword_26929C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C180);
  }
  return result;
}

unint64_t sub_247AADB20()
{
  unint64_t result = qword_26929C188;
  if (!qword_26929C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C188);
  }
  return result;
}

uint64_t sub_247AADB6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C190);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for SchemaWrapper.Base(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AADC98);
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

ValueMetadata *type metadata accessor for SchemaWrapper.Base()
{
  return &type metadata for SchemaWrapper.Base;
}

unsigned char *storeEnumTagSinglePayload for SchemaWrapper.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AADD9CLL);
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

ValueMetadata *type metadata accessor for SchemaWrapper.CodingKeys()
{
  return &type metadata for SchemaWrapper.CodingKeys;
}

unint64_t sub_247AADDD8()
{
  unint64_t result = qword_26929C198;
  if (!qword_26929C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C198);
  }
  return result;
}

unint64_t sub_247AADE28()
{
  unint64_t result = qword_26929C1A0;
  if (!qword_26929C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1A0);
  }
  return result;
}

unint64_t sub_247AADE78()
{
  unint64_t result = qword_26929C1A8;
  if (!qword_26929C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1A8);
  }
  return result;
}

unint64_t sub_247AADEC8()
{
  unint64_t result = qword_26929C1B0;
  if (!qword_26929C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1B0);
  }
  return result;
}

unint64_t sub_247AADF14()
{
  unint64_t result = qword_26929C1B8;
  if (!qword_26929C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_247AB7610();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_247AB7680();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t result)
{
  *(void *)(v1 - 160) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_247AB7680();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0 + 48;
}

void OUTLINED_FUNCTION_12()
{
  *(unsigned char *)(v0 - 65) = 1;
}

void OUTLINED_FUNCTION_13_0()
{
  *(unsigned char *)(v0 + 255) = 1;
}

uint64_t UtteranceSchema.phrase.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

AppIntentSchemas::UtteranceSchema __swiftcall UtteranceSchema.init(stringLiteral:)(AppIntentSchemas::UtteranceSchema stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t static UtteranceSchema.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_247AB7690();
  }
}

uint64_t sub_247AAE0F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x657361726870 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247AB7690();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247AAE170()
{
  return 0x657361726870;
}

uint64_t sub_247AAE188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AAE0F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247AAE1B4(uint64_t a1)
{
  unint64_t v2 = sub_247AAE328();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AAE1F0(uint64_t a1)
{
  unint64_t v2 = sub_247AAE328();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UtteranceSchema.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C1C0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAE328();
  sub_247AB7720();
  sub_247AB7660();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v1);
}

unint64_t sub_247AAE328()
{
  unint64_t result = qword_26929C1C8;
  if (!qword_26929C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1C8);
  }
  return result;
}

uint64_t UtteranceSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C1D0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAE328();
  sub_247AB7710();
  if (!v2)
  {
    uint64_t v6 = sub_247AB75F0();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_2_5();
    v10(v9);
    *a2 = v6;
    a2[1] = v8;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_247AAE48C()
{
  unint64_t result = qword_26929C1D8;
  if (!qword_26929C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1D8);
  }
  return result;
}

uint64_t sub_247AAE4D8(Swift::String *a1)
{
  return UtteranceSchema.init(stringLiteral:)(*a1).phrase._countAndFlagsBits;
}

uint64_t sub_247AAE4E4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UtteranceSchema.init(from:)(a1, a2);
}

uint64_t sub_247AAE4FC(void *a1)
{
  return UtteranceSchema.encode(to:)(a1);
}

unint64_t sub_247AAE51C()
{
  unint64_t result = qword_26929C1E0;
  if (!qword_26929C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UtteranceSchema()
{
  return &type metadata for UtteranceSchema;
}

unsigned char *storeEnumTagSinglePayload for UtteranceSchema.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247AAE614);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UtteranceSchema.CodingKeys()
{
  return &type metadata for UtteranceSchema.CodingKeys;
}

unint64_t sub_247AAE650()
{
  unint64_t result = qword_26929C1E8;
  if (!qword_26929C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1E8);
  }
  return result;
}

unint64_t sub_247AAE6A0()
{
  unint64_t result = qword_26929C1F0;
  if (!qword_26929C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1F0);
  }
  return result;
}

unint64_t sub_247AAE6F0()
{
  unint64_t result = qword_26929C1F8;
  if (!qword_26929C1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C1F8);
  }
  return result;
}

void static UtteranceBuilder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v4 + 16);
      if (__OFADD__(v7, v6)) {
        break;
      }
      swift_bridgeObjectRetain();
      if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v6 > *(void *)(v4 + 24) >> 1)
      {
        sub_247A8F714();
        uint64_t v4 = v8;
      }
      if (*(void *)(v5 + 16))
      {
        if ((*(void *)(v4 + 24) >> 1) - *(void *)(v4 + 16) < v6) {
          goto LABEL_18;
        }
        swift_arrayInitWithCopy();
        if (v6)
        {
          uint64_t v9 = *(void *)(v4 + 16);
          BOOL v10 = __OFADD__(v9, v6);
          uint64_t v11 = v9 + v6;
          if (v10) {
            goto LABEL_19;
          }
          *(void *)(v4 + 16) = v11;
        }
      }
      else if (v6)
      {
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      if (v1 == ++v3)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
}

uint64_t static UtteranceBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static UtteranceBuilder.buildExpression(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247AB7BC0;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  return v3;
}

ValueMetadata *type metadata accessor for UtteranceBuilder()
{
  return &type metadata for UtteranceBuilder;
}

uint64_t static IntentSchema.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    sub_247AAF11C((uint64_t)a1, (uint64_t)v67);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v64);
  }
  else
  {
    char v5 = sub_247AB7690();
    sub_247AAF11C((uint64_t)a1, (uint64_t)v67);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v64);
    if ((v5 & 1) == 0)
    {
      sub_247AADA34((uint64_t)v67);
      sub_247AADA34((uint64_t)v64);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v61);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v58);
LABEL_13:
      sub_247AADA34((uint64_t)v61);
      sub_247AADA34((uint64_t)v58);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v57);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v56);
LABEL_20:
      sub_247AADA34((uint64_t)v56);
      sub_247AADA34((uint64_t)v57);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v54);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v52);
LABEL_23:
      sub_247AADA34((uint64_t)v52);
      sub_247AADA34((uint64_t)v54);
LABEL_24:
      sub_247AAF11C((uint64_t)a1, (uint64_t)v48);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v46);
LABEL_25:
      sub_247AADA34((uint64_t)v48);
      sub_247AADA34((uint64_t)v46);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v44);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v42);
LABEL_26:
      sub_247AADA34((uint64_t)v42);
      sub_247AADA34((uint64_t)v44);
LABEL_27:
      sub_247AAF11C((uint64_t)a1, (uint64_t)v37);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v35);
LABEL_28:
      sub_247AADA34((uint64_t)v35);
      sub_247AADA34((uint64_t)v37);
LABEL_29:
      sub_247AAF11C((uint64_t)a1, (uint64_t)v31);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v29);
LABEL_30:
      sub_247AADA34((uint64_t)v31);
      sub_247AADA34((uint64_t)v29);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v28);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v27);
      goto LABEL_31;
    }
  }
  if (v68 == v65 && v69 == v66)
  {
    sub_247AADA34((uint64_t)v67);
    sub_247AADA34((uint64_t)v64);
    sub_247AAF11C((uint64_t)a1, (uint64_t)v61);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v58);
  }
  else
  {
    char v7 = sub_247AB7690();
    sub_247AADA34((uint64_t)v67);
    sub_247AADA34((uint64_t)v64);
    sub_247AAF11C((uint64_t)a1, (uint64_t)v61);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v58);
    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
  }
  if (v62 == v59 && v63 == v60)
  {
    sub_247AADA34((uint64_t)v61);
    sub_247AADA34((uint64_t)v58);
    sub_247AAF11C((uint64_t)a1, (uint64_t)v57);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v56);
  }
  else
  {
    char v9 = sub_247AB7690();
    sub_247AADA34((uint64_t)v61);
    sub_247AADA34((uint64_t)v58);
    sub_247AAF11C((uint64_t)a1, (uint64_t)v57);
    sub_247AAF11C((uint64_t)a2, (uint64_t)v56);
    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
  }
  int v10 = v57[48];
  sub_247AADA34((uint64_t)v57);
  int v11 = v56[48];
  sub_247AADA34((uint64_t)v56);
  sub_247AAF11C((uint64_t)a1, (uint64_t)v54);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v52);
  if (v10 != v11) {
    goto LABEL_23;
  }
  sub_247AB007C((uint64_t)&v55, (uint64_t)v48, &qword_26929B378);
  uint64_t v14 = v49;
  if (v49)
  {
    uint64_t v15 = v50;
    __swift_project_boxed_opaque_existential_1(v48, v49);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  }
  else
  {
    sub_247AB002C((uint64_t)v48, &qword_26929B378);
  }
  sub_247AB007C((uint64_t)&v53, (uint64_t)v48, &qword_26929B378);
  uint64_t v16 = v49;
  if (v49)
  {
    uint64_t v17 = v50;
    __swift_project_boxed_opaque_existential_1(v48, v49);
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    if (v14)
    {
      if (v18)
      {
        uint64_t v19 = swift_bridgeObjectRetain();
        char v20 = sub_247A97AF4(v19, v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_247AADA34((uint64_t)v52);
        sub_247AADA34((uint64_t)v54);
        swift_bridgeObjectRelease();
        sub_247AAF11C((uint64_t)a1, (uint64_t)v48);
        sub_247AAF11C((uint64_t)a2, (uint64_t)v46);
        if ((v20 & 1) == 0) {
          goto LABEL_25;
        }
        goto LABEL_47;
      }
LABEL_42:
      swift_bridgeObjectRetain();
      sub_247AADA34((uint64_t)v52);
      sub_247AADA34((uint64_t)v54);
      swift_bridgeObjectRelease_n();
      goto LABEL_24;
    }
  }
  else
  {
    sub_247AB002C((uint64_t)v48, &qword_26929B378);
    if (v14) {
      goto LABEL_42;
    }
    uint64_t v18 = 0;
  }
  sub_247AADA34((uint64_t)v52);
  sub_247AADA34((uint64_t)v54);
  if (v18)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  sub_247AAF11C((uint64_t)a1, (uint64_t)v48);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v46);
LABEL_47:
  char v21 = sub_247A97AF4(v51, v47);
  sub_247AADA34((uint64_t)v48);
  sub_247AADA34((uint64_t)v46);
  sub_247AAF11C((uint64_t)a1, (uint64_t)v44);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v42);
  if ((v21 & 1) == 0) {
    goto LABEL_26;
  }
  sub_247AB007C((uint64_t)&v45, (uint64_t)v37, &qword_26929C210);
  sub_247AB007C((uint64_t)&v43, (uint64_t)v39, &qword_26929C210);
  if (v38 == 4)
  {
    sub_247AADA34((uint64_t)v42);
    sub_247AADA34((uint64_t)v44);
    if (v40 == 4)
    {
      sub_247AB002C((uint64_t)v37, &qword_26929C210);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v37);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v35);
      goto LABEL_55;
    }
LABEL_53:
    sub_247AB002C((uint64_t)v37, &qword_26929C218);
    goto LABEL_27;
  }
  sub_247AB007C((uint64_t)v37, (uint64_t)v35, &qword_26929C210);
  if (v40 == 4)
  {
    sub_247AADA34((uint64_t)v42);
    sub_247AADA34((uint64_t)v44);
    sub_247AA76E4((uint64_t)v35);
    goto LABEL_53;
  }
  sub_247AAF154((uint64_t)v39, (uint64_t)v31);
  char v22 = static IntentSystemProtocol.== infix(_:_:)((uint64_t)v35, (uint64_t)v31);
  sub_247AA76E4((uint64_t)v31);
  sub_247AADA34((uint64_t)v42);
  sub_247AADA34((uint64_t)v44);
  sub_247AA76E4((uint64_t)v35);
  sub_247AB002C((uint64_t)v37, &qword_26929C210);
  sub_247AAF11C((uint64_t)a1, (uint64_t)v37);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v35);
  if ((v22 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_55:
  sub_247AB007C((uint64_t)&v41, (uint64_t)v31, &qword_26929C200);
  sub_247AB007C((uint64_t)&v36, (uint64_t)v32, &qword_26929C200);
  if (v31[40] == 255)
  {
    sub_247AADA34((uint64_t)v35);
    sub_247AADA34((uint64_t)v37);
    if (v33 == 255)
    {
      sub_247AB002C((uint64_t)v31, &qword_26929C200);
      sub_247AAF11C((uint64_t)a1, (uint64_t)v31);
      sub_247AAF11C((uint64_t)a2, (uint64_t)v29);
      goto LABEL_61;
    }
LABEL_64:
    sub_247AB002C((uint64_t)v31, &qword_26929C208);
    goto LABEL_29;
  }
  sub_247AB007C((uint64_t)v31, (uint64_t)v29, &qword_26929C200);
  if (v33 == 255)
  {
    sub_247AADA34((uint64_t)v35);
    sub_247AADA34((uint64_t)v37);
    sub_247A8E0FC((uint64_t)v29);
    goto LABEL_64;
  }
  sub_247A8E1B8((uint64_t)v32, (uint64_t)v28);
  char v23 = static ValueType.== infix(_:_:)(v29, v28);
  sub_247A8E0FC((uint64_t)v28);
  sub_247AADA34((uint64_t)v35);
  sub_247AADA34((uint64_t)v37);
  sub_247A8E0FC((uint64_t)v29);
  sub_247AB002C((uint64_t)v31, &qword_26929C200);
  sub_247AAF11C((uint64_t)a1, (uint64_t)v31);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v29);
  if ((v23 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_61:
  char v24 = sub_247A98358(v34, v30);
  sub_247AADA34((uint64_t)v31);
  sub_247AADA34((uint64_t)v29);
  sub_247AAF11C((uint64_t)a1, (uint64_t)v28);
  sub_247AAF11C((uint64_t)a2, (uint64_t)v27);
  if (v24)
  {
    char v25 = v28[200];
    sub_247AADA34((uint64_t)v28);
    char v26 = v27[200];
    sub_247AADA34((uint64_t)v27);
    char v12 = v25 ^ v26 ^ 1;
    return v12 & 1;
  }
LABEL_31:
  sub_247AADA34((uint64_t)v27);
  sub_247AADA34((uint64_t)v28);
  char v12 = 0;
  return v12 & 1;
}

uint64_t sub_247AAF11C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247AAF154(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IntentSchema.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntentSchema._title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntentSchema._description.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntentSchema._openApp.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t IntentSchema._summary.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247AB007C(v1 + 56, a1, &qword_26929B378);
}

uint64_t IntentSchema._parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntentSchema._systemProtocol.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247AB007C(v1 + 104, a1, &qword_26929C210);
}

uint64_t IntentSchema._result.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247AB007C(v1 + 144, a1, &qword_26929C200);
}

uint64_t IntentSchema._utterances.getter()
{
  return swift_bridgeObjectRetain();
}

void IntentSchema._visibility.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 200);
}

uint64_t IntentSchema.init(_:title:description:parameters:openApp:systemProtocol:result:utterances:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t (*a7)(unsigned char *)@<X6>, uint64_t a8@<X8>, char a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t))
{
  uint64_t v14 = a7(v27);
  sub_247AB007C((uint64_t)v27, (uint64_t)v26, &qword_26929B378);
  sub_247AB007C(a10, (uint64_t)v25, &qword_26929C210);
  uint64_t v15 = sub_247AB007C(a11, (uint64_t)v24, &qword_26929C200);
  uint64_t v16 = a12(v15);
  char v23 = 1;
  sub_247AAF410(a1, a2, a3, a4, a5, a6, (uint64_t)v26, v14, a8, a9, (uint64_t)v25, (uint64_t)v24, v16, &v23);
  sub_247AB002C(a11, &qword_26929C200);
  sub_247AB002C(a10, &qword_26929C210);
  return sub_247AB002C((uint64_t)v27, &qword_26929B378);
}

uint64_t sub_247AAF410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char *a14)
{
  char v18 = *a14;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  sub_247AB007C(a11, (uint64_t)v21, &qword_26929C210);
  if (v22 == 4)
  {
    sub_247AB002C((uint64_t)v21, &qword_26929C210);
  }
  else
  {
    sub_247AA764C((uint64_t)v21, (uint64_t)v20);
    if ((v20[3] | 2) == 2)
    {
      sub_247AA76E4((uint64_t)v21);
      a10 = 1;
    }
    else
    {
      sub_247AA76E4((uint64_t)v20);
      sub_247AA76E4((uint64_t)v21);
    }
  }
  *(unsigned char *)(a9 + 48) = a10 & 1;
  sub_247AB16AC(a7, a9 + 56, &qword_26929B378);
  *(void *)(a9 + 96) = a8;
  sub_247AB16AC(a11, a9 + 104, &qword_26929C210);
  uint64_t result = sub_247AB16AC(a12, a9 + 144, &qword_26929C200);
  *(void *)(a9 + 192) = a13;
  *(unsigned char *)(a9 + 200) = v18;
  return result;
}

uint64_t IntentSchema.init<A>(_:title:description:parameters:openApp:systemProtocol:result:utterances:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t (*a5)(unsigned char *)@<X5>, char a6@<W7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  uint64_t v16 = a5(v29);
  sub_247AB7500();
  uint64_t v10 = v27;
  uint64_t v11 = v28;
  sub_247AB007C((uint64_t)v29, (uint64_t)v26, &qword_26929B378);
  sub_247AB007C(a8, (uint64_t)v25, &qword_26929C210);
  uint64_t v12 = sub_247AB007C(a9, (uint64_t)v24, &qword_26929C200);
  uint64_t v13 = a10(v12);
  char v23 = 0;
  sub_247AAF410(v10, v11, a1, a2, a3, a4, (uint64_t)v26, v16, a7, a6, (uint64_t)v25, (uint64_t)v24, v13, &v23);
  sub_247AB002C(a9, &qword_26929C200);
  sub_247AB002C(a8, &qword_26929C210);
  OUTLINED_FUNCTION_3_2();
  v14();
  return sub_247AB002C((uint64_t)v29, &qword_26929B378);
}

uint64_t IntentSchema.parameters(parameters:)@<X0>(uint64_t (*a1)(unsigned char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v4 = a1(v19);
  uint64_t v5 = *(void *)v3;
  uint64_t v6 = *(void *)(v3 + 8);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(v3 + 32);
  uint64_t v10 = *(void *)(v3 + 40);
  sub_247AB007C((uint64_t)v19, (uint64_t)v18, &qword_26929B378);
  char v11 = *(unsigned char *)(v3 + 48);
  sub_247AB007C(v3 + 104, (uint64_t)v17, &qword_26929C210);
  sub_247AB007C(v3 + 144, (uint64_t)v16, &qword_26929C200);
  uint64_t v12 = *(void *)(v3 + 192);
  char v15 = *(unsigned char *)(v3 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247AAF410(v5, v6, v7, v8, v9, v10, (uint64_t)v18, v4, a2, v11, (uint64_t)v17, (uint64_t)v16, v12, &v15);
  return sub_247AB002C((uint64_t)v19, &qword_26929B378);
}

uint64_t IntentSchema.result(_:)()
{
  uint64_t v2 = OUTLINED_FUNCTION_9_2();
  sub_247AB007C(v2, (uint64_t)v26, &qword_26929B378);
  sub_247AB007C(v0 + 104, (uint64_t)v25, &qword_26929C210);
  sub_247AB007C(v1, (uint64_t)v19, &qword_26929C200);
  OUTLINED_FUNCTION_13_1();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_0_4(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13, v14, v15, v16, v17, v18, SWORD2(v18), SBYTE6(v18), SHIBYTE(v18), v19[0],
           v20,
           v21,
           v22,
           v23,
           v24,
           v25[0]);
}

uint64_t IntentSchema.systemProtocol(_:)()
{
  uint64_t v2 = OUTLINED_FUNCTION_9_2();
  sub_247AB007C(v2, (uint64_t)v26, &qword_26929B378);
  sub_247AB007C(v1, (uint64_t)v25, &qword_26929C210);
  sub_247AB007C(v0 + 144, (uint64_t)v19, &qword_26929C200);
  OUTLINED_FUNCTION_13_1();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_0_4(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13, v14, v15, v16, v17, v18, SWORD2(v18), SBYTE6(v18), SHIBYTE(v18), v19[0],
           v20,
           v21,
           v22,
           v23,
           v24,
           v25[0]);
}

uint64_t IntentSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C220);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = a1[3];
  uint64_t v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v6);
  sub_247AAFF94();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  sub_247AAFFE0();
  OUTLINED_FUNCTION_10_2();
  v19[0] = OUTLINED_FUNCTION_8_0();
  v19[1] = v8;
  _OWORD v19[2] = OUTLINED_FUNCTION_8_0();
  v19[3] = v9;
  LOBYTE(v15) = 2;
  v19[4] = OUTLINED_FUNCTION_8_0();
  v19[5] = v10;
  LOBYTE(v15) = 3;
  char v20 = sub_247AB7600() & 1;
  sub_247AB007C((uint64_t)v18, (uint64_t)&v15, &qword_26929C238);
  if (*((void *)&v16 + 1))
  {
    v13[0] = v15;
    v13[1] = v16;
    uint64_t v14 = v17;
    sub_247A935FC((uint64_t)v13, (uint64_t)v21);
    sub_247AB0170((uint64_t)v13);
  }
  else
  {
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
  LOBYTE(v13[0]) = 5;
  sub_247AB05E4(&qword_26929B330, &qword_26929B310, (void (*)(void))sub_247A9093C);
  OUTLINED_FUNCTION_12_0();
  sub_247AB7610();
  uint64_t v23 = v15;
  LOBYTE(v13[0]) = 6;
  sub_247AB00D8();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_2();
  sub_247AB16AC((uint64_t)&v15, (uint64_t)&v24, &qword_26929C210);
  LOBYTE(v13[0]) = 7;
  sub_247A8EAF8();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_2();
  sub_247AB16AC((uint64_t)&v15, (uint64_t)v25, &qword_26929C200);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C248);
  LOBYTE(v13[0]) = 8;
  sub_247AB05E4(&qword_26929C250, &qword_26929C248, (void (*)(void))sub_247AB0124);
  OUTLINED_FUNCTION_12_0();
  sub_247AB7610();
  v25[6] = v15;
  LOBYTE(v13[0]) = 9;
  sub_247AAAED8();
  OUTLINED_FUNCTION_12_0();
  sub_247AB7610();
  sub_247AB002C((uint64_t)v18, &qword_26929C238);
  uint64_t v11 = OUTLINED_FUNCTION_3_4();
  v12(v11);
  char v26 = v15;
  sub_247AAF11C((uint64_t)v19, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return sub_247AADA34((uint64_t)v19);
}

unint64_t sub_247AAFF94()
{
  unint64_t result = qword_26929C228;
  if (!qword_26929C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C228);
  }
  return result;
}

unint64_t sub_247AAFFE0()
{
  unint64_t result = qword_26929C230;
  if (!qword_26929C230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C230);
  }
  return result;
}

uint64_t sub_247AB002C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_3_2();
  v3();
  return a1;
}

uint64_t sub_247AB007C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_247AB00D8()
{
  unint64_t result = qword_26929C240;
  if (!qword_26929C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C240);
  }
  return result;
}

unint64_t sub_247AB0124()
{
  unint64_t result = qword_26929C258;
  if (!qword_26929C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C258);
  }
  return result;
}

uint64_t sub_247AB0170(uint64_t a1)
{
  return a1;
}

uint64_t IntentSchema.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C260);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAFF94();
  sub_247AB7720();
  LOBYTE(v15[0]) = 0;
  OUTLINED_FUNCTION_7_3();
  if (!v2)
  {
    LOBYTE(v15[0]) = 1;
    OUTLINED_FUNCTION_7_3();
    LOBYTE(v15[0]) = 2;
    OUTLINED_FUNCTION_7_3();
    LOBYTE(v15[0]) = 3;
    sub_247AB7670();
    sub_247AB007C(v3 + 56, (uint64_t)&v13, &qword_26929B378);
    if (v14)
    {
      sub_247A95CE8(&v13, (uint64_t)v15);
      sub_247A935FC((uint64_t)v15, (uint64_t)&v13);
      v12[15] = 4;
      sub_247AB069C();
      sub_247AB7680();
      sub_247AB0170((uint64_t)&v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    }
    else
    {
      sub_247AB002C((uint64_t)&v13, &qword_26929B378);
    }
    v15[0] = *(void *)(v3 + 96);
    LOBYTE(v13) = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B310);
    sub_247AB05E4(&qword_26929B318, &qword_26929B310, (void (*)(void))sub_247A90880);
    OUTLINED_FUNCTION_4_3();
    LOBYTE(v15[0]) = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C210);
    sub_247AB05E4(&qword_26929C268, &qword_26929C210, (void (*)(void))sub_247AB0598);
    OUTLINED_FUNCTION_5_4();
    LOBYTE(v15[0]) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C200);
    sub_247AB05E4(&qword_26929C278, &qword_26929C200, (void (*)(void))sub_247A8E854);
    OUTLINED_FUNCTION_5_4();
    v15[0] = *(void *)(v3 + 192);
    LOBYTE(v13) = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C248);
    sub_247AB05E4(&qword_26929C280, &qword_26929C248, (void (*)(void))sub_247AB0650);
    OUTLINED_FUNCTION_4_3();
    LOBYTE(v15[0]) = *(unsigned char *)(v3 + 200);
    LOBYTE(v13) = 9;
    sub_247AAAAB8();
    sub_247AB7680();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v5);
}

unint64_t sub_247AB0598()
{
  unint64_t result = qword_26929C270;
  if (!qword_26929C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C270);
  }
  return result;
}

uint64_t sub_247AB05E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_247AB0650()
{
  unint64_t result = qword_26929C288;
  if (!qword_26929C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C288);
  }
  return result;
}

unint64_t sub_247AB069C()
{
  unint64_t result = qword_26929C290;
  if (!qword_26929C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C290);
  }
  return result;
}

uint64_t sub_247AB06E8()
{
  unint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_247AB0738()
{
  return 10;
}

uint64_t sub_247AB0740(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656C7469745FLL;
      break;
    case 2:
      uint64_t result = 0x706972637365645FLL;
      break;
    case 3:
      uint64_t result = 0x7070416E65706F5FLL;
      break;
    case 4:
      uint64_t result = 0x7972616D6D75735FLL;
      break;
    case 5:
      uint64_t result = 0x74656D617261705FLL;
      break;
    case 6:
      uint64_t result = 0x506D65747379735FLL;
      break;
    case 7:
      uint64_t result = 0x746C757365725FLL;
      break;
    case 8:
      uint64_t result = 0x6E6172657474755FLL;
      break;
    case 9:
      uint64_t result = 0x6C6962697369765FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247AB089C(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656C7469745FLL;
      break;
    case 2:
      uint64_t result = 0x706972637365645FLL;
      break;
    case 3:
      uint64_t result = 0x7070416E65706F5FLL;
      break;
    case 4:
      uint64_t result = 0x7972616D6D75735FLL;
      break;
    case 5:
      uint64_t result = 0x74656D617261705FLL;
      break;
    case 6:
      uint64_t result = 0x506D65747379735FLL;
      break;
    case 7:
      uint64_t result = 0x746C757365725FLL;
      break;
    case 8:
      uint64_t result = 0x6E6172657474755FLL;
      break;
    case 9:
      uint64_t result = 0x6C6962697369765FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247AB09F8(char *a1, char *a2)
{
  return sub_247AB1DB4(*a1, *a2);
}

uint64_t sub_247AB0A04()
{
  return sub_247AB3828(*v0);
}

uint64_t sub_247AB0A0C()
{
  return sub_247AB3AB4();
}

uint64_t sub_247AB0A14(uint64_t a1)
{
  return sub_247AB3C48(a1, *v1);
}

uint64_t sub_247AB0A1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB06E8();
  *a1 = result;
  return result;
}

uint64_t sub_247AB0A4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247AB0740(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247AB0A78()
{
  return sub_247AB089C(*v0);
}

uint64_t sub_247AB0A80@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB0734();
  *a1 = result;
  return result;
}

uint64_t sub_247AB0AA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB0738();
  *a1 = result;
  return result;
}

uint64_t sub_247AB0AD0(uint64_t a1)
{
  unint64_t v2 = sub_247AAFF94();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB0B0C(uint64_t a1)
{
  unint64_t v2 = sub_247AAFF94();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB0B48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IntentSchema.init(from:)(a1, a2);
}

uint64_t sub_247AB0B60(void *a1)
{
  return IntentSchema.encode(to:)(a1);
}

uint64_t destroy for IntentSchema(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 80)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  }
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 128) >= 5uLL) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  }
  switch(*(unsigned char *)(a1 + 184))
  {
    case 1:
      __swift_destroy_boxed_opaque_existential_1(a1 + 144);
      break;
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 4:
    case 5:
      swift_release();
      break;
    default:
      break;
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntentSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = a2 + 56;
  uint64_t v8 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v8;
    *(void *)(a1 + 88) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8))(a1 + 56, v7, v8);
  }
  else
  {
    long long v10 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)v7;
    *(_OWORD *)(a1 + 72) = v10;
    *(void *)(a1 + 88) = *(void *)(v7 + 32);
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  unint64_t v11 = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  if (v11 <= 4)
  {
    long long v12 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v12;
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
  }
  else
  {
    uint64_t v17 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v11;
    *(void *)(a1 + 136) = v17;
    (**(void (***)(uint64_t, uint64_t, unint64_t))(v11 - 8))(a1 + 104, a2 + 104, v11);
  }
  long long v13 = (_OWORD *)(a1 + 144);
  uint64_t v14 = (void *)(a2 + 144);
  switch(*(unsigned char *)(a2 + 184))
  {
    case 1:
      long long v15 = *(_OWORD *)(a2 + 168);
      *(_OWORD *)(a1 + 168) = v15;
      (**(void (***)(_OWORD *, void *))(v15 - 8))(v13, v14);
      *(unsigned char *)(a1 + 184) = 1;
      break;
    case 2:
      *(void *)(a1 + 144) = *v14;
      *(unsigned char *)(a1 + 184) = 2;
      swift_bridgeObjectRetain();
      break;
    case 4:
      *(void *)(a1 + 144) = *v14;
      char v18 = 4;
      goto LABEL_13;
    case 5:
      *(void *)(a1 + 144) = *v14;
      char v18 = 5;
LABEL_13:
      *(unsigned char *)(a1 + 184) = v18;
      swift_retain();
      break;
    default:
      long long v16 = *(_OWORD *)(a2 + 160);
      *long long v13 = *(_OWORD *)v14;
      *(_OWORD *)(a1 + 160) = v16;
      *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
      break;
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IntentSchema(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  }
  else if (v4)
  {
    *(void *)(a1 + 80) = v4;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 56, a2 + 56);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 56) = v5;
  *(_OWORD *)(a1 + 72) = v6;
LABEL_8:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (long long *)(a1 + 104);
  uint64_t v8 = (long long *)(a2 + 104);
  unint64_t v9 = *(void *)(a1 + 128);
  unint64_t v10 = *(void *)(a2 + 128);
  if (v9 == 4)
  {
    if (v10 <= 4)
    {
LABEL_10:
      long long v11 = *v8;
      long long v12 = *(_OWORD *)(a2 + 120);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *uint64_t v7 = v11;
      *(_OWORD *)(a1 + 120) = v12;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (v10 == 4)
  {
    sub_247AA76E4(a1 + 104);
    uint64_t v13 = *(void *)(a2 + 136);
    long long v14 = *(_OWORD *)(a2 + 120);
    *uint64_t v7 = *v8;
    *(_OWORD *)(a1 + 120) = v14;
    *(void *)(a1 + 136) = v13;
    goto LABEL_19;
  }
  if (v9 < 4)
  {
    if (v10 < 4) {
      goto LABEL_10;
    }
LABEL_15:
    *(void *)(a1 + 128) = v10;
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 104, a2 + 104);
    goto LABEL_19;
  }
  if (v10 < 4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 104);
    goto LABEL_10;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
LABEL_19:
  long long v15 = (_OWORD *)(a1 + 144);
  long long v16 = (void *)(a2 + 144);
  if (*(unsigned __int8 *)(a1 + 184) == 255)
  {
    switch(*(unsigned char *)(a2 + 184))
    {
      case 1:
LABEL_25:
        uint64_t v19 = *(void *)(a2 + 168);
        *(void *)(a1 + 168) = v19;
        *(void *)(a1 + 176) = *(void *)(a2 + 176);
        (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 144, a2 + 144);
        *(unsigned char *)(a1 + 184) = 1;
        break;
      case 2:
LABEL_26:
        *(void *)(a1 + 144) = *v16;
        *(unsigned char *)(a1 + 184) = 2;
        swift_bridgeObjectRetain();
        break;
      case 4:
LABEL_27:
        *(void *)(a1 + 144) = *v16;
        char v20 = 4;
        goto LABEL_29;
      case 5:
LABEL_28:
        *(void *)(a1 + 144) = *v16;
        char v20 = 5;
LABEL_29:
        *(unsigned char *)(a1 + 184) = v20;
        swift_retain();
        break;
      default:
LABEL_30:
        long long v21 = *(_OWORD *)v16;
        long long v22 = *(_OWORD *)(a2 + 160);
        *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
        *long long v15 = v21;
        *(_OWORD *)(a1 + 160) = v22;
        break;
    }
  }
  else if (*(unsigned __int8 *)(a2 + 184) == 255)
  {
    sub_247A8E0FC(a1 + 144);
    long long v17 = *(_OWORD *)(a2 + 169);
    long long v18 = *(_OWORD *)(a2 + 160);
    *long long v15 = *(_OWORD *)v16;
    *(_OWORD *)(a1 + 160) = v18;
    *(_OWORD *)(a1 + 169) = v17;
  }
  else if (a1 != a2)
  {
    sub_247A8E0FC(a1 + 144);
    switch(*(unsigned char *)(a2 + 184))
    {
      case 1:
        goto LABEL_25;
      case 2:
        goto LABEL_26;
      case 4:
        goto LABEL_27;
      case 5:
        goto LABEL_28;
      default:
        goto LABEL_30;
    }
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  return a1;
}

void *__swift_memcpy201_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC9uLL);
}

uint64_t assignWithTake for IntentSchema(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (*(void *)(a1 + 80)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  }
  long long v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  unint64_t v8 = *(void *)(a1 + 128);
  if (v8 != 4)
  {
    if (*(void *)(a2 + 128) == 4)
    {
      sub_247AA76E4(a1 + 104);
    }
    else if (v8 >= 4)
    {
      __swift_destroy_boxed_opaque_existential_1(a1 + 104);
    }
  }
  long long v9 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v9;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  if (*(unsigned __int8 *)(a1 + 184) == 255) {
    goto LABEL_14;
  }
  if (*(unsigned __int8 *)(a2 + 184) == 255 || a1 != a2)
  {
    sub_247A8E0FC(a1 + 144);
LABEL_14:
    long long v11 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v11;
    *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentSchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 201))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IntentSchema(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(unsigned char *)(result + 200) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 201) = 1;
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
    *(unsigned char *)(result + 201) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentSchema()
{
  return &type metadata for IntentSchema;
}

uint64_t getEnumTagSinglePayload for IntentSchema.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntentSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB1584);
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

ValueMetadata *type metadata accessor for IntentSchema.CodingKeys()
{
  return &type metadata for IntentSchema.CodingKeys;
}

unint64_t sub_247AB15C0()
{
  unint64_t result = qword_26929C298;
  if (!qword_26929C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C298);
  }
  return result;
}

unint64_t sub_247AB1610()
{
  unint64_t result = qword_26929C2A0;
  if (!qword_26929C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2A0);
  }
  return result;
}

unint64_t sub_247AB1660()
{
  unint64_t result = qword_26929C2A8;
  if (!qword_26929C2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2A8);
  }
  return result;
}

uint64_t sub_247AB16AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  return sub_247AAF410(v32, v26, v27, v28, v30, v29, v34 - 128, v31, a14, v25, (uint64_t)&a25, (uint64_t)&a19, v33, &a18);
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_247AB7680();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_247AB7680();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_247AB7660();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_247AB75F0();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0 + 56;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_247AB75E0();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

void static SchemaBuilder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v4 + 16);
      if (__OFADD__(v7, v6)) {
        break;
      }
      swift_bridgeObjectRetain();
      if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v6 > *(void *)(v4 + 24) >> 1)
      {
        sub_247A8F810();
        uint64_t v4 = v8;
      }
      if (*(void *)(v5 + 16))
      {
        if ((*(void *)(v4 + 24) >> 1) - *(void *)(v4 + 16) < v6) {
          goto LABEL_18;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
        swift_arrayInitWithCopy();
        if (v6)
        {
          uint64_t v9 = *(void *)(v4 + 16);
          BOOL v10 = __OFADD__(v9, v6);
          uint64_t v11 = v9 + v6;
          if (v10) {
            goto LABEL_19;
          }
          *(void *)(v4 + 16) = v11;
        }
      }
      else if (v6)
      {
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      if (v1 == ++v3)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
}

uint64_t static SchemaBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static SchemaBuilder.buildExpression(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247AB7BC0;
  sub_247A935FC(a1, v2 + 32);
  return v2;
}

ValueMetadata *type metadata accessor for SchemaBuilder()
{
  return &type metadata for SchemaBuilder;
}

uint64_t dispatch thunk of static SchemaID.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_247AB1AB4(char a1, char a2)
{
  if (*(void *)&a010_0[8 * a1] == *(void *)&a010_0[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_247AB7690();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_247AB1B1C(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x73616D656863735FLL;
  }
  else {
    uint64_t v2 = 0x6E6F69737265765FLL;
  }
  if (a2) {
    uint64_t v3 = 0x73616D656863735FLL;
  }
  else {
    uint64_t v3 = 0x6E6F69737265765FLL;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_247AB7690();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_247AB1B9C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64616F6C796170;
  }
  else {
    uint64_t v3 = 1702060386;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64616F6C796170;
  }
  else {
    uint64_t v5 = 1702060386;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_3_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_247AB1C2C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E69616D6F64;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E69616D6F64;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x73616D65686373;
      break;
    case 2:
      uint64_t v5 = 0x616D726F666E6F63;
      unint64_t v3 = 0xEF6570795465636ELL;
      break;
    case 3:
      uint64_t v5 = 0x696C696269736976;
      unint64_t v3 = 0xEA00000000007974;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x73616D65686373;
      break;
    case 2:
      uint64_t v2 = 0x616D726F666E6F63;
      unint64_t v6 = 0xEF6570795465636ELL;
      break;
    case 3:
      uint64_t v2 = 0x696C696269736976;
      unint64_t v6 = 0xEA00000000007974;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = OUTLINED_FUNCTION_3_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_247AB1DB4(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  uint64_t v4 = 25705;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v4 = 0x656C7469745FLL;
      break;
    case 2:
      uint64_t v4 = 0x706972637365645FLL;
      unint64_t v3 = 0xEC0000006E6F6974;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v4 = 0x7070416E65706F5FLL;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v4 = 0x7972616D6D75735FLL;
      break;
    case 5:
      uint64_t v4 = 0x74656D617261705FLL;
      unint64_t v3 = 0xEB00000000737265;
      break;
    case 6:
      uint64_t v4 = 0x506D65747379735FLL;
      unint64_t v3 = 0xEF6C6F636F746F72;
      break;
    case 7:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v4 = 0x746C757365725FLL;
      break;
    case 8:
      uint64_t v4 = 0x6E6172657474755FLL;
      uint64_t v5 = 7562595;
      goto LABEL_11;
    case 9:
      uint64_t v4 = 0x6C6962697369765FLL;
      uint64_t v5 = 7959657;
LABEL_11:
      unint64_t v3 = v5 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE200000000000000;
  uint64_t v7 = 25705;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v7 = 0x656C7469745FLL;
      break;
    case 2:
      uint64_t v7 = 0x706972637365645FLL;
      unint64_t v6 = 0xEC0000006E6F6974;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v7 = 0x7070416E65706F5FLL;
      break;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v7 = 0x7972616D6D75735FLL;
      break;
    case 5:
      uint64_t v7 = 0x74656D617261705FLL;
      unint64_t v6 = 0xEB00000000737265;
      break;
    case 6:
      uint64_t v7 = 0x506D65747379735FLL;
      unint64_t v6 = 0xEF6C6F636F746F72;
      break;
    case 7:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v7 = 0x746C757365725FLL;
      break;
    case 8:
      uint64_t v7 = 0x6E6172657474755FLL;
      uint64_t v8 = 7562595;
      goto LABEL_22;
    case 9:
      uint64_t v7 = 0x6C6962697369765FLL;
      uint64_t v8 = 7959657;
LABEL_22:
      unint64_t v6 = v8 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    default:
      break;
  }
  if (v4 == v7 && v3 == v6) {
    char v10 = 1;
  }
  else {
    char v10 = OUTLINED_FUNCTION_3_5();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t static VersionedSchema.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  char v5 = *(unsigned char *)(a1 + 17);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a2 + 8);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 17);
  uint64_t v10 = *(void *)(a2 + 24);
  if (v3)
  {
    if (!v7) {
      goto LABEL_25;
    }
    if (*(void *)a1 != *(void *)a2 || v3 != v7)
    {
      char v12 = 0;
      if ((sub_247AB7690() & 1) == 0) {
        return v12 & 1;
      }
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  if (v4 == 2)
  {
    if (v8 != 2) {
      goto LABEL_25;
    }
  }
  else if (v8 == 2 || ((v8 ^ v4) & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((sub_247AB1AB4(v5, v9) & 1) == 0)
  {
LABEL_25:
    char v12 = 0;
    return v12 & 1;
  }
  int64_t v14 = *(void *)(v6 + 16);
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    uint64_t v28 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_247AB2E94(0, v14, 0);
    uint64_t v15 = v28;
    uint64_t v16 = v6 + 32;
    do
    {
      sub_247A935FC(v16, (uint64_t)&v25);
      uint64_t v28 = v15;
      unint64_t v18 = *(void *)(v15 + 16);
      unint64_t v17 = *(void *)(v15 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_247AB2E94((void *)(v17 > 1), v18 + 1, 1);
        uint64_t v15 = v28;
      }
      *(void *)(v15 + 16) = v18 + 1;
      OUTLINED_FUNCTION_4_4(v15 + 40 * v18, v25, v26, v27);
      v16 += 40;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  int64_t v20 = *(void *)(v10 + 16);
  uint64_t v21 = MEMORY[0x263F8EE78];
  if (v20)
  {
    uint64_t v28 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_247AB2E94(0, v20, 0);
    uint64_t v21 = v28;
    uint64_t v22 = v10 + 32;
    do
    {
      sub_247A935FC(v22, (uint64_t)&v25);
      uint64_t v28 = v21;
      unint64_t v24 = *(void *)(v21 + 16);
      unint64_t v23 = *(void *)(v21 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_247AB2E94((void *)(v23 > 1), v24 + 1, 1);
        uint64_t v21 = v28;
      }
      *(void *)(v21 + 16) = v24 + 1;
      OUTLINED_FUNCTION_4_4(v21 + 40 * v24, v25, v26, v27);
      v22 += 40;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
  }
  char v12 = sub_247A97EE8(v15, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

AppIntentSchemas::VersionedSchema::Version_optional __swiftcall VersionedSchema.Version.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_247AB75A0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t VersionedSchema.Version.rawValue.getter()
{
  return *(void *)&a010_0[8 * *v0];
}

uint64_t sub_247AB2364(char *a1, char *a2)
{
  return sub_247AB1AB4(*a1, *a2);
}

uint64_t sub_247AB2370()
{
  return sub_247AB3870(*v0);
}

uint64_t sub_247AB2378()
{
  return sub_247AB38E4();
}

uint64_t sub_247AB2380(uint64_t a1)
{
  return sub_247AB3D50(a1, *v1);
}

AppIntentSchemas::VersionedSchema::Version_optional sub_247AB2388(Swift::String *a1)
{
  return VersionedSchema.Version.init(rawValue:)(*a1);
}

uint64_t sub_247AB2394@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = VersionedSchema.Version.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE500000000000000;
  return result;
}

uint64_t sub_247AB23C0()
{
  return sub_247AB7530();
}

uint64_t sub_247AB2420()
{
  return sub_247AB7510();
}

uint64_t VersionedSchema.domain.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VersionedSchema.domain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*VersionedSchema.domain.modify())()
{
  return nullsub_1;
}

void VersionedSchema.visibility.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *VersionedSchema.visibility.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*VersionedSchema.visibility.modify())()
{
  return nullsub_1;
}

void VersionedSchema._version.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

uint64_t VersionedSchema._schemas.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t VersionedSchema.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  int v2 = *(unsigned __int8 *)(v0 + 17);
  sub_247A935FC(v1 + 32, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  uint64_t v6 = v5;
  if (v2 != 1)
  {
    uint64_t v8 = v5;
    swift_bridgeObjectRetain();
    sub_247AB74F0();
    OUTLINED_FUNCTION_2_10();
    sub_247AB74F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = v8;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

Swift::String __swiftcall VersionedSchema.key(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (*(unsigned char *)(v1 + 17) == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_247AB74F0();
    OUTLINED_FUNCTION_2_10();
    sub_247AB74F0();
    swift_bridgeObjectRelease();
    object = a1._object;
    uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  }
  uint64_t v4 = countAndFlagsBits;
  uint64_t v5 = object;
  result._object = v5;
  result._uint64_t countAndFlagsBits = v4;
  return result;
}

uint64_t VersionedSchema.init(_:schemas:)@<X0>(char *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  char v4 = *a1;
  uint64_t result = a2();
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 2;
  *(unsigned char *)(a3 + 17) = v4;
  *(void *)(a3 + 24) = result;
  return result;
}

uint64_t sub_247AB2734(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_247AB34BC(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 32;
    do
    {
      sub_247A935FC(v4, (uint64_t)v8);
      uint64_t v9 = v2;
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_247AB34BC((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_247A95CE8(v8, v2 + 40 * v6 + 32);
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t VersionedSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2B0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB2EB4();
  sub_247AB7710();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2C0);
    sub_247AB2F98(&qword_26929C2C8, (void (*)(void))sub_247A9E990);
    sub_247AB7610();
    sub_247AB2F00();
    sub_247AB7610();
    uint64_t v7 = sub_247AB2734(v10);
    uint64_t v8 = OUTLINED_FUNCTION_1_4();
    v9(v8);
    swift_bridgeObjectRelease();
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 2;
    *(unsigned char *)(a2 + 17) = v10;
    *(void *)(a2 + 24) = v7;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t VersionedSchema.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2D8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *(unsigned char *)(v1 + 17);
  uint64_t v10 = *(void *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB2EB4();
  sub_247AB7720();
  LOBYTE(v24[0]) = v9;
  LOBYTE(v26) = 0;
  sub_247AB2F4C();
  uint64_t v11 = v23;
  sub_247AB7680();
  if (!v11)
  {
    int64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = MEMORY[0x263F8EE78];
    if (v12)
    {
      uint64_t v22 = v5;
      uint64_t v23 = v2;
      uint64_t v26 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_247AB2E94(0, v12, 0);
      uint64_t v13 = v26;
      uint64_t v21 = v10;
      uint64_t v14 = v10 + 32;
      do
      {
        sub_247A935FC(v14, (uint64_t)v24);
        uint64_t v26 = v13;
        unint64_t v16 = *(void *)(v13 + 16);
        unint64_t v15 = *(void *)(v13 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_247AB2E94((void *)(v15 > 1), v16 + 1, 1);
          uint64_t v13 = v26;
        }
        *(void *)(v13 + 16) = v16 + 1;
        uint64_t v17 = v13 + 40 * v16;
        long long v18 = v24[0];
        long long v19 = v24[1];
        *(void *)(v17 + 64) = v25;
        *(_OWORD *)(v17 + 32) = v18;
        *(_OWORD *)(v17 + 48) = v19;
        v14 += 40;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      uint64_t v5 = v22;
      uint64_t v2 = v23;
    }
    *(void *)&v24[0] = v13;
    LOBYTE(v26) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2C0);
    sub_247AB2F98(&qword_26929C2E8, (void (*)(void))sub_247A9EBCC);
    sub_247AB7680();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v2);
}

uint64_t sub_247AB2CB4()
{
  uint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_247AB2D0C(char a1)
{
  if (a1) {
    return 0x73616D656863735FLL;
  }
  else {
    return 0x6E6F69737265765FLL;
  }
}

uint64_t sub_247AB2D3C(char *a1, char *a2)
{
  return sub_247AB1B1C(*a1, *a2);
}

uint64_t sub_247AB2D48()
{
  return sub_247AB3888();
}

uint64_t sub_247AB2D50()
{
  return sub_247AB3924();
}

uint64_t sub_247AB2D58()
{
  return sub_247AB3CDC();
}

uint64_t sub_247AB2D60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB2CB4();
  *a1 = result;
  return result;
}

uint64_t sub_247AB2D90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247AB2D0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247AB2DBC()
{
  return sub_247AB2D0C(*v0);
}

uint64_t sub_247AB2DC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB2D08();
  *a1 = result;
  return result;
}

uint64_t sub_247AB2DEC(uint64_t a1)
{
  unint64_t v2 = sub_247AB2EB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB2E28(uint64_t a1)
{
  unint64_t v2 = sub_247AB2EB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB2E64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return VersionedSchema.init(from:)(a1, a2);
}

uint64_t sub_247AB2E7C(void *a1)
{
  return VersionedSchema.encode(to:)(a1);
}

void *sub_247AB2E94(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_247AB34DC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

unint64_t sub_247AB2EB4()
{
  unint64_t result = qword_26929C2B8;
  if (!qword_26929C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2B8);
  }
  return result;
}

unint64_t sub_247AB2F00()
{
  unint64_t result = qword_26929C2D0;
  if (!qword_26929C2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2D0);
  }
  return result;
}

unint64_t sub_247AB2F4C()
{
  unint64_t result = qword_26929C2E0;
  if (!qword_26929C2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2E0);
  }
  return result;
}

uint64_t sub_247AB2F98(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26929C2C0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247AB300C()
{
  unint64_t result = qword_26929C2F0;
  if (!qword_26929C2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2F0);
  }
  return result;
}

uint64_t initializeWithCopy for VersionedSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VersionedSchema(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for VersionedSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for VersionedSchema()
{
  return &type metadata for VersionedSchema;
}

unsigned char *storeEnumTagSinglePayload for VersionedSchema.Version(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB3244);
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

ValueMetadata *type metadata accessor for VersionedSchema.Version()
{
  return &type metadata for VersionedSchema.Version;
}

unsigned char *storeEnumTagSinglePayload for VersionedSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB3348);
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

ValueMetadata *type metadata accessor for VersionedSchema.CodingKeys()
{
  return &type metadata for VersionedSchema.CodingKeys;
}

unint64_t sub_247AB3384()
{
  unint64_t result = qword_26929C2F8;
  if (!qword_26929C2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C2F8);
  }
  return result;
}

unint64_t sub_247AB33D4()
{
  unint64_t result = qword_26929C300;
  if (!qword_26929C300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C300);
  }
  return result;
}

unint64_t sub_247AB3424()
{
  unint64_t result = qword_26929C308;
  if (!qword_26929C308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C308);
  }
  return result;
}

unint64_t sub_247AB3470()
{
  unint64_t result = qword_26929C310;
  if (!qword_26929C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C310);
  }
  return result;
}

void *sub_247AB34BC(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_247AB35DC(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

void *sub_247AB34DC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929C318);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_247A8FB54(a4 + 4, v8, v10 + 4);
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_247AB35DC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_247A8FB54(a4 + 4, v8, v10 + 4);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_247AB7690();
}

__n128 OUTLINED_FUNCTION_4_4@<Q0>(uint64_t a1@<X8>, __n128 a2, long long a3, uint64_t a4)
{
  __n128 result = a2;
  *(void *)(a1 + 64) = a4;
  *(__n128 *)(a1 + 32) = a2;
  *(_OWORD *)(a1 + 48) = a3;
  return result;
}

uint64_t sub_247AB3754()
{
  return sub_247AB7700();
}

uint64_t sub_247AB3794()
{
  return sub_247AB7700();
}

uint64_t sub_247AB37C8()
{
  return sub_247AB3DB4();
}

uint64_t sub_247AB37E8()
{
  return sub_247AB7700();
}

uint64_t sub_247AB3828(char a1)
{
  return sub_247AB7700();
}

uint64_t sub_247AB3870(uint64_t a1)
{
  return sub_247AB3894(a1, (void (*)(unsigned char *, uint64_t))sub_247AB38E4);
}

uint64_t sub_247AB3888()
{
  return sub_247AB3CDC();
}

uint64_t sub_247AB3894(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_7_4();
  a2(v5, a1);
  return sub_247AB7700();
}

uint64_t sub_247AB38E4()
{
  sub_247AB74E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AB3924()
{
  sub_247AB74E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AB397C()
{
  sub_247AB74E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AB39E0()
{
  sub_247AB74E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AB3AB4()
{
  sub_247AB74E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AB3C48(uint64_t a1, char a2)
{
  return sub_247AB7700();
}

uint64_t sub_247AB3C98()
{
  return sub_247AB7700();
}

uint64_t sub_247AB3CDC()
{
  return sub_247AB7700();
}

uint64_t sub_247AB3D50(uint64_t a1, uint64_t a2)
{
  return sub_247AB3D68(a1, a2, (void (*)(unsigned char *, uint64_t))sub_247AB38E4);
}

uint64_t sub_247AB3D68(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_247AB76E0();
  a3(v6, a2);
  return sub_247AB7700();
}

uint64_t sub_247AB3DB4()
{
  return sub_247AB7700();
}

uint64_t sub_247AB3E2C()
{
  return sub_247AB7700();
}

uint64_t DomainSchema.domain.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DomainSchema.schemas.getter()
{
  return swift_bridgeObjectRetain();
}

void DomainSchema.conformanceType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

void DomainSchema.visibility.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 25);
}

uint64_t sub_247AB3EB4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = v1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    sub_247A935FC(v3, (uint64_t)v20);
    sub_247A935FC((uint64_t)v20, (uint64_t)__dst);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
    if ((swift_dynamicCast() & 1) == 0) {
      bzero(__src, 0xC9uLL);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if (__src[1])
    {
      memcpy(__dst, __src, 0xC9uLL);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        char v7 = OUTLINED_FUNCTION_4_5();
        sub_247A8F824(v7, v8, v9, v10);
        uint64_t v4 = v11;
      }
      unint64_t v6 = *(void *)(v4 + 16);
      unint64_t v5 = *(void *)(v4 + 24);
      if (v6 >= v5 >> 1)
      {
        char v12 = OUTLINED_FUNCTION_3_6(v5);
        sub_247A8F824(v12, v13, v14, v15);
        uint64_t v4 = v16;
      }
      *(void *)(v4 + 16) = v6 + 1;
      memcpy((void *)(v4 + 208 * v6 + 32), __dst, 0xC9uLL);
    }
    else
    {
      sub_247AB532C((uint64_t)__src);
    }
    v3 += 40;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247AB401C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = v1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    sub_247A935FC(v3, (uint64_t)v19);
    sub_247A935FC((uint64_t)v19, (uint64_t)v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      long long v17 = 0u;
      memset(v18, 0, 26);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t v5 = *((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      uint64_t v6 = v17;
      uint64_t v7 = v18[0];
      long long v15 = *(_OWORD *)&v18[1];
      __int16 v8 = v18[3];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_4_5();
        sub_247A8F91C();
        uint64_t v4 = v12;
      }
      unint64_t v10 = *(void *)(v4 + 16);
      unint64_t v9 = *(void *)(v4 + 24);
      if (v10 >= v9 >> 1)
      {
        OUTLINED_FUNCTION_3_6(v9);
        sub_247A8F91C();
        uint64_t v4 = v13;
      }
      *(void *)(v4 + 16) = v10 + 1;
      uint64_t v11 = v4 + 48 * v10;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v5;
      *(void *)(v11 + 48) = v7;
      *(_OWORD *)(v11 + 56) = v15;
      *(unsigned char *)(v11 + 72) = v8 & 1;
      *(unsigned char *)(v11 + 73) = HIBYTE(v8) & 1;
    }
    v3 += 40;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247AB4188()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = v1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    sub_247A935FC(v3, (uint64_t)v19);
    sub_247A935FC((uint64_t)v19, (uint64_t)v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2D8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      long long v17 = 0u;
      memset(v18, 0, 25);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t v5 = *((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      uint64_t v6 = v17;
      uint64_t v7 = v18[0];
      long long v15 = *(_OWORD *)&v18[1];
      char v8 = v18[3];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_4_5();
        sub_247A8F930();
        uint64_t v4 = v12;
      }
      unint64_t v10 = *(void *)(v4 + 16);
      unint64_t v9 = *(void *)(v4 + 24);
      if (v10 >= v9 >> 1)
      {
        OUTLINED_FUNCTION_3_6(v9);
        sub_247A8F930();
        uint64_t v4 = v13;
      }
      *(void *)(v4 + 16) = v10 + 1;
      uint64_t v11 = v4 + 48 * v10;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v5;
      *(void *)(v11 + 48) = v7;
      *(_OWORD *)(v11 + 56) = v15;
      *(unsigned char *)(v11 + 72) = v8 & 1;
    }
    v3 += 40;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t DomainSchema.init(_:ofType:visibility:schemas:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  char v9 = *a3;
  char v10 = *a4;
  uint64_t result = a5();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = result;
  *(unsigned char *)(a6 + 24) = v9;
  *(unsigned char *)(a6 + 25) = v10;
  return result;
}

uint64_t DomainSchema.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C320);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB4608();
  sub_247AB7710();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2C0);
  sub_247AB2F98(&qword_26929C2C8, (void (*)(void))sub_247A9E990);
  sub_247AB7610();
  uint64_t v6 = sub_247AB75F0();
  uint64_t v8 = v7;
  uint64_t v13 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_247AB2734(v14);
  swift_bridgeObjectRelease();
  sub_247AB4654();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_10_3();
  sub_247AB7610();
  sub_247AAAED8();
  OUTLINED_FUNCTION_10_3();
  sub_247AB7610();
  uint64_t v11 = OUTLINED_FUNCTION_11_2();
  v12(v11);
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v9;
  *(unsigned char *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 25) = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_247AB4608()
{
  unint64_t result = qword_26929C328;
  if (!qword_26929C328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C328);
  }
  return result;
}

unint64_t sub_247AB4654()
{
  unint64_t result = qword_26929C330;
  if (!qword_26929C330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C330);
  }
  return result;
}

uint64_t DomainSchema.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C338);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void *)(v1 + 16);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 25);
  int v27 = *(unsigned __int8 *)(v1 + 24);
  int v28 = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB4608();
  sub_247AB7720();
  LOBYTE(v30[0]) = 0;
  uint64_t v9 = v8;
  uint64_t v10 = v29;
  sub_247AB7660();
  if (v10) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  uint64_t v29 = v5;
  uint64_t v12 = v26;
  int64_t v13 = *(void *)(v26 + 16);
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (v13)
  {
    unint64_t v24 = v8;
    uint64_t v25 = v3;
    uint64_t v32 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_247AB2E94(0, v13, 0);
    uint64_t v14 = v32;
    uint64_t v15 = v12 + 32;
    do
    {
      sub_247A935FC(v15, (uint64_t)v30);
      uint64_t v32 = v14;
      unint64_t v17 = *(void *)(v14 + 16);
      unint64_t v16 = *(void *)(v14 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_247AB2E94((void *)(v16 > 1), v17 + 1, 1);
        uint64_t v14 = v32;
      }
      *(void *)(v14 + 16) = v17 + 1;
      uint64_t v18 = v14 + 40 * v17;
      long long v19 = v30[0];
      long long v20 = v30[1];
      *(void *)(v18 + 64) = v31;
      *(_OWORD *)(v18 + 32) = v19;
      *(_OWORD *)(v18 + 48) = v20;
      v15 += 40;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    uint64_t v9 = v24;
    uint64_t v3 = v25;
  }
  *(void *)&v30[0] = v14;
  LOBYTE(v32) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C2C0);
  sub_247AB2F98(&qword_26929C2E8, (void (*)(void))sub_247A9EBCC);
  sub_247AB7680();
  uint64_t v21 = v29;
  char v23 = v27;
  char v22 = v28;
  swift_bridgeObjectRelease();
  LOBYTE(v30[0]) = v23;
  LOBYTE(v32) = 2;
  sub_247AB4EE8();
  OUTLINED_FUNCTION_8_1();
  LOBYTE(v30[0]) = v22;
  LOBYTE(v32) = 3;
  sub_247AAAAB8();
  OUTLINED_FUNCTION_8_1();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v3);
}

uint64_t sub_247AB498C()
{
  unint64_t v0 = sub_247AB75A0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_247AB49DC(char a1)
{
  uint64_t result = 0x6E69616D6F64;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x73616D65686373;
      break;
    case 2:
      uint64_t result = 0x616D726F666E6F63;
      break;
    case 3:
      uint64_t result = 0x696C696269736976;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247AB4A7C(char a1)
{
  uint64_t result = 0x6E69616D6F64;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x73616D65686373;
      break;
    case 2:
      uint64_t result = 0x616D726F666E6F63;
      break;
    case 3:
      uint64_t result = 0x696C696269736976;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247AB4B1C(unsigned __int8 *a1, char *a2)
{
  return sub_247AB1C2C(*a1, *a2);
}

uint64_t sub_247AB4B28()
{
  return sub_247AB3894(*v0, (void (*)(unsigned char *, uint64_t))sub_247AB39E0);
}

uint64_t sub_247AB4B58()
{
  return sub_247AB39E0();
}

uint64_t sub_247AB4B60(uint64_t a1)
{
  return sub_247AB3D68(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_247AB39E0);
}

uint64_t sub_247AB4B90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB498C();
  *a1 = result;
  return result;
}

uint64_t sub_247AB4BC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247AB49DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247AB4BEC()
{
  return sub_247AB4A7C(*v0);
}

uint64_t sub_247AB4BF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247AB49D8();
  *a1 = result;
  return result;
}

uint64_t sub_247AB4C1C(uint64_t a1)
{
  unint64_t v2 = sub_247AB4608();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB4C58(uint64_t a1)
{
  unint64_t v2 = sub_247AB4608();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB4C94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DomainSchema.init(from:)(a1, a2);
}

uint64_t sub_247AB4CAC(void *a1)
{
  return DomainSchema.encode(to:)(a1);
}

uint64_t static DomainSchema.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 25);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned int v6 = *(unsigned __int8 *)(a2 + 24);
  unsigned int v7 = *(unsigned __int8 *)(a2 + 25);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (v9 = sub_247AB7690(), uint64_t result = 0, (v9 & 1) != 0))
  {
    uint64_t v24 = __PAIR64__(v7, v6);
    int64_t v11 = *(void *)(v2 + 16);
    uint64_t v12 = MEMORY[0x263F8EE78];
    if (v11)
    {
      HIDWORD(v23) = v3;
      int v3 = v4;
      uint64_t v28 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_247AB2E94(0, v11, 0);
      uint64_t v12 = v28;
      uint64_t v13 = v2 + 32;
      do
      {
        sub_247A935FC(v13, (uint64_t)&v25);
        uint64_t v28 = v12;
        unint64_t v15 = *(void *)(v12 + 16);
        unint64_t v14 = *(void *)(v12 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_247AB2E94((void *)(v14 > 1), v15 + 1, 1);
          uint64_t v12 = v28;
        }
        *(void *)(v12 + 16) = v15 + 1;
        OUTLINED_FUNCTION_9_3(v12 + 40 * v15, v23, v24, v25, v26, v27);
        v13 += 40;
        --v11;
      }
      while (v11);
      swift_bridgeObjectRelease();
      int v4 = v3;
      LOBYTE(v3) = BYTE4(v23);
    }
    int64_t v16 = *(void *)(v5 + 16);
    uint64_t v17 = MEMORY[0x263F8EE78];
    if (v16)
    {
      uint64_t v28 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_247AB2E94(0, v16, 0);
      uint64_t v17 = v28;
      uint64_t v18 = v5 + 32;
      do
      {
        sub_247A935FC(v18, (uint64_t)&v25);
        uint64_t v28 = v17;
        unint64_t v20 = *(void *)(v17 + 16);
        unint64_t v19 = *(void *)(v17 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_247AB2E94((void *)(v19 > 1), v20 + 1, 1);
          uint64_t v17 = v28;
        }
        *(void *)(v17 + 16) = v20 + 1;
        OUTLINED_FUNCTION_9_3(v17 + 40 * v20, v23, v24, v25, v26, v27);
        v18 += 40;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
    }
    char v21 = sub_247A97EE8(v12, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v3 ^ v24)) {
      unsigned int v22 = 0;
    }
    else {
      unsigned int v22 = v4 ^ HIDWORD(v24) ^ 1;
    }
    if (v21) {
      return v22;
    }
    else {
      return 0;
    }
  }
  return result;
}

unint64_t sub_247AB4EE8()
{
  unint64_t result = qword_26929C340;
  if (!qword_26929C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C340);
  }
  return result;
}

uint64_t destroy for DomainSchema()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DomainSchema(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DomainSchema(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DomainSchema(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for DomainSchema(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 26))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DomainSchema(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DomainSchema()
{
  return &type metadata for DomainSchema;
}

unsigned char *storeEnumTagSinglePayload for DomainSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB5204);
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

ValueMetadata *type metadata accessor for DomainSchema.CodingKeys()
{
  return &type metadata for DomainSchema.CodingKeys;
}

unint64_t sub_247AB5240()
{
  unint64_t result = qword_26929C348;
  if (!qword_26929C348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C348);
  }
  return result;
}

unint64_t sub_247AB5290()
{
  unint64_t result = qword_26929C350;
  if (!qword_26929C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C350);
  }
  return result;
}

unint64_t sub_247AB52E0()
{
  unint64_t result = qword_26929C358;
  if (!qword_26929C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C358);
  }
  return result;
}

uint64_t sub_247AB532C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return sub_247AB74E0();
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_3_6@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_247AB74E0();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_247AB74E0();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_247AB76E0();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_247AB7680();
}

__n128 OUTLINED_FUNCTION_9_3@<Q0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, __n128 a4, long long a5, uint64_t a6)
{
  __n128 result = a4;
  *(void *)(a1 + 64) = a6;
  *(__n128 *)(a1 + 32) = a4;
  *(_OWORD *)(a1 + 48) = a5;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return v0;
}

BOOL static DomainConformanceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DomainConformanceType.hash(into:)()
{
  return sub_247AB76F0();
}

uint64_t sub_247AB54F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6F636F746F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x766972446C6F6F74 && a2 == 0xEA00000000006E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247AB55F0(char a1)
{
  if (a1) {
    return 0x766972446C6F6F74;
  }
  else {
    return 0x6C6F636F746F7270;
  }
}

uint64_t sub_247AB562C()
{
  return sub_247AB55F0(*v0);
}

uint64_t sub_247AB5634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AB54F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AB565C(uint64_t a1)
{
  unint64_t v2 = sub_247AB59D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB5698(uint64_t a1)
{
  unint64_t v2 = sub_247AB59D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB56D4(uint64_t a1)
{
  unint64_t v2 = sub_247AB5A6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB5710(uint64_t a1)
{
  unint64_t v2 = sub_247AB5A6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB574C(uint64_t a1)
{
  unint64_t v2 = sub_247AB5A20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB5788(uint64_t a1)
{
  unint64_t v2 = sub_247AB5A20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DomainConformanceType.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C368);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C370);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C378);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_6();
  uint64_t v11 = v10 - v9;
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB59D4();
  sub_247AB7720();
  uint64_t v13 = (uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  if (v12) {
    sub_247AB5A20();
  }
  else {
    sub_247AB5A6C();
  }
  sub_247AB7630();
  OUTLINED_FUNCTION_3_2();
  v15(v14);
  return (*v13)(v11, v5);
}

unint64_t sub_247AB59D4()
{
  unint64_t result = qword_26929C380;
  if (!qword_26929C380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C380);
  }
  return result;
}

unint64_t sub_247AB5A20()
{
  unint64_t result = qword_26929C388;
  if (!qword_26929C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C388);
  }
  return result;
}

unint64_t sub_247AB5A6C()
{
  unint64_t result = qword_26929C390;
  if (!qword_26929C390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C390);
  }
  return result;
}

uint64_t DomainConformanceType.hashValue.getter()
{
  return sub_247AB7700();
}

uint64_t DomainConformanceType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C398);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C3A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C3A8);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_6();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB59D4();
  sub_247AB7710();
  if (!v26)
  {
    uint64_t v27 = (uint64_t)a1;
    uint64_t v11 = sub_247AB7620();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      char v13 = *(unsigned char *)(v11 + 32);
      sub_247A97398(1, v12, v11, v11 + 32, 0, (2 * v12) | 1);
      uint64_t v15 = v14;
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      if (v15 == v17 >> 1)
      {
        sub_247AB5A20();
        sub_247AB75B0();
        OUTLINED_FUNCTION_3_2();
        v22();
        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v10, v5);
        *a2 = v13;
        return __swift_destroy_boxed_opaque_existential_1(v27);
      }
    }
    uint64_t v18 = sub_247AB7570();
    swift_allocError();
    unint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *unint64_t v20 = &type metadata for DomainConformanceType;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_3_2();
    v21();
    a1 = (void *)v27;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247AB5F3C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DomainConformanceType.init(from:)(a1, a2);
}

uint64_t sub_247AB5F54(void *a1)
{
  return DomainConformanceType.encode(to:)(a1);
}

unint64_t sub_247AB5F74()
{
  unint64_t result = qword_26929C3B0;
  if (!qword_26929C3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DomainConformanceType()
{
  return &type metadata for DomainConformanceType;
}

unsigned char *_s16AppIntentSchemas21DomainConformanceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB60A4);
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

ValueMetadata *type metadata accessor for DomainConformanceType.CodingKeys()
{
  return &type metadata for DomainConformanceType.CodingKeys;
}

ValueMetadata *type metadata accessor for DomainConformanceType.ProtocolCodingKeys()
{
  return &type metadata for DomainConformanceType.ProtocolCodingKeys;
}

ValueMetadata *type metadata accessor for DomainConformanceType.ToolDrivenCodingKeys()
{
  return &type metadata for DomainConformanceType.ToolDrivenCodingKeys;
}

unint64_t sub_247AB6100()
{
  unint64_t result = qword_26929C3B8;
  if (!qword_26929C3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3B8);
  }
  return result;
}

unint64_t sub_247AB6150()
{
  unint64_t result = qword_26929C3C0;
  if (!qword_26929C3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3C0);
  }
  return result;
}

unint64_t sub_247AB61A0()
{
  unint64_t result = qword_26929C3C8;
  if (!qword_26929C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3C8);
  }
  return result;
}

unint64_t sub_247AB61F0()
{
  unint64_t result = qword_26929C3D0;
  if (!qword_26929C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3D0);
  }
  return result;
}

unint64_t sub_247AB6240()
{
  unint64_t result = qword_26929C3D8;
  if (!qword_26929C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3D8);
  }
  return result;
}

unint64_t sub_247AB6290()
{
  unint64_t result = qword_26929C3E0;
  if (!qword_26929C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3E0);
  }
  return result;
}

unint64_t sub_247AB62E0()
{
  unint64_t result = qword_26929C3E8;
  if (!qword_26929C3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C3E8);
  }
  return result;
}

uint64_t dispatch thunk of DomainGroup.group.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t Domain.intents.getter(uint64_t a1, uint64_t a2)
{
  return sub_247AB638C(a1, a2, (uint64_t (*)(void *))sub_247AB3EB4);
}

uint64_t Domain.entities.getter(uint64_t a1, uint64_t a2)
{
  return sub_247AB638C(a1, a2, (uint64_t (*)(void *))sub_247AB401C);
}

uint64_t Domain.enums.getter(uint64_t a1, uint64_t a2)
{
  return sub_247AB638C(a1, a2, (uint64_t (*)(void *))sub_247AB4188);
}

uint64_t sub_247AB638C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  unsigned int v4 = (*(void *(**)(uint64_t *__return_ptr))(a2 + 8))(&v7);
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t dispatch thunk of Domain.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void static DomainBuilder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v4 + 16);
      if (__OFADD__(v7, v6)) {
        break;
      }
      swift_bridgeObjectRetain();
      if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v6 > *(void *)(v4 + 24) >> 1)
      {
        sub_247A8FA30();
        uint64_t v4 = v8;
      }
      if (*(void *)(v5 + 16))
      {
        if ((*(void *)(v4 + 24) >> 1) - *(void *)(v4 + 16) < v6) {
          goto LABEL_18;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2B0);
        swift_arrayInitWithCopy();
        if (v6)
        {
          uint64_t v9 = *(void *)(v4 + 16);
          BOOL v10 = __OFADD__(v9, v6);
          uint64_t v11 = v9 + v6;
          if (v10) {
            goto LABEL_19;
          }
          *(void *)(v4 + 16) = v11;
        }
      }
      else if (v6)
      {
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      if (v1 == ++v3)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
}

uint64_t static DomainBuilder.buildExpression(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929B2A8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247AB7BC0;
  sub_247A935FC(a1, v2 + 32);
  return v2;
}

ValueMetadata *type metadata accessor for DomainBuilder()
{
  return &type metadata for DomainBuilder;
}

BOOL static DomainVisibility.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DomainVisibility.hash(into:)()
{
  return sub_247AB76F0();
}

uint64_t sub_247AB6628(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x63696C627570 && a2 == 0xE600000000000000;
  if (v2 || (sub_247AB7690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C616E7265746E69 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_247AB7690();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247AB6710(char a1)
{
  if (a1) {
    return 0x6C616E7265746E69;
  }
  else {
    return 0x63696C627570;
  }
}

uint64_t sub_247AB6744()
{
  return sub_247AB6710(*v0);
}

uint64_t sub_247AB674C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247AB6628(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247AB6774(uint64_t a1)
{
  unint64_t v2 = sub_247AB6AEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB67B0(uint64_t a1)
{
  unint64_t v2 = sub_247AB6AEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB67EC(uint64_t a1)
{
  unint64_t v2 = sub_247AB6B38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB6828(uint64_t a1)
{
  unint64_t v2 = sub_247AB6B38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247AB6864(uint64_t a1)
{
  unint64_t v2 = sub_247AB6B84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247AB68A0(uint64_t a1)
{
  unint64_t v2 = sub_247AB6B84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DomainVisibility.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C3F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C3F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C400);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_6();
  uint64_t v11 = v10 - v9;
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB6AEC();
  sub_247AB7720();
  char v13 = (uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  if (v12) {
    sub_247AB6B38();
  }
  else {
    sub_247AB6B84();
  }
  sub_247AB7630();
  OUTLINED_FUNCTION_3_2();
  v15(v14);
  return (*v13)(v11, v5);
}

unint64_t sub_247AB6AEC()
{
  unint64_t result = qword_26929C408;
  if (!qword_26929C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C408);
  }
  return result;
}

unint64_t sub_247AB6B38()
{
  unint64_t result = qword_26929C410;
  if (!qword_26929C410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C410);
  }
  return result;
}

unint64_t sub_247AB6B84()
{
  unint64_t result = qword_26929C418;
  if (!qword_26929C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C418);
  }
  return result;
}

uint64_t DomainVisibility.hashValue.getter()
{
  return sub_247AB7700();
}

uint64_t DomainVisibility.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C420);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26929C428);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26929C430);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_6();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AB6AEC();
  sub_247AB7710();
  if (!v26)
  {
    uint64_t v27 = (uint64_t)a1;
    uint64_t v11 = sub_247AB7620();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      char v13 = *(unsigned char *)(v11 + 32);
      sub_247A97398(1, v12, v11, v11 + 32, 0, (2 * v12) | 1);
      uint64_t v15 = v14;
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      if (v15 == v17 >> 1)
      {
        sub_247AB6B38();
        sub_247AB75B0();
        OUTLINED_FUNCTION_3_2();
        v22();
        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v10, v5);
        *a2 = v13;
        return __swift_destroy_boxed_opaque_existential_1(v27);
      }
    }
    uint64_t v18 = sub_247AB7570();
    swift_allocError();
    unint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26929B578);
    *unint64_t v20 = &type metadata for DomainVisibility;
    sub_247AB75C0();
    sub_247AB7560();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_3_2();
    v21();
    a1 = (void *)v27;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247AB7054@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DomainVisibility.init(from:)(a1, a2);
}

uint64_t sub_247AB706C(void *a1)
{
  return DomainVisibility.encode(to:)(a1);
}

unint64_t sub_247AB708C()
{
  unint64_t result = qword_26929C438;
  if (!qword_26929C438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C438);
  }
  return result;
}

ValueMetadata *type metadata accessor for DomainVisibility()
{
  return &type metadata for DomainVisibility;
}

unsigned char *_s16AppIntentSchemas16DomainVisibilityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247AB71B8);
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

ValueMetadata *type metadata accessor for DomainVisibility.CodingKeys()
{
  return &type metadata for DomainVisibility.CodingKeys;
}

ValueMetadata *type metadata accessor for DomainVisibility.PublicCodingKeys()
{
  return &type metadata for DomainVisibility.PublicCodingKeys;
}

ValueMetadata *type metadata accessor for DomainVisibility.InternalCodingKeys()
{
  return &type metadata for DomainVisibility.InternalCodingKeys;
}

unint64_t sub_247AB7214()
{
  unint64_t result = qword_26929C440;
  if (!qword_26929C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C440);
  }
  return result;
}

unint64_t sub_247AB7264()
{
  unint64_t result = qword_26929C448;
  if (!qword_26929C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C448);
  }
  return result;
}

unint64_t sub_247AB72B4()
{
  unint64_t result = qword_26929C450;
  if (!qword_26929C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C450);
  }
  return result;
}

unint64_t sub_247AB7304()
{
  unint64_t result = qword_26929C458;
  if (!qword_26929C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C458);
  }
  return result;
}

unint64_t sub_247AB7354()
{
  unint64_t result = qword_26929C460;
  if (!qword_26929C460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C460);
  }
  return result;
}

unint64_t sub_247AB73A4()
{
  unint64_t result = qword_26929C468;
  if (!qword_26929C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C468);
  }
  return result;
}

unint64_t sub_247AB73F4()
{
  unint64_t result = qword_26929C470;
  if (!qword_26929C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26929C470);
  }
  return result;
}

uint64_t sub_247AB7440()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_247AB7450()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_247AB7460()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_247AB7470()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247AB7480()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247AB7490()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_247AB74A0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_247AB74B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247AB74C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247AB74D0()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_247AB74E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247AB74F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247AB7500()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_247AB7510()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_247AB7520()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_247AB7530()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_247AB7540()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_247AB7550()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_247AB7560()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_247AB7570()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_247AB7580()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_247AB7590()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_247AB75A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_247AB75B0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_247AB75C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_247AB75D0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_247AB75E0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_247AB75F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247AB7600()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_247AB7610()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247AB7620()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247AB7630()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_247AB7640()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_247AB7650()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_247AB7660()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247AB7670()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_247AB7680()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247AB7690()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247AB76A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247AB76B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247AB76C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247AB76D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247AB76E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247AB76F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247AB7700()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247AB7710()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247AB7720()
{
  return MEMORY[0x270F9FD98]();
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}