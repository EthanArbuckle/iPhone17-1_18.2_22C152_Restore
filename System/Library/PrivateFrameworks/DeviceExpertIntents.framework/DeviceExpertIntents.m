uint64_t FeedbackModel.question.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeedbackModel.question.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FeedbackModel.question.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackModel.answer.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeedbackModel.answer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*FeedbackModel.answer.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackModel.init(result:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v48[13] = *(id *)MEMORY[0x263EF8340];
  sub_24CC23740();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v5;
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v44 = v7 - v6;
  uint64_t v8 = sub_24CC23F00();
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v44 - v13;
  sub_24CC23BF0();
  sub_24CC23BE0();
  sub_24CC23BD0();
  swift_release();
  uint64_t v15 = sub_24CC23CD0();
  unint64_t v17 = v16;
  swift_release();
  if (v17) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v17) {
    unint64_t v19 = v17;
  }
  else {
    unint64_t v19 = 0xE000000000000000;
  }
  uint64_t v47 = a1;
  sub_24CBD81A8(a1, (uint64_t)v14);
  uint64_t v20 = sub_24CC237D0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v20) == 1)
  {
    sub_24CBD8238((uint64_t)v14);
    uint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
  }
  else
  {
    uint64_t v21 = sub_24CC23780();
    unint64_t v22 = v23;
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v14, v20);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CC249B0;
  *(void *)(inited + 32) = 0x6E656B6F7073;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = v18;
  *(void *)(inited + 56) = v19;
  v25 = self;
  *(void *)(inited + 64) = 0x6465686374616DLL;
  *(void *)(inited + 72) = 0xE700000000000000;
  *(void *)(inited + 80) = v21;
  *(void *)(inited + 88) = v22;
  sub_24CC23E50();
  v26 = (void *)sub_24CC23E30();
  swift_bridgeObjectRelease();
  v48[0] = 0;
  id v27 = objc_msgSend(v25, sel_dataWithJSONObject_options_error_, v26, 0, v48);

  id v28 = v48[0];
  if (v27)
  {
    uint64_t v29 = sub_24CC233A0();
    unint64_t v31 = v30;

    sub_24CC23EF0();
    uint64_t v32 = sub_24CC23EE0();
    unint64_t v34 = v33;
    sub_24CBD8944(v29, v31);
    uint64_t v35 = v47;
    if (!v34)
    {
      uint64_t v32 = 0;
      unint64_t v34 = 0xE000000000000000;
    }
  }
  else
  {
    v36 = v28;
    v37 = (void *)sub_24CC232A0();

    swift_willThrow();
    uint64_t v32 = 0;
    unint64_t v34 = 0xE000000000000000;
    uint64_t v35 = v47;
  }
  sub_24CBD81A8(v35, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v20) == 1)
  {
    sub_24CBD8238((uint64_t)v12);
    uint64_t v38 = 0;
    unint64_t v39 = 0xE000000000000000;
  }
  else
  {
    uint64_t v40 = v44;
    sub_24CC23750();
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v12, v20);
    sub_24CBD88F4();
    uint64_t v41 = v46;
    uint64_t v38 = sub_24CC23D40();
    unint64_t v39 = v42;
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v40, v41);
  }
  uint64_t result = sub_24CBD8238(v35);
  *a2 = v32;
  a2[1] = v34;
  a2[2] = v38;
  a2[3] = v39;
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

uint64_t sub_24CBD81A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24CBD8238(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_24CBD8298(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24CBD82A8()
{
  return sub_24CC24340();
}

uint64_t sub_24CBD82D0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F697473657571 && a2 == 0xE800000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726577736E61 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CBD83B0()
{
  return 2;
}

uint64_t sub_24CBD83B8()
{
  return sub_24CC24350();
}

uint64_t sub_24CBD8400()
{
  return 0;
}

uint64_t sub_24CBD840C(char a1)
{
  if (a1) {
    return 0x726577736E61;
  }
  else {
    return 0x6E6F697473657571;
  }
}

BOOL sub_24CBD8440(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24CBD8298(*a1, *a2);
}

uint64_t sub_24CBD844C()
{
  return sub_24CBD83B8();
}

uint64_t sub_24CBD8454()
{
  return sub_24CBD82A8();
}

uint64_t sub_24CBD845C()
{
  return sub_24CC24350();
}

uint64_t sub_24CBD84A0()
{
  return sub_24CBD840C(*v0);
}

uint64_t sub_24CBD84A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBD82D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBD84D0()
{
  return sub_24CBD8400();
}

uint64_t sub_24CBD84F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBD83B0();
  *a1 = result;
  return result;
}

uint64_t sub_24CBD8518(uint64_t a1)
{
  unint64_t v2 = sub_24CBD89E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBD8554(uint64_t a1)
{
  unint64_t v2 = sub_24CBD89E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FeedbackModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AF8);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBD89E0();
  sub_24CC24370();
  sub_24CC242C0();
  if (!v9) {
    sub_24CC242C0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
}

uint64_t FeedbackModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B08);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBD89E0();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v5 = sub_24CC24250();
  uint64_t v7 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24CC24250();
  uint64_t v10 = v9;
  uint64_t v14 = v8;
  uint64_t v11 = OUTLINED_FUNCTION_2();
  v12(v11);
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v14;
  a2[3] = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBD8894@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return FeedbackModel.init(from:)(a1, a2);
}

uint64_t sub_24CBD88AC(void *a1)
{
  return FeedbackModel.encode(to:)(a1);
}

uint64_t sub_24CBD88C4()
{
  return 0;
}

uint64_t sub_24CBD88CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CBD88C4();
  *a1 = result;
  return result;
}

unint64_t sub_24CBD88F4()
{
  unint64_t result = qword_269818AF0;
  if (!qword_269818AF0)
  {
    sub_24CC23740();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818AF0);
  }
  return result;
}

uint64_t sub_24CBD8944(uint64_t a1, unint64_t a2)
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24CBD89E0()
{
  unint64_t result = qword_269818B00;
  if (!qword_269818B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818B00);
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

uint64_t initializeBufferWithCopyOfBuffer for FeedbackModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FeedbackModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FeedbackModel(void *a1, void *a2)
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

void *assignWithCopy for FeedbackModel(void *a1, void *a2)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for FeedbackModel(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for FeedbackModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FeedbackModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FeedbackModel()
{
  return &type metadata for FeedbackModel;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeedbackModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FeedbackModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBD8DE4);
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

uint64_t sub_24CBD8E0C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CBD8E14(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackModel.CodingKeys()
{
  return &type metadata for FeedbackModel.CodingKeys;
}

unint64_t sub_24CBD8E34()
{
  unint64_t result = qword_269818B10;
  if (!qword_269818B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818B10);
  }
  return result;
}

unint64_t sub_24CBD8E84()
{
  unint64_t result = qword_269818B18;
  if (!qword_269818B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818B18);
  }
  return result;
}

unint64_t sub_24CBD8ED4()
{
  unint64_t result = qword_269818B20;
  if (!qword_269818B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818B20);
  }
  return result;
}

void *sub_24CBD8F20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t sub_24CBD8F74()
{
  OUTLINED_FUNCTION_37();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 8)
                                                                                     + **(int **)(v1 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_24CBD9098;
  return v15(v12, v10, v8, v6, v4, v2);
}

uint64_t sub_24CBD9098()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v3();
}

void *sub_24CBD915C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t sub_24CBD916C()
{
  OUTLINED_FUNCTION_16();
  v1[41] = v2;
  v1[42] = v0;
  v1[39] = v3;
  v1[40] = v4;
  v1[38] = v5;
  uint64_t v6 = type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_49(v6);
  v1[43] = OUTLINED_FUNCTION_48();
  uint64_t v7 = sub_24CC23740();
  v1[44] = v7;
  OUTLINED_FUNCTION_1_0(v7);
  v1[45] = v8;
  v1[46] = OUTLINED_FUNCTION_48();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  OUTLINED_FUNCTION_49(v9);
  v1[47] = OUTLINED_FUNCTION_14();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  v1[50] = swift_task_alloc();
  v1[51] = swift_task_alloc();
  uint64_t v10 = sub_24CC23200();
  OUTLINED_FUNCTION_49(v10);
  v1[52] = OUTLINED_FUNCTION_48();
  uint64_t v11 = sub_24CC231C0();
  v1[53] = v11;
  OUTLINED_FUNCTION_1_0(v11);
  v1[54] = v12;
  v1[55] = OUTLINED_FUNCTION_14();
  v1[56] = swift_task_alloc();
  uint64_t v13 = sub_24CC23510();
  v1[57] = v13;
  OUTLINED_FUNCTION_1_0(v13);
  v1[58] = v14;
  v1[59] = OUTLINED_FUNCTION_14();
  v1[60] = swift_task_alloc();
  v1[61] = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_49(v15);
  v1[62] = OUTLINED_FUNCTION_14();
  v1[63] = swift_task_alloc();
  v1[64] = swift_task_alloc();
  uint64_t v16 = sub_24CC237D0();
  v1[65] = v16;
  OUTLINED_FUNCTION_1_0(v16);
  v1[66] = v17;
  v1[67] = OUTLINED_FUNCTION_14();
  v1[68] = swift_task_alloc();
  v1[69] = swift_task_alloc();
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  v1[72] = swift_task_alloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v18, v19, v20);
}

uint64_t sub_24CBD93C0()
{
  swift_bridgeObjectRetain();
  v0[73] = sub_24CC237C0();
  v0[74] = v3;
  sub_24CC23670();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25();
  if (v4)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[75] = v5;
    *uint64_t v5 = v0;
    uint64_t v6 = sub_24CBD9690;
LABEL_5:
    v5[1] = v6;
    uint64_t v8 = OUTLINED_FUNCTION_19();
    return sub_24CBDB4D0(v8);
  }
  sub_24CC235D0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25();
  if (v7)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[77] = v5;
    *uint64_t v5 = v0;
    uint64_t v6 = sub_24CBD9D9C;
    goto LABEL_5;
  }
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v10 = OUTLINED_FUNCTION_17();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2698195F0);
  uint64_t v12 = OUTLINED_FUNCTION_3(v11);
  v13(v12);
  uint64_t v14 = sub_24CC23D80();
  os_log_type_t v15 = sub_24CC24070();
  OUTLINED_FUNCTION_30(v15);
  OUTLINED_FUNCTION_29();
  if (v16)
  {
    OUTLINED_FUNCTION_50();
    uint64_t v17 = (float *)OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_23(v17, 3.852e-34);
    sub_24CC23530();
    sub_24CC23500();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_46();
    v18();
    uint64_t v19 = OUTLINED_FUNCTION_13();
    v20(v19);
    v0[33] = v2;
    sub_24CC240C0();
    OUTLINED_FUNCTION_44(&dword_24CBD5000, v14, v1, "Result with preferred template type %ld");
    OUTLINED_FUNCTION_4();
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_21();
    v22(v21);
  }

  uint64_t v23 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_26(v23);
  uint64_t v24 = swift_retain();
  v0[83] = sub_24CC161E4(v24);
  v25 = (void *)swift_task_alloc();
  v0[84] = v25;
  void *v25 = v0;
  v25[1] = sub_24CBDA480;
  uint64_t v26 = OUTLINED_FUNCTION_19();
  return sub_24CC164BC(v26);
}

uint64_t sub_24CBD9690()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 608) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24CBD975C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_log_type_t type, uint64_t a20,uint64_t a21,long long a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  OUTLINED_FUNCTION_40();
  a34 = v38;
  a35 = v39;
  a33 = v35;
  uint64_t v40 = *(void **)(v35 + 608);
  if (v40)
  {
    uint64_t v41 = self;
    uint64_t v42 = OUTLINED_FUNCTION_56(v41);
    if (v42)
    {
      v43 = (void *)v42;
      if (qword_269818AC0 != -1) {
        swift_once();
      }
      uint64_t v44 = *(void *)(v35 + 576);
      uint64_t v45 = *(void *)(v35 + 528);
      uint64_t v46 = *(void *)(v35 + 520);
      uint64_t v47 = *(void *)(v35 + 312);
      uint64_t v48 = sub_24CC23DA0();
      __swift_project_value_buffer(v48, (uint64_t)qword_2698195F0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v44, v47, v46);
      id v49 = v40;
      v50 = sub_24CC23D80();
      os_log_type_t v51 = sub_24CC24070();
      BOOL v52 = os_log_type_enabled(v50, v51);
      uint64_t v53 = *(void *)(v35 + 576);
      uint64_t v54 = *(void *)(v35 + 528);
      if (v52)
      {
        uint64_t v112 = *(void *)(v35 + 520);
        uint64_t v55 = swift_slowAlloc();
        *(void *)&a22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = 136315394;
        os_log_type_t typeb = v51;
        id v56 = objc_msgSend(v43, sel_identifier);
        uint64_t v57 = sub_24CC23ED0();
        uint64_t v58 = v53;
        unint64_t v60 = v59;

        *(void *)(v35 + 288) = sub_24CC12DF0(v57, v60, (uint64_t *)&a22);
        sub_24CC240C0();
        swift_bridgeObjectRelease();

        *(_WORD *)(v55 + 12) = 2080;
        uint64_t v61 = sub_24CC23650();
        *(void *)(v35 + 296) = sub_24CC12DF0(v61, v62, (uint64_t *)&a22);
        sub_24CC240C0();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v58, v112);
        _os_log_impl(&dword_24CBD5000, v50, typeb, "Found eligible tip %s for result %s", (uint8_t *)v55, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_4();
      }
      else
      {

        uint64_t v79 = OUTLINED_FUNCTION_45();
        v80(v79);
      }

      uint64_t v81 = *(void *)(v35 + 592);
      uint64_t v82 = *(void *)(v35 + 584);
      uint64_t v83 = *(void *)(v35 + 304);
      a22 = *(_OWORD *)(v35 + 320);
      a23 = v82;
      a24 = v81;
      TipSnippetModel.init(tip:context:)(v43, &a22, v83);
      uint64_t v84 = type metadata accessor for TellMeGeneratedSnippetModels();
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload(v83, 0, 1, v84);
      uint64_t v85 = type metadata accessor for SnippetResponseComponents();
      OUTLINED_FUNCTION_39(v83 + *(int *)(v85 + 20));
      uint64_t v101 = *(void *)(v35 + 480);
      uint64_t v102 = *(void *)(v35 + 472);
      uint64_t v103 = *(void *)(v35 + 448);
      uint64_t v104 = *(void *)(v35 + 440);
      uint64_t v105 = *(void *)(v35 + 416);
      uint64_t v106 = *(void *)(v35 + 408);
      uint64_t v107 = *(void *)(v35 + 400);
      uint64_t v108 = *(void *)(v35 + 392);
      uint64_t v109 = *(void *)(v35 + 384);
      uint64_t typea = *(void *)(v35 + 376);
      uint64_t v113 = *(void *)(v35 + 368);
      uint64_t v114 = *(void *)(v35 + 344);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_5();
      return v87(v86, v87, v88, v89, v90, v91, v92, v93, a9, v101, v102, v103, v104, v105, v106, v107, v108, v109, typea,
               v113,
               v114,
               a22,
               *((void *)&a22 + 1),
               a23,
               a24,
               a25,
               a26,
               a27);
    }
  }
  sub_24CC235D0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25();
  if (v63)
  {
    v64 = (void *)swift_task_alloc();
    *(void *)(v35 + 616) = v64;
    void *v64 = v35;
    v64[1] = sub_24CBD9D9C;
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_5();
    return sub_24CBDB4D0(v65);
  }
  else
  {
    if (qword_269818AC0 != -1) {
      swift_once();
    }
    uint64_t v68 = OUTLINED_FUNCTION_17();
    uint64_t v69 = __swift_project_value_buffer(v68, (uint64_t)qword_2698195F0);
    uint64_t v70 = OUTLINED_FUNCTION_3(v69);
    v71(v70);
    v72 = sub_24CC23D80();
    os_log_type_t v73 = sub_24CC24070();
    OUTLINED_FUNCTION_30(v73);
    OUTLINED_FUNCTION_29();
    if (v74)
    {
      OUTLINED_FUNCTION_50();
      v75 = (float *)OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_23(v75, 3.852e-34);
      sub_24CC23530();
      sub_24CC23500();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_46();
      v76();
      uint64_t v77 = OUTLINED_FUNCTION_13();
      v78(v77);
      *(void *)(v35 + 264) = v37;
      sub_24CC240C0();
      OUTLINED_FUNCTION_44(&dword_24CBD5000, v72, v36, "Result with preferred template type %ld");
      OUTLINED_FUNCTION_4();
    }
    else
    {
      uint64_t v94 = OUTLINED_FUNCTION_21();
      v95(v94);
    }

    uint64_t v96 = OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_26(v96);
    uint64_t v97 = swift_retain();
    *(void *)(v35 + 664) = sub_24CC161E4(v97);
    v98 = (void *)swift_task_alloc();
    *(void *)(v35 + 672) = v98;
    void *v98 = v35;
    v98[1] = sub_24CBDA480;
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_5();
    return sub_24CC164BC(v99);
  }
}

uint64_t sub_24CBD9D9C()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 624) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24CBD9E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36)
{
  OUTLINED_FUNCTION_40();
  a35 = v38;
  a36 = v39;
  a34 = v36;
  uint64_t v40 = (void *)v36[78];
  if (v40)
  {
    uint64_t v41 = self;
    uint64_t v42 = OUTLINED_FUNCTION_56(v41);
    if (v42)
    {
      v43 = (void *)v42;
      if (qword_269818AC0 != -1) {
        swift_once();
      }
      uint64_t v44 = v36[71];
      uint64_t v45 = v36[66];
      uint64_t v46 = v36[65];
      uint64_t v47 = v36[39];
      uint64_t v48 = sub_24CC23DA0();
      __swift_project_value_buffer(v48, (uint64_t)qword_2698195F0);
      uint64_t v112 = v45 + 16;
      uint64_t v109 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
      v109(v44, v47, v46);
      id v111 = v40;
      id v49 = sub_24CC23D80();
      os_log_type_t v50 = sub_24CC24070();
      BOOL v51 = os_log_type_enabled(v49, v50);
      uint64_t v52 = v36[71];
      uint64_t v53 = v36[66];
      uint64_t v54 = v36[65];
      uint64_t v108 = v43;
      if (v51)
      {
        uint64_t v55 = swift_slowAlloc();
        a22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = 136315394;
        uint64_t v106 = v54;
        id v56 = objc_msgSend(v43, sel_identifier);
        uint64_t v57 = sub_24CC23ED0();
        unint64_t v59 = v58;

        v36[34] = sub_24CC12DF0(v57, v59, &a22);
        sub_24CC240C0();
        swift_bridgeObjectRelease();

        *(_WORD *)(v55 + 12) = 2080;
        uint64_t v60 = sub_24CC23650();
        v36[35] = sub_24CC12DF0(v60, v61, &a22);
        sub_24CC240C0();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v106);
        _os_log_impl(&dword_24CBD5000, v49, v50, "Found eligible collection %s for result %s", (uint8_t *)v55, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_4();
      }
      else
      {

        uint64_t v81 = OUTLINED_FUNCTION_51();
        v82(v81);
      }

      uint64_t v83 = v36[74];
      uint64_t v84 = v36[73];
      uint64_t v85 = v36[70];
      uint64_t v110 = v36[65];
      uint64_t v86 = v36[64];
      uint64_t v88 = v36[40];
      uint64_t v87 = v36[41];
      uint64_t v105 = v88;
      uint64_t v107 = v36[39];
      ((void (*)(uint64_t))v109)(v85);
      type metadata accessor for AttributionModel();
      OUTLINED_FUNCTION_39(v86);
      a22 = v88;
      a23 = v87;
      a24 = v84;
      a25 = v83;
      id v89 = v111;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v90 = OUTLINED_FUNCTION_51();
      sub_24CBF8B70(v90, v91, v108, v92);
      type metadata accessor for TellMeGeneratedSnippetModels();
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_53();
      type metadata accessor for SnippetResponseComponents();
      v109(v85, v107, v110);
      OUTLINED_FUNCTION_39(v86);
      a22 = v105;
      a23 = v87;
      a24 = v84;
      a25 = v83;
      uint64_t v93 = OUTLINED_FUNCTION_51();
      sub_24CC073A0(v93, v94, v95, v96);

      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2_0();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_5();
      return v98(v97, v98, v99, v100, v101, v102, v103, v104, a9, a10, a11, a12, a13, v105, v84, v107, v108, (void (*)(void))v109, v110,
               v111,
               v112,
               a22,
               a23,
               a24,
               a25,
               a26,
               a27,
               a28);
    }
  }
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v62 = OUTLINED_FUNCTION_17();
  uint64_t v63 = __swift_project_value_buffer(v62, (uint64_t)qword_2698195F0);
  uint64_t v64 = OUTLINED_FUNCTION_3(v63);
  v65(v64);
  uint64_t v66 = sub_24CC23D80();
  os_log_type_t v67 = sub_24CC24070();
  OUTLINED_FUNCTION_30(v67);
  OUTLINED_FUNCTION_29();
  if (v68)
  {
    OUTLINED_FUNCTION_50();
    uint64_t v69 = (float *)OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_23(v69, 3.852e-34);
    sub_24CC23530();
    sub_24CC23500();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_46();
    v70();
    uint64_t v71 = OUTLINED_FUNCTION_13();
    v72(v71);
    v36[33] = v36 + 34;
    sub_24CC240C0();
    OUTLINED_FUNCTION_44(&dword_24CBD5000, v66, v37, "Result with preferred template type %ld");
    OUTLINED_FUNCTION_4();
  }
  else
  {
    uint64_t v73 = OUTLINED_FUNCTION_21();
    v74(v73);
  }

  uint64_t v75 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_26(v75);
  uint64_t v76 = swift_retain();
  v36[83] = sub_24CC161E4(v76);
  uint64_t v77 = (void *)swift_task_alloc();
  v36[84] = v77;
  *uint64_t v77 = v36;
  v77[1] = sub_24CBDA480;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  return sub_24CC164BC(v78);
}

uint64_t sub_24CBDA480()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_24CBDA54C()
{
  uint64_t v1 = v0[82];
  uint64_t v16 = v0[42];
  uint64_t v15 = v0[83];
  uint64_t v2 = *(void *)(v16 + 24);
  v0[85] = v2;
  uint64_t v3 = *(void *)(v16 + 32);
  v0[14] = v1;
  v0[15] = &off_26FF26F88;
  v0[11] = v15;
  type metadata accessor for AttributionItemFactory();
  uint64_t inited = (void *)swift_initStackObject();
  v0[86] = inited;
  uint64_t v5 = v0[14];
  uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 11), v5);
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = (uint64_t *)OUTLINED_FUNCTION_48();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(v8, v6, v5);
  uint64_t v9 = *v8;
  inited[5] = v1;
  inited[6] = &off_26FF26F88;
  inited[7] = v2;
  inited[2] = v9;
  inited[8] = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 11));
  swift_task_dealloc();
  uint64_t v10 = sub_24CC23520();
  v0[87] = sub_24CC053DC(v10);
  swift_bridgeObjectRelease();
  Array<A>.asAttributionGroups()();
  v0[88] = v11;
  swift_retain();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[89] = v12;
  void *v12 = v0;
  v12[1] = sub_24CBDA758;
  OUTLINED_FUNCTION_28();
  __asm { BR              X2 }
}

uint64_t sub_24CBDA758()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v5 = v4;
  *(void *)(v7 + 720) = v6;
  *(void *)(v7 + 728) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CBDA844()
{
  uint64_t v1 = v0[90];
  uint64_t v2 = v0[63];
  uint64_t v3 = type metadata accessor for AttributionModel();
  v0[92] = v3;
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  uint64_t v4 = sub_24CBDBFC0(v1);
  v0[93] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[94] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CBDA92C;
  return sub_24CBF3A78(v4);
}

uint64_t sub_24CBDA92C()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  v1[24] = v0;
  v1[25] = v3;
  v1[26] = v4;
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v8 + 760) = v7;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24CBDAA18(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), void *a18, uint64_t type, void *a20,uint64_t a21,long long a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35)
{
  OUTLINED_FUNCTION_40();
  a34 = v36;
  a35 = v37;
  a33 = v35;
  if (v35[95])
  {
    uint64_t v38 = v35[90];
    uint64_t v39 = v35[64];
    a20 = (void *)v35[63];
    uint64_t v139 = v35[92];
    uint64_t v41 = v35[55];
    uint64_t v40 = v35[56];
    uint64_t v43 = v35[53];
    uint64_t v42 = v35[54];
    sub_24CC231F0();
    sub_24CC231D0();
    sub_24CBF4100(v38, v40);
    swift_bridgeObjectRelease();
    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v44(v41, v43);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v40, v43);
    AttributionModel.init(label:)();
    v44(v40, v43);
    sub_24CBDC220((uint64_t)a20, &qword_269818B40);
    __swift_storeEnumTagSinglePayload(v39, 0, 1, v139);
    sub_24CBDC390(v39, (uint64_t)a20, &qword_269818B40);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v45 = v35[60];
  uint64_t v47 = v35[57];
  uint64_t v46 = v35[58];
  uint64_t v48 = v35[50];
  uint64_t v49 = v35[51];
  uint64_t v140 = type metadata accessor for TellMeGeneratedSnippetModels();
  __swift_storeEnumTagSinglePayload(v49, 1, 1, v140);
  __swift_storeEnumTagSinglePayload(v48, 1, 1, v140);
  sub_24CC23530();
  int v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 88))(v45, v47);
  if (v50 == *MEMORY[0x263F5CA98])
  {
    BOOL v51 = (void (*)(uint64_t, uint64_t, uint64_t))v35[80];
    uint64_t v52 = v35[70];
    uint64_t v53 = v35[65];
    uint64_t v54 = v35[63];
    type = v35[81];
    a20 = (void *)v35[64];
    uint64_t v55 = v35[45];
    uint64_t v56 = v35[46];
    uint64_t v57 = v35[44];
    uint64_t v58 = v35[39];
    swift_bridgeObjectRelease();
    sub_24CC23750();
    uint64_t v59 = sub_24CC23700();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v57);
    uint64_t v60 = *(void *)(v59 + 16);
    swift_bridgeObjectRelease();
    v51(v52, v58, v53);
    sub_24CBDC334(v54, (uint64_t)a20, &qword_269818B40);
    uint64_t v61 = v35[74];
    uint64_t v62 = v35[73];
    uint64_t v63 = v35[50];
    uint64_t v64 = v35[41];
    *(void *)&a22 = v35[40];
    *((void *)&a22 + 1) = v64;
    a23 = v62;
    a24 = v61;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v65 = OUTLINED_FUNCTION_45();
    if (v60)
    {
      sub_24CC073A0(v65, v66, v67, v68);
      sub_24CBDC220(v63, &qword_269818B38);
      uint64_t v61 = v140;
    }
    else
    {
      sub_24CC17908(v65, v66, (uint64_t)v67, v68);
      sub_24CBDC220(v63, &qword_269818B38);
      OUTLINED_FUNCTION_55();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v77 = OUTLINED_FUNCTION_54();
  }
  else if (v50 == *MEMORY[0x263F5CA90])
  {
    a17 = (void (*)(uint64_t, uint64_t, uint64_t))v35[80];
    a18 = (void *)v35[81];
    uint64_t v69 = v35[74];
    uint64_t v70 = v35[70];
    uint64_t v61 = v35[65];
    uint64_t v72 = v35[63];
    uint64_t v71 = v35[64];
    uint64_t v73 = v35[49];
    type = v35[73];
    a20 = (void *)v35[50];
    uint64_t v74 = v35[40];
    uint64_t v75 = v35[41];
    uint64_t v76 = v35[39];
    swift_bridgeObjectRelease();
    a17(v70, v76, v61);
    sub_24CBDC334(v72, v71, &qword_269818B40);
    *(void *)&a22 = v74;
    *((void *)&a22 + 1) = v75;
    a23 = type;
    a24 = v69;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24CC17908(v70, v71, (uint64_t)&a22, v73);
    sub_24CBDC220((uint64_t)a20, &qword_269818B38);
    OUTLINED_FUNCTION_55();
    swift_storeEnumTagMultiPayload();
    uint64_t v77 = OUTLINED_FUNCTION_54();
  }
  else
  {
    uint64_t v79 = (void (*)(uint64_t, uint64_t, uint64_t))v35[80];
    if (v50 != *MEMORY[0x263F5CAA0])
    {
      uint64_t v125 = v35[68];
      uint64_t v126 = v35[65];
      uint64_t v127 = v35[39];
      swift_bridgeObjectRelease();
      v79(v125, v127, v126);
      v128 = sub_24CC23D80();
      os_log_type_t v129 = sub_24CC24080();
      int v130 = v129;
      BOOL v131 = os_log_type_enabled(v128, v129);
      uint64_t v132 = v35[68];
      uint64_t v133 = v35[66];
      if (v131)
      {
        a17 = (void (*)(uint64_t, uint64_t, uint64_t))v35[65];
        a18 = v35 + 28;
        OUTLINED_FUNCTION_50();
        a16 = v134;
        LODWORD(type) = v130;
        v135 = (float *)OUTLINED_FUNCTION_9();
        OUTLINED_FUNCTION_23(v135, 3.852e-34);
        a15 = v136;
        sub_24CC23530();
        a14 = (void *)sub_24CC23500();
        v137 = *(void (**)(void))(v126 + 8);
        a20 = v35 + 29;
        OUTLINED_FUNCTION_46();
        v137();
        (*(void (**)(uint64_t, void (*)(uint64_t, uint64_t, uint64_t)))(v133 + 8))(v132, a17);
        v35[28] = a14;
        sub_24CC240C0();
        _os_log_impl(&dword_24CBD5000, v128, (os_log_type_t)type, "Unhandled template type: %ld", (uint8_t *)v135, 0xCu);
        OUTLINED_FUNCTION_4();
      }
      else
      {
        uint64_t v138 = v35[58];
        (*(void (**)(void, void))(v133 + 8))(v35[68], v35[65]);

        v137 = *(void (**)(void))(v138 + 8);
      }
      uint64_t v61 = v140;
      ((void (*)(void, void))v137)(v35[60], v35[57]);
      goto LABEL_14;
    }
    uint64_t v80 = v35[74];
    type = (uint64_t)(v35 + 20);
    a20 = v35 + 29;
    a13 = v35[73];
    a14 = v35 + 16;
    uint64_t v81 = v35[70];
    a11 = v35[66];
    a12 = v35[65];
    a17 = (void (*)(uint64_t, uint64_t, uint64_t))(v35 + 31);
    a18 = (void *)v35[51];
    uint64_t v82 = v35[49];
    a15 = v35[50];
    a16 = v35[87];
    uint64_t v84 = v35[45];
    uint64_t v83 = v35[46];
    uint64_t v85 = v35[44];
    uint64_t v86 = v35[41];
    a10 = v35[40];
    ((void (*)(uint64_t, void))v79)(v81, v35[39]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24CC23750();
    sub_24CC23720();
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
    Array<A>.asTextRuns()();
    uint64_t v88 = v87;
    swift_bridgeObjectRelease();
    v35[29] = v88;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
    sub_24CC238F0();
    type metadata accessor for LearnMoreSnippetModel();
    v35[16] = a10;
    v35[17] = v86;
    v35[18] = a13;
    v35[19] = v80;
    sub_24CC238F0();
    (*(void (**)(uint64_t, uint64_t))(a11 + 8))(v81, a12);
    sub_24CBDC220(a15, &qword_269818B38);
    uint64_t v61 = v140;
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload(v82, 0, 1, v140);
    sub_24CBDC390(v82, a15, &qword_269818B38);
    v35[31] = a16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B60);
    sub_24CC238F0();
    type metadata accessor for AttributionListSnippetModel();
    v35[20] = a10;
    v35[21] = v86;
    v35[22] = a13;
    v35[23] = v80;
    sub_24CC238F0();
    sub_24CBDC220((uint64_t)a18, &qword_269818B38);
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload(v82, 0, 1, v140);
    uint64_t v77 = v82;
    uint64_t v78 = (uint64_t)a18;
  }
  sub_24CBDC390(v77, v78, &qword_269818B38);
LABEL_14:
  uint64_t v89 = v35[48];
  sub_24CBDC334(v35[51], v89, &qword_269818B38);
  if (__swift_getEnumTagSinglePayload(v89, 1, v61) == 1)
  {
    type = (uint64_t)(v35 + 32);
    a20 = v35 + 27;
    uint64_t v90 = (void (*)(uint64_t, uint64_t, uint64_t))v35[80];
    uint64_t v91 = v35[67];
    uint64_t v92 = v35[65];
    uint64_t v93 = v35[61];
    uint64_t v95 = v35[58];
    uint64_t v94 = v35[59];
    uint64_t v96 = v35[57];
    uint64_t v97 = v35[39];
    sub_24CBDC220(v35[48], &qword_269818B38);
    v90(v91, v97, v92);
    sub_24CC23530();
    (*(void (**)(uint64_t, void, uint64_t))(v95 + 104))(v94, *MEMORY[0x263F5CAA0], v96);
    sub_24CBDC1D0();
    sub_24CC23F80();
    sub_24CC23F80();
    uint64_t v98 = v35[32];
    uint64_t v99 = v35[27];
    uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
    v100(v94, v96);
    v100(v93, v96);
    if (v98 == v99) {
      sub_24CBDC334(v35[63], v35[62], &qword_269818B40);
    }
    else {
      __swift_storeEnumTagSinglePayload(v35[62], 1, 1, v35[92]);
    }
    uint64_t v103 = v35[74];
    uint64_t v104 = v35[73];
    uint64_t v105 = v35[67];
    uint64_t v106 = v35[62];
    uint64_t v107 = v35[63];
    uint64_t v108 = v35[51];
    a22 = *((_OWORD *)v35 + 20);
    a23 = v104;
    a24 = v103;
    sub_24CBF8B70(v105, v106, 0, (uint64_t *)&a22);
    char v109 = sub_24CBF8F20();
    swift_release();
    sub_24CBDC220(v108, &qword_269818B38);
    sub_24CBDC220(v107, &qword_269818B40);
    if (v109)
    {
      sub_24CBDC2D0(v35[43], v35[47]);
      OUTLINED_FUNCTION_51();
      swift_storeEnumTagMultiPayload();
      uint64_t v110 = 0;
    }
    else
    {
      sub_24CBDC274(v35[43]);
      uint64_t v110 = 1;
    }
    uint64_t v111 = v35[51];
    uint64_t v112 = v35[47];
    __swift_storeEnumTagSinglePayload(v112, v110, 1, v140);
    sub_24CBDC390(v112, v111, &qword_269818B38);
  }
  else
  {
    uint64_t v101 = v35[63];
    uint64_t v102 = v35[48];
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CBDC220(v102, &qword_269818B38);
    sub_24CBDC220(v101, &qword_269818B40);
  }
  uint64_t v113 = v35[50];
  uint64_t v114 = v35[38];
  sub_24CBDC390(v35[51], v114, &qword_269818B38);
  uint64_t v115 = type metadata accessor for SnippetResponseComponents();
  sub_24CBDC390(v113, v114 + *(int *)(v115 + 20), &qword_269818B38);
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_5();
  return v117(v116, v117, v118, v119, v120, v121, v122, v123, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, type,
           a20,
           v140,
           a22,
           *((void *)&a22 + 1),
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_24CBDB4D0(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return MEMORY[0x270FA2498](sub_24CBDB4F0, 0, 0);
}

uint64_t sub_24CBDB4F0()
{
  uint64_t v25 = v0;
  *(void *)(v0 + 48) = sub_24CC235D0();
  *(void *)(v0 + 56) = v1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_47();
  if (v2) {
    uint64_t v3 = sub_24CC235D0();
  }
  else {
    uint64_t v3 = sub_24CC23670();
  }
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 72) = v3;
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CC23DA0();
  *(void *)(v0 + 80) = __swift_project_value_buffer(v7, (uint64_t)qword_2698195F0);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_24CC23D80();
  os_log_type_t v9 = sub_24CC24070();
  uint64_t v10 = sub_24CC24000;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v11 = (_DWORD *)OUTLINED_FUNCTION_9();
    uint64_t v24 = swift_slowAlloc();
    *uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 24) = sub_24CC12DF0(v5, v6, &v24);
    sub_24CC240C0();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_44(&dword_24CBD5000, v8, v9, "Evaluating %s eligibility...");
    swift_arrayDestroy();
    uint64_t v10 = sub_24CC24000;
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_24CC23670();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_47();
  if (v12)
  {
    OUTLINED_FUNCTION_42();
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_24CBDB89C;
    OUTLINED_FUNCTION_45();
  }
  else
  {
    OUTLINED_FUNCTION_12();
    if (!v14)
    {
      OUTLINED_FUNCTION_36();
      uint64_t v17 = sub_24CC23D80();
      os_log_type_t v18 = sub_24CC24080();
      if (os_log_type_enabled(v17, v18))
      {
        unint64_t v20 = *(void *)(v0 + 64);
        uint64_t v19 = *(void *)(v0 + 72);
        OUTLINED_FUNCTION_9();
        uint64_t v24 = OUTLINED_FUNCTION_15();
        OUTLINED_FUNCTION_11(COERCE_FLOAT(*((void *)v10 + 365)));
        *(void *)(v0 + 16) = sub_24CC12DF0(v19, v20, &v24);
        sub_24CC240C0();
        OUTLINED_FUNCTION_43();
        _os_log_impl(&dword_24CBD5000, v17, v18, "Error fetching or evaluating tip document: %s", (uint8_t *)(v0 + 32), 0xCu);
        OUTLINED_FUNCTION_22();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_4();
      }
      else
      {
        OUTLINED_FUNCTION_57();
      }

      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_28();
      __asm { BRAA            X2, X16 }
    }
    OUTLINED_FUNCTION_42();
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_24CBDBB18;
    OUTLINED_FUNCTION_38();
  }
  OUTLINED_FUNCTION_28();
  return MEMORY[0x270F7EA68]();
}

uint64_t sub_24CBDB89C()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 96) = v4;
  swift_task_dealloc();
  if (v0) {

  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

#error "24CBDBA94: call analysis failed (funcsize=102)"

uint64_t sub_24CBDBB18()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 112) = v4;
  swift_task_dealloc();
  if (v0) {

  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

#error "24CBDBC98: call analysis failed (funcsize=69)"

#error "24CBDBDFC: call analysis failed (funcsize=91)"

uint64_t sub_24CBDBE84()
{
  OUTLINED_FUNCTION_37();
  uint64_t v12 = v1;
  OUTLINED_FUNCTION_36();
  uint64_t v2 = (void *)sub_24CC23D80();
  os_log_type_t v3 = sub_24CC24080();
  if (OUTLINED_FUNCTION_24(v3))
  {
    unint64_t v5 = v1[8];
    uint64_t v4 = v1[9];
    OUTLINED_FUNCTION_9();
    uint64_t v11 = OUTLINED_FUNCTION_15();
    *uint64_t v0 = 136315138;
    swift_bridgeObjectRetain();
    v1[2] = sub_24CC12DF0(v4, v5, &v11);
    sub_24CC240C0();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_8(&dword_24CBD5000, v6, v7, "Error fetching or evaluating tip document: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
    OUTLINED_FUNCTION_57();
  }

  uint64_t v8 = OUTLINED_FUNCTION_33();
  return v9(v8);
}

uint64_t sub_24CBDBFC0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_24CC21208(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_24CC21208((char *)(v7 > 1), v8 + 1, 1);
      }
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24CBDC098()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24CBDC0C8()
{
  sub_24CBDC098();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for SnippetModelProvider()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_24CBDC1D0()
{
  unint64_t result = qword_269818B50;
  if (!qword_269818B50)
  {
    sub_24CC23510();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818B50);
  }
  return result;
}

uint64_t sub_24CBDC220(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_24CBDC274(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBDC2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBDC334(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_24CBDC390(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  v2[79] = a1;
  v2[80] = *(void *)(v3 + 16);
  v2[81] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  return v1;
}

void OUTLINED_FUNCTION_4()
{
  JUMPOUT(0x25330D070);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_24CC23DA0();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_24CC240C0();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return *(void *)(v0 + 312);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_arrayDestroy();
}

float *OUTLINED_FUNCTION_23(float *result, float a2)
{
  *unint64_t result = a2;
  return result;
}

BOOL OUTLINED_FUNCTION_24(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  *(void *)(v1 + 656) = a1;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return type metadata accessor for TipsApp();
}

BOOL OUTLINED_FUNCTION_30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_24CC12DF0(v9, v10, &a9);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return *(void *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_44(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_54()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  return MEMORY[0x270FA0288](v1, a1);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t *sub_24CBDC984(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for TellMeGeneratedSnippetModels();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
          uint64_t v11 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_8;
        case 2u:
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16);
          v15(a1, a2, v14);
          uint64_t v16 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v15((uint64_t *)((char *)a1 + v16[5]), (uint64_t *)((char *)a2 + v16[5]), v14);
          uint64_t v17 = v16[6];
          os_log_type_t v18 = (char *)a1 + v17;
          uint64_t v19 = (char *)a2 + v17;
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
          v15((uint64_t *)((char *)a1 + v16[7]), (uint64_t *)((char *)a2 + v16[7]), v14);
          v15((uint64_t *)((char *)a1 + v16[8]), (uint64_t *)((char *)a2 + v16[8]), v14);
          uint64_t v21 = v16[9];
          uint64_t v22 = (char *)a1 + v21;
          uint64_t v23 = (char *)a2 + v21;
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
          uint64_t v25 = v16[10];
          uint64_t v26 = (char *)a1 + v25;
          uint64_t v27 = (char *)a2 + v25;
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
          *((unsigned char *)a1 + v16[11]) = *((unsigned char *)a2 + v16[11]);
          goto LABEL_14;
        case 3u:
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          unint64_t v30 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v29 - 8) + 16);
          v30(a1, a2, v29);
          unint64_t v31 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v30((uint64_t *)((char *)a1 + v31[5]), (uint64_t *)((char *)a2 + v31[5]), v29);
          v30((uint64_t *)((char *)a1 + v31[6]), (uint64_t *)((char *)a2 + v31[6]), v29);
          uint64_t v32 = v31[7];
          unint64_t v33 = (char *)a1 + v32;
          unint64_t v34 = (char *)a2 + v32;
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
          uint64_t v13 = v31[8];
          goto LABEL_13;
        case 4u:
          uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v36 - 8) + 16))(a1, a2, v36);
          uint64_t v37 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v38 = v37[5];
          uint64_t v39 = (char *)a1 + v38;
          uint64_t v40 = (char *)a2 + v38;
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
          uint64_t v42 = v37[6];
          uint64_t v43 = (char *)a1 + v42;
          uint64_t v44 = (char *)a2 + v42;
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
          uint64_t v13 = v37[7];
          goto LABEL_13;
        case 5u:
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          uint64_t v47 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v46 - 8) + 16);
          v47(a1, a2, v46);
          uint64_t v48 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v49 = v48[5];
          int v50 = (char *)a1 + v49;
          BOOL v51 = (char *)a2 + v49;
          uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16))(v50, v51, v52);
          uint64_t v53 = v48[6];
          uint64_t v54 = (char *)a1 + v53;
          uint64_t v55 = (char *)a2 + v53;
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
          v47((uint64_t *)((char *)a1 + v48[7]), (uint64_t *)((char *)a2 + v48[7]), v46);
          uint64_t v57 = v48[8];
          uint64_t v58 = (char *)a1 + v57;
          uint64_t v59 = (char *)a2 + v57;
          uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v58, v59, v60);
          uint64_t v13 = v48[9];
          goto LABEL_13;
        default:
          uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
          uint64_t v11 = type metadata accessor for AttributionListSnippetModel();
LABEL_8:
          uint64_t v13 = *(int *)(v11 + 20);
LABEL_13:
          uint64_t v61 = (char *)a1 + v13;
          uint64_t v62 = (char *)a2 + v13;
          uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
LABEL_14:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
          break;
      }
    }
    uint64_t v64 = *(int *)(a3 + 20);
    uint64_t v65 = (char *)a1 + v64;
    uint64_t v66 = (char *)a2 + v64;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v64, 1, v7))
    {
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
      memcpy(v65, v66, *(void *)(*(void *)(v67 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(v65, v66, v70);
          uint64_t v69 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_20;
        case 2u:
          uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v73 = *(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 16);
          v73(v65, v66, v72);
          uint64_t v74 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v73(&v65[v74[5]], &v66[v74[5]], v72);
          uint64_t v75 = v74[6];
          uint64_t v76 = &v65[v75];
          uint64_t v77 = &v66[v75];
          uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16))(v76, v77, v78);
          v73(&v65[v74[7]], &v66[v74[7]], v72);
          v73(&v65[v74[8]], &v66[v74[8]], v72);
          uint64_t v79 = v74[9];
          uint64_t v80 = &v65[v79];
          uint64_t v81 = &v66[v79];
          uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
          uint64_t v83 = v74[10];
          uint64_t v84 = &v65[v83];
          uint64_t v85 = &v66[v83];
          uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v86 - 8) + 16))(v84, v85, v86);
          v65[v74[11]] = v66[v74[11]];
          goto LABEL_26;
        case 3u:
          uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v88 = *(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16);
          v88(v65, v66, v87);
          uint64_t v89 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v88(&v65[v89[5]], &v66[v89[5]], v87);
          v88(&v65[v89[6]], &v66[v89[6]], v87);
          uint64_t v90 = v89[7];
          uint64_t v91 = &v65[v90];
          uint64_t v92 = &v66[v90];
          uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v93 - 8) + 16))(v91, v92, v93);
          uint64_t v71 = v89[8];
          goto LABEL_25;
        case 4u:
          uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(v65, v66, v94);
          uint64_t v95 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v96 = v95[5];
          uint64_t v97 = &v65[v96];
          uint64_t v98 = &v66[v96];
          uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 16))(v97, v98, v99);
          uint64_t v100 = v95[6];
          uint64_t v101 = &v65[v100];
          uint64_t v102 = &v66[v100];
          uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 16))(v101, v102, v103);
          uint64_t v71 = v95[7];
          goto LABEL_25;
        case 5u:
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 16);
          v105(v65, v66, v104);
          uint64_t v106 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v107 = v106[5];
          uint64_t v108 = &v65[v107];
          char v109 = &v66[v107];
          uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v110 - 8) + 16))(v108, v109, v110);
          uint64_t v111 = v106[6];
          uint64_t v112 = &v65[v111];
          uint64_t v113 = &v66[v111];
          uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v114 - 8) + 16))(v112, v113, v114);
          v105(&v65[v106[7]], &v66[v106[7]], v104);
          uint64_t v115 = v106[8];
          uint64_t v116 = &v65[v115];
          v117 = &v66[v115];
          uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v118 - 8) + 16))(v116, v117, v118);
          uint64_t v71 = v106[9];
          goto LABEL_25;
        default:
          uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16))(v65, v66, v68);
          uint64_t v69 = type metadata accessor for AttributionListSnippetModel();
LABEL_20:
          uint64_t v71 = *(int *)(v69 + 20);
LABEL_25:
          uint64_t v119 = &v65[v71];
          uint64_t v120 = &v66[v71];
          uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v121 - 8) + 16))(v119, v120, v121);
LABEL_26:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v65, 0, 1, v7);
          break;
      }
    }
  }
  return a1;
}

uint64_t sub_24CBDD6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
        uint64_t v6 = type metadata accessor for AttributionListSnippetModel();
        goto LABEL_5;
      case 1u:
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
        uint64_t v6 = type metadata accessor for LearnMoreSnippetModel();
LABEL_5:
        uint64_t v8 = *(int *)(v6 + 20);
        goto LABEL_10;
      case 2u:
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
        v10(a1, v9);
        uint64_t v11 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v10(a1 + v11[5], v9);
        uint64_t v12 = a1 + v11[6];
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
        v10(a1 + v11[7], v9);
        v10(a1 + v11[8], v9);
        uint64_t v14 = a1 + v11[9];
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
        uint64_t v8 = v11[10];
        goto LABEL_10;
      case 3u:
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
        v17(a1, v16);
        os_log_type_t v18 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v17(a1 + v18[5], v16);
        v17(a1 + v18[6], v16);
        uint64_t v19 = a1 + v18[7];
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
        uint64_t v8 = v18[8];
        goto LABEL_10;
      case 4u:
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a1, v21);
        uint64_t v22 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v23 = a1 + v22[5];
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
        uint64_t v25 = a1 + v22[6];
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
        uint64_t v8 = v22[7];
        goto LABEL_10;
      case 5u:
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8);
        v28(a1, v27);
        uint64_t v29 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v30 = a1 + v29[5];
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
        uint64_t v32 = a1 + v29[6];
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
        v28(a1 + v29[7], v27);
        uint64_t v34 = a1 + v29[8];
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
        uint64_t v8 = v29[9];
LABEL_10:
        uint64_t v36 = a1 + v8;
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v37 - 8) + 8))(v36, v37);
        break;
      default:
        break;
    }
  }
  uint64_t v38 = a1 + *(int *)(a2 + 20);
  uint64_t result = __swift_getEnumTagSinglePayload(v38, 1, v4);
  if (!result)
  {
    uint64_t result = swift_getEnumCaseMultiPayload();
    switch((int)result)
    {
      case 0:
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v38, v40);
        uint64_t v41 = type metadata accessor for AttributionListSnippetModel();
        goto LABEL_15;
      case 1:
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8))(v38, v42);
        uint64_t v41 = type metadata accessor for LearnMoreSnippetModel();
LABEL_15:
        uint64_t v43 = *(int *)(v41 + 20);
        goto LABEL_20;
      case 2:
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v45 = *(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8);
        v45(v38, v44);
        uint64_t v46 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v45(v38 + v46[5], v44);
        uint64_t v47 = v38 + v46[6];
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v48 - 8) + 8))(v47, v48);
        v45(v38 + v46[7], v44);
        v45(v38 + v46[8], v44);
        uint64_t v49 = v38 + v46[9];
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v50 - 8) + 8))(v49, v50);
        uint64_t v43 = v46[10];
        goto LABEL_20;
      case 3:
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v52 = *(void (**)(uint64_t, uint64_t))(*(void *)(v51 - 8) + 8);
        v52(v38, v51);
        uint64_t v53 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v52(v38 + v53[5], v51);
        v52(v38 + v53[6], v51);
        uint64_t v54 = v38 + v53[7];
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v55 - 8) + 8))(v54, v55);
        uint64_t v43 = v53[8];
        goto LABEL_20;
      case 4:
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v56 - 8) + 8))(v38, v56);
        uint64_t v57 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v58 = v38 + v57[5];
        uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v59 - 8) + 8))(v58, v59);
        uint64_t v60 = v38 + v57[6];
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 8))(v60, v61);
        uint64_t v43 = v57[7];
        goto LABEL_20;
      case 5:
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v63 = *(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 8);
        v63(v38, v62);
        uint64_t v64 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v65 = v38 + v64[5];
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v66 - 8) + 8))(v65, v66);
        uint64_t v67 = v38 + v64[6];
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v68 - 8) + 8))(v67, v68);
        v63(v38 + v64[7], v62);
        uint64_t v69 = v38 + v64[8];
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v70 - 8) + 8))(v69, v70);
        uint64_t v43 = v64[9];
LABEL_20:
        uint64_t v71 = v38 + v43;
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        uint64_t v73 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8);
        uint64_t result = v73(v71, v72);
        break;
      default:
        return result;
    }
  }
  return result;
}

char *sub_24CBDE1CC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        uint64_t v9 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_6;
      case 2u:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        v13(a1, a2, v12);
        uint64_t v14 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v13(&a1[v14[5]], &a2[v14[5]], v12);
        uint64_t v15 = v14[6];
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
        v13(&a1[v14[7]], &a2[v14[7]], v12);
        v13(&a1[v14[8]], &a2[v14[8]], v12);
        uint64_t v19 = v14[9];
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
        uint64_t v23 = v14[10];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
        a1[v14[11]] = a2[v14[11]];
        goto LABEL_12;
      case 3u:
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
        v28(a1, a2, v27);
        uint64_t v29 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v28(&a1[v29[5]], &a2[v29[5]], v27);
        v28(&a1[v29[6]], &a2[v29[6]], v27);
        uint64_t v30 = v29[7];
        uint64_t v31 = &a1[v30];
        uint64_t v32 = &a2[v30];
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
        uint64_t v11 = v29[8];
        goto LABEL_11;
      case 4u:
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(a1, a2, v34);
        uint64_t v35 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v36 = v35[5];
        uint64_t v37 = &a1[v36];
        uint64_t v38 = &a2[v36];
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
        uint64_t v40 = v35[6];
        uint64_t v41 = &a1[v40];
        uint64_t v42 = &a2[v40];
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
        uint64_t v11 = v35[7];
        goto LABEL_11;
      case 5u:
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
        v45(a1, a2, v44);
        uint64_t v46 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v47 = v46[5];
        uint64_t v48 = &a1[v47];
        uint64_t v49 = &a2[v47];
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
        uint64_t v51 = v46[6];
        uint64_t v52 = &a1[v51];
        uint64_t v53 = &a2[v51];
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
        v45(&a1[v46[7]], &a2[v46[7]], v44);
        uint64_t v55 = v46[8];
        uint64_t v56 = &a1[v55];
        uint64_t v57 = &a2[v55];
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16))(v56, v57, v58);
        uint64_t v11 = v46[9];
        goto LABEL_11;
      default:
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        uint64_t v9 = type metadata accessor for AttributionListSnippetModel();
LABEL_6:
        uint64_t v11 = *(int *)(v9 + 20);
LABEL_11:
        uint64_t v59 = &a1[v11];
        uint64_t v60 = &a2[v11];
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
LABEL_12:
        swift_storeEnumTagMultiPayload();
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
        break;
    }
  }
  uint64_t v62 = *(int *)(a3 + 20);
  uint64_t v63 = &a1[v62];
  uint64_t v64 = &a2[v62];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v62], 1, v6))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(v63, v64, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16))(v63, v64, v68);
        uint64_t v67 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_18;
      case 2u:
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
        v71(v63, v64, v70);
        uint64_t v72 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v71(&v63[v72[5]], &v64[v72[5]], v70);
        uint64_t v73 = v72[6];
        uint64_t v74 = &v63[v73];
        uint64_t v75 = &v64[v73];
        uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16))(v74, v75, v76);
        v71(&v63[v72[7]], &v64[v72[7]], v70);
        v71(&v63[v72[8]], &v64[v72[8]], v70);
        uint64_t v77 = v72[9];
        uint64_t v78 = &v63[v77];
        uint64_t v79 = &v64[v77];
        uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 16))(v78, v79, v80);
        uint64_t v81 = v72[10];
        uint64_t v82 = &v63[v81];
        uint64_t v83 = &v64[v81];
        uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16))(v82, v83, v84);
        v63[v72[11]] = v64[v72[11]];
        goto LABEL_24;
      case 3u:
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v86 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
        v86(v63, v64, v85);
        uint64_t v87 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v86(&v63[v87[5]], &v64[v87[5]], v85);
        v86(&v63[v87[6]], &v64[v87[6]], v85);
        uint64_t v88 = v87[7];
        uint64_t v89 = &v63[v88];
        uint64_t v90 = &v64[v88];
        uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 16))(v89, v90, v91);
        uint64_t v69 = v87[8];
        goto LABEL_23;
      case 4u:
        uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16))(v63, v64, v92);
        uint64_t v93 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v94 = v93[5];
        uint64_t v95 = &v63[v94];
        uint64_t v96 = &v64[v94];
        uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 16))(v95, v96, v97);
        uint64_t v98 = v93[6];
        uint64_t v99 = &v63[v98];
        uint64_t v100 = &v64[v98];
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16))(v99, v100, v101);
        uint64_t v69 = v93[7];
        goto LABEL_23;
      case 5u:
        uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v103 = *(void (**)(char *, char *, uint64_t))(*(void *)(v102 - 8) + 16);
        v103(v63, v64, v102);
        uint64_t v104 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v105 = v104[5];
        uint64_t v106 = &v63[v105];
        uint64_t v107 = &v64[v105];
        uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v108 - 8) + 16))(v106, v107, v108);
        uint64_t v109 = v104[6];
        uint64_t v110 = &v63[v109];
        uint64_t v111 = &v64[v109];
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 16))(v110, v111, v112);
        v103(&v63[v104[7]], &v64[v104[7]], v102);
        uint64_t v113 = v104[8];
        uint64_t v114 = &v63[v113];
        uint64_t v115 = &v64[v113];
        uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v116 - 8) + 16))(v114, v115, v116);
        uint64_t v69 = v104[9];
        goto LABEL_23;
      default:
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v63, v64, v66);
        uint64_t v67 = type metadata accessor for AttributionListSnippetModel();
LABEL_18:
        uint64_t v69 = *(int *)(v67 + 20);
LABEL_23:
        v117 = &v63[v69];
        uint64_t v118 = &v64[v69];
        uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 16))(v117, v118, v119);
LABEL_24:
        swift_storeEnumTagMultiPayload();
        __swift_storeEnumTagSinglePayload((uint64_t)v63, 0, 1, v6);
        break;
    }
  }
  return a1;
}

unsigned char *sub_24CBDEEF0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
          uint64_t v10 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_12;
        case 2u:
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v20 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 16);
          v20(a1, a2, v19);
          uint64_t v21 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v20(&a1[v21[5]], &a2[v21[5]], v19);
          uint64_t v22 = v21[6];
          uint64_t v23 = &a1[v22];
          uint64_t v24 = &a2[v22];
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
          v20(&a1[v21[7]], &a2[v21[7]], v19);
          v20(&a1[v21[8]], &a2[v21[8]], v19);
          uint64_t v26 = v21[9];
          uint64_t v27 = &a1[v26];
          uint64_t v28 = &a2[v26];
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
          uint64_t v30 = v21[10];
          uint64_t v31 = &a1[v30];
          uint64_t v32 = &a2[v30];
          uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
          a1[v21[11]] = a2[v21[11]];
          goto LABEL_18;
        case 3u:
          uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v34 - 8) + 16);
          v35(a1, a2, v34);
          uint64_t v36 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v35(&a1[v36[5]], &a2[v36[5]], v34);
          v35(&a1[v36[6]], &a2[v36[6]], v34);
          uint64_t v37 = v36[7];
          uint64_t v38 = &a1[v37];
          uint64_t v39 = &a2[v37];
          uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
          uint64_t v18 = v36[8];
          goto LABEL_17;
        case 4u:
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v41 - 8) + 16))(a1, a2, v41);
          uint64_t v42 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v43 = v42[5];
          uint64_t v44 = &a1[v43];
          uint64_t v45 = &a2[v43];
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
          uint64_t v47 = v42[6];
          uint64_t v48 = &a1[v47];
          uint64_t v49 = &a2[v47];
          uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
          uint64_t v18 = v42[7];
          goto LABEL_17;
        case 5u:
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          v261 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v51 - 8) + 16);
          v261(a1, a2, v51);
          uint64_t v52 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v53 = v52[5];
          uint64_t v54 = &a1[v53];
          uint64_t v55 = &a2[v53];
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
          uint64_t v57 = v52[6];
          uint64_t v58 = &a1[v57];
          uint64_t v59 = &a2[v57];
          uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v58, v59, v60);
          v261(&a1[v52[7]], &a2[v52[7]], v51);
          uint64_t v61 = v52[8];
          uint64_t v62 = &a1[v61];
          uint64_t v63 = &a2[v61];
          uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(v62, v63, v64);
          uint64_t v18 = v52[9];
          goto LABEL_17;
        default:
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
          uint64_t v10 = type metadata accessor for AttributionListSnippetModel();
LABEL_12:
          uint64_t v18 = *(int *)(v10 + 20);
LABEL_17:
          uint64_t v65 = &a1[v18];
          uint64_t v66 = &a2[v18];
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 16))(v65, v66, v67);
LABEL_18:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
          break;
      }
      goto LABEL_25;
    }
LABEL_7:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_25;
  }
  if (v8)
  {
    sub_24CBE3E00((uint64_t)a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24CBE3E00((uint64_t)a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v68 - 8) + 16))(a1, a2, v68);
        uint64_t v69 = *(int *)(type metadata accessor for LearnMoreSnippetModel() + 20);
        uint64_t v70 = &a1[v69];
        uint64_t v71 = &a2[v69];
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 16))(v70, v71, v72);
        break;
      case 2u:
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v74 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v73 - 8) + 16);
        v74(a1, a2, v73);
        uint64_t v75 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v74(&a1[v75[5]], &a2[v75[5]], v73);
        uint64_t v76 = v75[6];
        uint64_t v77 = &a1[v76];
        uint64_t v78 = &a2[v76];
        uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16))(v77, v78, v79);
        v74(&a1[v75[7]], &a2[v75[7]], v73);
        v74(&a1[v75[8]], &a2[v75[8]], v73);
        uint64_t v80 = v75[9];
        uint64_t v81 = &a1[v80];
        uint64_t v82 = &a2[v80];
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 16))(v81, v82, v83);
        uint64_t v84 = v75[10];
        uint64_t v85 = &a1[v84];
        uint64_t v86 = &a2[v84];
        uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16))(v85, v86, v87);
        a1[v75[11]] = a2[v75[11]];
        break;
      case 3u:
        uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v89 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v88 - 8) + 16);
        v89(a1, a2, v88);
        uint64_t v90 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v89(&a1[v90[5]], &a2[v90[5]], v88);
        v89(&a1[v90[6]], &a2[v90[6]], v88);
        uint64_t v91 = v90[7];
        uint64_t v92 = &a1[v91];
        uint64_t v93 = &a2[v91];
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(v92, v93, v94);
        uint64_t v95 = v90[8];
        uint64_t v96 = &a1[v95];
        uint64_t v97 = &a2[v95];
        uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 16))(v96, v97, v98);
        break;
      case 4u:
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v99 - 8) + 16))(a1, a2, v99);
        uint64_t v100 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v101 = v100[5];
        uint64_t v102 = &a1[v101];
        uint64_t v103 = &a2[v101];
        uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 16))(v102, v103, v104);
        uint64_t v105 = v100[6];
        uint64_t v106 = &a1[v105];
        uint64_t v107 = &a2[v105];
        uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v108 - 8) + 16))(v106, v107, v108);
        uint64_t v109 = v100[7];
        uint64_t v110 = &a1[v109];
        uint64_t v111 = &a2[v109];
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 16))(v110, v111, v112);
        break;
      case 5u:
        uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v114 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v113 - 8) + 16);
        v114(a1, a2, v113);
        uint64_t v115 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v116 = v115[5];
        v117 = &a1[v116];
        uint64_t v118 = &a2[v116];
        uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 16))(v117, v118, v119);
        uint64_t v120 = v115[6];
        uint64_t v121 = &a1[v120];
        uint64_t v122 = &a2[v120];
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 16))(v121, v122, v123);
        v114(&a1[v115[7]], &a2[v115[7]], v113);
        uint64_t v124 = v115[8];
        uint64_t v125 = &a1[v124];
        uint64_t v126 = &a2[v124];
        uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v127 - 8) + 16))(v125, v126, v127);
        uint64_t v128 = v115[9];
        os_log_type_t v129 = &a1[v128];
        int v130 = &a2[v128];
        uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v131 - 8) + 16))(v129, v130, v131);
        break;
      default:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_25:
  uint64_t v132 = *(int *)(a3 + 20);
  uint64_t v133 = &a1[v132];
  uint64_t v134 = &a2[v132];
  int v135 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v132], 1, v6);
  int v136 = __swift_getEnumTagSinglePayload((uint64_t)v134, 1, v6);
  if (v135)
  {
    if (!v136)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v145 - 8) + 16))(v133, v134, v145);
          uint64_t v138 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_36;
        case 2u:
          uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          v148 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v147 - 8) + 16);
          v148(v133, v134, v147);
          v149 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v148(&v133[v149[5]], &v134[v149[5]], v147);
          uint64_t v150 = v149[6];
          v151 = &v133[v150];
          v152 = &v134[v150];
          uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 16))(v151, v152, v153);
          v148(&v133[v149[7]], &v134[v149[7]], v147);
          v148(&v133[v149[8]], &v134[v149[8]], v147);
          uint64_t v154 = v149[9];
          v155 = &v133[v154];
          v156 = &v134[v154];
          uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v157 - 8) + 16))(v155, v156, v157);
          uint64_t v158 = v149[10];
          v159 = &v133[v158];
          v160 = &v134[v158];
          uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 16))(v159, v160, v161);
          v133[v149[11]] = v134[v149[11]];
          goto LABEL_42;
        case 3u:
          uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          v163 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v162 - 8) + 16);
          v163(v133, v134, v162);
          v164 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v163(&v133[v164[5]], &v134[v164[5]], v162);
          v163(&v133[v164[6]], &v134[v164[6]], v162);
          uint64_t v165 = v164[7];
          v166 = &v133[v165];
          v167 = &v134[v165];
          uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v168 - 8) + 16))(v166, v167, v168);
          uint64_t v146 = v164[8];
          goto LABEL_41;
        case 4u:
          uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v169 - 8) + 16))(v133, v134, v169);
          v170 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v171 = v170[5];
          v172 = &v133[v171];
          v173 = &v134[v171];
          uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v174 - 8) + 16))(v172, v173, v174);
          uint64_t v175 = v170[6];
          v176 = &v133[v175];
          v177 = &v134[v175];
          uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v178 - 8) + 16))(v176, v177, v178);
          uint64_t v146 = v170[7];
          goto LABEL_41;
        case 5u:
          uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          v262 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v179 - 8) + 16);
          v262(v133, v134, v179);
          v180 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v181 = v180[5];
          v182 = &v133[v181];
          v183 = &v134[v181];
          uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 16))(v182, v183, v184);
          uint64_t v185 = v180[6];
          v186 = &v133[v185];
          v187 = &v134[v185];
          uint64_t v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v188 - 8) + 16))(v186, v187, v188);
          v262(&v133[v180[7]], &v134[v180[7]], v179);
          uint64_t v189 = v180[8];
          v190 = &v133[v189];
          v191 = &v134[v189];
          uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v192 - 8) + 16))(v190, v191, v192);
          uint64_t v146 = v180[9];
          goto LABEL_41;
        default:
          uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v137 - 8) + 16))(v133, v134, v137);
          uint64_t v138 = type metadata accessor for AttributionListSnippetModel();
LABEL_36:
          uint64_t v146 = *(int *)(v138 + 20);
LABEL_41:
          v193 = &v133[v146];
          v194 = &v134[v146];
          uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v195 - 8) + 16))(v193, v194, v195);
LABEL_42:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v133, 0, 1, v6);
          break;
      }
      return a1;
    }
LABEL_31:
    uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(v133, v134, *(void *)(*(void *)(v139 - 8) + 64));
    return a1;
  }
  if (v136)
  {
    sub_24CBE3E00((uint64_t)v133, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    goto LABEL_31;
  }
  if (a1 != a2)
  {
    sub_24CBE3E00((uint64_t)v133, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v196 - 8) + 16))(v133, v134, v196);
        uint64_t v197 = *(int *)(type metadata accessor for LearnMoreSnippetModel() + 20);
        v198 = &v133[v197];
        v199 = &v134[v197];
        uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v200 - 8) + 16))(v198, v199, v200);
        break;
      case 2u:
        uint64_t v201 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        v202 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v201 - 8) + 16);
        v202(v133, v134, v201);
        v203 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v202(&v133[v203[5]], &v134[v203[5]], v201);
        uint64_t v204 = v203[6];
        v205 = &v133[v204];
        v206 = &v134[v204];
        uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v207 - 8) + 16))(v205, v206, v207);
        v202(&v133[v203[7]], &v134[v203[7]], v201);
        v202(&v133[v203[8]], &v134[v203[8]], v201);
        uint64_t v208 = v203[9];
        v209 = &v133[v208];
        v210 = &v134[v208];
        uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v211 - 8) + 16))(v209, v210, v211);
        uint64_t v212 = v203[10];
        v213 = &v133[v212];
        v214 = &v134[v212];
        uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v215 - 8) + 16))(v213, v214, v215);
        v133[v203[11]] = v134[v203[11]];
        break;
      case 3u:
        uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        v217 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v216 - 8) + 16);
        v217(v133, v134, v216);
        v218 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v217(&v133[v218[5]], &v134[v218[5]], v216);
        v217(&v133[v218[6]], &v134[v218[6]], v216);
        uint64_t v219 = v218[7];
        v220 = &v133[v219];
        v221 = &v134[v219];
        uint64_t v222 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v222 - 8) + 16))(v220, v221, v222);
        uint64_t v223 = v218[8];
        v224 = &v133[v223];
        v225 = &v134[v223];
        uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v226 - 8) + 16))(v224, v225, v226);
        break;
      case 4u:
        uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v227 - 8) + 16))(v133, v134, v227);
        v228 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v229 = v228[5];
        v230 = &v133[v229];
        v231 = &v134[v229];
        uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v232 - 8) + 16))(v230, v231, v232);
        uint64_t v233 = v228[6];
        v234 = &v133[v233];
        v235 = &v134[v233];
        uint64_t v236 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v236 - 8) + 16))(v234, v235, v236);
        uint64_t v237 = v228[7];
        v238 = &v133[v237];
        v239 = &v134[v237];
        uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v240 - 8) + 16))(v238, v239, v240);
        break;
      case 5u:
        uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        v242 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v241 - 8) + 16);
        v242(v133, v134, v241);
        v243 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v244 = v243[5];
        v245 = &v133[v244];
        v246 = &v134[v244];
        uint64_t v247 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 16))(v245, v246, v247);
        uint64_t v248 = v243[6];
        v249 = &v133[v248];
        v250 = &v134[v248];
        uint64_t v251 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v251 - 8) + 16))(v249, v250, v251);
        v242(&v133[v243[7]], &v134[v243[7]], v241);
        uint64_t v252 = v243[8];
        v253 = &v133[v252];
        v254 = &v134[v252];
        uint64_t v255 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v255 - 8) + 16))(v253, v254, v255);
        uint64_t v256 = v243[9];
        v257 = &v133[v256];
        v258 = &v134[v256];
        uint64_t v259 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v259 - 8) + 16))(v257, v258, v259);
        break;
      default:
        uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v140 - 8) + 16))(v133, v134, v140);
        uint64_t v141 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
        v142 = &v133[v141];
        v143 = &v134[v141];
        uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 16))(v142, v143, v144);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_24CBE0B84(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
        uint64_t v9 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_6;
      case 2u:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
        v13(a1, a2, v12);
        uint64_t v14 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v13(&a1[v14[5]], &a2[v14[5]], v12);
        uint64_t v15 = v14[6];
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        v13(&a1[v14[7]], &a2[v14[7]], v12);
        v13(&a1[v14[8]], &a2[v14[8]], v12);
        uint64_t v19 = v14[9];
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
        uint64_t v23 = v14[10];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
        a1[v14[11]] = a2[v14[11]];
        goto LABEL_12;
      case 3u:
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32);
        v28(a1, a2, v27);
        uint64_t v29 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v28(&a1[v29[5]], &a2[v29[5]], v27);
        v28(&a1[v29[6]], &a2[v29[6]], v27);
        uint64_t v30 = v29[7];
        uint64_t v31 = &a1[v30];
        uint64_t v32 = &a2[v30];
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
        uint64_t v11 = v29[8];
        goto LABEL_11;
      case 4u:
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
        uint64_t v35 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v36 = v35[5];
        uint64_t v37 = &a1[v36];
        uint64_t v38 = &a2[v36];
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
        uint64_t v40 = v35[6];
        uint64_t v41 = &a1[v40];
        uint64_t v42 = &a2[v40];
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
        uint64_t v11 = v35[7];
        goto LABEL_11;
      case 5u:
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32);
        v45(a1, a2, v44);
        uint64_t v46 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v47 = v46[5];
        uint64_t v48 = &a1[v47];
        uint64_t v49 = &a2[v47];
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
        uint64_t v51 = v46[6];
        uint64_t v52 = &a1[v51];
        uint64_t v53 = &a2[v51];
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
        v45(&a1[v46[7]], &a2[v46[7]], v44);
        uint64_t v55 = v46[8];
        uint64_t v56 = &a1[v55];
        uint64_t v57 = &a2[v55];
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
        uint64_t v11 = v46[9];
        goto LABEL_11;
      default:
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        uint64_t v9 = type metadata accessor for AttributionListSnippetModel();
LABEL_6:
        uint64_t v11 = *(int *)(v9 + 20);
LABEL_11:
        uint64_t v59 = &a1[v11];
        uint64_t v60 = &a2[v11];
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 32))(v59, v60, v61);
LABEL_12:
        swift_storeEnumTagMultiPayload();
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
        break;
    }
  }
  uint64_t v62 = *(int *)(a3 + 20);
  uint64_t v63 = &a1[v62];
  uint64_t v64 = &a2[v62];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v62], 1, v6))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(v63, v64, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 32))(v63, v64, v68);
        uint64_t v67 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_18;
      case 2u:
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 32);
        v71(v63, v64, v70);
        uint64_t v72 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v71(&v63[v72[5]], &v64[v72[5]], v70);
        uint64_t v73 = v72[6];
        uint64_t v74 = &v63[v73];
        uint64_t v75 = &v64[v73];
        uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
        v71(&v63[v72[7]], &v64[v72[7]], v70);
        v71(&v63[v72[8]], &v64[v72[8]], v70);
        uint64_t v77 = v72[9];
        uint64_t v78 = &v63[v77];
        uint64_t v79 = &v64[v77];
        uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 32))(v78, v79, v80);
        uint64_t v81 = v72[10];
        uint64_t v82 = &v63[v81];
        uint64_t v83 = &v64[v81];
        uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 32))(v82, v83, v84);
        v63[v72[11]] = v64[v72[11]];
        goto LABEL_24;
      case 3u:
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v86 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 32);
        v86(v63, v64, v85);
        uint64_t v87 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v86(&v63[v87[5]], &v64[v87[5]], v85);
        v86(&v63[v87[6]], &v64[v87[6]], v85);
        uint64_t v88 = v87[7];
        uint64_t v89 = &v63[v88];
        uint64_t v90 = &v64[v88];
        uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 32))(v89, v90, v91);
        uint64_t v69 = v87[8];
        goto LABEL_23;
      case 4u:
        uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 32))(v63, v64, v92);
        uint64_t v93 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v94 = v93[5];
        uint64_t v95 = &v63[v94];
        uint64_t v96 = &v64[v94];
        uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 32))(v95, v96, v97);
        uint64_t v98 = v93[6];
        uint64_t v99 = &v63[v98];
        uint64_t v100 = &v64[v98];
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 32))(v99, v100, v101);
        uint64_t v69 = v93[7];
        goto LABEL_23;
      case 5u:
        uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v103 = *(void (**)(char *, char *, uint64_t))(*(void *)(v102 - 8) + 32);
        v103(v63, v64, v102);
        uint64_t v104 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v105 = v104[5];
        uint64_t v106 = &v63[v105];
        uint64_t v107 = &v64[v105];
        uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v108 - 8) + 32))(v106, v107, v108);
        uint64_t v109 = v104[6];
        uint64_t v110 = &v63[v109];
        uint64_t v111 = &v64[v109];
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 32))(v110, v111, v112);
        v103(&v63[v104[7]], &v64[v104[7]], v102);
        uint64_t v113 = v104[8];
        uint64_t v114 = &v63[v113];
        uint64_t v115 = &v64[v113];
        uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v116 - 8) + 32))(v114, v115, v116);
        uint64_t v69 = v104[9];
        goto LABEL_23;
      default:
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v63, v64, v66);
        uint64_t v67 = type metadata accessor for AttributionListSnippetModel();
LABEL_18:
        uint64_t v69 = *(int *)(v67 + 20);
LABEL_23:
        v117 = &v63[v69];
        uint64_t v118 = &v64[v69];
        uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 32))(v117, v118, v119);
LABEL_24:
        swift_storeEnumTagMultiPayload();
        __swift_storeEnumTagSinglePayload((uint64_t)v63, 0, 1, v6);
        break;
    }
  }
  return a1;
}

unsigned char *sub_24CBE18A8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32))(a1, a2, v17);
          uint64_t v10 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_12;
        case 2u:
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v20 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 32);
          v20(a1, a2, v19);
          uint64_t v21 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v20(&a1[v21[5]], &a2[v21[5]], v19);
          uint64_t v22 = v21[6];
          uint64_t v23 = &a1[v22];
          uint64_t v24 = &a2[v22];
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
          v20(&a1[v21[7]], &a2[v21[7]], v19);
          v20(&a1[v21[8]], &a2[v21[8]], v19);
          uint64_t v26 = v21[9];
          uint64_t v27 = &a1[v26];
          uint64_t v28 = &a2[v26];
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
          uint64_t v30 = v21[10];
          uint64_t v31 = &a1[v30];
          uint64_t v32 = &a2[v30];
          uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
          a1[v21[11]] = a2[v21[11]];
          goto LABEL_18;
        case 3u:
          uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          uint64_t v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v34 - 8) + 32);
          v35(a1, a2, v34);
          uint64_t v36 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v35(&a1[v36[5]], &a2[v36[5]], v34);
          v35(&a1[v36[6]], &a2[v36[6]], v34);
          uint64_t v37 = v36[7];
          uint64_t v38 = &a1[v37];
          uint64_t v39 = &a2[v37];
          uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v38, v39, v40);
          uint64_t v18 = v36[8];
          goto LABEL_17;
        case 4u:
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v41 - 8) + 32))(a1, a2, v41);
          uint64_t v42 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v43 = v42[5];
          uint64_t v44 = &a1[v43];
          uint64_t v45 = &a2[v43];
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
          uint64_t v47 = v42[6];
          uint64_t v48 = &a1[v47];
          uint64_t v49 = &a2[v47];
          uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
          uint64_t v18 = v42[7];
          goto LABEL_17;
        case 5u:
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          v261 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v51 - 8) + 32);
          v261(a1, a2, v51);
          uint64_t v52 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v53 = v52[5];
          uint64_t v54 = &a1[v53];
          uint64_t v55 = &a2[v53];
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(v54, v55, v56);
          uint64_t v57 = v52[6];
          uint64_t v58 = &a1[v57];
          uint64_t v59 = &a2[v57];
          uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
          v261(&a1[v52[7]], &a2[v52[7]], v51);
          uint64_t v61 = v52[8];
          uint64_t v62 = &a1[v61];
          uint64_t v63 = &a2[v61];
          uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
          uint64_t v18 = v52[9];
          goto LABEL_17;
        default:
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
          uint64_t v10 = type metadata accessor for AttributionListSnippetModel();
LABEL_12:
          uint64_t v18 = *(int *)(v10 + 20);
LABEL_17:
          uint64_t v65 = &a1[v18];
          uint64_t v66 = &a2[v18];
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(v65, v66, v67);
LABEL_18:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
          break;
      }
      goto LABEL_25;
    }
LABEL_7:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_25;
  }
  if (v8)
  {
    sub_24CBE3E00((uint64_t)a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24CBE3E00((uint64_t)a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v68 - 8) + 32))(a1, a2, v68);
        uint64_t v69 = *(int *)(type metadata accessor for LearnMoreSnippetModel() + 20);
        uint64_t v70 = &a1[v69];
        uint64_t v71 = &a2[v69];
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
        break;
      case 2u:
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v74 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v73 - 8) + 32);
        v74(a1, a2, v73);
        uint64_t v75 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v74(&a1[v75[5]], &a2[v75[5]], v73);
        uint64_t v76 = v75[6];
        uint64_t v77 = &a1[v76];
        uint64_t v78 = &a2[v76];
        uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32))(v77, v78, v79);
        v74(&a1[v75[7]], &a2[v75[7]], v73);
        v74(&a1[v75[8]], &a2[v75[8]], v73);
        uint64_t v80 = v75[9];
        uint64_t v81 = &a1[v80];
        uint64_t v82 = &a2[v80];
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
        uint64_t v84 = v75[10];
        uint64_t v85 = &a1[v84];
        uint64_t v86 = &a2[v84];
        uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v85, v86, v87);
        a1[v75[11]] = a2[v75[11]];
        break;
      case 3u:
        uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v89 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v88 - 8) + 32);
        v89(a1, a2, v88);
        uint64_t v90 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v89(&a1[v90[5]], &a2[v90[5]], v88);
        v89(&a1[v90[6]], &a2[v90[6]], v88);
        uint64_t v91 = v90[7];
        uint64_t v92 = &a1[v91];
        uint64_t v93 = &a2[v91];
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 32))(v92, v93, v94);
        uint64_t v95 = v90[8];
        uint64_t v96 = &a1[v95];
        uint64_t v97 = &a2[v95];
        uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 32))(v96, v97, v98);
        break;
      case 4u:
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v99 - 8) + 32))(a1, a2, v99);
        uint64_t v100 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v101 = v100[5];
        uint64_t v102 = &a1[v101];
        uint64_t v103 = &a2[v101];
        uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 32))(v102, v103, v104);
        uint64_t v105 = v100[6];
        uint64_t v106 = &a1[v105];
        uint64_t v107 = &a2[v105];
        uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v108 - 8) + 32))(v106, v107, v108);
        uint64_t v109 = v100[7];
        uint64_t v110 = &a1[v109];
        uint64_t v111 = &a2[v109];
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 32))(v110, v111, v112);
        break;
      case 5u:
        uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v114 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v113 - 8) + 32);
        v114(a1, a2, v113);
        uint64_t v115 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v116 = v115[5];
        v117 = &a1[v116];
        uint64_t v118 = &a2[v116];
        uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 32))(v117, v118, v119);
        uint64_t v120 = v115[6];
        uint64_t v121 = &a1[v120];
        uint64_t v122 = &a2[v120];
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 32))(v121, v122, v123);
        v114(&a1[v115[7]], &a2[v115[7]], v113);
        uint64_t v124 = v115[8];
        uint64_t v125 = &a1[v124];
        uint64_t v126 = &a2[v124];
        uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v127 - 8) + 32))(v125, v126, v127);
        uint64_t v128 = v115[9];
        os_log_type_t v129 = &a1[v128];
        int v130 = &a2[v128];
        uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v131 - 8) + 32))(v129, v130, v131);
        break;
      default:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
        uint64_t v13 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_25:
  uint64_t v132 = *(int *)(a3 + 20);
  uint64_t v133 = &a1[v132];
  uint64_t v134 = &a2[v132];
  int v135 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v132], 1, v6);
  int v136 = __swift_getEnumTagSinglePayload((uint64_t)v134, 1, v6);
  if (v135)
  {
    if (!v136)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v145 - 8) + 32))(v133, v134, v145);
          uint64_t v138 = type metadata accessor for LearnMoreSnippetModel();
          goto LABEL_36;
        case 2u:
          uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          v148 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v147 - 8) + 32);
          v148(v133, v134, v147);
          v149 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
          v148(&v133[v149[5]], &v134[v149[5]], v147);
          uint64_t v150 = v149[6];
          v151 = &v133[v150];
          v152 = &v134[v150];
          uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v151, v152, v153);
          v148(&v133[v149[7]], &v134[v149[7]], v147);
          v148(&v133[v149[8]], &v134[v149[8]], v147);
          uint64_t v154 = v149[9];
          v155 = &v133[v154];
          v156 = &v134[v154];
          uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v157 - 8) + 32))(v155, v156, v157);
          uint64_t v158 = v149[10];
          v159 = &v133[v158];
          v160 = &v134[v158];
          uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 32))(v159, v160, v161);
          v133[v149[11]] = v134[v149[11]];
          goto LABEL_42;
        case 3u:
          uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
          v163 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v162 - 8) + 32);
          v163(v133, v134, v162);
          v164 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
          v163(&v133[v164[5]], &v134[v164[5]], v162);
          v163(&v133[v164[6]], &v134[v164[6]], v162);
          uint64_t v165 = v164[7];
          v166 = &v133[v165];
          v167 = &v134[v165];
          uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v168 - 8) + 32))(v166, v167, v168);
          uint64_t v146 = v164[8];
          goto LABEL_41;
        case 4u:
          uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v169 - 8) + 32))(v133, v134, v169);
          v170 = (int *)type metadata accessor for SupplementarySnippetModel();
          uint64_t v171 = v170[5];
          v172 = &v133[v171];
          v173 = &v134[v171];
          uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v174 - 8) + 32))(v172, v173, v174);
          uint64_t v175 = v170[6];
          v176 = &v133[v175];
          v177 = &v134[v175];
          uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v178 - 8) + 32))(v176, v177, v178);
          uint64_t v146 = v170[7];
          goto LABEL_41;
        case 5u:
          uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
          v262 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v179 - 8) + 32);
          v262(v133, v134, v179);
          v180 = (int *)type metadata accessor for TipSnippetModel(0);
          uint64_t v181 = v180[5];
          v182 = &v133[v181];
          v183 = &v134[v181];
          uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v182, v183, v184);
          uint64_t v185 = v180[6];
          v186 = &v133[v185];
          v187 = &v134[v185];
          uint64_t v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v188 - 8) + 32))(v186, v187, v188);
          v262(&v133[v180[7]], &v134[v180[7]], v179);
          uint64_t v189 = v180[8];
          v190 = &v133[v189];
          v191 = &v134[v189];
          uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v192 - 8) + 32))(v190, v191, v192);
          uint64_t v146 = v180[9];
          goto LABEL_41;
        default:
          uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v137 - 8) + 32))(v133, v134, v137);
          uint64_t v138 = type metadata accessor for AttributionListSnippetModel();
LABEL_36:
          uint64_t v146 = *(int *)(v138 + 20);
LABEL_41:
          v193 = &v133[v146];
          v194 = &v134[v146];
          uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v195 - 8) + 32))(v193, v194, v195);
LABEL_42:
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v133, 0, 1, v6);
          break;
      }
      return a1;
    }
LABEL_31:
    uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
    memcpy(v133, v134, *(void *)(*(void *)(v139 - 8) + 64));
    return a1;
  }
  if (v136)
  {
    sub_24CBE3E00((uint64_t)v133, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    goto LABEL_31;
  }
  if (a1 != a2)
  {
    sub_24CBE3E00((uint64_t)v133, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v196 - 8) + 32))(v133, v134, v196);
        uint64_t v197 = *(int *)(type metadata accessor for LearnMoreSnippetModel() + 20);
        v198 = &v133[v197];
        v199 = &v134[v197];
        uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v200 - 8) + 32))(v198, v199, v200);
        break;
      case 2u:
        uint64_t v201 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        v202 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v201 - 8) + 32);
        v202(v133, v134, v201);
        v203 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v202(&v133[v203[5]], &v134[v203[5]], v201);
        uint64_t v204 = v203[6];
        v205 = &v133[v204];
        v206 = &v134[v204];
        uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v207 - 8) + 32))(v205, v206, v207);
        v202(&v133[v203[7]], &v134[v203[7]], v201);
        v202(&v133[v203[8]], &v134[v203[8]], v201);
        uint64_t v208 = v203[9];
        v209 = &v133[v208];
        v210 = &v134[v208];
        uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v211 - 8) + 32))(v209, v210, v211);
        uint64_t v212 = v203[10];
        v213 = &v133[v212];
        v214 = &v134[v212];
        uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v215 - 8) + 32))(v213, v214, v215);
        v133[v203[11]] = v134[v203[11]];
        break;
      case 3u:
        uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        v217 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v216 - 8) + 32);
        v217(v133, v134, v216);
        v218 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v217(&v133[v218[5]], &v134[v218[5]], v216);
        v217(&v133[v218[6]], &v134[v218[6]], v216);
        uint64_t v219 = v218[7];
        v220 = &v133[v219];
        v221 = &v134[v219];
        uint64_t v222 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v222 - 8) + 32))(v220, v221, v222);
        uint64_t v223 = v218[8];
        v224 = &v133[v223];
        v225 = &v134[v223];
        uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v226 - 8) + 32))(v224, v225, v226);
        break;
      case 4u:
        uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v227 - 8) + 32))(v133, v134, v227);
        v228 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v229 = v228[5];
        v230 = &v133[v229];
        v231 = &v134[v229];
        uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v232 - 8) + 32))(v230, v231, v232);
        uint64_t v233 = v228[6];
        v234 = &v133[v233];
        v235 = &v134[v233];
        uint64_t v236 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v236 - 8) + 32))(v234, v235, v236);
        uint64_t v237 = v228[7];
        v238 = &v133[v237];
        v239 = &v134[v237];
        uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v240 - 8) + 32))(v238, v239, v240);
        break;
      case 5u:
        uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        v242 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v241 - 8) + 32);
        v242(v133, v134, v241);
        v243 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v244 = v243[5];
        v245 = &v133[v244];
        v246 = &v134[v244];
        uint64_t v247 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 32))(v245, v246, v247);
        uint64_t v248 = v243[6];
        v249 = &v133[v248];
        v250 = &v134[v248];
        uint64_t v251 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v251 - 8) + 32))(v249, v250, v251);
        v242(&v133[v243[7]], &v134[v243[7]], v241);
        uint64_t v252 = v243[8];
        v253 = &v133[v252];
        v254 = &v134[v252];
        uint64_t v255 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v255 - 8) + 32))(v253, v254, v255);
        uint64_t v256 = v243[9];
        v257 = &v133[v256];
        v258 = &v134[v256];
        uint64_t v259 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v259 - 8) + 32))(v257, v258, v259);
        break;
      default:
        uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v140 - 8) + 32))(v133, v134, v140);
        uint64_t v141 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
        v142 = &v133[v141];
        v143 = &v134[v141];
        uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 32))(v142, v143, v144);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CBE353C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBE3550);
}

uint64_t sub_24CBE3550(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_24CBE359C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBE35B0);
}

uint64_t sub_24CBE35B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SnippetResponseComponents()
{
  uint64_t result = qword_269818BC0;
  if (!qword_269818BC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CBE3648()
{
  sub_24CBE36D4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CBE36D4()
{
  if (!qword_269818BD0)
  {
    type metadata accessor for TellMeGeneratedSnippetModels();
    unint64_t v0 = sub_24CC240A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269818BD0);
    }
  }
}

uint64_t sub_24CBE372C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SnippetResponseComponents();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v17 - v11;
  sub_24CBE3C74(v1 + *(int *)(v3 + 28), (uint64_t)&v17 - v11);
  uint64_t v13 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_24CBE3CDC((uint64_t)v12);
    sub_24CBE3D9C(v1, (uint64_t)v5);
  }
  else
  {
    char v14 = sub_24CBFE268();
    sub_24CBE3E00((uint64_t)v12, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    sub_24CBE3D9C(v1, (uint64_t)v5);
    if (v14)
    {
      sub_24CBE3E00((uint64_t)v5, (void (*)(void))type metadata accessor for SnippetResponseComponents);
      char v15 = 1;
      return v15 & 1;
    }
  }
  sub_24CBE3C74((uint64_t)v5, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v13) == 1)
  {
    sub_24CBE3E00((uint64_t)v5, (void (*)(void))type metadata accessor for SnippetResponseComponents);
    sub_24CBE3CDC(v9);
    char v15 = 0;
  }
  else
  {
    char v15 = sub_24CBFE268();
    sub_24CBE3E00((uint64_t)v5, (void (*)(void))type metadata accessor for SnippetResponseComponents);
    sub_24CBE3E00(v9, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  }
  return v15 & 1;
}

uint64_t sub_24CBE3944()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = v7 - v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - v12;
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v30 - v14;
  uint64_t v16 = type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1_1();
  uint64_t v20 = v18 - v19;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v30 - v22;
  sub_24CBE3C74(v1, (uint64_t)v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
    sub_24CBE3CDC((uint64_t)v15);
    goto LABEL_5;
  }
  sub_24CBE3D3C((uint64_t)v15, (uint64_t)v23, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  sub_24CBE3D3C((uint64_t)v23, v20, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_24CBE3E00(v20, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  if (EnumCaseMultiPayload != 5)
  {
LABEL_5:
    uint64_t v26 = type metadata accessor for SnippetResponseComponents();
    sub_24CBE3C74(v1 + *(int *)(v26 + 20), (uint64_t)v13);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v16) != 1)
    {
      sub_24CBE3C74((uint64_t)v13, v9);
      int v27 = swift_getEnumCaseMultiPayload();
      switch(v27)
      {
        case 3:
          sub_24CBE3E00(v9, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
          uint64_t v25 = 3;
          goto LABEL_16;
        case 2:
          sub_24CBE3D3C(v9, (uint64_t)v5, (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
          int v28 = v5[*(int *)(v2 + 44)];
          sub_24CBE3E00((uint64_t)v5, (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
          if (v28) {
            uint64_t v25 = 2;
          }
          else {
            uint64_t v25 = 1;
          }
          goto LABEL_16;
        case 1:
          sub_24CBE3E00(v9, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
          uint64_t v25 = 4;
LABEL_16:
          sub_24CBE3CDC((uint64_t)v13);
          return v25;
      }
      sub_24CBE3E00(v9, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    }
    uint64_t v25 = 0;
    goto LABEL_16;
  }
  return 5;
}

uint64_t sub_24CBE3C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBE3CDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBE3D3C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24CBE3D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SnippetResponseComponents();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBE3E00(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t TipCollectionModel.collectionIdentifier.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t TipCollectionModel.collectionIdentifier.setter()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*TipCollectionModel.collectionIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TipCollectionModel.collectionSymbol.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t TipCollectionModel.collectionSymbol.setter()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*TipCollectionModel.collectionSymbol.modify())()
{
  return nullsub_1;
}

uint64_t TipCollectionModel.title.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t TipCollectionModel.title.setter()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*TipCollectionModel.title.modify())()
{
  return nullsub_1;
}

uint64_t TipCollectionModel.bodyText.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t TipCollectionModel.bodyText.setter()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*TipCollectionModel.bodyText.modify())()
{
  return nullsub_1;
}

uint64_t TipCollectionModel.init(result:collection:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  sub_24CBD81A8(a1, v8 - v7);
  uint64_t v10 = sub_24CC237D0();
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    sub_24CBD8238(v9);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_24CC235D0();
    uint64_t v12 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a2 && (id v14 = objc_msgSend(a2, sel_tocAssets)) != 0)
  {
    uint64_t v28 = sub_24CBE4B88(v14, (SEL *)&selRef_symbolId);
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v16 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a2)
  {
    uint64_t v17 = sub_24CBE4B88(a2, (SEL *)&selRef_title);
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a2)
  {
    uint64_t v27 = v11;
    uint64_t v20 = a1;
    id v21 = objc_msgSend(a2, sel_tileContent);
    id v22 = objc_msgSend(v21, sel_bodyText);

    if (v22)
    {
      uint64_t v23 = sub_24CC23ED0();
      uint64_t v25 = v24;
    }
    else
    {

      uint64_t v23 = 0;
      uint64_t v25 = 0;
    }
    a1 = v20;
    uint64_t v11 = v27;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  sub_24CBD8238(a1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a3 = v11;
  a3[1] = v12;
  a3[2] = v28;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = v19;
  a3[6] = v23;
  a3[7] = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void TipCollectionModel.punchOutUrl.getter()
{
  if (*(void *)(v0 + 8)) {
    uint64_t v1 = (void *)sub_24CC23EC0();
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = objc_msgSend(self, sel_URLWithTipIdentifier_collectionIdentifier_referrer_, 0, v1, 0);

  sub_24CC23360();
}

BOOL sub_24CBE437C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24CBE438C()
{
  return sub_24CC24340();
}

uint64_t sub_24CBE43B4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000024CC285A0 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC285C0 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
    if (v5 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x7478655479646F62 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v7 = sub_24CC24310();
      swift_bridgeObjectRelease();
      if (v7) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_24CBE454C()
{
  return 4;
}

uint64_t sub_24CBE4554()
{
  return sub_24CC24350();
}

unint64_t sub_24CBE459C(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x656C746974;
      break;
    case 3:
      unint64_t result = 0x7478655479646F62;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24CBE4638(char *a1, char *a2)
{
  return sub_24CBE437C(*a1, *a2);
}

uint64_t sub_24CBE4644()
{
  return sub_24CBE4554();
}

uint64_t sub_24CBE464C()
{
  return sub_24CBE438C();
}

unint64_t sub_24CBE4654()
{
  return sub_24CBE459C(*v0);
}

uint64_t sub_24CBE465C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBE43B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBE4684@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBE454C();
  *a1 = result;
  return result;
}

uint64_t sub_24CBE46AC(uint64_t a1)
{
  unint64_t v2 = sub_24CBE4BF4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBE46E8(uint64_t a1)
{
  unint64_t v2 = sub_24CBE4BF4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TipCollectionModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BD8);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE4BF4();
  sub_24CC24370();
  sub_24CC242A0();
  if (!v9)
  {
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
}

uint64_t TipCollectionModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BE8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE4BF4();
  sub_24CC24360();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v28 = 0;
    uint64_t v5 = OUTLINED_FUNCTION_2_1((uint64_t)&v28);
    uint64_t v8 = v7;
    uint64_t v24 = v5;
    char v27 = 1;
    swift_bridgeObjectRetain();
    uint64_t v9 = OUTLINED_FUNCTION_2_1((uint64_t)&v27);
    uint64_t v11 = v10;
    uint64_t v22 = v9;
    uint64_t v23 = a2;
    char v26 = 2;
    swift_bridgeObjectRetain();
    uint64_t v12 = OUTLINED_FUNCTION_2_1((uint64_t)&v26);
    uint64_t v14 = v13;
    uint64_t v21 = v12;
    char v25 = 3;
    swift_bridgeObjectRetain();
    uint64_t v15 = OUTLINED_FUNCTION_2_1((uint64_t)&v25);
    uint64_t v17 = v16;
    uint64_t v20 = v15;
    uint64_t v18 = OUTLINED_FUNCTION_1_2();
    v19(v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v23 = v24;
    v23[1] = v8;
    v23[2] = v22;
    v23[3] = v11;
    v23[4] = v21;
    v23[5] = v14;
    v23[6] = v20;
    v23[7] = v17;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBE4B58@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return TipCollectionModel.init(from:)(a1, a2);
}

uint64_t sub_24CBE4B70(void *a1)
{
  return TipCollectionModel.encode(to:)(a1);
}

uint64_t sub_24CBE4B88(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_24CC23ED0();

  return v4;
}

unint64_t sub_24CBE4BF4()
{
  unint64_t result = qword_269818BE0;
  if (!qword_269818BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818BE0);
  }
  return result;
}

uint64_t destroy for TipCollectionModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TipCollectionModel(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TipCollectionModel(void *a1, void *a2)
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

void *assignWithTake for TipCollectionModel(void *a1, void *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for TipCollectionModel(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipCollectionModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TipCollectionModel()
{
  return &type metadata for TipCollectionModel;
}

uint64_t getEnumTagSinglePayload for TipCollectionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TipCollectionModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBE503CLL);
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

unsigned char *sub_24CBE5064(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TipCollectionModel.CodingKeys()
{
  return &type metadata for TipCollectionModel.CodingKeys;
}

unint64_t sub_24CBE5080()
{
  unint64_t result = qword_269818BF0;
  if (!qword_269818BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818BF0);
  }
  return result;
}

unint64_t sub_24CBE50D0()
{
  unint64_t result = qword_269818BF8;
  if (!qword_269818BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818BF8);
  }
  return result;
}

unint64_t sub_24CBE5120()
{
  unint64_t result = qword_269818C00;
  if (!qword_269818C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C00);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return MEMORY[0x270F9F270](a1, v1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_24CC242A0();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

id sub_24CBE51D0(uint64_t a1)
{
  uint64_t v2 = v1;
  v54[1] = *v2;
  sub_24CC232F0();
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v5;
  uint64_t v57 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v55 = v7 - v6;
  sub_24CC23400();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v9;
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_24CC23380();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v54 - v20;
  uint64_t v22 = sub_24CC232B0();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1();
  uint64_t v28 = v27 - v26;
  uint64_t v60 = a1;
  sub_24CC232E0();
  int v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 88))(v28, v22);
  if (v29 == *MEMORY[0x263F06D30])
  {
    uint64_t v30 = OUTLINED_FUNCTION_1_3();
    v31(v30);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v33 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    goto LABEL_3;
  }
  if (v29 != *MEMORY[0x263F06D20])
  {
    if (v29 != *MEMORY[0x263F06D18])
    {
      uint64_t v53 = swift_getObjCClassFromMetadata();
      id v34 = objc_msgSend(self, sel_bundleForClass_, v53);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v22);
      goto LABEL_4;
    }
    id v33 = objc_msgSend(self, sel_mainBundle);
LABEL_3:
    id v34 = v33;
LABEL_4:
    uint64_t v35 = v60;
    goto LABEL_9;
  }
  uint64_t v36 = OUTLINED_FUNCTION_1_3();
  v37(v36);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v21, v28, v13);
  sub_24CBE59E0();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v13);
  id v38 = sub_24CBE56EC((uint64_t)v19);
  if (!v38)
  {
    uint64_t v39 = swift_getObjCClassFromMetadata();
    id v38 = objc_msgSend(self, sel_bundleForClass_, v39);
  }
  id v34 = v38;
  uint64_t v35 = v60;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v13);
LABEL_9:
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v41 = result;
    sub_24CC232C0();
    uint64_t v42 = (void *)sub_24CC23EC0();
    swift_bridgeObjectRelease();
    sub_24CC232D0();
    if (v43)
    {
      uint64_t v44 = (void *)sub_24CC23EC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v44 = 0;
    }
    __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
    id v45 = v34;
    sub_24CC23A10();
    uint64_t v65 = sub_24CC233E0();
    uint64_t v66 = v46;
    uint64_t v63 = 45;
    unint64_t v64 = 0xE100000000000000;
    uint64_t v61 = 95;
    unint64_t v62 = 0xE100000000000000;
    sub_24CBE58E0();
    uint64_t v47 = sub_24CC240E0();
    uint64_t v49 = v48;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v12, v59);
    uint64_t v50 = sub_24CBE592C((uint64_t)v42, (uint64_t)v44, (uint64_t)v45, v47, v49, v41);
    uint64_t v52 = v51;

    if (!v52)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v55, v35, v57);
      uint64_t v50 = sub_24CC23F10();
    }

    return (id)v50;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24CBE56EC(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int v3 = (void *)sub_24CC23350();
  id v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  uint64_t v5 = sub_24CC23380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_24CBE5788()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for LocalizedResourceProvider()
{
  return self;
}

uint64_t sub_24CBE57E4()
{
  uint64_t v0 = sub_24CC232B0();
  __swift_allocate_value_buffer(v0, qword_26981FF90);
  uint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_26981FF90);
  *uint64_t v1 = type metadata accessor for LocalizedResourceProvider();
  uint64_t v2 = *MEMORY[0x263F06D30];
  int v3 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
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

unint64_t sub_24CBE58E0()
{
  unint64_t result = qword_269818C08;
  if (!qword_269818C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C08);
  }
  return result;
}

uint64_t sub_24CBE592C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = (void *)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(a6, sel_localizedStringForKey_table_bundle_languageCode_, a1, a2, a3, v10);

  if (!v11) {
    return 0;
  }
  uint64_t v12 = sub_24CC23ED0();

  return v12;
}

unint64_t sub_24CBE59E0()
{
  unint64_t result = qword_269818C10;
  if (!qword_269818C10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269818C10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t sub_24CBE5A38()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_24CC23770();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  switch(v2 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_1_4();
      uint64_t v4 = (int)v1;
      uint64_t v5 = v1 >> 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v4 = *(void *)(v0 + 16);
      uint64_t v5 = *(void *)(v0 + 24);
      OUTLINED_FUNCTION_1_4();
LABEL_7:
      if (v4 != v5) {
        goto LABEL_8;
      }
      return 0;
    case 3uLL:
      OUTLINED_FUNCTION_1_4();
      return 0;
    default:
      OUTLINED_FUNCTION_1_4();
      if ((v3 & 0xFF000000000000) == 0) {
        return 0;
      }
LABEL_8:
      uint64_t v6 = self;
      uint64_t v7 = sub_24CC23770();
      unint64_t v9 = v8;
      uint64_t v10 = (void *)sub_24CC23390();
      sub_24CBD8944(v7, v9);
      *(void *)&long long v17 = 0;
      id v11 = objc_msgSend(v6, sel_JSONObjectWithData_options_error_, v10, 0, &v17);

      if (!v11)
      {
        id v14 = (id)v17;
        uint64_t v15 = (void *)sub_24CC232A0();

        swift_willThrow();
        return 0;
      }
      id v12 = (id)v17;
      sub_24CC240F0();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818C18);
      if ((OUTLINED_FUNCTION_0_1() & 1) == 0) {
        return 0;
      }
      sub_24CBE5C3C(0x6C6562616CLL, 0xE500000000000000, v16, &v17);
      swift_bridgeObjectRelease();
      if (!v18)
      {
        sub_24CBE5CA0((uint64_t)&v17);
        return 0;
      }
      if (OUTLINED_FUNCTION_0_1()) {
        return v16;
      }
      else {
        return 0;
      }
  }
}

double sub_24CBE5C3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_24CBE5D00(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_24CBE5D78(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_24CBE5CA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CBE5D00(uint64_t a1, uint64_t a2)
{
  sub_24CC24330();
  sub_24CC23F40();
  uint64_t v4 = sub_24CC24350();
  return sub_24CBE5DD4(a1, a2, v4);
}

uint64_t sub_24CBE5D78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24CBE5DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CC24310() & 1) == 0)
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
      while (!v14 && (sub_24CC24310() & 1) == 0);
    }
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_24CBD8944(v0, v1);
}

uint64_t initializeWithCopy for OutputHelper(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for OutputHelper(uint64_t *a1, uint64_t *a2)
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
        double result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        BOOL v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *double result = *a2;
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

uint64_t assignWithTake for OutputHelper(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for OutputHelper(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OutputHelper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for OutputHelper()
{
  return &type metadata for OutputHelper;
}

uint64_t sub_24CBE628C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(v9 + 409) = v20;
  *(unsigned char *)(v9 + 408) = a8;
  *(void *)(v9 + 224) = a7;
  *(void *)(v9 + 232) = v8;
  *(void *)(v9 + 208) = a5;
  *(void *)(v9 + 216) = a6;
  *(void *)(v9 + 192) = a3;
  *(void *)(v9 + 200) = a4;
  *(void *)(v9 + 176) = a1;
  *(void *)(v9 + 184) = a2;
  *(void *)(v9 + 240) = type metadata accessor for TellMeGeneratedSnippetModels();
  *(void *)(v9 + 248) = swift_task_alloc();
  *(void *)(v9 + 256) = swift_task_alloc();
  *(void *)(v9 + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C30);
  *(void *)(v9 + 272) = swift_task_alloc();
  uint64_t v10 = sub_24CC23A30();
  *(void *)(v9 + 280) = v10;
  OUTLINED_FUNCTION_1_0(v10);
  *(void *)(v9 + 288) = v11;
  *(void *)(v9 + 296) = swift_task_alloc();
  uint64_t v12 = sub_24CC23B60();
  *(void *)(v9 + 304) = v12;
  OUTLINED_FUNCTION_1_0(v12);
  *(void *)(v9 + 312) = v13;
  *(void *)(v9 + 320) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  *(void *)(v9 + 328) = swift_task_alloc();
  *(void *)(v9 + 336) = swift_task_alloc();
  long long v14 = v21[1];
  *(_OWORD *)(v9 + 344) = *v21;
  *(_OWORD *)(v9 + 360) = v14;
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v15, v16, v17);
}

uint64_t sub_24CBE6444()
{
  long long v46 = *(_OWORD *)(v0 + 360);
  long long v45 = *(_OWORD *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v47 = *(void *)(v0 + 264);
  uint64_t v48 = *(void *)(v0 + 240);
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v44 = *(void *)(v0 + 232);
  char v42 = *(unsigned char *)(v0 + 409);
  char v43 = *(unsigned char *)(v0 + 408);
  uint64_t v41 = *(void *)(v0 + 216);
  long long v40 = *(_OWORD *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 184);
  uint64_t v9 = type metadata accessor for SnippetResponseComponents();
  sub_24CBE726C(v8 + *(int *)(v9 + 20), v1, &qword_269818B38);
  sub_24CBE726C(v8, v2, &qword_269818B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v7, v6);
  uint64_t v10 = swift_task_alloc();
  *(unsigned char *)(v10 + 16) = v42;
  *(_OWORD *)(v10 + 24) = v40;
  *(void *)(v10 + 40) = v41;
  *(unsigned char *)(v10 + 48) = v43;
  *(void *)(v10 + 56) = v1;
  *(_OWORD *)(v10 + 64) = v45;
  *(_OWORD *)(v10 + 80) = v46;
  *(void *)(v10 + 96) = v44;
  sub_24CC23AD0();
  swift_task_dealloc();
  uint64_t v11 = v5 + *(int *)(v47 + 48);
  sub_24CBE726C(v2, v5, &qword_269818B38);
  sub_24CBE726C(v1, v11, &qword_269818B38);
  LODWORD(v5) = __swift_getEnumTagSinglePayload(v5, 1, v48);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v48);
  int v13 = EnumTagSinglePayload;
  if (v5 == 1)
  {
    if (EnumTagSinglePayload == 1)
    {
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 232), *(void *)(*(void *)(v0 + 232) + 24));
      swift_task_alloc();
      OUTLINED_FUNCTION_9_0();
      *(void *)(v0 + 400) = v14;
      void *v14 = v15;
      v14[1] = sub_24CBE6D24;
      OUTLINED_FUNCTION_5_1();
      return MEMORY[0x270F67AE0]();
    }
    uint64_t v22 = *(void *)(v0 + 256);
    uint64_t v23 = *(void **)(v0 + 232);
    uint64_t v24 = *(void *)(v0 + 240);
    sub_24CBE7094(v11, v22);
    __swift_project_boxed_opaque_existential_1(v23, v23[3]);
    *(void *)(v0 + 40) = v24;
    *(void *)(v0 + 48) = sub_24CBE70F8();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    sub_24CBE71AC(v22, (uint64_t)boxed_opaque_existential_1);
    swift_task_alloc();
    OUTLINED_FUNCTION_9_0();
    *(void *)(v0 + 392) = v26;
    void *v26 = v27;
    v26[1] = sub_24CBE6C58;
    OUTLINED_FUNCTION_6_1();
    goto LABEL_9;
  }
  sub_24CBE7094(*(void *)(v0 + 272), *(void *)(v0 + 256));
  if (v13 == 1)
  {
    uint64_t v17 = *(void *)(v0 + 256);
    uint64_t v18 = *(void *)(v0 + 240);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 232), *(void *)(*(void *)(v0 + 232) + 24));
    *(void *)(v0 + 80) = v18;
    *(void *)(v0 + 88) = sub_24CBE70F8();
    uint64_t v19 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    sub_24CBE71AC(v17, (uint64_t)v19);
    swift_task_alloc();
    OUTLINED_FUNCTION_9_0();
    *(void *)(v0 + 384) = v20;
    *char v20 = v21;
    v20[1] = sub_24CBE6AB4;
    OUTLINED_FUNCTION_6_1();
LABEL_9:
    OUTLINED_FUNCTION_5_1();
    return MEMORY[0x270F67AC0]();
  }
  uint64_t v30 = *(void *)(v0 + 248);
  uint64_t v29 = *(void *)(v0 + 256);
  uint64_t v31 = *(void **)(v0 + 232);
  uint64_t v32 = *(void *)(v0 + 240);
  sub_24CBE7094(v11, v30);
  __swift_project_boxed_opaque_existential_1(v31, v31[3]);
  *(void *)(v0 + 120) = v32;
  unint64_t v33 = sub_24CBE70F8();
  *(void *)(v0 + 128) = v33;
  id v34 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  sub_24CBE71AC(v30, (uint64_t)v34);
  *(void *)(v0 + 160) = v32;
  *(void *)(v0 + 168) = v33;
  uint64_t v35 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
  sub_24CBE71AC(v29, (uint64_t)v35);
  swift_task_alloc();
  OUTLINED_FUNCTION_9_0();
  *(void *)(v0 + 376) = v36;
  void *v36 = v37;
  v36[1] = sub_24CBE68FC;
  OUTLINED_FUNCTION_5_1();
  return MEMORY[0x270F67AB8]();
}

uint64_t sub_24CBE68FC()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  uint64_t v3 = v1 + 96;
  uint64_t v4 = v1 + 136;
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v4);
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24CBE69D4()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v3 = v0[40];
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[32];
  sub_24CBE7210(v0[31]);
  sub_24CBE7210(v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_24CBE3CDC(v1);
  sub_24CBE3CDC(v2);
  OUTLINED_FUNCTION_2_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24CBE6AB4()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  uint64_t v3 = v1 + 56;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24CBE6B80()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v3 = v0[40];
  uint64_t v5 = v0[38];
  sub_24CBE7210(v0[32]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_24CBE3CDC(v1);
  sub_24CBE3CDC(v2);
  OUTLINED_FUNCTION_2_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24CBE6C58()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7();
  void *v2 = v1;
  uint64_t v3 = v1 + 16;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24CBE6D24()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24CBE6DEC()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  sub_24CBE3CDC(v1);
  sub_24CBE3CDC(v2);
  OUTLINED_FUNCTION_2_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24CBE6EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v23 = a8;
  int v13 = a6;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C40);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC23B00();
  swift_bridgeObjectRetain();
  sub_24CC23AF0();
  sub_24CBE726C(a5, (uint64_t)v16, &qword_269818C40);
  sub_24CC23B10();
  if (v13 == 2) {
    sub_24CC23B20();
  }
  sub_24CC23B30();
  uint64_t v17 = type metadata accessor for TellMeGeneratedSnippetModels();
  __swift_getEnumTagSinglePayload(a7, 1, v17);
  sub_24CC23B50();
  sub_24CC23B40();
  if (a9)
  {
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F68]), sel_init);
    sub_24CBE72D0(v23, a9, v18);
    sub_24CBE7328(a10, a11, v18);
    uint64_t v19 = sub_24CC23ED0();
    sub_24CBE7380(v19, v20, v18);
  }
  return sub_24CC23AE0();
}

uint64_t sub_24CBE7050(uint64_t a1)
{
  return sub_24CBE6EB4(a1, *(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88));
}

uint64_t sub_24CBE7094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CBE70F8()
{
  unint64_t result = qword_269818C38;
  if (!qword_269818C38)
  {
    type metadata accessor for TellMeGeneratedSnippetModels();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C38);
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

uint64_t sub_24CBE71AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBE7210(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBE726C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_24CBE72D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24CC23EC0();
  objc_msgSend(a3, sel_setInput_, v4);
}

void sub_24CBE7328(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24CC23EC0();
  objc_msgSend(a3, sel_setOutput_, v4);
}

void sub_24CBE7380(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDomain_, v4);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return *(void *)(v0 + 176);
}

uint64_t AttributionListSnippetModel.init(attributions:context:)()
{
  return sub_24CC238F0();
}

uint64_t type metadata accessor for AttributionListSnippetModel()
{
  uint64_t result = qword_269818CC0;
  if (!qword_269818CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AttributionListSnippetModel.attributions.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBE7560()
{
  return AttributionListSnippetModel.attributions.setter();
}

uint64_t AttributionListSnippetModel.attributions.setter()
{
  return sub_24CC23920();
}

uint64_t (*AttributionListSnippetModel.attributions.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  v2[4] = sub_24CC23900();
  return sub_24CBE7630;
}

uint64_t AttributionListSnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CBE7678@<D0>(uint64_t a1@<X8>)
{
  AttributionListSnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CBE76BC()
{
  return AttributionListSnippetModel.context.setter();
}

uint64_t AttributionListSnippetModel.context.setter()
{
  return sub_24CC23920();
}

uint64_t (*AttributionListSnippetModel.context.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for AttributionListSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  v2[4] = sub_24CC23900();
  return sub_24CBE7630;
}

void sub_24CBE77E4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_24CBE7830(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7475626972747461 && a2 == 0xEC000000736E6F69;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CBE7928(char a1)
{
  if (a1) {
    return 0x747865746E6F63;
  }
  else {
    return 0x7475626972747461;
  }
}

uint64_t sub_24CBE7968()
{
  return sub_24CBE7928(*v0);
}

uint64_t sub_24CBE7970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBE7830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBE7998(uint64_t a1)
{
  unint64_t v2 = sub_24CBE7BB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBE79D4(uint64_t a1)
{
  unint64_t v2 = sub_24CBE7BB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AttributionListSnippetModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C48);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE7BB8();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  sub_24CBE808C((uint64_t)&unk_269818C58);
  sub_24CC242E0();
  if (!v1)
  {
    type metadata accessor for AttributionListSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CBE8158((uint64_t)&unk_269818C80);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_24CBE7BB8()
{
  unint64_t result = qword_269818C50;
  if (!qword_269818C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C50);
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

unint64_t sub_24CBE7C4C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B60);
    sub_24CBE8304(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBE7CDC()
{
  unint64_t result = qword_269818C88;
  if (!qword_269818C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C88);
  }
  return result;
}

unint64_t sub_24CBE7D28()
{
  unint64_t result = qword_269818C90;
  if (!qword_269818C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818C90);
  }
  return result;
}

uint64_t AttributionListSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6 - v5;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v22 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818C98);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4_0();
  uint64_t v11 = type metadata accessor for AttributionListSnippetModel();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE7BB8();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_24CBE808C((uint64_t)&unk_269818CA0);
  sub_24CC24270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v14, v22, v23);
  sub_24CBE8158((uint64_t)&unk_269818CA8);
  sub_24CC24270();
  uint64_t v15 = OUTLINED_FUNCTION_2_3();
  v16(v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v14 + *(int *)(v11 + 20), v7, v21);
  sub_24CBE81B4(v14, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24CBE8218(v14);
}

unint64_t sub_24CBE808C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B68);
    sub_24CBE7C4C((uint64_t)&unk_269818C60);
    sub_24CBE7C4C((uint64_t)&unk_269818C70);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBE8158(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B70);
    sub_24CBE7CDC();
    sub_24CBE7D28();
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CBE81B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionListSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBE8218(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributionListSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CBE8274()
{
  return sub_24CBE8304((uint64_t)&unk_269818CB0);
}

unint64_t sub_24CBE82BC()
{
  return sub_24CBE8304((uint64_t)&unk_269818CB8);
}

unint64_t sub_24CBE8304(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CBE8348@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AttributionListSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24CBE8360(void *a1)
{
  return AttributionListSnippetModel.encode(to:)(a1);
}

uint64_t sub_24CBE8378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttributionListSnippetModel.attributions.getter();
  *a1 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributionListSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for AttributionListSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBE8884);
}

uint64_t sub_24CBE8884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBE891C);
}

uint64_t sub_24CBE891C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_24CBE89A8()
{
  sub_24CBE8A70();
  if (v0 <= 0x3F)
  {
    sub_24CBE8ACC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24CBE8A70()
{
  if (!qword_269818CD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B60);
    unint64_t v0 = sub_24CC23930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269818CD0);
    }
  }
}

void sub_24CBE8ACC()
{
  if (!qword_269818CD8)
  {
    unint64_t v0 = sub_24CC23930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269818CD8);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for AttributionListSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBE8BE4);
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

ValueMetadata *type metadata accessor for AttributionListSnippetModel.CodingKeys()
{
  return &type metadata for AttributionListSnippetModel.CodingKeys;
}

unint64_t sub_24CBE8C20()
{
  unint64_t result = qword_269818CE0;
  if (!qword_269818CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818CE0);
  }
  return result;
}

unint64_t sub_24CBE8C70()
{
  unint64_t result = qword_269818CE8;
  if (!qword_269818CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818CE8);
  }
  return result;
}

unint64_t sub_24CBE8CC0()
{
  unint64_t result = qword_269818CF0;
  if (!qword_269818CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818CF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CBE8D80@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return CodableMessage.init(serializedData:)(a1, a2, a3, a4, a5);
}

uint64_t CodableMessage.init(serializedData:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a5;
  sub_24CC23D10();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_2();
  uint64_t v21 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v20 - v14;
  uint64_t v22 = a4;
  uint64_t v23 = a3;
  unint64_t v16 = a2;
  swift_getAssociatedConformanceWitness();
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  sub_24CBE90F8(a1, a2);
  sub_24CC23D00();
  uint64_t v17 = v28;
  sub_24CC23D20();
  if (v17) {
    return sub_24CBD8944(a1, a2);
  }
  uint64_t v19 = v21;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v13, v15, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v22 + 32))(v13, v23);
  sub_24CBD8944(a1, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v15, AssociatedTypeWitness);
}

uint64_t sub_24CBE8FB8(uint64_t a1, uint64_t a2)
{
  return CodableMessage.serializedData()(a1, a2);
}

uint64_t CodableMessage.serializedData()(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = sub_24CC23D30();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_24CBE90F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CBE9150()
{
  return 1;
}

uint64_t sub_24CBE9158()
{
  return sub_24CC24340();
}

uint64_t sub_24CBE9180(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7A696C6169726573 && a2 == 0xEF6F746F72506465)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CC24310();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CBE9220()
{
  return sub_24CC24350();
}

uint64_t sub_24CBE9264()
{
  return 0x7A696C6169726573;
}

uint64_t sub_24CBE9294()
{
  return sub_24CC24350();
}

uint64_t sub_24CBE92D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBE9180(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CBE9304()
{
  return sub_24CBD8400();
}

uint64_t sub_24CBE9320@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBE9150();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CBE934C(uint64_t a1)
{
  unint64_t v2 = sub_24CBE9598();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBE9388(uint64_t a1)
{
  unint64_t v2 = sub_24CBE9598();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Decodable<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v14 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE9598();
  sub_24CC24360();
  if (!v4)
  {
    sub_24CBE95E4();
    sub_24CC24270();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 40))(v16, v17, a2, a3);
    uint64_t v11 = OUTLINED_FUNCTION_1_6();
    v12(v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(a4, v5, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24CBE9598()
{
  unint64_t result = qword_269818D00;
  if (!qword_269818D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D00);
  }
  return result;
}

unint64_t sub_24CBE95E4()
{
  unint64_t result = qword_269818D08;
  if (!qword_269818D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D08);
  }
  return result;
}

uint64_t Encodable<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D10);
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE9598();
  sub_24CC24370();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  if (!v16)
  {
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    sub_24CBE9790();
    sub_24CC242E0();
    sub_24CBD8944(v13, v14);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
}

unint64_t sub_24CBE9790()
{
  unint64_t result = qword_269818D18;
  if (!qword_269818D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D18);
  }
  return result;
}

uint64_t dispatch thunk of CodableMessage.proto.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CodableMessage.init(proto:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of CodableMessage.init(serializedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of CodableMessage.serializedData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t getEnumTagSinglePayload for CodableMessageCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CodableMessageCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CBE9944);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CBE996C()
{
  return 0;
}

ValueMetadata *type metadata accessor for CodableMessageCodingKeys()
{
  return &type metadata for CodableMessageCodingKeys;
}

unint64_t sub_24CBE9988()
{
  unint64_t result = qword_269818D20;
  if (!qword_269818D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D20);
  }
  return result;
}

unint64_t sub_24CBE99D8()
{
  unint64_t result = qword_269818D28;
  if (!qword_269818D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D28);
  }
  return result;
}

unint64_t sub_24CBE9A28()
{
  unint64_t result = qword_269818D30;
  if (!qword_269818D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D30);
  }
  return result;
}

void sub_24CBE9A74()
{
}

uint64_t sub_24CBE9A8C()
{
  return sub_24CC1D59C();
}

void sub_24CBE9AA4()
{
}

uint64_t sub_24CBE9ABC()
{
  return sub_24CC1D4E4();
}

void sub_24CBE9AD4()
{
}

uint64_t sub_24CBE9AEC()
{
  return sub_24CC1D540();
}

void sub_24CBE9B04()
{
}

uint64_t sub_24CBE9B1C()
{
  return sub_24CC1D6B0();
}

void sub_24CBE9B34()
{
}

uint64_t sub_24CBE9B4C()
{
  return sub_24CC1D5F8();
}

void sub_24CBE9B64()
{
}

uint64_t sub_24CBE9B7C()
{
  return sub_24CC1D654();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return v0;
}

void TipSnippetModel.init(tip:context:)(void *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  uint64_t v6 = MEMORY[0x270FA5388](v27);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - v7;
  long long v30 = *a2;
  uint64_t v9 = *((void *)a2 + 2);
  uint64_t v28 = *((void *)a2 + 3);
  uint64_t v29 = v9;
  uint64_t v10 = type metadata accessor for TipSnippetModel(0);
  long long v31 = 0uLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D40);
  sub_24CC238F0();
  uint64_t v26 = a3 + *(int *)(v10 + 32);
  uint64_t v25 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v25);
  sub_24CBEC5B4();
  sub_24CC238F0();
  sub_24CBE9F58((uint64_t)v8);
  id v11 = objc_msgSend(a1, sel_identifier);
  uint64_t v12 = sub_24CC23ED0();
  uint64_t v14 = v13;

  *(void *)&long long v31 = v12;
  *((void *)&v31 + 1) = v14;
  sub_24CC238F0();
  uint64_t v15 = sub_24CBEC550(a1);
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v18();
  *(void *)&long long v31 = v15;
  *((void *)&v31 + 1) = v17;
  sub_24CC238F0();
  *(void *)&long long v31 = TPSTip.bodyContentOrText.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D48);
  sub_24CC238F0();
  id v19 = objc_msgSend(a1, sel_language);
  uint64_t v20 = sub_24CC23ED0();
  uint64_t v22 = v21;

  *(void *)&long long v31 = v20;
  *((void *)&v31 + 1) = v22;
  sub_24CC238F0();
  sub_24CC170E0((uint64_t)v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v23();
  sub_24CBEC5B4();
  sub_24CC238F0();
  sub_24CBE9F58((uint64_t)v8);
  long long v31 = v30;
  uint64_t v32 = v29;
  uint64_t v33 = v28;
  sub_24CC238F0();
}

uint64_t type metadata accessor for TipSnippetModel(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269818DD0);
}

uint64_t type metadata accessor for TipSnippetModel.AssetConfiguration(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269818E00);
}

uint64_t sub_24CBE9F24(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CBE9F58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBE9FB8(char a1)
{
  return sub_24CC24350();
}

uint64_t sub_24CBEA01C()
{
  return OUTLINED_FUNCTION_12_0();
}

uint64_t sub_24CBEA034()
{
  return OUTLINED_FUNCTION_12_0();
}

uint64_t sub_24CBEA04C()
{
  return sub_24CC24350();
}

uint64_t sub_24CBEA098(uint64_t a1, char a2)
{
  sub_24CBEC0F8(a2);
  sub_24CC23F40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBEA0EC()
{
  return OUTLINED_FUNCTION_9_1();
}

uint64_t sub_24CBEA104()
{
  return OUTLINED_FUNCTION_9_1();
}

uint64_t sub_24CBEA11C()
{
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_24CBEA134()
{
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_24CBEA14C()
{
  return sub_24CC24350();
}

uint64_t sub_24CBEA198(uint64_t a1, char a2)
{
  return sub_24CC24350();
}

uint64_t sub_24CBEA1F8()
{
  return sub_24CC24350();
}

uint64_t TipSnippetModel.AssetConfiguration.lightThumbnailURL.getter()
{
  return sub_24CBEC5B4();
}

uint64_t TipSnippetModel.AssetConfiguration.lightThumbnailURL.setter(uint64_t a1)
{
  return sub_24CBEC600(a1, v1);
}

uint64_t (*TipSnippetModel.AssetConfiguration.lightThumbnailURL.modify())()
{
  return nullsub_1;
}

uint64_t TipSnippetModel.AssetConfiguration.darkThumbnailURL.getter()
{
  return sub_24CBEC5B4();
}

uint64_t TipSnippetModel.AssetConfiguration.darkThumbnailURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TipSnippetModel.AssetConfiguration(0) + 20);
  return sub_24CBEC600(a1, v3);
}

uint64_t (*TipSnippetModel.AssetConfiguration.darkThumbnailURL.modify())()
{
  return nullsub_1;
}

double TipSnippetModel.AssetConfiguration.heightToWidthRatio.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for TipSnippetModel.AssetConfiguration(0) + 24));
}

uint64_t TipSnippetModel.AssetConfiguration.heightToWidthRatio.setter(double a1)
{
  uint64_t result = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*TipSnippetModel.AssetConfiguration.heightToWidthRatio.modify())()
{
  return nullsub_1;
}

uint64_t sub_24CBEA3F4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024CC28630 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC28650 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024CC28670)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CBEA534()
{
  return 3;
}

unint64_t sub_24CBEA53C(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0xD000000000000012;
}

unint64_t sub_24CBEA598()
{
  return sub_24CBEA53C(*v0);
}

uint64_t sub_24CBEA5A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBEA3F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBEA5C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBEA534();
  *a1 = result;
  return result;
}

uint64_t sub_24CBEA5F0(uint64_t a1)
{
  unint64_t v2 = sub_24CBEC668();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBEA62C(uint64_t a1)
{
  unint64_t v2 = sub_24CBEC668();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TipSnippetModel.AssetConfiguration.encode(to:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D58);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBEC668();
  sub_24CC24370();
  char v13 = 0;
  sub_24CC23380();
  sub_24CBEC6B4(&qword_269818D68, MEMORY[0x263F06EA8]);
  OUTLINED_FUNCTION_15_0(v4, (uint64_t)&v13);
  if (!v2)
  {
    uint64_t v10 = v4 + *(int *)(type metadata accessor for TipSnippetModel.AssetConfiguration(0) + 20);
    char v12 = 1;
    OUTLINED_FUNCTION_15_0(v10, (uint64_t)&v12);
    sub_24CC242D0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
}

uint64_t TipSnippetModel.AssetConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v23[1] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_20_0();
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (uint64_t)v23 - v6;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D70);
  OUTLINED_FUNCTION_0();
  v23[2] = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_24CC23380();
  OUTLINED_FUNCTION_16_0(v13);
  uint64_t v15 = v13 + *(int *)(v10 + 28);
  OUTLINED_FUNCTION_16_0(v15);
  uint64_t v16 = *(int *)(v10 + 32);
  *(void *)(v13 + v16) = 0x3FF0000000000000;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBEC668();
  uint64_t v17 = v27;
  sub_24CC24360();
  if (!v17)
  {
    v23[0] = v15;
    uint64_t v27 = v16;
    uint64_t v18 = v24;
    char v30 = 0;
    sub_24CBEC6B4(&qword_269818D78, MEMORY[0x263F06EA8]);
    OUTLINED_FUNCTION_26_0(v14, (uint64_t)&v30, v26);
    sub_24CBEC600(v25, v13);
    char v29 = 1;
    OUTLINED_FUNCTION_26_0(v14, (uint64_t)&v29, v26);
    sub_24CBEC600(v18, v23[0]);
    char v28 = 2;
    sub_24CC24260();
    uint64_t v21 = v20;
    OUTLINED_FUNCTION_3_2();
    v22();
    *(void *)(v13 + v27) = v21;
    sub_24CBEC744();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24CBEC794(v13, (void (*)(void))type metadata accessor for TipSnippetModel.AssetConfiguration);
}

uint64_t sub_24CBEAB1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TipSnippetModel.AssetConfiguration.init(from:)(a1, a2);
}

uint64_t sub_24CBEAB34(void *a1)
{
  return TipSnippetModel.AssetConfiguration.encode(to:)(a1);
}

uint64_t TipSnippetModel.identifier.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBEAB80()
{
  return TipSnippetModel.identifier.setter();
}

uint64_t TipSnippetModel.identifier.setter()
{
  return OUTLINED_FUNCTION_21_0();
}

uint64_t (*TipSnippetModel.identifier.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  v1[4] = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.title.getter()
{
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBEAC98()
{
  return TipSnippetModel.title.setter();
}

uint64_t TipSnippetModel.title.setter()
{
  return OUTLINED_FUNCTION_21_0();
}

uint64_t (*TipSnippetModel.title.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.bodyContent.getter()
{
  OUTLINED_FUNCTION_7_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBEADC0()
{
  return TipSnippetModel.bodyContent.setter();
}

uint64_t TipSnippetModel.bodyContent.setter()
{
  return sub_24CC23920();
}

uint64_t (*TipSnippetModel.bodyContent.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.language.getter()
{
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBEAEDC()
{
  return TipSnippetModel.language.setter();
}

uint64_t TipSnippetModel.language.setter()
{
  return OUTLINED_FUNCTION_21_0();
}

uint64_t (*TipSnippetModel.language.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.thumbnailAssetConfiguration.getter()
{
  return sub_24CC23910();
}

uint64_t sub_24CBEB008()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBEC5B4();
  return TipSnippetModel.thumbnailAssetConfiguration.setter((uint64_t)v2);
}

uint64_t TipSnippetModel.thumbnailAssetConfiguration.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_4_0();
  sub_24CBEC5B4();
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  sub_24CC23920();
  return sub_24CBE9F58(a1);
}

uint64_t (*TipSnippetModel.thumbnailAssetConfiguration.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CBEB1E8@<D0>(uint64_t a1@<X8>)
{
  TipSnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CBEB22C()
{
  return TipSnippetModel.context.setter();
}

uint64_t TipSnippetModel.context.setter()
{
  return OUTLINED_FUNCTION_21_0();
}

uint64_t (*TipSnippetModel.context.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t TipSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v70 = *MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D80);
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v4;
  uint64_t v58 = v5;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_14_0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_20_0();
  uint64_t v56 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v50 - v11;
  uint64_t v13 = type metadata accessor for TipSnippetModel(0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16 - v15;
  uint64_t v19 = v16 - v15 + *(int *)(v18 + 20);
  long long v67 = 0uLL;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D40);
  uint64_t v62 = v19;
  sub_24CC238F0();
  uint64_t v60 = v13;
  uint64_t v21 = *(int *)(v13 + 32);
  uint64_t v22 = v2;
  uint64_t v63 = v17;
  uint64_t v23 = v17 + v21;
  uint64_t v24 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  OUTLINED_FUNCTION_16_0((uint64_t)v12);
  sub_24CBEC5B4();
  uint64_t v61 = v23;
  sub_24CC238F0();
  sub_24CBE9F58((uint64_t)v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBEC6F8();
  uint64_t v25 = v59;
  sub_24CC24360();
  if (v25)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v26 = v61;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_3_2();
    v27();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
    OUTLINED_FUNCTION_32();
    return (*(uint64_t (**)(uint64_t))(v28 + 8))(v26);
  }
  uint64_t v59 = v20;
  uint64_t v53 = v12;
  uint64_t v54 = v6;
  LOBYTE(v67) = 0;
  *(void *)&long long v67 = sub_24CC24250();
  *((void *)&v67 + 1) = v30;
  sub_24CC238F0();
  LOBYTE(v67) = 1;
  uint64_t v31 = sub_24CC24250();
  int v52 = 1;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v35();
  *(void *)&long long v67 = v32;
  *((void *)&v67 + 1) = v34;
  sub_24CC238F0();
  LOBYTE(v64) = 2;
  sub_24CBE95E4();
  OUTLINED_FUNCTION_27_0();
  uint64_t v59 = v22;
  sub_24CC24270();
  uint64_t v51 = a1;
  long long v36 = v67;
  uint64_t v37 = self;
  uint64_t v50 = v36;
  uint64_t v38 = (void *)sub_24CC23390();
  *(void *)&long long v64 = 0;
  id v39 = objc_msgSend(v37, sel_JSONObjectWithData_options_error_, v38, 0, &v64);

  id v40 = (id)v64;
  uint64_t v41 = v63;
  if (!v39)
  {
    char v43 = v40;
    uint64_t v44 = (void *)sub_24CC232A0();

    swift_willThrow();
    goto LABEL_8;
  }
  sub_24CC240F0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D48);
  if (!swift_dynamicCast())
  {
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818D90);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_24CC251D0;
    *(void *)(v42 + 32) = sub_24CC23E50();
    goto LABEL_9;
  }
  uint64_t v42 = v64;
LABEL_9:
  *(void *)&long long v67 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D48);
  sub_24CC238F0();
  sub_24CBD8944(v50, *((unint64_t *)&v36 + 1));
  LOBYTE(v67) = 3;
  *(void *)&long long v67 = sub_24CC24250();
  *((void *)&v67 + 1) = v45;
  sub_24CC238F0();
  LOBYTE(v67) = 4;
  sub_24CBEC6B4(&qword_269818D98, (void (*)(uint64_t))type metadata accessor for TipSnippetModel.AssetConfiguration);
  uint64_t v46 = v56;
  sub_24CC24270();
  __swift_storeEnumTagSinglePayload(v46, 0, 1, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v47();
  sub_24CBEC5B4();
  sub_24CC238F0();
  sub_24CBE9F58(v46);
  LOBYTE(v64) = 5;
  sub_24CBE7CDC();
  OUTLINED_FUNCTION_27_0();
  sub_24CC24270();
  long long v64 = v67;
  uint64_t v65 = v68;
  uint64_t v66 = v69;
  sub_24CC238F0();
  uint64_t v48 = OUTLINED_FUNCTION_4_1();
  v49(v48);
  sub_24CBEC744();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  return sub_24CBEC794(v41, (void (*)(void))type metadata accessor for TipSnippetModel);
}

uint64_t TipSnippetModel.encode(to:)(void *a1)
{
  v23[4] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818D38);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_14_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818DA0);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBEC6F8();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  sub_24CC23910();
  LOBYTE(v23[0]) = 0;
  OUTLINED_FUNCTION_23_0();
  sub_24CC242C0();
  if (v22)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = v2;
    swift_bridgeObjectRelease();
    type metadata accessor for TipSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
    sub_24CC23910();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818D40);
    sub_24CBEC7E8();
    OUTLINED_FUNCTION_19_0();
    swift_bridgeObjectRelease();
    uint64_t v10 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
    sub_24CC23910();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818C18);
    OUTLINED_FUNCTION_22_0();
    uint64_t v11 = (void *)sub_24CC23FA0();
    swift_bridgeObjectRelease();
    v23[0] = 0;
    id v12 = objc_msgSend(v10, sel_dataWithJSONObject_options_error_, v11, 0, v23);

    id v13 = v23[0];
    if (v12)
    {
      uint64_t v14 = (void *)sub_24CC233A0();
      uint64_t v16 = v15;

      v23[0] = v14;
      v23[1] = v16;
      unint64_t v17 = (unint64_t)v16;
      sub_24CBE9790();
      OUTLINED_FUNCTION_19_0();
      uint64_t v18 = v21;
      sub_24CBD8944((uint64_t)v14, v17);
    }
    else
    {
      uint64_t v19 = v13;
      uint64_t v20 = (void *)sub_24CC232A0();

      swift_willThrow();
      uint64_t v18 = v21;
    }
    sub_24CC23910();
    LOBYTE(v23[0]) = 3;
    OUTLINED_FUNCTION_23_0();
    sub_24CC242C0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
    sub_24CC23910();
    LOBYTE(v23[0]) = 4;
    sub_24CBEC854();
    OUTLINED_FUNCTION_19_0();
    sub_24CBE9F58(v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CC23910();
    sub_24CBE7D28();
    OUTLINED_FUNCTION_19_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
  }
}

uint64_t sub_24CBEC0A0()
{
  unint64_t v0 = sub_24CC24200();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_24CBEC0F0()
{
  return 6;
}

unint64_t sub_24CBEC0F8(char a1)
{
  unint64_t result = 0xD00000000000001BLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x746E6F4379646F62;
      break;
    case 3:
      unint64_t result = 0x65676175676E616CLL;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

unint64_t sub_24CBEC1D4(char a1)
{
  unint64_t result = 0xD00000000000001BLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x746E6F4379646F62;
      break;
    case 3:
      unint64_t result = 0x65676175676E616CLL;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

uint64_t sub_24CBEC2B0(char *a1, char *a2)
{
  return sub_24CC0C7B0(*a1, *a2);
}

uint64_t sub_24CBEC2BC()
{
  return sub_24CBE9FB8(*v0);
}

uint64_t sub_24CBEC2C4(uint64_t a1)
{
  return sub_24CBEA098(a1, *v1);
}

uint64_t sub_24CBEC2CC(uint64_t a1)
{
  return sub_24CBEA198(a1, *v1);
}

uint64_t sub_24CBEC2D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBEC0A0();
  *a1 = result;
  return result;
}

unint64_t sub_24CBEC304@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24CBEC0F8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24CBEC330()
{
  return sub_24CBEC1D4(*v0);
}

uint64_t sub_24CBEC338@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBEC0EC();
  *a1 = result;
  return result;
}

uint64_t sub_24CBEC360@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CBEC0F0();
  *a1 = result;
  return result;
}

uint64_t sub_24CBEC388(uint64_t a1)
{
  unint64_t v2 = sub_24CBEC6F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBEC3C4(uint64_t a1)
{
  unint64_t v2 = sub_24CBEC6F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TipSnippetModel.altBodyRepresentation.getter()
{
  self;
  OUTLINED_FUNCTION_7_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  sub_24CC23910();
  sub_24CC17364(v1);
  swift_bridgeObjectRelease();
  return sub_24CBEC8F8();
}

void TipSnippetModel.punchOutUrl.getter()
{
  unint64_t v0 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  sub_24CC23910();
  uint64_t v1 = (void *)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_URLWithTipIdentifier_collectionIdentifier_referrer_, v1, 0, 0);

  sub_24CC23360();
}

uint64_t sub_24CBEC520@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TipSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24CBEC538(void *a1)
{
  return TipSnippetModel.encode(to:)(a1);
}

uint64_t sub_24CBEC550(void *a1)
{
  id v1 = objc_msgSend(a1, sel_title);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_24CC23ED0();

  return v3;
}

uint64_t sub_24CBEC5B4()
{
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v2 = OUTLINED_FUNCTION_17_0();
  v3(v2);
  return v0;
}

uint64_t sub_24CBEC600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CBEC668()
{
  unint64_t result = qword_269818D60;
  if (!qword_269818D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D60);
  }
  return result;
}

uint64_t sub_24CBEC6B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_22_0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CBEC6F8()
{
  unint64_t result = qword_269818D88;
  if (!qword_269818D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818D88);
  }
  return result;
}

uint64_t sub_24CBEC744()
{
  OUTLINED_FUNCTION_18_0();
  v1(0);
  OUTLINED_FUNCTION_32();
  uint64_t v2 = OUTLINED_FUNCTION_17_0();
  v3(v2);
  return v0;
}

uint64_t sub_24CBEC794(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v3();
  return a1;
}

unint64_t sub_24CBEC7E8()
{
  unint64_t result = qword_269818DA8;
  if (!qword_269818DA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818D40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818DA8);
  }
  return result;
}

unint64_t sub_24CBEC854()
{
  unint64_t result = qword_269818DB0;
  if (!qword_269818DB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818D38);
    sub_24CBEC6B4(&qword_269818DB8, (void (*)(uint64_t))type metadata accessor for TipSnippetModel.AssetConfiguration);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818DB0);
  }
  return result;
}

uint64_t sub_24CBEC8F8()
{
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E48);
  OUTLINED_FUNCTION_22_0();
  id v1 = (void *)sub_24CC23FA0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_altTextRepresentationForContent_, v1);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24CC23ED0();

  return v3;
}

uint64_t sub_24CBEC990()
{
  return sub_24CBEC6B4(&qword_269818DC0, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
}

uint64_t sub_24CBEC9D8()
{
  return sub_24CBEC6B4(&qword_269818DC8, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
}

uint64_t sub_24CBECA20()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = TipSnippetModel.identifier.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_24CBECA4C()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = TipSnippetModel.title.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_24CBECA78()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = TipSnippetModel.bodyContent.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CBECAA4()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = TipSnippetModel.language.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_24CBECAD0()
{
  return TipSnippetModel.thumbnailAssetConfiguration.getter();
}

uint64_t *initializeBufferWithCopyOfBuffer for TipSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = a3[9];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  return a1;
}

uint64_t destroy for TipSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v5(a1 + a2[7], v4);
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[9];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  return v14(v12, v13);
}

uint64_t initializeWithCopy for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  return a1;
}

uint64_t assignWithCopy for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  return a1;
}

uint64_t assignWithTake for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBED630);
}

uint64_t sub_24CBED630(uint64_t a1, uint64_t a2, int *a3)
{
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v11 + 84) == v3)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v14 + 84) == v3)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        OUTLINED_FUNCTION_1_5();
        if (*(_DWORD *)(v16 + 84) == v3)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[8];
        }
        else
        {
          uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          uint64_t v12 = a3[9];
        }
      }
    }
    uint64_t v9 = v4 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBED73C);
}

uint64_t sub_24CBED73C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        OUTLINED_FUNCTION_1_5();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[8];
        }
        else
        {
          uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
          uint64_t v14 = a4[9];
        }
      }
    }
    uint64_t v11 = v5 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

void sub_24CBED83C()
{
  sub_24CBEDA54(319, &qword_269818DE0);
  if (v0 <= 0x3F)
  {
    sub_24CBEDA08(319, &qword_269818DE8, &qword_269818D40);
    if (v1 <= 0x3F)
    {
      sub_24CBEDA08(319, &qword_269818DF0, &qword_269818D48);
      if (v2 <= 0x3F)
      {
        sub_24CBEDA08(319, &qword_269818DF8, &qword_269818D38);
        if (v3 <= 0x3F)
        {
          sub_24CBEDA54(319, (unint64_t *)&qword_269818CD8);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_24CBEDA08(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    OUTLINED_FUNCTION_22_0();
    unint64_t v4 = sub_24CC23930();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_24CBEDA54(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_24CC23930();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TipSnippetModel.AssetConfiguration(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24CC23380();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v10, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TipSnippetModel.AssetConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23380();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v7(v5, v4);
  }
  return result;
}

char *initializeWithCopy for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC23380();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithCopy for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC23380();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
LABEL_13:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *initializeWithTake for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC23380();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithTake for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC23380();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
LABEL_13:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.AssetConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBEE54C);
}

uint64_t sub_24CBEE54C()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel.AssetConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBEE5A8);
}

uint64_t sub_24CBEE5A8()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

void sub_24CBEE5F4()
{
  sub_24CBEE690();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CBEE690()
{
  if (!qword_269818E10)
  {
    sub_24CC23380();
    unint64_t v0 = sub_24CC240A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269818E10);
    }
  }
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TipSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBEE83CLL);
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

ValueMetadata *type metadata accessor for TipSnippetModel.CodingKeys()
{
  return &type metadata for TipSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.AssetConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TipSnippetModel.AssetConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBEE9C8);
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

ValueMetadata *type metadata accessor for TipSnippetModel.AssetConfiguration.CodingKeys()
{
  return &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys;
}

unint64_t sub_24CBEEA04()
{
  unint64_t result = qword_269818E18;
  if (!qword_269818E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E18);
  }
  return result;
}

unint64_t sub_24CBEEA54()
{
  unint64_t result = qword_269818E20;
  if (!qword_269818E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E20);
  }
  return result;
}

unint64_t sub_24CBEEAA4()
{
  unint64_t result = qword_269818E28;
  if (!qword_269818E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E28);
  }
  return result;
}

unint64_t sub_24CBEEAF4()
{
  unint64_t result = qword_269818E30;
  if (!qword_269818E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E30);
  }
  return result;
}

unint64_t sub_24CBEEB44()
{
  unint64_t result = qword_269818E38;
  if (!qword_269818E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E38);
  }
  return result;
}

unint64_t sub_24CBEEB94()
{
  unint64_t result = qword_269818E40;
  if (!qword_269818E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E40);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for TipSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return type metadata accessor for TipSnippetModel(0);
}

void *OUTLINED_FUNCTION_8_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_24CC23F40();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_24CBEA14C();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_24CC23900();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_24CBEA04C();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F3E0](a1, a2, v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_24CC242E0();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_24CC23920();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9F2A0](a1, a2, a3, v4, v3);
}

uint64_t sub_24CBEEDB0(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CC251D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  uint64_t v3 = v18[0];
  *(void *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  *(void *)(inited + 64) = &protocol witness table for [A];
  *(void *)(inited + 32) = v3;
  sub_24CBEF25C(inited + 32, (uint64_t)v18);
  uint64_t v4 = v19;
  uint64_t v5 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  char v17 = a1;
  uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 8))(&v17, v4, v5);
  uint64_t v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24CBF1A94(0, *(void *)(v9 + 16) + 1, 1, v9);
      uint64_t v9 = v15;
    }
    unint64_t v11 = *(void *)(v9 + 16);
    unint64_t v10 = *(void *)(v9 + 24);
    if (v11 >= v10 >> 1)
    {
      sub_24CBF1A94(v10 > 1, v11 + 1, 1, v9);
      uint64_t v9 = v16;
    }
    *(void *)(v9 + 16) = v11 + 1;
    uint64_t v12 = v9 + 16 * v11;
    *(void *)(v12 + 32) = v6;
    *(void *)(v12 + 40) = v8;
  }
  swift_setDeallocating();
  sub_24CBEF37C();
  v18[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E50);
  sub_24CBEF2C0();
  uint64_t v13 = sub_24CC23E80();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_24CBEEF60(char a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    uint64_t v6 = MEMORY[0x263F8EE78];
    do
    {
      sub_24CBEF25C(v5, (uint64_t)v20);
      uint64_t v7 = v21;
      uint64_t v8 = v22;
      __swift_project_boxed_opaque_existential_1(v20, v21);
      char v19 = a1;
      uint64_t v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 8))(&v19, v7, v8);
      uint64_t v11 = v10;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      if (v11)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_1_7();
          uint64_t v6 = v15;
        }
        unint64_t v13 = *(void *)(v6 + 16);
        unint64_t v12 = *(void *)(v6 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_24CBF1A94(v12 > 1, v13 + 1, 1, v6);
          uint64_t v6 = v16;
        }
        *(void *)(v6 + 16) = v13 + 1;
        uint64_t v14 = v6 + 16 * v13;
        *(void *)(v14 + 32) = v9;
        *(void *)(v14 + 40) = v11;
      }
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  v20[0] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E50);
  sub_24CBEF2C0();
  uint64_t v17 = OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t ContentSelectable<>.selectableContent(itemStyle:)(char *a1, uint64_t a2, uint64_t a3)
{
  char v3 = *a1;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 32;
    uint64_t v7 = MEMORY[0x263F8EE78];
    do
    {
      sub_24CBEF25C(v6, (uint64_t)v21);
      uint64_t v8 = v22;
      uint64_t v9 = v23;
      __swift_project_boxed_opaque_existential_1(v21, v22);
      char v20 = v3;
      uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 8))(&v20, v8, v9);
      uint64_t v12 = v11;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_1_7();
          uint64_t v7 = v16;
        }
        unint64_t v14 = *(void *)(v7 + 16);
        unint64_t v13 = *(void *)(v7 + 24);
        if (v14 >= v13 >> 1)
        {
          sub_24CBF1A94(v13 > 1, v14 + 1, 1, v7);
          uint64_t v7 = v17;
        }
        *(void *)(v7 + 16) = v14 + 1;
        uint64_t v15 = v7 + 16 * v14;
        *(void *)(v15 + 32) = v10;
        *(void *)(v15 + 40) = v12;
      }
      v6 += 40;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  v21[0] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E50);
  sub_24CBEF2C0();
  uint64_t v18 = OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_24CBEF25C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24CBEF2C0()
{
  unint64_t result = qword_269818E58;
  if (!qword_269818E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818E50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E58);
  }
  return result;
}

uint64_t sub_24CBEF314(char *a1)
{
  return sub_24CBEEF60(*a1, ListStyleAnswerSnippetModel.selectableComponents.getter);
}

uint64_t sub_24CBEF344(char *a1)
{
  return sub_24CBEEF60(*a1, SummarizedAnswerSnippetModel.selectableComponents.getter);
}

uint64_t sub_24CBEF374(char *a1)
{
  return sub_24CBEEDB0(*a1);
}

uint64_t sub_24CBEF37C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E68);
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24CBEF3E0()
{
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t dispatch thunk of ComponentsContentSelectable.selectableComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_24CC23E80();
}

void OUTLINED_FUNCTION_1_7()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_24CBF1A94(0, v2, 1, v0);
}

void Array<A>.asAttributionGroups()()
{
  uint64_t v1 = OUTLINED_FUNCTION_15_1() - 8;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v36 = (uint64_t)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v32 - v5;
  uint64_t v38 = *(void *)(v0 + 16);
  if (v38)
  {
    uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v8 = (v7 + 32) & ~v7;
    uint64_t v37 = v0 + v8;
    uint64_t v9 = *(void *)(v4 + 72);
    uint64_t v35 = v9 + v8;
    uint64_t v34 = v7 | 7;
    v32[1] = v0;
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    uint64_t v11 = MEMORY[0x263F8EE78];
    long long v33 = xmmword_24CC251D0;
    while (1)
    {
      sub_24CBF0C80(v37 + v9 * v10, (uint64_t)v6);
      uint64_t v12 = *(void *)(v11 + 16);
      if (v12)
      {
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        uint64_t v15 = *((void *)v6 + 2);
        uint64_t v16 = *((void *)v6 + 3);
        while (1)
        {
          BOOL v17 = *(void *)(v11 + v13 + 32) == v15 && *(void *)(v11 + v13 + 40) == v16;
          if (v17 || (sub_24CC24310() & 1) != 0) {
            break;
          }
          ++v14;
          v13 += 40;
          if (v12 == v14) {
            goto LABEL_11;
          }
        }
        sub_24CBF0C80((uint64_t)v6, v36);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24CBF1EC4(v11);
          uint64_t v11 = v31;
        }
        if (v14 >= *(void *)(v11 + 16))
        {
          __break(1u);
          return;
        }
        uint64_t v24 = v11 + v13;
        uint64_t v25 = *(void *)(v24 + 64);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v24 + 64) = v25;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v25 = sub_24CBF175C(0, *(void *)(v25 + 16) + 1, 1, v25);
          *(void *)(v24 + 64) = v25;
        }
        unint64_t v28 = *(void *)(v25 + 16);
        unint64_t v27 = *(void *)(v25 + 24);
        if (v28 >= v27 >> 1)
        {
          uint64_t v25 = sub_24CBF175C(v27 > 1, v28 + 1, 1, v25);
          *(void *)(v24 + 64) = v25;
        }
        *(void *)(v25 + 16) = v28 + 1;
        sub_24CBF1ED8(v36, v25 + v8 + v28 * v9);
      }
      else
      {
LABEL_11:
        uint64_t v18 = *((void *)v6 + 2);
        uint64_t v19 = *((void *)v6 + 3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269818E70);
        uint64_t v20 = swift_allocObject();
        *(_OWORD *)(v20 + 16) = v33;
        sub_24CBF0C80((uint64_t)v6, v20 + v8);
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24CBF1958(0, *(void *)(v11 + 16) + 1, 1, v11);
          uint64_t v11 = v29;
        }
        unint64_t v22 = *(void *)(v11 + 16);
        unint64_t v21 = *(void *)(v11 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_24CBF1958(v21 > 1, v22 + 1, 1, v11);
          uint64_t v11 = v30;
        }
        *(void *)(v11 + 16) = v22 + 1;
        uint64_t v23 = (void *)(v11 + 40 * v22);
        v23[4] = v18;
        id v23[5] = v19;
        v23[6] = v18;
        v23[7] = v19;
        v23[8] = v20;
      }
      ++v10;
      sub_24CBF1A38((uint64_t)v6);
      if (v10 == v38)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t AttributionGroup.set<A>(_:_:)@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v13 - v4;
  uint64_t v6 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[4];
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  a1[3] = v9;
  a1[4] = v10;
  (*(void (**)(char *))(v11 + 16))(v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_setAtWritableKeyPath();
}

uint64_t AttributionItem.id.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t AttributionItem.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AttributionItem.id.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.group.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t AttributionItem.group.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*AttributionItem.group.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.title.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t AttributionItem.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AttributionItem.title.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.subtitle.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t AttributionItem.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AttributionItem.subtitle.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.thumbnailImage.getter()
{
  type metadata accessor for AttributionItem();
  sub_24CC238E0();
  OUTLINED_FUNCTION_32();
  uint64_t v0 = OUTLINED_FUNCTION_6_0();
  return v1(v0);
}

uint64_t AttributionItem.thumbnailImage.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_15_1() + 32);
  sub_24CC238E0();
  OUTLINED_FUNCTION_32();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v2, v0, v3);
}

uint64_t (*AttributionItem.thumbnailImage.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.appPunchOut.getter()
{
  return sub_24CC23850();
}

uint64_t sub_24CBEFC14(id *a1)
{
  id v1 = *a1;
  return AttributionItem.appPunchOut.setter();
}

uint64_t AttributionItem.appPunchOut.setter()
{
  return sub_24CC23860();
}

void (*AttributionItem.appPunchOut.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for AttributionItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  v2[4] = sub_24CC23840();
  return sub_24CBE77E4;
}

uint64_t AttributionItem.init(id:group:title:subtitle:thumbnailImage:punchOutUri:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v11 = (char *)a9 + *(int *)(type metadata accessor for AttributionItem() + 32);
  uint64_t v12 = sub_24CC238E0();
  OUTLINED_FUNCTION_1_5();
  uint64_t v16 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a10, v12);
  sub_24CBEFDEC(a11);
  sub_24CBF1F3C();
  sub_24CC23830();
  sub_24CBF1F7C(a11);
  unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
  return v14(a10, v12);
}

id sub_24CBEFDEC(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_9_2();
  uint64_t v4 = sub_24CC233D0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_24CC233C0();
  uint64_t v12 = sub_24CC233B0();
  uint64_t v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  sub_24CBF2150(v12, v14, v11);

  objc_msgSend(v11, sel_setAppAvailableInStorefront_, 1);
  sub_24CBF333C(a1, v1);
  uint64_t v15 = sub_24CC23380();
  uint64_t v16 = 0;
  if (__swift_getEnumTagSinglePayload(v1, 1, v15) != 1)
  {
    uint64_t v16 = (void *)sub_24CC23350();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v1, v15);
  }
  objc_msgSend(v11, sel_setPunchOutUri_, v16);

  return v11;
}

uint64_t sub_24CBEFFA8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x70756F7267 && a2 == 0xE500000000000000;
    if (v6 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
      if (v7 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656C746974627573 && a2 == 0xE800000000000000;
        if (v8 || (sub_24CC24310() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x69616E626D756874 && a2 == 0xEE006567616D496CLL;
          if (v9 || (sub_24CC24310() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x68636E7550707061 && a2 == 0xEB0000000074754FLL)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_24CC24310();
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

uint64_t sub_24CBF01F8(char a1)
{
  return qword_24CC25A00[a1];
}

uint64_t sub_24CBF0218()
{
  return sub_24CBE4554();
}

uint64_t sub_24CBF0238()
{
  return sub_24CBF01F8(*v0);
}

uint64_t sub_24CBF0240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBEFFA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBF0268(uint64_t a1)
{
  unint64_t v2 = sub_24CBF1FDC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBF02A4(uint64_t a1)
{
  unint64_t v2 = sub_24CBF1FDC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AttributionItem.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E88);
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF1FDC();
  sub_24CC24370();
  OUTLINED_FUNCTION_7_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
    type metadata accessor for AttributionItem();
    sub_24CC238E0();
    sub_24CBF22F4(&qword_269818E98, MEMORY[0x263F77210]);
    sub_24CC242E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
    sub_24CBF2028(&qword_269818EA0);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t AttributionItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  OUTLINED_FUNCTION_0_2();
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  uint64_t v28 = sub_24CC238E0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v26 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818EA8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_9_2();
  uint64_t v27 = type metadata accessor for AttributionItem();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v29 = (uint64_t *)(v16 - v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF1FDC();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  *uint64_t v29 = OUTLINED_FUNCTION_6_4();
  v29[1] = v17;
  v29[2] = OUTLINED_FUNCTION_6_4();
  v29[3] = v18;
  OUTLINED_FUNCTION_14_1();
  v29[4] = OUTLINED_FUNCTION_6_4();
  v29[5] = v19;
  v29[6] = OUTLINED_FUNCTION_6_4();
  v29[7] = v20;
  sub_24CBF22F4(&qword_269818EB0, MEMORY[0x263F77210]);
  sub_24CC24270();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))((char *)v29 + *(int *)(v27 + 32), v3, v28);
  sub_24CBF2028(&qword_269818EB8);
  sub_24CC24270();
  uint64_t v21 = OUTLINED_FUNCTION_2_4();
  v22(v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))((char *)v29 + *(int *)(v27 + 36), v10, v5);
  sub_24CBF0C80((uint64_t)v29, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24CBF1A38((uint64_t)v29);
}

uint64_t sub_24CBF0994@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AttributionItem.init(from:)(a1, a2);
}

uint64_t sub_24CBF09AC(void *a1)
{
  return AttributionItem.encode(to:)(a1);
}

uint64_t static AttributionItem.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24CC24310();
  }
}

uint64_t AttributionItem.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24CC23F40();
  return swift_bridgeObjectRelease();
}

uint64_t AttributionItem.hashValue.getter()
{
  return sub_24CC24350();
}

uint64_t sub_24CBF0AB0()
{
  return sub_24CC24350();
}

uint64_t AttributionGroup.displayLabel.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t AttributionGroup.displayLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*AttributionGroup.displayLabel.modify())()
{
  return nullsub_1;
}

uint64_t AttributionGroup.attributions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AttributionGroup.attributions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*AttributionGroup.attributions.modify())()
{
  return nullsub_1;
}

void __swiftcall AttributionGroup.init(name:displayLabel:attributions:)(DeviceExpertIntents::AttributionGroup *__return_ptr retstr, Swift::String name, Swift::String_optional displayLabel, Swift::OpaquePointer attributions)
{
  object = name._object;
  uint64_t countAndFlagsBits = name._countAndFlagsBits;
  if (!displayLabel.value._object)
  {
    swift_bridgeObjectRetain();
    displayLabel.value._uint64_t countAndFlagsBits = countAndFlagsBits;
    displayLabel.value._object = object;
  }
  retstr->name._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->name._object = object;
  retstr->displayLabel = displayLabel.value;
  retstr->attributions = attributions;
}

uint64_t type metadata accessor for AttributionItem()
{
  uint64_t result = qword_269818EE8;
  if (!qword_269818EE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CBF0C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AttributionGroup.id.getter()
{
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_24CBF0D10(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4C79616C70736964 && a2 == 0xEC0000006C656261;
    if (v6 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7475626972747461 && a2 == 0xEC000000736E6F69)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_24CC24310();
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

uint64_t sub_24CBF0E60(char a1)
{
  return *(void *)&aName_2[8 * a1];
}

uint64_t sub_24CBF0E80()
{
  return sub_24CBF0E60(*v0);
}

uint64_t sub_24CBF0E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBF0D10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBF0EB0(uint64_t a1)
{
  unint64_t v2 = sub_24CBF2070();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBF0EEC(uint64_t a1)
{
  unint64_t v2 = sub_24CBF2070();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AttributionGroup.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818EC0);
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF2070();
  sub_24CC24370();
  sub_24CC242C0();
  if (!v8)
  {
    sub_24CC242C0();
    OUTLINED_FUNCTION_14_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B60);
    sub_24CBF20BC(&qword_269818C70, &qword_269818C78);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t AttributionGroup.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818ED0);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF2070();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_24CC24250();
  uint64_t v8 = v7;
  uint64_t v16 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24CC24250();
  uint64_t v11 = v10;
  uint64_t v15 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B60);
  OUTLINED_FUNCTION_14_1();
  sub_24CBF20BC(&qword_269818C60, &qword_269818C68);
  swift_bridgeObjectRetain();
  sub_24CC24270();
  uint64_t v12 = OUTLINED_FUNCTION_4_2();
  v13(v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a2 = v16;
  a2[1] = v8;
  a2[2] = v15;
  a2[3] = v11;
  a2[4] = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CBF1398@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AttributionGroup.init(from:)(a1, a2);
}

uint64_t sub_24CBF13B0(void *a1)
{
  return AttributionGroup.encode(to:)(a1);
}

uint64_t sub_24CBF13C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttributionGroup.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static AttributionGroup.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_24CC24310() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24CBF1464(v3, v4);
}

uint64_t sub_24CBF1464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionItem() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v17 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v13 = *(void *)(v8 + 72);
    do
    {
      sub_24CBF0C80(a1 + v12, (uint64_t)v10);
      sub_24CBF0C80(a2 + v12, (uint64_t)v7);
      if (*v10 == *v7 && v10[1] == v7[1])
      {
        sub_24CBF1A38((uint64_t)v7);
        sub_24CBF1A38((uint64_t)v10);
      }
      else
      {
        char v15 = sub_24CC24310();
        sub_24CBF1A38((uint64_t)v7);
        sub_24CBF1A38((uint64_t)v10);
        if ((v15 & 1) == 0) {
          return 0;
        }
      }
      v12 += v13;
      --v11;
    }
    while (v11);
  }
  return 1;
}

uint64_t AttributionGroup.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24CC23F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v0 = OUTLINED_FUNCTION_6_0();
  sub_24CBF21B4(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t AttributionGroup.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24CC24330();
  swift_bridgeObjectRetain();
  sub_24CC23F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24CBF21B4((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_24CC24350();
}

uint64_t sub_24CBF16D8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24CC24330();
  swift_bridgeObjectRetain();
  sub_24CC23F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24CBF21B4((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_24CC24350();
}

uint64_t sub_24CBF175C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_1();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_10_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10)
  {
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E70);
  uint64_t v11 = *(void *)(type metadata accessor for AttributionItem() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (void *)swift_allocObject();
  size_t v15 = _swift_stdlib_malloc_size(v14);
  if (!v12 || (v15 - v13 == 0x8000000000000000 ? (BOOL v16 = v12 == -1) : (BOOL v16 = 0), v16))
  {
LABEL_23:
    OUTLINED_FUNCTION_16_1();
    uint64_t result = sub_24CC241C0();
    __break(1u);
    return result;
  }
  v14[2] = v9;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_18:
  uint64_t v17 = *(void *)(type metadata accessor for AttributionItem() - 8);
  if (a1)
  {
    unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    sub_24CC1FBD0(a4 + v18, v9, (unint64_t)v14 + v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = OUTLINED_FUNCTION_13_0();
    sub_24CBF1B6C(v19, v20, v21, v22);
  }
  return (uint64_t)v14;
}

void sub_24CBF1958(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_1();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_10_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F38);
    uint64_t v11 = swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_24CC1FBE8((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = OUTLINED_FUNCTION_13_0();
    sub_24CBF1CCC(v13, v14, v15, v16);
  }
}

uint64_t sub_24CBF1A38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24CBF1A94(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_12_1();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_10_1();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F30);
    uint64_t v11 = swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size((const void *)v11);
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_24CC1FC4C((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = OUTLINED_FUNCTION_13_0();
    sub_24CBF1DCC(v13, v14, v15, v16);
  }
}

uint64_t sub_24CBF1B6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for AttributionItem() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_24CC241F0();
  __break(1u);
  return result;
}

uint64_t sub_24CBF1CCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_24CC241F0();
  __break(1u);
  return result;
}

uint64_t sub_24CBF1DCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_24CC241F0();
  __break(1u);
  return result;
}

void sub_24CBF1EC4(uint64_t a1)
{
}

uint64_t sub_24CBF1ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CBF1F3C()
{
  unint64_t result = qword_269818E80;
  if (!qword_269818E80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269818E80);
  }
  return result;
}

uint64_t sub_24CBF1F7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CBF1FDC()
{
  unint64_t result = qword_269818E90;
  if (!qword_269818E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818E90);
  }
  return result;
}

uint64_t sub_24CBF2028(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818E78);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CBF2070()
{
  unint64_t result = qword_269818EC8;
  if (!qword_269818EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818EC8);
  }
  return result;
}

uint64_t sub_24CBF20BC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B60);
    sub_24CBF22F4(a2, (void (*)(uint64_t))type metadata accessor for AttributionItem);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_24CBF2150(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t sub_24CBF21B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AttributionItem();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t result = sub_24CC24340();
  if (v7)
  {
    uint64_t v9 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v10 = *(void *)(v4 + 72);
    do
    {
      sub_24CBF0C80(v9, (uint64_t)v6);
      sub_24CC23F40();
      uint64_t result = sub_24CBF1A38((uint64_t)v6);
      v9 += v10;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_24CBF22AC()
{
  return sub_24CBF22F4(&qword_269818ED8, (void (*)(uint64_t))type metadata accessor for AttributionItem);
}

uint64_t sub_24CBF22F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CBF233C()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_24CBF234C()
{
  unint64_t result = qword_269818EE0;
  if (!qword_269818EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818EE0);
  }
  return result;
}

uint64_t sub_24CBF2398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttributionItem.appPunchOut.getter();
  *a1 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributionItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    uint64_t v11 = *(int *)(a3 + 32);
    uint64_t v20 = (char *)a2 + v11;
    unint64_t v21 = (char *)a1 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v12 = sub_24CC238E0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v21, v20, v12);
    uint64_t v14 = *(int *)(a3 + 36);
    unint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v4;
}

uint64_t destroy for AttributionItem(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_24CC238E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *initializeWithCopy for AttributionItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v18 = (char *)a2 + v10;
  uint64_t v19 = (char *)a1 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v11 = sub_24CC238E0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v19, v18, v11);
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = (char *)a1 + v13;
  unint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

void *assignWithCopy for AttributionItem(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC238E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for AttributionItem(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24CC238E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

void *assignWithTake for AttributionItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24CC238E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBF2AA0);
}

uint64_t sub_24CBF2AA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_24CC238E0();
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 32);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
      uint64_t v11 = *(int *)(a3 + 36);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AttributionItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBF2B64);
}

uint64_t sub_24CBF2B64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_24CC238E0();
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 32);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818E78);
      uint64_t v11 = *(int *)(a4 + 36);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_24CBF2C10()
{
  sub_24CC238E0();
  if (v0 <= 0x3F)
  {
    sub_24CBF2CE8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24CBF2CE8()
{
  if (!qword_269818EF8)
  {
    sub_24CBF1F3C();
    unint64_t v0 = sub_24CC23870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269818EF8);
    }
  }
}

uint64_t destroy for AttributionGroup()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AttributionGroup(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AttributionGroup(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AttributionGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionGroup(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for AttributionGroup(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionGroup()
{
  return &type metadata for AttributionGroup;
}

unsigned char *storeEnumTagSinglePayload for AttributionGroup.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBF3020);
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

ValueMetadata *type metadata accessor for AttributionGroup.CodingKeys()
{
  return &type metadata for AttributionGroup.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AttributionItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBF3124);
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

ValueMetadata *type metadata accessor for AttributionItem.CodingKeys()
{
  return &type metadata for AttributionItem.CodingKeys;
}

unint64_t sub_24CBF3160()
{
  unint64_t result = qword_269818F00;
  if (!qword_269818F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F00);
  }
  return result;
}

unint64_t sub_24CBF31B0()
{
  unint64_t result = qword_269818F08;
  if (!qword_269818F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F08);
  }
  return result;
}

unint64_t sub_24CBF3200()
{
  unint64_t result = qword_269818F10;
  if (!qword_269818F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F10);
  }
  return result;
}

unint64_t sub_24CBF3250()
{
  unint64_t result = qword_269818F18;
  if (!qword_269818F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F18);
  }
  return result;
}

unint64_t sub_24CBF32A0()
{
  unint64_t result = qword_269818F20;
  if (!qword_269818F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F20);
  }
  return result;
}

unint64_t sub_24CBF32F0()
{
  unint64_t result = qword_269818F28;
  if (!qword_269818F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F28);
  }
  return result;
}

uint64_t sub_24CBF333C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return sub_24CC24250();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_24CC242C0();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return 0;
}

void OUTLINED_FUNCTION_14_1()
{
  *(unsigned char *)(v0 - 67) = 2;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return type metadata accessor for AttributionItem();
}

uint64_t sub_24CBF34A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F58);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_24CC23C50();
  v4[8] = v5;
  OUTLINED_FUNCTION_1_0(v5);
  v4[9] = v6;
  v4[10] = swift_task_alloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_24CBF3570()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  swift_bridgeObjectRetain();
  sub_24CC23C40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CBF368C;
  return sub_24CBFCB58();
}

uint64_t sub_24CBF368C(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[12] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[7];
  if (!v1) {
    v4[13] = a1;
  }
  sub_24CBF4044(v5);
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24CBF37D0()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = sub_24CC23CA0();
  uint64_t v6 = v5;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v7(v4, v6);
}

uint64_t sub_24CBF388C()
{
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[12];
  uint64_t v3 = sub_24CC23DA0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2698195F0);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_24CC23D80();
  os_log_type_t v7 = sub_24CC24080();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[12];
  if (v8)
  {
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_2_5();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v9;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_1_8(v13);
    *uint64_t v11 = v1;

    _os_log_impl(&dword_24CBD5000, v6, v7, "Error getting attributionGroupAsLabels : %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = OUTLINED_FUNCTION_5_3();
  return v15(v14);
}

uint64_t sub_24CBF3A78(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_24CC23C50();
  v2[5] = v3;
  OUTLINED_FUNCTION_1_0(v3);
  v2[6] = v4;
  v2[7] = swift_task_alloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24CBF3B10()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v4 = v0[6];
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_24CC211A4();
    uint64_t v3 = v11;
    uint64_t v5 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_24CC23C40();
      unint64_t v6 = *(void *)(v11 + 16);
      if (v6 >= *(void *)(v11 + 24) >> 1) {
        sub_24CC211A4();
      }
      uint64_t v7 = v0[7];
      uint64_t v8 = v0[5];
      *(void *)(v11 + 16) = v6 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v11+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v6, v7, v8);
      v5 += 16;
      --v2;
    }
    while (v2);
  }
  v0[8] = v3;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[9] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24CBF3CA4;
  return sub_24CBFD050(v3);
}

uint64_t sub_24CBF3CA4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1) {
    *(void *)(v4 + 88) = a1;
  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24CBF3DEC()
{
  uint64_t v1 = sub_24CC23CA0();
  uint64_t v3 = v2;
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v1, v3);
}

uint64_t sub_24CBF3E74()
{
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 80);
  uint64_t v3 = sub_24CC23DA0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2698195F0);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_24CC23D80();
  os_log_type_t v7 = sub_24CC24080();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 80);
  if (v8)
  {
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_2_5();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v9;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_1_8(v13);
    *uint64_t v11 = v1;

    _os_log_impl(&dword_24CBD5000, v6, v7, "Error calling attributionListAsLabels: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v14 = OUTLINED_FUNCTION_5_3();
  return v15(v14);
}

uint64_t sub_24CBF4044(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_24CC240C0();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return 0;
}

uint64_t sub_24CBF4100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F60);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_0_4();
  uint64_t v45 = v6;
  uint64_t v7 = sub_24CC231C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_4();
  uint64_t v43 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F68);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F70);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v36 = (uint64_t)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v35 = (uint64_t)v34 - v16;
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v44 = v7;
  uint64_t v41 = v17;
  uint64_t v42 = v8 + 16;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v17)(a2, v2, v7);
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19)
  {
    uint64_t v39 = v13;
    id v40 = v12;
    uint64_t v38 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    v34[1] = a1;
    uint64_t v20 = (uint64_t *)(a1 + 64);
    uint64_t v37 = a2;
    do
    {
      uint64_t v21 = *(v20 - 3);
      uint64_t v47 = *(v20 - 4);
      uint64_t v23 = *(v20 - 2);
      uint64_t v22 = *(v20 - 1);
      uint64_t v24 = *v20;
      uint64_t v25 = v43;
      uint64_t v26 = v44;
      v41(v43, a2, v44);
      uint64_t v46 = v23;
      uint64_t v50 = v23;
      uint64_t v51 = v22;
      uint64_t v27 = sub_24CC23400();
      uint64_t v28 = v45;
      __swift_storeEnumTagSinglePayload(v45, 1, 1, v27);
      sub_24CBF4564();
      sub_24CBE58E0();
      uint64_t v48 = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v29 = (uint64_t)v40;
      sub_24CC23310();
      sub_24CBF475C(v28, &qword_269818F60);
      swift_bridgeObjectRelease();
      (*v38)(v25, v26);
      if (__swift_getEnumTagSinglePayload(v29, 1, v39) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24CBF475C(v29, &qword_269818F68);
        a2 = v37;
      }
      else
      {
        uint64_t v30 = v35;
        sub_24CBF45B4(v29, v35);
        uint64_t v31 = v36;
        sub_24CBF461C(v30, v36);
        uint64_t KeyPath = swift_getKeyPath();
        v34[-2] = MEMORY[0x270FA5388](KeyPath);
        swift_getKeyPath();
        uint64_t v50 = v47;
        uint64_t v51 = v48;
        uint64_t v52 = v46;
        uint64_t v53 = v22;
        uint64_t v54 = v24;
        sub_24CBF46BC();
        a2 = v37;
        long long v33 = (void (*)(char *, void))sub_24CC231E0();
        sub_24CBF4710();
        sub_24CC23240();
        v33(v49, 0);
        sub_24CBF475C(v31, &qword_269818F70);
        sub_24CBF475C(v30, &qword_269818F70);
      }
      v20 += 5;
      --v19;
    }
    while (v19);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24CBF4564()
{
  unint64_t result = qword_269818F78;
  if (!qword_269818F78)
  {
    sub_24CC231C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F78);
  }
  return result;
}

uint64_t sub_24CBF45B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBF461C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBF4688()
{
  return 8;
}

uint64_t sub_24CBF4694()
{
  return swift_release();
}

uint64_t sub_24CBF469C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24CBF46B0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_24CBF46BC()
{
  unint64_t result = qword_269818F80;
  if (!qword_269818F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818F70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F80);
  }
  return result;
}

unint64_t sub_24CBF4710()
{
  unint64_t result = qword_269818F88;
  if (!qword_269818F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818F88);
  }
  return result;
}

uint64_t sub_24CBF475C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AttributionModel.init(label:)()
{
  sub_24CC231C0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x270FA5388](v3);
  sub_24CC231B0();
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_4_3();
  v4();
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  sub_24CBF6308(&qword_269818F90);
  sub_24CC23270();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_5_4();
  v5();
  OUTLINED_FUNCTION_4_3();
  v4();
  OUTLINED_FUNCTION_4_3();
  v4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  sub_24CC23260();
  OUTLINED_FUNCTION_5_4();
  v5();
  OUTLINED_FUNCTION_5_4();
  return ((uint64_t (*)(void))v5)();
}

uint64_t sub_24CBF4958()
{
  return sub_24CC23E90() & 1;
}

uint64_t sub_24CBF49B4()
{
  return sub_24CC23E70();
}

void sub_24CBF49FC()
{
}

void sub_24CBF4A30()
{
}

uint64_t sub_24CBF4A48@<X0>(uint64_t *a1@<X8>)
{
  AttributeScopes.deviceExpert.getter();
  uint64_t result = type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  *a1 = result;
  return result;
}

uint64_t AttributionModel.label.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  return sub_24CC23250();
}

uint64_t sub_24CBF4ABC(uint64_t a1)
{
  uint64_t v2 = sub_24CC231C0();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return AttributionModel.label.setter((uint64_t)v4);
}

uint64_t AttributionModel.label.setter(uint64_t a1)
{
  uint64_t v3 = sub_24CC231C0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v10((char *)&v13 - v8, a1, v3);
  v10(v1, (uint64_t)v9, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  sub_24CC23260();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v9, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1, v3);
}

void (*AttributionModel.label.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_24CC231C0();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  v3[5] = malloc(v6);
  v3[6] = malloc(v6);
  v3[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  sub_24CC23250();
  return sub_24CBF4D88;
}

void sub_24CBF4D88(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 8);
  size_t v6 = *(void (**)(void *, void *, uint64_t))(*(void *)(*(void *)a1 + 16) + 16);
  v6(v3, *(void **)(*(void *)a1 + 48), v5);
  v6(v4, v3, v5);
  uint64_t v7 = (void *)v2[6];
  uint64_t v8 = (void *)v2[4];
  uint64_t v13 = (void *)v2[5];
  uint64_t v10 = v2[2];
  uint64_t v9 = (void *)v2[3];
  if (a2)
  {
    v6((void *)v2[3], v8, v2[1]);
    sub_24CC23260();
    uint64_t v11 = *(void (**)(void))(v10 + 8);
    OUTLINED_FUNCTION_3_3();
    v11();
  }
  else
  {
    sub_24CC23260();
    uint64_t v11 = *(void (**)(void))(v10 + 8);
  }
  OUTLINED_FUNCTION_3_3();
  v11();
  OUTLINED_FUNCTION_3_3();
  v11();
  free(v7);
  free(v13);
  free(v8);
  free(v9);
  free(v2);
}

uint64_t AttributionModel.attributionGroups.getter()
{
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FA0);
  MEMORY[0x270FA5388](v54);
  OUTLINED_FUNCTION_1_1();
  uint64_t v56 = (uint64_t *)(v1 - v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (void *)((char *)v52 - v4);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FA8);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_0_4();
  v52[0] = v7;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FB0);
  OUTLINED_FUNCTION_0();
  v52[3] = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_4();
  uint64_t v57 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FB8);
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_1();
  uint64_t v16 = v14 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v52 - v18;
  uint64_t v55 = sub_24CC23180();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = sub_24CC231C0();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_7_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  sub_24CC23250();
  sub_24CC231A0();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v0, v26);
  uint64_t v30 = v54;
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_24CBF4710();
  sub_24CC23190();
  uint64_t v31 = v52[0];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v25, v55);
  uint64_t v32 = *(void (**)(uint64_t, char *, uint64_t))(v53 + 16);
  v52[1] = v19;
  v32(v16, v19, v11);
  sub_24CBF5D98(&qword_269818FC0, &qword_269818FB8);
  v52[2] = v11;
  sub_24CC23F70();
  uint64_t v55 = sub_24CBF5D98(&qword_269818FC8, &qword_269818FB0);
  sub_24CC240B0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v31, 1, v30);
  uint64_t v34 = MEMORY[0x263F8EE78];
  while (EnumTagSinglePayload != 1)
  {
    uint64_t v35 = v31;
    sub_24CBF53EC(v31, (uint64_t)v5);
    uint64_t v36 = *(int *)(v30 + 48);
    uint64_t v37 = v56;
    uint64_t v38 = (uint64_t)v56 + v36;
    uint64_t v39 = *v5;
    uint64_t v40 = v5[1];
    uint64_t v41 = v5[2];
    uint64_t v42 = v5[3];
    uint64_t v43 = v5[4];
    *uint64_t v56 = *v5;
    v37[1] = v40;
    v37[2] = v41;
    v37[3] = v42;
    v37[4] = v43;
    sub_24CBF461C((uint64_t)v5 + v36, (uint64_t)v37 + v36);
    sub_24CBF5454(v39, v40);
    sub_24CBF54A4(v38, &qword_269818F70);
    sub_24CBF54A4((uint64_t)v5, &qword_269818FA0);
    if (v40)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CBF1958(0, *(void *)(v34 + 16) + 1, 1, v34);
        uint64_t v34 = v47;
      }
      unint64_t v45 = *(void *)(v34 + 16);
      unint64_t v44 = *(void *)(v34 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_24CBF1958(v44 > 1, v45 + 1, 1, v34);
        uint64_t v34 = v48;
      }
      *(void *)(v34 + 16) = v45 + 1;
      uint64_t v46 = (void *)(v34 + 40 * v45);
      v46[4] = v39;
      v46[5] = v40;
      v46[6] = v41;
      v46[7] = v42;
      v46[8] = v43;
      uint64_t v30 = v54;
    }
    uint64_t v31 = v35;
    sub_24CC240B0();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v35, 1, v30);
  }
  OUTLINED_FUNCTION_3_2();
  v49();
  OUTLINED_FUNCTION_3_2();
  v50();
  return v34;
}

void sub_24CBF53A0()
{
}

uint64_t sub_24CBF53B8()
{
  return 8;
}

uint64_t sub_24CBF53C4()
{
  return swift_release();
}

uint64_t sub_24CBF53CC(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24CBF53E0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24CBF53EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBF5454(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CBF54A4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_2();
  v3();
  return a1;
}

uint64_t AttributionModel.attributionItems.getter()
{
  uint64_t v0 = AttributionModel.attributionGroups.getter();
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = v0 + 64;
    uint64_t v3 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v4 = *(void *)v2;
      uint64_t v5 = *(void *)(*(void *)v2 + 16);
      uint64_t v6 = *(void *)(v3 + 16);
      uint64_t v7 = v6 + v5;
      if (__OFADD__(v6, v5)) {
        break;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v7 > *(void *)(v3 + 24) >> 1)
      {
        if (v6 <= v7) {
          uint64_t v9 = v6 + v5;
        }
        else {
          uint64_t v9 = v6;
        }
        uint64_t v3 = sub_24CBF175C(isUniquelyReferenced_nonNull_native, v9, 1, v3);
      }
      if (*(void *)(v4 + 16))
      {
        uint64_t v10 = *(void *)(v3 + 16);
        uint64_t v11 = (*(void *)(v3 + 24) >> 1) - v10;
        uint64_t v12 = *(void *)(type metadata accessor for AttributionItem() - 8);
        uint64_t v13 = *(void *)(v12 + 72);
        if (v11 < v5) {
          goto LABEL_27;
        }
        unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
        unint64_t v15 = v3 + v14 + v13 * v10;
        unint64_t v16 = v4 + v14;
        uint64_t v17 = v13 * v5;
        unint64_t v18 = v15 + v17;
        unint64_t v19 = v16 + v17;
        if (v16 < v18 && v15 < v19) {
          goto LABEL_29;
        }
        swift_arrayInitWithCopy();
        if (v5)
        {
          uint64_t v21 = *(void *)(v3 + 16);
          BOOL v22 = __OFADD__(v21, v5);
          uint64_t v23 = v21 + v5;
          if (v22) {
            goto LABEL_28;
          }
          *(void *)(v3 + 16) = v23;
        }
      }
      else if (v5)
      {
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
      v2 += 40;
      if (!--v1) {
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    uint64_t result = sub_24CC241F0();
    __break(1u);
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
LABEL_24:
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

uint64_t sub_24CBF56E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024CC287A0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24CC24310();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_24CBF5768()
{
  return 0xD000000000000011;
}

uint64_t sub_24CBF5788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBF56E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CBF57B4(uint64_t a1)
{
  unint64_t v2 = sub_24CBF5CA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBF57F0(uint64_t a1)
{
  unint64_t v2 = sub_24CBF5CA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AttributionModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818FD0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF5CA8();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  sub_24CBF5D98(&qword_269818FE0, &qword_269818F98);
  sub_24CC242E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t AttributionModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_4();
  uint64_t v29 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818FE8);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v7;
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = sub_24CC231C0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_1();
  uint64_t v14 = v12 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v25 - v16;
  uint64_t v18 = type metadata accessor for AttributionModel();
  MEMORY[0x270FA5388](v18 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v21 = v20 - v19;
  sub_24CC231B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v14, v17, v8);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  sub_24CBF6308(&qword_269818F90);
  sub_24CC23270();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF5CA8();
  uint64_t v22 = v31;
  sub_24CC24360();
  if (!v22)
  {
    sub_24CBF5D98(&qword_269818FF0, &qword_269818F98);
    sub_24CC24270();
    OUTLINED_FUNCTION_3_2();
    v23();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 40))(v21, v29, v30);
    sub_24CBF5DDC(v21, v26);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24CBF5D3C(v21);
}

uint64_t sub_24CBF5C78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AttributionModel.init(from:)(a1, a2);
}

uint64_t sub_24CBF5C90(void *a1)
{
  return AttributionModel.encode(to:)(a1);
}

unint64_t sub_24CBF5CA8()
{
  unint64_t result = qword_269818FD8;
  if (!qword_269818FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269818FD8);
  }
  return result;
}

uint64_t type metadata accessor for AttributionModel()
{
  uint64_t result = qword_269818FF8;
  if (!qword_269818FF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CBF5D3C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributionModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBF5D98(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CBF5DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributionModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBF5E40()
{
  return AttributionModel.label.getter();
}

uint64_t initializeBufferWithCopyOfBuffer for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for AttributionModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBF60F4);
}

uint64_t sub_24CBF60F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributionModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBF6154);
}

uint64_t sub_24CBF6154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818F98);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_24CBF61A4()
{
  sub_24CBF6230();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CBF6230()
{
  if (!qword_269819008)
  {
    sub_24CC231C0();
    type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
    sub_24CBF6308(&qword_269819010);
    sub_24CBF6308(&qword_269819018);
    unint64_t v0 = sub_24CC23280();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269819008);
    }
  }
}

uint64_t sub_24CBF6308(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AttributionModel.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CBF63E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionModel.CodingKeys()
{
  return &type metadata for AttributionModel.CodingKeys;
}

unint64_t sub_24CBF6424()
{
  unint64_t result = qword_269819020;
  if (!qword_269819020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819020);
  }
  return result;
}

unint64_t sub_24CBF6474()
{
  unint64_t result = qword_269819028;
  if (!qword_269819028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819028);
  }
  return result;
}

unint64_t sub_24CBF64C4()
{
  unint64_t result = qword_269819030;
  if (!qword_269819030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819030);
  }
  return result;
}

uint64_t sub_24CBF6574()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_26981FFA8 = result;
  return result;
}

uint64_t static DeviceExpertPreferences.shouldShowFeedback.getter()
{
  if (qword_269818A98 != -1) {
    swift_once();
  }
  if (byte_26981FFA8 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v1 = (void *)sub_24CC23EC0();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_24CC240F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_24CBF66E0((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (OUTLINED_FUNCTION_0_5()) {
      return v4;
    }
  }
  else
  {
    sub_24CBE5CA0((uint64_t)v6);
  }
  return 1;
}

uint64_t sub_24CBF66E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static DeviceExpertPreferences.shouldSendAnalytics.getter()
{
  if (qword_269818A98 != -1) {
    swift_once();
  }
  if (byte_26981FFA8 == 1)
  {
    id v0 = objc_msgSend(self, sel_standardUserDefaults);
    uint64_t v1 = (void *)sub_24CC23EC0();
    id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

    if (v2)
    {
      sub_24CC240F0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v5, 0, sizeof(v5));
    }
    sub_24CBF66E0((uint64_t)v5, (uint64_t)v6);
    if (v7)
    {
      if (OUTLINED_FUNCTION_0_5()) {
        return v4;
      }
    }
    else
    {
      sub_24CBE5CA0((uint64_t)v6);
    }
  }
  return 1;
}

ValueMetadata *type metadata accessor for DeviceExpertPreferences()
{
  return &type metadata for DeviceExpertPreferences;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_dynamicCast();
}

uint64_t TipKitEventSender.donateUserPerformedAction(for:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819040);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CC24060();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_24CBF7120((uint64_t)v2);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    sub_24CC24050();
    (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
    if (*(void *)(v4 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v5 = sub_24CC24040();
      uint64_t v6 = v7;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &unk_269819050;
  *(void *)(v8 + 24) = v4;
  if (v6 | v5)
  {
    v10[0] = 0;
    v10[1] = 0;
    v10[2] = v5;
    v10[3] = v6;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CBF6AA8()
{
  uint64_t v1 = sub_24CC23C20();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CBF6B64, 0, 0);
}

uint64_t sub_24CBF6B64()
{
  OUTLINED_FUNCTION_16();
  sub_24CC23C30();
  sub_24CC23C10();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CBF6C48;
  uint64_t v2 = *(void *)(v0 + 40);
  return MEMORY[0x270F7E8E8](0xD000000000000017, 0x800000024CC28830, 0xD000000000000015, 0x800000024CC28850, v2);
}

uint64_t sub_24CBF6C48()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4[5];
  uint64_t v6 = v4[4];
  uint64_t v7 = v4[3];
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v9 = v8;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CBF6DC0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_52();
    return v10();
  }
}

uint64_t sub_24CBF6DC0()
{
  uint64_t v11 = v0;
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CC23DA0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2698195F0);
  uint64_t v2 = sub_24CC23D80();
  os_log_type_t v3 = sub_24CC24080();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void **)(v0 + 56);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    *(void *)(v0 + 16) = sub_24CC12DF0(0xD000000000000017, 0x800000024CC28830, &v10);
    sub_24CC240C0();
    _os_log_impl(&dword_24CBD5000, v2, v3, "Failed to invalidate tip with identifier: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25330D070](v7, -1, -1);
    MEMORY[0x25330D070](v6, -1, -1);
  }

  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v8();
}

uint64_t sub_24CBF6F88()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CBF6FC0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CBF7060;
  OUTLINED_FUNCTION_3_4();
  return sub_24CBF6AA8();
}

uint64_t sub_24CBF7060()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v3();
}

uint64_t sub_24CBF7120(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CBF7180()
{
  return TipKitEventSender.donateUserPerformedAction(for:)();
}

uint64_t static DeviceExpertTip.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceExpertTip.hash(into:)()
{
  return sub_24CC24340();
}

uint64_t DeviceExpertTip.hashValue.getter()
{
  return sub_24CC24350();
}

uint64_t sub_24CBF720C()
{
  return DeviceExpertTip.hashValue.getter();
}

uint64_t sub_24CBF7224()
{
  return DeviceExpertTip.hash(into:)();
}

uint64_t sub_24CBF723C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  BOOL v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *BOOL v4 = v2;
  v4[1] = sub_24CBF7318;
  return v6(a1);
}

uint64_t sub_24CBF7318()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v3();
}

uint64_t sub_24CBF73DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CBF7414()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CBF7060;
  uint64_t v2 = OUTLINED_FUNCTION_3_4();
  return v3(v2);
}

unint64_t sub_24CBF74C4()
{
  unint64_t result = qword_269819068;
  if (!qword_269819068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819068);
  }
  return result;
}

uint64_t dispatch thunk of TipKitEventSending.donateUserPerformedAction(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for TipKitEventSender()
{
  return &type metadata for TipKitEventSender;
}

unsigned char *storeEnumTagSinglePayload for DeviceExpertTip(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CBF75D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertTip()
{
  return &type metadata for DeviceExpertTip;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0;
}

uint64_t Action.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CBF7C78(MEMORY[0x263F5CAE8], a1);
}

uint64_t Action.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CBF791C(a1, MEMORY[0x263F5CAE8], a2);
}

uint64_t Action.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819070);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v17 - v6;
  sub_24CC236C0();
  uint64_t v8 = sub_24CC23680();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) != 1)
  {
    sub_24CBF7884((uint64_t)v7, (uint64_t)v5);
    uint64_t v9 = *(void *)(v8 - 8);
    int v10 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v5, v8);
    if (v10 == *MEMORY[0x263F5CAD0])
    {
      uint64_t v11 = OUTLINED_FUNCTION_5_5();
      v12(v11);
      uint64_t v13 = sub_24CC237A0();
LABEL_6:
      (*(void (**)(uint64_t, char *))(*(void *)(v13 - 8) + 32))(a1, v5);
      type metadata accessor for Action.Value(0);
      swift_storeEnumTagMultiPayload();
      return sub_24CBF79A4((uint64_t)v7);
    }
    if (v10 == *MEMORY[0x263F5CAD8])
    {
      uint64_t v14 = OUTLINED_FUNCTION_5_5();
      v15(v14);
      uint64_t v13 = sub_24CC234F0();
      goto LABEL_6;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  uint64_t result = sub_24CC241D0();
  __break(1u);
  return result;
}

uint64_t sub_24CBF7884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Action.URLConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CBF791C(a1, MEMORY[0x263F5CB08], a2);
}

uint64_t Action.AppIntentConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CBF791C(a1, MEMORY[0x263F5CA88], a2);
}

uint64_t sub_24CBF791C@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  a2(0);
  OUTLINED_FUNCTION_32();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  return v7(a3, a1, v5);
}

uint64_t type metadata accessor for Action.Value(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_2698190B0);
}

uint64_t sub_24CBF79A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819070);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Action.hash(into:)()
{
  sub_24CC236D0();
  sub_24CBF7D34(&qword_269819078, MEMORY[0x263F5CAE8]);
  return sub_24CC23E60();
}

uint64_t Action.hashValue.getter()
{
  return sub_24CC24350();
}

void sub_24CBF7B24()
{
}

void sub_24CBF7B3C()
{
}

uint64_t sub_24CBF7B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Action.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CBF7B84()
{
  return sub_24CC24350();
}

uint64_t Action.URLConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CBF7C78(MEMORY[0x263F5CB08], a1);
}

void sub_24CBF7C30()
{
}

void sub_24CBF7C48()
{
}

uint64_t Action.AppIntentConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CBF7C78(MEMORY[0x263F5CA88], a1);
}

uint64_t sub_24CBF7C78@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  a1(0);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a2, v2, v4);
}

uint64_t sub_24CBF7CEC()
{
  return sub_24CBF7D34(&qword_269819080, MEMORY[0x263F5CAE8]);
}

uint64_t sub_24CBF7D34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CBF7D7C()
{
  return sub_24CBF7D34(&qword_269819088, (void (*)(uint64_t))type metadata accessor for Action);
}

uint64_t type metadata accessor for Action(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_2698190A0);
}

uint64_t sub_24CBF7DE4()
{
  return sub_24CBF7D34(&qword_269819090, MEMORY[0x263F5CB08]);
}

uint64_t sub_24CBF7E2C()
{
  return sub_24CBF7D34(&qword_269819098, MEMORY[0x263F5CA88]);
}

void sub_24CBF7E7C()
{
}

void sub_24CBF7E94()
{
}

uint64_t initializeBufferWithCopyOfBuffer for Action()
{
  return sub_24CBF873C();
}

uint64_t destroy for Action(uint64_t a1, uint64_t a2)
{
  return sub_24CBF87B0(a1, a2, MEMORY[0x263F5CAE8]);
}

uint64_t initializeWithCopy for Action()
{
  return sub_24CBF8828();
}

uint64_t assignWithCopy for Action()
{
  return sub_24CBF888C();
}

uint64_t initializeWithTake for Action()
{
  return sub_24CBF88F0();
}

uint64_t assignWithTake for Action()
{
  return sub_24CBF8954();
}

uint64_t getEnumTagSinglePayload for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBF7F50);
}

uint64_t sub_24CBF7F50()
{
  sub_24CC236D0();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBF7FA4);
}

uint64_t sub_24CBF7FA4()
{
  sub_24CC236D0();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_24CBF7FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CBF8A80(a1, a2, a3, MEMORY[0x263F5CAE8]);
}

uint64_t *initializeBufferWithCopyOfBuffer for Action.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = sub_24CC234F0();
    }
    else {
      uint64_t v6 = sub_24CC237A0();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Action.Value(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_24CC234F0();
  }
  else {
    uint64_t v2 = sub_24CC237A0();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for Action.Value(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_24CC234F0();
  }
  else {
    uint64_t v4 = sub_24CC237A0();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for Action.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CBF8310(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_24CC234F0();
    }
    else {
      uint64_t v4 = sub_24CC237A0();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CBF8310(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Action.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for Action.Value(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_24CC234F0();
  }
  else {
    uint64_t v4 = sub_24CC237A0();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for Action.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CBF8310(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_24CC234F0();
    }
    else {
      uint64_t v4 = sub_24CC237A0();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CBF84E0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24CBF84F0()
{
  uint64_t result = sub_24CC237A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CC234F0();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Action.URLConfiguration()
{
  return sub_24CBF873C();
}

uint64_t destroy for Action.URLConfiguration(uint64_t a1, uint64_t a2)
{
  return sub_24CBF87B0(a1, a2, MEMORY[0x263F5CB08]);
}

uint64_t initializeWithCopy for Action.URLConfiguration()
{
  return sub_24CBF8828();
}

uint64_t assignWithCopy for Action.URLConfiguration()
{
  return sub_24CBF888C();
}

uint64_t initializeWithTake for Action.URLConfiguration()
{
  return sub_24CBF88F0();
}

uint64_t assignWithTake for Action.URLConfiguration()
{
  return sub_24CBF8954();
}

uint64_t getEnumTagSinglePayload for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBF8658);
}

uint64_t sub_24CBF8658()
{
  sub_24CC237A0();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBF86AC);
}

uint64_t sub_24CBF86AC()
{
  sub_24CC237A0();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Action.URLConfiguration(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_2698190C0);
}

uint64_t sub_24CBF870C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CBF8A80(a1, a2, a3, MEMORY[0x263F5CB08]);
}

uint64_t initializeBufferWithCopyOfBuffer for Action.AppIntentConfiguration()
{
  return sub_24CBF873C();
}

uint64_t sub_24CBF873C()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_9();
  v3(v2);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = *v5;
  return v6(v1, v0, v4);
}

uint64_t destroy for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2)
{
  return sub_24CBF87B0(a1, a2, MEMORY[0x263F5CA88]);
}

uint64_t sub_24CBF87B0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  return v6(a1, v4);
}

uint64_t initializeWithCopy for Action.AppIntentConfiguration()
{
  return sub_24CBF8828();
}

uint64_t sub_24CBF8828()
{
  uint64_t v1 = OUTLINED_FUNCTION_1_9();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t assignWithCopy for Action.AppIntentConfiguration()
{
  return sub_24CBF888C();
}

uint64_t sub_24CBF888C()
{
  uint64_t v1 = OUTLINED_FUNCTION_1_9();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t initializeWithTake for Action.AppIntentConfiguration()
{
  return sub_24CBF88F0();
}

uint64_t sub_24CBF88F0()
{
  uint64_t v1 = OUTLINED_FUNCTION_1_9();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t assignWithTake for Action.AppIntentConfiguration()
{
  return sub_24CBF8954();
}

uint64_t sub_24CBF8954()
{
  uint64_t v1 = OUTLINED_FUNCTION_1_9();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t getEnumTagSinglePayload for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBF89B4);
}

uint64_t sub_24CBF89B4()
{
  sub_24CC234F0();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBF8A08);
}

uint64_t sub_24CBF8A08()
{
  sub_24CC234F0();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Action.AppIntentConfiguration(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_2698190D0);
}

uint64_t sub_24CBF8A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CBF8A80(a1, a2, a3, MEMORY[0x263F5CA88]);
}

uint64_t sub_24CBF8A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t sub_24CBF8B70(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_0_4();
  uint64_t v36 = v10;
  uint64_t v11 = type metadata accessor for Action(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v16 - 8);
  OUTLINED_FUNCTION_9_3();
  uint64_t v39 = a4[1];
  uint64_t v40 = *a4;
  uint64_t v37 = a4[3];
  uint64_t v38 = a4[2];
  uint64_t v17 = sub_24CC23760();
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v34 = v4;
    uint64_t v35 = a1;
    *(void *)&long long v43 = MEMORY[0x263F8EE78];
    sub_24CC2011C();
    uint64_t v19 = v43;
    uint64_t v41 = sub_24CC236D0();
    uint64_t v20 = *(void *)(v41 - 8);
    uint64_t v21 = *(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16);
    unint64_t v22 = v17 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    uint64_t v23 = *(void *)(v20 + 72);
    do
    {
      v21(v15, v22, v41);
      *(void *)&long long v43 = v19;
      unint64_t v24 = *(void *)(v19 + 16);
      if (v24 >= *(void *)(v19 + 24) >> 1)
      {
        sub_24CC2011C();
        uint64_t v19 = v43;
      }
      *(void *)(v19 + 16) = v24 + 1;
      sub_24CBFB9F8(v15, v19+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v24);
      v22 += v23;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    a1 = v35;
    uint64_t v4 = v34;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  sub_24CBF92C8(a2, v4);
  if (a3)
  {
    uint64_t v25 = sub_24CC237D0();
    OUTLINED_FUNCTION_32();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v36, a1, v25);
    __swift_storeEnumTagSinglePayload(v36, 0, 1, v25);
    id v27 = a3;
    TipCollectionModel.init(result:collection:)(v36, a3, (uint64_t *)&v43);
    long long v28 = v43;
    long long v29 = v44;
    a3 = v27;
    long long v30 = v45;
    long long v31 = v46;
  }
  else
  {
    long long v28 = xmmword_24CC260B0;
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
  }
  long long v43 = v28;
  long long v44 = v29;
  long long v45 = v30;
  long long v46 = v31;
  v42[0] = v40;
  v42[1] = v39;
  v42[2] = v38;
  v42[3] = v37;
  SupplementarySnippetModel.init(actions:attributionModel:tipCollectionModel:context:)(v19, v4, (uint64_t)&v43, (uint64_t)v42);

  sub_24CBF9330(a2);
  sub_24CC237D0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  return v32();
}

uint64_t sub_24CBF8F20()
{
  type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  sub_24CC23910();
  uint64_t v5 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  sub_24CBFA95C(v0, v4);
  if (v5)
  {
    sub_24CBDC274(v4);
    return 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
    sub_24CC23910();
    sub_24CBDC274(v4);
    BOOL v6 = v9 != 1;
    if (v9 != 1) {
      sub_24CBFB990(v8, v9);
    }
  }
  return v6;
}

uint64_t SupplementarySnippetModel.actions.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CBF9048()
{
  return SupplementarySnippetModel.actions.setter();
}

uint64_t SupplementarySnippetModel.actions.setter()
{
  return sub_24CC23920();
}

uint64_t (*SupplementarySnippetModel.actions.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  v1[4] = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SupplementarySnippetModel.attributionModel.getter()
{
  return sub_24CC23910();
}

uint64_t type metadata accessor for SupplementarySnippetModel()
{
  uint64_t result = qword_2698191A8;
  if (!qword_2698191A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CBF9194(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBF92C8(a1, (uint64_t)v4);
  return SupplementarySnippetModel.attributionModel.setter((uint64_t)v4);
}

uint64_t SupplementarySnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_1();
  sub_24CBF92C8(a1, v4 - v3);
  type metadata accessor for SupplementarySnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  sub_24CC23920();
  return sub_24CBF9330(a1);
}

uint64_t sub_24CBF92C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBF9330(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*SupplementarySnippetModel.attributionModel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_11_1((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SupplementarySnippetModel.tipCollectionModel.getter()
{
  return sub_24CC23910();
}

double sub_24CBF9434@<D0>(_OWORD *a1@<X8>)
{
  SupplementarySnippetModel.tipCollectionModel.getter();
  *a1 = v3;
  a1[1] = v4;
  double result = *(double *)&v5;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_24CBF9478(uint64_t *a1)
{
  return SupplementarySnippetModel.tipCollectionModel.setter();
}

uint64_t SupplementarySnippetModel.tipCollectionModel.setter()
{
  return sub_24CC23920();
}

uint64_t (*SupplementarySnippetModel.tipCollectionModel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_11_1((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SupplementarySnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CBF95D0@<D0>(uint64_t a1@<X8>)
{
  SupplementarySnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CBF9614()
{
  return SupplementarySnippetModel.context.setter();
}

uint64_t SupplementarySnippetModel.context.setter()
{
  return sub_24CC23920();
}

uint64_t (*SupplementarySnippetModel.context.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_11_1((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SupplementarySnippetModel.init(actions:attributionModel:tipCollectionModel:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - v12;
  long long v14 = *(_OWORD *)a3;
  long long v27 = *(_OWORD *)(a3 + 16);
  long long v28 = v14;
  long long v26 = *(_OWORD *)(a3 + 32);
  uint64_t v15 = *(void *)(a3 + 48);
  uint64_t v24 = *(void *)(a3 + 56);
  uint64_t v25 = v15;
  long long v31 = *(_OWORD *)a4;
  uint64_t v16 = *(void *)(a4 + 16);
  uint64_t v29 = *(void *)(a4 + 24);
  uint64_t v30 = v16;
  type metadata accessor for SupplementarySnippetModel();
  type metadata accessor for AttributionModel();
  uint64_t v17 = OUTLINED_FUNCTION_14_2();
  __swift_storeEnumTagSinglePayload(v17, v18, v19, v20);
  sub_24CBF92C8((uint64_t)v13, (uint64_t)v11);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v13);
  long long v32 = xmmword_24CC260B0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698190E0);
  sub_24CC238F0();
  *(void *)&long long v32 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698190E8);
  sub_24CC238F0();
  sub_24CBF92C8(a2, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v21();
  sub_24CBF92C8((uint64_t)v13, (uint64_t)v11);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v22();
  long long v32 = v28;
  long long v33 = v27;
  long long v34 = v26;
  *(void *)&long long v35 = v25;
  *((void *)&v35 + 1) = v24;
  sub_24CC238F0();
  long long v32 = v31;
  *(void *)&long long v33 = v30;
  *((void *)&v33 + 1) = v29;
  sub_24CC238F0();
  return sub_24CBF9330(a2);
}

uint64_t sub_24CBF99AC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736E6F69746361 && a2 == 0xE700000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC288A0 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024CC288C0 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_24CBF9B50(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      unint64_t result = 0x736E6F69746361;
      break;
  }
  return result;
}

unint64_t sub_24CBF9BE8()
{
  return sub_24CBF9B50(*v0);
}

uint64_t sub_24CBF9BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBF99AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBF9C18(uint64_t a1)
{
  unint64_t v2 = sub_24CBF9EEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBF9C54(uint64_t a1)
{
  unint64_t v2 = sub_24CBF9EEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SupplementarySnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698190F0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBF9EEC();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  sub_24CBFA7D4((uint64_t)&unk_269819100);
  sub_24CC242E0();
  if (!v1)
  {
    type metadata accessor for SupplementarySnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    sub_24CBF9FB8((uint64_t)&unk_269819128);
    OUTLINED_FUNCTION_10_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
    sub_24CBFA8A0((uint64_t)&unk_269819150);
    OUTLINED_FUNCTION_10_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CBE8158((uint64_t)&unk_269818C80);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_24CBF9EEC()
{
  unint64_t result = qword_2698190F8;
  if (!qword_2698190F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698190F8);
  }
  return result;
}

unint64_t sub_24CBF9F38(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698190E8);
    sub_24CBFAA50(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBF9FB8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B88);
    sub_24CBFA084((uint64_t)&unk_269819130);
    sub_24CBFA084((uint64_t)&unk_269819140);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBFA084(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B40);
    sub_24CBFAA50(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBFA104(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698190E0);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBFA170()
{
  unint64_t result = qword_269819160;
  if (!qword_269819160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819160);
  }
  return result;
}

unint64_t sub_24CBFA1BC()
{
  unint64_t result = qword_269819170;
  if (!qword_269819170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819170);
  }
  return result;
}

uint64_t SupplementarySnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  OUTLINED_FUNCTION_0();
  uint64_t v49 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_4();
  uint64_t v51 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  OUTLINED_FUNCTION_0();
  uint64_t v60 = v7;
  uint64_t v61 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_4();
  uint64_t v53 = v8;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0_4();
  uint64_t v56 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_4();
  uint64_t v57 = v15;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819178);
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_9_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v49 - v22;
  uint64_t v24 = type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1();
  uint64_t v28 = v27 - v26;
  uint64_t v30 = v27 - v26 + *(int *)(v29 + 20);
  type metadata accessor for AttributionModel();
  uint64_t v31 = OUTLINED_FUNCTION_14_2();
  __swift_storeEnumTagSinglePayload(v31, v32, v33, v34);
  sub_24CBF92C8((uint64_t)v23, (uint64_t)v21);
  uint64_t v63 = v30;
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v23);
  uint64_t v35 = v28 + *(int *)(v24 + 24);
  long long v65 = xmmword_24CC260B0;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698190E0);
  sub_24CC238F0();
  uint64_t v36 = a1[3];
  uint64_t v59 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v36);
  sub_24CBF9EEC();
  uint64_t v37 = v62;
  sub_24CC24360();
  if (v37)
  {
    uint64_t v41 = v60;
    uint64_t v40 = v61;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    OUTLINED_FUNCTION_3_2();
    v42();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v35, v40);
  }
  else
  {
    uint64_t v38 = v56;
    LOBYTE(v65) = 0;
    sub_24CBFA7D4((uint64_t)&unk_269819180);
    OUTLINED_FUNCTION_16_2();
    uint64_t v39 = v57;
    sub_24CC24270();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v28, v39, v12);
    LOBYTE(v65) = 1;
    sub_24CBF9FB8((uint64_t)&unk_269819188);
    OUTLINED_FUNCTION_16_2();
    uint64_t v43 = v69;
    OUTLINED_FUNCTION_8_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 40))(v63, v38, v43);
    LOBYTE(v65) = 2;
    sub_24CBFA8A0((uint64_t)&unk_269819190);
    OUTLINED_FUNCTION_16_2();
    uint64_t v44 = v53;
    uint64_t v45 = v61;
    OUTLINED_FUNCTION_8_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 40))(v35, v44, v45);
    LOBYTE(v65) = 3;
    sub_24CBE8158((uint64_t)&unk_269818CA8);
    OUTLINED_FUNCTION_16_2();
    sub_24CC24270();
    OUTLINED_FUNCTION_3_2();
    v46();
    uint64_t v47 = (uint64_t)v59;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v28 + *(int *)(v24 + 28), v51, v52);
    sub_24CBFA95C(v28, v50);
    __swift_destroy_boxed_opaque_existential_1(v47);
    return sub_24CBDC274(v28);
  }
}

unint64_t sub_24CBFA7D4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B90);
    sub_24CBF9F38((uint64_t)&unk_269819108);
    sub_24CBF9F38((uint64_t)&unk_269819118);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CBFA8A0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B98);
    sub_24CBFA104((uint64_t)&unk_269819158);
    sub_24CBFA104((uint64_t)&unk_269819168);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CBFA95C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CBFA9C0()
{
  return sub_24CBFAA50((uint64_t)&unk_269819198);
}

unint64_t sub_24CBFAA08()
{
  return sub_24CBFAA50((uint64_t)&unk_2698191A0);
}

unint64_t sub_24CBFAA50(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CBFAA94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SupplementarySnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24CBFAAAC(void *a1)
{
  return SupplementarySnippetModel.encode(to:)(a1);
}

uint64_t sub_24CBFAAC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SupplementarySnippetModel.actions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24CBFAAF4()
{
  return SupplementarySnippetModel.attributionModel.getter();
}

uint64_t *initializeBufferWithCopyOfBuffer for SupplementarySnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  return a1;
}

uint64_t destroy for SupplementarySnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  return v11(v9, v10);
}

uint64_t initializeWithCopy for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t initializeWithTake for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t assignWithTake for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for SupplementarySnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CBFB3B0);
}

uint64_t sub_24CBFB3B0(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        uint64_t v12 = a3[7];
      }
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SupplementarySnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CBFB498);
}

uint64_t sub_24CBFB498(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        uint64_t v14 = a4[7];
      }
    }
    uint64_t v11 = a1 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_24CBFB574()
{
  sub_24CBFB6E4(319, &qword_2698191B8, &qword_2698190E8);
  if (v0 <= 0x3F)
  {
    sub_24CBFB6E4(319, &qword_2698191C0, &qword_269818B40);
    if (v1 <= 0x3F)
    {
      sub_24CBFB6E4(319, &qword_2698191C8, &qword_2698190E0);
      if (v2 <= 0x3F)
      {
        sub_24CBE8ACC();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_24CBFB6E4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_24CC23930();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SupplementarySnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CBFB800);
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

ValueMetadata *type metadata accessor for SupplementarySnippetModel.CodingKeys()
{
  return &type metadata for SupplementarySnippetModel.CodingKeys;
}

unint64_t sub_24CBFB83C()
{
  unint64_t result = qword_2698191D0;
  if (!qword_2698191D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698191D0);
  }
  return result;
}

unint64_t sub_24CBFB88C()
{
  unint64_t result = qword_2698191D8;
  if (!qword_2698191D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698191D8);
  }
  return result;
}

unint64_t sub_24CBFB8DC()
{
  unint64_t result = qword_2698191E0;
  if (!qword_2698191E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698191E0);
  }
  return result;
}

uint64_t sub_24CBFB928(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CBFB990(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CBFB9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Action(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_24CC24270();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_24CC242E0();
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  *unint64_t v1 = a1;
  return type metadata accessor for SupplementarySnippetModel();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_getWitnessTable();
}

unint64_t sub_24CBFBB30(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x747865746E6F63;
      break;
    case 2:
      unint64_t result = 0x626D79735F736168;
      break;
    case 3:
      unint64_t result = 0x6574616C706D6574;
      break;
    case 4:
      return result;
    default:
      unint64_t result = 0x5F72657473756C63;
      break;
  }
  return result;
}

uint64_t sub_24CBFBBFC()
{
  uint64_t v1 = v0;
  sub_24CBFBEC8();
  sub_24CC23E50();
  sub_24CC23EC0();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = OUTLINED_FUNCTION_0_6();
  sub_24CC04170(v2, 0x5F72657473756C63, 0xEA00000000006469);
  swift_bridgeObjectRelease();
  sub_24CBFBF44(v0 + 48, (uint64_t)v12);
  sub_24CBFBF44((uint64_t)v12, (uint64_t)v13);
  if (v13[1])
  {
    sub_24CC23EC0();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = OUTLINED_FUNCTION_0_6();
    sub_24CC04170(v3, 0x747865746E6F63, 0xE700000000000000);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  sub_24CC24030();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = OUTLINED_FUNCTION_0_6();
  sub_24CC04170(v4, 0x626D79735F736168, 0xEB00000000736C6FLL);
  swift_bridgeObjectRelease();
  sub_24CC15A28(*(unsigned char *)(v0 + 65));
  sub_24CC23EC0();
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = OUTLINED_FUNCTION_0_6();
  sub_24CC04170(v5, 0x6574616C706D6574, 0xED0000657079745FLL);
  uint64_t v6 = v14[0];
  uint64_t v10 = v14[0];
  swift_bridgeObjectRelease();
  sub_24CBFBF44(v1 + 72, (uint64_t)v11);
  sub_24CBFBF44((uint64_t)v11, (uint64_t)v14);
  if (v14[1])
  {
    uint64_t v7 = sub_24CC23EC0();
    swift_isUniquelyReferenced_nonNull_native();
    sub_24CC04170(v7, 0xD000000000000012, 0x800000024CC288E0);
    uint64_t v8 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {

    return v10;
  }
  return v8;
}

uint64_t sub_24CBFBE68()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CBFBE98()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24CBFBEC8()
{
  unint64_t result = qword_2698191E8;
  if (!qword_2698191E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2698191E8);
  }
  return result;
}

uint64_t sub_24CBFBF08()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_24CBFBBFC();
}

uint64_t sub_24CBFBF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ContentViewedEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContentViewedEvent(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContentViewedEvent(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for ContentViewedEvent(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentViewedEvent(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
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

uint64_t storeEnumTagSinglePayload for ContentViewedEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentViewedEvent()
{
  return &type metadata for ContentViewedEvent;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  *(void *)(v2 - 48) = v0;
  return v1;
}

unint64_t sub_24CBFC2B8()
{
  return 0xD000000000000022;
}

uint64_t sub_24CBFC2D4(char a1)
{
  if (a1) {
    return 0xD000000000000016;
  }
  else {
    return 0x6F4E746C75736572;
  }
}

uint64_t sub_24CBFC334(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v30 = a4;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v28 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  uint64_t v8 = OUTLINED_FUNCTION_1_0(v7);
  uint64_t v29 = v9;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CC23A40();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v16);
  uint64_t v19 = sub_24CC239B0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v15, a3, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v19);
  sub_24CBFC7B4(a2, (uint64_t)v12);
  unint64_t v21 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v22 = v21 + v11;
  uint64_t v23 = swift_allocObject();
  sub_24CBFC8F0((uint64_t)v12, v23 + v21);
  *(unsigned char *)(v23 + v22) = v30;
  uint64_t v24 = sub_24CC239E0();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v27, v19);
  sub_24CBFC9CC(v26);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v28, v16);
  return v24;
}

uint64_t sub_24CBFC5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBFC7B4(a2, (uint64_t)v5);
  uint64_t v6 = sub_24CC23BC0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_24CBFC9CC((uint64_t)v5);
  }
  else
  {
    sub_24CC23BB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  sub_24CC239D0();
  return sub_24CC239C0();
}

uint64_t sub_24CBFC7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBFC81C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  OUTLINED_FUNCTION_1_0(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_24CC23BC0();
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v4, v7);
  }
  return MEMORY[0x270FA0238](v0, v6 + v4 + 1, v3 | 7);
}

uint64_t sub_24CBFC8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CBFC958(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  OUTLINED_FUNCTION_1_0(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_24CBFC5FC(a1, v5);
}

uint64_t sub_24CBFC9CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DeviceExpertCATsSimple()
{
  uint64_t result = qword_269819200;
  if (!qword_269819200) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CBFCA74()
{
  return swift_initClassMetadata2();
}

BOOL sub_24CBFCAB4()
{
  return sub_24CBFCF74();
}

unint64_t sub_24CBFCAC0()
{
  return 0xD00000000000001BLL;
}

BOOL sub_24CBFCAE8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_24CBFCF74();
  *a1 = result;
  return result;
}

unint64_t sub_24CBFCB28@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_24CBFCAC0();
  *a1 = 0xD00000000000001BLL;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CBFCB58()
{
  OUTLINED_FUNCTION_16();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  *(unsigned char *)(v1 + 72) = v3;
  *(void *)(v1 + 16) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F58);
  *(void *)(v1 + 40) = swift_task_alloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24CBFCBEC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819238);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_24CC249B0;
  uint64_t v4 = (uint64_t *)(v3 + 48);
  *(void *)(v3 + 32) = 0xD000000000000014;
  *(void *)(v3 + 40) = 0x800000024CC28A50;
  sub_24CBFDEAC(v2, v1, &qword_269818F58);
  uint64_t v5 = sub_24CC23C50();
  if (OUTLINED_FUNCTION_14_3(v5) == 1)
  {
    sub_24CBFDF0C(*(void *)(v0 + 40), &qword_269818F58);
    *(_OWORD *)uint64_t v4 = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
  }
  else
  {
    *(void *)(v3 + 72) = v2;
    __swift_allocate_boxed_opaque_existential_1(v4);
    OUTLINED_FUNCTION_11_2();
    (*(void (**)(void))(v6 + 32))();
  }
  char v7 = *(unsigned char *)(v0 + 72);
  *(void *)(v3 + 80) = 0xD000000000000019;
  *(void *)(v3 + 88) = 0x800000024CC28A70;
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    *(void *)(v3 + 104) = 0;
    *(void *)(v3 + 112) = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 24);
    uint64_t v9 = MEMORY[0x263F8D538];
  }
  *(void *)(v3 + 120) = v9;
  *(void *)(v3 + 96) = v8;
  uint64_t v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t, ValueMetadata *, unint64_t))((int)*MEMORY[0x263F6D0C0] + MEMORY[0x263F6D0C0]);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v10;
  unint64_t v11 = sub_24CBFDFB0();
  *uint64_t v10 = v0;
  v10[1] = sub_24CBFCDE8;
  return v13(0xD00000000000001DLL, 0x800000024CC28A90, v3, &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds, v11);
}

uint64_t sub_24CBFCDE8()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_20();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v10 = OUTLINED_FUNCTION_12_3();
    return v11(v10);
  }
}

uint64_t sub_24CBFCF00()
{
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

BOOL sub_24CBFCF68()
{
  return sub_24CBFCF74();
}

BOOL sub_24CBFCF74()
{
  uint64_t v0 = sub_24CC24200();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

unint64_t sub_24CBFCFB8()
{
  return 0xD00000000000001CLL;
}

BOOL sub_24CBFCFE0@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_24CBFCF74();
  *a1 = result;
  return result;
}

unint64_t sub_24CBFD020@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_24CBFCFB8();
  *a1 = 0xD00000000000001CLL;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CBFD050(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_10((uint64_t)sub_24CBFD068);
}

uint64_t sub_24CBFD068()
{
  uint64_t v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819238);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24CC251D0;
  *(void *)(v2 + 32) = 0xD000000000000015;
  *(void *)(v2 + 40) = 0x800000024CC28A30;
  *(void *)(v2 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_269819248);
  *(void *)(v2 + 48) = v1;
  OUTLINED_FUNCTION_9_4(MEMORY[0x263F6D0C0]);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  unint64_t v4 = sub_24CBFDF64();
  *uint64_t v3 = v0;
  v3[1] = sub_24CBFD1AC;
  return v6(0xD00000000000001CLL, 0x800000024CC28A10, v2, &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds, v4);
}

uint64_t sub_24CBFD1AC()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *unint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_20();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    return v11(v10);
  }
}

uint64_t sub_24CBFD2C0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_10((uint64_t)sub_24CBFD2D8);
}

uint64_t sub_24CBFD2D8()
{
  OUTLINED_FUNCTION_7_3();
  uint64_t v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819238);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24CC251D0;
  OUTLINED_FUNCTION_13_1();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = 0xE700000000000000;
  *(void *)(v2 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_269819248);
  *(void *)(v2 + 48) = v1;
  OUTLINED_FUNCTION_9_4(MEMORY[0x263F6D0C8]);
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24CBFD3E8;
  OUTLINED_FUNCTION_10_3();
  return v7(0xD00000000000001ALL);
}

uint64_t sub_24CBFD3E8()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_20();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    return v11(v10);
  }
}

uint64_t sub_24CBFD4FC()
{
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CBFD55C()
{
  OUTLINED_FUNCTION_16();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  *(unsigned char *)(v1 + 64) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F58);
  *(void *)(v1 + 32) = swift_task_alloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24CBFD5EC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819238);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 40) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24CC249B0;
  *(void *)(v4 + 32) = 0x7069547369;
  *(void *)(v4 + 40) = 0xE500000000000000;
  uint64_t v5 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v4 + 48) = v3;
  uint64_t v6 = (uint64_t *)(v4 + 96);
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = 0x74706D6F7270;
  *(void *)(v4 + 88) = 0xE600000000000000;
  sub_24CBFDEAC(v2, v1, &qword_269818F58);
  uint64_t v7 = sub_24CC23C50();
  if (OUTLINED_FUNCTION_14_3(v7) == 1)
  {
    sub_24CBFDF0C(*(void *)(v0 + 32), &qword_269818F58);
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
  }
  else
  {
    *(void *)(v4 + 120) = v2;
    __swift_allocate_boxed_opaque_existential_1(v6);
    OUTLINED_FUNCTION_11_2();
    (*(void (**)(void))(v8 + 32))();
  }
  unint64_t v11 = (uint64_t (*)(unint64_t))((int)*MEMORY[0x263F6D0C8] + MEMORY[0x263F6D0C8]);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24CBFD7A8;
  OUTLINED_FUNCTION_10_3();
  return v11(0xD000000000000014);
}

uint64_t sub_24CBFD7A8()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_20();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v10 = OUTLINED_FUNCTION_12_3();
    return v11(v10);
  }
}

uint64_t sub_24CBFD8C0()
{
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CBFD928(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_10((uint64_t)sub_24CBFD944);
}

uint64_t sub_24CBFD944()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819238);
  uint64_t v3 = swift_allocObject();
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_24CC249B0;
  *(void *)(v3 + 32) = 0x7370657473;
  *(void *)(v3 + 40) = 0xE500000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819240);
  *(void *)(v3 + 48) = v2;
  OUTLINED_FUNCTION_13_1();
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = 0xE700000000000000;
  *(void *)(v3 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_269819248);
  *(void *)(v3 + 96) = v1;
  OUTLINED_FUNCTION_9_4(MEMORY[0x263F6D0C8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[6] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24CBFDA90;
  OUTLINED_FUNCTION_10_3();
  return v8(0xD000000000000017);
}

uint64_t sub_24CBFDA90()
{
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_20();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = OUTLINED_FUNCTION_4_5();
    return v11(v10);
  }
}

uint64_t sub_24CBFDBA4()
{
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CBFDC04(uint64_t a1, uint64_t a2)
{
  return sub_24CBFDC58(a1, a2);
}

uint64_t sub_24CBFDC58(uint64_t a1, uint64_t a2)
{
  sub_24CC23CC0();
  OUTLINED_FUNCTION_2_8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_1();
  sub_24CBFDEAC(a1, v13 - v12, &qword_269818D50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_24CC23C60();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_24CBFDF0C(a1, &qword_269818D50);
  return v14;
}

uint64_t sub_24CBFDD98(uint64_t a1, uint64_t a2)
{
  sub_24CC23CC0();
  OUTLINED_FUNCTION_2_8();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_24CC23C70();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_24CBFDE74()
{
  uint64_t v0 = sub_24CC23C90();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_24CBFDEA4()
{
  return type metadata accessor for DeviceExpertCATsSimple();
}

uint64_t sub_24CBFDEAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_24CBFDF0C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_11_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_24CBFDF64()
{
  unint64_t result = qword_269819250;
  if (!qword_269819250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819250);
  }
  return result;
}

unint64_t sub_24CBFDFB0()
{
  unint64_t result = qword_269819258;
  if (!qword_269819258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819258);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertCATsSimple.AttributionGroupDialogIds()
{
  return &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds;
}

unsigned char *_s19DeviceExpertIntents22DeviceExpertCATsSimpleC25AttributionGroupDialogIdsOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CBFE0B0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertCATsSimple.AttributionListDialogIds()
{
  return &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds;
}

unint64_t sub_24CBFE0EC()
{
  unint64_t result = qword_269819260;
  if (!qword_269819260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819260);
  }
  return result;
}

unint64_t sub_24CBFE13C()
{
  unint64_t result = qword_269819268;
  if (!qword_269819268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819268);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_4@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_3(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t sub_24CBFE268()
{
  type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3 - v2;
  sub_24CBE71AC(v0, v3 - v2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v5 = type metadata accessor for LearnMoreSnippetModel();
      uint64_t v6 = (void (*)(void))type metadata accessor for LearnMoreSnippetModel;
      uint64_t v7 = &off_26FF27088;
      break;
    case 2u:
      uint64_t v5 = type metadata accessor for ListStyleAnswerSnippetModel();
      uint64_t v6 = (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel;
      uint64_t v7 = &off_26FF26C80;
      break;
    case 3u:
      uint64_t v5 = type metadata accessor for SummarizedAnswerSnippetModel();
      uint64_t v6 = (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel;
      uint64_t v7 = &off_26FF26FC0;
      break;
    case 4u:
      uint64_t v5 = type metadata accessor for SupplementarySnippetModel();
      uint64_t v6 = (void (*)(void))type metadata accessor for SupplementarySnippetModel;
      uint64_t v7 = &off_26FF264F8;
      break;
    case 5u:
      uint64_t v5 = type metadata accessor for TipSnippetModel(0);
      uint64_t v6 = (void (*)(void))type metadata accessor for TipSnippetModel;
      uint64_t v7 = &off_26FF26020;
      break;
    default:
      uint64_t v5 = type metadata accessor for AttributionListSnippetModel();
      uint64_t v6 = (void (*)(void))type metadata accessor for AttributionListSnippetModel;
      uint64_t v7 = &off_26FF25EF0;
      break;
  }
  uint64_t v13 = v5;
  uint64_t v14 = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  sub_24CC004B0(v4, (uint64_t)boxed_opaque_existential_1, v6);
  uint64_t v9 = v13;
  uint64_t v10 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  LOBYTE(v9) = ((uint64_t (*)(uint64_t, _UNKNOWN **))v10[1])(v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9 & 1;
}

unint64_t static TellMeGeneratedSnippetModels.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_24CBFE488(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7475626972747461 && a2 == 0xEF7473694C6E6F69;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x726F4D6E7261656CLL && a2 == 0xE900000000000065;
    if (v6 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C7974537473696CLL && a2 == 0xEF726577736E4165;
      if (v7 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC28B00 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x656D656C70707573 && a2 == 0xED0000797261746ELL;
        if (v8 || (sub_24CC24310() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 7367028 && a2 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v10 = sub_24CC24310();
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

unint64_t sub_24CBFE714(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726F4D6E7261656CLL;
      break;
    case 2:
      unint64_t result = 0x6C7974537473696CLL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x656D656C70707573;
      break;
    case 5:
      unint64_t result = 7367028;
      break;
    default:
      unint64_t result = 0x7475626972747461;
      break;
  }
  return result;
}

uint64_t sub_24CBFE804(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CC24310();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CBFE874()
{
  return 12383;
}

uint64_t sub_24CBFE880()
{
  return sub_24CBE9220();
}

uint64_t sub_24CBFE8A0(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF800();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFE8DC(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF800();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24CBFE918()
{
  return sub_24CBFE714(*v0);
}

uint64_t sub_24CBFE920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBFE488(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CBFE948(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF638();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFE984(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF638();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CBFE9C0(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF7B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFE9FC(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF7B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CBFEA38(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF768();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFEA74(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF768();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CBFEAB0(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF71C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFEAEC(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF71C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CBFEB28(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF6D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFEB64(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF6D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CBFEBA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CBFE804(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CBFEBCC(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF684();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CBFEC08(uint64_t a1)
{
  unint64_t v2 = sub_24CBFF684();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TellMeGeneratedSnippetModels.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819270);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10_4(v4, v46);
  type metadata accessor for TipSnippetModel(0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0_4();
  uint64_t v52 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819278);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11_3(v8, v47);
  type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_4();
  uint64_t v51 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819280);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0_4();
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0_4();
  uint64_t v50 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819288);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_4();
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0_4();
  uint64_t v49 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819290);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_0_4();
  type metadata accessor for LearnMoreSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_0_4();
  uint64_t v48 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819298);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1();
  type metadata accessor for AttributionListSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_7_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698192A0);
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v28;
  uint64_t v54 = v27;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1();
  uint64_t v31 = v30 - v29;
  uint64_t v32 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBFF638();
  sub_24CC24370();
  sub_24CBE71AC(v55, v1);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v36 = type metadata accessor for LearnMoreSnippetModel;
      uint64_t v37 = v48;
      sub_24CC004B0(v1, v48, (void (*)(void))type metadata accessor for LearnMoreSnippetModel);
      sub_24CBFF7B4();
      OUTLINED_FUNCTION_8_2();
      sub_24CC005A0(&qword_2698192E8, (void (*)(uint64_t))type metadata accessor for LearnMoreSnippetModel);
      sub_24CC242E0();
      goto LABEL_5;
    case 2u:
      uint64_t v36 = type metadata accessor for ListStyleAnswerSnippetModel;
      uint64_t v37 = v49;
      sub_24CC004B0(v1, v49, (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
      sub_24CBFF768();
      OUTLINED_FUNCTION_8_2();
      sub_24CC005A0(&qword_2698192D8, (void (*)(uint64_t))type metadata accessor for ListStyleAnswerSnippetModel);
      sub_24CC242E0();
LABEL_5:
      OUTLINED_FUNCTION_3_2();
      v38();
      sub_24CC01FDC(v37, (void (*)(void))v36);
      uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8);
      uint64_t v35 = v24;
      goto LABEL_6;
    case 3u:
      uint64_t v40 = v50;
      sub_24CC004B0(v1, v50, (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel);
      sub_24CBFF71C();
      OUTLINED_FUNCTION_6_5();
      sub_24CC005A0(&qword_2698192C8, (void (*)(uint64_t))type metadata accessor for SummarizedAnswerSnippetModel);
      sub_24CC242E0();
      OUTLINED_FUNCTION_2_9();
      v41();
      uint64_t v42 = (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel;
      goto LABEL_10;
    case 4u:
      uint64_t v40 = v51;
      sub_24CC004B0(v1, v51, (void (*)(void))type metadata accessor for SupplementarySnippetModel);
      sub_24CBFF6D0();
      OUTLINED_FUNCTION_6_5();
      sub_24CC005A0(&qword_2698191A0, (void (*)(uint64_t))type metadata accessor for SupplementarySnippetModel);
      sub_24CC242E0();
      OUTLINED_FUNCTION_2_9();
      v43();
      uint64_t v42 = (void (*)(void))type metadata accessor for SupplementarySnippetModel;
      goto LABEL_10;
    case 5u:
      uint64_t v40 = v52;
      sub_24CC004B0(v1, v52, (void (*)(void))type metadata accessor for TipSnippetModel);
      sub_24CBFF684();
      OUTLINED_FUNCTION_6_5();
      sub_24CC005A0(&qword_269818DC8, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
      sub_24CC242E0();
      OUTLINED_FUNCTION_2_9();
      v44();
      uint64_t v42 = (void (*)(void))type metadata accessor for TipSnippetModel;
LABEL_10:
      sub_24CC01FDC(v40, v42);
      uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8);
      uint64_t v35 = v32;
      uint64_t v39 = v25;
      break;
    default:
      sub_24CC004B0(v1, v24, (void (*)(void))type metadata accessor for AttributionListSnippetModel);
      sub_24CBFF800();
      uint64_t v32 = v54;
      sub_24CC24290();
      sub_24CC005A0(&qword_269818CB8, (void (*)(uint64_t))type metadata accessor for AttributionListSnippetModel);
      sub_24CC242E0();
      OUTLINED_FUNCTION_3_2();
      v33();
      sub_24CC01FDC(v24, (void (*)(void))type metadata accessor for AttributionListSnippetModel);
      uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8);
      uint64_t v35 = v31;
LABEL_6:
      uint64_t v39 = v32;
      break;
  }
  return v34(v35, v39);
}

uint64_t type metadata accessor for TellMeGeneratedSnippetModels()
{
  uint64_t result = qword_269819360;
  if (!qword_269819360) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24CBFF638()
{
  unint64_t result = qword_2698192A8;
  if (!qword_2698192A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192A8);
  }
  return result;
}

unint64_t sub_24CBFF684()
{
  unint64_t result = qword_2698192B0;
  if (!qword_2698192B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192B0);
  }
  return result;
}

unint64_t sub_24CBFF6D0()
{
  unint64_t result = qword_2698192B8;
  if (!qword_2698192B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192B8);
  }
  return result;
}

unint64_t sub_24CBFF71C()
{
  unint64_t result = qword_2698192C0;
  if (!qword_2698192C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192C0);
  }
  return result;
}

unint64_t sub_24CBFF768()
{
  unint64_t result = qword_2698192D0;
  if (!qword_2698192D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192D0);
  }
  return result;
}

unint64_t sub_24CBFF7B4()
{
  unint64_t result = qword_2698192E0;
  if (!qword_2698192E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192E0);
  }
  return result;
}

unint64_t sub_24CBFF800()
{
  unint64_t result = qword_2698192F0;
  if (!qword_2698192F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698192F0);
  }
  return result;
}

uint64_t TellMeGeneratedSnippetModels.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v108 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698192F8);
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v4;
  uint64_t v104 = v5;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_4();
  uint64_t v113 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819300);
  OUTLINED_FUNCTION_0();
  uint64_t v101 = v8;
  uint64_t v102 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10_4(v9, v85);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819308);
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v11;
  uint64_t v100 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0_4();
  uint64_t v107 = v12;
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819310);
  OUTLINED_FUNCTION_0();
  uint64_t v98 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_4();
  uint64_t v106 = v15;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819318);
  OUTLINED_FUNCTION_0();
  uint64_t v96 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_0_4();
  uint64_t v105 = v18;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819320);
  OUTLINED_FUNCTION_0();
  uint64_t v94 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_11_3(v21, v85);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819328);
  OUTLINED_FUNCTION_0();
  uint64_t v110 = v23;
  uint64_t v111 = v22;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_7_2();
  uint64_t v109 = type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_32();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v93 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v92 = (char *)&v85 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v85 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v85 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v85 - v36;
  uint64_t v38 = MEMORY[0x270FA5388](v35);
  uint64_t v40 = (char *)&v85 - v39;
  MEMORY[0x270FA5388](v38);
  uint64_t v42 = (char *)&v85 - v41;
  uint64_t v43 = a1[3];
  uint64_t v114 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v43);
  sub_24CBFF638();
  uint64_t v44 = v115;
  sub_24CC24360();
  if (!v44)
  {
    uint64_t v87 = v37;
    uint64_t v90 = v34;
    uint64_t v88 = v31;
    uint64_t v89 = v40;
    uint64_t v91 = v42;
    uint64_t v45 = v111;
    uint64_t v115 = v2;
    uint64_t v46 = sub_24CC24280();
    uint64_t v47 = *(void *)(v46 + 16);
    if (v47
      && (uint64_t v86 = 0,
          uint64_t v48 = *(unsigned __int8 *)(v46 + 32),
          sub_24CC03748(1, v47, v46, v46 + 32, 0, (2 * v47) | 1),
          uint64_t v50 = v49,
          unint64_t v52 = v51,
          swift_bridgeObjectRelease(),
          v50 == v52 >> 1))
    {
      uint64_t v53 = v86;
      uint64_t v54 = v108;
      switch(v48)
      {
        case 1:
          char v117 = 1;
          sub_24CBFF7B4();
          OUTLINED_FUNCTION_5_6();
          type metadata accessor for LearnMoreSnippetModel();
          sub_24CC005A0(&qword_269819348, (void (*)(uint64_t))type metadata accessor for LearnMoreSnippetModel);
          uint64_t v61 = v87;
          OUTLINED_FUNCTION_15_2();
          OUTLINED_FUNCTION_14_4();
          OUTLINED_FUNCTION_2_9();
          v67();
          swift_unknownObjectRelease();
          uint64_t v68 = OUTLINED_FUNCTION_7_4();
          v69(v68);
          goto LABEL_15;
        case 2:
          char v118 = 2;
          sub_24CBFF768();
          OUTLINED_FUNCTION_5_6();
          type metadata accessor for ListStyleAnswerSnippetModel();
          sub_24CC005A0(&qword_269819340, (void (*)(uint64_t))type metadata accessor for ListStyleAnswerSnippetModel);
          sub_24CC24270();
          OUTLINED_FUNCTION_3_2();
          v78();
          swift_unknownObjectRelease();
          uint64_t v79 = OUTLINED_FUNCTION_12_4();
          v80(v79);
          uint64_t v81 = (uint64_t)v90;
          swift_storeEnumTagMultiPayload();
          uint64_t v77 = v81;
          goto LABEL_16;
        case 3:
          char v119 = 3;
          sub_24CBFF71C();
          uint64_t v59 = v115;
          sub_24CC24210();
          if (v53) {
            goto LABEL_7;
          }
          uint64_t v62 = type metadata accessor for SummarizedAnswerSnippetModel();
          sub_24CC005A0(&qword_269819338, (void (*)(uint64_t))type metadata accessor for SummarizedAnswerSnippetModel);
          uint64_t v63 = (uint64_t)v88;
          sub_24CC24270();
          OUTLINED_FUNCTION_14_4();
          OUTLINED_FUNCTION_2_9();
          v70();
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v115, v45);
          swift_storeEnumTagMultiPayload();
          uint64_t v77 = v63;
          goto LABEL_16;
        case 4:
          uint64_t v64 = v108;
          char v120 = 4;
          sub_24CBFF6D0();
          OUTLINED_FUNCTION_5_6();
          type metadata accessor for SupplementarySnippetModel();
          sub_24CC005A0(&qword_269819198, (void (*)(uint64_t))type metadata accessor for SupplementarySnippetModel);
          long long v65 = v92;
          sub_24CC24270();
          OUTLINED_FUNCTION_2_9();
          v71();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_3_2();
          v72();
          swift_storeEnumTagMultiPayload();
          uint64_t v77 = (uint64_t)v65;
          uint64_t v54 = v64;
          goto LABEL_16;
        case 5:
          char v121 = 5;
          sub_24CBFF684();
          OUTLINED_FUNCTION_5_6();
          type metadata accessor for TipSnippetModel(0);
          sub_24CC005A0(&qword_269818DC0, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
          uint64_t v61 = v93;
          OUTLINED_FUNCTION_15_2();
          OUTLINED_FUNCTION_14_4();
          OUTLINED_FUNCTION_2_9();
          v82();
          swift_unknownObjectRelease();
          uint64_t v83 = OUTLINED_FUNCTION_7_4();
          v84(v83);
LABEL_15:
          swift_storeEnumTagMultiPayload();
          uint64_t v77 = (uint64_t)v61;
          uint64_t v54 = v108;
LABEL_16:
          uint64_t v76 = (uint64_t)v91;
          break;
        default:
          char v116 = 0;
          sub_24CBFF800();
          OUTLINED_FUNCTION_5_6();
          type metadata accessor for AttributionListSnippetModel();
          sub_24CC005A0(&qword_269818CB0, (void (*)(uint64_t))type metadata accessor for AttributionListSnippetModel);
          uint64_t v66 = (uint64_t)v89;
          sub_24CC24270();
          OUTLINED_FUNCTION_14_4();
          OUTLINED_FUNCTION_2_9();
          v73();
          swift_unknownObjectRelease();
          uint64_t v74 = OUTLINED_FUNCTION_7_4();
          v75(v74);
          swift_storeEnumTagMultiPayload();
          uint64_t v76 = (uint64_t)v91;
          uint64_t v77 = v66;
          break;
      }
      sub_24CC004B0(v77, v76, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
      sub_24CC004B0(v76, v54, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    }
    else
    {
      uint64_t v55 = v109;
      uint64_t v56 = sub_24CC24130();
      swift_allocError();
      uint64_t v58 = v57;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269819330);
      *uint64_t v58 = v55;
      uint64_t v59 = v115;
      sub_24CC24220();
      sub_24CC24120();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v56 - 8) + 104))(v58, *MEMORY[0x263F8DCB0], v56);
      swift_willThrow();
LABEL_7:
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v59, v45);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v114);
}

unint64_t sub_24CC00458()
{
  return 0xD000000000000014;
}

uint64_t sub_24CC00480@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TellMeGeneratedSnippetModels.init(from:)(a1, a2);
}

uint64_t sub_24CC00498(void *a1)
{
  return TellMeGeneratedSnippetModels.encode(to:)(a1);
}

uint64_t sub_24CC004B0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24CC00510()
{
  return sub_24CC005A0(&qword_269819350, (void (*)(uint64_t))type metadata accessor for TellMeGeneratedSnippetModels);
}

uint64_t sub_24CC00558()
{
  return sub_24CC005A0(&qword_269819358, (void (*)(uint64_t))type metadata accessor for TellMeGeneratedSnippetModels);
}

uint64_t sub_24CC005A0(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for TellMeGeneratedSnippetModels(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = *(int *)(type metadata accessor for LearnMoreSnippetModel() + 20);
        uint64_t v14 = (char *)a1 + v13;
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        break;
      case 2u:
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v18 = *(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16);
        v18(a1, a2, v17);
        uint64_t v19 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v18((void *)((char *)a1 + v19[5]), (void *)((char *)a2 + v19[5]), v17);
        uint64_t v20 = v19[6];
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
        v18((void *)((char *)a1 + v19[7]), (void *)((char *)a2 + v19[7]), v17);
        v18((void *)((char *)a1 + v19[8]), (void *)((char *)a2 + v19[8]), v17);
        uint64_t v24 = v19[9];
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        uint64_t v28 = v19[10];
        uint64_t v29 = (char *)a1 + v28;
        uint64_t v30 = (char *)a2 + v28;
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
        *((unsigned char *)a1 + v19[11]) = *((unsigned char *)a2 + v19[11]);
        break;
      case 3u:
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v33 = *(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16);
        v33(a1, a2, v32);
        uint64_t v34 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v33((void *)((char *)a1 + v34[5]), (void *)((char *)a2 + v34[5]), v32);
        v33((void *)((char *)a1 + v34[6]), (void *)((char *)a2 + v34[6]), v32);
        uint64_t v35 = v34[7];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
        uint64_t v39 = v34[8];
        uint64_t v40 = (char *)a1 + v39;
        uint64_t v41 = (char *)a2 + v39;
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
        break;
      case 4u:
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v43 - 8) + 16))(a1, a2, v43);
        uint64_t v44 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v45 = v44[5];
        uint64_t v46 = (char *)a1 + v45;
        uint64_t v47 = (char *)a2 + v45;
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
        uint64_t v49 = v44[6];
        uint64_t v50 = (char *)a1 + v49;
        unint64_t v51 = (char *)a2 + v49;
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16))(v50, v51, v52);
        uint64_t v53 = v44[7];
        uint64_t v54 = (char *)a1 + v53;
        uint64_t v55 = (char *)a2 + v53;
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
        break;
      case 5u:
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v58 = *(void (**)(void *, void *, uint64_t))(*(void *)(v57 - 8) + 16);
        v58(a1, a2, v57);
        uint64_t v59 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v60 = v59[5];
        uint64_t v61 = (char *)a1 + v60;
        uint64_t v62 = (char *)a2 + v60;
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
        uint64_t v64 = v59[6];
        long long v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 16))(v65, v66, v67);
        v58((void *)((char *)a1 + v59[7]), (void *)((char *)a2 + v59[7]), v57);
        uint64_t v68 = v59[8];
        uint64_t v69 = (char *)a1 + v68;
        uint64_t v70 = (char *)a2 + v68;
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16))(v69, v70, v71);
        uint64_t v72 = v59[9];
        uint64_t v73 = (char *)a1 + v72;
        uint64_t v74 = (char *)a2 + v72;
        uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(v73, v74, v75);
        break;
      default:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for TellMeGeneratedSnippetModels(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t v4 = type metadata accessor for AttributionListSnippetModel();
      goto LABEL_4;
    case 1:
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      uint64_t v4 = type metadata accessor for LearnMoreSnippetModel();
LABEL_4:
      uint64_t v6 = *(int *)(v4 + 20);
      goto LABEL_9;
    case 2:
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      v8(a1, v7);
      uint64_t v9 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
      v8(a1 + v9[5], v7);
      uint64_t v10 = a1 + v9[6];
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
      v8(a1 + v9[7], v7);
      v8(a1 + v9[8], v7);
      uint64_t v12 = a1 + v9[9];
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      uint64_t v6 = v9[10];
      goto LABEL_9;
    case 3:
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
      v15(a1, v14);
      uint64_t v16 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
      v15(a1 + v16[5], v14);
      v15(a1 + v16[6], v14);
      uint64_t v17 = a1 + v16[7];
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
      uint64_t v6 = v16[8];
      goto LABEL_9;
    case 4:
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(a1, v19);
      uint64_t v20 = (int *)type metadata accessor for SupplementarySnippetModel();
      uint64_t v21 = a1 + v20[5];
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
      uint64_t v23 = a1 + v20[6];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
      uint64_t v6 = v20[7];
      goto LABEL_9;
    case 5:
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8);
      v26(a1, v25);
      uint64_t v27 = (int *)type metadata accessor for TipSnippetModel(0);
      uint64_t v28 = a1 + v27[5];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
      uint64_t v30 = a1 + v27[6];
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
      v26(a1 + v27[7], v25);
      uint64_t v32 = a1 + v27[8];
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
      uint64_t v6 = v27[9];
LABEL_9:
      uint64_t v34 = a1 + v6;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8);
      uint64_t result = v36(v34, v35);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for TellMeGeneratedSnippetModels(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v5 = type metadata accessor for LearnMoreSnippetModel();
      goto LABEL_4;
    case 2u:
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
      v9(a1 + v10[5], a2 + v10[5], v8);
      uint64_t v11 = v10[6];
      uint64_t v12 = a1 + v11;
      uint64_t v13 = a2 + v11;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      v9(a1 + v10[7], a2 + v10[7], v8);
      v9(a1 + v10[8], a2 + v10[8], v8);
      uint64_t v15 = v10[9];
      uint64_t v16 = a1 + v15;
      uint64_t v17 = a2 + v15;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      uint64_t v19 = v10[10];
      uint64_t v20 = a1 + v19;
      uint64_t v21 = a2 + v19;
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      *(unsigned char *)(a1 + v10[11]) = *(unsigned char *)(a2 + v10[11]);
      goto LABEL_10;
    case 3u:
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
      v24(a1, a2, v23);
      uint64_t v25 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
      v24(a1 + v25[5], a2 + v25[5], v23);
      v24(a1 + v25[6], a2 + v25[6], v23);
      uint64_t v26 = v25[7];
      uint64_t v27 = a1 + v26;
      uint64_t v28 = a2 + v26;
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      uint64_t v7 = v25[8];
      goto LABEL_9;
    case 4u:
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
      uint64_t v31 = (int *)type metadata accessor for SupplementarySnippetModel();
      uint64_t v32 = v31[5];
      uint64_t v33 = a1 + v32;
      uint64_t v34 = a2 + v32;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      uint64_t v36 = v31[6];
      uint64_t v37 = a1 + v36;
      uint64_t v38 = a2 + v36;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
      uint64_t v7 = v31[7];
      goto LABEL_9;
    case 5u:
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
      uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16);
      v41(a1, a2, v40);
      uint64_t v42 = (int *)type metadata accessor for TipSnippetModel(0);
      uint64_t v43 = v42[5];
      uint64_t v44 = a1 + v43;
      uint64_t v45 = a2 + v43;
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
      uint64_t v47 = v42[6];
      uint64_t v48 = a1 + v47;
      uint64_t v49 = a2 + v47;
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
      v41(a1 + v42[7], a2 + v42[7], v40);
      uint64_t v51 = v42[8];
      uint64_t v52 = a1 + v51;
      uint64_t v53 = a2 + v51;
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
      uint64_t v7 = v42[9];
      goto LABEL_9;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for AttributionListSnippetModel();
LABEL_4:
      uint64_t v7 = *(int *)(v5 + 20);
LABEL_9:
      uint64_t v55 = a1 + v7;
      uint64_t v56 = a2 + v7;
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t assignWithCopy for TellMeGeneratedSnippetModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CC01FDC(a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v5 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_5;
      case 2u:
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
        v9(a1, a2, v8);
        uint64_t v10 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v9(a1 + v10[5], a2 + v10[5], v8);
        uint64_t v11 = v10[6];
        uint64_t v12 = a1 + v11;
        uint64_t v13 = a2 + v11;
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        v9(a1 + v10[7], a2 + v10[7], v8);
        v9(a1 + v10[8], a2 + v10[8], v8);
        uint64_t v15 = v10[9];
        uint64_t v16 = a1 + v15;
        uint64_t v17 = a2 + v15;
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
        uint64_t v19 = v10[10];
        uint64_t v20 = a1 + v19;
        uint64_t v21 = a2 + v19;
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
        *(unsigned char *)(a1 + v10[11]) = *(unsigned char *)(a2 + v10[11]);
        goto LABEL_11;
      case 3u:
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
        v24(a1, a2, v23);
        uint64_t v25 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v24(a1 + v25[5], a2 + v25[5], v23);
        v24(a1 + v25[6], a2 + v25[6], v23);
        uint64_t v26 = v25[7];
        uint64_t v27 = a1 + v26;
        uint64_t v28 = a2 + v26;
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
        uint64_t v7 = v25[8];
        goto LABEL_10;
      case 4u:
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
        uint64_t v31 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v32 = v31[5];
        uint64_t v33 = a1 + v32;
        uint64_t v34 = a2 + v32;
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        uint64_t v36 = v31[6];
        uint64_t v37 = a1 + v36;
        uint64_t v38 = a2 + v36;
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
        uint64_t v7 = v31[7];
        goto LABEL_10;
      case 5u:
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16);
        v41(a1, a2, v40);
        uint64_t v42 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v43 = v42[5];
        uint64_t v44 = a1 + v43;
        uint64_t v45 = a2 + v43;
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
        uint64_t v47 = v42[6];
        uint64_t v48 = a1 + v47;
        uint64_t v49 = a2 + v47;
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
        v41(a1 + v42[7], a2 + v42[7], v40);
        uint64_t v51 = v42[8];
        uint64_t v52 = a1 + v51;
        uint64_t v53 = a2 + v51;
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
        uint64_t v7 = v42[9];
        goto LABEL_10;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for AttributionListSnippetModel();
LABEL_5:
        uint64_t v7 = *(int *)(v5 + 20);
LABEL_10:
        uint64_t v55 = a1 + v7;
        uint64_t v56 = a2 + v7;
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t sub_24CC01FDC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v3();
  return a1;
}

uint64_t initializeWithTake for TellMeGeneratedSnippetModels(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v5 = type metadata accessor for LearnMoreSnippetModel();
      goto LABEL_4;
    case 2u:
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      uint64_t v10 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
      v9(a1 + v10[5], a2 + v10[5], v8);
      uint64_t v11 = v10[6];
      uint64_t v12 = a1 + v11;
      uint64_t v13 = a2 + v11;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      v9(a1 + v10[7], a2 + v10[7], v8);
      v9(a1 + v10[8], a2 + v10[8], v8);
      uint64_t v15 = v10[9];
      uint64_t v16 = a1 + v15;
      uint64_t v17 = a2 + v15;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      uint64_t v19 = v10[10];
      uint64_t v20 = a1 + v19;
      uint64_t v21 = a2 + v19;
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
      *(unsigned char *)(a1 + v10[11]) = *(unsigned char *)(a2 + v10[11]);
      goto LABEL_10;
    case 3u:
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32);
      v24(a1, a2, v23);
      uint64_t v25 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
      v24(a1 + v25[5], a2 + v25[5], v23);
      v24(a1 + v25[6], a2 + v25[6], v23);
      uint64_t v26 = v25[7];
      uint64_t v27 = a1 + v26;
      uint64_t v28 = a2 + v26;
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
      uint64_t v7 = v25[8];
      goto LABEL_9;
    case 4u:
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(a1, a2, v30);
      uint64_t v31 = (int *)type metadata accessor for SupplementarySnippetModel();
      uint64_t v32 = v31[5];
      uint64_t v33 = a1 + v32;
      uint64_t v34 = a2 + v32;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
      uint64_t v36 = v31[6];
      uint64_t v37 = a1 + v36;
      uint64_t v38 = a2 + v36;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
      uint64_t v7 = v31[7];
      goto LABEL_9;
    case 5u:
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
      uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 32);
      v41(a1, a2, v40);
      uint64_t v42 = (int *)type metadata accessor for TipSnippetModel(0);
      uint64_t v43 = v42[5];
      uint64_t v44 = a1 + v43;
      uint64_t v45 = a2 + v43;
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
      uint64_t v47 = v42[6];
      uint64_t v48 = a1 + v47;
      uint64_t v49 = a2 + v47;
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
      v41(a1 + v42[7], a2 + v42[7], v40);
      uint64_t v51 = v42[8];
      uint64_t v52 = a1 + v51;
      uint64_t v53 = a2 + v51;
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
      uint64_t v7 = v42[9];
      goto LABEL_9;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for AttributionListSnippetModel();
LABEL_4:
      uint64_t v7 = *(int *)(v5 + 20);
LABEL_9:
      uint64_t v55 = a1 + v7;
      uint64_t v56 = a2 + v7;
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 32))(v55, v56, v57);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t assignWithTake for TellMeGeneratedSnippetModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CC01FDC(a1, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        uint64_t v5 = type metadata accessor for LearnMoreSnippetModel();
        goto LABEL_5;
      case 2u:
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
        v9(a1, a2, v8);
        uint64_t v10 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v9(a1 + v10[5], a2 + v10[5], v8);
        uint64_t v11 = v10[6];
        uint64_t v12 = a1 + v11;
        uint64_t v13 = a2 + v11;
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
        v9(a1 + v10[7], a2 + v10[7], v8);
        v9(a1 + v10[8], a2 + v10[8], v8);
        uint64_t v15 = v10[9];
        uint64_t v16 = a1 + v15;
        uint64_t v17 = a2 + v15;
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        uint64_t v19 = v10[10];
        uint64_t v20 = a1 + v19;
        uint64_t v21 = a2 + v19;
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
        *(unsigned char *)(a1 + v10[11]) = *(unsigned char *)(a2 + v10[11]);
        goto LABEL_11;
      case 3u:
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
        uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32);
        v24(a1, a2, v23);
        uint64_t v25 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v24(a1 + v25[5], a2 + v25[5], v23);
        v24(a1 + v25[6], a2 + v25[6], v23);
        uint64_t v26 = v25[7];
        uint64_t v27 = a1 + v26;
        uint64_t v28 = a2 + v26;
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
        uint64_t v7 = v25[8];
        goto LABEL_10;
      case 4u:
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B90);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(a1, a2, v30);
        uint64_t v31 = (int *)type metadata accessor for SupplementarySnippetModel();
        uint64_t v32 = v31[5];
        uint64_t v33 = a1 + v32;
        uint64_t v34 = a2 + v32;
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
        uint64_t v36 = v31[6];
        uint64_t v37 = a1 + v36;
        uint64_t v38 = a2 + v36;
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B98);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
        uint64_t v7 = v31[7];
        goto LABEL_10;
      case 5u:
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA0);
        uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 32);
        v41(a1, a2, v40);
        uint64_t v42 = (int *)type metadata accessor for TipSnippetModel(0);
        uint64_t v43 = v42[5];
        uint64_t v44 = a1 + v43;
        uint64_t v45 = a2 + v43;
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BA8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
        uint64_t v47 = v42[6];
        uint64_t v48 = a1 + v47;
        uint64_t v49 = a2 + v47;
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
        v41(a1 + v42[7], a2 + v42[7], v40);
        uint64_t v51 = v42[8];
        uint64_t v52 = a1 + v51;
        uint64_t v53 = a2 + v51;
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
        uint64_t v7 = v42[9];
        goto LABEL_10;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B68);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for AttributionListSnippetModel();
LABEL_5:
        uint64_t v7 = *(int *)(v5 + 20);
LABEL_10:
        uint64_t v55 = a1 + v7;
        uint64_t v56 = a2 + v7;
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 32))(v55, v56, v57);
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t sub_24CC02CD4()
{
  uint64_t result = type metadata accessor for AttributionListSnippetModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for LearnMoreSnippetModel();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for ListStyleAnswerSnippetModel();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for SummarizedAnswerSnippetModel();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for SupplementarySnippetModel();
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for TipSnippetModel(319);
            if (v6 <= 0x3F)
            {
              swift_initEnumMetadataMultiPayload();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TellMeGeneratedSnippetModels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC02F54);
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

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.CodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.CodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.AttributionListCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.LearnMoreCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.SupplementaryCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys;
}

unsigned char *_s19DeviceExpertIntents28TellMeGeneratedSnippetModelsO25AttributionListCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CC0307CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.TipCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys;
}

unint64_t sub_24CC030B8()
{
  unint64_t result = qword_269819370;
  if (!qword_269819370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819370);
  }
  return result;
}

unint64_t sub_24CC03108()
{
  unint64_t result = qword_269819378;
  if (!qword_269819378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819378);
  }
  return result;
}

unint64_t sub_24CC03158()
{
  unint64_t result = qword_269819380;
  if (!qword_269819380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819380);
  }
  return result;
}

unint64_t sub_24CC031A8()
{
  unint64_t result = qword_269819388;
  if (!qword_269819388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819388);
  }
  return result;
}

unint64_t sub_24CC031F8()
{
  unint64_t result = qword_269819390;
  if (!qword_269819390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819390);
  }
  return result;
}

unint64_t sub_24CC03248()
{
  unint64_t result = qword_269819398;
  if (!qword_269819398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819398);
  }
  return result;
}

unint64_t sub_24CC03298()
{
  unint64_t result = qword_2698193A0;
  if (!qword_2698193A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193A0);
  }
  return result;
}

unint64_t sub_24CC032E8()
{
  unint64_t result = qword_2698193A8;
  if (!qword_2698193A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193A8);
  }
  return result;
}

unint64_t sub_24CC03338()
{
  unint64_t result = qword_2698193B0;
  if (!qword_2698193B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193B0);
  }
  return result;
}

unint64_t sub_24CC03388()
{
  unint64_t result = qword_2698193B8;
  if (!qword_2698193B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193B8);
  }
  return result;
}

unint64_t sub_24CC033D8()
{
  unint64_t result = qword_2698193C0;
  if (!qword_2698193C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193C0);
  }
  return result;
}

unint64_t sub_24CC03428()
{
  unint64_t result = qword_2698193C8;
  if (!qword_2698193C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193C8);
  }
  return result;
}

unint64_t sub_24CC03478()
{
  unint64_t result = qword_2698193D0;
  if (!qword_2698193D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193D0);
  }
  return result;
}

unint64_t sub_24CC034C8()
{
  unint64_t result = qword_2698193D8;
  if (!qword_2698193D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193D8);
  }
  return result;
}

unint64_t sub_24CC03518()
{
  unint64_t result = qword_2698193E0;
  if (!qword_2698193E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193E0);
  }
  return result;
}

unint64_t sub_24CC03568()
{
  unint64_t result = qword_2698193E8;
  if (!qword_2698193E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193E8);
  }
  return result;
}

unint64_t sub_24CC035B8()
{
  unint64_t result = qword_2698193F0;
  if (!qword_2698193F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193F0);
  }
  return result;
}

unint64_t sub_24CC03608()
{
  unint64_t result = qword_2698193F8;
  if (!qword_2698193F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698193F8);
  }
  return result;
}

unint64_t sub_24CC03658()
{
  unint64_t result = qword_269819400;
  if (!qword_269819400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819400);
  }
  return result;
}

unint64_t sub_24CC036A8()
{
  unint64_t result = qword_269819408;
  if (!qword_269819408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819408);
  }
  return result;
}

unint64_t sub_24CC036F8()
{
  unint64_t result = qword_269819410;
  if (!qword_269819410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819410);
  }
  return result;
}

uint64_t sub_24CC03748(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

uint64_t OUTLINED_FUNCTION_5_6()
{
  return sub_24CC24210();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_24CC24290();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_24CC24290();
}

void OUTLINED_FUNCTION_10_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_11_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_24CC24270();
}

uint64_t LinkUsedEvent.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LinkUsedEvent.sessionIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LinkUsedEvent.clusterIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LinkUsedEvent.linkUsed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LinkUsedEvent(0) + 28);
  return sub_24CC039E0(v3, a1);
}

uint64_t type metadata accessor for LinkUsedEvent(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819418);
}

uint64_t sub_24CC039E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LinkUsedEvent.LinkType(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819428);
}

void __swiftcall LinkUsedEvent.AppIntentConfiguration.init(bundleID:name:param:)(DeviceExpertIntents::LinkUsedEvent::AppIntentConfiguration *__return_ptr retstr, Swift::String bundleID, Swift::String name, Swift::String_optional param)
{
  retstr->bundleID = bundleID;
  retstr->name = name;
  retstr->param = param;
}

uint64_t sub_24CC03A74()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CC26DF0;
  *(void *)(inited + 32) = 0x68746C616568;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 0x7373656E746966;
  *(void *)(inited + 56) = 0xE700000000000000;
  *(void *)(inited + 64) = 0x7065656C73;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x646F69726570;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = 0x6C61636964656DLL;
  *(void *)(inited + 104) = 0xE700000000000000;
  sub_24CBE58E0();
  swift_bridgeObjectRetain_n();
  for (uint64_t i = 0; i != 80; i += 16)
  {
    uint64_t v2 = sub_24CC240E0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_24CBEF3E0();
  return v2;
}

uint64_t LinkUsedEvent.init(sessionIdentifier:clusterIdentifier:linkUsed:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = 0xD000000000000016;
  a6[1] = 0x800000024CC28B20;
  a6[2] = a1;
  a6[3] = a2;
  a6[4] = a3;
  a6[5] = a4;
  uint64_t v7 = (uint64_t)a6 + *(int *)(type metadata accessor for LinkUsedEvent(0) + 28);
  return sub_24CC03C64(a5, v7);
}

uint64_t sub_24CC03C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t LinkUsedEvent.dictionaryRepresentation.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CC23380();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LinkUsedEvent.LinkType(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24CBFBEC8();
  uint64_t v9 = sub_24CC23E50();
  uint64_t v10 = sub_24CC23EC0();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v28 = v9;
  sub_24CC04170(v10, 0x5F72657473756C63, 0xEA00000000006469);
  uint64_t v11 = v28;
  uint64_t v34 = v28;
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for LinkUsedEvent(0);
  sub_24CC039E0(v1 + *(int *)(v12 + 28), (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_24CC23340();
    uint64_t v13 = sub_24CC23EC0();
    swift_bridgeObjectRelease();
    uint64_t v14 = v34;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = v14;
    sub_24CC04170(v13, 0xD000000000000010, 0x800000024CC28B40);
    OUTLINED_FUNCTION_1_11();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v16 = *v8;
    uint64_t v15 = v8[1];
    uint64_t v18 = v8[2];
    uint64_t v17 = v8[3];
    uint64_t v20 = v8[4];
    uint64_t v19 = v8[5];
    uint64_t v21 = sub_24CC23EC0();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = v11;
    sub_24CC04170(v21, 0xD000000000000010, 0x800000024CC28B60);
    OUTLINED_FUNCTION_1_11();
    uint64_t v28 = v16;
    uint64_t v29 = v15;
    uint64_t v30 = v18;
    uint64_t v31 = v17;
    uint64_t v32 = v20;
    uint64_t v33 = v19;
    sub_24CC03A74();
    sub_24CC23EC0();
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = OUTLINED_FUNCTION_0_8();
    sub_24CC04170(v22, v23 & 0xFFFFFFFFFFFFLL | 0x6E5F000000000000, 0xEB00000000656D61);
    uint64_t v34 = v28;
    swift_bridgeObjectRelease();
    if (v19)
    {
      swift_bridgeObjectRetain();
      sub_24CC23EC0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v24 = OUTLINED_FUNCTION_0_8();
      sub_24CC04170(v24, v25 & 0xFFFFFFFFFFFFLL | 0x705F000000000000, 0xEC0000006D617261);
      OUTLINED_FUNCTION_1_11();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v34;
}

uint64_t sub_24CC04064(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CBE5D00(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819438);
  sub_24CC241A0();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  sub_24CBFBEC8();
  sub_24CC241B0();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_24CC04170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_24CBE5D00(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819438);
  if ((sub_24CC241A0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_24CBE5D00(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_24CC24320();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_24CC05344(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for LinkUsedEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    unint64_t v9 = (uint64_t *)((char *)a2 + v8);
    char v10 = (uint64_t *)((char *)a1 + v8);
    a1[4] = a2[4];
    a1[5] = v7;
    type metadata accessor for LinkUsedEvent.LinkType(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_24CC23380();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v9, v11);
    }
    else
    {
      uint64_t v13 = v9[1];
      *char v10 = *v9;
      v10[1] = v13;
      uint64_t v14 = v9[3];
      v10[2] = v9[2];
      v10[3] = v14;
      uint64_t v15 = v9[4];
      uint64_t v16 = v9[5];
      void v10[4] = v15;
      v10[5] = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for LinkUsedEvent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  type metadata accessor for LinkUsedEvent.LinkType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24CC23380();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for LinkUsedEvent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)((char *)a2 + v7);
  unint64_t v9 = (void *)((char *)a1 + v7);
  a1[4] = a2[4];
  a1[5] = v6;
  type metadata accessor for LinkUsedEvent.LinkType(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_24CC23380();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v9, v8, v10);
  }
  else
  {
    uint64_t v11 = v8[1];
    *unint64_t v9 = *v8;
    v9[1] = v11;
    uint64_t v12 = v8[3];
    v9[2] = v8[2];
    v9[3] = v12;
    uint64_t v13 = v8[4];
    uint64_t v14 = v8[5];
    v9[4] = v13;
    v9[5] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for LinkUsedEvent(void *a1, void *a2, uint64_t a3)
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
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_24CC04764((uint64_t)a1 + v6);
    type metadata accessor for LinkUsedEvent.LinkType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_24CC23380();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      v7[1] = v8[1];
      v7[2] = v8[2];
      v7[3] = v8[3];
      v7[4] = v8[4];
      v7[5] = v8[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CC04764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for LinkUsedEvent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for LinkUsedEvent.LinkType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_24CC23380();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LinkUsedEvent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    sub_24CC04764((uint64_t)a1 + v9);
    uint64_t v12 = type metadata accessor for LinkUsedEvent.LinkType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_24CC23380();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkUsedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC049BC);
}

uint64_t sub_24CC049BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for LinkUsedEvent.LinkType(0);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LinkUsedEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC04A58);
}

uint64_t sub_24CC04A58(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for LinkUsedEvent.LinkType(0);
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_24CC04AD8()
{
  uint64_t result = type metadata accessor for LinkUsedEvent.LinkType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LinkUsedEvent.LinkType(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CC23380();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[3];
      a1[2] = a2[2];
      a1[3] = v9;
      uint64_t v10 = a2[4];
      uint64_t v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LinkUsedEvent.LinkType(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24CC23380();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for LinkUsedEvent.LinkType(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24CC23380();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[4];
    uint64_t v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for LinkUsedEvent.LinkType(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24CC04764((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_24CC23380();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LinkUsedEvent.LinkType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC23380();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LinkUsedEvent.LinkType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CC04764((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CC23380();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24CC0507C()
{
  uint64_t result = sub_24CC23380();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t destroy for LinkUsedEvent.AppIntentConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LinkUsedEvent.AppIntentConfiguration(void *a1, void *a2)
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

void *assignWithCopy for LinkUsedEvent.AppIntentConfiguration(void *a1, void *a2)
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

void *assignWithTake for LinkUsedEvent.AppIntentConfiguration(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for LinkUsedEvent.AppIntentConfiguration(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for LinkUsedEvent.AppIntentConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LinkUsedEvent.AppIntentConfiguration()
{
  return &type metadata for LinkUsedEvent.AppIntentConfiguration;
}

unint64_t sub_24CC05344(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  *(void *)(v2 - 120) = v0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  *(void *)(v0 - 72) = *(void *)(v0 - 120);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC053C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24CC053DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819458);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for AttributionItem();
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v31 = (uint64_t)&v28 - v11;
  uint64_t v12 = sub_24CC234B0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a1 + 16);
  if (!v17) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v18 = v14 + 16;
  uint64_t v20 = a1 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
  uint64_t v33 = *(void *)(v18 + 56);
  uint64_t v34 = v19;
  uint64_t v35 = v18;
  uint64_t v21 = (void (**)(char *, uint64_t))(v18 - 8);
  swift_retain();
  uint64_t v28 = a1;
  swift_bridgeObjectRetain();
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t v29 = v10;
  uint64_t v30 = v5;
  do
  {
    v34(v16, v20, v12);
    sub_24CC056C4(v4);
    (*v21)(v16, v12);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_24CBF475C((uint64_t)v4, &qword_269819458);
    }
    else
    {
      uint64_t v23 = v31;
      sub_24CBF1ED8((uint64_t)v4, v31);
      sub_24CBF1ED8(v23, (uint64_t)v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v22 = sub_24CBF175C(0, *(void *)(v22 + 16) + 1, 1, v22);
      }
      unint64_t v25 = *(void *)(v22 + 16);
      unint64_t v24 = *(void *)(v22 + 24);
      if (v25 >= v24 >> 1) {
        uint64_t v22 = sub_24CBF175C(v24 > 1, v25 + 1, 1, v22);
      }
      *(void *)(v22 + 16) = v25 + 1;
      uint64_t v26 = v22
          + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))
          + *(void *)(v32 + 72) * v25;
      uint64_t v10 = v29;
      sub_24CBF1ED8((uint64_t)v29, v26);
      uint64_t v5 = v30;
    }
    v20 += v33;
    --v17;
  }
  while (v17);
  swift_release();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_24CC056C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v27 = a1;
  uint64_t v3 = sub_24CC235C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC23640();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819460);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v26 - v15;
  sub_24CC234A0();
  uint64_t v17 = sub_24CC23490();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) != 1)
  {
    uint64_t v26 = v2;
    sub_24CBE726C((uint64_t)v16, (uint64_t)v14, &qword_269819460);
    uint64_t v23 = *(void *)(v17 - 8);
    int v24 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v14, v17);
    if (v24 == *MEMORY[0x263F5CA70])
    {
      (*(void (**)(char *, uint64_t))(v23 + 96))(v14, v17);
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      sub_24CC062A0(v27);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return sub_24CBF475C((uint64_t)v16, &qword_269819460);
    }
    if (v24 == *MEMORY[0x263F5CA78])
    {
      (*(void (**)(char *, uint64_t))(v23 + 96))(v14, v17);
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      sub_24CC05B64((uint64_t)v10, v27);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      return sub_24CBF475C((uint64_t)v16, &qword_269819460);
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v17);
  }
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24CC23DA0();
  __swift_project_value_buffer(v18, (uint64_t)qword_2698195F0);
  uint64_t v19 = sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_24CBD5000, v19, v20, "Unrecognized attribution type", v21, 2u);
    MEMORY[0x25330D070](v21, -1, -1);
  }

  uint64_t v22 = type metadata accessor for AttributionItem();
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 1, 1, v22);
  return sub_24CBF475C((uint64_t)v16, &qword_269819460);
}

uint64_t sub_24CC05ADC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24CC05B0C()
{
  sub_24CC05ADC();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for AttributionItemFactory()
{
  return self;
}

uint64_t sub_24CC05B64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v71 = a2;
  uint64_t v2 = sub_24CC238A0();
  uint64_t v58 = *(void *)(v2 - 8);
  unint64_t v59 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v57 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v70 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_24CC238E0();
  uint64_t v67 = *(void *)(v69 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v69);
  uint64_t v66 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v65 = (char *)&v55 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v68 = (char *)&v55 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819468);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CC23400();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v15 = sub_24CC232B0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24CC23EB0();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v20 = sub_24CC232F0();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CC23EA0();
  if (qword_269818A90 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v15, (uint64_t)qword_26981FF90);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v24, v15);
  sub_24CC233F0();
  sub_24CC23300();
  id v25 = sub_24CBE51D0((uint64_t)v23);
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  uint64_t v28 = _s19DeviceExpertIntents6ActionV5labelSSvg_0();
  uint64_t v30 = v29;
  sub_24CC235A0();
  sub_24CC23120();
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_24CC23140();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v31);
  uint64_t v62 = v27;
  uint64_t v63 = (uint64_t)v25;
  uint64_t v60 = v30;
  uint64_t v61 = v28;
  if (EnumTagSinglePayload == 1)
  {
    sub_24CBF475C((uint64_t)v13, &qword_269819468);
  }
  else
  {
    uint64_t v33 = sub_24CC23110();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(*(void *)(v31 - 8) + 8))(v13, v31);
    if (v35)
    {
      uint64_t v56 = v33;
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v56 = 0;
  unint64_t v35 = 0xE000000000000000;
LABEL_8:
  uint64_t v37 = v58;
  unint64_t v36 = v59;
  uint64_t v38 = v57;
  unint64_t v59 = v35;
  uint64_t v58 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
  uint64_t v40 = v39;
  if (qword_269818AA0 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_24CC23380();
  __swift_project_value_buffer(v41, (uint64_t)qword_269819440);
  uint64_t v42 = v70;
  __swift_storeEnumTagSinglePayload(v70, 1, 1, v41);
  uint64_t v43 = v65;
  sub_24CC238C0();
  sub_24CBF475C(v42, &qword_269818D50);
  sub_24CC23890();
  uint64_t v44 = v66;
  sub_24CC238B0();
  (*(void (**)(char *, unint64_t))(v37 + 8))(v38, v36);
  uint64_t v45 = v68;
  sub_24CC23880();
  uint64_t v46 = v67;
  uint64_t v47 = *(void (**)(char *, uint64_t))(v67 + 8);
  uint64_t v48 = v69;
  v47(v44, v69);
  v47(v43, v48);
  sub_24CC235A0();
  sub_24CC23370();
  swift_bridgeObjectRelease();
  uint64_t v49 = v71;
  *uint64_t v71 = v58;
  v49[1] = v40;
  uint64_t v50 = v62;
  v49[2] = v63;
  v49[3] = v50;
  uint64_t v51 = v60;
  v49[4] = v61;
  v49[5] = v51;
  unint64_t v52 = v59;
  v49[6] = v56;
  v49[7] = v52;
  uint64_t v53 = type metadata accessor for AttributionItem();
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)v49 + *(int *)(v53 + 32), v45, v48);
  sub_24CBEFDEC(v42);
  sub_24CBF1F3C();
  sub_24CC23830();
  sub_24CBF475C(v42, &qword_269818D50);
  v47(v45, v48);
  return __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v53);
}

uint64_t sub_24CC062A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v2 = sub_24CC238A0();
  uint64_t v62 = *(void *)(v2 - 8);
  uint64_t v63 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v61 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_24CC23380();
  uint64_t v58 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v57 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819468);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v64 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v59 = (char *)&v56 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v56 - v13;
  uint64_t v67 = sub_24CC238E0();
  uint64_t v70 = *(void *)(v67 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v67);
  uint64_t v60 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v66 = (char *)&v56 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v71 = (char *)&v56 - v19;
  uint64_t v20 = (void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v21 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
  char v23 = sub_24CC162B8(v21, v22);
  swift_bridgeObjectRelease();
  sub_24CC23580();
  sub_24CC23120();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_24CC23140();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v24) == 1)
  {
    sub_24CBF475C((uint64_t)v7, &qword_269819468);
  }
  else
  {
    sub_24CC23130();
    (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v7, v24);
  }
  uint64_t v69 = v14;
  if (v23)
  {
    __swift_project_boxed_opaque_existential_1(v20, *(void *)(v1 + 40));
    _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
    sub_24CC235A0();
    uint64_t v56 = v1;
    uint64_t v25 = (uint64_t)v59;
    sub_24CC163F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = v65;
    if (__swift_getEnumTagSinglePayload(v25, 1, v65) != 1)
    {
      unint64_t v36 = v57;
      uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 32);
      v37(v57, v25, v26);
      __swift_project_boxed_opaque_existential_1(v20, *(void *)(v56 + 40));
      swift_bridgeObjectRetain();
      sub_24CC238D0();
      swift_bridgeObjectRelease();
      v37(v14, (uint64_t)v36, v26);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v26);
      uint64_t v34 = v64;
      uint64_t v28 = v66;
      uint64_t v35 = v67;
      goto LABEL_12;
    }
    sub_24CBF475C(v25, &qword_269818D50);
    uint64_t v27 = v70;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = v70;
    uint64_t v26 = v65;
  }
  uint64_t v28 = v66;
  uint64_t v29 = v67;
  if (qword_269818AA0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v26, (uint64_t)qword_269819440);
  uint64_t v30 = v64;
  __swift_storeEnumTagSinglePayload(v64, 1, 1, v26);
  sub_24CC238C0();
  sub_24CBF475C(v30, &qword_269818D50);
  uint64_t v31 = v61;
  sub_24CC23890();
  uint64_t v32 = v60;
  sub_24CC238B0();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v31, v63);
  sub_24CC23880();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  v33(v32, v29);
  v33(v28, v29);
  sub_24CC23580();
  uint64_t v14 = v69;
  sub_24CC23370();
  swift_bridgeObjectRelease();
  uint64_t v34 = v30;
  uint64_t v35 = v29;
LABEL_12:
  uint64_t v38 = sub_24CC235A0();
  uint64_t v66 = v39;
  uint64_t v67 = v38;
  uint64_t v40 = sub_24CC23570();
  uint64_t v64 = v41;
  uint64_t v65 = v40;
  uint64_t v42 = _s19DeviceExpertIntents6ActionV5labelSSvg_0();
  uint64_t v62 = v43;
  uint64_t v63 = v42;
  uint64_t v44 = sub_24CC23570();
  uint64_t v46 = v45;
  uint64_t v47 = v70;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  v48(v28, v71, v35);
  sub_24CBE726C((uint64_t)v14, v34, &qword_269818D50);
  uint64_t v49 = v68;
  uint64_t v50 = v66;
  *uint64_t v68 = v67;
  v49[1] = (uint64_t)v50;
  uint64_t v51 = v64;
  v49[2] = v65;
  v49[3] = v51;
  uint64_t v52 = v62;
  v49[4] = v63;
  v49[5] = v52;
  v49[6] = v44;
  v49[7] = v46;
  uint64_t v53 = type metadata accessor for AttributionItem();
  v48((char *)v49 + *(int *)(v53 + 32), v28, v35);
  sub_24CBEFDEC(v34);
  sub_24CBF1F3C();
  sub_24CC23830();
  sub_24CBF475C(v34, &qword_269818D50);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v47 + 8);
  v54(v28, v35);
  sub_24CBF475C((uint64_t)v69, &qword_269818D50);
  v54(v71, v35);
  return __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v53);
}

uint64_t sub_24CC069F0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CC23380();
  __swift_allocate_value_buffer(v3, qword_269819440);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_269819440);
  sub_24CC23370();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v3 - 8) + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall CoreAnalyticsLogger.sendEvent(_:payload:)(Swift::String _, Swift::OpaquePointer payload)
{
  uint64_t v2 = (void *)sub_24CC23EC0();
  sub_24CBFBEC8();
  id v3 = (id)sub_24CC23E30();
  AnalyticsSendEvent();
}

void sub_24CC06B7C(uint64_t a1, uint64_t a2, Swift::OpaquePointer a3)
{
}

uint64_t sub_24CC06B94()
{
  type metadata accessor for AnalyticsManager();
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = &type metadata for CoreAnalyticsLogger;
  *(void *)(result + 48) = &protocol witness table for CoreAnalyticsLogger;
  qword_269819470 = result;
  return result;
}

uint64_t *AnalyticsManager.__allocating_init(backend:)(uint64_t a1)
{
  swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = OUTLINED_FUNCTION_1_12(v3, v8);
  v5(v4);
  uint64_t v6 = OUTLINED_FUNCTION_2_10();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t static AnalyticsManager.shared.getter()
{
  if (qword_269818AA8 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t *AnalyticsManager.init(backend:)(uint64_t a1)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = OUTLINED_FUNCTION_1_12(v3, v8);
  v5(v4);
  uint64_t v6 = OUTLINED_FUNCTION_2_10();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t AnalyticsManager.send(_:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_24CC06E90((uint64_t)v4, v1, v2, v3);
}

uint64_t sub_24CC06DAC()
{
  return 0x5F6E6F6973736573;
}

uint64_t AnalyticsManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t AnalyticsManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t *sub_24CC06E20(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  a2[5] = a3;
  a2[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  return a2;
}

uint64_t sub_24CC06E90(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  v29[3] = a3;
  v29[4] = a4;
  uint64_t v9 = v8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  if (static DeviceExpertPreferences.shouldSendAnalytics.getter())
  {
    sub_24CC07268((uint64_t)boxed_opaque_existential_1, v9, a3, a4);
    if (qword_269818AB0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24CC23DA0();
    __swift_project_value_buffer(v11, (uint64_t)qword_2698195C0);
    sub_24CBEF25C((uint64_t)v29, (uint64_t)v28);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_24CC23D80();
    os_log_type_t v13 = sub_24CC24090();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = v26;
      *(_DWORD *)uint64_t v14 = 136315394;
      __swift_project_boxed_opaque_existential_1(v28, v28[3]);
      os_log_type_t type = v13;
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
      sub_24CC12DF0(v15, v16, &v27);
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      *(_WORD *)(v14 + 12) = 2080;
      sub_24CBFBEC8();
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_24CC23E40();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_24CC12DF0(v17, v19, &v27);
      sub_24CC240C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CBD5000, v12, type, "Sending analytics event \"%s\" with payload %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25330D070](v26, -1, -1);
      MEMORY[0x25330D070](v14, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v20 = a2 + 2;
    uint64_t v22 = a2[5];
    uint64_t v21 = a2[6];
    __swift_project_boxed_opaque_existential_1(v20, v22);
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
    (*(void (**)(uint64_t))(v21 + 8))(v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

ValueMetadata *type metadata accessor for CoreAnalyticsLogger()
{
  return &type metadata for CoreAnalyticsLogger;
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return self;
}

uint64_t method lookup function for AnalyticsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnalyticsManager);
}

uint64_t dispatch thunk of AnalyticsManager.__allocating_init(backend:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_24CC07268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  uint64_t v7 = sub_24CC23EC0();
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_24CC04170(v7, 0x5F6E6F6973736573, 0xEA00000000006469);
  swift_bridgeObjectRelease();
  return v6;
}

char *OUTLINED_FUNCTION_1_12@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t *OUTLINED_FUNCTION_2_10()
{
  return sub_24CC06E20(v3, v0, v1, v2);
}

uint64_t sub_24CC073A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v88 = a4;
  uint64_t v89 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_16_3(v7, v72[0]);
  uint64_t v8 = type metadata accessor for TextRun(0);
  uint64_t v91 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_24CC23420();
  OUTLINED_FUNCTION_0();
  uint64_t v93 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_4();
  uint64_t v92 = v15;
  uint64_t v86 = sub_24CC237B0();
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_20_0();
  uint64_t v84 = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v83 = (char *)v72 - v20;
  uint64_t v21 = sub_24CC23740();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)v72 - v26;
  uint64_t v82 = *a3;
  uint64_t v81 = a3[1];
  uint64_t v80 = a3[2];
  uint64_t v79 = a3[3];
  sub_24CC23750();
  sub_24CC23410();
  uint64_t v28 = *(void (**)(void))(v23 + 8);
  OUTLINED_FUNCTION_25_0();
  v28();
  Array<A>.asTextRuns()();
  uint64_t v78 = v29;
  swift_bridgeObjectRelease();
  sub_24CC23750();
  sub_24CC236E0();
  uint64_t v74 = v27;
  OUTLINED_FUNCTION_25_0();
  v28();
  Array<A>.asTextRuns()();
  uint64_t v77 = v30;
  swift_bridgeObjectRelease();
  sub_24CC23750();
  uint64_t v31 = sub_24CC23700();
  uint64_t v76 = v21;
  uint64_t v75 = v23 + 8;
  uint64_t v73 = v28;
  OUTLINED_FUNCTION_25_0();
  v28();
  int64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    v72[2] = a1;
    *(void *)&long long v102 = MEMORY[0x263F8EE78];
    sub_24CC21174(0, v32, 0);
    uint64_t v33 = 0;
    uint64_t v97 = *(void (**)(uint64_t, unint64_t, uint64_t))(v93 + 16);
    unint64_t v34 = (*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
    v72[1] = v31;
    unint64_t v96 = v31 + v34;
    uint64_t v35 = *(void *)(v93 + 72);
    uint64_t v94 = v93 + 8;
    uint64_t v95 = v35;
    uint64_t v36 = v92;
    uint64_t v90 = v12;
    v93 += 16;
    int64_t v98 = v32;
    do
    {
      uint64_t v100 = v33;
      v97(v36, v96 + v95 * v33, v12);
      uint64_t v37 = sub_24CC23410();
      uint64_t v38 = *(void *)(v37 + 16);
      if (v38)
      {
        uint64_t v105 = MEMORY[0x263F8EE78];
        sub_24CC20180();
        uint64_t v39 = v105;
        uint64_t v101 = sub_24CC23480();
        OUTLINED_FUNCTION_32();
        uint64_t v41 = *(void (**)(uint64_t, unint64_t, uint64_t))(v40 + 16);
        unint64_t v42 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
        uint64_t v99 = v37;
        unint64_t v43 = v37 + v42;
        uint64_t v44 = *(void *)(v40 + 72);
        uint64_t v45 = v91;
        do
        {
          v41(v11, v43, v101);
          uint64_t v105 = v39;
          uint64_t v46 = v11;
          unint64_t v47 = *(void *)(v39 + 16);
          if (v47 >= *(void *)(v39 + 24) >> 1)
          {
            sub_24CC20180();
            uint64_t v45 = v91;
            uint64_t v39 = v105;
          }
          *(void *)(v39 + 16) = v47 + 1;
          sub_24CC0C39C(v46, v39+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v47);
          v43 += v44;
          --v38;
          uint64_t v11 = v46;
        }
        while (v38);
        swift_bridgeObjectRelease();
        uint64_t v12 = v90;
        uint64_t v36 = v92;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v39 = MEMORY[0x263F8EE78];
      }
      OUTLINED_FUNCTION_3_2();
      v48();
      uint64_t v49 = v102;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      int64_t v51 = v98;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24CC21174(0, *(void *)(v49 + 16) + 1, 1);
        uint64_t v49 = v102;
      }
      uint64_t v52 = v100;
      unint64_t v54 = *(void *)(v49 + 16);
      unint64_t v53 = *(void *)(v49 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_24CC21174((char *)(v53 > 1), v54 + 1, 1);
        uint64_t v52 = v100;
        uint64_t v49 = v102;
      }
      uint64_t v33 = v52 + 1;
      *(void *)(v49 + 16) = v54 + 1;
      *(void *)(v49 + 8 * v54 + 32) = v39;
    }
    while (v33 != v51);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v49 = MEMORY[0x263F8EE78];
  }
  uint64_t v55 = v74;
  sub_24CC23750();
  _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV10parametersSaySSGSgvg_0();
  uint64_t v56 = v76;
  uint64_t v57 = v73;
  ((void (*)(char *, uint64_t))v73)(v55, v76);
  Array<A>.asTextRuns()();
  uint64_t v59 = v58;
  swift_bridgeObjectRelease();
  sub_24CC23430();
  Array<A>.asTextRuns()();
  uint64_t v61 = v60;
  swift_bridgeObjectRelease();
  sub_24CC23750();
  uint64_t v62 = v83;
  sub_24CC23730();
  ((void (*)(char *, uint64_t))v57)(v55, v56);
  uint64_t v63 = v85;
  uint64_t v64 = v84;
  uint64_t v65 = v86;
  (*(void (**)(uint64_t, void, uint64_t))(v85 + 104))(v84, *MEMORY[0x263F5CB10], v86);
  sub_24CC0C400((uint64_t)&unk_2698195B8);
  sub_24CC23F80();
  sub_24CC23F80();
  BOOL v66 = (void)v102 != v105;
  uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
  v67(v64, v65);
  v67((uint64_t)v62, v65);
  LOBYTE(v105) = v66;
  uint64_t v68 = v89;
  uint64_t v69 = v87;
  sub_24CBF92C8(v89, v87);
  *(void *)&long long v102 = v82;
  *((void *)&v102 + 1) = v81;
  uint64_t v103 = v80;
  uint64_t v104 = v79;
  ListStyleAnswerSnippetModel.init(title:intro:steps:outro:disclaimer:listStyle:attributionModel:context:)(v78, v77, v49, v59, v61, (char *)&v105, v69, &v102, v88);
  sub_24CBF9330(v68);
  sub_24CC237D0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  return v70();
}

BOOL static ListStyleAnswerSnippetModel.ListStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ListStyleAnswerSnippetModel.title.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC07BB0()
{
  return ListStyleAnswerSnippetModel.title.setter();
}

uint64_t ListStyleAnswerSnippetModel.title.setter()
{
  return OUTLINED_FUNCTION_21_1();
}

uint64_t (*ListStyleAnswerSnippetModel.title.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  v1[4] = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.intro.getter()
{
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_19_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t type metadata accessor for ListStyleAnswerSnippetModel()
{
  uint64_t result = qword_269819548;
  if (!qword_269819548) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC07CF8()
{
  return ListStyleAnswerSnippetModel.intro.setter();
}

uint64_t ListStyleAnswerSnippetModel.intro.setter()
{
  return OUTLINED_FUNCTION_21_1();
}

uint64_t (*ListStyleAnswerSnippetModel.intro.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  OUTLINED_FUNCTION_19_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.steps.getter()
{
  type metadata accessor for ListStyleAnswerSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC07E08()
{
  return ListStyleAnswerSnippetModel.steps.setter();
}

uint64_t ListStyleAnswerSnippetModel.steps.setter()
{
  return OUTLINED_FUNCTION_21_1();
}

uint64_t (*ListStyleAnswerSnippetModel.steps.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.outro.getter()
{
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC07F1C()
{
  return ListStyleAnswerSnippetModel.outro.setter();
}

uint64_t ListStyleAnswerSnippetModel.outro.setter()
{
  return OUTLINED_FUNCTION_21_1();
}

uint64_t (*ListStyleAnswerSnippetModel.outro.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.disclaimer.getter()
{
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_24_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC08028()
{
  return ListStyleAnswerSnippetModel.disclaimer.setter();
}

uint64_t ListStyleAnswerSnippetModel.disclaimer.setter()
{
  return OUTLINED_FUNCTION_21_1();
}

uint64_t (*ListStyleAnswerSnippetModel.disclaimer.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  OUTLINED_FUNCTION_24_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.attributionModel.getter()
{
  return sub_24CC23910();
}

uint64_t sub_24CC08130(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBF92C8(a1, (uint64_t)v4);
  return ListStyleAnswerSnippetModel.attributionModel.setter((uint64_t)v4);
}

uint64_t ListStyleAnswerSnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_1();
  sub_24CBF92C8(a1, v4 - v3);
  type metadata accessor for ListStyleAnswerSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  sub_24CC23920();
  return sub_24CBF9330(a1);
}

uint64_t (*ListStyleAnswerSnippetModel.attributionModel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CC08308@<D0>(uint64_t a1@<X8>)
{
  ListStyleAnswerSnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CC0834C()
{
  return ListStyleAnswerSnippetModel.context.setter();
}

uint64_t ListStyleAnswerSnippetModel.context.setter()
{
  return sub_24CC23920();
}

uint64_t (*ListStyleAnswerSnippetModel.context.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_5((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t ListStyleAnswerSnippetModel.listStyle.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ListStyleAnswerSnippetModel();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t ListStyleAnswerSnippetModel.listStyle.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for ListStyleAnswerSnippetModel();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*ListStyleAnswerSnippetModel.listStyle.modify())()
{
  return nullsub_1;
}

uint64_t ListStyleAnswerSnippetModel.ListStyle.hash(into:)()
{
  return sub_24CC24340();
}

uint64_t sub_24CC08530(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6465726564726FLL && a2 == 0xE700000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726564726F6E75 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CC08620(char a1)
{
  if (a1) {
    return 0x65726564726F6E75;
  }
  else {
    return 0x6465726564726FLL;
  }
}

uint64_t sub_24CC0865C()
{
  return 1;
}

uint64_t sub_24CC0867C()
{
  return 0;
}

uint64_t sub_24CC08688()
{
  return sub_24CC08620(*v0);
}

uint64_t sub_24CC08690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CC08530(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CC086B8(uint64_t a1)
{
  unint64_t v2 = sub_24CC08A4C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC086F4(uint64_t a1)
{
  unint64_t v2 = sub_24CC08A4C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CC08734@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CC0865C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CC08760(uint64_t a1)
{
  unint64_t v2 = sub_24CC08AE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC0879C(uint64_t a1)
{
  unint64_t v2 = sub_24CC08AE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CC087D8(uint64_t a1)
{
  unint64_t v2 = sub_24CC08A98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC08814(uint64_t a1)
{
  unint64_t v2 = sub_24CC08A98();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ListStyleAnswerSnippetModel.ListStyle.encode(to:)()
{
  OUTLINED_FUNCTION_23_1();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819478);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_0_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819480);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819488);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10 - v9;
  char v12 = *v0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24CC08A4C();
  sub_24CC24370();
  uint64_t v13 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  if (v12) {
    sub_24CC08A98();
  }
  else {
    sub_24CC08AE4();
  }
  sub_24CC24290();
  OUTLINED_FUNCTION_3_2();
  v15(v14);
  (*v13)(v11, v5);
  OUTLINED_FUNCTION_20_1();
}

unint64_t sub_24CC08A4C()
{
  unint64_t result = qword_269819490;
  if (!qword_269819490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819490);
  }
  return result;
}

unint64_t sub_24CC08A98()
{
  unint64_t result = qword_269819498;
  if (!qword_269819498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819498);
  }
  return result;
}

unint64_t sub_24CC08AE4()
{
  unint64_t result = qword_2698194A0;
  if (!qword_2698194A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698194A0);
  }
  return result;
}

uint64_t ListStyleAnswerSnippetModel.ListStyle.hashValue.getter()
{
  return sub_24CC24350();
}

void ListStyleAnswerSnippetModel.ListStyle.init(from:)()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v3 = v2;
  uint64_t v22 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698194A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698194B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698194B8);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24CC08A4C();
  sub_24CC24360();
  if (v0) {
    goto LABEL_6;
  }
  uint64_t v24 = (uint64_t)v3;
  uint64_t v10 = sub_24CC24280();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11
    || (char v12 = *(unsigned char *)(v10 + 32),
        sub_24CC03744(1, v11, v10, v10 + 32, 0, (2 * v11) | 1),
        uint64_t v14 = v13,
        unint64_t v16 = v15,
        swift_bridgeObjectRelease(),
        v14 != v16 >> 1))
  {
    uint64_t v17 = sub_24CC24130();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269819330);
    *uint64_t v19 = &type metadata for ListStyleAnswerSnippetModel.ListStyle;
    sub_24CC24220();
    sub_24CC24120();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_3_2();
    v20();
    uint64_t v3 = (void *)v24;
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    goto LABEL_7;
  }
  sub_24CC08A98();
  sub_24CC24210();
  OUTLINED_FUNCTION_3_2();
  v21();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v1, v7);
  *uint64_t v22 = v12;
  __swift_destroy_boxed_opaque_existential_1(v24);
LABEL_7:
  OUTLINED_FUNCTION_20_1();
}

void sub_24CC08FA0()
{
}

void sub_24CC08FB8()
{
}

uint64_t ListStyleAnswerSnippetModel.init(title:intro:steps:outro:disclaimer:listStyle:attributionModel:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, long long *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v34 = a5;
  uint64_t v35 = a7;
  uint64_t v33 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_1();
  uint64_t v18 = v16 - v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v32 - v20;
  char v22 = *a6;
  long long v38 = *a8;
  uint64_t v23 = *((void *)a8 + 2);
  uint64_t v36 = *((void *)a8 + 3);
  uint64_t v37 = v23;
  uint64_t v24 = type metadata accessor for ListStyleAnswerSnippetModel();
  type metadata accessor for AttributionModel();
  uint64_t v25 = OUTLINED_FUNCTION_31_0();
  __swift_storeEnumTagSinglePayload(v25, v26, v27, v28);
  sub_24CBF92C8((uint64_t)v21, v18);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v21);
  *(void *)&long long v39 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  sub_24CC238F0();
  *(void *)&long long v39 = a2;
  sub_24CC238F0();
  *(void *)&long long v39 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698194C0);
  sub_24CC238F0();
  *(void *)&long long v39 = v33;
  sub_24CC238F0();
  *(void *)&long long v39 = v34;
  sub_24CC238F0();
  *(unsigned char *)(a9 + *(int *)(v24 + 44)) = v22;
  uint64_t v29 = v35;
  sub_24CBF92C8(v35, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  v30();
  sub_24CBF92C8((uint64_t)v21, v18);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v21);
  long long v39 = v38;
  uint64_t v40 = v37;
  uint64_t v41 = v36;
  sub_24CC238F0();
  return sub_24CBF9330(v29);
}

BOOL ListStyleAnswerSnippetModel.hasTitle.getter()
{
  return OUTLINED_FUNCTION_27_1();
}

BOOL ListStyleAnswerSnippetModel.hasIntro.getter()
{
  return OUTLINED_FUNCTION_27_1();
}

BOOL ListStyleAnswerSnippetModel.hasOutro.getter()
{
  return OUTLINED_FUNCTION_27_1();
}

BOOL ListStyleAnswerSnippetModel.hasDisclaimer.getter()
{
  return OUTLINED_FUNCTION_27_1();
}

uint64_t ListStyleAnswerSnippetModel.selectableComponents.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E60);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24CC26FD0;
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_19_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = &protocol witness table for [A];
  *(void *)(v0 + 32) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  sub_24CC23910();
  *(void *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2698194C0);
  *(void *)(v0 + 104) = &protocol witness table for [A];
  *(void *)(v0 + 72) = v3;
  sub_24CC23910();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = &protocol witness table for [A];
  *(void *)(v0 + 112) = v3;
  return v0;
}

uint64_t sub_24CC09460()
{
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = v3 - v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v24 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  sub_24CC1E778();
  char v14 = v13;
  swift_bridgeObjectRelease();
  sub_24CC0AC74(v0, (uint64_t)v12);
  if (v14)
  {
    sub_24CC0ACD8((uint64_t)v12);
    sub_24CC0AC74(v0, v1);
LABEL_4:
    sub_24CC0ACD8(v1);
    sub_24CC0AC74(v0, (uint64_t)v9);
LABEL_5:
    sub_24CC0ACD8((uint64_t)v9);
    sub_24CC0AC74(v0, v5);
    goto LABEL_6;
  }
  sub_24CC23910();
  sub_24CC1E778();
  char v16 = v15;
  swift_bridgeObjectRelease();
  sub_24CC0ACD8((uint64_t)v12);
  sub_24CC0AC74(v0, v1);
  if (v16) {
    goto LABEL_4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  sub_24CC23910();
  sub_24CC1EA6C();
  char v20 = v19;
  swift_bridgeObjectRelease();
  sub_24CC0ACD8(v1);
  sub_24CC0AC74(v0, (uint64_t)v9);
  if (v20) {
    goto LABEL_5;
  }
  sub_24CC23910();
  sub_24CC1E778();
  char v22 = v21;
  swift_bridgeObjectRelease();
  sub_24CC0ACD8((uint64_t)v9);
  sub_24CC0AC74(v0, v5);
  if ((v22 & 1) == 0)
  {
    sub_24CC23910();
    sub_24CC1E778();
    char v17 = v23;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
LABEL_6:
  char v17 = 1;
LABEL_7:
  sub_24CC0ACD8(v5);
  return v17 & 1;
}

uint64_t sub_24CC096CC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F72746E69 && a2 == 0xE500000000000000;
    if (v6 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7370657473 && a2 == 0xE500000000000000;
      if (v7 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6F7274756FLL && a2 == 0xE500000000000000;
        if (v8 || (sub_24CC24310() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6D69616C63736964 && a2 == 0xEA00000000007265;
          if (v9 || (sub_24CC24310() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC288A0 || (sub_24CC24310() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
            if (v10 || (sub_24CC24310() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x6C7974537473696CLL && a2 == 0xE900000000000065)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v12 = sub_24CC24310();
              swift_bridgeObjectRelease();
              if (v12) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24CC099A4()
{
  return 8;
}

unint64_t sub_24CC099AC(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F72746E69;
      break;
    case 2:
      unint64_t result = 0x7370657473;
      break;
    case 3:
      unint64_t result = 0x6F7274756FLL;
      break;
    case 4:
      unint64_t result = 0x6D69616C63736964;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x747865746E6F63;
      break;
    case 7:
      unint64_t result = 0x6C7974537473696CLL;
      break;
    default:
      unint64_t result = 0x656C746974;
      break;
  }
  return result;
}

unint64_t sub_24CC09AB0()
{
  return sub_24CC099AC(*v0);
}

uint64_t sub_24CC09AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CC096CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CC09AE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CC099A4();
  *a1 = result;
  return result;
}

uint64_t sub_24CC09B08(uint64_t a1)
{
  unint64_t v2 = sub_24CC0A75C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC09B44(uint64_t a1)
{
  unint64_t v2 = sub_24CC0A75C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ListStyleAnswerSnippetModel.encode(to:)()
{
  OUTLINED_FUNCTION_23_1();
  BOOL v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698194C8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24CC0A75C();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC0AB00((uint64_t)&unk_2698194D8);
  OUTLINED_FUNCTION_6_6();
  if (!v0)
  {
    type metadata accessor for ListStyleAnswerSnippetModel();
    OUTLINED_FUNCTION_6_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
    sub_24CC0ABCC((uint64_t)&unk_269819500);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_6_6();
    OUTLINED_FUNCTION_6_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    sub_24CC0A968((uint64_t)&unk_269819128);
    OUTLINED_FUNCTION_19_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CBE8158((uint64_t)&unk_269818C80);
    OUTLINED_FUNCTION_19_0();
    sub_24CC0AAB4();
    OUTLINED_FUNCTION_19_0();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_20_1();
}

void ListStyleAnswerSnippetModel.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v90 = v10;
  char v13 = v12;
  uint64_t v76 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v16;
  uint64_t v86 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_16_3(v17, v75[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_0();
  uint64_t v92 = v19;
  uint64_t v93 = v18;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_0_4();
  uint64_t v78 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  OUTLINED_FUNCTION_0();
  uint64_t v81 = v22;
  uint64_t v82 = v21;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_0_4();
  uint64_t v80 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_0();
  uint64_t v88 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_20_0();
  uint64_t v79 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_33_0();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)v75 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v83 = (char *)v75 - v33;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819520);
  OUTLINED_FUNCTION_0();
  uint64_t v84 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_1();
  uint64_t v38 = v37 - v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_1_1();
  uint64_t v42 = v40 - v41;
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)v75 - v44;
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_1();
  uint64_t v94 = v47;
  uint64_t v95 = v49 - v48;
  uint64_t v50 = v49 - v48 + v47[9];
  type metadata accessor for AttributionModel();
  uint64_t v51 = OUTLINED_FUNCTION_31_0();
  __swift_storeEnumTagSinglePayload(v51, v52, v53, v54);
  sub_24CBF92C8((uint64_t)v45, v42);
  uint64_t v91 = v50;
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v45);
  uint64_t v55 = v13[3];
  __swift_project_boxed_opaque_existential_1(v13, v55);
  sub_24CC0A75C();
  uint64_t v89 = v38;
  uint64_t v56 = v90;
  sub_24CC24360();
  if (v56)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    OUTLINED_FUNCTION_17_2();
    OUTLINED_FUNCTION_3_2();
    v58();
    if (v55) {
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v95 + v94[10], v86);
    }
  }
  else
  {
    uint64_t v90 = v11;
    sub_24CC0AB00((uint64_t)&unk_269819528);
    uint64_t v57 = v83;
    OUTLINED_FUNCTION_11_4();
    uint64_t v59 = v24;
    uint64_t v60 = v88 + 32;
    uint64_t v83 = *(char **)(v88 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v83)(v95, v57, v59);
    OUTLINED_FUNCTION_11_4();
    ((void (*)(uint64_t, char *, uint64_t))v83)(v95 + v94[5], v32, v59);
    sub_24CC0ABCC((uint64_t)&unk_269819530);
    uint64_t v61 = v80;
    uint64_t v62 = v82;
    OUTLINED_FUNCTION_11_4();
    v75[1] = v60;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 32))(v95 + v94[6], v61, v62);
    uint64_t v63 = v90;
    sub_24CC24270();
    uint64_t v64 = v63;
    uint64_t v65 = (void (*)(uint64_t, uint64_t, uint64_t))v83;
    ((void (*)(uint64_t, uint64_t, uint64_t))v83)(v95 + v94[7], v64, v59);
    uint64_t v66 = v79;
    OUTLINED_FUNCTION_11_4();
    v65(v95 + v94[8], v66, v59);
    sub_24CC0A968((uint64_t)&unk_269819188);
    uint64_t v67 = v78;
    uint64_t v68 = v93;
    OUTLINED_FUNCTION_11_4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 40))(v91, v67, v68);
    sub_24CBE8158((uint64_t)&unk_269818CA8);
    uint64_t v69 = v77;
    uint64_t v70 = v86;
    OUTLINED_FUNCTION_11_4();
    uint64_t v72 = v94;
    uint64_t v71 = v95;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 32))(v95 + v94[10], v69, v70);
    char v96 = 7;
    sub_24CC0AC28();
    OUTLINED_FUNCTION_11_4();
    uint64_t v73 = OUTLINED_FUNCTION_2_11();
    v74(v73);
    *(unsigned char *)(v71 + v72[11]) = a10;
    sub_24CC0AC74(v71, v76);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_24CC0ACD8(v71);
  }
  OUTLINED_FUNCTION_20_1();
}

void sub_24CC0A72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ListStyleAnswerSnippetModel.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_24CC0A744()
{
}

unint64_t sub_24CC0A75C()
{
  unint64_t result = qword_2698194D0;
  if (!qword_2698194D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698194D0);
  }
  return result;
}

unint64_t sub_24CC0A7A8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B58);
    sub_24CC0C400(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC0A828()
{
  unint64_t result = qword_269819508;
  if (!qword_269819508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698194C0);
    sub_24CC0A7A8((uint64_t)&unk_2698194E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819508);
  }
  return result;
}

unint64_t sub_24CC0A8C8()
{
  unint64_t result = qword_269819510;
  if (!qword_269819510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698194C0);
    sub_24CC0A7A8((uint64_t)&unk_2698194F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819510);
  }
  return result;
}

unint64_t sub_24CC0A968(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B88);
    sub_24CC0AA34((uint64_t)&unk_269819130);
    sub_24CC0AA34((uint64_t)&unk_269819140);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC0AA34(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B40);
    sub_24CC0C400(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC0AAB4()
{
  unint64_t result = qword_269819518;
  if (!qword_269819518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819518);
  }
  return result;
}

unint64_t sub_24CC0AB00(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B78);
    sub_24CC0A7A8((uint64_t)&unk_2698194E0);
    sub_24CC0A7A8((uint64_t)&unk_2698194F0);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC0ABCC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B80);
    sub_24CC0A828();
    sub_24CC0A8C8();
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC0AC28()
{
  unint64_t result = qword_269819538;
  if (!qword_269819538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819538);
  }
  return result;
}

uint64_t sub_24CC0AC74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ListStyleAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC0ACD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ListStyleAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CC0AD38()
{
  unint64_t result = qword_269819540;
  if (!qword_269819540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819540);
  }
  return result;
}

unint64_t sub_24CC0AD84()
{
  return sub_24CC0C400((uint64_t)&qword_269819340);
}

unint64_t sub_24CC0ADCC()
{
  return sub_24CC0C400((uint64_t)&qword_2698192D8);
}

uint64_t sub_24CC0AE14()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = ListStyleAnswerSnippetModel.title.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CC0AE40()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = ListStyleAnswerSnippetModel.intro.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CC0AE6C()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = ListStyleAnswerSnippetModel.steps.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CC0AE98()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = ListStyleAnswerSnippetModel.outro.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CC0AEC4()
{
  OUTLINED_FUNCTION_24_0();
  uint64_t result = ListStyleAnswerSnippetModel.disclaimer.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24CC0AEF0()
{
  return ListStyleAnswerSnippetModel.attributionModel.getter();
}

void *initializeBufferWithCopyOfBuffer for ListStyleAnswerSnippetModel(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
    BOOL v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((void *)((char *)a1 + a3[7]), (void *)((char *)a2 + a3[7]), v7);
    v8((void *)((char *)a1 + a3[8]), (void *)((char *)a2 + a3[8]), v7);
    uint64_t v13 = a3[9];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[10];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  }
  return a1;
}

uint64_t destroy for ListStyleAnswerSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  uint64_t v8 = a1 + a2[9];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[10];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  return v12(v10, v11);
}

uint64_t initializeWithCopy for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithCopy for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC0BA14);
}

uint64_t sub_24CC0BA14(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        OUTLINED_FUNCTION_1_5();
        if (*(_DWORD *)(v16 + 84) != a2)
        {
          unsigned int v18 = *(unsigned __int8 *)(a1 + a3[11]);
          if (v18 >= 2) {
            return v18 - 1;
          }
          else {
            return 0;
          }
        }
        uint64_t v8 = v15;
        uint64_t v12 = a3[10];
      }
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC0BB30);
}

void sub_24CC0BB30(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
      OUTLINED_FUNCTION_1_5();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
        OUTLINED_FUNCTION_1_5();
        if (*(_DWORD *)(v18 + 84) != a3)
        {
          *(unsigned char *)(a1 + a4[11]) = a2 + 1;
          return;
        }
        uint64_t v10 = v17;
        uint64_t v14 = a4[10];
      }
    }
    uint64_t v11 = a1 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_24CC0BC38()
{
  sub_24CBFB6E4(319, (unint64_t *)&qword_269819558, &qword_269818B58);
  if (v0 <= 0x3F)
  {
    sub_24CBFB6E4(319, &qword_269819560, &qword_2698194C0);
    if (v1 <= 0x3F)
    {
      sub_24CBFB6E4(319, &qword_2698191C0, &qword_269818B40);
      if (v2 <= 0x3F)
      {
        sub_24CBE8ACC();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle;
}

uint64_t getEnumTagSinglePayload for ListStyleAnswerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ListStyleAnswerSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC0BF20);
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

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.CodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.CodingKeys;
}

unsigned char *_s19DeviceExpertIntents27ListStyleAnswerSnippetModelV9ListStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC0C024);
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

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.CodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys;
}

unint64_t sub_24CC0C080()
{
  unint64_t result = qword_269819568;
  if (!qword_269819568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819568);
  }
  return result;
}

unint64_t sub_24CC0C0D0()
{
  unint64_t result = qword_269819570;
  if (!qword_269819570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819570);
  }
  return result;
}

unint64_t sub_24CC0C120()
{
  unint64_t result = qword_269819578;
  if (!qword_269819578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819578);
  }
  return result;
}

unint64_t sub_24CC0C170()
{
  unint64_t result = qword_269819580;
  if (!qword_269819580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819580);
  }
  return result;
}

unint64_t sub_24CC0C1C0()
{
  unint64_t result = qword_269819588;
  if (!qword_269819588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819588);
  }
  return result;
}

unint64_t sub_24CC0C210()
{
  unint64_t result = qword_269819590;
  if (!qword_269819590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819590);
  }
  return result;
}

unint64_t sub_24CC0C260()
{
  unint64_t result = qword_269819598;
  if (!qword_269819598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819598);
  }
  return result;
}

unint64_t sub_24CC0C2B0()
{
  unint64_t result = qword_2698195A0;
  if (!qword_2698195A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698195A0);
  }
  return result;
}

unint64_t sub_24CC0C300()
{
  unint64_t result = qword_2698195A8;
  if (!qword_2698195A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698195A8);
  }
  return result;
}

unint64_t sub_24CC0C350()
{
  unint64_t result = qword_2698195B0;
  if (!qword_2698195B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698195B0);
  }
  return result;
}

uint64_t sub_24CC0C39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextRun(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CC0C400(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return *(void *)(v0 - 152);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_24CC242E0();
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1)
{
  *unint64_t v1 = a1;
  return type metadata accessor for ListStyleAnswerSnippetModel();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_24CC24270();
}

void OUTLINED_FUNCTION_16_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_24CC23920();
}

BOOL OUTLINED_FUNCTION_27_1()
{
  return v0 != 0;
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return type metadata accessor for ListStyleAnswerSnippetModel();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0;
}

uint64_t sub_24CC0C5C8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_10(a1, qword_2698195C0);
}

uint64_t static Logger.analytics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC0C710(&qword_269818AB0, (uint64_t)qword_2698195C0, a1);
}

uint64_t sub_24CC0C60C(uint64_t a1)
{
  return sub_24CC0C674(a1, qword_2698195D8);
}

uint64_t static Logger.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC0C710(&qword_269818AB8, (uint64_t)qword_2698195D8, a1);
}

uint64_t sub_24CC0C654(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_10(a1, qword_2698195F0);
}

uint64_t sub_24CC0C674(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24CC23DA0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24CC23D90();
}

uint64_t static Logger.tellMeFlow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC0C710(&qword_269818AC0, (uint64_t)qword_2698195F0, a1);
}

uint64_t sub_24CC0C710@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CC23DA0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t OUTLINED_FUNCTION_0_10(uint64_t a1, uint64_t *a2)
{
  return sub_24CC0C674(a1, a2);
}

uint64_t sub_24CC0C7B0(char a1, char a2)
{
  unint64_t v3 = sub_24CBEC0F8(a1);
  uint64_t v5 = v4;
  if (v3 == sub_24CBEC0F8(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24CC24310();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24CC0C838(uint64_t a1)
{
  *(void *)(v1 + 288) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_24CC0C844(uint64_t a1)
{
  *(void *)(v1 + 296) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_24CC0C850@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[38];
  uint64_t v3 = v1[39];
  uint64_t v4 = v1[40];
  uint64_t v5 = v1[41];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_24CC153EC(v2, v3);
}

uint64_t sub_24CC0C864(_OWORD *a1)
{
  uint64_t v3 = *(void *)(v1 + 304);
  uint64_t v2 = *(void *)(v1 + 312);
  long long v4 = a1[1];
  *(_OWORD *)(v1 + 304) = *a1;
  *(_OWORD *)(v1 + 320) = v4;
  return sub_24CC13674(v3, v2);
}

uint64_t DeviceExpertTellMeGeneratedFlow.__allocating_init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:tipKitEventSender:responseGenerator:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, long long *a7, long long *a8)
{
  uint64_t v16 = swift_allocObject();
  DeviceExpertTellMeGeneratedFlow.init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:tipKitEventSender:responseGenerator:deviceState:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t DeviceExpertTellMeGeneratedFlow.init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:tipKitEventSender:responseGenerator:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, long long *a7, long long *a8)
{
  uint64_t v9 = v8;
  uint64_t v17 = sub_24CC23CC0();
  uint64_t v18 = OUTLINED_FUNCTION_49(v17);
  MEMORY[0x270FA5388](v18);
  *(_OWORD *)(v8 + 304) = 0u;
  *(_OWORD *)(v8 + 320) = 0u;
  *(_OWORD *)(v8 + 288) = 0u;
  sub_24CBEF25C(a1, v8 + 16);
  *(void *)(v8 + 56) = a2;
  type metadata accessor for DeviceExpertCATsSimple();
  swift_retain();
  sub_24CC23CB0();
  *(void *)(v8 + 64) = sub_24CC23C80();
  *(void *)(v8 + 72) = a3;
  sub_24CBEF25C(a4, v8 + 80);
  sub_24CBEF25C(a5, v8 + 120);
  sub_24CBEF25C(a6, v8 + 160);
  sub_24CC23BA0();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a6);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  type metadata accessor for LocalizedResourceProvider();
  uint64_t v19 = swift_allocObject();
  sub_24CC0CAA0(&v22, v19 + 16);
  *(void *)(v9 + 200) = v19;
  sub_24CC0CAA0(a7, v9 + 208);
  sub_24CC0CAA0(a8, v9 + 248);
  return v9;
}

uint64_t sub_24CC0CAA0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24CC0CAB8()
{
  return sub_24CC23960();
}

uint64_t type metadata accessor for DeviceExpertTellMeGeneratedFlow()
{
  return self;
}

unint64_t sub_24CC0CB38()
{
  unint64_t result = qword_269819608;
  if (!qword_269819608)
  {
    type metadata accessor for DeviceExpertTellMeGeneratedFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269819608);
  }
  return result;
}

uint64_t sub_24CC0CB84()
{
  OUTLINED_FUNCTION_16();
  v1[46] = v2;
  v1[47] = v0;
  uint64_t v3 = sub_24CC239B0();
  v1[48] = v3;
  OUTLINED_FUNCTION_1_0(v3);
  v1[49] = v4;
  v1[50] = OUTLINED_FUNCTION_48();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698191F0);
  OUTLINED_FUNCTION_49(v5);
  v1[51] = OUTLINED_FUNCTION_48();
  uint64_t v6 = sub_24CC23A40();
  v1[52] = v6;
  OUTLINED_FUNCTION_1_0(v6);
  v1[53] = v7;
  v1[54] = OUTLINED_FUNCTION_48();
  uint64_t v8 = sub_24CC23A30();
  v1[55] = v8;
  OUTLINED_FUNCTION_1_0(v8);
  v1[56] = v9;
  v1[57] = OUTLINED_FUNCTION_48();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818C40);
  OUTLINED_FUNCTION_49(v10);
  v1[58] = OUTLINED_FUNCTION_48();
  uint64_t v11 = type metadata accessor for TellMeGeneratedSnippetModels();
  v1[59] = v11;
  OUTLINED_FUNCTION_49(v11);
  v1[60] = OUTLINED_FUNCTION_14();
  v1[61] = swift_task_alloc();
  v1[62] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  OUTLINED_FUNCTION_49(v12);
  v1[63] = OUTLINED_FUNCTION_14();
  v1[64] = swift_task_alloc();
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  v1[67] = swift_task_alloc();
  v1[68] = swift_task_alloc();
  v1[69] = swift_task_alloc();
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for SnippetResponseComponents();
  v1[72] = v13;
  OUTLINED_FUNCTION_49(v13);
  v1[73] = OUTLINED_FUNCTION_48();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818AE0);
  OUTLINED_FUNCTION_49(v14);
  v1[74] = OUTLINED_FUNCTION_14();
  v1[75] = swift_task_alloc();
  uint64_t v15 = sub_24CC237D0();
  v1[76] = v15;
  OUTLINED_FUNCTION_1_0(v15);
  v1[77] = v16;
  v1[78] = OUTLINED_FUNCTION_14();
  v1[79] = swift_task_alloc();
  uint64_t v17 = sub_24CC237F0();
  v1[80] = v17;
  OUTLINED_FUNCTION_1_0(v17);
  v1[81] = v18;
  v1[82] = OUTLINED_FUNCTION_48();
  uint64_t v19 = sub_24CC23810();
  v1[83] = v19;
  OUTLINED_FUNCTION_1_0(v19);
  v1[84] = v20;
  v1[85] = OUTLINED_FUNCTION_48();
  uint64_t v21 = sub_24CC233D0();
  v1[86] = v21;
  OUTLINED_FUNCTION_1_0(v21);
  v1[87] = v22;
  v1[88] = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v23, v24, v25);
}

void sub_24CC0CE98()
{
  uint64_t v59 = v0;
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CC23DA0();
  v0[89] = __swift_project_value_buffer(v2, (uint64_t)qword_2698195F0);
  uint64_t v3 = sub_24CC23D80();
  os_log_type_t v4 = sub_24CC24070();
  if (OUTLINED_FUNCTION_16_4(v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_42_0();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24CBD5000, v3, v1, "DeviceExpertTellMeGeneratedFlow#execute", v5, 2u);
    OUTLINED_FUNCTION_4();
  }

  sub_24CC23A00();
  __swift_project_boxed_opaque_existential_1(v0 + 13, v0[16]);
  uint64_t v6 = sub_24CC23AB0();
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v10 = v0[88];
    uint64_t v11 = v0[87];
    uint64_t v12 = v0[86];
    sub_24CC233C0();
    uint64_t v8 = sub_24CC233B0();
    uint64_t v9 = v13;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v0[91] = v9;
  v0[90] = v8;
  uint64_t v14 = v0[47];
  uint64_t v15 = *(void **)(v14 + 288);
  v0[92] = v15;
  if (v15 && (uint64_t v16 = *(void **)(v14 + 296), (v0[93] = v16) != 0))
  {
    id v17 = v15;
    id v57 = v16;
    uint64_t v18 = sub_24CC23D80();
    os_log_type_t v19 = sub_24CC24070();
    uint64_t v56 = v17;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_9();
      uint64_t v58 = OUTLINED_FUNCTION_65();
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v21 = sub_24CC23D70();
      v0[45] = sub_24CC12DF0(v21, v22, &v58);
      sub_24CC240C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24CBD5000, v18, v19, "DeviceExpertTellMeGeneratedFlow#execute - Search request utterance \"%s\"", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
    }
    else
    {
    }
    uint64_t v26 = v0[85];
    uint64_t v27 = v0[84];
    uint64_t v28 = v0[83];
    uint64_t v29 = v0[82];
    uint64_t v30 = v0[81];
    uint64_t v31 = v0[80];
    sub_24CC23CE0();
    sub_24CC23800();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    uint64_t v32 = sub_24CC23410();
    v0[94] = v32;
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    if (!*(void *)(v32 + 16))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v36 = sub_24CC23D80();
      os_log_type_t v37 = sub_24CC24080();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)OUTLINED_FUNCTION_42_0();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_24CBD5000, v36, v37, "DeviceExpertTellMeGeneratedFlow#execute() No results available", v38, 2u);
        OUTLINED_FUNCTION_4();
      }
      uint64_t v40 = v0[53];
      uint64_t v39 = v0[54];
      uint64_t v42 = v0[51];
      uint64_t v41 = v0[52];
      uint64_t v44 = v0[49];
      uint64_t v43 = v0[50];
      uint64_t v45 = v0[47];
      uint64_t v55 = v0[48];

      __swift_project_boxed_opaque_existential_1((void *)(v45 + 120), *(void *)(v45 + 144));
      sub_24CC239F0();
      (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v39, *MEMORY[0x263F6F9E0], v41);
      uint64_t v46 = sub_24CC23BC0();
      OUTLINED_FUNCTION_40_0(v42, v47, v48, v46);
      (*(void (**)(uint64_t, void, uint64_t))(v44 + 104))(v43, *MEMORY[0x263F6F6C8], v55);
      sub_24CBFC334(v39, v42, v43, 0);
      sub_24CC239A0();
      swift_release();
      sub_24CC23A60();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_56_0();
      __asm { BRAA            X1, X16 }
    }
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_24CC23D80();
    os_log_type_t v34 = sub_24CC24070();
    if (OUTLINED_FUNCTION_37_0(v34))
    {
      uint64_t v35 = (uint8_t *)OUTLINED_FUNCTION_9();
      *(_DWORD *)uint64_t v35 = 134217984;
      v0[44] = *(void *)(v32 + 16);
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CBD5000, v33, (os_log_type_t)v26, "DeviceExpertTellMeGeneratedFlow#execute - Found %ld result candidates", v35, 0xCu);
      OUTLINED_FUNCTION_4();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v51 = (void *)swift_task_alloc();
    v0[95] = v51;
    *uint64_t v51 = v0;
    v51[1] = sub_24CC0D648;
    OUTLINED_FUNCTION_56_0();
    sub_24CC0ED30(v52, v53);
  }
  else
  {
    uint64_t v23 = sub_24CC23D80();
    os_log_type_t v24 = sub_24CC24080();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)OUTLINED_FUNCTION_42_0();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_24CBD5000, v23, v24, "DeviceExpertTellMeGeneratedFlow#execute() Invalid pommes response or experience. Error executing request", v25, 2u);
      OUTLINED_FUNCTION_4();
    }

    sub_24CC241D0();
    OUTLINED_FUNCTION_56_0();
  }
}

uint64_t sub_24CC0D648()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24CC0D710()
{
  uint64_t v43 = v0;
  uint64_t v1 = v0[76];
  uint64_t v2 = v0[75];
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    swift_bridgeObjectRelease();
    sub_24CBDC220(v2, &qword_269818AE0);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24CC23D80();
    os_log_type_t v4 = sub_24CC24080();
    BOOL v5 = OUTLINED_FUNCTION_37_0(v4);
    uint64_t v6 = v0[94];
    if (v5)
    {
      uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_9();
      *(_DWORD *)uint64_t v7 = 134217984;
      uint64_t v8 = *(void *)(v6 + 16);
      swift_bridgeObjectRelease();
      v0[41] = v8;
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CBD5000, v3, (os_log_type_t)v2, "DeviceExpertTellMeGeneratedFlow#execute() Unable to determine best result from candidates (%ld)", v7, 0xCu);
      OUTLINED_FUNCTION_4();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v39 = (void *)v0[93];
    uint64_t v40 = (void *)v0[92];
    uint64_t v23 = v0[53];
    uint64_t v22 = v0[54];
    uint64_t v25 = v0[51];
    uint64_t v24 = v0[52];
    uint64_t v27 = v0[49];
    uint64_t v26 = v0[50];
    uint64_t v28 = v0[48];
    __swift_project_boxed_opaque_existential_1((void *)(v0[47] + 120), *(void *)(v0[47] + 144));
    sub_24CC239F0();
    (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v22, *MEMORY[0x263F6F9E0], v24);
    uint64_t v29 = sub_24CC23BC0();
    OUTLINED_FUNCTION_40_0(v25, v30, v31, v29);
    (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, *MEMORY[0x263F6F6C8], v28);
    sub_24CBFC334(v22, v25, v26, 1);
    sub_24CC239A0();
    swift_release();
    sub_24CC23A60();

    OUTLINED_FUNCTION_2_12();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_52();
    return v32();
  }
  else
  {
    uint64_t v9 = v0[79];
    uint64_t v10 = v0[78];
    uint64_t v11 = v0[77];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v2, v1);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v0[96] = v12;
    v0[97] = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v12(v10, v9, v1);
    uint64_t v13 = sub_24CC23D80();
    os_log_type_t v14 = sub_24CC24070();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = v0[78];
    uint64_t v17 = v0[77];
    if (v15)
    {
      uint64_t v41 = v0[76];
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_9();
      uint64_t v42 = OUTLINED_FUNCTION_65();
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = sub_24CC23780();
      v0[43] = sub_24CC12DF0(v19, v20, &v42);
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v21(v16, v41);
      _os_log_impl(&dword_24CBD5000, v13, v14, "DeviceExpertTellMeGeneratedFlow#execute - Resolved query \"%s\"", v18, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
    }
    else
    {
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v21(v0[78], v0[76]);
    }

    v0[98] = v21;
    os_log_type_t v34 = (void *)v0[47];
    uint64_t v35 = v34[7];
    uint64_t v36 = v34[8];
    uint64_t v37 = v34[25];
    type metadata accessor for SnippetModelProvider();
    v0[99] = swift_initStackObject();
    v0[100] = sub_24CBD915C(v35, v36, v37);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v38 = (void *)swift_task_alloc();
    v0[101] = v38;
    *uint64_t v38 = v0;
    v38[1] = sub_24CC0DC98;
    return sub_24CBD916C();
  }
}

uint64_t sub_24CC0DC98()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24CC0DD60()
{
  uint64_t v69 = v0;
  uint64_t v1 = *(void *)(v0 + 568);
  uint64_t v2 = *(void *)(v0 + 560);
  uint64_t v3 = *(void *)(v0 + 544);
  uint64_t v4 = *(void *)(v0 + 536);
  uint64_t v5 = *(void *)(v0 + 472);
  sub_24CBE3C74(*(void *)(v0 + 584) + *(int *)(*(void *)(v0 + 576) + 20), v1);
  uint64_t v6 = OUTLINED_FUNCTION_51();
  sub_24CBE3C74(v6, v7);
  sub_24CBE3C74(v1, v3);
  sub_24CBE3C74(v2, v4);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v5);
  uint64_t v9 = *(void *)(v0 + 552);
  uint64_t v10 = *(void *)(v0 + 544);
  uint64_t v11 = *(void *)(v0 + 536);
  if (EnumTagSinglePayload == 1)
  {
    sub_24CC1360C(v11, *(void *)(v0 + 552));
    sub_24CBDC220(v10, &qword_269818B38);
  }
  else
  {
    sub_24CBDC220(v11, &qword_269818B38);
    sub_24CC15430(v10, v9, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    OUTLINED_FUNCTION_54_0(v9);
  }
  uint64_t v12 = *(void *)(v0 + 528);
  uint64_t v13 = *(void *)(v0 + 472);
  sub_24CBE3C74(*(void *)(v0 + 552), v12);
  if (__swift_getEnumTagSinglePayload(v12, 1, v13) == 1)
  {
    uint64_t v14 = *(void *)(v0 + 528);
    swift_bridgeObjectRelease();
    sub_24CBDC220(v14, &qword_269818B38);
    BOOL v15 = (void *)sub_24CC23D80();
    os_log_type_t v16 = sub_24CC24080();
    if (OUTLINED_FUNCTION_37_0(v16))
    {
      *(_WORD *)OUTLINED_FUNCTION_42_0() = 0;
      OUTLINED_FUNCTION_47_0(&dword_24CBD5000, v17, v18, "DeviceExpertTellMeGeneratedFlow#execute() Unable to determine snippet model for result");
      OUTLINED_FUNCTION_4();
    }
    uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v0 + 784);
    uint64_t v55 = *(void **)(v0 + 744);
    uint64_t v56 = *(void **)(v0 + 736);
    uint64_t v60 = *(void *)(v0 + 608);
    uint64_t v61 = *(void *)(v0 + 632);
    uint64_t v59 = *(void *)(v0 + 584);
    uint64_t v57 = *(void *)(v0 + 560);
    uint64_t v58 = *(void *)(v0 + 568);
    uint64_t v54 = *(void *)(v0 + 552);
    uint64_t v19 = *(void *)(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 432);
    uint64_t v21 = *(void *)(v0 + 408);
    uint64_t v22 = *(void *)(v0 + 416);
    uint64_t v24 = *(void *)(v0 + 392);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v25 = *(void *)(v0 + 376);
    uint64_t v53 = *(void *)(v0 + 384);

    __swift_project_boxed_opaque_existential_1((void *)(v25 + 120), *(void *)(v25 + 144));
    sub_24CC239F0();
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v20, *MEMORY[0x263F6F9E0], v22);
    uint64_t v26 = sub_24CC23BC0();
    OUTLINED_FUNCTION_40_0(v21, v27, v28, v26);
    (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v23, *MEMORY[0x263F6F6C8], v53);
    sub_24CBFC334(v20, v21, v23, 2);
    sub_24CC239A0();
    swift_release();
    sub_24CC23A60();
    swift_release();

    sub_24CBDC220(v54, &qword_269818B38);
    sub_24CBDC220(v57, &qword_269818B38);
    sub_24CBDC220(v58, &qword_269818B38);
    sub_24CC15490(v59, (void (*)(void))type metadata accessor for SnippetResponseComponents);
    v62(v61, v60);
    OUTLINED_FUNCTION_2_12();
    __swift_destroy_boxed_opaque_existential_1(v0 + 104);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_52();
    return v29();
  }
  uint64_t v31 = *(void *)(v0 + 568);
  uint64_t v32 = *(void *)(v0 + 520);
  uint64_t v33 = *(void *)(v0 + 472);
  sub_24CC15430(*(void *)(v0 + 528), *(void *)(v0 + 496), (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  sub_24CBE3C74(v31, v32);
  int v34 = __swift_getEnumTagSinglePayload(v32, 1, v33);
  uint64_t v35 = *(void *)(v0 + 560);
  uint64_t v36 = *(void *)(v0 + 520);
  uint64_t v37 = *(void *)(v0 + 512);
  if (v34 == 1)
  {
    sub_24CBDC220(*(void *)(v0 + 520), &qword_269818B38);
    sub_24CBE3C74(v35, v37);
  }
  else
  {
    uint64_t v38 = *(void *)(v0 + 488);
    sub_24CBE71AC(*(void *)(v0 + 520), v38);
    int v39 = swift_getEnumCaseMultiPayload() & 0xFFFFFFFE;
    sub_24CC15490(v38, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    sub_24CC15490(v36, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    sub_24CBE3C74(v35, v37);
    if (v39 == 2)
    {
      sub_24CBDC220(*(void *)(v0 + 512), &qword_269818B38);
      goto LABEL_17;
    }
  }
  uint64_t v40 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 472);
  sub_24CBE3C74(*(void *)(v0 + 512), v40);
  int v42 = __swift_getEnumTagSinglePayload(v40, 1, v41);
  uint64_t v44 = *(void *)(v0 + 504);
  uint64_t v43 = *(void *)(v0 + 512);
  if (v42 != 1)
  {
    uint64_t v47 = *(void *)(v0 + 480);
    uint64_t v48 = OUTLINED_FUNCTION_51();
    sub_24CBE71AC(v48, v49);
    int v50 = swift_getEnumCaseMultiPayload() & 0xFFFFFFFE;
    sub_24CC15490(v47, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    sub_24CBDC220(v43, &qword_269818B38);
    sub_24CC15490(v44, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
    if (v50 != 2) {
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v51 = *(void *)(v0 + 592);
    (*(void (**)(uint64_t, void, void))(v0 + 768))(v51, *(void *)(v0 + 632), *(void *)(v0 + 608));
    OUTLINED_FUNCTION_54_0(v51);
    FeedbackModel.init(result:)(v51, (uint64_t *)&v63);
    long long v66 = v63;
    uint64_t v67 = v64;
    uint64_t v68 = v65;
    sub_24CC0C864(&v66);
    goto LABEL_18;
  }
  sub_24CBDC220(*(void *)(v0 + 512), &qword_269818B38);
  uint64_t v45 = OUTLINED_FUNCTION_51();
  sub_24CBDC220(v45, v46);
LABEL_18:
  uint64_t v52 = (void *)swift_task_alloc();
  *(void *)(v0 + 816) = v52;
  *uint64_t v52 = v0;
  v52[1] = sub_24CC0E3FC;
  return sub_24CC0F838();
}

uint64_t sub_24CC0E3FC()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 824) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24CC0E4CC()
{
  OUTLINED_FUNCTION_58();
  uint64_t v1 = v0[58];
  uint64_t v2 = sub_24CC23A70();
  OUTLINED_FUNCTION_40_0(v1, v3, v4, v2);
  sub_24CC23A20();
  sub_24CC0C850(v0 + 33);
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[34];
  v0[104] = v5;
  v0[105] = v6;
  uint64_t v7 = v0[35];
  uint64_t v8 = v0[36];
  v0[106] = v7;
  v0[107] = v8;
  v0[37] = v5;
  v0[38] = v6;
  v0[39] = v7;
  v0[40] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[108] = (uint64_t)v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24CC0E5F4;
  uint64_t v10 = v0[103];
  uint64_t v11 = v0[73];
  uint64_t v13 = v0[57];
  uint64_t v12 = v0[58];
  return sub_24CBE628C((uint64_t)(v0 + 28), v11, v10, 0, 0, v12, v13, 2);
}

uint64_t sub_24CC0E5F4()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1[105];
  uint64_t v3 = v1[104];
  uint64_t v4 = v1[58];
  uint64_t v5 = v1[57];
  uint64_t v6 = v1[56];
  uint64_t v7 = v1[55];
  uint64_t v8 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v9 = v8;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_24CC13674(v3, v2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_24CBDC220(v4, &qword_269818C40);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24CC0E7BC()
{
  uint64_t v1 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v35 = *(void *)(v0 + 416);
  uint64_t v37 = *(void *)(v0 + 408);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v39 = *(void *)(v0 + 384);
  uint64_t v5 = *(void **)(v0 + 376);
  sub_24CBEF25C(v0 + 224, v0 + 144);
  uint64_t v6 = swift_allocObject();
  sub_24CC0CAA0((long long *)(v0 + 144), v6 + 16);
  sub_24CC23AC0();
  sub_24CC23950();
  swift_allocObject();
  uint64_t v42 = sub_24CC23940();
  uint64_t v7 = v5[14];
  __swift_project_boxed_opaque_existential_1(v5 + 10, v5[13]);
  (*(void (**)(void))(v7 + 8))();
  __swift_project_boxed_opaque_existential_1(v5 + 15, v5[18]);
  sub_24CC239F0();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v2, *MEMORY[0x263F6F9F0], v35);
  uint64_t v8 = sub_24CC23BC0();
  OUTLINED_FUNCTION_40_0(v37, v9, v10, v8);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F6F748], v39);
  sub_24CBFC334(v2, v37, v3, 3);
  sub_24CC239A0();
  swift_release();
  uint64_t v11 = v5[24];
  __swift_project_boxed_opaque_existential_1(v5 + 20, v5[23]);
  (*(void (**)(void))(v11 + 8))();
  uint64_t v32 = sub_24CC237C0();
  uint64_t v13 = v12;
  uint64_t v28 = sub_24CBE5A38();
  uint64_t v15 = v14;
  char v16 = sub_24CBE372C();
  char v17 = sub_24CBE3944();
  char v18 = sub_24CBE3944();
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (v18 == 5)
  {
    uint64_t v19 = sub_24CC23670();
    uint64_t v20 = v21;
  }
  uint64_t v31 = *(void **)(v0 + 736);
  uint64_t v22 = *(void *)(v0 + 728);
  uint64_t v23 = *(void *)(v0 + 720);
  uint64_t v41 = *(void *)(v0 + 632);
  uint64_t v24 = *(void *)(v0 + 616);
  uint64_t v38 = *(void *)(v0 + 584);
  uint64_t v40 = *(void *)(v0 + 608);
  uint64_t v34 = *(void *)(v0 + 560);
  uint64_t v36 = *(void *)(v0 + 568);
  uint64_t v33 = *(void *)(v0 + 552);
  uint64_t v29 = *(void **)(v0 + 744);
  uint64_t v30 = *(void *)(v0 + 496);
  *(void *)(v0 + 16) = 0xD00000000000001BLL;
  uint64_t v25 = *(void *)(v0 + 376);
  *(void *)(v0 + 24) = 0x800000024CC28DA0;
  *(void *)(v0 + 32) = v23;
  *(void *)(v0 + 40) = v22;
  *(void *)(v0 + 48) = v32;
  *(void *)(v0 + 56) = v13;
  *(void *)(v0 + 64) = v28;
  *(void *)(v0 + 72) = v15;
  *(unsigned char *)(v0 + 80) = v16 & 1;
  *(unsigned char *)(v0 + 81) = v17;
  *(void *)(v0 + 88) = v19;
  *(void *)(v0 + 96) = v20;
  sub_24CC14D88((const void *)(v0 + 16), *(void **)(v25 + 72));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 336) = v42;
  sub_24CC23A50();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  sub_24CC15490(v30, (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
  sub_24CBDC220(v33, &qword_269818B38);
  sub_24CBDC220(v34, &qword_269818B38);
  sub_24CBDC220(v36, &qword_269818B38);
  sub_24CC15490(v38, (void (*)(void))type metadata accessor for SnippetResponseComponents);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v41, v40);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v26();
}

uint64_t sub_24CC0ED30(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_24CC237D0();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC0EE04, 0, 0);
}

uint64_t sub_24CC0EE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = v3;
  if (!*(void *)(v3[5] + 16))
  {
    OUTLINED_FUNCTION_40_0(v3[4], a2, a3, v3[7]);
    goto LABEL_24;
  }
  uint64_t v31 = v3[5];
  swift_bridgeObjectRetain();
  sub_24CC1385C(&v31);
  uint64_t v4 = v31;
  v3[11] = v31;
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v7 = v3[8];
    uint64_t v31 = MEMORY[0x263F8EE78];
    sub_24CC24170();
    uint64_t v8 = *(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16);
    v7 += 16;
    unint64_t v9 = v4 + ((*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64));
    uint64_t v29 = *(void *)(v7 + 56);
    uint64_t v30 = v8;
    uint64_t v10 = (void (**)(uint64_t, uint64_t))(v7 - 8);
    do
    {
      uint64_t v11 = v3[10];
      uint64_t v12 = v3[7];
      v30(v11, v9, v12);
      sub_24CC23650();
      sub_24CC23770();
      id v13 = objc_allocWithZone((Class)sub_24CC23DD0());
      sub_24CC23DC0();
      (*v10)(v11, v12);
      sub_24CC24150();
      sub_24CC24180();
      sub_24CC24190();
      sub_24CC24160();
      v9 += v29;
      --v5;
    }
    while (v5);
    unint64_t v6 = v31;
  }
  v3[12] = v6;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24CC241E0();
  }
  else
  {
    uint64_t v14 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v14)
  {
    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_20;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v15 = (id)MEMORY[0x25330C8C0](0, v6);
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    id v15 = *(id *)(v6 + 32);
  }
  char v16 = v15;
  v3[13] = (uint64_t)v15;
  swift_bridgeObjectRelease();
  if ((sub_24CC23DB0() & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();

LABEL_20:
    if (qword_269818AC0 == -1)
    {
LABEL_21:
      uint64_t v19 = sub_24CC23DA0();
      __swift_project_value_buffer(v19, (uint64_t)qword_2698195F0);
      uint64_t v20 = (void *)sub_24CC23D80();
      os_log_type_t v21 = sub_24CC24070();
      if (OUTLINED_FUNCTION_37_0(v21))
      {
        *(_WORD *)OUTLINED_FUNCTION_42_0() = 0;
        OUTLINED_FUNCTION_47_0(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#findBestResults - Returning result without context");
        OUTLINED_FUNCTION_4();
      }
      uint64_t v25 = v3[4];
      uint64_t v24 = v3[5];

      sub_24CC11D1C(v24, v25);
LABEL_24:
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_52_0();
      __asm { BRAA            X1, X16 }
    }
LABEL_30:
    swift_once();
    goto LABEL_21;
  }
  char v17 = (void *)swift_task_alloc();
  v3[14] = (uint64_t)v17;
  *char v17 = v3;
  v17[1] = sub_24CC0F1C4;
  OUTLINED_FUNCTION_52_0();
  return MEMORY[0x270F7EA70]();
}

uint64_t sub_24CC0F1C4()
{
  OUTLINED_FUNCTION_34_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *unint64_t v6 = v5;
  v3[15] = v7;
  v3[16] = v8;
  v3[17] = v0;
  swift_task_dealloc();
  if (v0) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24CC0F2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_14_5();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_45_0();
  a20 = v22;
  unint64_t v25 = *(void *)(v22 + 128);
  if (v25)
  {
    if (qword_269818AC0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24CC23DA0();
    __swift_project_value_buffer(v26, (uint64_t)qword_2698195F0);
    OUTLINED_FUNCTION_51_0();
    uint64_t v27 = (void *)sub_24CC23D80();
    os_log_type_t v28 = sub_24CC24070();
    if (OUTLINED_FUNCTION_16_4(v28))
    {
      uint64_t v29 = *(void *)(v22 + 120);
      uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_9();
      a11 = OUTLINED_FUNCTION_65();
      *uint64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v22 + 24) = sub_24CC12DF0(v29, v25, &a11);
      sub_24CC240C0();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v31, v32, "DeviceExpertTellMeGeneratedFlow#findBestResults - %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v42 = *(void *)(v22 + 88);
    uint64_t v43 = *(void *)(v42 + 16);
    if (v43)
    {
      uint64_t v44 = *(void *)(v22 + 64);
      uint64_t v46 = *(void (**)(uint64_t))(v44 + 16);
      uint64_t v45 = v44 + 16;
      a10 = v46;
      uint64_t v47 = v42 + ((*(unsigned __int8 *)(v45 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 64));
      uint64_t v48 = *(void *)(v45 + 56);
      swift_retain();
      while (1)
      {
        unint64_t v49 = v25;
        uint64_t v50 = *(void *)(v22 + 120);
        uint64_t v51 = *(void *)(v22 + 128);
        uint64_t v52 = OUTLINED_FUNCTION_51();
        a10(v52);
        if (sub_24CC23650() == v50 && v51 == v53) {
          break;
        }
        unint64_t v25 = v49;
        char v55 = sub_24CC24310();
        swift_bridgeObjectRelease();
        if (v55) {
          goto LABEL_23;
        }
        (*(void (**)(void, void))(v45 - 8))(*(void *)(v22 + 72), *(void *)(v22 + 56));
        v47 += v48;
        if (!--v43)
        {
          swift_release();
          goto LABEL_21;
        }
      }
      swift_bridgeObjectRelease();
LABEL_23:
      swift_release();
      uint64_t v57 = *(void **)(v22 + 104);
      uint64_t v58 = *(void *)(v22 + 32);
      (*(void (**)(uint64_t, void, void))(*(void *)(v22 + 64) + 32))(v58, *(void *)(v22 + 72), *(void *)(v22 + 56));
      OUTLINED_FUNCTION_54_0(v58);
    }
    else
    {
LABEL_21:
      uint64_t v56 = *(void **)(v22 + 104);
      OUTLINED_FUNCTION_40_0(*(void *)(v22 + 32), v40, v41, *(void *)(v22 + 56));
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_release();
    if (qword_269818AC0 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_24CC23DA0();
    __swift_project_value_buffer(v33, (uint64_t)qword_2698195F0);
    uint64_t v34 = (void *)sub_24CC23D80();
    os_log_type_t v35 = sub_24CC24080();
    if (OUTLINED_FUNCTION_37_0(v35))
    {
      *(_WORD *)OUTLINED_FUNCTION_42_0() = 0;
      OUTLINED_FUNCTION_47_0(&dword_24CBD5000, v36, v37, "DeviceExpertTellMeGeneratedFlow#findBestResults - No matching result found");
      OUTLINED_FUNCTION_4();
    }
    uint64_t v38 = *(void *)(v22 + 56);
    uint64_t v39 = *(void *)(v22 + 32);

    __swift_storeEnumTagSinglePayload(v39, 1, 1, v38);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_28();
  return v60(v59, v60, v61, v62, v63, v64, v65, v66, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC0F674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_37();
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void **)(v12 + 136);
  uint64_t v14 = sub_24CC23DA0();
  __swift_project_value_buffer(v14, (uint64_t)qword_2698195F0);
  id v15 = v13;
  id v16 = v13;
  char v17 = (void *)sub_24CC23D80();
  os_log_type_t v18 = sub_24CC24080();
  BOOL v19 = OUTLINED_FUNCTION_16_4(v18);
  uint64_t v20 = *(void **)(v12 + 136);
  if (v19)
  {
    a9 = *(void **)(v12 + 104);
    swift_slowAlloc();
    swift_slowAlloc();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    *(void *)(v12 + 16) = _swift_stdlib_bridgeErrorToNSError();
    sub_24CC240C0();
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v21, v22, "DeviceExpertTellMeGeneratedFlow#findBestResults - Error evaluating best result: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  OUTLINED_FUNCTION_40_0(*(void *)(v12 + 32), v23, v24, *(void *)(v12 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12);
}

uint64_t sub_24CC0F838()
{
  OUTLINED_FUNCTION_16();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = type metadata accessor for TipSnippetModel(0);
  v1[12] = v3;
  OUTLINED_FUNCTION_49(v3);
  v1[13] = OUTLINED_FUNCTION_48();
  uint64_t v4 = type metadata accessor for SummarizedAnswerSnippetModel();
  v1[14] = v4;
  OUTLINED_FUNCTION_49(v4);
  v1[15] = OUTLINED_FUNCTION_48();
  uint64_t v5 = type metadata accessor for ListStyleAnswerSnippetModel();
  v1[16] = v5;
  OUTLINED_FUNCTION_49(v5);
  v1[17] = OUTLINED_FUNCTION_48();
  uint64_t v6 = type metadata accessor for LearnMoreSnippetModel();
  OUTLINED_FUNCTION_49(v6);
  v1[18] = OUTLINED_FUNCTION_48();
  uint64_t v7 = type metadata accessor for TellMeGeneratedSnippetModels();
  v1[19] = v7;
  OUTLINED_FUNCTION_49(v7);
  v1[20] = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC0F944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  uint64_t v11 = MEMORY[0x263F8EE78];
  v10[2] = MEMORY[0x263F8EE78];
  sub_24CBE71AC(v10[10], v10[20]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24CC15430(v10[20], v10[18], (void (*)(void))type metadata accessor for LearnMoreSnippetModel);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      sub_24CC23910();
      sub_24CC1EE00();
      OUTLINED_FUNCTION_46_0();
      v10[21] = v11;
      id v16 = (void *)swift_task_alloc();
      v10[22] = v16;
      *id v16 = v10;
      char v17 = sub_24CC0FD90;
      goto LABEL_14;
    case 2u:
      sub_24CC15430(v10[20], v10[17], (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
      v10[25] = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      sub_24CC23910();
      sub_24CC1EE00();
      OUTLINED_FUNCTION_46_0();
      v10[26] = v10 + 6;
      id v16 = (void *)swift_task_alloc();
      v10[27] = v16;
      *id v16 = v10;
      char v17 = sub_24CC0FFE0;
      goto LABEL_14;
    case 3u:
      sub_24CC15430(v10[20], v10[15], (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
      sub_24CC23910();
      sub_24CC1EE00();
      OUTLINED_FUNCTION_46_0();
      v10[38] = v10 + 5;
      id v16 = (void *)swift_task_alloc();
      v10[39] = v16;
      *id v16 = v10;
      char v17 = sub_24CC10700;
LABEL_14:
      v16[1] = v17;
      OUTLINED_FUNCTION_57_0();
      goto LABEL_16;
    case 5u:
      sub_24CC15430(v10[20], v10[13], (void (*)(void))type metadata accessor for TipSnippetModel);
      self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818BB0);
      sub_24CC23910();
      sub_24CC17364(v10[3]);
      swift_bridgeObjectRelease();
      sub_24CBEC8F8();
      v10[42] = v18;
      BOOL v19 = (void *)swift_task_alloc();
      v10[43] = v19;
      *BOOL v19 = v10;
      v19[1] = sub_24CC10950;
LABEL_16:
      OUTLINED_FUNCTION_25_1();
      uint64_t result = sub_24CC1211C(v20, v21, v22);
      break;
    default:
      sub_24CC15490(v10[20], (void (*)(void))type metadata accessor for TellMeGeneratedSnippetModels);
      if (*(void *)(v10[2] + 16))
      {
        OUTLINED_FUNCTION_51_0();
        do
        {
          OUTLINED_FUNCTION_55_0();
          if (v12)
          {
            id v13 = v12;
            OUTLINED_FUNCTION_59();
            OUTLINED_FUNCTION_26_2();
            if (v14) {
              OUTLINED_FUNCTION_12_5();
            }
            OUTLINED_FUNCTION_35_0();
            sub_24CC23FC0();
          }
          OUTLINED_FUNCTION_53_0();
        }
        while (!v15);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      OUTLINED_FUNCTION_11_5();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_7_6();
      OUTLINED_FUNCTION_25_1();
      uint64_t result = v27(v25, v26, v27, v28, v29, v30, v31, v32, v11, a10);
      break;
  }
  return result;
}

uint64_t sub_24CC0FD90()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v7 + 184) = v6;
  *(void *)(v7 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC0FE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x25330C740]();
  OUTLINED_FUNCTION_39_0();
  if (v12) {
    OUTLINED_FUNCTION_28_0();
  }
  uint64_t v13 = *(void *)(v10 + 144);
  sub_24CC24000();
  sub_24CC23FC0();
  sub_24CC15490(v13, (void (*)(void))type metadata accessor for LearnMoreSnippetModel);
  OUTLINED_FUNCTION_62();
  if (v11)
  {
    OUTLINED_FUNCTION_51_0();
    do
    {
      OUTLINED_FUNCTION_55_0();
      if (v14)
      {
        id v15 = v14;
        OUTLINED_FUNCTION_59();
        OUTLINED_FUNCTION_26_2();
        if (v12) {
          OUTLINED_FUNCTION_12_5();
        }
        OUTLINED_FUNCTION_35_0();
        sub_24CC23FC0();
      }
      OUTLINED_FUNCTION_53_0();
    }
    while (!v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_11_5();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_1();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10);
}

uint64_t sub_24CC0FFE0()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v7 + 224) = v6;
  *(void *)(v7 + 232) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC100E8()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_37();
  MEMORY[0x25330C740]();
  if (*(void *)(v0[2] + 16) >= *(void *)(v0[2] + 24) >> 1) {
    sub_24CC23FD0();
  }
  sub_24CC24000();
  sub_24CC23FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B80);
  sub_24CC23910();
  int64_t v1 = *(void *)(v0[7] + 16);
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_24CC21208(0, v1, 0);
    uint64_t v2 = 0;
    uint64_t v3 = v16;
    do
    {
      swift_bridgeObjectRetain();
      sub_24CC1EE00();
      uint64_t v5 = v4;
      uint64_t v7 = v6;
      swift_bridgeObjectRelease();
      unint64_t v9 = *(void *)(v16 + 16);
      unint64_t v8 = *(void *)(v16 + 24);
      if (v9 >= v8 >> 1) {
        sub_24CC21208((char *)(v8 > 1), v9 + 1, 1);
      }
      ++v2;
      *(void *)(v16 + 16) = v9 + 1;
      uint64_t v10 = v16 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  v0[30] = v3;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[31] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24CC102C4;
  OUTLINED_FUNCTION_6();
  return sub_24CC125C0(v12, v13);
}

uint64_t sub_24CC102C4()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 256) = v5;
  *(void *)(v3 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24CC103C4()
{
  OUTLINED_FUNCTION_58();
  MEMORY[0x25330C740]();
  OUTLINED_FUNCTION_39_0();
  if (v1) {
    OUTLINED_FUNCTION_28_0();
  }
  sub_24CC24000();
  sub_24CC23FC0();
  sub_24CC23910();
  sub_24CC1EE00();
  OUTLINED_FUNCTION_46_0();
  *(void *)(v0 + 272) = v0 + 64;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v2;
  void *v2 = v0;
  v2[1] = sub_24CC104B8;
  uint64_t v3 = OUTLINED_FUNCTION_57_0();
  return sub_24CC1211C(v3, v4, v5);
}

uint64_t sub_24CC104B8()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 288) = v5;
  *(void *)(v3 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24CC105B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x25330C740]();
  OUTLINED_FUNCTION_39_0();
  if (v12) {
    OUTLINED_FUNCTION_28_0();
  }
  uint64_t v13 = *(void *)(v10 + 136);
  sub_24CC24000();
  sub_24CC23FC0();
  sub_24CC15490(v13, (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
  OUTLINED_FUNCTION_62();
  if (v11)
  {
    OUTLINED_FUNCTION_51_0();
    do
    {
      OUTLINED_FUNCTION_55_0();
      if (v14)
      {
        id v15 = v14;
        OUTLINED_FUNCTION_59();
        OUTLINED_FUNCTION_26_2();
        if (v12) {
          OUTLINED_FUNCTION_12_5();
        }
        OUTLINED_FUNCTION_35_0();
        sub_24CC23FC0();
      }
      OUTLINED_FUNCTION_53_0();
    }
    while (!v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_11_5();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_1();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10);
}

uint64_t sub_24CC10700()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v7 + 320) = v6;
  *(void *)(v7 + 328) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC10808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x25330C740]();
  OUTLINED_FUNCTION_39_0();
  if (v12) {
    OUTLINED_FUNCTION_28_0();
  }
  uint64_t v13 = *(void *)(v10 + 120);
  sub_24CC24000();
  sub_24CC23FC0();
  sub_24CC15490(v13, (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel);
  OUTLINED_FUNCTION_62();
  if (v11)
  {
    OUTLINED_FUNCTION_51_0();
    do
    {
      OUTLINED_FUNCTION_55_0();
      if (v14)
      {
        id v15 = v14;
        OUTLINED_FUNCTION_59();
        OUTLINED_FUNCTION_26_2();
        if (v12) {
          OUTLINED_FUNCTION_12_5();
        }
        OUTLINED_FUNCTION_35_0();
        sub_24CC23FC0();
      }
      OUTLINED_FUNCTION_53_0();
    }
    while (!v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_11_5();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_1();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10);
}

uint64_t sub_24CC10950()
{
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_10();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v5 = v4;
  *(void *)(v7 + 352) = v6;
  *(void *)(v7 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC10A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x25330C740]();
  OUTLINED_FUNCTION_39_0();
  if (v12) {
    OUTLINED_FUNCTION_28_0();
  }
  uint64_t v13 = *(void *)(v10 + 104);
  sub_24CC24000();
  sub_24CC23FC0();
  sub_24CC15490(v13, (void (*)(void))type metadata accessor for TipSnippetModel);
  OUTLINED_FUNCTION_62();
  if (v11)
  {
    OUTLINED_FUNCTION_51_0();
    do
    {
      OUTLINED_FUNCTION_55_0();
      if (v14)
      {
        id v15 = v14;
        OUTLINED_FUNCTION_59();
        OUTLINED_FUNCTION_26_2();
        if (v12) {
          OUTLINED_FUNCTION_12_5();
        }
        OUTLINED_FUNCTION_35_0();
        sub_24CC23FC0();
      }
      OUTLINED_FUNCTION_53_0();
    }
    while (!v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_11_5();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_1();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10);
}

uint64_t sub_24CC10BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 144), (void (*)(void))type metadata accessor for LearnMoreSnippetModel);
  char v16 = *(void **)(v14 + 192);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC10DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 136), (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
  char v16 = *(void **)(v14 + 232);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC10FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 136), (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
  char v16 = *(void **)(v14 + 264);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC111C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 136), (void (*)(void))type metadata accessor for ListStyleAnswerSnippetModel);
  char v16 = *(void **)(v14 + 296);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC113CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 120), (void (*)(void))type metadata accessor for SummarizedAnswerSnippetModel);
  char v16 = *(void **)(v14 + 328);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC115D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_45_0();
  sub_24CC15490(*(void *)(v14 + 104), (void (*)(void))type metadata accessor for TipSnippetModel);
  char v16 = *(void **)(v14 + 360);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v17 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_38_0(v17, (uint64_t)qword_2698195F0);
  id v18 = v16;
  BOOL v19 = (void *)sub_24CC23D80();
  os_log_type_t v20 = sub_24CC24080();
  if (OUTLINED_FUNCTION_16_4(v20))
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_19_2();
    OUTLINED_FUNCTION_10_5(5.7779e-34);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_4_6(v21);
    OUTLINED_FUNCTION_43_0();

    OUTLINED_FUNCTION_8_3(&dword_24CBD5000, v22, v23, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
  }
  else
  {
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_18_1();
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void **)(v24 + 32);
    do
    {
      uint64_t v27 = *v25++;
      uint64_t v26 = v27;
      if (v27)
      {
        id v28 = v26;
        OUTLINED_FUNCTION_50_0();
        OUTLINED_FUNCTION_21_2();
        if (v29) {
          OUTLINED_FUNCTION_9_5();
        }
        OUTLINED_FUNCTION_33_1();
        sub_24CC23FC0();
      }
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_17_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_28();
  return v32(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_24CC117D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24CC117F4, 0, 0);
}

uint64_t sub_24CC117F4()
{
  OUTLINED_FUNCTION_16();
  sub_24CBEF25C(*(void *)(v0 + 24), *(void *)(v0 + 16));
  OUTLINED_FUNCTION_52();
  return v1();
}

uint64_t sub_24CC11850(uint64_t a1)
{
  uint64_t v43 = sub_24CC23B80();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CC23B90();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void **)((char *)&v40 - v12);
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24CC23DA0();
  __swift_project_value_buffer(v14, (uint64_t)qword_2698195F0);
  uint64_t v15 = sub_24CC23D80();
  os_log_type_t v16 = sub_24CC24070();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_42_0();
    uint64_t v41 = (uint8_t *)v7;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_24CBD5000, v15, v16, "DeviceExpertTellMeGeneratedFlow#onInput", v17, 2u);
    uint64_t v7 = (uint64_t)v41;
    OUTLINED_FUNCTION_4();
  }

  sub_24CC23B70();
  if ((*(unsigned int (**)(void **, uint64_t))(v9 + 88))(v13, v7) != *MEMORY[0x263F6FF68])
  {
    (*(void (**)(void **, uint64_t))(v9 + 8))(v13, v7);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v43);
    id v28 = sub_24CC23D80();
    os_log_type_t v29 = sub_24CC24080();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)OUTLINED_FUNCTION_9();
      uint64_t v42 = OUTLINED_FUNCTION_65();
      uint64_t v45 = v42;
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v41 = v30 + 4;
      sub_24CC23B70();
      uint64_t v31 = sub_24CC23F20();
      uint64_t v44 = sub_24CC12DF0(v31, v32, &v45);
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      uint64_t v33 = OUTLINED_FUNCTION_66();
      v34(v33);
      _os_log_impl(&dword_24CBD5000, v28, v29, "DeviceExpertTellMeGeneratedFlow#onInput - Parse is of unexpected type: %s", v30, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
    }
    else
    {
      uint64_t v35 = OUTLINED_FUNCTION_66();
      v36(v35);
    }

    return 0;
  }
  (*(void (**)(void **, uint64_t))(v9 + 96))(v13, v7);
  id v18 = *v13;
  unint64_t v19 = sub_24CC23D60();
  unint64_t v20 = v19;
  if (!(v19 >> 62))
  {
    uint64_t result = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_8;
    }
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v37 = sub_24CC23D80();
    os_log_type_t v38 = sub_24CC24080();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)OUTLINED_FUNCTION_42_0();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_24CBD5000, v37, v38, "DeviceExpertTellMeGeneratedFlow#onInput - Unexpected experience in pommes", v39, 2u);
      OUTLINED_FUNCTION_4();
    }
    else
    {
    }
    return 0;
  }
  uint64_t result = sub_24CC241E0();
  if (!result) {
    goto LABEL_19;
  }
LABEL_8:
  if ((v20 & 0xC000000000000001) != 0)
  {
    id v22 = (id)MEMORY[0x25330C8C0](0, v20);
    goto LABEL_11;
  }
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v22 = *(id *)(v20 + 32);
LABEL_11:
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    sub_24CC23CF0();
    uint64_t v24 = swift_dynamicCastClass();
    if (v24)
    {
      uint64_t v25 = v24;
      id v26 = v18;
      sub_24CC0C838((uint64_t)v18);
      id v27 = v23;
      sub_24CC0C844(v25);

      return 1;
    }

    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CC11D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_24CC237D0();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t DeviceExpertTellMeGeneratedFlow.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  swift_release();
  sub_24CC150A0(v0 + 208);
  __swift_destroy_boxed_opaque_existential_1(v0 + 248);

  sub_24CC13674(*(void *)(v0 + 304), *(void *)(v0 + 312));
  return v0;
}

uint64_t DeviceExpertTellMeGeneratedFlow.__deallocating_deinit()
{
  DeviceExpertTellMeGeneratedFlow.deinit();
  return MEMORY[0x270FA0228](v0, 336, 7);
}

uint64_t sub_24CC11E7C(uint64_t a1)
{
  return sub_24CC11850(a1) & 1;
}

uint64_t sub_24CC11EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24CC11F54;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_24CC11F54()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_24CC12020()
{
  return sub_24CC0CAB8();
}

uint64_t sub_24CC12044()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CBF7060;
  return sub_24CC0CB84();
}

uint64_t sub_24CC120E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DeviceExpertTellMeGeneratedFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_24CC1211C(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 96) = a3;
  *(void *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F58);
  *(void *)(v4 + 40) = swift_task_alloc();
  uint64_t v5 = sub_24CC23C50();
  *(void *)(v4 + 48) = v5;
  *(void *)(v4 + 56) = *(void *)(v5 - 8);
  *(void *)(v4 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC12214, 0, 0);
}

uint64_t sub_24CC12214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_0();
  unint64_t v11 = v10[3];
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = v10[2] & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    uint64_t v14 = v10[7];
    uint64_t v13 = v10[8];
    uint64_t v16 = v10[5];
    uint64_t v15 = v10[6];
    swift_bridgeObjectRetain();
    sub_24CC23C40();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v16, v13, v15);
    __swift_storeEnumTagSinglePayload(v16, 0, 1, v15);
    uint64_t v17 = (void *)swift_task_alloc();
    v10[9] = v17;
    *uint64_t v17 = v10;
    v17[1] = sub_24CC12374;
    OUTLINED_FUNCTION_25_1();
    return sub_24CBFD55C();
  }
  else
  {
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_25_1();
    return v22(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10);
  }
}

uint64_t sub_24CC12374()
{
  OUTLINED_FUNCTION_58();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v6 = v5;
  *uint64_t v6 = *v1;
  *(void *)(v5 + 80) = v0;
  swift_task_dealloc();
  uint64_t v7 = *(void *)(v4 + 40);
  if (!v0) {
    *(void *)(v5 + 88) = v3;
  }
  sub_24CBDC220(v7, &qword_269818F58);
  OUTLINED_FUNCTION_20();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24CC124BC()
{
  OUTLINED_FUNCTION_16();
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_7_6();
  return v2(v1);
}

uint64_t sub_24CC12540()
{
  OUTLINED_FUNCTION_16();
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v1();
}

uint64_t sub_24CC125C0(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 88) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = sub_24CC23C50();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = *(void *)(v4 - 8);
  *(void *)(v3 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CC12684, 0, 0);
}

uint64_t sub_24CC12684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_37();
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v15 = sub_24CC1378C(1, *(void *)(v13 + 16));
    int64_t v16 = *(void *)(v15 + 16);
    uint64_t v17 = MEMORY[0x263F8EE78];
    if (v16)
    {
      uint64_t v45 = MEMORY[0x263F8EE78];
      sub_24CC21258(0, v16, 0);
      uint64_t v18 = 0;
      uint64_t v19 = v45;
      unint64_t v20 = *(void *)(v45 + 16);
      do
      {
        uint64_t v21 = *(void *)(v15 + 8 * v18 + 32);
        unint64_t v22 = *(void *)(v45 + 24);
        if (v20 >= v22 >> 1) {
          sub_24CC21258((char *)(v22 > 1), v20 + 1, 1);
        }
        ++v18;
        *(void *)(v45 + 16) = v20 + 1;
        *(double *)(v45 + 8 * v20++ + 32) = (double)v21;
      }
      while (v16 != v18);
      swift_release();
      uint64_t v17 = MEMORY[0x263F8EE78];
    }
    else
    {
      swift_release();
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
    *(void *)(v12 + 56) = v19;
    uint64_t v32 = *(void *)(v12 + 40);
    uint64_t v33 = *(void *)(v12 + 16);
    sub_24CC211A4();
    uint64_t v34 = v33 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_24CC23C40();
      unint64_t v35 = *(void *)(v17 + 16);
      if (v35 >= *(void *)(v17 + 24) >> 1) {
        sub_24CC211A4();
      }
      *(void *)(v12 + 64) = v17;
      uint64_t v36 = *(void *)(v12 + 48);
      uint64_t v37 = *(void *)(v12 + 32);
      *(void *)(v17 + 16) = v35 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v32 + 32))(v17+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(void *)(v32 + 72) * v35, v36, v37);
      v34 += 16;
      --v14;
    }
    while (v14);
    if (*(unsigned char *)(v12 + 88) == 1)
    {
      os_log_type_t v38 = (void *)swift_task_alloc();
      *(void *)(v12 + 72) = v38;
      *os_log_type_t v38 = v12;
      v38[1] = sub_24CC12990;
      OUTLINED_FUNCTION_6();
      return sub_24CBFD928(v39, v40);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v42 = (void *)swift_task_alloc();
      *(void *)(v12 + 80) = v42;
      *uint64_t v42 = v12;
      v42[1] = sub_24CC12AE8;
      OUTLINED_FUNCTION_6();
      return sub_24CBFD2C0(v43);
    }
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_6();
    return v25(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12);
  }
}

uint64_t sub_24CC12990()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v9 = OUTLINED_FUNCTION_63();
    return v10(v9);
  }
}

uint64_t sub_24CC12AE8()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v9 = OUTLINED_FUNCTION_63();
    return v10(v9);
  }
}

uint64_t sub_24CC12C24(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24CC12C34(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24CC12C70(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_24CC241C0();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_24CC237D0();
      uint64_t v2 = sub_24CC23FF0();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    sub_24CC237D0();
    return v2;
  }
  return result;
}

uint64_t sub_24CC12D50(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24CC12D78(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24CC12DF0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24CC240C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24CC12DF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_20();
  uint64_t v9 = sub_24CC12EC0(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_24CBE5D78((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_24CBE5D78((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_24CC12EC0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24CC13018((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24CC240D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24CC130F0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_24CC24140();
    if (!v8)
    {
      uint64_t result = sub_24CC241C0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_24CC13018(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24CC241F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24CC130F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CC13188(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24CC13364(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24CC13364((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CC13188(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_24CC23F60();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24CC132FC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_24CC24100();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_24CC241F0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_24CC241C0();
  __break(1u);
  return result;
}

void *sub_24CC132FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269819650);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24CC13364(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269819650);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24CC13514(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CC1343C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24CC1343C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24CC241F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_24CC13514(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24CC241F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_24CC135A4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_24CC135B4()
{
  return sub_24CC240C0();
}

uint64_t sub_24CC135DC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_24CC1360C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC13674(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CC136B8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CC136F0()
{
  OUTLINED_FUNCTION_16();
  uint64_t v3 = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24CBF7060;
  return sub_24CC117D4(v3, v0 + 16);
}

uint64_t sub_24CC1378C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v2 == -1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v5 = result;
  if (v3 <= 0)
  {
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269819668);
    uint64_t v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v3;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 8);
  }
  uint64_t result = sub_24CC14CE8((uint64_t)&v8, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == v3) {
    return (uint64_t)v6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_24CC1385C(uint64_t *a1)
{
  uint64_t v2 = *(void *)(sub_24CC237D0() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_24CC14D74();
    uint64_t v3 = v4;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_24CC13904(v6);
  *a1 = v3;
}

void sub_24CC13904(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v154 = sub_24CC237D0();
  uint64_t v145 = *(void **)(v154 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v154);
  v142 = (char *)&v136 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v157 = (char *)&v136 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v152 = (char *)&v136 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v153 = (char *)&v136 - v10;
  uint64_t v11 = a1[1];
  uint64_t v12 = sub_24CC242F0();
  if (v12 >= v11)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11) {
        sub_24CC143F4(0, v11, 1, a1);
      }
      return;
    }
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
    goto LABEL_143;
  }
  uint64_t v13 = v12;
  uint64_t v138 = sub_24CC12C70(v11 / 2);
  unint64_t v144 = v14;
  uint64_t v139 = v11;
  if (v11 <= 0)
  {
    int64_t v16 = (char *)MEMORY[0x263F8EE78];
    unint64_t v78 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_101:
    if (v78 < 2) {
      goto LABEL_115;
    }
    uint64_t v128 = *a1;
    while (1)
    {
      unint64_t v129 = v78 - 2;
      if (v78 < 2) {
        break;
      }
      if (!v128) {
        goto LABEL_147;
      }
      int v130 = v16;
      uint64_t v131 = v16 + 32;
      uint64_t v132 = *(void *)&v16[16 * v129 + 32];
      uint64_t v133 = *(void *)&v16[16 * v78 + 24];
      sub_24CC146D4(v128 + v145[9] * v132, v128 + v145[9] * *(void *)&v131[16 * v78 - 16], v128 + v145[9] * v133, v144);
      if (v2) {
        goto LABEL_113;
      }
      if (v133 < v132) {
        goto LABEL_134;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v130 = sub_24CC14CD4((uint64_t)v130);
      }
      if (v129 >= *((void *)v130 + 2)) {
        goto LABEL_135;
      }
      uint64_t v134 = &v130[16 * v129 + 32];
      *(void *)uint64_t v134 = v132;
      *((void *)v134 + 1) = v133;
      unint64_t v135 = *((void *)v130 + 2);
      if (v78 > v135) {
        goto LABEL_136;
      }
      int64_t v16 = v130;
      memmove(&v130[16 * v78 + 16], &v130[16 * v78 + 32], 16 * (v135 - v78));
      *((void *)v130 + 2) = v135 - 1;
      unint64_t v78 = v135 - 1;
      if (v135 <= 2) {
        goto LABEL_115;
      }
    }
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
    goto LABEL_139;
  }
  uint64_t v137 = v13;
  uint64_t v15 = 0;
  uint64_t v150 = (void (**)(char *, uint64_t))(v145 + 1);
  v151 = v145 + 2;
  v160 = (void (**)(char *, char *, uint64_t))(v145 + 4);
  int64_t v16 = (char *)MEMORY[0x263F8EE78];
  v156 = a1;
  while (1)
  {
    uint64_t v17 = v15;
    uint64_t v18 = v15 + 1;
    uint64_t v143 = v15;
    if (v15 + 1 >= v11)
    {
      uint64_t v34 = v15 + 1;
      a1 = v156;
    }
    else
    {
      uint64_t v19 = *v156;
      uint64_t v147 = v19;
      uint64_t v149 = v11;
      uint64_t v159 = v145[9];
      uint64_t v20 = v159;
      uint64_t v21 = (char *)v145[2];
      uint64_t v22 = v154;
      ((void (*)(char *, uint64_t, uint64_t))v21)(v153, v19 + v159 * v18, v154);
      uint64_t v23 = v19 + v20 * v17;
      uint64_t v24 = v152;
      uint64_t v158 = v21;
      ((void (*)(char *, uint64_t, uint64_t))v21)(v152, v23, v22);
      uint64_t v25 = v153;
      sub_24CC23660();
      float v27 = v26;
      sub_24CC23660();
      float v29 = v28;
      uint64_t v30 = (void (*)(char *, uint64_t))v145[1];
      uint64_t v11 = v149;
      v30(v24, v22);
      uint64_t v31 = v22;
      uint64_t v32 = v147;
      v30(v25, v31);
      uint64_t v33 = v159;
      uint64_t v34 = v143 + 2;
      if (v143 + 2 < v11)
      {
        uint64_t v136 = v2;
        uint64_t v140 = v16;
        uint64_t v155 = v159 * v18;
        uint64_t v148 = v159 * v34;
        while (1)
        {
          uint64_t v35 = v34;
          uint64_t v36 = v153;
          uint64_t v37 = v154;
          os_log_type_t v38 = v158;
          ((void (*)(char *, uint64_t, uint64_t))v158)(v153, v32 + v148, v154);
          uint64_t v39 = v152;
          ((void (*)(char *, uint64_t, uint64_t))v38)(v152, v32 + v155, v37);
          sub_24CC23660();
          float v41 = v40;
          sub_24CC23660();
          BOOL v43 = v42 >= v41;
          v30(v39, v37);
          v30(v36, v37);
          if (v29 < v27 == v43) {
            break;
          }
          uint64_t v34 = v35 + 1;
          uint64_t v33 = v159;
          v32 += v159;
          uint64_t v11 = v149;
          if (v34 >= v149)
          {
            uint64_t v34 = v149;
            int64_t v16 = v140;
            uint64_t v2 = v136;
            goto LABEL_12;
          }
        }
        int64_t v16 = v140;
        uint64_t v2 = v136;
        uint64_t v34 = v35;
        uint64_t v11 = v149;
        uint64_t v33 = v159;
      }
LABEL_12:
      a1 = v156;
      uint64_t v17 = v143;
      if (v29 < v27)
      {
        if (v34 < v143) {
          goto LABEL_140;
        }
        if (v143 < v34)
        {
          uint64_t v140 = v16;
          uint64_t v44 = 0;
          uint64_t v45 = v33 * (v34 - 1);
          uint64_t v46 = v34 * v33;
          uint64_t v47 = v143;
          uint64_t v48 = v143 * v33;
          uint64_t v155 = v34;
          do
          {
            if (v47 != v34 + v44 - 1)
            {
              uint64_t v49 = v147;
              if (!v147) {
                goto LABEL_146;
              }
              uint64_t v50 = v2;
              unint64_t v51 = v147 + v48;
              uint64_t v158 = (char *)(v147 + v45);
              uint64_t v52 = v154;
              uint64_t v148 = (uint64_t)*v160;
              ((void (*)(char *, uint64_t, uint64_t))v148)(v142, v147 + v48, v154);
              if (v48 < v45 || v51 >= v49 + v46)
              {
                swift_arrayInitWithTakeFrontToBack();
                uint64_t v33 = v159;
              }
              else
              {
                uint64_t v33 = v159;
                if (v48 != v45) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              ((void (*)(char *, char *, uint64_t))v148)(v158, v142, v52);
              uint64_t v2 = v50;
              uint64_t v34 = v155;
              a1 = v156;
            }
            ++v47;
            --v44;
            v45 -= v33;
            v46 -= v33;
            v48 += v33;
          }
          while (v47 < v34 + v44);
          int64_t v16 = v140;
          uint64_t v17 = v143;
          uint64_t v11 = v149;
        }
      }
    }
    if (v34 < v11)
    {
      if (__OFSUB__(v34, v17)) {
        goto LABEL_138;
      }
      if (v34 - v17 < v137)
      {
        if (__OFADD__(v17, v137)) {
          goto LABEL_141;
        }
        if (v17 + v137 >= v11) {
          uint64_t v54 = v11;
        }
        else {
          uint64_t v54 = v17 + v137;
        }
        if (v54 < v17) {
          goto LABEL_142;
        }
        if (v34 != v54)
        {
          uint64_t v140 = v16;
          uint64_t v136 = v2;
          uint64_t v55 = v145[9];
          uint64_t v146 = (void (*)(char *, uint64_t, uint64_t))v145[2];
          uint64_t v147 = v55;
          uint64_t v56 = v55 * (v34 - 1);
          uint64_t v57 = v34 * v55;
          uint64_t v58 = v154;
          uint64_t v141 = v54;
          do
          {
            uint64_t v59 = 0;
            uint64_t v155 = v34;
            uint64_t v148 = v57;
            uint64_t v149 = v56;
            while (1)
            {
              uint64_t v60 = *a1;
              uint64_t v158 = (char *)(v57 + v59);
              uint64_t v159 = v17;
              uint64_t v61 = (char *)(v57 + v59 + v60);
              uint64_t v62 = v153;
              uint64_t v63 = v146;
              v146(v153, (uint64_t)v61, v58);
              uint64_t v64 = v56 + v59 + v60;
              uint64_t v65 = a1;
              uint64_t v66 = v152;
              v63(v152, v64, v58);
              sub_24CC23660();
              float v68 = v67;
              sub_24CC23660();
              float v70 = v69;
              uint64_t v71 = *v150;
              (*v150)(v66, v58);
              v71(v62, v58);
              if (v70 >= v68) {
                break;
              }
              uint64_t v72 = *v65;
              if (!*v65) {
                goto LABEL_144;
              }
              uint64_t v57 = v148;
              uint64_t v56 = v149;
              uint64_t v73 = (char *)(v72 + v149 + v59);
              uint64_t v74 = *v160;
              uint64_t v58 = v154;
              (*v160)(v157, (char *)(v72 + v148 + v59), v154);
              swift_arrayInitWithTakeFrontToBack();
              v74(v73, v157, v58);
              v59 -= v147;
              uint64_t v17 = v159 + 1;
              uint64_t v75 = v155;
              a1 = v156;
              if (v155 == v159 + 1) {
                goto LABEL_45;
              }
            }
            uint64_t v58 = v154;
            uint64_t v75 = v155;
            a1 = v65;
            uint64_t v57 = v148;
            uint64_t v56 = v149;
LABEL_45:
            uint64_t v34 = v75 + 1;
            v56 += v147;
            v57 += v147;
            uint64_t v17 = v143;
          }
          while (v34 != v141);
          uint64_t v34 = v141;
          uint64_t v2 = v136;
          int64_t v16 = v140;
        }
      }
    }
    if (v34 < v17) {
      goto LABEL_137;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v16 = sub_24CC14BDC(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v77 = *((void *)v16 + 2);
    unint64_t v76 = *((void *)v16 + 3);
    unint64_t v78 = v77 + 1;
    if (v77 >= v76 >> 1) {
      int64_t v16 = sub_24CC14BDC((char *)(v76 > 1), v77 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v78;
    uint64_t v79 = v16 + 32;
    uint64_t v80 = &v16[16 * v77 + 32];
    *(void *)uint64_t v80 = v143;
    *((void *)v80 + 1) = v34;
    uint64_t v155 = v34;
    if (v77) {
      break;
    }
    unint64_t v78 = 1;
LABEL_95:
    uint64_t v11 = a1[1];
    uint64_t v15 = v155;
    if (v155 >= v11) {
      goto LABEL_101;
    }
  }
  while (1)
  {
    unint64_t v81 = v78 - 1;
    if (v78 >= 4)
    {
      uint64_t v86 = &v79[16 * v78];
      uint64_t v87 = *((void *)v86 - 8);
      uint64_t v88 = *((void *)v86 - 7);
      BOOL v92 = __OFSUB__(v88, v87);
      uint64_t v89 = v88 - v87;
      if (v92) {
        goto LABEL_122;
      }
      uint64_t v91 = *((void *)v86 - 6);
      uint64_t v90 = *((void *)v86 - 5);
      BOOL v92 = __OFSUB__(v90, v91);
      uint64_t v84 = v90 - v91;
      char v85 = v92;
      if (v92) {
        goto LABEL_123;
      }
      unint64_t v93 = v78 - 2;
      uint64_t v94 = &v79[16 * v78 - 32];
      uint64_t v96 = *(void *)v94;
      uint64_t v95 = *((void *)v94 + 1);
      BOOL v92 = __OFSUB__(v95, v96);
      uint64_t v97 = v95 - v96;
      if (v92) {
        goto LABEL_124;
      }
      BOOL v92 = __OFADD__(v84, v97);
      uint64_t v98 = v84 + v97;
      if (v92) {
        goto LABEL_126;
      }
      if (v98 >= v89)
      {
        char v116 = &v79[16 * v81];
        uint64_t v118 = *(void *)v116;
        uint64_t v117 = *((void *)v116 + 1);
        BOOL v92 = __OFSUB__(v117, v118);
        uint64_t v119 = v117 - v118;
        if (v92) {
          goto LABEL_132;
        }
        BOOL v109 = v84 < v119;
        goto LABEL_84;
      }
    }
    else
    {
      if (v78 != 3)
      {
        uint64_t v110 = *((void *)v16 + 4);
        uint64_t v111 = *((void *)v16 + 5);
        BOOL v92 = __OFSUB__(v111, v110);
        uint64_t v103 = v111 - v110;
        char v104 = v92;
        goto LABEL_78;
      }
      uint64_t v83 = *((void *)v16 + 4);
      uint64_t v82 = *((void *)v16 + 5);
      BOOL v92 = __OFSUB__(v82, v83);
      uint64_t v84 = v82 - v83;
      char v85 = v92;
    }
    if (v85) {
      goto LABEL_125;
    }
    unint64_t v93 = v78 - 2;
    uint64_t v99 = &v79[16 * v78 - 32];
    uint64_t v101 = *(void *)v99;
    uint64_t v100 = *((void *)v99 + 1);
    BOOL v102 = __OFSUB__(v100, v101);
    uint64_t v103 = v100 - v101;
    char v104 = v102;
    if (v102) {
      goto LABEL_127;
    }
    uint64_t v105 = &v79[16 * v81];
    uint64_t v107 = *(void *)v105;
    uint64_t v106 = *((void *)v105 + 1);
    BOOL v92 = __OFSUB__(v106, v107);
    uint64_t v108 = v106 - v107;
    if (v92) {
      goto LABEL_129;
    }
    if (__OFADD__(v103, v108)) {
      goto LABEL_131;
    }
    if (v103 + v108 >= v84)
    {
      BOOL v109 = v84 < v108;
LABEL_84:
      if (v109) {
        unint64_t v81 = v93;
      }
      goto LABEL_86;
    }
LABEL_78:
    if (v104) {
      goto LABEL_128;
    }
    uint64_t v112 = &v79[16 * v81];
    uint64_t v114 = *(void *)v112;
    uint64_t v113 = *((void *)v112 + 1);
    BOOL v92 = __OFSUB__(v113, v114);
    uint64_t v115 = v113 - v114;
    if (v92) {
      goto LABEL_130;
    }
    if (v115 < v103) {
      goto LABEL_95;
    }
LABEL_86:
    unint64_t v120 = v81 - 1;
    if (v81 - 1 >= v78)
    {
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    uint64_t v121 = *a1;
    if (!*a1) {
      goto LABEL_145;
    }
    uint64_t v122 = v16;
    uint64_t v123 = &v79[16 * v120];
    uint64_t v124 = *(void *)v123;
    uint64_t v125 = &v79[16 * v81];
    uint64_t v126 = *((void *)v125 + 1);
    sub_24CC146D4(v121 + v145[9] * *(void *)v123, v121 + v145[9] * *(void *)v125, v121 + v145[9] * v126, v144);
    if (v2) {
      break;
    }
    if (v126 < v124) {
      goto LABEL_119;
    }
    if (v81 > *((void *)v122 + 2)) {
      goto LABEL_120;
    }
    *(void *)uint64_t v123 = v124;
    *(void *)&v79[16 * v120 + 8] = v126;
    unint64_t v127 = *((void *)v122 + 2);
    if (v81 >= v127) {
      goto LABEL_121;
    }
    int64_t v16 = v122;
    unint64_t v78 = v127 - 1;
    memmove(&v79[16 * v81], v125 + 16, 16 * (v127 - 1 - v81));
    *((void *)v122 + 2) = v127 - 1;
    a1 = v156;
    if (v127 <= 2) {
      goto LABEL_95;
    }
  }
LABEL_113:
  swift_bridgeObjectRelease();
  if (v139 >= -1) {
    goto LABEL_116;
  }
  __break(1u);
LABEL_115:
  swift_bridgeObjectRelease();
  if (v139 >= -1)
  {
LABEL_116:
    *(void *)(v138 + 16) = 0;
    swift_bridgeObjectRelease();
    return;
  }
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
}

uint64_t sub_24CC143F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = a1;
  uint64_t v7 = sub_24CC237D0();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v44 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v39 = (char *)&v31 - v11;
  uint64_t result = MEMORY[0x270FA5388](v10);
  os_log_type_t v38 = (char *)&v31 - v14;
  uint64_t v42 = a3;
  uint64_t v32 = a2;
  if (a3 != a2)
  {
    uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v37 = v13 + 16;
    uint64_t v15 = *(void *)(v13 + 72);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
    uint64_t v35 = a4;
    BOOL v43 = (void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v46 = v15 * (v42 - 1);
    uint64_t v40 = v15;
    uint64_t v16 = v15 * v42;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v45 = v33;
      uint64_t v41 = v16;
      do
      {
        uint64_t v18 = *a4;
        uint64_t v19 = v16 + v17 + *a4;
        uint64_t v20 = v38;
        uint64_t v21 = v36;
        v36(v38, v19, v7);
        uint64_t v22 = v39;
        v21(v39, v46 + v17 + v18, v7);
        a4 = v35;
        sub_24CC23660();
        float v24 = v23;
        sub_24CC23660();
        float v26 = v25;
        float v27 = *v34;
        (*v34)(v22, v7);
        uint64_t result = v27(v20, v7);
        uint64_t v16 = v41;
        if (v26 >= v24) {
          break;
        }
        uint64_t v28 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        uint64_t v29 = v28 + v46 + v17;
        uint64_t v30 = *v43;
        (*v43)(v44, v28 + v41 + v17, v7);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(v29, v44, v7);
        v17 -= v40;
        ++v45;
      }
      while (v42 != v45);
      v46 += v40;
      v16 += v40;
      if (++v42 != v32) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_24CC146D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v75 = sub_24CC237D0();
  uint64_t v9 = *(void *)(v75 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v75);
  uint64_t v73 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (char *)&v63 - v12;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  int64_t v15 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_79;
  }
  int64_t v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_80;
  }
  unint64_t v19 = a2;
  unint64_t v74 = a3;
  uint64_t v20 = v15 / v14;
  uint64_t v21 = v17 / v14;
  uint64_t v64 = v14;
  if (v15 / v14 >= v17 / v14)
  {
    sub_24CC1FD04(v19, v17 / v14, a4);
    uint64_t v22 = (void (*)(char *, unint64_t, uint64_t))(a4 + v21 * v14);
    if (v21 * v14 < 1 || a1 >= v19)
    {
      unint64_t v24 = v19;
    }
    else
    {
      uint64_t v63 = v4;
      uint64_t v69 = -v14;
      uint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v71 = v9 + 16;
      float v67 = (void (**)(char *, uint64_t))(v9 + 8);
      float v68 = v40;
      uint64_t v42 = v73;
      unint64_t v41 = v74;
      unint64_t v24 = v19;
      unint64_t v65 = a4;
      unint64_t v66 = a1;
      BOOL v43 = v72;
      do
      {
        unint64_t v44 = v41;
        uint64_t v46 = v68;
        uint64_t v45 = v69;
        unint64_t v74 = v41 + v69;
        float v70 = (void (*)(char *, unint64_t, uint64_t))((char *)v22 + v69);
        uint64_t v47 = v75;
        uint64_t v48 = v22;
        ((void (*)(char *))v68)(v43);
        unint64_t v49 = v24 + v45;
        v46(v42, v49, v47);
        sub_24CC23660();
        float v51 = v50;
        sub_24CC23660();
        float v53 = v52;
        uint64_t v54 = *v67;
        (*v67)(v42, v47);
        v54(v43, v47);
        if (v53 >= v51)
        {
          unint64_t v41 = v74;
          if (v44 < (unint64_t)v48 || v74 >= (unint64_t)v48)
          {
            uint64_t v58 = v70;
            swift_arrayInitWithTakeFrontToBack();
            uint64_t v22 = v58;
            a4 = v65;
            unint64_t v56 = v66;
          }
          else
          {
            unint64_t v56 = v66;
            if ((void (*)(char *, unint64_t, uint64_t))v44 == v48)
            {
              uint64_t v22 = v70;
            }
            else
            {
              uint64_t v59 = v70;
              swift_arrayInitWithTakeBackToFront();
              uint64_t v22 = v59;
            }
            a4 = v65;
          }
        }
        else
        {
          unint64_t v41 = v74;
          if (v44 < v24 || v74 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v24 = v49;
            a4 = v65;
            unint64_t v56 = v66;
          }
          else
          {
            unint64_t v56 = v66;
            if (v44 != v24) {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v24 = v49;
            a4 = v65;
          }
          uint64_t v22 = v48;
        }
      }
      while ((unint64_t)v22 > a4 && v24 > v56);
      uint64_t v14 = v64;
    }
  }
  else
  {
    sub_24CC1FD04(a1, v15 / v14, a4);
    uint64_t v22 = (void (*)(char *, unint64_t, uint64_t))(a4 + v20 * v14);
    if (v20 * v14 < 1 || v19 >= v74)
    {
      unint64_t v24 = a1;
    }
    else
    {
      uint64_t v63 = v4;
      float v70 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v71 = v9 + 16;
      float v68 = (void (*)(char *, unint64_t, uint64_t))(a4 + v20 * v14);
      uint64_t v69 = v9 + 8;
      float v26 = v72;
      float v27 = v73;
      uint64_t v28 = v75;
      do
      {
        uint64_t v29 = v14;
        uint64_t v30 = v70;
        v70(v26, v19, v28);
        v30(v27, a4, v28);
        sub_24CC23660();
        float v32 = v31;
        sub_24CC23660();
        float v34 = v33;
        uint64_t v35 = *(void (**)(char *, uint64_t))v69;
        (*(void (**)(char *, uint64_t))v69)(v27, v28);
        v35(v26, v28);
        if (v34 >= v32)
        {
          if (a1 < a4 || a1 >= a4 + v29)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a1 != a4)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v36 = v19;
          a4 += v29;
          uint64_t v14 = v64;
        }
        else
        {
          uint64_t v14 = v29;
          unint64_t v36 = v19 + v29;
          if (a1 < v19 || a1 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a1 != v19)
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        uint64_t v22 = v68;
        a1 += v14;
        BOOL v39 = a4 >= (unint64_t)v68 || v36 >= v74;
        unint64_t v19 = v36;
      }
      while (!v39);
      unint64_t v24 = a1;
    }
  }
  uint64_t v61 = (uint64_t)v22 - a4;
  if (v14 != -1 || v61 != 0x8000000000000000)
  {
    sub_24CC1FD04(a4, v61 / v14, v24);
    return;
  }
LABEL_81:
  __break(1u);
}

char *sub_24CC14BDC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269819670);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24CC14CD4(uint64_t a1)
{
  return sub_24CC14BDC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CC14CE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    BOOL v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    BOOL v7 = 0;
LABEL_14:
    uint64_t v8 = a4;
LABEL_15:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = v8;
    *(unsigned char *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_17;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a4;
  while (1)
  {
    BOOL v7 = v6 == a5;
    if (v6 != a5) {
      break;
    }
    uint64_t v8 = 0;
LABEL_8:
    *(void *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5) {
      goto LABEL_15;
    }
    ++v5;
    BOOL v9 = v6 == a5;
    uint64_t v6 = v8;
    if (v9)
    {
      BOOL v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  uint64_t v8 = v6 + 1;
  if (!__OFADD__(v6, 1)) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

void sub_24CC14D74()
{
}

uint64_t sub_24CC14D88(const void *a1, void *a2)
{
  v26[3] = &type metadata for ContentViewedEvent;
  v26[4] = &off_26FF26630;
  uint64_t v4 = swift_allocObject();
  v26[0] = v4;
  memcpy((void *)(v4 + 16), a1, 0x58uLL);
  sub_24CC152E0((uint64_t)a1);
  if (static DeviceExpertPreferences.shouldSendAnalytics.getter())
  {
    uint64_t v5 = sub_24CC1534C();
    if (qword_269818AB0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24CC23DA0();
    __swift_project_value_buffer(v6, (uint64_t)qword_2698195C0);
    sub_24CBEF25C((uint64_t)v26, (uint64_t)v25);
    swift_bridgeObjectRetain_n();
    BOOL v7 = sub_24CC23D80();
    os_log_type_t v8 = sub_24CC24090();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v10 = __swift_project_boxed_opaque_existential_1(v25, v25[3]);
      uint64_t v11 = *v10;
      unint64_t v12 = v10[1];
      swift_bridgeObjectRetain();
      sub_24CC12DF0(v11, v12, &v24);
      sub_24CC240C0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      *(_WORD *)(v9 + 12) = 2080;
      sub_24CBFBEC8();
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_24CC23E40();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      sub_24CC12DF0(v13, v15, &v24);
      sub_24CC240C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CBD5000, v7, v8, "Sending analytics event \"%s\" with payload %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25330D070](v23, -1, -1);
      MEMORY[0x25330D070](v9, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v16 = a2 + 2;
    uint64_t v18 = a2[5];
    uint64_t v17 = a2[6];
    __swift_project_boxed_opaque_existential_1(v16, v18);
    uint64_t v20 = *(void *)(v4 + 16);
    uint64_t v19 = *(void *)(v4 + 24);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
    swift_bridgeObjectRetain();
    v21(v20, v19, v5, v18, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

uint64_t sub_24CC150A0(uint64_t a1)
{
  return a1;
}

uint64_t method lookup function for DeviceExpertTellMeGeneratedFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceExpertTellMeGeneratedFlow);
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.__allocating_init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:tipKitEventSender:responseGenerator:deviceState:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.execute(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.execute()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 280) + **(int **)(*(void *)v1 + 280));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CC154E8;
  return v6(a1);
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.on(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t sub_24CC15288()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_24CC152E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CC1534C()
{
  uint64_t v0 = sub_24CBFBBFC();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_24CC23EC0();
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_24CC04170(v1, 0x5F6E6F6973736573, 0xEA00000000006469);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24CC153EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CC15430(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_24CC15490(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_24CC240C0();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return v0;
}

void OUTLINED_FUNCTION_8_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_24CC23FD0();
}

id OUTLINED_FUNCTION_10_5(float a1)
{
  float *v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_24CC23FD0();
}

BOOL OUTLINED_FUNCTION_16_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  *uint64_t v1 = v0;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_24CC23FD0();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_24CC24000();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_24CC24000();
}

BOOL OUTLINED_FUNCTION_37_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_38_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_43_0()
{
  *uint64_t v1 = v2;
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_47_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return sub_24CC23DA0();
}

void OUTLINED_FUNCTION_50_0()
{
  JUMPOUT(0x25330C740);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return v0;
}

void OUTLINED_FUNCTION_59()
{
  JUMPOUT(0x25330C740);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return v0;
}

uint64_t sub_24CC15A28(char a1)
{
  return *(void *)&aUnknown_0[8 * a1];
}

unint64_t sub_24CC15A48(unint64_t result)
{
  if (result >= 6) {
    return 6;
  }
  return result;
}

uint64_t sub_24CC15A58(uint64_t result)
{
  return result;
}

uint64_t sub_24CC15A60()
{
  return sub_24CBEA1F8();
}

unint64_t sub_24CC15A68@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24CC15A48(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_24CC15A94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CC15A58(*v1);
  *a1 = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for SnippetResponseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC15B8CLL);
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

ValueMetadata *type metadata accessor for SnippetResponseType()
{
  return &type metadata for SnippetResponseType;
}

unint64_t sub_24CC15BC8()
{
  unint64_t result = qword_269819678;
  if (!qword_269819678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819678);
  }
  return result;
}

uint64_t dispatch thunk of AnalyticsEvent.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnalyticsEvent.sessionIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AnalyticsEvent.dictionaryRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24CC15C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24CC15C64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24CC15C78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24CC15C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_24CC15CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t sub_24CC15CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24CC15DB8;
  return v9(a1, a2, a3);
}

uint64_t sub_24CC15DB8()
{
  OUTLINED_FUNCTION_0_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v0();
}

id sub_24CC15E84()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  id v3 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v4 = sub_24CC16D70(v2, v1, 0);
  id v5 = objc_msgSend(v4, sel_applicationState);
  id v6 = objc_msgSend(v5, sel_isInstalled);

  return v6;
}

uint64_t sub_24CC16164()
{
  id v0 = objc_msgSend(self, sel_deviceClass);
  sub_24CC23ED0();

  uint64_t v1 = sub_24CC23F30();
  uint64_t v3 = v2;
  uint64_t result = swift_bridgeObjectRelease();
  qword_26981FFC0 = v1;
  *(void *)algn_26981FFC8 = v3;
  return result;
}

uint64_t sub_24CC161E4(uint64_t a1)
{
  *(unsigned char *)(v1 + 39) = -18;
  *(void *)(v1 + 16) = a1;
  strcpy((char *)(v1 + 24), "com.apple.tips");
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818F30);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24CC251D0;
  uint64_t v3 = qword_269818AC8;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)algn_26981FFC8;
  *(void *)(v2 + 32) = qword_26981FFC0;
  *(void *)(v2 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)(v1 + 40) = v2;
  return v1;
}

uint64_t sub_24CC162B8(uint64_t a1, uint64_t a2)
{
  swift_retain();
  unsigned __int8 v5 = sub_24CC15E84();
  swift_release();
  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = *(void **)(v2 + 40);
  return sub_24CC16330(a1, a2, v6);
}

uint64_t sub_24CC16330(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24CC24310();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24CC24310() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24CC163F8()
{
  sub_24CC23E20();
  sub_24CC23ED0();
  sub_24CC23E10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC164BC(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24CC164DC, 0, 0);
}

uint64_t sub_24CC164DC()
{
  if (sub_24CC16938())
  {
    v0[5] = *(void *)(v0[4] + 16);
    swift_retain();
    uint64_t v1 = (void *)swift_task_alloc();
    v0[6] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_24CC165BC;
    return MEMORY[0x270F7EA78]();
  }
  else
  {
    OUTLINED_FUNCTION_52();
    return v2();
  }
}

uint64_t sub_24CC165BC(uint64_t a1)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  *(void *)(v3 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unsigned __int8 v5 = sub_24CC16730;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 64) = a1;
    unsigned __int8 v5 = sub_24CC166C8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24CC166C8()
{
  *(void *)(*(void *)(v0 + 32) + 40) = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_52();
  return v1();
}

uint64_t sub_24CC16730()
{
  swift_release();
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = sub_24CC23DA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698195F0);
  id v3 = v1;
  id v4 = v1;
  unsigned __int8 v5 = sub_24CC23D80();
  os_log_type_t v6 = sub_24CC24080();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = *(void **)(v0 + 56);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v12;
    sub_24CC240C0();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_24CBD5000, v5, v6, "Error fetching user guide identifiers: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F48);
    swift_arrayDestroy();
    MEMORY[0x25330D070](v10, -1, -1);
    MEMORY[0x25330D070](v9, -1, -1);
  }
  else
  {
  }
  OUTLINED_FUNCTION_52();
  return v13();
}

uint64_t sub_24CC16938()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819460);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2 - v1;
  uint64_t v43 = sub_24CC235C0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v42 = v8 - v7;
  uint64_t v9 = sub_24CC234B0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_24CC23520();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v19 = *(void (**)(uint64_t, unint64_t, uint64_t))(v11 + 16);
  uint64_t v18 = v11 + 16;
  unint64_t v44 = v19;
  unint64_t v20 = v16 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
  int v41 = *MEMORY[0x263F5CA70];
  uint64_t v40 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  uint64_t v21 = *(void *)(v18 + 56);
  swift_bridgeObjectRetain();
  do
  {
    v44(v15, v20, v9);
    sub_24CC234A0();
    uint64_t v22 = sub_24CC23490();
    if (__swift_getEnumTagSinglePayload(v3, 1, v22) == 1)
    {
      sub_24CC16D10(v3);
LABEL_16:
      uint64_t v37 = OUTLINED_FUNCTION_4_7();
      v38(v37);
      goto LABEL_17;
    }
    OUTLINED_FUNCTION_0_2();
    uint64_t v24 = v23;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v25 + 88))(v3, v22) != v41)
    {
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v3, v22);
      goto LABEL_16;
    }
    (*(void (**)(uint64_t, uint64_t))(v24 + 96))(v3, v22);
    (*v40)(v42, v3, v43);
    uint64_t v26 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
    uint64_t v28 = v27;
    if (qword_269818AC8 != -1) {
      swift_once();
    }
    if (v26 == qword_26981FFC0 && v28 == *(void *)algn_26981FFC8)
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = OUTLINED_FUNCTION_3_6();
      v36(v35);
      goto LABEL_16;
    }
    char v30 = sub_24CC24310();
    swift_bridgeObjectRelease();
    uint64_t v31 = OUTLINED_FUNCTION_3_6();
    v32(v31);
    uint64_t v33 = OUTLINED_FUNCTION_4_7();
    v34(v33);
    if ((v30 & 1) == 0)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
LABEL_17:
    v20 += v21;
    --v17;
  }
  while (v17);
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_24CC16C88()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24CC16CB8()
{
  sub_24CC16C88();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for TipsApp()
{
  return self;
}

uint64_t sub_24CC16D10(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819460);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24CC16D70(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_24CC232A0();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_24CC16E4C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24CC16E84(uint64_t (*a1)(void))
{
  return a1();
}

void sub_24CC16EAC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24CC240C0();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    *id v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return *(void *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return v0;
}

uint64_t TPSTip.bodyContentOrText.getter()
{
  uint64_t v1 = sub_24CC177AC(v0);
  if (v1)
  {
    uint64_t v2 = sub_24CC174E0(v1);
    swift_bridgeObjectRelease();
    if (!v2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818D90);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_24CC251D0;
      *(void *)(v2 + 32) = sub_24CC23E50();
    }
  }
  else
  {
    sub_24CC17810(v0);
    if (v3)
    {
      uint64_t v4 = (void *)sub_24CC23EC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v5 = objc_msgSend(self, sel_textContentWithText_, v4);

    __swift_instantiateConcreteTypeFromMangledName(&qword_269819690);
    uint64_t v6 = sub_24CC23FB0();

    uint64_t v2 = sub_24CC1738C(v6, (void (*)(BOOL, uint64_t, uint64_t))sub_24CC200EC, &qword_269819690, &qword_269818C18);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_24CC170E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v31 - v7;
  id v9 = objc_msgSend(v1, sel_fullContentAssets);
  id v10 = objc_msgSend(v2, sel_language);
  uint64_t v11 = sub_24CC23ED0();
  uint64_t v13 = v12;

  id v14 = objc_msgSend(v2, sel_assetFileInfoManager);
  id v15 = objc_allocWithZone(MEMORY[0x263F7F5B0]);
  id v16 = sub_24CC17724(v9, v11, v13, 0, v14);
  id v17 = objc_msgSend(v2, sel_fullContentAssets);
  id v18 = objc_msgSend(v2, sel_language);
  uint64_t v19 = sub_24CC23ED0();
  uint64_t v21 = v20;

  id v22 = objc_msgSend(v2, sel_assetFileInfoManager);
  id v23 = objc_allocWithZone(MEMORY[0x263F7F5B0]);
  id v24 = sub_24CC17724(v17, v19, v21, 1, v22);
  id v25 = v16;
  sub_24CC17630(v16, 2, (uint64_t)v8);

  id v26 = v24;
  sub_24CC17630(v24, 2, (uint64_t)v6);

  LODWORD(v17) = objc_msgSend(self, sel_isPhoneUI);
  if (v17) {
    double v27 = 1.28033473;
  }
  else {
    double v27 = 0.842975207;
  }
  uint64_t v28 = v32;
  sub_24CC17874((uint64_t)v8, v32);
  uint64_t v29 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  uint64_t result = sub_24CC17874((uint64_t)v6, v28 + *(int *)(v29 + 20));
  *(double *)(v28 + *(int *)(v29 + 24)) = v27;
  return result;
}

uint64_t sub_24CC17364(uint64_t a1)
{
  return sub_24CC1738C(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_24CC21228, &qword_269818C18, &qword_269818E48);
}

uint64_t sub_24CC1738C(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    a2(0, v4, 0);
    uint64_t v10 = a1 + 32;
    uint64_t v5 = v15;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(a3);
      __swift_instantiateConcreteTypeFromMangledName(a4);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a2(0, *(void *)(v5 + 16) + 1, 1);
        uint64_t v5 = v15;
      }
      unint64_t v12 = *(void *)(v5 + 16);
      unint64_t v11 = *(void *)(v5 + 24);
      if (v12 >= v11 >> 1)
      {
        a2(v11 > 1, v12 + 1, 1);
        uint64_t v5 = v15;
      }
      *(void *)(v5 + 16) = v12 + 1;
      *(void *)(v5 + 8 * v12 + 32) = v14;
      v10 += 8;
      --v4;
    }
    while (v4);
  }
  return v5;
}

uint64_t sub_24CC174E0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_24CC200EC(0, v2, 0);
  uint64_t v3 = v9;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818E48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269818C18);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CC200EC(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v9;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24CC200EC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v9;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_24CC17630@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    unint64_t v6 = self;
    id v7 = a1;
    id v8 = objc_msgSend(v6, sel_assetPathFromAssetConfiguration_type_, v7, a2);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_24CC23ED0();

      sub_24CC23370();
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v11 = sub_24CC23380();
  return __swift_storeEnumTagSinglePayload(a3, 1, 1, v11);
}

id sub_24CC17724(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v5, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, a1, v9, a4, a5);

  return v10;
}

uint64_t sub_24CC177AC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_bodyContent);
  if (!v1) {
    return 0;
  }
  int64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E48);
  uint64_t v3 = sub_24CC23FB0();

  return v3;
}

uint64_t sub_24CC17810(void *a1)
{
  id v1 = objc_msgSend(a1, sel_bodyText);
  if (!v1) {
    return 0;
  }
  int64_t v2 = v1;
  uint64_t v3 = sub_24CC23ED0();

  return v3;
}

uint64_t sub_24CC17874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of AnalyticsLogging.sendEvent(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_24CC178F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24CC17908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  sub_24CC23740();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_14_0();
  long long v26 = *(_OWORD *)a3;
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(a3 + 24);
  sub_24CC23750();
  sub_24CC23410();
  uint64_t v15 = *(void (**)(uint64_t))(v11 + 8);
  uint64_t v16 = OUTLINED_FUNCTION_14_6();
  v15(v16);
  Array<A>.asTextRuns()();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  sub_24CC23750();
  sub_24CC23720();
  uint64_t v19 = OUTLINED_FUNCTION_14_6();
  v15(v19);
  Array<A>.asTextRuns()();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  sub_24CC23430();
  Array<A>.asTextRuns()();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  sub_24CBF92C8(a2, v9);
  long long v29 = v26;
  uint64_t v30 = v13;
  uint64_t v31 = v14;
  SummarizedAnswerSnippetModel.init(title:body:disclaimer:attributionModel:context:)(v18, v21, v23, v9, &v29, a4);
  sub_24CBF9330(a2);
  sub_24CC237D0();
  OUTLINED_FUNCTION_32();
  return (*(uint64_t (**)(uint64_t))(v24 + 8))(a1);
}

uint64_t SummarizedAnswerSnippetModel.body.getter()
{
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_19_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t type metadata accessor for SummarizedAnswerSnippetModel()
{
  uint64_t result = qword_2698196B0;
  if (!qword_2698196B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SummarizedAnswerSnippetModel.title.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC17BA0()
{
  return SummarizedAnswerSnippetModel.title.setter();
}

uint64_t SummarizedAnswerSnippetModel.title.setter()
{
  return sub_24CC23920();
}

uint64_t (*SummarizedAnswerSnippetModel.title.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  v1[4] = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t sub_24CC17C60()
{
  return SummarizedAnswerSnippetModel.body.setter();
}

uint64_t SummarizedAnswerSnippetModel.body.setter()
{
  return sub_24CC23920();
}

uint64_t (*SummarizedAnswerSnippetModel.body.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_4((uint64_t)v1);
  OUTLINED_FUNCTION_19_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SummarizedAnswerSnippetModel.disclaimer.getter()
{
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_19_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC17D7C()
{
  return SummarizedAnswerSnippetModel.disclaimer.setter();
}

uint64_t SummarizedAnswerSnippetModel.disclaimer.setter()
{
  return sub_24CC23920();
}

uint64_t (*SummarizedAnswerSnippetModel.disclaimer.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_4((uint64_t)v1);
  OUTLINED_FUNCTION_19_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SummarizedAnswerSnippetModel.attributionModel.getter()
{
  return sub_24CC23910();
}

uint64_t sub_24CC17E94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CBF92C8(a1, (uint64_t)v4);
  return SummarizedAnswerSnippetModel.attributionModel.setter((uint64_t)v4);
}

uint64_t SummarizedAnswerSnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_1();
  sub_24CBF92C8(a1, v4 - v3);
  type metadata accessor for SummarizedAnswerSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  sub_24CC23920();
  return sub_24CBF9330(a1);
}

uint64_t (*SummarizedAnswerSnippetModel.attributionModel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_4((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SummarizedAnswerSnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CC1806C@<D0>(uint64_t a1@<X8>)
{
  SummarizedAnswerSnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CC180B0()
{
  return SummarizedAnswerSnippetModel.context.setter();
}

uint64_t SummarizedAnswerSnippetModel.context.setter()
{
  return sub_24CC23920();
}

uint64_t (*SummarizedAnswerSnippetModel.context.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_4((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_0();
  return sub_24CBE7630;
}

uint64_t SummarizedAnswerSnippetModel.init(title:body:disclaimer:attributionModel:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, long long *a5@<X4>, uint64_t a6@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_1();
  uint64_t v15 = v13 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v24 - v17;
  long long v26 = *a5;
  uint64_t v19 = *((void *)a5 + 2);
  uint64_t v24 = *((void *)a5 + 3);
  uint64_t v25 = v19;
  uint64_t v20 = a6 + *(int *)(type metadata accessor for SummarizedAnswerSnippetModel() + 28);
  uint64_t v21 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v21);
  sub_24CBF92C8((uint64_t)v18, v15);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v18);
  *(void *)&long long v27 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  sub_24CC238F0();
  *(void *)&long long v27 = a2;
  sub_24CC238F0();
  *(void *)&long long v27 = a3;
  sub_24CC238F0();
  sub_24CBF92C8(a4, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t))(v22 + 8))(v20);
  sub_24CBF92C8((uint64_t)v18, v15);
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v18);
  long long v27 = v26;
  uint64_t v28 = v25;
  uint64_t v29 = v24;
  sub_24CC238F0();
  return sub_24CBF9330(a4);
}

BOOL SummarizedAnswerSnippetModel.hasTitle.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  uint64_t v0 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL SummarizedAnswerSnippetModel.hasDisclaimer.getter()
{
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_19_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  uint64_t v0 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t SummarizedAnswerSnippetModel.selectableComponents.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E60);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24CC249B0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = &protocol witness table for [A];
  *(void *)(v0 + 32) = v3;
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_19_1();
  sub_24CC23910();
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = &protocol witness table for [A];
  *(void *)(v0 + 72) = v3;
  return v0;
}

uint64_t sub_24CC18530()
{
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = v2 - v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v15 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  sub_24CC1E778();
  char v9 = v8;
  swift_bridgeObjectRelease();
  sub_24CC1956C(v0, (uint64_t)v7);
  if (v9)
  {
    sub_24CC195D0((uint64_t)v7);
    sub_24CC1956C(v0, v4);
  }
  else
  {
    sub_24CC23910();
    sub_24CC1E778();
    char v11 = v10;
    swift_bridgeObjectRelease();
    sub_24CC195D0((uint64_t)v7);
    sub_24CC1956C(v0, v4);
    if ((v11 & 1) == 0)
    {
      sub_24CC23910();
      sub_24CC1E778();
      char v12 = v13;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  char v12 = 1;
LABEL_6:
  sub_24CC195D0(v4);
  return v12 & 1;
}

uint64_t sub_24CC186A8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 2036625250 && a2 == 0xE400000000000000;
    if (v6 || (sub_24CC24310() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6D69616C63736964 && a2 == 0xEA00000000007265;
      if (v7 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000024CC288A0 || (sub_24CC24310() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_24CC24310();
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

uint64_t sub_24CC1888C()
{
  return 5;
}

unint64_t sub_24CC18894(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 2036625250;
      break;
    case 2:
      unint64_t result = 0x6D69616C63736964;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      unint64_t result = 0x656C746974;
      break;
  }
  return result;
}

unint64_t sub_24CC18940()
{
  return sub_24CC18894(*v0);
}

uint64_t sub_24CC18948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CC186A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CC18970@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CC1888C();
  *a1 = result;
  return result;
}

uint64_t sub_24CC18998(uint64_t a1)
{
  unint64_t v2 = sub_24CC18C60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC189D4(uint64_t a1)
{
  unint64_t v2 = sub_24CC18C60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SummarizedAnswerSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819698);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC18C60();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC194A0((uint64_t)&unk_2698194D8);
  OUTLINED_FUNCTION_6_6();
  if (!v1)
  {
    type metadata accessor for SummarizedAnswerSnippetModel();
    OUTLINED_FUNCTION_6_6();
    OUTLINED_FUNCTION_6_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    sub_24CC18D2C((uint64_t)&unk_269819128);
    sub_24CC242E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CBE8158((uint64_t)&unk_269818C80);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_24CC18C60()
{
  unint64_t result = qword_2698196A0;
  if (!qword_2698196A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698196A0);
  }
  return result;
}

unint64_t sub_24CC18CAC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B58);
    sub_24CC196BC(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC18D2C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B88);
    sub_24CC18DF8((uint64_t)&unk_269819130);
    sub_24CC18DF8((uint64_t)&unk_269819140);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24CC18DF8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B40);
    sub_24CC196BC(v4);
    unint64_t result = OUTLINED_FUNCTION_17_1();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t SummarizedAnswerSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  OUTLINED_FUNCTION_0();
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0_4();
  uint64_t v51 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v8;
  uint64_t v62 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_4();
  uint64_t v53 = v9;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_1();
  uint64_t v56 = v12 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v59 = (char *)&v47 - v16;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698196A8);
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1();
  uint64_t v21 = v20 - v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B40);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1_1();
  uint64_t v25 = v23 - v24;
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v47 - v27;
  uint64_t v29 = type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_14_0();
  uint64_t v32 = v2 + *(int *)(v31 + 28);
  uint64_t v33 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 1, 1, v33);
  sub_24CBF92C8((uint64_t)v28, v25);
  uint64_t v64 = v32;
  sub_24CC238F0();
  sub_24CBF9330((uint64_t)v28);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC18C60();
  uint64_t v60 = v21;
  uint64_t v34 = (uint64_t)v63;
  sub_24CC24360();
  if (v34)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8))(v64, v62);
  }
  else
  {
    uint64_t v47 = v2;
    uint64_t v48 = v29;
    uint64_t v63 = a1;
    char v69 = 0;
    sub_24CC194A0((uint64_t)&unk_269819528);
    uint64_t v35 = v57;
    OUTLINED_FUNCTION_9_6();
    unint64_t v36 = v59;
    uint64_t v59 = *(char **)(v54 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v59)(v47, v36, v35);
    char v68 = 1;
    OUTLINED_FUNCTION_9_6();
    OUTLINED_FUNCTION_18_2();
    v37();
    char v67 = 2;
    sub_24CC24270();
    OUTLINED_FUNCTION_18_2();
    v38();
    char v66 = 3;
    sub_24CC18D2C((uint64_t)&unk_269819188);
    uint64_t v39 = v53;
    uint64_t v40 = v62;
    sub_24CC24270();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 40))(v64, v39, v40);
    char v65 = 4;
    sub_24CBE8158((uint64_t)&unk_269818CA8);
    uint64_t v42 = v51;
    uint64_t v41 = v52;
    sub_24CC24270();
    uint64_t v43 = OUTLINED_FUNCTION_2_13();
    v44(v43);
    uint64_t v45 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v47 + *(int *)(v48 + 32), v42, v41);
    sub_24CC1956C(v45, v50);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
    return sub_24CC195D0(v45);
  }
}

unint64_t sub_24CC194A0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B78);
    sub_24CC18CAC((uint64_t)&unk_2698194E0);
    sub_24CC18CAC((uint64_t)&unk_2698194F0);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CC1956C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SummarizedAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC195D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SummarizedAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CC1962C()
{
  return sub_24CC196BC((uint64_t)&qword_269819338);
}

unint64_t sub_24CC19674()
{
  return sub_24CC196BC((uint64_t)&qword_2698192C8);
}

unint64_t sub_24CC196BC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CC19708@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SummarizedAnswerSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24CC19720(void *a1)
{
  return SummarizedAnswerSnippetModel.encode(to:)(a1);
}

uint64_t sub_24CC19738@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SummarizedAnswerSnippetModel.title.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24CC19768@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SummarizedAnswerSnippetModel.body.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24CC19798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SummarizedAnswerSnippetModel.disclaimer.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24CC197C8()
{
  return SummarizedAnswerSnippetModel.attributionModel.getter();
}

uint64_t *initializeBufferWithCopyOfBuffer for SummarizedAnswerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]), v7);
    uint64_t v9 = a3[7];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[8];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for SummarizedAnswerSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v5(a1 + a2[6], v4);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

uint64_t initializeWithCopy for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t assignWithCopy for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC1A024);
}

uint64_t sub_24CC1A024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 28);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      uint64_t v12 = *(int *)(a3 + 32);
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC1A0E4);
}

uint64_t sub_24CC1A0E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B88);
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 28);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
      uint64_t v14 = *(int *)(a4 + 32);
    }
    uint64_t v11 = a1 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_24CC1A198()
{
  sub_24CBFB6E4(319, (unint64_t *)&qword_269819558, &qword_269818B58);
  if (v0 <= 0x3F)
  {
    sub_24CBFB6E4(319, &qword_2698191C0, &qword_269818B40);
    if (v1 <= 0x3F)
    {
      sub_24CBE8ACC();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for SummarizedAnswerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SummarizedAnswerSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC1A414);
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

ValueMetadata *type metadata accessor for SummarizedAnswerSnippetModel.CodingKeys()
{
  return &type metadata for SummarizedAnswerSnippetModel.CodingKeys;
}

unint64_t sub_24CC1A450()
{
  unint64_t result = qword_2698196C0;
  if (!qword_2698196C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698196C0);
  }
  return result;
}

unint64_t sub_24CC1A4A0()
{
  unint64_t result = qword_2698196C8;
  if (!qword_2698196C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698196C8);
  }
  return result;
}

unint64_t sub_24CC1A4F0()
{
  unint64_t result = qword_2698196D0;
  if (!qword_2698196D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698196D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return *(void *)(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t a1)
{
  *unint64_t v1 = a1;
  return type metadata accessor for SummarizedAnswerSnippetModel();
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_24CC24270();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return v0;
}

uint64_t sub_24CC1A5CC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return MEMORY[0x270FA2498](sub_24CC1A5EC, 0, 0);
}

uint64_t sub_24CC1A5EC()
{
  OUTLINED_FUNCTION_48_0();
  unint64_t v1 = (void *)v0[5];
  uint64_t v2 = v1[2];
  v0[7] = v2;
  if (v2)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    v0[8] = 0;
    v0[9] = v3;
    uint64_t v4 = v1[4];
    v0[10] = v4;
    uint64_t v5 = v1[5];
    v0[11] = v5;
    v0[12] = v1[7];
    uint64_t v6 = v1[8];
    v0[13] = v6;
    uint64_t v7 = *(void *)(v6 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[14] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24CC1A74C;
    return sub_24CBF34A4(v4, v5, v7);
  }
  else
  {
    swift_release();
    uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v11 = MEMORY[0x263F8EE78];
    return v10(v11);
  }
}

uint64_t sub_24CC1A74C()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  void *v2 = v1;
  v1[2] = v0;
  v1[3] = v3;
  v1[4] = v4;
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v8 + 120) = v7;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CC1A828, 0, 0);
}

uint64_t sub_24CC1A828()
{
  uint64_t v1 = v0[15];
  if (v1)
  {
    uint64_t v2 = v0 + 3;
  }
  else
  {
    uint64_t v2 = v0 + 10;
    uint64_t v1 = swift_bridgeObjectRetain();
  }
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = v0[9];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_24CBF1958(0, *(void *)(v5 + 16) + 1, 1, v0[9]);
    uint64_t v5 = v23;
  }
  unint64_t v7 = *(void *)(v5 + 16);
  unint64_t v6 = *(void *)(v5 + 24);
  if (v7 >= v6 >> 1)
  {
    sub_24CBF1958(v6 > 1, v7 + 1, 1, v5);
    uint64_t v5 = v24;
  }
  uint64_t v8 = v0[13];
  uint64_t v10 = v0[10];
  uint64_t v9 = v0[11];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[8] + 1;
  *(void *)(v5 + 16) = v7 + 1;
  uint64_t v13 = (void *)(v5 + 40 * v7);
  v13[4] = v10;
  v13[5] = v9;
  v13[6] = v3;
  v13[7] = v1;
  v13[8] = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12 == v11)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v5);
  }
  else
  {
    uint64_t v16 = v0[8] + 1;
    v0[8] = v16;
    v0[9] = v5;
    uint64_t v17 = (void *)(v0[5] + 40 * v16);
    uint64_t v18 = v17[4];
    v0[10] = v18;
    uint64_t v19 = v17[5];
    v0[11] = v19;
    v0[12] = v17[7];
    uint64_t v20 = v17[8];
    v0[13] = v20;
    uint64_t v21 = *(void *)(v20 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)swift_task_alloc();
    v0[14] = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_24CC1A74C;
    return sub_24CBF34A4(v18, v19, v21);
  }
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = OUTLINED_FUNCTION_48();
  v6[10] = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_2();
  v6[11] = v7;
  v6[12] = OUTLINED_FUNCTION_48();
  sub_24CC240A0();
  v6[13] = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_0_2();
  v6[14] = v8;
  v6[15] = OUTLINED_FUNCTION_48();
  uint64_t v9 = OUTLINED_FUNCTION_5_7();
  v6[16] = v9;
  v6[17] = *(void *)(v9 - 8);
  v6[18] = OUTLINED_FUNCTION_48();
  return MEMORY[0x270FA2498](sub_24CC1ABF8, 0, 0);
}

uint64_t sub_24CC1ABF8()
{
  OUTLINED_FUNCTION_48_0();
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  v0[2] = sub_24CC23FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_24CC23F70();
  uint64_t v5 = (int *)v0[18];
  uint64_t v6 = v0[13];
  uint64_t v7 = v0[10];
  swift_getAssociatedConformanceWitness();
  sub_24CC240B0();
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    uint64_t v8 = OUTLINED_FUNCTION_2_14();
    v9(v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = OUTLINED_FUNCTION_9_7();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_3_7();
    v13(v12);
    uint64_t v16 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
    uint64_t v14 = (void *)swift_task_alloc();
    v0[19] = v14;
    void *v14 = v0;
    v14[1] = sub_24CC1ADF4;
    uint64_t v10 = OUTLINED_FUNCTION_8_5();
    uint64_t v11 = v16;
  }
  return v11(v10);
}

uint64_t sub_24CC1ADF4()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10();
  *uint64_t v6 = v5;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24CC1B0C8;
  }
  else
  {
    uint64_t v7 = sub_24CC1AEE4;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24CC1AEE4()
{
  OUTLINED_FUNCTION_48_0();
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  sub_24CC24020();
  sub_24CC24010();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (int *)v0[18];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[10];
  swift_getAssociatedConformanceWitness();
  sub_24CC240B0();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    uint64_t v7 = OUTLINED_FUNCTION_2_14();
    v8(v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = OUTLINED_FUNCTION_9_7();
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_3_7();
    v12(v11);
    uint64_t v15 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_24CC1ADF4;
    uint64_t v9 = OUTLINED_FUNCTION_8_5();
    uint64_t v10 = v15;
  }
  return v10(v9);
}

uint64_t sub_24CC1B0C8()
{
  OUTLINED_FUNCTION_48_0();
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return *(void *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return v0;
}

uint64_t LearnMoreSnippetModel.init(result:context:)(uint64_t a1)
{
  uint64_t v2 = sub_24CC23740();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  sub_24CC23750();
  sub_24CC23720();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  Array<A>.asTextRuns()();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  sub_24CC238F0();
  type metadata accessor for LearnMoreSnippetModel();
  sub_24CC238F0();
  uint64_t v9 = sub_24CC237D0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
}

uint64_t LearnMoreSnippetModel.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  return v1;
}

uint64_t sub_24CC1B3C0()
{
  return LearnMoreSnippetModel.body.setter();
}

uint64_t LearnMoreSnippetModel.body.setter()
{
  return sub_24CC23920();
}

uint64_t (*LearnMoreSnippetModel.body.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  v2[4] = sub_24CC23900();
  return sub_24CBE7630;
}

uint64_t LearnMoreSnippetModel.context.getter()
{
  return sub_24CC23910();
}

double sub_24CC1B4D4@<D0>(uint64_t a1@<X8>)
{
  LearnMoreSnippetModel.context.getter();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24CC1B518()
{
  return LearnMoreSnippetModel.context.setter();
}

uint64_t LearnMoreSnippetModel.context.setter()
{
  return sub_24CC23920();
}

uint64_t (*LearnMoreSnippetModel.context.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for LearnMoreSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  v2[4] = sub_24CC23900();
  return sub_24CBE7630;
}

uint64_t LearnMoreSnippetModel.init(body:context:)()
{
  return sub_24CC238F0();
}

uint64_t type metadata accessor for LearnMoreSnippetModel()
{
  uint64_t result = qword_269819700;
  if (!qword_269819700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LearnMoreSnippetModel.selectableComponents.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818E60);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24CC251D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  *(void *)(v0 + 64) = &protocol witness table for [A];
  *(void *)(v0 + 32) = v2;
  return v0;
}

uint64_t sub_24CC1B794()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC23910();
  sub_24CC1E778();
  char v1 = v0;
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_24CC1B7E8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 2036625250 && a2 == 0xE400000000000000;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CC1B8C0(char a1)
{
  if (a1) {
    return 0x747865746E6F63;
  }
  else {
    return 2036625250;
  }
}

uint64_t sub_24CC1B8F0()
{
  return sub_24CC1B8C0(*v0);
}

uint64_t sub_24CC1B8F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CC1B7E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CC1B920(uint64_t a1)
{
  unint64_t v2 = sub_24CC1BB40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC1B95C(uint64_t a1)
{
  unint64_t v2 = sub_24CC1BB40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LearnMoreSnippetModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698196E8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC1BB40();
  sub_24CC24370();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  sub_24CC1BF34((uint64_t)&unk_2698194D8);
  sub_24CC242E0();
  if (!v1)
  {
    type metadata accessor for LearnMoreSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    sub_24CBE8158((uint64_t)&unk_269818C80);
    sub_24CC242E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_24CC1BB40()
{
  unint64_t result = qword_2698196F0;
  if (!qword_2698196F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698196F0);
  }
  return result;
}

unint64_t sub_24CC1BB8C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B58);
    sub_24CC1C150(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t LearnMoreSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v25 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698196F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_0();
  uint64_t v14 = type metadata accessor for LearnMoreSnippetModel();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v17 = v16 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC1BB40();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_24CC1BF34((uint64_t)&unk_269819528);
  sub_24CC24270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v17, v25, v26);
  sub_24CBE8158((uint64_t)&unk_269818CA8);
  sub_24CC24270();
  uint64_t v18 = OUTLINED_FUNCTION_2_3();
  v19(v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v17 + *(int *)(v14 + 20), v8, v24);
  sub_24CC1C000(v17, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24CC1C064(v17);
}

unint64_t sub_24CC1BF34(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B78);
    sub_24CC1BB8C((uint64_t)&unk_2698194E0);
    sub_24CC1BB8C((uint64_t)&unk_2698194F0);
    unint64_t result = OUTLINED_FUNCTION_6_2();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CC1C000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LearnMoreSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC1C064(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LearnMoreSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CC1C0C0()
{
  return sub_24CC1C150((uint64_t)&qword_269819348);
}

unint64_t sub_24CC1C108()
{
  return sub_24CC1C150((uint64_t)&qword_2698192E8);
}

unint64_t sub_24CC1C150(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_24CC1C19C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LearnMoreSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24CC1C1B4(void *a1)
{
  return LearnMoreSnippetModel.encode(to:)(a1);
}

uint64_t sub_24CC1C1CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LearnMoreSnippetModel.body.getter();
  *a1 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LearnMoreSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC1C6D8);
}

uint64_t sub_24CC1C6D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC1C770);
}

uint64_t sub_24CC1C770(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B78);
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818B70);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_24CC1C7FC()
{
  sub_24CC1C8C4();
  if (v0 <= 0x3F)
  {
    sub_24CBE8ACC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24CC1C8C4()
{
  if (!qword_269819558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269818B58);
    unint64_t v0 = sub_24CC23930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269819558);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for LearnMoreSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC1C9ECLL);
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

ValueMetadata *type metadata accessor for LearnMoreSnippetModel.CodingKeys()
{
  return &type metadata for LearnMoreSnippetModel.CodingKeys;
}

unint64_t sub_24CC1CA28()
{
  unint64_t result = qword_269819710;
  if (!qword_269819710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819710);
  }
  return result;
}

unint64_t sub_24CC1CA78()
{
  unint64_t result = qword_269819718;
  if (!qword_269819718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819718);
  }
  return result;
}

unint64_t sub_24CC1CAC8()
{
  unint64_t result = qword_269819720;
  if (!qword_269819720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819720);
  }
  return result;
}

id static BiomeEventSender.shared.getter@<X0>(void *a1@<X8>)
{
  if (qword_269818AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_269819728;
  *a1 = qword_269819728;
  return v2;
}

uint64_t static DeviceExpertDiscoverabilityEvent.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceExpertDiscoverabilityEvent.hash(into:)()
{
  return sub_24CC24340();
}

uint64_t DeviceExpertDiscoverabilityEvent.hashValue.getter()
{
  return sub_24CC24350();
}

uint64_t sub_24CC1CBF4()
{
  return DeviceExpertDiscoverabilityEvent.hashValue.getter();
}

uint64_t sub_24CC1CC0C()
{
  return DeviceExpertDiscoverabilityEvent.hash(into:)();
}

void sub_24CC1CC24()
{
}

void sub_24CC1CC30(void *a1@<X8>)
{
  id v2 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v2, sel_Signals);
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v3, sel_source);

  *a1 = v4;
}

void BiomeEventSender.send(_:)()
{
  uint64_t v1 = *v0;
  if (qword_269818AC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CC23DA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698195F0);
  id v3 = sub_24CC23D80();
  os_log_type_t v4 = sub_24CC24070();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_24CC12DF0(0xD00000000000001BLL, 0x800000024CC291F0, &v9);
    sub_24CC240C0();
    _os_log_impl(&dword_24CBD5000, v3, v4, "Donating %s event to discoverabilitySignal", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25330D070](v6, -1, -1);
    MEMORY[0x25330D070](v5, -1, -1);
  }

  id v7 = objc_allocWithZone(MEMORY[0x263F2A0D8]);
  id v8 = sub_24CC1CEAC(0xD00000000000001BLL, 0x800000024CC291F0, 0, 0, 0, 0, 0, 0xF000000000000000);
  objc_msgSend(v1, sel_sendEvent_, v8);
}

id sub_24CC1CEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  if (a2)
  {
    uint64_t v13 = (void *)sub_24CC23EC0();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v13 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_24CC23EC0();
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    uint64_t v15 = (void *)sub_24CC23EC0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v15 = 0;
LABEL_8:
  if (a8 >> 60 == 15)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = (void *)sub_24CC23390();
    sub_24CC1D118(a7, a8);
  }
  id v17 = objc_msgSend(v8, sel_initWithContentIdentifier_context_osBuild_userInfo_, v13, v14, v15, v16);

  return v17;
}

unint64_t sub_24CC1CFD4()
{
  unint64_t result = qword_269819730;
  if (!qword_269819730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819730);
  }
  return result;
}

uint64_t dispatch thunk of BiomeEventSending.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

unsigned char *storeEnumTagSinglePayload for DeviceExpertDiscoverabilityEvent(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CC1D0D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertDiscoverabilityEvent()
{
  return &type metadata for DeviceExpertDiscoverabilityEvent;
}

ValueMetadata *type metadata accessor for BiomeEventSender()
{
  return &type metadata for BiomeEventSender;
}

uint64_t sub_24CC1D118(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CBD8944(a1, a2);
  }
  return a1;
}

void sub_24CC1D12C()
{
}

void sub_24CC1D188()
{
}

void sub_24CC1D1E4()
{
}

void sub_24CC1D240()
{
}

void sub_24CC1D29C()
{
}

void sub_24CC1D2F8()
{
}

void sub_24CC1D354()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v2 = v1;
  unsigned int v4 = v3;
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v21 = v11;
  uint64_t v12 = sub_24CC23D10();
  uint64_t v13 = OUTLINED_FUNCTION_49(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_7_7();
  uint64_t v14 = v6(0);
  OUTLINED_FUNCTION_0_2();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v20 - v18;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  sub_24CBE90F8(v10, v8);
  sub_24CC23D00();
  sub_24CC202E8(v4, v2);
  sub_24CC23D20();
  if (v0)
  {
    sub_24CBD8944(v10, v8);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v21, v19, v14);
    sub_24CBD8944(v10, v8);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v14);
  }
  OUTLINED_FUNCTION_20_1();
}

uint64_t sub_24CC1D4E4()
{
  return sub_24CC1D70C(MEMORY[0x263F5CB08], &qword_269819090, MEMORY[0x263F5CB08]);
}

uint64_t sub_24CC1D540()
{
  return sub_24CC1D70C(MEMORY[0x263F5CA88], &qword_269819098, MEMORY[0x263F5CA88]);
}

uint64_t sub_24CC1D59C()
{
  return sub_24CC1D70C(MEMORY[0x263F5CAE8], &qword_269819080, MEMORY[0x263F5CAE8]);
}

uint64_t sub_24CC1D5F8()
{
  return sub_24CC1D70C(MEMORY[0x263F5CAB8], &qword_269819758, MEMORY[0x263F5CAB8]);
}

uint64_t sub_24CC1D654()
{
  return sub_24CC1D70C(MEMORY[0x263F5CAC8], &qword_269819760, MEMORY[0x263F5CAC8]);
}

uint64_t sub_24CC1D6B0()
{
  return sub_24CC1D70C(MEMORY[0x263F5CA60], &qword_269819738, MEMORY[0x263F5CA60]);
}

uint64_t sub_24CC1D70C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_24CC23D30();
}

void sub_24CC1D780()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v4 = OUTLINED_FUNCTION_14_7(v3);
  uint64_t v5 = type metadata accessor for Action(v4);
  uint64_t v6 = OUTLINED_FUNCTION_49(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_16_5();
  if (!v1)
  {
    sub_24CBE95E4();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_28_1();
    uint64_t v8 = OUTLINED_FUNCTION_3_8();
    v9(v8);
    sub_24CC21060(v2, v10, (void (*)(void))type metadata accessor for Action);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_20_1();
}

void sub_24CC1D910()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v4 = OUTLINED_FUNCTION_14_7(v3);
  uint64_t v5 = type metadata accessor for Action.URLConfiguration(v4);
  uint64_t v6 = OUTLINED_FUNCTION_49(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_16_5();
  if (!v1)
  {
    sub_24CBE95E4();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_28_1();
    uint64_t v8 = OUTLINED_FUNCTION_3_8();
    v9(v8);
    sub_24CC21060(v2, v10, (void (*)(void))type metadata accessor for Action.URLConfiguration);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_20_1();
}

void sub_24CC1DAA0()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v4 = OUTLINED_FUNCTION_14_7(v3);
  uint64_t v5 = type metadata accessor for Action.AppIntentConfiguration(v4);
  uint64_t v6 = OUTLINED_FUNCTION_49(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_16_5();
  if (!v1)
  {
    sub_24CBE95E4();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_28_1();
    uint64_t v8 = OUTLINED_FUNCTION_3_8();
    v9(v8);
    sub_24CC21060(v2, v10, (void (*)(void))type metadata accessor for Action.AppIntentConfiguration);
  }
  __swift_destroy_boxed_opaque_existential_1(v0);
  OUTLINED_FUNCTION_20_1();
}

uint64_t sub_24CC1DC30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v4 = type metadata accessor for TextRun(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE9598();
  sub_24CC24360();
  if (!v2)
  {
    uint64_t v11 = v14;
    sub_24CBE95E4();
    sub_24CC24270();
    sub_24CC1D354();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_24CC21060((uint64_t)v6, v11, (void (*)(void))type metadata accessor for TextRun);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CC1DE80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v4 = type metadata accessor for TextRun.TextConfiguration(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE9598();
  sub_24CC24360();
  if (!v2)
  {
    uint64_t v11 = v14;
    sub_24CBE95E4();
    sub_24CC24270();
    sub_24CC1D354();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_24CC21060((uint64_t)v6, v11, (void (*)(void))type metadata accessor for TextRun.TextConfiguration);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CC1E0D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v4 = type metadata accessor for TextRun.SymbolConfiguration(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818CF8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CBE9598();
  sub_24CC24360();
  if (!v2)
  {
    uint64_t v11 = v14;
    sub_24CBE95E4();
    sub_24CC24270();
    sub_24CC1D354();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_24CC21060((uint64_t)v6, v11, (void (*)(void))type metadata accessor for TextRun.SymbolConfiguration);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_24CC1E320()
{
}

void sub_24CC1E37C()
{
}

void sub_24CC1E3D8()
{
}

void sub_24CC1E434()
{
  OUTLINED_FUNCTION_23_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269818D10);
  OUTLINED_FUNCTION_0_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_24CBE9598();
  sub_24CC24370();
  v6(0);
  sub_24CC202E8(v4, v2);
  uint64_t v16 = sub_24CC23D30();
  if (!v0)
  {
    uint64_t v18 = v16;
    unint64_t v19 = v17;
    sub_24CBE9790();
    sub_24CC242E0();
    sub_24CBD8944(v18, v19);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  OUTLINED_FUNCTION_20_1();
}

void Array<A>.asTextRuns()()
{
  OUTLINED_FUNCTION_22_1();
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TextRun(0);
  uint64_t v3 = OUTLINED_FUNCTION_1_0(v2);
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = *(void *)(v1 + 16);
  if (v9)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_24CC20180();
    uint64_t v15 = sub_24CC23480();
    uint64_t v10 = *(void *)(v15 - 8);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    uint64_t v12 = v1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v13 = *(void *)(v10 + 72);
    do
    {
      v11(v8, v12, v15);
      unint64_t v14 = *(void *)(v16 + 16);
      if (v14 >= *(void *)(v16 + 24) >> 1) {
        sub_24CC20180();
      }
      *(void *)(v16 + 16) = v14 + 1;
      sub_24CC21060(v8, v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v14, (void (*)(void))type metadata accessor for TextRun);
      v12 += v13;
      --v9;
    }
    while (v9);
  }
  OUTLINED_FUNCTION_20_3();
}

uint64_t type metadata accessor for TextRun(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819768);
}

uint64_t Apple_Parsec_DeviceExpert_V0alpha_ClientComponent_DeviceExpertResult.AnswerStep.asTextRuns()()
{
  sub_24CC23410();
  Array<A>.asTextRuns()();
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  return v1;
}

void sub_24CC1E778()
{
  OUTLINED_FUNCTION_22_1();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  uint64_t v4 = OUTLINED_FUNCTION_49(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_26_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v30 - v6;
  type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_27_3();
  uint64_t v10 = OUTLINED_FUNCTION_12_6(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + 16);
  if (v14)
  {
    uint64_t v15 = v2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    int v32 = *MEMORY[0x263F5CA48];
    int v31 = *MEMORY[0x263F5CA50];
    uint64_t v16 = *(void *)(v11 + 72);
    uint64_t v30 = v2;
    swift_bridgeObjectRetain();
    uint64_t v17 = v14 - 1;
    do
    {
      uint64_t v18 = v17;
      sub_24CC210BC(v15, (uint64_t)v13);
      sub_24CC23470();
      uint64_t v19 = sub_24CC23440();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19) == 1) {
        goto LABEL_13;
      }
      sub_24CC20200((uint64_t)v7, v0);
      OUTLINED_FUNCTION_0_2();
      uint64_t v21 = v20;
      OUTLINED_FUNCTION_37_1();
      int v23 = v22();
      if (v23 == v32)
      {
        uint64_t v24 = OUTLINED_FUNCTION_30_1();
        v25(v24);
        sub_24CC23560();
      }
      else
      {
        if (v23 != v31)
        {
          (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v0, v19);
LABEL_13:
          OUTLINED_FUNCTION_13_2();
          OUTLINED_FUNCTION_6_7();
          OUTLINED_FUNCTION_39_1();
        }
        uint64_t v26 = OUTLINED_FUNCTION_30_1();
        v27(v26);
        sub_24CC23600();
      }
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_25_2();
      v28();
      swift_storeEnumTagMultiPayload();
      sub_24CC20288((uint64_t)v7);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      sub_24CC21120();
      sub_24CC21120();
      if (EnumCaseMultiPayload == 1) {
        break;
      }
      uint64_t v17 = v18 - 1;
      v15 += v16;
    }
    while (v18);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20_3();
}

void sub_24CC1EA6C()
{
  OUTLINED_FUNCTION_22_1();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  uint64_t v4 = OUTLINED_FUNCTION_49(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_26_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v35 - v6;
  type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_27_3();
  uint64_t v10 = OUTLINED_FUNCTION_1_0(v9);
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = *(void *)(v2 + 16);
  if (v16)
  {
    uint64_t v17 = *(void *)(v2 + 32);
    uint64_t v41 = v2 + 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24CC1E778();
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19)
    {
      swift_bridgeObjectRelease();
    }
    else if (v16 == 1)
    {
LABEL_5:
      swift_bridgeObjectRelease();
    }
    else
    {
      int v43 = *MEMORY[0x263F5CA48];
      int v42 = *MEMORY[0x263F5CA50];
      uint64_t v20 = 1;
      uint64_t v38 = v2;
      uint64_t v39 = v16;
      uint64_t v36 = v12;
      while (1)
      {
        uint64_t v21 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
          __break(1u);
LABEL_24:
          (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v0, v12);
LABEL_25:
          OUTLINED_FUNCTION_13_2();
          OUTLINED_FUNCTION_6_7();
          OUTLINED_FUNCTION_39_1();
        }
        uint64_t v22 = *(void *)(v41 + 8 * v20);
        uint64_t v23 = *(void *)(v22 + 16);
        if (v23) {
          break;
        }
LABEL_19:
        uint64_t v20 = v21;
        if (v21 == v39) {
          goto LABEL_5;
        }
      }
      uint64_t v37 = v20 + 1;
      uint64_t v24 = v22 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
      uint64_t v40 = v22;
      swift_bridgeObjectRetain_n();
      uint64_t v25 = *(void *)(v12 + 72);
      while (1)
      {
        sub_24CC210BC(v24, v15);
        sub_24CC23470();
        uint64_t v12 = sub_24CC23440();
        if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v12) == 1) {
          goto LABEL_25;
        }
        sub_24CC20200((uint64_t)v7, v0);
        OUTLINED_FUNCTION_0_2();
        uint64_t v17 = v26;
        OUTLINED_FUNCTION_37_1();
        int v28 = v27();
        if (v28 == v43)
        {
          uint64_t v29 = OUTLINED_FUNCTION_29_1();
          v30(v29);
          sub_24CC23560();
        }
        else
        {
          if (v28 != v42) {
            goto LABEL_24;
          }
          uint64_t v31 = OUTLINED_FUNCTION_29_1();
          v32(v31);
          sub_24CC23600();
        }
        OUTLINED_FUNCTION_11_2();
        OUTLINED_FUNCTION_25_2();
        v33();
        swift_storeEnumTagMultiPayload();
        sub_24CC20288((uint64_t)v7);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        sub_24CC21120();
        sub_24CC21120();
        if (EnumCaseMultiPayload == 1) {
          break;
        }
        v24 += v25;
        if (!--v23)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v21 = v37;
          uint64_t v12 = v36;
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
  }
  OUTLINED_FUNCTION_20_3();
}

void sub_24CC1EE00()
{
  OUTLINED_FUNCTION_22_1();
  uint64_t v1 = OUTLINED_FUNCTION_42_1();
  uint64_t v2 = type metadata accessor for TextRun.SymbolConfiguration(v1);
  uint64_t v3 = OUTLINED_FUNCTION_49(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_0_4();
  uint64_t v38 = v4;
  uint64_t v5 = type metadata accessor for TextRun.TextConfiguration(0);
  uint64_t v6 = OUTLINED_FUNCTION_49(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_4();
  uint64_t v37 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  uint64_t v9 = OUTLINED_FUNCTION_49(v8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v35 - v13;
  uint64_t v42 = type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0_4();
  uint64_t v41 = v16;
  uint64_t v17 = type metadata accessor for TextRun(0);
  uint64_t v18 = OUTLINED_FUNCTION_12_6(v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v0 + 16);
  if (v22)
  {
    uint64_t v23 = v0 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    uint64_t v40 = *(void *)(v19 + 72);
    int v39 = *MEMORY[0x263F5CA48];
    int v36 = *MEMORY[0x263F5CA50];
    v35[1] = v0;
    swift_bridgeObjectRetain();
    int v43 = v14;
    do
    {
      sub_24CC210BC(v23, (uint64_t)v21);
      sub_24CC23470();
      uint64_t v24 = sub_24CC23440();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v24) == 1) {
        goto LABEL_15;
      }
      sub_24CC20200((uint64_t)v14, (uint64_t)v12);
      OUTLINED_FUNCTION_0_2();
      uint64_t v26 = v25;
      OUTLINED_FUNCTION_37_1();
      int v28 = v27();
      if (v28 == v39)
      {
        uint64_t v29 = OUTLINED_FUNCTION_32_0();
        v30(v29);
        sub_24CC23560();
      }
      else
      {
        if (v28 != v36)
        {
          (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v24);
LABEL_15:
          OUTLINED_FUNCTION_13_2();
          OUTLINED_FUNCTION_6_7();
          OUTLINED_FUNCTION_39_1();
        }
        uint64_t v31 = OUTLINED_FUNCTION_32_0();
        v32(v31);
        sub_24CC23600();
      }
      OUTLINED_FUNCTION_11_2();
      uint64_t v33 = v41;
      OUTLINED_FUNCTION_25_2();
      v34();
      swift_storeEnumTagMultiPayload();
      sub_24CC20288((uint64_t)v43);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_24CC21060(v33, v38, (void (*)(void))type metadata accessor for TextRun.SymbolConfiguration);
        _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
      }
      else
      {
        sub_24CC21060(v33, v37, (void (*)(void))type metadata accessor for TextRun.TextConfiguration);
        _s19DeviceExpertIntents6ActionV5labelSSvg_0();
      }
      OUTLINED_FUNCTION_38_1();
      sub_24CC23F50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24CC21120();
      sub_24CC21120();
      v23 += v40;
      --v22;
      uint64_t v14 = v43;
    }
    while (v22);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20_3();
}

uint64_t TextRun.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC1F9E8(MEMORY[0x263F5CA60], a1);
}

uint64_t TextRun.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1F6B8(a1, MEMORY[0x263F5CA60], a2);
}

uint64_t TextRun.init(_:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC1F350()
{
  uint64_t v0 = sub_24CC23560();
  MEMORY[0x270FA5388](v0);
  sub_24CC202E8(&qword_269819758, MEMORY[0x263F5CAB8]);
  sub_24CC23D50();
  return sub_24CC23460();
}

uint64_t sub_24CC1F45C()
{
  return sub_24CC23550();
}

uint64_t TextRun.value.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  uint64_t v1 = OUTLINED_FUNCTION_49(v0);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v18 - v5;
  sub_24CC23470();
  uint64_t v7 = sub_24CC23440();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1) {
    goto LABEL_8;
  }
  sub_24CC20200((uint64_t)v6, (uint64_t)v4);
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_37_1();
  int v11 = v10();
  if (v11 != *MEMORY[0x263F5CA48])
  {
    if (v11 == *MEMORY[0x263F5CA50])
    {
      uint64_t v14 = OUTLINED_FUNCTION_5_5();
      v15(v14);
      sub_24CC23600();
      goto LABEL_6;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v4, v7);
LABEL_8:
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_39_1();
  }
  uint64_t v12 = OUTLINED_FUNCTION_5_5();
  v13(v12);
  sub_24CC23560();
LABEL_6:
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_25_2();
  v16();
  type metadata accessor for TextRun.Value(0);
  swift_storeEnumTagMultiPayload();
  return sub_24CC20288((uint64_t)v6);
}

uint64_t TextRun.TextConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1F6B8(a1, MEMORY[0x263F5CAB8], a2);
}

uint64_t TextRun.SymbolConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1F6B8(a1, MEMORY[0x263F5CAC8], a2);
}

uint64_t sub_24CC1F6B8@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  a2(0);
  OUTLINED_FUNCTION_32();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  return v7(a3, a1, v5);
}

uint64_t TextRun.hash(into:)()
{
  OUTLINED_FUNCTION_42_1();
  sub_24CC23480();
  sub_24CC202E8(&qword_269819748, MEMORY[0x263F5CA60]);
  return sub_24CC23E60();
}

uint64_t TextRun.hashValue.getter()
{
  return sub_24CC24350();
}

uint64_t sub_24CC1F834@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1DC30(a1, a2);
}

void sub_24CC1F84C()
{
}

uint64_t sub_24CC1F8B0()
{
  return sub_24CC24350();
}

uint64_t TextRun.TextConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC1F9E8(MEMORY[0x263F5CAB8], a1);
}

uint64_t sub_24CC1F95C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1DE80(a1, a2);
}

void sub_24CC1F974()
{
}

uint64_t TextRun.SymbolConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CC1F9E8(MEMORY[0x263F5CAC8], a1);
}

uint64_t sub_24CC1F9E8@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  a1(0);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a2, v2, v4);
}

uint64_t sub_24CC1FA60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CC1E0D0(a1, a2);
}

void sub_24CC1FA78()
{
}

void sub_24CC1FAD4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_9_8();
    __break(1u);
  }
  else if (a3 < a1 || (a4(0), OUTLINED_FUNCTION_32(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_41_0();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_41_0();
    swift_arrayInitWithTakeBackToFront();
  }
}

void sub_24CC1FBD0(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_24CC1FBE8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_9_8();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_6(a3, result);
  }
  return result;
}

char *sub_24CC1FC4C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_9_8();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_6(a3, result);
  }
  return result;
}

char *sub_24CC1FCA8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    unint64_t result = (char *)OUTLINED_FUNCTION_9_8();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_6(a3, result);
  }
  return result;
}

void sub_24CC1FD04(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_24CC1FD1C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_24CC241F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_24CC1FDB0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_36_1();
LABEL_11:
    uint64_t result = sub_24CC241F0();
    __break(1u);
    return result;
  }
  a4(0);
  OUTLINED_FUNCTION_32();
  uint64_t v8 = *(void *)(v7 + 72) * a2;
  unint64_t v9 = a3 + v8;
  unint64_t v10 = a1 + v8;
  if (v9 > a1 && v10 > a3)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_35_1();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_40_1();
  return swift_arrayInitWithCopy();
}

uint64_t sub_24CC1FE90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_36_1();
LABEL_11:
    uint64_t result = sub_24CC241F0();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_35_1();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_24CC1FF48(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_36_1();
LABEL_11:
    uint64_t result = sub_24CC241F0();
    __break(1u);
    return result;
  }
  if (a3 + 8 * a2 > a1 && a1 + 8 * a2 > a3)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_35_1();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_40_1();
  return swift_arrayInitWithCopy();
}

void *sub_24CC20010(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24CC241F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

char *sub_24CC200EC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC21278(a1, a2, a3, *v3, &qword_269818D90, &qword_269818C18);
  *BOOL v3 = (uint64_t)result;
  return result;
}

void sub_24CC2011C()
{
  sub_24CC214B0();
  *uint64_t v0 = v1;
}

void sub_24CC20180()
{
  sub_24CC214B0();
  *uint64_t v0 = v1;
}

uint64_t sub_24CC201E4()
{
  return sub_24CC1F350();
}

uint64_t sub_24CC20200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for TextRun.Value(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819778);
}

uint64_t sub_24CC20288(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819740);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CC202E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CC20330()
{
  return sub_24CC202E8(&qword_269819738, MEMORY[0x263F5CA60]);
}

uint64_t sub_24CC20378()
{
  return sub_24CC202E8(&qword_269819750, (void (*)(uint64_t))type metadata accessor for TextRun);
}

uint64_t sub_24CC203C0()
{
  return sub_24CC202E8(&qword_269819758, MEMORY[0x263F5CAB8]);
}

uint64_t sub_24CC20408()
{
  return sub_24CC202E8(&qword_269819760, MEMORY[0x263F5CAC8]);
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun()
{
  return sub_24CC20C90();
}

uint64_t destroy for TextRun()
{
  return sub_24CC20D04();
}

uint64_t initializeWithCopy for TextRun()
{
  return sub_24CC20D78();
}

uint64_t assignWithCopy for TextRun()
{
  return sub_24CC20DDC();
}

uint64_t initializeWithTake for TextRun()
{
  return sub_24CC20E40();
}

uint64_t assignWithTake for TextRun()
{
  return sub_24CC20EA4();
}

uint64_t getEnumTagSinglePayload for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC204F4);
}

uint64_t sub_24CC204F4()
{
  sub_24CC23480();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC20548);
}

uint64_t sub_24CC20548()
{
  sub_24CC23480();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_24CC20588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC20FD0(a1, a2, a3, MEMORY[0x263F5CA60]);
}

uint64_t *initializeBufferWithCopyOfBuffer for TextRun.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = sub_24CC23600();
    }
    else {
      uint64_t v6 = sub_24CC23560();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for TextRun.Value(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_24CC23600();
  }
  else {
    uint64_t v2 = sub_24CC23560();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for TextRun.Value(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_24CC23600();
  }
  else {
    uint64_t v4 = sub_24CC23560();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for TextRun.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CC21120();
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_24CC23600();
    }
    else {
      uint64_t v4 = sub_24CC23560();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for TextRun.Value(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_24CC23600();
  }
  else {
    uint64_t v4 = sub_24CC23560();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for TextRun.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24CC21120();
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_24CC23600();
    }
    else {
      uint64_t v4 = sub_24CC23560();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24CC20A44()
{
  uint64_t result = sub_24CC23560();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CC23600();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun.TextConfiguration()
{
  return sub_24CC20C90();
}

uint64_t destroy for TextRun.TextConfiguration()
{
  return sub_24CC20D04();
}

uint64_t initializeWithCopy for TextRun.TextConfiguration()
{
  return sub_24CC20D78();
}

uint64_t assignWithCopy for TextRun.TextConfiguration()
{
  return sub_24CC20DDC();
}

uint64_t initializeWithTake for TextRun.TextConfiguration()
{
  return sub_24CC20E40();
}

uint64_t assignWithTake for TextRun.TextConfiguration()
{
  return sub_24CC20EA4();
}

uint64_t getEnumTagSinglePayload for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC20BAC);
}

uint64_t sub_24CC20BAC()
{
  sub_24CC23560();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC20C00);
}

uint64_t sub_24CC20C00()
{
  sub_24CC23560();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for TextRun.TextConfiguration(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819788);
}

uint64_t sub_24CC20C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC20FD0(a1, a2, a3, MEMORY[0x263F5CAB8]);
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun.SymbolConfiguration()
{
  return sub_24CC20C90();
}

uint64_t sub_24CC20C90()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_6();
  v3(v2);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = *v5;
  return v6(v1, v0, v4);
}

uint64_t destroy for TextRun.SymbolConfiguration()
{
  return sub_24CC20D04();
}

uint64_t sub_24CC20D04()
{
  uint64_t v1 = OUTLINED_FUNCTION_42_1();
  v2(v1);
  OUTLINED_FUNCTION_32();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  return v5(v0, v3);
}

uint64_t initializeWithCopy for TextRun.SymbolConfiguration()
{
  return sub_24CC20D78();
}

uint64_t sub_24CC20D78()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_6();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t assignWithCopy for TextRun.SymbolConfiguration()
{
  return sub_24CC20DDC();
}

uint64_t sub_24CC20DDC()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_6();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t initializeWithTake for TextRun.SymbolConfiguration()
{
  return sub_24CC20E40();
}

uint64_t sub_24CC20E40()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_6();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t assignWithTake for TextRun.SymbolConfiguration()
{
  return sub_24CC20EA4();
}

uint64_t sub_24CC20EA4()
{
  uint64_t v1 = OUTLINED_FUNCTION_8_6();
  v2(v1);
  OUTLINED_FUNCTION_32();
  uint64_t v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  return v0;
}

uint64_t getEnumTagSinglePayload for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC20F04);
}

uint64_t sub_24CC20F04()
{
  sub_24CC23600();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  return __swift_getEnumTagSinglePayload(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC20F58);
}

uint64_t sub_24CC20F58()
{
  sub_24CC23600();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for TextRun.SymbolConfiguration(uint64_t a1)
{
  return sub_24CBE9F24(a1, (uint64_t *)&unk_269819798);
}

uint64_t sub_24CC20FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CC20FD0(a1, a2, a3, MEMORY[0x263F5CAC8]);
}

uint64_t sub_24CC20FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CC21060(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_25_2();
  v4();
  return a2;
}

uint64_t sub_24CC210BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextRun(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CC21120()
{
  uint64_t v1 = OUTLINED_FUNCTION_42_1();
  v2(v1);
  OUTLINED_FUNCTION_32();
  (*(void (**)(uint64_t))(v3 + 8))(v0);
  return v0;
}

char *sub_24CC21174(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC21278(a1, a2, a3, *v3, &qword_2698197B8, &qword_269818B58);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_24CC211A4()
{
  sub_24CC214B0();
  *uint64_t v0 = v1;
}

char *sub_24CC21208(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC21368(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_24CC21228(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC21278(a1, a2, a3, *v3, &qword_2698197D8, &qword_269818E48);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_24CC21258(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CC21638(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_24CC21278(char *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (char *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    *((void *)v13 + 2) = v11;
    *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 8);
  }
  else
  {
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v13 + 32;
  uint64_t v16 = (char *)(a4 + 32);
  if (v8)
  {
    sub_24CC1FCA8(v16, v11, v15);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CC1FF48((unint64_t)v16, v11, (unint64_t)v15, a6);
  }
  swift_release();
  return v13;
}

char *sub_24CC21368(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818F30);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24CC1FC4C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CC1FE90((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_24CC2144C()
{
  return sub_24CC1F45C();
}

void sub_24CC21468()
{
}

void sub_24CC214B0()
{
  OUTLINED_FUNCTION_22_1();
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v1;
  char v11 = v10;
  if (v12)
  {
    unint64_t v13 = *(void *)(v1 + 24);
    uint64_t v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < v0)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v14 = v0;
      }
    }
  }
  else
  {
    uint64_t v14 = v0;
  }
  uint64_t v15 = *(void *)(v1 + 16);
  if (v14 <= v15) {
    uint64_t v16 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v16 = v14;
  }
  if (!v16)
  {
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v2);
  uint64_t v17 = v8(0);
  OUTLINED_FUNCTION_1_0(v17);
  uint64_t v19 = *(void *)(v18 + 72);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = (void *)swift_allocObject();
  size_t v23 = _swift_stdlib_malloc_size(v22);
  if (!v19)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v23 - v21 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_24;
  }
  v22[2] = v15;
  v22[3] = 2 * ((uint64_t)(v23 - v21) / v19);
LABEL_19:
  uint64_t v25 = *(void *)(v8(0) - 8);
  unint64_t v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (unint64_t)v22 + v26;
  unint64_t v28 = v9 + v26;
  if (v11)
  {
    sub_24CC1FAD4(v28, v15, v27, v6);
    *(void *)(v9 + 16) = 0;
  }
  else
  {
    sub_24CC1FDB0(v28, v15, v27, v4);
  }
  swift_release();
  OUTLINED_FUNCTION_20_3();
}

char *sub_24CC21638(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698197B0);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24CC1FD1C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CC20010(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_24CC241D0();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  return sub_24CC241F0();
}

void *OUTLINED_FUNCTION_10_6@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_6(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_14_7@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 72) = v1;
  *(void *)(v2 - 104) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_24CC24270();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_24CC24360();
}

unint64_t OUTLINED_FUNCTION_24_2()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return sub_24CBE9598();
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return type metadata accessor for TextRun(0);
}

void OUTLINED_FUNCTION_28_1()
{
  sub_24CC1D354();
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  *(void *)(v2 - 96) = v1;
  *(void *)(v2 - 88) = v0;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_39_1()
{
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return 0;
}

BOOL static SelectableContentItemStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SelectableContentItemStyle.hash(into:)()
{
  return sub_24CC24340();
}

uint64_t SelectableContentItemStyle.hashValue.getter()
{
  return sub_24CC24350();
}

Swift::String_optional __swiftcall Array.selectableContent(itemStyle:)(DeviceExpertIntents::SelectableContentItemStyle itemStyle)
{
  uint64_t v2 = v1;
  char v3 = *(unsigned char *)itemStyle;
  uint64_t v28 = v1;
  sub_24CC24020();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269818B58);
  if (OUTLINED_FUNCTION_0_11())
  {
    sub_24CC1EE00();
    uint64_t v5 = v4;
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    uint64_t v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (!v8)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = 0;
      unint64_t v7 = 0;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = v2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698194C0);
  if (OUTLINED_FUNCTION_0_11())
  {
    v25[2] = v25;
    uint64_t v9 = v27;
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_24CC21208(0, 0, 0);
    uint64_t v10 = v26;
    uint64_t v11 = *(void *)(v9 + 16);
    swift_bridgeObjectRetain();
    v25[1] = v9;
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v9 + 32;
      do
      {
        uint64_t v14 = *(void *)(v13 + 8 * v12);
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_24CC21CB4(v12, v14, v3);
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        uint64_t v26 = v10;
        unint64_t v19 = *(void *)(v10 + 16);
        unint64_t v18 = *(void *)(v10 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24CC21208((char *)(v18 > 1), v19 + 1, 1);
          uint64_t v10 = v26;
        }
        ++v12;
        *(void *)(v10 + 16) = v19 + 1;
        uint64_t v20 = v10 + 16 * v19;
        *(void *)(v20 + 32) = v15;
        *(void *)(v20 + 40) = v17;
      }
      while (v11 != v12);
    }
    swift_bridgeObjectRelease_n();
    uint64_t v26 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269818E50);
    sub_24CBEF2C0();
    uint64_t v5 = sub_24CC23E80();
    unint64_t v7 = v21;
    swift_release();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = 0;
  unint64_t v7 = 0;
LABEL_16:
  uint64_t v22 = v5;
  size_t v23 = (void *)v7;
  result.value._object = v23;
  result.value._uint64_t countAndFlagsBits = v22;
  return result;
}

uint64_t sub_24CC21CB4(uint64_t result, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 8234;
    }
    goto LABEL_7;
  }
  if (!__OFADD__(result, 1))
  {
    uint64_t v4 = sub_24CC24300();
    sub_24CC23F50();
    uint64_t v3 = v4;
LABEL_7:
    uint64_t v5 = v3;
    sub_24CC1EE00();
    sub_24CC23F50();
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CC21D68(DeviceExpertIntents::SelectableContentItemStyle itemStyle)
{
  return Array.selectableContent(itemStyle:)(itemStyle).value._countAndFlagsBits;
}

unint64_t sub_24CC21D7C()
{
  unint64_t result = qword_2698197E0;
  if (!qword_2698197E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698197E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SelectableContentItemStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC21E94);
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

ValueMetadata *type metadata accessor for SelectableContentItemStyle()
{
  return &type metadata for SelectableContentItemStyle;
}

uint64_t dispatch thunk of ContentSelectable.selectableContent(itemStyle:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return swift_dynamicCast();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return sub_24CC23290();
}

uint64_t AttributeScopes.DeviceExpertIntentAttributes.foundation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CC23170();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_2698197E8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.setter(uint64_t a1, void *a2)
{
  qword_2698197E8 = a1;
  off_2698197F0 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CC220C8()
{
  return sub_24CC23320();
}

uint64_t sub_24CC22128()
{
  return sub_24CC23330();
}

unint64_t sub_24CC2218C()
{
  unint64_t result = qword_2698197F8;
  if (!qword_2698197F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698197F8);
  }
  return result;
}

uint64_t sub_24CC221E8()
{
  return sub_24CBF6308(&qword_269819010);
}

uint64_t type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes()
{
  uint64_t result = qword_269819800;
  if (!qword_269819800) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CC22264()
{
  return sub_24CBF6308(&qword_269819018);
}

void sub_24CC222A0()
{
  sub_24CBF6308(&qword_269818F90);
  JUMPOUT(0x25330B900);
}

void sub_24CC22308()
{
  sub_24CBF6308(&qword_269818F90);
  JUMPOUT(0x25330B910);
}

uint64_t _s28DeviceExpertIntentAttributesVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t _s28DeviceExpertIntentAttributesVwxx(uint64_t a1)
{
  uint64_t v2 = sub_24CC23170();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t _s28DeviceExpertIntentAttributesVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwtk(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CC225E4);
}

uint64_t sub_24CC225E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t _s28DeviceExpertIntentAttributesVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CC22640);
}

uint64_t sub_24CC22640(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC23170();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_24CC2268C()
{
  uint64_t result = sub_24CC23170();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey()
{
  return &type metadata for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey;
}

unint64_t sub_24CC22738()
{
  unint64_t result = qword_269819810;
  if (!qword_269819810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819810);
  }
  return result;
}

unint64_t sub_24CC22784()
{
  unint64_t result = qword_269819818;
  if (!qword_269819818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819818);
  }
  return result;
}

DeviceExpertIntents::FlowContext __swiftcall FlowContext.init(sessionId:clusterId:)(Swift::String sessionId, Swift::String clusterId)
{
  Swift::String *v2 = sessionId;
  v2[1] = clusterId;
  result.clusterId = clusterId;
  result.sessionId = sessionId;
  return result;
}

void sub_24CC227DC()
{
  qword_269819820 = 0x6E776F6E6B6E75;
  *(void *)algn_269819828 = 0xE700000000000000;
  qword_269819830 = 0x6E776F6E6B6E75;
  unk_269819838 = 0xE700000000000000;
}

uint64_t static FlowContext.unknown.getter@<X0>(void *a1@<X8>)
{
  if (qword_269818AD8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_269819828;
  uint64_t v3 = qword_269819830;
  uint64_t v4 = unk_269819838;
  *a1 = qword_269819820;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t FlowContext.sessionId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowContext.sessionId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FlowContext.sessionId.modify())()
{
  return nullsub_1;
}

uint64_t FlowContext.clusterId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowContext.clusterId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*FlowContext.clusterId.modify())()
{
  return nullsub_1;
}

uint64_t sub_24CC22994(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000064;
  if (v3 || (sub_24CC24310() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4972657473756C63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24CC24310();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CC22A8C(char a1)
{
  if (a1) {
    return 0x4972657473756C63;
  }
  else {
    return 0x496E6F6973736573;
  }
}

uint64_t sub_24CC22AC0()
{
  return sub_24CC22A8C(*v0);
}

uint64_t sub_24CC22AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CC22994(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CC22AF0(uint64_t a1)
{
  unint64_t v2 = sub_24CC22CB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CC22B2C(uint64_t a1)
{
  unint64_t v2 = sub_24CC22CB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FlowContext.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819840);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC22CB8();
  sub_24CC24370();
  char v14 = 0;
  uint64_t v10 = v12[3];
  sub_24CC242C0();
  if (!v10)
  {
    char v13 = 1;
    sub_24CC242C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_24CC22CB8()
{
  unint64_t result = qword_269819848;
  if (!qword_269819848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819848);
  }
  return result;
}

uint64_t FlowContext.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269819850);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CC22CB8();
  sub_24CC24360();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v22 = 0;
  uint64_t v11 = sub_24CC24250();
  uint64_t v13 = v12;
  char v21 = 1;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24CC24250();
  uint64_t v16 = v15;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v20 = v14;
  v17(v10, v5);
  *a2 = v11;
  a2[1] = v13;
  a2[2] = v20;
  a2[3] = v16;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CC22EC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return FlowContext.init(from:)(a1, a2);
}

uint64_t sub_24CC22EE0(void *a1)
{
  return FlowContext.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for FlowContext()
{
  return &type metadata for FlowContext;
}

unsigned char *storeEnumTagSinglePayload for FlowContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CC22FD4);
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

ValueMetadata *type metadata accessor for FlowContext.CodingKeys()
{
  return &type metadata for FlowContext.CodingKeys;
}

unint64_t sub_24CC23010()
{
  unint64_t result = qword_269819858;
  if (!qword_269819858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819858);
  }
  return result;
}

unint64_t sub_24CC23060()
{
  unint64_t result = qword_269819860;
  if (!qword_269819860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819860);
  }
  return result;
}

unint64_t sub_24CC230B0()
{
  unint64_t result = qword_269819868;
  if (!qword_269819868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269819868);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return v0;
}

uint64_t sub_24CC23110()
{
  return MEMORY[0x270EEE530]();
}

uint64_t sub_24CC23120()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_24CC23130()
{
  return MEMORY[0x270EEE5D8]();
}

uint64_t sub_24CC23140()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24CC23150()
{
  return MEMORY[0x270EEE6A0]();
}

uint64_t sub_24CC23160()
{
  return MEMORY[0x270EEE6B0]();
}

uint64_t sub_24CC23170()
{
  return MEMORY[0x270EEEA48]();
}

uint64_t sub_24CC23180()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_24CC23190()
{
  return MEMORY[0x270EEECD8]();
}

uint64_t sub_24CC231A0()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_24CC231B0()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_24CC231C0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24CC231D0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_24CC231E0()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_24CC231F0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_24CC23200()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24CC23210()
{
  return MEMORY[0x270EEF138]();
}

uint64_t sub_24CC23220()
{
  return MEMORY[0x270EEF140]();
}

uint64_t sub_24CC23230()
{
  return MEMORY[0x270EEF150]();
}

uint64_t sub_24CC23240()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_24CC23250()
{
  return MEMORY[0x270EEF2F0]();
}

uint64_t sub_24CC23260()
{
  return MEMORY[0x270EEF2F8]();
}

uint64_t sub_24CC23270()
{
  return MEMORY[0x270EEF300]();
}

uint64_t sub_24CC23280()
{
  return MEMORY[0x270EEF308]();
}

uint64_t sub_24CC23290()
{
  return MEMORY[0x270EEF818]();
}

uint64_t sub_24CC232A0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CC232B0()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_24CC232C0()
{
  return MEMORY[0x270EEF898]();
}

uint64_t sub_24CC232D0()
{
  return MEMORY[0x270EEF8A0]();
}

uint64_t sub_24CC232E0()
{
  return MEMORY[0x270EEF8A8]();
}

uint64_t sub_24CC232F0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24CC23300()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_24CC23310()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_24CC23320()
{
  return MEMORY[0x270EEFA90]();
}

uint64_t sub_24CC23330()
{
  return MEMORY[0x270EEFA98]();
}

uint64_t sub_24CC23340()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24CC23350()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24CC23360()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24CC23370()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24CC23380()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CC23390()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CC233A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24CC233B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CC233C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CC233D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CC233E0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_24CC233F0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24CC23400()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24CC23410()
{
  return MEMORY[0x270F52170]();
}

uint64_t sub_24CC23420()
{
  return MEMORY[0x270F52178]();
}

uint64_t sub_24CC23430()
{
  return MEMORY[0x270F52180]();
}

uint64_t sub_24CC23440()
{
  return MEMORY[0x270F52188]();
}

uint64_t _s19DeviceExpertIntents7TextRunV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270F52190]();
}

uint64_t sub_24CC23460()
{
  return MEMORY[0x270F52198]();
}

uint64_t sub_24CC23470()
{
  return MEMORY[0x270F521A0]();
}

uint64_t sub_24CC23480()
{
  return MEMORY[0x270F521A8]();
}

uint64_t sub_24CC23490()
{
  return MEMORY[0x270F521B0]();
}

uint64_t sub_24CC234A0()
{
  return MEMORY[0x270F521B8]();
}

uint64_t sub_24CC234B0()
{
  return MEMORY[0x270F521C0]();
}

uint64_t _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV10parametersSaySSGSgvg_0()
{
  return MEMORY[0x270F521C8]();
}

uint64_t _s19DeviceExpertIntents6ActionV5labelSSvg_0()
{
  return MEMORY[0x270F521D0]();
}

uint64_t _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0()
{
  return MEMORY[0x270F521D8]();
}

uint64_t sub_24CC234F0()
{
  return MEMORY[0x270F521E0]();
}

uint64_t sub_24CC23500()
{
  return MEMORY[0x270F521E8]();
}

uint64_t sub_24CC23510()
{
  return MEMORY[0x270F521F0]();
}

uint64_t sub_24CC23520()
{
  return MEMORY[0x270F521F8]();
}

uint64_t sub_24CC23530()
{
  return MEMORY[0x270F52200]();
}

uint64_t sub_24CC23540()
{
  return MEMORY[0x270F52208]();
}

uint64_t sub_24CC23550()
{
  return MEMORY[0x270F52210]();
}

uint64_t sub_24CC23560()
{
  return MEMORY[0x270F52218]();
}

uint64_t sub_24CC23570()
{
  return MEMORY[0x270F52220]();
}

uint64_t sub_24CC23580()
{
  return MEMORY[0x270F52228]();
}

uint64_t sub_24CC23590()
{
  return MEMORY[0x270F52230]();
}

uint64_t sub_24CC235A0()
{
  return MEMORY[0x270F52238]();
}

uint64_t sub_24CC235B0()
{
  return MEMORY[0x270F52240]();
}

uint64_t sub_24CC235C0()
{
  return MEMORY[0x270F52248]();
}

uint64_t sub_24CC235D0()
{
  return MEMORY[0x270F52250]();
}

uint64_t sub_24CC235E0()
{
  return MEMORY[0x270F52258]();
}

uint64_t sub_24CC235F0()
{
  return MEMORY[0x270F52260]();
}

uint64_t sub_24CC23600()
{
  return MEMORY[0x270F52268]();
}

uint64_t sub_24CC23610()
{
  return MEMORY[0x270F52270]();
}

uint64_t sub_24CC23620()
{
  return MEMORY[0x270F52278]();
}

uint64_t sub_24CC23630()
{
  return MEMORY[0x270F52280]();
}

uint64_t sub_24CC23640()
{
  return MEMORY[0x270F52288]();
}

uint64_t sub_24CC23650()
{
  return MEMORY[0x270F52290]();
}

uint64_t sub_24CC23660()
{
  return MEMORY[0x270F52298]();
}

uint64_t sub_24CC23670()
{
  return MEMORY[0x270F522A0]();
}

uint64_t sub_24CC23680()
{
  return MEMORY[0x270F522A8]();
}

uint64_t _s19DeviceExpertIntents6ActionV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270F522B0]();
}

uint64_t _s19DeviceExpertIntents6ActionV2idSSvg_0()
{
  return MEMORY[0x270F522B8]();
}

uint64_t sub_24CC236B0()
{
  return MEMORY[0x270F522C0]();
}

uint64_t sub_24CC236C0()
{
  return MEMORY[0x270F522C8]();
}

uint64_t sub_24CC236D0()
{
  return MEMORY[0x270F522D0]();
}

uint64_t sub_24CC236E0()
{
  return MEMORY[0x270F522D8]();
}

uint64_t sub_24CC236F0()
{
  return MEMORY[0x270F522E0]();
}

uint64_t sub_24CC23700()
{
  return MEMORY[0x270F522E8]();
}

uint64_t sub_24CC23710()
{
  return MEMORY[0x270F522F0]();
}

uint64_t sub_24CC23720()
{
  return MEMORY[0x270F522F8]();
}

uint64_t sub_24CC23730()
{
  return MEMORY[0x270F52300]();
}

uint64_t sub_24CC23740()
{
  return MEMORY[0x270F52308]();
}

uint64_t sub_24CC23750()
{
  return MEMORY[0x270F52310]();
}

uint64_t sub_24CC23760()
{
  return MEMORY[0x270F52318]();
}

uint64_t sub_24CC23770()
{
  return MEMORY[0x270F52320]();
}

uint64_t sub_24CC23780()
{
  return MEMORY[0x270F52328]();
}

uint64_t sub_24CC23790()
{
  return MEMORY[0x270F52330]();
}

uint64_t sub_24CC237A0()
{
  return MEMORY[0x270F52338]();
}

uint64_t sub_24CC237B0()
{
  return MEMORY[0x270F52340]();
}

uint64_t sub_24CC237C0()
{
  return MEMORY[0x270F52348]();
}

uint64_t sub_24CC237D0()
{
  return MEMORY[0x270F52350]();
}

uint64_t sub_24CC237E0()
{
  return MEMORY[0x270F52358]();
}

uint64_t sub_24CC237F0()
{
  return MEMORY[0x270F52360]();
}

uint64_t sub_24CC23800()
{
  return MEMORY[0x270F530E0]();
}

uint64_t sub_24CC23810()
{
  return MEMORY[0x270F530E8]();
}

uint64_t sub_24CC23820()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_24CC23830()
{
  return MEMORY[0x270F74438]();
}

uint64_t sub_24CC23840()
{
  return MEMORY[0x270F74440]();
}

uint64_t sub_24CC23850()
{
  return MEMORY[0x270F74448]();
}

uint64_t sub_24CC23860()
{
  return MEMORY[0x270F74450]();
}

uint64_t sub_24CC23870()
{
  return MEMORY[0x270F74458]();
}

uint64_t sub_24CC23880()
{
  return MEMORY[0x270F755E0]();
}

uint64_t sub_24CC23890()
{
  return MEMORY[0x270F755E8]();
}

uint64_t sub_24CC238A0()
{
  return MEMORY[0x270F75608]();
}

uint64_t sub_24CC238B0()
{
  return MEMORY[0x270F75618]();
}

uint64_t sub_24CC238C0()
{
  return MEMORY[0x270F75640]();
}

uint64_t sub_24CC238D0()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_24CC238E0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_24CC238F0()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_24CC23900()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_24CC23910()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_24CC23920()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_24CC23930()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_24CC23940()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_24CC23950()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_24CC23960()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_24CC23970()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_24CC239A0()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_24CC239B0()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_24CC239C0()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_24CC239D0()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_24CC239E0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_24CC239F0()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_24CC23A00()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_24CC23A10()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_24CC23A20()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_24CC23A30()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_24CC23A40()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_24CC23A50()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_24CC23A60()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_24CC23A70()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_24CC23AB0()
{
  return MEMORY[0x270F67CA8]();
}

uint64_t sub_24CC23AC0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_24CC23AD0()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_24CC23AE0()
{
  return MEMORY[0x270F67E48]();
}

uint64_t sub_24CC23AF0()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_24CC23B00()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_24CC23B10()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_24CC23B20()
{
  return MEMORY[0x270F67EC8]();
}

uint64_t sub_24CC23B30()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_24CC23B40()
{
  return MEMORY[0x270F67EE0]();
}

uint64_t sub_24CC23B50()
{
  return MEMORY[0x270F67F10]();
}

uint64_t sub_24CC23B60()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_24CC23B70()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_24CC23B80()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_24CC23B90()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_24CC23BA0()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_24CC23BB0()
{
  return MEMORY[0x270F68358]();
}

uint64_t sub_24CC23BC0()
{
  return MEMORY[0x270F68360]();
}

uint64_t sub_24CC23BD0()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_24CC23BE0()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_24CC23BF0()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_24CC23C10()
{
  return MEMORY[0x270F7E8F0]();
}

uint64_t sub_24CC23C20()
{
  return MEMORY[0x270F7E8F8]();
}

uint64_t sub_24CC23C30()
{
  return MEMORY[0x270F7E900]();
}

uint64_t sub_24CC23C40()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_24CC23C50()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_24CC23C60()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t sub_24CC23C70()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t sub_24CC23C80()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t sub_24CC23C90()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t sub_24CC23CA0()
{
  return MEMORY[0x270F650D0]();
}

uint64_t sub_24CC23CB0()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_24CC23CC0()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_24CC23CD0()
{
  return MEMORY[0x270F65368]();
}

uint64_t sub_24CC23CE0()
{
  return MEMORY[0x270F66040]();
}

uint64_t sub_24CC23CF0()
{
  return MEMORY[0x270F66048]();
}

uint64_t sub_24CC23D00()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_24CC23D10()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_24CC23D20()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_24CC23D30()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_24CC23D40()
{
  return MEMORY[0x270F44CD0]();
}

uint64_t sub_24CC23D50()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_24CC23D60()
{
  return MEMORY[0x270F660A0]();
}

uint64_t sub_24CC23D70()
{
  return MEMORY[0x270F660B0]();
}

uint64_t sub_24CC23D80()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CC23D90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CC23DA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CC23DB0()
{
  return MEMORY[0x270F7E9B8]();
}

uint64_t sub_24CC23DC0()
{
  return MEMORY[0x270F7E9C0]();
}

uint64_t sub_24CC23DD0()
{
  return MEMORY[0x270F7E9C8]();
}

uint64_t sub_24CC23E10()
{
  return MEMORY[0x270F7EAF0]();
}

uint64_t sub_24CC23E20()
{
  return MEMORY[0x270F7EB00]();
}

uint64_t sub_24CC23E30()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24CC23E40()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24CC23E50()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24CC23E60()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24CC23E70()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24CC23E80()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24CC23E90()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CC23EA0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24CC23EB0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24CC23EC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CC23ED0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CC23EE0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24CC23EF0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24CC23F00()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24CC23F10()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_24CC23F20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CC23F30()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24CC23F40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CC23F50()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CC23F60()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CC23F70()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24CC23F80()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24CC23F90()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24CC23FA0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CC23FB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CC23FC0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CC23FD0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24CC23FE0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24CC23FF0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CC24000()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24CC24010()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24CC24020()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24CC24030()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24CC24040()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CC24050()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CC24060()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CC24070()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24CC24080()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CC24090()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CC240A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CC240B0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24CC240C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CC240D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CC240E0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24CC240F0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CC24100()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CC24110()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CC24120()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24CC24130()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24CC24140()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CC24150()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CC24160()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CC24170()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24CC24180()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CC24190()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CC241A0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24CC241B0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_24CC241C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CC241D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CC241E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CC241F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CC24200()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CC24210()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24CC24220()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24CC24250()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24CC24260()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24CC24270()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24CC24280()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24CC24290()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24CC242A0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24CC242C0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24CC242D0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24CC242E0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24CC242F0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CC24300()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CC24310()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CC24320()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CC24330()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CC24340()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CC24350()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CC24360()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CC24370()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}