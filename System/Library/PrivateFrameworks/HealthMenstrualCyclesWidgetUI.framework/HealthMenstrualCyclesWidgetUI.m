uint64_t sub_251100E68()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidget()
{
  return &type metadata for MenstrualCyclesWidget;
}

unint64_t sub_251100E9C()
{
  unint64_t result = qword_26B215F68;
  if (!qword_26B215F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B215F68);
  }
  return result;
}

id sub_251100EF0()
{
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B2163A0 = (uint64_t)result;
  return result;
}

uint64_t MenstrualCyclesWidgetEntry.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2511260A0();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MenstrualCyclesWidgetEntry.dayIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 20);
  uint64_t v4 = sub_2511267E0();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntry(uint64_t a1)
{
  return sub_25110117C(a1, (uint64_t *)&unk_26B215F78);
}

uint64_t MenstrualCyclesWidgetEntry.dayIndex.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 20);
  uint64_t v4 = sub_2511267E0();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*MenstrualCyclesWidgetEntry.dayIndex.modify())()
{
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.pregnancyState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return sub_251105278(v1 + *(int *)(v3 + 24), a1, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntry.State(uint64_t a1)
{
  return sub_25110117C(a1, (uint64_t *)&unk_26B216080);
}

uint64_t sub_25110117C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *MenstrualCyclesWidgetEntry.projection.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 28));
  id v2 = v1;
  return v1;
}

void MenstrualCyclesWidgetEntry.projection.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 28);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*MenstrualCyclesWidgetEntry.projection.modify())()
{
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.relevance.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return sub_251105278(v1 + *(int *)(v3 + 32), a1, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
}

void sub_2511012C4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_251126A70();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t MenstrualCyclesWidgetEntry.relevance.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 32);
  return sub_25110135C(a1, v3);
}

uint64_t sub_25110135C(uint64_t a1, uint64_t a2)
{
  sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MenstrualCyclesWidgetEntry.relevance.modify())()
{
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 36));
}

uint64_t MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.modify())()
{
  return nullsub_1;
}

BOOL MenstrualCyclesWidgetEntry.hasFlow.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 36));
  if (v1[1]) {
    return 0;
  }
  uint64_t v3 = *v1;
  return v3 == sub_2511267D0();
}

uint64_t MenstrualCyclesWidgetEntry.init(date:dayIndex:pregnancyState:projection:relevance:lastMenstrualFlowDayIndex:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v14 = v13[7];
  uint64_t v15 = a8 + v13[8];
  uint64_t v16 = sub_2511268C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = a8 + v13[9];
  *(void *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 8) = 1;
  uint64_t v18 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(a8, a1, v18);
  uint64_t v19 = a8 + v13[5];
  uint64_t v20 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v19, a2, v20);
  sub_2511016B0(a3, a8 + v13[6]);
  *(void *)(a8 + v14) = a4;
  uint64_t result = sub_25110135C(a5, v15);
  *(void *)uint64_t v17 = a6;
  *(unsigned char *)(v17 + 8) = a7 & 1;
  return result;
}

uint64_t sub_2511016B0(uint64_t a1, uint64_t a2)
{
  sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_251101730@<X0>(void *a1@<X0>, double *a2@<X8>)
{
  sub_2511012C4(0, &qword_26B215FC8, MEMORY[0x263F062D0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (void (*)(char *, uint64_t))((char *)&v24 - v5);
  sub_2511012C4(0, &qword_26B215FD0, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v24 - v8;
  if (objc_msgSend(a1, sel_state) == (id)1
    && (id v10 = objc_msgSend(a1, sel_sample)) != 0)
  {
    v11 = v10;
    id v12 = v10;
    id v13 = objc_msgSend(a1, sel_estimatedDueDate);
    if (v13)
    {
      uint64_t v14 = v13;
      sub_251126080();

      uint64_t v15 = sub_2511260A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 0, 1, v15);
    }
    else
    {
      uint64_t v19 = sub_2511260A0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
    }
    id v20 = objc_msgSend(a1, sel_pregnancyDuration);
    if (v20)
    {
      v21 = v20;
      sub_251125F00();

      uint64_t v22 = sub_251125F30();
      (*(void (**)(void (*)(char *, uint64_t), void, uint64_t, uint64_t))(*(void *)(v22 - 8)
                                                                                             + 56))(v6, 0, 1, v22);
    }
    else
    {
      uint64_t v23 = sub_251125F30();
      (*(void (**)(void (*)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8)
                                                                                              + 56))(v6, 1, 1, v23);
    }
    sub_251101A74(v11, v9, v6, a2);

    sub_25110521C((uint64_t)v6, &qword_26B215FC8, MEMORY[0x263F062D0]);
    return sub_25110521C((uint64_t)v9, &qword_26B215FD0, MEMORY[0x263F07490]);
  }
  else
  {

    sub_251102AA4();
    uint64_t v17 = *(uint64_t (**)(double *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    return v17(a2, 1, 1, v16);
  }
}

uint64_t sub_251101A74@<X0>(void *a1@<X0>, void *a2@<X1>, void (*a3)(char *, uint64_t)@<X2>, double *a4@<X8>)
{
  v67 = a3;
  id v71 = a2;
  v72 = a4;
  uint64_t v64 = sub_251126100();
  uint64_t v59 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v60 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2511261C0();
  MEMORY[0x270FA5388](v6 - 8);
  v61 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2511267E0();
  MEMORY[0x270FA5388](v8 - 8);
  v62 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_251126220();
  uint64_t v65 = *(void *)(v10 - 8);
  uint64_t v66 = v10;
  MEMORY[0x270FA5388](v10);
  v63 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511012C4(0, &qword_26B215FC8, MEMORY[0x263F062D0]);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v58 - v13;
  uint64_t v15 = sub_251125F30();
  uint64_t v69 = *(void *)(v15 - 8);
  uint64_t v70 = v15;
  MEMORY[0x270FA5388](v15);
  v68 = (char *)v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511012C4(0, &qword_26B215FD0, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v58 - v18;
  uint64_t v20 = sub_2511260A0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v27 = (char *)v58 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  v30 = (char *)v58 - v29;
  MEMORY[0x270FA5388](v28);
  v32 = (char *)v58 - v31;
  if (!a1) {
    goto LABEL_7;
  }
  v33 = a1;
  sub_251105278((uint64_t)v71, (uint64_t)v19, &qword_26B215FD0, MEMORY[0x263F07490]);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    v34 = &qword_26B215FD0;
    v35 = (void (*)(uint64_t))MEMORY[0x263F07490];
    uint64_t v36 = (uint64_t)v19;
LABEL_6:
    sub_25110521C(v36, v34, v35);
LABEL_7:
    sub_251102AA4();
    return (*(uint64_t (**)(double *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v72, 1, 1, v39);
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v32, v19, v20);
  sub_251105278((uint64_t)v67, (uint64_t)v14, &qword_26B215FC8, MEMORY[0x263F062D0]);
  uint64_t v38 = v69;
  uint64_t v37 = v70;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v14, 1, v70) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v32, v20);
    v34 = &qword_26B215FC8;
    v35 = (void (*)(uint64_t))MEMORY[0x263F062D0];
    uint64_t v36 = (uint64_t)v14;
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v68, v14, v37);
  id v71 = v33;
  id v41 = objc_msgSend(v71, sel_startDate);
  sub_251126080();

  sub_251126050();
  double v43 = v42;
  v44 = *(void (**)(char *, uint64_t))(v21 + 8);
  v58[1] = v21 + 8;
  v67 = v44;
  v44(v30, v20);
  sub_251125F20();
  double v46 = v45 / v43;
  sub_251126090();
  v58[0] = *(void *)(v21 + 16);
  ((void (*)(char *, char *, uint64_t))v58[0])(v27, v30, v20);
  uint64_t v48 = v59;
  v47 = v60;
  uint64_t v49 = v64;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v60, *MEMORY[0x263F07740], v64);
  sub_251126110();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  sub_2511267C0();
  v50 = (void (*)(char *, char *, uint64_t))v58[0];
  ((void (*)(char *, char *, uint64_t))v58[0])(v27, v32, v20);
  v50(v24, v30, v20);
  id v51 = v71;
  v52 = v63;
  sub_2511261E0();
  v53 = v67;
  v67(v30, v20);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v70);
  v53(v32, v20);
  sub_251102AA4();
  uint64_t v55 = v54;
  v56 = v72;
  v57 = (char *)v72 + *(int *)(v54 + 64);
  *(void *)v72 = v51;
  v56[1] = v46;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v57, v52, v66);
  return (*(uint64_t (**)(double *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v56, 0, 1, v55);
}

uint64_t sub_2511021F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2511260A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_251102260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_251105278(v2 + *(int *)(a1 + 32), a2, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
}

uint64_t _s29HealthMenstrualCyclesWidgetUI0bcD5EntryV5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_251126220();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v42 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v41 = (char *)&v39 - v8;
  uint64_t v9 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (double *)((char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2511052E4();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (uint64_t)&v15[*(int *)(v13 + 56)];
  sub_251105348(a1, (uint64_t)v15);
  sub_251105348(a2, v16);
  sub_251102AA4();
  uint64_t v18 = v17;
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  if (v19((uint64_t)v15, 1, v17) == 1)
  {
    char v20 = 1;
    int v21 = v19(v16, 1, v18);
    uint64_t v22 = type metadata accessor for MenstrualCyclesWidgetEntry.State;
    if (v21 == 1) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  uint64_t v40 = v5;
  sub_251105348((uint64_t)v15, (uint64_t)v11);
  uint64_t v23 = *(void **)v11;
  double v24 = v11[1];
  uint64_t v25 = *(int *)(v18 + 64);
  uint64_t v26 = (char *)v11 + v25;
  if (v19(v16, 1, v18) != 1)
  {
    v27 = *(void **)v16;
    double v28 = *(double *)(v16 + 8);
    uint64_t v29 = (char *)(v16 + v25);
    uint64_t v30 = v40;
    uint64_t v31 = v41;
    v32 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
    v32(v41, v26, v4);
    v32(v42, v29, v4);
    sub_25110540C(0, &qword_26B216148);
    char v33 = sub_251126A60();

    if (v33)
    {
      if (v24 == v28)
      {
        v34 = v42;
        char v20 = MEMORY[0x253395910](v31, v42);
        v35 = *(void (**)(char *, uint64_t))(v40 + 8);
        v35(v34, v4);
        v35(v31, v4);
LABEL_13:
        uint64_t v22 = type metadata accessor for MenstrualCyclesWidgetEntry.State;
        goto LABEL_14;
      }
      uint64_t v37 = *(void (**)(char *, uint64_t))(v40 + 8);
      v37(v42, v4);
      v37(v31, v4);
    }
    else
    {
      uint64_t v36 = *(void (**)(char *, uint64_t))(v30 + 8);
      v36(v42, v4);
      v36(v31, v4);
    }
    char v20 = 0;
    goto LABEL_13;
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))((char *)v11 + v25, v4);

LABEL_6:
  char v20 = 0;
  uint64_t v22 = (uint64_t (*)(void))sub_2511052E4;
LABEL_14:
  sub_2511053AC((uint64_t)v15, v22);
  return v20 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntry(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2511260A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2511267E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (void **)((char *)a1 + v12);
    uint64_t v14 = (void **)((char *)a2 + v12);
    uint64_t v15 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      sub_251102AA4();
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v21 + 48))(v14, 1, v19))
      {
        memcpy(v13, v14, *(void *)(v16 + 64));
      }
      else
      {
        uint64_t v22 = v14[1];
        id v41 = *v14;
        int *v13 = *v14;
        v13[1] = v22;
        uint64_t v23 = *(int *)(v20 + 64);
        double v42 = (char *)v14 + v23;
        double v43 = (char *)v13 + v23;
        uint64_t v24 = sub_251126220();
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
        id v25 = v41;
        v40(v43, v42, v24);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v21 + 56))(v13, 0, 1, v20);
      }
      (*(void (**)(void **, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v26 = a3[7];
    uint64_t v27 = a3[8];
    double v28 = *(void **)((char *)a2 + v26);
    *(uint64_t *)((char *)a1 + v26) = (uint64_t)v28;
    uint64_t v29 = (char *)a1 + v27;
    uint64_t v30 = (char *)a2 + v27;
    uint64_t v31 = sub_2511268C0();
    uint64_t v32 = *(void *)(v31 - 8);
    char v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
    id v34 = v28;
    if (v33(v30, 1, v31))
    {
      sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
      memcpy(v29, v30, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
    }
    uint64_t v36 = a3[9];
    uint64_t v37 = (char *)a1 + v36;
    uint64_t v38 = (char *)a2 + v36;
    *(void *)uint64_t v37 = *(void *)v38;
    v37[8] = v38[8];
  }
  return a1;
}

void sub_251102AA4()
{
  if (!qword_26B216130)
  {
    sub_25110540C(255, &qword_26B216138);
    sub_251126220();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_26B216130);
    }
  }
}

uint64_t destroy for MenstrualCyclesWidgetEntry(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (id *)(a1 + a2[6]);
  uint64_t v8 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    sub_251102AA4();
    uint64_t v10 = v9;
    if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9))
    {

      uint64_t v11 = (char *)v7 + *(int *)(v10 + 64);
      uint64_t v12 = sub_251126220();
      (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
    }
  }

  uint64_t v13 = a1 + a2[8];
  uint64_t v14 = sub_2511268C0();
  uint64_t v17 = *(void *)(v14 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v13, 1, v14);
  if (!result)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8);
    return v16(v13, v14);
  }
  return result;
}

uint64_t initializeWithCopy for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)(a1 + v11);
  uint64_t v13 = (void **)(a2 + v11);
  uint64_t v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(void *)(v15 + 64));
    }
    else
    {
      uint64_t v20 = v13[1];
      uint64_t v39 = *v13;
      *uint64_t v12 = *v13;
      v12[1] = v20;
      uint64_t v21 = *(int *)(v18 + 64);
      uint64_t v40 = (char *)v13 + v21;
      id v41 = (char *)v12 + v21;
      uint64_t v22 = sub_251126220();
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
      id v23 = v39;
      v38(v41, v40, v22);
      (*(void (**)(void **, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
    }
    (*(void (**)(void **, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v24 = a3[7];
  uint64_t v25 = a3[8];
  uint64_t v26 = *(void **)(a2 + v24);
  *(void *)(a1 + v24) = v26;
  uint64_t v27 = (void *)(a1 + v25);
  double v28 = (const void *)(a2 + v25);
  uint64_t v29 = sub_2511268C0();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48);
  id v32 = v26;
  if (v31(v28, 1, v29))
  {
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    memcpy(v27, v28, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v30 + 16))(v27, v28, v29);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  uint64_t v34 = a3[9];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)uint64_t v35 = *(void *)v36;
  *(unsigned char *)(v35 + 8) = *(unsigned char *)(v36 + 8);
  return a1;
}

uint64_t assignWithCopy for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)(a1 + v11);
  uint64_t v13 = (void **)(a2 + v11);
  uint64_t v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      sub_251102AA4();
      uint64_t v25 = v24;
      uint64_t v67 = *(void *)(v24 - 8);
      uint64_t v26 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v67 + 48);
      int v27 = v26(v12, 1, v24);
      int v28 = v26(v13, 1, v25);
      if (v27)
      {
        if (!v28)
        {
          uint64_t v29 = *v13;
          *uint64_t v12 = *v13;
          v12[1] = v13[1];
          uint64_t v30 = *(int *)(v25 + 64);
          uint64_t v31 = (char *)v12 + v30;
          uint64_t v65 = (char *)v13 + v30;
          uint64_t v32 = sub_251126220();
          uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
          id v34 = v29;
          v33(v31, v65, v32);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v67 + 56))(v12, 0, 1, v25);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v28)
        {
          v56 = *v13;
          v57 = *v12;
          *uint64_t v12 = *v13;
          id v58 = v56;

          v12[1] = v13[1];
          uint64_t v59 = *(int *)(v25 + 64);
          v60 = (char *)v12 + v59;
          v61 = (char *)v13 + v59;
          uint64_t v62 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 24))(v60, v61, v62);
          goto LABEL_14;
        }
        sub_2511053AC((uint64_t)v12, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v23 = *(void *)(v15 + 64);
LABEL_8:
      memcpy(v12, v13, v23);
      goto LABEL_14;
    }
    sub_2511053AC((uint64_t)v12, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_7:
    sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    size_t v23 = *(void *)(*(void *)(v22 - 8) + 64);
    goto LABEL_8;
  }
  if (v18) {
    goto LABEL_7;
  }
  sub_251102AA4();
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v21 + 48))(v13, 1, v19))
  {
    memcpy(v12, v13, *(void *)(v15 + 64));
  }
  else
  {
    v68 = *v13;
    *uint64_t v12 = *v13;
    v12[1] = v13[1];
    uint64_t v35 = *(int *)(v20 + 64);
    uint64_t v64 = (char *)v13 + v35;
    uint64_t v66 = (char *)v12 + v35;
    uint64_t v36 = sub_251126220();
    v63 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
    id v37 = v68;
    v63(v66, v64, v36);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_14:
  uint64_t v38 = a3[7];
  uint64_t v39 = *(void **)(a1 + v38);
  uint64_t v40 = *(void **)(a2 + v38);
  *(void *)(a1 + v38) = v40;
  id v41 = v40;

  uint64_t v42 = a3[8];
  double v43 = (void *)(a1 + v42);
  v44 = (void *)(a2 + v42);
  uint64_t v45 = sub_2511268C0();
  uint64_t v46 = *(void *)(v45 - 8);
  v47 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v46 + 48);
  int v48 = v47(v43, 1, v45);
  int v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(void *, void *, uint64_t))(v46 + 24))(v43, v44, v45);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    memcpy(v43, v44, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_20:
  uint64_t v51 = a3[9];
  uint64_t v52 = a1 + v51;
  v53 = (uint64_t *)(a2 + v51);
  uint64_t v54 = *v53;
  *(unsigned char *)(v52 + 8) = *((unsigned char *)v53 + 8);
  *(void *)uint64_t v52 = v54;
  return a1;
}

uint64_t initializeWithTake for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(void *)(v15 + 64));
    }
    else
    {
      uint64_t v20 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v20;
      uint64_t v21 = *(int *)(v18 + 64);
      uint64_t v22 = (char *)v12 + v21;
      size_t v23 = (char *)v13 + v21;
      uint64_t v24 = sub_251126220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v25 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v26 = (void *)(a1 + v25);
  int v27 = (const void *)(a2 + v25);
  uint64_t v28 = sub_2511268C0();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  uint64_t v31 = a3[9];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  return a1;
}

uint64_t assignWithTake for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)(a1 + v11);
  uint64_t v13 = (void **)(a2 + v11);
  uint64_t v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      sub_251102AA4();
      uint64_t v25 = v24;
      uint64_t v59 = *(void *)(v24 - 8);
      uint64_t v26 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v59 + 48);
      int v27 = v26(v12, 1, v24);
      int v28 = v26(v13, 1, v25);
      if (v27)
      {
        if (!v28)
        {
          uint64_t v29 = v13[1];
          *uint64_t v12 = *v13;
          v12[1] = v29;
          uint64_t v30 = *(int *)(v25 + 64);
          uint64_t v31 = (char *)v12 + v30;
          uint64_t v32 = (char *)v13 + v30;
          uint64_t v33 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v59 + 56))(v12, 0, 1, v25);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v28)
        {
          uint64_t v54 = *v12;
          *uint64_t v12 = *v13;

          v12[1] = v13[1];
          uint64_t v55 = *(int *)(v25 + 64);
          v56 = (char *)v12 + v55;
          v57 = (char *)v13 + v55;
          uint64_t v58 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 40))(v56, v57, v58);
          goto LABEL_14;
        }
        sub_2511053AC((uint64_t)v12, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v23 = *(void *)(v15 + 64);
LABEL_8:
      memcpy(v12, v13, v23);
      goto LABEL_14;
    }
    sub_2511053AC((uint64_t)v12, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_7:
    sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    size_t v23 = *(void *)(*(void *)(v22 - 8) + 64);
    goto LABEL_8;
  }
  if (v18) {
    goto LABEL_7;
  }
  sub_251102AA4();
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v21 + 48))(v13, 1, v19))
  {
    memcpy(v12, v13, *(void *)(v15 + 64));
  }
  else
  {
    id v34 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v34;
    uint64_t v35 = *(int *)(v20 + 64);
    uint64_t v36 = (char *)v12 + v35;
    id v37 = (char *)v13 + v35;
    uint64_t v38 = sub_251126220();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_14:
  uint64_t v39 = a3[7];
  uint64_t v40 = *(void **)(a1 + v39);
  *(void *)(a1 + v39) = *(void *)(a2 + v39);

  uint64_t v41 = a3[8];
  uint64_t v42 = (void *)(a1 + v41);
  double v43 = (void *)(a2 + v41);
  uint64_t v44 = sub_2511268C0();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v45 + 48);
  int v47 = v46(v42, 1, v44);
  int v48 = v46(v43, 1, v44);
  if (!v47)
  {
    if (!v48)
    {
      (*(void (**)(void *, void *, uint64_t))(v45 + 40))(v42, v43, v44);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v45 + 8))(v42, v44);
    goto LABEL_19;
  }
  if (v48)
  {
LABEL_19:
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    memcpy(v42, v43, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v45 + 32))(v42, v43, v44);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
LABEL_20:
  uint64_t v50 = a3[9];
  uint64_t v51 = a1 + v50;
  uint64_t v52 = a2 + v50;
  *(void *)uint64_t v51 = *(void *)v52;
  *(unsigned char *)(v51 + 8) = *(unsigned char *)(v52 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2511040F8);
}

uint64_t sub_2511040F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2511260A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2511267E0();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  if (a2 == 2147483646)
  {
    unint64_t v16 = *(void *)(a1 + a3[7]);
    if (v16 >= 0xFFFFFFFF) {
      LODWORD(v16) = -1;
    }
    int v17 = v16 - 1;
    if (v17 < 0) {
      int v17 = -1;
    }
    return (v17 + 1);
  }
  else
  {
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a3[8];
    return v19(v21, a2, v20);
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25110431C);
}

void sub_25110431C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_2511260A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    v11(v12, a2, a2, v10);
    return;
  }
  uint64_t v13 = sub_2511267E0();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  sub_2511012C4(0, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_7;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[7]) = a2;
  }
  else
  {
    sub_2511012C4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a4[8];
    v18(v20, a2, a2, v19);
  }
}

void sub_251104520()
{
  sub_2511260A0();
  if (v0 <= 0x3F)
  {
    sub_2511267E0();
    if (v1 <= 0x3F)
    {
      sub_2511012C4(319, &qword_26B216090, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      if (v2 <= 0x3F)
      {
        sub_2511012C4(319, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

char *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntry.State(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    sub_251102AA4();
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v9 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v12 = *a2;
      uint64_t v11 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v11;
      uint64_t v13 = *(int *)(v8 + 64);
      uint64_t v14 = &a1[v13];
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_251126220();
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      uint64_t v18 = v12;
      v17(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
  }
  return a1;
}

uint64_t destroy for MenstrualCyclesWidgetEntry.State(id *a1)
{
  sub_251102AA4();
  uint64_t v3 = v2;
  uint64_t result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {

    int v5 = (char *)a1 + *(int *)(v3 + 64);
    uint64_t v6 = sub_251126220();
    uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  return result;
}

void **initializeWithCopy for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  sub_251102AA4();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v10 = *a2;
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v11 = *(int *)(v7 + 64);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_251126220();
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    id v16 = v10;
    v15(v12, v13, v14);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void **assignWithCopy for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  sub_251102AA4();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1, v6);
  int v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v20 = *a2;
      uint64_t v21 = *a1;
      *a1 = *a2;
      id v22 = v20;

      a1[1] = a2[1];
      uint64_t v23 = *(int *)(v7 + 64);
      uint64_t v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      uint64_t v26 = sub_251126220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
      return a1;
    }
    sub_2511053AC((uint64_t)a1, (uint64_t (*)(void))sub_251102AA4);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v12 = *a2;
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v13 = *(int *)(v7 + 64);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_251126220();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
  id v18 = v12;
  v17(v14, v15, v16);
  (*(void (**)(void **, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

void *initializeWithTake for MenstrualCyclesWidgetEntry.State(void *a1, void *a2, uint64_t a3)
{
  sub_251102AA4();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = *(int *)(v7 + 64);
    int v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_251126220();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void **assignWithTake for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  sub_251102AA4();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(a1, 1, v6);
  int v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      id v18 = *a1;
      *a1 = *a2;

      a1[1] = a2[1];
      uint64_t v19 = *(int *)(v7 + 64);
      uint64_t v20 = (char *)a1 + v19;
      uint64_t v21 = (char *)a2 + v19;
      uint64_t v22 = sub_251126220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
      return a1;
    }
    sub_2511053AC((uint64_t)a1, (uint64_t (*)(void))sub_251102AA4);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v12 = a2[1];
  *a1 = *a2;
  a1[1] = v12;
  uint64_t v13 = *(int *)(v7 + 64);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_251126220();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  (*(void (**)(void **, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntry.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_251104FA0);
}

uint64_t sub_251104FA0(uint64_t a1, uint64_t a2)
{
  sub_251102AA4();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntry.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251105020);
}

uint64_t sub_251105020(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  sub_251102AA4();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_2511050A0(uint64_t a1)
{
  sub_251102AA4();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_251105108(uint64_t a1, uint64_t a2)
{
  sub_251102AA4();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_251105178()
{
  uint64_t result = sub_251126220();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_25110521C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_2511012C4(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_251105278(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_2511012C4(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_2511052E4()
{
  if (!qword_269B21050)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry.State(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B21050);
    }
  }
}

uint64_t sub_251105348(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2511053AC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25110540C(uint64_t a1, unint64_t *a2)
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

uint64_t MenstrualCyclesWidgetTimelineProvider.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_251126100();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  uint64_t v7 = swift_allocObject();
  sub_2511261A0();
  uint64_t v8 = *MEMORY[0x263F07740];
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v9(v5, v8, v2);
  sub_251126110();
  int v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  *(void *)(v7 + 16) = v6;
  *a1 = v7;
  type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  v9(v5, v8, v2);
  sub_251126110();
  return ((uint64_t (*)(char *, uint64_t))v10)(v5, v2);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.placeholder(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v71 = a2;
  uint64_t v69 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x270FA5388](v69);
  uint64_t v70 = &v58[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25110AA64(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  v68 = &v58[-v8];
  sub_25110AA64(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v6);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v67 = &v58[-v10];
  uint64_t v11 = sub_2511261C0();
  uint64_t v64 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v63 = &v58[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v77 = sub_2511267E0();
  uint64_t v66 = *(void *)(v77 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v77);
  v72 = &v58[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  v75 = &v58[-v15];
  uint64_t v76 = sub_2511260A0();
  uint64_t v74 = *(void *)(v76 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v76);
  uint64_t v65 = &v58[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  v73 = &v58[-v18];
  uint64_t v19 = sub_2511268E0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = &v58[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = &v58[-v24];
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_251126270();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B2163B8);
  int v27 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v20 + 16);
  v27(v25, a1, v19);
  int v28 = sub_251126250();
  os_log_type_t v29 = sub_251126A30();
  int v30 = v29;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v61 = v11;
    uint64_t v32 = v31;
    uint64_t v60 = swift_slowAlloc();
    v79[0] = v60;
    *(_DWORD *)uint64_t v32 = 136446466;
    int v59 = v30;
    uint64_t v78 = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, v79);
    uint64_t v62 = v3;
    sub_251126A80();
    *(_WORD *)(v32 + 12) = 2082;
    v27(v23, (uint64_t)v25, v19);
    uint64_t v33 = sub_251126990();
    uint64_t v78 = sub_25110AB00(v33, v34, v79);
    uint64_t v3 = v62;
    sub_251126A80();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v25, v19);
    _os_log_impl(&dword_2510FF000, v28, (os_log_type_t)v59, "[%{public}s] Returning placeholder for context: %{public}s", (uint8_t *)v32, 0x16u);
    uint64_t v35 = v60;
    swift_arrayDestroy();
    MEMORY[0x253396800](v35, -1, -1);
    uint64_t v36 = v32;
    uint64_t v11 = v61;
    MEMORY[0x253396800](v36, -1, -1);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v25, v19);
  }

  id v37 = v73;
  sub_251126090();
  uint64_t v38 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v74 + 16);
  uint64_t v39 = v65;
  uint64_t v40 = v76;
  v38(v65, v37, v76);
  uint64_t v41 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v64 + 16))(v63, v3 + *(int *)(v41 + 24), v11);
  uint64_t v42 = v75;
  sub_2511267C0();
  v38(v39, v37, v40);
  uint64_t v43 = v66;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v66 + 16))(v72, v42, v77);
  uint64_t v44 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v45 = (uint64_t)v67;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v67, 1, 1, v44);
  uint64_t v46 = sub_2511268C0();
  int v47 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56);
  uint64_t v48 = (uint64_t)v68;
  v47(v68, 1, 1, v46);
  uint64_t v50 = (int *)v69;
  uint64_t v49 = (uint64_t)v70;
  uint64_t v64 = *(int *)(v69 + 28);
  uint64_t v51 = (uint64_t)&v70[*(int *)(v69 + 32)];
  v47((unsigned char *)v51, 1, 1, v46);
  uint64_t v52 = v49 + v50[9];
  *(void *)uint64_t v52 = 0;
  *(unsigned char *)(v52 + 8) = 1;
  uint64_t v53 = v74;
  uint64_t v54 = v39;
  uint64_t v55 = v76;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v74 + 32))(v49, v54, v76);
  uint64_t v56 = v77;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v43 + 32))(v49 + v50[5], v72, v77);
  sub_2511016B0(v45, v49 + v50[6]);
  *(void *)(v49 + v64) = 0;
  sub_25110135C(v48, v51);
  *(void *)uint64_t v52 = 0;
  *(unsigned char *)(v52 + 8) = 1;
  sub_25110B458(v49, v71, type metadata accessor for MenstrualCyclesWidgetEntry);
  (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v75, v56);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v53 + 8))(v73, v55);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.getSnapshot(in:completion:)(uint64_t a1, void (*a2)(unsigned char *), uint64_t a3)
{
  uint64_t v84 = a3;
  v83 = a2;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25110AA64(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v74 = &v65[-v6];
  sub_25110AA64(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v4);
  MEMORY[0x270FA5388](v7 - 8);
  v80 = &v65[-v8];
  uint64_t v71 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v9 = MEMORY[0x270FA5388](v71);
  v72 = &v65[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  v73 = &v65[-v11];
  uint64_t v12 = sub_251126840();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v70 = &v65[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  v89 = &v65[-v16];
  uint64_t v17 = sub_2511261C0();
  uint64_t v76 = *(void *)(v17 - 8);
  uint64_t v77 = v17;
  MEMORY[0x270FA5388](v17);
  v75 = &v65[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v90 = sub_2511267E0();
  uint64_t v19 = *(void *)(v90 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v90);
  uint64_t v78 = &v65[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v20);
  v88 = &v65[-v22];
  uint64_t v79 = sub_2511260A0();
  uint64_t v92 = *(void *)(v79 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v79);
  v91 = &v65[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v23);
  v87 = &v65[-v25];
  uint64_t v26 = sub_2511268E0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v69 = &v65[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = &v65[-v30];
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_251126270();
  __swift_project_value_buffer(v32, (uint64_t)qword_26B2163B8);
  uint64_t v33 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v86 = a1;
  v33(v31, a1, v26);
  unint64_t v34 = sub_251126250();
  os_log_type_t v35 = sub_251126A30();
  int v36 = v35;
  BOOL v37 = os_log_type_enabled(v34, v35);
  uint64_t v81 = v13;
  uint64_t v82 = v12;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    v94[0] = v67;
    *(_DWORD *)uint64_t v38 = 136446466;
    uint64_t v93 = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, v94);
    uint64_t v68 = v19;
    sub_251126A80();
    *(_WORD *)(v38 + 12) = 2082;
    int v66 = v36;
    v33(v69, (uint64_t)v31, v26);
    uint64_t v39 = sub_251126990();
    uint64_t v93 = sub_25110AB00(v39, v40, v94);
    uint64_t v19 = v68;
    uint64_t v12 = v82;
    sub_251126A80();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v31, v26);
    _os_log_impl(&dword_2510FF000, v34, (os_log_type_t)v66, "[%{public}s] Requesting snapshot for context: %{public}s", (uint8_t *)v38, 0x16u);
    uint64_t v41 = v67;
    swift_arrayDestroy();
    MEMORY[0x253396800](v41, -1, -1);
    uint64_t v42 = v38;
    uint64_t v13 = v81;
    MEMORY[0x253396800](v42, -1, -1);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v31, v26);
  }

  uint64_t v43 = (uint64_t)v87;
  sub_251126090();
  uint64_t v44 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v92 + 16);
  uint64_t v45 = v79;
  v44(v91, v43, v79);
  uint64_t v46 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v76 + 16))(v75, v85 + *(int *)(v46 + 24), v77);
  int v47 = v88;
  sub_2511267C0();
  uint64_t v48 = v89;
  sub_2511268D0();
  int v49 = (*(uint64_t (**)(unsigned char *, uint64_t))(v13 + 88))(v48, v12);
  if (v49 == *MEMORY[0x263F1FCD8] || v49 == *MEMORY[0x263F1FD08])
  {
    uint64_t v63 = (uint64_t)v70;
    sub_2511268D0();
    uint64_t v64 = swift_allocObject();
    *(void *)(v64 + 16) = v83;
    *(void *)(v64 + 24) = v84;
    swift_retain();
    sub_251119700(v43, v63, (uint64_t)sub_25110B1D0, v64);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v63, v12);
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v47, v90);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 8))(v43, v45);
  }
  else
  {
    v44(v91, v43, v45);
    uint64_t v50 = v19;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 16))(v78, v47, v90);
    uint64_t v51 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v80, 1, 1, v51);
    uint64_t v52 = sub_2511268C0();
    uint64_t v53 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56);
    uint64_t v54 = (uint64_t)v74;
    v53(v74, 1, 1, v52);
    uint64_t v55 = (int *)v71;
    uint64_t v86 = *(int *)(v71 + 28);
    uint64_t v56 = (uint64_t)v72;
    uint64_t v57 = (uint64_t)&v72[*(int *)(v71 + 32)];
    v53((unsigned char *)v57, 1, 1, v52);
    uint64_t v58 = v56 + v55[9];
    *(void *)uint64_t v58 = 0;
    *(unsigned char *)(v58 + 8) = 1;
    uint64_t v59 = v92;
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v92 + 32))(v56, v91, v45);
    uint64_t v60 = v90;
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v50 + 32))(v56 + v55[5], v78, v90);
    sub_2511016B0((uint64_t)v80, v56 + v55[6]);
    *(void *)(v56 + v86) = 0;
    sub_25110135C(v54, v57);
    *(void *)uint64_t v58 = 0;
    *(unsigned char *)(v58 + 8) = 1;
    uint64_t v61 = v73;
    sub_25110B458(v56, (uint64_t)v73, type metadata accessor for MenstrualCyclesWidgetEntry);
    v83(v61);
    sub_25110B528((uint64_t)v61, type metadata accessor for MenstrualCyclesWidgetEntry);
    (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v88, v60);
    (*(void (**)(unsigned char *, uint64_t))(v59 + 8))(v87, v45);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v81 + 8))(v89, v82);
  }
}

uint64_t sub_251106898(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  sub_25110AA64(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - v7;
  uint64_t v9 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_251126270();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B2163B8);
  sub_25110B4C0(a1, (uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
  uint64_t v13 = sub_251126250();
  os_log_type_t v14 = sub_251126A30();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = a2;
    uint64_t v17 = v16;
    uint64_t v27 = v16;
    *(_DWORD *)uint64_t v15 = 136446466;
    uint64_t v24 = a3;
    uint64_t v26 = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v27);
    uint64_t v23 = a1;
    sub_251126A80();
    *(_WORD *)(v15 + 12) = 2080;
    sub_25110BD3C((uint64_t)&v11[*(int *)(v9 + 32)], (uint64_t)v8, &qword_26B215FB8, MEMORY[0x263F1FDF0]);
    uint64_t v18 = sub_251126990();
    uint64_t v26 = sub_25110AB00(v18, v19, &v27);
    a1 = v23;
    sub_251126A80();
    swift_bridgeObjectRelease();
    sub_25110B528((uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
    _os_log_impl(&dword_2510FF000, v13, v14, "[%{public}s] Submitting entry with relevance: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    uint64_t v20 = v17;
    a2 = v25;
    MEMORY[0x253396800](v20, -1, -1);
    MEMORY[0x253396800](v15, -1, -1);
  }
  else
  {
    sub_25110B528((uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
  }

  return a2(a1);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.getTimeline(in:completion:)(uint64_t a1, void (*a2)(char *), void (*a3)(char *))
{
  v128 = a3;
  v127 = a2;
  uint64_t v4 = sub_2511268A0();
  MEMORY[0x270FA5388](v4 - 8);
  v123 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110B1D8();
  uint64_t v125 = v6;
  uint64_t v124 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v122 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25110AA64(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  v119 = (char *)&v106 - v10;
  sub_25110AA64(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v8);
  MEMORY[0x270FA5388](v11 - 8);
  v117 = (char *)&v106 - v12;
  uint64_t v121 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v118 = *(void *)(v121 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v121);
  v116 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v120 = (uint64_t)&v106 - v15;
  uint64_t v16 = sub_251126840();
  uint64_t v141 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v140 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2511261B0();
  uint64_t v134 = *(void *)(v18 - 8);
  uint64_t v135 = v18;
  MEMORY[0x270FA5388](v18);
  v132 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110AA64(0, &qword_26B215FD0, MEMORY[0x263F07490], v8);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v115 = (uint64_t)&v106 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v133 = (char *)&v106 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v150 = (uint64_t)&v106 - v25;
  uint64_t v131 = sub_2511261C0();
  uint64_t v130 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v129 = (char *)&v106 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_2511267E0();
  uint64_t v144 = *(void *)(v146 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v146);
  v136 = (char *)&v106 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v149 = (char *)&v106 - v29;
  uint64_t v30 = sub_2511260A0();
  uint64_t v31 = *(void **)(v30 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v111 = (char *)&v106 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v114 = (char *)&v106 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v139 = (char *)&v106 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v148 = (uint64_t)&v106 - v38;
  uint64_t v147 = sub_2511268E0();
  uint64_t v39 = *(void *)(v147 - 8);
  uint64_t v40 = MEMORY[0x270FA5388](v147);
  v126 = (char *)&v106 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v106 - v42;
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_251126270();
  __swift_project_value_buffer(v44, (uint64_t)qword_26B2163B8);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
  v45(v43, a1, v147);
  uint64_t v46 = sub_251126250();
  os_log_type_t v47 = sub_251126A30();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v145 = v30;
  v142 = v31;
  uint64_t v143 = v16;
  uint64_t v137 = a1;
  uint64_t v110 = v39;
  uint64_t v108 = v39 + 16;
  v107 = v45;
  if (v48)
  {
    uint64_t v49 = swift_slowAlloc();
    uint64_t v113 = swift_slowAlloc();
    uint64_t v152 = v113;
    *(_DWORD *)uint64_t v49 = 136446466;
    uint64_t v151 = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v152);
    sub_251126A80();
    *(_WORD *)(v49 + 12) = 2082;
    uint64_t v50 = (void (*)(char *, char *, uint64_t))v45;
    uint64_t v51 = v147;
    v50(v126, v43, v147);
    uint64_t v52 = sub_251126990();
    uint64_t v151 = sub_25110AB00(v52, v53, &v152);
    uint64_t v31 = v142;
    sub_251126A80();
    uint64_t v30 = v145;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v51);
    _os_log_impl(&dword_2510FF000, v46, v47, "[%{public}s] Requesting timeline for context: %{public}s", (uint8_t *)v49, 0x16u);
    uint64_t v54 = v113;
    swift_arrayDestroy();
    MEMORY[0x253396800](v54, -1, -1);
    MEMORY[0x253396800](v49, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v147);
  }

  uint64_t v55 = v148;
  sub_251126090();
  uint64_t v56 = (void (*)(char *, uint64_t, uint64_t))v31[2];
  uint64_t v113 = (uint64_t)(v31 + 2);
  v112 = v56;
  v56(v139, v55, v30);
  uint64_t v57 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v129, v138 + *(int *)(v57 + 24), v131);
  sub_2511267C0();
  uint64_t v58 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v31[7];
  v58(v150, 1, 1, v30);
  uint64_t v59 = v134;
  uint64_t v60 = v135;
  uint64_t v61 = v132;
  (*(void (**)(char *, void, uint64_t))(v134 + 104))(v132, *MEMORY[0x263F078A8], v135);
  uint64_t v62 = v133;
  sub_251126190();
  uint64_t v63 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v60);
  uint64_t v64 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v31[6];
  if (v64(v63, 1, v30) == 1)
  {
    sub_25110B3E8(v63, &qword_26B215FD0, MEMORY[0x263F07490]);
  }
  else
  {
    uint64_t v65 = v150;
    sub_25110B3E8(v150, &qword_26B215FD0, MEMORY[0x263F07490]);
    int v66 = (void (*)(char *, uint64_t, uint64_t))v31[4];
    uint64_t v67 = v114;
    v66(v114, v63, v30);
    v66((char *)v65, (uint64_t)v67, v30);
    v58(v65, 0, 1, v30);
  }
  uint64_t v68 = v143;
  uint64_t v69 = v140;
  uint64_t v70 = v137;
  sub_2511268D0();
  int v71 = (*(uint64_t (**)(char *, uint64_t))(v141 + 88))(v69, v68);
  if (v71 == *MEMORY[0x263F1FCD8] || v71 == *MEMORY[0x263F1FD08])
  {
    uint64_t v90 = v115;
    sub_25110BD3C(v150, v115, &qword_26B215FD0, MEMORY[0x263F07490]);
    uint64_t v91 = v145;
    unsigned int v92 = v64(v90, 1, v145);
    uint64_t v93 = v142;
    if (v92 == 1)
    {
      v94 = (uint64_t (*)(uint64_t))MEMORY[0x263F07490];
      sub_25110B3E8(v150, &qword_26B215FD0, MEMORY[0x263F07490]);
      (*(void (**)(char *, uint64_t))(v144 + 8))(v149, v146);
      ((void (*)(uint64_t, uint64_t))v93[1])(v148, v91);
      return sub_25110B3E8(v90, &qword_26B215FD0, v94);
    }
    else
    {
      uint64_t v95 = (uint64_t)v111;
      ((void (*)(char *, uint64_t, uint64_t))v142[4])(v111, v90, v91);
      v96 = v126;
      uint64_t v97 = v147;
      v107(v126, v70, v147);
      uint64_t v98 = v110;
      unint64_t v99 = (*(unsigned __int8 *)(v110 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
      unint64_t v100 = (v109 + v99 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v101 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v98 + 32))(v101 + v99, v96, v97);
      v102 = (void (**)(char *))(v101 + v100);
      v103 = v128;
      *v102 = v127;
      v102[1] = v103;
      swift_retain();
      uint64_t v104 = v148;
      sub_251115DD4(v148, v95, (uint64_t)sub_25110B33C, v101);
      swift_release();
      v105 = (void (*)(uint64_t, uint64_t))v93[1];
      v105(v95, v91);
      sub_25110B3E8(v150, &qword_26B215FD0, MEMORY[0x263F07490]);
      (*(void (**)(char *, uint64_t))(v144 + 8))(v149, v146);
      return ((uint64_t (*)(uint64_t, uint64_t))v105)(v104, v91);
    }
  }
  else
  {
    v72 = v139;
    uint64_t v73 = v145;
    v112(v139, v148, v145);
    (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v136, v149, v146);
    uint64_t v74 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    uint64_t v75 = (uint64_t)v117;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v117, 1, 1, v74);
    uint64_t v76 = sub_2511268C0();
    uint64_t v77 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56);
    uint64_t v78 = (uint64_t)v119;
    v77(v119, 1, 1, v76);
    uint64_t v79 = (int *)v121;
    uint64_t v147 = *(int *)(v121 + 28);
    uint64_t v80 = (uint64_t)v116;
    uint64_t v81 = (uint64_t)&v116[*(int *)(v121 + 32)];
    v77((char *)v81, 1, 1, v76);
    uint64_t v82 = v80 + v79[9];
    *(void *)uint64_t v82 = 0;
    *(unsigned char *)(v82 + 8) = 1;
    v83 = v142;
    ((void (*)(uint64_t, char *, uint64_t))v142[4])(v80, v72, v73);
    uint64_t v84 = v144;
    (*(void (**)(uint64_t, char *, uint64_t))(v144 + 32))(v80 + v79[5], v136, v146);
    sub_2511016B0(v75, v80 + v79[6]);
    *(void *)(v80 + v147) = 0;
    sub_25110135C(v78, v81);
    *(void *)uint64_t v82 = 0;
    *(unsigned char *)(v82 + 8) = 1;
    uint64_t v85 = v120;
    sub_25110B458(v80, v120, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_25110AA64(0, &qword_269B21068, type metadata accessor for MenstrualCyclesWidgetEntry, MEMORY[0x263F8E0F8]);
    unint64_t v86 = (*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_2511273D0;
    sub_25110B4C0(v85, v87 + v86, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_251126890();
    sub_25110B23C();
    v88 = v122;
    sub_2511268F0();
    v127(v88);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v88, v125);
    sub_25110B528(v85, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_25110B3E8(v150, &qword_26B215FD0, MEMORY[0x263F07490]);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v149, v146);
    ((void (*)(uint64_t, uint64_t))v83[1])(v148, v145);
    return (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v140, v143);
  }
}

uint64_t sub_251107D10(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v39 = a1;
  uint64_t v7 = sub_2511268A0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v36 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25110B1D8();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v35 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_2511268E0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v30[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v30[-v16];
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_251126270();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B2163B8);
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16);
  v19(v17, a2, v11);
  uint64_t v20 = sub_251126250();
  os_log_type_t v21 = sub_251126A30();
  int v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc();
    int v31 = v22;
    uint64_t v24 = v23;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v41 = v32;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v34 = a3;
    uint64_t v40 = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v41);
    uint64_t v33 = a4;
    sub_251126A80();
    *(_WORD *)(v24 + 12) = 2082;
    v19(v15, (uint64_t)v17, v11);
    uint64_t v25 = sub_251126990();
    uint64_t v40 = sub_25110AB00(v25, v26, &v41);
    a3 = v34;
    sub_251126A80();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v17, v11);
    _os_log_impl(&dword_2510FF000, v20, (os_log_type_t)v31, "[%{public}s] Returning timeline for context: %{public}s", (uint8_t *)v24, 0x16u);
    uint64_t v27 = v32;
    swift_arrayDestroy();
    MEMORY[0x253396800](v27, -1, -1);
    MEMORY[0x253396800](v24, -1, -1);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v17, v11);
  }

  swift_bridgeObjectRetain();
  sub_251126880();
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  sub_25110B23C();
  uint64_t v28 = v35;
  sub_2511268F0();
  a3(v28);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v37 + 8))(v28, v38);
}

uint64_t sub_251108138(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25110BEB8;
  return MenstrualCyclesWidgetTimelineProvider.relevances()(a1);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.relevances()(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_251126840();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_2511260A0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25110831C, 0, 0);
}

uint64_t sub_25110831C()
{
  uint64_t v17 = v0;
  if (qword_26B216108 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_251126270();
  v0[16] = __swift_project_value_buffer(v1, (uint64_t)qword_26B2163B8);
  uint64_t v2 = sub_251126250();
  os_log_type_t v3 = sub_251126A30();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = v5;
    *(_DWORD *)uint64_t v4 = 136446210;
    v0[5] = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v16);
    sub_251126A80();
    _os_log_impl(&dword_2510FF000, v2, v3, "[%{public}s] Fetching widget relevance", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253396800](v5, -1, -1);
    MEMORY[0x253396800](v4, -1, -1);
  }

  uint64_t v6 = v0[13];
  uint64_t v8 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v10 = v0[7];
  uint64_t v9 = v0[8];
  sub_251126090();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F1FD08], v9);
  uint64_t v11 = (void *)swift_task_alloc();
  v0[17] = v11;
  v11[2] = v10;
  v11[3] = v6;
  v11[4] = v7;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[18] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_2511085A4;
  uint64_t v14 = v0[14];
  uint64_t v13 = v0[15];
  return MEMORY[0x270FA2318](v13, 0, 0, 0xD00000000000001ALL, 0x8000000251128820, sub_25110B3DC, v11, v14);
}

uint64_t sub_2511085A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 104);
  uint64_t v2 = *(void *)(*(void *)v0 + 96);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  uint64_t v5 = *(void *)(*(void *)v0 + 72);
  uint64_t v6 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_25110877C, 0, 0);
}

uint64_t sub_25110877C()
{
  uint64_t v20 = v0;
  uint64_t v1 = MenstrualCyclesWidgetRelevanceProvider.widgetRelevances(_:)(v0[15]);
  uint64_t v2 = MEMORY[0x263F8EE60];
  if (v1)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_251126250();
    os_log_type_t v4 = sub_251126A30();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v19 = v6;
      *(_DWORD *)uint64_t v5 = 136446466;
      v0[3] = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v19);
      sub_251126A80();
      *(_WORD *)(v5 + 12) = 2082;
      sub_25110BE68(0, &qword_269B21078, v2 + 8, MEMORY[0x263F1FCA0]);
      uint64_t v8 = v7;
      uint64_t v9 = swift_bridgeObjectRetain();
      uint64_t v10 = MEMORY[0x2533960D0](v9, v8);
      unint64_t v12 = v11;
      swift_bridgeObjectRelease();
      v0[4] = sub_25110AB00(v10, v12, &v19);
      sub_251126A80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2510FF000, v3, v4, "[%{public}s] Returning widget relevances %{public}s", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253396800](v6, -1, -1);
      MEMORY[0x253396800](v5, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v3 = sub_251126250();
    os_log_type_t v13 = sub_251126A30();
    if (os_log_type_enabled(v3, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v19 = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      v0[2] = sub_25110AB00(0xD000000000000025, 0x80000002511273D0, &v19);
      sub_251126A80();
      _os_log_impl(&dword_2510FF000, v3, v13, "[%{public}s] No widget relevance", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253396800](v15, -1, -1);
      MEMORY[0x253396800](v14, -1, -1);
    }
  }

  uint64_t v16 = v0[15];
  sub_251126810();
  sub_25110B528(v16, type metadata accessor for MenstrualCyclesWidgetEntry);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_251108B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25110BEB8;
  return MEMORY[0x270F07728](a1, a2, a3);
}

uint64_t MenstrualCyclesWidgetRelevanceProvider.widgetRelevances(_:)(uint64_t a1)
{
  v153 = (void *)sub_2511260A0();
  uint64_t v151 = *(v153 - 1);
  MEMORY[0x270FA5388](v153);
  uint64_t v152 = (char *)&v141 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_2511267E0();
  uint64_t v160 = *(void *)(v155 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v155);
  uint64_t v147 = (char *)&v141 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v146 = (char *)&v141 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v144 = (char *)&v141 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v145 = (char *)&v141 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v143 = (char *)&v141 - v12;
  MEMORY[0x270FA5388](v11);
  v161 = (char *)&v141 - v13;
  uint64_t v14 = sub_251126100();
  uint64_t v149 = *(void *)(v14 - 8);
  uint64_t v150 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v141 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2511261C0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v163 = v17;
  uint64_t v164 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v148 = (char *)&v141 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v162 = (char *)&v141 - v21;
  uint64_t v156 = sub_251125ED0();
  uint64_t v159 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388](v156);
  v158 = (char *)&v141 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_251125EF0();
  MEMORY[0x270FA5388](v23 - 8);
  v157 = (char *)&v141 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110AA64(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v141 - v26;
  uint64_t v28 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (id *)((char *)&v141 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v141 - v33;
  uint64_t v35 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v36 = v35[6];
  uint64_t v154 = a1;
  sub_25110BD3C(a1 + v36, (uint64_t)v27, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    sub_25110B3E8((uint64_t)v27, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    if (HKShowSensitiveLogItems())
    {
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_251126270();
      __swift_project_value_buffer(v37, (uint64_t)qword_26B2163B8);
      uint64_t v38 = sub_251126250();
      os_log_type_t v39 = sub_251126A30();
      if (!os_log_type_enabled(v38, v39)) {
        goto LABEL_21;
      }
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v165[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
      sub_251126A80();
      uint64_t v42 = "[%s] WidgetEntry pregnancy state was nil. Returning no relevance entries";
    }
    else
    {
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v75 = sub_251126270();
      __swift_project_value_buffer(v75, (uint64_t)qword_26B2163B8);
      uint64_t v38 = sub_251126250();
      os_log_type_t v39 = sub_251126A30();
      if (!os_log_type_enabled(v38, v39)) {
        goto LABEL_21;
      }
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v165[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
      sub_251126A80();
      uint64_t v42 = "[%s] Returning no relevance entries";
    }
    _os_log_impl(&dword_2510FF000, v38, v39, v42, v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253396800](v41, -1, -1);
    MEMORY[0x253396800](v40, -1, -1);
LABEL_21:

    return 0;
  }
  sub_25110B458((uint64_t)v27, (uint64_t)v34, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  sub_25110B4C0((uint64_t)v34, (uint64_t)v32, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  sub_251102AA4();
  uint64_t v44 = v43;
  uint64_t v45 = (uint64_t)v32;
  if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v32, 1, v43) == 1)
  {
    uint64_t v47 = v149;
    uint64_t v46 = v150;
    (*(void (**)(char *, void, uint64_t))(v149 + 104))(v16, *MEMORY[0x263F07740], v150);
    BOOL v48 = v162;
    sub_251126110();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v46);
    uint64_t v49 = v154;
    (*(void (**)(char *, uint64_t, void *))(v151 + 16))(v152, v154, v153);
    (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v148, v48, v163);
    uint64_t v50 = v161;
    sub_2511267C0();
    uint64_t v51 = *(void **)(v49 + v35[7]);
    if (v51)
    {
      id v52 = v51;
      objc_msgSend(v52, sel_allDays);
      char v53 = sub_251126A40();
      uint64_t v54 = v160;
      uint64_t v55 = v155;
      v142 = v34;
      if (v53)
      {
        uint64_t v56 = (uint64_t *)(v49 + v35[9]);
        if ((v56[1] & 1) == 0)
        {
          uint64_t v57 = *v56;
          if (v57 == sub_2511267D0())
          {
            if (qword_26B216108 != -1) {
              swift_once();
            }
            uint64_t v58 = sub_251126270();
            __swift_project_value_buffer(v58, (uint64_t)qword_26B2163B8);
            uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
            v59(v143, v50, v55);
            uint64_t v60 = sub_251126250();
            os_log_type_t v61 = sub_251126A30();
            int v62 = v61;
            if (os_log_type_enabled(v60, v61))
            {
              uint64_t v63 = swift_slowAlloc();
              LODWORD(v159) = v62;
              uint64_t v64 = v63;
              v158 = (char *)swift_slowAlloc();
              v166[0] = (uint64_t)v158;
              *(_DWORD *)uint64_t v64 = 136446466;
              uint64_t v65 = v55;
              v165[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v166);
              sub_251126A80();
              *(_WORD *)(v64 + 12) = 2080;
              v157 = (char *)(v64 + 14);
              v153 = v52;
              int v66 = v145;
              v59(v145, v143, v55);
              v59(v144, v66, v55);
              sub_251126B90();
              id v67 = (id)HKSensitiveLogItem();
              swift_unknownObjectRelease();
              sub_251126AA0();
              swift_unknownObjectRelease();
              uint64_t v68 = sub_251126990();
              uint64_t v69 = v45;
              unint64_t v71 = v70;
              v72 = *(void (**)(char *, uint64_t))(v54 + 8);
              v72(v66, v65);
              v165[0] = sub_25110AB00(v68, v71, v166);
              sub_251126A80();
              uint64_t v45 = v69;
              swift_bridgeObjectRelease();
              v72(v143, v65);
              _os_log_impl(&dword_2510FF000, v60, (os_log_type_t)v159, "[%{public}s].WidgetRelevances: User has a log for entry:%s Returning no relevance", (uint8_t *)v64, 0x16u);
              uint64_t v73 = v158;
              swift_arrayDestroy();
              MEMORY[0x253396800](v73, -1, -1);
              MEMORY[0x253396800](v64, -1, -1);

              v72(v161, v65);
              (*(void (**)(char *, uint64_t))(v164 + 8))(v162, v163);
              uint64_t v74 = (uint64_t)v142;
            }
            else
            {

              v140 = *(void (**)(char *, uint64_t))(v54 + 8);
              v140(v143, v55);

              v140(v50, v55);
              (*(void (**)(char *, uint64_t))(v164 + 8))(v162, v163);
              uint64_t v74 = (uint64_t)v34;
            }
            sub_25110B528(v74, type metadata accessor for MenstrualCyclesWidgetEntry.State);
            uint64_t v134 = v45;
            goto LABEL_50;
          }
        }
        int v124 = HKShowSensitiveLogItems();
        v153 = v52;
        if (v124)
        {
          if (qword_26B216108 != -1) {
            swift_once();
          }
          uint64_t v125 = sub_251126270();
          __swift_project_value_buffer(v125, (uint64_t)qword_26B2163B8);
          v126 = sub_251126250();
          os_log_type_t v127 = sub_251126A30();
          if (!os_log_type_enabled(v126, v127)) {
            goto LABEL_58;
          }
          v128 = (uint8_t *)swift_slowAlloc();
          uint64_t v129 = swift_slowAlloc();
          v165[0] = v129;
          *(_DWORD *)v128 = 136315138;
          v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
          uint64_t v55 = v155;
          sub_251126A80();
          uint64_t v130 = "[%s].WidgetRelevances: Current day is a projected light red or dark red day and the user has not logged"
                 " yet. Returning relevance entries";
        }
        else
        {
          if (qword_26B216108 != -1) {
            swift_once();
          }
          uint64_t v136 = sub_251126270();
          __swift_project_value_buffer(v136, (uint64_t)qword_26B2163B8);
          v126 = sub_251126250();
          os_log_type_t v127 = sub_251126A30();
          if (!os_log_type_enabled(v126, v127)) {
            goto LABEL_58;
          }
          v128 = (uint8_t *)swift_slowAlloc();
          uint64_t v129 = swift_slowAlloc();
          v165[0] = v129;
          *(_DWORD *)v128 = 136315138;
          v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
          uint64_t v55 = v155;
          sub_251126A80();
          uint64_t v130 = "[%s] Returning relevance entries";
        }
        _os_log_impl(&dword_2510FF000, v126, v127, v130, v128, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253396800](v129, -1, -1);
        MEMORY[0x253396800](v128, -1, -1);
LABEL_58:

        uint64_t v137 = v156;
        sub_25110B588();
        sub_25110BE68(0, &qword_269B21078, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
        uint64_t v85 = swift_allocObject();
        *(_OWORD *)(v85 + 16) = xmmword_2511273E0;
        uint64_t v138 = v158;
        sub_251125EB0();
        sub_251125EE0();
        v139 = *(void (**)(char *, uint64_t))(v159 + 8);
        v139(v138, v137);
        sub_251126830();
        sub_251125EC0();
        sub_251125EE0();
        v139(v138, v137);
        sub_251126830();

        (*(void (**)(char *, uint64_t))(v160 + 8))(v161, v55);
        (*(void (**)(char *, uint64_t))(v164 + 8))(v162, v163);
        sub_25110B528((uint64_t)v142, type metadata accessor for MenstrualCyclesWidgetEntry.State);
        sub_25110B528(v45, type metadata accessor for MenstrualCyclesWidgetEntry.State);
        return v85;
      }
      uint64_t v159 = v45;
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v105 = sub_251126270();
      __swift_project_value_buffer(v105, (uint64_t)qword_26B2163B8);
      uint64_t v106 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
      v107 = v146;
      v106(v146, v50, v55);
      id v108 = v52;
      uint64_t v109 = sub_251126250();
      os_log_type_t v110 = sub_251126A30();
      int v111 = v110;
      if (os_log_type_enabled(v109, v110))
      {
        uint64_t v112 = swift_slowAlloc();
        LODWORD(v158) = v111;
        uint64_t v113 = v112;
        v157 = (char *)swift_slowAlloc();
        v166[0] = (uint64_t)v157;
        *(_DWORD *)uint64_t v113 = 136446722;
        v165[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v166);
        sub_251126A80();
        *(_WORD *)(v113 + 12) = 2080;
        uint64_t v156 = v113 + 14;
        v114 = v145;
        v106(v145, v107, v55);
        v106(v144, v114, v55);
        sub_251126B90();
        id v115 = (id)HKSensitiveLogItem();
        swift_unknownObjectRelease();
        sub_251126AA0();
        swift_unknownObjectRelease();
        uint64_t v116 = sub_251126990();
        unint64_t v118 = v117;
        v119 = *(void (**)(char *, uint64_t))(v54 + 8);
        v119(v114, v55);
        v165[0] = sub_25110AB00(v116, v118, v166);
        sub_251126A80();
        swift_bridgeObjectRelease();
        v119(v146, v55);
        *(_WORD *)(v113 + 22) = 2080;
        id v120 = (id)HKSensitiveLogItem();
        sub_251126AA0();
        swift_unknownObjectRelease();
        uint64_t v121 = sub_251126990();
        v165[0] = sub_25110AB00(v121, v122, v166);
        sub_251126A80();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510FF000, v109, (os_log_type_t)v158, "[%{public}s].WidgetRelevances: Current entry:%s Conditions for relevances were not met. Returning no relevance entries. Projection : %s", (uint8_t *)v113, 0x20u);
        v123 = v157;
        swift_arrayDestroy();
        MEMORY[0x253396800](v123, -1, -1);
        MEMORY[0x253396800](v113, -1, -1);

        v119(v161, v55);
      }
      else
      {

        v133 = *(void (**)(char *, uint64_t))(v54 + 8);
        v133(v107, v55);

        v133(v50, v55);
      }
    }
    else
    {
      uint64_t v159 = v45;
      uint64_t v89 = v160;
      uint64_t v90 = v155;
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v91 = sub_251126270();
      __swift_project_value_buffer(v91, (uint64_t)qword_26B2163B8);
      unsigned int v92 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
      uint64_t v93 = v147;
      v92(v147, v50, v90);
      v94 = sub_251126250();
      os_log_type_t v95 = sub_251126A00();
      if (!os_log_type_enabled(v94, v95))
      {

        uint64_t v131 = *(void (**)(char *, uint64_t))(v89 + 8);
        v131(v93, v90);
        v131(v50, v90);
        (*(void (**)(char *, uint64_t))(v164 + 8))(v162, v163);
        uint64_t v132 = (uint64_t)v34;
LABEL_49:
        sub_25110B528(v132, type metadata accessor for MenstrualCyclesWidgetEntry.State);
        uint64_t v134 = v159;
LABEL_50:
        sub_25110B528(v134, type metadata accessor for MenstrualCyclesWidgetEntry.State);
        return 0;
      }
      uint64_t v96 = swift_slowAlloc();
      v158 = (char *)swift_slowAlloc();
      v166[0] = (uint64_t)v158;
      *(_DWORD *)uint64_t v96 = 136315394;
      v165[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v166);
      sub_251126A80();
      *(_WORD *)(v96 + 12) = 2080;
      v157 = (char *)(v96 + 14);
      uint64_t v97 = v93;
      uint64_t v98 = v145;
      v92(v145, v97, v90);
      v92(v144, v98, v90);
      sub_251126B90();
      id v99 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_251126AA0();
      swift_unknownObjectRelease();
      uint64_t v100 = sub_251126990();
      unint64_t v102 = v101;
      v142 = v34;
      v103 = *(void (**)(char *, uint64_t))(v89 + 8);
      v103(v98, v90);
      v165[0] = sub_25110AB00(v100, v102, v166);
      sub_251126A80();
      swift_bridgeObjectRelease();
      v103(v147, v90);
      _os_log_impl(&dword_2510FF000, v94, v95, "[%s].WidgetRelevances: Current entry:%s has no projection", (uint8_t *)v96, 0x16u);
      uint64_t v104 = v158;
      swift_arrayDestroy();
      MEMORY[0x253396800](v104, -1, -1);
      MEMORY[0x253396800](v96, -1, -1);

      v103(v161, v90);
    }
    (*(void (**)(char *, uint64_t))(v164 + 8))(v162, v163);
    uint64_t v132 = (uint64_t)v142;
    goto LABEL_49;
  }

  if (HKShowSensitiveLogItems())
  {
    if (qword_26B216108 != -1) {
      swift_once();
    }
    uint64_t v76 = sub_251126270();
    __swift_project_value_buffer(v76, (uint64_t)qword_26B2163B8);
    uint64_t v77 = sub_251126250();
    os_log_type_t v78 = sub_251126A30();
    if (!os_log_type_enabled(v77, v78)) {
      goto LABEL_32;
    }
    uint64_t v79 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v165[0] = v80;
    *(_DWORD *)uint64_t v79 = 136315138;
    v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
    sub_251126A80();
    uint64_t v81 = "[%s] Pregnancy state is ongoing. Returning relevance entries";
  }
  else
  {
    if (qword_26B216108 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_251126270();
    __swift_project_value_buffer(v82, (uint64_t)qword_26B2163B8);
    uint64_t v77 = sub_251126250();
    os_log_type_t v78 = sub_251126A30();
    if (!os_log_type_enabled(v77, v78)) {
      goto LABEL_32;
    }
    uint64_t v79 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v165[0] = v80;
    *(_DWORD *)uint64_t v79 = 136315138;
    v166[0] = sub_25110AB00(0xD000000000000026, 0x8000000251127400, v165);
    sub_251126A80();
    uint64_t v81 = "[%s] Returning relevance entries";
  }
  _os_log_impl(&dword_2510FF000, v77, v78, v81, v79, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x253396800](v80, -1, -1);
  MEMORY[0x253396800](v79, -1, -1);
LABEL_32:

  uint64_t v83 = v156;
  uint64_t v84 = (char *)v32 + *(int *)(v44 + 64);
  sub_25110B588();
  sub_25110BE68(0, &qword_269B21078, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = xmmword_2511273E0;
  unint64_t v86 = v158;
  sub_251125EB0();
  sub_251125EE0();
  uint64_t v87 = *(void (**)(char *, uint64_t))(v159 + 8);
  v87(v86, v83);
  sub_251126830();
  sub_251125EC0();
  sub_251125EE0();
  v87(v86, v83);
  sub_251126830();
  sub_25110B528((uint64_t)v34, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  uint64_t v88 = sub_251126220();
  (*(void (**)(char *, uint64_t))(*(void *)(v88 - 8) + 8))(v84, v88);
  return v85;
}

uint64_t sub_25110A68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25110BBD4();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_251119700(a3, a4, (uint64_t)sub_25110BCCC, v12);
  return swift_release();
}

uint64_t sub_25110A7E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25110B4C0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MenstrualCyclesWidgetEntry);
  sub_25110BBD4();
  return sub_2511269E0();
}

uint64_t sub_25110A88C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25110A924;
  return MenstrualCyclesWidgetTimelineProvider.relevances()(a1);
}

uint64_t sub_25110A924()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetTimelineProvider()
{
  uint64_t result = qword_26B215FD8;
  if (!qword_26B215FD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25110AA64(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25110AB00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25110ABD4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25110BE0C((uint64_t)v12, *a3);
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
      sub_25110BE0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25110ABD4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_251126A90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25110AD90(a5, a6);
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
  uint64_t v8 = sub_251126B00();
  if (!v8)
  {
    sub_251126B10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_251126B40();
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

uint64_t sub_25110AD90(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25110AE28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25110B028(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25110B028(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25110AE28(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25110AFA0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_251126AE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_251126B10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2511269B0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_251126B40();
    __break(1u);
LABEL_14:
    uint64_t result = sub_251126B10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25110AFA0(uint64_t a1, uint64_t a2)
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
  sub_25110BE68(0, &qword_269B210A0, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25110B028(char a1, int64_t a2, char a3, char *a4)
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
    sub_25110BE68(0, &qword_269B210A0, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  uint64_t result = sub_251126B40();
  __break(1u);
  return result;
}

uint64_t sub_25110B198()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25110B1D0(uint64_t a1)
{
  return sub_251106898(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

void sub_25110B1D8()
{
  if (!qword_269B21058)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(255);
    sub_25110B23C();
    unint64_t v0 = sub_251126900();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21058);
    }
  }
}

unint64_t sub_25110B23C()
{
  unint64_t result = qword_269B21060;
  if (!qword_269B21060)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21060);
  }
  return result;
}

uint64_t sub_25110B294()
{
  uint64_t v1 = sub_2511268E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_25110B33C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2511268E0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4;
  uint64_t v6 = v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  int64_t v7 = *(void (**)(void))v6;
  uint64_t v8 = *(void *)(v6 + 8);
  return sub_251107D10(a1, v5, v7, v8);
}

uint64_t sub_25110B3DC(uint64_t a1)
{
  return sub_25110A68C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_25110B3E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_25110AA64(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_25110B458(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25110B4C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25110B528(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_25110B588()
{
  if (!qword_269B21080[0])
  {
    sub_25110BE68(255, &qword_269B21078, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
    unint64_t v0 = sub_251126B60();
    if (!v1) {
      atomic_store(v0, qword_269B21080);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetTimelineProvider(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 24);
    int64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_2511261C0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for MenstrualCyclesWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2511261C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for MenstrualCyclesWidgetTimelineProvider(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2511261C0();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

void *assignWithCopy for MenstrualCyclesWidgetTimelineProvider(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2511261C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *initializeWithTake for MenstrualCyclesWidgetTimelineProvider(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2511261C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for MenstrualCyclesWidgetTimelineProvider(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2511261C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetTimelineProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25110B9B0);
}

uint64_t sub_25110B9B0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2511261C0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    size_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetTimelineProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25110BA74);
}

void *sub_25110BA74(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2511261C0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25110BB1C()
{
  uint64_t result = sub_2511261C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetRelevanceProvider()
{
  return &type metadata for MenstrualCyclesWidgetRelevanceProvider;
}

void sub_25110BBD4()
{
  if (!qword_26B216128)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(255);
    unint64_t v0 = sub_2511269F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B216128);
    }
  }
}

uint64_t sub_25110BC3C()
{
  sub_25110BBD4();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25110BCCC(uint64_t a1)
{
  sub_25110BBD4();
  return sub_25110A7E4(a1);
}

uint64_t sub_25110BD3C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_25110AA64(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25110BE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_25110BE68(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_25110BEBC()
{
  uint64_t v1 = sub_251126430();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id result = objc_msgSend(self, sel_sharedBehavior);
  if (result)
  {
    uint64_t v6 = result;
    unsigned int v7 = objc_msgSend(result, sel_isAppleWatch);

    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
    if (v7)
    {
      sub_2511263D0();
      sub_251114F64(&qword_269B21328, MEMORY[0x263F1FB28]);
      sub_251126440();
      uint64_t v8 = v9[15];
    }
    else
    {
      uint64_t v8 = 0;
    }
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MenstrualCyclesWidgetRectangularView.body.getter()
{
  uint64_t v1 = MEMORY[0x263F06EA8];
  uint64_t v2 = MEMORY[0x263F8D8F0];
  sub_2511150AC(0, &qword_269B210A8, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v12 - v4;
  sub_25110C224();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = sub_2511267B0();
  v8[1] = v9;
  sub_25110E5A4();
  sub_25110DD98(v0, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_251126040();
  sub_251114F64(&qword_269B212D8, (void (*)(uint64_t))sub_25110C224);
  sub_251126650();
  sub_251113818((uint64_t)v5, (uint64_t)&qword_269B210A8, v1, v2, (uint64_t (*)(void))sub_2511150AC);
  return sub_25110E650((uint64_t)v8, (uint64_t (*)(void))sub_25110C224);
}

void sub_25110C224()
{
  if (!qword_269B210B0)
  {
    sub_251114FAC(255, &qword_269B210B8, (uint64_t (*)(uint64_t))sub_25110C2CC, (uint64_t (*)(uint64_t))sub_25110D200, MEMORY[0x263F19B28]);
    sub_25110DBB8();
    unint64_t v0 = sub_251126780();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B210B0);
    }
  }
}

void sub_25110C2CC()
{
  if (!qword_269B210C0)
  {
    sub_25110C39C(255);
    sub_25110DB04(&qword_269B21200, sub_25110C39C, (void (*)(void))sub_25110D1CC);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B210C0);
    }
  }
}

void sub_25110C39C(uint64_t a1)
{
}

void sub_25110C3C4(uint64_t a1)
{
}

void sub_25110C400(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), unint64_t *a4, void (*a5)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_251114F64(a4, a5);
    unint64_t v8 = sub_251126770();
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_25110C494(uint64_t a1)
{
}

void sub_25110C4C8()
{
  if (!qword_269B210E0)
  {
    sub_25110C558();
    sub_25110C85C();
    sub_25110CBEC();
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_269B210E0);
    }
  }
}

void sub_25110C558()
{
  if (!qword_269B210E8)
  {
    sub_25110C620();
    sub_25110CFE4(&qword_269B21110, (void (*)(uint64_t))sub_25110C620, (void (*)(void))sub_25110C6CC, (void (*)(void))sub_25110C7D8);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B210E8);
    }
  }
}

void sub_25110C620()
{
  if (!qword_269B210F0)
  {
    sub_25110D9B0(255, &qword_269B210F8, &qword_269B21100, MEMORY[0x263F8EF38]);
    sub_25110D6F8(255, &qword_269B21108, MEMORY[0x263F1B440], MEMORY[0x263F1B420], MEMORY[0x263F1A180]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B210F0);
    }
  }
}

unint64_t sub_25110C6CC()
{
  unint64_t result = qword_269B21118;
  if (!qword_269B21118)
  {
    sub_25110D9B0(255, &qword_269B210F8, &qword_269B21100, MEMORY[0x263F8EF38]);
    sub_25110C75C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21118);
  }
  return result;
}

unint64_t sub_25110C75C()
{
  unint64_t result = qword_269B21120;
  if (!qword_269B21120)
  {
    sub_25110CBA0(255, &qword_269B21100, MEMORY[0x263F8EF38], MEMORY[0x263F1A418]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21120);
  }
  return result;
}

unint64_t sub_25110C7D8()
{
  unint64_t result = qword_269B21128;
  if (!qword_269B21128)
  {
    sub_25110D6F8(255, &qword_269B21108, MEMORY[0x263F1B440], MEMORY[0x263F1B420], MEMORY[0x263F1A180]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21128);
  }
  return result;
}

void sub_25110C85C()
{
  if (!qword_269B21130)
  {
    sub_25110C8E8();
    sub_25110CBA0(255, &qword_269B21100, MEMORY[0x263F8EF38], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21130);
    }
  }
}

void sub_25110C8E8()
{
  if (!qword_269B21138)
  {
    sub_25110C968();
    sub_25110CB34(255, &qword_269B21178, &qword_269B21180, MEMORY[0x263F8D6C8]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21138);
    }
  }
}

void sub_25110C968()
{
  if (!qword_269B21140)
  {
    sub_25110C9F4();
    sub_25110CBA0(255, &qword_269B21170, MEMORY[0x263F18968], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21140);
    }
  }
}

void sub_25110C9F4()
{
  if (!qword_269B21148)
  {
    sub_25110CA88();
    sub_25110D6F8(255, &qword_269B21108, MEMORY[0x263F1B440], MEMORY[0x263F1B420], MEMORY[0x263F1A180]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21148);
    }
  }
}

void sub_25110CA88()
{
  if (!qword_269B21150)
  {
    sub_25110D6F8(255, &qword_269B21158, MEMORY[0x263F1A830], MEMORY[0x263F18C18], MEMORY[0x263F18E28]);
    sub_25110CB34(255, &qword_269B21160, &qword_269B21168, MEMORY[0x263F1A738]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21150);
    }
  }
}

void sub_25110CB34(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_25110CBA0(255, a3, a4, MEMORY[0x263F8D8F0]);
    unint64_t v5 = sub_251126530();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_25110CBA0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_25110CBEC()
{
  if (!qword_269B21188)
  {
    sub_25110CCB4();
    sub_25110CFE4(&qword_269B211D8, (void (*)(uint64_t))sub_25110CCB4, (void (*)(void))sub_25110CF9C, (void (*)(void))sub_25110C75C);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B21188);
    }
  }
}

void sub_25110CCB4()
{
  if (!qword_269B21190)
  {
    sub_25110CD40(255);
    sub_25110CBA0(255, &qword_269B21100, MEMORY[0x263F8EF38], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21190);
    }
  }
}

void sub_25110CD40(uint64_t a1)
{
}

void sub_25110CD88(uint64_t a1)
{
}

void sub_25110CDB0()
{
  if (!qword_269B211A8)
  {
    sub_25110CEB4();
    sub_251126230();
    sub_251114F64(&qword_269B211B8, (void (*)(uint64_t))sub_25110CEB4);
    sub_251114F64(&qword_269B211C0, MEMORY[0x263F45240]);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B211A8);
    }
  }
}

void sub_25110CEB4()
{
  if (!qword_269B211B0)
  {
    unint64_t v0 = sub_251126730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B211B0);
    }
  }
}

void sub_25110CF34(uint64_t a1)
{
}

void sub_25110CF68(uint64_t a1)
{
}

uint64_t sub_25110CF9C()
{
  return sub_25110CFE4(&qword_269B211E0, sub_25110CD40, (void (*)(void))sub_25110D070, (void (*)(void))sub_25110D198);
}

uint64_t sub_25110CFE4(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25110D070()
{
  unint64_t result = qword_269B211E8;
  if (!qword_269B211E8)
  {
    sub_25110CD88(255);
    sub_25110CEB4();
    sub_251126230();
    sub_251114F64(&qword_269B211B8, (void (*)(uint64_t))sub_25110CEB4);
    sub_251114F64(&qword_269B211C0, MEMORY[0x263F45240]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B211E8);
  }
  return result;
}

uint64_t sub_25110D198()
{
  return sub_251114F64(&qword_269B211F0, sub_25110CF34);
}

uint64_t sub_25110D1CC()
{
  return sub_251114F64(&qword_269B21208, sub_25110C3C4);
}

void sub_25110D200()
{
  if (!qword_269B21210)
  {
    sub_25110D308();
    sub_25110D3D8(255);
    sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B21210);
    }
  }
}

void sub_25110D308()
{
  if (!qword_269B21218)
  {
    sub_25110D3D8(255);
    sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B21218);
    }
  }
}

void sub_25110D3D8(uint64_t a1)
{
}

void sub_25110D400(uint64_t a1)
{
}

void sub_25110D43C(uint64_t a1)
{
}

void sub_25110D470()
{
  if (!qword_269B21238)
  {
    sub_251114FAC(255, &qword_269B21240, (uint64_t (*)(uint64_t))sub_25110D58C, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    sub_25110DA24(255, &qword_269B21280, (void (*)(uint64_t))sub_25110D88C);
    sub_25110DA24(255, &qword_269B212A0, (void (*)(uint64_t))sub_25110DA88);
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_269B21238);
    }
  }
}

void sub_25110D58C()
{
  if (!qword_269B21248)
  {
    sub_25110D610();
    sub_25110D748();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B21248);
    }
  }
}

void sub_25110D610()
{
  if (!qword_269B21250)
  {
    sub_25110D66C();
    unint64_t v0 = sub_2511264E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21250);
    }
  }
}

void sub_25110D66C()
{
  if (!qword_269B21258)
  {
    sub_25110D6F8(255, (unint64_t *)&qword_269B21260, MEMORY[0x263F1B570], MEMORY[0x263F19900], MEMORY[0x263F18E28]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21258);
    }
  }
}

void sub_25110D6F8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_25110D748()
{
  unint64_t result = qword_269B21268;
  if (!qword_269B21268)
  {
    sub_25110D610();
    sub_25110DB04(&qword_269B21270, (void (*)(uint64_t))sub_25110D66C, (void (*)(void))sub_25110D7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21268);
  }
  return result;
}

unint64_t sub_25110D7F0()
{
  unint64_t result = qword_269B21278;
  if (!qword_269B21278)
  {
    sub_25110D6F8(255, (unint64_t *)&qword_269B21260, MEMORY[0x263F1B570], MEMORY[0x263F19900], MEMORY[0x263F18E28]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21278);
  }
  return result;
}

void sub_25110D88C()
{
  if (!qword_269B21288)
  {
    sub_25110D918();
    sub_25110CBA0(255, &qword_269B21100, MEMORY[0x263F8EF38], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21288);
    }
  }
}

void sub_25110D918()
{
  if (!qword_269B21290)
  {
    sub_25110D9B0(255, &qword_269B21298, &qword_269B21170, MEMORY[0x263F18968]);
    sub_25110CB34(255, &qword_269B21178, &qword_269B21180, MEMORY[0x263F8D6C8]);
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21290);
    }
  }
}

void sub_25110D9B0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_25110CBA0(255, a3, a4, MEMORY[0x263F1A418]);
    unint64_t v5 = sub_2511262F0();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_25110DA24(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2511262F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_25110DA88()
{
  if (!qword_269B212A8)
  {
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B212A8);
    }
  }
}

uint64_t sub_25110DB04(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25110DB84()
{
  return sub_251114F64(&qword_269B212C0, sub_25110D400);
}

unint64_t sub_25110DBB8()
{
  unint64_t result = qword_269B212C8;
  if (!qword_269B212C8)
  {
    sub_251114FAC(255, &qword_269B210B8, (uint64_t (*)(uint64_t))sub_25110C2CC, (uint64_t (*)(uint64_t))sub_25110D200, MEMORY[0x263F19B28]);
    sub_25110C39C(255);
    sub_25110DB04(&qword_269B21200, sub_25110C39C, (void (*)(void))sub_25110D1CC);
    swift_getOpaqueTypeConformance2();
    sub_25110D308();
    sub_25110D3D8(255);
    sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B212C8);
  }
  return result;
}

uint64_t sub_25110DD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  sub_25110D200();
  uint64_t v65 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251114FAC(0, &qword_269B21330, (uint64_t (*)(uint64_t))sub_25110C2CC, (uint64_t (*)(uint64_t))sub_25110D200, MEMORY[0x263F19B20]);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v57 - v8;
  sub_25110C2CC();
  uint64_t v64 = v10;
  uint64_t v62 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v61 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_251126220();
  uint64_t v60 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))((char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x263F8D8F0];
  sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (id *)((char *)v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v57 - v18;
  uint64_t v20 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_251115744(a1 + *(int *)(v20 + 36), (uint64_t)v19, (uint64_t)&qword_26B216090, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, v13, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_2511150AC);
  uint64_t v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v19, 1, v21);
  int v66 = v19;
  if (v22 != 1)
  {
    sub_251115744((uint64_t)v19, (uint64_t)v17, (uint64_t)&qword_26B216090, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_2511150AC);
    sub_251102AA4();
    uint64_t v24 = v23;
    if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v17, 1, v23) != 1)
    {
      id v58 = *v17;
      uint64_t v40 = (uint64_t)v58;
      uint64_t v42 = v59;
      uint64_t v41 = v60;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))((char *)v59, (char *)v17 + *(int *)(v24 + 64), v63);
      uint64_t v43 = v61;
      sub_25110E6CC(v40, v42);
      uint64_t v44 = v62;
      uint64_t v45 = v64;
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v9, v43, v64);
      swift_storeEnumTagMultiPayload();
      sub_25110C39C(255);
      uint64_t v47 = v46;
      uint64_t v48 = sub_25110DB04(&qword_269B21200, sub_25110C39C, (void (*)(void))sub_25110D1CC);
      uint64_t v68 = v47;
      uint64_t v69 = MEMORY[0x263F18C68];
      v57[1] = v9;
      uint64_t v49 = MEMORY[0x263F18C60];
      uint64_t v70 = v48;
      uint64_t v71 = MEMORY[0x263F18C60];
      swift_getOpaqueTypeConformance2();
      sub_25110D308();
      uint64_t v51 = v50;
      sub_25110D3D8(255);
      uint64_t v53 = v52;
      uint64_t v54 = sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
      uint64_t v68 = v53;
      uint64_t v69 = MEMORY[0x263F18C68];
      uint64_t v70 = v54;
      uint64_t v71 = v49;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      uint64_t v68 = v51;
      uint64_t v69 = OpaqueTypeConformance2;
      swift_getOpaqueTypeConformance2();
      sub_2511264D0();

      (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
      (*(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v41 + 8))(v42, v63);
      return sub_251113818((uint64_t)v66, (uint64_t)&qword_26B216090, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2511150AC);
    }
    sub_25110E650((uint64_t)v17, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  }
  uint64_t v25 = v6;
  sub_25110E9B4((uint64_t)v6);
  uint64_t v26 = v4;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v28 = v65;
  v27(v9, v6, v65);
  swift_storeEnumTagMultiPayload();
  sub_25110C39C(255);
  uint64_t v30 = v29;
  uint64_t v31 = sub_25110DB04(&qword_269B21200, sub_25110C39C, (void (*)(void))sub_25110D1CC);
  uint64_t v32 = MEMORY[0x263F18C68];
  uint64_t v68 = v30;
  uint64_t v69 = MEMORY[0x263F18C68];
  uint64_t v33 = MEMORY[0x263F18C60];
  uint64_t v70 = v31;
  uint64_t v71 = MEMORY[0x263F18C60];
  swift_getOpaqueTypeConformance2();
  sub_25110D308();
  uint64_t v35 = v34;
  sub_25110D3D8(255);
  uint64_t v37 = v36;
  uint64_t v38 = sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
  uint64_t v68 = v37;
  uint64_t v69 = v32;
  uint64_t v70 = v38;
  uint64_t v71 = v33;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v68 = v35;
  uint64_t v69 = v39;
  swift_getOpaqueTypeConformance2();
  sub_2511264D0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v28);
  return sub_251113818((uint64_t)v66, (uint64_t)&qword_26B216090, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2511150AC);
}

void sub_25110E5A4()
{
  if (!qword_269B212D0)
  {
    sub_251114FAC(255, &qword_269B210B8, (uint64_t (*)(uint64_t))sub_25110C2CC, (uint64_t (*)(uint64_t))sub_25110D200, MEMORY[0x263F19B28]);
    unint64_t v0 = sub_2511262C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B212D0);
    }
  }
}

uint64_t sub_25110E650(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25110E6B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25110E6CC(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_251126520();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110C3C4(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110C39C(0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = sub_251126480();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  sub_251115030(0, &qword_269B21338, sub_25110C494);
  sub_251110744(v3, a1, a2, &v12[*(int *)(v16 + 44)]);
  uint64_t v17 = sub_2511267A0();
  sub_251110570(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, INFINITY, 0, v17, v18, (void (*)(uint64_t, uint64_t))sub_251115094, (uint64_t (*)(void))sub_25110C39C);
  sub_25110E650((uint64_t)v12, (uint64_t (*)(void))sub_25110C3C4);
  sub_251126510();
  sub_25110DB04(&qword_269B21200, sub_25110C39C, (void (*)(void))sub_25110D1CC);
  sub_2511266D0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_25110E650((uint64_t)v15, (uint64_t (*)(void))sub_25110C39C);
}

uint64_t sub_25110E9B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v32 = sub_251126500();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v29 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_251126520();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110D400(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110D3D8(0);
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110D308();
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_251126480();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 0;
  sub_251115030(0, &qword_269B21360, sub_25110D43C);
  sub_25110F22C(v2, (uint64_t)&v9[*(int *)(v19 + 44)]);
  uint64_t v20 = sub_2511267A0();
  sub_251110570(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0, v20, v21, (void (*)(uint64_t, uint64_t))sub_251115550, (uint64_t (*)(void))sub_25110D3D8);
  sub_25110E650((uint64_t)v9, (uint64_t (*)(void))sub_25110D400);
  sub_251126510();
  uint64_t v22 = sub_25110DB04(&qword_269B212B8, sub_25110D3D8, (void (*)(void))sub_25110DB84);
  uint64_t v23 = MEMORY[0x263F18C68];
  uint64_t v24 = MEMORY[0x263F18C60];
  sub_2511266D0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  sub_25110E650((uint64_t)v13, (uint64_t (*)(void))sub_25110D3D8);
  uint64_t v25 = v29;
  sub_2511264F0();
  uint64_t v33 = v11;
  uint64_t v34 = v23;
  uint64_t v35 = v22;
  uint64_t v36 = v24;
  swift_getOpaqueTypeConformance2();
  sub_2511266E0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_25110EDFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_251126740();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_251126840();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  int v12 = *MEMORY[0x263F1FCD8];
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
  uint64_t v13 = sub_251126750();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2511267B0();
  sub_2511262B0();
  uint64_t v25 = v13;
  long long v26 = xmmword_2511274D0;
  uint64_t v27 = v39;
  uint64_t v28 = v40;
  uint64_t v29 = v41;
  uint64_t v30 = v42;
  long long v31 = v43;
  if (a1 == v12)
  {
    char v32 = 0;
    sub_25110D66C();
    sub_25110DB04(&qword_269B21270, (void (*)(uint64_t))sub_25110D66C, (void (*)(void))sub_25110D7F0);
    uint64_t result = sub_2511264D0();
    long long v15 = v33;
    long long v16 = v34;
    long long v17 = v35;
    long long v18 = v36;
    uint64_t v19 = v37;
    char v20 = v38;
  }
  else
  {
    char v32 = 1;
    sub_25110D66C();
    sub_25110DB04(&qword_269B21270, (void (*)(uint64_t))sub_25110D66C, (void (*)(void))sub_25110D7F0);
    sub_2511264D0();
    long long v24 = v33;
    long long v23 = v34;
    long long v22 = v35;
    long long v21 = v36;
    uint64_t v19 = v37;
    char v20 = v38;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    long long v18 = v21;
    long long v17 = v22;
    long long v16 = v23;
    long long v15 = v24;
  }
  *(_OWORD *)a2 = v15;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v18;
  *(void *)(a2 + 64) = v19;
  *(unsigned char *)(a2 + 72) = v20;
  return result;
}

uint64_t sub_25110F22C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v174 = a2;
  sub_25110DA88();
  uint64_t v170 = *(void *)(v3 - 8);
  uint64_t v171 = v3;
  MEMORY[0x270FA5388](v3);
  v169 = (char *)v150 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110DA24(0, &qword_269B212A0, (void (*)(uint64_t))sub_25110DA88);
  uint64_t v168 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v173 = (uint64_t)v150 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v167 = (char *)v150 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v172 = (uint64_t)v150 - v10;
  uint64_t v185 = sub_2511262D0();
  uint64_t v188 = *(void *)(v185 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v185);
  v184 = (char *)v150 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v183 = (uint64_t)v150 - v13;
  uint64_t v14 = sub_2511265D0();
  uint64_t KeyPath = *(void *)(v14 - 8);
  uint64_t v179 = v14;
  MEMORY[0x270FA5388](v14);
  v177 = (char *)v150 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511150AC(0, &qword_269B21340, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v16 - 8);
  v181 = (char *)v150 - v17;
  uint64_t v182 = sub_2511265F0();
  uint64_t v186 = *(void *)(v182 - 8);
  MEMORY[0x270FA5388](v182);
  v180 = (char *)v150 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_251126820();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  long long v22 = (char *)v150 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_251126840();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  long long v26 = (char *)v150 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110D58C();
  uint64_t v175 = *(void *)(v27 - 8);
  uint64_t v176 = v27;
  MEMORY[0x270FA5388](v27);
  v166 = (char *)v150 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251114FAC(0, &qword_269B21240, (uint64_t (*)(uint64_t))sub_25110D58C, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  uint64_t v189 = (uint64_t)v150 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v187 = (uint64_t)v150 - v32;
  sub_2511212B8((uint64_t)v26);
  uint64_t v164 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_2511215AC((uint64_t)v22);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  long long v33 = *(void (**)(char *, uint64_t))(v24 + 8);
  v33(v26, v23);
  if (qword_26B215FC0 != -1) {
    swift_once();
  }
  id v34 = (id)qword_26B2163A0;
  sub_251126760();
  sub_2511212B8((uint64_t)v26);
  sub_25110EDFC((uint64_t)v26, (uint64_t)&v199);
  swift_release();
  v33(v26, v23);
  uint64_t v165 = v199;
  v162 = (char *)v200;
  unint64_t v163 = *((void *)&v199 + 1);
  uint64_t v152 = a1;
  uint64_t v160 = (void (*)(char *, uint64_t, uint64_t))*((void *)&v202 + 1);
  uint64_t v161 = v202;
  long long v190 = v199;
  long long v191 = v200;
  long long v192 = v201;
  long long v193 = v202;
  *(void *)&long long v194 = v203;
  BYTE8(v194) = v204;
  sub_25110D610();
  uint64_t v36 = v35;
  unint64_t v37 = sub_25110D748();
  char v38 = v166;
  sub_251126640();
  j__swift_release();
  *(void *)&long long v199 = v36;
  *((void *)&v199 + 1) = v37;
  swift_getOpaqueTypeConformance2();
  uint64_t v39 = v189;
  uint64_t v40 = v176;
  sub_2511266C0();
  (*(void (**)(char *, uint64_t))(v175 + 8))(v38, v40);
  sub_25111556C(v39, v187);
  id v41 = (id)qword_26B2163A0;
  v162 = "IDGET_PREGNANCY_TITLE";
  *(void *)&long long v199 = sub_251126030();
  *((void *)&v199 + 1) = v42;
  unint64_t v163 = sub_251115110();
  uint64_t v175 = sub_251126630();
  uint64_t v176 = v43;
  uint64_t v45 = v44;
  char v47 = v46;

  uint64_t v48 = *MEMORY[0x263F1A6D8];
  uint64_t v49 = v186;
  uint64_t v50 = v180;
  uint64_t v51 = v182;
  uint64_t v160 = *(void (**)(char *, uint64_t, uint64_t))(v186 + 104);
  uint64_t v161 = v186 + 104;
  v160(v180, v48, v182);
  uint64_t v52 = *MEMORY[0x263F1A610];
  uint64_t v53 = sub_251126580();
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v55 = *(void (**)(char *, void, uint64_t))(v54 + 104);
  uint64_t v56 = (uint64_t)v181;
  unsigned int v158 = v52;
  uint64_t v155 = v55;
  uint64_t v156 = v54 + 104;
  v55(v181, v52, v53);
  uint64_t v57 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56);
  uint64_t v159 = v53;
  uint64_t v157 = v54 + 56;
  uint64_t v154 = v57;
  v57(v56, 0, 1, v53);
  sub_2511265B0();
  sub_251113818(v56, (uint64_t)&qword_269B21340, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2511150AC);
  id v58 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v186 = v49 + 8;
  v153 = v58;
  v58(v50, v51);
  sub_251126590();
  sub_2511265C0();
  swift_release();
  uint64_t v60 = v177;
  uint64_t v59 = KeyPath;
  uint64_t v61 = v179;
  (*(void (**)(char *, void, uint64_t))(KeyPath + 104))(v177, *MEMORY[0x263F1A680], v179);
  sub_2511265E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v61);
  uint64_t v62 = v175;
  uint64_t v63 = sub_251126610();
  uint64_t v65 = v64;
  char v67 = v66;
  swift_release();
  sub_251115164(v62, v45, v47 & 1);
  swift_bridgeObjectRelease();
  uint64_t v68 = v164;
  uint64_t v69 = v152;
  uint64_t v70 = v152 + *(int *)(v164 + 32);
  uint64_t v71 = *(void *)v70;
  LOBYTE(v62) = *(unsigned char *)(v70 + 8);
  sub_2511126E8(*(void *)v70, v62);
  LOBYTE(v51) = sub_251121B94(v71, v62);
  sub_251112A7C(v71, v62);
  if (v51)
  {
    *(void *)&long long v199 = sub_2511266F0();
    sub_251115938();
    uint64_t v72 = sub_251126710();
  }
  else
  {
    id v73 = objc_msgSend(self, sel_labelColor);
    uint64_t v72 = MEMORY[0x253395E00](v73);
  }
  *(void *)&long long v199 = v72;
  uint64_t v165 = sub_251126600();
  v166 = v74;
  uint64_t v175 = v75;
  char v77 = v76;
  sub_251115164(v63, v65, v67 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  v177 = (char *)swift_getKeyPath();
  uint64_t v179 = swift_getKeyPath();
  LODWORD(v176) = sub_251126570();
  uint64_t v164 = v69 + *(int *)(v68 + 28);
  uint64_t v78 = v183;
  sub_25112189C(v183);
  LODWORD(v152) = *MEMORY[0x263F18D60];
  uint64_t v79 = v188;
  uint64_t v80 = *(void (**)(void))(v188 + 104);
  v150[2] = v188 + 104;
  uint64_t v151 = (void (*)(char *, void, uint64_t))v80;
  uint64_t v82 = v184;
  uint64_t v81 = v185;
  v80(v184);
  v150[1] = sub_251114F64(&qword_269B21358, MEMORY[0x263F18D80]);
  sub_251126920();
  uint64_t v83 = *(void (**)(char *, uint64_t))(v79 + 8);
  uint64_t v188 = v79 + 8;
  v150[0] = v83;
  v83(v82, v81);
  v83((char *)v78, v81);
  sub_251126280();
  uint64_t v85 = v84;
  uint64_t v87 = v86;
  uint64_t v89 = v88;
  uint64_t v91 = v90;
  unsigned __int8 v219 = v77 & 1;
  unsigned __int8 v216 = 0;
  unsigned __int8 v213 = 0;
  id v92 = (id)qword_26B2163A0;
  *(void *)&long long v199 = sub_251126030();
  *((void *)&v199 + 1) = v93;
  uint64_t v94 = sub_251126630();
  uint64_t v96 = v95;
  LOBYTE(v78) = v97;

  LOBYTE(v82) = v78 & 1;
  uint64_t v98 = v180;
  uint64_t v99 = v182;
  v160(v180, *MEMORY[0x263F1A6F8], v182);
  uint64_t v100 = (uint64_t)v181;
  uint64_t v101 = v159;
  v155(v181, v158, v159);
  v154(v100, 0, 1, v101);
  sub_2511265B0();
  sub_251113818(v100, (uint64_t)&qword_269B21340, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2511150AC);
  v153(v98, v99);
  sub_2511265A0();
  sub_2511265C0();
  swift_release();
  uint64_t v102 = sub_251126610();
  uint64_t v104 = v103;
  LOBYTE(v100) = v105;
  swift_release();
  sub_251115164(v94, v96, (char)v82);
  swift_bridgeObjectRelease();
  id v106 = objc_msgSend(self, sel_systemIndigoColor);
  *(void *)&long long v199 = MEMORY[0x253395E00](v106);
  uint64_t v107 = sub_251126600();
  uint64_t v109 = v108;
  uint64_t v111 = v110;
  char v113 = v112 & 1;
  sub_251115164(v102, v104, v100 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)&long long v199 = v107;
  *((void *)&v199 + 1) = v109;
  LOBYTE(v200) = v113;
  *((void *)&v200 + 1) = v111;
  v114 = v169;
  sub_251126640();
  sub_251115164(v107, v109, v113);
  swift_bridgeObjectRelease();
  LOBYTE(v107) = sub_251126570();
  uint64_t v115 = v183;
  sub_25112189C(v183);
  unint64_t v117 = v184;
  uint64_t v116 = v185;
  v151(v184, v152, v185);
  sub_251126920();
  unint64_t v118 = (void (*)(uint64_t, uint64_t))v150[0];
  ((void (*)(char *, uint64_t))v150[0])(v117, v116);
  v118(v115, v116);
  sub_251126280();
  uint64_t v120 = v119;
  uint64_t v122 = v121;
  uint64_t v124 = v123;
  uint64_t v126 = v125;
  uint64_t v128 = v170;
  uint64_t v127 = v171;
  uint64_t v129 = (uint64_t)v167;
  (*(void (**)(char *, char *, uint64_t))(v170 + 16))(v167, v114, v171);
  uint64_t v130 = v129 + *(int *)(v168 + 36);
  *(unsigned char *)uint64_t v130 = v107;
  *(void *)(v130 + 8) = v120;
  *(void *)(v130 + 16) = v122;
  *(void *)(v130 + 24) = v124;
  *(void *)(v130 + 32) = v126;
  *(unsigned char *)(v130 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v128 + 8))(v114, v127);
  uint64_t v131 = v172;
  sub_251115614(v129, v172);
  uint64_t v132 = v189;
  sub_25111569C(v187, v189);
  LOBYTE(v118) = v219;
  LODWORD(v186) = v219;
  LOBYTE(v129) = v216;
  LODWORD(v185) = v216;
  LODWORD(v188) = v213;
  uint64_t v133 = v173;
  sub_251115744(v131, v173, (uint64_t)&qword_269B212A0, (uint64_t)sub_25110DA88, MEMORY[0x263F18C18], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_25110DA24);
  uint64_t v134 = v174;
  sub_25111569C(v132, v174);
  sub_25110D470();
  uint64_t v136 = v134 + v135[12];
  *(void *)uint64_t v136 = 0;
  *(unsigned char *)(v136 + 8) = 0;
  uint64_t v137 = v134 + v135[16];
  uint64_t v139 = v165;
  uint64_t v138 = v166;
  *(void *)&long long v190 = v165;
  *((void *)&v190 + 1) = v175;
  LOBYTE(v191) = (_BYTE)v118;
  *(_DWORD *)((char *)&v191 + 1) = *(_DWORD *)v218;
  DWORD1(v191) = *(_DWORD *)&v218[3];
  *((void *)&v191 + 1) = v166;
  *(void *)&long long v192 = KeyPath;
  BYTE8(v192) = 0;
  *(_DWORD *)((char *)&v192 + 9) = *(_DWORD *)v217;
  HIDWORD(v192) = *(_DWORD *)&v217[3];
  *(void *)&long long v193 = v177;
  *((void *)&v193 + 1) = 2;
  LOBYTE(v194) = v129;
  *(_DWORD *)((char *)&v194 + 1) = *(_DWORD *)v215;
  DWORD1(v194) = *(_DWORD *)&v215[3];
  *((void *)&v194 + 1) = v179;
  *(void *)&long long v195 = 0x3FE0000000000000;
  BYTE8(v195) = v176;
  *(_DWORD *)((char *)&v195 + 9) = *(_DWORD *)v214;
  HIDWORD(v195) = *(_DWORD *)&v214[3];
  *(void *)&long long v196 = v85;
  *((void *)&v196 + 1) = v87;
  *(void *)&long long v197 = v89;
  *((void *)&v197 + 1) = v91;
  char v140 = v188;
  char v198 = v188;
  long long v141 = v190;
  long long v142 = v191;
  long long v143 = v193;
  *(_OWORD *)(v137 + 32) = v192;
  *(_OWORD *)(v137 + 48) = v143;
  *(_OWORD *)uint64_t v137 = v141;
  *(_OWORD *)(v137 + 16) = v142;
  long long v144 = v194;
  long long v145 = v195;
  long long v146 = v196;
  long long v147 = v197;
  *(unsigned char *)(v137 + 128) = v140;
  *(_OWORD *)(v137 + 96) = v146;
  *(_OWORD *)(v137 + 112) = v147;
  *(_OWORD *)(v137 + 64) = v144;
  *(_OWORD *)(v137 + 80) = v145;
  uint64_t v148 = MEMORY[0x263F18C18];
  sub_251115744(v133, v134 + v135[20], (uint64_t)&qword_269B212A0, (uint64_t)sub_25110DA88, MEMORY[0x263F18C18], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_25110DA24);
  sub_2511157B8((uint64_t)&v190);
  sub_251113818(v131, (uint64_t)&qword_269B212A0, (uint64_t)sub_25110DA88, v148, (uint64_t (*)(void))sub_25110DA24);
  sub_251115828(v187);
  sub_251113818(v133, (uint64_t)&qword_269B212A0, (uint64_t)sub_25110DA88, v148, (uint64_t (*)(void))sub_25110DA24);
  *(void *)&long long v199 = v139;
  *((void *)&v199 + 1) = v175;
  LOBYTE(v200) = v186;
  *(_DWORD *)((char *)&v200 + 1) = *(_DWORD *)v218;
  DWORD1(v200) = *(_DWORD *)&v218[3];
  *((void *)&v200 + 1) = v138;
  *(void *)&long long v201 = KeyPath;
  BYTE8(v201) = 0;
  *(_DWORD *)((char *)&v201 + 9) = *(_DWORD *)v217;
  HIDWORD(v201) = *(_DWORD *)&v217[3];
  *(void *)&long long v202 = v177;
  *((void *)&v202 + 1) = 2;
  LOBYTE(v203) = v185;
  HIDWORD(v203) = *(_DWORD *)&v215[3];
  *(_DWORD *)((char *)&v203 + 1) = *(_DWORD *)v215;
  uint64_t v204 = v179;
  uint64_t v205 = 0x3FE0000000000000;
  char v206 = v176;
  *(_DWORD *)&v207[3] = *(_DWORD *)&v214[3];
  *(_DWORD *)v207 = *(_DWORD *)v214;
  uint64_t v208 = v85;
  uint64_t v209 = v87;
  uint64_t v210 = v89;
  uint64_t v211 = v91;
  char v212 = v188;
  sub_2511158C8((uint64_t)&v199);
  return sub_251115828(v189);
}

__n128 sub_251110570@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void (*a16)(uint64_t, uint64_t), uint64_t (*a17)(void))
{
  uint64_t v18 = v17;
  uint64_t v20 = a17;
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
    sub_251126A20();
    uint64_t v29 = (void *)sub_251126550();
    sub_251126240();

    uint64_t v20 = a17;
  }
  sub_251126300();
  a16(v18, a9);
  uint64_t v30 = (_OWORD *)(a9 + *(int *)(v20(0) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  _OWORD *v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_251110744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(char *, uint64_t, uint64_t)@<X2>, char *a4@<X8>)
{
  char v113 = a3;
  v114 = a4;
  uint64_t v126 = a2;
  uint64_t v127 = a1;
  sub_25110CBEC();
  uint64_t v116 = *(void *)(v4 - 8);
  uint64_t v117 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v115 = (char *)v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v132 = (uint64_t)v97 - v7;
  uint64_t v124 = sub_2511265D0();
  uint64_t v133 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v9 = (char *)v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511150AC(0, &qword_269B21340, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v97 - v11;
  uint64_t v13 = sub_2511265F0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v128 = (char *)v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110C558();
  uint64_t v130 = *(void *)(v16 - 8);
  uint64_t v131 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v129 = (char *)v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v134 = (char *)v97 - v19;
  if (qword_26B215FC0 != -1) {
    swift_once();
  }
  id v20 = (id)qword_26B2163A0;
  uint64_t v163 = sub_251126030();
  unint64_t v164 = v21;
  unint64_t v125 = sub_251115110();
  uint64_t v111 = sub_251126630();
  v97[1] = v23;
  uint64_t v98 = v22;
  char v25 = v24;

  char v26 = v25 & 1;
  uint64_t v27 = *MEMORY[0x263F1A6C0];
  uint64_t v28 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  uint64_t v122 = v14 + 104;
  uint64_t v123 = v28;
  uint64_t v29 = v128;
  v28(v128, v27, v13);
  unsigned int v120 = *MEMORY[0x263F1A610];
  uint64_t v30 = v120;
  uint64_t v31 = sub_251126580();
  uint64_t v32 = *(void *)(v31 - 8);
  *(void *)uint64_t v119 = *(void *)(v32 + 104);
  uint64_t v121 = v32 + 104;
  uint64_t v33 = v30;
  uint64_t v34 = v31;
  uint64_t v107 = v31;
  (*(void (**)(char *, uint64_t))v119)(v12, v33);
  __n128 v35 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56);
  uint64_t v112 = v32 + 56;
  unint64_t v118 = v35;
  v35((uint64_t)v12, 0, 1, v34);
  sub_2511265B0();
  uint64_t v110 = MEMORY[0x263F1A620];
  uint64_t v109 = MEMORY[0x263F8D8F0];
  uint64_t v108 = sub_2511150AC;
  sub_251113818((uint64_t)v12, (uint64_t)&qword_269B21340, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2511150AC);
  long long v36 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v101 = v14 + 8;
  id v106 = v36;
  v36(v29, v13);
  sub_2511265A0();
  sub_2511265C0();
  uint64_t v99 = v13;
  swift_release();
  unsigned int v105 = *MEMORY[0x263F1A680];
  uint64_t v37 = v133;
  long long v38 = *(void (**)(void))(v133 + 104);
  uint64_t v103 = v133 + 104;
  uint64_t v104 = (void (*)(char *, void, uint64_t))v38;
  uint64_t v39 = v124;
  v38(v9);
  sub_2511265E0();
  swift_release();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v133 = v37 + 8;
  uint64_t v102 = v40;
  v40(v9, v39);
  uint64_t v41 = v111;
  uint64_t v42 = v98;
  v97[0] = v12;
  uint64_t v43 = sub_251126610();
  uint64_t v100 = v9;
  uint64_t v45 = v44;
  LOBYTE(v39) = v46;
  uint64_t v48 = v47;
  swift_release();
  sub_251115164(v41, v42, v26);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_25110540C(0, &qword_269B21348);
  uint64_t v50 = sub_251126A50();
  uint64_t v51 = MEMORY[0x253395E00](v50);
  uint64_t v163 = v43;
  unint64_t v164 = v45;
  char v165 = v39 & 1;
  uint64_t v167 = v48;
  uint64_t v168 = KeyPath;
  uint64_t v169 = 0x3FE0000000000000;
  uint64_t v170 = v51;
  sub_25110C620();
  sub_25110CFE4(&qword_269B21110, (void (*)(uint64_t))sub_25110C620, (void (*)(void))sub_25110C6CC, (void (*)(void))sub_25110C7D8);
  sub_251126640();
  sub_251115164(v43, v45, v39 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v163 = sub_2511114C0(v126);
  unint64_t v164 = v52;
  uint64_t v53 = sub_251126630();
  unint64_t v125 = v54;
  uint64_t v126 = v53;
  LOBYTE(v45) = v55;
  uint64_t v111 = v56;
  LODWORD(v127) = sub_251126570();
  sub_251126280();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v65 = v128;
  uint64_t v66 = v99;
  v123(v128, *MEMORY[0x263F1A6D8], v99);
  uint64_t v67 = v97[0];
  uint64_t v68 = v107;
  (*(void (**)(void, void, uint64_t))v119)(v97[0], v120, v107);
  v118(v67, 0, 1, v68);
  sub_2511265B0();
  sub_251113818(v67, (uint64_t)&qword_269B21340, v110, v109, (uint64_t (*)(void))v108);
  v106(v65, v66);
  sub_251126590();
  sub_2511265C0();
  swift_release();
  uint64_t v69 = v100;
  uint64_t v70 = v124;
  v104(v100, v105, v124);
  uint64_t v128 = (char *)sub_2511265E0();
  swift_release();
  v102(v69, v70);
  uint64_t v133 = swift_getKeyPath();
  id v71 = objc_msgSend(self, sel_labelColor);
  uint64_t v124 = MEMORY[0x253395E00](v71);
  uint64_t v123 = (void (*)(char *, void, uint64_t))swift_getKeyPath();
  uint64_t v122 = swift_getKeyPath();
  unsigned __int8 v147 = v45 & 1;
  unsigned __int8 v144 = 0;
  unsigned __int8 v141 = 0;
  uint64_t v121 = swift_getKeyPath();
  LODWORD(v118) = v147;
  v152[0] = *(_DWORD *)v146;
  *(_DWORD *)((char *)v152 + 3) = *(_DWORD *)&v146[3];
  v151[0] = *(_DWORD *)v145;
  *(_DWORD *)((char *)v151 + 3) = *(_DWORD *)&v145[3];
  v119[0] = v144;
  v150[0] = *(_DWORD *)v143;
  *(_DWORD *)((char *)v150 + 3) = *(_DWORD *)&v143[3];
  *(_DWORD *)((char *)v149 + 3) = *(_DWORD *)&v142[3];
  v149[0] = *(_DWORD *)v142;
  unsigned int v120 = v141;
  uint64_t v72 = v132;
  sub_2511117D8((uint64_t)v113, v132);
  id v73 = v129;
  uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v130 + 16);
  uint64_t v75 = v131;
  v74(v129, v134, v131);
  char v140 = 0;
  v139[0] = v152[0];
  *(_DWORD *)((char *)v139 + 3) = *(_DWORD *)((char *)v152 + 3);
  v138[0] = v151[0];
  *(_DWORD *)((char *)v138 + 3) = *(_DWORD *)((char *)v151 + 3);
  v137[0] = v150[0];
  *(_DWORD *)((char *)v137 + 3) = *(_DWORD *)((char *)v150 + 3);
  *(_DWORD *)((char *)v136 + 3) = *(_DWORD *)((char *)v149 + 3);
  v136[0] = v149[0];
  *(_DWORD *)((char *)v135 + 3) = *(_DWORD *)&v148[3];
  v135[0] = *(_DWORD *)v148;
  char v77 = v115;
  uint64_t v76 = v116;
  char v113 = *(void (**)(char *, uint64_t, uint64_t))(v116 + 16);
  uint64_t v78 = v72;
  uint64_t v79 = v117;
  v113(v115, v78, v117);
  uint64_t v80 = v114;
  v74(v114, v73, v75);
  sub_25110C4C8();
  uint64_t v82 = (uint64_t)&v80[v81[12]];
  char v83 = v140;
  *(void *)uint64_t v82 = 0;
  *(unsigned char *)(v82 + 8) = v83;
  uint64_t v84 = &v80[v81[16]];
  *(void *)&long long v153 = v126;
  *((void *)&v153 + 1) = v125;
  LOBYTE(v154) = (_BYTE)v118;
  *(_DWORD *)((char *)&v154 + 1) = v139[0];
  DWORD1(v154) = *(_DWORD *)((char *)v139 + 3);
  uint64_t v85 = v111;
  *((void *)&v154 + 1) = v111;
  LOBYTE(v155) = v127;
  DWORD1(v155) = *(_DWORD *)((char *)v138 + 3);
  *(_DWORD *)((char *)&v155 + 1) = v138[0];
  *((void *)&v155 + 1) = v58;
  *(void *)&long long v156 = v60;
  *((void *)&v156 + 1) = v62;
  *(void *)&long long v157 = v64;
  BYTE8(v157) = v119[0];
  HIDWORD(v157) = *(_DWORD *)((char *)v137 + 3);
  *(_DWORD *)((char *)&v157 + 9) = v137[0];
  *(void *)&long long v158 = v133;
  *((void *)&v158 + 1) = v128;
  *(void *)&long long v159 = v124;
  *((void *)&v159 + 1) = v123;
  LOBYTE(v160) = 0;
  DWORD1(v160) = *(_DWORD *)((char *)v136 + 3);
  *(_DWORD *)((char *)&v160 + 1) = v136[0];
  *((void *)&v160 + 1) = v122;
  *(void *)&long long v161 = 2;
  BYTE8(v161) = v120;
  HIDWORD(v161) = *(_DWORD *)((char *)v135 + 3);
  *(_DWORD *)((char *)&v161 + 9) = v135[0];
  *(void *)&long long v162 = v121;
  *((void *)&v162 + 1) = 0x3FE0000000000000;
  long long v86 = v154;
  *uint64_t v84 = v153;
  v84[1] = v86;
  long long v87 = v155;
  long long v88 = v156;
  long long v89 = v158;
  v84[4] = v157;
  v84[5] = v89;
  v84[2] = v87;
  v84[3] = v88;
  long long v90 = v159;
  long long v91 = v160;
  long long v92 = v162;
  v84[8] = v161;
  v84[9] = v92;
  v84[6] = v90;
  v84[7] = v91;
  v113(&v80[v81[20]], (uint64_t)v77, v79);
  sub_2511152D8((uint64_t)&v153);
  uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v93(v132, v79);
  uint64_t v94 = v131;
  uint64_t v95 = *(void (**)(char *, uint64_t))(v130 + 8);
  v95(v134, v131);
  v93((uint64_t)v77, v79);
  uint64_t v163 = v126;
  unint64_t v164 = v125;
  char v165 = (char)v118;
  *(_DWORD *)v166 = v139[0];
  *(_DWORD *)&v166[3] = *(_DWORD *)((char *)v139 + 3);
  uint64_t v167 = v85;
  LOBYTE(v168) = v127;
  *(_DWORD *)((char *)&v168 + 1) = v138[0];
  HIDWORD(v168) = *(_DWORD *)((char *)v138 + 3);
  uint64_t v169 = v58;
  uint64_t v170 = v60;
  uint64_t v171 = v62;
  uint64_t v172 = v64;
  char v173 = v119[0];
  *(_DWORD *)&v174[3] = *(_DWORD *)((char *)v137 + 3);
  *(_DWORD *)uint64_t v174 = v137[0];
  uint64_t v175 = v133;
  uint64_t v176 = v128;
  uint64_t v177 = v124;
  v178 = (void (*)(void, void, void))v123;
  char v179 = 0;
  *(_DWORD *)&v180[3] = *(_DWORD *)((char *)v136 + 3);
  *(_DWORD *)v180 = v136[0];
  uint64_t v181 = v122;
  uint64_t v182 = 2;
  char v183 = v120;
  *(_DWORD *)&v184[3] = *(_DWORD *)((char *)v135 + 3);
  *(_DWORD *)v184 = v135[0];
  uint64_t v185 = v121;
  uint64_t v186 = 0x3FE0000000000000;
  sub_251115380((uint64_t)&v163);
  return ((uint64_t (*)(char *, uint64_t))v95)(v129, v94);
}

uint64_t sub_2511114C0(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_2511262D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v21 - v6;
  uint64_t v8 = sub_2511260A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = self;
  sub_251126090();
  uint64_t v13 = (void *)sub_251126060();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v23 = v8;
  v21[0] = v14;
  v21[1] = v9 + 8;
  v14(v11, v8);
  id v22 = v12;
  id v15 = objc_msgSend(v12, sel_gestationalAgeStringOnDate_pregnancySample_, v13, v24);

  uint64_t v16 = sub_251126970();
  type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_25112189C((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F18D70], v1);
  sub_251114F64(&qword_269B21358, MEMORY[0x263F18D80]);
  LOBYTE(v15) = sub_251126920();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v2 + 8);
  v17(v5, v1);
  v17(v7, v1);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_251126090();
    uint64_t v18 = (void *)sub_251126060();
    ((void (*)(char *, uint64_t))v21[0])(v11, v23);
    id v19 = objc_msgSend(v22, sel_gestationalAgeCompactStringOnDate_pregnancySample_, v18, v24);

    uint64_t v16 = sub_251126970();
  }
  return v16;
}

uint64_t sub_2511117D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v50 = a1;
  sub_25110CF68(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v48 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_251126230();
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110CEB4();
  uint64_t v7 = v6;
  uint64_t v41 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110CDB0();
  uint64_t v44 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110CD88(0);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110CD40(0);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v42 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25110CCB4();
  uint64_t v47 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v46 = (uint64_t)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511261F0();
  uint64_t v51 = v23;
  long long v52 = xmmword_2511274E0;
  sub_251115418();
  sub_251126720();
  sub_251126290();
  sub_251114F64(&qword_269B211B8, (void (*)(uint64_t))sub_25110CEB4);
  sub_251114F64(&qword_269B211C0, MEMORY[0x263F45240]);
  uint64_t v24 = v43;
  sub_251126680();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v5, v24);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v7);
  sub_2511267B0();
  sub_2511262B0();
  uint64_t v25 = v44;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v13, v44);
  char v26 = (long long *)&v17[*(int *)(v15 + 44)];
  long long v27 = v53;
  *char v26 = v52;
  v26[1] = v27;
  v26[2] = v54;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = sub_251126790();
  uint64_t v30 = (uint64_t)v48;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v48, 1, 1, v29);
  uint64_t v31 = (uint64_t)v42;
  uint64_t v32 = (uint64_t *)&v42[*(int *)(v19 + 44)];
  sub_25110CF34(0);
  sub_2511154E8(v30, (uint64_t)v32 + *(int *)(v33 + 28), (uint64_t (*)(void))sub_25110CF68);
  uint64_t *v32 = KeyPath;
  sub_2511154E8((uint64_t)v17, v31, (uint64_t (*)(void))sub_25110CD88);
  sub_25110E650(v30, (uint64_t (*)(void))sub_25110CF68);
  sub_25110E650((uint64_t)v17, (uint64_t (*)(void))sub_25110CD88);
  uint64_t v34 = swift_getKeyPath();
  sub_251126200();
  uint64_t v36 = v35;
  uint64_t v37 = v46;
  sub_2511154E8(v31, v46, (uint64_t (*)(void))sub_25110CD40);
  long long v38 = (uint64_t *)(v37 + *(int *)(v47 + 36));
  *long long v38 = v34;
  v38[1] = v36;
  sub_25110E650(v31, (uint64_t (*)(void))sub_25110CD40);
  sub_25110CFE4(&qword_269B211D8, (void (*)(uint64_t))sub_25110CCB4, (void (*)(void))sub_25110CF9C, (void (*)(void))sub_25110C75C);
  sub_251126640();
  return sub_25110E650(v37, (uint64_t (*)(void))sub_25110CCB4);
}

uint64_t sub_251111E38@<X0>(uint64_t a1@<X8>)
{
  sub_251126450();
  uint64_t result = sub_251126620();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_251111EA0(uint64_t a1)
{
  sub_25110CF68(0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2511154E8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))sub_25110CF68);
  return sub_251126360();
}

uint64_t sub_251111F44()
{
  return sub_2511266A0();
}

uint64_t sub_251111F60()
{
  uint64_t v1 = MEMORY[0x263F06EA8];
  uint64_t v2 = MEMORY[0x263F8D8F0];
  sub_2511150AC(0, &qword_269B210A8, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - v4;
  sub_25110C224();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = sub_2511267B0();
  v8[1] = v9;
  sub_25110E5A4();
  sub_25110DD98(v0, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_251126040();
  sub_251114F64(&qword_269B212D8, (void (*)(uint64_t))sub_25110C224);
  sub_251126650();
  sub_251113818((uint64_t)v5, (uint64_t)&qword_269B210A8, v1, v2, (uint64_t (*)(void))sub_2511150AC);
  return sub_25110E650((uint64_t)v8, (uint64_t (*)(void))sub_25110C224);
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetRectangularView(uint64_t *a1, uint64_t *a2, int *a3)
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
    sub_2511150AC(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_251126840();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_2511150AC(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_251126820();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    sub_2511150AC(0, &qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_2511262A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    sub_2511150AC(0, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_2511262D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = *(void *)v23;
    char v25 = v23[8];
    sub_2511126E8(*(void *)v23, v25);
    *(void *)uint64_t v22 = v24;
    v22[8] = v25;
    uint64_t v26 = a3[9];
    long long v27 = (void **)((char *)a1 + v26);
    uint64_t v28 = (void **)((char *)a2 + v26);
    uint64_t v29 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      sub_251102AA4();
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v34 + 48))(v28, 1, v32))
      {
        memcpy(v27, v28, *(void *)(v30 + 64));
      }
      else
      {
        uint64_t v36 = *v28;
        uint64_t v35 = v28[1];
        char *v27 = *v28;
        v27[1] = v35;
        uint64_t v37 = *(int *)(v33 + 64);
        uint64_t v42 = (char *)v28 + v37;
        uint64_t v43 = (char *)v27 + v37;
        uint64_t v38 = sub_251126220();
        uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
        id v40 = v36;
        v39(v43, v42, v38);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v34 + 56))(v27, 0, 1, v33);
      }
      (*(void (**)(void **, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  return a1;
}

uint64_t sub_2511126E8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for MenstrualCyclesWidgetRectangularView(uint64_t a1, int *a2)
{
  sub_2511150AC(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_251126840();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_2511150AC(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_251126820();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_2511150AC(0, &qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2511262A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[7];
  sub_2511150AC(0, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2511262D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_251112A7C(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  uint64_t v11 = (id *)(a1 + a2[9]);
  uint64_t v12 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12);
  if (!result)
  {
    sub_251102AA4();
    uint64_t v15 = v14;
    uint64_t result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v11, 1, v14);
    if (!result)
    {

      uint64_t v16 = (char *)v11 + *(int *)(v15 + 64);
      uint64_t v17 = sub_251126220();
      uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8);
      return v18(v16, v17);
    }
  }
  return result;
}

uint64_t sub_251112A7C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for MenstrualCyclesWidgetRectangularView(void *a1, void *a2, int *a3)
{
  sub_2511150AC(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_251126840();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_2511150AC(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_251126820();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_2511150AC(0, &qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_2511262A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  sub_2511150AC(0, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_2511262D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = v21[8];
  sub_2511126E8(*(void *)v21, v23);
  *(void *)uint64_t v20 = v22;
  v20[8] = v23;
  uint64_t v24 = a3[9];
  char v25 = (void **)((char *)a1 + v24);
  uint64_t v26 = (void **)((char *)a2 + v24);
  uint64_t v27 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v32 + 48))(v26, 1, v30))
    {
      memcpy(v25, v26, *(void *)(v28 + 64));
    }
    else
    {
      uint64_t v34 = *v26;
      uint64_t v33 = v26[1];
      *char v25 = *v26;
      v25[1] = v33;
      uint64_t v35 = *(int *)(v31 + 64);
      id v40 = (char *)v26 + v35;
      uint64_t v41 = (char *)v25 + v35;
      uint64_t v36 = sub_251126220();
      uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
      id v38 = v34;
      v37(v41, v40, v36);
      (*(void (**)(void **, void, uint64_t, uint64_t))(v32 + 56))(v25, 0, 1, v31);
    }
    (*(void (**)(void **, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

void *assignWithCopy for MenstrualCyclesWidgetRectangularView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)a1, (uint64_t)&qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_26B215FA0, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_251126840();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)a1 + v9, (uint64_t)&qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212E0, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_251126820();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = (uint64_t (*)(uint64_t))MEMORY[0x263F18520];
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)a1 + v15, (uint64_t)&qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212E8, v18, v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_2511262A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v16, v17, v20);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[7];
    uint64_t v22 = (void *)((char *)a1 + v21);
    char v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
    char v25 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)a1 + v21, (uint64_t)&qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212F0, v24, v25);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_2511262D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v22, v23, v26);
    }
    else
    {
      *uint64_t v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v27 = a3[8];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = *(void *)v29;
  char v31 = v29[8];
  sub_2511126E8(*(void *)v29, v31);
  uint64_t v32 = *(void *)v28;
  char v33 = v28[8];
  *(void *)uint64_t v28 = v30;
  v28[8] = v31;
  sub_251112A7C(v32, v33);
  uint64_t v34 = a3[9];
  uint64_t v35 = (void **)((char *)a1 + v34);
  uint64_t v36 = (void **)((char *)a2 + v34);
  uint64_t v37 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (!v41)
    {
      sub_251102AA4();
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)(v47 - 8);
      uint64_t v50 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v49 + 48);
      int v51 = v50(v35, 1, v47);
      int v52 = v50(v36, 1, v48);
      if (v51)
      {
        if (!v52)
        {
          long long v53 = *v36;
          *uint64_t v35 = *v36;
          v35[1] = v36[1];
          uint64_t v54 = *(int *)(v48 + 64);
          char v55 = (char *)v35 + v54;
          uint64_t v56 = (char *)v36 + v54;
          uint64_t v57 = sub_251126220();
          uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
          id v59 = v53;
          v58(v55, v56, v57);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v49 + 56))(v35, 0, 1, v48);
          return a1;
        }
      }
      else
      {
        if (!v52)
        {
          uint64_t v66 = *v36;
          uint64_t v67 = *v35;
          *uint64_t v35 = *v36;
          id v68 = v66;

          v35[1] = v36[1];
          uint64_t v69 = *(int *)(v48 + 64);
          uint64_t v70 = (char *)v35 + v69;
          id v71 = (char *)v36 + v69;
          uint64_t v72 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 24))(v70, v71, v72);
          return a1;
        }
        sub_25110E650((uint64_t)v35, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v46 = *(void *)(v38 + 64);
      goto LABEL_22;
    }
    sub_25110E650((uint64_t)v35, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_21:
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    size_t v46 = *(void *)(*(void *)(v45 - 8) + 64);
LABEL_22:
    memcpy(v35, v36, v46);
    return a1;
  }
  if (v41) {
    goto LABEL_21;
  }
  sub_251102AA4();
  uint64_t v43 = v42;
  uint64_t v44 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v44 + 48))(v36, 1, v42))
  {
    memcpy(v35, v36, *(void *)(v38 + 64));
  }
  else
  {
    uint64_t v60 = *v36;
    *uint64_t v35 = *v36;
    v35[1] = v36[1];
    uint64_t v61 = *(int *)(v43 + 64);
    id v73 = (char *)v36 + v61;
    uint64_t v74 = (char *)v35 + v61;
    uint64_t v62 = sub_251126220();
    uint64_t v63 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16);
    id v64 = v60;
    v63(v74, v73, v62);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v44 + 56))(v35, 0, 1, v43);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  return a1;
}

uint64_t sub_251113818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetRectangularView(char *a1, char *a2, int *a3)
{
  sub_2511150AC(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_251126840();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  sub_2511150AC(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  uint64_t v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_251126820();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  sub_2511150AC(0, &qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  uint64_t v19 = v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_2511262A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v16, v17, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  char v23 = &a2[v21];
  sub_2511150AC(0, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  uint64_t v25 = v24;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_2511262D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v22, v23, v26);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
  }
  uint64_t v27 = a3[8];
  uint64_t v28 = a3[9];
  uint64_t v29 = &a1[v27];
  uint64_t v30 = &a2[v27];
  *(void *)uint64_t v29 = *(void *)v30;
  v29[8] = v30[8];
  char v31 = &a1[v28];
  uint64_t v32 = &a2[v28];
  uint64_t v33 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v32, 1, v36))
    {
      memcpy(v31, v32, *(void *)(v34 + 64));
    }
    else
    {
      uint64_t v39 = *((void *)v32 + 1);
      *(void *)char v31 = *(void *)v32;
      *((void *)v31 + 1) = v39;
      uint64_t v40 = *(int *)(v37 + 64);
      int v41 = &v31[v40];
      uint64_t v42 = &v32[v40];
      uint64_t v43 = sub_251126220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v31, 0, 1, v37);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetRectangularView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)a1, (uint64_t)&qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_26B215FA0, v6, v7);
    uint64_t v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_251126840();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)&a1[v11], (uint64_t)&qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212E0, v14, v15);
    uint64_t v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_251126820();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v12, v13, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    uint64_t v19 = a3[6];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = (uint64_t (*)(uint64_t))MEMORY[0x263F18520];
    char v23 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)&a1[v19], (uint64_t)&qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212E8, v22, v23);
    uint64_t v25 = v24;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_2511262A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v20, v21, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
    uint64_t v27 = a3[7];
    uint64_t v28 = &a1[v27];
    uint64_t v29 = &a2[v27];
    uint64_t v30 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
    char v31 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_251113818((uint64_t)&a1[v27], (uint64_t)&qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8], (uint64_t (*)(void))sub_2511150AC);
    sub_2511150AC(0, &qword_269B212F0, v30, v31);
    uint64_t v33 = v32;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v34 = sub_2511262D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v28, v29, v34);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
    }
  }
  uint64_t v35 = a3[8];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  uint64_t v38 = *(void *)v37;
  LOBYTE(v37) = v37[8];
  uint64_t v39 = *(void *)v36;
  char v40 = v36[8];
  *(void *)uint64_t v36 = v38;
  v36[8] = (char)v37;
  sub_251112A7C(v39, v40);
  uint64_t v41 = a3[9];
  uint64_t v42 = (void **)&a1[v41];
  uint64_t v43 = (void **)&a2[v41];
  uint64_t v44 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v45 = *(void *)(v44 - 8);
  size_t v46 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v45 + 48);
  int v47 = v46(v42, 1, v44);
  int v48 = v46(v43, 1, v44);
  if (!v47)
  {
    if (!v48)
    {
      sub_251102AA4();
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)(v54 - 8);
      uint64_t v57 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v56 + 48);
      int v58 = v57(v42, 1, v54);
      int v59 = v57(v43, 1, v55);
      if (v58)
      {
        if (!v59)
        {
          uint64_t v60 = v43[1];
          *uint64_t v42 = *v43;
          v42[1] = v60;
          uint64_t v61 = *(int *)(v55 + 64);
          uint64_t v62 = (char *)v42 + v61;
          uint64_t v63 = (char *)v43 + v61;
          uint64_t v64 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v56 + 56))(v42, 0, 1, v55);
          return a1;
        }
      }
      else
      {
        if (!v59)
        {
          id v71 = *v42;
          *uint64_t v42 = *v43;

          v42[1] = v43[1];
          uint64_t v72 = *(int *)(v55 + 64);
          id v73 = (char *)v42 + v72;
          uint64_t v74 = (char *)v43 + v72;
          uint64_t v75 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 40))(v73, v74, v75);
          return a1;
        }
        sub_25110E650((uint64_t)v42, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v53 = *(void *)(v45 + 64);
      goto LABEL_21;
    }
    sub_25110E650((uint64_t)v42, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_20:
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    size_t v53 = *(void *)(*(void *)(v52 - 8) + 64);
LABEL_21:
    memcpy(v42, v43, v53);
    return a1;
  }
  if (v48) {
    goto LABEL_20;
  }
  sub_251102AA4();
  uint64_t v50 = v49;
  uint64_t v51 = *(void *)(v49 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v51 + 48))(v43, 1, v49))
  {
    memcpy(v42, v43, *(void *)(v45 + 64));
  }
  else
  {
    uint64_t v65 = v43[1];
    *uint64_t v42 = *v43;
    v42[1] = v65;
    uint64_t v66 = *(int *)(v50 + 64);
    uint64_t v67 = (char *)v42 + v66;
    id v68 = (char *)v43 + v66;
    uint64_t v69 = sub_251126220();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 32))(v67, v68, v69);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v51 + 56))(v42, 0, 1, v50);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetRectangularView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2511145FC);
}

uint64_t sub_2511145FC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_2511150AC(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_10:
    return v9(v10, a2, v8);
  }
  sub_2511150AC(0, &qword_269B21300, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_9:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_10;
  }
  sub_2511150AC(0, &qword_269B21308, MEMORY[0x263F18520], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  sub_2511150AC(0, &qword_269B21310, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_9;
  }
  if (a2 == 254)
  {
    unsigned int v17 = *(unsigned __int8 *)(a1 + a3[8] + 8);
    if (v17 > 1) {
      return (v17 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a3[9];
    return v19(v21, a2, v20);
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetRectangularView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251114914);
}

void sub_251114914(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_2511150AC(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    v11(v12, a2, a2, v10);
    return;
  }
  sub_2511150AC(0, &qword_269B21300, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  sub_2511150AC(0, &qword_269B21308, MEMORY[0x263F18520], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_9;
  }
  sub_2511150AC(0, &qword_269B21310, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[8] + 8) = -(char)a2;
  }
  else
  {
    sub_2511150AC(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a4[9];
    v19(v21, a2, a2, v20);
  }
}

uint64_t type metadata accessor for MenstrualCyclesWidgetRectangularView()
{
  uint64_t result = qword_269B21318;
  if (!qword_269B21318) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_251114C68()
{
  sub_2511150AC(319, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2511150AC(319, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      sub_2511150AC(319, &qword_269B212E8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        sub_2511150AC(319, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
        if (v3 <= 0x3F)
        {
          sub_2511150AC(319, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

uint64_t sub_251114EDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_251114F64(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_251114FAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4(255);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_251115030(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2511262C0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_251115094(uint64_t a1, uint64_t a2)
{
  return sub_2511154E8(a1, a2, (uint64_t (*)(void))sub_25110C3C4);
}

void sub_2511150AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_251115110()
{
  unint64_t result = qword_26B216120;
  if (!qword_26B216120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B216120);
  }
  return result;
}

uint64_t sub_251115164(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_251115174@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_251126370();
  *a1 = v3;
  return result;
}

uint64_t sub_2511151A0()
{
  return sub_251126380();
}

uint64_t sub_2511151C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2511263B0();
  *a1 = result;
  return result;
}

uint64_t sub_2511151F4()
{
  return sub_2511263C0();
}

uint64_t sub_251115220@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251126390();
  *a1 = result;
  return result;
}

uint64_t sub_25111524C()
{
  return sub_2511263A0();
}

uint64_t sub_251115274@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_251126400();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2511152A8()
{
  return sub_251126410();
}

uint64_t sub_2511152D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_251115370(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_251115380(uint64_t a1)
{
  return a1;
}

unint64_t sub_251115418()
{
  unint64_t result = qword_269B21350;
  if (!qword_269B21350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21350);
  }
  return result;
}

uint64_t sub_25111546C()
{
  return sub_251126350();
}

uint64_t sub_251115494@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_251126310();
  *a1 = v3;
  return result;
}

uint64_t sub_2511154C0()
{
  return sub_251126320();
}

uint64_t sub_2511154E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_251115550(uint64_t a1, uint64_t a2)
{
  return sub_2511154E8(a1, a2, (uint64_t (*)(void))sub_25110D400);
}

uint64_t sub_25111556C(uint64_t a1, uint64_t a2)
{
  sub_251114FAC(0, &qword_269B21240, (uint64_t (*)(uint64_t))sub_25110D58C, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_251115614(uint64_t a1, uint64_t a2)
{
  sub_25110DA24(0, &qword_269B212A0, (void (*)(uint64_t))sub_25110DA88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25111569C(uint64_t a1, uint64_t a2)
{
  sub_251114FAC(0, &qword_269B21240, (uint64_t (*)(uint64_t))sub_25110D58C, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251115744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_2511157B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_251115828(uint64_t a1)
{
  sub_251114FAC(0, &qword_269B21240, (uint64_t (*)(uint64_t))sub_25110D58C, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2511158C8(uint64_t a1)
{
  return a1;
}

unint64_t sub_251115938()
{
  unint64_t result = qword_269B21368;
  if (!qword_269B21368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21368);
  }
  return result;
}

id sub_25111598C()
{
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B2163D0 = (uint64_t)result;
  return result;
}

uint64_t sub_2511159E4()
{
  uint64_t v0 = sub_251126270();
  __swift_allocate_value_buffer(v0, qword_26B2163B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B2163B8);
  return sub_251126260();
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

uint64_t MenstrualCyclesWidgetTimelineGenerator.__allocating_init(healthStore:)(uint64_t a1)
{
  uint64_t v2 = sub_251126100();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  sub_2511261A0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07740], v2);
  sub_251126110();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v6 + 16) = a1;
  return v6;
}

uint64_t String.init<A>(describingSensitive:)(uint64_t a1, uint64_t a2)
{
  sub_251126B80();
  id v4 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_251126AA0();
  swift_unknownObjectRelease();
  uint64_t v5 = sub_251126990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v5;
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.init(healthStore:)(uint64_t a1)
{
  uint64_t v3 = sub_251126100();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511261A0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07740], v3);
  sub_251126110();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_251115DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = *v4;
  uint64_t v7 = sub_2511260A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v27 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v13((char *)&v27 - v11, a1, v7);
  v13((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
  uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = v9 + 7;
  unint64_t v17 = (v9 + 7 + v15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = (v14 + 16 + v18) & ~v14;
  unint64_t v20 = (v16 + v19) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v22(v21 + v15, v12, v7);
  *(void *)(v21 + v17) = v4;
  char v23 = (void *)(v21 + v18);
  uint64_t v24 = v29;
  *char v23 = v28;
  v23[1] = v24;
  v22(v21 + v19, v27, v7);
  *(void *)(v21 + v20) = v30;
  uint64_t v25 = *(void (**)(uint64_t (*)(void *), uint64_t))(*v4 + 136);
  swift_retain();
  swift_retain();
  v25(sub_25111BD94, v21);
  return swift_release();
}

uint64_t sub_251116008(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v163 = a7;
  uint64_t v167 = a6;
  uint64_t v174 = a4;
  uint64_t v175 = a5;
  unint64_t v181 = a3;
  uint64_t v170 = a1;
  uint64_t v155 = sub_251126160();
  uint64_t v154 = *(void *)(v155 - 8);
  MEMORY[0x270FA5388](v155);
  uint64_t v152 = (char *)v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_251126170();
  uint64_t v151 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153);
  uint64_t v150 = (char *)v133 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_251126120();
  uint64_t v149 = *(void *)(v160 - 8);
  MEMORY[0x270FA5388](v160);
  uint64_t v148 = (char *)v133 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25111CB3C(0, &qword_269B21390, MEMORY[0x263F079C8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v12 - 8);
  long long v145 = (char *)v133 - v13;
  sub_25111CB3C(0, &qword_269B21398, MEMORY[0x263F07920], v11);
  MEMORY[0x270FA5388](v14 - 8);
  unsigned __int8 v144 = (char *)v133 - v15;
  uint64_t v147 = sub_251126020();
  uint64_t v146 = *(void *)(v147 - 8);
  MEMORY[0x270FA5388](v147);
  long long v159 = (char *)v133 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v17 = *(void *)(v171 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v171);
  uint64_t v143 = (uint64_t)v133 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v169 = (char *)v133 - v20;
  sub_25111CB3C(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], v11);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  char v140 = (char *)v133 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v168 = (char *)v133 - v24;
  sub_25111CB3C(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v11);
  MEMORY[0x270FA5388](v25 - 8);
  char v179 = (double *)((char *)v133 - v26);
  uint64_t v27 = sub_2511261C0();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)v133 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_2511260A0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  long long v162 = (char *)v133 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)v133 - v35;
  uint64_t v180 = sub_2511267E0();
  uint64_t v177 = *(void *)(v180 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v180);
  v178 = (char *)v133 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  char v40 = (char *)v133 - v39;
  uint64_t v41 = swift_allocObject();
  uint64_t v172 = v41;
  *(void *)(v41 + 16) = MEMORY[0x263F8EE78];
  v166 = (unint64_t *)(v41 + 16);
  uint64_t v176 = v32;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  uint64_t v42 = v32 + 16;
  uint64_t v44 = v43;
  v43(v36, a2, v31);
  uint64_t v141 = v28;
  uint64_t v45 = v28;
  size_t v46 = v170;
  int v47 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
  uint64_t v142 = v27;
  v47(v30, v181 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v27);
  sub_2511267C0();
  char v173 = v36;
  if (v46)
  {
    uint64_t v135 = v17;
    int v48 = (int *)v171;
    uint64_t v164 = swift_allocBox();
    uint64_t v136 = v49;
    uint64_t v165 = a2;
    long long v157 = v44;
    v44(v36, a2, v31);
    uint64_t v50 = v177;
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v177 + 16);
    uint64_t v139 = v40;
    uint64_t v52 = v180;
    v51(v178, v40, v180);
    uint64_t v170 = v46;
    size_t v53 = v179;
    sub_251101730(v170, v179);
    uint64_t v54 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v53, 0, 1, v54);
    uint64_t v55 = sub_2511268C0();
    uint64_t v56 = *(void *)(v55 - 8);
    uint64_t v158 = v42;
    uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
    uint64_t v58 = v56 + 56;
    uint64_t v59 = (uint64_t)v168;
    v57(v168, 1, 1, v55);
    uint64_t v156 = v48[7];
    uint64_t v60 = v169;
    uint64_t v61 = (uint64_t)&v169[v48[8]];
    uint64_t v134 = v55;
    v133[1] = v58;
    v133[0] = v57;
    v57((char *)v61, 1, 1, v55);
    uint64_t v62 = &v60[v48[9]];
    *(void *)uint64_t v62 = 0;
    v62[8] = 1;
    uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v176 + 32);
    uint64_t v64 = v173;
    uint64_t v138 = v176 + 32;
    uint64_t v137 = v63;
    v63(v60, v173, v31);
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(&v60[v48[5]], v178, v52);
    sub_2511016B0((uint64_t)v179, (uint64_t)&v60[v48[6]]);
    *(void *)&v60[v156] = 0;
    sub_25110135C(v59, v61);
    *(void *)uint64_t v62 = 0;
    v62[8] = 1;
    uint64_t v65 = (uint64_t)v60;
    uint64_t v66 = v136;
    sub_25111C430(v65, v136);
    id v67 = objc_msgSend(v170, sel_state);
    uint64_t v68 = v165;
    uint64_t v69 = v174;
    uint64_t v70 = v175;
    id v71 = v64;
    uint64_t v72 = v157;
    if (v67 == (id)1)
    {
      uint64_t v156 = v31;
      v157(v64, v165, v31);
      char v179 = v170;
      sub_251124E5C(v179, v64, (char *)&v184);
      uint64_t v73 = (uint64_t)v140;
      sub_2511268B0();
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v133[0])(v73, 0, 1, v134);
      sub_25110135C(v73, v66 + *(int *)(v171 + 32));
      uint64_t v74 = v143;
      sub_25111CA44(v66, v143, type metadata accessor for MenstrualCyclesWidgetEntry);
      uint64_t v75 = v166;
      unint64_t v76 = *v166;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v75 = v76;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v76 = sub_25111F9DC(0, *(void *)(v76 + 16) + 1, 1, v76);
        unint64_t *v75 = v76;
      }
      uint64_t v78 = v135;
      unint64_t v80 = *(void *)(v76 + 16);
      unint64_t v79 = *(void *)(v76 + 24);
      if (v80 >= v79 >> 1)
      {
        unint64_t v76 = sub_25111F9DC(v79 > 1, v80 + 1, 1, v76);
        unint64_t *v75 = v76;
      }
      *(void *)(v76 + 16) = v80 + 1;
      sub_25111C430(v74, v76+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ *(void *)(v78 + 72) * v80);
      v178 = (char *)(v181
                    + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v141 + 56))(v144, 1, 1, v142);
      uint64_t v81 = sub_2511261D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v145, 1, 1, v81);
      sub_251126010();
      uint64_t v82 = v149;
      char v83 = v148;
      (*(void (**)(char *, void, uint64_t))(v149 + 104))(v148, *MEMORY[0x263F07780], v160);
      uint64_t v84 = v151;
      uint64_t v85 = v150;
      uint64_t v86 = v153;
      (*(void (**)(char *, void, uint64_t))(v151 + 104))(v150, *MEMORY[0x263F07800], v153);
      uint64_t v87 = v154;
      long long v88 = v152;
      uint64_t v89 = v155;
      uint64_t v90 = (*(uint64_t (**)(char *, void, uint64_t))(v154 + 104))(v152, *MEMORY[0x263F077E0], v155);
      MEMORY[0x270FA5388](v90);
      sub_251126150();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v89);
      (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v160);
      (*(void (**)(char *, uint64_t))(v146 + 8))(v159, v147);
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v91 = sub_251126270();
      __swift_project_value_buffer(v91, (uint64_t)qword_26B2163B8);
      uint64_t v92 = v172;
      swift_retain_n();
      uint64_t v93 = sub_251126250();
      os_log_type_t v94 = sub_251126A00();
      BOOL v95 = os_log_type_enabled(v93, v94);
      uint64_t v69 = v174;
      uint64_t v96 = v175;
      if (v95)
      {
        uint64_t v97 = swift_slowAlloc();
        uint64_t v98 = swift_slowAlloc();
        uint64_t v184 = v98;
        *(_DWORD *)uint64_t v97 = 136380931;
        uint64_t v99 = sub_251126BD0();
        uint64_t v183 = sub_25110AB00(v99, v100, &v184);
        sub_251126A80();
        swift_bridgeObjectRelease();
        *(_WORD *)(v97 + 12) = 2080;
        sub_25111CB3C(0, &qword_269B213A0, (uint64_t (*)(uint64_t))sub_25111C9DC, MEMORY[0x263F8E0F8]);
        uint64_t v101 = swift_allocObject();
        *(_OWORD *)(v101 + 16) = xmmword_2511273D0;
        swift_beginAccess();
        *(void *)(v101 + 32) = *(void *)(v92 + 16);
        sub_25111C9DC(0);
        uint64_t v103 = v102;
        swift_bridgeObjectRetain();
        uint64_t v104 = MEMORY[0x2533960D0](v101, v103);
        unint64_t v106 = v105;
        uint64_t v69 = v174;
        swift_bridgeObjectRelease();
        uint64_t v182 = sub_25110AB00(v104, v106, &v184);
        uint64_t v96 = v175;
        sub_251126A80();
        swift_release_n();
        id v71 = v173;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510FF000, v93, v94, "[%{private}s] TimelineEntries in the generator are: %s", (uint8_t *)v97, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253396800](v98, -1, -1);
        MEMORY[0x253396800](v97, -1, -1);

        uint64_t v72 = v157;
      }
      else
      {

        swift_release_n();
        uint64_t v72 = v157;
        id v71 = v173;
      }
      swift_beginAccess();
      uint64_t v120 = swift_bridgeObjectRetain();
      v69(v120);
      swift_bridgeObjectRelease();
      uint64_t v70 = v96;
      uint64_t v68 = v165;
      uint64_t v31 = v156;
    }
    v72(v71, v68, v31);
    uint64_t v121 = v162;
    v72(v162, v167, v31);
    uint64_t v122 = *(unsigned __int8 *)(v176 + 80);
    uint64_t v123 = (v122 + 56) & ~v122;
    uint64_t v124 = (v161 + v122 + v123) & ~v122;
    unint64_t v125 = (v161 + v124 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v126 = (char *)swift_allocObject();
    *((void *)v126 + 2) = v69;
    *((void *)v126 + 3) = v70;
    uint64_t v127 = v172;
    *((void *)v126 + 4) = v164;
    *((void *)v126 + 5) = v127;
    uint64_t v128 = &v126[v123];
    uint64_t v129 = v181;
    *((void *)v126 + 6) = v181;
    uint64_t v130 = v137;
    v137(v128, v71, v31);
    v130(&v126[v124], v121, v31);
    *(void *)&v126[v125] = v163;
    uint64_t v131 = *(void (**)(uint64_t (*)(void *), char *))(*(void *)v129 + 128);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v131(sub_25111C918, v126);

    swift_release();
    (*(void (**)(char *, uint64_t))(v177 + 8))(v139, v180);
    swift_release();
  }
  else
  {
    sub_25111CB3C(0, &qword_269B21068, type metadata accessor for MenstrualCyclesWidgetEntry, MEMORY[0x263F8E0F8]);
    unint64_t v107 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_2511273D0;
    unint64_t v181 = v108 + v107;
    v44(v36, a2, v31);
    uint64_t v109 = v177;
    (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v178, v40, v180);
    uint64_t v110 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v179, 1, 1, v110);
    uint64_t v111 = sub_2511268C0();
    uint64_t v156 = v31;
    uint64_t v112 = v111;
    char v113 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 56);
    uint64_t v114 = (uint64_t)v168;
    v113(v168, 1, 1, v111);
    uint64_t v115 = (int *)v171;
    uint64_t v170 = (void *)*(int *)(v171 + 28);
    uint64_t v116 = (uint64_t)v169;
    uint64_t v117 = (uint64_t)&v169[*(int *)(v171 + 32)];
    v113((char *)v117, 1, 1, v112);
    uint64_t v118 = v116 + v115[9];
    *(void *)uint64_t v118 = 0;
    *(unsigned char *)(v118 + 8) = 1;
    (*(void (**)(uint64_t, char *, uint64_t))(v176 + 32))(v116, v173, v156);
    uint64_t v119 = v180;
    (*(void (**)(uint64_t, char *, uint64_t))(v109 + 32))(v116 + v115[5], v178, v180);
    sub_2511016B0((uint64_t)v179, v116 + v115[6]);
    *(void *)((char *)v170 + v116) = 0;
    sub_25110135C(v114, v117);
    *(void *)uint64_t v118 = 0;
    *(unsigned char *)(v118 + 8) = 1;
    sub_25111C430(v116, v181);
    v174(v108);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v109 + 8))(v40, v119);
  }
  return swift_release();
}

uint64_t sub_251117498(unint64_t *a1, uint64_t a2, void (*a3)(char *, char *, uint64_t), uint64_t a4, uint64_t a5, void *a6, unint64_t *a7)
{
  uint64_t v65 = a5;
  uint64_t v66 = a6;
  uint64_t v73 = a4;
  uint64_t v64 = a3;
  unint64_t v79 = a1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25111CB3C(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v68 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (uint64_t)v61 - v12;
  sub_25111CB3C(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v75 = (double *)((char *)v61 - v14);
  uint64_t v67 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v70 = *(void *)(v67 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v67);
  uint64_t v69 = (uint64_t)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v61 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v71 = (uint64_t)v61 - v20;
  uint64_t v21 = sub_2511261C0();
  uint64_t v63 = *(void (***)(char *, uint64_t, uint64_t))(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_2511267E0();
  uint64_t v77 = *(void *)(v24 - 8);
  uint64_t v78 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v74 = (char *)v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  unint64_t v76 = (char *)v61 - v27;
  sub_25111CA10(0);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)v61 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_2511260A0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v61 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)v61 - v36;
  sub_25111CA44((uint64_t)v79, (uint64_t)v30, (uint64_t (*)(void))sub_25111CA10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
  {
    uint64_t v38 = (uint64_t (*)(void))sub_25111CA10;
    uint64_t v39 = (uint64_t)v30;
  }
  else
  {
    unint64_t v79 = a7;
    char v40 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v40(v37, v30, v31);
    if (sub_251126070())
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v37, v31);
      *(unsigned char *)uint64_t v64 = 1;
      return result;
    }
    uint64_t v73 = v32;
    uint64_t v62 = v40;
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
    v42(v35, v37, v31);
    uint64_t v64 = v42;
    v61[1] = v32 + 16;
    v63[2](v23, v65 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v21);
    uint64_t v43 = v76;
    sub_2511267C0();
    v42(v35, v37, v31);
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v74, v43, v78);
    uint64_t v66 = v66;
    uint64_t v44 = v75;
    sub_251101730(v66, v75);
    uint64_t v45 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
    uint64_t v46 = sub_2511268C0();
    uint64_t v47 = *(void *)(v46 - 8);
    int v48 = *(void (***)(char *, uint64_t, uint64_t))(v47 + 56);
    uint64_t v63 = v48;
    uint64_t v65 = v47 + 56;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v48)(v72, 1, 1, v46);
    uint64_t v49 = (int *)v67;
    v61[0] = *(int *)(v67 + 28);
    uint64_t v50 = (uint64_t)&v19[*(int *)(v67 + 32)];
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v48)(v50, 1, 1, v46);
    uint64_t v51 = &v19[v49[9]];
    *(void *)uint64_t v51 = 0;
    v51[8] = 1;
    v62(v19, v35, v31);
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(&v19[v49[5]], v74, v78);
    sub_2511016B0((uint64_t)v75, (uint64_t)&v19[v49[6]]);
    *(void *)&v19[v61[0]] = 0;
    sub_25110135C(v72, v50);
    *(void *)uint64_t v51 = 0;
    v51[8] = 1;
    uint64_t v52 = v71;
    sub_25111C430((uint64_t)v19, v71);
    v64(v35, v37, v31);
    sub_251124E5C(v66, v35, v80);
    uint64_t v53 = (uint64_t)v68;
    sub_2511268B0();
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v63)(v53, 0, 1, v46);
    sub_25110135C(v53, v52 + v49[8]);
    uint64_t v54 = v69;
    sub_25111CA44(v52, v69, type metadata accessor for MenstrualCyclesWidgetEntry);
    uint64_t v55 = v79;
    unint64_t v56 = *v79;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v55 = v56;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v56 = sub_25111F9DC(0, *(void *)(v56 + 16) + 1, 1, v56);
      *uint64_t v55 = v56;
    }
    unint64_t v59 = *(void *)(v56 + 16);
    unint64_t v58 = *(void *)(v56 + 24);
    uint64_t v60 = v73;
    if (v59 >= v58 >> 1)
    {
      unint64_t v56 = sub_25111F9DC(v58 > 1, v59 + 1, 1, v56);
      *uint64_t v55 = v56;
    }
    *(void *)(v56 + 16) = v59 + 1;
    sub_25111C430(v54, v56+ ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80))+ *(void *)(v70 + 72) * v59);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v76, v78);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v31);
    uint64_t v38 = type metadata accessor for MenstrualCyclesWidgetEntry;
    uint64_t v39 = v52;
  }
  return sub_25111CAAC(v39, v38);
}

uint64_t sub_251117D00(void *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v76 = a8;
  uint64_t v78 = a7;
  uint64_t v84 = a6;
  uint64_t v81 = a3;
  uint64_t v79 = sub_251126160();
  uint64_t v77 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v74 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_251126170();
  uint64_t v72 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v73 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_251126120();
  uint64_t v69 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v15 = (char *)v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25111CB3C(0, &qword_269B21390, MEMORY[0x263F079C8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v65 - v18;
  sub_25111CB3C(0, &qword_269B21398, MEMORY[0x263F07920], v16);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)v65 - v21;
  uint64_t v71 = sub_251126020();
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v24 = (char *)v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v28 = (char *)v65 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = swift_projectBox();
  if (a1)
  {
    uint64_t v66 = a5;
    uint64_t v30 = (unint64_t *)(a5 + 16);
    swift_beginAccess();
    v65[2] = v29;
    sub_25111CA44(v29, (uint64_t)v28, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_beginAccess();
    unint64_t v31 = *v30;
    id v80 = a1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t *v30 = v31;
    uint64_t v82 = v30;
    uint64_t v67 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v31 = sub_25111F9DC(0, *(void *)(v31 + 16) + 1, 1, v31);
      unint64_t *v30 = v31;
    }
    uint64_t v68 = a9;
    unint64_t v34 = *(void *)(v31 + 16);
    unint64_t v33 = *(void *)(v31 + 24);
    if (v34 >= v33 >> 1)
    {
      unint64_t v31 = sub_25111F9DC(v33 > 1, v34 + 1, 1, v31);
      *uint64_t v82 = v31;
    }
    *(void *)(v31 + 16) = v34 + 1;
    sub_25111C430((uint64_t)v28, v31+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v34);
    swift_endAccess();
    v65[1] = v84
           + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
    uint64_t v35 = sub_2511261C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v22, 1, 1, v35);
    uint64_t v36 = sub_2511261D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v19, 1, 1, v36);
    v65[0] = v24;
    sub_251126010();
    uint64_t v37 = v69;
    uint64_t v38 = v15;
    (*(void (**)(char *, void, uint64_t))(v69 + 104))(v15, *MEMORY[0x263F07780], v83);
    uint64_t v39 = v72;
    char v40 = v73;
    uint64_t v41 = v75;
    (*(void (**)(char *, void, uint64_t))(v72 + 104))(v73, *MEMORY[0x263F07800], v75);
    uint64_t v42 = v77;
    uint64_t v43 = v74;
    uint64_t v44 = v79;
    uint64_t v45 = (*(uint64_t (**)(char *, void, uint64_t))(v77 + 104))(v74, *MEMORY[0x263F077E0], v79);
    MEMORY[0x270FA5388](v45);
    sub_251126150();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v83);
    (*(void (**)(void, uint64_t))(v70 + 8))(v65[0], v71);
    if (qword_26B216108 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_251126270();
    __swift_project_value_buffer(v46, (uint64_t)qword_26B2163B8);
    uint64_t v47 = v66;
    swift_retain_n();
    int v48 = sub_251126250();
    os_log_type_t v49 = sub_251126A00();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v86 = v51;
      *(_DWORD *)uint64_t v50 = 136380931;
      uint64_t v52 = sub_251126BD0();
      uint64_t v85 = sub_25110AB00(v52, v53, &v86);
      sub_251126A80();
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v84 = v50 + 14;
      sub_25111CB3C(0, &qword_269B213A0, (uint64_t (*)(uint64_t))sub_25111C9DC, MEMORY[0x263F8E0F8]);
      uint64_t v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_2511273D0;
      swift_beginAccess();
      *(void *)(v54 + 32) = *(void *)(v47 + 16);
      uint64_t v85 = v54;
      sub_25111CB3C(0, &qword_269B213B0, (uint64_t (*)(uint64_t))sub_25111C9DC, MEMORY[0x263F8D488]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_251126B90();
      id v55 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_251126AA0();
      swift_unknownObjectRelease();
      uint64_t v56 = sub_251126990();
      unint64_t v58 = v57;
      swift_bridgeObjectRelease();
      uint64_t v85 = sub_25110AB00(v56, v58, &v86);
      sub_251126A80();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2510FF000, v48, v49, "[%{private}s] TimelineEntries in the generator are: %s", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253396800](v51, -1, -1);
      MEMORY[0x253396800](v50, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    unint64_t v59 = v67;
    swift_beginAccess();
    uint64_t v63 = swift_bridgeObjectRetain();
    v59(v63);
  }
  else
  {
    sub_25111CB3C(0, &qword_269B21068, type metadata accessor for MenstrualCyclesWidgetEntry, MEMORY[0x263F8E0F8]);
    uint64_t v60 = v29;
    unint64_t v61 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_2511273D0;
    swift_beginAccess();
    sub_25111CA44(v60, v62 + v61, type metadata accessor for MenstrualCyclesWidgetEntry);
    a2(v62);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25111887C(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, unint64_t *a8, uint64_t a9)
{
  uint64_t v111 = a8;
  uint64_t v113 = a7;
  uint64_t v102 = a6;
  id v112 = a5;
  uint64_t v107 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v110 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v109 = (char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111CB3C(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v103 = (char *)&v93 - v13;
  uint64_t v14 = sub_2511261C0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_2511267E0();
  uint64_t v104 = *(void *)(v105 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v105);
  uint64_t v20 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v108 = (char *)&v93 - v21;
  sub_25111CA10(0);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_2511260A0();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  unint64_t v106 = (char *)&v93 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v93 - v28;
  uint64_t v30 = a1;
  uint64_t v32 = v31;
  sub_25111CA44(v30, (uint64_t)v24, (uint64_t (*)(void))sub_25111CA10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v24, 1, v25) == 1) {
    return sub_25111CAAC((uint64_t)v24, (uint64_t (*)(void))sub_25111CA10);
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v24, v25);
  if (sub_251126070())
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v29, v25);
    *a3 = 1;
  }
  else
  {
    uint64_t v99 = a9;
    id v34 = v112;
    unsigned int v35 = objc_msgSend(v112, sel_menstruationProjectionsEnabled);
    uint64_t v101 = v29;
    uint64_t v100 = v32;
    if (!v35) {
      goto LABEL_14;
    }
    id v36 = objc_msgSend(v34, sel_menstruationProjections);
    uint64_t v37 = sub_25110540C(0, &qword_269B21380);
    unint64_t v38 = sub_2511269C0();

    if (v38 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_251126B30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v39)
    {
      uint64_t v98 = *(void (**)(char *, char *, uint64_t))(v100 + 16);
      uint64_t v97 = v100 + 16;
      v98(v106, v101, v25);
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v102 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v14);
      sub_2511267C0();
      char v40 = sub_25111957C();
      if (!v40)
      {
        uint64_t v102 = v37;
        if (qword_26B216108 != -1) {
          swift_once();
        }
        uint64_t v41 = sub_251126270();
        __swift_project_value_buffer(v41, (uint64_t)qword_26B2163B8);
        uint64_t v42 = v104;
        uint64_t v43 = v105;
        (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v20, v108, v105);
        id v44 = v34;
        uint64_t v45 = sub_251126250();
        os_log_type_t v46 = sub_251126A00();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = swift_slowAlloc();
          uint64_t v96 = 0;
          uint64_t v48 = v47;
          uint64_t v95 = swift_slowAlloc();
          uint64_t v115 = v95;
          *(_DWORD *)uint64_t v48 = 136446722;
          os_log_t v94 = v45;
          uint64_t v49 = sub_251126BD0();
          v114[0] = sub_25110AB00(v49, v50, &v115);
          sub_251126A80();
          swift_bridgeObjectRelease();
          *(_WORD *)(v48 + 12) = 2082;
          sub_25111C770();
          uint64_t v51 = sub_251126B50();
          v114[0] = sub_25110AB00(v51, v52, &v115);
          sub_251126A80();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v43);
          *(_WORD *)(v48 + 22) = 2080;
          id v53 = objc_msgSend(v44, sel_menstruationProjections);
          uint64_t v54 = sub_2511269C0();

          v114[0] = v54;
          sub_25111C3C8(0, &qword_269B213B8, &qword_269B21380, 0x263F451B8, MEMORY[0x263F8D488]);
          swift_bridgeObjectRetain();
          sub_251126B90();
          id v55 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_251126AA0();
          swift_unknownObjectRelease();
          uint64_t v56 = sub_251126990();
          unint64_t v58 = v57;
          swift_bridgeObjectRelease();
          uint64_t v59 = v56;
          id v34 = v112;
          v114[0] = sub_25110AB00(v59, v58, &v115);
          sub_251126A80();

          swift_bridgeObjectRelease();
          os_log_t v60 = v94;
          _os_log_impl(&dword_2510FF000, v94, v46, "[%{public}s] TimelineEntries: No projection found that contains %{public}s in %s", (uint8_t *)v48, 0x20u);
          uint64_t v61 = v95;
          swift_arrayDestroy();
          MEMORY[0x253396800](v61, -1, -1);
          uint64_t v62 = v48;
          char v40 = v96;
          MEMORY[0x253396800](v62, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v43);
        }
      }
      uint64_t v73 = v113;
      swift_beginAccess();
      uint64_t v74 = *(int *)(v107 + 28);
      uint64_t v75 = *(void **)(v73 + v74);
      *(void *)(v73 + v74) = v40;
      uint64_t v76 = v40;
      id v77 = v40;

      id v78 = objc_msgSend(v34, sel_lastMenstrualFlowDayIndex);
      uint64_t v79 = v78;
      uint64_t v71 = v110;
      uint64_t v70 = v111;
      uint64_t v72 = (uint64_t)v109;
      if (v78)
      {
        id v80 = objc_msgSend(v78, sel_integerValue);
      }
      else
      {
        id v80 = 0;
      }
      uint64_t v81 = v113;
      swift_beginAccess();
      uint64_t v82 = v107;
      uint64_t v83 = v81 + *(int *)(v107 + 36);
      *(void *)uint64_t v83 = v80;
      *(unsigned char *)(v83 + 8) = v79 == 0;
      uint64_t v84 = (uint64_t)v106;
      v98(v106, v101, v25);
      id v85 = v77;
      sub_251124A50(v76, v84, (char *)v114);
      uint64_t v86 = (uint64_t)v103;
      sub_2511268B0();

      (*(void (**)(char *, uint64_t))(v104 + 8))(v108, v105);
      uint64_t v87 = sub_2511268C0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(v86, 0, 1, v87);
      swift_beginAccess();
      sub_25110135C(v86, v81 + *(int *)(v82 + 32));
    }
    else
    {
LABEL_14:
      if (qword_26B216108 != -1) {
        swift_once();
      }
      uint64_t v63 = sub_251126270();
      __swift_project_value_buffer(v63, (uint64_t)qword_26B2163B8);
      uint64_t v64 = sub_251126250();
      os_log_type_t v65 = sub_251126A30();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        v114[0] = v67;
        *(_DWORD *)uint64_t v66 = 136446210;
        uint64_t v68 = sub_251126BD0();
        uint64_t v115 = sub_25110AB00(v68, v69, v114);
        sub_251126A80();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510FF000, v64, v65, "[%{public}s] TimelineEntries: Projections unavailable.", v66, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253396800](v67, -1, -1);
        MEMORY[0x253396800](v66, -1, -1);
      }

      uint64_t v71 = v110;
      uint64_t v70 = v111;
      uint64_t v72 = (uint64_t)v109;
    }
    uint64_t v88 = v113;
    swift_beginAccess();
    sub_25111CA44(v88, v72, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_beginAccess();
    unint64_t v89 = *v70;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v70 = v89;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v89 = sub_25111F9DC(0, *(void *)(v89 + 16) + 1, 1, v89);
      *uint64_t v70 = v89;
    }
    unint64_t v92 = *(void *)(v89 + 16);
    unint64_t v91 = *(void *)(v89 + 24);
    if (v92 >= v91 >> 1)
    {
      unint64_t v89 = sub_25111F9DC(v91 > 1, v92 + 1, 1, v89);
      *uint64_t v70 = v89;
    }
    *(void *)(v89 + 16) = v92 + 1;
    sub_25111C430(v72, v89+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v92);
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v101, v25);
  }
  return result;
}

void *sub_25111957C()
{
  id v1 = objc_msgSend(v0, sel_menstruationProjections);
  sub_25110540C(0, &qword_269B21380);
  unint64_t v2 = sub_2511269C0();

  if (v2 >> 62) {
    goto LABEL_17;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2533961F0](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = objc_msgSend(v5, sel_allDays);
      if (sub_2511267D0() < (uint64_t)v8)
      {

        goto LABEL_13;
      }
      objc_msgSend(v6, sel_allDays);
      if (sub_251126A40())
      {
        swift_bridgeObjectRelease();
        return v6;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_251126B30();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_251119700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v44 = a3;
  uint64_t v45 = *v4;
  os_log_type_t v46 = v4;
  uint64_t v41 = sub_2511261C0();
  uint64_t v6 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  id v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2511260A0();
  uint64_t v36 = *(void *)(v9 - 8);
  uint64_t v10 = v36;
  uint64_t v42 = *(void *)(v36 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_2511267E0();
  uint64_t v38 = *(void *)(v40 - 8);
  uint64_t v13 = *(void *)(v38 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v40);
  uint64_t v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v34 = v9;
  v17(v12, a1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, (uint64_t)v46+ OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v41);
  uint64_t v39 = v16;
  unsigned int v35 = v12;
  sub_2511267C0();
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  v17(v12, a1, v9);
  uint64_t v19 = v37;
  uint64_t v20 = v38;
  uint64_t v21 = v40;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v37, v16, v40);
  uint64_t v22 = v36;
  unint64_t v23 = (*(unsigned __int8 *)(v36 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v24 = v20;
  unint64_t v25 = (v42 + *(unsigned __int8 *)(v20 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v26 = (v13 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = (char *)swift_allocObject();
  uint64_t v29 = v43;
  uint64_t v28 = v44;
  *((void *)v27 + 2) = v18;
  *((void *)v27 + 3) = v28;
  *((void *)v27 + 4) = v29;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v27[v23], v35, v34);
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v27[v25], v19, v21);
  uint64_t v30 = v46;
  *(void *)&v27[v26] = v45;
  uint64_t v31 = *(void (**)(uint64_t (*)(uint64_t), char *))(*v30 + 136);
  swift_retain();
  swift_retain();
  v31(sub_25111BFFC, v27);
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v39, v21);
  return swift_release();
}

uint64_t sub_251119AE0(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v90 = a7;
  uint64_t v98 = a6;
  uint64_t v99 = a5;
  uint64_t v93 = a4;
  os_log_t v94 = a3;
  uint64_t v95 = a1;
  uint64_t v92 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v7 = MEMORY[0x270FA5388](v92);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v96 = (uint64_t)&v70 - v10;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25111CB3C(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  unint64_t v89 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v102 = (uint64_t)&v70 - v15;
  sub_25111CB3C(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, v11);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v101 = (double *)((char *)&v70 - v17);
  uint64_t v18 = sub_2511267E0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v88 = v20;
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2511260A0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (char *)&v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v100 = v25;
  uint64_t v97 = v21;
  uint64_t v91 = v18;
  if (!Strong) {
    goto LABEL_6;
  }
  if (!v95)
  {
    swift_release();
LABEL_6:
    uint64_t v50 = (uint64_t)v9;
    uint64_t v51 = v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v99, v22);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v98, v18);
    uint64_t v52 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v101, 1, 1, v52);
    uint64_t v53 = sub_2511268C0();
    uint64_t v54 = v96;
    id v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56);
    v55(v102, 1, 1, v53);
    uint64_t v56 = v22;
    unint64_t v57 = (int *)v92;
    uint64_t v99 = *(int *)(v92 + 28);
    uint64_t v58 = v50 + *(int *)(v92 + 32);
    v55(v58, 1, 1, v53);
    uint64_t v59 = v50 + v57[9];
    *(void *)uint64_t v59 = 0;
    *(unsigned char *)(v59 + 8) = 1;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v50, v100, v56);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v50 + v57[5], v97, v91);
    sub_2511016B0((uint64_t)v101, v50 + v57[6]);
    *(void *)(v50 + v99) = 0;
    sub_25110135C(v102, v58);
    *(void *)uint64_t v59 = 0;
    *(unsigned char *)(v59 + 8) = 1;
    sub_25111C430(v50, v54);
    v94(v54);
    return sub_25111CAAC(v54, type metadata accessor for MenstrualCyclesWidgetEntry);
  }
  uint64_t v78 = v24;
  uint64_t v85 = Strong;
  uint64_t v27 = (int *)v92;
  uint64_t v84 = swift_allocBox();
  uint64_t v80 = v28;
  uint64_t v87 = v23;
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  uint64_t v83 = v23 + 16;
  uint64_t v82 = v29;
  v29((char *)&v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v99, v22);
  uint64_t v86 = v19;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v77 = v19 + 16;
  uint64_t v76 = v30;
  v30(v21, v98, v18);
  uint64_t v95 = v95;
  uint64_t v31 = v101;
  sub_251101730(v95, v101);
  uint64_t v32 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  (*(void (**)(double *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
  uint64_t v33 = sub_2511268C0();
  uint64_t v34 = *(void *)(v33 - 8);
  unsigned int v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v36 = v34 + 56;
  uint64_t v37 = v102;
  v35(v102, 1, 1, v33);
  uint64_t v79 = v27[7];
  uint64_t v38 = v96;
  uint64_t v39 = v96 + v27[8];
  uint64_t v75 = v33;
  uint64_t v74 = v35;
  uint64_t v73 = v36;
  v35(v39, 1, 1, v33);
  uint64_t v40 = v18;
  uint64_t v41 = v38 + v27[9];
  *(void *)uint64_t v41 = 0;
  *(unsigned char *)(v41 + 8) = 1;
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v87 + 32);
  uint64_t v43 = v80;
  uint64_t v72 = v87 + 32;
  uint64_t v71 = v42;
  v42((char *)v38, v100, v22);
  uint64_t v44 = v38 + v27[5];
  uint64_t v81 = v22;
  uint64_t v45 = v27;
  uint64_t v70 = *(void (**)(uint64_t, char *, uint64_t))(v86 + 32);
  v70(v44, v97, v40);
  sub_2511016B0((uint64_t)v31, v38 + v27[6]);
  *(void *)(v38 + v79) = 0;
  sub_25110135C(v37, v39);
  *(void *)uint64_t v41 = 0;
  *(unsigned char *)(v41 + 8) = 1;
  sub_25111C430(v38, v43);
  if (objc_msgSend(v95, sel_state) == (id)1)
  {
    os_log_type_t v46 = v100;
    v82(v100, v99, v81);
    uint64_t v47 = v95;
    sub_251124E5C(v47, v46, &v103);
    uint64_t v48 = (uint64_t)v89;
    sub_2511268B0();
    v74(v48, 0, 1, v75);
    sub_25110135C(v48, v43 + v45[8]);
    uint64_t v49 = v96;
    sub_25111CA44(v43, v96, type metadata accessor for MenstrualCyclesWidgetEntry);
    v94(v49);

    swift_release();
    sub_25111CAAC(v49, type metadata accessor for MenstrualCyclesWidgetEntry);
  }
  else
  {
    uint64_t v61 = v97;
    uint64_t v62 = v91;
    v76(v97, v98, v91);
    uint64_t v63 = v81;
    v82(v100, v99, v81);
    unint64_t v64 = (*(unsigned __int8 *)(v86 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
    unint64_t v65 = (v88 + *(unsigned __int8 *)(v87 + 80) + v64) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
    unint64_t v66 = (v78 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v67 = (char *)swift_allocObject();
    uint64_t v68 = v93;
    *((void *)v67 + 2) = v94;
    *((void *)v67 + 3) = v68;
    *((void *)v67 + 4) = v84;
    v70((uint64_t)&v67[v64], v61, v62);
    v71(&v67[v65], v100, v63);
    *(void *)&v67[v66] = v90;
    unint64_t v69 = *(void (**)(uint64_t (*)(uint64_t), char *))(*(void *)v85 + 128);
    swift_retain();
    swift_retain();
    v69(sub_25111C600, v67);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_25111A494(void *a1, void (*a2)(char *), uint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v89 = a7;
  uint64_t v90 = a5;
  uint64_t v85 = a6;
  uint64_t v84 = sub_2511260A0();
  uint64_t v82 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v83 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111CB3C(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v86 = (char *)&v71 - v12;
  uint64_t v13 = sub_2511267E0();
  uint64_t v80 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_251126270();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x270FA5388](v81);
  uint64_t v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = swift_projectBox();
  if (a1)
  {
    uint64_t v87 = a2;
    uint64_t v88 = a3;
    id v23 = a1;
    if ((objc_msgSend(v23, sel_menstruationProjectionsEnabled) & 1) == 0) {
      goto LABEL_11;
    }
    id v24 = objc_msgSend(v23, sel_menstruationProjections);
    uint64_t v79 = sub_25110540C(0, &qword_269B21380);
    unint64_t v25 = sub_2511269C0();

    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_251126B30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v26)
    {
      uint64_t v27 = v13;
      uint64_t v28 = sub_25111957C();
      if (!v28)
      {
        uint64_t v78 = 0;
        if (qword_26B216108 != -1) {
          swift_once();
        }
        uint64_t v29 = __swift_project_value_buffer(v16, (uint64_t)qword_26B2163B8);
        uint64_t v30 = v19;
        (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v29, v16);
        uint64_t v31 = v80;
        uint64_t v32 = v27;
        (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v15, v90, v27);
        id v33 = v23;
        uint64_t v90 = v30;
        uint64_t v34 = sub_251126250();
        os_log_type_t v35 = sub_251126A00();
        int v77 = v35;
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc();
          uint64_t v74 = v15;
          uint64_t v72 = v32;
          uint64_t v37 = v36;
          uint64_t v76 = swift_slowAlloc();
          v92[0] = v76;
          *(_DWORD *)uint64_t v37 = 136446466;
          os_log_t v75 = v34;
          uint64_t v38 = sub_251126BD0();
          uint64_t v89 = v17;
          v91[0] = sub_25110AB00(v38, v39, v92);
          sub_251126A80();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2080;
          sub_25111C770();
          v91[0] = sub_251126B50();
          v91[1] = v40;
          uint64_t v73 = v37 + 14;
          sub_2511269A0();
          uint64_t v41 = v33;
          id v42 = objc_msgSend(v33, sel_menstruationProjections);
          uint64_t v43 = v79;
          uint64_t v44 = sub_2511269C0();

          MEMORY[0x2533960D0](v44, v43);
          sub_2511269A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_251126B90();
          id v45 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_251126AA0();
          swift_unknownObjectRelease();
          uint64_t v46 = sub_251126990();
          unint64_t v48 = v47;
          swift_bridgeObjectRelease();
          v91[0] = sub_25110AB00(v46, v48, v92);
          sub_251126A80();

          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v80 + 8))(v74, v72);

          os_log_t v49 = v75;
          _os_log_impl(&dword_2510FF000, v75, (os_log_type_t)v77, "[%{public}s] Snapshot: No projections found that contains %s", (uint8_t *)v37, 0x16u);
          uint64_t v50 = v76;
          swift_arrayDestroy();
          MEMORY[0x253396800](v50, -1, -1);
          MEMORY[0x253396800](v37, -1, -1);

          (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v16);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
          (*(void (**)(char *, uint64_t))(v17 + 8))(v90, v16);
        }
        uint64_t v28 = v78;
      }
      swift_beginAccess();
      uint64_t v58 = v81;
      uint64_t v59 = *(int *)(v81 + 28);
      os_log_t v60 = *(void **)(v22 + v59);
      *(void *)(v22 + v59) = v28;
      id v61 = v28;

      id v62 = objc_msgSend(v23, sel_lastMenstrualFlowDayIndex);
      uint64_t v63 = v62;
      if (v62)
      {
        id v64 = objc_msgSend(v62, sel_integerValue);
      }
      else
      {
        id v64 = 0;
      }
      unint64_t v57 = v87;
      swift_beginAccess();
      uint64_t v65 = v22 + *(int *)(v58 + 36);
      *(void *)uint64_t v65 = v64;
      *(unsigned char *)(v65 + 8) = v63 == 0;
      uint64_t v66 = (uint64_t)v83;
      (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v83, v85, v84);
      id v67 = v61;
      sub_251124A50(v28, v66, (char *)v91);
      uint64_t v68 = (uint64_t)v86;
      sub_2511268B0();

      uint64_t v69 = sub_2511268C0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v68, 0, 1, v69);
      swift_beginAccess();
      sub_25110135C(v68, v22 + *(int *)(v58 + 32));
    }
    else
    {
LABEL_11:
      if (qword_26B216108 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v16, (uint64_t)qword_26B2163B8);
      uint64_t v51 = sub_251126250();
      os_log_type_t v52 = sub_251126A30();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        v91[0] = v54;
        *(_DWORD *)uint64_t v53 = 136446210;
        uint64_t v55 = sub_251126BD0();
        v92[0] = sub_25110AB00(v55, v56, v91);
        sub_251126A80();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2510FF000, v51, v52, "[%{public}s] Snapshot: Projections unavailable.", v53, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253396800](v54, -1, -1);
        MEMORY[0x253396800](v53, -1, -1);
      }

      unint64_t v57 = v87;
    }
    swift_beginAccess();
    sub_25111CA44(v22, (uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
    v57(v21);
  }
  else
  {
    swift_beginAccess();
    sub_25111CA44(v22, (uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
    a2(v21);
  }
  return sub_25111CAAC((uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
}

void sub_25111AF24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  uint64_t v7 = sub_2511260D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  v12[5] = v6;
  id v13 = objc_allocWithZone(MEMORY[0x263F45120]);
  uint64_t v22 = sub_25111C040;
  id v23 = v12;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v19 = 1107296256;
  uint64_t v20 = sub_25111C080;
  uint64_t v21 = &block_descriptor;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  id v15 = objc_msgSend(v13, sel_initWithUpdateHandler_, v14);
  _Block_release(v14);
  swift_release();
  swift_release();
  unint64_t aBlock = 0;
  unint64_t v19 = 0xE000000000000000;
  id v16 = v15;
  sub_251126AD0();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000027;
  unint64_t v19 = 0x8000000251128C50;
  sub_2511260C0();
  sub_2511260B0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2511269A0();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_251126960();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setDebugIdentifier_, v17);

  objc_msgSend((id)v3[2], sel_executeQuery_, v16);
}

void sub_25111B1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  uint64_t v7 = sub_2511260D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  v12[5] = v6;
  id v13 = objc_allocWithZone(MEMORY[0x263F0A490]);
  uint64_t v22 = sub_25111C0E0;
  id v23 = v12;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v19 = 1107296256;
  uint64_t v20 = sub_25111C080;
  uint64_t v21 = &block_descriptor_17;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  id v15 = objc_msgSend(v13, sel_initWithUpdateHandler_, v14);
  _Block_release(v14);
  swift_release();
  swift_release();
  unint64_t aBlock = 0;
  unint64_t v19 = 0xE000000000000000;
  id v16 = v15;
  sub_251126AD0();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000027;
  unint64_t v19 = 0x8000000251128C50;
  sub_2511260C0();
  sub_2511260B0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2511269A0();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_251126960();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setDebugIdentifier_, v17);

  objc_msgSend((id)v3[2], sel_executeQuery_, v16);
}

void sub_25111B4A4(void *a1, void *a2, void *a3, uint64_t a4, void (*a5)(void), uint64_t a6, uint64_t a7, char a8, const char *a9, const char *a10)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v16 = *(id *)(Strong + 16);
    swift_release();
    objc_msgSend(v16, sel_stopQuery_, a1);
  }
  if (a2)
  {
    uint64_t v17 = qword_26B216108;
    id v18 = a2;
    if (v17 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_251126270();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B2163B8);
    id v20 = a1;
    id v21 = v18;
    id v22 = v20;
    id v23 = v21;
    id v24 = sub_251126250();
    os_log_type_t v25 = sub_251126A30();
    if (os_log_type_enabled(v24, v25))
    {
      char v26 = a8;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v53 = (void *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v57 = v54;
      *(_DWORD *)uint64_t v27 = 136446722;
      uint64_t v55 = a5;
      uint64_t v28 = sub_251126BD0();
      sub_25110AB00(v28, v29, &v57);
      sub_251126A80();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v27 + 12) = v26;
      *(unsigned char *)(v27 + 13) = 8;
      id v30 = v23;
      id v31 = (id)HKSensitiveLogItem();
      sub_251126AA0();
      swift_unknownObjectRelease();
      uint64_t v32 = sub_251126990();
      unint64_t v34 = v33;

      sub_25110AB00(v32, v34, &v57);
      sub_251126A80();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 22) = 2112;
      v56[0] = (uint64_t)v22;
      id v35 = v22;
      a5 = v55;
      sub_251126A80();
      void *v53 = v22;

      _os_log_impl(&dword_2510FF000, v24, v25, a9, (uint8_t *)v27, 0x20u);
      sub_25111C3C8(0, &qword_26B216150, &qword_26B216148, 0x263F8C6D0, MEMORY[0x263F8D8F0]);
      swift_arrayDestroy();
      MEMORY[0x253396800](v53, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253396800](v54, -1, -1);
      MEMORY[0x253396800](v27, -1, -1);
    }
    else
    {
    }
    id v52 = v23;
    a5(a2);
  }
  else
  {
    if (qword_26B216108 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_251126270();
    __swift_project_value_buffer(v36, (uint64_t)qword_26B2163B8);
    id v37 = a3;
    id v38 = a1;
    id v39 = a3;
    id v40 = v38;
    uint64_t v41 = sub_251126250();
    os_log_type_t v42 = sub_251126A10();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136446722;
      v56[0] = v45;
      uint64_t v46 = sub_251126BD0();
      uint64_t v57 = sub_25110AB00(v46, v47, v56);
      sub_251126A80();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v57 = (uint64_t)a3;
      id v48 = a3;
      sub_25111CB3C(0, &qword_269B21370, (uint64_t (*)(uint64_t))sub_25111C370, MEMORY[0x263F8D8F0]);
      uint64_t v49 = sub_251126990();
      uint64_t v57 = sub_25110AB00(v49, v50, v56);
      sub_251126A80();
      swift_bridgeObjectRelease();

      *(_WORD *)(v43 + 22) = 2112;
      uint64_t v57 = (uint64_t)v40;
      id v51 = v40;
      sub_251126A80();
      void *v44 = v40;

      _os_log_impl(&dword_2510FF000, v41, v42, a10, (uint8_t *)v43, 0x20u);
      sub_25111C3C8(0, &qword_26B216150, &qword_26B216148, 0x263F8C6D0, MEMORY[0x263F8D8F0]);
      swift_arrayDestroy();
      MEMORY[0x253396800](v44, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253396800](v45, -1, -1);
      MEMORY[0x253396800](v43, -1, -1);

      a5(0);
    }
    else
    {

      a5(0);
    }
  }
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
  uint64_t v2 = sub_2511261C0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v2);
  return v0;
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
  uint64_t v2 = sub_2511261C0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_25111BC9C()
{
  uint64_t v1 = sub_2511260A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  uint64_t v7 = *(void *)(v2 + 64) + 7;
  unint64_t v8 = (v4 + 16 + ((((v7 + v5) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v4;
  unint64_t v9 = ((v7 + v8) & 0xFFFFFFFFFFFFFFF8) + 8;
  v3(v0 + v5, v1);
  swift_release();
  swift_release();
  v3(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v6);
}

uint64_t sub_25111BD94(void *a1)
{
  uint64_t v3 = *(void *)(sub_2511260A0() - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = *(void *)(v3 + 64) + 7;
  unint64_t v7 = (v6 + v5) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = (v4 + 16 + v8) & ~v4;
  uint64_t v10 = *(void *)(v1 + v7);
  uint64_t v11 = *(void (**)(uint64_t))(v1 + v8);
  uint64_t v12 = *(void *)(v1 + v8 + 8);
  uint64_t v13 = *(void *)(v1 + ((v6 + v9) & 0xFFFFFFFFFFFFFFF8));
  return sub_251116008(a1, v1 + v5, v10, v11, v12, v1 + v9, v13);
}

uint64_t sub_25111BE58()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25111BE90()
{
  uint64_t v1 = sub_2511260A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_2511267E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_25111BFFC(uint64_t a1)
{
  return sub_25111C640(a1, MEMORY[0x263F07490], MEMORY[0x263F090E8], (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, uint64_t))sub_251119AE0);
}

void sub_25111C040(void *a1, void *a2, void *a3)
{
  sub_25111B4A4(a1, a2, a3, *(void *)(v3 + 16), *(void (**)(void))(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), 34, "[%{public}s] Fetched analysis: %{public}s query: %@", "[%{public}s] Error when querying analysis: %s query: %@");
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

uint64_t objectdestroy_9Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25111C0E0(void *a1, void *a2, void *a3)
{
  sub_25111B4A4(a1, a2, a3, *(void *)(v3 + 16), *(void (**)(void))(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), 32, "[%{public}s] Fetched pregnancy model: %s query: %@", "[%{public}s] Error when querying pregnancy state: %s query: %@");
}

void sub_25111C120(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

uint64_t sub_25111C1C0()
{
  return type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetTimelineGenerator()
{
  uint64_t result = qword_26B216070;
  if (!qword_26B216070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25111C214()
{
  uint64_t result = sub_2511261C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MenstrualCyclesWidgetTimelineGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MenstrualCyclesWidgetTimelineGenerator);
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getTimelineOfEntries(for:endDate:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.snapshot(for:family:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getCycleAnalysis(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getPregnancyModel(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

unint64_t sub_25111C370()
{
  unint64_t result = qword_269B21378;
  if (!qword_269B21378)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B21378);
  }
  return result;
}

void sub_25111C3C8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25110540C(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_25111C430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25111C494()
{
  uint64_t v1 = sub_2511267E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_2511260A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_25111C600(uint64_t a1)
{
  return sub_25111C640(a1, MEMORY[0x263F090E8], MEMORY[0x263F07490], (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, uint64_t))sub_25111A494);
}

uint64_t sub_25111C640(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, uint64_t))
{
  uint64_t v7 = *(void *)(a2(0) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(a3(0) - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *((void *)v4 + 2);
  uint64_t v13 = *((void *)v4 + 3);
  uint64_t v14 = *((void *)v4 + 4);
  uint64_t v15 = *(void *)&v4[(*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8];
  return a4(a1, v12, v13, v14, &v4[v8], &v4[v11], v15);
}

unint64_t sub_25111C770()
{
  unint64_t result = qword_269B21388;
  if (!qword_269B21388)
  {
    sub_2511267E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21388);
  }
  return result;
}

uint64_t sub_25111C7C8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25111C800()
{
  uint64_t v1 = sub_2511260A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  unint64_t v8 = ((v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v6);
}

uint64_t sub_25111C918(void *a1)
{
  uint64_t v3 = *(void *)(sub_2511260A0() - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  return sub_251117D00(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), v1 + ((v4 + 56) & ~v4), v1 + ((*(void *)(v3 + 64) + v4 + ((v4 + 56) & ~v4)) & ~v4), *(void *)(v1+ ((*(void *)(v3 + 64) + ((*(void *)(v3 + 64) + v4 + ((v4 + 56) & ~v4)) & ~v4) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_25111C9D0(unint64_t *a1, uint64_t a2, void (*a3)(char *, char *, uint64_t))
{
  return sub_251117498(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void **)(v3 + 32), *(unint64_t **)(v3 + 40));
}

void sub_25111C9DC(uint64_t a1)
{
}

void sub_25111CA10(uint64_t a1)
{
}

uint64_t sub_25111CA44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25111CAAC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25111CB0C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  return sub_25111887C(a1, a2, a3, *(void *)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(unint64_t **)(v3 + 48), *(void *)(v3 + 56));
}

void sub_25111CB3C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t MenstrualCyclesWidgetCircularView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_2511267B0();
  a1[1] = v2;
  sub_25111D5AC();
  return sub_25111CBE8((char *)a1 + *(int *)(v3 + 44));
}

uint64_t sub_25111CBE8@<X0>(char *a1@<X8>)
{
  uint64_t v90 = a1;
  uint64_t v1 = sub_251126470();
  uint64_t v88 = *(void *)(v1 - 8);
  uint64_t v89 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v87 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2511260F0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v86 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_251126940();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v85 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_251126740();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  unint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_251126820();
  uint64_t v9 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  unint64_t v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_251126840();
  uint64_t v12 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111D838();
  uint64_t v72 = v15;
  uint64_t v71 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111D77C();
  uint64_t v77 = v18;
  uint64_t v75 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  id v20 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111D71C();
  uint64_t v73 = v21;
  MEMORY[0x270FA5388](v21);
  id v23 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111D6B4();
  uint64_t v78 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v79 = (char *)&v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v68 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v82 = (uint64_t)&v68 - v30;
  uint64_t v31 = sub_251126800();
  uint64_t v83 = *(void *)(v31 - 8);
  uint64_t v84 = v31;
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v81 = (char *)&v68 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v80 = (char *)&v68 - v34;
  sub_2511267F0();
  sub_2511212B8((uint64_t)v14);
  type metadata accessor for MenstrualCyclesWidgetCircularView();
  sub_2511215AC((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v70);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v69);
  if (qword_26B215FC0 != -1) {
    swift_once();
  }
  id v35 = (id)qword_26B2163A0;
  sub_251126760();
  uint64_t v36 = v74;
  uint64_t v37 = v76;
  (*(void (**)(char *, void, uint64_t))(v74 + 104))(v8, *MEMORY[0x263F1B4B8], v76);
  uint64_t v38 = sub_251126750();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
  uint64_t v91 = v38;
  unint64_t v92 = 0;
  __int16 v93 = 1;
  sub_25111D8BC();
  uint64_t v40 = v39;
  unint64_t v41 = sub_25110D7F0();
  sub_251126690();
  swift_release();
  uint64_t v91 = v40;
  unint64_t v92 = v41;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = v72;
  sub_251126640();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v17, v42);
  LOBYTE(v42) = sub_251126560();
  sub_251126280();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v51 = v75;
  uint64_t v52 = v77;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v23, v20, v77);
  uint64_t v53 = &v23[*(int *)(v73 + 36)];
  char *v53 = v42;
  *((void *)v53 + 1) = v44;
  *((void *)v53 + 2) = v46;
  *((void *)v53 + 3) = v48;
  *((void *)v53 + 4) = v50;
  v53[40] = 0;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v20, v52);
  sub_251126950();
  if (qword_26B216140 != -1) {
    swift_once();
  }
  id v54 = (id)qword_26B2163D0;
  sub_2511260E0();
  uint64_t v91 = sub_251126980();
  unint64_t v92 = v55;
  sub_25111EAE8();
  sub_251115110();
  uint64_t v56 = (uint64_t)v79;
  sub_2511266B0();
  swift_bridgeObjectRelease();
  sub_25111EBC8((uint64_t)v23, (uint64_t (*)(void))sub_25111D71C);
  uint64_t v57 = v87;
  sub_251126460();
  sub_2511262E0();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v57, v89);
  sub_25111EBC8(v56, (uint64_t (*)(void))sub_25111D6B4);
  uint64_t v58 = v82;
  sub_25111EC28((uint64_t)v29, v82);
  uint64_t v60 = v83;
  uint64_t v59 = v84;
  id v61 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  uint64_t v63 = v80;
  id v62 = v81;
  v61(v81, v80, v84);
  sub_25111EC8C(v58, (uint64_t)v29);
  id v64 = v90;
  v61(v90, v62, v59);
  sub_25111D644();
  sub_25111EC8C((uint64_t)v29, (uint64_t)&v64[*(int *)(v65 + 48)]);
  sub_25111EBC8(v58, (uint64_t (*)(void))sub_25111D6B4);
  uint64_t v66 = *(void (**)(char *, uint64_t))(v60 + 8);
  v66(v63, v59);
  sub_25111EBC8((uint64_t)v29, (uint64_t (*)(void))sub_25111D6B4);
  return ((uint64_t (*)(char *, uint64_t))v66)(v62, v59);
}

void sub_25111D5AC()
{
  if (!qword_269B213C0)
  {
    sub_25111E620(255, &qword_269B213C8, (uint64_t (*)(uint64_t))sub_25111D644, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_2511262C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B213C0);
    }
  }
}

void sub_25111D644()
{
  if (!qword_269B213D0)
  {
    sub_251126800();
    sub_25111D6B4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B213D0);
    }
  }
}

void sub_25111D6B4()
{
  if (!qword_269B213D8)
  {
    sub_25111D71C();
    sub_251126540();
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B213D8);
    }
  }
}

void sub_25111D71C()
{
  if (!qword_269B213E0)
  {
    sub_25111D77C();
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B213E0);
    }
  }
}

void sub_25111D77C()
{
  if (!qword_269B213E8)
  {
    sub_25111D838();
    sub_25111D8BC();
    sub_25110D7F0();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B213E8);
    }
  }
}

void sub_25111D838()
{
  if (!qword_269B213F0)
  {
    sub_25111D8BC();
    sub_25110D7F0();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269B213F0);
    }
  }
}

void sub_25111D8BC()
{
  if (!qword_269B21260)
  {
    unint64_t v0 = sub_2511262F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21260);
    }
  }
}

uint64_t sub_25111D91C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25111D938@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_2511267B0();
  a1[1] = v2;
  sub_25111D5AC();
  return sub_25111CBE8((char *)a1 + *(int *)(v3 + 44));
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetCircularView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_25111E620(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_251126840();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    unint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_25111E620(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_251126820();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MenstrualCyclesWidgetCircularView(uint64_t a1, uint64_t a2)
{
  sub_25111E620(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_251126840();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_25111E620(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_251126820();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  else
  {
    return swift_release();
  }
}

void *initializeWithCopy for MenstrualCyclesWidgetCircularView(void *a1, void *a2, uint64_t a3)
{
  sub_25111E620(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_251126840();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_25111E620(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_251126820();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for MenstrualCyclesWidgetCircularView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    sub_25111E084((uint64_t)a1, &qword_26B215FA0, MEMORY[0x263F1FD10]);
    sub_25111E620(0, &qword_26B215FA0, v6, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_251126840();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    unint64_t v11 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    sub_25111E084((uint64_t)a1 + v8, &qword_269B212E0, MEMORY[0x263F1FC90]);
    sub_25111E620(0, &qword_269B212E0, v11, MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_251126820();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25111E084(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_25111E620(0, a2, a3, MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetCircularView(char *a1, char *a2, uint64_t a3)
{
  sub_25111E620(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_251126840();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  sub_25111E620(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  uint64_t v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_251126820();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetCircularView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
    sub_25111E084((uint64_t)a1, &qword_26B215FA0, MEMORY[0x263F1FD10]);
    sub_25111E620(0, &qword_26B215FA0, v6, MEMORY[0x263F185C8]);
    uint64_t v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_251126840();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    uint64_t v10 = *(int *)(a3 + 20);
    unint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
    sub_25111E084((uint64_t)&a1[v10], &qword_269B212E0, MEMORY[0x263F1FC90]);
    sub_25111E620(0, &qword_269B212E0, v13, MEMORY[0x263F185C8]);
    uint64_t v15 = v14;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_251126820();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetCircularView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25111E4C8);
}

uint64_t sub_25111E4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25111E620(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    sub_25111E620(0, &qword_269B21300, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

void sub_25111E620(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetCircularView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25111E698);
}

uint64_t sub_25111E698(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25111E620(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    sub_25111E620(0, &qword_269B21300, MEMORY[0x263F1FC90], MEMORY[0x263F185D0]);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for MenstrualCyclesWidgetCircularView()
{
  uint64_t result = qword_269B213F8;
  if (!qword_269B213F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25111E848()
{
  sub_25111E620(319, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_25111E620(319, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_25111E974()
{
  unint64_t result = qword_269B21408;
  if (!qword_269B21408)
  {
    sub_25111E9CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21408);
  }
  return result;
}

void sub_25111E9CC()
{
  if (!qword_269B21410)
  {
    sub_25111E620(255, &qword_269B213C8, (uint64_t (*)(uint64_t))sub_25111D644, MEMORY[0x263F1BAC8]);
    sub_25111EA60();
    unint64_t v0 = sub_251126780();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21410);
    }
  }
}

unint64_t sub_25111EA60()
{
  unint64_t result = qword_269B21418;
  if (!qword_269B21418)
  {
    sub_25111E620(255, &qword_269B213C8, (uint64_t (*)(uint64_t))sub_25111D644, MEMORY[0x263F1BAC8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21418);
  }
  return result;
}

unint64_t sub_25111EAE8()
{
  unint64_t result = qword_269B21420;
  if (!qword_269B21420)
  {
    sub_25111D71C();
    sub_25111D838();
    sub_25111D8BC();
    sub_25110D7F0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21420);
  }
  return result;
}

uint64_t sub_25111EBC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25111EC28(uint64_t a1, uint64_t a2)
{
  sub_25111D6B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25111EC8C(uint64_t a1, uint64_t a2)
{
  sub_25111D6B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetConfiguration()
{
  return &type metadata for MenstrualCyclesWidgetConfiguration;
}

uint64_t sub_25111ED00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25111ED1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v1 = sub_251126840();
  uint64_t v59 = *(void *)(v1 - 8);
  uint64_t v60 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v58 = (char *)v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2511260F0();
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v55 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_251126940();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v48 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_251126100();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  MEMORY[0x270FA5388](v47);
  id v62 = (void *)((char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25111F720();
  uint64_t v52 = v12;
  uint64_t v49 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v46 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111F7B4();
  uint64_t v53 = *(void *)(v14 - 8);
  uint64_t v54 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v51 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111F884();
  uint64_t v56 = *(void *)(v16 - 8);
  uint64_t v57 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v50 = (char *)v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45[2] = sub_251126970();
  v45[1] = v18;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  uint64_t v20 = swift_allocObject();
  sub_2511261A0();
  uint64_t v21 = *MEMORY[0x263F07740];
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v22(v10, v21, v7);
  sub_251126110();
  id v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v10, v7);
  *(void *)(v20 + 16) = v19;
  uint64_t *v62 = v20;
  uint64_t v24 = v46;
  v22(v10, v21, v7);
  sub_251126110();
  v23(v10, v7);
  type metadata accessor for MenstrualCyclesWidgetEntryView();
  sub_25111F994(&qword_26B215F88, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntryView);
  sub_25111F994(&qword_26B215F70, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetTimelineProvider);
  sub_251126860();
  sub_251126950();
  if (qword_26B216140 != -1) {
    swift_once();
  }
  id v25 = (id)qword_26B2163D0;
  sub_2511260E0();
  uint64_t v63 = sub_251126980();
  uint64_t v64 = v26;
  uint64_t v27 = sub_25111F994(&qword_26B215FA8, (void (*)(uint64_t))sub_25111F720);
  unint64_t v28 = sub_251115110();
  uint64_t v29 = MEMORY[0x263F8D310];
  uint64_t v31 = v51;
  uint64_t v30 = v52;
  sub_2511264B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v30);
  sub_251126950();
  id v32 = (id)qword_26B2163D0;
  sub_2511260E0();
  uint64_t v67 = sub_251126980();
  uint64_t v68 = v33;
  uint64_t v63 = v30;
  uint64_t v64 = v29;
  uint64_t v65 = v27;
  unint64_t v66 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  id v35 = v50;
  uint64_t v36 = v54;
  sub_251126490();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v36);
  uint64_t v38 = v58;
  uint64_t v37 = v59;
  uint64_t v39 = v60;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, *MEMORY[0x263F1FCD8], v60);
  unint64_t v40 = sub_25111FA14(0, 1, 1, MEMORY[0x263F8EE78], qword_26B216158, MEMORY[0x263F1FD10], MEMORY[0x263F1FD10], MEMORY[0x263F1FD10]);
  unint64_t v42 = *(void *)(v40 + 16);
  unint64_t v41 = *(void *)(v40 + 24);
  if (v42 >= v41 >> 1) {
    unint64_t v40 = sub_25111FA14(v41 > 1, v42 + 1, 1, v40, qword_26B216158, MEMORY[0x263F1FD10], MEMORY[0x263F1FD10], MEMORY[0x263F1FD10]);
  }
  *(void *)(v40 + 16) = v42 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v40+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(void *)(v37 + 72) * v42, v38, v39);
  uint64_t v63 = v36;
  uint64_t v64 = MEMORY[0x263F8D310];
  uint64_t v65 = OpaqueTypeConformance2;
  unint64_t v66 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v43 = v57;
  sub_2511264A0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v35, v43);
}

uint64_t sub_25111F628@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25111FE0C(a1, (uint64_t)v6);
  *a2 = swift_getKeyPath();
  sub_25111FE74(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = type metadata accessor for MenstrualCyclesWidgetEntryView();
  return sub_25111C430((uint64_t)v6, (uint64_t)a2 + *(int *)(v7 + 20));
}

void sub_25111F720()
{
  if (!qword_26B215FB0)
  {
    type metadata accessor for MenstrualCyclesWidgetEntryView();
    sub_25111F994(&qword_26B215F88, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntryView);
    unint64_t v0 = sub_251126870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B215FB0);
    }
  }
}

void sub_25111F7B4()
{
  if (!qword_26B216118)
  {
    sub_25111F720();
    sub_25111F994(&qword_26B215FA8, (void (*)(uint64_t))sub_25111F720);
    sub_251115110();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B216118);
    }
  }
}

void sub_25111F884()
{
  if (!qword_26B216110)
  {
    sub_25111F7B4();
    sub_25111F720();
    sub_25111F994(&qword_26B215FA8, (void (*)(uint64_t))sub_25111F720);
    sub_251115110();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B216110);
    }
  }
}

uint64_t sub_25111F994(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25111F9DC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25111FA14(a1, a2, a3, a4, &qword_269B21068, type metadata accessor for MenstrualCyclesWidgetEntry, type metadata accessor for MenstrualCyclesWidgetEntry, type metadata accessor for MenstrualCyclesWidgetEntry);
}

uint64_t sub_25111FA14(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  if (a3)
  {
    unint64_t v12 = *(void *)(a4 + 24);
    uint64_t v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v13 = a2;
      }
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v13 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v13;
  }
  if (!v15)
  {
    id v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_25111FE74(0, a5, a6, MEMORY[0x263F8E0F8]);
  uint64_t v16 = *(void *)(a7(0) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v19 = (void *)swift_allocObject();
  size_t v20 = _swift_stdlib_malloc_size(v19);
  if (!v17 || (v20 - v18 == 0x8000000000000000 ? (BOOL v21 = v17 == -1) : (BOOL v21 = 0), v21))
  {
LABEL_29:
    uint64_t result = sub_251126B10();
    __break(1u);
    return result;
  }
  v19[2] = v14;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v17);
LABEL_19:
  uint64_t v22 = *(void *)(a7(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v19 + v23;
  if (a1)
  {
    if ((unint64_t)v19 < a4 || v24 >= a4 + v23 + *(void *)(v22 + 72) * v14)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v19 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25111FCB0(0, v14, v24, a4, a8);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v19;
}

uint64_t sub_25111FCB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_251126B40();
  __break(1u);
  return result;
}

uint64_t sub_25111FE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_25111FE74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_25111FED8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25111FFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v49 = a6;
  uint64_t v50 = a5;
  uint64_t v51 = a4;
  uint64_t v52 = a3;
  uint64_t v55 = a1;
  uint64_t v48 = a7;
  sub_2511205F8(0, &qword_26B215FD0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v47 = (char *)&v43 - v8;
  uint64_t v56 = sub_2511261C0();
  uint64_t v9 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_251126020();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511261A0();
  sub_2511205F8(0, &qword_269B21428, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
  uint64_t v15 = sub_2511261B0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_251127850;
  size_t v20 = *(void (**)(unint64_t, void, uint64_t))(v16 + 104);
  v20(v19 + v18, *MEMORY[0x263F07878], v15);
  v20(v19 + v18 + v17, *MEMORY[0x263F078A0], v15);
  v20(v19 + v18 + 2 * v17, *MEMORY[0x263F078A8], v15);
  v20(v19 + v18 + 3 * v17, *MEMORY[0x263F07870], v15);
  v20(v19 + v18 + 4 * v17, *MEMORY[0x263F07890], v15);
  v20(v19 + v18 + 5 * v17, *MEMORY[0x263F078C0], v15);
  v20(v19 + v18 + 6 * v17, *MEMORY[0x263F078C8], v15);
  sub_251125AB0(v19);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_251126140();
  swift_bridgeObjectRelease();
  BOOL v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v54 = v9 + 8;
  uint64_t v44 = v21;
  v21(v11, v56);
  uint64_t v22 = sub_251125F90();
  if (v23) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v22;
  }
  uint64_t v25 = sub_251125FB0();
  char v27 = v26;
  uint64_t v28 = sub_251125F50();
  if (v29) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v28;
  }
  uint64_t v31 = sub_251125F70();
  if (v32) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = v31;
  }
  uint64_t v34 = sub_251125FD0();
  if (v35) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v34;
  }
  uint64_t v37 = sub_251125FF0();
  if (v38) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = v37;
  }
  if (__OFADD__(v24, v55))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v27) {
    uint64_t v25 = 0;
  }
  sub_251125FA0();
  if (__OFADD__(v25, v53)) {
    goto LABEL_27;
  }
  sub_251125FC0();
  if (__OFADD__(v30, v52))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_251125F60();
  if (__OFADD__(v33, v51))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  sub_251125F80();
  if (__OFADD__(v36, v50))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_251125FE0();
  if (__OFADD__(v39, v49))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  sub_251126000();
  sub_2511261A0();
  uint64_t v33 = (uint64_t)v47;
  sub_251126180();
  v44(v11, v56);
  uint64_t v40 = sub_2511260A0();
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v33, 1, v40) != 1)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v46);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v48, v33, v40);
  }
LABEL_32:
  sub_25112065C(v33);
  uint64_t result = sub_251126B20();
  __break(1u);
  return result;
}

void sub_2511205F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_25112065C(uint64_t a1)
{
  sub_2511205F8(0, &qword_26B215FD0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MenstrualCyclesWidgetEntryView.init(entry:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = type metadata accessor for MenstrualCyclesWidgetEntryView();
  return sub_251122434(a1, (uint64_t)a2 + *(int *)(v4 + 20), type metadata accessor for MenstrualCyclesWidgetEntry);
}

uint64_t MenstrualCyclesWidgetEntryView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v66 = a1;
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185D0];
  sub_2511229D4(0, &qword_269B21310, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v60 = (uint64_t *)((char *)&v57 - v4);
  sub_2511229D4(0, &qword_269B21308, MEMORY[0x263F18520], v2);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (uint64_t *)((char *)&v57 - v6);
  sub_2511229D4(0, &qword_269B21300, MEMORY[0x263F1FC90], v2);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v57 - v9);
  sub_2511229D4(0, &qword_269B212F8, MEMORY[0x263F1FD10], v2);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v57 - v12);
  sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v70 = (uint64_t)&v57 - v15;
  uint64_t v62 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
  MEMORY[0x270FA5388](v62);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25112495C(0, &qword_269B21430, MEMORY[0x263F19B20]);
  uint64_t v64 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v63 = (uint64_t)&v57 - v19;
  sub_251121E2C(0, &qword_269B21440, MEMORY[0x263F19B20]);
  uint64_t v61 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v68 = (uint64_t)&v57 - v21;
  sub_251121E2C(0, &qword_269B21438, MEMORY[0x263F19B28]);
  uint64_t v65 = v22;
  MEMORY[0x270FA5388](v22);
  uint64_t v69 = (char *)&v57 - v23;
  uint64_t v67 = type metadata accessor for MenstrualCyclesWidgetCircularView();
  uint64_t v24 = MEMORY[0x270FA5388](v67);
  char v26 = (uint64_t *)((char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v57 - v27;
  uint64_t v29 = sub_251126840();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  char v32 = (char *)&v57 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511212B8((uint64_t)v32);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v32, v29);
  if (v33 == *MEMORY[0x263F1FCD8]) {
    goto LABEL_6;
  }
  uint64_t v34 = v17;
  char v35 = v10;
  uint64_t v36 = v7;
  uint64_t v38 = v67;
  uint64_t v37 = v68;
  uint64_t v39 = (uint64_t)v69;
  if (MEMORY[0x263F1FCE8] && v33 == *MEMORY[0x263F1FCE8] || v33 == *MEMORY[0x263F1FD00])
  {
    *char v26 = swift_getKeyPath();
    uint64_t v55 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    swift_storeEnumTagMultiPayload();
    uint64_t v56 = (uint64_t *)((char *)v26 + *(int *)(v38 + 20));
    uint64_t *v56 = swift_getKeyPath();
    sub_2511229D4(0, &qword_269B212E0, MEMORY[0x263F1FC90], v55);
    swift_storeEnumTagMultiPayload();
    sub_251122434((uint64_t)v26, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for MenstrualCyclesWidgetCircularView);
    sub_251122274((uint64_t)v28, v37, (uint64_t (*)(void))type metadata accessor for MenstrualCyclesWidgetCircularView);
    swift_storeEnumTagMultiPayload();
    sub_251121F90(&qword_269B21450, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView);
    sub_251121F90(&qword_269B21458, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView);
    sub_2511264D0();
    sub_2511222DC(v39, v63);
    swift_storeEnumTagMultiPayload();
    sub_251121E9C();
    sub_2511264D0();
    sub_25112235C(v39);
    return sub_2511223D4((uint64_t)v28, (uint64_t (*)(void))type metadata accessor for MenstrualCyclesWidgetCircularView);
  }
  else
  {
    uint64_t v7 = v36;
    uint64_t v10 = v35;
    uint64_t v17 = v34;
    if (v33 == *MEMORY[0x263F1FD08])
    {
LABEL_6:
      uint64_t v40 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntryView() + 20);
      uint64_t v41 = v40 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 24);
      uint64_t v59 = type metadata accessor for MenstrualCyclesWidgetEntry.State;
      uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
      sub_2511249E0(v41, v70, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
      uint64_t *v13 = swift_getKeyPath();
      uint64_t v57 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
      unint64_t v42 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
      sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
      swift_storeEnumTagMultiPayload();
      *uint64_t v10 = swift_getKeyPath();
      uint64_t v43 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
      sub_2511229D4(0, &qword_269B212E0, MEMORY[0x263F1FC90], v42);
      swift_storeEnumTagMultiPayload();
      *uint64_t v7 = swift_getKeyPath();
      uint64_t v44 = (uint64_t (*)(uint64_t))MEMORY[0x263F18520];
      sub_2511229D4(0, &qword_269B212E8, MEMORY[0x263F18520], v42);
      swift_storeEnumTagMultiPayload();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v46 = (uint64_t)v60;
      uint64_t *v60 = KeyPath;
      uint64_t v47 = (uint64_t)v7;
      uint64_t v48 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
      sub_2511229D4(0, &qword_269B212F0, MEMORY[0x263F18D80], v42);
      swift_storeEnumTagMultiPayload();
      uint64_t v49 = swift_getKeyPath();
      uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185D0];
      sub_251122204((uint64_t)v13, (uint64_t)v17, &qword_269B212F8, v57, MEMORY[0x263F185D0]);
      uint64_t v51 = (int *)v62;
      sub_251122204((uint64_t)v10, (uint64_t)&v17[*(int *)(v62 + 20)], &qword_269B21300, v43, v50);
      sub_251122204(v47, (uint64_t)&v17[v51[6]], &qword_269B21308, v44, v50);
      sub_251122204(v46, (uint64_t)&v17[v51[7]], &qword_269B21310, v48, v50);
      uint64_t v52 = &v17[v51[8]];
      *(void *)uint64_t v52 = v49;
      v52[8] = 0;
      sub_251122204(v70, (uint64_t)&v17[v51[9]], &qword_26B216090, v59, v58);
      sub_251122274((uint64_t)v17, v68, (uint64_t (*)(void))type metadata accessor for MenstrualCyclesWidgetRectangularView);
      swift_storeEnumTagMultiPayload();
      sub_251121F90(&qword_269B21450, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView);
      sub_251121F90(&qword_269B21458, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView);
      uint64_t v53 = (uint64_t)v69;
      sub_2511264D0();
      sub_2511222DC(v53, v63);
      swift_storeEnumTagMultiPayload();
      sub_251121E9C();
      sub_2511264D0();
      sub_25112235C(v53);
      return sub_2511223D4((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for MenstrualCyclesWidgetRectangularView);
    }
    swift_storeEnumTagMultiPayload();
    sub_251121E9C();
    sub_2511264D0();
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  }
}

uint64_t sub_2511212B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_251126430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v20 - v11;
  sub_2511249E0(v2, (uint64_t)v20 - v11, &qword_26B215FA0, v8, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_251126840();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, v12, v13);
  }
  else
  {
    os_log_type_t v15 = sub_251126A20();
    uint64_t v16 = sub_251126550();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v20[1] = a1;
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v20[2] = sub_25110AB00(0x6146746567646957, 0xEC000000796C696DLL, &v21);
      sub_251126A80();
      _os_log_impl(&dword_2510FF000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253396800](v19, -1, -1);
      MEMORY[0x253396800](v18, -1, -1);
    }

    sub_251126420();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2511215AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_251126430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FC90];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
  sub_2511229D4(0, &qword_269B212E0, MEMORY[0x263F1FC90], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v20 - v11;
  sub_2511249E0(v2, (uint64_t)v20 - v11, &qword_269B212E0, v8, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_251126820();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, v12, v13);
  }
  else
  {
    os_log_type_t v15 = sub_251126A20();
    uint64_t v16 = sub_251126550();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v20[1] = a1;
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v20[2] = sub_25110AB00(0xD000000000000013, 0x8000000251128EF0, &v21);
      sub_251126A80();
      _os_log_impl(&dword_2510FF000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253396800](v19, -1, -1);
      MEMORY[0x253396800](v18, -1, -1);
    }

    sub_251126420();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_25112189C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_251126430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x263F18D80];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
  sub_2511229D4(0, &qword_269B212F0, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v20 - v11;
  sub_2511249E0(v2, (uint64_t)v20 - v11, &qword_269B212F0, v8, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_2511262D0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, v12, v13);
  }
  else
  {
    os_log_type_t v15 = sub_251126A20();
    uint64_t v16 = sub_251126550();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v20[1] = a1;
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v20[2] = sub_25110AB00(0x5463696D616E7944, 0xEF657A6953657079, &v21);
      sub_251126A80();
      _os_log_impl(&dword_2510FF000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253396800](v19, -1, -1);
      MEMORY[0x253396800](v18, -1, -1);
    }

    sub_251126420();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_251121B94(uint64_t a1, char a2)
{
  uint64_t v4 = sub_251126430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_251126A20();
  uint64_t v9 = sub_251126550();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_25110AB00(1819242306, 0xE400000000000000, &v15);
    sub_251126A80();
    _os_log_impl(&dword_2510FF000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253396800](v12, -1, -1);
    MEMORY[0x253396800](v11, -1, -1);
  }

  sub_251126420();
  swift_getAtKeyPath();
  sub_251112A7C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_251121D98()
{
  return sub_2511263E0();
}

uint64_t sub_251121DBC()
{
  return sub_2511263E0();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntryView()
{
  uint64_t result = qword_26B215F90;
  if (!qword_26B215F90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_251121E2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for MenstrualCyclesWidgetCircularView();
    uint64_t v7 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_251121E9C()
{
  unint64_t result = qword_269B21448;
  if (!qword_269B21448)
  {
    sub_251121E2C(255, &qword_269B21438, MEMORY[0x263F19B28]);
    sub_251121F90(&qword_269B21450, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView);
    sub_251121F90(&qword_269B21458, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21448);
  }
  return result;
}

uint64_t sub_251121F90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_251121FD8()
{
  return sub_2511263F0();
}

uint64_t sub_251121FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511220C4(a1, a2, a3, a4, MEMORY[0x263F1FC90], MEMORY[0x263F1FB98]);
}

uint64_t sub_25112203C()
{
  return sub_251126330();
}

uint64_t sub_251122060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511220C4(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_2511220A0()
{
  return sub_251126340();
}

uint64_t sub_2511220C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_251122194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511220C4(a1, a2, a3, a4, MEMORY[0x263F18D80], MEMORY[0x263F19318]);
}

id sub_2511221D4@<X0>(unsigned char *a1@<X8>)
{
  id result = sub_25110BEBC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_251122204(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_2511229D4(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a2, a1, v7);
  return a2;
}

uint64_t sub_251122274(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2511222DC(uint64_t a1, uint64_t a2)
{
  sub_251121E2C(0, &qword_269B21438, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25112235C(uint64_t a1)
{
  sub_251121E2C(0, &qword_269B21438, MEMORY[0x263F19B28]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2511223D4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_251122434(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25112249C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntryView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_251126840();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2511260A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
    uint64_t v14 = v13[5];
    uint64_t v15 = &v10[v14];
    uint64_t v16 = &v11[v14];
    uint64_t v17 = sub_2511267E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = v13[6];
    uint64_t v19 = (void **)&v10[v18];
    uint64_t v20 = (void **)&v11[v18];
    uint64_t v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      sub_251102AA4();
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)(v24 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v26 + 48))(v20, 1, v24))
      {
        memcpy(v19, v20, *(void *)(v22 + 64));
      }
      else
      {
        uint64_t v27 = v20[1];
        uint64_t v46 = *v20;
        *uint64_t v19 = *v20;
        v19[1] = v27;
        uint64_t v28 = *(int *)(v25 + 64);
        uint64_t v47 = (char *)v20 + v28;
        uint64_t v48 = (char *)v19 + v28;
        uint64_t v29 = sub_251126220();
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16);
        id v30 = v46;
        v45(v48, v47, v29);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v25);
      }
      (*(void (**)(void **, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    uint64_t v31 = v13[7];
    char v32 = *(void **)&v11[v31];
    *(void *)&v10[v31] = v32;
    uint64_t v49 = v13;
    uint64_t v33 = v13[8];
    uint64_t v34 = &v10[v33];
    char v35 = &v11[v33];
    uint64_t v36 = sub_2511268C0();
    uint64_t v37 = *(void *)(v36 - 8);
    uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
    id v39 = v32;
    if (v38(v35, 1, v36))
    {
      sub_2511229D4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
      memcpy(v34, v35, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    uint64_t v41 = v49[9];
    unint64_t v42 = &v10[v41];
    uint64_t v43 = &v11[v41];
    *(void *)unint64_t v42 = *(void *)v43;
    v42[8] = v43[8];
  }
  return a1;
}

void sub_2511229D4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t destroy for MenstrualCyclesWidgetEntryView(uint64_t a1, uint64_t a2)
{
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_251126840();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2511260A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v8 = v5 + v7[5];
  uint64_t v9 = sub_2511267E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = (id *)(v5 + v7[6]);
  uint64_t v11 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    sub_251102AA4();
    uint64_t v13 = v12;
    if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v10, 1, v12))
    {

      uint64_t v14 = (char *)v10 + *(int *)(v13 + 64);
      uint64_t v15 = sub_251126220();
      (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    }
  }

  uint64_t v16 = v5 + v7[8];
  uint64_t v17 = sub_2511268C0();
  uint64_t v20 = *(void *)(v17 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v16, 1, v17);
  if (!result)
  {
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
    return v19(v16, v17);
  }
  return result;
}

void *initializeWithCopy for MenstrualCyclesWidgetEntryView(void *a1, void *a2, uint64_t a3)
{
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_251126840();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2511260A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_2511267E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = v11[6];
  uint64_t v17 = (void **)&v8[v16];
  uint64_t v18 = (void **)&v9[v16];
  uint64_t v19 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v47 = a1;
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v24 + 48))(v18, 1, v22))
    {
      memcpy(v17, v18, *(void *)(v20 + 64));
    }
    else
    {
      uint64_t v25 = v18[1];
      uint64_t v44 = *v18;
      *uint64_t v17 = *v18;
      v17[1] = v25;
      uint64_t v26 = *(int *)(v23 + 64);
      uint64_t v45 = (char *)v18 + v26;
      uint64_t v46 = (char *)v17 + v26;
      uint64_t v27 = sub_251126220();
      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
      id v28 = v44;
      v43(v46, v45, v27);
      (*(void (**)(void **, void, uint64_t, uint64_t))(v24 + 56))(v17, 0, 1, v23);
    }
    (*(void (**)(void **, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v29 = v11[7];
  id v30 = *(void **)&v9[v29];
  *(void *)&v8[v29] = v30;
  uint64_t v31 = v11[8];
  char v32 = &v8[v31];
  uint64_t v33 = &v9[v31];
  uint64_t v34 = sub_2511268C0();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  id v37 = v30;
  if (v36(v33, 1, v34))
  {
    sub_2511229D4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  uint64_t result = v47;
  uint64_t v40 = v11[9];
  uint64_t v41 = &v8[v40];
  unint64_t v42 = &v9[v40];
  *(void *)uint64_t v41 = *(void *)v42;
  v41[8] = v42[8];
  return result;
}

void *assignWithCopy for MenstrualCyclesWidgetEntryView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_251123904((uint64_t)a1);
    sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_251126840();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v75 = a1;
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2511260A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_2511267E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = v11[6];
  uint64_t v17 = (void **)&v8[v16];
  uint64_t v18 = (void **)&v9[v16];
  uint64_t v19 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      sub_251102AA4();
      uint64_t v30 = v29;
      uint64_t v73 = *(void *)(v29 - 8);
      uint64_t v31 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v73 + 48);
      int v32 = v31(v17, 1, v29);
      int v33 = v31(v18, 1, v30);
      if (v32)
      {
        if (!v33)
        {
          uint64_t v34 = *v18;
          *uint64_t v17 = *v18;
          v17[1] = v18[1];
          uint64_t v35 = *(int *)(v30 + 64);
          uint64_t v36 = (char *)v17 + v35;
          uint64_t v71 = (char *)v18 + v35;
          uint64_t v37 = sub_251126220();
          uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
          id v39 = v34;
          v38(v36, v71, v37);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v73 + 56))(v17, 0, 1, v30);
          goto LABEL_19;
        }
      }
      else
      {
        if (!v33)
        {
          uint64_t v62 = *v18;
          uint64_t v63 = *v17;
          *uint64_t v17 = *v18;
          id v64 = v62;

          v17[1] = v18[1];
          uint64_t v65 = *(int *)(v30 + 64);
          uint64_t v66 = (char *)v17 + v65;
          uint64_t v67 = (char *)v18 + v65;
          uint64_t v68 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 24))(v66, v67, v68);
          goto LABEL_19;
        }
        sub_2511223D4((uint64_t)v17, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v28 = *(void *)(v20 + 64);
LABEL_13:
      memcpy(v17, v18, v28);
      goto LABEL_19;
    }
    sub_2511223D4((uint64_t)v17, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_12:
    sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    size_t v28 = *(void *)(*(void *)(v27 - 8) + 64);
    goto LABEL_13;
  }
  if (v23) {
    goto LABEL_12;
  }
  sub_251102AA4();
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v26 + 48))(v18, 1, v24))
  {
    memcpy(v17, v18, *(void *)(v20 + 64));
  }
  else
  {
    uint64_t v74 = v26;
    uint64_t v40 = *v18;
    *uint64_t v17 = *v18;
    v17[1] = v18[1];
    uint64_t v41 = *(int *)(v25 + 64);
    uint64_t v70 = (char *)v18 + v41;
    uint64_t v72 = (char *)v17 + v41;
    uint64_t v42 = sub_251126220();
    uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16);
    id v43 = v40;
    v69(v72, v70, v42);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v74 + 56))(v17, 0, 1, v25);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_19:
  uint64_t v44 = v11[7];
  uint64_t v45 = *(void **)&v8[v44];
  uint64_t v46 = *(void **)&v9[v44];
  *(void *)&v8[v44] = v46;
  id v47 = v46;

  uint64_t v48 = v11[8];
  uint64_t v49 = &v8[v48];
  uint64_t v50 = &v9[v48];
  uint64_t v51 = sub_2511268C0();
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  int v54 = v53(v49, 1, v51);
  int v55 = v53(v50, 1, v51);
  if (!v54)
  {
    if (!v55)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 24))(v49, v50, v51);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
    goto LABEL_24;
  }
  if (v55)
  {
LABEL_24:
    sub_2511229D4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
    memcpy(v49, v50, *(void *)(*(void *)(v56 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v49, v50, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
LABEL_25:
  uint64_t result = v75;
  uint64_t v58 = v11[9];
  uint64_t v59 = &v8[v58];
  uint64_t v60 = &v9[v58];
  uint64_t v61 = *(void *)v60;
  v59[8] = v60[8];
  *(void *)uint64_t v59 = v61;
  return result;
}

uint64_t sub_251123904(uint64_t a1)
{
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetEntryView(char *a1, char *a2, uint64_t a3)
{
  sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_251126840();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2511260A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v14 = v13[5];
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  uint64_t v17 = sub_2511267E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = v13[6];
  uint64_t v19 = &v10[v18];
  uint64_t v20 = &v11[v18];
  uint64_t v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    sub_251102AA4();
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 1, v24))
    {
      memcpy(v19, v20, *(void *)(v22 + 64));
    }
    else
    {
      uint64_t v27 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v27;
      uint64_t v28 = *(int *)(v25 + 64);
      uint64_t v41 = &v19[v28];
      uint64_t v29 = &v20[v28];
      uint64_t v30 = sub_251126220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v41, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v25);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(void *)&v10[v13[7]] = *(void *)&v11[v13[7]];
  uint64_t v31 = v13[8];
  int v32 = &v10[v31];
  int v33 = &v11[v31];
  uint64_t v34 = sub_2511268C0();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
  {
    sub_2511229D4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  uint64_t v37 = v13[9];
  uint64_t v38 = &v10[v37];
  id v39 = &v11[v37];
  *(void *)uint64_t v38 = *(void *)v39;
  v38[8] = v39[8];
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetEntryView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_251123904((uint64_t)a1);
    sub_2511229D4(0, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    uint64_t v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_251126840();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v67 = a1;
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2511260A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  uint64_t v14 = v13[5];
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  uint64_t v17 = sub_2511267E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = v13[6];
  uint64_t v19 = (void **)&v10[v18];
  uint64_t v20 = (void **)&v11[v18];
  uint64_t v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      sub_251102AA4();
      uint64_t v32 = v31;
      uint64_t v66 = *(void *)(v31 - 8);
      int v33 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v66 + 48);
      int v34 = v33(v19, 1, v31);
      int v35 = v33(v20, 1, v32);
      if (v34)
      {
        if (!v35)
        {
          uint64_t v36 = v20[1];
          *uint64_t v19 = *v20;
          v19[1] = v36;
          uint64_t v37 = *(int *)(v32 + 64);
          uint64_t v38 = (char *)v19 + v37;
          id v39 = (char *)v20 + v37;
          uint64_t v40 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v38, v39, v40);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v66 + 56))(v19, 0, 1, v32);
          goto LABEL_18;
        }
      }
      else
      {
        if (!v35)
        {
          uint64_t v61 = *v19;
          *uint64_t v19 = *v20;

          v19[1] = v20[1];
          uint64_t v62 = *(int *)(v32 + 64);
          uint64_t v63 = (char *)v19 + v62;
          id v64 = (char *)v20 + v62;
          uint64_t v65 = sub_251126220();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
          goto LABEL_18;
        }
        sub_2511223D4((uint64_t)v19, (uint64_t (*)(void))sub_251102AA4);
      }
      size_t v30 = *(void *)(v22 + 64);
LABEL_12:
      memcpy(v19, v20, v30);
      goto LABEL_18;
    }
    sub_2511223D4((uint64_t)v19, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_11:
    sub_2511229D4(0, &qword_26B216090, type metadata accessor for MenstrualCyclesWidgetEntry.State, MEMORY[0x263F8D8F0]);
    size_t v30 = *(void *)(*(void *)(v29 - 8) + 64);
    goto LABEL_12;
  }
  if (v25) {
    goto LABEL_11;
  }
  sub_251102AA4();
  uint64_t v27 = v26;
  uint64_t v28 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v28 + 48))(v20, 1, v26))
  {
    memcpy(v19, v20, *(void *)(v22 + 64));
  }
  else
  {
    uint64_t v41 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v41;
    uint64_t v42 = *(int *)(v27 + 64);
    id v43 = (char *)v19 + v42;
    uint64_t v44 = (char *)v20 + v42;
    uint64_t v45 = sub_251126220();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
    (*(void (**)(void **, void, uint64_t, uint64_t))(v28 + 56))(v19, 0, 1, v27);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_18:
  uint64_t v46 = v13[7];
  id v47 = *(void **)&v10[v46];
  *(void *)&v10[v46] = *(void *)&v11[v46];

  uint64_t v48 = v13[8];
  uint64_t v49 = &v10[v48];
  uint64_t v50 = &v11[v48];
  uint64_t v51 = sub_2511268C0();
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  int v54 = v53(v49, 1, v51);
  int v55 = v53(v50, 1, v51);
  if (!v54)
  {
    if (!v55)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 40))(v49, v50, v51);
      goto LABEL_24;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
    goto LABEL_23;
  }
  if (v55)
  {
LABEL_23:
    sub_2511229D4(0, &qword_26B215FB8, MEMORY[0x263F1FDF0], MEMORY[0x263F8D8F0]);
    memcpy(v49, v50, *(void *)(*(void *)(v56 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v49, v50, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
LABEL_24:
  uint64_t result = v67;
  uint64_t v58 = v13[9];
  uint64_t v59 = &v10[v58];
  uint64_t v60 = &v11[v58];
  *(void *)uint64_t v59 = *(void *)v60;
  v59[8] = v60[8];
  return result;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25112455C);
}

uint64_t sub_25112455C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2511229D4(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntryView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251124698);
}

uint64_t sub_251124698(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2511229D4(0, &qword_269B212F8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_2511247CC()
{
  sub_2511229D4(319, &qword_26B215FA0, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_2511248C8()
{
  unint64_t result = qword_269B21460;
  if (!qword_269B21460)
  {
    sub_25112495C(255, &qword_269B21468, MEMORY[0x263F19B28]);
    sub_251121E9C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21460);
  }
  return result;
}

void sub_25112495C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    sub_251121E2C(255, &qword_269B21438, MEMORY[0x263F19B28]);
    unint64_t v7 = a3(a1, v6, MEMORY[0x263F1BA08]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2511249E0(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_2511229D4(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_251124A50@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v38 = a2;
  uint64_t v4 = sub_251126100();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2511261C0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2511260A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2511267E0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v31 - v17;
  id v36 = a1;
  if (a1)
  {
    uint64_t v32 = v9;
    uint64_t v33 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v38, v8);
    uint64_t v20 = v34;
    uint64_t v19 = v35;
    (*(void (**)(char *, void, uint64_t))(v34 + 104))(v6, *MEMORY[0x263F07740], v35);
    sub_251126110();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
    sub_2511267C0();
    id v21 = v36;
    unsigned __int8 v22 = objc_msgSend(v36, sel_isPartiallyLogged);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    if (v22)
    {
      uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
      v23(v16, v12);
LABEL_7:
      uint64_t v27 = v38;
      uint64_t v28 = v32;
      uint64_t v29 = v33;
      objc_msgSend(v21, sel_allDays);
      char v30 = sub_251126A40();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v23)(v18, v12);
      char v25 = v30 & 1;
      goto LABEL_8;
    }
    objc_msgSend(v21, sel_mostLikelyDays);
    char v26 = sub_251126A40();
    uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v16, v12);
    if ((v26 & 1) == 0) {
      goto LABEL_7;
    }

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v38, v33);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v23)(v18, v12);
    char v25 = 2;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v38, v8);
    char v25 = 0;
  }
LABEL_8:
  *uint64_t v37 = v25;
  return result;
}

uint64_t sub_251124E5C@<X0>(void *a1@<X0>, char *a2@<X1>, char *a3@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v77 = sub_2511261C0();
  uint64_t v72 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v76 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_251126020();
  uint64_t v74 = *(void *)(v6 - 8);
  uint64_t v75 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v73 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v78 = (char *)&v61 - v9;
  uint64_t v81 = sub_2511260A0();
  uint64_t v79 = *(void *)(v81 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v81);
  uint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v61 - v13;
  sub_251125A4C(0, &qword_26B215FC8, MEMORY[0x263F062D0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v61 - v16;
  uint64_t v18 = sub_251125F30();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unsigned __int8 v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  int v24 = (char *)&v61 - v23;
  id v80 = a1;
  id v25 = objc_msgSend(a1, sel_pregnancyDuration);
  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    goto LABEL_8;
  }
  char v26 = v25;
  sub_251125F00();

  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  v27(v17, v22, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
LABEL_8:

    (*(void (**)(char *, uint64_t))(v79 + 8))(v82, v81);
    uint64_t result = sub_2511259C0((uint64_t)v17);
LABEL_9:
    char v58 = 0;
    goto LABEL_10;
  }
  uint64_t v70 = a3;
  uint64_t v71 = v24;
  uint64_t v68 = v18;
  v27(v24, v17, v18);
  sub_25111FFEC(0, 0, -1, 0, 0, 0, (uint64_t)v14);
  uint64_t v28 = v76;
  sub_2511261A0();
  sub_251125A4C(0, &qword_269B21428, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
  uint64_t v67 = v29;
  uint64_t v30 = sub_2511261B0();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void *)(v31 + 72);
  uint64_t v33 = *(unsigned __int8 *)(v31 + 80);
  uint64_t v34 = (v33 + 32) & ~v33;
  uint64_t v64 = v34;
  uint64_t v65 = v33 | 7;
  uint64_t v66 = v34 + v32;
  uint64_t v35 = swift_allocObject();
  long long v63 = xmmword_2511273D0;
  *(_OWORD *)(v35 + 16) = xmmword_2511273D0;
  unsigned int v62 = *MEMORY[0x263F07830];
  uint64_t v61 = *(void (**)(uint64_t))(v31 + 104);
  v61(v35 + v34);
  sub_251125AB0(v35);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_251125F10();
  uint64_t v69 = v14;
  id v36 = v28;
  sub_251126130();
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v79 + 8);
  v37(v12, v81);
  uint64_t v79 = *(void *)(v72 + 8);
  uint64_t v38 = v12;
  ((void (*)(char *, uint64_t))v79)(v36, v77);
  sub_2511261A0();
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v63;
  ((void (*)(uint64_t, void, uint64_t))v61)(v39 + v64, v62, v30);
  sub_251125AB0(v39);
  swift_setDeallocating();
  uint64_t v40 = v78;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_251125F10();
  uint64_t v41 = v73;
  uint64_t v42 = v76;
  sub_251126130();
  uint64_t v43 = v81;
  swift_bridgeObjectRelease();
  uint64_t v44 = v38;
  uint64_t v45 = (void (*)(uint64_t, uint64_t))v37;
  v37(v44, v43);
  ((void (*)(char *, uint64_t))v79)(v42, v77);
  uint64_t v46 = v40;
  uint64_t v47 = sub_251125F40();
  if (v48)
  {

    v37(v82, v43);
    uint64_t v59 = v75;
    uint64_t v60 = *(void (**)(char *, uint64_t))(v74 + 8);
    v60(v41, v75);
    v60(v40, v59);
    v37(v69, v43);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v71, v68);
    a3 = v70;
    goto LABEL_9;
  }
  uint64_t v49 = v47;
  uint64_t v79 = sub_251125F40();
  uint64_t v50 = v41;
  char v52 = v51;

  v45((uint64_t)v82, v43);
  uint64_t v53 = v46;
  int v54 = *(void (**)(char *, uint64_t))(v74 + 8);
  int v55 = v50;
  uint64_t v56 = v75;
  v54(v55, v75);
  v54(v53, v56);
  v45((uint64_t)v69, v43);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v71, v68);
  a3 = v70;
  if ((v52 & 1) != 0 || v49 >= v79) {
    goto LABEL_9;
  }
  char v58 = 2;
LABEL_10:
  *a3 = v58;
  return result;
}

float MenstrualCyclesWidgetEntry.RelevanceScore.rawValue.getter()
{
  return flt_251127A8C[*v0];
}

void MenstrualCyclesWidgetEntry.RelevanceScore.init(rawValue:)(char *a1@<X8>, float a2@<S0>)
{
  if (a2 == 0.0)
  {
    *a1 = 0;
  }
  else
  {
    if (a2 == 20.0) {
      char v2 = 2;
    }
    else {
      char v2 = 3;
    }
    if (a2 == 10.0) {
      char v3 = 1;
    }
    else {
      char v3 = v2;
    }
    *a1 = v3;
  }
}

BOOL sub_2511256D4(char *a1, char *a2)
{
  return flt_251127A8C[*a1] == flt_251127A8C[*a2];
}

unint64_t sub_2511256FC()
{
  unint64_t result = qword_269B21470;
  if (!qword_269B21470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B21470);
  }
  return result;
}

uint64_t sub_251125750()
{
  return sub_25112579C();
}

uint64_t sub_25112575C()
{
  return sub_251126BB0();
}

uint64_t sub_251125794()
{
  return sub_25112579C();
}

uint64_t sub_25112579C()
{
  return sub_251126BC0();
}

void sub_2511257EC(float *a1@<X0>, char *a2@<X8>)
{
}

float sub_2511257F4@<S0>(float *a1@<X8>)
{
  float result = flt_251127A8C[*v1];
  *a1 = result;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *float result = *a2;
  return result;
}

uint64_t _s14RelevanceScoreOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14RelevanceScoreOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *float result = a2 + 2;
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
        JUMPOUT(0x251125978);
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
          *float result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2511259A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2511259A8(unsigned char *result, char a2)
{
  *float result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetEntry.RelevanceScore()
{
  return &type metadata for MenstrualCyclesWidgetEntry.RelevanceScore;
}

uint64_t sub_2511259C0(uint64_t a1)
{
  sub_251125A4C(0, &qword_26B215FC8, MEMORY[0x263F062D0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_251125A4C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_251125AB0(uint64_t a1)
{
  uint64_t v2 = sub_2511261B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unsigned int v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_251125D9C();
    uint64_t v9 = sub_251126AB0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_251125E1C(&qword_269B21480);
      uint64_t v16 = sub_251126910();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_251125E1C(&qword_269B21488);
          char v23 = sub_251126930();
          int v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        id v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_251125D9C()
{
  if (!qword_269B21478)
  {
    sub_2511261B0();
    sub_251125E1C(&qword_269B21480);
    unint64_t v0 = sub_251126AC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B21478);
    }
  }
}

uint64_t sub_251125E1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2511261B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t WidgetFamily.menstrualCyclesImageName(for:)()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_251125E7C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_251125EB0()
{
  return MEMORY[0x270EE1350]();
}

uint64_t sub_251125EC0()
{
  return MEMORY[0x270EE1358]();
}

uint64_t sub_251125ED0()
{
  return MEMORY[0x270EE1360]();
}

uint64_t sub_251125EE0()
{
  return MEMORY[0x270EE1388]();
}

uint64_t sub_251125EF0()
{
  return MEMORY[0x270EE1390]();
}

uint64_t sub_251125F00()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_251125F10()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_251125F20()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_251125F30()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_251125F40()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_251125F50()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_251125F60()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_251125F70()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_251125F80()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_251125F90()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_251125FA0()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_251125FB0()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_251125FC0()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_251125FD0()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_251125FE0()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_251125FF0()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_251126000()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_251126010()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_251126020()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_251126030()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_251126040()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_251126050()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_251126060()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_251126070()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_251126080()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_251126090()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2511260A0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2511260B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2511260C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2511260D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2511260E0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2511260F0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_251126100()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_251126110()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_251126120()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_251126130()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_251126140()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_251126150()
{
  return MEMORY[0x270EF1260]();
}

uint64_t sub_251126160()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_251126170()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_251126180()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_251126190()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2511261A0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2511261B0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2511261C0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2511261D0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2511261E0()
{
  return MEMORY[0x270F35D68]();
}

uint64_t sub_2511261F0()
{
  return MEMORY[0x270F35D78]();
}

uint64_t sub_251126200()
{
  return MEMORY[0x270F35D80]();
}

uint64_t sub_251126210()
{
  return MEMORY[0x270F35DA0]();
}

uint64_t sub_251126220()
{
  return MEMORY[0x270F35DA8]();
}

uint64_t sub_251126230()
{
  return MEMORY[0x270F35DB0]();
}

uint64_t sub_251126240()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_251126250()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_251126260()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_251126270()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_251126280()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_251126290()
{
  return MEMORY[0x270F35DB8]();
}

uint64_t sub_2511262A0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2511262B0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2511262C0()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_2511262D0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2511262E0()
{
  return MEMORY[0x270F00170]();
}

uint64_t sub_2511262F0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_251126300()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_251126310()
{
  return MEMORY[0x270F35DC0]();
}

uint64_t sub_251126320()
{
  return MEMORY[0x270F35DC8]();
}

uint64_t sub_251126330()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_251126340()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_251126350()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_251126360()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_251126370()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_251126380()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_251126390()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_2511263A0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_2511263B0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2511263C0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2511263D0()
{
  return MEMORY[0x270F07348]();
}

uint64_t sub_2511263E0()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_2511263F0()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_251126400()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_251126410()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_251126420()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_251126430()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_251126440()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_251126450()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_251126460()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_251126470()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_251126480()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_251126490()
{
  return MEMORY[0x270F073F8]();
}

uint64_t sub_2511264A0()
{
  return MEMORY[0x270F07400]();
}

uint64_t sub_2511264B0()
{
  return MEMORY[0x270F07410]();
}

uint64_t sub_2511264C0()
{
  return MEMORY[0x270F017B8]();
}

uint64_t sub_2511264D0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2511264E0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2511264F0()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_251126500()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_251126510()
{
  return MEMORY[0x270F07428]();
}

uint64_t sub_251126520()
{
  return MEMORY[0x270F025F0]();
}

uint64_t sub_251126530()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_251126540()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_251126550()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_251126560()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_251126570()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_251126580()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_251126590()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_2511265A0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_2511265B0()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_2511265C0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_2511265D0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_2511265E0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_2511265F0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_251126600()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_251126610()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_251126620()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_251126630()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_251126640()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_251126650()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_251126660()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_251126670()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_251126680()
{
  return MEMORY[0x270F03370]();
}

uint64_t sub_251126690()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_2511266A0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2511266B0()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2511266C0()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2511266D0()
{
  return MEMORY[0x270F03B20]();
}

uint64_t sub_2511266E0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_2511266F0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_251126700()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_251126710()
{
  return MEMORY[0x270F045B8]();
}

uint64_t sub_251126720()
{
  return MEMORY[0x270F045D0]();
}

uint64_t sub_251126730()
{
  return MEMORY[0x270F045D8]();
}

uint64_t sub_251126740()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_251126750()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_251126760()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_251126770()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_251126780()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_251126790()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_2511267A0()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_2511267B0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2511267C0()
{
  return MEMORY[0x270EF3360]();
}

uint64_t sub_2511267D0()
{
  return MEMORY[0x270EF3370]();
}

uint64_t sub_2511267E0()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_2511267F0()
{
  return MEMORY[0x270F07498]();
}

uint64_t sub_251126800()
{
  return MEMORY[0x270F074A0]();
}

uint64_t sub_251126810()
{
  return MEMORY[0x270F074A8]();
}

uint64_t sub_251126820()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_251126830()
{
  return MEMORY[0x270F07578]();
}

uint64_t sub_251126840()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_251126860()
{
  return MEMORY[0x270F07788]();
}

uint64_t sub_251126870()
{
  return MEMORY[0x270F07790]();
}

uint64_t sub_251126880()
{
  return MEMORY[0x270F077A8]();
}

uint64_t sub_251126890()
{
  return MEMORY[0x270F077B0]();
}

uint64_t sub_2511268A0()
{
  return MEMORY[0x270F077B8]();
}

uint64_t sub_2511268B0()
{
  return MEMORY[0x270F07848]();
}

uint64_t sub_2511268C0()
{
  return MEMORY[0x270F07850]();
}

uint64_t sub_2511268D0()
{
  return MEMORY[0x270F078B0]();
}

uint64_t sub_2511268E0()
{
  return MEMORY[0x270F078C0]();
}

uint64_t sub_2511268F0()
{
  return MEMORY[0x270F079F0]();
}

uint64_t sub_251126900()
{
  return MEMORY[0x270F079F8]();
}

uint64_t sub_251126910()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_251126920()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_251126930()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_251126940()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_251126950()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_251126960()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_251126970()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_251126980()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_251126990()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2511269A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2511269B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2511269C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2511269D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2511269E0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2511269F0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_251126A00()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_251126A10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_251126A20()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_251126A30()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_251126A40()
{
  return MEMORY[0x270EF3428]();
}

uint64_t sub_251126A50()
{
  return MEMORY[0x270F35DD8]();
}

uint64_t sub_251126A60()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_251126A70()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_251126A80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_251126A90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_251126AA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_251126AB0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_251126AC0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_251126AD0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_251126AE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_251126AF0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_251126B00()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_251126B10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_251126B20()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_251126B30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_251126B40()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_251126B50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_251126B60()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_251126B80()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_251126B90()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_251126BA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_251126BB0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_251126BC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_251126BD0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x270EF3818]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}