void sub_1A9365600()
{
  objectdestroy_122Tm();
}

void objectdestroy_122Tm()
{
  OUTLINED_FUNCTION_5();
  v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  v4 = (uint64_t *)(*(void *)(v0 + 24) & 0xFFFFFFFFFFFFFFFELL);
  if (v3 == 1)
  {
    uint64_t v5 = OUTLINED_FUNCTION_106_3(*v4);
    v2(v5);
    swift_checkMetadataState();
  }
  else
  {
    v25[1] = v25;
    MEMORY[0x1F4188790](v1);
    OUTLINED_FUNCTION_0();
    if (v3)
    {
      v11 = (uint64_t *)(v10 & 0xFFFFFFFFFFFFFFFELL);
      v12 = (uint64_t *)(v9 & 0xFFFFFFFFFFFFFFFELL);
      v13 = (uint64_t *)(v8 & 0xFFFFFFFFFFFFFFFELL);
      v14 = (void *)(v7 - v6);
      uint64_t v15 = v3;
      do
      {
        uint64_t v17 = *v4++;
        uint64_t v16 = v17;
        uint64_t v19 = *v11++;
        uint64_t v18 = v19;
        uint64_t v21 = *v12++;
        uint64_t v20 = v21;
        uint64_t v22 = *v13++;
        v26[0] = v16;
        v26[1] = v18;
        v26[2] = v20;
        v26[3] = v22;
        *v14++ = ((uint64_t (*)(uint64_t, void *))v2)(255, v26);
        --v15;
      }
      while (v15);
    }
    OUTLINED_FUNCTION_73_1();
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB658540);
  OUTLINED_FUNCTION_90_3();
  OUTLINED_FUNCTION_4();
  uint64_t v23 = OUTLINED_FUNCTION_18_26();
  v24(v23);
  OUTLINED_FUNCTION_64_3();
  OUTLINED_FUNCTION_6_0();
}

void sub_1A9365788()
{
}

uint64_t OUTLINED_FUNCTION_105_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_106_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *v3;
  *(void *)(v4 - 112) = a1;
  *(void *)(v4 - 104) = v1;
  *(void *)(v4 - 96) = v2;
  *(void *)(v4 - 88) = v5;
  return 255;
}

uint64_t OUTLINED_FUNCTION_128_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_136_2()
{
  return *(void *)(v0 + 392);
}

__n128 OUTLINED_FUNCTION_138_2(unint64_t a1)
{
  v3[7].n128_u64[1] = a1;
  __n128 result = v3[3];
  *(void *)(a1 + 16) = v1;
  *(__n128 *)(a1 + 24) = result;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v2;
  return result;
}

__n128 OUTLINED_FUNCTION_141_2()
{
  return v0[3];
}

void OUTLINED_FUNCTION_142_1()
{
  v5[2] = v0;
  v5[3] = v1;
  v5[4] = v2;
  v5[5] = v3;
  v5[6] = v4;
}

uint64_t OUTLINED_FUNCTION_143_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_146_2(uint64_t result)
{
  *(void *)(v1 + 344) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_155_2()
{
  return type metadata accessor for WeatherQuery();
}

uint64_t OUTLINED_FUNCTION_165_2()
{
  return sub_1A93AB9E8();
}

uint64_t OUTLINED_FUNCTION_172_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_178_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_199_1(uint64_t result)
{
  *(void *)(v1 + 128) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_207_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_209_1(uint64_t result)
{
  *(void *)(v1 + 264) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_221_1()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_223_1()
{
  return v0[3];
}

uint64_t OUTLINED_FUNCTION_225_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_227_1()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_229_0()
{
  return MEMORY[0x1F4188298]();
}

uint64_t OUTLINED_FUNCTION_230_0(uint64_t a1)
{
  *(void *)(v1 + 288) = a1;
  return swift_task_alloc();
}

uint64_t WeatherServicePeriodicRelativeRange.init(periodStart:periodEnd:periodLengths:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1A93ABC08();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  v9(a4, a1, v8);
  uint64_t v10 = type metadata accessor for WeatherServicePeriodicRelativeRange();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(a4 + *(int *)(v10 + 20), a2, v8);
  *(void *)(a4 + *(int *)(v10 + 24)) = a3;
  return result;
}

uint64_t sub_1A9365BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

void sub_1A9365C30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t NextHourCondition.init(date:expirationDate:shortDescription:longDescription:parameters:token:shift:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char v16 = *a8;
  HourCondition = (int *)type metadata accessor for NextHourCondition();
  uint64_t v18 = a9 + HourCondition[5];
  uint64_t v19 = sub_1A93ABC08();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a9, a1, v19);
  sub_1A91CD150(a2, v18);
  uint64_t v20 = (void *)(a9 + HourCondition[6]);
  *uint64_t v20 = a3;
  v20[1] = a4;
  uint64_t v21 = (void *)(a9 + HourCondition[7]);
  *uint64_t v21 = a5;
  v21[1] = a6;
  *(void *)(a9 + HourCondition[8]) = a7;
  *(unsigned char *)(a9 + HourCondition[9]) = v16;
  uint64_t v22 = a9 + HourCondition[10];

  return sub_1A9365E28(a10, v22);
}

uint64_t type metadata accessor for NextHourCondition()
{
  uint64_t result = qword_1EB6594E8;
  if (!qword_1EB6594E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A9365E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrecipitationShift();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NextHourCondition.date.getter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t NextHourCondition.date.setter(uint64_t a1)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*NextHourCondition.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NextHourCondition() + 20);

  return sub_1A9193C78(v3, a1);
}

uint64_t NextHourCondition.expirationDate.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_5_32() + 20);

  return sub_1A91CD150(v0, v2);
}

double (*NextHourCondition.expirationDate.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.shortDescription.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t NextHourCondition.shortDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for NextHourCondition() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double (*NextHourCondition.shortDescription.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.longDescription.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t NextHourCondition.longDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for NextHourCondition() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double (*NextHourCondition.longDescription.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.parameters.getter()
{
  type metadata accessor for NextHourCondition();

  return swift_bridgeObjectRetain();
}

uint64_t NextHourCondition.parameters.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_5_32() + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

double (*NextHourCondition.parameters.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.token.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for NextHourCondition();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t NextHourCondition.token.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for NextHourCondition();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

double (*NextHourCondition.token.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.shift.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t HourCondition = type metadata accessor for NextHourCondition();
  return sub_1A91D195C(v1 + *(int *)(HourCondition + 40), a1, (void (*)(void))type metadata accessor for PrecipitationShift);
}

uint64_t NextHourCondition.shift.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_5_32() + 40);

  return sub_1A927B860(v0, v2);
}

double (*NextHourCondition.shift.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourCondition.init(date:expirationDate:shift:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t HourCondition = (int *)type metadata accessor for NextHourCondition();
  uint64_t v9 = a4 + HourCondition[5];
  uint64_t v10 = sub_1A93ABC08();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  OUTLINED_FUNCTION_1_19();
  uint64_t v12 = v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a4, a1, v10);
  sub_1A91D4230(a2, v9);
  v13 = (void *)(a4 + HourCondition[6]);
  void *v13 = 0;
  v13[1] = 0xE000000000000000;
  v14 = (void *)(a4 + HourCondition[7]);
  void *v14 = 0;
  v14[1] = 0xE000000000000000;
  uint64_t v15 = sub_1A93ADD58();
  sub_1A91A6D88(a2, &qword_1EB657328);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v10);
  *(void *)(a4 + HourCondition[8]) = v15;
  *(unsigned char *)(a4 + HourCondition[9]) = 100;
  uint64_t v16 = a4 + HourCondition[10];

  return sub_1A9365E28(a3, v16);
}

uint64_t NextHourCondition.init(date:expirationDate:shortDescription:longDescription:parameters:token:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned __int8 *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v47 = a1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  MEMORY[0x1F4188790](v13 - 8);
  OUTLINED_FUNCTION_83();
  uint64_t v41 = v14 - v15;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = &v39[-v17];
  uint64_t v19 = type metadata accessor for PrecipitationShift();
  uint64_t v20 = v19 - 8;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_83();
  uint64_t v23 = v21 - v22;
  MEMORY[0x1F4188790](v24);
  v42 = &v39[-v25];
  int v40 = *a8;
  uint64_t HourCondition = (int *)type metadata accessor for NextHourCondition();
  uint64_t v27 = a9 + HourCondition[5];
  uint64_t v28 = sub_1A93ABC08();
  OUTLINED_FUNCTION_0_1(v27);
  OUTLINED_FUNCTION_1_19();
  uint64_t v30 = v29;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(a9, v47, v28);
  sub_1A91D4230(a2, v27);
  v31 = (void *)(a9 + HourCondition[6]);
  uint64_t v32 = v44;
  void *v31 = v43;
  v31[1] = v32;
  v33 = (void *)(a9 + HourCondition[7]);
  uint64_t v34 = v46;
  void *v33 = v45;
  v33[1] = v34;
  *(void *)(a9 + HourCondition[8]) = a7;
  *(unsigned char *)(a9 + HourCondition[9]) = v40;
  OUTLINED_FUNCTION_0_1((uint64_t)v18);
  uint64_t v35 = v41;
  OUTLINED_FUNCTION_0_1(v41);
  OUTLINED_FUNCTION_0_1(v23);
  uint64_t v36 = v23 + *(int *)(v20 + 28);
  OUTLINED_FUNCTION_0_1(v36);
  sub_1A91CD150((uint64_t)v18, v23);
  sub_1A91CD150(v35, v36);
  *(unsigned char *)(v23 + *(int *)(v20 + 32)) = 100;
  v37 = v42;
  sub_1A9365E28(v23, (uint64_t)v42);
  sub_1A91A6D88(a2, &qword_1EB657328);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v47, v28);
  return sub_1A9365E28((uint64_t)v37, a9 + HourCondition[10]);
}

unint64_t sub_1A9366774(char a1)
{
  unint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6974617269707865;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x63736544676E6F6CLL;
      break;
    case 4:
      unint64_t result = 0x6574656D61726170;
      break;
    case 5:
      unint64_t result = 0x6E656B6F74;
      break;
    case 6:
      unint64_t result = 0x7466696873;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1A936686C()
{
  return sub_1A9366774(*v0);
}

uint64_t sub_1A9366874(uint64_t a1)
{
  unint64_t v2 = sub_1A9366F78();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93668B0(uint64_t a1)
{
  unint64_t v2 = sub_1A9366F78();

  return MEMORY[0x1F41862B0](a1, v2);
}

BOOL static NextHourCondition.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6563B0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  MEMORY[0x1F4188790](v16 - 8);
  OUTLINED_FUNCTION_83();
  uint64_t v19 = v17 - v18;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = &v43[-v21];
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = &v43[-v24];
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v46 = v6;
  uint64_t HourCondition = type metadata accessor for NextHourCondition();
  sub_1A9193C78(a1 + *(int *)(HourCondition + 20), (uint64_t)v25);
  uint64_t v45 = (int *)HourCondition;
  sub_1A9193C78(a2 + *(int *)(HourCondition + 20), (uint64_t)v22);
  uint64_t v27 = v15 + *(int *)(v11 + 48);
  sub_1A9193C78((uint64_t)v25, v15);
  sub_1A9193C78((uint64_t)v22, v27);
  OUTLINED_FUNCTION_1_9(v15);
  if (!v28)
  {
    sub_1A9193C78(v15, v19);
    OUTLINED_FUNCTION_1_9(v27);
    if (!v28)
    {
      uint64_t v31 = v46;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v10, v27, v4);
      sub_1A927DC34(&qword_1EB6563C0, MEMORY[0x1E4F27928]);
      int v44 = sub_1A93ADDB8();
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v32(v10, v4);
      sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
      sub_1A91A6D88((uint64_t)v25, &qword_1EB657328);
      v32(v19, v4);
      sub_1A91A6D88(v15, &qword_1EB657328);
      if (v44) {
        goto LABEL_14;
      }
      return 0;
    }
    sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v25, &qword_1EB657328);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v19, v4);
LABEL_10:
    sub_1A91A6D88(v15, &qword_1EB6563B0);
    return 0;
  }
  sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
  sub_1A91A6D88((uint64_t)v25, &qword_1EB657328);
  OUTLINED_FUNCTION_1_9(v27);
  if (!v28) {
    goto LABEL_10;
  }
  sub_1A91A6D88(v15, &qword_1EB657328);
LABEL_14:
  v33 = v45;
  OUTLINED_FUNCTION_22_10(v45[6]);
  if (v28) {
    BOOL v36 = v34 == v35;
  }
  else {
    BOOL v36 = 0;
  }
  if (v36 || (v37 = sub_1A93AE4B8(), BOOL v29 = 0, (v37 & 1) != 0))
  {
    OUTLINED_FUNCTION_22_10(v33[7]);
    BOOL v40 = v28 && v38 == v39;
    if (v40 || (v41 = sub_1A93AE4B8(), BOOL v29 = 0, (v41 & 1) != 0))
    {
      sub_1A927C4E4();
      if ((v42 & 1) != 0 && *(unsigned __int8 *)(a1 + v33[9]) == *(unsigned __int8 *)(a2 + v33[9])) {
        return static PrecipitationShift.== infix(_:_:)(a1 + v33[10], a2 + v33[10]);
      }
      return 0;
    }
  }
  return v29;
}

uint64_t NextHourCondition.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC1A8);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9366F78();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A927DC34(&qword_1EB656220, MEMORY[0x1E4F27928]);
  OUTLINED_FUNCTION_15_14();
  sub_1A93AE478();
  if (!v1)
  {
    type metadata accessor for NextHourCondition();
    OUTLINED_FUNCTION_15_14();
    sub_1A93AE418();
    OUTLINED_FUNCTION_21_0(2);
    OUTLINED_FUNCTION_21_0(3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B9340);
    sub_1A927D4C0();
    sub_1A93AE478();
    sub_1A927D56C();
    sub_1A93AE478();
    type metadata accessor for PrecipitationShift();
    sub_1A927DC34(&qword_1E97B9358, (void (*)(uint64_t))type metadata accessor for PrecipitationShift);
    sub_1A93AE478();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A9366F78()
{
  unint64_t result = qword_1E97BC1B0;
  if (!qword_1E97BC1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC1B0);
  }
  return result;
}

uint64_t NextHourCondition.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for PrecipitationShift();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v33 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC1B8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_0();
  type metadata accessor for NextHourCondition();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v19;
  uint64_t v22 = v21 - v20;
  uint64_t v36 = v21 - v20 + v19[5];
  __swift_storeEnumTagSinglePayload(v36, 1, 1, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9366F78();
  sub_1A93AE5C8();
  if (v34)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_1A91A6D88(v36, &qword_1EB657328);
  }
  else
  {
    sub_1A927DC34(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_17();
    sub_1A93AE3C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v22, v16, v11);
    OUTLINED_FUNCTION_17();
    sub_1A93AE368();
    sub_1A91CD150(v10, v36);
    uint64_t v23 = sub_1A93AE378();
    uint64_t v24 = (uint64_t *)(v22 + v35[6]);
    *uint64_t v24 = v23;
    v24[1] = v25;
    LOBYTE(v37) = 3;
    uint64_t v26 = sub_1A93AE378();
    uint64_t v27 = (uint64_t *)(v22 + v35[7]);
    *uint64_t v27 = v26;
    v27[1] = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B9340);
    sub_1A927DB3C();
    sub_1A93AE3C8();
    *(void *)(v22 + v35[8]) = v37;
    sub_1A927DBE8();
    sub_1A93AE3C8();
    *(unsigned char *)(v22 + v35[9]) = 3;
    sub_1A927DC34(&qword_1E97B9378, (void (*)(uint64_t))type metadata accessor for PrecipitationShift);
    sub_1A93AE3C8();
    uint64_t v29 = OUTLINED_FUNCTION_12_19();
    v30(v29);
    sub_1A9365E28(v6, v22 + v35[10]);
    sub_1A91D195C(v22, a2, (void (*)(void))type metadata accessor for NextHourCondition);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_1A9367534(v22);
  }
}

uint64_t sub_1A9367534(uint64_t a1)
{
  uint64_t HourCondition = type metadata accessor for NextHourCondition();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(HourCondition - 8) + 8))(a1, HourCondition);
  return a1;
}

uint64_t sub_1A9367590@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NextHourCondition.init(from:)(a1, a2);
}

uint64_t sub_1A93675A8(void *a1)
{
  return NextHourCondition.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for NextHourCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A93675D4);
}

uint64_t sub_1A93675D4(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_1_19();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_11:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  OUTLINED_FUNCTION_1_19();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_10:
    uint64_t v9 = a1 + v12;
    goto LABEL_11;
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = type metadata accessor for PrecipitationShift();
    uint64_t v12 = a3[10];
    goto LABEL_10;
  }
  unint64_t v13 = *(void *)(a1 + a3[6] + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for NextHourCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A93676CC);
}

void sub_1A93676CC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_1_19();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    OUTLINED_FUNCTION_1_19();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(a1 + a4[6] + 8) = (a2 - 1);
        return;
      }
      uint64_t v10 = type metadata accessor for PrecipitationShift();
      uint64_t v14 = a4[10];
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_1A93677AC()
{
  sub_1A93ABC08();
  if (v0 <= 0x3F)
  {
    sub_1A91DAFC8();
    if (v1 <= 0x3F)
    {
      type metadata accessor for PrecipitationShift();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

unsigned char *storeEnumTagSinglePayload for NextHourCondition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1A93679A0);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NextHourCondition.CodingKeys()
{
  return &type metadata for NextHourCondition.CodingKeys;
}

unint64_t sub_1A93679DC()
{
  unint64_t result = qword_1E97BC1C0;
  if (!qword_1E97BC1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC1C0);
  }
  return result;
}

unint64_t sub_1A9367A2C()
{
  unint64_t result = qword_1E97BC1C8;
  if (!qword_1E97BC1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC1C8);
  }
  return result;
}

unint64_t sub_1A9367A7C()
{
  unint64_t result = qword_1E97BC1D0;
  if (!qword_1E97BC1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC1D0);
  }
  return result;
}

uint64_t Array<A>.dayWeather(for:timeZone:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DayWeather();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_1A93ABD68();
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_15_11();
  sub_1A93ABCD8();
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v17 = *(void *)(v6 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1A9367FE0(v16, v10, (void (*)(void))type metadata accessor for DayWeather);
      if (sub_1A93ABD18()) {
        break;
      }
      sub_1A9368040(v10, (void (*)(void))type metadata accessor for DayWeather);
      v16 += v17;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v19 = a2;
    sub_1A91A6CD4(v10, a2);
    uint64_t v18 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v18 = 1;
    uint64_t v19 = a2;
  }
  __swift_storeEnumTagSinglePayload(v19, v18, 1, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v2, v11);
}

uint64_t Array<A>.humidity(for:timeZone:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = type metadata accessor for DayPartForecast();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v7 - v6;
  sub_1A93ABD68();
  OUTLINED_FUNCTION_2();
  uint64_t v34 = v9;
  uint64_t v35 = v8;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_15_11();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6552B0);
  MEMORY[0x1F4188790](v10 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for DayWeather();
  OUTLINED_FUNCTION_2();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v32 - v21;
  sub_1A93ABCD8();
  uint64_t v23 = *(void *)(a3 + 16);
  if (v23)
  {
    uint64_t v24 = a3 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v25 = *(void *)(v16 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1A9367FE0(v24, (uint64_t)v19, (void (*)(void))type metadata accessor for DayWeather);
      if (sub_1A93ABD18()) {
        break;
      }
      sub_1A9368040((uint64_t)v19, (void (*)(void))type metadata accessor for DayWeather);
      v24 += v25;
      if (!--v23)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    sub_1A91A6CD4((uint64_t)v19, v13);
    uint64_t v26 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v26 = 1;
  }
  uint64_t v28 = v34;
  uint64_t v27 = v35;
  __swift_storeEnumTagSinglePayload(v13, v26, 1, v14);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v3, v27);
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
  {
    sub_1A9367F80(v13);
    return 0;
  }
  else
  {
    sub_1A91A6CD4(v13, (uint64_t)v22);
    uint64_t v30 = v32;
    sub_1A9367FE0((uint64_t)&v22[*(int *)(v14 + 132)], v32, (void (*)(void))type metadata accessor for DayPartForecast);
    sub_1A9368040((uint64_t)v22, (void (*)(void))type metadata accessor for DayWeather);
    uint64_t v29 = *(void *)(v30 + *(int *)(v33 + 92));
    sub_1A9368040(v30, (void (*)(void))type metadata accessor for DayPartForecast);
  }
  return v29;
}

uint64_t sub_1A9367F80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6552B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A9367FE0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1A9368040(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

double static TideEvents.mock()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A93ABC08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v21 - v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v21 - v10;
  sub_1A93ABBC8();
  if (qword_1E97B7F40 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1E97BC1D8;
  uint64_t v13 = qword_1E97B7F48;
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1E97BC1E0;
  uint64_t v15 = qword_1E97B7EF0;
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_1E97EA4F0);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17(v8, v16, v2);
  if (qword_1E97B7EF8 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_1E97EA508);
  v17(v5, v18, v2);
  uint64_t v19 = (int *)type metadata accessor for TideEvents();
  WeatherMetadata.init(date:expirationDate:latitude:longitude:)((uint64_t)v8, (uint64_t)v5, a1 + v19[8], 37.323, -122.0);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v11, v2);
  *(void *)(a1 + v19[5]) = v12;
  *(void *)(a1 + v19[6]) = v14;
  double result = 36.55;
  *(_OWORD *)(a1 + v19[7]) = xmmword_1A93C6750;
  return result;
}

uint64_t sub_1A9368340()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v40 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = (char *)v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1A93ABC08();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8998);
  uint64_t v6 = (int *)(type metadata accessor for TideEvent() - 8);
  uint64_t v7 = *(void *)v6;
  uint64_t v39 = *(void *)(*(void *)v6 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  uint64_t v34 = v9;
  *(_OWORD *)(v9 + 16) = xmmword_1A93C6760;
  unint64_t v10 = v9 + v8;
  sub_1A93ABA78();
  id v35 = self;
  id v11 = objc_msgSend(v35, sel_feet);
  unint64_t v12 = sub_1A91D76FC();
  sub_1A93AB8B8();
  uint64_t v13 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
  v33[2] = v3 + 32;
  uint64_t v14 = v38;
  v13(v10, v5, v38);
  *(unsigned char *)(v10 + v6[7]) = 0;
  unint64_t v15 = v10 + v6[8];
  uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v40 + 32);
  v40 += 32;
  uint64_t v36 = v16;
  unint64_t v37 = v10;
  v16(v15, v2, v0);
  unint64_t v17 = v10 + v39;
  uint64_t v18 = v5;
  sub_1A93ABA78();
  id v19 = v35;
  id v20 = objc_msgSend(v35, sel_feet);
  v33[1] = v12;
  sub_1A93AB8B8();
  v13(v17, v18, v14);
  *(unsigned char *)(v17 + v6[7]) = 1;
  uint64_t v21 = v0;
  v36(v17 + v6[8], v2, v0);
  uint64_t v22 = v39;
  unint64_t v23 = v37 + 2 * v39;
  sub_1A93ABA78();
  id v24 = objc_msgSend(v19, sel_feet);
  sub_1A93AB8B8();
  uint64_t v25 = v38;
  v13(v23, v18, v38);
  *(unsigned char *)(v23 + v6[7]) = 0;
  unint64_t v26 = v23 + v6[8];
  uint64_t v27 = v21;
  uint64_t v28 = v21;
  uint64_t v29 = (uint64_t (*)(unint64_t, char *, uint64_t))v36;
  v36(v26, v2, v28);
  unint64_t v30 = v37 + 3 * v22;
  sub_1A93ABA78();
  id v31 = objc_msgSend(v35, sel_feet);
  sub_1A93AB8B8();
  v13(v30, v18, v25);
  *(unsigned char *)(v30 + v6[7]) = 1;
  uint64_t result = v29(v30 + v6[8], v2, v27);
  qword_1E97BC1D8 = v34;
  return result;
}

uint64_t sub_1A9368764()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v44 = v0;
  uint64_t v45 = v1;
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1A93ABC08();
  uint64_t v4 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8990);
  uint64_t v7 = type metadata accessor for HourTide();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  uint64_t v10 = v7 - 8;
  uint64_t v37 = v7 - 8;
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v39 = v9;
  uint64_t v12 = swift_allocObject();
  uint64_t v38 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_1A93C6760;
  unint64_t v13 = v12 + v11;
  sub_1A93ABA78();
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_feet);
  unint64_t v16 = sub_1A91D76FC();
  sub_1A93AB8B8();
  unint64_t v17 = *(void (**)(unint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v40 = v4 + 32;
  uint64_t v18 = v43;
  v17(v13, v6, v43);
  unint64_t v19 = v13 + *(int *)(v10 + 28);
  id v20 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
  v45 += 32;
  char v41 = v20;
  unint64_t v42 = v13;
  v20(v19, v3, v44);
  unint64_t v21 = v13 + v9;
  uint64_t v22 = v6;
  sub_1A93ABA78();
  id v23 = objc_msgSend(v14, sel_feet);
  unint64_t v36 = v16;
  sub_1A93AB8B8();
  v17(v21, v6, v18);
  uint64_t v24 = v37;
  uint64_t v25 = v44;
  v41(v21 + *(int *)(v37 + 28), v3, v44);
  unint64_t v26 = v42 + 2 * v39;
  sub_1A93ABA78();
  id v27 = objc_msgSend(v14, sel_feet);
  sub_1A93AB8B8();
  uint64_t v28 = v43;
  v17(v26, v22, v43);
  unint64_t v29 = v26 + *(int *)(v24 + 28);
  uint64_t v30 = v25;
  uint64_t v31 = v25;
  uint64_t v32 = (uint64_t (*)(unint64_t, char *, uint64_t))v41;
  v41(v29, v3, v31);
  unint64_t v33 = v42 + 3 * v39;
  sub_1A93ABA78();
  id v34 = objc_msgSend(v14, sel_feet);
  sub_1A93AB8B8();
  v17(v33, v22, v28);
  uint64_t result = v32(v33 + *(int *)(v24 + 28), v3, v30);
  qword_1E97BC1E0 = v38;
  return result;
}

uint64_t LocationInfo.init(date:expiration:primaryName:secondaryName:preciseName:countryCode:timeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  unint64_t v16 = (int *)type metadata accessor for LocationInfo();
  unint64_t v17 = (void *)(a9 + v16[7]);
  uint64_t v18 = (void *)(a9 + v16[8]);
  unint64_t v19 = (void *)(a9 + v16[9]);
  uint64_t v20 = sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
  v22(a9, a1, v20);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v22)(a9 + v16[5], a2, v20);
  uint64_t v24 = (void *)(a9 + v16[6]);
  *uint64_t v24 = a3;
  v24[1] = a4;
  *unint64_t v17 = a5;
  v17[1] = a6;
  *uint64_t v18 = a7;
  v18[1] = a8;
  *unint64_t v19 = a10;
  v19[1] = a11;
  uint64_t v25 = (void *)(a9 + v16[10]);
  *uint64_t v25 = a12;
  v25[1] = a13;
  return result;
}

uint64_t LocationInfo.date.getter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t LocationInfo.date.setter(uint64_t a1)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*LocationInfo.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.expiration.getter()
{
  type metadata accessor for LocationInfo();
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t LocationInfo.expiration.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_6_28() + 20);
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v2, v0, v3);
}

double (*LocationInfo.expiration.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.primaryName.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t LocationInfo.primaryName.setter()
{
  OUTLINED_FUNCTION_3_35();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*LocationInfo.primaryName.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.secondaryName.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t LocationInfo.secondaryName.setter()
{
  OUTLINED_FUNCTION_3_35();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*LocationInfo.secondaryName.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.preciseName.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t LocationInfo.preciseName.setter()
{
  OUTLINED_FUNCTION_3_35();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*LocationInfo.preciseName.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.countryCode.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t LocationInfo.countryCode.setter()
{
  OUTLINED_FUNCTION_3_35();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*LocationInfo.countryCode.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t LocationInfo.timeZone.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t LocationInfo.timeZone.setter()
{
  OUTLINED_FUNCTION_3_35();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*LocationInfo.timeZone.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A93691B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6974617269707865 && a2 == 0xEA00000000006E6FLL;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x4E7972616D697270 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x7261646E6F636573 && a2 == 0xED0000656D614E79;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x4E65736963657270 && a2 == 0xEB00000000656D61;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x656E6F5A656D6974 && a2 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v12 = sub_1A93AE4B8();
              swift_bridgeObjectRelease();
              if (v12) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A93694C8(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6974617269707865;
      break;
    case 2:
      uint64_t result = 0x4E7972616D697270;
      break;
    case 3:
      uint64_t result = 0x7261646E6F636573;
      break;
    case 4:
      uint64_t result = 0x4E65736963657270;
      break;
    case 5:
      uint64_t result = 0x437972746E756F63;
      break;
    case 6:
      uint64_t result = 0x656E6F5A656D6974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A93695C8()
{
  return sub_1A93694C8(*v0);
}

uint64_t sub_1A93695D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93691B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93695F8(uint64_t a1)
{
  unint64_t v2 = sub_1A93699D0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9369634(uint64_t a1)
{
  unint64_t v2 = sub_1A93699D0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t static LocationInfo.== infix(_:_:)()
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v0 = type metadata accessor for LocationInfo();
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_16_24(*(int *)(v0 + 24));
  BOOL v3 = v3 && v1 == v2;
  if (v3 || (sub_1A93AE4B8(), uint64_t result = OUTLINED_FUNCTION_18_0(), (v5 & 1) != 0))
  {
    OUTLINED_FUNCTION_5_33();
    if (v8)
    {
      if (!v6) {
        return 0;
      }
      OUTLINED_FUNCTION_11_29(v7);
      if (!v3 || v9 != v10)
      {
        sub_1A93AE4B8();
        uint64_t result = OUTLINED_FUNCTION_18_0();
        if ((v12 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v6)
    {
      return 0;
    }
    OUTLINED_FUNCTION_5_33();
    if (v15)
    {
      if (!v13) {
        return 0;
      }
      OUTLINED_FUNCTION_11_29(v14);
      if (!v3 || v16 != v17)
      {
        sub_1A93AE4B8();
        uint64_t result = OUTLINED_FUNCTION_18_0();
        if ((v19 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    OUTLINED_FUNCTION_5_33();
    if (v22)
    {
      if (v20)
      {
        OUTLINED_FUNCTION_11_29(v21);
        if (!v3 || v23 != v24)
        {
          sub_1A93AE4B8();
          uint64_t result = OUTLINED_FUNCTION_18_0();
          if ((v26 & 1) == 0) {
            return result;
          }
        }
LABEL_37:
        OUTLINED_FUNCTION_16_24(*(int *)(v0 + 40));
        if (v3 && v27 == v28) {
          return 1;
        }
        return sub_1A93AE4B8();
      }
    }
    else if (!v20)
    {
      goto LABEL_37;
    }
    return 0;
  }
  return result;
}

uint64_t LocationInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC1E8);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93699D0();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A91EB954(&qword_1EB656220);
  OUTLINED_FUNCTION_10_26();
  if (!v1)
  {
    uint64_t v8 = (int *)type metadata accessor for LocationInfo();
    OUTLINED_FUNCTION_10_26();
    OUTLINED_FUNCTION_12_29(v8[6]);
    sub_1A93AE428();
    OUTLINED_FUNCTION_12_29(v8[7]);
    OUTLINED_FUNCTION_9_29();
    OUTLINED_FUNCTION_12_29(v8[8]);
    OUTLINED_FUNCTION_9_29();
    OUTLINED_FUNCTION_12_29(v8[9]);
    OUTLINED_FUNCTION_9_29();
    OUTLINED_FUNCTION_12_29(v8[10]);
    sub_1A93AE428();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1A93699D0()
{
  unint64_t result = qword_1E97BC1F0;
  if (!qword_1E97BC1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC1F0);
  }
  return result;
}

uint64_t LocationInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v5 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v53 = v6;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  char v12 = (char *)&v42 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC1F8);
  OUTLINED_FUNCTION_2();
  uint64_t v45 = v14;
  uint64_t v46 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LocationInfo();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_6();
  char v19 = (uint64_t *)(v3 + v18[7]);
  *char v19 = 0;
  v19[1] = 0;
  v51 = v19;
  v52 = v18;
  uint64_t v20 = (uint64_t *)(v3 + v18[8]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  v50 = v20;
  uint64_t v21 = (uint64_t *)(v3 + v18[9]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  v48 = a1;
  v49 = v21;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93699D0();
  uint64_t v47 = v16;
  sub_1A93AE5C8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v60 = 0;
    sub_1A91EB954(&qword_1E97B80D0);
    sub_1A93AE3C8();
    uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v53 + 32);
    v43(v3, v12, v5);
    char v59 = 1;
    sub_1A93AE3C8();
    uint64_t v22 = v52;
    v43(v3 + v52[5], v9, v5);
    char v58 = 2;
    uint64_t v23 = sub_1A93AE378();
    uint64_t v24 = (uint64_t *)(v3 + v22[6]);
    *uint64_t v24 = v23;
    v24[1] = v25;
    char v57 = 3;
    uint64_t v26 = OUTLINED_FUNCTION_17_23();
    uint64_t v27 = v51;
    uint64_t *v51 = v26;
    v27[1] = v28;
    char v56 = 4;
    uint64_t v29 = OUTLINED_FUNCTION_17_23();
    uint64_t v30 = v50;
    uint64_t *v50 = v29;
    v30[1] = v31;
    char v55 = 5;
    uint64_t v32 = OUTLINED_FUNCTION_17_23();
    unint64_t v33 = v49;
    uint64_t *v49 = v32;
    v33[1] = v34;
    char v54 = 6;
    uint64_t v35 = sub_1A93AE378();
    uint64_t v37 = v36;
    uint64_t v38 = OUTLINED_FUNCTION_14_25();
    v39(v38);
    uint64_t v40 = (uint64_t *)(v3 + v22[10]);
    *uint64_t v40 = v35;
    v40[1] = v37;
    sub_1A9369EA4(v3, v44);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    return sub_1A9369F08(v3);
  }
}

uint64_t sub_1A9369EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9369F08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocationInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A9369F64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LocationInfo.init(from:)(a1, a2);
}

uint64_t sub_1A9369F7C(void *a1)
{
  return LocationInfo.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for LocationInfo(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = a3[7];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    char v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = a3[9];
    char v19 = (uint64_t *)((char *)a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *char v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = (uint64_t *)((char *)a1 + v18);
    uint64_t v23 = (uint64_t *)((char *)a2 + v18);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[10];
    uint64_t v26 = (uint64_t *)((char *)a1 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for LocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABC08();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LocationInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)(a1 + v9);
  uint64_t v14 = (void *)(a2 + v9);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)(a1 + v16);
  char v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = (void *)(a1 + v17);
  uint64_t v22 = (void *)(a2 + v17);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocationInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)(a1 + v17);
  char v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for LocationInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t assignWithTake for LocationInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  char v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *char v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[10];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A936A65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

void sub_1A936A6EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

unsigned char *storeEnumTagSinglePayload for LocationInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1A936A844);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationInfo.CodingKeys()
{
  return &type metadata for LocationInfo.CodingKeys;
}

unint64_t sub_1A936A880()
{
  unint64_t result = qword_1E97BC200;
  if (!qword_1E97BC200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC200);
  }
  return result;
}

unint64_t sub_1A936A8D0()
{
  unint64_t result = qword_1E97BC208;
  if (!qword_1E97BC208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC208);
  }
  return result;
}

unint64_t sub_1A936A920()
{
  unint64_t result = qword_1E97BC210;
  if (!qword_1E97BC210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC210);
  }
  return result;
}

uint64_t static WeatherAlert.mock(flavor:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 1:
      unsigned int v6 = "Flash Flood Warning";
      goto LABEL_6;
    case 2:
      unsigned int v6 = "River Flood Warning";
LABEL_6:
      unint64_t v5 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      int v2 = 3;
      int v3 = 0;
      uint64_t v4 = 0xD000000000000013;
      break;
    case 3:
      uint64_t v4 = 0xD000000000000010;
      unint64_t v5 = 0x80000001A93DB980;
      int v2 = 0;
      int v3 = 1;
      break;
    default:
      int v2 = OUTLINED_FUNCTION_1_28();
      break;
  }
  return sub_1A936AAB8(v2, v3, v4, v5, a2);
}

BOOL static WeatherAlert.Flavor.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WeatherAlert.Flavor.hash(into:)()
{
  return sub_1A93AE558();
}

uint64_t WeatherAlert.Flavor.hashValue.getter()
{
  return sub_1A93AE578();
}

uint64_t sub_1A936AAA8()
{
  int v0 = OUTLINED_FUNCTION_1_28();
  return sub_1A936AAB8(v0, v1, v2, v3, v4);
}

uint64_t sub_1A936AAB8@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v46 = a2;
  int v44 = a1;
  uint64_t v8 = sub_1A93ABC48();
  uint64_t v9 = OUTLINED_FUNCTION_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v47 = v10;
  uint64_t v11 = type metadata accessor for WeatherMetadata();
  uint64_t v12 = OUTLINED_FUNCTION_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_9();
  uint64_t v45 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  uint64_t v15 = OUTLINED_FUNCTION_1(v14);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v40 - v19;
  uint64_t v21 = sub_1A93ABC08();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v43 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v40 - v25;
  MEMORY[0x1F4188790](v27);
  MEMORY[0x1F4188790](v28);
  v48 = (char *)&v40 - v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
  uint64_t v31 = OUTLINED_FUNCTION_1(v30);
  MEMORY[0x1F4188790](v31);
  unint64_t v33 = (char *)&v40 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93AB9E8();
  uint64_t v34 = sub_1A93ABA18();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v41 = a4;
    uint64_t v42 = a3;
    if (qword_1E97B7EF8 != -1) {
      swift_once();
    }
    uint64_t v40 = a5;
    __swift_project_value_buffer(v21, (uint64_t)qword_1E97EA508);
    uint64_t v36 = *(void (**)(void))(v22 + 16);
    OUTLINED_FUNCTION_0_21();
    v36();
    if (qword_1E97B7EF0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v21, (uint64_t)qword_1E97EA4F0);
    OUTLINED_FUNCTION_0_21();
    v36();
    if (qword_1E97B7F00 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v21, (uint64_t)qword_1E97EA520);
    OUTLINED_FUNCTION_0_21();
    v36();
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v21);
    OUTLINED_FUNCTION_0_21();
    v36();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v21);
    char v50 = v44;
    char v49 = v46;
    OUTLINED_FUNCTION_0_21();
    v36();
    uint64_t v37 = (uint64_t)v43;
    OUTLINED_FUNCTION_0_21();
    v36();
    uint64_t v38 = v45;
    WeatherMetadata.init(date:expirationDate:latitude:longitude:)((uint64_t)v26, v37, v45, 37.323, -122.0);
    uint64_t v39 = v47;
    sub_1A93ABC38();
    return WeatherAlert.init(detailsURL:source:expirationDate:issuedDate:onsetTime:endDate:summary:region:severity:importance:metadata:id:)((uint64_t)v33, 0, 0xE000000000000000, (uint64_t)v20, (uint64_t)v17, v42, v40, v41, 0, 0, &v50, &v49, v38, v39);
  }
  return result;
}

unint64_t sub_1A936AF44()
{
  unint64_t result = qword_1E97BC218;
  if (!qword_1E97BC218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC218);
  }
  return result;
}

unsigned char *_s6FlavorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A936B05CLL);
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

ValueMetadata *type metadata accessor for WeatherAlert.Flavor()
{
  return &type metadata for WeatherAlert.Flavor;
}

uint64_t static Wind.mock()@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_2();
  uint64_t v26 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10 - v9;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16 - v15;
  id v18 = objc_msgSend(self, sel_degrees);
  sub_1A91CF228(0, &qword_1EB658500);
  sub_1A93AB8B8();
  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_kilometersPerHour);
  sub_1A91CF228(0, (unint64_t *)&qword_1EB658508);
  sub_1A93AB8B8();
  id v21 = objc_msgSend(v19, sel_kilometersPerHour);
  sub_1A93AB8B8();
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v6);
  uint64_t v22 = (int *)type metadata accessor for Wind();
  uint64_t v23 = (uint64_t)&a1[v22[7]];
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v6);
  *a1 = 4;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 32))(&a1[v22[5]], v17, v25);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v26 + 32))(&a1[v22[6]], v11, v6);
  return sub_1A920B358(v5, v23);
}

uint64_t sub_1A936B314()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

WeatherKit::WeatherServiceMarineHourlyRelativeRange __swiftcall WeatherServiceMarineHourlyRelativeRange.init(start:end:relativeTo:)(Swift::Int start, Swift::Int end, WeatherKit::WeatherServiceMarineHourlyRelativeRange::RelativeTo relativeTo)
{
  char v4 = *(unsigned char *)relativeTo;
  *(void *)uint64_t v3 = start;
  *(void *)(v3 + 8) = end;
  *(unsigned char *)(v3 + 16) = v4;
  result.end = end;
  result.start = start;
  result.relativeTo = relativeTo;
  return result;
}

WeatherKit::WeatherServiceMarineHourlyRelativeRange::RelativeTo_optional __swiftcall WeatherServiceMarineHourlyRelativeRange.RelativeTo.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A93AE308();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t WeatherServiceMarineHourlyRelativeRange.RelativeTo.rawValue.getter()
{
  if (*v0) {
    return 7827310;
  }
  else {
    return 7954788;
  }
}

unint64_t sub_1A936B3C0()
{
  unint64_t result = qword_1E97BC220;
  if (!qword_1E97BC220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC220);
  }
  return result;
}

uint64_t sub_1A936B40C()
{
  return sub_1A938A33C(*v0);
}

WeatherKit::WeatherServiceMarineHourlyRelativeRange::RelativeTo_optional sub_1A936B414(Swift::String *a1)
{
  return WeatherServiceMarineHourlyRelativeRange.RelativeTo.init(rawValue:)(*a1);
}

uint64_t sub_1A936B420@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherServiceMarineHourlyRelativeRange.RelativeTo.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE300000000000000;
  return result;
}

uint64_t sub_1A936B44C()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A936B4AC()
{
  return sub_1A93ADEE8();
}

ValueMetadata *type metadata accessor for WeatherServiceMarineHourlyRelativeRange()
{
  return &type metadata for WeatherServiceMarineHourlyRelativeRange;
}

unsigned char *storeEnumTagSinglePayload for WeatherServiceMarineHourlyRelativeRange.RelativeTo(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A936B5D8);
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

ValueMetadata *type metadata accessor for WeatherServiceMarineHourlyRelativeRange.RelativeTo()
{
  return &type metadata for WeatherServiceMarineHourlyRelativeRange.RelativeTo;
}

unint64_t sub_1A936B610()
{
  unint64_t result = qword_1E97BC228;
  if (!qword_1E97BC228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC228);
  }
  return result;
}

WeatherKit::AirQualitySource __swiftcall AirQualitySource.init(kind:description:)(WeatherKit::AirQualitySourceKind kind, Swift::String description)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)kind;
  *(Swift::String *)(v2 + 8) = description;
  result.description = description;
  result.kind = kind;
  return result;
}

uint64_t AirQualitySourceKind.rawValue.getter()
{
  return *(void *)&aModeled_4[8 * *v0];
}

uint64_t static AirQualitySource.== infix(_:_:)(char *a1, char *a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  uint64_t v3 = *((void *)a1 + 2);
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v4 = *((void *)a2 + 2);
  if (*(void *)&aModeled_4[8 * *a1] == *(void *)&aModeled_4[8 * *a2])
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v6 = sub_1A93AE4B8();
    swift_bridgeObjectRelease_n();
    uint64_t result = 0;
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  if (v2 == v5 && v3 == v4) {
    return 1;
  }

  return sub_1A93AE4B8();
}

void AirQualitySource.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *AirQualitySource.kind.setter(unsigned char *result)
{
  *int v1 = *result;
  return result;
}

uint64_t (*AirQualitySource.kind.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t AirQualitySource.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AirQualitySource.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AirQualitySource.description.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A936B818(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684957547 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A936B910(char a1)
{
  if (a1) {
    return 0x7470697263736564;
  }
  else {
    return 1684957547;
  }
}

uint64_t sub_1A936B948()
{
  return sub_1A936B910(*v0);
}

uint64_t sub_1A936B950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A936B818(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A936B978(uint64_t a1)
{
  unint64_t v2 = sub_1A936BCC0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936B9B4(uint64_t a1)
{
  unint64_t v2 = sub_1A936BCC0();

  return MEMORY[0x1F41862B0](a1, v2);
}

WeatherKit::AirQualitySourceKind_optional __swiftcall AirQualitySourceKind.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_1A93AE308();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t sub_1A936BA50(char *a1, char *a2)
{
  return sub_1A91E7740(*a1, *a2);
}

uint64_t sub_1A936BA5C()
{
  return sub_1A93859AC();
}

uint64_t sub_1A936BA64()
{
  return sub_1A922AF2C();
}

uint64_t sub_1A936BA6C()
{
  return sub_1A9385F44();
}

WeatherKit::AirQualitySourceKind_optional sub_1A936BA74(Swift::String *a1)
{
  return AirQualitySourceKind.init(rawValue:)(*a1);
}

uint64_t sub_1A936BA80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AirQualitySourceKind.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE700000000000000;
  return result;
}

uint64_t sub_1A936BAAC()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A936BB0C()
{
  return sub_1A93ADEE8();
}

uint64_t AirQualitySource.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656188);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  uint64_t v11 = *((void *)v1 + 1);
  v13[0] = *((void *)v1 + 2);
  v13[1] = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A936BCC0();
  sub_1A93AE5D8();
  char v16 = v10;
  char v15 = 0;
  sub_1A936BD0C();
  sub_1A93AE478();
  if (!v2)
  {
    char v14 = 1;
    sub_1A93AE428();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_1A936BCC0()
{
  unint64_t result = qword_1EB655E48;
  if (!qword_1EB655E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655E48);
  }
  return result;
}

unint64_t sub_1A936BD0C()
{
  unint64_t result = qword_1EB655E68;
  if (!qword_1EB655E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655E68);
  }
  return result;
}

uint64_t AirQualitySource.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC230);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A936BCC0();
  sub_1A93AE5C8();
  if (!v2)
  {
    sub_1A936BED4();
    sub_1A93AE3C8();
    uint64_t v7 = sub_1A93AE378();
    uint64_t v9 = v8;
    uint64_t v10 = OUTLINED_FUNCTION_1_29();
    v11(v10);
    *(unsigned char *)a2 = v12;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1A936BED4()
{
  unint64_t result = qword_1E97BC238;
  if (!qword_1E97BC238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC238);
  }
  return result;
}

unint64_t sub_1A936BF24()
{
  unint64_t result = qword_1E97BC240;
  if (!qword_1E97BC240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC240);
  }
  return result;
}

uint64_t sub_1A936BF70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AirQualitySource.init(from:)(a1, a2);
}

uint64_t sub_1A936BF88(void *a1)
{
  return AirQualitySource.encode(to:)(a1);
}

uint64_t destroy for AirQualityScaleGradientStop()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s10WeatherKit16AirQualitySourceVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AirQualitySource(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AirQualitySource(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AirQualityScaleGradientStop(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for AirQualityScaleGradientStop(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AirQualitySource()
{
  return &type metadata for AirQualitySource;
}

unsigned char *storeEnumTagSinglePayload for AirQualitySourceKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A936C1C8);
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

ValueMetadata *type metadata accessor for AirQualitySourceKind()
{
  return &type metadata for AirQualitySourceKind;
}

unsigned char *storeEnumTagSinglePayload for AirQualitySource.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A936C2CCLL);
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

ValueMetadata *type metadata accessor for AirQualitySource.CodingKeys()
{
  return &type metadata for AirQualitySource.CodingKeys;
}

unint64_t sub_1A936C308()
{
  unint64_t result = qword_1E97BC248;
  if (!qword_1E97BC248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC248);
  }
  return result;
}

unint64_t sub_1A936C358()
{
  unint64_t result = qword_1EB655E58;
  if (!qword_1EB655E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655E58);
  }
  return result;
}

unint64_t sub_1A936C3A8()
{
  unint64_t result = qword_1EB655E50;
  if (!qword_1EB655E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655E50);
  }
  return result;
}

unint64_t sub_1A936C3F4()
{
  unint64_t result = qword_1EB655E70;
  if (!qword_1EB655E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655E70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WeatherServiceLocationOptions(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 10))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 9);
      if (v3 >= 2) {
        int v2 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      }
      else {
        int v2 = -2;
      }
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

uint64_t sub_1A936C498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v129 = a2;
  uint64_t v137 = sub_1A93ACFB8();
  OUTLINED_FUNCTION_2();
  uint64_t v120 = v5;
  MEMORY[0x1F4188790](v6);
  v136 = (char *)&v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OUTLINED_FUNCTION_47();
  uint64_t v9 = type metadata accessor for HistoricalFact.Argument(v8);
  uint64_t v135 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9 - 8);
  OUTLINED_FUNCTION_9();
  os_log_t v142 = v10;
  OUTLINED_FUNCTION_47();
  uint64_t v11 = sub_1A93ABC08();
  MEMORY[0x1F4188790](v11 - 8);
  OUTLINED_FUNCTION_112();
  uint64_t v126 = v12;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_40();
  uint64_t v125 = v14;
  OUTLINED_FUNCTION_47();
  uint64_t v124 = sub_1A93AD958();
  OUTLINED_FUNCTION_2();
  uint64_t v123 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_40();
  uint64_t v121 = v20;
  OUTLINED_FUNCTION_47();
  uint64_t v21 = type metadata accessor for WeatherMetadata();
  MEMORY[0x1F4188790](v21 - 8);
  OUTLINED_FUNCTION_9();
  uint64_t v122 = v22;
  OUTLINED_FUNCTION_47();
  uint64_t v132 = sub_1A93ACF58();
  OUTLINED_FUNCTION_2();
  uint64_t v134 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_9();
  uint64_t v131 = v25;
  OUTLINED_FUNCTION_47();
  uint64_t v26 = sub_1A93AD018();
  OUTLINED_FUNCTION_2();
  uint64_t v130 = v27;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_112();
  uint64_t v127 = v29;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_40();
  uint64_t v32 = v31;
  OUTLINED_FUNCTION_47();
  os_log_t v33 = (os_log_t)sub_1A93ACFE8();
  OUTLINED_FUNCTION_2();
  uint64_t v35 = v34;
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v37);
  sub_1A93AD008();
  sub_1A93ACFD8();
  uint64_t v119 = *(void *)(v35 + 8);
  OUTLINED_FUNCTION_45_2();
  v38();
  uint64_t v39 = sub_1A93AE308();
  swift_bridgeObjectRelease();
  uint64_t v133 = v26;
  if (v39)
  {
    if (v39 != 1)
    {
      if (qword_1EB658498 != -1) {
        swift_once();
      }
      uint64_t v63 = sub_1A93ADAA8();
      __swift_project_value_buffer(v63, (uint64_t)qword_1EB6623C8);
      uint64_t v64 = v130;
      v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 16);
      uint64_t v128 = a1;
      v65(v32, a1, v26);
      uint64_t v66 = v26;
      v67 = sub_1A93ADA88();
      os_log_type_t v68 = sub_1A93AE118();
      if (os_log_type_enabled(v67, v68))
      {
        os_log_t v142 = v67;
        uint64_t v69 = swift_slowAlloc();
        uint64_t v118 = v32;
        v70 = (uint8_t *)v69;
        uint64_t v137 = swift_slowAlloc();
        v141[0] = v137;
        *(_DWORD *)v70 = 136446210;
        v136 = (char *)(v70 + 4);
        sub_1A93AD008();
        uint64_t v71 = sub_1A93ACFD8();
        unint64_t v73 = v72;
        OUTLINED_FUNCTION_36_9();
        OUTLINED_FUNCTION_45_2();
        v74();
        uint64_t v75 = sub_1A91C1C10(v71, v73, v141);
        OUTLINED_FUNCTION_27_15(v75);
        sub_1A93AE178();
        swift_bridgeObjectRelease();
        v76 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
        v76(v118, v133);
        uint64_t v66 = v133;
        os_log_t v33 = v142;
        _os_log_impl(&dword_1A9191000, v142, v68, "Encountered an unknown historical fact condition. condition=%{public}s", v70, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_21();
        OUTLINED_FUNCTION_21();
      }
      else
      {
        v76 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
        v76(v32, v26);
      }
      uint64_t v100 = v131;
      uint64_t v101 = v128;
      sub_1A93ACF68();
      sub_1A93ACF48();
      OUTLINED_FUNCTION_35_9();
      OUTLINED_FUNCTION_27();
      v102();
      sub_1A9372CBC();
      swift_allocError();
      *(void *)uint64_t v103 = v33;
      *(void *)(v103 + 8) = v100;
      *(unsigned char *)(v103 + 16) = 0;
      swift_willThrow();
      return ((uint64_t (*)(uint64_t, uint64_t))v76)(v101, v66);
    }
    char v40 = 1;
  }
  else
  {
    char v40 = 0;
  }
  sub_1A93ACF68();
  sub_1A93ACF48();
  OUTLINED_FUNCTION_35_9();
  uint64_t v42 = v134 + 8;
  uint64_t v41 = *(void (**)(void))(v134 + 8);
  OUTLINED_FUNCTION_45_2();
  v41();
  v43._countAndFlagsBits = OUTLINED_FUNCTION_42();
  HistoricalFact.Period.init(rawValue:)(v43);
  char v44 = v141[0];
  if (LOBYTE(v141[0]) == 3)
  {
    uint64_t v45 = v130;
    if (qword_1EB658498 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_1A93ADAA8();
    __swift_project_value_buffer(v46, (uint64_t)qword_1EB6623C8);
    uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    uint64_t v48 = v127;
    uint64_t v128 = a1;
    uint64_t v49 = v133;
    v47(v127, a1, v133);
    char v50 = sub_1A93ADA88();
    os_log_type_t v51 = sub_1A93AE118();
    uint64_t v52 = v51;
    if (os_log_type_enabled(v50, v51))
    {
      os_log_t v142 = v50;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v134 = v42;
      uint64_t v55 = v45;
      uint64_t v137 = v54;
      v141[0] = v54;
      *(_DWORD *)uint64_t v53 = 136446210;
      v136 = (char *)(v53 + 4);
      uint64_t v56 = v131;
      sub_1A93ACF68();
      uint64_t v57 = sub_1A93ACF48();
      unint64_t v59 = v58;
      ((void (*)(uint64_t, uint64_t))v41)(v56, v132);
      uint64_t v60 = sub_1A91C1C10(v57, v59, v141);
      OUTLINED_FUNCTION_27_15(v60);
      sub_1A93AE178();
      swift_bridgeObjectRelease();
      v61 = *(void (**)(void))(v55 + 8);
      OUTLINED_FUNCTION_45_2();
      v61();
      os_log_t v62 = v142;
      _os_log_impl(&dword_1A9191000, v142, (os_log_type_t)v52, "Encountered an unknown historical fact period. period=%{public}s", v53, 0xCu);
      uint64_t v52 = v137;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_21();
    }
    else
    {
      v61 = *(void (**)(void))(v45 + 8);
      ((void (*)(uint64_t, uint64_t))v61)(v48, v49);

      uint64_t v56 = v131;
    }
    uint64_t v97 = v128;
    sub_1A93ACF68();
    sub_1A93ACF48();
    OUTLINED_FUNCTION_35_9();
    OUTLINED_FUNCTION_45_2();
    v41();
    sub_1A9372CBC();
    swift_allocError();
    *(void *)uint64_t v98 = v52;
    *(void *)(v98 + 8) = v56;
    *(unsigned char *)(v98 + 16) = 1;
    swift_willThrow();
    return ((uint64_t (*)(uint64_t, uint64_t))v61)(v97, v133);
  }
  else
  {
    uint64_t v77 = v129;
    *(unsigned char *)uint64_t v129 = v40;
    *(unsigned char *)(v77 + 1) = v44;
    *(void *)(v77 + 8) = sub_1A93ACF38();
    *(void *)(v77 + 16) = v78;
    *(void *)(v77 + 24) = sub_1A93ACF28();
    *(void *)(v77 + 32) = v79;
    v141[0] = sub_1A93ACF78();
    v141[1] = v80;
    v140[0] = 29477;
    v140[1] = 0xE200000000000000;
    uint64_t v138 = 16421;
    unint64_t v139 = 0xE200000000000000;
    sub_1A9209D84();
    uint64_t v81 = sub_1A93AE1A8();
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
    *(void *)(v77 + 40) = v81;
    *(void *)(v77 + 48) = v83;
    uint64_t v84 = sub_1A93ACFF8();
    uint64_t v85 = *(void *)(v84 + 16);
    if (v85)
    {
      uint64_t v128 = a1;
      v141[0] = MEMORY[0x1E4FBC860];
      sub_1A9229D74(0, v85, 0);
      uint64_t v134 = *(void *)(v120 + 16);
      uint64_t v86 = *(unsigned __int8 *)(v120 + 80);
      uint64_t v132 = v84;
      uint64_t v87 = v84 + ((v86 + 32) & ~v86);
      uint64_t v88 = *(void *)(v120 + 72);
      os_log_t v89 = v142;
      while (1)
      {
        uint64_t v90 = (uint64_t)v136;
        ((void (*)(char *, uint64_t, uint64_t))v134)(v136, v87, v137);
        sub_1A9370300(v90, v140, v89);
        if (v3) {
          break;
        }
        uint64_t v3 = 0;
        uint64_t v91 = OUTLINED_FUNCTION_26_14();
        v92(v91);
        uint64_t v93 = v141[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A9229D74(0, *(void *)(v93 + 16) + 1, 1);
          uint64_t v93 = v141[0];
        }
        unint64_t v95 = *(void *)(v93 + 16);
        unint64_t v94 = *(void *)(v93 + 24);
        if (v95 >= v94 >> 1)
        {
          sub_1A9229D74(v94 > 1, v95 + 1, 1);
          uint64_t v93 = v141[0];
        }
        *(void *)(v93 + 16) = v95 + 1;
        uint64_t v96 = v93
            + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80))
            + *(void *)(v135 + 72) * v95;
        os_log_t v89 = v142;
        sub_1A93708D4((uint64_t)v142, v96, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
        v87 += v88;
        if (!--v85)
        {
          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
      }
      uint64_t v104 = OUTLINED_FUNCTION_26_14();
      v105(v104);
      swift_release();
      OUTLINED_FUNCTION_27();
      v106();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v93 = MEMORY[0x1E4FBC860];
LABEL_29:
      *(void *)(v129 + 56) = v93;
      OUTLINED_FUNCTION_14_26();
      uint64_t v107 = v125;
      sub_1A93AD938();
      v108 = *(void (**)(void))(v123 + 8);
      OUTLINED_FUNCTION_11_30();
      v108();
      OUTLINED_FUNCTION_14_26();
      uint64_t v109 = v126;
      sub_1A93AD8D8();
      OUTLINED_FUNCTION_11_30();
      v108();
      OUTLINED_FUNCTION_14_26();
      sub_1A93AD928();
      double v111 = v110;
      OUTLINED_FUNCTION_11_30();
      v108();
      OUTLINED_FUNCTION_14_26();
      sub_1A93AD948();
      double v113 = v112;
      OUTLINED_FUNCTION_11_30();
      v108();
      uint64_t v114 = v122;
      WeatherMetadata.init(date:expirationDate:latitude:longitude:)(v107, v109, v122, v111, v113);
      OUTLINED_FUNCTION_27();
      v115();
      uint64_t v116 = type metadata accessor for HistoricalFact(0);
      return sub_1A93708D4(v114, v129 + *(int *)(v116 + 40), (void (*)(void))type metadata accessor for WeatherMetadata);
    }
  }
}

WeatherKit::HistoricalFact::Condition_optional __swiftcall HistoricalFact.Condition.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A93AE308();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t HistoricalFact.Condition.rawValue.getter()
{
  if (*v0) {
    return 0x7469706963657270;
  }
  else {
    return 0x74617265706D6574;
  }
}

uint64_t sub_1A936D198()
{
  return sub_1A93859B8();
}

uint64_t sub_1A936D1A0()
{
  return sub_1A922AF6C();
}

uint64_t sub_1A936D1A8()
{
  return sub_1A9385EC0();
}

WeatherKit::HistoricalFact::Condition_optional sub_1A936D1B0(Swift::String *a1)
{
  return HistoricalFact.Condition.init(rawValue:)(*a1);
}

uint64_t sub_1A936D1BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HistoricalFact.Condition.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A936D1E4()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A936D244()
{
  return sub_1A93ADEE8();
}

uint64_t sub_1A936D294(char *a1, char *a2)
{
  return sub_1A91E77E4(*a1, *a2);
}

WeatherKit::HistoricalFact::Period_optional __swiftcall HistoricalFact.Period.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1A93AE308();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t HistoricalFact.Period.rawValue.getter()
{
  uint64_t v1 = 0x68746E6F6DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6B6165727473;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7961646F74;
  }
}

uint64_t sub_1A936D34C()
{
  return sub_1A93859C4();
}

uint64_t sub_1A936D354()
{
  return sub_1A922AFEC();
}

uint64_t sub_1A936D35C()
{
  return sub_1A9385E3C();
}

WeatherKit::HistoricalFact::Period_optional sub_1A936D364(Swift::String *a1)
{
  return HistoricalFact.Period.init(rawValue:)(*a1);
}

uint64_t sub_1A936D370@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HistoricalFact.Period.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A936D398()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A936D3F8()
{
  return sub_1A93ADEE8();
}

uint64_t sub_1A936D448(unsigned __int8 *a1, char *a2)
{
  return sub_1A91E788C(*a1, *a2);
}

uint64_t static HistoricalFact.Argument.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = a1;
  uint64_t v67 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v64 = v6;
  uint64_t v65 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_112();
  v61[1] = v7;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_40();
  v61[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v62 = v11;
  uint64_t v63 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = OUTLINED_FUNCTION_123();
  type metadata accessor for HistoricalFact.Argument(v12);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)v61 - v17;
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)v61 - v20;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_39_8();
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (void *)((char *)v61 - v24);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC250);
  MEMORY[0x1F4188790](v26 - 8);
  OUTLINED_FUNCTION_16();
  uint64_t v28 = v2 + *(int *)(v27 + 56);
  sub_1A9370934(v66, v2, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
  sub_1A9370934(v67, v28, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1A9370934(v2, v3, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      if (OUTLINED_FUNCTION_22_17() != 1) {
        goto LABEL_19;
      }
      uint64_t v31 = v62;
      uint64_t v30 = v63;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32))(v4, v28, v63);
      sub_1A91CF228(0, qword_1EB657120);
      char v29 = sub_1A93AB8A8();
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v32(v4, v30);
      v32(v3, v30);
      goto LABEL_10;
    case 2u:
      sub_1A9370934(v2, (uint64_t)v21, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      if (OUTLINED_FUNCTION_22_17() != 2) {
        goto LABEL_19;
      }
      uint64_t v33 = v64;
      OUTLINED_FUNCTION_34_7();
      OUTLINED_FUNCTION_17_24();
      v36(v34, v35);
      sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
      char v29 = sub_1A93AB8A8();
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      OUTLINED_FUNCTION_28_11();
      v37(v38, v39);
      OUTLINED_FUNCTION_28_11();
      v37(v40, v41);
      goto LABEL_10;
    case 3u:
      uint64_t v42 = OUTLINED_FUNCTION_42();
      sub_1A9370934(v42, v43, v44);
      if (OUTLINED_FUNCTION_22_17() != 3)
      {
LABEL_19:
        OUTLINED_FUNCTION_27();
        v59(v57, v58);
        goto LABEL_21;
      }
      uint64_t v46 = v64;
      uint64_t v45 = v65;
      OUTLINED_FUNCTION_34_7();
      OUTLINED_FUNCTION_17_24();
      v49(v47, v48);
      sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
      char v29 = sub_1A93AB8A8();
      char v50 = *(void (**)(char *, uint64_t))(v46 + 8);
      OUTLINED_FUNCTION_28_11();
      v50(v51, v52);
      v50(v18, v45);
LABEL_10:
      sub_1A9370BEC(v2, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      return v29 & 1;
    case 4u:
      sub_1A9370934(v2, (uint64_t)v15, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      uint64_t v54 = *((void *)v15 + 1);
      uint64_t v53 = *((void *)v15 + 2);
      if (OUTLINED_FUNCTION_22_17() != 4)
      {
        swift_bridgeObjectRelease();
LABEL_21:
        sub_1A936DA4C(v2);
        goto LABEL_22;
      }
      if (*(double *)v15 != *(double *)v28)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_25:
        sub_1A9370BEC(v2, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
LABEL_22:
        char v29 = 0;
        return v29 & 1;
      }
      if (v54 != *(void *)(v28 + 8) || v53 != *(void *)(v28 + 16))
      {
        char v56 = sub_1A93AE4B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v56) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      swift_bridgeObjectRelease_n();
LABEL_27:
      sub_1A9370BEC(v2, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      char v29 = 1;
      return v29 & 1;
    default:
      sub_1A9370934(v2, (uint64_t)v25, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      if (OUTLINED_FUNCTION_22_17()) {
        goto LABEL_21;
      }
      char v29 = *v25 == *(void *)v28;
      goto LABEL_10;
  }
}

uint64_t type metadata accessor for HistoricalFact.Argument(uint64_t a1)
{
  return sub_1A91D45B0(a1, (uint64_t *)&unk_1E97BC368);
}

uint64_t sub_1A936DA4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC250);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A936DAAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72656765746E69 && a2 == 0xE700000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CB180 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6C6C6166776F6E73 && a2 == 0xEE00746E756F6D41;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 1702125924 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_1A93AE4B8();
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

unint64_t sub_1A936DCE4(char a1)
{
  unint64_t result = 0x72656765746E69;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74617265706D6574;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x6C6C6166776F6E73;
      break;
    case 4:
      unint64_t result = 1702125924;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A936DDA4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A936DE6C(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

unint64_t sub_1A936DE84()
{
  return sub_1A936DCE4(*v0);
}

uint64_t sub_1A936DE8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A936DAAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A936DEB4(uint64_t a1)
{
  unint64_t v2 = sub_1A936E87C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936DEF0(uint64_t a1)
{
  unint64_t v2 = sub_1A936E87C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A936DF2C()
{
  return sub_1A936DE6C(*v0);
}

uint64_t sub_1A936DF34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A936DDA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A936DF5C(uint64_t a1)
{
  unint64_t v2 = sub_1A936E8C8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936DF98(uint64_t a1)
{
  unint64_t v2 = sub_1A936E8C8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A936DFD4(uint64_t a1)
{
  unint64_t v2 = sub_1A936E9F8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936E010(uint64_t a1)
{
  unint64_t v2 = sub_1A936E9F8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A936E04C(uint64_t a1)
{
  unint64_t v2 = sub_1A936E960();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936E088(uint64_t a1)
{
  unint64_t v2 = sub_1A936E960();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A936E0C4(uint64_t a1)
{
  unint64_t v2 = sub_1A936E914();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936E100(uint64_t a1)
{
  unint64_t v2 = sub_1A936E914();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A936E13C(uint64_t a1)
{
  unint64_t v2 = sub_1A936E9AC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936E178(uint64_t a1)
{
  unint64_t v2 = sub_1A936E9AC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t HistoricalFact.Argument.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC258);
  OUTLINED_FUNCTION_2();
  uint64_t v69 = v3;
  uint64_t v70 = v2;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_11_7(v4, v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC260);
  OUTLINED_FUNCTION_2();
  uint64_t v67 = v6;
  uint64_t v68 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  uint64_t v66 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC268);
  OUTLINED_FUNCTION_2();
  uint64_t v64 = v9;
  uint64_t v65 = v8;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_9();
  uint64_t v63 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v71 = v12;
  uint64_t v72 = v11;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_112();
  uint64_t v62 = v13;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_40();
  uint64_t v61 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC270);
  OUTLINED_FUNCTION_2();
  uint64_t v59 = v17;
  uint64_t v60 = v16;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_9();
  uint64_t v58 = v18;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v56 = v19;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC278);
  OUTLINED_FUNCTION_2();
  uint64_t v55 = v24;
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_16();
  type metadata accessor for HistoricalFact.Argument(0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28 - v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC280);
  OUTLINED_FUNCTION_2();
  uint64_t v74 = v30;
  uint64_t v75 = v31;
  MEMORY[0x1F4188790](v30);
  uint64_t v33 = (char *)&v55 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A936E87C();
  unint64_t v73 = v33;
  sub_1A93AE5D8();
  sub_1A9370934(v77, v29, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v23, v29, v57);
      char v79 = 1;
      sub_1A936E9AC();
      OUTLINED_FUNCTION_12_30();
      sub_1A91F1C70(&qword_1EB656210, &qword_1EB6571E0);
      sub_1A93AE478();
      OUTLINED_FUNCTION_27();
      v36(v35);
      OUTLINED_FUNCTION_45_2();
      v38(v37);
      goto LABEL_7;
    case 2u:
      uint64_t v40 = v71;
      uint64_t v39 = v72;
      OUTLINED_FUNCTION_34_7();
      uint64_t v41 = v61;
      OUTLINED_FUNCTION_17_24();
      v43(v42);
      char v80 = 2;
      sub_1A936E960();
      OUTLINED_FUNCTION_12_30();
      sub_1A91F1C70(&qword_1EB656200, &qword_1EB6572E0);
      OUTLINED_FUNCTION_31_7();
      goto LABEL_6;
    case 3u:
      uint64_t v40 = v71;
      uint64_t v39 = v72;
      OUTLINED_FUNCTION_34_7();
      uint64_t v41 = v62;
      OUTLINED_FUNCTION_17_24();
      v45(v44);
      char v81 = 3;
      sub_1A936E914();
      OUTLINED_FUNCTION_12_30();
      sub_1A91F1C70(&qword_1EB656200, &qword_1EB6572E0);
      OUTLINED_FUNCTION_31_7();
LABEL_6:
      OUTLINED_FUNCTION_27();
      v47(v46);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v39);
LABEL_7:
      uint64_t v48 = OUTLINED_FUNCTION_36_9();
      return v50(v48, v49);
    case 4u:
      char v84 = 4;
      sub_1A936E8C8();
      OUTLINED_FUNCTION_32_10();
      char v83 = 0;
      uint64_t v51 = v76;
      sub_1A93AE448();
      if (!v51)
      {
        char v82 = 1;
        OUTLINED_FUNCTION_36_9();
        sub_1A93AE428();
      }
      swift_bridgeObjectRelease();
      goto LABEL_11;
    default:
      char v78 = 0;
      sub_1A936E9F8();
      OUTLINED_FUNCTION_32_10();
      sub_1A93AE468();
LABEL_11:
      OUTLINED_FUNCTION_27();
      v53(v52);
      char v50 = *(uint64_t (**)(uint64_t, uint64_t))(v75 + 8);
      uint64_t v48 = (uint64_t)v33;
      uint64_t v49 = v34;
      return v50(v48, v49);
  }
}

unint64_t sub_1A936E87C()
{
  unint64_t result = qword_1E97BC288;
  if (!qword_1E97BC288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC288);
  }
  return result;
}

unint64_t sub_1A936E8C8()
{
  unint64_t result = qword_1E97BC290;
  if (!qword_1E97BC290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC290);
  }
  return result;
}

unint64_t sub_1A936E914()
{
  unint64_t result = qword_1E97BC298;
  if (!qword_1E97BC298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC298);
  }
  return result;
}

unint64_t sub_1A936E960()
{
  unint64_t result = qword_1E97BC2A0;
  if (!qword_1E97BC2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC2A0);
  }
  return result;
}

unint64_t sub_1A936E9AC()
{
  unint64_t result = qword_1E97BC2A8;
  if (!qword_1E97BC2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC2A8);
  }
  return result;
}

unint64_t sub_1A936E9F8()
{
  unint64_t result = qword_1E97BC2B0;
  if (!qword_1E97BC2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC2B0);
  }
  return result;
}

uint64_t HistoricalFact.Argument.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2B8);
  OUTLINED_FUNCTION_2();
  uint64_t v90 = v4;
  uint64_t v91 = v5;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_9();
  uint64_t v99 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2C0);
  OUTLINED_FUNCTION_2();
  uint64_t v88 = v8;
  uint64_t v89 = v7;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_9();
  uint64_t v95 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2C8);
  OUTLINED_FUNCTION_2();
  uint64_t v86 = v11;
  uint64_t v87 = v10;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_9();
  uint64_t v94 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2D0);
  OUTLINED_FUNCTION_2();
  uint64_t v84 = v14;
  uint64_t v85 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v93 = (char *)v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2D8);
  OUTLINED_FUNCTION_2();
  uint64_t v82 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_11_7(v18, v76[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2E0);
  OUTLINED_FUNCTION_2();
  uint64_t v97 = v20;
  uint64_t v98 = v19;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22 - v21;
  uint64_t v96 = type metadata accessor for HistoricalFact.Argument(0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)v76 - v26;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_39_8();
  MEMORY[0x1F4188790](v29);
  uint64_t v31 = (char *)v76 - v30;
  MEMORY[0x1F4188790](v32);
  uint64_t v34 = (uint64_t *)((char *)v76 - v33);
  MEMORY[0x1F4188790](v35);
  uint64_t v37 = (char *)v76 - v36;
  uint64_t v38 = a1[3];
  uint64_t v100 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v38);
  sub_1A936E87C();
  uint64_t v39 = (uint64_t)v101;
  sub_1A93AE5C8();
  if (v39) {
    goto LABEL_9;
  }
  uint64_t v77 = v34;
  char v78 = v31;
  uint64_t v79 = v2;
  char v80 = v27;
  uint64_t v41 = v98;
  uint64_t v40 = v99;
  uint64_t v101 = v37;
  uint64_t v42 = sub_1A93AE3D8();
  uint64_t v43 = *(void *)(v42 + 16);
  if (!v43)
  {
LABEL_8:
    uint64_t v51 = sub_1A93AE278();
    swift_allocError();
    uint64_t v53 = v52;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B86C0);
    *uint64_t v53 = v96;
    sub_1A93AE328();
    sub_1A93AE268();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v51 - 8) + 104))(v53, *MEMORY[0x1E4FBBA70], v51);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v23, v41);
LABEL_9:
    uint64_t v54 = (uint64_t)v100;
    return __swift_destroy_boxed_opaque_existential_1(v54);
  }
  uint64_t v44 = v41;
  v76[1] = 0;
  uint64_t v45 = *(unsigned __int8 *)(v42 + 32);
  uint64_t v46 = sub_1A921AB10(1, v43, v42, v42 + 32, 0, (2 * v43) | 1);
  uint64_t v48 = v47;
  unint64_t v50 = v49;
  swift_bridgeObjectRelease();
  if (v48 != v50 >> 1)
  {
    uint64_t v41 = v44;
    goto LABEL_8;
  }
  switch(v45)
  {
    case 1:
      char v103 = 1;
      sub_1A936E9AC();
      OUTLINED_FUNCTION_6_29();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
      sub_1A91F1C70(&qword_1E97B8230, &qword_1EB6571E0);
      uint64_t v56 = (uint64_t)v78;
      OUTLINED_FUNCTION_38_9();
      OUTLINED_FUNCTION_27();
      v62();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_27();
      v63();
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = v56;
      goto LABEL_16;
    case 2:
      char v104 = 2;
      sub_1A936E960();
      OUTLINED_FUNCTION_6_29();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
      sub_1A91F1C70(&qword_1E97B8138, &qword_1EB6572E0);
      uint64_t v57 = v79;
      sub_1A93AE3C8();
      OUTLINED_FUNCTION_42_6();
      OUTLINED_FUNCTION_27();
      v64();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_27();
      v65();
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = v57;
      goto LABEL_16;
    case 3:
      char v105 = 3;
      sub_1A936E914();
      OUTLINED_FUNCTION_18_27();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
      sub_1A91F1C70(&qword_1E97B8138, &qword_1EB6572E0);
      uint64_t v61 = (uint64_t)v80;
      OUTLINED_FUNCTION_38_9();
      OUTLINED_FUNCTION_33_11();
      OUTLINED_FUNCTION_27();
      v68();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_27();
      v69();
      goto LABEL_15;
    case 4:
      char v108 = 4;
      sub_1A936E8C8();
      OUTLINED_FUNCTION_6_29();
      char v107 = 0;
      sub_1A93AE398();
      uint64_t v67 = v66;
      char v106 = 1;
      sub_1A93AE378();
      OUTLINED_FUNCTION_35_9();
      OUTLINED_FUNCTION_27();
      v70();
      swift_unknownObjectRelease();
      uint64_t v71 = OUTLINED_FUNCTION_30_12();
      v72(v71);
      uint64_t v61 = (uint64_t)v81;
      *char v81 = v67;
      *(void *)(v61 + 8) = v46;
      *(void *)(v61 + 16) = v40;
      goto LABEL_15;
    default:
      char v102 = 0;
      sub_1A936E9F8();
      OUTLINED_FUNCTION_18_27();
      uint64_t v58 = sub_1A93AE3B8();
      OUTLINED_FUNCTION_24_11();
      OUTLINED_FUNCTION_27();
      v59();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_27();
      v60();
      uint64_t v61 = (uint64_t)v77;
      *uint64_t v77 = v58;
LABEL_15:
      swift_storeEnumTagMultiPayload();
LABEL_16:
      uint64_t v73 = (uint64_t)v100;
      uint64_t v74 = (uint64_t)v101;
      uint64_t v75 = v92;
      sub_1A93708D4(v61, (uint64_t)v101, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      sub_1A93708D4(v74, v75, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
      uint64_t v54 = v73;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v54);
}

uint64_t sub_1A936F400@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HistoricalFact.Argument.init(from:)(a1, a2);
}

uint64_t sub_1A936F418(void *a1)
{
  return HistoricalFact.Argument.encode(to:)(a1);
}

uint64_t HistoricalFact.init(condition:period:token:heading:message:arguments:metadata:)@<X0>(unsigned char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  char v12 = *a2;
  *(unsigned char *)a9 = *a1;
  *(unsigned char *)(a9 + 1) = v12;
  *(void *)(a9 + 8) = a3;
  *(void *)(a9 + 16) = a4;
  *(void *)(a9 + 24) = a5;
  *(void *)(a9 + 32) = a6;
  *(void *)(a9 + 40) = a7;
  *(void *)(a9 + 48) = a8;
  *(void *)(a9 + 56) = a10;
  uint64_t v13 = type metadata accessor for HistoricalFact(0);
  return sub_1A93708D4(a11, a9 + *(int *)(v13 + 40), (void (*)(void))type metadata accessor for WeatherMetadata);
}

void HistoricalFact.condition.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void HistoricalFact.period.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

uint64_t HistoricalFact.token.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t HistoricalFact.heading.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t HistoricalFact.message.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t HistoricalFact.arguments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HistoricalFact.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HistoricalFact(0);
  return sub_1A9370934(v1 + *(int *)(v3 + 40), a1, (void (*)(void))type metadata accessor for WeatherMetadata);
}

#error "1A936F6CC: call analysis failed (funcsize=89)"

uint64_t sub_1A936F724(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646F69726570 && a2 == 0xE600000000000000;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E656B6F74 && a2 == 0xE500000000000000;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x676E6964616568 && a2 == 0xE700000000000000;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6567617373656DLL && a2 == 0xE700000000000000;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x746E656D75677261 && a2 == 0xE900000000000073;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v12 = sub_1A93AE4B8();
              swift_bridgeObjectRelease();
              if (v12) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A936F9F4(char a1)
{
  uint64_t result = 0x6F697469646E6F63;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x646F69726570;
      break;
    case 2:
      uint64_t result = 0x6E656B6F74;
      break;
    case 3:
      uint64_t result = 0x676E6964616568;
      break;
    case 4:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 5:
      uint64_t result = 0x746E656D75677261;
      break;
    case 6:
      uint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A936FAD8()
{
  return sub_1A936F9F4(*v0);
}

uint64_t sub_1A936FAE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A936F724(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A936FB08(uint64_t a1)
{
  unint64_t v2 = sub_1A9370994();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A936FB44(uint64_t a1)
{
  unint64_t v2 = sub_1A9370994();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t HistoricalFact.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC2E8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9370994();
  sub_1A93AE5D8();
  sub_1A93709E0();
  OUTLINED_FUNCTION_23_14();
  if (!v1)
  {
    sub_1A9370A2C();
    OUTLINED_FUNCTION_23_14();
    OUTLINED_FUNCTION_7_30(2);
    OUTLINED_FUNCTION_7_30(3);
    OUTLINED_FUNCTION_7_30(4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC308);
    sub_1A9370B58(&qword_1E97BC310, &qword_1E97BC318);
    sub_1A93AE478();
    type metadata accessor for HistoricalFact(0);
    type metadata accessor for WeatherMetadata();
    sub_1A9370A78(&qword_1EB6562A0, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
    sub_1A93AE478();
  }
  OUTLINED_FUNCTION_36_9();
  OUTLINED_FUNCTION_45_2();
  return v5(v4);
}

uint64_t HistoricalFact.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for WeatherMetadata();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC320);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v9);
  uint64_t v10 = OUTLINED_FUNCTION_123();
  uint64_t v11 = type metadata accessor for HistoricalFact(v10);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_9();
  uint64_t v21 = v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9370994();
  sub_1A93AE5C8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v3;
  }
  else
  {
    sub_1A9370AC0();
    sub_1A93AE3C8();
    *(unsigned char *)uint64_t v21 = v22;
    sub_1A9370B0C();
    sub_1A93AE3C8();
    *(unsigned char *)(v21 + 1) = v22;
    *(void *)(v21 + 8) = OUTLINED_FUNCTION_16_25(2);
    *(void *)(v21 + 16) = v14;
    *(void *)(v21 + 24) = OUTLINED_FUNCTION_16_25(3);
    *(void *)(v21 + 32) = v15;
    *(void *)(v21 + 40) = OUTLINED_FUNCTION_16_25(4);
    *(void *)(v21 + 48) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC308);
    sub_1A9370B58(&qword_1E97BC338, &qword_1E97BC340);
    sub_1A93AE3C8();
    *(void *)(v21 + 56) = v22;
    sub_1A9370A78(&qword_1E97B8580, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
    sub_1A93AE3C8();
    uint64_t v17 = OUTLINED_FUNCTION_4_40();
    v18(v17);
    sub_1A93708D4(v8, v21 + *(int *)(v11 + 40), (void (*)(void))type metadata accessor for WeatherMetadata);
    sub_1A9370934(v21, a2, (void (*)(void))type metadata accessor for HistoricalFact);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_1A9370BEC(v21, (void (*)(void))type metadata accessor for HistoricalFact);
  }
}

uint64_t sub_1A9370280()
{
  unint64_t v0 = sub_1A93AE308();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A93702CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HistoricalFact.init(from:)(a1, a2);
}

uint64_t sub_1A93702E4(void *a1)
{
  return HistoricalFact.encode(to:)(a1);
}

uint64_t sub_1A9370300@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_1A93ACFB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93ACF88();
  switch(sub_1A9370280())
  {
    case 1u:
      sub_1A93ACF98();
      id v11 = objc_msgSend(self, sel_celsius);
      sub_1A91CF228(0, qword_1EB657120);
      sub_1A93AB8B8();
      type metadata accessor for HistoricalFact.Argument(0);
      return swift_storeEnumTagMultiPayload();
    case 2u:
    case 3u:
      sub_1A93ACF98();
      id v12 = objc_msgSend(self, sel_millimeters);
      sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
      sub_1A93AB8B8();
      type metadata accessor for HistoricalFact.Argument(0);
      return swift_storeEnumTagMultiPayload();
    case 4u:
      uint64_t v13 = sub_1A93ACFA8();
      if (v14)
      {
        uint64_t v15 = v13;
        uint64_t v16 = v14;
        sub_1A93ACF98();
        *a3 = v17;
        a3[1] = v15;
        a3[2] = v16;
        type metadata accessor for HistoricalFact.Argument(0);
        return swift_storeEnumTagMultiPayload();
      }
      if (qword_1EB658498 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_1A93ADAA8();
      __swift_project_value_buffer(v31, (uint64_t)qword_1EB6623C8);
      uint64_t v32 = sub_1A93ADA88();
      os_log_type_t v33 = sub_1A93AE118();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_1A9191000, v32, v33, "Missing format for a historical fact date argument. Discarding fact.", v34, 2u);
        MEMORY[0x1AD0F2200](v34, -1, -1);
      }

      sub_1A9372CBC();
      uint64_t v29 = swift_allocError();
      *(void *)uint64_t v35 = 0;
      *(void *)(v35 + 8) = 0;
      *(unsigned char *)(v35 + 16) = 3;
      uint64_t result = swift_willThrow();
      goto LABEL_21;
    case 5u:
      if (qword_1EB658498 == -1) {
        goto LABEL_12;
      }
      goto LABEL_25;
    default:
      sub_1A93ACF98();
      if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v10 <= -9.22337204e18)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v10 < 9.22337204e18)
      {
        *a3 = (uint64_t)v10;
        type metadata accessor for HistoricalFact.Argument(0);
        return swift_storeEnumTagMultiPayload();
      }
LABEL_24:
      __break(1u);
LABEL_25:
      swift_once();
LABEL_12:
      uint64_t v38 = a2;
      uint64_t v19 = sub_1A93ADAA8();
      __swift_project_value_buffer(v19, (uint64_t)qword_1EB6623C8);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
      uint64_t v20 = sub_1A93ADA88();
      os_log_type_t v21 = sub_1A93AE118();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        uint64_t v40 = v37;
        *(_DWORD *)uint64_t v22 = 136446210;
        v36[1] = v22 + 4;
        uint64_t v23 = sub_1A93ACF88();
        uint64_t v39 = sub_1A91C1C10(v23, v24, &v40);
        sub_1A93AE178();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        _os_log_impl(&dword_1A9191000, v20, v21, "Encountered an unknown historical fact argument type. Discarding fact. type=%{public}s", v22, 0xCu);
        uint64_t v25 = v37;
        swift_arrayDestroy();
        MEMORY[0x1AD0F2200](v25, -1, -1);
        MEMORY[0x1AD0F2200](v22, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      }

      uint64_t v26 = sub_1A93ACF88();
      uint64_t v28 = v27;
      sub_1A9372CBC();
      uint64_t v29 = swift_allocError();
      *(void *)uint64_t v30 = v26;
      *(void *)(v30 + 8) = v28;
      *(unsigned char *)(v30 + 16) = 2;
      uint64_t result = swift_willThrow();
      a2 = v38;
LABEL_21:
      *a2 = v29;
      return result;
  }
}

uint64_t type metadata accessor for HistoricalFact(uint64_t a1)
{
  return sub_1A91D45B0(a1, (uint64_t *)&unk_1E97BC358);
}

uint64_t sub_1A93708D4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1A9370934(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_1A9370994()
{
  unint64_t result = qword_1E97BC2F0;
  if (!qword_1E97BC2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC2F0);
  }
  return result;
}

unint64_t sub_1A93709E0()
{
  unint64_t result = qword_1E97BC2F8;
  if (!qword_1E97BC2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC2F8);
  }
  return result;
}

unint64_t sub_1A9370A2C()
{
  unint64_t result = qword_1E97BC300;
  if (!qword_1E97BC300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC300);
  }
  return result;
}

uint64_t sub_1A9370A78(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A9370AC0()
{
  unint64_t result = qword_1E97BC328;
  if (!qword_1E97BC328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC328);
  }
  return result;
}

unint64_t sub_1A9370B0C()
{
  unint64_t result = qword_1E97BC330;
  if (!qword_1E97BC330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC330);
  }
  return result;
}

uint64_t sub_1A9370B58(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E97BC308);
    sub_1A9370A78(a2, (void (*)(uint64_t))type metadata accessor for HistoricalFact.Argument);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A9370BEC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_27();
  v3();
  return a1;
}

unint64_t sub_1A9370C44()
{
  unint64_t result = qword_1E97BC348;
  if (!qword_1E97BC348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC348);
  }
  return result;
}

unint64_t sub_1A9370C94()
{
  unint64_t result = qword_1E97BC350;
  if (!qword_1E97BC350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC350);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for HistoricalFact(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(unsigned char *)(a1 + 1) = *((unsigned char *)a2 + 1);
    uint64_t v5 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v5;
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 56) = a2[7];
    uint64_t v11 = sub_1A93ABC08();
    id v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = (int *)type metadata accessor for WeatherMetadata();
    v12(v9 + v13[5], v10 + v13[5], v11);
    *(void *)(v9 + v13[6]) = *(void *)(v10 + v13[6]);
    *(void *)(v9 + v13[7]) = *(void *)(v10 + v13[7]);
    *(void *)(v9 + v13[8]) = *(void *)(v10 + v13[8]);
  }
  swift_retain();
  return v3;
}

uint64_t destroy for HistoricalFact(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_1A93ABC08();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = type metadata accessor for WeatherMetadata();
  v6(v4 + *(int *)(v7 + 20), v5);

  return swift_release();
}

uint64_t initializeWithCopy for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v10 = sub_1A93ABC08();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  id v12 = (int *)type metadata accessor for WeatherMetadata();
  v11(v8 + v12[5], v9 + v12[5], v10);
  *(void *)(v8 + v12[6]) = *(void *)(v9 + v12[6]);
  *(void *)(v8 + v12[7]) = *(void *)(v9 + v12[7]);
  *(void *)(v8 + v12[8]) = *(void *)(v9 + v12[8]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1A93ABC08();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for WeatherMetadata();
  v10(v7 + v11[5], v8 + v11[5], v9);
  *(void *)(v7 + v11[6]) = *(void *)(v8 + v11[6]);
  *(void *)(v7 + v11[7]) = *(void *)(v8 + v11[7]);
  *(void *)(v7 + v11[8]) = *(void *)(v8 + v11[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 40);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = sub_1A93ABC08();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(v6, v5, v7);
  uint64_t v9 = (int *)type metadata accessor for WeatherMetadata();
  v8(v6 + v9[5], v5 + v9[5], v7);
  *(void *)(v6 + v9[6]) = *(void *)(v5 + v9[6]);
  *(void *)(v6 + v9[7]) = *(void *)(v5 + v9[7]);
  *(void *)(v6 + v9[8]) = *(void *)(v5 + v9[8]);
  return a1;
}

uint64_t assignWithTake for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_1A93ABC08();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  uint64_t v14 = (int *)type metadata accessor for WeatherMetadata();
  v13(v10 + v14[5], v11 + v14[5], v12);
  *(void *)(v10 + v14[6]) = *(void *)(v11 + v14[6]);
  *(void *)(v10 + v14[7]) = *(void *)(v11 + v14[7]);
  *(void *)(v10 + v14[8]) = *(void *)(v11 + v14[8]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9371420);
}

uint64_t sub_1A9371420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for WeatherMetadata();
    uint64_t v9 = a1 + *(int *)(a3 + 40);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for HistoricalFact(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A93714BC);
}

uint64_t sub_1A93714BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for WeatherMetadata();
    uint64_t v8 = v5 + *(int *)(a4 + 40);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1A937153C()
{
  uint64_t result = type metadata accessor for WeatherMetadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for HistoricalFact.Condition()
{
}

unsigned char *storeEnumTagSinglePayload for HistoricalFact.Period(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A93716D4);
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

void type metadata accessor for HistoricalFact.Period()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for HistoricalFact.Argument(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_8;
      case 2u:
      case 3u:
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        goto LABEL_8;
      case 4u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for HistoricalFact.Argument(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      int v3 = &qword_1EB6571E0;
      goto LABEL_4;
    case 2:
    case 3:
      int v3 = &qword_1EB6572E0;
LABEL_4:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
      uint64_t result = v5(a1, v4);
      break;
    case 4:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for HistoricalFact.Argument(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_6;
    case 2u:
    case 3u:
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_6;
    case 4u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for HistoricalFact.Argument(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A9370BEC((uint64_t)a1, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_7;
      case 2u:
      case 3u:
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_7;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for HistoricalFact.Argument(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
  }
  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithTake for HistoricalFact.Argument(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1A9370BEC((uint64_t)a1, (void (*)(void))type metadata accessor for HistoricalFact.Argument);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1A9372070()
{
  sub_1A91A8B48(319, qword_1EB6571E8, qword_1EB657120);
  if (v0 <= 0x3F)
  {
    sub_1A91A8B48(319, (unint64_t *)&qword_1EB6572E8, (unint64_t *)&qword_1EB658510);
    if (v1 <= 0x3F) {
      swift_initEnumMetadataMultiPayload();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for HistoricalFact.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1A937224CLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HistoricalFact.CodingKeys()
{
  return &type metadata for HistoricalFact.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for HistoricalFact.Argument.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9372350);
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

ValueMetadata *type metadata accessor for HistoricalFact.Argument.CodingKeys()
{
  return &type metadata for HistoricalFact.Argument.CodingKeys;
}

ValueMetadata *type metadata accessor for HistoricalFact.Argument.IntegerCodingKeys()
{
  return &type metadata for HistoricalFact.Argument.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for HistoricalFact.Argument.TemperatureCodingKeys()
{
  return &type metadata for HistoricalFact.Argument.TemperatureCodingKeys;
}

ValueMetadata *type metadata accessor for HistoricalFact.Argument.PrecipitationAmountCodingKeys()
{
  return &type metadata for HistoricalFact.Argument.PrecipitationAmountCodingKeys;
}

unsigned char *_s10WeatherKit14HistoricalFactV8ArgumentO17IntegerCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1A9372458);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HistoricalFact.Argument.SnowfallAmountCodingKeys()
{
  return &type metadata for HistoricalFact.Argument.SnowfallAmountCodingKeys;
}

unsigned char *_s10WeatherKit14HistoricalFactV9ConditionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A937255CLL);
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

ValueMetadata *type metadata accessor for HistoricalFact.Argument.DateCodingKeys()
{
  return &type metadata for HistoricalFact.Argument.DateCodingKeys;
}

unint64_t sub_1A9372598()
{
  unint64_t result = qword_1E97BC378;
  if (!qword_1E97BC378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC378);
  }
  return result;
}

unint64_t sub_1A93725E8()
{
  unint64_t result = qword_1E97BC380;
  if (!qword_1E97BC380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC380);
  }
  return result;
}

unint64_t sub_1A9372638()
{
  unint64_t result = qword_1E97BC388;
  if (!qword_1E97BC388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC388);
  }
  return result;
}

unint64_t sub_1A9372688()
{
  unint64_t result = qword_1E97BC390;
  if (!qword_1E97BC390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC390);
  }
  return result;
}

unint64_t sub_1A93726D8()
{
  unint64_t result = qword_1E97BC398;
  if (!qword_1E97BC398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC398);
  }
  return result;
}

unint64_t sub_1A9372728()
{
  unint64_t result = qword_1E97BC3A0;
  if (!qword_1E97BC3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3A0);
  }
  return result;
}

unint64_t sub_1A9372778()
{
  unint64_t result = qword_1E97BC3A8;
  if (!qword_1E97BC3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3A8);
  }
  return result;
}

unint64_t sub_1A93727C8()
{
  unint64_t result = qword_1E97BC3B0;
  if (!qword_1E97BC3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3B0);
  }
  return result;
}

unint64_t sub_1A9372818()
{
  unint64_t result = qword_1E97BC3B8;
  if (!qword_1E97BC3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3B8);
  }
  return result;
}

unint64_t sub_1A9372868()
{
  unint64_t result = qword_1E97BC3C0;
  if (!qword_1E97BC3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3C0);
  }
  return result;
}

unint64_t sub_1A93728B8()
{
  unint64_t result = qword_1E97BC3C8;
  if (!qword_1E97BC3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3C8);
  }
  return result;
}

unint64_t sub_1A9372908()
{
  unint64_t result = qword_1E97BC3D0;
  if (!qword_1E97BC3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3D0);
  }
  return result;
}

unint64_t sub_1A9372958()
{
  unint64_t result = qword_1E97BC3D8;
  if (!qword_1E97BC3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3D8);
  }
  return result;
}

unint64_t sub_1A93729A8()
{
  unint64_t result = qword_1E97BC3E0;
  if (!qword_1E97BC3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3E0);
  }
  return result;
}

unint64_t sub_1A93729F8()
{
  unint64_t result = qword_1E97BC3E8;
  if (!qword_1E97BC3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3E8);
  }
  return result;
}

unint64_t sub_1A9372A48()
{
  unint64_t result = qword_1E97BC3F0;
  if (!qword_1E97BC3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3F0);
  }
  return result;
}

unint64_t sub_1A9372A98()
{
  unint64_t result = qword_1E97BC3F8;
  if (!qword_1E97BC3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC3F8);
  }
  return result;
}

unint64_t sub_1A9372AE8()
{
  unint64_t result = qword_1E97BC400;
  if (!qword_1E97BC400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC400);
  }
  return result;
}

unint64_t sub_1A9372B38()
{
  unint64_t result = qword_1E97BC408;
  if (!qword_1E97BC408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC408);
  }
  return result;
}

unint64_t sub_1A9372B88()
{
  unint64_t result = qword_1E97BC410;
  if (!qword_1E97BC410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC410);
  }
  return result;
}

unint64_t sub_1A9372BD8()
{
  unint64_t result = qword_1E97BC418;
  if (!qword_1E97BC418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC418);
  }
  return result;
}

unint64_t sub_1A9372C24()
{
  unint64_t result = qword_1E97BC420;
  if (!qword_1E97BC420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC420);
  }
  return result;
}

unint64_t sub_1A9372C70()
{
  unint64_t result = qword_1E97BC428;
  if (!qword_1E97BC428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC428);
  }
  return result;
}

unint64_t sub_1A9372CBC()
{
  unint64_t result = qword_1E97BC430;
  if (!qword_1E97BC430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC430);
  }
  return result;
}

uint64_t sub_1A9372D0C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A9372D24(uint64_t a1)
{
  return sub_1A9372D34(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1A9372D34(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A9372D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A9372D0C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1A9372D98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A9372D0C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A9372D34(v6, v7, v8);
  return a1;
}

uint64_t sub_1A9372DF0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A9372D34(v4, v5, v6);
  return a1;
}

uint64_t sub_1A9372E38(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1A9372E78(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
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
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A9372EBC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1A9372ED4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for HistoricalFact.Errors()
{
}

void NextHourSummary.init(startDate:endDate:precipitation:precipitationChance:perceivedIntensity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10)
{
  OUTLINED_FUNCTION_10_27();
  OUTLINED_FUNCTION_3_36();
  uint64_t v15 = OUTLINED_FUNCTION_9_21();
  OUTLINED_FUNCTION_2_31(v15);
  uint64_t v16 = OUTLINED_FUNCTION_3_0();
  v17(v16);
  sub_1A91CD150(v10, v11);
  OUTLINED_FUNCTION_18_28();
  *(void *)uint64_t v13 = v18;
  *(unsigned char *)(v13 + 8) = a10;
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = v12;
  OUTLINED_FUNCTION_7_31();
}

uint64_t type metadata accessor for NextHourSummary()
{
  uint64_t result = qword_1EB659590;
  if (!qword_1EB659590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NextHourSummary.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t NextHourSummary.startDate.setter(uint64_t a1)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*NextHourSummary.startDate.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourSummary.endDate.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_22_18() + 20);

  return sub_1A9193C78(v2, v0);
}

uint64_t NextHourSummary.endDate.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_11_31() + 20);

  return sub_1A91CD150(v0, v2);
}

double (*NextHourSummary.endDate.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t NextHourSummary.precipitation.getter()
{
  uint64_t result = OUTLINED_FUNCTION_22_18();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t NextHourSummary.precipitation.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for NextHourSummary();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = v2;
  return result;
}

double (*NextHourSummary.precipitation.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double NextHourSummary.precipitationChance.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for NextHourSummary() + 28));
}

uint64_t NextHourSummary.precipitationChance.setter(double a1)
{
  uint64_t result = type metadata accessor for NextHourSummary();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

double (*NextHourSummary.precipitationChance.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

void NextHourSummary.apparentPrecipitationIntensity.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_22_18();
  OUTLINED_FUNCTION_13_28(*(int *)(v0 + 32));
}

uint64_t NextHourSummary.apparentPrecipitationIntensity.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for NextHourSummary();
  uint64_t v5 = v1 + *(int *)(result + 32);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*NextHourSummary.apparentPrecipitationIntensity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

void NextHourSummary.perceivedIntensity.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_22_18();
  OUTLINED_FUNCTION_13_28(*(int *)(v0 + 36));
}

uint64_t NextHourSummary.perceivedIntensity.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for NextHourSummary();
  uint64_t v5 = v1 + *(int *)(result + 36);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*NextHourSummary.perceivedIntensity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

void NextHourSummary.init(startDate:endDate:precipitation:precipitationChance:apparentPrecipitationIntensity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10)
{
  OUTLINED_FUNCTION_10_27();
  OUTLINED_FUNCTION_3_36();
  uint64_t v15 = OUTLINED_FUNCTION_9_21();
  OUTLINED_FUNCTION_2_31(v15);
  uint64_t v16 = OUTLINED_FUNCTION_3_0();
  v17(v16);
  sub_1A91CD150(v10, v11);
  OUTLINED_FUNCTION_18_28();
  *(void *)uint64_t v14 = v18;
  *(unsigned char *)(v14 + 8) = a10;
  *(void *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 8) = v12;
  OUTLINED_FUNCTION_7_31();
}

void NextHourSummary.init(startDate:endDate:precipitation:precipitationChance:apparentPrecipitationIntensity:perceivedIntensity:)()
{
  OUTLINED_FUNCTION_10_27();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v20 = *v8;
  char v18 = *v9;
  char v19 = *((unsigned char *)v8 + 8);
  uint64_t v11 = *v10;
  char v12 = *((unsigned char *)v10 + 8);
  type metadata accessor for NextHourSummary();
  uint64_t v13 = OUTLINED_FUNCTION_9_21();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v13);
  uint64_t v14 = v7 + v0[8];
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = 3;
  uint64_t v15 = v7 + v0[9];
  *(void *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 8) = 3;
  uint64_t v16 = OUTLINED_FUNCTION_3_0();
  v17(v16);
  sub_1A91CD150(v5, v1);
  *(unsigned char *)(v7 + v0[6]) = v18;
  *(void *)(v7 + v0[7]) = v3;
  *(void *)uint64_t v15 = v11;
  *(unsigned char *)(v15 + 8) = v12;
  *(void *)uint64_t v14 = v20;
  *(unsigned char *)(v14 + 8) = v19;
  OUTLINED_FUNCTION_7_31();
}

uint64_t sub_1A9373544(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65746144646E65 && a2 == 0xE700000000000000;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7469706963657270 && a2 == 0xED00006E6F697461;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CBAD0 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001A93CBB10 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000012 && a2 == 0x80000001A93CCBC0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        char v8 = sub_1A93AE4B8();
        swift_bridgeObjectRelease();
        if (v8) {
          return 5;
        }
        else {
          return 6;
        }
      }
    }
  }
}

unint64_t sub_1A93737D8(char a1)
{
  unint64_t result = 0x7461447472617473;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65746144646E65;
      break;
    case 2:
      unint64_t result = 0x7469706963657270;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1A93738C0()
{
  return sub_1A93737D8(*v0);
}

uint64_t sub_1A93738C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9373544(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93738F0(uint64_t a1)
{
  unint64_t v2 = sub_1A9373F58();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A937392C(uint64_t a1)
{
  unint64_t v2 = sub_1A9373F58();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t static NextHourSummary.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6563B0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_6();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = &v43[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v17);
  char v19 = &v43[-v18];
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = &v43[-v21];
  if ((sub_1A93ABBB8() & 1) == 0) {
    goto LABEL_31;
  }
  uint64_t v46 = v7;
  uint64_t HourSummary = type metadata accessor for NextHourSummary();
  sub_1A9193C78(a1 + *(int *)(HourSummary + 20), (uint64_t)v22);
  uint64_t v45 = HourSummary;
  sub_1A9193C78(a2 + *(int *)(HourSummary + 20), (uint64_t)v19);
  uint64_t v24 = v2 + *(int *)(v12 + 48);
  sub_1A9193C78((uint64_t)v22, v2);
  sub_1A9193C78((uint64_t)v19, v24);
  OUTLINED_FUNCTION_1_9(v2);
  if (v25)
  {
    sub_1A91A6D88((uint64_t)v19, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
    OUTLINED_FUNCTION_1_9(v24);
    if (v25)
    {
      sub_1A91A6D88(v2, &qword_1EB657328);
      goto LABEL_12;
    }
LABEL_10:
    sub_1A91A6D88(v2, &qword_1EB6563B0);
    goto LABEL_31;
  }
  sub_1A9193C78(v2, (uint64_t)v16);
  OUTLINED_FUNCTION_1_9(v24);
  if (v25)
  {
    sub_1A91A6D88((uint64_t)v19, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
    (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v16, v5);
    goto LABEL_10;
  }
  uint64_t v26 = v46;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v11, v24, v5);
  sub_1A91EB954(&qword_1EB6563C0);
  int v44 = sub_1A93ADDB8();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v27(v11, v5);
  sub_1A91A6D88((uint64_t)v19, &qword_1EB657328);
  sub_1A91A6D88((uint64_t)v22, &qword_1EB657328);
  v27((uint64_t)v16, v5);
  sub_1A91A6D88(v2, &qword_1EB657328);
  if ((v44 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_12:
  uint64_t v28 = v45;
  if ((sub_1A91D50E0(*(unsigned char *)(a1 + *(int *)(v45 + 24)), *(unsigned char *)(a2 + *(int *)(v45 + 24))) & 1) == 0
    || *(double *)(a1 + *(int *)(v28 + 28)) != *(double *)(a2 + *(int *)(v28 + 28)))
  {
    goto LABEL_31;
  }
  uint64_t v29 = OUTLINED_FUNCTION_12_31();
  if (v25)
  {
    if (v30 == 3) {
      goto LABEL_24;
    }
LABEL_31:
    char v39 = 0;
    return v39 & 1;
  }
  double v33 = *v32;
  BOOL v34 = v30 != 3 && *v31 == v33;
  if (!v34 || (sub_1A91E75A8(v29, v30, v33) & 1) == 0) {
    goto LABEL_31;
  }
LABEL_24:
  uint64_t v35 = OUTLINED_FUNCTION_12_31();
  if (!v25)
  {
    double v40 = *v38;
    if (v36 != 3 && *v37 == v40)
    {
      char v39 = sub_1A91E75A8(v35, v36, v40);
      return v39 & 1;
    }
    goto LABEL_31;
  }
  char v39 = v36 == 3;
  return v39 & 1;
}

uint64_t NextHourSummary.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC438);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9373F58();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A91EB954(&qword_1EB656220);
  OUTLINED_FUNCTION_15_14();
  sub_1A93AE478();
  if (!v1)
  {
    uint64_t HourSummary = type metadata accessor for NextHourSummary();
    OUTLINED_FUNCTION_15_14();
    sub_1A93AE418();
    sub_1A91EB4AC();
    sub_1A93AE478();
    sub_1A93AE448();
    OUTLINED_FUNCTION_17_25(*(int *)(HourSummary + 32));
    sub_1A91EB4F8();
    OUTLINED_FUNCTION_19_21();
    OUTLINED_FUNCTION_17_25(*(int *)(HourSummary + 36));
    sub_1A920FCA0();
    OUTLINED_FUNCTION_19_21();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1A9373F58()
{
  unint64_t result = qword_1E97BC440;
  if (!qword_1E97BC440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC440);
  }
  return result;
}

uint64_t NextHourSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  MEMORY[0x1F4188790](v3 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v27 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC448);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_0();
  uint64_t HourSummary = (int *)type metadata accessor for NextHourSummary();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16 - v15;
  uint64_t v28 = v16 - v15 + *(int *)(v18 + 20);
  __swift_storeEnumTagSinglePayload(v28, 1, 1, v7);
  uint64_t v19 = v17 + HourSummary[8];
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 3;
  uint64_t v20 = v17 + HourSummary[9];
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9373F58();
  sub_1A93AE5C8();
  if (v29)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_1A91A6D88(v28, &qword_1EB657328);
  }
  else
  {
    sub_1A91EB954(&qword_1E97B80D0);
    OUTLINED_FUNCTION_20_18();
    sub_1A93AE3C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v17, v26, v7);
    OUTLINED_FUNCTION_20_18();
    sub_1A93AE368();
    sub_1A91CD150(v6, v28);
    sub_1A91EB998();
    sub_1A93AE3C8();
    *(unsigned char *)(v17 + HourSummary[6]) = 1;
    LOBYTE(v30) = 3;
    sub_1A93AE398();
    *(void *)(v17 + HourSummary[7]) = v21;
    sub_1A91EBA2C();
    OUTLINED_FUNCTION_14_27();
    *(void *)uint64_t v19 = v30;
    *(unsigned char *)(v19 + 8) = v31;
    sub_1A92100F0();
    OUTLINED_FUNCTION_14_27();
    uint64_t v22 = OUTLINED_FUNCTION_9_30();
    v23(v22);
    *(void *)uint64_t v20 = v30;
    *(unsigned char *)(v20 + 8) = v31;
    sub_1A93743B4(v17, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_1A9374418(v17);
  }
}

uint64_t sub_1A93743B4(uint64_t a1, uint64_t a2)
{
  uint64_t HourSummary = type metadata accessor for NextHourSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(HourSummary - 8) + 16))(a2, a1, HourSummary);
  return a2;
}

uint64_t sub_1A9374418(uint64_t a1)
{
  uint64_t HourSummary = type metadata accessor for NextHourSummary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(HourSummary - 8) + 8))(a1, HourSummary);
  return a1;
}

uint64_t sub_1A9374474@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NextHourSummary.init(from:)(a1, a2);
}

uint64_t sub_1A937448C(void *a1)
{
  return NextHourSummary.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for NextHourSummary(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v9], 1, v7))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v7);
    }
    uint64_t v14 = a3[7];
    a1[a3[6]] = a2[a3[6]];
    *(void *)&a1[v14] = *(void *)&a2[v14];
    uint64_t v15 = a3[8];
    uint64_t v16 = a3[9];
    uint64_t v17 = &a1[v15];
    uint64_t v18 = &a2[v15];
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = &a1[v16];
    uint64_t v20 = &a2[v16];
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = v20[8];
  }
  return a1;
}

char *initializeWithCopy for NextHourSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  return a1;
}

char *assignWithCopy for NextHourSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v9], 1, v6);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
LABEL_7:
  a1[a3[6]] = a2[a3[6]];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = *(void *)v17;
  v16[8] = v17[8];
  *(void *)uint64_t v16 = v18;
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = *(void *)v21;
  v20[8] = v21[8];
  *(void *)uint64_t v20 = v22;
  return a1;
}

char *initializeWithTake for NextHourSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  return a1;
}

char *assignWithTake for NextHourSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v9], 1, v6);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
LABEL_7:
  uint64_t v15 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(void *)&a1[v15] = *(void *)&a2[v15];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = &a1[v17];
  uint64_t v21 = &a2[v17];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for NextHourSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9374C88);
}

uint64_t sub_1A9374C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32) + 8) <= 3u) {
    int v13 = 3;
  }
  else {
    int v13 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32) + 8);
  }
  unsigned int v14 = v13 - 3;
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32) + 8) >= 3u) {
    return v14;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NextHourSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9374D60);
}

void sub_1A9374D60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 32) + 8) = a2 + 3;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_1A9374E18()
{
  sub_1A93ABC08();
  if (v0 <= 0x3F)
  {
    sub_1A91DAFC8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for NextHourSummary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9374FD0);
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

ValueMetadata *type metadata accessor for NextHourSummary.CodingKeys()
{
  return &type metadata for NextHourSummary.CodingKeys;
}

unint64_t sub_1A937500C()
{
  unint64_t result = qword_1E97BC450;
  if (!qword_1E97BC450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC450);
  }
  return result;
}

unint64_t sub_1A937505C()
{
  unint64_t result = qword_1E97BC458;
  if (!qword_1E97BC458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC458);
  }
  return result;
}

unint64_t sub_1A93750AC()
{
  unint64_t result = qword_1E97BC460[0];
  if (!qword_1E97BC460[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E97BC460);
  }
  return result;
}

uint64_t DailyWeatherSummary.init(days:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  uint64_t v5 = type metadata accessor for DailyWeatherSummary();
  return sub_1A91A5324(a2, (uint64_t)a3 + *(int *)(v5 + 52));
}

uint64_t static DailyWeatherSummary.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (sub_1A93ADF88())
  {
    uint64_t v4 = type metadata accessor for DailyWeatherSummary();
    char v5 = static WeatherMetadata.== infix(_:_:)(a1 + *(int *)(v4 + 52), a2 + *(int *)(v4 + 52));
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t DailyWeatherSummary.days.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DailyWeatherSummary.days.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*DailyWeatherSummary.days.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DailyWeatherSummary.metadata.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A91C7F78(v2 + *(int *)(a1 + 52), a2);
}

uint64_t DailyWeatherSummary.metadata.setter(uint64_t a1, uint64_t a2)
{
  return sub_1A92153F0(a1, v2 + *(int *)(a2 + 52));
}

uint64_t (*DailyWeatherSummary.metadata.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DailyWeatherSummary.startIndex.getter(uint64_t a1)
{
  return MEMORY[0x1F4183E88](*v1, *(void *)(a1 + 16));
}

void DailyWeatherSummary.endIndex.getter()
{
}

uint64_t DailyWeatherSummary.subscript.getter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4183FF0](a1, *v2, *(void *)(a2 + 16));
}

uint64_t sub_1A93752A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1937334628 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A9375380(char a1)
{
  if (a1) {
    return 0x617461646174656DLL;
  }
  else {
    return 1937334628;
  }
}

BOOL sub_1A93753B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A920D0F4(*a1, *a2);
}

uint64_t sub_1A93753C8()
{
  return sub_1A920D22C();
}

uint64_t sub_1A93753DC()
{
  return sub_1A920D104();
}

uint64_t sub_1A93753F0()
{
  return sub_1A93AE578();
}

uint64_t sub_1A937543C()
{
  return sub_1A9375380(*v0);
}

uint64_t sub_1A9375450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93752A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9375484()
{
  return sub_1A91DBD94();
}

uint64_t sub_1A93754B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A91FACB8();
  *a1 = result;
  return result;
}

uint64_t sub_1A93754E4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A9375538(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t DailyWeatherSummary.encode(to:)(void *a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v15 = v3;
  long long v18 = v14;
  long long v19 = v3;
  type metadata accessor for DailyWeatherSummary.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_1A93AE488();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = (void *)v13[1];
  sub_1A93AE5D8();
  *(void *)&long long v18 = *v10;
  char v20 = 0;
  sub_1A93ADF78();
  uint64_t v17 = v15;
  swift_getWitnessTable();
  uint64_t v11 = v16;
  sub_1A93AE478();
  if (!v11)
  {
    LOBYTE(v18) = 1;
    type metadata accessor for WeatherMetadata();
    sub_1A9375AE4(&qword_1EB6562A0);
    sub_1A93AE478();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t type metadata accessor for DailyWeatherSummary.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t DailyWeatherSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v32 = type metadata accessor for WeatherMetadata();
  MEMORY[0x1F4188790](v32);
  char v31 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  type metadata accessor for DailyWeatherSummary.CodingKeys();
  swift_getWitnessTable();
  uint64_t v35 = sub_1A93AE3E8();
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v12;
  MEMORY[0x1F4188790](v13);
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v14 = type metadata accessor for DailyWeatherSummary();
  OUTLINED_FUNCTION_2();
  uint64_t v28 = v15;
  MEMORY[0x1F4188790](v16);
  long long v18 = (uint64_t *)((char *)&v26 - v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v19 = (uint64_t)v36;
  sub_1A93AE5C8();
  if (v19) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v27 = v14;
  uint64_t v36 = a1;
  uint64_t v20 = (uint64_t)v31;
  sub_1A93ADF78();
  char v42 = 0;
  uint64_t v37 = v34;
  swift_getWitnessTable();
  sub_1A93AE3C8();
  *long long v18 = v38;
  LOBYTE(v38) = 1;
  sub_1A9375AE4(&qword_1E97B8580);
  sub_1A93AE3C8();
  uint64_t v21 = OUTLINED_FUNCTION_1_30();
  v22(v21);
  uint64_t v23 = v27;
  sub_1A91A5324(v20, (uint64_t)v18 + *(int *)(v27 + 52));
  uint64_t v24 = v28;
  (*(void (**)(uint64_t, void *, uint64_t))(v28 + 16))(v29, v18, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return (*(uint64_t (**)(void *, uint64_t))(v24 + 8))(v18, v23);
}

uint64_t sub_1A9375AE4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for WeatherMetadata();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A9375B28@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return DailyWeatherSummary.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_1A9375B4C(void *a1, uint64_t a2)
{
  return DailyWeatherSummary.encode(to:)(a1, a2);
}

uint64_t sub_1A9375B64(uint64_t a1, uint64_t a2)
{
  return static DailyWeatherSummary.== infix(_:_:)(a1, a2);
}

uint64_t sub_1A9375B74()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9375B90()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9375BF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9375C10()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9375C74(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB590];

  return MEMORY[0x1F41842B0](a1, a2, WitnessTable, v5);
}

void *sub_1A9375CE4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A9376100(a1, a2, a3, MEMORY[0x1E4FBB618]);
}

uint64_t sub_1A9375CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB590];

  return MEMORY[0x1F41842B8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1A9375D80()
{
  swift_getWitnessTable();

  return sub_1A93ADFD8();
}

uint64_t sub_1A9375E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB590];

  return MEMORY[0x1F41842C8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1A9375E78()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9375E94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DailyWeatherSummary.startIndex.getter(a1);
  *a2 = result;
  return result;
}

void sub_1A9375EBC()
{
}

uint64_t sub_1A9375ED4(uint64_t result)
{
  *unint64_t v1 = result;
  return result;
}

void (*sub_1A9375EE4(void *a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1A9375F54(v6, *a2, a3);
  return sub_1A9194E80;
}

void (*sub_1A9375F54(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v5 = *(void *)(a3 + 16);
  *a1 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  a1[1] = v6;
  a1[2] = malloc(*(void *)(v6 + 64));
  DailyWeatherSummary.subscript.getter(a2, a3);
  return sub_1A9194EC8;
}

uint64_t sub_1A937600C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x1E4FBB590];

  return MEMORY[0x1F41842C0](a1, WitnessTable, v3);
}

uint64_t sub_1A9376078(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB590];

  return MEMORY[0x1F41842A8](a1, a2, WitnessTable, v5);
}

void *sub_1A93760E8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A9376100(a1, a2, a3, MEMORY[0x1E4FBB610]);
}

void *sub_1A9376100(void *a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, void))
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = a4(&v9, a1, a2, WitnessTable, MEMORY[0x1E4FBB590]);
  *a1 = v9;
  return result;
}

uint64_t sub_1A9376178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, v2, a1);
  uint64_t v6 = DailyWeatherSummary.startIndex.getter(a1);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, a1);
  swift_getWitnessTable();
  uint64_t result = sub_1A93AE298();
  *(void *)(a2 + *(int *)(result + 36)) = v6;
  return result;
}

uint64_t sub_1A9376264(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F4184360](a1, WitnessTable);
}

uint64_t sub_1A93762B8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F4184380](a1, WitnessTable);
}

uint64_t *sub_1A937630C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 52);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1A93ABC08();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
    uint64_t v11 = (int *)type metadata accessor for WeatherMetadata();
    v10(&v7[v11[5]], &v8[v11[5]], v9);
    *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
    *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
    *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  }
  swift_retain();
  return v5;
}

uint64_t sub_1A937643C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_1A93ABC08();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = type metadata accessor for WeatherMetadata();
  v6(v4 + *(int *)(v7 + 20), v5);

  return swift_release();
}

void *sub_1A93764F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 52);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A93ABC08();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  uint64_t v9 = (int *)type metadata accessor for WeatherMetadata();
  v8(&v5[v9[5]], &v6[v9[5]], v7);
  *(void *)&v5[v9[6]] = *(void *)&v6[v9[6]];
  *(void *)&v5[v9[7]] = *(void *)&v6[v9[7]];
  *(void *)&v5[v9[8]] = *(void *)&v6[v9[8]];
  swift_retain();
  return a1;
}

void *sub_1A93765E0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABC08();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for WeatherMetadata();
  v10(&v7[v11[5]], &v8[v11[5]], v9);
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1A93766E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 52);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A93ABC08();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  uint64_t v9 = (int *)type metadata accessor for WeatherMetadata();
  v8(&v5[v9[5]], &v6[v9[5]], v7);
  *(void *)&v5[v9[6]] = *(void *)&v6[v9[6]];
  *(void *)&v5[v9[7]] = *(void *)&v6[v9[7]];
  *(void *)&v5[v9[8]] = *(void *)&v6[v9[8]];
  return a1;
}

void *sub_1A93767C0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABC08();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for WeatherMetadata();
  v10(&v7[v11[5]], &v8[v11[5]], v9);
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  swift_release();
  return a1;
}

uint64_t sub_1A93768B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A93768C8);
}

uint64_t sub_1A93768C8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for WeatherMetadata();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 52);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_1A9376950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9376964);
}

void *sub_1A9376964(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for WeatherMetadata();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 52);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

unsigned char *sub_1A93769E4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9376AB0);
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

uint64_t sub_1A9376AD8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9376AF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A9376B10()
{
  return swift_getWitnessTable();
}

uint64_t ProductRequirementsFactoryType.twentyFourHourForecast(timeZone:)()
{
  uint64_t v0 = sub_1A93ABC08();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  MEMORY[0x1F4188790](v2);
  sub_1A93ABBC8();
  sub_1A93ABA88();
  int v3 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_0_22();
  v3();
  sub_1A93ABB78();
  static WeatherQuery<A>.hourly(startDate:endDate:)();
  OUTLINED_FUNCTION_0_22();
  v3();
  OUTLINED_FUNCTION_0_22();
  return ((uint64_t (*)(void))v3)();
}

void (*sub_1A9376C74(uint64_t a1))(void)
{
  sub_1A93AB9A8();
  OUTLINED_FUNCTION_2();
  uint64_t v49 = v3;
  uint64_t v50 = v2;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_7_32(v4, v42);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_13_29();
  uint64_t v57 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v55 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_112();
  uint64_t v46 = v11;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v42 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v42 - v16;
  sub_1A93ABD68();
  OUTLINED_FUNCTION_2();
  uint64_t v53 = v19;
  uint64_t v54 = v18;
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93ABCE8();
  sub_1A93AB8F8();
  uint64_t v58 = v14;
  uint64_t v47 = a1;
  sub_1A93AB8D8();
  BOOL v44 = sub_1A93779F8();
  uint64_t v22 = *(void (**)(void))(v6 + 104);
  int v52 = *MEMORY[0x1E4F27BF0];
  OUTLINED_FUNCTION_8_39();
  v22();
  uint64_t v51 = v22;
  OUTLINED_FUNCTION_8_39();
  v22();
  uint64_t v56 = v17;
  uint64_t v59 = v21;
  uint64_t v43 = sub_1A93ABCB8();
  LOBYTE(v22) = v23;
  uint64_t v45 = v6;
  uint64_t v24 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_5_34();
  v24();
  OUTLINED_FUNCTION_5_34();
  v24();
  if (v22) {
    goto LABEL_8;
  }
  char v25 = v51;
  OUTLINED_FUNCTION_8_39();
  v25();
  OUTLINED_FUNCTION_8_39();
  v25();
  sub_1A93ABCB8();
  LOBYTE(v25) = v26;
  OUTLINED_FUNCTION_5_34();
  v24();
  OUTLINED_FUNCTION_5_34();
  v24();
  if (v25) {
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656398);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1A93AED10;
  OUTLINED_FUNCTION_8_39();
  v28();
  sub_1A9377D10(v27);
  sub_1A93AB8D8();
  uint64_t v29 = v48;
  sub_1A93ABCF8();
  swift_bridgeObjectRelease();
  uint64_t v30 = *(void (**)(void))(v55 + 8);
  OUTLINED_FUNCTION_11_1();
  v30();
  uint64_t v31 = sub_1A93AB978();
  LOBYTE(v27) = v32;
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v29, v50);
  if (v27)
  {
LABEL_8:
    sub_1A91C5A18();
    uint64_t v37 = swift_allocError();
    OUTLINED_FUNCTION_12_32(v37, v38);
    uint64_t v36 = *(void (**)(void))(v55 + 8);
    OUTLINED_FUNCTION_34();
    v36();
    OUTLINED_FUNCTION_34();
    v36();
    uint64_t v39 = OUTLINED_FUNCTION_2_32();
    v40(v39);
  }
  else
  {
    OUTLINED_FUNCTION_11_1();
    v30();
    OUTLINED_FUNCTION_11_1();
    v30();
    uint64_t v33 = OUTLINED_FUNCTION_2_32();
    v34(v33);
    if (v44)
    {
      BOOL v35 = v31 < 366;
      uint64_t v36 = (void (*)(void))v43;
      if (v35) {
        return v36;
      }
    }
    else
    {
      BOOL v35 = v31 < 365;
      uint64_t v36 = (void (*)(void))v43;
      if (v35) {
        return v36;
      }
    }
    sub_1A939DD58((uint64_t)v36, -1);
  }
  return v36;
}

uint64_t sub_1A9377104(uint64_t a1)
{
  sub_1A93AB9A8();
  OUTLINED_FUNCTION_2();
  uint64_t v55 = v4;
  uint64_t v56 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_7_32(v5, v50);
  OUTLINED_FUNCTION_2();
  uint64_t v63 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1F4188790](v8);
  uint64_t v62 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v60 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_112();
  uint64_t v53 = v11;
  MEMORY[0x1F4188790](v12);
  uint64_t v64 = (char *)&v50 - v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
  MEMORY[0x1F4188790](v17 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v18 = sub_1A93ABDD8();
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  char v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93ABD68();
  OUTLINED_FUNCTION_2();
  uint64_t v58 = v25;
  uint64_t v59 = v24;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_9();
  uint64_t v65 = v26;
  sub_1A93ABD88();
  uint64_t result = __swift_getEnumTagSinglePayload(v1, 1, v18);
  if (result != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v23, v1, v18);
    sub_1A93ABCE8();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v18);
    sub_1A93AB8F8();
    uint64_t v52 = a1;
    sub_1A93AB8D8();
    HIDWORD(v50) = sub_1A93779F8();
    uint64_t v28 = v63;
    uint64_t v29 = *(void (**)(void))(v63 + 104);
    int v57 = *MEMORY[0x1E4F27C10];
    OUTLINED_FUNCTION_3_37();
    v29();
    OUTLINED_FUNCTION_3_37();
    v29();
    uint64_t v61 = v16;
    uint64_t v51 = sub_1A93ABCB8();
    char v31 = v30;
    char v32 = *(void (**)(void))(v28 + 8);
    OUTLINED_FUNCTION_11_1();
    v32();
    OUTLINED_FUNCTION_11_1();
    v32();
    if (v31) {
      goto LABEL_8;
    }
    OUTLINED_FUNCTION_3_37();
    v29();
    OUTLINED_FUNCTION_3_37();
    v29();
    sub_1A93ABCB8();
    char v34 = v33;
    OUTLINED_FUNCTION_11_1();
    v32();
    OUTLINED_FUNCTION_11_1();
    v32();
    if (v34) {
      goto LABEL_8;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656398);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_1A93AED10;
    OUTLINED_FUNCTION_3_37();
    v29();
    sub_1A9377D10(v35);
    uint64_t v36 = v53;
    sub_1A93AB8D8();
    uint64_t v37 = v54;
    sub_1A93ABCF8();
    swift_bridgeObjectRelease();
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
    v38(v36, v62);
    uint64_t v39 = sub_1A93AB988();
    char v41 = v40;
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v37, v56);
    if (v41)
    {
LABEL_8:
      sub_1A91C5A18();
      uint64_t v46 = swift_allocError();
      OUTLINED_FUNCTION_12_32(v46, v47);
      uint64_t v45 = *(void (**)(void))(v60 + 8);
      OUTLINED_FUNCTION_34();
      v45();
      OUTLINED_FUNCTION_34();
      v45();
      uint64_t v48 = OUTLINED_FUNCTION_2_32();
      v49(v48);
    }
    else
    {
      uint64_t v42 = v62;
      v38((uint64_t)v64, v62);
      v38((uint64_t)v61, v42);
      uint64_t v43 = OUTLINED_FUNCTION_2_32();
      v44(v43);
      if ((v50 & 0x100000000) != 0)
      {
        uint64_t v45 = (void (*)(void))v51;
        if (v39 < 8784) {
          return (uint64_t)v45;
        }
      }
      else
      {
        uint64_t v45 = (void (*)(void))v51;
        if (v39 < 8760) {
          return (uint64_t)v45;
        }
      }
      sub_1A939DD14((uint64_t)v45, -1);
    }
    return (uint64_t)v45;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A9377690()
{
  uint64_t v42 = sub_1A93ABD48();
  OUTLINED_FUNCTION_2();
  uint64_t v39 = v2;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_9();
  uint64_t v38 = v4;
  uint64_t v37 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v43 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_83();
  uint64_t v9 = v7 - v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v32 - v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v32 - v14;
  uint64_t v36 = (char *)&v32 - v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_13_29();
  sub_1A93ABD68();
  OUTLINED_FUNCTION_2();
  uint64_t v40 = v18;
  uint64_t v41 = v17;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_6();
  sub_1A93ABCE8();
  sub_1A93AB8F8();
  sub_1A93779F8();
  sub_1A93AB8D8();
  uint64_t v19 = v0;
  uint64_t v33 = v1;
  sub_1A9377B28(v9);
  sub_1A9377FEC((unint64_t *)&qword_1EB6565C8, MEMORY[0x1E4F27928]);
  uint64_t v20 = v37;
  char v21 = sub_1A93ADDA8();
  uint64_t v22 = v43;
  if (v21) {
    char v23 = (char *)v9;
  }
  else {
    char v23 = v12;
  }
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v15, v23, v20);
  uint64_t v24 = *(void (**)(void))(v22 + 8);
  uint64_t v43 = v22 + 8;
  uint64_t v35 = v24;
  ((void (*)(uint64_t, uint64_t))v24)(v9, v20);
  ((void (*)(char *, uint64_t))v24)(v12, v20);
  uint64_t v25 = *MEMORY[0x1E4F27C30];
  uint64_t v26 = v38;
  uint64_t v27 = v39;
  char v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 104);
  uint64_t v28 = v42;
  v32(v38, v25, v42);
  uint64_t v34 = sub_1A93ABD58();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  v29(v26, v28);
  v32(v26, v25, v28);
  sub_1A93ABD58();
  v29(v26, v28);
  char v30 = v35;
  OUTLINED_FUNCTION_11_1();
  v30();
  OUTLINED_FUNCTION_11_1();
  v30();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v19, v41);
  return v34;
}

BOOL sub_1A93779F8()
{
  uint64_t v0 = sub_1A93ABD48();
  uint64_t v1 = *(void *)(v0 - 8);
  __n128 v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v1 + 104))(v4, *MEMORY[0x1E4F27C20], v0, v2);
  uint64_t v5 = sub_1A93ABD58();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v5 % 100 && (v5 & 3) == 0 || v5 % 400 == 0;
}

uint64_t sub_1A9377B28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A93ABD48();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  __n128 v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))(v5, *MEMORY[0x1E4F27C30], v2, v7);
  sub_1A93ABD08();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = sub_1A93ABC08();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  sub_1A9193988((uint64_t)v9);
  return sub_1A93ABB78();
}

uint64_t sub_1A9377D10(uint64_t a1)
{
  uint64_t v2 = sub_1A93ABD48();
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1F4188790](v5);
  uint64_t v34 = (char *)&v25 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656390);
  uint64_t result = sub_1A93AE228();
  uint64_t v8 = result;
  uint64_t v29 = *(void *)(a1 + 16);
  if (!v29)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v28 = a1 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  uint64_t v32 = v30 + 16;
  uint64_t v33 = result + 56;
  uint64_t v10 = (void (**)(void))(v30 + 8);
  uint64_t v26 = a1;
  uint64_t v27 = (uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v30 + 72);
    uint64_t v12 = *(void (**)(void))(v30 + 16);
    OUTLINED_FUNCTION_11_32();
    v12();
    sub_1A9377FEC(&qword_1EB656388, MEMORY[0x1E4F27C88]);
    uint64_t v13 = sub_1A93ADD78() & ~(-1 << *(unsigned char *)(v8 + 32));
    OUTLINED_FUNCTION_9_31();
    if ((v16 & v15) != 0)
    {
      unint64_t v31 = v9;
      uint64_t v18 = ~v17;
      while (1)
      {
        OUTLINED_FUNCTION_11_32();
        v12();
        sub_1A9377FEC(&qword_1E97BC4E8, MEMORY[0x1E4F27C88]);
        char v19 = sub_1A93ADDB8();
        uint64_t v20 = *v10;
        OUTLINED_FUNCTION_11_1();
        v20();
        if (v19) {
          break;
        }
        uint64_t v13 = (v13 + 1) & v18;
        OUTLINED_FUNCTION_9_31();
        if ((v15 & v16) == 0)
        {
          a1 = v26;
          unint64_t v9 = v31;
          goto LABEL_10;
        }
      }
      OUTLINED_FUNCTION_11_1();
      uint64_t result = ((uint64_t (*)(void))v20)();
      a1 = v26;
      unint64_t v9 = v31;
    }
    else
    {
LABEL_10:
      char v21 = v34;
      *(void *)(v33 + 8 * v14) = v16 | v15;
      uint64_t result = (*v27)(*(void *)(v8 + 48) + v13 * v11, v21, v2);
      uint64_t v22 = *(void *)(v8 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v24;
    }
    if (++v9 == v29) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1A9377FEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A9378034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1A93780A0(uint64_t a1)
{
  uint64_t v2 = sub_1A93ABDD8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1A9378104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1A9378168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1A93781CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1A9378230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1A9378294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A93782A8);
}

uint64_t sub_1A93782A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_1A93782F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9378304);
}

uint64_t sub_1A9378304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABDD8();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for StatisticsSpanFactory()
{
  uint64_t result = qword_1E97BC4F0;
  if (!qword_1E97BC4F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A9378398()
{
  uint64_t result = sub_1A93ABDD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t MonthTemperatureStatistics.init(month:averageLowTemperature:averageHighTemperature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  uint64_t v7 = type metadata accessor for MonthTemperatureStatistics();
  uint64_t v8 = (char *)a4 + *(int *)(v7 + 20);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  v13(v8, a2, v9);
  uint64_t v11 = (char *)a4 + *(int *)(v7 + 24);

  return ((uint64_t (*)(char *, uint64_t, uint64_t))v13)(v11, a3, v9);
}

uint64_t MonthTemperatureStatistics.month.getter()
{
  return *(void *)v0;
}

uint64_t MonthTemperatureStatistics.month.setter(uint64_t result)
{
  *unint64_t v1 = result;
  return result;
}

uint64_t (*MonthTemperatureStatistics.month.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t MonthTemperatureStatistics.averageLowTemperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MonthTemperatureStatistics() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t MonthTemperatureStatistics.averageLowTemperature.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_4_41() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v2, v0, v3);
}

double (*MonthTemperatureStatistics.averageLowTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t MonthTemperatureStatistics.averageHighTemperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MonthTemperatureStatistics() + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t MonthTemperatureStatistics.averageHighTemperature.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_4_41() + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v2, v0, v3);
}

double (*MonthTemperatureStatistics.averageHighTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t static MonthTemperatureStatistics.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  type metadata accessor for MonthTemperatureStatistics();
  sub_1A91D76BC();
  if ((sub_1A93AB8A8() & 1) == 0) {
    return 0;
  }

  return sub_1A93AB8A8();
}

uint64_t sub_1A9378820(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x68746E6F6DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001A93CCBE0 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001A93CCC00)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A9378964(char a1)
{
  if (!a1) {
    return 0x68746E6F6DLL;
  }
  if (a1 == 1) {
    return 0xD000000000000015;
  }
  return 0xD000000000000016;
}

uint64_t sub_1A93789B8()
{
  return sub_1A9378964(*v0);
}

uint64_t sub_1A93789C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9378820(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93789E8(uint64_t a1)
{
  unint64_t v2 = sub_1A9378BF0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9378A24(uint64_t a1)
{
  unint64_t v2 = sub_1A9378BF0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t MonthTemperatureStatistics.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC500);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9378BF0();
  sub_1A93AE5D8();
  sub_1A93AE468();
  if (!v1)
  {
    type metadata accessor for MonthTemperatureStatistics();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    sub_1A9217D48(&qword_1EB656210);
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A9378BF0()
{
  unint64_t result = qword_1E97BC508;
  if (!qword_1E97BC508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC508);
  }
  return result;
}

uint64_t MonthTemperatureStatistics.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v39 = v3;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC510);
  OUTLINED_FUNCTION_2();
  uint64_t v36 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for MonthTemperatureStatistics();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9378BF0();
  uint64_t v40 = v12;
  uint64_t v18 = (uint64_t)v41;
  sub_1A93AE5C8();
  if (v18) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v41 = a1;
  char v19 = v17;
  uint64_t v20 = v36;
  uint64_t v21 = v37;
  uint64_t v34 = v6;
  uint64_t v23 = v38;
  uint64_t v22 = v39;
  char v44 = 0;
  uint64_t v24 = sub_1A93AE3B8();
  uint64_t v33 = v19;
  *char v19 = v24;
  char v43 = 1;
  sub_1A9217D48(&qword_1E97B8230);
  sub_1A93AE3C8();
  uint64_t v30 = v13;
  uint64_t v25 = *(int *)(v13 + 20);
  uint64_t v26 = (uint64_t)v33;
  unint64_t v31 = *(void (**)(void))(v22 + 32);
  uint64_t v32 = (char *)v33 + v25;
  v31();
  char v42 = 2;
  uint64_t v27 = v34;
  uint64_t v28 = v40;
  sub_1A93AE3C8();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v23);
  ((void (*)(uint64_t, char *, uint64_t))v31)(v26 + *(int *)(v30 + 24), v27, v21);
  sub_1A9378F7C(v26, v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  return sub_1A9378FE0(v26);
}

uint64_t sub_1A9378F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MonthTemperatureStatistics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9378FE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MonthTemperatureStatistics();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A937903C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MonthTemperatureStatistics.init(from:)(a1, a2);
}

uint64_t sub_1A9379054(void *a1)
{
  return MonthTemperatureStatistics.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for MonthTemperatureStatistics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9379084);
}

uint64_t sub_1A9379084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v7 = a1 + *(int *)(a3 + 20);

  return __swift_getEnumTagSinglePayload(v7, a2, v6);
}

uint64_t storeEnumTagSinglePayload for MonthTemperatureStatistics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A93790F4);
}

uint64_t sub_1A93790F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v8 = a1 + *(int *)(a4 + 20);

  return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
}

unsigned char *storeEnumTagSinglePayload for MonthTemperatureStatistics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9379220);
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

ValueMetadata *type metadata accessor for MonthTemperatureStatistics.CodingKeys()
{
  return &type metadata for MonthTemperatureStatistics.CodingKeys;
}

unint64_t sub_1A937925C()
{
  unint64_t result = qword_1E97BC518;
  if (!qword_1E97BC518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC518);
  }
  return result;
}

unint64_t sub_1A93792AC()
{
  unint64_t result = qword_1E97BC520;
  if (!qword_1E97BC520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC520);
  }
  return result;
}

unint64_t sub_1A93792FC()
{
  unint64_t result = qword_1E97BC528;
  if (!qword_1E97BC528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC528);
  }
  return result;
}

uint64_t InstantWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:condition:symbolName:dewPoint:humidity:precipitationIntensity:pressure:pressureTrend:sunrise:sunset:isDaylight:temperature:apparentTemperature:highTemperature:lowTemperature:uvIndex:visibility:wind:metadata:)@<X0>(char *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unsigned char *a4@<X7>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>, double a10@<D4>, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t *a18)
{
  sub_1A9193988(a12);
  sub_1A9193988(a11);
  char v28 = *a1;
  LOBYTE(a1) = *a4;
  uint64_t v40 = *a18;
  char v29 = *((unsigned char *)a18 + 8);
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_77();
  v30();
  unint64_t v31 = (int *)type metadata accessor for InstantWeather();
  *(double *)(a5 + v31[5]) = a6;
  *(double *)(a5 + v31[6]) = a7;
  *(double *)(a5 + v31[7]) = a8;
  *(double *)(a5 + v31[8]) = a9;
  *(unsigned char *)(a5 + v31[9]) = v28;
  uint64_t v32 = (void *)(a5 + v31[10]);
  *uint64_t v32 = a2;
  v32[1] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v34 = *(void (**)(void))(v33 + 32);
  OUTLINED_FUNCTION_24_2();
  v34();
  *(double *)(a5 + v31[12]) = a10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_77();
  v35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_77();
  v36();
  *(unsigned char *)(a5 + v31[15]) = (_BYTE)a1;
  *(unsigned char *)(a5 + v31[16]) = a13;
  OUTLINED_FUNCTION_24_2();
  v34();
  OUTLINED_FUNCTION_24_2();
  v34();
  OUTLINED_FUNCTION_24_2();
  v34();
  OUTLINED_FUNCTION_24_2();
  v34();
  uint64_t v37 = a5 + v31[21];
  *(void *)uint64_t v37 = v40;
  *(unsigned char *)(v37 + 8) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_77();
  v38();
  sub_1A937966C();
  return sub_1A937966C();
}

uint64_t sub_1A937966C()
{
  uint64_t v1 = OUTLINED_FUNCTION_32_11();
  v2(v1);
  OUTLINED_FUNCTION_11();
  uint64_t v3 = OUTLINED_FUNCTION_9_3();
  v4(v3);
  return v0;
}

uint64_t InstantWeather.date.getter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.date.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*InstantWeather.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

double InstantWeather.cloudCover.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 20));
}

uint64_t InstantWeather.cloudCover.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_12();
  *(void *)(v0 + *(int *)(result + 20)) = v1;
  return result;
}

double (*InstantWeather.cloudCover.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double InstantWeather.cloudCoverLow.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 24));
}

uint64_t InstantWeather.cloudCoverLow.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_12();
  *(void *)(v0 + *(int *)(result + 24)) = v1;
  return result;
}

double (*InstantWeather.cloudCoverLow.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double InstantWeather.cloudCoverMid.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 28));
}

uint64_t InstantWeather.cloudCoverMid.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_12();
  *(void *)(v0 + *(int *)(result + 28)) = v1;
  return result;
}

double (*InstantWeather.cloudCoverMid.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double InstantWeather.cloudCoverHigh.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 32));
}

uint64_t InstantWeather.cloudCoverHigh.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_12();
  *(void *)(v0 + *(int *)(result + 32)) = v1;
  return result;
}

double (*InstantWeather.cloudCoverHigh.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.condition.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_33();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t InstantWeather.condition.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for InstantWeather();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

double (*InstantWeather.condition.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.symbolName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstantWeather.symbolName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for InstantWeather() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double (*InstantWeather.symbolName.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.dewPoint.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.dewPoint.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.dewPoint.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double InstantWeather.humidity.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 48));
}

uint64_t InstantWeather.humidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_12();
  *(void *)(v0 + *(int *)(result + 48)) = v1;
  return result;
}

double (*InstantWeather.humidity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.precipitationIntensity.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.precipitationIntensity.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.precipitationIntensity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.pressure.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.pressure.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.pressure.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.pressureTrend.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_33();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 60));
  return result;
}

uint64_t InstantWeather.pressureTrend.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for InstantWeather();
  *(unsigned char *)(v1 + *(int *)(result + 60)) = v2;
  return result;
}

double (*InstantWeather.pressureTrend.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.isDaylight.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InstantWeather() + 64));
}

uint64_t InstantWeather.isDaylight.setter(char a1)
{
  uint64_t result = type metadata accessor for InstantWeather();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

double (*InstantWeather.isDaylight.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.temperature.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.temperature.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.temperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.apparentTemperature.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.apparentTemperature.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.apparentTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.highTemperature.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.highTemperature.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.highTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.lowTemperature.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.lowTemperature.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.lowTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.uvIndex.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_33();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(result + 84));
  uint64_t v4 = *v3;
  LOBYTE(v3) = *((unsigned char *)v3 + 8);
  *(void *)uint64_t v0 = v4;
  *(unsigned char *)(v0 + 8) = (_BYTE)v3;
  return result;
}

uint64_t InstantWeather.uvIndex.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for InstantWeather();
  uint64_t v5 = v1 + *(int *)(result + 84);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*InstantWeather.uvIndex.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.visibility.getter()
{
  OUTLINED_FUNCTION_11_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t InstantWeather.visibility.setter()
{
  OUTLINED_FUNCTION_4_42();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*InstantWeather.visibility.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.wind.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_33();
  return sub_1A937CA94(v1 + *(int *)(v2 + 92), v0, (void (*)(void))type metadata accessor for Wind);
}

uint64_t InstantWeather.wind.setter()
{
  return sub_1A937A724();
}

double (*InstantWeather.wind.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t InstantWeather.metadata.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_33();
  return sub_1A937CA94(v1 + *(int *)(v2 + 96), v0, (void (*)(void))type metadata accessor for WeatherMetadata);
}

uint64_t InstantWeather.metadata.setter()
{
  return sub_1A937A724();
}

uint64_t sub_1A937A724()
{
  uint64_t v1 = OUTLINED_FUNCTION_32_11();
  v2(v1);
  OUTLINED_FUNCTION_11();
  uint64_t v3 = OUTLINED_FUNCTION_9_3();
  v4(v3);
  return v0;
}

double (*InstantWeather.metadata.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A937A7B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x766F4364756F6C63 && a2 == 0xEA00000000007265;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x766F4364756F6C63 && a2 == 0xED0000776F4C7265;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x766F4364756F6C63 && a2 == 0xED000064694D7265;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x766F4364756F6C63 && a2 == 0xEE00686769487265;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x614E6C6F626D7973 && a2 == 0xEA0000000000656DLL;
              if (v11 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x746E696F50776564 && a2 == 0xE800000000000000;
                if (v12 || (sub_1A93AE4B8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x79746964696D7568 && a2 == 0xE800000000000000;
                  if (v13 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else if (a1 == 0xD000000000000016 && a2 == 0x80000001A93CBAF0 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x6572757373657270 && a2 == 0xE800000000000000;
                    if (v14 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 10;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6572757373657270 && a2 == 0xED0000646E657254;
                      if (v15 || (sub_1A93AE4B8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x67696C7961447369 && a2 == 0xEA00000000007468;
                        if (v16 || (sub_1A93AE4B8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 12;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
                          if (v17 || (sub_1A93AE4B8() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 13;
                          }
                          else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CCEF0 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 14;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x706D655468676968 && a2 == 0xEF65727574617265;
                            if (v18 || (sub_1A93AE4B8() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 15;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x65706D6554776F6CLL && a2 == 0xEE00657275746172;
                              if (v19 || (sub_1A93AE4B8() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 16;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x7865646E497675 && a2 == 0xE700000000000000;
                                if (v20 || (sub_1A93AE4B8() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 17;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x696C696269736976 && a2 == 0xEA00000000007974;
                                  if (v21 || (sub_1A93AE4B8() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 18;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 1684957559 && a2 == 0xE400000000000000;
                                    if (v22 || (sub_1A93AE4B8() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 19;
                                    }
                                    else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 20;
                                    }
                                    else
                                    {
                                      char v24 = sub_1A93AE4B8();
                                      swift_bridgeObjectRelease();
                                      if (v24) {
                                        return 20;
                                      }
                                      else {
                                        return 21;
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
}

uint64_t sub_1A937B070()
{
  return 21;
}

unint64_t sub_1A937B078(char a1)
{
  unint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x766F4364756F6C63;
      break;
    case 2:
    case 3:
    case 4:
      unint64_t result = 0x766F4364756F6C63;
      break;
    case 5:
      unint64_t result = 0x6F697469646E6F63;
      break;
    case 6:
      unint64_t result = 0x614E6C6F626D7973;
      break;
    case 7:
      unint64_t result = 0x746E696F50776564;
      break;
    case 8:
      unint64_t result = 0x79746964696D7568;
      break;
    case 9:
      unint64_t result = 0xD000000000000016;
      break;
    case 10:
    case 11:
      unint64_t result = 0x6572757373657270;
      break;
    case 12:
      unint64_t result = 0x67696C7961447369;
      break;
    case 13:
      unint64_t result = 0x74617265706D6574;
      break;
    case 14:
      unint64_t result = 0xD000000000000013;
      break;
    case 15:
      unint64_t result = 0x706D655468676968;
      break;
    case 16:
      unint64_t result = 0x65706D6554776F6CLL;
      break;
    case 17:
      unint64_t result = 0x7865646E497675;
      break;
    case 18:
      unint64_t result = 0x696C696269736976;
      break;
    case 19:
      unint64_t result = 1684957559;
      break;
    case 20:
      unint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1A937B318()
{
  return sub_1A937B078(*v0);
}

uint64_t sub_1A937B320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A937A7B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A937B348@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A937B070();
  *a1 = result;
  return result;
}

uint64_t sub_1A937B370(uint64_t a1)
{
  unint64_t v2 = sub_1A937BC6C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A937B3AC(uint64_t a1)
{
  unint64_t v2 = sub_1A937BC6C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t static InstantWeather.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for InstantWeather();
  OUTLINED_FUNCTION_12_5(*(int *)(v4 + 20));
  if (!v11) {
    return 0;
  }
  BOOL v6 = v5;
  OUTLINED_FUNCTION_12_5(v5[6]);
  if (!v11) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v6[7]);
  if (!v11) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v6[8]);
  if (!v11 || (sub_1A91D59C4(*(unsigned __int8 *)(a1 + v6[9]), *(unsigned __int8 *)(a2 + v6[9])) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = v6[10];
  uint64_t v8 = *(void *)(a1 + v7);
  uint64_t v9 = *(void *)(a1 + v7 + 8);
  BOOL v10 = (void *)(a2 + v7);
  BOOL v11 = v8 == *v10 && v9 == v10[1];
  if (!v11 && (sub_1A93AE4B8() & 1) == 0) {
    return 0;
  }
  sub_1A91CF228(0, qword_1EB657120);
  if ((sub_1A93AB8A8() & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v6[12]);
  if (!v11) {
    return 0;
  }
  sub_1A91CF228(0, (unint64_t *)&qword_1EB658508);
  if ((OUTLINED_FUNCTION_27_16() & 1) == 0) {
    return 0;
  }
  sub_1A91CF228(0, &qword_1EB658518);
  if ((OUTLINED_FUNCTION_27_16() & 1) == 0) {
    return 0;
  }
  if ((sub_1A91E7974(*(unsigned char *)(a1 + v6[15]), *(unsigned char *)(a2 + v6[15])) & 1) == 0) {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + v6[16]) != *(unsigned __int8 *)(a2 + v6[16])) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_14_28() & 1) == 0) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_14_28() & 1) == 0) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_14_28() & 1) == 0) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_14_28() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = v6[21];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(a1 + v12);
  uint64_t v15 = a2 + v12;
  if (v14 != *(void *)v15) {
    return 0;
  }
  char v16 = *(unsigned char *)(v15 + 8);
  uint64_t v17 = UVIndex.ExposureCategory.rawValue.getter(*(unsigned char *)(v13 + 8));
  uint64_t v19 = v18;
  if (v17 == UVIndex.ExposureCategory.rawValue.getter(v16) && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v22 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0) {
      return 0;
    }
  }
  sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
  if ((sub_1A93AB8A8() & 1) == 0 || !static Wind.== infix(_:_:)((char *)(a1 + v6[23]), (char *)(a2 + v6[23]))) {
    return 0;
  }
  uint64_t v23 = v6[24];

  return static WeatherMetadata.== infix(_:_:)(a1 + v23, a2 + v23);
}

uint64_t InstantWeather.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC530);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A937BC6C();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A937CEDC(&qword_1EB656220, MEMORY[0x1E4F27928]);
  OUTLINED_FUNCTION_13();
  if (!v1)
  {
    type metadata accessor for InstantWeather();
    OUTLINED_FUNCTION_6_8(1);
    OUTLINED_FUNCTION_6_8(2);
    OUTLINED_FUNCTION_6_8(3);
    OUTLINED_FUNCTION_6_8(4);
    sub_1A91F1B40();
    OUTLINED_FUNCTION_13();
    sub_1A93AE428();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    sub_1A91F1C70(&qword_1EB656210, &qword_1EB6571E0);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6_8(8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    sub_1A91F1C70(&qword_1EB6561F8, &qword_1EB6572C0);
    OUTLINED_FUNCTION_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
    sub_1A91F1C70(&qword_1EB656208, &qword_1EB6572F0);
    OUTLINED_FUNCTION_13();
    sub_1A922698C();
    OUTLINED_FUNCTION_13();
    sub_1A93AE438();
    OUTLINED_FUNCTION_5_35(13);
    OUTLINED_FUNCTION_5_35(14);
    OUTLINED_FUNCTION_5_35(15);
    OUTLINED_FUNCTION_5_35(16);
    sub_1A91F1B8C();
    OUTLINED_FUNCTION_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    sub_1A91F1C70(&qword_1EB656200, &qword_1EB6572E0);
    OUTLINED_FUNCTION_19_22();
    OUTLINED_FUNCTION_13();
    type metadata accessor for Wind();
    sub_1A937CEDC(&qword_1EB656308, (void (*)(uint64_t))type metadata accessor for Wind);
    OUTLINED_FUNCTION_19_22();
    OUTLINED_FUNCTION_13();
    type metadata accessor for WeatherMetadata();
    sub_1A937CEDC(&qword_1EB6562A0, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
    OUTLINED_FUNCTION_19_22();
    OUTLINED_FUNCTION_13();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A937BC6C()
{
  unint64_t result = qword_1E97BC538;
  if (!qword_1E97BC538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC538);
  }
  return result;
}

uint64_t InstantWeather.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v87 = type metadata accessor for WeatherMetadata();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_9();
  uint64_t v86 = v4;
  uint64_t v85 = type metadata accessor for Wind();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  uint64_t v88 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v94 = v8;
  uint64_t v95 = v7;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_9();
  v83[4] = v9;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_2();
  uint64_t v96 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_9();
  uint64_t v91 = v12;
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_2();
  uint64_t v97 = v13;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_9();
  uint64_t v101 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v108 = v16;
  uint64_t v109 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v84 = (char *)v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v90 = (char *)v83 - v20;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)v83 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)v83 - v25;
  MEMORY[0x1F4188790](v27);
  char v29 = (char *)v83 - v28;
  uint64_t v30 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v100 = v31;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_0();
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC540);
  OUTLINED_FUNCTION_2();
  uint64_t v92 = v33;
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v36 - v35;
  char v107 = (int *)type metadata accessor for InstantWeather();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_9();
  uint64_t v106 = v39;
  uint64_t v40 = a1[3];
  char v103 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v40);
  sub_1A937BC6C();
  uint64_t v104 = v37;
  uint64_t v41 = v105;
  sub_1A93AE5C8();
  uint64_t v93 = v30;
  if (v41)
  {
    uint64_t v105 = v41;
    LODWORD(v104) = 0;
    unsigned int v43 = 0;
  }
  else
  {
    char v42 = v29;
    v83[3] = v26;
    v83[2] = v23;
    LOBYTE(v110) = 0;
    sub_1A937CEDC(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_56_2();
    sub_1A93AE3C8();
    uint64_t v55 = v106;
    OUTLINED_FUNCTION_48();
    v56();
    OUTLINED_FUNCTION_26_15(1);
    int v57 = v107;
    *(void *)(v55 + v107[5]) = v58;
    OUTLINED_FUNCTION_21_17(2);
    *(void *)(v55 + v57[6]) = v59;
    OUTLINED_FUNCTION_21_17(3);
    *(void *)(v55 + v57[7]) = v60;
    OUTLINED_FUNCTION_21_17(4);
    *(void *)(v55 + v57[8]) = v61;
    char v112 = 5;
    sub_1A91F1BD8();
    sub_1A93AE3C8();
    *(unsigned char *)(v55 + v57[9]) = v110;
    LOBYTE(v110) = 6;
    uint64_t v62 = sub_1A93AE378();
    uint64_t v63 = (uint64_t *)(v55 + v57[10]);
    *uint64_t v63 = v62;
    v63[1] = v64;
    LOBYTE(v110) = 7;
    sub_1A91F1C70(&qword_1E97B8230, &qword_1EB6571E0);
    OUTLINED_FUNCTION_56_2();
    v83[1] = v65;
    sub_1A93AE3C8();
    v83[0] = *(void *)(v109 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v83[0])(v55 + MEMORY[0x2C], v42, v108);
    OUTLINED_FUNCTION_26_15(8);
    *(void *)(v55 + MEMORY[0x30]) = v66;
    LOBYTE(v110) = 9;
    sub_1A91F1C70(&qword_1E97B81E8, &qword_1EB6572C0);
    OUTLINED_FUNCTION_56_2();
    sub_1A93AE3C8();
    uint64_t v105 = 0;
    OUTLINED_FUNCTION_48();
    v67();
    LOBYTE(v110) = 10;
    sub_1A91F1C70(&qword_1E97B8960, &qword_1EB6572F0);
    OUTLINED_FUNCTION_56_2();
    OUTLINED_FUNCTION_15_26();
    uint64_t v105 = 0;
    OUTLINED_FUNCTION_48();
    v68();
    char v112 = 11;
    sub_1A9227698();
    OUTLINED_FUNCTION_15_26();
    uint64_t v105 = 0;
    *(unsigned char *)(v106 + v107[15]) = v110;
    LOBYTE(v110) = 12;
    uint64_t v69 = v105;
    char v70 = sub_1A93AE388();
    uint64_t v105 = v69;
    if (!v69)
    {
      *(unsigned char *)(v106 + v107[16]) = v70 & 1;
      OUTLINED_FUNCTION_26(13);
      uint64_t v71 = v105;
      sub_1A93AE3C8();
      uint64_t v105 = v71;
      if (!v71)
      {
        OUTLINED_FUNCTION_12_33();
        v74();
        OUTLINED_FUNCTION_26(14);
        OUTLINED_FUNCTION_13_30();
        uint64_t v105 = 0;
        OUTLINED_FUNCTION_12_33();
        v75();
        OUTLINED_FUNCTION_26(15);
        OUTLINED_FUNCTION_13_30();
        uint64_t v105 = 0;
        OUTLINED_FUNCTION_12_33();
        v76();
        OUTLINED_FUNCTION_26(16);
        OUTLINED_FUNCTION_13_30();
        uint64_t v105 = 0;
        ((void (*)(uint64_t, char *, uint64_t))v83[0])(v106 + v107[20], v84, v108);
        char v112 = 17;
        sub_1A91F1C24();
        OUTLINED_FUNCTION_15_26();
        uint64_t v105 = 0;
        char v77 = v111;
        uint64_t v78 = v106 + v107[21];
        *(void *)uint64_t v78 = v110;
        *(unsigned char *)(v78 + 8) = v77;
        LOBYTE(v110) = 18;
        sub_1A91F1C70(&qword_1E97B8138, &qword_1EB6572E0);
        OUTLINED_FUNCTION_56_2();
        OUTLINED_FUNCTION_15_26();
        uint64_t v105 = 0;
        OUTLINED_FUNCTION_48();
        v79();
        LOBYTE(v110) = 19;
        sub_1A937CEDC(&qword_1E97B8258, (void (*)(uint64_t))type metadata accessor for Wind);
        OUTLINED_FUNCTION_56_2();
        OUTLINED_FUNCTION_15_26();
        uint64_t v105 = 0;
        sub_1A937966C();
        LOBYTE(v110) = 20;
        sub_1A937CEDC(&qword_1E97B8580, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
        OUTLINED_FUNCTION_56_2();
        OUTLINED_FUNCTION_15_26();
        uint64_t v105 = 0;
        uint64_t v80 = OUTLINED_FUNCTION_3_38();
        v81(v80);
        uint64_t v82 = v106;
        sub_1A937966C();
        sub_1A937CA94(v82, v89, (void (*)(void))type metadata accessor for InstantWeather);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
        return sub_1A937CAEC(v82, (void (*)(void))type metadata accessor for InstantWeather);
      }
    }
    uint64_t v72 = OUTLINED_FUNCTION_3_38();
    v73(v72);
    LODWORD(v104) = 0;
    unsigned int v43 = 1729;
  }
  uint64_t v44 = v106;
  uint64_t v45 = v107;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
  if (v43)
  {
    LODWORD(v101) = 0;
    LODWORD(v102) = 0;
    OUTLINED_FUNCTION_27();
    uint64_t result = v50();
    if (((v43 >> 6) & 1) == 0)
    {
LABEL_6:
      if ((v43 >> 7)) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    LODWORD(v102) = 0;
    LODWORD(v101) = 0;
    if ((v43 & 0x40) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if ((v43 >> 7))
  {
LABEL_7:
    uint64_t v47 = v108;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v44 + v45[11], v108);
    if (((v43 >> 9) & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v47 = v108;
  if (((v43 >> 9) & 1) == 0)
  {
LABEL_8:
    if ((v43 >> 10)) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  OUTLINED_FUNCTION_27();
  uint64_t result = v51();
  if ((v43 >> 10))
  {
LABEL_9:
    OUTLINED_FUNCTION_27();
    uint64_t result = v48();
    if (((v43 >> 13) & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (((v43 >> 13) & 1) == 0)
  {
LABEL_10:
    if ((v43 >> 14))
    {
      uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v109 + 8);
      goto LABEL_18;
    }
LABEL_20:
    if (!v104) {
      goto LABEL_26;
    }
    uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v109 + 8);
LABEL_22:
    uint64_t result = v49(v44 + v45[19], v47);
    int v53 = v102;
    goto LABEL_27;
  }
LABEL_17:
  uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v109 + 8);
  uint64_t result = v49(v44 + v45[17], v47);
  if (((v43 >> 14) & 1) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  char v52 = v104;
  uint64_t result = v49(v44 + v45[18], v47);
  if (v52) {
    goto LABEL_22;
  }
LABEL_26:
  int v53 = v102;
LABEL_27:
  if (v101)
  {
    OUTLINED_FUNCTION_27();
    uint64_t result = v54();
    if ((v53 & 1) == 0) {
      return result;
    }
  }
  else if (!v53)
  {
    return result;
  }
  return sub_1A937CAEC(v44 + v45[23], (void (*)(void))type metadata accessor for Wind);
}

uint64_t sub_1A937CA94(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  uint64_t v4 = OUTLINED_FUNCTION_9_3();
  v5(v4);
  return a2;
}

uint64_t sub_1A937CAEC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_27();
  v3();
  return a1;
}

uint64_t sub_1A937CB40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InstantWeather.init(from:)(a1, a2);
}

uint64_t sub_1A937CB58(void *a1)
{
  return InstantWeather.encode(to:)(a1);
}

uint64_t InstantWeather.conditionDescription.getter()
{
  uint64_t v1 = type metadata accessor for InstantWeather();
  return WeatherCondition.description(isDaylight:)(*(unsigned char *)(v0 + *(int *)(v1 + 64)))._countAndFlagsBits;
}

uint64_t InstantWeather.debugDescription.getter()
{
  BYTE8(v3) = 0;
  sub_1A93AE238();
  sub_1A93ADE78();
  uint64_t v1 = type metadata accessor for InstantWeather();
  sub_1A93ABC08();
  sub_1A937CEDC((unint64_t *)&qword_1EB6552A8, MEMORY[0x1E4F27928]);
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  type metadata accessor for WeatherMetadata();
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  *(void *)&long long v3 = *(unsigned __int8 *)(v0 + *(int *)(v1 + 36));
  WeatherCondition.description.getter();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  sub_1A91F1C70(&qword_1EB655280, &qword_1EB6571E0);
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v3 + 1);
}

BOOL InstantWeather.isExpired.getter()
{
  uint64_t v0 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  sub_1A93ABBF8();
  type metadata accessor for InstantWeather();
  type metadata accessor for WeatherMetadata();
  sub_1A937CEDC((unint64_t *)&qword_1EB6565C8, MEMORY[0x1E4F27928]);
  char v7 = sub_1A93ADDA8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return (v7 & 1) == 0;
}

uint64_t sub_1A937CEDC(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for InstantWeather(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v47 = *a2;
    *a1 = *a2;
    a1 = (void *)(v47 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    uint64_t v55 = v7;
    ((void (*)(void *, void *))v54)(a1, a2);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = a3[11];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    swift_bridgeObjectRetain();
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    uint64_t v19 = a3[13];
    *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16);
    v22(v20, v21, v53);
    uint64_t v23 = a3[14];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    uint64_t v27 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
    v18((char *)a1 + a3[17], (char *)a2 + a3[17], v17);
    v18((char *)a1 + a3[18], (char *)a2 + a3[18], v17);
    v18((char *)a1 + a3[19], (char *)a2 + a3[19], v17);
    v18((char *)a1 + a3[20], (char *)a2 + a3[20], v17);
    uint64_t v28 = a3[21];
    uint64_t v29 = a3[22];
    uint64_t v30 = (char *)a1 + v28;
    uint64_t v31 = (char *)a2 + v28;
    *(void *)uint64_t v30 = *(void *)v31;
    v30[8] = v31[8];
    uint64_t v32 = (char *)a1 + v29;
    uint64_t v33 = (char *)a2 + v29;
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    uint64_t v35 = a3[23];
    uint64_t v36 = (char *)a1 + v35;
    uint64_t v37 = (char *)a2 + v35;
    *((unsigned char *)a1 + v35) = *((unsigned char *)a2 + v35);
    uint64_t v38 = (int *)type metadata accessor for Wind();
    uint64_t v39 = v38[5];
    uint64_t v40 = &v36[v39];
    uint64_t v41 = &v37[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    v22(&v36[v38[6]], &v37[v38[6]], v53);
    uint64_t v43 = v38[7];
    uint64_t v44 = &v36[v43];
    uint64_t v45 = &v37[v43];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v37[v43], 1, v53))
    {
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
      memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      v22(v44, v45, v53);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v53);
    }
    uint64_t v48 = a3[24];
    uint64_t v49 = (char *)a1 + v48;
    uint64_t v50 = (char *)a2 + v48;
    v54((char *)a1 + v48, v50, v55);
    uint64_t v51 = (int *)type metadata accessor for WeatherMetadata();
    v54(&v49[v51[5]], &v50[v51[5]], v55);
    *(void *)&v49[v51[6]] = *(void *)&v50[v51[6]];
    *(void *)&v49[v51[7]] = *(void *)&v50[v51[7]];
    *(void *)&v49[v51[8]] = *(void *)&v50[v51[8]];
  }
  swift_retain();
  return a1;
}

uint64_t destroy for InstantWeather(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A93ABC08();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v23(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[11];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = a1 + a2[13];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  uint64_t v11 = a1 + a2[14];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v7(a1 + a2[17], v6);
  v7(a1 + a2[18], v6);
  v7(a1 + a2[19], v6);
  v7(a1 + a2[20], v6);
  uint64_t v13 = a1 + a2[22];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + a2[23];
  uint64_t v16 = (int *)type metadata accessor for Wind();
  uint64_t v17 = v15 + v16[5];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v10(v15 + v16[6], v9);
  uint64_t v19 = v15 + v16[7];
  if (!__swift_getEnumTagSinglePayload(v19, 1, v9)) {
    v10(v19, v9);
  }
  uint64_t v20 = a1 + a2[24];
  v23(v20, v4);
  uint64_t v21 = type metadata accessor for WeatherMetadata();
  v23(v20 + *(int *)(v21 + 20), v4);

  return swift_release();
}

uint64_t initializeWithCopy for InstantWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  char v52 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v53 = v6;
  v52(a1, a2);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = a3[11];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  swift_bridgeObjectRetain();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
  v17(v14, v15, v16);
  uint64_t v18 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16);
  v21(v19, v20, v51);
  uint64_t v22 = a3[14];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  uint64_t v26 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v26) = *(unsigned char *)(a2 + v26);
  v17(a1 + a3[17], a2 + a3[17], v16);
  v17(a1 + a3[18], a2 + a3[18], v16);
  v17(a1 + a3[19], a2 + a3[19], v16);
  v17(a1 + a3[20], a2 + a3[20], v16);
  uint64_t v27 = a3[21];
  uint64_t v28 = a3[22];
  uint64_t v29 = a1 + v27;
  uint64_t v30 = a2 + v27;
  *(void *)uint64_t v29 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  uint64_t v31 = a1 + v28;
  uint64_t v32 = a2 + v28;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
  uint64_t v34 = a3[23];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(unsigned char *)(a1 + v34) = *(unsigned char *)(a2 + v34);
  uint64_t v37 = (int *)type metadata accessor for Wind();
  uint64_t v38 = v37[5];
  uint64_t v39 = v35 + v38;
  uint64_t v40 = v36 + v38;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  v21(v35 + v37[6], v36 + v37[6], v51);
  uint64_t v42 = v37[7];
  uint64_t v43 = (void *)(v35 + v42);
  uint64_t v44 = (const void *)(v36 + v42);
  if (__swift_getEnumTagSinglePayload(v36 + v42, 1, v51))
  {
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
  }
  else
  {
    v21((uint64_t)v43, (uint64_t)v44, v51);
    __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v51);
  }
  uint64_t v46 = a3[24];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  ((void (*)(uint64_t, uint64_t, uint64_t))v52)(a1 + v46, v48, v53);
  uint64_t v49 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v52)(v47 + v49[5], v48 + v49[5], v53);
  *(void *)(v47 + v49[6]) = *(void *)(v48 + v49[6]);
  *(void *)(v47 + v49[7]) = *(void *)(v48 + v49[7]);
  *(void *)(v47 + v49[8]) = *(void *)(v48 + v49[8]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for InstantWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  uint64_t v51 = v6;
  v50(a1, a2);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v7 = a3[10];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[11];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v15 = a3[13];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v48 = *(void *)(v18 - 8);
  uint64_t v49 = v18;
  char v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 24);
  v52(v16, v17, v18);
  uint64_t v19 = a3[14];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  v14(a1 + a3[17], a2 + a3[17], v13);
  v14(a1 + a3[18], a2 + a3[18], v13);
  v14(a1 + a3[19], a2 + a3[19], v13);
  v14(a1 + a3[20], a2 + a3[20], v13);
  uint64_t v23 = a3[21];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  uint64_t v26 = a3[22];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 24))(v27, v28, v29);
  uint64_t v30 = a3[23];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v33 = (int *)type metadata accessor for Wind();
  uint64_t v34 = v33[5];
  uint64_t v35 = v31 + v34;
  uint64_t v36 = v32 + v34;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  v52(v31 + v33[6], v32 + v33[6], v49);
  uint64_t v38 = v33[7];
  uint64_t v39 = (void *)(v31 + v38);
  uint64_t v40 = (const void *)(v32 + v38);
  LODWORD(v36) = __swift_getEnumTagSinglePayload(v31 + v38, 1, v49);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v40, 1, v49);
  if (!v36)
  {
    if (!EnumTagSinglePayload)
    {
      v52((uint64_t)v39, (uint64_t)v40, v49);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v48 + 8))(v39, v49);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v48 + 16))(v39, v40, v49);
  __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v49);
LABEL_7:
  uint64_t v43 = a3[24];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  ((void (*)(uint64_t, uint64_t, uint64_t))v50)(a1 + v43, v45, v51);
  uint64_t v46 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v50)(v44 + v46[5], v45 + v46[5], v51);
  *(void *)(v44 + v46[6]) = *(void *)(v45 + v46[6]);
  *(void *)(v44 + v46[7]) = *(void *)(v45 + v46[7]);
  *(void *)(v44 + v46[8]) = *(void *)(v45 + v46[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for InstantWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  uint64_t v50 = v6;
  v49(a1, a2);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[11];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  uint64_t v15 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 32);
  v18(v16, v17, v48);
  uint64_t v19 = a3[14];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v23) = *(unsigned char *)(a2 + v23);
  v14(a1 + a3[17], a2 + a3[17], v13);
  v14(a1 + a3[18], a2 + a3[18], v13);
  v14(a1 + a3[19], a2 + a3[19], v13);
  v14(a1 + a3[20], a2 + a3[20], v13);
  uint64_t v24 = a3[21];
  uint64_t v25 = a3[22];
  uint64_t v26 = a1 + v24;
  uint64_t v27 = a2 + v24;
  *(void *)uint64_t v26 = *(void *)v27;
  *(unsigned char *)(v26 + 8) = *(unsigned char *)(v27 + 8);
  uint64_t v28 = a1 + v25;
  uint64_t v29 = a2 + v25;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  uint64_t v31 = a3[23];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(unsigned char *)(a1 + v31) = *(unsigned char *)(a2 + v31);
  uint64_t v34 = (int *)type metadata accessor for Wind();
  uint64_t v35 = v34[5];
  uint64_t v36 = v32 + v35;
  uint64_t v37 = v33 + v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
  v18(v32 + v34[6], v33 + v34[6], v48);
  uint64_t v39 = v34[7];
  uint64_t v40 = (void *)(v32 + v39);
  uint64_t v41 = (const void *)(v33 + v39);
  if (__swift_getEnumTagSinglePayload(v33 + v39, 1, v48))
  {
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    v18((uint64_t)v40, (uint64_t)v41, v48);
    __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v48);
  }
  uint64_t v43 = a3[24];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  ((void (*)(uint64_t, uint64_t, uint64_t))v49)(a1 + v43, v45, v50);
  uint64_t v46 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v49)(v44 + v46[5], v45 + v46[5], v50);
  *(void *)(v44 + v46[6]) = *(void *)(v45 + v46[6]);
  *(void *)(v44 + v46[7]) = *(void *)(v45 + v46[7]);
  *(void *)(v44 + v46[8]) = *(void *)(v45 + v46[8]);
  return a1;
}

uint64_t assignWithTake for InstantWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  uint64_t v56 = v6;
  v55(a1, a2);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *uint64_t v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[11];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40);
  v18(v15, v16, v17);
  uint64_t v19 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v53 = *(void *)(v22 - 8);
  uint64_t v54 = v22;
  int v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 40);
  v57(v20, v21, v22);
  uint64_t v23 = a3[14];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  uint64_t v27 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  v18(a1 + a3[17], a2 + a3[17], v17);
  v18(a1 + a3[18], a2 + a3[18], v17);
  v18(a1 + a3[19], a2 + a3[19], v17);
  v18(a1 + a3[20], a2 + a3[20], v17);
  uint64_t v28 = a3[21];
  uint64_t v29 = a3[22];
  uint64_t v30 = a1 + v28;
  uint64_t v31 = a2 + v28;
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  uint64_t v32 = a1 + v29;
  uint64_t v33 = a2 + v29;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 40))(v32, v33, v34);
  uint64_t v35 = a3[23];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v38 = (int *)type metadata accessor for Wind();
  uint64_t v39 = v38[5];
  uint64_t v40 = v36 + v39;
  uint64_t v41 = v37 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 40))(v40, v41, v42);
  v57(v36 + v38[6], v37 + v38[6], v54);
  uint64_t v43 = v38[7];
  uint64_t v44 = (void *)(v36 + v43);
  uint64_t v45 = (const void *)(v37 + v43);
  LODWORD(v41) = __swift_getEnumTagSinglePayload(v36 + v43, 1, v54);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v54);
  if (!v41)
  {
    if (!EnumTagSinglePayload)
    {
      v57((uint64_t)v44, (uint64_t)v45, v54);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v53 + 8))(v44, v54);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v53 + 32))(v44, v45, v54);
  __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v54);
LABEL_7:
  uint64_t v48 = a3[24];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  ((void (*)(uint64_t, uint64_t, uint64_t))v55)(a1 + v48, v50, v56);
  uint64_t v51 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v55)(v49 + v51[5], v50 + v51[5], v56);
  *(void *)(v49 + v51[6]) = *(void *)(v50 + v51[6]);
  *(void *)(v49 + v51[7]) = *(void *)(v50 + v51[7]);
  *(void *)(v49 + v51[8]) = *(void *)(v50 + v51[8]);
  swift_release();
  return a1;
}

uint64_t sub_1A937E8F4(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_19:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v14 = a3[11];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a2)
      {
        uint64_t v8 = v15;
        uint64_t v14 = a3[13];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a2)
        {
          uint64_t v8 = v17;
          uint64_t v14 = a3[14];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a2)
          {
            uint64_t v8 = v19;
            uint64_t v14 = a3[22];
          }
          else
          {
            type metadata accessor for Wind();
            OUTLINED_FUNCTION_4_1();
            if (*(_DWORD *)(v22 + 84) == a2)
            {
              uint64_t v8 = v21;
              uint64_t v14 = a3[23];
            }
            else
            {
              uint64_t v8 = type metadata accessor for WeatherMetadata();
              uint64_t v14 = a3[24];
            }
          }
        }
      }
    }
    uint64_t v9 = a1 + v14;
    goto LABEL_19;
  }
  unint64_t v10 = *(void *)(a1 + a3[10] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

void sub_1A937EA6C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[10] + 8) = (a2 - 1);
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[11];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[13];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[14];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[22];
          }
          else
          {
            type metadata accessor for Wind();
            OUTLINED_FUNCTION_4_1();
            if (*(_DWORD *)(v22 + 84) == a3)
            {
              uint64_t v10 = v21;
              uint64_t v14 = a4[23];
            }
            else
            {
              uint64_t v10 = type metadata accessor for WeatherMetadata();
              uint64_t v14 = a4[24];
            }
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

unsigned char *storeEnumTagSinglePayload for InstantWeather.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *uint64_t result = a2 + 20;
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
        JUMPOUT(0x1A937ECACLL);
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
          *uint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InstantWeather.CodingKeys()
{
  return &type metadata for InstantWeather.CodingKeys;
}

unint64_t sub_1A937ECE8()
{
  unint64_t result = qword_1E97BC548;
  if (!qword_1E97BC548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC548);
  }
  return result;
}

unint64_t sub_1A937ED38()
{
  unint64_t result = qword_1E97BC550;
  if (!qword_1E97BC550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC550);
  }
  return result;
}

unint64_t sub_1A937ED88()
{
  unint64_t result = qword_1E97BC558;
  if (!qword_1E97BC558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC558);
  }
  return result;
}

uint64_t WeatherServiceOptions.init(dailyDateInterval:hourlyDateInterval:dailyRelativeRange:hourlyRelativeRange:periodicRelativeRange:marineHourlyRelativeRange:instantQueryOptions:timeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v29 = a3[1];
  uint64_t v30 = *a3;
  char v28 = *((unsigned char *)a3 + 16);
  uint64_t v26 = a4[1];
  uint64_t v27 = *a4;
  char v25 = *((unsigned char *)a4 + 16);
  uint64_t v32 = a6[1];
  uint64_t v33 = *a6;
  char v31 = *((unsigned char *)a6 + 16);
  uint64_t v11 = sub_1A93AB908();
  __swift_storeEnumTagSinglePayload(a9, 1, 1, v11);
  uint64_t v12 = (int *)type metadata accessor for WeatherServiceOptions();
  uint64_t v13 = a9 + v12[5];
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v11);
  uint64_t v14 = a9 + v12[6];
  *(void *)uint64_t v14 = 0;
  *(void *)(v14 + 8) = 0;
  *(unsigned char *)(v14 + 16) = 1;
  uint64_t v15 = a9 + v12[7];
  *(void *)uint64_t v15 = 0;
  *(void *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 16) = 2;
  uint64_t v16 = a9 + v12[8];
  uint64_t v17 = type metadata accessor for WeatherServicePeriodicRelativeRange();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  uint64_t v18 = a9 + v12[9];
  *(void *)uint64_t v18 = 0;
  *(void *)(v18 + 8) = 0;
  *(unsigned char *)(v18 + 16) = 2;
  uint64_t v19 = a9 + v12[10];
  uint64_t Options = type metadata accessor for InstantWeatherQueryOptions();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, Options);
  uint64_t v21 = a9 + v12[11];
  uint64_t v22 = sub_1A93ABDD8();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  sub_1A91B70A4(a1, a9, &qword_1EB657318);
  sub_1A91B70A4(a2, v13, &qword_1EB657318);
  *(void *)uint64_t v14 = v30;
  *(void *)(v14 + 8) = v29;
  *(unsigned char *)(v14 + 16) = v28;
  *(void *)uint64_t v15 = v27;
  *(void *)(v15 + 8) = v26;
  *(unsigned char *)(v15 + 16) = v25;
  sub_1A91B70A4(a5, v16, &qword_1EB657048);
  *(void *)uint64_t v18 = v33;
  *(void *)(v18 + 8) = v32;
  *(unsigned char *)(v18 + 16) = v31;
  sub_1A91B70A4(a7, v19, &qword_1EB657818);
  return sub_1A91B70A4(a8, v21, (uint64_t *)&unk_1EB657350);
}

uint64_t WeatherServiceOptions.dailyDateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1A91B5004(v1, a1, &qword_1EB657318);
}

uint64_t WeatherServiceOptions.dailyDateInterval.setter(uint64_t a1)
{
  return sub_1A91B70A4(a1, v1, &qword_1EB657318);
}

uint64_t (*WeatherServiceOptions.dailyDateInterval.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceOptions.hourlyDateInterval.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_39();
  return sub_1A91B5004(v1 + *(int *)(v2 + 20), v0, &qword_1EB657318);
}

uint64_t WeatherServiceOptions.hourlyDateInterval.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_31();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 20), &qword_1EB657318);
}

double (*WeatherServiceOptions.hourlyDateInterval.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double WeatherServiceOptions.dailyRelativeRange.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_3_39();
  *(void *)&double result = OUTLINED_FUNCTION_2_33(*(int *)(v0 + 24)).n128_u64[0];
  return result;
}

void WeatherServiceOptions.dailyRelativeRange.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_4_43();
  OUTLINED_FUNCTION_6_30(*(int *)(v0 + 24));
}

double (*WeatherServiceOptions.dailyRelativeRange.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double WeatherServiceOptions.hourlyRelativeRange.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_3_39();
  *(void *)&double result = OUTLINED_FUNCTION_2_33(*(int *)(v0 + 28)).n128_u64[0];
  return result;
}

void WeatherServiceOptions.hourlyRelativeRange.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_4_43();
  OUTLINED_FUNCTION_6_30(*(int *)(v0 + 28));
}

double (*WeatherServiceOptions.hourlyRelativeRange.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceOptions.periodicRelativeRange.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_39();
  return sub_1A91B5004(v1 + *(int *)(v2 + 32), v0, &qword_1EB657048);
}

uint64_t WeatherServiceOptions.periodicRelativeRange.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_31();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 32), &qword_1EB657048);
}

double (*WeatherServiceOptions.periodicRelativeRange.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double WeatherServiceOptions.marineHourlyRelativeRange.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_3_39();
  *(void *)&double result = OUTLINED_FUNCTION_2_33(*(int *)(v0 + 36)).n128_u64[0];
  return result;
}

void WeatherServiceOptions.marineHourlyRelativeRange.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_4_43();
  OUTLINED_FUNCTION_6_30(*(int *)(v0 + 36));
}

double (*WeatherServiceOptions.marineHourlyRelativeRange.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceOptions.instantQueryOptions.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_39();
  return sub_1A91B5004(v1 + *(int *)(v2 + 40), v0, &qword_1EB657818);
}

uint64_t WeatherServiceOptions.instantQueryOptions.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_31();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 40), &qword_1EB657818);
}

double (*WeatherServiceOptions.instantQueryOptions.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceOptions.timeZone.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_39();
  return sub_1A91B5004(v1 + *(int *)(v2 + 44), v0, (uint64_t *)&unk_1EB657350);
}

uint64_t WeatherServiceOptions.timeZone.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_31();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 44), (uint64_t *)&unk_1EB657350);
}

double (*WeatherServiceOptions.timeZone.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherServiceOptions(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93AB908();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v10, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v14;
    uint64_t v17 = (char *)a2 + v14;
    long long v18 = *(_OWORD *)v17;
    v16[16] = v17[16];
    *(_OWORD *)uint64_t v16 = v18;
    uint64_t v19 = (char *)a1 + v15;
    uint64_t v20 = (char *)a2 + v15;
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    v19[16] = v20[16];
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = type metadata accessor for WeatherServicePeriodicRelativeRange();
    if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
      memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      uint64_t v26 = sub_1A93ABC08();
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
      v27(v22, v23, v26);
      v27(&v22[*(int *)(v24 + 20)], &v23[*(int *)(v24 + 20)], v26);
      *(void *)&v22[*(int *)(v24 + 24)] = *(void *)&v23[*(int *)(v24 + 24)];
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
    }
    uint64_t v28 = a3[9];
    uint64_t v29 = a3[10];
    uint64_t v30 = (char *)a1 + v28;
    char v31 = (char *)a2 + v28;
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    v30[16] = v31[16];
    uint64_t v32 = (char *)a1 + v29;
    uint64_t v33 = (char *)a2 + v29;
    uint64_t Options = type metadata accessor for InstantWeatherQueryOptions();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, Options))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v32, v33, v7);
        uint64_t v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
        uint64_t v37 = &v32[v36];
        uint64_t v38 = &v33[v36];
        *(void *)uint64_t v37 = *(void *)v38;
        v37[8] = v38[8];
      }
      else
      {
        uint64_t v39 = sub_1A93ABC08();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v32, v33, v39);
      }
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, Options);
    }
    uint64_t v40 = a3[11];
    uint64_t v41 = (char *)a1 + v40;
    uint64_t v42 = (char *)a2 + v40;
    uint64_t v43 = sub_1A93ABDD8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v42, 1, v43))
    {
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
      memcpy(v41, v42, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
      __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v43);
    }
  }
  return a1;
}

char *assignWithCopy for WeatherServiceOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93AB908();
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v12, v13, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  long long v21 = *(_OWORD *)v20;
  v19[16] = v20[16];
  *(_OWORD *)uint64_t v19 = v21;
  uint64_t v22 = a3[7];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  long long v25 = *(_OWORD *)v24;
  v23[16] = v24[16];
  *(_OWORD *)uint64_t v23 = v25;
  uint64_t v26 = a3[8];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v29 = type metadata accessor for WeatherServicePeriodicRelativeRange();
  int v30 = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29);
  if (v30)
  {
    if (!v31)
    {
      uint64_t v32 = sub_1A93ABC08();
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
      v33(v27, v28, v32);
      v33(&v27[*(int *)(v29 + 20)], &v28[*(int *)(v29 + 20)], v32);
      *(void *)&v27[*(int *)(v29 + 24)] = *(void *)&v28[*(int *)(v29 + 24)];
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v29);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    sub_1A91B446C((uint64_t)v27, (void (*)(void))type metadata accessor for WeatherServicePeriodicRelativeRange);
LABEL_18:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
    memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_19;
  }
  uint64_t v50 = sub_1A93ABC08();
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 24);
  v51(v27, v28, v50);
  v51(&v27[*(int *)(v29 + 20)], &v28[*(int *)(v29 + 20)], v50);
  *(void *)&v27[*(int *)(v29 + 24)] = *(void *)&v28[*(int *)(v29 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t v35 = a3[9];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  long long v38 = *(_OWORD *)v37;
  v36[16] = v37[16];
  *(_OWORD *)uint64_t v36 = v38;
  uint64_t v39 = a3[10];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t Options = type metadata accessor for InstantWeatherQueryOptions();
  int v43 = __swift_getEnumTagSinglePayload((uint64_t)v40, 1, Options);
  int v44 = __swift_getEnumTagSinglePayload((uint64_t)v41, 1, Options);
  if (v43)
  {
    if (!v44)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v40, v41, v6);
        uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
        uint64_t v46 = &v40[v45];
        uint64_t v47 = &v41[v45];
        char v48 = v47[8];
        *(void *)uint64_t v46 = *(void *)v47;
        v46[8] = v48;
      }
      else
      {
        uint64_t v56 = sub_1A93ABC08();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v40, v41, v56);
      }
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, Options);
      goto LABEL_36;
    }
LABEL_25:
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
    memcpy(v40, v41, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_36;
  }
  if (v44)
  {
    sub_1A91B446C((uint64_t)v40, (void (*)(void))type metadata accessor for InstantWeatherQueryOptions);
    goto LABEL_25;
  }
  if (a1 != a2)
  {
    sub_1A91B446C((uint64_t)v40, (void (*)(void))type metadata accessor for InstantWeatherQueryOptions);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v40, v41, v6);
      uint64_t v52 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
      uint64_t v53 = &v40[v52];
      uint64_t v54 = &v41[v52];
      char v55 = v54[8];
      *(void *)uint64_t v53 = *(void *)v54;
      v53[8] = v55;
    }
    else
    {
      uint64_t v57 = sub_1A93ABC08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v40, v41, v57);
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_36:
  uint64_t v58 = a3[11];
  uint64_t v59 = &a1[v58];
  uint64_t v60 = &a2[v58];
  uint64_t v61 = sub_1A93ABDD8();
  int v62 = __swift_getEnumTagSinglePayload((uint64_t)v59, 1, v61);
  int v63 = __swift_getEnumTagSinglePayload((uint64_t)v60, 1, v61);
  if (!v62)
  {
    uint64_t v64 = *(void *)(v61 - 8);
    if (!v63)
    {
      (*(void (**)(char *, char *, uint64_t))(v64 + 24))(v59, v60, v61);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v64 + 8))(v59, v61);
    goto LABEL_41;
  }
  if (v63)
  {
LABEL_41:
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v59, v60, *(void *)(*(void *)(v65 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
  __swift_storeEnumTagSinglePayload((uint64_t)v59, 0, 1, v61);
  return a1;
}

char *initializeWithTake for WeatherServiceOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93AB908();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  int v14 = &a1[v12];
  int v15 = &a2[v12];
  long long v16 = *(_OWORD *)v15;
  v14[16] = v15[16];
  *(_OWORD *)int v14 = v16;
  uint64_t v17 = &a1[v13];
  uint64_t v18 = &a2[v13];
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  v17[16] = v18[16];
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  long long v21 = &a2[v19];
  uint64_t v22 = type metadata accessor for WeatherServicePeriodicRelativeRange();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_1A93ABC08();
    long long v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32);
    v25(v20, v21, v24);
    v25(&v20[*(int *)(v22 + 20)], &v21[*(int *)(v22 + 20)], v24);
    *(void *)&v20[*(int *)(v22 + 24)] = *(void *)&v21[*(int *)(v22 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  }
  uint64_t v26 = a3[9];
  uint64_t v27 = a3[10];
  uint64_t v28 = &a1[v26];
  uint64_t v29 = &a2[v26];
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  v28[16] = v29[16];
  int v30 = &a1[v27];
  int v31 = &a2[v27];
  uint64_t Options = type metadata accessor for InstantWeatherQueryOptions();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, Options))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
    memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v30, v31, v6);
      uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
      uint64_t v35 = &v30[v34];
      uint64_t v36 = &v31[v34];
      *(void *)uint64_t v35 = *(void *)v36;
      v35[8] = v36[8];
    }
    else
    {
      uint64_t v37 = sub_1A93ABC08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v30, v31, v37);
    }
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, Options);
  }
  uint64_t v38 = a3[11];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  uint64_t v41 = sub_1A93ABDD8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v41))
  {
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
    __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v41);
  }
  return a1;
}

char *assignWithTake for WeatherServiceOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93AB908();
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v12, v13, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v18];
  long long v21 = &a2[v18];
  long long v22 = *(_OWORD *)v21;
  v20[16] = v21[16];
  *(_OWORD *)uint64_t v20 = v22;
  uint64_t v23 = &a1[v19];
  uint64_t v24 = &a2[v19];
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  v23[16] = v24[16];
  uint64_t v25 = a3[8];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = type metadata accessor for WeatherServicePeriodicRelativeRange();
  int v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v28);
  int v30 = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28);
  if (v29)
  {
    if (!v30)
    {
      uint64_t v31 = sub_1A93ABC08();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
      v32(v26, v27, v31);
      v32(&v26[*(int *)(v28 + 20)], &v27[*(int *)(v28 + 20)], v31);
      *(void *)&v26[*(int *)(v28 + 24)] = *(void *)&v27[*(int *)(v28 + 24)];
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v30)
  {
    sub_1A91B446C((uint64_t)v26, (void (*)(void))type metadata accessor for WeatherServicePeriodicRelativeRange);
LABEL_18:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_19;
  }
  uint64_t v47 = sub_1A93ABC08();
  char v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 40);
  v48(v26, v27, v47);
  v48(&v26[*(int *)(v28 + 20)], &v27[*(int *)(v28 + 20)], v47);
  *(void *)&v26[*(int *)(v28 + 24)] = *(void *)&v27[*(int *)(v28 + 24)];
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t v34 = a3[9];
  uint64_t v35 = a3[10];
  uint64_t v36 = &a1[v34];
  uint64_t v37 = &a2[v34];
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
  v36[16] = v37[16];
  uint64_t v38 = &a1[v35];
  uint64_t v39 = &a2[v35];
  uint64_t Options = type metadata accessor for InstantWeatherQueryOptions();
  int v41 = __swift_getEnumTagSinglePayload((uint64_t)v38, 1, Options);
  int v42 = __swift_getEnumTagSinglePayload((uint64_t)v39, 1, Options);
  if (v41)
  {
    if (!v42)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v38, v39, v6);
        uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
        int v44 = &v38[v43];
        uint64_t v45 = &v39[v43];
        *(void *)int v44 = *(void *)v45;
        v44[8] = v45[8];
      }
      else
      {
        uint64_t v52 = sub_1A93ABC08();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v38, v39, v52);
      }
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, Options);
      goto LABEL_36;
    }
LABEL_25:
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
    memcpy(v38, v39, *(void *)(*(void *)(v46 - 8) + 64));
    goto LABEL_36;
  }
  if (v42)
  {
    sub_1A91B446C((uint64_t)v38, (void (*)(void))type metadata accessor for InstantWeatherQueryOptions);
    goto LABEL_25;
  }
  if (a1 != a2)
  {
    sub_1A91B446C((uint64_t)v38, (void (*)(void))type metadata accessor for InstantWeatherQueryOptions);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v38, v39, v6);
      uint64_t v49 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E97B8160) + 48);
      uint64_t v50 = &v38[v49];
      uint64_t v51 = &v39[v49];
      *(void *)uint64_t v50 = *(void *)v51;
      v50[8] = v51[8];
    }
    else
    {
      uint64_t v53 = sub_1A93ABC08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 32))(v38, v39, v53);
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_36:
  uint64_t v54 = a3[11];
  char v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  uint64_t v57 = sub_1A93ABDD8();
  int v58 = __swift_getEnumTagSinglePayload((uint64_t)v55, 1, v57);
  int v59 = __swift_getEnumTagSinglePayload((uint64_t)v56, 1, v57);
  if (!v58)
  {
    uint64_t v60 = *(void *)(v57 - 8);
    if (!v59)
    {
      (*(void (**)(char *, char *, uint64_t))(v60 + 40))(v55, v56, v57);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v55, v57);
    goto LABEL_41;
  }
  if (v59)
  {
LABEL_41:
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v55, v56, *(void *)(*(void *)(v61 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 32))(v55, v56, v57);
  __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v57);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherServiceOptions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9380DF4);
}

uint64_t sub_1A9380DF4(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_16:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 253)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v15 = a3[8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v17 + 84) == a2)
      {
        uint64_t v8 = v16;
        uint64_t v15 = a3[10];
      }
      else
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
        uint64_t v15 = a3[11];
      }
    }
    uint64_t v9 = a1 + v15;
    goto LABEL_16;
  }
  if (*(unsigned __int8 *)(a1 + a3[7] + 16) <= 2u) {
    int v10 = 2;
  }
  else {
    int v10 = *(unsigned __int8 *)(a1 + a3[7] + 16);
  }
  unsigned int v11 = v10 - 2;
  if (*(unsigned __int8 *)(a1 + a3[7] + 16) >= 2u) {
    return v11;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WeatherServiceOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9380F18);
}

void sub_1A9380F18(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657318);
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 253)
    {
      *(unsigned char *)(a1 + a4[7] + 16) = a2 + 2;
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657048);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657818);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[10];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
        uint64_t v14 = a4[11];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t static WeatherMetadata.mock()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A93ABC08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  int v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v13 - v7;
  if (qword_1E97B7EF0 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_1E97EA4F0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  if (qword_1E97B7EF8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v2, (uint64_t)qword_1E97EA508);
  v10(v5, v11, v2);
  return WeatherMetadata.init(date:expirationDate:latitude:longitude:)((uint64_t)v8, (uint64_t)v5, a1, 37.323, -122.0);
}

uint64_t DayPrecipitationSummary.init(date:precipitationAmount:snowfallAmount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(a4, a1);
  uint64_t v9 = type metadata accessor for DayPrecipitationSummary();
  uint64_t v10 = a4 + *(int *)(v9 + 20);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
  v15(v10, a2, v11);
  uint64_t v13 = a4 + *(int *)(v9 + 24);

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(v13, a3, v11);
}

uint64_t DayPrecipitationSummary.date.getter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPrecipitationSummary.date.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*DayPrecipitationSummary.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPrecipitationSummary.precipitationAmount.getter()
{
  type metadata accessor for DayPrecipitationSummary();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPrecipitationSummary.precipitationAmount.setter()
{
  OUTLINED_FUNCTION_8_40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPrecipitationSummary.precipitationAmount.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPrecipitationSummary.snowfallAmount.getter()
{
  type metadata accessor for DayPrecipitationSummary();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPrecipitationSummary.snowfallAmount.setter()
{
  OUTLINED_FUNCTION_8_40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPrecipitationSummary.snowfallAmount.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t static DayPrecipitationSummary.== infix(_:_:)()
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  type metadata accessor for DayPrecipitationSummary();
  sub_1A91D76FC();
  if ((sub_1A93AB8A8() & 1) == 0) {
    return 0;
  }

  return sub_1A93AB8A8();
}

uint64_t sub_1A9381664(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CB180 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C6166776F6E73 && a2 == 0xEE00746E756F6D41)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A93817C4(char a1)
{
  if (!a1) {
    return 1702125924;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  return 0x6C6C6166776F6E73;
}

uint64_t sub_1A9381824()
{
  return sub_1A93817C4(*v0);
}

uint64_t sub_1A938182C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9381664(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9381854(uint64_t a1)
{
  unint64_t v2 = sub_1A9381A90();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9381890(uint64_t a1)
{
  unint64_t v2 = sub_1A9381A90();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t DayPrecipitationSummary.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC560);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9381A90();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A91EB954(&qword_1EB656220);
  sub_1A93AE478();
  if (!v1)
  {
    type metadata accessor for DayPrecipitationSummary();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    sub_1A91E3368(&qword_1EB656200);
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A9381A90()
{
  unint64_t result = qword_1E97BC568;
  if (!qword_1E97BC568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC568);
  }
  return result;
}

uint64_t DayPrecipitationSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v36 = v3;
  MEMORY[0x1F4188790](v4);
  uint64_t v35 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v37 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v13 - v12;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC570);
  OUTLINED_FUNCTION_2();
  uint64_t v38 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = type metadata accessor for DayPrecipitationSummary();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22 - v21;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9381A90();
  uint64_t v41 = v18;
  uint64_t v24 = (uint64_t)v43;
  sub_1A93AE5C8();
  if (v24) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v33 = v23;
  uint64_t v43 = a1;
  uint64_t v25 = v39;
  char v46 = 0;
  sub_1A91EB954(&qword_1E97B80D0);
  uint64_t v26 = v40;
  sub_1A93AE3C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v33, v26, v9);
  char v45 = 1;
  sub_1A91E3368(&qword_1E97B8138);
  sub_1A93AE3C8();
  uint64_t v32 = v9;
  uint64_t v40 = v19;
  uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v36 + 32);
  v27(v33 + *(int *)(v19 + 20), v8, v25);
  char v44 = 2;
  uint64_t v28 = v35;
  sub_1A93AE3C8();
  OUTLINED_FUNCTION_58();
  v29();
  uint64_t v30 = v33;
  v27(v33 + *(int *)(v40 + 24), v28, v25);
  sub_1A9381F04(v30, v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  return sub_1A9381F68(v30);
}

uint64_t sub_1A9381F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DayPrecipitationSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9381F68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DayPrecipitationSummary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A9381FC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DayPrecipitationSummary.init(from:)(a1, a2);
}

uint64_t sub_1A9381FDC(void *a1)
{
  return DayPrecipitationSummary.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for DayPrecipitationSummary(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[*(int *)(a3 + 24)], &a2[*(int *)(a3 + 24)], v11);
  }
  return a1;
}

uint64_t destroy for DayPrecipitationSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v6 - 8), v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);

  return v9(v7, v6);
}

uint64_t initializeWithCopy for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v10);
  return a1;
}

uint64_t assignWithCopy for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v10);
  return a1;
}

uint64_t initializeWithTake for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v10);
  return a1;
}

uint64_t assignWithTake for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A93825DC);
}

uint64_t sub_1A93825DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for DayPrecipitationSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9382670);
}

uint64_t sub_1A9382670(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

unsigned char *storeEnumTagSinglePayload for DayPrecipitationSummary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A93827C4);
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

ValueMetadata *type metadata accessor for DayPrecipitationSummary.CodingKeys()
{
  return &type metadata for DayPrecipitationSummary.CodingKeys;
}

unint64_t sub_1A9382800()
{
  unint64_t result = qword_1E97BC578;
  if (!qword_1E97BC578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC578);
  }
  return result;
}

unint64_t sub_1A9382850()
{
  unint64_t result = qword_1E97BC580;
  if (!qword_1E97BC580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC580);
  }
  return result;
}

unint64_t sub_1A93828A0()
{
  unint64_t result = qword_1E97BC588;
  if (!qword_1E97BC588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC588);
  }
  return result;
}

uint64_t WeatherSeverity.description.getter()
{
  switch(*v1)
  {
    case 1:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v3 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_34();
      OUTLINED_FUNCTION_0_0();
      goto LABEL_11;
    case 2:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v4 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_34();
      OUTLINED_FUNCTION_4_44();
      goto LABEL_11;
    case 3:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v5 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_34();
      OUTLINED_FUNCTION_0_0();
      goto LABEL_18;
    case 4:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v0 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_1_5();
      goto LABEL_18;
    default:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v2 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_34();
      OUTLINED_FUNCTION_5_36();
LABEL_11:
      OUTLINED_FUNCTION_1_5();
LABEL_18:
      uint64_t v6 = sub_1A93AB9B8();

      return v6;
  }
}

uint64_t WeatherSeverity.accessibilityDescription.getter()
{
  switch(*v1)
  {
    case 1:
      if (qword_1EB656CD0 != -1) {
        goto LABEL_16;
      }
      goto LABEL_14;
    case 2:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v3 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_3_40();
      OUTLINED_FUNCTION_4_44();
      break;
    case 3:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v0 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_0_0();
      break;
    case 4:
      if (qword_1EB656CD0 != -1) {
LABEL_16:
      }
        swift_once();
LABEL_14:
      id v4 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_3_40();
      OUTLINED_FUNCTION_0_0();
      break;
    default:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v2 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_3_40();
      OUTLINED_FUNCTION_5_36();
      break;
  }
  OUTLINED_FUNCTION_1_5();
  uint64_t v5 = sub_1A93AB9B8();

  return v5;
}

WeatherKit::WeatherSeverity_optional __swiftcall WeatherSeverity.init(rawValue:)(Swift::String rawValue)
{
  return (WeatherKit::WeatherSeverity_optional)sub_1A9382FEC(v1);
}

void *static WeatherSeverity.allCases.getter()
{
  return &unk_1EFFAD628;
}

WeatherKit::WeatherSeverity_optional sub_1A9382E24(Swift::String *a1)
{
  return WeatherSeverity.init(rawValue:)(*a1);
}

void sub_1A9382E30(void *a1@<X8>)
{
  *a1 = &unk_1EFFAD628;
}

uint64_t sub_1A9382E44()
{
  return sub_1A93859D0(*v0);
}

uint64_t sub_1A9382E4C(uint64_t a1)
{
  return sub_1A922B244(a1, *v1);
}

uint64_t sub_1A9382E54()
{
  return sub_1A9385B2C();
}

uint64_t WeatherSeverityKind.description.getter()
{
  return sub_1A93ADEA8();
}

uint64_t WeatherSeverityKind.rawValue.getter()
{
  uint64_t result = 0x726F6E696DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6574617265646F6DLL;
      break;
    case 2:
      uint64_t result = 0x657265766573;
      break;
    case 3:
      uint64_t result = 0x656D6572747865;
      break;
    case 4:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

WeatherKit::WeatherSeverityKind_optional __swiftcall WeatherSeverityKind.init(rawValue:)(Swift::String rawValue)
{
  return (WeatherKit::WeatherSeverityKind_optional)sub_1A9382FEC(v1);
}

uint64_t sub_1A9382FEC@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_1A93AE308();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 5;
  if (v2 < 5) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

unint64_t sub_1A9383048()
{
  unint64_t result = qword_1E97BC590;
  if (!qword_1E97BC590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E97BC598);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC590);
  }
  return result;
}

unint64_t sub_1A93830A0()
{
  unint64_t result = qword_1E97BC5A0;
  if (!qword_1E97BC5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5A0);
  }
  return result;
}

uint64_t sub_1A93830EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A91E7BD0(*a1, *a2);
}

unint64_t sub_1A93830FC()
{
  unint64_t result = qword_1E97BC5A8;
  if (!qword_1E97BC5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5A8);
  }
  return result;
}

WeatherKit::WeatherSeverityKind_optional sub_1A9383148(Swift::String *a1)
{
  return WeatherSeverityKind.init(rawValue:)(*a1);
}

uint64_t sub_1A9383154@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherSeverityKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A9383180()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A93831E0()
{
  return sub_1A93ADEE8();
}

uint64_t sub_1A9383230()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A9383290()
{
  return sub_1A93ADEE8();
}

ValueMetadata *type metadata accessor for WeatherSeverity()
{
  return &type metadata for WeatherSeverity;
}

unsigned char *_s10WeatherKit15WeatherSeverityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A93833C4);
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

ValueMetadata *type metadata accessor for WeatherSeverityKind()
{
  return &type metadata for WeatherSeverityKind;
}

unint64_t sub_1A93833FC()
{
  unint64_t result = qword_1E97BC5B0;
  if (!qword_1E97BC5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5B0);
  }
  return result;
}

unint64_t sub_1A9383448()
{
  unint64_t result = qword_1E97BC5B8;
  if (!qword_1E97BC5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5B8);
  }
  return result;
}

BOOL static Deviation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Deviation.hash(into:)()
{
  return sub_1A93AE558();
}

uint64_t sub_1A93834DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x686769486863756DLL && a2 == 0xEA00000000007265;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x726568676968 && a2 == 0xE600000000000000;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C616D726F6ELL && a2 == 0xE600000000000000;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x7265776F6CLL && a2 == 0xE500000000000000;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x65776F4C6863756DLL && a2 == 0xE900000000000072)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_1A93AE4B8();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_1A93836F4(char a1)
{
  uint64_t result = 0x686769486863756DLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x726568676968;
      break;
    case 2:
      uint64_t result = 0x6C616D726F6ELL;
      break;
    case 3:
      uint64_t result = 0x7265776F6CLL;
      break;
    case 4:
      uint64_t result = 0x65776F4C6863756DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A93837A0()
{
  return sub_1A93836F4(*v0);
}

uint64_t sub_1A93837A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93834DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93837D0(uint64_t a1)
{
  unint64_t v2 = sub_1A9383E50();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A938380C(uint64_t a1)
{
  unint64_t v2 = sub_1A9383E50();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9383848(uint64_t a1)
{
  unint64_t v2 = sub_1A9383F80();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9383884(uint64_t a1)
{
  unint64_t v2 = sub_1A9383F80();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A93838C0(uint64_t a1)
{
  unint64_t v2 = sub_1A9383EE8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93838FC(uint64_t a1)
{
  unint64_t v2 = sub_1A9383EE8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9383938(uint64_t a1)
{
  unint64_t v2 = sub_1A9383FCC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9383974(uint64_t a1)
{
  unint64_t v2 = sub_1A9383FCC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A93839B0(uint64_t a1)
{
  unint64_t v2 = sub_1A9383E9C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93839EC(uint64_t a1)
{
  unint64_t v2 = sub_1A9383E9C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9383A28(uint64_t a1)
{
  unint64_t v2 = sub_1A9383F34();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9383A64(uint64_t a1)
{
  unint64_t v2 = sub_1A9383F34();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Deviation.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5C0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_5_37(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5C8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5D0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5D8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5E0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC5E8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9383E50();
  sub_1A93AE5D8();
  switch(v10)
  {
    case 1:
      sub_1A9383F80();
      OUTLINED_FUNCTION_4_45();
      goto LABEL_8;
    case 2:
      sub_1A9383F34();
      OUTLINED_FUNCTION_4_45();
      goto LABEL_7;
    case 3:
      sub_1A9383EE8();
      OUTLINED_FUNCTION_4_45();
      goto LABEL_7;
    case 4:
      sub_1A9383E9C();
      OUTLINED_FUNCTION_4_45();
LABEL_7:
      OUTLINED_FUNCTION_8_41();
LABEL_8:
      OUTLINED_FUNCTION_27();
      v12();
      break;
    default:
      sub_1A9383FCC();
      sub_1A93AE3F8();
      OUTLINED_FUNCTION_27();
      v11();
      break;
  }
  OUTLINED_FUNCTION_27();
  return v13();
}

unint64_t sub_1A9383E50()
{
  unint64_t result = qword_1E97BC5F0;
  if (!qword_1E97BC5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5F0);
  }
  return result;
}

unint64_t sub_1A9383E9C()
{
  unint64_t result = qword_1E97BC5F8;
  if (!qword_1E97BC5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC5F8);
  }
  return result;
}

unint64_t sub_1A9383EE8()
{
  unint64_t result = qword_1E97BC600;
  if (!qword_1E97BC600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC600);
  }
  return result;
}

unint64_t sub_1A9383F34()
{
  unint64_t result = qword_1E97BC608;
  if (!qword_1E97BC608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC608);
  }
  return result;
}

unint64_t sub_1A9383F80()
{
  unint64_t result = qword_1E97BC610;
  if (!qword_1E97BC610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC610);
  }
  return result;
}

unint64_t sub_1A9383FCC()
{
  unint64_t result = qword_1E97BC618;
  if (!qword_1E97BC618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC618);
  }
  return result;
}

uint64_t Deviation.hashValue.getter()
{
  return sub_1A93AE578();
}

uint64_t Deviation.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC620);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC628);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_5_37(v5, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC630);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC638);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC640);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC648);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14 - v13;
  uint64_t v36 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9383E50();
  sub_1A93AE5C8();
  if (v37) {
    return __swift_destroy_boxed_opaque_existential_1(v36);
  }
  uint64_t v16 = sub_1A93AE3D8();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    uint64_t v25 = v15;
LABEL_9:
    uint64_t v26 = sub_1A93AE278();
    swift_allocError();
    uint64_t v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B86C0);
    *uint64_t v28 = &type metadata for Deviation;
    sub_1A93AE328();
    sub_1A93AE268();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x1E4FBBA70], v26);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v25, v9);
    return __swift_destroy_boxed_opaque_existential_1(v36);
  }
  uint64_t v34 = v9;
  uint64_t v18 = v15;
  uint64_t v19 = *(unsigned __int8 *)(v16 + 32);
  sub_1A921AB10(1, v17, v16, v16 + 32, 0, (2 * v17) | 1);
  uint64_t v21 = v20;
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  if (v21 != v23 >> 1)
  {
    uint64_t v25 = v18;
    uint64_t v9 = v34;
    goto LABEL_9;
  }
  switch(v19)
  {
    case 1:
      uint64_t v24 = a2;
      sub_1A9383F80();
      sub_1A93AE318();
      goto LABEL_6;
    case 2:
      uint64_t v24 = a2;
      sub_1A9383F34();
      OUTLINED_FUNCTION_2_35();
      goto LABEL_6;
    case 3:
      uint64_t v24 = a2;
      sub_1A9383EE8();
      OUTLINED_FUNCTION_2_35();
      goto LABEL_6;
    case 4:
      uint64_t v24 = a2;
      sub_1A9383E9C();
      OUTLINED_FUNCTION_2_35();
      OUTLINED_FUNCTION_8_41();
      goto LABEL_15;
    default:
      uint64_t v24 = a2;
      sub_1A9383FCC();
      OUTLINED_FUNCTION_2_35();
LABEL_6:
      OUTLINED_FUNCTION_8_41();
LABEL_15:
      OUTLINED_FUNCTION_27();
      v30();
      swift_unknownObjectRelease();
      uint64_t v31 = OUTLINED_FUNCTION_6_31();
      v32(v31);
      *uint64_t v24 = v19;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      break;
  }
  return result;
}

uint64_t sub_1A93845F4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return Deviation.init(from:)(a1, a2);
}

uint64_t sub_1A938460C(void *a1)
{
  return Deviation.encode(to:)(a1);
}

unint64_t sub_1A938462C()
{
  unint64_t result = qword_1E97BC650;
  if (!qword_1E97BC650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC650);
  }
  return result;
}

unsigned char *sub_1A938467C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9384748);
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

ValueMetadata *type metadata accessor for Deviation.CodingKeys()
{
  return &type metadata for Deviation.CodingKeys;
}

ValueMetadata *type metadata accessor for Deviation.MuchHigherCodingKeys()
{
  return &type metadata for Deviation.MuchHigherCodingKeys;
}

ValueMetadata *type metadata accessor for Deviation.HigherCodingKeys()
{
  return &type metadata for Deviation.HigherCodingKeys;
}

ValueMetadata *type metadata accessor for Deviation.NormalCodingKeys()
{
  return &type metadata for Deviation.NormalCodingKeys;
}

ValueMetadata *type metadata accessor for Deviation.LowerCodingKeys()
{
  return &type metadata for Deviation.LowerCodingKeys;
}

ValueMetadata *type metadata accessor for Deviation.MuchLowerCodingKeys()
{
  return &type metadata for Deviation.MuchLowerCodingKeys;
}

unint64_t sub_1A93847D4()
{
  unint64_t result = qword_1E97BC658;
  if (!qword_1E97BC658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC658);
  }
  return result;
}

unint64_t sub_1A9384824()
{
  unint64_t result = qword_1E97BC660;
  if (!qword_1E97BC660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC660);
  }
  return result;
}

unint64_t sub_1A9384874()
{
  unint64_t result = qword_1E97BC668;
  if (!qword_1E97BC668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC668);
  }
  return result;
}

unint64_t sub_1A93848C4()
{
  unint64_t result = qword_1E97BC670;
  if (!qword_1E97BC670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC670);
  }
  return result;
}

unint64_t sub_1A9384914()
{
  unint64_t result = qword_1E97BC678;
  if (!qword_1E97BC678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC678);
  }
  return result;
}

unint64_t sub_1A9384964()
{
  unint64_t result = qword_1E97BC680;
  if (!qword_1E97BC680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC680);
  }
  return result;
}

unint64_t sub_1A93849B4()
{
  unint64_t result = qword_1E97BC688;
  if (!qword_1E97BC688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC688);
  }
  return result;
}

unint64_t sub_1A9384A04()
{
  unint64_t result = qword_1E97BC690;
  if (!qword_1E97BC690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC690);
  }
  return result;
}

unint64_t sub_1A9384A54()
{
  unint64_t result = qword_1E97BC698;
  if (!qword_1E97BC698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC698);
  }
  return result;
}

unint64_t sub_1A9384AA4()
{
  unint64_t result = qword_1E97BC6A0;
  if (!qword_1E97BC6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6A0);
  }
  return result;
}

unint64_t sub_1A9384AF4()
{
  unint64_t result = qword_1E97BC6A8;
  if (!qword_1E97BC6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6A8);
  }
  return result;
}

unint64_t sub_1A9384B44()
{
  unint64_t result = qword_1E97BC6B0;
  if (!qword_1E97BC6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6B0);
  }
  return result;
}

unint64_t sub_1A9384B94()
{
  unint64_t result = qword_1E97BC6B8;
  if (!qword_1E97BC6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6B8);
  }
  return result;
}

uint64_t MoonPhase.accessibilityDescription.getter(char a1)
{
  switch(a1)
  {
    case 1:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v3 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_8_42();
      OUTLINED_FUNCTION_0_0();
      goto LABEL_24;
    case 2:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v4 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_36();
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_6_32();
      goto LABEL_25;
    case 3:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v5 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_8_42();
      OUTLINED_FUNCTION_0_0();
      goto LABEL_25;
    case 4:
      if (qword_1EB656CD0 == -1) {
        goto LABEL_3;
      }
      goto LABEL_26;
    case 5:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v1 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_5_38();
      goto LABEL_25;
    case 6:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v6 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_36();
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_10_28(0x71207473616CLL);
      goto LABEL_25;
    case 7:
      if (qword_1EB656CD0 != -1) {
        swift_once();
      }
      id v7 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_36();
      OUTLINED_FUNCTION_5_38();
LABEL_24:
      OUTLINED_FUNCTION_7_33();
      goto LABEL_25;
    default:
      if (qword_1EB656CD0 == -1) {
        goto LABEL_3;
      }
LABEL_26:
      swift_once();
LABEL_3:
      id v2 = (id)qword_1EB6623C0;
      OUTLINED_FUNCTION_2_36();
      OUTLINED_FUNCTION_0_0();
LABEL_25:
      OUTLINED_FUNCTION_1_5();
      uint64_t v8 = sub_1A93AB9B8();

      return v8;
  }
}

WeatherKit::MoonPhase_optional __swiftcall MoonPhase.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_1A93AE308();
  swift_bridgeObjectRelease();
  if (v1 >= 8) {
    return (WeatherKit::MoonPhase_optional)8;
  }
  else {
    return (WeatherKit::MoonPhase_optional)v1;
  }
}

void *static MoonPhase.allCases.getter()
{
  return &unk_1EFFAD7C8;
}

unint64_t sub_1A938504C()
{
  unint64_t result = qword_1E97BC6C0;
  if (!qword_1E97BC6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6C0);
  }
  return result;
}

uint64_t sub_1A9385098()
{
  return sub_1A9385A30(*v0);
}

uint64_t sub_1A93850A0()
{
  return sub_1A922AAD0();
}

uint64_t sub_1A93850A8()
{
  return sub_1A93862AC();
}

WeatherKit::MoonPhase_optional sub_1A93850B0@<W0>(Swift::String *a1@<X0>, WeatherKit::MoonPhase_optional *a2@<X8>)
{
  result.value = MoonPhase.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_1A93850E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MoonPhase.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1A938510C()
{
  return MoonPhase.description.getter(*v0);
}

unint64_t sub_1A9385118()
{
  unint64_t result = qword_1E97BC6C8;
  if (!qword_1E97BC6C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1E97BC6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC6C8);
  }
  return result;
}

void sub_1A938516C(void *a1@<X8>)
{
  *a1 = &unk_1EFFAD7C8;
}

uint64_t sub_1A938517C(unsigned __int8 *a1, char *a2)
{
  return sub_1A91E6FF0(*a1, *a2);
}

uint64_t sub_1A9385188()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A93851E8()
{
  return sub_1A93ADEE8();
}

uint64_t getEnumTagSinglePayload for MoonPhase(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MoonPhase(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1A938538CLL);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MoonPhase()
{
  return &type metadata for MoonPhase;
}

unint64_t sub_1A93853C4()
{
  unint64_t result = qword_1EB656040;
  if (!qword_1EB656040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656040);
  }
  return result;
}

uint64_t sub_1A9385410()
{
  uint64_t v1 = sub_1A93AD528();
  __n128 v2 = MEMORY[0x1F4188790](v1);
  (*(void (**)(char *, uint64_t, __n128))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v0, v2);
  return sub_1A93AE0D8();
}

uint64_t static HourlyWeatherStatisticsQuery.temperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FB57E0];
  uint64_t v3 = sub_1A93AD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(a1, v2, v3);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BA678);
  uint64_t v5 = (void (**)())(a1 + *(int *)(result + 52));
  *uint64_t v5 = sub_1A9385580;
  v5[1] = 0;
  return result;
}

void sub_1A9385580()
{
}

uint64_t sub_1A93855A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A93855B8);
}

uint64_t sub_1A93855B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93AD528();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_1A9385644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9385658);
}

void sub_1A9385658(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93AD528();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for HourlyWeatherStatisticsQuery()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A93856F8(uint64_t a1)
{
  return sub_1A93859E8(a1, (void (*)(unsigned char *, uint64_t))sub_1A922B4A0);
}

uint64_t sub_1A9385710()
{
  return sub_1A9385FFC();
}

uint64_t sub_1A938571C()
{
  return sub_1A938609C();
}

uint64_t sub_1A9385750()
{
  return sub_1A9385A98();
}

uint64_t sub_1A938575C()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385790()
{
  return sub_1A93860EC();
}

uint64_t sub_1A93857B0(uint64_t a1)
{
  return sub_1A9385A48(a1, (void (*)(uint64_t))UVIndex.ExposureCategory.rawValue.getter);
}

uint64_t sub_1A93857C8()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385814()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385858()
{
  return sub_1A938609C();
}

uint64_t sub_1A938588C()
{
  return sub_1A9385FA0();
}

uint64_t sub_1A93858AC()
{
  return sub_1A9385DC8();
}

uint64_t sub_1A93858CC()
{
  return sub_1A93AE578();
}

uint64_t sub_1A938590C(uint64_t a1)
{
  return sub_1A93859E8(a1, (void (*)(unsigned char *, uint64_t))sub_1A922B2A8);
}

uint64_t sub_1A9385924()
{
  return sub_1A9385C28();
}

uint64_t sub_1A9385944()
{
  return sub_1A9386240();
}

uint64_t sub_1A9385964()
{
  return sub_1A93861A0();
}

uint64_t sub_1A9385970(uint64_t a1)
{
  return sub_1A93859E8(a1, (void (*)(unsigned char *, uint64_t))sub_1A9194ACC);
}

uint64_t sub_1A9385988()
{
  return sub_1A9385D40();
}

uint64_t sub_1A9385994(uint64_t a1)
{
  return sub_1A9385A48(a1, (void (*)(uint64_t))Wind.CompassDirection.rawValue.getter);
}

uint64_t sub_1A93859AC()
{
  return sub_1A9385F44();
}

uint64_t sub_1A93859B8()
{
  return sub_1A9385EC0();
}

uint64_t sub_1A93859C4()
{
  return sub_1A9385E3C();
}

uint64_t sub_1A93859D0(uint64_t a1)
{
  return sub_1A93859E8(a1, (void (*)(unsigned char *, uint64_t))sub_1A922B244);
}

uint64_t sub_1A93859E8(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_7_34();
  a2(v5, a1);
  return sub_1A93AE578();
}

uint64_t sub_1A9385A30(uint64_t a1)
{
  return sub_1A9385A48(a1, (void (*)(uint64_t))MoonPhase.rawValue.getter);
}

uint64_t sub_1A9385A48(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385A98()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385B14()
{
  return sub_1A9385D00();
}

uint64_t sub_1A9385B2C()
{
  return sub_1A9385D00();
}

uint64_t sub_1A9385B44()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385B8C()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385BD4()
{
  return sub_1A9385D00();
}

uint64_t sub_1A9385BEC()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385C28()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385C84()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385CC8()
{
  return sub_1A938609C();
}

uint64_t sub_1A9385CE8()
{
  return sub_1A9385D00();
}

uint64_t sub_1A9385D00()
{
  OUTLINED_FUNCTION_10_29();
  v0(v3, v1);
  return sub_1A93AE578();
}

uint64_t sub_1A9385D40()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385DC8()
{
  OUTLINED_FUNCTION_1_32();
  if (v0) {
    OUTLINED_FUNCTION_3_41();
  }
  OUTLINED_FUNCTION_6_33();
  swift_bridgeObjectRelease();
  return sub_1A93AE578();
}

uint64_t sub_1A9385E3C()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385EC0()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385F44()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385FA0()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9385FFC()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9386084()
{
  return sub_1A938609C();
}

uint64_t sub_1A938609C()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_29();
  v0(v1);
  OUTLINED_FUNCTION_5_39();
  swift_bridgeObjectRelease();
  return sub_1A93AE578();
}

uint64_t sub_1A93860EC()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9386170()
{
  return sub_1A93862C4();
}

uint64_t sub_1A9386188()
{
  return sub_1A93862C4();
}

uint64_t sub_1A93861A0()
{
  return sub_1A93AE578();
}

uint64_t sub_1A9386240()
{
  return sub_1A93AE578();
}

uint64_t sub_1A93862AC()
{
  return sub_1A93862C4();
}

uint64_t sub_1A93862C4()
{
  OUTLINED_FUNCTION_10_29();
  v0(v1);
  OUTLINED_FUNCTION_5_39();
  swift_bridgeObjectRelease();
  return sub_1A93AE578();
}

uint64_t static AirQualityData.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = type metadata accessor for AirQuality();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for AirQualityData();
  uint64_t v12 = OUTLINED_FUNCTION_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_6();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6595D8);
  uint64_t v14 = OUTLINED_FUNCTION_1(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_16();
  uint64_t v16 = v2 + *(int *)(v15 + 56);
  sub_1A9386570(a1, v2);
  sub_1A9386570(a2, v16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    sub_1A9386570(v2, v3);
    if (!OUTLINED_FUNCTION_7_0())
    {
      sub_1A9386974(v16, v10, (void (*)(void))type metadata accessor for AirQuality);
      char v18 = static AirQuality.== infix(_:_:)();
      sub_1A9388CEC(v10, (void (*)(void))type metadata accessor for AirQuality);
      sub_1A9388CEC(v3, (void (*)(void))type metadata accessor for AirQuality);
      sub_1A9388CEC(v2, (void (*)(void))type metadata accessor for AirQualityData);
      return v18 & 1;
    }
    sub_1A9388CEC(v3, (void (*)(void))type metadata accessor for AirQuality);
    goto LABEL_9;
  }
  if (EnumTagSinglePayload == 1)
  {
    if (OUTLINED_FUNCTION_7_0() != 1) {
      goto LABEL_9;
    }
  }
  else if (OUTLINED_FUNCTION_7_0() != 2)
  {
LABEL_9:
    sub_1A93865D4(v2);
    char v18 = 0;
    return v18 & 1;
  }
  sub_1A9388CEC(v2, (void (*)(void))type metadata accessor for AirQualityData);
  char v18 = 1;
  return v18 & 1;
}

uint64_t type metadata accessor for AirQualityData()
{
  uint64_t result = qword_1EB659668;
  if (!qword_1EB659668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A9386570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirQualityData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A93865D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6595D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AirQualityData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = type metadata accessor for AirQuality();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC758);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = type metadata accessor for AirQualityData();
  uint64_t v9 = OUTLINED_FUNCTION_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_5_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93868DC();
  sub_1A93AE5C8();
  if (!v3)
  {
    sub_1A9386928();
    sub_1A93AE3C8();
    if (v21)
    {
      uint64_t v10 = v19;
      uint64_t v11 = OUTLINED_FUNCTION_0_12();
      v12(v11);
      if (v21 == 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      uint64_t v16 = a2;
    }
    else
    {
      sub_1A9386CC4(&qword_1E97B8F48);
      uint64_t v18 = v2;
      uint64_t v10 = v19;
      sub_1A93AE3C8();
      uint64_t v14 = OUTLINED_FUNCTION_0_12();
      v15(v14);
      sub_1A9386974(v18, v4, (void (*)(void))type metadata accessor for AirQuality);
      uint64_t v13 = 0;
      uint64_t v16 = a2;
    }
    __swift_storeEnumTagSinglePayload(v4, v13, 2, v10);
    sub_1A9386974(v4, v16, (void (*)(void))type metadata accessor for AirQualityData);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1A93868DC()
{
  unint64_t result = qword_1EB6595E0;
  if (!qword_1EB6595E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6595E0);
  }
  return result;
}

unint64_t sub_1A9386928()
{
  unint64_t result = qword_1E97BC760;
  if (!qword_1E97BC760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC760);
  }
  return result;
}

uint64_t sub_1A9386974(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t AirQualityData.encode(to:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = type metadata accessor for AirQuality();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v9 - v8;
  uint64_t v10 = type metadata accessor for AirQualityData();
  uint64_t v11 = OUTLINED_FUNCTION_1(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_5_6();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6595E8);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93868DC();
  sub_1A93AE5D8();
  sub_1A9386570(v4, v3);
  if (__swift_getEnumTagSinglePayload(v3, 2, v6))
  {
    sub_1A9386C78();
    sub_1A93AE478();
  }
  else
  {
    sub_1A9386974(v3, v17, (void (*)(void))type metadata accessor for AirQuality);
    sub_1A9386C78();
    sub_1A93AE478();
    if (!v18)
    {
      sub_1A9386CC4(&qword_1EB655C70);
      sub_1A93AE478();
    }
    sub_1A9388CEC(v17, (void (*)(void))type metadata accessor for AirQuality);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v2, v12);
}

unint64_t sub_1A9386C78()
{
  unint64_t result = qword_1EB6595F0;
  if (!qword_1EB6595F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6595F0);
  }
  return result;
}

uint64_t sub_1A9386CC4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AirQuality();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A9386D08()
{
  uint64_t v0 = sub_1A93AE308();
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

uint64_t sub_1A9386D60()
{
  unint64_t v0 = sub_1A93AE308();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A9386DAC(char a1)
{
  if (!a1) {
    return 0x6C62616C69617661;
  }
  OUTLINED_FUNCTION_3_41();
  if (v3) {
    return v1;
  }
  else {
    return v2;
  }
}

uint64_t sub_1A9386DF0()
{
  return sub_1A9385FA0();
}

uint64_t sub_1A9386E0C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A9386D08();
  *a1 = result;
  return result;
}

uint64_t sub_1A9386E3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A9386D5C();
  *a1 = result;
  return result;
}

uint64_t sub_1A9386E64(uint64_t a1)
{
  unint64_t v2 = sub_1A93868DC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9386EA0(uint64_t a1)
{
  unint64_t v2 = sub_1A93868DC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9386EDC()
{
  return sub_1A9385DC8();
}

uint64_t sub_1A9386EF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A9386D60();
  *a1 = result;
  return result;
}

uint64_t sub_1A9386F28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A9386DAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1A9386F54()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A9386FB4()
{
  return sub_1A93ADEE8();
}

uint64_t sub_1A9387004@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AirQualityData.init(from:)(a1, a2);
}

uint64_t sub_1A938701C(void *a1)
{
  return AirQualityData.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AirQualityData(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = (int *)type metadata accessor for AirQuality();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, (uint64_t)v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_1A93ABC08();
      uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
      v10((char *)a1, (char *)a2, v9);
      uint64_t v64 = v10;
      uint64_t v65 = v9;
      v10((char *)a1 + v7[5], (char *)a2 + v7[5], v9);
      uint64_t v11 = v7[6];
      uint64_t v12 = (uint64_t *)((char *)a1 + v11);
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v63 = v13[1];
      void *v12 = *v13;
      v12[1] = v63;
      uint64_t v14 = v7[7];
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = *((void *)v16 + 1);
      *(void *)uint64_t v15 = *(void *)v16;
      *((void *)v15 + 1) = v17;
      uint64_t v18 = *((void *)v16 + 3);
      *((void *)v15 + 2) = *((void *)v16 + 2);
      *((void *)v15 + 3) = v18;
      uint64_t v19 = *((void *)v16 + 5);
      *((void *)v15 + 4) = *((void *)v16 + 4);
      *((void *)v15 + 5) = v19;
      uint64_t v20 = *((void *)v16 + 7);
      *((void *)v15 + 6) = *((void *)v16 + 6);
      *((void *)v15 + 7) = v20;
      uint64_t v21 = *((void *)v16 + 9);
      *((void *)v15 + 8) = *((void *)v16 + 8);
      *((void *)v15 + 9) = v21;
      v15[80] = v16[80];
      *(_OWORD *)(v15 + 88) = *(_OWORD *)(v16 + 88);
      uint64_t v62 = *((void *)v16 + 14);
      *((void *)v15 + 13) = *((void *)v16 + 13);
      *((void *)v15 + 14) = v62;
      *(uint64_t *)((char *)a1 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
      uint64_t v22 = v7[9];
      unint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      uint64_t v25 = *((void *)v24 + 1);
      *(void *)unint64_t v23 = *(void *)v24;
      *((void *)v23 + 1) = v25;
      *((_OWORD *)v23 + 1) = *((_OWORD *)v24 + 1);
      uint64_t v26 = *((void *)v24 + 5);
      *((void *)v23 + 4) = *((void *)v24 + 4);
      *((void *)v23 + 5) = v26;
      *((void *)v23 + 6) = *((void *)v24 + 6);
      *(_OWORD *)(v23 + 56) = *(_OWORD *)(v24 + 56);
      uint64_t v27 = *((void *)v24 + 10);
      *((void *)v23 + 9) = *((void *)v24 + 9);
      *((void *)v23 + 10) = v27;
      *((unsigned char *)a1 + v7[10]) = *((unsigned char *)a2 + v7[10]);
      uint64_t v28 = v7[11];
      __dst = (uint64_t *)((char *)a1 + v28);
      int v29 = (uint64_t *)((char *)a2 + v28);
      uint64_t v61 = type metadata accessor for ProviderAttribution();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, v61))
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60);
        memcpy(__dst, v29, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        uint64_t v31 = v29[1];
        void *__dst = *v29;
        __dst[1] = v31;
        uint64_t v32 = *(int *)(v61 + 20);
        uint64_t v33 = (char *)__dst + v32;
        uint64_t v34 = (char *)v29 + v32;
        uint64_t v35 = sub_1A93ABA18();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
        {
          uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
          memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
          __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v61);
      }
      uint64_t v37 = v7[12];
      uint64_t v38 = (char *)a1 + v37;
      uint64_t v39 = (char *)a2 + v37;
      uint64_t v40 = sub_1A93ABA18();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
      *(uint64_t *)((char *)a1 + v7[13]) = *(uint64_t *)((char *)a2 + v7[13]);
      uint64_t v41 = v7[14];
      uint64_t v42 = (char *)a1 + v41;
      uint64_t v43 = (char *)a2 + v41;
      uint64_t v44 = type metadata accessor for AirPollutant();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v43, 1, v44))
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
        memcpy(v42, v43, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        unsigned char *v42 = *v43;
        uint64_t v46 = *(int *)(v44 + 20);
        uint64_t v47 = &v42[v46];
        char v48 = &v43[v46];
        type metadata accessor for AirPollutantMeasurement();
        if (swift_getEnumCaseMultiPayload() == 1) {
          uint64_t v49 = &qword_1EB655290;
        }
        else {
          uint64_t v49 = &qword_1EB6569E8;
        }
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(v49);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v50 - 8) + 16))(v47, v48, v50);
        swift_storeEnumTagMultiPayload();
        v42[*(int *)(v44 + 24)] = v43[*(int *)(v44 + 24)];
        __swift_storeEnumTagSinglePayload((uint64_t)v42, 0, 1, v44);
      }
      *((unsigned char *)a1 + v7[15]) = *((unsigned char *)a2 + v7[15]);
      uint64_t v51 = v7[16];
      uint64_t v52 = (char *)a1 + v51;
      uint64_t v53 = (char *)a2 + v51;
      char *v52 = *v53;
      uint64_t v54 = *((void *)v53 + 2);
      *((void *)v52 + 1) = *((void *)v53 + 1);
      *((void *)v52 + 2) = v54;
      uint64_t v55 = v7[17];
      uint64_t v56 = (char *)a1 + v55;
      uint64_t v57 = (char *)a2 + v55;
      swift_bridgeObjectRetain();
      v64(v56, v57, v65);
      int v58 = (int *)type metadata accessor for WeatherMetadata();
      v64(&v56[v58[5]], &v57[v58[5]], v65);
      *(void *)&v56[v58[6]] = *(void *)&v57[v58[6]];
      *(void *)&v56[v58[7]] = *(void *)&v57[v58[7]];
      *(void *)&v56[v58[8]] = *(void *)&v57[v58[8]];
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, (uint64_t)v7);
    }
  }
  return a1;
}

uint64_t destroy for AirQualityData(uint64_t a1)
{
  unint64_t v2 = (int *)type metadata accessor for AirQuality();
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 2, (uint64_t)v2);
  if (!result)
  {
    uint64_t v4 = sub_1A93ABC08();
    int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    v5(a1, v4);
    v5(a1 + v2[5], v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1 + v2[11];
    uint64_t v7 = type metadata accessor for ProviderAttribution();
    if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v6 + *(int *)(v7 + 20);
      uint64_t v9 = sub_1A93ABA18();
      if (!__swift_getEnumTagSinglePayload(v8, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
      }
    }
    uint64_t v10 = a1 + v2[12];
    uint64_t v11 = sub_1A93ABA18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = a1 + v2[14];
    uint64_t v13 = type metadata accessor for AirPollutant();
    if (!__swift_getEnumTagSinglePayload(v12, 1, v13))
    {
      uint64_t v14 = v12 + *(int *)(v13 + 20);
      type metadata accessor for AirPollutantMeasurement();
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v15 = &qword_1EB655290;
      }
      else {
        uint64_t v15 = &qword_1EB6569E8;
      }
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v14, v16);
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = a1 + v2[17];
    v5(v17, v4);
    uint64_t v18 = type metadata accessor for WeatherMetadata();
    v5(v17 + *(int *)(v18 + 20), v4);
    return swift_release();
  }
  return result;
}

char *initializeWithCopy for AirQualityData(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for AirQuality();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v62 = v8;
    uint64_t v63 = v7;
    v8(&a1[v6[5]], &a2[v6[5]], v7);
    uint64_t v9 = v6[6];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v60 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v60;
    uint64_t v12 = v6[7];
    uint64_t v13 = &a1[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = *((void *)v14 + 1);
    *(void *)uint64_t v13 = *(void *)v14;
    *((void *)v13 + 1) = v15;
    uint64_t v16 = *((void *)v14 + 3);
    *((void *)v13 + 2) = *((void *)v14 + 2);
    *((void *)v13 + 3) = v16;
    uint64_t v17 = *((void *)v14 + 5);
    *((void *)v13 + 4) = *((void *)v14 + 4);
    *((void *)v13 + 5) = v17;
    uint64_t v18 = *((void *)v14 + 7);
    *((void *)v13 + 6) = *((void *)v14 + 6);
    *((void *)v13 + 7) = v18;
    uint64_t v19 = *((void *)v14 + 9);
    *((void *)v13 + 8) = *((void *)v14 + 8);
    *((void *)v13 + 9) = v19;
    v13[80] = v14[80];
    *(_OWORD *)(v13 + 88) = *(_OWORD *)(v14 + 88);
    uint64_t v59 = *((void *)v14 + 14);
    *((void *)v13 + 13) = *((void *)v14 + 13);
    *((void *)v13 + 14) = v59;
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    uint64_t v20 = v6[9];
    uint64_t v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = *((void *)v22 + 1);
    *(void *)uint64_t v21 = *(void *)v22;
    *((void *)v21 + 1) = v23;
    *((_OWORD *)v21 + 1) = *((_OWORD *)v22 + 1);
    uint64_t v24 = *((void *)v22 + 5);
    *((void *)v21 + 4) = *((void *)v22 + 4);
    *((void *)v21 + 5) = v24;
    *((void *)v21 + 6) = *((void *)v22 + 6);
    *(_OWORD *)(v21 + 56) = *(_OWORD *)(v22 + 56);
    uint64_t v25 = *((void *)v22 + 10);
    *((void *)v21 + 9) = *((void *)v22 + 9);
    *((void *)v21 + 10) = v25;
    a1[v6[10]] = a2[v6[10]];
    uint64_t v26 = v6[11];
    __dst = &a1[v26];
    uint64_t v27 = &a2[v26];
    uint64_t v58 = type metadata accessor for ProviderAttribution();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v58))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60);
      memcpy(__dst, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      uint64_t v29 = *((void *)v27 + 1);
      *(void *)__dst = *(void *)v27;
      *((void *)__dst + 1) = v29;
      uint64_t v30 = *(int *)(v58 + 20);
      uint64_t v31 = &__dst[v30];
      uint64_t v32 = &v27[v30];
      uint64_t v33 = sub_1A93ABA18();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
        memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
        __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v58);
    }
    uint64_t v35 = v6[12];
    uint64_t v36 = &a1[v35];
    uint64_t v37 = &a2[v35];
    uint64_t v38 = sub_1A93ABA18();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
    uint64_t v39 = v6[14];
    uint64_t v40 = &a1[v39];
    uint64_t v41 = &a2[v39];
    uint64_t v42 = type metadata accessor for AirPollutant();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v42))
    {
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
      memcpy(v40, v41, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      *uint64_t v40 = *v41;
      uint64_t v44 = *(int *)(v42 + 20);
      uint64_t v45 = &v40[v44];
      uint64_t v46 = &v41[v44];
      type metadata accessor for AirPollutantMeasurement();
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v47 = &qword_1EB655290;
      }
      else {
        uint64_t v47 = &qword_1EB6569E8;
      }
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(v47);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v45, v46, v48);
      swift_storeEnumTagMultiPayload();
      v40[*(int *)(v42 + 24)] = v41[*(int *)(v42 + 24)];
      __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v42);
    }
    a1[v6[15]] = a2[v6[15]];
    uint64_t v49 = v6[16];
    uint64_t v50 = &a1[v49];
    uint64_t v51 = &a2[v49];
    char *v50 = *v51;
    uint64_t v52 = *((void *)v51 + 2);
    *((void *)v50 + 1) = *((void *)v51 + 1);
    *((void *)v50 + 2) = v52;
    uint64_t v53 = v6[17];
    uint64_t v54 = &a1[v53];
    uint64_t v55 = &a2[v53];
    swift_bridgeObjectRetain();
    v62(v54, v55, v63);
    uint64_t v56 = (int *)type metadata accessor for WeatherMetadata();
    v62(&v54[v56[5]], &v55[v56[5]], v63);
    *(void *)&v54[v56[6]] = *(void *)&v55[v56[6]];
    *(void *)&v54[v56[7]] = *(void *)&v55[v56[7]];
    *(void *)&v54[v56[8]] = *(void *)&v55[v56[8]];
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, (uint64_t)v6);
  }
  return a1;
}

char *assignWithCopy for AirQualityData(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for AirQuality();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_1A9388CEC((uint64_t)a1, (void (*)(void))type metadata accessor for AirQuality);
      goto LABEL_7;
    }
    uint64_t v24 = sub_1A93ABC08();
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24);
    v25(a1, a2, v24);
    uint64_t v114 = v25;
    v25(&a1[v6[5]], &a2[v6[5]], v24);
    uint64_t v26 = v6[6];
    uint64_t v27 = &a1[v26];
    uint64_t v28 = &a2[v26];
    *(void *)uint64_t v27 = *(void *)v28;
    *((void *)v27 + 1) = *((void *)v28 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v29 = v6[7];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    *(void *)uint64_t v30 = *(void *)&a2[v29];
    *((void *)v30 + 1) = *(void *)&a2[v29 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v30 + 2) = *((void *)v31 + 2);
    *((void *)v30 + 3) = *((void *)v31 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v30 + 4) = *((void *)v31 + 4);
    *((void *)v30 + 5) = *((void *)v31 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v30 + 6) = *((void *)v31 + 6);
    *((void *)v30 + 7) = *((void *)v31 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v30 + 8) = *((void *)v31 + 8);
    *((void *)v30 + 9) = *((void *)v31 + 9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v30[80] = v31[80];
    *((void *)v30 + 11) = *((void *)v31 + 11);
    *((void *)v30 + 12) = *((void *)v31 + 12);
    *((void *)v30 + 13) = *((void *)v31 + 13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v30 + 14) = *((void *)v31 + 14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    uint64_t v32 = v6[9];
    uint64_t v33 = &a1[v32];
    uint64_t v34 = &a2[v32];
    *(void *)uint64_t v33 = *(void *)&a2[v32];
    *((void *)v33 + 1) = *(void *)&a2[v32 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v33 + 2) = *((void *)v34 + 2);
    *((void *)v33 + 3) = *((void *)v34 + 3);
    *((void *)v33 + 4) = *((void *)v34 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v33 + 5) = *((void *)v34 + 5);
    *((void *)v33 + 6) = *((void *)v34 + 6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v33 + 7) = *((void *)v34 + 7);
    *((void *)v33 + 8) = *((void *)v34 + 8);
    *((void *)v33 + 9) = *((void *)v34 + 9);
    *((void *)v33 + 10) = *((void *)v34 + 10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    a1[v6[10]] = a2[v6[10]];
    uint64_t v35 = v6[11];
    uint64_t v36 = &a1[v35];
    uint64_t v37 = &a2[v35];
    uint64_t v38 = type metadata accessor for ProviderAttribution();
    LODWORD(v25) = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
    int v39 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
    if (v25)
    {
      if (!v39)
      {
        *(void *)uint64_t v36 = *(void *)v37;
        *((void *)v36 + 1) = *((void *)v37 + 1);
        uint64_t v40 = *(int *)(v38 + 20);
        uint64_t v41 = &v36[v40];
        uint64_t v42 = &v37[v40];
        uint64_t v43 = sub_1A93ABA18();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v42, 1, v43))
        {
          uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
          memcpy(v41, v42, *(void *)(*(void *)(v44 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
          __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v43);
        }
        uint64_t v80 = (uint64_t)v36;
        uint64_t v81 = v38;
        goto LABEL_32;
      }
    }
    else
    {
      if (!v39)
      {
        *(void *)uint64_t v36 = *(void *)v37;
        *((void *)v36 + 1) = *((void *)v37 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v74 = *(int *)(v38 + 20);
        uint64_t v75 = (uint64_t)&v36[v74];
        uint64_t v76 = (uint64_t)&v37[v74];
        uint64_t v77 = sub_1A93ABA18();
        int v78 = __swift_getEnumTagSinglePayload(v75, 1, v77);
        int v79 = __swift_getEnumTagSinglePayload(v76, 1, v77);
        if (v78)
        {
          if (!v79)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 16))(v75, v76, v77);
            uint64_t v80 = v75;
            uint64_t v81 = v77;
LABEL_32:
            __swift_storeEnumTagSinglePayload(v80, 0, 1, v81);
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v110 = *(void *)(v77 - 8);
          if (!v79)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 24))(v75, v76, v77);
LABEL_33:
            uint64_t v82 = v6[12];
            uint64_t v83 = &a1[v82];
            uint64_t v84 = &a2[v82];
            uint64_t v85 = sub_1A93ABA18();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 24))(v83, v84, v85);
            *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v86 = v6[14];
            uint64_t v87 = &a1[v86];
            uint64_t v88 = &a2[v86];
            uint64_t v89 = type metadata accessor for AirPollutant();
            LODWORD(v83) = __swift_getEnumTagSinglePayload((uint64_t)v87, 1, v89);
            int v90 = __swift_getEnumTagSinglePayload((uint64_t)v88, 1, v89);
            if (v83)
            {
              if (!v90)
              {
                *uint64_t v87 = *v88;
                uint64_t v91 = *(int *)(v89 + 20);
                uint64_t v92 = &v87[v91];
                uint64_t v93 = &v88[v91];
                type metadata accessor for AirPollutantMeasurement();
                if (swift_getEnumCaseMultiPayload() == 1) {
                  uint64_t v94 = &qword_1EB655290;
                }
                else {
                  uint64_t v94 = &qword_1EB6569E8;
                }
                uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(v94);
                (*(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 16))(v92, v93, v95);
                swift_storeEnumTagMultiPayload();
                v87[*(int *)(v89 + 24)] = v88[*(int *)(v89 + 24)];
                __swift_storeEnumTagSinglePayload((uint64_t)v87, 0, 1, v89);
                goto LABEL_42;
              }
            }
            else
            {
              if (!v90)
              {
                *uint64_t v87 = *v88;
                if (a1 != a2)
                {
                  uint64_t v105 = *(int *)(v89 + 20);
                  uint64_t v106 = &v88[v105];
                  char v107 = &v87[v105];
                  sub_1A9388CEC((uint64_t)&v87[v105], (void (*)(void))type metadata accessor for AirPollutantMeasurement);
                  type metadata accessor for AirPollutantMeasurement();
                  if (swift_getEnumCaseMultiPayload() == 1) {
                    uint64_t v108 = &qword_1EB655290;
                  }
                  else {
                    uint64_t v108 = &qword_1EB6569E8;
                  }
                  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(v108);
                  (*(void (**)(char *, char *, uint64_t))(*(void *)(v109 - 8) + 16))(v107, v106, v109);
                  swift_storeEnumTagMultiPayload();
                }
                v87[*(int *)(v89 + 24)] = v88[*(int *)(v89 + 24)];
                goto LABEL_42;
              }
              sub_1A9388CEC((uint64_t)v87, (void (*)(void))type metadata accessor for AirPollutant);
            }
            uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
            memcpy(v87, v88, *(void *)(*(void *)(v96 - 8) + 64));
LABEL_42:
            a1[v6[15]] = a2[v6[15]];
            uint64_t v97 = v6[16];
            uint64_t v98 = &a1[v97];
            uint64_t v99 = &a2[v97];
            *uint64_t v98 = *v99;
            *((void *)v98 + 1) = *((void *)v99 + 1);
            *((void *)v98 + 2) = *((void *)v99 + 2);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v100 = v6[17];
            uint64_t v101 = &a1[v100];
            uint64_t v102 = &a2[v100];
            v114(&a1[v100], &a2[v100], v24);
            char v103 = (int *)type metadata accessor for WeatherMetadata();
            v114(&v101[v103[5]], &v102[v103[5]], v24);
            *(void *)&v101[v103[6]] = *(void *)&v102[v103[6]];
            *(void *)&v101[v103[7]] = *(void *)&v102[v103[7]];
            *(void *)&v101[v103[8]] = *(void *)&v102[v103[8]];
            swift_retain();
            swift_release();
            return a1;
          }
          (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v75, v77);
        }
        size_t v50 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968) - 8) + 64);
        uint64_t v51 = (void *)v75;
        uint64_t v52 = (const void *)v76;
LABEL_17:
        memcpy(v51, v52, v50);
        goto LABEL_33;
      }
      sub_1A9388CEC((uint64_t)v36, (void (*)(void))type metadata accessor for ProviderAttribution);
    }
    size_t v50 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60) - 8) + 64);
    uint64_t v51 = v36;
    uint64_t v52 = v37;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1A93ABC08();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  v10(a1, a2, v9);
  char v112 = v10;
  uint64_t v113 = v9;
  v10(&a1[v6[5]], &a2[v6[5]], v9);
  uint64_t v11 = v6[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  uint64_t v14 = v6[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  *((void *)v15 + 2) = *((void *)v16 + 2);
  *((void *)v15 + 3) = *((void *)v16 + 3);
  *((void *)v15 + 4) = *((void *)v16 + 4);
  *((void *)v15 + 5) = *((void *)v16 + 5);
  *((void *)v15 + 6) = *((void *)v16 + 6);
  *((void *)v15 + 7) = *((void *)v16 + 7);
  *((void *)v15 + 8) = *((void *)v16 + 8);
  *((void *)v15 + 9) = *((void *)v16 + 9);
  v15[80] = v16[80];
  *(_OWORD *)(v15 + 88) = *(_OWORD *)(v16 + 88);
  *((void *)v15 + 13) = *((void *)v16 + 13);
  *((void *)v15 + 14) = *((void *)v16 + 14);
  *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
  uint64_t v17 = v6[9];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  *((void *)v18 + 2) = *((void *)v19 + 2);
  *((void *)v18 + 3) = *((void *)v19 + 3);
  *((void *)v18 + 4) = *((void *)v19 + 4);
  *((void *)v18 + 5) = *((void *)v19 + 5);
  *((void *)v18 + 6) = *((void *)v19 + 6);
  *(_OWORD *)(v18 + 56) = *(_OWORD *)(v19 + 56);
  *((void *)v18 + 9) = *((void *)v19 + 9);
  *((void *)v18 + 10) = *((void *)v19 + 10);
  a1[v6[10]] = a2[v6[10]];
  uint64_t v20 = v6[11];
  __dst = &a1[v20];
  uint64_t v21 = &a2[v20];
  uint64_t v22 = type metadata accessor for ProviderAttribution();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60);
    memcpy(__dst, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    *(void *)__dst = *(void *)v21;
    *((void *)__dst + 1) = *((void *)v21 + 1);
    uint64_t v45 = *(int *)(v22 + 20);
    uint64_t v46 = &__dst[v45];
    uint64_t v47 = &v21[v45];
    uint64_t v48 = sub_1A93ABA18();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
    {
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
      memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v22);
  }
  uint64_t v53 = v6[12];
  uint64_t v54 = &a1[v53];
  uint64_t v55 = &a2[v53];
  uint64_t v56 = sub_1A93ABA18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
  *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
  uint64_t v57 = v6[14];
  uint64_t v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  uint64_t v60 = type metadata accessor for AirPollutant();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v59, 1, v60))
  {
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
    memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
  }
  else
  {
    *uint64_t v58 = *v59;
    uint64_t v62 = *(int *)(v60 + 20);
    uint64_t v63 = &v58[v62];
    uint64_t v64 = &v59[v62];
    type metadata accessor for AirPollutantMeasurement();
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v65 = &qword_1EB655290;
    }
    else {
      uint64_t v65 = &qword_1EB6569E8;
    }
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(v65);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v63, v64, v66);
    swift_storeEnumTagMultiPayload();
    v58[*(int *)(v60 + 24)] = v59[*(int *)(v60 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v58, 0, 1, v60);
  }
  a1[v6[15]] = a2[v6[15]];
  uint64_t v67 = v6[16];
  uint64_t v68 = &a1[v67];
  uint64_t v69 = &a2[v67];
  *uint64_t v68 = *v69;
  *((void *)v68 + 1) = *((void *)v69 + 1);
  *((void *)v68 + 2) = *((void *)v69 + 2);
  uint64_t v70 = v6[17];
  uint64_t v71 = &a1[v70];
  uint64_t v72 = &a2[v70];
  swift_bridgeObjectRetain();
  v112(v71, v72, v113);
  uint64_t v73 = (int *)type metadata accessor for WeatherMetadata();
  v112(&v71[v73[5]], &v72[v73[5]], v113);
  *(void *)&v71[v73[6]] = *(void *)&v72[v73[6]];
  *(void *)&v71[v73[7]] = *(void *)&v72[v73[7]];
  *(void *)&v71[v73[8]] = *(void *)&v72[v73[8]];
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, (uint64_t)v6);
  return a1;
}

uint64_t sub_1A9388CEC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

char *initializeWithTake for AirQualityData(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for AirQuality();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    int v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
    v8(a1, a2, v7);
    v8(&a1[v6[5]], &a2[v6[5]], v7);
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    memcpy(&a1[v6[7]], &a2[v6[7]], 0x78uLL);
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    memcpy(&a1[v6[9]], &a2[v6[9]], 0x58uLL);
    a1[v6[10]] = a2[v6[10]];
    uint64_t v9 = v6[11];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = type metadata accessor for ProviderAttribution();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
      uint64_t v14 = *(int *)(v12 + 20);
      uint64_t v15 = &v10[v14];
      uint64_t v16 = &v11[v14];
      uint64_t v17 = sub_1A93ABA18();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
        memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
        __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v19 = v6[12];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = sub_1A93ABA18();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
    *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
    uint64_t v23 = v6[14];
    uint64_t v24 = &a1[v23];
    uint64_t v25 = &a2[v23];
    uint64_t v26 = type metadata accessor for AirPollutant();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      uint64_t v28 = *(int *)(v26 + 20);
      uint64_t v29 = &v24[v28];
      uint64_t v30 = &v25[v28];
      type metadata accessor for AirPollutantMeasurement();
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v31 = &qword_1EB655290;
      }
      else {
        uint64_t v31 = &qword_1EB6569E8;
      }
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(v31);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
      v24[*(int *)(v26 + 24)] = v25[*(int *)(v26 + 24)];
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    a1[v6[15]] = a2[v6[15]];
    uint64_t v33 = v6[16];
    uint64_t v34 = &a1[v33];
    uint64_t v35 = &a2[v33];
    *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    *((void *)v34 + 2) = *((void *)v35 + 2);
    uint64_t v36 = v6[17];
    uint64_t v37 = &a1[v36];
    uint64_t v38 = &a2[v36];
    v8(&a1[v36], v38, v7);
    int v39 = (int *)type metadata accessor for WeatherMetadata();
    v8(&v37[v39[5]], &v38[v39[5]], v7);
    *(void *)&v37[v39[6]] = *(void *)&v38[v39[6]];
    *(void *)&v37[v39[7]] = *(void *)&v38[v39[7]];
    *(void *)&v37[v39[8]] = *(void *)&v38[v39[8]];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, (uint64_t)v6);
  }
  return a1;
}

unsigned char *assignWithTake for AirQualityData(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for AirQuality();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_1A9388CEC((uint64_t)a1, (void (*)(void))type metadata accessor for AirQuality);
      goto LABEL_7;
    }
    uint64_t v16 = sub_1A93ABC08();
    uint64_t v17 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 40);
    v17(a1, a2, v16);
    v17(&a1[v6[5]], &a2[v6[5]], v16);
    uint64_t v18 = v6[6];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = (uint64_t *)&a2[v18];
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    *uint64_t v19 = v22;
    v19[1] = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = v6[7];
    uint64_t v24 = &a1[v23];
    uint64_t v25 = &a2[v23];
    uint64_t v26 = *(void *)&a2[v23 + 8];
    *(void *)uint64_t v24 = *(void *)&a2[v23];
    *((void *)v24 + 1) = v26;
    swift_bridgeObjectRelease();
    uint64_t v27 = *((void *)v25 + 3);
    *((void *)v24 + 2) = *((void *)v25 + 2);
    *((void *)v24 + 3) = v27;
    swift_bridgeObjectRelease();
    uint64_t v28 = *((void *)v25 + 5);
    *((void *)v24 + 4) = *((void *)v25 + 4);
    *((void *)v24 + 5) = v28;
    swift_bridgeObjectRelease();
    uint64_t v29 = *((void *)v25 + 7);
    *((void *)v24 + 6) = *((void *)v25 + 6);
    *((void *)v24 + 7) = v29;
    swift_bridgeObjectRelease();
    uint64_t v30 = *((void *)v25 + 9);
    *((void *)v24 + 8) = *((void *)v25 + 8);
    *((void *)v24 + 9) = v30;
    swift_bridgeObjectRelease();
    v24[80] = v25[80];
    *(_OWORD *)(v24 + 88) = *(_OWORD *)(v25 + 88);
    *((void *)v24 + 13) = *((void *)v25 + 13);
    swift_bridgeObjectRelease();
    *((void *)v24 + 14) = *((void *)v25 + 14);
    swift_bridgeObjectRelease();
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    uint64_t v31 = v6[9];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    uint64_t v34 = *(void *)&a2[v31 + 8];
    *(void *)uint64_t v32 = *(void *)&a2[v31];
    *((void *)v32 + 1) = v34;
    swift_bridgeObjectRelease();
    *((_OWORD *)v32 + 1) = *((_OWORD *)v33 + 1);
    *((void *)v32 + 4) = *((void *)v33 + 4);
    swift_bridgeObjectRelease();
    uint64_t v35 = *((void *)v33 + 6);
    *((void *)v32 + 5) = *((void *)v33 + 5);
    *((void *)v32 + 6) = v35;
    swift_bridgeObjectRelease();
    *(_OWORD *)(v32 + 56) = *(_OWORD *)(v33 + 56);
    uint64_t v36 = *((void *)v33 + 10);
    *((void *)v32 + 9) = *((void *)v33 + 9);
    *((void *)v32 + 10) = v36;
    swift_bridgeObjectRelease();
    a1[v6[10]] = a2[v6[10]];
    uint64_t v37 = v6[11];
    uint64_t v38 = (uint64_t)&a1[v37];
    uint64_t v39 = (uint64_t)&a2[v37];
    uint64_t v40 = type metadata accessor for ProviderAttribution();
    int v41 = __swift_getEnumTagSinglePayload(v38, 1, v40);
    int v42 = __swift_getEnumTagSinglePayload(v39, 1, v40);
    if (v41)
    {
      if (!v42)
      {
        uint64_t v43 = v17;
        *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
        uint64_t v44 = *(int *)(v40 + 20);
        uint64_t v45 = (void *)(v38 + v44);
        uint64_t v46 = (const void *)(v39 + v44);
        uint64_t v47 = sub_1A93ABA18();
        if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
        {
          uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
          memcpy(v45, v46, *(void *)(*(void *)(v48 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
          __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
        }
        __swift_storeEnumTagSinglePayload(v38, 0, 1, v40);
        uint64_t v17 = v43;
LABEL_32:
        uint64_t v85 = v6[12];
        uint64_t v86 = &a1[v85];
        uint64_t v87 = &a2[v85];
        uint64_t v88 = sub_1A93ABA18();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 40))(v86, v87, v88);
        *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
        swift_bridgeObjectRelease();
        uint64_t v89 = v6[14];
        int v90 = &a1[v89];
        uint64_t v91 = &a2[v89];
        uint64_t v92 = type metadata accessor for AirPollutant();
        int v93 = __swift_getEnumTagSinglePayload((uint64_t)v90, 1, v92);
        int v94 = __swift_getEnumTagSinglePayload((uint64_t)v91, 1, v92);
        if (v93)
        {
          if (!v94)
          {
            *int v90 = *v91;
            uint64_t v95 = *(int *)(v92 + 20);
            uint64_t v96 = &v90[v95];
            uint64_t v118 = v17;
            uint64_t v97 = &v91[v95];
            type metadata accessor for AirPollutantMeasurement();
            if (swift_getEnumCaseMultiPayload() == 1) {
              uint64_t v98 = &qword_1EB655290;
            }
            else {
              uint64_t v98 = &qword_1EB6569E8;
            }
            uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(v98);
            uint64_t v100 = v97;
            uint64_t v17 = v118;
            (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v99 - 8) + 32))(v96, v100, v99);
            swift_storeEnumTagMultiPayload();
            v90[*(int *)(v92 + 24)] = v91[*(int *)(v92 + 24)];
            __swift_storeEnumTagSinglePayload((uint64_t)v90, 0, 1, v92);
            goto LABEL_41;
          }
        }
        else
        {
          if (!v94)
          {
            *int v90 = *v91;
            if (a1 != a2)
            {
              uint64_t v112 = *(int *)(v92 + 20);
              uint64_t v113 = &v91[v112];
              uint64_t v119 = v17;
              uint64_t v114 = &v90[v112];
              sub_1A9388CEC((uint64_t)&v90[v112], (void (*)(void))type metadata accessor for AirPollutantMeasurement);
              type metadata accessor for AirPollutantMeasurement();
              if (swift_getEnumCaseMultiPayload() == 1) {
                v115 = &qword_1EB655290;
              }
              else {
                v115 = &qword_1EB6569E8;
              }
              uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(v115);
              (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v116 - 8) + 32))(v114, v113, v116);
              uint64_t v17 = v119;
              swift_storeEnumTagMultiPayload();
            }
            v90[*(int *)(v92 + 24)] = v91[*(int *)(v92 + 24)];
            goto LABEL_41;
          }
          sub_1A9388CEC((uint64_t)v90, (void (*)(void))type metadata accessor for AirPollutant);
        }
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
        memcpy(v90, v91, *(void *)(*(void *)(v101 - 8) + 64));
LABEL_41:
        a1[v6[15]] = a2[v6[15]];
        uint64_t v102 = v6[16];
        char v103 = &a1[v102];
        uint64_t v104 = &a2[v102];
        *char v103 = *v104;
        uint64_t v106 = *((void *)v104 + 1);
        uint64_t v105 = *((void *)v104 + 2);
        *((void *)v103 + 1) = v106;
        *((void *)v103 + 2) = v105;
        swift_bridgeObjectRelease();
        uint64_t v107 = v6[17];
        uint64_t v108 = &a1[v107];
        uint64_t v109 = &a2[v107];
        v17(&a1[v107], v109, v16);
        uint64_t v110 = (int *)type metadata accessor for WeatherMetadata();
        v17(&v108[v110[5]], &v109[v110[5]], v16);
        *(void *)&v108[v110[6]] = *(void *)&v109[v110[6]];
        *(void *)&v108[v110[7]] = *(void *)&v109[v110[7]];
        *(void *)&v108[v110[8]] = *(void *)&v109[v110[8]];
        swift_release();
        return a1;
      }
    }
    else
    {
      if (!v42)
      {
        uint64_t v78 = *(void *)(v39 + 8);
        *(void *)uint64_t v38 = *(void *)v39;
        *(void *)(v38 + 8) = v78;
        swift_bridgeObjectRelease();
        uint64_t v79 = *(int *)(v40 + 20);
        uint64_t v80 = v38 + v79;
        uint64_t v81 = v39 + v79;
        uint64_t v82 = sub_1A93ABA18();
        int v83 = __swift_getEnumTagSinglePayload(v80, 1, v82);
        int v84 = __swift_getEnumTagSinglePayload(v81, 1, v82);
        if (v83)
        {
          if (!v84)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 32))(v80, v81, v82);
            __swift_storeEnumTagSinglePayload(v80, 0, 1, v82);
            goto LABEL_32;
          }
        }
        else
        {
          uint64_t v117 = *(void *)(v82 - 8);
          if (!v84)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 40))(v80, v81, v82);
            goto LABEL_32;
          }
          (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v80, v82);
        }
        size_t v54 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968) - 8) + 64);
        uint64_t v55 = (void *)v80;
        uint64_t v56 = (const void *)v81;
LABEL_17:
        memcpy(v55, v56, v54);
        goto LABEL_32;
      }
      sub_1A9388CEC(v38, (void (*)(void))type metadata accessor for ProviderAttribution);
    }
    size_t v54 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60) - 8) + 64);
    uint64_t v55 = (void *)v38;
    uint64_t v56 = (const void *)v39;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_1A93ABC08();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(a1, a2, v9);
  v10(&a1[v6[5]], &a2[v6[5]], v9);
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  memcpy(&a1[v6[7]], &a2[v6[7]], 0x78uLL);
  *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
  memcpy(&a1[v6[9]], &a2[v6[9]], 0x58uLL);
  a1[v6[10]] = a2[v6[10]];
  uint64_t v11 = v6[11];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = type metadata accessor for ProviderAttribution();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656A60);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    _OWORD *v12 = *v13;
    uint64_t v49 = *(int *)(v14 + 20);
    size_t v50 = (char *)v12 + v49;
    uint64_t v51 = (char *)v13 + v49;
    uint64_t v52 = sub_1A93ABA18();
    if (__swift_getEnumTagSinglePayload((uint64_t)v51, 1, v52))
    {
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
      memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v50, v51, v52);
      __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v52);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v57 = v6[12];
  uint64_t v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  uint64_t v60 = sub_1A93ABA18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
  *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
  uint64_t v61 = v6[14];
  uint64_t v62 = &a1[v61];
  uint64_t v63 = &a2[v61];
  uint64_t v64 = type metadata accessor for AirPollutant();
  if (__swift_getEnumTagSinglePayload((uint64_t)v63, 1, v64))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656A00);
    memcpy(v62, v63, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    *uint64_t v62 = *v63;
    uint64_t v66 = *(int *)(v64 + 20);
    uint64_t v67 = &v62[v66];
    uint64_t v68 = &v63[v66];
    type metadata accessor for AirPollutantMeasurement();
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v69 = &qword_1EB655290;
    }
    else {
      uint64_t v69 = &qword_1EB6569E8;
    }
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(v69);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v70 - 8) + 32))(v67, v68, v70);
    swift_storeEnumTagMultiPayload();
    v62[*(int *)(v64 + 24)] = v63[*(int *)(v64 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v62, 0, 1, v64);
  }
  a1[v6[15]] = a2[v6[15]];
  uint64_t v71 = v6[16];
  uint64_t v72 = &a1[v71];
  uint64_t v73 = &a2[v71];
  *(_OWORD *)uint64_t v72 = *(_OWORD *)v73;
  *((void *)v72 + 2) = *((void *)v73 + 2);
  uint64_t v74 = v6[17];
  uint64_t v75 = &a1[v74];
  uint64_t v76 = &a2[v74];
  v10(&a1[v74], v76, v9);
  uint64_t v77 = (int *)type metadata accessor for WeatherMetadata();
  v10(&v75[v77[5]], &v76[v77[5]], v9);
  *(void *)&v75[v77[6]] = *(void *)&v76[v77[6]];
  *(void *)&v75[v77[7]] = *(void *)&v76[v77[7]];
  *(void *)&v75[v77[8]] = *(void *)&v76[v77[8]];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, (uint64_t)v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AirQualityData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9389DDC);
}

uint64_t sub_1A9389DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirQuality();
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 3) {
    return EnumTagSinglePayload - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AirQualityData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9389E38);
}

uint64_t sub_1A9389E38(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for AirQuality();

  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_1A9389E98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AirQuality();

  return __swift_getEnumTagSinglePayload(a1, 2, v2);
}

uint64_t sub_1A9389EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AirQuality();

  return __swift_storeEnumTagSinglePayload(a1, a2, 2, v4);
}

uint64_t sub_1A9389F28()
{
  uint64_t result = type metadata accessor for AirQuality();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AirQualityData.CodingType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A938A06CLL);
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

ValueMetadata *type metadata accessor for AirQualityData.CodingType()
{
  return &type metadata for AirQualityData.CodingType;
}

unsigned char *storeEnumTagSinglePayload for AirQualityData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A938A170);
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

ValueMetadata *type metadata accessor for AirQualityData.CodingKeys()
{
  return &type metadata for AirQualityData.CodingKeys;
}

unint64_t sub_1A938A1AC()
{
  unint64_t result = qword_1E97BC768;
  if (!qword_1E97BC768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC768);
  }
  return result;
}

unint64_t sub_1A938A1FC()
{
  unint64_t result = qword_1E97BC770;
  if (!qword_1E97BC770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC770);
  }
  return result;
}

unint64_t sub_1A938A24C()
{
  unint64_t result = qword_1EB659678;
  if (!qword_1EB659678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB659678);
  }
  return result;
}

unint64_t sub_1A938A29C()
{
  unint64_t result = qword_1EB659680;
  if (!qword_1EB659680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB659680);
  }
  return result;
}

unint64_t sub_1A938A2E8()
{
  unint64_t result = qword_1EB659688;
  if (!qword_1EB659688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB659688);
  }
  return result;
}

uint64_t sub_1A938A340(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1A938A364, 0, 0);
}

uint64_t sub_1A938A364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v15 = objc_msgSend(self, sel_sharedService);
  v14[5] = v15;
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = objc_msgSend(v15, sel_defaultTraits);
    v14[6] = v17;
    if (v17)
    {
      uint64_t v18 = self;
      id v19 = v17;
      id v20 = objc_msgSend(v18, sel_sharedConfiguration);
      if (!v20)
      {
        __break(1u);
        return MEMORY[0x1F4188160](v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14);
      }
      uint64_t v28 = sub_1A91A75F8(v20);
      if (!v29)
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0xE000000000000000;
      }
      sub_1A938B770(v28, v29, v19);
    }
    uint64_t v30 = (void *)v14[3];
    objc_msgSend(v30, sel_coordinate);
    double v32 = v31;
    objc_msgSend(v30, sel_coordinate);
    id v34 = objc_msgSend(v16, sel_ticketForReverseGeocodeCoordinate_shiftLocationsIfNeeded_preserveOriginalLocation_traits_, objc_msgSend(v30, sel_shiftedReferenceFrame) ^ 1, 1, v17, v32, v33);
    v14[7] = v34;
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = v14[4];
      uint64_t v37 = swift_task_alloc();
      v14[8] = v37;
      *(void *)(v37 + 16) = v35;
      *(void *)(v37 + 24) = v36;
      uint64_t v38 = (void *)swift_task_alloc();
      v14[9] = v38;
      uint64_t v27 = type metadata accessor for ReverseGeocodeResult();
      *uint64_t v38 = v14;
      v38[1] = sub_1A938A60C;
      id v20 = (id)v14[2];
      unint64_t v24 = 0x80000001A93DC210;
      uint64_t v25 = sub_1A938B768;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      unint64_t v23 = 0xD000000000000019;
      uint64_t v26 = v37;
      return MEMORY[0x1F4188160](v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14);
    }
    sub_1A938B71C();
    uint64_t v41 = swift_allocError();
    OUTLINED_FUNCTION_1_33(v41, v42);
  }
  else
  {
    sub_1A938B71C();
    uint64_t v39 = swift_allocError();
    OUTLINED_FUNCTION_1_33(v39, v40);
  }
  uint64_t v43 = (uint64_t (*)(void))v14[1];
  return v43();
}

uint64_t sub_1A938A60C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A938A798;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1A938A728;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1A938A728()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = (void *)v0[5];
  swift_unknownObjectRelease();

  int v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1A938A798()
{
  uint64_t v2 = (void *)v0[5];
  uint64_t v1 = (void *)v0[6];
  swift_unknownObjectRelease();

  swift_task_dealloc();
  int v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t GeocodeService.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 1;
  return result;
}

uint64_t sub_1A938A844(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReverseGeocodeResult();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656628);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (void *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A938BA68(a1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9[1] = *v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
    return sub_1A93ADFA8();
  }
  else
  {
    sub_1A938BAD0((uint64_t)v7, (uint64_t)v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
    return sub_1A93ADFB8();
  }
}

void sub_1A938A978(unint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656628);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for ReverseGeocodeResult();
  MEMORY[0x1F4188790](v64);
  uint64_t v10 = (uint64_t *)((char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v67 = (uint64_t)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A93ABDD8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v63 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v66 = (char *)&v61 - v17;
  MEMORY[0x1F4188790](v18);
  uint64_t v65 = (char *)&v61 - v19;
  if (qword_1EB658970 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1A93ADAA8();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EB662420);
  uint64_t v21 = sub_1A93ADA88();
  os_log_type_t v22 = sub_1A93AE128();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = a2;
    unint64_t v24 = v8;
    uint64_t v25 = a3;
    uint64_t v26 = v23;
    *(_WORD *)unint64_t v23 = 0;
    _os_log_impl(&dword_1A9191000, v21, v22, "Handling geo map service response", v23, 2u);
    uint64_t v27 = v26;
    a3 = v25;
    int v8 = v24;
    a2 = v62;
    MEMORY[0x1AD0F2200](v27, -1, -1);
  }

  if (a2)
  {
    sub_1A938B71C();
    uint64_t v28 = swift_allocError();
    *uint64_t v29 = a2;
    uint64_t v68 = v28;
    id v30 = a2;
LABEL_29:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
    sub_1A93ADFA8();
    return;
  }
  if (!a1)
  {
LABEL_28:
    sub_1A938B71C();
    uint64_t v59 = swift_allocError();
    *uint64_t v60 = 1;
    uint64_t v68 = v59;
    goto LABEL_29;
  }
  if (!(a1 >> 62))
  {
    uint64_t v31 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v31) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  if (!sub_1A93AE2E8())
  {
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
LABEL_10:
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v32 = MEMORY[0x1AD0F1850](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    uint64_t v32 = *(void *)(a1 + 32);
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(self, sel_placemarkWithGEOMapItem_, v32);
  if (!v33)
  {
    sub_1A938B71C();
    uint64_t v55 = swift_allocError();
    *uint64_t v56 = 2;
    uint64_t v68 = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
    sub_1A93ADFA8();
    swift_unknownObjectRelease();
    return;
  }
  id v34 = v33;
  uint64_t v62 = a3;
  id v35 = objc_msgSend(v33, sel_timeZone);
  if (!v35)
  {
    uint64_t v38 = v67;
    __swift_storeEnumTagSinglePayload(v67, 1, 1, v13);
    goto LABEL_25;
  }
  uint64_t v36 = v35;
  uint64_t v37 = v66;
  sub_1A93ABDB8();

  uint64_t v38 = v67;
  uint64_t v66 = *(char **)(v14 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v66)(v67, v37, v13);
  __swift_storeEnumTagSinglePayload(v38, 0, 1, v13);
  if (__swift_getEnumTagSinglePayload(v38, 1, v13) == 1)
  {
LABEL_25:
    sub_1A938BA18(v38, (uint64_t *)&unk_1EB657350);
    sub_1A938B71C();
    uint64_t v57 = swift_allocError();
    *uint64_t v58 = 0;
    uint64_t v68 = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
    sub_1A93ADFA8();
    swift_unknownObjectRelease();

    return;
  }
  uint64_t v39 = v65;
  ((void (*)(char *, uint64_t, uint64_t))v66)(v65, v38, v13);
  swift_getObjectType();
  uint64_t v40 = sub_1A93AE0E8();
  uint64_t v61 = v41;
  int v42 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v67 = v32;
  uint64_t v43 = v63;
  v42(v63, v39, v13);
  uint64_t v44 = sub_1A938B908(v34);
  uint64_t v46 = v14;
  if (v45) {
    uint64_t v47 = v44;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v48 = v13;
  if (v45) {
    unint64_t v49 = v45;
  }
  else {
    unint64_t v49 = 0xE000000000000000;
  }
  uint64_t v50 = v61;
  *uint64_t v10 = v40;
  v10[1] = v50;
  uint64_t v51 = v64;
  uint64_t v52 = v43;
  uint64_t v53 = v48;
  ((void (*)(char *, char *))v66)((char *)v10 + *(int *)(v64 + 20), v52);
  size_t v54 = (uint64_t *)((char *)v10 + *(int *)(v51 + 24));
  *size_t v54 = v47;
  v54[1] = v49;
  sub_1A920B898((uint64_t)v10, (uint64_t)v8);
  swift_storeEnumTagMultiPayload();
  sub_1A938A844((uint64_t)v8);
  swift_unknownObjectRelease();

  sub_1A938BA18((uint64_t)v8, &qword_1EB656628);
  sub_1A924EA18((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v65, v53);
}

void sub_1A938AFF8(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  if (qword_1EB658970 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1A93ADAA8();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB662420);
  int v8 = sub_1A93ADA88();
  os_log_type_t v9 = sub_1A93AE128();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A9191000, v8, v9, "Submitting reverse geocode ticket", v10, 2u);
    MEMORY[0x1AD0F2200](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v20 = sub_1A938B85C;
  uint64_t v21 = v12;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_1A938B2E0;
  uint64_t v19 = &block_descriptor;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  id v14 = sub_1A938B378();
  uint64_t v20 = (void (*)(unint64_t, void *))GEOLocationCoordinate2DMake;
  uint64_t v21 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_1A938B3D4;
  uint64_t v19 = &block_descriptor_7;
  uint64_t v15 = _Block_copy(&aBlock);
  objc_msgSend(a2, sel_submitWithHandler_auditToken_timeout_networkActivity_, v13, v14, 30, v15);
  _Block_release(v15);

  _Block_release(v13);
}

uint64_t sub_1A938B2E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656600);
    uint64_t v4 = sub_1A93ADF28();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_1A938B378()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  if (v1 == (void *)1)
  {
    id v2 = sub_1A938B428();
    uint64_t v3 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v2;
    id v4 = v2;
    sub_1A938B6A8(v3);
  }
  sub_1A938B8F8(v1);
  return v2;
}

uint64_t sub_1A938B3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_1A938B428()
{
  id v0 = objc_msgSend(self, sel_currentConnection);
  if (v0)
  {
    sub_1A938B9AC(v0, (SEL *)&selRef_wd_bundleIdentifier);
    if (v1) {
      goto LABEL_13;
    }
  }
  id v2 = self;
  uint64_t v3 = sub_1A938B9AC(objc_msgSend(v2, sel_mainBundle), (SEL *)&selRef_bundleIdentifier);
  if (v4)
  {
    if (v3 == 0xD000000000000012 && v4 == 0x80000001A93DC2A0) {
      goto LABEL_11;
    }
    char v5 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_13;
    }
  }
  uint64_t v6 = sub_1A938B9AC(objc_msgSend(v2, sel_mainBundle), (SEL *)&selRef_bundleIdentifier);
  if (v7)
  {
    if (v6 == 0xD000000000000016 && v7 == 0x80000001A93DC260)
    {
LABEL_11:
      swift_bridgeObjectRelease();
LABEL_13:
      sub_1A938B96C();
      return sub_1A938B614();
    }
    char v8 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_13;
    }
  }
  return 0;
}

id sub_1A938B614()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1A93ADDC8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithProxiedApplicationBundleId_, v1);

  return v2;
}

uint64_t GeocodeService.deinit()
{
  sub_1A938B6A8(*(id *)(v0 + 16));
  return v0;
}

void sub_1A938B6A8(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t GeocodeService.__deallocating_deinit()
{
  sub_1A938B6A8(*(id *)(v0 + 16));

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t method lookup function for GeocodeService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GeocodeService);
}

uint64_t dispatch thunk of GeocodeService.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t sub_1A938B71C()
{
  unint64_t result = qword_1E97BC788;
  if (!qword_1E97BC788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC788);
  }
  return result;
}

void sub_1A938B768(uint64_t a1)
{
  sub_1A938AFF8(a1, *(void **)(v1 + 16));
}

void sub_1A938B770(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1A93ADDC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDisplayRegion_, v4);
}

uint64_t sub_1A938B7D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0);
  OUTLINED_FUNCTION_0_23();
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  return swift_deallocObject();
}

void sub_1A938B85C(unint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB6565C0) - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  sub_1A938A978(a1, a2, v6);
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

id sub_1A938B8F8(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_1A938B908(void *a1)
{
  id v1 = objc_msgSend(a1, sel_ISOcountryCode);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1A93ADDE8();

  return v3;
}

unint64_t sub_1A938B96C()
{
  unint64_t result = qword_1E97BC798;
  if (!qword_1E97BC798)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E97BC798);
  }
  return result;
}

uint64_t sub_1A938B9AC(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_1A93ADDE8();

  return v4;
}

uint64_t sub_1A938BA18(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_23();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1A938BA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A938BAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReverseGeocodeResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for GeocodeService.Errors(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for GeocodeService.Errors(void **a1)
{
  id v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for GeocodeService.Errors(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for GeocodeService.Errors(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for GeocodeService.Errors(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for GeocodeService.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_1A938BD3C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1A938BD54(void *result, int a2)
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

ValueMetadata *type metadata accessor for GeocodeService.Errors()
{
  return &type metadata for GeocodeService.Errors;
}

void sub_1A938C278(void *a1@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BA988);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_57();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  uint64_t v7 = OUTLINED_FUNCTION_1(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  sub_1A93ABC08();
  OUTLINED_FUNCTION_3_18();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_0();
  unint64_t v14 = v1[1];
  unint64_t v15 = *(void *)(*v1 + 16);
  if (v14 == v15)
  {
    __swift_storeEnumTagSinglePayload(v10, 1, 1, v2);
LABEL_5:
    sub_1A91A6D88(v10, &qword_1EB657328);
    uint64_t v16 = (uint64_t)a1;
    uint64_t v17 = 1;
LABEL_8:
    __swift_storeEnumTagSinglePayload(v16, v17, 1, v4);
    return;
  }
  if (v14 >= v15)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16))(v10, *v1+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v14, v2);
    v1[1] = v14 + 1;
    __swift_storeEnumTagSinglePayload(v10, 0, 1, v2);
    if (__swift_getEnumTagSinglePayload(v10, 1, v2) == 1) {
      goto LABEL_5;
    }
    uint64_t v18 = *(void (**)(void))(v12 + 32);
    OUTLINED_FUNCTION_10_30();
    v18();
    uint64_t v19 = v1[2];
    OUTLINED_FUNCTION_10_30();
    v18();
    if (!__OFADD__(v19, 1))
    {
      v1[2] = v19 + 1;
      *a1 = v19;
      OUTLINED_FUNCTION_10_30();
      v18();
      uint64_t v16 = (uint64_t)a1;
      uint64_t v17 = 0;
      goto LABEL_8;
    }
  }
  __break(1u);
}

uint64_t sub_1A938C494@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for Wind();
  MEMORY[0x1F4188790](v78);
  uint64_t v12 = (uint64_t)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (uint64_t)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v77 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v83 = (uint64_t)&v64 - v19;
  MEMORY[0x1F4188790](v20);
  uint64_t v82 = (uint64_t)&v64 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v76 = (char *)&v64 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v75 = (char *)&v64 - v25;
  MEMORY[0x1F4188790](v26);
  uint64_t v81 = (char *)&v64 - v27;
  uint64_t v72 = sub_1A93ABC08();
  uint64_t v28 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  uint64_t v80 = (uint64_t)&v64 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for CLLocationCoordinate2D.SolarEvents();
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&v64 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1A93ABDD8();
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x1F4188790](v74);
  id v34 = (char *)&v64 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E97B7F28 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_once();
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_20;
  }
LABEL_3:
  if (*(void *)(qword_1E97EA558 + 16) > a2)
  {
    uint64_t v79 = v15;
    uint64_t v69 = (unsigned char *)v12;
    uint64_t v70 = v10;
    unint64_t v71 = a3;
    uint64_t v12 = *(unsigned __int8 *)(qword_1E97EA558 + a2 + 32);
    type metadata accessor for WeatherConditionSymbolMapper();
    swift_initStaticObject();
    sub_1A93ABDC8();
    v91.i8[0] = v12;
    double v3 = 37.323;
    double v4 = -122.0;
    a3 = sub_1A93AB384(&v91, a1, 37.323, -122.0);
    uint64_t v10 = v35;
    uint64_t result = sub_1A91D59C4(v12, 22);
    LOBYTE(v15) = result;
    if (qword_1E97B7F20 == -1) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = swift_once();
LABEL_5:
  if (*(void *)(qword_1E97EA550 + 16) <= a2)
  {
    __break(1u);
  }
  else
  {
    unint64_t v37 = 0xEC0000006C6C6966;
    if (v10) {
      unint64_t v37 = (unint64_t)v10;
    }
    unint64_t v68 = v37;
    uint64_t v38 = 0x2E78616D2E6E7573;
    if (v10) {
      uint64_t v38 = a3;
    }
    uint64_t v67 = v38;
    if (v15) {
      double v39 = 0.3;
    }
    else {
      double v39 = 0.0;
    }
    if (v15) {
      char v40 = 3;
    }
    else {
      char v40 = 0;
    }
    uint64_t v66 = v34;
    CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)(a1, (uint64_t)v32, v3, v4);
    int v41 = v32[*(int *)(v30 + 24)];
    sub_1A938D668((uint64_t)v32);
    int v65 = v41;
    uint64_t v42 = 5;
    if (!v41) {
      uint64_t v42 = 0;
    }
    uint64_t v64 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v80, a1, v72);
    int64x2_t v91 = vdupq_n_s64(0x3FC999999999999AuLL);
    uint64_t v92 = 0x3FC999999999999ALL;
    char v90 = v12;
    uint64_t v43 = self;
    id v44 = objc_msgSend(v43, sel_fahrenheit);
    sub_1A91CF228(0, qword_1EB657120);
    sub_1A93AB8B8();
    char v89 = v40;
    unint64_t v45 = self;
    id v46 = objc_msgSend(v45, sel_inches);
    sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
    sub_1A93AB8B8();
    id v47 = objc_msgSend(v45, sel_inches);
    sub_1A93AB8B8();
    uint64_t v87 = 0x3FC999999999999ALL;
    char v88 = 0;
    id v48 = objc_msgSend(self, sel_inchesOfMercury);
    sub_1A91CF228(0, &qword_1EB658518);
    sub_1A93AB8B8();
    char v86 = 0;
    id v49 = objc_msgSend(v43, sel_fahrenheit);
    uint64_t v50 = (uint64_t)v75;
    sub_1A93AB8B8();
    id v51 = objc_msgSend(v43, sel_fahrenheit);
    uint64_t v52 = (uint64_t)v76;
    sub_1A93AB8B8();
    uint64_t v84 = v64;
    char v85 = v41;
    id v53 = objc_msgSend(v45, sel_miles);
    uint64_t v54 = (uint64_t)v77;
    sub_1A93AB8B8();
    id v55 = objc_msgSend(self, sel_degrees);
    uint64_t v56 = v78;
    uint64_t v57 = v69;
    sub_1A91CF228(0, &qword_1EB658500);
    sub_1A93AB8B8();
    uint64_t v58 = self;
    id v59 = objc_msgSend(v58, sel_kilometersPerHour);
    sub_1A91CF228(0, (unint64_t *)&qword_1EB658508);
    sub_1A93AB8B8();
    id v60 = objc_msgSend(v58, sel_kilometersPerHour);
    uint64_t v61 = (uint64_t)v70;
    sub_1A93AB8B8();
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    __swift_storeEnumTagSinglePayload(v61, 0, 1, v62);
    uint64_t v63 = (uint64_t)&v57[*(int *)(v56 + 28)];
    __swift_storeEnumTagSinglePayload(v63, 1, 1, v62);
    *uint64_t v57 = 4;
    sub_1A920B358(v61, v63);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v74);
    return HourWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:cloudCoverByAltitude:condition:symbolName:dewPoint:humidity:isDaylight:precipitation:precipitationChance:precipitationAmount:snowfallAmount:apparentPrecipitationIntensity:pressure:pressureTrend:temperature:apparentTemperature:uvIndex:visibility:wind:)(v80, (long long *)v91.i8, &v90, v67, v68, v65, &v89, v71, 0.2, 0.2, 0.2, 0.2, 0.55, v39, v82, v83, &v87, v79, &v86,
             v50,
             v52,
             &v84,
             v54,
             (uint64_t)v57);
  }
  return result;
}

uint64_t static HourWeather.mock()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6552B8);
  uint64_t v3 = OUTLINED_FUNCTION_1(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB658368);
  uint64_t v8 = OUTLINED_FUNCTION_1(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10 - v9;
  static Forecast<>.mock()((uint64_t *)(v10 - v9));
  uint64_t v12 = *(void *)v11;
  uint64_t v13 = *(void *)(*(void *)v11 + 16);
  uint64_t v14 = type metadata accessor for HourWeather();
  uint64_t v15 = v14;
  if (v13)
  {
    sub_1A938D034(v12+ ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80)), v6);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 1;
  }
  __swift_storeEnumTagSinglePayload(v6, v16, 1, v15);
  sub_1A91A6D88(v11, (uint64_t *)&unk_1EB658368);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v15);
  if (result != 1) {
    return sub_1A938CFD0(v6, a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A938CF88(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, &qword_1E97BC810, MEMORY[0x1E4F27928], MEMORY[0x1E4F27928]);
}

uint64_t sub_1A938CFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HourWeather();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A938D034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HourWeather();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A938D098(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, &qword_1EB656C48, (uint64_t (*)(void))type metadata accessor for DayWeather, (uint64_t (*)(void))type metadata accessor for DayWeather);
}

uint64_t sub_1A938D0E0(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, qword_1EB655780, (uint64_t (*)(void))type metadata accessor for WeatherChange, (uint64_t (*)(void))type metadata accessor for WeatherChange);
}

uint64_t sub_1A938D128(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, &qword_1E97B8860, (uint64_t (*)(void))type metadata accessor for HistoricalComparison, (uint64_t (*)(void))type metadata accessor for HistoricalComparison);
}

uint64_t sub_1A938D170(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, &qword_1E97BC800, type metadata accessor for HistoricalFact, type metadata accessor for HistoricalFact);
}

uint64_t sub_1A938D1B8(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1A91C7A48(a1, a2, a3, a4, &qword_1E97BC808, (uint64_t (*)(void))type metadata accessor for InstantWeather, (uint64_t (*)(void))type metadata accessor for InstantWeather);
}

void sub_1A938D200(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D218(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D230(uint64_t a1, uint64_t a2)
{
}

char *sub_1A938D248(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_34();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_37(a3, result);
  }
  return result;
}

char *sub_1A938D2A4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_34();
    __break(1u);
  }
  else if (a3 != result || &result[88 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_37(a3, result);
  }
  return result;
}

char *sub_1A938D308(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_34();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_37(a3, result);
  }
  return result;
}

void sub_1A938D36C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D384(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D39C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D3B4(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D3CC(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D3E4(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D3FC(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D414(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D42C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D444(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D45C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D474(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D48C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D4A4(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D4BC(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D4D4(uint64_t a1, uint64_t a2)
{
}

char *sub_1A938D4F0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_2_3();
    __src = (char *)OUTLINED_FUNCTION_1_34();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_1A938D560(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D56C(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D578(uint64_t a1, uint64_t a2)
{
}

void sub_1A938D584(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_1_34();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_9_34();
    if (v6
      && (__swift_instantiateConcreteTypeFromMangledName(v5), OUTLINED_FUNCTION_11(),
                                                              v3 + *(void *)(v7 + 72) * v2 > v4))
    {
      if (v4 != v3)
      {
        OUTLINED_FUNCTION_5_40();
        swift_arrayInitWithTakeBackToFront();
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v5);
      OUTLINED_FUNCTION_5_40();
      swift_arrayInitWithTakeFrontToBack();
    }
  }
}

uint64_t sub_1A938D668(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CLLocationCoordinate2D.SolarEvents();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WeatherServiceFetchOptions.countryCode.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WeatherServiceFetchOptions.countryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*WeatherServiceFetchOptions.countryCode.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.timeZone.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_42();
  return sub_1A91B5004(v1 + *(int *)(v2 + 20), v0, (uint64_t *)&unk_1EB657350);
}

uint64_t WeatherServiceFetchOptions.timeZone.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_35();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 20), (uint64_t *)&unk_1EB657350);
}

double (*WeatherServiceFetchOptions.timeZone.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.locationOptions.getter()
{
  uint64_t result = OUTLINED_FUNCTION_3_42();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(result + 24));
  uint64_t v4 = *v3;
  LOWORD(v3) = *((_WORD *)v3 + 4);
  *(void *)uint64_t v0 = v4;
  *(_WORD *)(v0 + 8) = (_WORD)v3;
  return result;
}

uint64_t WeatherServiceFetchOptions.locationOptions.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  __int16 v3 = *((_WORD *)a1 + 4);
  uint64_t result = type metadata accessor for WeatherServiceFetchOptions();
  uint64_t v5 = v1 + *(int *)(result + 24);
  *(void *)uint64_t v5 = v2;
  *(_WORD *)(v5 + 8) = v3;
  return result;
}

double (*WeatherServiceFetchOptions.locationOptions.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.cachingOptions.getter()
{
  uint64_t result = OUTLINED_FUNCTION_3_42();
  *uint64_t v0 = *(void *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t WeatherServiceFetchOptions.cachingOptions.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for WeatherServiceFetchOptions();
  *(void *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

double (*WeatherServiceFetchOptions.cachingOptions.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.treatmentIdentifiers.getter()
{
  type metadata accessor for WeatherServiceFetchOptions();

  return swift_bridgeObjectRetain();
}

uint64_t WeatherServiceFetchOptions.treatmentIdentifiers.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_35() + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

double (*WeatherServiceFetchOptions.treatmentIdentifiers.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.networkActivity.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_42();
  return sub_1A91B5004(v1 + *(int *)(v2 + 36), v0, &qword_1EB657980);
}

uint64_t WeatherServiceFetchOptions.networkActivity.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_35();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 36), &qword_1EB657980);
}

double (*WeatherServiceFetchOptions.networkActivity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.needsMarineData.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WeatherServiceFetchOptions() + 40));
}

uint64_t WeatherServiceFetchOptions.needsMarineData.setter(char a1)
{
  uint64_t result = type metadata accessor for WeatherServiceFetchOptions();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

double (*WeatherServiceFetchOptions.needsMarineData.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.needsTwilightData.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WeatherServiceFetchOptions() + 44));
}

uint64_t WeatherServiceFetchOptions.needsTwilightData.setter(char a1)
{
  uint64_t result = type metadata accessor for WeatherServiceFetchOptions();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

double (*WeatherServiceFetchOptions.needsTwilightData.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.now.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_42();
  return sub_1A91B5004(v1 + *(int *)(v2 + 48), v0, &qword_1EB657328);
}

uint64_t WeatherServiceFetchOptions.now.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_35();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 48), &qword_1EB657328);
}

double (*WeatherServiceFetchOptions.now.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherServiceFetchOptions.requestDenyList.getter()
{
  type metadata accessor for WeatherServiceFetchOptions();

  return swift_bridgeObjectRetain();
}

uint64_t WeatherServiceFetchOptions.requestDenyList.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_35() + 52);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t WeatherServiceFetchOptions.with(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:needsMarineData:needsTwilightData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, void *a9@<X8>)
{
  uint64_t v10 = v9;
  int v80 = a7;
  int v81 = a8;
  uint64_t v82 = a6;
  uint64_t v84 = a3;
  uint64_t v89 = a1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v93 = (uint64_t)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v92 = (uint64_t)&v79 - v21;
  uint64_t Options = (int *)type metadata accessor for WeatherServiceFetchOptions();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v23);
  uint64_t v83 = (char *)&v79 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v25);
  uint64_t v87 = (uint64_t)&v79 - v26;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v27);
  uint64_t v86 = (uint64_t)&v79 - v28;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v29);
  uint64_t v85 = (uint64_t)&v79 - v30;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v79 - v32;
  MEMORY[0x1F4188790](v34);
  uint64_t v36 = (char *)&v79 - v35;
  MEMORY[0x1F4188790](v37);
  double v39 = (uint64_t *)((char *)&v79 - v38);
  uint64_t v40 = *a4;
  int v41 = *((unsigned __int16 *)a4 + 4);
  uint64_t v42 = *a5;
  uint64_t v90 = v40;
  uint64_t v91 = v42;
  int v43 = *((unsigned __int8 *)a5 + 8);
  sub_1A938E2DC(v10, (uint64_t)&v79 - v38);
  uint64_t v88 = a2;
  if (!a2)
  {
    uint64_t v44 = *v39;
    uint64_t v88 = v39[1];
    uint64_t v89 = v44;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_1A938EEB0((uint64_t)v39, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  sub_1A91B5004(v84, (uint64_t)v19, (uint64_t *)&unk_1EB657350);
  sub_1A938E2DC(v10, (uint64_t)v36);
  uint64_t v45 = sub_1A93ABDD8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v45) == 1)
  {
    sub_1A91B5004((uint64_t)&v36[Options[5]], v92, (uint64_t *)&unk_1EB657350);
    sub_1A938EEB0((uint64_t)v36, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
    sub_1A92F6614((uint64_t)v19);
  }
  else
  {
    sub_1A938EEB0((uint64_t)v36, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
    uint64_t v46 = v92;
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v92, v19, v45);
    __swift_storeEnumTagSinglePayload(v46, 0, 1, v45);
  }
  int v47 = v41;
  uint64_t v48 = v82;
  unsigned __int8 v50 = v80;
  unsigned __int8 v49 = v81;
  sub_1A938E2DC(v10, (uint64_t)v33);
  if ((v47 & 0xFF00) == 0x300)
  {
    id v51 = &v33[Options[6]];
    uint64_t v90 = *(void *)v51;
    int v47 = *((unsigned __int16 *)v51 + 4);
  }
  sub_1A938EEB0((uint64_t)v33, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  uint64_t v52 = v85;
  sub_1A938E2DC(v10, v85);
  uint64_t v53 = v52;
  if (v43) {
    uint64_t v91 = *(void *)(v52 + Options[7]);
  }
  LODWORD(v82) = v47;
  uint64_t v84 = v45;
  int v54 = v50;
  sub_1A938EEB0(v53, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  uint64_t v55 = v10;
  uint64_t v56 = v10;
  uint64_t v57 = v86;
  sub_1A938E2DC(v56, v86);
  if (v48)
  {
    uint64_t v58 = v48;
  }
  else
  {
    uint64_t v58 = *(void *)(v57 + Options[8]);
    swift_bridgeObjectRetain();
  }
  int v59 = v49;
  swift_bridgeObjectRetain();
  sub_1A938EEB0(v57, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  uint64_t v60 = type metadata accessor for WeatherNetworkActivity();
  __swift_storeEnumTagSinglePayload(v93, 1, 1, v60);
  uint64_t v61 = v87;
  sub_1A938E2DC(v55, v87);
  __int16 v62 = v82;
  if (v54 == 2) {
    char v63 = *(unsigned char *)(v61 + Options[10]);
  }
  else {
    char v63 = v54 & 1;
  }
  uint64_t v64 = v61;
  uint64_t v65 = v58;
  uint64_t v66 = (uint64_t)v83;
  uint64_t v67 = v84;
  sub_1A938EEB0(v64, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  sub_1A938E2DC(v55, v66);
  if (v59 == 2) {
    char v68 = *(unsigned char *)(v66 + Options[11]);
  }
  else {
    char v68 = v59 & 1;
  }
  sub_1A938EEB0(v66, (void (*)(void))type metadata accessor for WeatherServiceFetchOptions);
  uint64_t v69 = (uint64_t)a9 + Options[5];
  __swift_storeEnumTagSinglePayload(v69, 1, 1, v67);
  uint64_t v70 = (char *)a9 + Options[6];
  *(void *)uint64_t v70 = 0;
  *((_WORD *)v70 + 4) = 768;
  uint64_t v71 = (uint64_t)a9 + Options[9];
  __swift_storeEnumTagSinglePayload(v71, 1, 1, v60);
  uint64_t v72 = (uint64_t)a9 + Options[12];
  uint64_t v73 = sub_1A93ABC08();
  OUTLINED_FUNCTION_167(v72, v74, v75, v73);
  *(void *)((char *)a9 + Options[13]) = MEMORY[0x1E4FBC860];
  uint64_t v76 = v88;
  *a9 = v89;
  a9[1] = v76;
  sub_1A91B70A4(v92, v69, (uint64_t *)&unk_1EB657350);
  uint64_t v77 = v91;
  *(void *)uint64_t v70 = v90;
  *((_WORD *)v70 + 4) = v62;
  *(void *)((char *)a9 + Options[7]) = v77;
  *(void *)((char *)a9 + Options[8]) = v65;
  uint64_t result = sub_1A91B70A4(v93, v71, &qword_1EB657980);
  *((unsigned char *)a9 + Options[10]) = v63;
  *((unsigned char *)a9 + Options[11]) = v68;
  return result;
}

uint64_t sub_1A938E2DC(uint64_t a1, uint64_t a2)
{
  uint64_t Options = type metadata accessor for WeatherServiceFetchOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Options - 8) + 16))(a2, a1, Options);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for WeatherServiceFetchOptions(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A93ABDD8();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)v4 + v14;
    uint64_t v17 = (char *)a2 + v14;
    *(void *)uint64_t v16 = *(void *)v17;
    *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
    *(void *)((char *)v4 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v18 = a3[9];
    *(void *)((char *)v4 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = type metadata accessor for WeatherNetworkActivity();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      *uint64_t v19 = *v20;
      v19[1] = v20[1];
      uint64_t v23 = *(int *)(v21 + 24);
      uint64_t v24 = &v19[v23];
      uint64_t v25 = &v20[v23];
      uint64_t v26 = sub_1A93ABC48();
      if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
        __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
      }
      uint64_t v28 = *(int *)(v21 + 28);
      uint64_t v29 = &v19[v28];
      uint64_t v30 = &v20[v28];
      if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v26))
      {
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v26 - 8) + 16))(v29, v30, v26);
        __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v26);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
    }
    uint64_t v32 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *((unsigned char *)v4 + v32) = *((unsigned char *)a2 + v32);
    uint64_t v33 = a3[12];
    uint64_t v34 = (char *)v4 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = sub_1A93ABC08();
    if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
      __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
    }
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

void *assignWithCopy for WeatherServiceFetchOptions(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABDD8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)v16;
  *((_WORD *)v15 + 4) = *((_WORD *)v16 + 4);
  *(void *)uint64_t v15 = v17;
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for WeatherNetworkActivity();
  int v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v21);
  int v23 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21);
  if (v22)
  {
    if (!v23)
    {
      *uint64_t v19 = *v20;
      v19[1] = v20[1];
      uint64_t v24 = *(int *)(v21 + 24);
      uint64_t v25 = &v19[v24];
      uint64_t v26 = &v20[v24];
      uint64_t v27 = sub_1A93ABC48();
      if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
      }
      uint64_t v38 = *(int *)(v21 + 28);
      double v39 = &v19[v38];
      uint64_t v40 = &v20[v38];
      if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v27))
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v27 - 8) + 16))(v39, v40, v27);
        __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v27);
      }
      uint64_t v42 = (uint64_t)v19;
      uint64_t v43 = v21;
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  if (v23)
  {
    sub_1A938EEB0((uint64_t)v19, (void (*)(void))type metadata accessor for WeatherNetworkActivity);
LABEL_13:
    size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980) - 8) + 64);
    uint64_t v30 = v19;
    uint64_t v31 = v20;
LABEL_14:
    memcpy(v30, v31, v29);
    goto LABEL_25;
  }
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  uint64_t v32 = *(int *)(v21 + 24);
  uint64_t v33 = &v19[v32];
  uint64_t v34 = &v20[v32];
  uint64_t v35 = sub_1A93ABC48();
  int v36 = __swift_getEnumTagSinglePayload((uint64_t)v33, 1, v35);
  int v37 = __swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  uint64_t v53 = *(void *)(v35 - 8);
  if (v37)
  {
    (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v33, v35);
LABEL_35:
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
    memcpy(v33, v34, *(void *)(*(void *)(v54 - 8) + 64));
    goto LABEL_36;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v53 + 24))(v33, v34, v35);
LABEL_36:
  uint64_t v55 = *(int *)(v21 + 28);
  uint64_t v56 = (uint64_t)&v19[v55];
  uint64_t v57 = (uint64_t)&v20[v55];
  int v58 = __swift_getEnumTagSinglePayload(v56, 1, v35);
  int v59 = __swift_getEnumTagSinglePayload(v57, 1, v35);
  if (v58)
  {
    if (!v59)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v56, v57, v35);
      uint64_t v42 = v56;
      uint64_t v43 = v35;
LABEL_24:
      __swift_storeEnumTagSinglePayload(v42, 0, 1, v43);
      goto LABEL_25;
    }
    goto LABEL_41;
  }
  uint64_t v60 = *(void *)(v35 - 8);
  if (v59)
  {
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v56, v35);
LABEL_41:
    size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338) - 8) + 64);
    uint64_t v30 = (void *)v56;
    uint64_t v31 = (const void *)v57;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 24))(v56, v57, v35);
LABEL_25:
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v44 = a3[12];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  uint64_t v47 = sub_1A93ABC08();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v50 + 24))(v45, v46, v47);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_30;
  }
  if (v49)
  {
LABEL_30:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_31:
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A938EEB0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

_OWORD *initializeWithTake for WeatherServiceFetchOptions(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABDD8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *((_WORD *)v13 + 4) = *((_WORD *)v14 + 4);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v15 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for WeatherNetworkActivity();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    *uint64_t v16 = *v17;
    v16[1] = v17[1];
    uint64_t v20 = *(int *)(v18 + 24);
    uint64_t v21 = &v16[v20];
    int v22 = &v17[v20];
    uint64_t v23 = sub_1A93ABC48();
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
    }
    uint64_t v25 = *(int *)(v18 + 28);
    uint64_t v26 = &v16[v25];
    uint64_t v27 = &v17[v25];
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v23))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v26, v27, v23);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v23);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  }
  uint64_t v29 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
  uint64_t v30 = a3[12];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_1A93ABC08();
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
  }
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  return a1;
}

void *assignWithTake for WeatherServiceFetchOptions(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A93ABDD8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v15;
  uint64_t v18 = (char *)a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *((_WORD *)v17 + 4) = *((_WORD *)v18 + 4);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[9];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = type metadata accessor for WeatherNetworkActivity();
  int v23 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v22);
  int v24 = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22);
  if (v23)
  {
    if (!v24)
    {
      *uint64_t v20 = *v21;
      v20[1] = v21[1];
      uint64_t v25 = *(int *)(v22 + 24);
      uint64_t v26 = &v20[v25];
      uint64_t v27 = &v21[v25];
      uint64_t v28 = sub_1A93ABC48();
      if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
      }
      uint64_t v39 = *(int *)(v22 + 28);
      uint64_t v40 = &v20[v39];
      uint64_t v41 = &v21[v39];
      if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v28))
      {
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
        memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v28 - 8) + 32))(v40, v41, v28);
        __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v28);
      }
      uint64_t v43 = (uint64_t)v20;
      uint64_t v44 = v22;
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  if (v24)
  {
    sub_1A938EEB0((uint64_t)v20, (void (*)(void))type metadata accessor for WeatherNetworkActivity);
LABEL_13:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980) - 8) + 64);
    uint64_t v31 = v20;
    uint64_t v32 = v21;
LABEL_14:
    memcpy(v31, v32, v30);
    goto LABEL_25;
  }
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  uint64_t v33 = *(int *)(v22 + 24);
  uint64_t v34 = &v20[v33];
  uint64_t v35 = &v21[v33];
  uint64_t v36 = sub_1A93ABC48();
  int v37 = __swift_getEnumTagSinglePayload((uint64_t)v34, 1, v36);
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
      __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  uint64_t v55 = *(void *)(v36 - 8);
  if (v38)
  {
    (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v34, v36);
LABEL_35:
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338);
    memcpy(v34, v35, *(void *)(*(void *)(v56 - 8) + 64));
    goto LABEL_36;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 40))(v34, v35, v36);
LABEL_36:
  uint64_t v57 = *(int *)(v22 + 28);
  uint64_t v58 = (uint64_t)&v20[v57];
  uint64_t v59 = (uint64_t)&v21[v57];
  int v60 = __swift_getEnumTagSinglePayload(v58, 1, v36);
  int v61 = __swift_getEnumTagSinglePayload(v59, 1, v36);
  if (v60)
  {
    if (!v61)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 32))(v58, v59, v36);
      uint64_t v43 = v58;
      uint64_t v44 = v36;
LABEL_24:
      __swift_storeEnumTagSinglePayload(v43, 0, 1, v44);
      goto LABEL_25;
    }
    goto LABEL_41;
  }
  uint64_t v62 = *(void *)(v36 - 8);
  if (v61)
  {
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v58, v36);
LABEL_41:
    size_t v30 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB657338) - 8) + 64);
    uint64_t v31 = (void *)v58;
    uint64_t v32 = (const void *)v59;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 40))(v58, v59, v36);
LABEL_25:
  uint64_t v45 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + v45) = *((unsigned char *)a2 + v45);
  uint64_t v46 = a3[12];
  uint64_t v47 = (char *)a1 + v46;
  int v48 = (char *)a2 + v46;
  uint64_t v49 = sub_1A93ABC08();
  int v50 = __swift_getEnumTagSinglePayload((uint64_t)v47, 1, v49);
  int v51 = __swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49);
  if (!v50)
  {
    uint64_t v52 = *(void *)(v49 - 8);
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 40))(v47, v48, v49);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v47, v49);
    goto LABEL_30;
  }
  if (v51)
  {
LABEL_30:
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v47, v48, *(void *)(*(void *)(v53 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
  __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
LABEL_31:
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherServiceFetchOptions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A938FA00);
}

uint64_t sub_1A938FA00(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[5];
    goto LABEL_10;
  }
  if (a2 != 0x7FFFFFFF)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v9 = a3[9];
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      uint64_t v9 = a3[12];
    }
LABEL_10:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  unint64_t v10 = *(void *)(a1 + a3[8]);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherServiceFetchOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A938FAF4);
}

void sub_1A938FAF4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB657350);
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[8]) = (a2 - 1);
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657980);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v11 = a4[9];
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      uint64_t v11 = a4[12];
    }
  }

  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

uint64_t static CurrentWeather.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v99 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_9();
  uint64_t v97 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB655288);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_112();
  uint64_t v98 = v11;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v92 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
  MEMORY[0x1F4188790](v15 - 8);
  OUTLINED_FUNCTION_112();
  uint64_t v96 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_42_7();
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v92 - v19;
  MEMORY[0x1F4188790](v21);
  int v23 = (char *)&v92 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v92 - v25;
  MEMORY[0x1F4188790](v27);
  uint64_t v29 = (char *)&v92 - v28;
  if ((sub_1A93ABBB8() & 1) == 0) {
    goto LABEL_63;
  }
  uint64_t v30 = type metadata accessor for CurrentWeather();
  OUTLINED_FUNCTION_20_19(*(int *)(v30 + 20));
  if (!v40) {
    goto LABEL_63;
  }
  OUTLINED_FUNCTION_20_19(*(int *)(v31 + 24));
  if (!v40) {
    goto LABEL_63;
  }
  OUTLINED_FUNCTION_20_19(*(int *)(v32 + 28));
  if (!v40) {
    goto LABEL_63;
  }
  OUTLINED_FUNCTION_20_19(*(int *)(v33 + 32));
  if (!v40) {
    goto LABEL_63;
  }
  uint64_t v35 = v34[9];
  double v36 = *(double *)(a1 + v35);
  double v37 = *(double *)(a1 + v35 + 8);
  double v38 = *(double *)(a1 + v35 + 16);
  uint64_t v39 = (double *)(a2 + v35);
  BOOL v40 = v36 == *v39 && v37 == v39[1];
  if (!v40 || v38 != v39[2]) {
    goto LABEL_63;
  }
  uint64_t v42 = v34[10];
  uint64_t v43 = *(unsigned __int8 *)(a2 + v42);
  uint64_t v44 = *(unsigned __int8 *)(a1 + v42);
  uint64_t v95 = v34;
  if ((sub_1A91D59C4(v44, v43) & 1) == 0) {
    goto LABEL_63;
  }
  uint64_t v45 = v95[11];
  uint64_t v46 = *(void *)(a1 + v45);
  uint64_t v47 = *(void *)(a1 + v45 + 8);
  int v48 = (void *)(a2 + v45);
  BOOL v49 = v46 == *v48 && v47 == v48[1];
  int v50 = v95;
  if (v49 || (v51 = sub_1A93AE4B8(), v50 = v95, v52 = v51, char v53 = 0, (v52 & 1) != 0))
  {
    uint64_t v54 = v50[12];
    uint64_t v93 = a2 + v54;
    int v94 = (char *)(a1 + v54);
    int v94 = (char *)sub_1A91CF228(0, qword_1EB657120);
    if ((sub_1A93AB8A8() & 1) == 0) {
      goto LABEL_63;
    }
    OUTLINED_FUNCTION_20_19(v95[13]);
    if (!v40) {
      goto LABEL_63;
    }
    uint64_t v56 = *(int *)(v55 + 56);
    uint64_t v92 = a2 + v56;
    uint64_t v93 = a1 + v56;
    sub_1A91CF228(0, (unint64_t *)&qword_1EB658508);
    if ((OUTLINED_FUNCTION_34_8() & 1) == 0) {
      goto LABEL_63;
    }
    uint64_t v57 = v95[15];
    uint64_t v92 = a2 + v57;
    uint64_t v93 = a1 + v57;
    sub_1A91CF228(0, &qword_1EB658518);
    if ((OUTLINED_FUNCTION_34_8() & 1) == 0) {
      goto LABEL_63;
    }
    if ((sub_1A91E7974(*(unsigned char *)(a1 + v95[16]), *(unsigned char *)(a2 + v95[16])) & 1) == 0) {
      goto LABEL_63;
    }
    if ((static PrecipitationAmount.== infix(_:_:)() & 1) == 0) {
      goto LABEL_63;
    }
    if ((static PrecipitationAmount.== infix(_:_:)() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_28_13() & 1) == 0) {
      goto LABEL_63;
    }
    uint64_t v58 = v95[25];
    uint64_t v59 = a1 + v58;
    double v60 = *(double *)(a1 + v58);
    uint64_t v61 = a2 + v58;
    if (v60 != *(double *)v61
      || (sub_1A91E75A8(*(unsigned __int8 *)(v59 + 8), *(unsigned __int8 *)(v61 + 8), v60) & 1) == 0
      || *(unsigned __int8 *)(a1 + v95[26]) != *(unsigned __int8 *)(a2 + v95[26])
      || (OUTLINED_FUNCTION_34_8() & 1) == 0
      || (OUTLINED_FUNCTION_34_8() & 1) == 0)
    {
      goto LABEL_63;
    }
    sub_1A93905E0(a1 + v95[29], (uint64_t)v29);
    sub_1A93905E0(a2 + v95[29], (uint64_t)v26);
    int v94 = &v14[*(int *)(v9 + 48)];
    sub_1A93905E0((uint64_t)v29, (uint64_t)v14);
    sub_1A93905E0((uint64_t)v26, (uint64_t)v94);
    OUTLINED_FUNCTION_1_9((uint64_t)v14);
    if (v40)
    {
      sub_1A91A6D38((uint64_t)v26, &qword_1EB6571A8);
      sub_1A91A6D38((uint64_t)v29, &qword_1EB6571A8);
      OUTLINED_FUNCTION_1_9((uint64_t)v94);
      if (v40)
      {
        sub_1A91A6D38((uint64_t)v14, &qword_1EB6571A8);
LABEL_53:
        uint64_t v69 = v95;
        sub_1A93905E0(a1 + v95[30], (uint64_t)v20);
        sub_1A93905E0(a2 + v69[30], v2);
        uint64_t v70 = v98;
        uint64_t v71 = v98 + *(int *)(v9 + 48);
        sub_1A93905E0((uint64_t)v20, v98);
        sub_1A93905E0(v2, v71);
        OUTLINED_FUNCTION_1_9(v70);
        if (v40)
        {
          sub_1A91A6D38(v2, &qword_1EB6571A8);
          sub_1A91A6D38((uint64_t)v20, &qword_1EB6571A8);
          OUTLINED_FUNCTION_1_9(v71);
          if (v40)
          {
            sub_1A91A6D38(v98, &qword_1EB6571A8);
            goto LABEL_66;
          }
        }
        else
        {
          sub_1A93905E0(v98, v96);
          OUTLINED_FUNCTION_1_9(v71);
          if (!v72)
          {
            uint64_t v75 = v99;
            uint64_t v76 = v97;
            OUTLINED_FUNCTION_48();
            v77();
            sub_1A91F1C70(&qword_1EB655278, &qword_1EB6571E0);
            uint64_t v78 = v96;
            char v79 = sub_1A93ADDB8();
            int v80 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
            v80(v76, v5);
            sub_1A91A6D38(v2, &qword_1EB6571A8);
            sub_1A91A6D38((uint64_t)v20, &qword_1EB6571A8);
            v80(v78, v5);
            sub_1A91A6D38(v98, &qword_1EB6571A8);
            if (v79)
            {
LABEL_66:
              uint64_t v81 = v95[31];
              uint64_t v82 = a1 + v81;
              uint64_t v83 = *(void *)(a1 + v81);
              uint64_t v84 = a2 + v81;
              if (v83 == *(void *)v84)
              {
                char v85 = *(unsigned char *)(v84 + 8);
                uint64_t v86 = UVIndex.ExposureCategory.rawValue.getter(*(unsigned char *)(v82 + 8));
                uint64_t v88 = v87;
                if (v86 == UVIndex.ExposureCategory.rawValue.getter(v85) && v88 == v89)
                {
                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  char v91 = sub_1A93AE4B8();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  char v53 = 0;
                  if ((v91 & 1) == 0) {
                    return v53 & 1;
                  }
                }
                sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
                if ((OUTLINED_FUNCTION_34_8() & 1) != 0
                  && static Wind.== infix(_:_:)((char *)(a1 + v95[33]), (char *)(a2 + v95[33])))
                {
                  char v53 = static WeatherMetadata.== infix(_:_:)(a1 + v95[34], a2 + v95[34]);
                  return v53 & 1;
                }
              }
            }
LABEL_63:
            char v53 = 0;
            return v53 & 1;
          }
          sub_1A91A6D38(v2, &qword_1EB6571A8);
          sub_1A91A6D38((uint64_t)v20, &qword_1EB6571A8);
          OUTLINED_FUNCTION_30_13();
          v73();
        }
        uint64_t v64 = v98;
LABEL_62:
        sub_1A91A6D38(v64, &qword_1EB655288);
        goto LABEL_63;
      }
    }
    else
    {
      sub_1A93905E0((uint64_t)v14, (uint64_t)v23);
      OUTLINED_FUNCTION_1_9((uint64_t)v94);
      if (!v62)
      {
        OUTLINED_FUNCTION_48();
        v65();
        sub_1A91F1C70(&qword_1EB655278, &qword_1EB6571E0);
        LODWORD(v92) = sub_1A93ADDB8();
        uint64_t v66 = *(void *)(v99 + 8);
        uint64_t v93 = v99 + 8;
        int v94 = (char *)v66;
        OUTLINED_FUNCTION_27();
        v67();
        sub_1A91A6D38((uint64_t)v26, &qword_1EB6571A8);
        sub_1A91A6D38((uint64_t)v29, &qword_1EB6571A8);
        OUTLINED_FUNCTION_27();
        v68();
        sub_1A91A6D38((uint64_t)v14, &qword_1EB6571A8);
        if ((v92 & 1) == 0) {
          goto LABEL_63;
        }
        goto LABEL_53;
      }
      sub_1A91A6D38((uint64_t)v26, &qword_1EB6571A8);
      sub_1A91A6D38((uint64_t)v29, &qword_1EB6571A8);
      OUTLINED_FUNCTION_30_13();
      v63();
    }
    uint64_t v64 = (uint64_t)v14;
    goto LABEL_62;
  }
  return v53 & 1;
}

BOOL CurrentWeather.isExpired.getter()
{
  uint64_t v0 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  sub_1A93ABBF8();
  type metadata accessor for CurrentWeather();
  type metadata accessor for WeatherMetadata();
  sub_1A93948F4((unint64_t *)&qword_1EB6565C8, MEMORY[0x1E4F27928]);
  char v7 = sub_1A93ADDA8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return (v7 & 1) == 0;
}

uint64_t sub_1A93905E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CurrentWeather.date.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*CurrentWeather.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.cloudCover.setter()
{
  uint64_t result = OUTLINED_FUNCTION_37_11();
  *(void *)(v0 + *(int *)(result + 20)) = v1;
  return result;
}

double (*CurrentWeather.cloudCover.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.cloudCoverLow.setter()
{
  uint64_t result = OUTLINED_FUNCTION_37_11();
  *(void *)(v0 + *(int *)(result + 24)) = v1;
  return result;
}

double (*CurrentWeather.cloudCoverLow.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.cloudCoverMid.setter()
{
  uint64_t result = OUTLINED_FUNCTION_37_11();
  *(void *)(v0 + *(int *)(result + 28)) = v1;
  return result;
}

double (*CurrentWeather.cloudCoverMid.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.cloudCoverHigh.setter()
{
  uint64_t result = OUTLINED_FUNCTION_37_11();
  *(void *)(v0 + *(int *)(result + 32)) = v1;
  return result;
}

double (*CurrentWeather.cloudCoverHigh.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double CurrentWeather.cloudCoverByAltitude.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_43() + 36);
  double result = *(double *)(v2 + 16);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v2;
  *(double *)(v0 + 16) = result;
  return result;
}

__n128 CurrentWeather.cloudCoverByAltitude.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  uint64_t v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for CurrentWeather() + 36));
  __n128 result = v5;
  *uint64_t v3 = v5;
  v3[1].n128_u64[0] = v2;
  return result;
}

double (*CurrentWeather.cloudCoverByAltitude.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.condition.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for CurrentWeather();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

double (*CurrentWeather.condition.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.symbolName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CurrentWeather() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CurrentWeather.symbolName.setter(uint64_t a1, uint64_t a2)
{
  __n128 v5 = (void *)(v2 + *(int *)(type metadata accessor for CurrentWeather() + 44));
  uint64_t result = swift_bridgeObjectRelease();
  *__n128 v5 = a1;
  v5[1] = a2;
  return result;
}

double (*CurrentWeather.symbolName.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.dewPoint.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.dewPoint.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.humidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_37_11();
  *(void *)(v0 + *(int *)(result + 52)) = v1;
  return result;
}

double (*CurrentWeather.humidity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.precipitationIntensity.getter()
{
  OUTLINED_FUNCTION_8_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t CurrentWeather.precipitationIntensity.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.precipitationIntensity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.pressure.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.pressure.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.pressureTrend.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for CurrentWeather();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = v2;
  return result;
}

double (*CurrentWeather.pressureTrend.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t _s10WeatherKit07CurrentA0V19precipitationAmountAA013PrecipitationE0Vvg_0()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_43();
  return sub_1A91C7838(v1 + *(int *)(v2 + 68), v0, (void (*)(void))type metadata accessor for PrecipitationAmount);
}

uint64_t CurrentWeather.rainfallAmount.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.rainfallAmount.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.snowfallAmount.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_43();
  return sub_1A91C7838(v1 + *(int *)(v2 + 72), v0, (void (*)(void))type metadata accessor for PrecipitationAmount);
}

uint64_t CurrentWeather.snowfallAmount.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.snowfallAmount.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.pastHourPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.pastHourPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.pastSixHoursPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.pastSixHoursPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.pastTwentyFourHoursPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.pastTwentyFourHoursPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.nextHourPrecipitationAmountByType.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_43();
  return sub_1A91C7838(v1 + *(int *)(v2 + 88), v0, (void (*)(void))type metadata accessor for PrecipitationAmountByType);
}

uint64_t CurrentWeather.nextHourPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.nextHourPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.nextSixHoursPrecipitationAmountByType.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_43();
  return sub_1A91C7838(v1 + *(int *)(v2 + 92), v0, (void (*)(void))type metadata accessor for PrecipitationAmountByType);
}

uint64_t CurrentWeather.nextSixHoursPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.nextSixHoursPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.nextTwentyFourHoursPrecipitationAmountByType.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.nextTwentyFourHoursPrecipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double CurrentWeather.apparentPrecipitationIntensity.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_43() + 100);
  double result = *(double *)v2;
  LOBYTE(v2) = *(unsigned char *)(v2 + 8);
  *(double *)uint64_t v0 = result;
  *(unsigned char *)(v0 + 8) = v2;
  return result;
}

uint64_t CurrentWeather.apparentPrecipitationIntensity.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for CurrentWeather();
  uint64_t v5 = v1 + *(int *)(result + 100);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*CurrentWeather.apparentPrecipitationIntensity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.isDaylight.setter(char a1)
{
  uint64_t result = type metadata accessor for CurrentWeather();
  *(unsigned char *)(v1 + *(int *)(result + 104)) = a1;
  return result;
}

double (*CurrentWeather.isDaylight.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.temperature.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.temperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.apparentTemperature.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.apparentTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.highTemperature.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_43() + 116);

  return sub_1A93905E0(v2, v0);
}

uint64_t CurrentWeather.highTemperature.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_4_47() + 116);

  return sub_1A91D41C8(v0, v2);
}

double (*CurrentWeather.highTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.lowTemperature.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_8_43() + 120);

  return sub_1A93905E0(v2, v0);
}

uint64_t CurrentWeather.lowTemperature.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_4_47() + 120);

  return sub_1A91D41C8(v0, v2);
}

double (*CurrentWeather.lowTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.uvIndex.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for CurrentWeather();
  uint64_t v5 = v1 + *(int *)(result + 124);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*CurrentWeather.uvIndex.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.visibility.setter()
{
  OUTLINED_FUNCTION_4_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*CurrentWeather.visibility.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.wind.setter()
{
  return sub_1A9391890();
}

double (*CurrentWeather.wind.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t CurrentWeather.metadata.setter()
{
  return sub_1A9391890();
}

uint64_t sub_1A9391890()
{
  uint64_t v1 = OUTLINED_FUNCTION_40_7();
  v2(v1);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_30_13();
  v3();
  return v0;
}

double (*CurrentWeather.metadata.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A9391920(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x766F4364756F6C63 && a2 == 0xEA00000000007265;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x766F4364756F6C63 && a2 == 0xED0000776F4C7265;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x766F4364756F6C63 && a2 == 0xED000064694D7265;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x766F4364756F6C63 && a2 == 0xEE00686769487265;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000014 && a2 == 0x80000001A93CCED0 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x614E6C6F626D7973 && a2 == 0xEA0000000000656DLL;
              if (v11 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                BOOL v12 = a1 == 0x746E696F50776564 && a2 == 0xE800000000000000;
                if (v12 || (sub_1A93AE4B8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  BOOL v13 = a1 == 0x79746964696D7568 && a2 == 0xE800000000000000;
                  if (v13 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else if (a1 == 0xD000000000000016 && a2 == 0x80000001A93CBAF0 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x6572757373657270 && a2 == 0xE800000000000000;
                    if (v14 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 11;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6572757373657270 && a2 == 0xED0000646E657254;
                      if (v15 || (sub_1A93AE4B8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 12;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x6C6C61666E696172 && a2 == 0xEE00746E756F6D41;
                        if (v16 || (sub_1A93AE4B8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 13;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x6C6C6166776F6E73 && a2 == 0xEE00746E756F6D41;
                          if (v17 || (sub_1A93AE4B8() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 14;
                          }
                          else if (a1 == 0xD000000000000021 && a2 == 0x80000001A93DC320 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 15;
                          }
                          else if (a1 == 0xD000000000000025 && a2 == 0x80000001A93DC350 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 16;
                          }
                          else if (a1 == 0xD00000000000002CLL && a2 == 0x80000001A93DC380 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 17;
                          }
                          else if (a1 == 0xD000000000000021 && a2 == 0x80000001A93DC3B0 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 18;
                          }
                          else if (a1 == 0xD000000000000025 && a2 == 0x80000001A93DC3E0 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 19;
                          }
                          else if (a1 == 0xD00000000000002CLL && a2 == 0x80000001A93DC410 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 20;
                          }
                          else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001A93CBB10 {
                                 || (sub_1A93AE4B8() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 21;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x67696C7961447369 && a2 == 0xEA00000000007468;
                            if (v18 || (sub_1A93AE4B8() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 22;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
                              if (v19 || (sub_1A93AE4B8() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 23;
                              }
                              else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CCEF0 {
                                     || (sub_1A93AE4B8() & 1) != 0)
                              }
                              {
                                swift_bridgeObjectRelease();
                                return 24;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x706D655468676968 && a2 == 0xEF65727574617265;
                                if (v20 || (sub_1A93AE4B8() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 25;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x65706D6554776F6CLL && a2 == 0xEE00657275746172;
                                  if (v21 || (sub_1A93AE4B8() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 26;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 0x7865646E497675 && a2 == 0xE700000000000000;
                                    if (v22 || (sub_1A93AE4B8() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 27;
                                    }
                                    else
                                    {
                                      BOOL v23 = a1 == 0x696C696269736976 && a2 == 0xEA00000000007974;
                                      if (v23 || (sub_1A93AE4B8() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 28;
                                      }
                                      else
                                      {
                                        BOOL v24 = a1 == 1684957559 && a2 == 0xE400000000000000;
                                        if (v24 || (sub_1A93AE4B8() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 29;
                                        }
                                        else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 30;
                                        }
                                        else
                                        {
                                          char v26 = sub_1A93AE4B8();
                                          swift_bridgeObjectRelease();
                                          if (v26) {
                                            return 30;
                                          }
                                          else {
                                            return 31;
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
    }
  }
}

uint64_t sub_1A939258C()
{
  return 31;
}

uint64_t sub_1A9392594(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x766F4364756F6C63;
      break;
    case 2:
    case 3:
    case 4:
      uint64_t result = 0x766F4364756F6C63;
      break;
    case 5:
      uint64_t result = 0xD000000000000014;
      break;
    case 6:
      uint64_t result = 0x6F697469646E6F63;
      break;
    case 7:
      uint64_t result = 0x614E6C6F626D7973;
      break;
    case 8:
      uint64_t result = 0x746E696F50776564;
      break;
    case 9:
      uint64_t result = 0x79746964696D7568;
      break;
    case 10:
      uint64_t result = 0xD000000000000016;
      break;
    case 11:
    case 12:
      uint64_t result = 0x6572757373657270;
      break;
    case 13:
      unsigned int v3 = 1852399986;
      goto LABEL_13;
    case 14:
      unsigned int v3 = 2003791475;
LABEL_13:
      uint64_t result = v3 | 0x6C6C616600000000;
      break;
    case 15:
    case 18:
      uint64_t result = 0xD000000000000021;
      break;
    case 16:
      uint64_t result = 0xD000000000000025;
      break;
    case 17:
      uint64_t result = 0xD00000000000002CLL;
      break;
    case 19:
      uint64_t result = 0xD000000000000025;
      break;
    case 20:
      uint64_t result = 0xD00000000000002CLL;
      break;
    case 21:
      uint64_t result = 0xD00000000000001ELL;
      break;
    case 22:
      uint64_t result = 0x67696C7961447369;
      break;
    case 23:
      uint64_t result = 0x74617265706D6574;
      break;
    case 24:
      uint64_t result = 0xD000000000000013;
      break;
    case 25:
      uint64_t result = 0x706D655468676968;
      break;
    case 26:
      uint64_t result = 0x65706D6554776F6CLL;
      break;
    case 27:
      uint64_t result = 0x7865646E497675;
      break;
    case 28:
      uint64_t result = 0x696C696269736976;
      break;
    case 29:
      uint64_t result = 1684957559;
      break;
    case 30:
      uint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A9392940()
{
  return sub_1A9392594(*v0);
}

uint64_t sub_1A9392948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9391920(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9392970@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A939258C();
  *a1 = result;
  return result;
}

uint64_t sub_1A9392998(uint64_t a1)
{
  unint64_t v2 = sub_1A93931E8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93929D4(uint64_t a1)
{
  unint64_t v2 = sub_1A93931E8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CurrentWeather.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656350);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93931E8();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A93948F4(&qword_1EB656220, MEMORY[0x1E4F27928]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_13();
  if (!v1)
  {
    type metadata accessor for CurrentWeather();
    OUTLINED_FUNCTION_6_2(1);
    OUTLINED_FUNCTION_6_2(2);
    OUTLINED_FUNCTION_6_2(3);
    OUTLINED_FUNCTION_6_2(4);
    sub_1A9226940();
    OUTLINED_FUNCTION_13();
    sub_1A91F1B40();
    OUTLINED_FUNCTION_13();
    sub_1A93AE428();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    sub_1A91F1C70(&qword_1EB656210, &qword_1EB6571E0);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6_2(9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    sub_1A91F1C70(&qword_1EB6561F8, &qword_1EB6572C0);
    OUTLINED_FUNCTION_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
    sub_1A91F1C70(&qword_1EB656208, &qword_1EB6572F0);
    OUTLINED_FUNCTION_13();
    sub_1A922698C();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_41_9(13);
    type metadata accessor for PrecipitationAmount();
    sub_1A93948F4(&qword_1EB6562C8, (void (*)(uint64_t))type metadata accessor for PrecipitationAmount);
    OUTLINED_FUNCTION_7_35();
    OUTLINED_FUNCTION_5_41(14);
    OUTLINED_FUNCTION_41_9(15);
    type metadata accessor for PrecipitationAmountByType();
    sub_1A93948F4(&qword_1E97B8210, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
    OUTLINED_FUNCTION_7_35();
    OUTLINED_FUNCTION_5_41(16);
    OUTLINED_FUNCTION_5_41(17);
    OUTLINED_FUNCTION_5_41(18);
    OUTLINED_FUNCTION_5_41(19);
    OUTLINED_FUNCTION_5_41(20);
    sub_1A91EB4F8();
    OUTLINED_FUNCTION_13();
    sub_1A93AE438();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_27_17(25);
    OUTLINED_FUNCTION_27_17(26);
    sub_1A91F1B8C();
    OUTLINED_FUNCTION_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    sub_1A91F1C70(&qword_1EB656200, &qword_1EB6572E0);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_41_9(29);
    type metadata accessor for Wind();
    sub_1A93948F4(&qword_1EB656308, (void (*)(uint64_t))type metadata accessor for Wind);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_41_9(30);
    type metadata accessor for WeatherMetadata();
    sub_1A93948F4(&qword_1EB6562A0, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
    OUTLINED_FUNCTION_13();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A93931E8()
{
  unint64_t result = qword_1EB656258;
  if (!qword_1EB656258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656258);
  }
  return result;
}

uint64_t CurrentWeather.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a2;
  v101[11] = type metadata accessor for WeatherMetadata();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_35(v5);
  v101[12] = type metadata accessor for Wind();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  v101[14] = v7;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v105 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9();
  v101[10] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
  MEMORY[0x1F4188790](v11 - 8);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_35((uint64_t)v101 - v13);
  uint64_t v103 = type metadata accessor for PrecipitationAmountByType();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_35((uint64_t)v101 - v20);
  uint64_t v114 = type metadata accessor for PrecipitationAmount();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_112();
  uint64_t v112 = v22;
  MEMORY[0x1F4188790](v23);
  uint64_t v113 = (char *)v101 - v24;
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  OUTLINED_FUNCTION_2();
  uint64_t v107 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_9();
  uint64_t v115 = v27;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_2();
  uint64_t v108 = v28;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_9();
  uint64_t v117 = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v123 = v32;
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_42_7();
  MEMORY[0x1F4188790](v35);
  double v37 = (char *)v101 - v36;
  uint64_t v38 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v111 = v39;
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_0();
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC818);
  OUTLINED_FUNCTION_2();
  uint64_t v116 = v41;
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v44 - v43;
  uint64_t v46 = type metadata accessor for CurrentWeather();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_0();
  uint64_t v50 = v49 - v48;
  uint64_t v122 = v49 - v48 + *(int *)(v51 + 116);
  __swift_storeEnumTagSinglePayload(v122, 1, 1, v31);
  uint64_t v125 = v50;
  uint64_t v126 = (int *)v46;
  uint64_t v121 = v50 + *(int *)(v46 + 120);
  uint64_t v127 = v31;
  __swift_storeEnumTagSinglePayload(v121, 1, 1, v31);
  uint64_t v52 = a1[3];
  uint64_t v120 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, v52);
  sub_1A93931E8();
  uint64_t v119 = v45;
  uint64_t v53 = v124;
  sub_1A93AE5C8();
  uint64_t v104 = v38;
  if (v53)
  {
    uint64_t v124 = v53;
    unsigned int v55 = 100663296;
  }
  else
  {
    uint64_t v54 = v37;
    v101[1] = v2;
    LOBYTE(v128) = 0;
    sub_1A93948F4(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_13_0();
    sub_1A93AE3C8();
    uint64_t v72 = v125;
    OUTLINED_FUNCTION_48();
    v73();
    LOBYTE(v128) = 1;
    sub_1A93AE398();
    uint64_t v74 = v126;
    *(void *)(v72 + v126[5]) = v75;
    OUTLINED_FUNCTION_32_12(2);
    *(void *)(v72 + v74[6]) = v76;
    OUTLINED_FUNCTION_32_12(3);
    *(void *)(v72 + v74[7]) = v77;
    OUTLINED_FUNCTION_32_12(4);
    *(void *)(v72 + v74[8]) = v78;
    char v130 = 5;
    sub_1A922764C();
    OUTLINED_FUNCTION_36_10();
    uint64_t v79 = v129;
    uint64_t v80 = v72 + v74[9];
    *(_OWORD *)uint64_t v80 = v128;
    *(void *)(v80 + 16) = v79;
    char v130 = 6;
    sub_1A91F1BD8();
    OUTLINED_FUNCTION_36_10();
    *(unsigned char *)(v72 + v74[10]) = v128;
    OUTLINED_FUNCTION_31_8(7);
    uint64_t v81 = sub_1A93AE378();
    uint64_t v82 = (uint64_t *)(v72 + v74[11]);
    *uint64_t v82 = v81;
    v82[1] = v83;
    LOBYTE(v128) = 8;
    sub_1A91F1C70(&qword_1E97B8230, &qword_1EB6571E0);
    OUTLINED_FUNCTION_13_0();
    v101[0] = v84;
    sub_1A93AE3C8();
    char v85 = *(void (**)(void))(v123 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v85)(v72 + v74[12], v54, v127);
    OUTLINED_FUNCTION_31_8(9);
    sub_1A93AE398();
    uint64_t v124 = 0;
    *(void *)(v125 + v126[13]) = v86;
    LOBYTE(v128) = 10;
    sub_1A91F1C70(&qword_1E97B81E8, &qword_1EB6572C0);
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_14_29();
    uint64_t v124 = 0;
    OUTLINED_FUNCTION_48();
    v87();
    LOBYTE(v128) = 11;
    sub_1A91F1C70(&qword_1E97B8960, &qword_1EB6572F0);
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_14_29();
    uint64_t v124 = 0;
    OUTLINED_FUNCTION_48();
    v88();
    char v130 = 12;
    sub_1A9227698();
    OUTLINED_FUNCTION_14_29();
    uint64_t v124 = 0;
    *(unsigned char *)(v125 + v126[16]) = v128;
    LOBYTE(v128) = 13;
    sub_1A93948F4(&qword_1E97BC820, (void (*)(uint64_t))type metadata accessor for PrecipitationAmount);
    OUTLINED_FUNCTION_10_31();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(14);
    OUTLINED_FUNCTION_10_31();
    uint64_t v124 = 0;
    sub_1A91D4178();
    LOBYTE(v128) = 15;
    sub_1A93948F4(&qword_1E97B8238, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(16);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(17);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(18);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(19);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    OUTLINED_FUNCTION_27_2(20);
    OUTLINED_FUNCTION_6_34();
    uint64_t v124 = 0;
    sub_1A91D4178();
    char v130 = 21;
    sub_1A91EBA2C();
    OUTLINED_FUNCTION_14_29();
    uint64_t v124 = 0;
    char v89 = BYTE8(v128);
    uint64_t v90 = v125 + v126[25];
    *(void *)uint64_t v90 = v128;
    *(unsigned char *)(v90 + 8) = v89;
    OUTLINED_FUNCTION_31_8(22);
    uint64_t v91 = v124;
    char v92 = sub_1A93AE388();
    uint64_t v124 = v91;
    if (!v91)
    {
      *(unsigned char *)(v125 + v126[26]) = v92 & 1;
      OUTLINED_FUNCTION_27_2(23);
      OUTLINED_FUNCTION_23_16();
      sub_1A93AE3C8();
      uint64_t v124 = 0;
      OUTLINED_FUNCTION_29_14();
      v85();
      OUTLINED_FUNCTION_27_2(24);
      OUTLINED_FUNCTION_24_12();
      sub_1A93AE3C8();
      uint64_t v124 = 0;
      OUTLINED_FUNCTION_29_14();
      v85();
      OUTLINED_FUNCTION_27_2(25);
      OUTLINED_FUNCTION_24_12();
      sub_1A93AE368();
      uint64_t v124 = 0;
      sub_1A91D41C8(v101[8], v122);
      OUTLINED_FUNCTION_27_2(26);
      OUTLINED_FUNCTION_23_16();
      sub_1A93AE368();
      uint64_t v124 = 0;
      sub_1A91D41C8(v101[9], v121);
      char v130 = 27;
      sub_1A91F1C24();
      OUTLINED_FUNCTION_14_29();
      uint64_t v124 = 0;
      char v95 = BYTE8(v128);
      uint64_t v96 = v125 + v126[31];
      *(void *)uint64_t v96 = v128;
      *(unsigned char *)(v96 + 8) = v95;
      LOBYTE(v128) = 28;
      sub_1A91F1C70(&qword_1E97B8138, &qword_1EB6572E0);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_14_29();
      uint64_t v124 = 0;
      OUTLINED_FUNCTION_48();
      v97();
      LOBYTE(v128) = 29;
      sub_1A93948F4(&qword_1E97B8258, (void (*)(uint64_t))type metadata accessor for Wind);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_14_29();
      uint64_t v124 = 0;
      sub_1A91D4178();
      LOBYTE(v128) = 30;
      sub_1A93948F4(&qword_1E97B8580, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_14_29();
      uint64_t v124 = 0;
      uint64_t v98 = OUTLINED_FUNCTION_3_43();
      v99(v98);
      uint64_t v100 = v125;
      sub_1A91D4178();
      sub_1A91C7838(v100, v102, (void (*)(void))type metadata accessor for CurrentWeather);
      __swift_destroy_boxed_opaque_existential_1(v120);
      return sub_1A9394658(v100, (void (*)(void))type metadata accessor for CurrentWeather);
    }
    unsigned int v55 = 102755713;
    uint64_t v93 = OUTLINED_FUNCTION_3_43();
    v94(v93);
  }
  uint64_t v56 = v125;
  uint64_t v57 = v126;
  __swift_destroy_boxed_opaque_existential_1(v120);
  int v58 = (v55 >> 10) & 1;
  int v59 = (v55 >> 11) & 1;
  int v60 = (v55 >> 13) & 1;
  int v61 = (v55 >> 14) & 1;
  int v62 = (v55 >> 15) & 1;
  LODWORD(v120) = HIBYTE(v55) & 1;
  LODWORD(v117) = (v55 >> 23) & 1;
  LODWORD(v116) = (v55 >> 20) & 1;
  LODWORD(v115) = (v55 >> 19) & 1;
  LODWORD(v114) = (v55 >> 18) & 1;
  LODWORD(v113) = (v55 >> 17) & 1;
  LODWORD(v112) = HIWORD(v55) & 1;
  if (v55)
  {
    LODWORD(v118) = 0;
    LODWORD(v119) = 0;
    OUTLINED_FUNCTION_27();
    v68();
    if (((v55 >> 7) & 1) == 0)
    {
LABEL_6:
      if ((v55 >> 8)) {
        goto LABEL_7;
      }
      goto LABEL_22;
    }
  }
  else
  {
    LODWORD(v119) = 0;
    LODWORD(v118) = 0;
    if ((v55 & 0x80) == 0) {
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  if ((v55 >> 8))
  {
LABEL_7:
    uint64_t v63 = v123;
    uint64_t v64 = v127;
    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v56 + v57[12], v127);
    if ((v58 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v64 = v127;
  uint64_t v63 = v123;
  if (!v58)
  {
LABEL_8:
    if (v59) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  OUTLINED_FUNCTION_27();
  v69();
  if (v59)
  {
LABEL_9:
    OUTLINED_FUNCTION_27();
    v65();
    if ((v60 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  if (!v60)
  {
LABEL_10:
    if (v61) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_1A9394658(v56 + v57[17], (void (*)(void))type metadata accessor for PrecipitationAmount);
  if (v61)
  {
LABEL_11:
    sub_1A9394658(v56 + v57[18], (void (*)(void))type metadata accessor for PrecipitationAmount);
    int v66 = v118;
    if ((v62 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  int v66 = v118;
  if (!v62)
  {
LABEL_12:
    int v67 = v119;
    if (v112) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  sub_1A9394658(v56 + v57[19], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
  int v67 = v119;
  if (v112)
  {
LABEL_13:
    sub_1A9394658(v56 + v57[20], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
    if ((v113 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  if (!v113)
  {
LABEL_14:
    if (v114) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  sub_1A9394658(v56 + v57[21], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
  if (v114)
  {
LABEL_15:
    sub_1A9394658(v56 + v57[22], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
    if ((v115 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  if (!v115)
  {
LABEL_16:
    if (v116) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  sub_1A9394658(v56 + v57[23], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
  if (v116)
  {
LABEL_17:
    sub_1A9394658(v56 + v57[24], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
    if ((v117 & 1) == 0) {
      goto LABEL_18;
    }
LABEL_33:
    uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v70(v56 + v57[27], v64);
    if (v120) {
      v70(v56 + v57[28], v64);
    }
    goto LABEL_35;
  }
LABEL_32:
  if (v117) {
    goto LABEL_33;
  }
LABEL_18:
  if (v120) {
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v56 + v57[28], v64);
  }
LABEL_35:
  sub_1A91A6D38(v122, &qword_1EB6571A8);
  uint64_t result = sub_1A91A6D38(v121, &qword_1EB6571A8);
  if (v66) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v105 + 8))(v56 + v57[32], v106);
  }
  if (v67) {
    return sub_1A9394658(v56 + v57[33], (void (*)(void))type metadata accessor for Wind);
  }
  return result;
}

uint64_t sub_1A9394658(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_27();
  v3();
  return a1;
}

uint64_t sub_1A93946AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CurrentWeather.init(from:)(a1, a2);
}

uint64_t sub_1A93946C4(void *a1)
{
  return CurrentWeather.encode(to:)(a1);
}

uint64_t CurrentWeather.debugDescription.getter()
{
  BYTE8(v3) = 0;
  sub_1A93AE238();
  sub_1A93ADE78();
  uint64_t v1 = type metadata accessor for CurrentWeather();
  sub_1A93ABC08();
  sub_1A93948F4((unint64_t *)&qword_1EB6552A8, MEMORY[0x1E4F27928]);
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  type metadata accessor for WeatherMetadata();
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  *(void *)&long long v3 = *(unsigned __int8 *)(v0 + *(int *)(v1 + 40));
  WeatherCondition.description.getter();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  sub_1A93ADE78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  sub_1A91F1C70(&qword_1EB655280, &qword_1EB6571E0);
  sub_1A93AE4A8();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v3 + 1);
}

uint64_t sub_1A93948F4(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for CurrentWeather(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v85 = *a2;
    *a1 = *a2;
    a1 = (void *)(v85 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v114 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    uint64_t v115 = v7;
    ((void (*)(void *, void *))v114)(a1, a2);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[9];
    uint64_t v11 = a3[10];
    uint64_t v12 = (char *)a1 + v10;
    uint64_t v13 = (char *)a2 + v10;
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    *((void *)v12 + 2) = *((void *)v13 + 2);
    *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
    uint64_t v14 = a3[11];
    uint64_t v15 = a3[12];
    uint64_t v16 = (void *)((char *)a1 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (char *)a1 + v15;
    uint64_t v20 = (char *)a2 + v15;
    swift_bridgeObjectRetain();
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    uint64_t v116 = *(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 16);
    v116(v19, v20, v111);
    uint64_t v21 = a3[14];
    *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    uint64_t v112 = *(void (**)(char *, char *))(*(void *)(v24 - 8) + 16);
    uint64_t v113 = v24;
    v112(v22, v23);
    uint64_t v25 = a3[15];
    uint64_t v26 = (char *)a1 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    uint64_t v29 = a3[17];
    *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
    v33(v30, v31, v32);
    uint64_t v34 = (int *)type metadata accessor for PrecipitationAmount();
    v33(&v30[v34[5]], &v31[v34[5]], v32);
    v33(&v30[v34[6]], &v31[v34[6]], v32);
    v33(&v30[v34[7]], &v31[v34[7]], v32);
    v33(&v30[v34[8]], &v31[v34[8]], v32);
    v33(&v30[v34[9]], &v31[v34[9]], v32);
    uint64_t v35 = a3[18];
    uint64_t v36 = (char *)a1 + v35;
    double v37 = (char *)a2 + v35;
    v33((char *)a1 + v35, (char *)a2 + v35, v32);
    v33(&v36[v34[5]], &v37[v34[5]], v32);
    v33(&v36[v34[6]], &v37[v34[6]], v32);
    v33(&v36[v34[7]], &v37[v34[7]], v32);
    v33(&v36[v34[8]], &v37[v34[8]], v32);
    v33(&v36[v34[9]], &v37[v34[9]], v32);
    uint64_t v38 = a3[19];
    uint64_t v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    v33((char *)a1 + v38, (char *)a2 + v38, v32);
    uint64_t v41 = (int *)type metadata accessor for PrecipitationAmountByType();
    v33(&v39[v41[5]], &v40[v41[5]], v32);
    v33(&v39[v41[6]], &v40[v41[6]], v32);
    v33(&v39[v41[7]], &v40[v41[7]], v32);
    v33(&v39[v41[8]], &v40[v41[8]], v32);
    uint64_t v42 = v41[9];
    uint64_t v43 = &v39[v42];
    uint64_t v44 = &v40[v42];
    v33(&v39[v42], v44, v32);
    uint64_t v45 = (int *)type metadata accessor for SnowfallAmount();
    v33(&v43[v45[5]], &v44[v45[5]], v32);
    v33(&v43[v45[6]], &v44[v45[6]], v32);
    v33(&v43[v45[7]], &v44[v45[7]], v32);
    v33(&v43[v45[8]], &v44[v45[8]], v32);
    v33(&v43[v45[9]], &v44[v45[9]], v32);
    uint64_t v46 = a3[20];
    uint64_t v47 = (char *)a1 + v46;
    uint64_t v48 = (char *)a2 + v46;
    v33((char *)a1 + v46, (char *)a2 + v46, v32);
    v33(&v47[v41[5]], &v48[v41[5]], v32);
    v33(&v47[v41[6]], &v48[v41[6]], v32);
    v33(&v47[v41[7]], &v48[v41[7]], v32);
    v33(&v47[v41[8]], &v48[v41[8]], v32);
    uint64_t v49 = v41[9];
    uint64_t v50 = &v47[v49];
    uint64_t v51 = &v48[v49];
    v33(v50, v51, v32);
    v33(&v50[v45[5]], &v51[v45[5]], v32);
    v33(&v50[v45[6]], &v51[v45[6]], v32);
    v33(&v50[v45[7]], &v51[v45[7]], v32);
    v33(&v50[v45[8]], &v51[v45[8]], v32);
    v33(&v50[v45[9]], &v51[v45[9]], v32);
    uint64_t v52 = a3[21];
    uint64_t v53 = (char *)a1 + v52;
    uint64_t v54 = (char *)a2 + v52;
    v33((char *)a1 + v52, (char *)a2 + v52, v32);
    v33(&v53[v41[5]], &v54[v41[5]], v32);
    v33(&v53[v41[6]], &v54[v41[6]], v32);
    v33(&v53[v41[7]], &v54[v41[7]], v32);
    v33(&v53[v41[8]], &v54[v41[8]], v32);
    uint64_t v55 = v41[9];
    uint64_t v56 = &v53[v55];
    uint64_t v57 = &v54[v55];
    v33(v56, v57, v32);
    v33(&v56[v45[5]], &v57[v45[5]], v32);
    v33(&v56[v45[6]], &v57[v45[6]], v32);
    v33(&v56[v45[7]], &v57[v45[7]], v32);
    v33(&v56[v45[8]], &v57[v45[8]], v32);
    v33(&v56[v45[9]], &v57[v45[9]], v32);
    uint64_t v58 = a3[22];
    int v59 = (char *)a1 + v58;
    int v60 = (char *)a2 + v58;
    v33((char *)a1 + v58, (char *)a2 + v58, v32);
    v33(&v59[v41[5]], &v60[v41[5]], v32);
    v33(&v59[v41[6]], &v60[v41[6]], v32);
    v33(&v59[v41[7]], &v60[v41[7]], v32);
    v33(&v59[v41[8]], &v60[v41[8]], v32);
    uint64_t v61 = v41[9];
    int v62 = &v59[v61];
    uint64_t v63 = &v60[v61];
    v33(v62, v63, v32);
    v33(&v62[v45[5]], &v63[v45[5]], v32);
    v33(&v62[v45[6]], &v63[v45[6]], v32);
    v33(&v62[v45[7]], &v63[v45[7]], v32);
    v33(&v62[v45[8]], &v63[v45[8]], v32);
    v33(&v62[v45[9]], &v63[v45[9]], v32);
    uint64_t v64 = a3[23];
    uint64_t v65 = (char *)a1 + v64;
    int v66 = (char *)a2 + v64;
    v33((char *)a1 + v64, (char *)a2 + v64, v32);
    v33(&v65[v41[5]], &v66[v41[5]], v32);
    v33(&v65[v41[6]], &v66[v41[6]], v32);
    v33(&v65[v41[7]], &v66[v41[7]], v32);
    v33(&v65[v41[8]], &v66[v41[8]], v32);
    uint64_t v67 = v41[9];
    char v68 = &v65[v67];
    uint64_t v69 = &v66[v67];
    v33(v68, v69, v32);
    v33(&v68[v45[5]], &v69[v45[5]], v32);
    v33(&v68[v45[6]], &v69[v45[6]], v32);
    v33(&v68[v45[7]], &v69[v45[7]], v32);
    v33(&v68[v45[8]], &v69[v45[8]], v32);
    v33(&v68[v45[9]], &v69[v45[9]], v32);
    uint64_t v70 = a3[24];
    uint64_t v71 = (char *)a1 + v70;
    uint64_t v72 = (char *)a2 + v70;
    v33((char *)a1 + v70, (char *)a2 + v70, v32);
    v33(&v71[v41[5]], &v72[v41[5]], v32);
    v33(&v71[v41[6]], &v72[v41[6]], v32);
    v33(&v71[v41[7]], &v72[v41[7]], v32);
    v33(&v71[v41[8]], &v72[v41[8]], v32);
    uint64_t v73 = v41[9];
    uint64_t v74 = &v71[v73];
    uint64_t v75 = &v72[v73];
    v33(v74, &v72[v73], v32);
    v33(&v74[v45[5]], &v75[v45[5]], v32);
    v33(&v74[v45[6]], &v75[v45[6]], v32);
    v33(&v74[v45[7]], &v75[v45[7]], v32);
    v33(&v74[v45[8]], &v75[v45[8]], v32);
    v33(&v74[v45[9]], &v75[v45[9]], v32);
    uint64_t v76 = a3[25];
    uint64_t v77 = a3[26];
    uint64_t v78 = (char *)a1 + v76;
    uint64_t v79 = (char *)a2 + v76;
    *(void *)uint64_t v78 = *(void *)v79;
    char v80 = *((unsigned char *)a2 + v77);
    v78[8] = v79[8];
    *((unsigned char *)a1 + v77) = v80;
    v116((char *)a1 + a3[27], (char *)a2 + a3[27], v111);
    v116((char *)a1 + a3[28], (char *)a2 + a3[28], v111);
    uint64_t v81 = a3[29];
    uint64_t v82 = (char *)a1 + v81;
    uint64_t v83 = (char *)a2 + v81;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v81, 1, v111))
    {
      uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v82, v83, *(void *)(*(void *)(v84 - 8) + 64));
    }
    else
    {
      v116(v82, v83, v111);
      __swift_storeEnumTagSinglePayload((uint64_t)v82, 0, 1, v111);
    }
    uint64_t v86 = a3[30];
    uint64_t v87 = (char *)a1 + v86;
    uint64_t v88 = (char *)a2 + v86;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v86, 1, v111))
    {
      uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v87, v88, *(void *)(*(void *)(v89 - 8) + 64));
    }
    else
    {
      v116(v87, v88, v111);
      __swift_storeEnumTagSinglePayload((uint64_t)v87, 0, 1, v111);
    }
    uint64_t v90 = a3[31];
    uint64_t v91 = a3[32];
    char v92 = (char *)a1 + v90;
    uint64_t v93 = (char *)a2 + v90;
    *(void *)char v92 = *(void *)v93;
    v92[8] = v93[8];
    v33((char *)a1 + v91, (char *)a2 + v91, v32);
    uint64_t v94 = a3[33];
    char v95 = (char *)a1 + v94;
    uint64_t v96 = (char *)a2 + v94;
    *((unsigned char *)a1 + v94) = *((unsigned char *)a2 + v94);
    uint64_t v97 = (int *)type metadata accessor for Wind();
    uint64_t v98 = v97[5];
    uint64_t v99 = &v95[v98];
    uint64_t v100 = &v96[v98];
    uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16))(v99, v100, v101);
    ((void (*)(char *, char *, uint64_t))v112)(&v95[v97[6]], &v96[v97[6]], v113);
    uint64_t v102 = v97[7];
    uint64_t v103 = &v95[v102];
    uint64_t v104 = &v96[v102];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v96[v102], 1, v113))
    {
      uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
      memcpy(v103, v104, *(void *)(*(void *)(v105 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v112)(v103, v104, v113);
      __swift_storeEnumTagSinglePayload((uint64_t)v103, 0, 1, v113);
    }
    uint64_t v106 = a3[34];
    uint64_t v107 = (char *)a1 + v106;
    uint64_t v108 = (char *)a2 + v106;
    v114((char *)a1 + v106, v108, v115);
    uint64_t v109 = (int *)type metadata accessor for WeatherMetadata();
    v114(&v107[v109[5]], &v108[v109[5]], v115);
    *(void *)&v107[v109[6]] = *(void *)&v108[v109[6]];
    *(void *)&v107[v109[7]] = *(void *)&v108[v109[7]];
    *(void *)&v107[v109[8]] = *(void *)&v108[v109[8]];
  }
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CurrentWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v115 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  uint64_t v116 = v6;
  v115(a1, a2);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v10 = a3[11];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[12];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v112 = *(void *)(v16 - 8);
  uint64_t v113 = v16;
  uint64_t v118 = *(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 24);
  v118(v14, v15, v16);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v17 = a3[14];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v111 = *(void *)(v20 - 8);
  uint64_t v114 = v20;
  uint64_t v117 = *(void (**)(uint64_t, uint64_t))(v111 + 24);
  v117(v18, v19);
  uint64_t v21 = a3[15];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v25 = a3[17];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 24);
  v29(v26, v27, v28);
  uint64_t v30 = (int *)type metadata accessor for PrecipitationAmount();
  v29(v26 + v30[5], v27 + v30[5], v28);
  v29(v26 + v30[6], v27 + v30[6], v28);
  v29(v26 + v30[7], v27 + v30[7], v28);
  v29(v26 + v30[8], v27 + v30[8], v28);
  v29(v26 + v30[9], v27 + v30[9], v28);
  uint64_t v31 = a3[18];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  v29(a1 + v31, a2 + v31, v28);
  v29(v32 + v30[5], v33 + v30[5], v28);
  v29(v32 + v30[6], v33 + v30[6], v28);
  v29(v32 + v30[7], v33 + v30[7], v28);
  v29(v32 + v30[8], v33 + v30[8], v28);
  v29(v32 + v30[9], v33 + v30[9], v28);
  uint64_t v34 = a3[19];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  v29(a1 + v34, a2 + v34, v28);
  double v37 = (int *)type metadata accessor for PrecipitationAmountByType();
  v29(v35 + v37[5], v36 + v37[5], v28);
  v29(v35 + v37[6], v36 + v37[6], v28);
  v29(v35 + v37[7], v36 + v37[7], v28);
  v29(v35 + v37[8], v36 + v37[8], v28);
  uint64_t v38 = v37[9];
  uint64_t v39 = v35 + v38;
  uint64_t v40 = v36 + v38;
  v29(v35 + v38, v40, v28);
  uint64_t v41 = (int *)type metadata accessor for SnowfallAmount();
  v29(v39 + v41[5], v40 + v41[5], v28);
  v29(v39 + v41[6], v40 + v41[6], v28);
  v29(v39 + v41[7], v40 + v41[7], v28);
  v29(v39 + v41[8], v40 + v41[8], v28);
  v29(v39 + v41[9], v40 + v41[9], v28);
  uint64_t v42 = a3[20];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  v29(a1 + v42, a2 + v42, v28);
  v29(v43 + v37[5], v44 + v37[5], v28);
  v29(v43 + v37[6], v44 + v37[6], v28);
  v29(v43 + v37[7], v44 + v37[7], v28);
  v29(v43 + v37[8], v44 + v37[8], v28);
  uint64_t v45 = v37[9];
  uint64_t v46 = v43 + v45;
  uint64_t v47 = v44 + v45;
  v29(v46, v47, v28);
  v29(v46 + v41[5], v47 + v41[5], v28);
  v29(v46 + v41[6], v47 + v41[6], v28);
  v29(v46 + v41[7], v47 + v41[7], v28);
  v29(v46 + v41[8], v47 + v41[8], v28);
  v29(v46 + v41[9], v47 + v41[9], v28);
  uint64_t v48 = a3[21];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  v29(a1 + v48, a2 + v48, v28);
  v29(v49 + v37[5], v50 + v37[5], v28);
  v29(v49 + v37[6], v50 + v37[6], v28);
  v29(v49 + v37[7], v50 + v37[7], v28);
  v29(v49 + v37[8], v50 + v37[8], v28);
  uint64_t v51 = v37[9];
  uint64_t v52 = v49 + v51;
  uint64_t v53 = v50 + v51;
  v29(v52, v53, v28);
  v29(v52 + v41[5], v53 + v41[5], v28);
  v29(v52 + v41[6], v53 + v41[6], v28);
  v29(v52 + v41[7], v53 + v41[7], v28);
  v29(v52 + v41[8], v53 + v41[8], v28);
  v29(v52 + v41[9], v53 + v41[9], v28);
  uint64_t v54 = a3[22];
  uint64_t v55 = a1 + v54;
  uint64_t v56 = a2 + v54;
  v29(a1 + v54, a2 + v54, v28);
  v29(v55 + v37[5], v56 + v37[5], v28);
  v29(v55 + v37[6], v56 + v37[6], v28);
  v29(v55 + v37[7], v56 + v37[7], v28);
  v29(v55 + v37[8], v56 + v37[8], v28);
  uint64_t v57 = v37[9];
  uint64_t v58 = v55 + v57;
  uint64_t v59 = v56 + v57;
  v29(v58, v59, v28);
  v29(v58 + v41[5], v59 + v41[5], v28);
  v29(v58 + v41[6], v59 + v41[6], v28);
  v29(v58 + v41[7], v59 + v41[7], v28);
  v29(v58 + v41[8], v59 + v41[8], v28);
  v29(v58 + v41[9], v59 + v41[9], v28);
  uint64_t v60 = a3[23];
  uint64_t v61 = a1 + v60;
  uint64_t v62 = a2 + v60;
  v29(a1 + v60, a2 + v60, v28);
  v29(v61 + v37[5], v62 + v37[5], v28);
  v29(v61 + v37[6], v62 + v37[6], v28);
  v29(v61 + v37[7], v62 + v37[7], v28);
  v29(v61 + v37[8], v62 + v37[8], v28);
  uint64_t v63 = v37[9];
  uint64_t v64 = v61 + v63;
  uint64_t v65 = v62 + v63;
  v29(v64, v65, v28);
  v29(v64 + v41[5], v65 + v41[5], v28);
  v29(v64 + v41[6], v65 + v41[6], v28);
  v29(v64 + v41[7], v65 + v41[7], v28);
  v29(v64 + v41[8], v65 + v41[8], v28);
  v29(v64 + v41[9], v65 + v41[9], v28);
  uint64_t v66 = a3[24];
  uint64_t v67 = a1 + v66;
  uint64_t v68 = a2 + v66;
  v29(a1 + v66, a2 + v66, v28);
  v29(v67 + v37[5], v68 + v37[5], v28);
  v29(v67 + v37[6], v68 + v37[6], v28);
  v29(v67 + v37[7], v68 + v37[7], v28);
  v29(v67 + v37[8], v68 + v37[8], v28);
  uint64_t v69 = v37[9];
  uint64_t v70 = v67 + v69;
  uint64_t v71 = v68 + v69;
  v29(v70, v68 + v69, v28);
  v29(v70 + v41[5], v71 + v41[5], v28);
  v29(v70 + v41[6], v71 + v41[6], v28);
  v29(v70 + v41[7], v71 + v41[7], v28);
  v29(v70 + v41[8], v71 + v41[8], v28);
  v29(v70 + v41[9], v71 + v41[9], v28);
  uint64_t v72 = a3[25];
  uint64_t v73 = a1 + v72;
  uint64_t v74 = a2 + v72;
  *(void *)uint64_t v73 = *(void *)v74;
  *(unsigned char *)(v73 + 8) = *(unsigned char *)(v74 + 8);
  *(unsigned char *)(a1 + a3[26]) = *(unsigned char *)(a2 + a3[26]);
  v118(a1 + a3[27], a2 + a3[27], v113);
  v118(a1 + a3[28], a2 + a3[28], v113);
  uint64_t v75 = a3[29];
  uint64_t v76 = (void *)(a1 + v75);
  uint64_t v77 = (const void *)(a2 + v75);
  LODWORD(v70) = __swift_getEnumTagSinglePayload(a1 + v75, 1, v113);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v77, 1, v113);
  if (v70)
  {
    if (EnumTagSinglePayload)
    {
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v76, v77, *(void *)(*(void *)(v79 - 8) + 64));
      uint64_t v80 = v113;
    }
    else
    {
      uint64_t v80 = v113;
      (*(void (**)(void *, const void *, uint64_t))(v112 + 16))(v76, v77, v113);
      __swift_storeEnumTagSinglePayload((uint64_t)v76, 0, 1, v113);
    }
  }
  else
  {
    uint64_t v80 = v113;
    if (EnumTagSinglePayload)
    {
      (*(void (**)(void *, uint64_t))(v112 + 8))(v76, v113);
      uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v76, v77, *(void *)(*(void *)(v81 - 8) + 64));
    }
    else
    {
      v118((uint64_t)v76, (uint64_t)v77, v113);
    }
  }
  uint64_t v82 = a3[30];
  uint64_t v83 = (void *)(a1 + v82);
  uint64_t v84 = (const void *)(a2 + v82);
  int v85 = __swift_getEnumTagSinglePayload(a1 + v82, 1, v80);
  uint64_t v86 = v80;
  int v87 = v85;
  int v88 = __swift_getEnumTagSinglePayload((uint64_t)v84, 1, v86);
  if (v87)
  {
    if (!v88)
    {
      (*(void (**)(void *, const void *, uint64_t))(v112 + 16))(v83, v84, v113);
      __swift_storeEnumTagSinglePayload((uint64_t)v83, 0, 1, v113);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v88)
  {
    (*(void (**)(void *, uint64_t))(v112 + 8))(v83, v113);
LABEL_13:
    uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
    memcpy(v83, v84, *(void *)(*(void *)(v89 - 8) + 64));
    goto LABEL_14;
  }
  v118((uint64_t)v83, (uint64_t)v84, v113);
LABEL_14:
  uint64_t v90 = a3[31];
  uint64_t v91 = a1 + v90;
  uint64_t v92 = a2 + v90;
  *(void *)uint64_t v91 = *(void *)v92;
  *(unsigned char *)(v91 + 8) = *(unsigned char *)(v92 + 8);
  v29(a1 + a3[32], a2 + a3[32], v28);
  uint64_t v93 = a3[33];
  uint64_t v94 = a1 + v93;
  uint64_t v95 = a2 + v93;
  *(unsigned char *)(a1 + v93) = *(unsigned char *)(a2 + v93);
  uint64_t v96 = (int *)type metadata accessor for Wind();
  uint64_t v97 = v96[5];
  uint64_t v98 = v94 + v97;
  uint64_t v99 = v95 + v97;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 24))(v98, v99, v100);
  ((void (*)(uint64_t, uint64_t, uint64_t))v117)(v94 + v96[6], v95 + v96[6], v114);
  uint64_t v101 = v96[7];
  uint64_t v102 = (void *)(v94 + v101);
  uint64_t v103 = (const void *)(v95 + v101);
  LODWORD(v96) = __swift_getEnumTagSinglePayload(v94 + v101, 1, v114);
  int v104 = __swift_getEnumTagSinglePayload((uint64_t)v103, 1, v114);
  if (!v96)
  {
    if (!v104)
    {
      ((void (*)(void *, const void *, uint64_t))v117)(v102, v103, v114);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v111 + 8))(v102, v114);
    goto LABEL_19;
  }
  if (v104)
  {
LABEL_19:
    uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v102, v103, *(void *)(*(void *)(v105 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v111 + 16))(v102, v103, v114);
  __swift_storeEnumTagSinglePayload((uint64_t)v102, 0, 1, v114);
LABEL_20:
  uint64_t v106 = a3[34];
  uint64_t v107 = a1 + v106;
  uint64_t v108 = a2 + v106;
  ((void (*)(uint64_t, uint64_t, uint64_t))v115)(a1 + v106, v108, v116);
  uint64_t v109 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v115)(v107 + v109[5], v108 + v109[5], v116);
  *(void *)(v107 + v109[6]) = *(void *)(v108 + v109[6]);
  *(void *)(v107 + v109[7]) = *(void *)(v108 + v109[7]);
  *(void *)(v107 + v109[8]) = *(void *)(v108 + v109[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CurrentWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v114 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  uint64_t v115 = v6;
  v114(a1, a2);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a3[10];
  uint64_t v11 = a1 + v9;
  uint64_t v12 = (long long *)(a2 + v9);
  long long v13 = *v12;
  *(void *)(v11 + 16) = *((void *)v12 + 2);
  *(_OWORD *)uint64_t v11 = v13;
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v14 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 32);
  v116(v15, v16, v111);
  uint64_t v17 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v112 = *(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 32);
  uint64_t v113 = v20;
  v112(v18, v19);
  uint64_t v21 = a3[15];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  uint64_t v25 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32);
  v29(v26, v27, v28);
  uint64_t v30 = (int *)type metadata accessor for PrecipitationAmount();
  v29(v26 + v30[5], v27 + v30[5], v28);
  v29(v26 + v30[6], v27 + v30[6], v28);
  v29(v26 + v30[7], v27 + v30[7], v28);
  v29(v26 + v30[8], v27 + v30[8], v28);
  v29(v26 + v30[9], v27 + v30[9], v28);
  uint64_t v31 = a3[18];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  v29(a1 + v31, a2 + v31, v28);
  v29(v32 + v30[5], v33 + v30[5], v28);
  v29(v32 + v30[6], v33 + v30[6], v28);
  v29(v32 + v30[7], v33 + v30[7], v28);
  v29(v32 + v30[8], v33 + v30[8], v28);
  v29(v32 + v30[9], v33 + v30[9], v28);
  uint64_t v34 = a3[19];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  v29(a1 + v34, a2 + v34, v28);
  double v37 = (int *)type metadata accessor for PrecipitationAmountByType();
  v29(v35 + v37[5], v36 + v37[5], v28);
  v29(v35 + v37[6], v36 + v37[6], v28);
  v29(v35 + v37[7], v36 + v37[7], v28);
  v29(v35 + v37[8], v36 + v37[8], v28);
  uint64_t v38 = v37[9];
  uint64_t v39 = v35 + v38;
  uint64_t v40 = v36 + v38;
  v29(v35 + v38, v40, v28);
  uint64_t v41 = (int *)type metadata accessor for SnowfallAmount();
  v29(v39 + v41[5], v40 + v41[5], v28);
  v29(v39 + v41[6], v40 + v41[6], v28);
  v29(v39 + v41[7], v40 + v41[7], v28);
  v29(v39 + v41[8], v40 + v41[8], v28);
  v29(v39 + v41[9], v40 + v41[9], v28);
  uint64_t v42 = a3[20];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  v29(a1 + v42, a2 + v42, v28);
  v29(v43 + v37[5], v44 + v37[5], v28);
  v29(v43 + v37[6], v44 + v37[6], v28);
  v29(v43 + v37[7], v44 + v37[7], v28);
  v29(v43 + v37[8], v44 + v37[8], v28);
  uint64_t v45 = v37[9];
  uint64_t v46 = v43 + v45;
  uint64_t v47 = v44 + v45;
  v29(v46, v47, v28);
  v29(v46 + v41[5], v47 + v41[5], v28);
  v29(v46 + v41[6], v47 + v41[6], v28);
  v29(v46 + v41[7], v47 + v41[7], v28);
  v29(v46 + v41[8], v47 + v41[8], v28);
  v29(v46 + v41[9], v47 + v41[9], v28);
  uint64_t v48 = a3[21];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  v29(a1 + v48, a2 + v48, v28);
  v29(v49 + v37[5], v50 + v37[5], v28);
  v29(v49 + v37[6], v50 + v37[6], v28);
  v29(v49 + v37[7], v50 + v37[7], v28);
  v29(v49 + v37[8], v50 + v37[8], v28);
  uint64_t v51 = v37[9];
  uint64_t v52 = v49 + v51;
  uint64_t v53 = v50 + v51;
  v29(v52, v53, v28);
  v29(v52 + v41[5], v53 + v41[5], v28);
  v29(v52 + v41[6], v53 + v41[6], v28);
  v29(v52 + v41[7], v53 + v41[7], v28);
  v29(v52 + v41[8], v53 + v41[8], v28);
  v29(v52 + v41[9], v53 + v41[9], v28);
  uint64_t v54 = a3[22];
  uint64_t v55 = a1 + v54;
  uint64_t v56 = a2 + v54;
  v29(a1 + v54, a2 + v54, v28);
  v29(v55 + v37[5], v56 + v37[5], v28);
  v29(v55 + v37[6], v56 + v37[6], v28);
  v29(v55 + v37[7], v56 + v37[7], v28);
  v29(v55 + v37[8], v56 + v37[8], v28);
  uint64_t v57 = v37[9];
  uint64_t v58 = v55 + v57;
  uint64_t v59 = v56 + v57;
  v29(v58, v59, v28);
  v29(v58 + v41[5], v59 + v41[5], v28);
  v29(v58 + v41[6], v59 + v41[6], v28);
  v29(v58 + v41[7], v59 + v41[7], v28);
  v29(v58 + v41[8], v59 + v41[8], v28);
  v29(v58 + v41[9], v59 + v41[9], v28);
  uint64_t v60 = a3[23];
  uint64_t v61 = a1 + v60;
  uint64_t v62 = a2 + v60;
  v29(a1 + v60, a2 + v60, v28);
  v29(v61 + v37[5], v62 + v37[5], v28);
  v29(v61 + v37[6], v62 + v37[6], v28);
  v29(v61 + v37[7], v62 + v37[7], v28);
  v29(v61 + v37[8], v62 + v37[8], v28);
  uint64_t v63 = v37[9];
  uint64_t v64 = v61 + v63;
  uint64_t v65 = v62 + v63;
  v29(v64, v65, v28);
  v29(v64 + v41[5], v65 + v41[5], v28);
  v29(v64 + v41[6], v65 + v41[6], v28);
  v29(v64 + v41[7], v65 + v41[7], v28);
  v29(v64 + v41[8], v65 + v41[8], v28);
  v29(v64 + v41[9], v65 + v41[9], v28);
  uint64_t v66 = a3[24];
  uint64_t v67 = a1 + v66;
  uint64_t v68 = a2 + v66;
  v29(a1 + v66, a2 + v66, v28);
  v29(v67 + v37[5], v68 + v37[5], v28);
  v29(v67 + v37[6], v68 + v37[6], v28);
  v29(v67 + v37[7], v68 + v37[7], v28);
  v29(v67 + v37[8], v68 + v37[8], v28);
  uint64_t v69 = v37[9];
  uint64_t v70 = v67 + v69;
  uint64_t v71 = v68 + v69;
  v29(v70, v68 + v69, v28);
  v29(v70 + v41[5], v71 + v41[5], v28);
  v29(v70 + v41[6], v71 + v41[6], v28);
  v29(v70 + v41[7], v71 + v41[7], v28);
  v29(v70 + v41[8], v71 + v41[8], v28);
  v29(v70 + v41[9], v71 + v41[9], v28);
  uint64_t v72 = a3;
  uint64_t v73 = a3[25];
  uint64_t v74 = a3[26];
  uint64_t v75 = a1 + v73;
  uint64_t v76 = a2 + v73;
  *(void *)uint64_t v75 = *(void *)v76;
  char v77 = *(unsigned char *)(a2 + v74);
  *(unsigned char *)(v75 + 8) = *(unsigned char *)(v76 + 8);
  *(unsigned char *)(a1 + v74) = v77;
  v116(a1 + v72[27], a2 + v72[27], v111);
  v116(a1 + v72[28], a2 + v72[28], v111);
  uint64_t v78 = a1;
  uint64_t v79 = a2;
  uint64_t v80 = v72;
  uint64_t v81 = v72[29];
  uint64_t v82 = (void *)(a1 + v81);
  uint64_t v117 = v79;
  uint64_t v83 = (const void *)(v79 + v81);
  if (__swift_getEnumTagSinglePayload(v79 + v81, 1, v111))
  {
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
    memcpy(v82, v83, *(void *)(*(void *)(v84 - 8) + 64));
  }
  else
  {
    v116((uint64_t)v82, (uint64_t)v83, v111);
    __swift_storeEnumTagSinglePayload((uint64_t)v82, 0, 1, v111);
  }
  uint64_t v85 = v80[30];
  uint64_t v86 = (void *)(a1 + v85);
  int v87 = (const void *)(v117 + v85);
  if (__swift_getEnumTagSinglePayload(v117 + v85, 1, v111))
  {
    uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
    memcpy(v86, v87, *(void *)(*(void *)(v88 - 8) + 64));
  }
  else
  {
    v116((uint64_t)v86, (uint64_t)v87, v111);
    __swift_storeEnumTagSinglePayload((uint64_t)v86, 0, 1, v111);
  }
  uint64_t v89 = v80[31];
  uint64_t v90 = v80[32];
  uint64_t v91 = a1 + v89;
  uint64_t v92 = v117 + v89;
  *(void *)uint64_t v91 = *(void *)v92;
  *(unsigned char *)(v91 + 8) = *(unsigned char *)(v92 + 8);
  v29(a1 + v90, v117 + v90, v28);
  uint64_t v93 = v80[33];
  uint64_t v94 = a1 + v93;
  uint64_t v95 = v117 + v93;
  *(unsigned char *)(a1 + v93) = *(unsigned char *)(v117 + v93);
  uint64_t v96 = (int *)type metadata accessor for Wind();
  uint64_t v97 = v96[5];
  uint64_t v98 = v94 + v97;
  uint64_t v99 = v95 + v97;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 32))(v98, v99, v100);
  ((void (*)(uint64_t, uint64_t, uint64_t))v112)(v94 + v96[6], v95 + v96[6], v113);
  uint64_t v101 = v96[7];
  uint64_t v102 = (void *)(v94 + v101);
  uint64_t v103 = (const void *)(v95 + v101);
  if (__swift_getEnumTagSinglePayload(v95 + v101, 1, v113))
  {
    uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v102, v103, *(void *)(*(void *)(v104 - 8) + 64));
  }
  else
  {
    ((void (*)(void *, const void *, uint64_t))v112)(v102, v103, v113);
    __swift_storeEnumTagSinglePayload((uint64_t)v102, 0, 1, v113);
  }
  uint64_t v105 = v80[34];
  uint64_t v106 = a1 + v105;
  uint64_t v107 = v117 + v105;
  ((void (*)(uint64_t, uint64_t, uint64_t))v114)(v78 + v105, v117 + v105, v115);
  uint64_t v108 = v78;
  uint64_t v109 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v114)(v106 + v109[5], v107 + v109[5], v115);
  *(void *)(v106 + v109[6]) = *(void *)(v107 + v109[6]);
  *(void *)(v106 + v109[7]) = *(void *)(v107 + v109[7]);
  *(void *)(v106 + v109[8]) = *(void *)(v107 + v109[8]);
  return v108;
}

uint64_t assignWithTake for CurrentWeather(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v123 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  uint64_t v124 = v6;
  v123(a1, a2);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a3[10];
  uint64_t v11 = a1 + v9;
  uint64_t v12 = a2 + v9;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[12];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v120 = *(void *)(v21 - 8);
  uint64_t v121 = v21;
  uint64_t v126 = *(void (**)(uint64_t, uint64_t, uint64_t))(v120 + 40);
  v126(v19, v20, v21);
  uint64_t v22 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v119 = *(void *)(v25 - 8);
  uint64_t v122 = v25;
  uint64_t v125 = *(void (**)(uint64_t, uint64_t))(v119 + 40);
  v125(v23, v24);
  uint64_t v26 = a3[15];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 40))(v27, v28, v29);
  uint64_t v30 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 40);
  v34(v31, v32, v33);
  uint64_t v35 = (int *)type metadata accessor for PrecipitationAmount();
  v34(v31 + v35[5], v32 + v35[5], v33);
  v34(v31 + v35[6], v32 + v35[6], v33);
  v34(v31 + v35[7], v32 + v35[7], v33);
  v34(v31 + v35[8], v32 + v35[8], v33);
  v34(v31 + v35[9], v32 + v35[9], v33);
  uint64_t v36 = a3[18];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  v34(a1 + v36, a2 + v36, v33);
  v34(v37 + v35[5], v38 + v35[5], v33);
  v34(v37 + v35[6], v38 + v35[6], v33);
  v34(v37 + v35[7], v38 + v35[7], v33);
  v34(v37 + v35[8], v38 + v35[8], v33);
  v34(v37 + v35[9], v38 + v35[9], v33);
  uint64_t v39 = a3[19];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  v34(a1 + v39, a2 + v39, v33);
  uint64_t v42 = (int *)type metadata accessor for PrecipitationAmountByType();
  v34(v40 + v42[5], v41 + v42[5], v33);
  v34(v40 + v42[6], v41 + v42[6], v33);
  v34(v40 + v42[7], v41 + v42[7], v33);
  v34(v40 + v42[8], v41 + v42[8], v33);
  uint64_t v43 = v42[9];
  uint64_t v44 = v40 + v43;
  uint64_t v45 = v41 + v43;
  v34(v40 + v43, v45, v33);
  uint64_t v46 = (int *)type metadata accessor for SnowfallAmount();
  v34(v44 + v46[5], v45 + v46[5], v33);
  v34(v44 + v46[6], v45 + v46[6], v33);
  v34(v44 + v46[7], v45 + v46[7], v33);
  v34(v44 + v46[8], v45 + v46[8], v33);
  v34(v44 + v46[9], v45 + v46[9], v33);
  uint64_t v47 = a3[20];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = a2 + v47;
  v34(a1 + v47, a2 + v47, v33);
  v34(v48 + v42[5], v49 + v42[5], v33);
  v34(v48 + v42[6], v49 + v42[6], v33);
  v34(v48 + v42[7], v49 + v42[7], v33);
  v34(v48 + v42[8], v49 + v42[8], v33);
  uint64_t v50 = v42[9];
  uint64_t v51 = v48 + v50;
  uint64_t v52 = v49 + v50;
  v34(v51, v52, v33);
  v34(v51 + v46[5], v52 + v46[5], v33);
  v34(v51 + v46[6], v52 + v46[6], v33);
  v34(v51 + v46[7], v52 + v46[7], v33);
  v34(v51 + v46[8], v52 + v46[8], v33);
  v34(v51 + v46[9], v52 + v46[9], v33);
  uint64_t v53 = a3[21];
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  v34(a1 + v53, a2 + v53, v33);
  v34(v54 + v42[5], v55 + v42[5], v33);
  v34(v54 + v42[6], v55 + v42[6], v33);
  v34(v54 + v42[7], v55 + v42[7], v33);
  v34(v54 + v42[8], v55 + v42[8], v33);
  uint64_t v56 = v42[9];
  uint64_t v57 = v54 + v56;
  uint64_t v58 = v55 + v56;
  v34(v57, v58, v33);
  v34(v57 + v46[5], v58 + v46[5], v33);
  v34(v57 + v46[6], v58 + v46[6], v33);
  v34(v57 + v46[7], v58 + v46[7], v33);
  v34(v57 + v46[8], v58 + v46[8], v33);
  v34(v57 + v46[9], v58 + v46[9], v33);
  uint64_t v59 = a3[22];
  uint64_t v60 = a1 + v59;
  uint64_t v61 = a2 + v59;
  v34(a1 + v59, a2 + v59, v33);
  v34(v60 + v42[5], v61 + v42[5], v33);
  v34(v60 + v42[6], v61 + v42[6], v33);
  v34(v60 + v42[7], v61 + v42[7], v33);
  v34(v60 + v42[8], v61 + v42[8], v33);
  uint64_t v62 = v42[9];
  uint64_t v63 = v60 + v62;
  uint64_t v64 = v61 + v62;
  v34(v63, v64, v33);
  v34(v63 + v46[5], v64 + v46[5], v33);
  v34(v63 + v46[6], v64 + v46[6], v33);
  v34(v63 + v46[7], v64 + v46[7], v33);
  v34(v63 + v46[8], v64 + v46[8], v33);
  v34(v63 + v46[9], v64 + v46[9], v33);
  uint64_t v65 = a3[23];
  uint64_t v66 = a1 + v65;
  uint64_t v67 = a2 + v65;
  v34(a1 + v65, a2 + v65, v33);
  v34(v66 + v42[5], v67 + v42[5], v33);
  v34(v66 + v42[6], v67 + v42[6], v33);
  v34(v66 + v42[7], v67 + v42[7], v33);
  v34(v66 + v42[8], v67 + v42[8], v33);
  uint64_t v68 = v42[9];
  uint64_t v69 = v66 + v68;
  uint64_t v70 = v67 + v68;
  v34(v69, v70, v33);
  v34(v69 + v46[5], v70 + v46[5], v33);
  v34(v69 + v46[6], v70 + v46[6], v33);
  v34(v69 + v46[7], v70 + v46[7], v33);
  v34(v69 + v46[8], v70 + v46[8], v33);
  v34(v69 + v46[9], v70 + v46[9], v33);
  uint64_t v71 = a3[24];
  uint64_t v72 = a1 + v71;
  uint64_t v73 = a2 + v71;
  v34(a1 + v71, a2 + v71, v33);
  v34(v72 + v42[5], v73 + v42[5], v33);
  v34(v72 + v42[6], v73 + v42[6], v33);
  v34(v72 + v42[7], v73 + v42[7], v33);
  v34(v72 + v42[8], v73 + v42[8], v33);
  uint64_t v74 = v42[9];
  uint64_t v75 = v72 + v74;
  uint64_t v76 = v73 + v74;
  v34(v75, v73 + v74, v33);
  v34(v75 + v46[5], v76 + v46[5], v33);
  v34(v75 + v46[6], v76 + v46[6], v33);
  v34(v75 + v46[7], v76 + v46[7], v33);
  v34(v75 + v46[8], v76 + v46[8], v33);
  v34(v75 + v46[9], v76 + v46[9], v33);
  uint64_t v77 = a3[25];
  uint64_t v78 = a3[26];
  uint64_t v79 = a1 + v77;
  uint64_t v80 = a2 + v77;
  *(void *)uint64_t v79 = *(void *)v80;
  char v81 = *(unsigned char *)(a2 + v78);
  *(unsigned char *)(v79 + 8) = *(unsigned char *)(v80 + 8);
  *(unsigned char *)(a1 + v78) = v81;
  v126(a1 + a3[27], a2 + a3[27], v121);
  v126(a1 + a3[28], a2 + a3[28], v121);
  uint64_t v82 = a3[29];
  uint64_t v83 = (void *)(a1 + v82);
  uint64_t v84 = (const void *)(a2 + v82);
  LODWORD(v75) = __swift_getEnumTagSinglePayload(a1 + v82, 1, v121);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v84, 1, v121);
  if (v75)
  {
    if (EnumTagSinglePayload)
    {
      uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v83, v84, *(void *)(*(void *)(v86 - 8) + 64));
      uint64_t v87 = v121;
    }
    else
    {
      uint64_t v87 = v121;
      (*(void (**)(void *, const void *, uint64_t))(v120 + 32))(v83, v84, v121);
      __swift_storeEnumTagSinglePayload((uint64_t)v83, 0, 1, v121);
    }
  }
  else
  {
    uint64_t v87 = v121;
    if (EnumTagSinglePayload)
    {
      (*(void (**)(void *, uint64_t))(v120 + 8))(v83, v121);
      uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
      memcpy(v83, v84, *(void *)(*(void *)(v88 - 8) + 64));
    }
    else
    {
      v126((uint64_t)v83, (uint64_t)v84, v121);
    }
  }
  uint64_t v89 = a3[30];
  uint64_t v90 = (void *)(a1 + v89);
  uint64_t v91 = (const void *)(a2 + v89);
  int v92 = __swift_getEnumTagSinglePayload(a1 + v89, 1, v87);
  uint64_t v93 = v87;
  int v94 = v92;
  int v95 = __swift_getEnumTagSinglePayload((uint64_t)v91, 1, v93);
  if (v94)
  {
    if (!v95)
    {
      (*(void (**)(void *, const void *, uint64_t))(v120 + 32))(v90, v91, v121);
      __swift_storeEnumTagSinglePayload((uint64_t)v90, 0, 1, v121);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v95)
  {
    (*(void (**)(void *, uint64_t))(v120 + 8))(v90, v121);
LABEL_13:
    uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
    memcpy(v90, v91, *(void *)(*(void *)(v96 - 8) + 64));
    goto LABEL_14;
  }
  v126((uint64_t)v90, (uint64_t)v91, v121);
LABEL_14:
  uint64_t v97 = a3[31];
  uint64_t v98 = a3[32];
  uint64_t v99 = a1 + v97;
  uint64_t v100 = a2 + v97;
  *(void *)uint64_t v99 = *(void *)v100;
  *(unsigned char *)(v99 + 8) = *(unsigned char *)(v100 + 8);
  v34(a1 + v98, a2 + v98, v33);
  uint64_t v101 = a3[33];
  uint64_t v102 = a1 + v101;
  uint64_t v103 = a2 + v101;
  *(unsigned char *)(a1 + v101) = *(unsigned char *)(a2 + v101);
  uint64_t v104 = (int *)type metadata accessor for Wind();
  uint64_t v105 = v104[5];
  uint64_t v106 = v102 + v105;
  uint64_t v107 = v103 + v105;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v108 - 8) + 40))(v106, v107, v108);
  ((void (*)(uint64_t, uint64_t, uint64_t))v125)(v102 + v104[6], v103 + v104[6], v122);
  uint64_t v109 = v104[7];
  uint64_t v110 = (void *)(v102 + v109);
  uint64_t v111 = (const void *)(v103 + v109);
  LODWORD(v104) = __swift_getEnumTagSinglePayload(v102 + v109, 1, v122);
  int v112 = __swift_getEnumTagSinglePayload((uint64_t)v111, 1, v122);
  if (!v104)
  {
    if (!v112)
    {
      ((void (*)(void *, const void *, uint64_t))v125)(v110, v111, v122);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v119 + 8))(v110, v122);
    goto LABEL_19;
  }
  if (v112)
  {
LABEL_19:
    uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v110, v111, *(void *)(*(void *)(v113 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v119 + 32))(v110, v111, v122);
  __swift_storeEnumTagSinglePayload((uint64_t)v110, 0, 1, v122);
LABEL_20:
  uint64_t v114 = a3[34];
  uint64_t v115 = a1 + v114;
  uint64_t v116 = a2 + v114;
  ((void (*)(uint64_t, uint64_t, uint64_t))v123)(a1 + v114, v116, v124);
  uint64_t v117 = (int *)type metadata accessor for WeatherMetadata();
  ((void (*)(uint64_t, uint64_t, uint64_t))v123)(v115 + v117[5], v116 + v117[5], v124);
  *(void *)(v115 + v117[6]) = *(void *)(v116 + v117[6]);
  *(void *)(v115 + v117[7]) = *(void *)(v116 + v117[7]);
  *(void *)(v115 + v117[8]) = *(void *)(v116 + v117[8]);
  swift_release();
  return a1;
}

uint64_t sub_1A93986AC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_25:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v14 = a3[12];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a2)
      {
        uint64_t v8 = v15;
        uint64_t v14 = a3[14];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a2)
        {
          uint64_t v8 = v17;
          uint64_t v14 = a3[15];
        }
        else
        {
          type metadata accessor for PrecipitationAmount();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a2)
          {
            uint64_t v8 = v19;
            uint64_t v14 = a3[17];
          }
          else
          {
            type metadata accessor for PrecipitationAmountByType();
            OUTLINED_FUNCTION_4_1();
            if (*(_DWORD *)(v22 + 84) == a2)
            {
              uint64_t v8 = v21;
              uint64_t v14 = a3[19];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
              OUTLINED_FUNCTION_4_1();
              if (*(_DWORD *)(v24 + 84) == a2)
              {
                uint64_t v8 = v23;
                uint64_t v14 = a3[29];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
                OUTLINED_FUNCTION_4_1();
                if (*(_DWORD *)(v26 + 84) == a2)
                {
                  uint64_t v8 = v25;
                  uint64_t v14 = a3[32];
                }
                else
                {
                  type metadata accessor for Wind();
                  OUTLINED_FUNCTION_4_1();
                  if (*(_DWORD *)(v28 + 84) == a2)
                  {
                    uint64_t v8 = v27;
                    uint64_t v14 = a3[33];
                  }
                  else
                  {
                    uint64_t v8 = type metadata accessor for WeatherMetadata();
                    uint64_t v14 = a3[34];
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v9 = a1 + v14;
    goto LABEL_25;
  }
  unint64_t v10 = *(void *)(a1 + a3[11] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

void sub_1A9398894(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[11] + 8) = (a2 - 1);
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[12];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[14];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572F0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[15];
        }
        else
        {
          type metadata accessor for PrecipitationAmount();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[17];
          }
          else
          {
            type metadata accessor for PrecipitationAmountByType();
            OUTLINED_FUNCTION_4_1();
            if (*(_DWORD *)(v22 + 84) == a3)
            {
              uint64_t v10 = v21;
              uint64_t v14 = a4[19];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571A8);
              OUTLINED_FUNCTION_4_1();
              if (*(_DWORD *)(v24 + 84) == a3)
              {
                uint64_t v10 = v23;
                uint64_t v14 = a4[29];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
                OUTLINED_FUNCTION_4_1();
                if (*(_DWORD *)(v26 + 84) == a3)
                {
                  uint64_t v10 = v25;
                  uint64_t v14 = a4[32];
                }
                else
                {
                  type metadata accessor for Wind();
                  OUTLINED_FUNCTION_4_1();
                  if (*(_DWORD *)(v28 + 84) == a3)
                  {
                    uint64_t v10 = v27;
                    uint64_t v14 = a4[33];
                  }
                  else
                  {
                    uint64_t v10 = type metadata accessor for WeatherMetadata();
                    uint64_t v14 = a4[34];
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t getEnumTagSinglePayload for CurrentWeather.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE2)
  {
    if (a2 + 30 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 30) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 31;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v5 = v6 - 31;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CurrentWeather.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *uint64_t result = a2 + 30;
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
        JUMPOUT(0x1A9398BCCLL);
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
          *uint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CurrentWeather.CodingKeys()
{
  return &type metadata for CurrentWeather.CodingKeys;
}

unint64_t sub_1A9398C08()
{
  unint64_t result = qword_1E97BC828;
  if (!qword_1E97BC828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC828);
  }
  return result;
}

unint64_t sub_1A9398C58()
{
  unint64_t result = qword_1EB656268;
  if (!qword_1EB656268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656268);
  }
  return result;
}

unint64_t sub_1A9398CA8()
{
  unint64_t result = qword_1EB656260;
  if (!qword_1EB656260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656260);
  }
  return result;
}

uint64_t TideEvent.init(date:eventType:height:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v5 = *a2;
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a3, a1);
  *(unsigned char *)(a3 + *(int *)(type metadata accessor for TideEvent() + 20)) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v7 = OUTLINED_FUNCTION_14();

  return v8(v7);
}

uint64_t type metadata accessor for TideEvent()
{
  uint64_t result = qword_1E97BC8A8;
  if (!qword_1E97BC8A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TideEvent.date.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t TideEvent.date.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*TideEvent.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t TideEvent.eventType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for TideEvent();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t TideEvent.eventType.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for TideEvent();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

double (*TideEvent.eventType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t TideEvent.height.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TideEvent() + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t TideEvent.height.setter()
{
  type metadata accessor for TideEvent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*TideEvent.height.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t static TideEvent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for TideEvent();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  sub_1A91D76FC();
  OUTLINED_FUNCTION_14();

  return sub_1A93AB8A8();
}

BOOL static TideEvent.EventType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1A9399144(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x707954746E657665 && a2 == 0xE900000000000065;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x746867696568 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1A93AE4B8();
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

uint64_t sub_1A9399288(char a1)
{
  if (!a1) {
    return 1702125924;
  }
  if (a1 == 1) {
    return 0x707954746E657665;
  }
  return 0x746867696568;
}

uint64_t sub_1A93992D8()
{
  return sub_1A9399288(*v0);
}

uint64_t sub_1A93992E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9399144(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9399308(uint64_t a1)
{
  unint64_t v2 = sub_1A939956C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9399344(uint64_t a1)
{
  unint64_t v2 = sub_1A939956C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TideEvent.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC830);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939956C();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A91EB954(&qword_1EB656220);
  sub_1A93AE478();
  if (!v1)
  {
    type metadata accessor for TideEvent();
    sub_1A93995B8();
    sub_1A93AE478();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    sub_1A91E3368(&qword_1EB656200);
    sub_1A93AE478();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1A939956C()
{
  unint64_t result = qword_1E97BC838;
  if (!qword_1E97BC838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC838);
  }
  return result;
}

unint64_t sub_1A93995B8()
{
  unint64_t result = qword_1E97BC840;
  if (!qword_1E97BC840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC840);
  }
  return result;
}

uint64_t TideEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_16();
  uint64_t v24 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_9();
  uint64_t v23 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC848);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_6();
  uint64_t v11 = type metadata accessor for TideEvent();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939956C();
  sub_1A93AE5C8();
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_1A91EB954(&qword_1E97B80D0);
  OUTLINED_FUNCTION_9_35();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v15, v23, v24);
  sub_1A939994C();
  OUTLINED_FUNCTION_9_35();
  *(unsigned char *)(v15 + *(int *)(v11 + 20)) = v25;
  sub_1A91E3368(&qword_1E97B8138);
  sub_1A93AE3C8();
  uint64_t v16 = OUTLINED_FUNCTION_2_38();
  v17(v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v15 + *(int *)(v11 + 24), v2, v21);
  sub_1A9399998(v15, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1A93999FC(v15);
}

unint64_t sub_1A939994C()
{
  unint64_t result = qword_1E97BC850;
  if (!qword_1E97BC850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC850);
  }
  return result;
}

uint64_t sub_1A9399998(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TideEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A93999FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TideEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A9399A58@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TideEvent.init(from:)(a1, a2);
}

uint64_t sub_1A9399A70(void *a1)
{
  return TideEvent.encode(to:)(a1);
}

uint64_t TideEvent.EventType.hash(into:)()
{
  return sub_1A93AE558();
}

uint64_t sub_1A9399AB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7827308 && a2 == 0xE300000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1751607656 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A9399B88(char a1)
{
  if (a1) {
    return 1751607656;
  }
  else {
    return 7827308;
  }
}

uint64_t sub_1A9399BB0()
{
  return sub_1A9399B88(*v0);
}

uint64_t sub_1A9399BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9399AB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9399BE0(uint64_t a1)
{
  unint64_t v2 = sub_1A9399F54();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9399C1C(uint64_t a1)
{
  unint64_t v2 = sub_1A9399F54();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9399C58(uint64_t a1)
{
  unint64_t v2 = sub_1A9399FA0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9399C94(uint64_t a1)
{
  unint64_t v2 = sub_1A9399FA0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A9399CD0(uint64_t a1)
{
  unint64_t v2 = sub_1A9399FEC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9399D0C(uint64_t a1)
{
  unint64_t v2 = sub_1A9399FEC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TideEvent.EventType.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC858);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC860);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC868);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10 - v9;
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9399F54();
  sub_1A93AE5D8();
  uint64_t v13 = (uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  if (v12) {
    sub_1A9399FA0();
  }
  else {
    sub_1A9399FEC();
  }
  sub_1A93AE3F8();
  OUTLINED_FUNCTION_27();
  v15(v14);
  return (*v13)(v11, v5);
}

unint64_t sub_1A9399F54()
{
  unint64_t result = qword_1E97BC870;
  if (!qword_1E97BC870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC870);
  }
  return result;
}

unint64_t sub_1A9399FA0()
{
  unint64_t result = qword_1E97BC878;
  if (!qword_1E97BC878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC878);
  }
  return result;
}

unint64_t sub_1A9399FEC()
{
  unint64_t result = qword_1E97BC880;
  if (!qword_1E97BC880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC880);
  }
  return result;
}

uint64_t TideEvent.EventType.hashValue.getter()
{
  return sub_1A93AE578();
}

uint64_t TideEvent.EventType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC888);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC890);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_16();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC898);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9399F54();
  sub_1A93AE5C8();
  if (!v24)
  {
    uint64_t v25 = (uint64_t)a1;
    uint64_t v9 = sub_1A93AE3D8();
    uint64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
      char v11 = *(unsigned char *)(v9 + 32);
      sub_1A921AB10(1, v10, v9, v9 + 32, 0, (2 * v10) | 1);
      uint64_t v13 = v12;
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      if (v13 == v15 >> 1)
      {
        sub_1A9399FA0();
        sub_1A93AE318();
        OUTLINED_FUNCTION_27();
        v20();
        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v2, v6);
        *a2 = v11;
        return __swift_destroy_boxed_opaque_existential_1(v25);
      }
    }
    uint64_t v16 = sub_1A93AE278();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97B86C0);
    *uint64_t v18 = &type metadata for TideEvent.EventType;
    sub_1A93AE328();
    sub_1A93AE268();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x1E4FBBA70], v16);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_27();
    v19();
    a1 = (void *)v25;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1A939A4AC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TideEvent.EventType.init(from:)(a1, a2);
}

uint64_t sub_1A939A4C4(void *a1)
{
  return TideEvent.EventType.encode(to:)(a1);
}

unint64_t sub_1A939A4E4()
{
  unint64_t result = qword_1E97BC8A0;
  if (!qword_1E97BC8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8A0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TideEvent(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for TideEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A939AA18);
}

uint64_t sub_1A939AA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 254)
    {
      unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
      if (v10 >= 2) {
        return v10 - 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TideEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A939AAD8);
}

void sub_1A939AAD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_1A939AB84()
{
  sub_1A93ABC08();
  if (v0 <= 0x3F)
  {
    sub_1A91D5860();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for TideEvent.EventType()
{
  return &type metadata for TideEvent.EventType;
}

unsigned char *_s10WeatherKit9TideEventV9EventTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939AD34);
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

ValueMetadata *type metadata accessor for TideEvent.EventType.CodingKeys()
{
  return &type metadata for TideEvent.EventType.CodingKeys;
}

ValueMetadata *type metadata accessor for TideEvent.EventType.LowCodingKeys()
{
  return &type metadata for TideEvent.EventType.LowCodingKeys;
}

ValueMetadata *type metadata accessor for TideEvent.EventType.HighCodingKeys()
{
  return &type metadata for TideEvent.EventType.HighCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TideEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939AE58);
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

ValueMetadata *type metadata accessor for TideEvent.CodingKeys()
{
  return &type metadata for TideEvent.CodingKeys;
}

unint64_t sub_1A939AE94()
{
  unint64_t result = qword_1E97BC8B8;
  if (!qword_1E97BC8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8B8);
  }
  return result;
}

unint64_t sub_1A939AEE4()
{
  unint64_t result = qword_1E97BC8C0;
  if (!qword_1E97BC8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8C0);
  }
  return result;
}

unint64_t sub_1A939AF34()
{
  unint64_t result = qword_1E97BC8C8;
  if (!qword_1E97BC8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8C8);
  }
  return result;
}

unint64_t sub_1A939AF84()
{
  unint64_t result = qword_1E97BC8D0;
  if (!qword_1E97BC8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8D0);
  }
  return result;
}

unint64_t sub_1A939AFD4()
{
  unint64_t result = qword_1E97BC8D8;
  if (!qword_1E97BC8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8D8);
  }
  return result;
}

unint64_t sub_1A939B024()
{
  unint64_t result = qword_1E97BC8E0;
  if (!qword_1E97BC8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8E0);
  }
  return result;
}

unint64_t sub_1A939B074()
{
  unint64_t result = qword_1E97BC8E8;
  if (!qword_1E97BC8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8E8);
  }
  return result;
}

unint64_t sub_1A939B0C4()
{
  unint64_t result = qword_1E97BC8F0;
  if (!qword_1E97BC8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8F0);
  }
  return result;
}

unint64_t sub_1A939B114()
{
  unint64_t result = qword_1E97BC8F8;
  if (!qword_1E97BC8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC8F8);
  }
  return result;
}

unint64_t sub_1A939B164()
{
  unint64_t result = qword_1E97BC900;
  if (!qword_1E97BC900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC900);
  }
  return result;
}

uint64_t HourMarineWeather.init(date:primarySwell:waterTemperature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a3, a1);
  uint64_t v7 = type metadata accessor for HourMarineWeather();
  sub_1A9278384(a2, a3 + *(int *)(v7 + 20));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v8 = OUTLINED_FUNCTION_14();

  return v9(v8);
}

uint64_t HourMarineWeather.date.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t HourMarineWeather.date.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*HourMarineWeather.date.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t HourMarineWeather.primarySwell.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HourMarineWeather();
  return sub_1A939BF20(v1 + *(int *)(v3 + 20), a1, (void (*)(void))type metadata accessor for Swell);
}

uint64_t HourMarineWeather.primarySwell.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_6_35() + 20);

  return sub_1A939B3D8(v0, v2);
}

uint64_t sub_1A939B3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Swell();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double (*HourMarineWeather.primarySwell.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t HourMarineWeather.waterTemperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HourMarineWeather() + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t HourMarineWeather.waterTemperature.setter()
{
  OUTLINED_FUNCTION_6_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*HourMarineWeather.waterTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A939B594(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x537972616D697270 && a2 == 0xEC0000006C6C6577;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001A93DC440)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_1A93AE4B8();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1A939B6EC(char a1)
{
  if (!a1) {
    return 1702125924;
  }
  if (a1 == 1) {
    return 0x537972616D697270;
  }
  return 0xD000000000000010;
}

uint64_t sub_1A939B748()
{
  return sub_1A939B6EC(*v0);
}

uint64_t sub_1A939B750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A939B594(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A939B778(uint64_t a1)
{
  unint64_t v2 = sub_1A939BA24();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A939B7B4(uint64_t a1)
{
  unint64_t v2 = sub_1A939BA24();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t HourMarineWeather.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC908);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939BA24();
  sub_1A93AE5D8();
  sub_1A93ABC08();
  sub_1A939BED8(&qword_1EB656220, MEMORY[0x1E4F27928]);
  sub_1A93AE478();
  if (!v1)
  {
    type metadata accessor for HourMarineWeather();
    type metadata accessor for Swell();
    sub_1A939BED8(&qword_1E97BC918, (void (*)(uint64_t))type metadata accessor for Swell);
    sub_1A93AE478();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    sub_1A9217D48(&qword_1EB656210);
    sub_1A93AE478();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1A939BA24()
{
  unint64_t result = qword_1E97BC910;
  if (!qword_1E97BC910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC910);
  }
  return result;
}

uint64_t HourMarineWeather.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v32 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  uint64_t v34 = v6;
  uint64_t v38 = type metadata accessor for Swell();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  uint64_t v8 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v36 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_9();
  uint64_t v39 = v11;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC920);
  OUTLINED_FUNCTION_2();
  uint64_t v37 = v12;
  MEMORY[0x1F4188790](v13);
  unint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for HourMarineWeather();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939BA24();
  uint64_t v41 = v15;
  uint64_t v20 = v42;
  sub_1A93AE5C8();
  if (v20) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v31 = v16;
  uint64_t v42 = v19;
  uint64_t v21 = (uint64_t)a1;
  char v45 = 0;
  sub_1A939BED8(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
  uint64_t v22 = v39;
  sub_1A93AE3C8();
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v42, v22, v8);
  char v44 = 1;
  sub_1A939BED8(&qword_1E97BC928, (void (*)(uint64_t))type metadata accessor for Swell);
  uint64_t v23 = v2;
  sub_1A93AE3C8();
  uint64_t v39 = v8;
  uint64_t v24 = v31;
  uint64_t v25 = (uint64_t)v42;
  sub_1A9278384(v23, (uint64_t)&v42[*(int *)(v31 + 20)]);
  char v43 = 2;
  sub_1A9217D48(&qword_1E97B8230);
  uint64_t v26 = v34;
  uint64_t v27 = v35;
  sub_1A93AE3C8();
  uint64_t v28 = OUTLINED_FUNCTION_3();
  v29(v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v25 + *(int *)(v24 + 24), v26, v27);
  sub_1A939BF20(v25, v33, (void (*)(void))type metadata accessor for HourMarineWeather);
  __swift_destroy_boxed_opaque_existential_1(v21);
  return sub_1A939BF80(v25, (void (*)(void))type metadata accessor for HourMarineWeather);
}

uint64_t sub_1A939BED8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A939BF20(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1A939BF80(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1A939BFD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HourMarineWeather.init(from:)(a1, a2);
}

uint64_t sub_1A939BFF0(void *a1)
{
  return HourMarineWeather.encode(to:)(a1);
}

uint64_t static HourMarineWeather.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for HourMarineWeather();
  if (!static Swell.== infix(_:_:)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  sub_1A91D76BC();
  OUTLINED_FUNCTION_14();

  return sub_1A93AB8A8();
}

uint64_t *initializeBufferWithCopyOfBuffer for HourMarineWeather(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = type metadata accessor for Swell();
    uint64_t v13 = *(int *)(v12 + 20);
    uint64_t v14 = &v9[v13];
    unint64_t v15 = &v10[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    *(void *)&v9[*(int *)(v12 + 24)] = *(void *)&v10[*(int *)(v12 + 24)];
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for HourMarineWeather(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v5 + *(int *)(type metadata accessor for Swell() + 20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + *(int *)(a2 + 24);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(v9, v10);
}

uint64_t initializeWithCopy for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for Swell();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  *(void *)(v8 + *(int *)(v11 + 24)) = *(void *)(v9 + *(int *)(v11 + 24));
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for Swell();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)(v8 + *(int *)(v11 + 24)) = *(void *)(v9 + *(int *)(v11 + 24));
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for Swell();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)(v8 + *(int *)(v11 + 24)) = *(void *)(v9 + *(int *)(v11 + 24));
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A93ABC08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for Swell();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(void *)(v8 + *(int *)(v11 + 24)) = *(void *)(v9 + *(int *)(v11 + 24));
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A939C9B8);
}

uint64_t sub_1A939C9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    type metadata accessor for Swell();
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for HourMarineWeather(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A939CA70);
}

uint64_t sub_1A939CA70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    type metadata accessor for Swell();
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

unsigned char *storeEnumTagSinglePayload for HourMarineWeather.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939CBE8);
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

ValueMetadata *type metadata accessor for HourMarineWeather.CodingKeys()
{
  return &type metadata for HourMarineWeather.CodingKeys;
}

unint64_t sub_1A939CC24()
{
  unint64_t result = qword_1E97BC930;
  if (!qword_1E97BC930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC930);
  }
  return result;
}

unint64_t sub_1A939CC74()
{
  unint64_t result = qword_1E97BC938;
  if (!qword_1E97BC938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC938);
  }
  return result;
}

unint64_t sub_1A939CCC4()
{
  unint64_t result = qword_1E97BC940;
  if (!qword_1E97BC940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC940);
  }
  return result;
}

uint64_t sub_1A939CD10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571D8);
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_1A93AD188();
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14 - v13;
  v31[0] = a1;
  v31[1] = a2;
  unint64_t v29 = a2;
  swift_bridgeObjectRetain();
  sub_1A93ADE78();
  sub_1A93AC678();
  sub_1A93ADE78();
  swift_bridgeObjectRelease();
  unint64_t v16 = a2;
  if (qword_1EB658498 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1A93ADAA8();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EB6623C8);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_1A93ADA88();
  os_log_type_t v19 = sub_1A93AE128();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v28 = a3;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    v31[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1A91C1C10(a1, v16, v31);
    OUTLINED_FUNCTION_2_39(v21);
    sub_1A93AE178();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9191000, v18, v19, "Attempting to retrieve air quality scale with cache key: %{public}s from cache", v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21();
    a3 = v28;
    OUTLINED_FUNCTION_21();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1A91AB404(a1, v16, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1A939D5E0(v9);
    uint64_t v22 = 1;
  }
  else
  {
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32);
    v23(v15, v9, v10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1A93ADA88();
    os_log_type_t v25 = sub_1A93AE128();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      v31[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136446466;
      swift_bridgeObjectRetain();
      sub_1A91C1C10(a1, v29, v31);
      sub_1A93AE178();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_1A91C1C10(a1, v16, v31);
      sub_1A93AE178();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9191000, v24, v25, "Successfully retrieved air quality scale: %{public}s with cache key:  %{public}s from cache", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_21();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v23(a3, v15, v10);
    uint64_t v22 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a3, v22, 1, v10);
}

uint64_t sub_1A939D1C4(uint64_t a1)
{
  return sub_1A93AC608();
}

uint64_t sub_1A939D238(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_1A93AD188();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A92D9F34(a1, a3, a4);
  if (qword_1EB658498 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A93ADAA8();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EB6623C8);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1A93ADA88();
  os_log_type_t v14 = sub_1A93AE128();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v21 = v8;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = a1;
    unint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v23 = v4;
    uint64_t v18 = v17;
    uint64_t v25 = v17;
    *(_DWORD *)unint64_t v16 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1A91C1C10(a3, a4, &v25);
    uint64_t v8 = v21;
    sub_1A93AE178();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9191000, v13, v14, "Successfully fetched air quality scale with key: %{public}s and updated the scale cache", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0F2200](v18, -1, -1);
    os_log_type_t v19 = v16;
    a1 = v22;
    MEMORY[0x1AD0F2200](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656B58);
  swift_allocObject();
  return sub_1A93ABFD8();
}

uint64_t sub_1A939D4E0()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1A939D520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F415F248](a1, *v5, a5);
}

uint64_t sub_1A939D550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x1F415F240](a1, a2, *v6, a6);
}

uint64_t sub_1A939D580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return MEMORY[0x1F415F250](a1, a2, a3, *v7, a7);
}

uint64_t sub_1A939D5B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MEMORY[0x1F415F238](a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_1A939D5E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A939D640()
{
  return sub_1A939D1C4(*(void *)(v0 + 16));
}

uint64_t sub_1A939D660()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A939D698(uint64_t a1, uint64_t a2)
{
  return sub_1A939D238(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1A939D6B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1A939D710@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

void sub_1A939D71C(void *a1@<X8>)
{
}

uint64_t sub_1A939D724@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

void sub_1A939D734(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  OUTLINED_FUNCTION_5_42(a1);
}

void sub_1A939D758(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  *v2 |= a2;
  OUTLINED_FUNCTION_5_42(a1);
}

uint64_t sub_1A939D770(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_1A939D780(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1A939D790@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1A939D79C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1A939D7A8(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1A939D7B4(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1A939D7C0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1A939D7CC(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

WeatherKit::WeatherServiceCaching::Options __swiftcall WeatherServiceCaching.Options.init(rawValue:)(WeatherKit::WeatherServiceCaching::Options rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static WeatherServiceCaching.Options.allowsExpiredData.getter(void *a1@<X8>)
{
}

void static WeatherServiceCaching.Options.allowsFlexibleMarineTimeWindow.getter(void *a1@<X8>)
{
}

void static WeatherServiceCaching.Options.allowsMissingProducts.getter(void *a1@<X8>)
{
}

void static WeatherServiceCaching.Options.reloadIgnoringLocalCacheData.getter(void *a1@<X8>)
{
}

void static WeatherServiceCaching.Options.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t WeatherServiceCaching.Options.rawValue.getter()
{
  return *(void *)v0;
}

WeatherKit::WeatherServiceCaching::Options sub_1A939D814(Swift::Int *a1)
{
  return WeatherServiceCaching.Options.init(rawValue:)(*a1);
}

uint64_t sub_1A939D81C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A939D710(*a1, *v2, a2);
}

void sub_1A939D828(void *a1@<X8>)
{
}

uint64_t sub_1A939D834@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A939D724(*a1, *v2, a2);
}

BOOL sub_1A939D840(void *a1, uint64_t *a2)
{
  return sub_1A9349E48(a1, *a2);
}

void sub_1A939D848(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_1A939D864(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1A939D880(uint64_t *a1)
{
  return sub_1A934A0F8(*a1);
}

uint64_t sub_1A939D888(uint64_t *a1)
{
  return sub_1A939D770(*a1);
}

uint64_t sub_1A939D890(uint64_t *a1)
{
  return sub_1A939D780(*a1);
}

uint64_t sub_1A939D898@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A939D790(*a1, *v2, a2);
}

BOOL sub_1A939D8A4(uint64_t *a1)
{
  return sub_1A939D79C(*a1, *v1);
}

BOOL sub_1A939D8B0(uint64_t *a1)
{
  return sub_1A939D7A8(*a1, *v1);
}

BOOL sub_1A939D8BC(uint64_t *a1)
{
  return sub_1A939D7B4(*a1, *v1);
}

uint64_t sub_1A939D8C8(uint64_t *a1)
{
  return sub_1A939D7CC(*a1);
}

WeatherKit::WeatherServiceCaching::Options sub_1A939D8D0@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = WeatherServiceCaching.Options.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1A939D8FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherServiceCaching.Options.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1A939D924@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1A939D6B8(a1, a2);
}

BOOL static WeatherServiceCaching.EnablementStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WeatherServiceCaching.EnablementStatus.hash(into:)()
{
  return sub_1A93AE558();
}

uint64_t WeatherServiceCaching.EnablementStatus.hashValue.getter()
{
  return sub_1A93AE578();
}

WeatherKit::WeatherServiceCaching __swiftcall WeatherServiceCaching.init(weatherDataCaching:availableDataSetCaching:statisticsCaching:)(WeatherKit::WeatherServiceCaching::EnablementStatus weatherDataCaching, WeatherKit::WeatherServiceCaching::EnablementStatus availableDataSetCaching, WeatherKit::WeatherServiceCaching::EnablementStatus statisticsCaching)
{
  char v4 = *(unsigned char *)weatherDataCaching;
  char v5 = *(unsigned char *)statisticsCaching;
  *uint64_t v3 = *(unsigned char *)availableDataSetCaching;
  v3[1] = v5;
  v3[2] = v4;
  result.availableDataSetCaching = weatherDataCaching;
  return result;
}

void static WeatherServiceCaching.enabled.getter(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = 257;
  *(unsigned char *)(a1 + 2) = 1;
}

unint64_t sub_1A939DA08()
{
  unint64_t result = qword_1E97BC948;
  if (!qword_1E97BC948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC948);
  }
  return result;
}

unint64_t sub_1A939DA58()
{
  unint64_t result = qword_1E97BC950;
  if (!qword_1E97BC950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC950);
  }
  return result;
}

unint64_t sub_1A939DAA8()
{
  unint64_t result = qword_1E97BC958;
  if (!qword_1E97BC958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC958);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WeatherServiceCaching(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v3 = -1;
    return (v3 + 1);
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        goto LABEL_5;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        int v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v3 = v4 - 2;
  if (!v5) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherServiceCaching(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)unint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)unint64_t result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WeatherServiceCaching.EnablementStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939DCB4);
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

void type metadata accessor for WeatherServiceCaching.EnablementStatus()
{
}

uint64_t sub_1A939DD14(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + a2;
  if (__OFADD__(result, a2))
  {
    __break(1u);
  }
  else
  {
    if (v2 > 0) {
      return OUTLINED_FUNCTION_0_25(v2 - 1);
    }
    BOOL v3 = __OFSUB__(0, v2);
    uint64_t v4 = -v2;
    if (!v3) {
      return 8784 * (v4 / 8784) - v4 + 8784;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1A939DD58(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + a2;
  if (__OFADD__(result, a2))
  {
    __break(1u);
  }
  else
  {
    if (v2 > 0) {
      return OUTLINED_FUNCTION_0_25(v2 - 1);
    }
    BOOL v3 = __OFSUB__(0, v2);
    uint64_t v4 = -v2;
    if (!v3) {
      return 366 * (v4 / 366) - v4 + 366;
    }
  }
  __break(1u);
  return result;
}

WeatherKit::NextHourPerceivedIntensity __swiftcall NextHourPerceivedIntensity.init(value:category:)(Swift::Double value, WeatherKit::NextHourPerceivedIntensityScale category)
{
  char v3 = *(unsigned char *)category;
  *(Swift::Double *)uint64_t v2 = value;
  *(unsigned char *)(v2 + 8) = v3;
  result.value = value;
  result.category = category;
  return result;
}

uint64_t static NextHourPerceivedIntensity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2) {
    return sub_1A91E75A8(*(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a2 + 8), *(double *)a1);
  }
  else {
    return 0;
  }
}

double NextHourPerceivedIntensity.value.getter()
{
  return *(double *)v0;
}

void NextHourPerceivedIntensity.value.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*NextHourPerceivedIntensity.value.modify())()
{
  return GEOLocationCoordinate2DMake;
}

void NextHourPerceivedIntensity.category.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

unsigned char *NextHourPerceivedIntensity.category.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 8) = *result;
  return result;
}

uint64_t (*NextHourPerceivedIntensity.category.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A939DE38(uint64_t a1)
{
  unint64_t v2 = sub_1A939E1A4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A939DE74(uint64_t a1)
{
  unint64_t v2 = sub_1A939E1A4();

  return MEMORY[0x1F41862B0](a1, v2);
}

WeatherKit::NextHourPerceivedIntensityScale_optional __swiftcall NextHourPerceivedIntensityScale.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_1A93AE308();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t NextHourPerceivedIntensityScale.rawValue.getter()
{
  uint64_t v1 = 0x6D756964656DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x7976616568;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746867696CLL;
  }
}

WeatherKit::NextHourPerceivedIntensityScale_optional sub_1A939DF5C(Swift::String *a1)
{
  return NextHourPerceivedIntensityScale.init(rawValue:)(*a1);
}

uint64_t sub_1A939DF68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NextHourPerceivedIntensityScale.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A939DF90()
{
  return sub_1A93ADF08();
}

uint64_t sub_1A939DFF0()
{
  return sub_1A93ADEE8();
}

uint64_t NextHourPerceivedIntensity.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC960);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v10 = *(unsigned char *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939E1A4();
  sub_1A93AE5D8();
  v12[15] = 0;
  sub_1A93AE448();
  if (!v2)
  {
    v12[14] = v10;
    v12[13] = 1;
    sub_1A939E1F0();
    sub_1A93AE478();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_1A939E1A4()
{
  unint64_t result = qword_1E97BC968;
  if (!qword_1E97BC968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC968);
  }
  return result;
}

unint64_t sub_1A939E1F0()
{
  unint64_t result = qword_1E97BC970;
  if (!qword_1E97BC970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC970);
  }
  return result;
}

uint64_t NextHourPerceivedIntensity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC978);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939E1A4();
  sub_1A93AE5C8();
  if (!v2)
  {
    sub_1A93AE398();
    uint64_t v7 = v6;
    sub_1A939E3B8();
    sub_1A93AE3C8();
    uint64_t v8 = OUTLINED_FUNCTION_1_4();
    v9(v8);
    *(void *)a2 = v7;
    *(unsigned char *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1A939E3B8()
{
  unint64_t result = qword_1E97BC980;
  if (!qword_1E97BC980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC980);
  }
  return result;
}

unint64_t sub_1A939E408()
{
  unint64_t result = qword_1E97BC988;
  if (!qword_1E97BC988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC988);
  }
  return result;
}

uint64_t sub_1A939E454@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NextHourPerceivedIntensity.init(from:)(a1, a2);
}

uint64_t sub_1A939E46C(void *a1)
{
  return NextHourPerceivedIntensity.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for NextHourPerceivedIntensity()
{
  return &type metadata for NextHourPerceivedIntensity;
}

unsigned char *storeEnumTagSinglePayload for NextHourPerceivedIntensityScale(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939E560);
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

ValueMetadata *type metadata accessor for NextHourPerceivedIntensityScale()
{
  return &type metadata for NextHourPerceivedIntensityScale;
}

unsigned char *storeEnumTagSinglePayload for NextHourPerceivedIntensity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939E664);
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

ValueMetadata *type metadata accessor for NextHourPerceivedIntensity.CodingKeys()
{
  return &type metadata for NextHourPerceivedIntensity.CodingKeys;
}

unint64_t sub_1A939E6A0()
{
  unint64_t result = qword_1E97BC990;
  if (!qword_1E97BC990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC990);
  }
  return result;
}

unint64_t sub_1A939E6F0()
{
  unint64_t result = qword_1E97BC998;
  if (!qword_1E97BC998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC998);
  }
  return result;
}

unint64_t sub_1A939E740()
{
  unint64_t result = qword_1E97BC9A0;
  if (!qword_1E97BC9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9A0);
  }
  return result;
}

unint64_t sub_1A939E78C()
{
  unint64_t result = qword_1E97BC9A8;
  if (!qword_1E97BC9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9A8);
  }
  return result;
}

uint64_t ReverseGeocodeResult.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReverseGeocodeResult.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ReverseGeocodeResult() + 20);
  uint64_t v4 = sub_1A93ABDD8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ReverseGeocodeResult()
{
  uint64_t result = qword_1EB656A80;
  if (!qword_1EB656A80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ReverseGeocodeResult.countryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ReverseGeocodeResult() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A939E908(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656E6F5A656D6974 && a2 == 0xE800000000000000;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1A93AE4B8();
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

uint64_t sub_1A939EA60(char a1)
{
  if (!a1) {
    return 1701667182;
  }
  if (a1 == 1) {
    return 0x656E6F5A656D6974;
  }
  return 0x437972746E756F63;
}

uint64_t sub_1A939EAB8()
{
  return sub_1A939EA60(*v0);
}

uint64_t sub_1A939EAC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A939E908(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A939EAE8(uint64_t a1)
{
  unint64_t v2 = sub_1A939ED08();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A939EB24(uint64_t a1)
{
  unint64_t v2 = sub_1A939ED08();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ReverseGeocodeResult.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB656618);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939ED08();
  sub_1A93AE5D8();
  sub_1A93AE428();
  if (!v1)
  {
    type metadata accessor for ReverseGeocodeResult();
    sub_1A93ABDD8();
    sub_1A939F074(&qword_1EB6565D0);
    sub_1A93AE478();
    sub_1A93AE408();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1A939ED08()
{
  unint64_t result = qword_1EB656A68;
  if (!qword_1EB656A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656A68);
  }
  return result;
}

uint64_t ReverseGeocodeResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = sub_1A93ABDD8();
  OUTLINED_FUNCTION_2();
  uint64_t v26 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7 - v6;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB656610);
  OUTLINED_FUNCTION_2();
  uint64_t v27 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for ReverseGeocodeResult();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_0();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A939ED08();
  sub_1A93AE5C8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v24 = (uint64_t)a1;
  *uint64_t v17 = sub_1A93AE378();
  v17[1] = v18;
  sub_1A939F074(&qword_1EB6565D8);
  sub_1A93AE3C8();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))((char *)v17 + *(int *)(v14 + 20), v8, v28);
  uint64_t v19 = sub_1A93AE358();
  uint64_t v21 = v20;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v13, v29);
  uint64_t v22 = (uint64_t *)((char *)v17 + *(int *)(v14 + 24));
  *uint64_t v22 = v19;
  v22[1] = v21;
  sub_1A920B898((uint64_t)v17, a2);
  __swift_destroy_boxed_opaque_existential_1(v24);
  return sub_1A924EA18((uint64_t)v17);
}

uint64_t sub_1A939F074(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A93ABDD8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A939F0B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReverseGeocodeResult.init(from:)(a1, a2);
}

uint64_t sub_1A939F0D0(void *a1)
{
  return ReverseGeocodeResult.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReverseGeocodeResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A93ABDD8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ReverseGeocodeResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1A93ABDD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ReverseGeocodeResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A93ABDD8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ReverseGeocodeResult(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABDD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ReverseGeocodeResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A93ABDD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for ReverseGeocodeResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1A93ABDD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReverseGeocodeResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A939F574);
}

uint64_t sub_1A939F574(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1A93ABDD8();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ReverseGeocodeResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A939F610);
}

uint64_t sub_1A939F610(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1A93ABDD8();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1A939F690()
{
  uint64_t result = sub_1A93ABDD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ReverseGeocodeResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A939F7FCLL);
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

ValueMetadata *type metadata accessor for ReverseGeocodeResult.CodingKeys()
{
  return &type metadata for ReverseGeocodeResult.CodingKeys;
}

unint64_t sub_1A939F838()
{
  unint64_t result = qword_1E97BC9B0;
  if (!qword_1E97BC9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9B0);
  }
  return result;
}

unint64_t sub_1A939F888()
{
  unint64_t result = qword_1EB656A78;
  if (!qword_1EB656A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656A78);
  }
  return result;
}

unint64_t sub_1A939F8D8()
{
  unint64_t result = qword_1EB656A70;
  if (!qword_1EB656A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB656A70);
  }
  return result;
}

uint64_t static HistoricalComparisons.mock(comparisons:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_1A93ABC08();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = qword_1E97B7EF0;
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_1E97EA4F0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13(v10, v12, v4);
  if (qword_1E97B7EF8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_1E97EA508);
  v13(v7, v14, v4);
  uint64_t v15 = type metadata accessor for HistoricalComparisons();
  uint64_t result = WeatherMetadata.init(date:expirationDate:latitude:longitude:)((uint64_t)v10, (uint64_t)v7, (uint64_t)a2 + *(int *)(v15 + 20), 37.323, -122.0);
  *a2 = a1;
  return result;
}

BOOL static DayPartForecast.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for DayPartForecast();
  if ((sub_1A93ABBB8() & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v4[6]);
  if (!v10) {
    return 0;
  }
  uint64_t v5 = v4[7];
  double v6 = *(double *)(a1 + v5);
  double v7 = *(double *)(a1 + v5 + 8);
  double v8 = *(double *)(a1 + v5 + 16);
  uint64_t v9 = (double *)(a2 + v5);
  BOOL v10 = v6 == *v9 && v7 == v9[1];
  if (!v10 || v8 != v9[2]) {
    return 0;
  }
  if ((sub_1A91D59C4(*(unsigned __int8 *)(a1 + v4[8]), *(unsigned __int8 *)(a2 + v4[8])) & 1) == 0) {
    return 0;
  }
  sub_1A91CF228(0, qword_1EB657120);
  if ((OUTLINED_FUNCTION_23_2() & 1) == 0) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_23_2() & 1) == 0) {
    return 0;
  }
  if ((sub_1A91D50E0(*(unsigned char *)(a1 + v4[11]), *(unsigned char *)(a2 + v4[11])) & 1) == 0) {
    return 0;
  }
  if ((static PrecipitationAmountByType.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v4[13]);
  if (!v10) {
    return 0;
  }
  double v14 = OUTLINED_FUNCTION_25_13();
  if (!v10) {
    return 0;
  }
  if ((sub_1A91E75A8(*(unsigned __int8 *)(v12 + 8), *(unsigned __int8 *)(v13 + 8), v14) & 1) == 0) {
    return 0;
  }
  double v17 = OUTLINED_FUNCTION_25_13();
  if (!v10) {
    return 0;
  }
  if ((sub_1A91E75A8(*(unsigned __int8 *)(v15 + 8), *(unsigned __int8 *)(v16 + 8), v17) & 1) == 0) {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + v4[16]) != *(unsigned __int8 *)(a2 + v4[16])) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v4[17]);
  if (!v10) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v4[18]);
  if (!v10) {
    return 0;
  }
  sub_1A91CF228(0, (unint64_t *)&qword_1EB658510);
  if ((OUTLINED_FUNCTION_23_2() & 1) == 0) {
    return 0;
  }
  if ((OUTLINED_FUNCTION_23_2() & 1) == 0) {
    return 0;
  }
  if (!static Wind.== infix(_:_:)((char *)(a1 + v4[21]), (char *)(a2 + v4[21]))) {
    return 0;
  }
  sub_1A91CF228(0, (unint64_t *)&qword_1EB658508);
  if ((sub_1A93AB8A8() & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_12_5(v4[23]);
  return v10;
}

uint64_t DayPartForecast.init(forecastStart:forecastEnd:cloudCover:cloudCoverByAltitude:condition:highTemperature:lowTemperature:precipitation:precipitationAmountByType:precipitationChance:precipitationIntensityMax:perceivedPrecipitationIntensityMax:isDaylight:maximumHumidity:minimumHumidity:maximumVisibility:minimumVisibility:wind:highWindSpeed:humidity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  OUTLINED_FUNCTION_23_17();
  uint64_t v21 = v20;
  long long v44 = *v22;
  uint64_t v23 = *((void *)v22 + 2);
  char v25 = *v24;
  char v27 = *v26;
  uint64_t v28 = *a9;
  char v29 = *((unsigned char *)a9 + 8);
  uint64_t v30 = *a10;
  char v45 = *((unsigned char *)a10 + 8);
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v32 = *(void (**)(void))(v31 + 32);
  OUTLINED_FUNCTION_16_26();
  v32();
  uint64_t v33 = (int *)type metadata accessor for DayPartForecast();
  OUTLINED_FUNCTION_16_26();
  v32();
  *(void *)(v21 + v33[6]) = v19;
  uint64_t v34 = v21 + v33[7];
  *(_OWORD *)uint64_t v34 = v44;
  *(void *)(v34 + 16) = v23;
  *(unsigned char *)(v21 + v33[8]) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v36 = *(void (**)(void))(v35 + 32);
  OUTLINED_FUNCTION_16_26();
  v36();
  OUTLINED_FUNCTION_16_26();
  v36();
  *(unsigned char *)(v21 + v33[11]) = v27;
  sub_1A93A0008();
  *(void *)(v21 + v33[13]) = v18;
  uint64_t v37 = v21 + v33[14];
  *(void *)uint64_t v37 = v28;
  *(unsigned char *)(v37 + 8) = v29;
  uint64_t v38 = v21 + v33[15];
  *(void *)uint64_t v38 = v30;
  *(unsigned char *)(v38 + 8) = v45;
  *(unsigned char *)(v21 + v33[16]) = a11;
  *(void *)(v21 + v33[17]) = v17;
  *(void *)(v21 + v33[18]) = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v40 = *(void (**)(void))(v39 + 32);
  OUTLINED_FUNCTION_16_26();
  v40();
  OUTLINED_FUNCTION_16_26();
  v40();
  sub_1A93A0008();
  uint64_t v41 = v21 + v33[22];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 32))(v41, a15);
  *(void *)(v21 + v33[23]) = v15;
  return result;
}

uint64_t sub_1A93A0008()
{
  uint64_t v1 = OUTLINED_FUNCTION_29_15();
  v2(v1);
  OUTLINED_FUNCTION_11();
  uint64_t v3 = OUTLINED_FUNCTION_9_3();
  v4(v3);
  return v0;
}

uint64_t DayPartForecast.init(cloudCover:cloudCoverByAltitude:condition:highTemperature:lowTemperature:precipitation:precipitationAmountByType:precipitationChance:maximumHumidity:minimumHumidity:maximumVisibility:minimumVisibility:wind:highWindSpeed:humidity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_23_17();
  uint64_t v18 = v17;
  long long v38 = *v19;
  uint64_t v20 = *((void *)v19 + 2);
  char v22 = *v21;
  char v24 = *v23;
  sub_1A93ABBF8();
  char v25 = (int *)type metadata accessor for DayPartForecast();
  sub_1A93ABBF8();
  *(void *)(v18 + v25[6]) = v14;
  uint64_t v26 = v18 + v25[7];
  *(_OWORD *)uint64_t v26 = v38;
  *(void *)(v26 + 16) = v20;
  *(unsigned char *)(v18 + v25[8]) = v22;
  uint64_t v27 = v18 + v25[9];
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32);
  v30(v27, a3, v28);
  v30(v18 + v25[10], a4, v28);
  *(unsigned char *)(v18 + v25[11]) = v24;
  sub_1A93A0008();
  *(void *)(v18 + v25[13]) = v13;
  uint64_t v31 = v18 + v25[14];
  *(void *)uint64_t v31 = 0;
  *(unsigned char *)(v31 + 8) = 0;
  uint64_t v32 = v18 + v25[15];
  *(void *)uint64_t v32 = 0;
  *(unsigned char *)(v32 + 8) = 0;
  *(unsigned char *)(v18 + v25[16]) = 1;
  *(void *)(v18 + v25[17]) = v12;
  *(void *)(v18 + v25[18]) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v34 = *(void (**)(void))(v33 + 32);
  OUTLINED_FUNCTION_18_29();
  v34();
  OUTLINED_FUNCTION_18_29();
  v34();
  sub_1A93A0008();
  uint64_t v35 = v18 + v25[22];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 32))(v35, a10);
  *(void *)(v18 + v25[23]) = v10;
  return result;
}

uint64_t DayPartForecast.forecastStart.getter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.forecastStart.setter()
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*DayPartForecast.forecastStart.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.forecastEnd.getter()
{
  OUTLINED_FUNCTION_11_34();
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.forecastEnd.setter()
{
  OUTLINED_FUNCTION_3_44();
  sub_1A93ABC08();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.forecastEnd.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.cloudCover.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 24));
}

uint64_t DayPartForecast.cloudCover.setter()
{
  uint64_t result = OUTLINED_FUNCTION_22_19();
  *(void *)(v0 + *(int *)(result + 24)) = v1;
  return result;
}

double (*DayPartForecast.cloudCover.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.cloudCoverByAltitude.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_11_34() + 28);
  double result = *(double *)(v2 + 16);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v2;
  *(double *)(v0 + 16) = result;
  return result;
}

__n128 DayPartForecast.cloudCoverByAltitude.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  uint64_t v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for DayPartForecast() + 28));
  __n128 result = v5;
  *uint64_t v3 = v5;
  v3[1].n128_u64[0] = v2;
  return result;
}

double (*DayPartForecast.cloudCoverByAltitude.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.condition.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_34();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t DayPartForecast.condition.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

double (*DayPartForecast.condition.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.highTemperature.getter()
{
  OUTLINED_FUNCTION_11_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.highTemperature.setter()
{
  OUTLINED_FUNCTION_3_44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.highTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.lowTemperature.getter()
{
  OUTLINED_FUNCTION_11_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.lowTemperature.setter()
{
  OUTLINED_FUNCTION_3_44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.lowTemperature.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.precipitation.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_34();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t DayPartForecast.precipitation.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

double (*DayPartForecast.precipitation.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.precipitationAmountByType.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_34();
  return sub_1A91C6744(v1 + *(int *)(v2 + 48), v0, (void (*)(void))type metadata accessor for PrecipitationAmountByType);
}

uint64_t DayPartForecast.precipitationAmountByType.setter()
{
  return sub_1A93A1020();
}

double (*DayPartForecast.precipitationAmountByType.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.precipitationChance.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 52));
}

uint64_t DayPartForecast.precipitationChance.setter()
{
  uint64_t result = OUTLINED_FUNCTION_22_19();
  *(void *)(v0 + *(int *)(result + 52)) = v1;
  return result;
}

double (*DayPartForecast.precipitationChance.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.precipitationIntensityMax.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_11_34();
  return OUTLINED_FUNCTION_21_18(*(int *)(v0 + 56));
}

uint64_t DayPartForecast.precipitationIntensityMax.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for DayPartForecast();
  uint64_t v5 = v1 + *(int *)(result + 56);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*DayPartForecast.precipitationIntensityMax.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.perceivedPrecipitationIntensityMax.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_11_34();
  return OUTLINED_FUNCTION_21_18(*(int *)(v0 + 60));
}

uint64_t DayPartForecast.perceivedPrecipitationIntensityMax.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for DayPartForecast();
  uint64_t v5 = v1 + *(int *)(result + 60);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*DayPartForecast.perceivedPrecipitationIntensityMax.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.isDaylight.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 64));
}

uint64_t DayPartForecast.isDaylight.setter(char a1)
{
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

double (*DayPartForecast.isDaylight.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.maximumHumidity.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 68));
}

uint64_t DayPartForecast.maximumHumidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_22_19();
  *(void *)(v0 + *(int *)(result + 68)) = v1;
  return result;
}

double (*DayPartForecast.maximumHumidity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.minimumHumidity.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 72));
}

uint64_t DayPartForecast.minimumHumidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_22_19();
  *(void *)(v0 + *(int *)(result + 72)) = v1;
  return result;
}

double (*DayPartForecast.minimumHumidity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.maximumVisibility.getter()
{
  OUTLINED_FUNCTION_11_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.maximumVisibility.setter()
{
  OUTLINED_FUNCTION_3_44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.maximumVisibility.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.minimumVisibility.getter()
{
  OUTLINED_FUNCTION_11_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.minimumVisibility.setter()
{
  OUTLINED_FUNCTION_3_44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.minimumVisibility.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.wind.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_34();
  return sub_1A91C6744(v1 + *(int *)(v2 + 84), v0, (void (*)(void))type metadata accessor for Wind);
}

uint64_t DayPartForecast.wind.setter()
{
  return sub_1A93A1020();
}

uint64_t sub_1A93A1020()
{
  uint64_t v1 = OUTLINED_FUNCTION_29_15();
  v2(v1);
  OUTLINED_FUNCTION_11();
  uint64_t v3 = OUTLINED_FUNCTION_9_3();
  v4(v3);
  return v0;
}

double (*DayPartForecast.wind.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t DayPartForecast.highWindSpeed.getter()
{
  OUTLINED_FUNCTION_11_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_15();

  return v1(v0);
}

uint64_t DayPartForecast.highWindSpeed.setter()
{
  OUTLINED_FUNCTION_3_44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*DayPartForecast.highWindSpeed.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

double DayPartForecast.humidity.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 92));
}

uint64_t DayPartForecast.humidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_22_19();
  *(void *)(v0 + *(int *)(result + 92)) = v1;
  return result;
}

double (*DayPartForecast.humidity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A93A1240(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7473616365726F66 && a2 == 0xED00007472617453;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7473616365726F66 && a2 == 0xEB00000000646E45;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x766F4364756F6C63 && a2 == 0xEA00000000007265;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x80000001A93CCED0 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x706D655468676968 && a2 == 0xEF65727574617265;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x65706D6554776F6CLL && a2 == 0xEE00657275746172;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x7469706963657270 && a2 == 0xED00006E6F697461;
              if (v11 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0xD000000000000019 && a2 == 0x80000001A93CBB70 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else if (a1 == 0xD000000000000013 && a2 == 0x80000001A93CBAD0 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else if (a1 == 0xD000000000000019 && a2 == 0x80000001A93DC490 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 10;
              }
              else if (a1 == 0xD000000000000022 && a2 == 0x80000001A93DC4B0 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 11;
              }
              else
              {
                BOOL v12 = a1 == 0x67696C7961447369 && a2 == 0xEA00000000007468;
                if (v12 || (sub_1A93AE4B8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 12;
                }
                else
                {
                  BOOL v13 = a1 == 0x486D756D6978616DLL && a2 == 0xEF79746964696D75;
                  if (v13 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 13;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x486D756D696E696DLL && a2 == 0xEF79746964696D75;
                    if (v14 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 14;
                    }
                    else if (a1 == 0xD000000000000011 && a2 == 0x80000001A93CBB90 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 15;
                    }
                    else if (a1 == 0xD000000000000011 && a2 == 0x80000001A93CBBB0 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 16;
                    }
                    else
                    {
                      BOOL v15 = a1 == 1684957559 && a2 == 0xE400000000000000;
                      if (v15 || (sub_1A93AE4B8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 17;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x646E695768676968 && a2 == 0xED00006465657053;
                        if (v16 || (sub_1A93AE4B8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 18;
                        }
                        else if (a1 == 0x79746964696D7568 && a2 == 0xE800000000000000)
                        {
                          swift_bridgeObjectRelease();
                          return 19;
                        }
                        else
                        {
                          char v18 = sub_1A93AE4B8();
                          swift_bridgeObjectRelease();
                          if (v18) {
                            return 19;
                          }
                          else {
                            return 20;
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

uint64_t sub_1A93A1AE4()
{
  return 20;
}

uint64_t sub_1A93A1AEC(char a1)
{
  uint64_t result = 0x7473616365726F66;
  switch(a1)
  {
    case 2:
      uint64_t result = 0x766F4364756F6C63;
      break;
    case 3:
      uint64_t result = 0xD000000000000014;
      break;
    case 4:
      uint64_t result = 0x6F697469646E6F63;
      break;
    case 5:
      uint64_t result = 0x706D655468676968;
      break;
    case 6:
      uint64_t result = 0x65706D6554776F6CLL;
      break;
    case 7:
      uint64_t result = 0x7469706963657270;
      break;
    case 8:
      uint64_t result = 0xD000000000000019;
      break;
    case 9:
      uint64_t result = 0xD000000000000013;
      break;
    case 10:
      uint64_t result = 0xD000000000000019;
      break;
    case 11:
      uint64_t result = 0xD000000000000022;
      break;
    case 12:
      uint64_t result = 0x67696C7961447369;
      break;
    case 13:
      unsigned int v3 = 1769496941;
      goto LABEL_16;
    case 14:
      unsigned int v3 = 1768843629;
LABEL_16:
      uint64_t result = v3 | 0x486D756D00000000;
      break;
    case 15:
    case 16:
      uint64_t result = 0xD000000000000011;
      break;
    case 17:
      uint64_t result = 1684957559;
      break;
    case 18:
      uint64_t result = 0x646E695768676968;
      break;
    case 19:
      uint64_t result = 0x79746964696D7568;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A93A1D7C()
{
  return sub_1A93A1AEC(*v0);
}

uint64_t sub_1A93A1D84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93A1240(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93A1DAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A93A1AE4();
  *a1 = result;
  return result;
}

uint64_t sub_1A93A1DD4(uint64_t a1)
{
  unint64_t v2 = sub_1A93A23E8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93A1E10(uint64_t a1)
{
  unint64_t v2 = sub_1A93A23E8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t DayPartForecast.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC9B8);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  BOOL v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93A23E8();
  sub_1A93AE5D8();
  LOBYTE(v15) = 0;
  sub_1A93ABC08();
  sub_1A93A3188(&qword_1EB656220, MEMORY[0x1E4F27928]);
  OUTLINED_FUNCTION_4_48();
  if (!v2)
  {
    BOOL v11 = (int *)type metadata accessor for DayPartForecast();
    LOBYTE(v15) = 1;
    OUTLINED_FUNCTION_4_48();
    OUTLINED_FUNCTION_6_2(2);
    BOOL v12 = (long long *)(v3 + v11[7]);
    uint64_t v13 = *((void *)v12 + 2);
    long long v15 = *v12;
    uint64_t v16 = v13;
    char v17 = 3;
    sub_1A9226940();
    OUTLINED_FUNCTION_13();
    LOBYTE(v15) = *(unsigned char *)(v3 + v11[8]);
    char v17 = 4;
    sub_1A91F1B40();
    OUTLINED_FUNCTION_13();
    LOBYTE(v15) = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    sub_1A91F1C70(&qword_1EB656210, &qword_1EB6571E0);
    OUTLINED_FUNCTION_4_48();
    LOBYTE(v15) = 6;
    OUTLINED_FUNCTION_4_48();
    LOBYTE(v15) = *(unsigned char *)(v3 + v11[11]);
    char v17 = 7;
    sub_1A91EB4AC();
    OUTLINED_FUNCTION_13();
    LOBYTE(v15) = 8;
    type metadata accessor for PrecipitationAmountByType();
    sub_1A93A3188(&qword_1E97B8210, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6_2(9);
    OUTLINED_FUNCTION_24_13(v11[14]);
    char v17 = 10;
    sub_1A91EB4F8();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_24_13(v11[15]);
    char v17 = 11;
    OUTLINED_FUNCTION_13();
    LOBYTE(v15) = 12;
    sub_1A93AE438();
    OUTLINED_FUNCTION_6_2(13);
    OUTLINED_FUNCTION_6_2(14);
    LOBYTE(v15) = 15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    sub_1A91F1C70(&qword_1EB656200, &qword_1EB6572E0);
    OUTLINED_FUNCTION_4_48();
    LOBYTE(v15) = 16;
    OUTLINED_FUNCTION_4_48();
    LOBYTE(v15) = 17;
    type metadata accessor for Wind();
    sub_1A93A3188(&qword_1EB656308, (void (*)(uint64_t))type metadata accessor for Wind);
    OUTLINED_FUNCTION_13();
    LOBYTE(v15) = 18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    sub_1A91F1C70(&qword_1EB6561F8, &qword_1EB6572C0);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6_2(19);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

unint64_t sub_1A93A23E8()
{
  unint64_t result = qword_1E97BC9C0;
  if (!qword_1E97BC9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9C0);
  }
  return result;
}

uint64_t DayPartForecast.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  OUTLINED_FUNCTION_2();
  uint64_t v94 = v4;
  uint64_t v95 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_9();
  uint64_t v86 = v5;
  uint64_t v84 = type metadata accessor for Wind();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  uint64_t v85 = v7;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  OUTLINED_FUNCTION_2();
  uint64_t v99 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_112();
  uint64_t v83 = v10;
  MEMORY[0x1F4188790](v11);
  uint64_t v88 = (char *)&v80 - v12;
  uint64_t v89 = type metadata accessor for PrecipitationAmountByType();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_9();
  uint64_t v90 = v14;
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  OUTLINED_FUNCTION_2();
  uint64_t v97 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_112();
  uint64_t v91 = v17;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v80 - v19;
  uint64_t v21 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v102 = v22;
  MEMORY[0x1F4188790](v23);
  MEMORY[0x1F4188790](v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC9C8);
  OUTLINED_FUNCTION_2();
  uint64_t v92 = v25;
  uint64_t v93 = v26;
  MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v80 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = (int *)type metadata accessor for DayPartForecast();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_9();
  uint64_t v103 = v30;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93A23E8();
  uint64_t v98 = v28;
  uint64_t v31 = v100;
  sub_1A93AE5C8();
  if (v31)
  {
    uint64_t v100 = v31;
    int v32 = 0;
    unsigned int v33 = 0;
    uint64_t v34 = v104;
  }
  else
  {
    uint64_t v100 = v20;
    uint64_t v82 = a1;
    LOBYTE(v106) = 0;
    sub_1A93A3188(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
    sub_1A93AE3C8();
    uint64_t v35 = *(void (**)(void))(v102 + 32);
    OUTLINED_FUNCTION_18_29();
    v35();
    LOBYTE(v106) = 1;
    sub_1A93AE3C8();
    uint64_t v51 = v103;
    uint64_t v50 = v104;
    uint64_t v81 = v21;
    OUTLINED_FUNCTION_18_29();
    v35();
    LOBYTE(v106) = 2;
    sub_1A93AE398();
    *(void *)(v51 + v50[6]) = v52;
    char v105 = 3;
    sub_1A922764C();
    OUTLINED_FUNCTION_20_20();
    uint64_t v53 = v107;
    uint64_t v54 = v51 + v50[7];
    *(_OWORD *)uint64_t v54 = v106;
    *(void *)(v54 + 16) = v53;
    char v105 = 4;
    sub_1A91F1BD8();
    OUTLINED_FUNCTION_20_20();
    *(unsigned char *)(v51 + v50[8]) = v106;
    LOBYTE(v106) = 5;
    sub_1A91F1C70(&qword_1E97B8230, &qword_1EB6571E0);
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_26_16();
    *(void *)(v56 - 256) = v55;
    sub_1A93AE3C8();
    uint64_t v100 = *(char **)(v97 + 32);
    OUTLINED_FUNCTION_18_29();
    v57();
    LOBYTE(v106) = 6;
    OUTLINED_FUNCTION_26_16();
    sub_1A93AE3C8();
    OUTLINED_FUNCTION_18_29();
    v58();
    char v105 = 7;
    sub_1A91EB998();
    sub_1A93AE3C8();
    *(unsigned char *)v104[11] = v106;
    LOBYTE(v106) = 8;
    sub_1A93A3188(&qword_1E97B8238, (void (*)(uint64_t))type metadata accessor for PrecipitationAmountByType);
    OUTLINED_FUNCTION_13_0();
    sub_1A93AE3C8();
    uint64_t v100 = 0;
    sub_1A93A0008();
    LOBYTE(v106) = 9;
    uint64_t v59 = v100;
    sub_1A93AE398();
    uint64_t v100 = v59;
    if (!v59)
    {
      *(void *)(v103 + v104[13]) = v60;
      char v105 = 10;
      sub_1A91EBA2C();
      OUTLINED_FUNCTION_14_30();
      uint64_t v100 = 0;
      char v61 = BYTE8(v106);
      uint64_t v62 = v103 + v104[14];
      *(void *)uint64_t v62 = v106;
      *(unsigned char *)(v62 + 8) = v61;
      char v105 = 11;
      OUTLINED_FUNCTION_14_30();
      uint64_t v100 = 0;
      char v63 = BYTE8(v106);
      uint64_t v64 = v103 + v104[15];
      *(void *)uint64_t v64 = v106;
      *(unsigned char *)(v64 + 8) = v63;
      LOBYTE(v106) = 12;
      uint64_t v65 = v100;
      char v66 = sub_1A93AE388();
      uint64_t v100 = v65;
      if (!v65)
      {
        *(unsigned char *)(v103 + v104[16]) = v66 & 1;
        OUTLINED_FUNCTION_13_31(13);
        uint64_t v100 = 0;
        *(void *)(v103 + v104[17]) = v67;
        OUTLINED_FUNCTION_13_31(14);
        uint64_t v100 = 0;
        *(void *)(v103 + v104[18]) = v68;
        LOBYTE(v106) = 15;
        sub_1A91F1C70(&qword_1E97B8138, &qword_1EB6572E0);
        OUTLINED_FUNCTION_14_30();
        uint64_t v100 = 0;
        uint64_t v71 = *(void (**)(void))(v99 + 32);
        OUTLINED_FUNCTION_16_26();
        v71();
        LOBYTE(v106) = 16;
        uint64_t v72 = v100;
        sub_1A93AE3C8();
        LODWORD(v91) = v72 == 0;
        uint64_t v100 = v72;
        if (!v72)
        {
          OUTLINED_FUNCTION_16_26();
          v71();
          LOBYTE(v106) = 17;
          sub_1A93A3188(&qword_1E97B8258, (void (*)(uint64_t))type metadata accessor for Wind);
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_27_18();
          uint64_t v100 = 0;
          sub_1A93A0008();
          LOBYTE(v106) = 18;
          sub_1A91F1C70(&qword_1E97B81E8, &qword_1EB6572C0);
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_27_18();
          uint64_t v100 = 0;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 32))(v103 + v104[22], v86, v95);
          OUTLINED_FUNCTION_13_31(19);
          uint64_t v100 = 0;
          uint64_t v76 = v75;
          uint64_t v77 = OUTLINED_FUNCTION_6_36();
          v78(v77);
          uint64_t v79 = v103;
          *(void *)(v103 + v104[23]) = v76;
          sub_1A91C6744(v79, v87, (void (*)(void))type metadata accessor for DayPartForecast);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
          return sub_1A93A31D0(v79, (void (*)(void))type metadata accessor for DayPartForecast);
        }
        uint64_t v73 = OUTLINED_FUNCTION_6_36();
        v74(v73);
        LODWORD(v98) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
        LOBYTE(v42) = 1;
        int v37 = 1;
        int v38 = 1;
        int v32 = 1;
        int v40 = 1;
        uint64_t v21 = v81;
        goto LABEL_8;
      }
    }
    uint64_t v69 = OUTLINED_FUNCTION_6_36();
    v70(v69);
    unsigned int v33 = 355;
    int v32 = 1;
    uint64_t v34 = v104;
    a1 = v82;
    uint64_t v21 = v81;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  int v37 = (v33 >> 5) & 1;
  int v38 = (v33 >> 6) & 1;
  if ((v33 & 1) == 0)
  {
    if ((v33 & 2) != 0)
    {
      LODWORD(v98) = 0;
      int v39 = 0;
      int v40 = 0;
      uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t))(v102 + 8);
      goto LABEL_10;
    }
    LODWORD(v98) = 0;
    int v39 = 0;
    int v40 = 0;
    goto LABEL_15;
  }
  int v40 = 0;
  LODWORD(v91) = 0;
  LODWORD(v98) = 0;
  int v42 = (v33 >> 1) & 1;
LABEL_8:
  uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t))(v102 + 8);
  uint64_t result = v41(v103, v21);
  if (v42)
  {
    uint64_t v34 = v104;
    int v39 = v91;
LABEL_10:
    uint64_t v43 = v34[5];
    uint64_t v44 = v103;
    uint64_t result = v41(v103 + v43, v21);
    uint64_t v45 = v44;
    uint64_t v34 = v104;
    if ((v37 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  uint64_t v34 = v104;
  int v39 = v91;
LABEL_15:
  uint64_t v45 = v103;
  if (!v37)
  {
LABEL_11:
    if (v38)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v97 + 8))(v45 + v34[10], v101);
      goto LABEL_18;
    }
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t))(v97 + 8);
  uint64_t result = v46(v45 + v34[9], v101);
  if (v38)
  {
    uint64_t result = v46(v45 + v34[10], v101);
LABEL_18:
    uint64_t v47 = v99;
    if (v32) {
      goto LABEL_19;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v47 = v99;
  if (v32)
  {
LABEL_19:
    uint64_t result = sub_1A93A31D0(v45 + v34[12], (void (*)(void))type metadata accessor for PrecipitationAmountByType);
    if ((v40 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_23:
  if (!v40)
  {
LABEL_20:
    if (v39)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8))(v45 + v34[20], v96);
      goto LABEL_26;
    }
LABEL_28:
    if (v98) {
      return sub_1A93A31D0(v45 + v34[21], (void (*)(void))type metadata accessor for Wind);
    }
    return result;
  }
LABEL_24:
  uint64_t v48 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8);
  uint64_t v49 = v96;
  uint64_t result = v48(v45 + v34[19], v96);
  if ((v39 & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t result = v48(v45 + v34[20], v49);
LABEL_26:
  if (v98) {
    return sub_1A93A31D0(v45 + v34[21], (void (*)(void))type metadata accessor for Wind);
  }
  return result;
}

uint64_t sub_1A93A3188(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A93A31D0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1A93A3228@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DayPartForecast.init(from:)(a1, a2);
}

uint64_t sub_1A93A3240(void *a1)
{
  return DayPartForecast.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for DayPartForecast(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v54 = *a2;
    *a1 = *a2;
    a1 = (void *)(v54 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABC08();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[7];
    *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((void *)v10 + 2) = *((void *)v11 + 2);
    uint64_t v12 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v16((char *)a1 + a3[10], (char *)a2 + a3[10], v15);
    uint64_t v17 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    uint64_t v22 = (int *)type metadata accessor for PrecipitationAmountByType();
    v21(&v18[v22[5]], &v19[v22[5]], v20);
    v21(&v18[v22[6]], &v19[v22[6]], v20);
    v21(&v18[v22[7]], &v19[v22[7]], v20);
    v21(&v18[v22[8]], &v19[v22[8]], v20);
    uint64_t v23 = v22[9];
    uint64_t v24 = &v18[v23];
    uint64_t v25 = &v19[v23];
    v21(v24, v25, v20);
    uint64_t v26 = (int *)type metadata accessor for SnowfallAmount();
    v21(&v24[v26[5]], &v25[v26[5]], v20);
    v21(&v24[v26[6]], &v25[v26[6]], v20);
    v21(&v24[v26[7]], &v25[v26[7]], v20);
    v21(&v24[v26[8]], &v25[v26[8]], v20);
    v21(&v24[v26[9]], &v25[v26[9]], v20);
    uint64_t v27 = a3[14];
    *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    *(void *)uint64_t v28 = *(void *)v29;
    v28[8] = v29[8];
    uint64_t v30 = a3[15];
    uint64_t v31 = a3[16];
    int v32 = (char *)a1 + v30;
    unsigned int v33 = (char *)a2 + v30;
    *(void *)int v32 = *(void *)v33;
    v32[8] = v33[8];
    *((unsigned char *)a1 + v31) = *((unsigned char *)a2 + v31);
    uint64_t v34 = a3[18];
    *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
    *(void *)((char *)a1 + v34) = *(void *)((char *)a2 + v34);
    v21((char *)a1 + a3[19], (char *)a2 + a3[19], v20);
    v21((char *)a1 + a3[20], (char *)a2 + a3[20], v20);
    uint64_t v35 = a3[21];
    uint64_t v36 = (char *)a1 + v35;
    int v37 = (char *)a2 + v35;
    *((unsigned char *)a1 + v35) = *((unsigned char *)a2 + v35);
    int v38 = (int *)type metadata accessor for Wind();
    uint64_t v39 = v38[5];
    int v40 = &v36[v39];
    uint64_t v41 = &v37[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    uint64_t v43 = v38[6];
    uint64_t v44 = &v36[v43];
    uint64_t v45 = &v37[v43];
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
    uint64_t v47 = (void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
    uint64_t v48 = v45;
    uint64_t v49 = *v47;
    (*v47)(v44, v48, v46);
    uint64_t v50 = v38[7];
    uint64_t v51 = &v36[v50];
    uint64_t v52 = &v37[v50];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v37[v50], 1, v46))
    {
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
      memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      v49(v51, v52, v46);
      __swift_storeEnumTagSinglePayload((uint64_t)v51, 0, 1, v46);
    }
    v49((char *)a1 + a3[22], (char *)a2 + a3[22], v46);
    *(void *)((char *)a1 + a3[23]) = *(void *)((char *)a2 + a3[23]);
  }
  return a1;
}

uint64_t destroy for DayPartForecast(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A93ABC08();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[10], v7);
  uint64_t v9 = a1 + a2[12];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  uint64_t v12 = (int *)type metadata accessor for PrecipitationAmountByType();
  v11(v9 + v12[5], v10);
  v11(v9 + v12[6], v10);
  v11(v9 + v12[7], v10);
  v11(v9 + v12[8], v10);
  uint64_t v13 = v9 + v12[9];
  v11(v13, v10);
  uint64_t v14 = (int *)type metadata accessor for SnowfallAmount();
  v11(v13 + v14[5], v10);
  v11(v13 + v14[6], v10);
  v11(v13 + v14[7], v10);
  v11(v13 + v14[8], v10);
  v11(v13 + v14[9], v10);
  v11(a1 + a2[19], v10);
  v11(a1 + a2[20], v10);
  uint64_t v15 = a1 + a2[21];
  uint64_t v16 = (int *)type metadata accessor for Wind();
  uint64_t v17 = v15 + v16[5];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  uint64_t v19 = v15 + v16[6];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);
  v24(v19, v20);
  uint64_t v21 = v15 + v16[7];
  if (!__swift_getEnumTagSinglePayload(v21, 1, v20)) {
    v24(v21, v20);
  }
  uint64_t v22 = a1 + a2[22];

  return ((uint64_t (*)(uint64_t, uint64_t))v24)(v22, v20);
}

uint64_t initializeWithCopy for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  uint64_t v11 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(a1 + a3[10], a2 + a3[10], v14);
  uint64_t v16 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  uint64_t v21 = (int *)type metadata accessor for PrecipitationAmountByType();
  v20(v17 + v21[5], v18 + v21[5], v19);
  v20(v17 + v21[6], v18 + v21[6], v19);
  v20(v17 + v21[7], v18 + v21[7], v19);
  v20(v17 + v21[8], v18 + v21[8], v19);
  uint64_t v22 = v21[9];
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  v20(v23, v24, v19);
  uint64_t v25 = (int *)type metadata accessor for SnowfallAmount();
  v20(v23 + v25[5], v24 + v25[5], v19);
  v20(v23 + v25[6], v24 + v25[6], v19);
  v20(v23 + v25[7], v24 + v25[7], v19);
  v20(v23 + v25[8], v24 + v25[8], v19);
  v20(v23 + v25[9], v24 + v25[9], v19);
  uint64_t v26 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[15];
  uint64_t v30 = a3[16];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  *(void *)uint64_t v31 = *(void *)v32;
  *(unsigned char *)(v31 + 8) = *(unsigned char *)(v32 + 8);
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v33 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  v20(a1 + a3[19], a2 + a3[19], v19);
  v20(a1 + a3[20], a2 + a3[20], v19);
  uint64_t v34 = a3[21];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(unsigned char *)(a1 + v34) = *(unsigned char *)(a2 + v34);
  int v37 = (int *)type metadata accessor for Wind();
  uint64_t v38 = v37[5];
  uint64_t v39 = v35 + v38;
  uint64_t v40 = v36 + v38;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = v37[6];
  uint64_t v43 = (void *)(v35 + v42);
  uint64_t v44 = (const void *)(v36 + v42);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v46 = (void (**)(void *, const void *, uint64_t))(*(void *)(v45 - 8) + 16);
  uint64_t v47 = v44;
  uint64_t v48 = *v46;
  (*v46)(v43, v47, v45);
  uint64_t v49 = v37[7];
  uint64_t v50 = (void *)(v35 + v49);
  uint64_t v51 = (const void *)(v36 + v49);
  if (__swift_getEnumTagSinglePayload(v36 + v49, 1, v45))
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  else
  {
    v48(v50, v51, v45);
    __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v45);
  }
  v48((void *)(a1 + a3[22]), (const void *)(a2 + a3[22]), v45);
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  return a1;
}

uint64_t assignWithCopy for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  void v9[2] = v10[2];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24);
  v15(v12, v13, v14);
  v15(a1 + a3[10], a2 + a3[10], v14);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v16 = a3[12];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  uint64_t v21 = (int *)type metadata accessor for PrecipitationAmountByType();
  v20(v17 + v21[5], v18 + v21[5], v19);
  v20(v17 + v21[6], v18 + v21[6], v19);
  v20(v17 + v21[7], v18 + v21[7], v19);
  v20(v17 + v21[8], v18 + v21[8], v19);
  uint64_t v22 = v21[9];
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  v20(v23, v24, v19);
  uint64_t v25 = (int *)type metadata accessor for SnowfallAmount();
  v20(v23 + v25[5], v24 + v25[5], v19);
  v20(v23 + v25[6], v24 + v25[6], v19);
  v20(v23 + v25[7], v24 + v25[7], v19);
  v20(v23 + v25[8], v24 + v25[8], v19);
  v20(v23 + v25[9], v24 + v25[9], v19);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v26 = a3[14];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[15];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  v20(a1 + a3[19], a2 + a3[19], v19);
  v20(a1 + a3[20], a2 + a3[20], v19);
  uint64_t v32 = a3[21];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(unsigned char *)(a1 + v32) = *(unsigned char *)(a2 + v32);
  uint64_t v35 = (int *)type metadata accessor for Wind();
  uint64_t v36 = v35[5];
  uint64_t v37 = v33 + v36;
  uint64_t v38 = v34 + v36;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 24))(v37, v38, v39);
  uint64_t v40 = v35[6];
  uint64_t v41 = v33 + v40;
  uint64_t v42 = v34 + v40;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 24);
  v53(v41, v42, v43);
  uint64_t v45 = v35[7];
  uint64_t v46 = (void *)(v33 + v45);
  uint64_t v47 = (const void *)(v34 + v45);
  LODWORD(v42) = __swift_getEnumTagSinglePayload(v33 + v45, 1, v43);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v47, 1, v43);
  if (!v42)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v52 = (uint64_t)v47;
      uint64_t v50 = v53;
      v53((uint64_t)v46, v52, v43);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v44 + 8))(v46, v43);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v44 + 16))(v46, v47, v43);
  __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v43);
LABEL_7:
  uint64_t v50 = v53;
LABEL_8:
  v50(a1 + a3[22], a2 + a3[22], v43);
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  return a1;
}

uint64_t initializeWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  uint64_t v11 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(a1 + a3[10], a2 + a3[10], v14);
  uint64_t v16 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  uint64_t v21 = (int *)type metadata accessor for PrecipitationAmountByType();
  v20(v17 + v21[5], v18 + v21[5], v19);
  v20(v17 + v21[6], v18 + v21[6], v19);
  v20(v17 + v21[7], v18 + v21[7], v19);
  v20(v17 + v21[8], v18 + v21[8], v19);
  uint64_t v22 = v21[9];
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  v20(v23, v24, v19);
  uint64_t v25 = (int *)type metadata accessor for SnowfallAmount();
  v20(v23 + v25[5], v24 + v25[5], v19);
  v20(v23 + v25[6], v24 + v25[6], v19);
  v20(v23 + v25[7], v24 + v25[7], v19);
  v20(v23 + v25[8], v24 + v25[8], v19);
  v20(v23 + v25[9], v24 + v25[9], v19);
  uint64_t v26 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[15];
  uint64_t v30 = a3[16];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  *(void *)uint64_t v31 = *(void *)v32;
  *(unsigned char *)(v31 + 8) = *(unsigned char *)(v32 + 8);
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v33 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  v20(a1 + a3[19], a2 + a3[19], v19);
  v20(a1 + a3[20], a2 + a3[20], v19);
  uint64_t v34 = a3[21];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(unsigned char *)(a1 + v34) = *(unsigned char *)(a2 + v34);
  uint64_t v37 = (int *)type metadata accessor for Wind();
  uint64_t v38 = v37[5];
  uint64_t v39 = v35 + v38;
  uint64_t v40 = v36 + v38;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
  uint64_t v42 = v37[6];
  uint64_t v43 = (void *)(v35 + v42);
  uint64_t v44 = (const void *)(v36 + v42);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v46 = (void (**)(void *, const void *, uint64_t))(*(void *)(v45 - 8) + 32);
  uint64_t v47 = v44;
  uint64_t v48 = *v46;
  (*v46)(v43, v47, v45);
  uint64_t v49 = v37[7];
  uint64_t v50 = (void *)(v35 + v49);
  uint64_t v51 = (const void *)(v36 + v49);
  if (__swift_getEnumTagSinglePayload(v36 + v49, 1, v45))
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  else
  {
    v48(v50, v51, v45);
    __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v45);
  }
  v48((void *)(a1 + a3[22]), (const void *)(a2 + a3[22]), v45);
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  return a1;
}

uint64_t assignWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABC08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  uint64_t v11 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(a1 + a3[10], a2 + a3[10], v14);
  uint64_t v16 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  uint64_t v21 = (int *)type metadata accessor for PrecipitationAmountByType();
  v20(v17 + v21[5], v18 + v21[5], v19);
  v20(v17 + v21[6], v18 + v21[6], v19);
  v20(v17 + v21[7], v18 + v21[7], v19);
  v20(v17 + v21[8], v18 + v21[8], v19);
  uint64_t v22 = v21[9];
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  v20(v23, v24, v19);
  uint64_t v25 = (int *)type metadata accessor for SnowfallAmount();
  v20(v23 + v25[5], v24 + v25[5], v19);
  v20(v23 + v25[6], v24 + v25[6], v19);
  v20(v23 + v25[7], v24 + v25[7], v19);
  v20(v23 + v25[8], v24 + v25[8], v19);
  v20(v23 + v25[9], v24 + v25[9], v19);
  uint64_t v26 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[15];
  uint64_t v30 = a3[16];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v32;
  *(unsigned char *)(v31 + 8) = *((unsigned char *)v32 + 8);
  *(void *)uint64_t v31 = v33;
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v34 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v34) = *(void *)(a2 + v34);
  v20(a1 + a3[19], a2 + a3[19], v19);
  v20(a1 + a3[20], a2 + a3[20], v19);
  uint64_t v35 = a3[21];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v38 = (int *)type metadata accessor for Wind();
  uint64_t v39 = v38[5];
  uint64_t v40 = v36 + v39;
  uint64_t v41 = v37 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 40))(v40, v41, v42);
  uint64_t v43 = v38[6];
  uint64_t v44 = v36 + v43;
  uint64_t v45 = v37 + v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 40);
  v56(v44, v45, v46);
  uint64_t v48 = v38[7];
  uint64_t v49 = (void *)(v36 + v48);
  uint64_t v50 = (const void *)(v37 + v48);
  LODWORD(v45) = __swift_getEnumTagSinglePayload(v36 + v48, 1, v46);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v50, 1, v46);
  if (!v45)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v55 = (uint64_t)v50;
      uint64_t v53 = v56;
      v56((uint64_t)v49, v55, v46);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v47 + 8))(v49, v46);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572D0);
    memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v47 + 32))(v49, v50, v46);
  __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v46);
LABEL_7:
  uint64_t v53 = v56;
LABEL_8:
  v53(a1 + a3[22], a2 + a3[22], v46);
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  return a1;
}

uint64_t sub_1A93A4F24(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[9];
    }
    else
    {
      type metadata accessor for PrecipitationAmountByType();
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[12];
      }
      else
      {
        if (a2 == 254)
        {
          unsigned int v15 = *(unsigned __int8 *)(a1 + a3[16]);
          if (v15 >= 2) {
            return ((v15 + 2147483646) & 0x7FFFFFFF) + 1;
          }
          else {
            return 0;
          }
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a2)
        {
          uint64_t v8 = v17;
          uint64_t v12 = a3[19];
        }
        else
        {
          type metadata accessor for Wind();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a2)
          {
            uint64_t v8 = v19;
            uint64_t v12 = a3[21];
          }
          else
          {
            uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
            uint64_t v12 = a3[22];
          }
        }
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

void sub_1A93A507C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6571E0);
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[9];
    }
    else
    {
      type metadata accessor for PrecipitationAmountByType();
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[12];
      }
      else
      {
        if (a3 == 254)
        {
          *(unsigned char *)(a1 + a4[16]) = a2 + 1;
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572E0);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[19];
        }
        else
        {
          type metadata accessor for Wind();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[21];
          }
          else
          {
            uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6572C0);
            uint64_t v14 = a4[22];
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t getEnumTagSinglePayload for DayPartForecast.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xED)
  {
    if (a2 + 19 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 19) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 20;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x14;
  int v5 = v6 - 20;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DayPartForecast.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 19 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 19) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xED) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEC)
  {
    unsigned int v6 = ((a2 - 237) >> 8) + 1;
    *uint64_t result = a2 + 19;
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
        JUMPOUT(0x1A93A5314);
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
          *uint64_t result = a2 + 19;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DayPartForecast.CodingKeys()
{
  return &type metadata for DayPartForecast.CodingKeys;
}

unint64_t sub_1A93A5350()
{
  unint64_t result = qword_1E97BC9D0;
  if (!qword_1E97BC9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9D0);
  }
  return result;
}

unint64_t sub_1A93A53A0()
{
  unint64_t result = qword_1E97BC9D8;
  if (!qword_1E97BC9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9D8);
  }
  return result;
}

unint64_t sub_1A93A53F0()
{
  unint64_t result = qword_1E97BC9E0;
  if (!qword_1E97BC9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9E0);
  }
  return result;
}

double static Coordinate.mock()@<D0>(_OWORD *a1@<X8>)
{
  if (qword_1E97B7F58 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_1E97EA560;
  *a1 = xmmword_1E97EA560;
  return result;
}

double sub_1A93A5498()
{
  double result = 36.97;
  xmmword_1E97EA560 = xmmword_1A93CAA10;
  return result;
}

uint64_t WeatherAlert.init(detailsURL:source:expirationDate:issuedDate:onsetTime:endDate:summary:region:severity:importance:metadata:id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, char *a11, char *a12, uint64_t a13, uint64_t a14)
{
  uint64_t v16 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v18 = v17;
  uint64_t v40 = v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_9();
  uint64_t v47 = v20;
  char v43 = *a11;
  char v44 = *a12;
  uint64_t v21 = (int *)type metadata accessor for WeatherAlert();
  uint64_t v22 = a7 + v21[9];
  uint64_t v23 = OUTLINED_FUNCTION_27_19();
  __swift_storeEnumTagSinglePayload(v23, v24, v25, v16);
  uint64_t v26 = a7 + v21[10];
  __swift_storeEnumTagSinglePayload(v26, 1, 1, v16);
  uint64_t v27 = a7 + v21[13];
  uint64_t v28 = sub_1A93ABA18();
  __swift_storeEnumTagSinglePayload(v27, 1, 1, v28);
  uint64_t v29 = (void *)(a7 + v21[14]);
  *uint64_t v29 = 0;
  v29[1] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(a7, a1, v28);
  uint64_t v30 = (void *)(a7 + v21[5]);
  *uint64_t v30 = a2;
  v30[1] = a3;
  uint64_t v31 = *(void (**)(void))(v18 + 32);
  OUTLINED_FUNCTION_24_14();
  v31();
  OUTLINED_FUNCTION_24_14();
  v31();
  sub_1A91B70A4(a4, v22, &qword_1EB657328);
  sub_1A91B70A4(a5, v26, &qword_1EB657328);
  uint64_t v32 = (void *)(a7 + v21[11]);
  *uint64_t v32 = a6;
  v32[1] = a8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *uint64_t v29 = a9;
  v29[1] = a10;
  *(unsigned char *)(a7 + v21[15]) = v43;
  *(unsigned char *)(a7 + v21[16]) = v44;
  sub_1A93A8B34(a13, a7 + v21[17], (void (*)(void))type metadata accessor for WeatherMetadata);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v47, a13, v16);
  sub_1A93A8B88(a13, (void (*)(void))type metadata accessor for WeatherMetadata);
  OUTLINED_FUNCTION_24_14();
  v31();
  uint64_t v33 = (void *)(a7 + v21[12]);
  void *v33 = a6;
  v33[1] = a8;
  sub_1A91A6D88(v27, &qword_1EB658968);
  uint64_t v34 = OUTLINED_FUNCTION_27_19();
  __swift_storeEnumTagSinglePayload(v34, v35, v36, v28);
  uint64_t v37 = a7 + v21[18];
  sub_1A93ABC48();
  OUTLINED_FUNCTION_11();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 32))(v37, a14);
}

uint64_t Array<A>.isExpired.getter(uint64_t a1)
{
  sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = type metadata accessor for WeatherAlert();
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    sub_1A93A8B34(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for WeatherAlert);
    sub_1A93ABBF8();
    type metadata accessor for WeatherMetadata();
    sub_1A93A8D5C((unint64_t *)&qword_1EB6565C8, MEMORY[0x1E4F27928]);
    char v7 = sub_1A93ADDA8() ^ 1;
    OUTLINED_FUNCTION_8_5();
    v8();
    sub_1A93A8B88((uint64_t)v6, (void (*)(void))type metadata accessor for WeatherAlert);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t WeatherAlert.detailsURL.getter()
{
  sub_1A93ABA18();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t WeatherAlert.detailsURL.setter()
{
  sub_1A93ABA18();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

uint64_t (*WeatherAlert.detailsURL.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.source.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t WeatherAlert.source.setter()
{
  OUTLINED_FUNCTION_15_27();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*WeatherAlert.source.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.date.getter()
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t WeatherAlert.date.setter()
{
  OUTLINED_FUNCTION_3_45();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*WeatherAlert.date.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.expirationDate.getter()
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t WeatherAlert.expirationDate.setter()
{
  OUTLINED_FUNCTION_3_45();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*WeatherAlert.expirationDate.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.issuedDate.getter()
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t WeatherAlert.issuedDate.setter()
{
  OUTLINED_FUNCTION_3_45();
  OUTLINED_FUNCTION_19_23();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*WeatherAlert.issuedDate.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.onsetTime.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_44();
  return sub_1A91ED814(v1 + *(int *)(v2 + 36), v0, &qword_1EB657328);
}

uint64_t WeatherAlert.onsetTime.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_45();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 36), &qword_1EB657328);
}

double (*WeatherAlert.onsetTime.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.endDate.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_44();
  return sub_1A91ED814(v1 + *(int *)(v2 + 40), v0, &qword_1EB657328);
}

uint64_t WeatherAlert.endDate.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_45();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 40), &qword_1EB657328);
}

double (*WeatherAlert.endDate.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.summary.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t WeatherAlert.summary.setter()
{
  OUTLINED_FUNCTION_15_27();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*WeatherAlert.summary.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.description.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t WeatherAlert.description.setter()
{
  OUTLINED_FUNCTION_15_27();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*WeatherAlert.description.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.details.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_44();
  return sub_1A91ED814(v1 + *(int *)(v2 + 52), v0, &qword_1EB658968);
}

uint64_t WeatherAlert.details.setter()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_45();
  return sub_1A91B70A4(v0, v1 + *(int *)(v2 + 52), &qword_1EB658968);
}

double (*WeatherAlert.details.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.region.getter()
{
  return OUTLINED_FUNCTION_42();
}

uint64_t WeatherAlert.region.setter()
{
  OUTLINED_FUNCTION_15_27();
  uint64_t result = OUTLINED_FUNCTION_15_25();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

double (*WeatherAlert.region.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.severity.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_44();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 60));
  return result;
}

uint64_t WeatherAlert.severity.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for WeatherAlert();
  *(unsigned char *)(v1 + *(int *)(result + 60)) = v2;
  return result;
}

double (*WeatherAlert.severity.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.importance.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_44();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 64));
  return result;
}

uint64_t WeatherAlert.importance.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for WeatherAlert();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = v2;
  return result;
}

double (*WeatherAlert.importance.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.metadata.getter()
{
  uint64_t v2 = OUTLINED_FUNCTION_8_44();
  return sub_1A93A8B34(v1 + *(int *)(v2 + 68), v0, (void (*)(void))type metadata accessor for WeatherMetadata);
}

uint64_t WeatherAlert.metadata.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_3_45() + 68);

  return sub_1A92153F0(v0, v2);
}

double (*WeatherAlert.metadata.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.id.getter()
{
  OUTLINED_FUNCTION_8_44();
  sub_1A93ABC48();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_42();

  return v1(v0);
}

uint64_t WeatherAlert.id.setter()
{
  OUTLINED_FUNCTION_3_45();
  sub_1A93ABC48();
  OUTLINED_FUNCTION_11();
  uint64_t v0 = OUTLINED_FUNCTION_14();

  return v1(v0);
}

double (*WeatherAlert.id.modify())(double, double)
{
  return GEOLocationCoordinate2DMake;
}

uint64_t WeatherAlert.init(detailsURL:source:date:expirationDate:issuedDate:onsetTime:endDate:summary:description:details:region:severity:importance:metadata:id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char *a14, char *a15, uint64_t a16, uint64_t a17)
{
  char v43 = *a14;
  char v42 = *a15;
  uint64_t v20 = (int *)type metadata accessor for WeatherAlert();
  uint64_t v21 = a6 + v20[9];
  uint64_t v22 = sub_1A93ABC08();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  uint64_t v23 = a6 + v20[10];
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v22);
  uint64_t v24 = a6 + v20[13];
  uint64_t v25 = sub_1A93ABA18();
  uint64_t v26 = OUTLINED_FUNCTION_27_19();
  __swift_storeEnumTagSinglePayload(v26, v27, v28, v25);
  uint64_t v29 = (void *)(a6 + v20[14]);
  *uint64_t v29 = 0;
  v29[1] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(a6, a1, v25);
  uint64_t v30 = (void *)(a6 + v20[5]);
  *uint64_t v30 = a2;
  v30[1] = a3;
  uint64_t v31 = *(void (**)(void))(*(void *)(v22 - 8) + 32);
  OUTLINED_FUNCTION_28_14();
  v31();
  OUTLINED_FUNCTION_28_14();
  v31();
  OUTLINED_FUNCTION_28_14();
  v31();
  sub_1A91B70A4(a4, v21, &qword_1EB657328);
  sub_1A91B70A4(a5, v23, &qword_1EB657328);
  uint64_t v32 = (void *)(a6 + v20[12]);
  *uint64_t v32 = a9;
  v32[1] = a10;
  sub_1A91B70A4(a11, v24, &qword_1EB658968);
  swift_bridgeObjectRelease();
  *uint64_t v29 = a12;
  v29[1] = a13;
  *(unsigned char *)(a6 + v20[16]) = v42;
  *(unsigned char *)(a6 + v20[15]) = v43;
  uint64_t v33 = (void *)(a6 + v20[11]);
  void *v33 = a7;
  v33[1] = a8;
  sub_1A91A5324(a16, a6 + v20[17]);
  uint64_t v34 = a6 + v20[18];
  sub_1A93ABC48();
  OUTLINED_FUNCTION_11();
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 32);

  return v37(v34, a17, v35);
}

uint64_t sub_1A93A6778(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x55736C6961746564 && a2 == 0xEA00000000004C52;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
    if (v6 || (sub_1A93AE4B8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1702125924 && a2 == 0xE400000000000000;
      if (v7 || (sub_1A93AE4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6974617269707865 && a2 == 0xEE00657461446E6FLL;
        if (v8 || (sub_1A93AE4B8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6144646575737369 && a2 == 0xEA00000000006574;
          if (v9 || (sub_1A93AE4B8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6D69547465736E6FLL && a2 == 0xE900000000000065;
            if (v10 || (sub_1A93AE4B8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x65746144646E65 && a2 == 0xE700000000000000;
              if (v11 || (sub_1A93AE4B8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000;
                if (v12 || (sub_1A93AE4B8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69;
                  if (v13 || (sub_1A93AE4B8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x736C6961746564 && a2 == 0xE700000000000000;
                    if (v14 || (sub_1A93AE4B8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6E6F69676572 && a2 == 0xE600000000000000;
                      if (v15 || (sub_1A93AE4B8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x7974697265766573 && a2 == 0xE800000000000000;
                        if (v16 || (sub_1A93AE4B8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x6E6174726F706D69 && a2 == 0xEA00000000006563;
                          if (v17 || (sub_1A93AE4B8() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
                            if (v18 || (sub_1A93AE4B8() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else if (a1 == 25705 && a2 == 0xE200000000000000)
                            {
                              swift_bridgeObjectRelease();
                              return 14;
                            }
                            else
                            {
                              char v20 = sub_1A93AE4B8();
                              swift_bridgeObjectRelease();
                              if (v20) {
                                return 14;
                              }
                              else {
                                return 15;
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

uint64_t sub_1A93A6D74(char a1)
{
  uint64_t result = 0x55736C6961746564;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656372756F73;
      break;
    case 2:
      uint64_t result = 1702125924;
      break;
    case 3:
      uint64_t result = 0x6974617269707865;
      break;
    case 4:
      uint64_t result = 0x6144646575737369;
      break;
    case 5:
      uint64_t result = 0x6D69547465736E6FLL;
      break;
    case 6:
      uint64_t result = 0x65746144646E65;
      break;
    case 7:
      uint64_t result = 0x7972616D6D7573;
      break;
    case 8:
      uint64_t result = 0x7470697263736564;
      break;
    case 9:
      uint64_t result = 0x736C6961746564;
      break;
    case 10:
      uint64_t result = 0x6E6F69676572;
      break;
    case 11:
      uint64_t result = 0x7974697265766573;
      break;
    case 12:
      uint64_t result = 0x6E6174726F706D69;
      break;
    case 13:
      uint64_t result = 0x617461646174656DLL;
      break;
    case 14:
      uint64_t result = 25705;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A93A6F48()
{
  return sub_1A93A6D74(*v0);
}

uint64_t sub_1A93A6F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93A6778(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93A6F78(uint64_t a1)
{
  unint64_t v2 = sub_1A93A8BE0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93A6FB4(uint64_t a1)
{
  unint64_t v2 = sub_1A93A8BE0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t static WeatherAlert.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v124 = sub_1A93ABA18();
  OUTLINED_FUNCTION_2();
  uint64_t v119 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  uint64_t v118 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6552A0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v123 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
  uint64_t v12 = OUTLINED_FUNCTION_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_112();
  uint64_t v120 = v13;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v121 = &v112[-v15];
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v16);
  uint64_t v122 = &v112[-v17];
  sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v128 = v19;
  uint64_t v129 = v18;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_9();
  uint64_t v127 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6563B0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_112();
  uint64_t v126 = v23;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = &v112[-v25];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  uint64_t v28 = OUTLINED_FUNCTION_1(v27);
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_112();
  uint64_t v125 = v29;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = &v112[-v31];
  MEMORY[0x1F4188790](v33);
  uint64_t v35 = &v112[-v34];
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_231();
  MEMORY[0x1F4188790](v37);
  uint64_t v39 = &v112[-v38];
  __n128 v41 = MEMORY[0x1F4188790](v40);
  char v43 = &v112[-v42];
  if ((MEMORY[0x1AD0EEFD0](a1, a2, v41) & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v117 = v8;
  uint64_t v44 = type metadata accessor for WeatherAlert();
  uint64_t v45 = *(int *)(v44 + 20);
  uint64_t v46 = *(void *)(a1 + v45);
  uint64_t v47 = *(void *)(a1 + v45 + 8);
  uint64_t v48 = (void *)(a2 + v45);
  BOOL v49 = v46 == *v48 && v47 == v48[1];
  if (!v49)
  {
    sub_1A93AE4B8();
    char v50 = OUTLINED_FUNCTION_18_0();
    if ((v51 & 1) == 0) {
      return v50 & 1;
    }
  }
  if ((sub_1A93ABBB8() & 1) == 0 || (sub_1A93ABBB8() & 1) == 0 || (sub_1A93ABBB8() & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v52 = *(int *)(v44 + 36);
  uint64_t v115 = a1;
  sub_1A91ED814(a1 + v52, (uint64_t)v43, &qword_1EB657328);
  uint64_t v114 = (int *)v44;
  uint64_t v53 = *(int *)(v44 + 36);
  uint64_t v116 = a2;
  sub_1A91ED814(a2 + v53, (uint64_t)v39, &qword_1EB657328);
  uint64_t v54 = (uint64_t)&v26[*(int *)(v21 + 48)];
  sub_1A91ED814((uint64_t)v43, (uint64_t)v26, &qword_1EB657328);
  sub_1A91ED814((uint64_t)v39, v54, &qword_1EB657328);
  uint64_t v55 = v129;
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v129) == 1)
  {
    sub_1A91A6D88((uint64_t)v39, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v43, &qword_1EB657328);
    OUTLINED_FUNCTION_1_9(v54);
    if (!v49) {
      goto LABEL_17;
    }
    sub_1A91A6D88((uint64_t)v26, &qword_1EB657328);
  }
  else
  {
    sub_1A91ED814((uint64_t)v26, v2, &qword_1EB657328);
    OUTLINED_FUNCTION_1_9(v54);
    if (v49)
    {
      sub_1A91A6D88((uint64_t)v39, &qword_1EB657328);
      sub_1A91A6D88((uint64_t)v43, &qword_1EB657328);
      (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v2, v55);
LABEL_17:
      uint64_t v56 = &qword_1EB6563B0;
      uint64_t v57 = (uint64_t)v26;
LABEL_28:
      sub_1A91A6D88(v57, v56);
LABEL_29:
      char v50 = 0;
      return v50 & 1;
    }
    uint64_t v58 = v128;
    OUTLINED_FUNCTION_48();
    v59();
    sub_1A93A8D5C(&qword_1EB6563C0, MEMORY[0x1E4F27928]);
    int v113 = sub_1A93ADDB8();
    uint64_t v60 = *(void (**)(void))(v58 + 8);
    OUTLINED_FUNCTION_8_5();
    v60();
    sub_1A91A6D88((uint64_t)v39, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v43, &qword_1EB657328);
    OUTLINED_FUNCTION_8_5();
    v60();
    sub_1A91A6D88((uint64_t)v26, &qword_1EB657328);
    if ((v113 & 1) == 0) {
      goto LABEL_29;
    }
  }
  char v61 = v114;
  sub_1A91ED814(v115 + v114[10], (uint64_t)v35, &qword_1EB657328);
  sub_1A91ED814(v116 + v61[10], (uint64_t)v32, &qword_1EB657328);
  uint64_t v62 = v126;
  uint64_t v63 = v126 + *(int *)(v21 + 48);
  sub_1A91ED814((uint64_t)v35, v126, &qword_1EB657328);
  sub_1A91ED814((uint64_t)v32, v63, &qword_1EB657328);
  OUTLINED_FUNCTION_1_9(v62);
  if (v49)
  {
    sub_1A91A6D88((uint64_t)v32, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v35, &qword_1EB657328);
    OUTLINED_FUNCTION_1_9(v63);
    if (v49)
    {
      sub_1A91A6D88(v62, &qword_1EB657328);
      goto LABEL_32;
    }
LABEL_27:
    uint64_t v56 = &qword_1EB6563B0;
    uint64_t v57 = v62;
    goto LABEL_28;
  }
  uint64_t v64 = v125;
  sub_1A91ED814(v62, v125, &qword_1EB657328);
  OUTLINED_FUNCTION_1_9(v63);
  if (v65)
  {
    sub_1A91A6D88((uint64_t)v32, &qword_1EB657328);
    sub_1A91A6D88((uint64_t)v35, &qword_1EB657328);
    (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v64, v55);
    goto LABEL_27;
  }
  uint64_t v67 = v127;
  uint64_t v68 = v128;
  OUTLINED_FUNCTION_48();
  v69();
  sub_1A93A8D5C(&qword_1EB6563C0, MEMORY[0x1E4F27928]);
  char v70 = sub_1A93ADDB8();
  uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
  v71(v67, v55);
  sub_1A91A6D88((uint64_t)v32, &qword_1EB657328);
  sub_1A91A6D88((uint64_t)v35, &qword_1EB657328);
  v71(v64, v55);
  sub_1A91A6D88(v62, &qword_1EB657328);
  if ((v70 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_32:
  uint64_t v73 = v114;
  uint64_t v72 = v115;
  uint64_t v74 = v114[11];
  uint64_t v75 = *(void *)(v115 + v74);
  uint64_t v76 = *(void *)(v115 + v74 + 8);
  uint64_t v77 = v116;
  uint64_t v78 = (void *)(v116 + v74);
  if (v75 != *v78 || v76 != v78[1])
  {
    sub_1A93AE4B8();
    char v50 = OUTLINED_FUNCTION_18_0();
    if ((v80 & 1) == 0) {
      return v50 & 1;
    }
  }
  uint64_t v81 = v73[12];
  uint64_t v82 = *(void *)(v72 + v81);
  uint64_t v83 = *(void *)(v72 + v81 + 8);
  uint64_t v84 = (void *)(v77 + v81);
  if (v82 != *v84 || v83 != v84[1])
  {
    sub_1A93AE4B8();
    char v50 = OUTLINED_FUNCTION_18_0();
    if ((v86 & 1) == 0) {
      return v50 & 1;
    }
  }
  uint64_t v87 = v122;
  uint64_t v88 = v77;
  uint64_t v89 = v73;
  sub_1A91ED814(v72 + v73[13], (uint64_t)v122, &qword_1EB658968);
  uint64_t v90 = v88 + v89[13];
  uint64_t v91 = v121;
  sub_1A91ED814(v90, (uint64_t)v121, &qword_1EB658968);
  uint64_t v92 = v123;
  uint64_t v93 = v123 + *(int *)(v117 + 48);
  sub_1A91ED814((uint64_t)v87, v123, &qword_1EB658968);
  sub_1A91ED814((uint64_t)v91, v93, &qword_1EB658968);
  uint64_t v94 = v124;
  if (__swift_getEnumTagSinglePayload(v92, 1, v124) != 1)
  {
    uint64_t v95 = v120;
    sub_1A91ED814(v92, v120, &qword_1EB658968);
    if (__swift_getEnumTagSinglePayload(v93, 1, v94) != 1)
    {
      uint64_t v96 = v119;
      OUTLINED_FUNCTION_48();
      v97();
      sub_1A93A8D5C(&qword_1EB655298, MEMORY[0x1E4F276F0]);
      char v98 = sub_1A93ADDB8();
      uint64_t v99 = *(void (**)(void))(v96 + 8);
      OUTLINED_FUNCTION_8_5();
      v99();
      sub_1A91A6D88((uint64_t)v91, &qword_1EB658968);
      sub_1A91A6D88((uint64_t)v87, &qword_1EB658968);
      OUTLINED_FUNCTION_8_5();
      v99();
      sub_1A91A6D88(v92, &qword_1EB658968);
      if ((v98 & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_49;
    }
    sub_1A91A6D88((uint64_t)v91, &qword_1EB658968);
    sub_1A91A6D88((uint64_t)v87, &qword_1EB658968);
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v95, v94);
LABEL_47:
    uint64_t v56 = &qword_1EB6552A0;
    uint64_t v57 = v92;
    goto LABEL_28;
  }
  sub_1A91A6D88((uint64_t)v91, &qword_1EB658968);
  sub_1A91A6D88((uint64_t)v87, &qword_1EB658968);
  if (__swift_getEnumTagSinglePayload(v93, 1, v94) != 1) {
    goto LABEL_47;
  }
  sub_1A91A6D88(v92, &qword_1EB658968);
LABEL_49:
  uint64_t v101 = v114;
  uint64_t v100 = v115;
  uint64_t v102 = v114[14];
  uint64_t v103 = (void *)(v115 + v102);
  uint64_t v104 = *(void *)(v115 + v102 + 8);
  uint64_t v105 = v116;
  long long v106 = (void *)(v116 + v102);
  uint64_t v107 = v106[1];
  if (!v104)
  {
    if (v107) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
  if (!v107) {
    goto LABEL_29;
  }
  BOOL v108 = *v103 == *v106 && v104 == v107;
  if (v108 || (sub_1A93AE4B8(), v105 = v116, char v50 = OUTLINED_FUNCTION_18_0(), (v109 & 1) != 0))
  {
LABEL_58:
    uint64_t v110 = v100;
    uint64_t v111 = v101;
    if ((sub_1A91E7BD0(*(unsigned __int8 *)(v100 + v101[15]), *(unsigned __int8 *)(v105 + v101[15])) & 1) != 0
      && (sub_1A91E7BD4(*(unsigned char *)(v110 + v111[16]), *(unsigned char *)(v105 + v111[16])) & 1) != 0
      && (static WeatherMetadata.== infix(_:_:)(v110 + v111[17], v105 + v111[17]) & 1) != 0)
    {
      char v50 = sub_1A93ABC28();
      return v50 & 1;
    }
    goto LABEL_29;
  }
  return v50 & 1;
}

uint64_t WeatherAlert.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BC9E8);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93A8BE0();
  sub_1A93AE5D8();
  sub_1A93ABA18();
  sub_1A93A8D5C(&qword_1EB656218, MEMORY[0x1E4F276F0]);
  OUTLINED_FUNCTION_9_27();
  if (!v1)
  {
    uint64_t v10 = (int *)type metadata accessor for WeatherAlert();
    OUTLINED_FUNCTION_12_29(v10[5]);
    OUTLINED_FUNCTION_12_35(1);
    sub_1A93ABC08();
    sub_1A93A8D5C(&qword_1EB656220, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_16_27();
    OUTLINED_FUNCTION_9_27();
    OUTLINED_FUNCTION_9_27();
    OUTLINED_FUNCTION_9_27();
    OUTLINED_FUNCTION_20_21(5);
    OUTLINED_FUNCTION_20_21(6);
    OUTLINED_FUNCTION_12_29(v10[11]);
    OUTLINED_FUNCTION_12_35(7);
    OUTLINED_FUNCTION_12_29(v10[12]);
    OUTLINED_FUNCTION_12_35(8);
    sub_1A93AE418();
    OUTLINED_FUNCTION_12_29(v10[14]);
    sub_1A93AE408();
    sub_1A93A8C2C();
    OUTLINED_FUNCTION_9_27();
    sub_1A93A8C78();
    OUTLINED_FUNCTION_9_27();
    type metadata accessor for WeatherMetadata();
    sub_1A93A8D5C(&qword_1EB6562A0, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
    OUTLINED_FUNCTION_16_27();
    OUTLINED_FUNCTION_9_27();
    sub_1A93ABC48();
    sub_1A93A8D5C(&qword_1E97B8018, MEMORY[0x1E4F27990]);
    OUTLINED_FUNCTION_16_27();
    OUTLINED_FUNCTION_9_27();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t WeatherAlert.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v86 = sub_1A93ABC48();
  OUTLINED_FUNCTION_2();
  uint64_t v83 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  uint64_t v85 = v6;
  uint64_t v87 = type metadata accessor for WeatherMetadata();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_9();
  uint64_t v88 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
  uint64_t v10 = OUTLINED_FUNCTION_1(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_9();
  uint64_t v89 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
  uint64_t v13 = OUTLINED_FUNCTION_1(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_112();
  uint64_t v90 = v14;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v91 = (char *)v82 - v16;
  uint64_t v17 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v106 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_112();
  uint64_t v92 = v20;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_231();
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)v82 - v23;
  uint64_t v25 = sub_1A93ABA18();
  OUTLINED_FUNCTION_2();
  uint64_t v97 = v26;
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BCA08);
  OUTLINED_FUNCTION_2();
  uint64_t v93 = v29;
  uint64_t v94 = v28;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = (int *)type metadata accessor for WeatherAlert();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v36 - v35;
  uint64_t v105 = v36 - v35 + *(int *)(v38 + 36);
  __swift_storeEnumTagSinglePayload(v105, 1, 1, v17);
  uint64_t v103 = v37 + v33[10];
  uint64_t v107 = v17;
  __swift_storeEnumTagSinglePayload(v103, 1, 1, v17);
  uint64_t v100 = v37 + v33[13];
  __swift_storeEnumTagSinglePayload(v100, 1, 1, v25);
  uint64_t v101 = v33;
  uint64_t v39 = v33[14];
  uint64_t v104 = v37;
  uint64_t v40 = (uint64_t *)(v37 + v39);
  *uint64_t v40 = 0;
  v40[1] = 0;
  char v98 = a1;
  uint64_t v99 = v40;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93A8BE0();
  uint64_t v96 = v32;
  uint64_t v41 = v102;
  sub_1A93AE5C8();
  uint64_t v95 = v25;
  if (v41)
  {
    uint64_t v102 = v41;
    unsigned int v44 = 1632;
  }
  else
  {
    uint64_t v42 = v24;
    uint64_t v102 = v2;
    char v109 = 0;
    uint64_t v43 = sub_1A93A8D5C(&qword_1E97B8C20, MEMORY[0x1E4F276F0]);
    sub_1A93AE3C8();
    v82[1] = v43;
    uint64_t v50 = v104;
    OUTLINED_FUNCTION_48();
    v51();
    char v109 = 1;
    uint64_t v52 = sub_1A93AE378();
    uint64_t v53 = v101;
    uint64_t v54 = (uint64_t *)(v50 + v101[5]);
    *uint64_t v54 = v52;
    v54[1] = v55;
    char v109 = 2;
    sub_1A93A8D5C(&qword_1E97B80D0, MEMORY[0x1E4F27928]);
    uint64_t v56 = v107;
    sub_1A93AE3C8();
    uint64_t v57 = v50 + v53[6];
    v82[0] = *(void *)(v106 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v82[0])(v57, v42, v56);
    OUTLINED_FUNCTION_26_17(3);
    sub_1A93AE3C8();
    OUTLINED_FUNCTION_21_19();
    v58();
    OUTLINED_FUNCTION_26_17(4);
    sub_1A93AE3C8();
    OUTLINED_FUNCTION_21_19();
    v59();
    OUTLINED_FUNCTION_26_17(5);
    uint64_t v60 = (uint64_t)v91;
    OUTLINED_FUNCTION_25_14();
    sub_1A93AE368();
    sub_1A91B70A4(v60, v105, &qword_1EB657328);
    OUTLINED_FUNCTION_26_17(6);
    uint64_t v61 = v90;
    OUTLINED_FUNCTION_25_14();
    sub_1A93AE368();
    sub_1A91B70A4(v61, v103, &qword_1EB657328);
    char v109 = 7;
    uint64_t v62 = sub_1A93AE378();
    uint64_t v63 = (uint64_t *)(v104 + v53[11]);
    *uint64_t v63 = v62;
    v63[1] = v64;
    char v109 = 8;
    uint64_t v65 = sub_1A93AE378();
    uint64_t v102 = 0;
    uint64_t v67 = (uint64_t *)(v104 + v53[12]);
    uint64_t *v67 = v65;
    v67[1] = v66;
    OUTLINED_FUNCTION_26_17(9);
    uint64_t v68 = v102;
    sub_1A93AE368();
    uint64_t v102 = v68;
    if (!v68)
    {
      sub_1A91B70A4(v89, v100, &qword_1EB658968);
      char v109 = 10;
      uint64_t v69 = v102;
      uint64_t v70 = sub_1A93AE358();
      uint64_t v102 = v69;
      if (!v69)
      {
        uint64_t v74 = v70;
        uint64_t v75 = v71;
        uint64_t v76 = v99;
        swift_bridgeObjectRelease();
        *uint64_t v76 = v74;
        v76[1] = v75;
        char v108 = 11;
        sub_1A93A8CC4();
        OUTLINED_FUNCTION_10_32();
        uint64_t v102 = 0;
        *(unsigned char *)(v104 + v101[15]) = v109;
        char v108 = 12;
        sub_1A93A8D10();
        OUTLINED_FUNCTION_10_32();
        uint64_t v102 = 0;
        *(unsigned char *)(v104 + v101[16]) = v109;
        char v109 = 13;
        sub_1A93A8D5C(&qword_1E97B8580, (void (*)(uint64_t))type metadata accessor for WeatherMetadata);
        OUTLINED_FUNCTION_10_32();
        uint64_t v102 = 0;
        sub_1A91A5324(v88, v104 + v101[17]);
        char v109 = 14;
        sub_1A93A8D5C(&qword_1E97B8040, MEMORY[0x1E4F27990]);
        OUTLINED_FUNCTION_10_32();
        uint64_t v102 = 0;
        uint64_t v77 = OUTLINED_FUNCTION_4_49();
        v78(v77);
        uint64_t v79 = v104;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v104 + v101[18], v85, v86);
        sub_1A93A8B34(v79, v84, (void (*)(void))type metadata accessor for WeatherAlert);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
        uint64_t v80 = OUTLINED_FUNCTION_42();
        return sub_1A93A8B88(v80, v81);
      }
    }
    uint64_t v72 = OUTLINED_FUNCTION_4_49();
    v73(v72);
    unsigned int v44 = 2047;
  }
  uint64_t v45 = v101;
  uint64_t v46 = v104;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  if (v44)
  {
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v46, v95);
    if (((v44 >> 1) & 1) == 0)
    {
LABEL_6:
      if ((v44 >> 2)) {
        goto LABEL_7;
      }
LABEL_11:
      if (((v44 >> 3) & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
LABEL_13:
      uint64_t v48 = v107;
      v47(v46 + v45[7], v107);
      if ((v44 >> 4)) {
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  else if ((v44 & 2) == 0)
  {
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  if (((v44 >> 2) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
  v47(v46 + v45[6], v107);
  if ((v44 >> 3)) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v48 = v107;
  if ((v44 >> 4))
  {
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
LABEL_17:
    v47(v46 + v45[8], v48);
  }
LABEL_18:
  sub_1A91A6D88(v105, &qword_1EB657328);
  sub_1A91A6D88(v103, &qword_1EB657328);
  if ((v44 >> 7)) {
    swift_bridgeObjectRelease();
  }
  if ((v44 >> 8)) {
    swift_bridgeObjectRelease();
  }
  sub_1A91A6D88(v100, &qword_1EB658968);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A93A89FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WeatherAlert.init(from:)(a1, a2);
}

uint64_t sub_1A93A8A14(void *a1)
{
  return WeatherAlert.encode(to:)(a1);
}

BOOL WeatherAlert.isExpired.getter()
{
  uint64_t v0 = sub_1A93ABC08();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5 - v4;
  sub_1A93ABBF8();
  type metadata accessor for WeatherAlert();
  type metadata accessor for WeatherMetadata();
  sub_1A93A8D5C((unint64_t *)&qword_1EB6565C8, MEMORY[0x1E4F27928]);
  char v7 = sub_1A93ADDA8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return (v7 & 1) == 0;
}

uint64_t sub_1A93A8B34(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_11();
  uint64_t v4 = OUTLINED_FUNCTION_58_0();
  v5(v4);
  return a2;
}

uint64_t sub_1A93A8B88(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_1A93A8BE0()
{
  unint64_t result = qword_1E97BC9F0;
  if (!qword_1E97BC9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9F0);
  }
  return result;
}

unint64_t sub_1A93A8C2C()
{
  unint64_t result = qword_1E97BC9F8;
  if (!qword_1E97BC9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BC9F8);
  }
  return result;
}

unint64_t sub_1A93A8C78()
{
  unint64_t result = qword_1E97BCA00;
  if (!qword_1E97BCA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA00);
  }
  return result;
}

unint64_t sub_1A93A8CC4()
{
  unint64_t result = qword_1E97BCA10;
  if (!qword_1E97BCA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA10);
  }
  return result;
}

unint64_t sub_1A93A8D10()
{
  unint64_t result = qword_1E97BCA18;
  if (!qword_1E97BCA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA18);
  }
  return result;
}

uint64_t sub_1A93A8D5C(unint64_t *a1, void (*a2)(uint64_t))
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

char *initializeBufferWithCopyOfBuffer for WeatherAlert(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A93ABA18();
    uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v53(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = &a1[v8];
    uint64_t v11 = &a2[v8];
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = &a1[v9];
    uint64_t v14 = &a2[v9];
    uint64_t v15 = sub_1A93ABC08();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    v16(&a1[a3[7]], &a2[a3[7]], v15);
    v16(&a1[a3[8]], &a2[a3[8]], v15);
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v17], 1, v15))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      v16(v18, v19, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v15);
    }
    uint64_t v22 = a3[10];
    uint64_t v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v22], 1, v15))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v16(v23, v24, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v15);
    }
    uint64_t v26 = a3[11];
    uint64_t v27 = a3[12];
    uint64_t v28 = &a1[v26];
    uint64_t v29 = &a2[v26];
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    uint64_t v31 = &a1[v27];
    uint64_t v32 = &a2[v27];
    uint64_t v33 = *((void *)v32 + 1);
    *(void *)uint64_t v31 = *(void *)v32;
    *((void *)v31 + 1) = v33;
    uint64_t v34 = a3[13];
    uint64_t v35 = &a1[v34];
    uint64_t v36 = &a2[v34];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v7))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      v53(v35, v36, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v7);
    }
    uint64_t v38 = a3[14];
    uint64_t v39 = a3[15];
    uint64_t v40 = &a1[v38];
    uint64_t v41 = &a2[v38];
    uint64_t v42 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = *(void *)v41;
    *((void *)v40 + 1) = v42;
    a1[v39] = a2[v39];
    uint64_t v43 = a3[17];
    a1[a3[16]] = a2[a3[16]];
    unsigned int v44 = &a1[v43];
    uint64_t v45 = &a2[v43];
    swift_bridgeObjectRetain();
    v16(v44, v45, v15);
    uint64_t v46 = (int *)type metadata accessor for WeatherMetadata();
    v16(&v44[v46[5]], &v45[v46[5]], v15);
    *(void *)&v44[v46[6]] = *(void *)&v45[v46[6]];
    *(void *)&v44[v46[7]] = *(void *)&v45[v46[7]];
    *(void *)&v44[v46[8]] = *(void *)&v45[v46[8]];
    uint64_t v47 = a3[18];
    uint64_t v48 = &a1[v47];
    BOOL v49 = &a2[v47];
    uint64_t v50 = sub_1A93ABC48();
    char v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
    swift_retain();
    v51(v48, v49, v50);
  }
  return a1;
}

uint64_t destroy for WeatherAlert(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A93ABA18();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_1A93ABC08();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[7], v7);
  v8(a1 + a2[8], v7);
  uint64_t v9 = a1 + a2[9];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v7)) {
    v8(v9, v7);
  }
  uint64_t v10 = a1 + a2[10];
  if (!__swift_getEnumTagSinglePayload(v10, 1, v7)) {
    v8(v10, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + a2[13];
  if (!__swift_getEnumTagSinglePayload(v11, 1, v4)) {
    v5(v11, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = a1 + a2[17];
  v8(v12, v7);
  uint64_t v13 = type metadata accessor for WeatherMetadata();
  v8(v12 + *(int *)(v13 + 20), v7);
  swift_release();
  uint64_t v14 = a1 + a2[18];
  uint64_t v15 = sub_1A93ABC48();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);

  return v16(v14, v15);
}

char *initializeWithCopy for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABA18();
  char v51 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v51(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v7];
  uint64_t v10 = &a2[v7];
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  uint64_t v12 = &a1[v8];
  uint64_t v13 = &a2[v8];
  uint64_t v14 = sub_1A93ABC08();
  uint64_t v15 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  v15(&a1[a3[7]], &a2[a3[7]], v14);
  v15(&a1[a3[8]], &a2[a3[8]], v14);
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v16], 1, v14))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v15(v17, v18, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v14);
  }
  uint64_t v20 = a3[10];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v20], 1, v14))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    v15(v21, v22, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v14);
  }
  uint64_t v24 = a3[11];
  uint64_t v25 = a3[12];
  uint64_t v26 = &a1[v24];
  uint64_t v27 = &a2[v24];
  uint64_t v28 = *((void *)v27 + 1);
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = v28;
  uint64_t v29 = &a1[v25];
  uint64_t v30 = &a2[v25];
  uint64_t v31 = *((void *)v30 + 1);
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = v31;
  uint64_t v32 = a3[13];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v6))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v51(v33, v34, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v6);
  }
  uint64_t v36 = a3[14];
  uint64_t v37 = a3[15];
  uint64_t v38 = &a1[v36];
  uint64_t v39 = &a2[v36];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  a1[v37] = a2[v37];
  uint64_t v41 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  uint64_t v42 = &a1[v41];
  uint64_t v43 = &a2[v41];
  swift_bridgeObjectRetain();
  v15(v42, v43, v14);
  unsigned int v44 = (int *)type metadata accessor for WeatherMetadata();
  v15(&v42[v44[5]], &v43[v44[5]], v14);
  *(void *)&v42[v44[6]] = *(void *)&v43[v44[6]];
  *(void *)&v42[v44[7]] = *(void *)&v43[v44[7]];
  *(void *)&v42[v44[8]] = *(void *)&v43[v44[8]];
  uint64_t v45 = a3[18];
  uint64_t v46 = &a1[v45];
  uint64_t v47 = &a2[v45];
  uint64_t v48 = sub_1A93ABC48();
  BOOL v49 = *(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16);
  swift_retain();
  v49(v46, v47, v48);
  return a1;
}

uint64_t assignWithCopy for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABA18();
  uint64_t v52 = *(void *)(v6 - 8);
  char v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 24);
  v51(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_1A93ABC08();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(void *, const void *, uint64_t))(v14 + 24);
  v15(v11, v12, v13);
  v15((void *)(a1 + a3[7]), (const void *)(a2 + a3[7]), v13);
  uint64_t v53 = v15;
  v15((void *)(a1 + a3[8]), (const void *)(a2 + a3[8]), v13);
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  LODWORD(v15) = __swift_getEnumTagSinglePayload(a1 + v16, 1, v13);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v13);
  if (v15)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v17, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v53(v17, v18, v13);
LABEL_7:
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  int v24 = __swift_getEnumTagSinglePayload(a1 + v21, 1, v13);
  int v25 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v13);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v22, v23, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v22, v13);
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  v53(v22, v23, v13);
LABEL_13:
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[12];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  void *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[13];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  int v36 = __swift_getEnumTagSinglePayload(a1 + v33, 1, v6);
  int v37 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v6);
  if (!v36)
  {
    if (!v37)
    {
      v51((uint64_t)v34, (uint64_t)v35, v6);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v52 + 8))(v34, v6);
    goto LABEL_18;
  }
  if (v37)
  {
LABEL_18:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v52 + 16))(v34, v35, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v6);
LABEL_19:
  uint64_t v39 = a3[14];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (void *)(a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v42 = a3[17];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  v53((void *)(a1 + v42), (const void *)(a2 + v42), v13);
  uint64_t v45 = (int *)type metadata accessor for WeatherMetadata();
  v53((void *)(v43 + v45[5]), (const void *)(v44 + v45[5]), v13);
  *(void *)(v43 + v45[6]) = *(void *)(v44 + v45[6]);
  *(void *)(v43 + v45[7]) = *(void *)(v44 + v45[7]);
  *(void *)(v43 + v45[8]) = *(void *)(v44 + v45[8]);
  swift_retain();
  swift_release();
  uint64_t v46 = a3[18];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_1A93ABC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 24))(v47, v48, v49);
  return a1;
}

char *initializeWithTake for WeatherAlert(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1A93ABA18();
  uint64_t v7 = (void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  int v36 = *v7;
  (*v7)(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1A93ABC08();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  v12(&a1[a3[8]], &a2[a3[8]], v11);
  uint64_t v13 = a3[9];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v13], 1, v11))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v11);
  }
  uint64_t v17 = a3[10];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v17], 1, v11))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v12(v18, v19, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v11);
  }
  uint64_t v21 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  uint64_t v22 = a3[13];
  uint64_t v23 = &a1[v22];
  int v24 = &a2[v22];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v22], 1, v6))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    v36(v23, v24, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v6);
  }
  uint64_t v26 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  a1[v26] = a2[v26];
  uint64_t v27 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  v12(&a1[v27], &a2[v27], v11);
  uint64_t v30 = (int *)type metadata accessor for WeatherMetadata();
  v12(&v28[v30[5]], &v29[v30[5]], v11);
  *(void *)&v28[v30[6]] = *(void *)&v29[v30[6]];
  *(void *)&v28[v30[7]] = *(void *)&v29[v30[7]];
  *(void *)&v28[v30[8]] = *(void *)&v29[v30[8]];
  uint64_t v31 = a3[18];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v34 = sub_1A93ABC48();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  return a1;
}

uint64_t assignWithTake for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A93ABA18();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 40);
  v60(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_1A93ABC08();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void (**)(void *, const void *, uint64_t))(v16 + 40);
  v17(v13, v14, v15);
  v17((void *)(a1 + a3[7]), (const void *)(a2 + a3[7]), v15);
  uint64_t v62 = v17;
  v17((void *)(a1 + a3[8]), (const void *)(a2 + a3[8]), v15);
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  LODWORD(v17) = __swift_getEnumTagSinglePayload(a1 + v18, 1, v15);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v15);
  if (v17)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v19, v20, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v19, v15);
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  v62(v19, v20, v15);
LABEL_7:
  uint64_t v23 = a3[10];
  int v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  int v26 = __swift_getEnumTagSinglePayload(a1 + v23, 1, v15);
  int v27 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v15);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v24, v25, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v24, v15);
LABEL_12:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  v62(v24, v25, v15);
LABEL_13:
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[12];
  uint64_t v35 = (void *)(a1 + v34);
  int v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[13];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (const void *)(a2 + v39);
  int v42 = __swift_getEnumTagSinglePayload(a1 + v39, 1, v6);
  int v43 = __swift_getEnumTagSinglePayload((uint64_t)v41, 1, v6);
  if (!v42)
  {
    if (!v43)
    {
      v60((uint64_t)v40, (uint64_t)v41, v6);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v61 + 8))(v40, v6);
    goto LABEL_18;
  }
  if (v43)
  {
LABEL_18:
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v61 + 32))(v40, v41, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v6);
LABEL_19:
  uint64_t v45 = a3[14];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (uint64_t *)(a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v50) = *(unsigned char *)(a2 + v50);
  uint64_t v51 = a3[17];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  v62((void *)(a1 + v51), (const void *)(a2 + v51), v15);
  uint64_t v54 = (int *)type metadata accessor for WeatherMetadata();
  v62((void *)(v52 + v54[5]), (const void *)(v53 + v54[5]), v15);
  *(void *)(v52 + v54[6]) = *(void *)(v53 + v54[6]);
  *(void *)(v52 + v54[7]) = *(void *)(v53 + v54[7]);
  *(void *)(v52 + v54[8]) = *(void *)(v53 + v54[8]);
  swift_release();
  uint64_t v55 = a3[18];
  uint64_t v56 = a1 + v55;
  uint64_t v57 = a2 + v55;
  uint64_t v58 = sub_1A93ABC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 40))(v56, v57, v58);
  return a1;
}

uint64_t sub_1A93AA620(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A93ABA18();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_17:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    sub_1A93ABC08();
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v14 = a3[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a2)
      {
        uint64_t v8 = v15;
        uint64_t v14 = a3[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a2)
        {
          uint64_t v8 = v17;
          uint64_t v14 = a3[13];
        }
        else
        {
          type metadata accessor for WeatherMetadata();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a2)
          {
            uint64_t v8 = v19;
            uint64_t v14 = a3[17];
          }
          else
          {
            uint64_t v8 = sub_1A93ABC48();
            uint64_t v14 = a3[18];
          }
        }
      }
    }
    uint64_t v9 = a1 + v14;
    goto LABEL_17;
  }
  unint64_t v10 = *(void *)(a1 + a3[5] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

void sub_1A93AA76C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A93ABA18();
  OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[5] + 8) = (a2 - 1);
      return;
    }
    sub_1A93ABC08();
    OUTLINED_FUNCTION_4_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB657328);
      OUTLINED_FUNCTION_4_1();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB658968);
        OUTLINED_FUNCTION_4_1();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[13];
        }
        else
        {
          type metadata accessor for WeatherMetadata();
          OUTLINED_FUNCTION_4_1();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[17];
          }
          else
          {
            uint64_t v10 = sub_1A93ABC48();
            uint64_t v14 = a4[18];
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

unsigned char *storeEnumTagSinglePayload for WeatherAlert.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x1A93AA980);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherAlert.CodingKeys()
{
  return &type metadata for WeatherAlert.CodingKeys;
}

unint64_t sub_1A93AA9BC()
{
  unint64_t result = qword_1E97BCA20;
  if (!qword_1E97BCA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA20);
  }
  return result;
}

unint64_t sub_1A93AAA0C()
{
  unint64_t result = qword_1E97BCA28;
  if (!qword_1E97BCA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA28);
  }
  return result;
}

unint64_t sub_1A93AAA5C()
{
  unint64_t result = qword_1E97BCA30;
  if (!qword_1E97BCA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA30);
  }
  return result;
}

WeatherKit::AirQualityScaleGradientStop __swiftcall AirQualityScaleGradientStop.init(location:color:)(Swift::Float location, Swift::String color)
{
  *(Swift::Float *)uint64_t v2 = location;
  *(Swift::String *)(v2 + 8) = color;
  result.color = color;
  result.location = location;
  return result;
}

float AirQualityScaleGradientStop.location.getter()
{
  return *(float *)v0;
}

void AirQualityScaleGradientStop.location.setter(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*AirQualityScaleGradientStop.location.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t AirQualityScaleGradientStop.color.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AirQualityScaleGradientStop.color.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AirQualityScaleGradientStop.color.modify())()
{
  return GEOLocationCoordinate2DMake;
}

uint64_t sub_1A93AAB6C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1A93AE4B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6C6F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A93AE4B8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A93AAC54(char a1)
{
  if (a1) {
    return 0x726F6C6F63;
  }
  else {
    return 0x6E6F697461636F6CLL;
  }
}

uint64_t sub_1A93AAC88()
{
  return sub_1A93AAC54(*v0);
}

uint64_t sub_1A93AAC90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A93AAB6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93AACB8(uint64_t a1)
{
  unint64_t v2 = sub_1A93AAED0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A93AACF4(uint64_t a1)
{
  unint64_t v2 = sub_1A93AAED0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t static AirQualityScaleGradientStop.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(float *)a1 != *(float *)a2) {
    return 0;
  }
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16)) {
    return 1;
  }
  else {
    return sub_1A93AE4B8();
  }
}

uint64_t AirQualityScaleGradientStop.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6561A8);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93AAED0();
  sub_1A93AE5D8();
  char v13 = 0;
  sub_1A93AE458();
  if (!v2)
  {
    char v12 = 1;
    sub_1A93AE428();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_1A93AAED0()
{
  unint64_t result = qword_1EB655EE8;
  if (!qword_1EB655EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655EE8);
  }
  return result;
}

uint64_t AirQualityScaleGradientStop.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97BCA38);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93AAED0();
  sub_1A93AE5C8();
  if (!v2)
  {
    sub_1A93AE3A8();
    int v7 = v6;
    uint64_t v9 = sub_1A93AE378();
    uint64_t v11 = v10;
    uint64_t v12 = OUTLINED_FUNCTION_1_29();
    v13(v12);
    *(_DWORD *)a2 = v7;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1A93AB08C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AirQualityScaleGradientStop.init(from:)(a1, a2);
}

uint64_t sub_1A93AB0A4(void *a1)
{
  return AirQualityScaleGradientStop.encode(to:)(a1);
}

uint64_t sub_1A93AB0C0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AirQualityScaleGradientStop(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AirQualityScaleGradientStop(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AirQualityScaleGradientStop()
{
  return &type metadata for AirQualityScaleGradientStop;
}

unsigned char *storeEnumTagSinglePayload for AirQualityScaleGradientStop.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A93AB25CLL);
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

ValueMetadata *type metadata accessor for AirQualityScaleGradientStop.CodingKeys()
{
  return &type metadata for AirQualityScaleGradientStop.CodingKeys;
}

unint64_t sub_1A93AB298()
{
  unint64_t result = qword_1E97BCA40;
  if (!qword_1E97BCA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97BCA40);
  }
  return result;
}

unint64_t sub_1A93AB2E8()
{
  unint64_t result = qword_1EB655EF8;
  if (!qword_1EB655EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655EF8);
  }
  return result;
}

unint64_t sub_1A93AB338()
{
  unint64_t result = qword_1EB655EF0;
  if (!qword_1EB655EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB655EF0);
  }
  return result;
}

unint64_t sub_1A93AB384(unsigned char *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = type metadata accessor for CLLocationCoordinate2D.SolarEvents();
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)(a2, (uint64_t)v11, a3, a4);
  char v12 = v11[*(int *)(v9 + 32)];
  unsigned __int8 v16 = a1;
  unint64_t v13 = sub_1A93AB464(&v16, v12);
  sub_1A938D668((uint64_t)v11);
  return v13;
}

unint64_t sub_1A93AB464(unsigned __int8 *a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t result = 0x6C616369706F7274;
  switch(v2)
  {
    case 1:
      unint64_t result = 0x747375642E6E7573;
      break;
    case 2:
      unint64_t result = 0x6F6E732E646E6977;
      break;
    case 3:
    case 32:
      unint64_t result = 1684957559;
      break;
    case 4:
    case 16:
    case 19:
      if (a2) {
        unint64_t result = 0x2E78616D2E6E7573;
      }
      else {
        unint64_t result = 0x6174732E6E6F6F6DLL;
      }
      break;
    case 5:
    case 20:
      unint64_t result = 0x69662E64756F6C63;
      break;
    case 6:
      if (a2) {
        unint64_t result = 0xD000000000000012;
      }
      else {
        unint64_t result = 0xD000000000000014;
      }
      break;
    case 7:
    case 26:
    case 28:
      unint64_t result = 0x6B616C66776F6E73;
      break;
    case 8:
      unint64_t result = 0x6F662E64756F6C63;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
    case 24:
    case 33:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0x61682E64756F6C63;
      break;
    case 13:
    case 25:
      unint64_t result = 0x657A61682E6E7573;
      break;
    case 14:
    case 27:
    case 30:
      unint64_t result = 0xD000000000000014;
      break;
    case 17:
      unint64_t result = 0x6E61636972727568;
      break;
    case 18:
    case 23:
      if (a2) {
        unint64_t result = 0x6F622E64756F6C63;
      }
      else {
        unint64_t result = 0xD000000000000014;
      }
      break;
    case 21:
      if (a2) {
        unint64_t result = 0x75732E64756F6C63;
      }
      else {
        unint64_t result = 0x6F6D2E64756F6C63;
      }
      break;
    case 22:
      unint64_t result = 0x61722E64756F6C63;
      break;
    case 29:
      unint64_t result = 0xD000000000000013;
      break;
    case 31:
      return result;
    default:
      unint64_t result = 0x6E732E64756F6C63;
      break;
  }
  return result;
}

uint64_t type metadata accessor for WeatherConditionSymbolMapper()
{
  return self;
}

uint64_t sub_1A93AB878()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A93AB888()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A93AB898()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A93AB8A8()
{
  return MEMORY[0x1F40E3198]();
}

uint64_t sub_1A93AB8B8()
{
  return MEMORY[0x1F40E31C8]();
}

uint64_t sub_1A93AB8C8()
{
  return MEMORY[0x1F40E3280]();
}

uint64_t sub_1A93AB8D8()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1A93AB8E8()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1A93AB8F8()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1A93AB908()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1A93AB918()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1A93AB928()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1A93AB938()
{
  return MEMORY[0x1F40E3728]();
}

uint64_t sub_1A93AB948()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1A93AB958()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A93AB968()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A93AB978()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1A93AB988()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1A93AB998()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1A93AB9A8()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1A93AB9B8()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1A93AB9C8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1A93AB9D8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1A93AB9E8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1A93AB9F8()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1A93ABA08()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1A93ABA18()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A93ABA28()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1A93ABA38()
{
  return MEMORY[0x1F40E4DD0]();
}

uint64_t sub_1A93ABA48()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A93ABA58()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1A93ABA68()
{
  return MEMORY[0x1F415D968]();
}

uint64_t sub_1A93ABA78()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1A93ABA88()
{
  return MEMORY[0x1F4168638]();
}

uint64_t sub_1A93ABA98()
{
  return MEMORY[0x1F4168640]();
}

uint64_t sub_1A93ABAA8()
{
  return MEMORY[0x1F4168648]();
}

uint64_t sub_1A93ABAB8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A93ABAC8()
{
  return MEMORY[0x1F40E50E8]();
}

uint64_t sub_1A93ABAD8()
{
  return MEMORY[0x1F40E50F0]();
}

uint64_t sub_1A93ABAE8()
{
  return MEMORY[0x1F40E50F8]();
}

uint64_t sub_1A93ABAF8()
{
  return MEMORY[0x1F40E5100]();
}

uint64_t sub_1A93ABB08()
{
  return MEMORY[0x1F40E5108]();
}

uint64_t sub_1A93ABB18()
{
  return MEMORY[0x1F40E5118]();
}

uint64_t sub_1A93ABB28()
{
  return MEMORY[0x1F40E5120]();
}

uint64_t sub_1A93ABB38()
{
  return MEMORY[0x1F40E5128]();
}

uint64_t sub_1A93ABB48()
{
  return MEMORY[0x1F40E5130]();
}

uint64_t sub_1A93ABB58()
{
  return MEMORY[0x1F40E5140]();
}

uint64_t sub_1A93ABB68()
{
  return MEMORY[0x1F40E5148]();
}

uint64_t sub_1A93ABB78()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A93ABB88()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1A93ABB98()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A93ABBA8()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1A93ABBB8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1A93ABBC8()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A93ABBD8()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1A93ABBE8()
{
  return MEMORY[0x1F40E5358]();
}

uint64_t sub_1A93ABBF8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A93ABC08()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A93ABC18()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1A93ABC28()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1A93ABC38()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A93ABC48()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A93ABC58()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1A93ABC68()
{
  return MEMORY[0x1F4168658]();
}

uint64_t sub_1A93ABC78()
{
  return MEMORY[0x1F40E5638]();
}

uint64_t sub_1A93ABC88()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1A93ABC98()
{
  return MEMORY[0x1F40E5688]();
}

uint64_t sub_1A93ABCA8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1A93ABCB8()
{
  return MEMORY[0x1F40E58C8]();
}

uint64_t sub_1A93ABCC8()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1A93ABCD8()
{
  return MEMORY[0x1F4168660]();
}

uint64_t sub_1A93ABCE8()
{
  return MEMORY[0x1F4168668]();
}

uint64_t sub_1A93ABCF8()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1A93ABD08()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1A93ABD18()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1A93ABD28()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1A93ABD38()
{
  return MEMORY[0x1F40E5AC8]();
}

uint64_t sub_1A93ABD48()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1A93ABD58()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1A93ABD68()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1A93ABD78()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1A93ABD88()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1A93ABD98()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1A93ABDA8()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_1A93ABDB8()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1A93ABDC8()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1A93ABDD8()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1A93ABDE8()
{
  return MEMORY[0x1F4168670]();
}

uint64_t sub_1A93ABDF8()
{
  return MEMORY[0x1F4168678]();
}

uint64_t sub_1A93ABE08()
{
  return MEMORY[0x1F4168680]();
}

uint64_t sub_1A93ABE18()
{
  return MEMORY[0x1F4168688]();
}

uint64_t sub_1A93ABE28()
{
  return MEMORY[0x1F4168690]();
}

uint64_t sub_1A93ABE38()
{
  return MEMORY[0x1F4168698]();
}

uint64_t sub_1A93ABE48()
{
  return MEMORY[0x1F41686A0]();
}

uint64_t sub_1A93ABE58()
{
  return MEMORY[0x1F41686A8]();
}

uint64_t sub_1A93ABEA8()
{
  return MEMORY[0x1F415F2E8]();
}

uint64_t sub_1A93ABEB8()
{
  return MEMORY[0x1F415F2F0]();
}

uint64_t sub_1A93ABEC8()
{
  return MEMORY[0x1F415F300]();
}

uint64_t sub_1A93ABED8()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1A93ABEE8()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1A93ABEF8()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1A93ABF08()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1A93ABF18()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1A93ABF28()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1A93ABF38()
{
  return MEMORY[0x1F415DBF8]();
}

uint64_t sub_1A93ABF48()
{
  return MEMORY[0x1F415DF30]();
}

uint64_t sub_1A93ABF58()
{
  return MEMORY[0x1F415E9D8]();
}

uint64_t sub_1A93ABF68()
{
  return MEMORY[0x1F415E9F0]();
}

uint64_t sub_1A93ABF78()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1A93ABF88()
{
  return MEMORY[0x1F415EC08]();
}

uint64_t sub_1A93ABF98()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1A93ABFA8()
{
  return MEMORY[0x1F415EC20]();
}

uint64_t sub_1A93ABFB8()
{
  return MEMORY[0x1F415EC28]();
}

uint64_t sub_1A93ABFC8()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1A93ABFD8()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1A93ABFE8()
{
  return MEMORY[0x1F415EC90]();
}

uint64_t sub_1A93ABFF8()
{
  return MEMORY[0x1F415EDE0]();
}

uint64_t sub_1A93AC008()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1A93AC018()
{
  return MEMORY[0x1F41686B8]();
}

uint64_t sub_1A93AC028()
{
  return MEMORY[0x1F41686C0]();
}

uint64_t sub_1A93AC038()
{
  return MEMORY[0x1F41686C8]();
}

uint64_t sub_1A93AC048()
{
  return MEMORY[0x1F41686D0]();
}

uint64_t sub_1A93AC058()
{
  return MEMORY[0x1F41686D8]();
}

uint64_t sub_1A93AC068()
{
  return MEMORY[0x1F41686E0]();
}

uint64_t sub_1A93AC078()
{
  return MEMORY[0x1F41686E8]();
}

uint64_t sub_1A93AC098()
{
  return MEMORY[0x1F41686F8]();
}

uint64_t sub_1A93AC0C8()
{
  return MEMORY[0x1F4168710]();
}

uint64_t sub_1A93AC0D8()
{
  return MEMORY[0x1F4168718]();
}

uint64_t sub_1A93AC0E8()
{
  return MEMORY[0x1F4168720]();
}

uint64_t sub_1A93AC0F8()
{
  return MEMORY[0x1F4168728]();
}

uint64_t sub_1A93AC108()
{
  return MEMORY[0x1F4168730]();
}

uint64_t sub_1A93AC118()
{
  return MEMORY[0x1F4168738]();
}

uint64_t sub_1A93AC128()
{
  return MEMORY[0x1F4168740]();
}

uint64_t sub_1A93AC138()
{
  return MEMORY[0x1F4168748]();
}

uint64_t sub_1A93AC148()
{
  return MEMORY[0x1F4168750]();
}

uint64_t sub_1A93AC158()
{
  return MEMORY[0x1F4168758]();
}

uint64_t sub_1A93AC168()
{
  return MEMORY[0x1F4168760]();
}

uint64_t sub_1A93AC178()
{
  return MEMORY[0x1F4168768]();
}

uint64_t sub_1A93AC188()
{
  return MEMORY[0x1F4168770]();
}

uint64_t sub_1A93AC198()
{
  return MEMORY[0x1F4168778]();
}

uint64_t sub_1A93AC1A8()
{
  return MEMORY[0x1F4168780]();
}

uint64_t sub_1A93AC1B8()
{
  return MEMORY[0x1F4168788]();
}

uint64_t sub_1A93AC1C8()
{
  return MEMORY[0x1F4168790]();
}

uint64_t sub_1A93AC1D8()
{
  return MEMORY[0x1F4168798]();
}

uint64_t sub_1A93AC1E8()
{
  return MEMORY[0x1F41687A0]();
}

uint64_t sub_1A93AC1F8()
{
  return MEMORY[0x1F41687A8]();
}

uint64_t sub_1A93AC208()
{
  return MEMORY[0x1F41687B0]();
}

uint64_t sub_1A93AC218()
{
  return MEMORY[0x1F41687B8]();
}

uint64_t sub_1A93AC228()
{
  return MEMORY[0x1F41687C0]();
}

uint64_t sub_1A93AC238()
{
  return MEMORY[0x1F41687C8]();
}

uint64_t sub_1A93AC248()
{
  return MEMORY[0x1F41687D0]();
}

uint64_t sub_1A93AC258()
{
  return MEMORY[0x1F41687D8]();
}

uint64_t sub_1A93AC268()
{
  return MEMORY[0x1F41687E0]();
}

uint64_t sub_1A93AC278()
{
  return MEMORY[0x1F41687E8]();
}

uint64_t sub_1A93AC288()
{
  return MEMORY[0x1F41687F0]();
}

uint64_t sub_1A93AC298()
{
  return MEMORY[0x1F41687F8]();
}

uint64_t sub_1A93AC2A8()
{
  return MEMORY[0x1F4168800]();
}

uint64_t sub_1A93AC2B8()
{
  return MEMORY[0x1F4168808]();
}

uint64_t sub_1A93AC2C8()
{
  return MEMORY[0x1F4168810]();
}

uint64_t sub_1A93AC2D8()
{
  return MEMORY[0x1F4168818]();
}

uint64_t sub_1A93AC2E8()
{
  return MEMORY[0x1F4168820]();
}

uint64_t sub_1A93AC2F8()
{
  return MEMORY[0x1F4168828]();
}

uint64_t sub_1A93AC308()
{
  return MEMORY[0x1F4168830]();
}

uint64_t sub_1A93AC318()
{
  return MEMORY[0x1F4168838]();
}

uint64_t sub_1A93AC328()
{
  return MEMORY[0x1F4168840]();
}

uint64_t sub_1A93AC338()
{
  return MEMORY[0x1F4168848]();
}

uint64_t sub_1A93AC348()
{
  return MEMORY[0x1F4168850]();
}

uint64_t sub_1A93AC358()
{
  return MEMORY[0x1F4168858]();
}

uint64_t sub_1A93AC368()
{
  return MEMORY[0x1F4168860]();
}

uint64_t sub_1A93AC378()
{
  return MEMORY[0x1F4168868]();
}

uint64_t sub_1A93AC388()
{
  return MEMORY[0x1F4168870]();
}

uint64_t sub_1A93AC398()
{
  return MEMORY[0x1F4168878]();
}

uint64_t sub_1A93AC3A8()
{
  return MEMORY[0x1F4168880]();
}

uint64_t sub_1A93AC3B8()
{
  return MEMORY[0x1F4168890]();
}

uint64_t sub_1A93AC3C8()
{
  return MEMORY[0x1F4168898]();
}

uint64_t sub_1A93AC3D8()
{
  return MEMORY[0x1F41688A0]();
}

uint64_t sub_1A93AC3E8()
{
  return MEMORY[0x1F41688A8]();
}

uint64_t sub_1A93AC3F8()
{
  return MEMORY[0x1F41688B0]();
}

uint64_t sub_1A93AC438()
{
  return MEMORY[0x1F41688D8]();
}

uint64_t sub_1A93AC448()
{
  return MEMORY[0x1F41688F0]();
}

uint64_t sub_1A93AC458()
{
  return MEMORY[0x1F41688F8]();
}

uint64_t sub_1A93AC468()
{
  return MEMORY[0x1F4168900]();
}

uint64_t sub_1A93AC478()
{
  return MEMORY[0x1F4168908]();
}

uint64_t sub_1A93AC488()
{
  return MEMORY[0x1F4168910]();
}

uint64_t sub_1A93AC498()
{
  return MEMORY[0x1F4168918]();
}

uint64_t sub_1A93AC4A8()
{
  return MEMORY[0x1F4168920]();
}

uint64_t sub_1A93AC4B8()
{
  return MEMORY[0x1F4168928]();
}

uint64_t sub_1A93AC4C8()
{
  return MEMORY[0x1F4168930]();
}

uint64_t sub_1A93AC4D8()
{
  return MEMORY[0x1F4168938]();
}

uint64_t sub_1A93AC4E8()
{
  return MEMORY[0x1F4168940]();
}

uint64_t sub_1A93AC4F8()
{
  return MEMORY[0x1F4168948]();
}

uint64_t sub_1A93AC508()
{
  return MEMORY[0x1F4168950]();
}

uint64_t sub_1A93AC518()
{
  return MEMORY[0x1F4168958]();
}

uint64_t sub_1A93AC528()
{
  return MEMORY[0x1F4168960]();
}

uint64_t sub_1A93AC538()
{
  return MEMORY[0x1F4168968]();
}

uint64_t sub_1A93AC548()
{
  return MEMORY[0x1F4168970]();
}

uint64_t sub_1A93AC558()
{
  return MEMORY[0x1F4168978]();
}

uint64_t sub_1A93AC568()
{
  return MEMORY[0x1F4168980]();
}

uint64_t sub_1A93AC578()
{
  return MEMORY[0x1F4168988]();
}

uint64_t sub_1A93AC588()
{
  return MEMORY[0x1F4168990]();
}

uint64_t sub_1A93AC598()
{
  return MEMORY[0x1F4168998]();
}

uint64_t sub_1A93AC5A8()
{
  return MEMORY[0x1F41689A0]();
}

uint64_t sub_1A93AC5B8()
{
  return MEMORY[0x1F41689A8]();
}

uint64_t sub_1A93AC5C8()
{
  return MEMORY[0x1F41689B0]();
}

uint64_t sub_1A93AC5D8()
{
  return MEMORY[0x1F41689B8]();
}

uint64_t sub_1A93AC5E8()
{
  return MEMORY[0x1F41689C0]();
}

uint64_t sub_1A93AC5F8()
{
  return MEMORY[0x1F41689C8]();
}

uint64_t sub_1A93AC608()
{
  return MEMORY[0x1F41689D0]();
}

uint64_t sub_1A93AC618()
{
  return MEMORY[0x1F41689D8]();
}

uint64_t sub_1A93AC628()
{
  return MEMORY[0x1F41689E0]();
}

uint64_t sub_1A93AC638()
{
  return MEMORY[0x1F41689E8]();
}

uint64_t sub_1A93AC648()
{
  return MEMORY[0x1F41689F0]();
}

uint64_t sub_1A93AC658()
{
  return MEMORY[0x1F41689F8]();
}

uint64_t sub_1A93AC668()
{
  return MEMORY[0x1F4168A00]();
}

uint64_t sub_1A93AC678()
{
  return MEMORY[0x1F4168A08]();
}

uint64_t sub_1A93AC688()
{
  return MEMORY[0x1F4168A10]();
}

uint64_t sub_1A93AC698()
{
  return MEMORY[0x1F4168A18]();
}

uint64_t sub_1A93AC6A8()
{
  return MEMORY[0x1F4168A20]();
}

uint64_t sub_1A93AC6B8()
{
  return MEMORY[0x1F4168A28]();
}

uint64_t sub_1A93AC6C8()
{
  return MEMORY[0x1F4168A30]();
}

uint64_t sub_1A93AC6D8()
{
  return MEMORY[0x1F4168A38]();
}

uint64_t sub_1A93AC6E8()
{
  return MEMORY[0x1F4168A40]();
}

uint64_t sub_1A93AC6F8()
{
  return MEMORY[0x1F4168A48]();
}

uint64_t sub_1A93AC708()
{
  return MEMORY[0x1F4168A50]();
}

uint64_t sub_1A93AC718()
{
  return MEMORY[0x1F4168A58]();
}

uint64_t sub_1A93AC728()
{
  return MEMORY[0x1F4168A60]();
}

uint64_t sub_1A93AC738()
{
  return MEMORY[0x1F4168A68]();
}

uint64_t sub_1A93AC748()
{
  return MEMORY[0x1F4168A70]();
}

uint64_t sub_1A93AC758()
{
  return MEMORY[0x1F4168A78]();
}

uint64_t sub_1A93AC768()
{
  return MEMORY[0x1F4168A80]();
}

uint64_t sub_1A93AC778()
{
  return MEMORY[0x1F4168A88]();
}

uint64_t sub_1A93AC788()
{
  return MEMORY[0x1F4168A90]();
}

uint64_t sub_1A93AC798()
{
  return MEMORY[0x1F4168A98]();
}

uint64_t sub_1A93AC7A8()
{
  return MEMORY[0x1F4168AA0]();
}

uint64_t sub_1A93AC7B8()
{
  return MEMORY[0x1F4168AA8]();
}

uint64_t sub_1A93AC7C8()
{
  return MEMORY[0x1F4168AB0]();
}

uint64_t sub_1A93AC7D8()
{
  return MEMORY[0x1F4168AB8]();
}

uint64_t sub_1A93AC7E8()
{
  return MEMORY[0x1F4168AC0]();
}

uint64_t sub_1A93AC7F8()
{
  return MEMORY[0x1F4168AC8]();
}

uint64_t sub_1A93AC808()
{
  return MEMORY[0x1F4168AD0]();
}

uint64_t sub_1A93AC818()
{
  return MEMORY[0x1F4168AD8]();
}

uint64_t sub_1A93AC828()
{
  return MEMORY[0x1F4168AE0]();
}

uint64_t sub_1A93AC838()
{
  return MEMORY[0x1F4168AE8]();
}

uint64_t sub_1A93AC848()
{
  return MEMORY[0x1F4168AF8]();
}

uint64_t sub_1A93AC858()
{
  return MEMORY[0x1F4168B00]();
}

uint64_t sub_1A93AC868()
{
  return MEMORY[0x1F4168B10]();
}

uint64_t sub_1A93AC878()
{
  return MEMORY[0x1F4168B18]();
}

uint64_t sub_1A93AC888()
{
  return MEMORY[0x1F4168B20]();
}

uint64_t sub_1A93AC898()
{
  return MEMORY[0x1F4168B28]();
}

uint64_t sub_1A93AC8A8()
{
  return MEMORY[0x1F4168B30]();
}

uint64_t sub_1A93AC8B8()
{
  return MEMORY[0x1F4168B38]();
}

uint64_t sub_1A93AC8C8()
{
  return MEMORY[0x1F4168B40]();
}

uint64_t sub_1A93AC8D8()
{
  return MEMORY[0x1F4168B48]();
}

uint64_t sub_1A93AC8E8()
{
  return MEMORY[0x1F4168B50]();
}

uint64_t sub_1A93AC8F8()
{
  return MEMORY[0x1F4168B58]();
}

uint64_t sub_1A93AC908()
{
  return MEMORY[0x1F4168B68]();
}

uint64_t sub_1A93AC918()
{
  return MEMORY[0x1F4168B70]();
}

uint64_t sub_1A93AC928()
{
  return MEMORY[0x1F4168B78]();
}

uint64_t sub_1A93AC938()
{
  return MEMORY[0x1F4168B80]();
}

uint64_t sub_1A93AC948()
{
  return MEMORY[0x1F4168B88]();
}

uint64_t sub_1A93AC958()
{
  return MEMORY[0x1F4168B90]();
}

uint64_t sub_1A93AC968()
{
  return MEMORY[0x1F4168B98]();
}

uint64_t sub_1A93AC978()
{
  return MEMORY[0x1F4168BA0]();
}

uint64_t sub_1A93AC988()
{
  return MEMORY[0x1F4168BA8]();
}

uint64_t sub_1A93AC998()
{
  return MEMORY[0x1F4168BB0]();
}

uint64_t sub_1A93AC9A8()
{
  return MEMORY[0x1F4168BB8]();
}

uint64_t sub_1A93AC9B8()
{
  return MEMORY[0x1F4168BC0]();
}

uint64_t sub_1A93AC9C8()
{
  return MEMORY[0x1F4168BC8]();
}

uint64_t sub_1A93AC9D8()
{
  return MEMORY[0x1F4168BD0]();
}

uint64_t sub_1A93AC9E8()
{
  return MEMORY[0x1F4168BD8]();
}

uint64_t sub_1A93AC9F8()
{
  return MEMORY[0x1F4168BE0]();
}

uint64_t sub_1A93ACA08()
{
  return MEMORY[0x1F4168BE8]();
}

uint64_t sub_1A93ACA18()
{
  return MEMORY[0x1F4168BF0]();
}

uint64_t sub_1A93ACA28()
{
  return MEMORY[0x1F4168BF8]();
}

uint64_t sub_1A93ACA38()
{
  return MEMORY[0x1F4168C00]();
}

uint64_t sub_1A93ACA48()
{
  return MEMORY[0x1F4168C08]();
}

uint64_t sub_1A93ACA58()
{
  return MEMORY[0x1F4168C10]();
}

uint64_t sub_1A93ACA68()
{
  return MEMORY[0x1F4168C18]();
}

uint64_t sub_1A93ACA78()
{
  return MEMORY[0x1F4168C20]();
}

uint64_t sub_1A93ACA88()
{
  return MEMORY[0x1F4168C28]();
}

uint64_t sub_1A93ACA98()
{
  return MEMORY[0x1F4168C30]();
}

uint64_t sub_1A93ACAA8()
{
  return MEMORY[0x1F4168C38]();
}

uint64_t sub_1A93ACAB8()
{
  return MEMORY[0x1F4168C40]();
}

uint64_t sub_1A93ACAC8()
{
  return MEMORY[0x1F4168C50]();
}

uint64_t sub_1A93ACAD8()
{
  return MEMORY[0x1F4168C58]();
}

uint64_t sub_1A93ACAE8()
{
  return MEMORY[0x1F4168C60]();
}

uint64_t sub_1A93ACAF8()
{
  return MEMORY[0x1F4168C68]();
}

uint64_t sub_1A93ACB08()
{
  return MEMORY[0x1F4168C70]();
}

uint64_t sub_1A93ACB18()
{
  return MEMORY[0x1F4168C78]();
}

uint64_t sub_1A93ACB28()
{
  return MEMORY[0x1F4168C80]();
}

uint64_t sub_1A93ACB38()
{
  return MEMORY[0x1F4168C88]();
}

uint64_t sub_1A93ACB48()
{
  return MEMORY[0x1F4168C90]();
}

uint64_t sub_1A93ACB58()
{
  return MEMORY[0x1F4168C98]();
}

uint64_t sub_1A93ACB68()
{
  return MEMORY[0x1F4168CA0]();
}

uint64_t sub_1A93ACB78()
{
  return MEMORY[0x1F4168CA8]();
}

uint64_t sub_1A93ACB88()
{
  return MEMORY[0x1F4168CB0]();
}

uint64_t sub_1A93ACB98()
{
  return MEMORY[0x1F4168CB8]();
}

uint64_t sub_1A93ACBA8()
{
  return MEMORY[0x1F4168CC0]();
}

uint64_t sub_1A93ACBB8()
{
  return MEMORY[0x1F4168CC8]();
}

uint64_t sub_1A93ACBC8()
{
  return MEMORY[0x1F4168CD0]();
}

uint64_t sub_1A93ACBD8()
{
  return MEMORY[0x1F4168CD8]();
}

uint64_t sub_1A93ACBE8()
{
  return MEMORY[0x1F4168CE0]();
}

uint64_t sub_1A93ACBF8()
{
  return MEMORY[0x1F4168CE8]();
}

uint64_t sub_1A93ACC08()
{
  return MEMORY[0x1F4168CF0]();
}

uint64_t sub_1A93ACC18()
{
  return MEMORY[0x1F4168CF8]();
}

uint64_t sub_1A93ACC28()
{
  return MEMORY[0x1F4168D00]();
}

uint64_t sub_1A93ACC38()
{
  return MEMORY[0x1F4168D08]();
}

uint64_t sub_1A93ACC48()
{
  return MEMORY[0x1F4168D18]();
}

uint64_t sub_1A93ACC58()
{
  return MEMORY[0x1F4168D20]();
}

uint64_t sub_1A93ACC68()
{
  return MEMORY[0x1F4168D38]();
}

uint64_t sub_1A93ACC78()
{
  return MEMORY[0x1F4168D40]();
}

uint64_t sub_1A93ACC88()
{
  return MEMORY[0x1F4168D48]();
}

uint64_t sub_1A93ACC98()
{
  return MEMORY[0x1F4168D50]();
}

uint64_t sub_1A93ACCA8()
{
  return MEMORY[0x1F4168D58]();
}

uint64_t sub_1A93ACCB8()
{
  return MEMORY[0x1F4168D60]();
}

uint64_t sub_1A93ACCC8()
{
  return MEMORY[0x1F4168D68]();
}

uint64_t sub_1A93ACCD8()
{
  return MEMORY[0x1F4168D70]();
}

uint64_t sub_1A93ACCE8()
{
  return MEMORY[0x1F4168D80]();
}

uint64_t sub_1A93ACCF8()
{
  return MEMORY[0x1F4168D88]();
}

uint64_t sub_1A93ACD08()
{
  return MEMORY[0x1F4168D90]();
}

uint64_t sub_1A93ACD18()
{
  return MEMORY[0x1F4168D98]();
}

uint64_t sub_1A93ACD28()
{
  return MEMORY[0x1F4168DA0]();
}

uint64_t sub_1A93ACD38()
{
  return MEMORY[0x1F4168DA8]();
}

uint64_t sub_1A93ACD48()
{
  return MEMORY[0x1F4168DB0]();
}

uint64_t sub_1A93ACD58()
{
  return MEMORY[0x1F4168DB8]();
}

uint64_t sub_1A93ACD68()
{
  return MEMORY[0x1F4168DC0]();
}

uint64_t sub_1A93ACD78()
{
  return MEMORY[0x1F4168DC8]();
}

uint64_t sub_1A93ACD88()
{
  return MEMORY[0x1F4168DD0]();
}

uint64_t sub_1A93ACD98()
{
  return MEMORY[0x1F4168DD8]();
}

uint64_t sub_1A93ACDA8()
{
  return MEMORY[0x1F4168DE0]();
}

uint64_t sub_1A93ACDB8()
{
  return MEMORY[0x1F4168DE8]();
}

uint64_t sub_1A93ACDC8()
{
  return MEMORY[0x1F4168DF0]();
}

uint64_t sub_1A93ACDD8()
{
  return MEMORY[0x1F4168DF8]();
}

uint64_t sub_1A93ACDE8()
{
  return MEMORY[0x1F4168E00]();
}

uint64_t sub_1A93ACDF8()
{
  return MEMORY[0x1F4168E08]();
}

uint64_t sub_1A93ACE08()
{
  return MEMORY[0x1F4168E10]();
}

uint64_t sub_1A93ACE18()
{
  return MEMORY[0x1F4168E18]();
}

uint64_t sub_1A93ACE28()
{
  return MEMORY[0x1F4168E20]();
}

uint64_t sub_1A93ACE38()
{
  return MEMORY[0x1F4168E28]();
}

uint64_t sub_1A93ACE48()
{
  return MEMORY[0x1F4168E30]();
}

uint64_t sub_1A93ACE58()
{
  return MEMORY[0x1F4168E40]();
}

uint64_t sub_1A93ACE68()
{
  return MEMORY[0x1F4168E48]();
}

uint64_t sub_1A93ACE78()
{
  return MEMORY[0x1F4168E50]();
}

uint64_t sub_1A93ACE88()
{
  return MEMORY[0x1F4168E60]();
}

uint64_t sub_1A93ACE98()
{
  return MEMORY[0x1F4168E68]();
}

uint64_t sub_1A93ACEA8()
{
  return MEMORY[0x1F4168E78]();
}

uint64_t sub_1A93ACEB8()
{
  return MEMORY[0x1F4168E80]();
}

uint64_t sub_1A93ACEC8()
{
  return MEMORY[0x1F4168E88]();
}

uint64_t sub_1A93ACED8()
{
  return MEMORY[0x1F4168E90]();
}

uint64_t sub_1A93ACEE8()
{
  return MEMORY[0x1F4168E98]();
}

uint64_t sub_1A93ACEF8()
{
  return MEMORY[0x1F4168EA0]();
}

uint64_t sub_1A93ACF08()
{
  return MEMORY[0x1F4168EA8]();
}

uint64_t sub_1A93ACF18()
{
  return MEMORY[0x1F4168EB8]();
}

uint64_t sub_1A93ACF28()
{
  return MEMORY[0x1F4168EC0]();
}

uint64_t sub_1A93ACF38()
{
  return MEMORY[0x1F4168EC8]();
}

uint64_t sub_1A93ACF48()
{
  return MEMORY[0x1F4168ED0]();
}

uint64_t sub_1A93ACF58()
{
  return MEMORY[0x1F4168ED8]();
}

uint64_t sub_1A93ACF68()
{
  return MEMORY[0x1F4168EE0]();
}

uint64_t sub_1A93ACF78()
{
  return MEMORY[0x1F4168EE8]();
}

uint64_t sub_1A93ACF88()
{
  return MEMORY[0x1F4168EF0]();
}

uint64_t sub_1A93ACF98()
{
  return MEMORY[0x1F4168EF8]();
}

uint64_t sub_1A93ACFA8()
{
  return MEMORY[0x1F4168F00]();
}

uint64_t sub_1A93ACFB8()
{
  return MEMORY[0x1F4168F08]();
}

uint64_t sub_1A93ACFD8()
{
  return MEMORY[0x1F4168F18]();
}

uint64_t sub_1A93ACFE8()
{
  return MEMORY[0x1F4168F20]();
}

uint64_t sub_1A93ACFF8()
{
  return MEMORY[0x1F4168F28]();
}

uint64_t sub_1A93AD008()
{
  return MEMORY[0x1F4168F30]();
}

uint64_t sub_1A93AD018()
{
  return MEMORY[0x1F4168F38]();
}

uint64_t sub_1A93AD028()
{
  return MEMORY[0x1F4168F40]();
}

uint64_t sub_1A93AD038()
{
  return MEMORY[0x1F4168F50]();
}

uint64_t sub_1A93AD048()
{
  return MEMORY[0x1F4168F58]();
}

uint64_t sub_1A93AD058()
{
  return MEMORY[0x1F4168F60]();
}

uint64_t sub_1A93AD068()
{
  return MEMORY[0x1F4168F68]();
}

uint64_t sub_1A93AD078()
{
  return MEMORY[0x1F4168F70]();
}

uint64_t sub_1A93AD088()
{
  return MEMORY[0x1F4168F78]();
}

uint64_t sub_1A93AD098()
{
  return MEMORY[0x1F4168F80]();
}

uint64_t sub_1A93AD0A8()
{
  return MEMORY[0x1F4168F88]();
}

uint64_t sub_1A93AD0B8()
{
  return MEMORY[0x1F4168F90]();
}

uint64_t sub_1A93AD0C8()
{
  return MEMORY[0x1F4168F98]();
}

uint64_t sub_1A93AD0D8()
{
  return MEMORY[0x1F4168FA0]();
}

uint64_t sub_1A93AD0E8()
{
  return MEMORY[0x1F4168FA8]();
}

uint64_t sub_1A93AD0F8()
{
  return MEMORY[0x1F4168FB0]();
}

uint64_t sub_1A93AD108()
{
  return MEMORY[0x1F4168FB8]();
}

uint64_t sub_1A93AD118()
{
  return MEMORY[0x1F4168FC0]();
}

uint64_t sub_1A93AD128()
{
  return MEMORY[0x1F4168FC8]();
}

uint64_t sub_1A93AD138()
{
  return MEMORY[0x1F4168FD0]();
}

uint64_t sub_1A93AD148()
{
  return MEMORY[0x1F4168FD8]();
}

uint64_t sub_1A93AD158()
{
  return MEMORY[0x1F4168FE0]();
}

uint64_t sub_1A93AD168()
{
  return MEMORY[0x1F4168FE8]();
}

uint64_t sub_1A93AD178()
{
  return MEMORY[0x1F4168FF8]();
}

uint64_t sub_1A93AD188()
{
  return MEMORY[0x1F4169000]();
}

uint64_t sub_1A93AD198()
{
  return MEMORY[0x1F4169008]();
}

uint64_t sub_1A93AD1A8()
{
  return MEMORY[0x1F4169010]();
}

uint64_t sub_1A93AD1B8()
{
  return MEMORY[0x1F4169018]();
}

uint64_t sub_1A93AD1C8()
{
  return MEMORY[0x1F4169020]();
}

uint64_t sub_1A93AD1D8()
{
  return MEMORY[0x1F4169028]();
}

uint64_t sub_1A93AD1E8()
{
  return MEMORY[0x1F4169030]();
}

uint64_t sub_1A93AD1F8()
{
  return MEMORY[0x1F4169038]();
}

uint64_t sub_1A93AD208()
{
  return MEMORY[0x1F4169040]();
}

uint64_t sub_1A93AD218()
{
  return MEMORY[0x1F4169048]();
}

uint64_t sub_1A93AD228()
{
  return MEMORY[0x1F4169050]();
}

uint64_t sub_1A93AD238()
{
  return MEMORY[0x1F4169058]();
}

uint64_t sub_1A93AD248()
{
  return MEMORY[0x1F4169060]();
}

uint64_t sub_1A93AD258()
{
  return MEMORY[0x1F4169068]();
}

uint64_t sub_1A93AD268()
{
  return MEMORY[0x1F4169070]();
}

uint64_t sub_1A93AD278()
{
  return MEMORY[0x1F4169078]();
}

uint64_t sub_1A93AD288()
{
  return MEMORY[0x1F4169080]();
}

uint64_t sub_1A93AD298()
{
  return MEMORY[0x1F4169088]();
}

uint64_t sub_1A93AD2A8()
{
  return MEMORY[0x1F4169090]();
}

uint64_t sub_1A93AD2B8()
{
  return MEMORY[0x1F4169098]();
}

uint64_t sub_1A93AD2C8()
{
  return MEMORY[0x1F41690A0]();
}

uint64_t sub_1A93AD2D8()
{
  return MEMORY[0x1F41690A8]();
}

uint64_t sub_1A93AD2E8()
{
  return MEMORY[0x1F41690B0]();
}

uint64_t sub_1A93AD2F8()
{
  return MEMORY[0x1F41690B8]();
}

uint64_t sub_1A93AD308()
{
  return MEMORY[0x1F41690C8]();
}

uint64_t sub_1A93AD318()
{
  return MEMORY[0x1F41690D0]();
}

uint64_t sub_1A93AD328()
{
  return MEMORY[0x1F41690D8]();
}

uint64_t sub_1A93AD338()
{
  return MEMORY[0x1F41690E0]();
}

uint64_t sub_1A93AD348()
{
  return MEMORY[0x1F41690E8]();
}

uint64_t sub_1A93AD358()
{
  return MEMORY[0x1F41690F0]();
}

uint64_t sub_1A93AD368()
{
  return MEMORY[0x1F4169120]();
}

uint64_t sub_1A93AD378()
{
  return MEMORY[0x1F4169140]();
}

uint64_t sub_1A93AD388()
{
  return MEMORY[0x1F4169150]();
}

uint64_t sub_1A93AD398()
{
  return MEMORY[0x1F4169158]();
}

uint64_t sub_1A93AD3A8()
{
  return MEMORY[0x1F4169160]();
}

uint64_t sub_1A93AD3B8()
{
  return MEMORY[0x1F4169168]();
}

uint64_t sub_1A93AD3C8()
{
  return MEMORY[0x1F4169178]();
}

uint64_t sub_1A93AD3D8()
{
  return MEMORY[0x1F4169188]();
}

uint64_t sub_1A93AD3E8()
{
  return MEMORY[0x1F4169190]();
}

uint64_t sub_1A93AD3F8()
{
  return MEMORY[0x1F41691A0]();
}

uint64_t sub_1A93AD408()
{
  return MEMORY[0x1F41691A8]();
}

uint64_t sub_1A93AD418()
{
  return MEMORY[0x1F41691B0]();
}

uint64_t sub_1A93AD428()
{
  return MEMORY[0x1F41691B8]();
}

uint64_t sub_1A93AD438()
{
  return MEMORY[0x1F41691C0]();
}

uint64_t sub_1A93AD448()
{
  return MEMORY[0x1F41691C8]();
}

uint64_t sub_1A93AD458()
{
  return MEMORY[0x1F41691D0]();
}

uint64_t sub_1A93AD468()
{
  return MEMORY[0x1F41691D8]();
}

uint64_t sub_1A93AD478()
{
  return MEMORY[0x1F41691E0]();
}

uint64_t sub_1A93AD488()
{
  return MEMORY[0x1F41691E8]();
}

uint64_t sub_1A93AD498()
{
  return MEMORY[0x1F41691F0]();
}

uint64_t sub_1A93AD4A8()
{
  return MEMORY[0x1F41691F8]();
}

uint64_t sub_1A93AD4B8()
{
  return MEMORY[0x1F4169208]();
}

uint64_t sub_1A93AD4C8()
{
  return MEMORY[0x1F4169210]();
}

uint64_t sub_1A93AD4D8()
{
  return MEMORY[0x1F4169218]();
}

uint64_t sub_1A93AD4E8()
{
  return MEMORY[0x1F4169220]();
}

uint64_t sub_1A93AD4F8()
{
  return MEMORY[0x1F4169228]();
}

uint64_t sub_1A93AD508()
{
  return MEMORY[0x1F4169230]();
}

uint64_t sub_1A93AD518()
{
  return MEMORY[0x1F4169240]();
}

uint64_t sub_1A93AD528()
{
  return MEMORY[0x1F4169248]();
}

uint64_t sub_1A93AD538()
{
  return MEMORY[0x1F4169260]();
}

uint64_t sub_1A93AD548()
{
  return MEMORY[0x1F4169268]();
}

uint64_t sub_1A93AD558()
{
  return MEMORY[0x1F4169270]();
}

uint64_t sub_1A93AD568()
{
  return MEMORY[0x1F4169278]();
}

uint64_t sub_1A93AD578()
{
  return MEMORY[0x1F4169280]();
}

uint64_t sub_1A93AD588()
{
  return MEMORY[0x1F4169288]();
}

uint64_t sub_1A93AD598()
{
  return MEMORY[0x1F4169290]();
}

uint64_t sub_1A93AD5A8()
{
  return MEMORY[0x1F4169298]();
}

uint64_t sub_1A93AD5B8()
{
  return MEMORY[0x1F41692A0]();
}

uint64_t sub_1A93AD5C8()
{
  return MEMORY[0x1F41692A8]();
}

uint64_t sub_1A93AD5D8()
{
  return MEMORY[0x1F41692D0]();
}

uint64_t sub_1A93AD5E8()
{
  return MEMORY[0x1F4169318]();
}

uint64_t sub_1A93AD5F8()
{
  return MEMORY[0x1F4169320]();
}

uint64_t sub_1A93AD608()
{
  return MEMORY[0x1F4169328]();
}

uint64_t sub_1A93AD618()
{
  return MEMORY[0x1F4169338]();
}

uint64_t sub_1A93AD628()
{
  return MEMORY[0x1F4169340]();
}

uint64_t sub_1A93AD638()
{
  return MEMORY[0x1F4169348]();
}

uint64_t sub_1A93AD648()
{
  return MEMORY[0x1F4169350]();
}

uint64_t sub_1A93AD658()
{
  return MEMORY[0x1F4169358]();
}

uint64_t sub_1A93AD668()
{
  return MEMORY[0x1F4169360]();
}

uint64_t sub_1A93AD678()
{
  return MEMORY[0x1F4169368]();
}

uint64_t sub_1A93AD688()
{
  return MEMORY[0x1F4169370]();
}

uint64_t sub_1A93AD698()
{
  return MEMORY[0x1F4169378]();
}

uint64_t sub_1A93AD6A8()
{
  return MEMORY[0x1F4169380]();
}

uint64_t sub_1A93AD6B8()
{
  return MEMORY[0x1F4169388]();
}

uint64_t sub_1A93AD6C8()
{
  return MEMORY[0x1F4169390]();
}

uint64_t sub_1A93AD6D8()
{
  return MEMORY[0x1F41693A0]();
}

uint64_t sub_1A93AD6E8()
{
  return MEMORY[0x1F41693A8]();
}

uint64_t sub_1A93AD6F8()
{
  return MEMORY[0x1F41693B0]();
}

uint64_t sub_1A93AD708()
{
  return MEMORY[0x1F41693C0]();
}

uint64_t sub_1A93AD718()
{
  return MEMORY[0x1F41693C8]();
}

uint64_t sub_1A93AD728()
{
  return MEMORY[0x1F41693D0]();
}

uint64_t sub_1A93AD738()
{
  return MEMORY[0x1F41693D8]();
}

uint64_t sub_1A93AD748()
{
  return MEMORY[0x1F41693E0]();
}

uint64_t sub_1A93AD758()
{
  return MEMORY[0x1F41693E8]();
}

uint64_t sub_1A93AD768()
{
  return MEMORY[0x1F41693F8]();
}

uint64_t sub_1A93AD778()
{
  return MEMORY[0x1F4169400]();
}

uint64_t sub_1A93AD788()
{
  return MEMORY[0x1F4169408]();
}

uint64_t sub_1A93AD798()
{
  return MEMORY[0x1F4169418]();
}

uint64_t sub_1A93AD7A8()
{
  return MEMORY[0x1F4169420]();
}

uint64_t sub_1A93AD7B8()
{
  return MEMORY[0x1F4169430]();
}

uint64_t sub_1A93AD7C8()
{
  return MEMORY[0x1F4169438]();
}

uint64_t sub_1A93AD7D8()
{
  return MEMORY[0x1F4169440]();
}

uint64_t sub_1A93AD7E8()
{
  return MEMORY[0x1F4169448]();
}

uint64_t sub_1A93AD7F8()
{
  return MEMORY[0x1F4169450]();
}

uint64_t sub_1A93AD808()
{
  return MEMORY[0x1F4169458]();
}

uint64_t sub_1A93AD818()
{
  return MEMORY[0x1F4169460]();
}

uint64_t sub_1A93AD828()
{
  return MEMORY[0x1F4169468]();
}

uint64_t sub_1A93AD838()
{
  return MEMORY[0x1F4169470]();
}

uint64_t sub_1A93AD848()
{
  return MEMORY[0x1F4169478]();
}

uint64_t sub_1A93AD858()
{
  return MEMORY[0x1F4169480]();
}

uint64_t sub_1A93AD868()
{
  return MEMORY[0x1F4169488]();
}

uint64_t sub_1A93AD878()
{
  return MEMORY[0x1F4169490]();
}

uint64_t sub_1A93AD888()
{
  return MEMORY[0x1F4169498]();
}

uint64_t sub_1A93AD898()
{
  return MEMORY[0x1F41694A0]();
}

uint64_t sub_1A93AD8A8()
{
  return MEMORY[0x1F41694C8]();
}

uint64_t sub_1A93AD8B8()
{
  return MEMORY[0x1F41694D0]();
}

uint64_t sub_1A93AD8C8()
{
  return MEMORY[0x1F41694D8]();
}

uint64_t sub_1A93AD8D8()
{
  return MEMORY[0x1F41694E0]();
}

uint64_t sub_1A93AD8E8()
{
  return MEMORY[0x1F41694E8]();
}

uint64_t sub_1A93AD8F8()
{
  return MEMORY[0x1F41694F0]();
}

uint64_t sub_1A93AD908()
{
  return MEMORY[0x1F41694F8]();
}

uint64_t sub_1A93AD918()
{
  return MEMORY[0x1F4169500]();
}

uint64_t sub_1A93AD928()
{
  return MEMORY[0x1F4169510]();
}

uint64_t sub_1A93AD938()
{
  return MEMORY[0x1F4169520]();
}

uint64_t sub_1A93AD948()
{
  return MEMORY[0x1F4169528]();
}

uint64_t sub_1A93AD958()
{
  return MEMORY[0x1F4169530]();
}

uint64_t sub_1A93AD968()
{
  return MEMORY[0x1F4169538]();
}

uint64_t sub_1A93AD978()
{
  return MEMORY[0x1F4169540]();
}

uint64_t sub_1A93AD988()
{
  return MEMORY[0x1F4169548]();
}

uint64_t sub_1A93AD998()
{
  return MEMORY[0x1F4169550]();
}

uint64_t sub_1A93AD9A8()
{
  return MEMORY[0x1F4169558]();
}

uint64_t sub_1A93AD9B8()
{
  return MEMORY[0x1F4169560]();
}

uint64_t sub_1A93AD9C8()
{
  return MEMORY[0x1F4169570]();
}

uint64_t sub_1A93AD9D8()
{
  return MEMORY[0x1F4169578]();
}

uint64_t sub_1A93AD9E8()
{
  return MEMORY[0x1F4169580]();
}

uint64_t sub_1A93AD9F8()
{
  return MEMORY[0x1F4169588]();
}

uint64_t sub_1A93ADA08()
{
  return MEMORY[0x1F4169590]();
}

uint64_t sub_1A93ADA18()
{
  return MEMORY[0x1F4169598]();
}

uint64_t sub_1A93ADA28()
{
  return MEMORY[0x1F41695A0]();
}

uint64_t sub_1A93ADA38()
{
  return MEMORY[0x1F41695A8]();
}

uint64_t sub_1A93ADA48()
{
  return MEMORY[0x1F41695B0]();
}

uint64_t sub_1A93ADA58()
{
  return MEMORY[0x1F41695B8]();
}

uint64_t sub_1A93ADA68()
{
  return MEMORY[0x1F41695C0]();
}

uint64_t sub_1A93ADA78()
{
  return MEMORY[0x1F41695C8]();
}

uint64_t sub_1A93ADA88()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A93ADA98()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A93ADAA8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A93ADB18()
{
  return MEMORY[0x1F415D4F8]();
}

uint64_t sub_1A93ADB28()
{
  return MEMORY[0x1F41695D0]();
}

uint64_t sub_1A93ADB38()
{
  return MEMORY[0x1F415D668]();
}

uint64_t sub_1A93ADB48()
{
  return MEMORY[0x1F415D6C8]();
}

uint64_t sub_1A93ADB58()
{
  return MEMORY[0x1F415D6E0]();
}

uint64_t sub_1A93ADB68()
{
  return MEMORY[0x1F415D708]();
}

uint64_t sub_1A93ADB78()
{
  return MEMORY[0x1F415D710]();
}

uint64_t sub_1A93ADB88()
{
  return MEMORY[0x1F415D718]();
}

uint64_t sub_1A93ADB98()
{
  return MEMORY[0x1F415D720]();
}

uint64_t sub_1A93ADBA8()
{
  return MEMORY[0x1F415D730]();
}

uint64_t sub_1A93ADBB8()
{
  return MEMORY[0x1F415D768]();
}

uint64_t sub_1A93ADBC8()
{
  return MEMORY[0x1F415D770]();
}

uint64_t sub_1A93ADBD8()
{
  return MEMORY[0x1F415D778]();
}

uint64_t sub_1A93ADBE8()
{
  return MEMORY[0x1F415D780]();
}

uint64_t sub_1A93ADBF8()
{
  return MEMORY[0x1F415D790]();
}

uint64_t sub_1A93ADC08()
{
  return MEMORY[0x1F415D7A0]();
}

uint64_t sub_1A93ADC18()
{
  return MEMORY[0x1F415D7A8]();
}

uint64_t sub_1A93ADC28()
{
  return MEMORY[0x1F415D7C0]();
}

uint64_t sub_1A93ADC38()
{
  return MEMORY[0x1F415D7E8]();
}

uint64_t sub_1A93ADC48()
{
  return MEMORY[0x1F415D7F8]();
}

uint64_t sub_1A93ADC58()
{
  return MEMORY[0x1F415D818]();
}

uint64_t sub_1A93ADC68()
{
  return MEMORY[0x1F415D838]();
}

uint64_t sub_1A93ADC78()
{
  return MEMORY[0x1F41695D8]();
}

uint64_t sub_1A93ADC88()
{
  return MEMORY[0x1F415D850]();
}

uint64_t sub_1A93ADC98()
{
  return MEMORY[0x1F415D878]();
}

uint64_t sub_1A93ADCA8()
{
  return MEMORY[0x1F41695E0]();
}

uint64_t sub_1A93ADCB8()
{
  return MEMORY[0x1F41695E8]();
}

uint64_t sub_1A93ADCC8()
{
  return MEMORY[0x1F415D888]();
}

uint64_t sub_1A93ADCD8()
{
  return MEMORY[0x1F415D8A0]();
}

uint64_t sub_1A93ADCE8()
{
  return MEMORY[0x1F415D8A8]();
}

uint64_t sub_1A93ADCF8()
{
  return MEMORY[0x1F415D8D0]();
}

uint64_t sub_1A93ADD08()
{
  return MEMORY[0x1F415D8F8]();
}

uint64_t sub_1A93ADD18()
{
  return MEMORY[0x1F40F1EA0]();
}

uint64_t sub_1A93ADD28()
{
  return MEMORY[0x1F40F1EB8]();
}

uint64_t sub_1A93ADD38()
{
  return MEMORY[0x1F40F1EC8]();
}

uint64_t sub_1A93ADD48()
{
  return MEMORY[0x1F40F1EE0]();
}

uint64_t sub_1A93ADD58()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A93ADD68()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1A93ADD78()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A93ADD98()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1A93ADDA8()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A93ADDB8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A93ADDC8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A93ADDD8()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1A93ADDE8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A93ADDF8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A93ADE08()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A93ADE18()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A93ADE28()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1A93ADE38()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A93ADE48()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A93ADE58()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A93ADE68()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A93ADE78()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A93ADE88()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A93ADE98()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1A93ADEA8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A93ADEB8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A93ADEC8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1A93ADED8()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1A93ADEE8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A93ADEF8()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1A93ADF08()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A93ADF18()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1A93ADF28()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A93ADF48()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A93ADF58()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A93ADF68()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A93ADF78()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A93ADF88()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1A93ADFA8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A93ADFB8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A93ADFC8()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1A93ADFD8()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_1A93AE038()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1A93AE058()
{
  return MEMORY[0x1F4184368]();
}

uint64_t sub_1A93AE068()
{
  return MEMORY[0x1F4184370]();
}

uint64_t sub_1A93AE078()
{
  return MEMORY[0x1F4184378]();
}

uint64_t sub_1A93AE098()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1A93AE0A8()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A93AE0B8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A93AE0C8()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1A93AE0D8()
{
  return MEMORY[0x1F4184470]();
}

uint64_t sub_1A93AE0E8()
{
  return MEMORY[0x1F4169600]();
}

uint64_t sub_1A93AE108()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1A93AE118()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A93AE128()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A93AE148()
{
  return MEMORY[0x1F4169640]();
}

uint64_t sub_1A93AE158()
{
  return MEMORY[0x1F4169650]();
}

uint64_t sub_1A93AE168()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A93AE178()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A93AE188()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A93AE198()
{
  return MEMORY[0x1F40E6BD0]();
}

uint64_t sub_1A93AE1A8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1A93AE1B8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A93AE1C8()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1A93AE1D8()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1A93AE1E8()
{
  return MEMORY[0x1F4184A80]();
}

uint64_t sub_1A93AE1F8()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1A93AE218()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A93AE228()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A93AE238()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A93AE248()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A93AE258()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A93AE268()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A93AE278()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A93AE288()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A93AE298()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1A93AE2A8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A93AE2B8()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1A93AE2C8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A93AE2D8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A93AE2E8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A93AE2F8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A93AE308()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A93AE318()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A93AE328()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A93AE338()
{
  return MEMORY[0x1F415F1A0]();
}

uint64_t sub_1A93AE348()
{
  return MEMORY[0x1F415F1A8]();
}

uint64_t sub_1A93AE358()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A93AE368()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A93AE378()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A93AE388()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A93AE398()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1A93AE3A8()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1A93AE3B8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A93AE3C8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A93AE3D8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A93AE3E8()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A93AE3F8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A93AE408()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A93AE418()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A93AE428()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A93AE438()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A93AE448()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1A93AE458()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1A93AE468()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A93AE478()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A93AE488()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A93AE498()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A93AE4A8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A93AE4B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A93AE4C8()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1A93AE4E8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A93AE4F8()
{
  return MEMORY[0x1F4169660]();
}

uint64_t sub_1A93AE508()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A93AE518()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A93AE528()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A93AE538()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A93AE548()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A93AE558()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A93AE568()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A93AE578()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A93AE588()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1A93AE598()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1A93AE5A8()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1A93AE5B8()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1A93AE5C8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A93AE5D8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A93AE5E8()
{
  return MEMORY[0x1F41861A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1F411C6C8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x1F4186400]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x1F4186408]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}