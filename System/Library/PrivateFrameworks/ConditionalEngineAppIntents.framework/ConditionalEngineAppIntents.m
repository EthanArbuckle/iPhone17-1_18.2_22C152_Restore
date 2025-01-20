uint64_t sub_24A6ACA68(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for AppIntentError(uint64_t a1)
{
  return sub_24A6ACA90(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24A6ACA90(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s27ConditionalEngineAppIntents14AppIntentErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24A6ACA68(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppIntentError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24A6ACA68(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24A6ACA90(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for AppIntentError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppIntentError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24A6ACA90(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIntentError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIntentError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24A6ACC34(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_24A6ACC50(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppIntentError()
{
  return &type metadata for AppIntentError;
}

unint64_t sub_24A6ACC7C()
{
  unint64_t result = qword_2697AEF50;
  if (!qword_2697AEF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF50);
  }
  return result;
}

uint64_t sub_24A6ACCD0(uint64_t a1, uint64_t a2, char a3)
{
  sub_24A6DB450();
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  MEMORY[0x270FA5388](v6);
  switch(a3)
  {
    case 4:
      uint64_t result = sub_24A6DAC90();
      break;
    default:
      sub_24A6DB440();
      sub_24A6DB430();
      sub_24A6DB420();
      sub_24A6DB430();
      uint64_t result = sub_24A6DACA0();
      break;
  }
  return result;
}

uint64_t sub_24A6ACFEC()
{
  return sub_24A6ACCD0(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_24A6ACFF8()
{
  uint64_t v1 = sub_24A6DACC0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_24A6ACCD0(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  return sub_24A6DB480();
}

uint64_t sub_24A6AD088(uint64_t a1)
{
  unint64_t v2 = sub_24A6AD1F4();
  return MEMORY[0x270F18418](a1, v2);
}

unint64_t sub_24A6AD0C8()
{
  unint64_t result = qword_2697AEF58;
  if (!qword_2697AEF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF58);
  }
  return result;
}

unint64_t sub_24A6AD120()
{
  unint64_t result = qword_2697AEF60;
  if (!qword_2697AEF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF60);
  }
  return result;
}

uint64_t sub_24A6AD174(uint64_t a1)
{
  unint64_t v2 = sub_24A6AD0C8();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24A6AD1B0(uint64_t a1)
{
  unint64_t v2 = sub_24A6AD0C8();
  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t sub_24A6AD1F4()
{
  unint64_t result = qword_2697AEF68;
  if (!qword_2697AEF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF68);
  }
  return result;
}

unint64_t sub_24A6AD24C()
{
  unint64_t result = qword_2697AEF70;
  if (!qword_2697AEF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF70);
  }
  return result;
}

unint64_t sub_24A6AD2A4()
{
  unint64_t result = qword_2697AEF78;
  if (!qword_2697AEF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF78);
  }
  return result;
}

uint64_t sub_24A6AD2F8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6AD32C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A6AD37C()
{
  unint64_t result = qword_2697AEF80;
  if (!qword_2697AEF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF80);
  }
  return result;
}

uint64_t sub_24A6AD3D0()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697B1840);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697B1840);
  return sub_24A6DAC90();
}

uint64_t sub_24A6AD434(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_24A6DB110();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_24A6DAD30();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_24A6DAC50();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v5 = sub_24A6DB3E0();
  v1[15] = v5;
  v1[16] = *(void *)(v5 - 8);
  v1[17] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AEFA8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AEFB0);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  uint64_t v6 = sub_24A6DACD0();
  v1[22] = v6;
  v1[23] = *(void *)(v6 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v7 = sub_24A6DAD60();
  v1[26] = v7;
  v1[27] = *(void *)(v7 - 8);
  v1[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A6AD750, 0, 0);
}

uint64_t sub_24A6AD750()
{
  sub_24A6DB010();
  swift_allocObject();
  *(void *)(v0 + 232) = sub_24A6DB000();
  *(CFAbsoluteTime *)(v0 + 240) = CFAbsoluteTimeGetCurrent();
  sub_24A6AE628(&qword_2697AEFB8);
  uint64_t v1 = sub_24A6DAD40();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 248) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24A6DBD10;
  (*(void (**)(unint64_t, void, uint64_t))(v2 + 104))(v4 + v3, *MEMORY[0x263F4E240], v1);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24A6AD8D4;
  return MEMORY[0x270F3EFC0](v4);
}

uint64_t sub_24A6AD8D4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 264) = a1;
  *(void *)(v3 + 272) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_24A6AE1E0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24A6AD9F0;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6AD9F0()
{
  uint64_t v1 = *(void *)(v0 + 264);
  double v2 = *(double *)(v0 + 240);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 216);
    uint64_t v6 = *(void *)(v0 + 184);
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v9 = *(void (**)(void, unint64_t, void))(v5 + 16);
    v5 += 16;
    v66 = v9;
    unint64_t v10 = *(void *)(v0 + 264)
        + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    uint64_t v65 = *(void *)(v5 + 56);
    int v60 = *MEMORY[0x263F804E8];
    v59 = (uint64_t (**)(uint64_t, uint64_t))(v7 + 88);
    int v58 = *MEMORY[0x263F80460];
    v56 = (void (**)(uint64_t, uint64_t))(v7 + 96);
    v57 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v50 = (void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    v49 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 80) + 8);
    v48 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    int v55 = *MEMORY[0x263F80428];
    v67 = (void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    v62 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v64 = (void (**)(uint64_t, uint64_t))(v5 - 8);
    uint64_t v61 = v6;
    v63 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    swift_bridgeObjectRetain();
    unint64_t v11 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v12 = *(void *)(v0 + 152);
      v66(*(void *)(v0 + 224), v10, *(void *)(v0 + 208));
      sub_24A6DAD50();
      uint64_t v13 = sub_24A6DB3F0();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
        goto LABEL_14;
      }
      uint64_t v15 = *(void *)(v0 + 144);
      sub_24A6AEA38(*(void *)(v0 + 152), v15);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 88))(v15, v13) != v60) {
        break;
      }
      uint64_t v16 = *(void *)(v0 + 120);
      (*(void (**)(void, uint64_t))(v14 + 96))(*(void *)(v0 + 144), v13);
      uint64_t v17 = swift_projectBox();
      int v18 = (*v59)(v17, v16);
      if (v18 == v58)
      {
        unint64_t v19 = v11;
        uint64_t v21 = *(void *)(v0 + 168);
        uint64_t v20 = *(void *)(v0 + 176);
        uint64_t v22 = *(void *)(v0 + 136);
        uint64_t v23 = *(void *)(v0 + 120);
        (*v57)(v22, v17, v23);
        (*v56)(v22, v23);
        (*v67)(v21, v22, v20);
        uint64_t v24 = v21;
        unint64_t v11 = v19;
        (*v62)(v24, 0, 1, v20);
      }
      else
      {
        if (v18 != v55)
        {
          swift_release();
          goto LABEL_14;
        }
        uint64_t v25 = *(void *)(v0 + 136);
        unint64_t v26 = v11;
        uint64_t v27 = *(void *)(v0 + 112);
        uint64_t v28 = *(void *)(v0 + 120);
        uint64_t v29 = *(void *)(v0 + 88);
        uint64_t v51 = *(void *)(v0 + 96);
        uint64_t v52 = *(void *)(v0 + 160);
        uint64_t v53 = *(void *)(v0 + 72);
        uint64_t v54 = *(void *)(v0 + 168);
        (*v57)(v25, v17, v28);
        uint64_t v30 = v28;
        unint64_t v11 = v26;
        (*v56)(v25, v30);
        (*v50)(v27, v25, v51);
        sub_24A6DAD20();
        sub_24A6DAD10();
        (*v49)(v29, v53);
        (*v48)(v27, v51);
        sub_24A6AEAA0(v52, v54);
      }
      swift_release();
LABEL_15:
      uint64_t v31 = *(void *)(v0 + 224);
      uint64_t v32 = *(void *)(v0 + 208);
      uint64_t v34 = *(void *)(v0 + 168);
      uint64_t v33 = *(void *)(v0 + 176);
      sub_24A6AE66C(*(void *)(v0 + 152), &qword_2697AEFA8);
      (*v64)(v31, v32);
      if ((*v63)(v34, 1, v33) == 1)
      {
        sub_24A6AE66C(*(void *)(v0 + 168), &qword_2697AEFB0);
      }
      else
      {
        uint64_t v36 = *(void *)(v0 + 192);
        uint64_t v35 = *(void *)(v0 + 200);
        uint64_t v37 = *(void *)(v0 + 176);
        v38 = *v67;
        (*v67)(v35, *(void *)(v0 + 168), v37);
        v38(v36, v35, v37);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v11 = sub_24A6AE7B8(0, *(void *)(v11 + 16) + 1, 1, v11, &qword_2697AEFD8, MEMORY[0x263F07490], MEMORY[0x263F07490]);
        }
        unint64_t v40 = *(void *)(v11 + 16);
        unint64_t v39 = *(void *)(v11 + 24);
        if (v40 >= v39 >> 1) {
          unint64_t v11 = sub_24A6AE7B8(v39 > 1, v40 + 1, 1, v11, &qword_2697AEFD8, MEMORY[0x263F07490], MEMORY[0x263F07490]);
        }
        uint64_t v41 = *(void *)(v0 + 192);
        uint64_t v42 = *(void *)(v0 + 176);
        *(void *)(v11 + 16) = v40 + 1;
        v38(v11+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v40, v41, v42);
      }
      v10 += v65;
      if (!--v4)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_23;
      }
    }
    (*(void (**)(void, uint64_t))(v14 + 8))(*(void *)(v0 + 144), v13);
LABEL_14:
    (*v62)(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 176));
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  unint64_t v11 = MEMORY[0x263F8EE78];
LABEL_23:
  sub_24A6DB0E0();
  swift_bridgeObjectRetain();
  v43 = sub_24A6DB100();
  os_log_type_t v44 = sub_24A6DB540();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 134218240;
    *(void *)(v0 + 24) = *(void *)(v11 + 16);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2048;
    *(double *)(v0 + 32) = (Current - v2) * 1000.0;
    sub_24A6DB5B0();
    _os_log_impl(&dword_24A6AB000, v43, v44, "Found %ld dates in %fms", (uint8_t *)v45, 0x16u);
    MEMORY[0x24C5CC2B0](v45, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  *(void *)(v0 + 16) = v11;
  sub_24A6AE628(&qword_2697AEFC0);
  sub_24A6AE6C8();
  sub_24A6DA9E0();
  swift_release();
  swift_bridgeObjectRelease();
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
  v46 = *(uint64_t (**)(void))(v0 + 8);
  return v46();
}

uint64_t sub_24A6AE1E0()
{
  swift_bridgeObjectRelease();
  swift_release();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6AE2EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697B1840);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_24A6AE3A8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return sub_24A6AD434(a1);
}

uint64_t sub_24A6AE440()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A6AE534(uint64_t a1)
{
  unint64_t v2 = sub_24A6AD37C();
  return MEMORY[0x270EE0D28](a1, v2);
}

ValueMetadata *type metadata accessor for CollectDatesIntent()
{
  return &type metadata for CollectDatesIntent;
}

unint64_t sub_24A6AE584()
{
  unint64_t result = qword_2697AEF90;
  if (!qword_2697AEF90)
  {
    sub_24A6AE5E0(&qword_2697AEF98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEF90);
  }
  return result;
}

uint64_t sub_24A6AE5E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A6AE628(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A6AE66C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24A6AE628(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A6AE6C8()
{
  unint64_t result = qword_2697AEFC8;
  if (!qword_2697AEFC8)
  {
    sub_24A6AE5E0(&qword_2697AEFC0);
    sub_24A6AE73C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEFC8);
  }
  return result;
}

unint64_t sub_24A6AE73C()
{
  unint64_t result = qword_2697AEFD0;
  if (!qword_2697AEFD0)
  {
    sub_24A6DACD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AEFD0);
  }
  return result;
}

uint64_t sub_24A6AE794(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24A6AE7B8(a1, a2, a3, a4, &qword_2697AEFE0, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
}

uint64_t sub_24A6AE7B8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    int v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24A6AE628(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  int v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_24A6DB620();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A6AEBA8(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_24A6AEA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AEFA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A6AEAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AEFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A6AEB0C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_24A6AEB44(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24A6AEBA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_24A6DB630();
  __break(1u);
  return result;
}

uint64_t sub_24A6AED04()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AEFE8);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AEFE8);
  return sub_24A6DAC90();
}

uint64_t static CreateDailyScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AEFE8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateDailyScheduledQueryIntent.title.setter(uint64_t a1)
{
  if (qword_2697AEEE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AEFE8);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateDailyScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEEE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AEFE8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateDailyScheduledQueryIntent.query.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6AEFEC@<X0>(void *a1@<X8>)
{
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A6AF050()
{
  return swift_release();
}

uint64_t CreateDailyScheduledQueryIntent.query.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateDailyScheduledQueryIntent.query.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateDailyScheduledQueryIntent.$query.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateDailyScheduledQueryIntent.time.getter()
{
  return sub_24A6DAA10();
}

uint64_t sub_24A6AF188()
{
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  return swift_release();
}

uint64_t sub_24A6AF1E8(uint64_t a1)
{
  uint64_t v2 = sub_24A6DAC50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  return swift_release();
}

uint64_t CreateDailyScheduledQueryIntent.time.setter(uint64_t a1)
{
  uint64_t v2 = sub_24A6DAC50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_24A6DAA20();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*CreateDailyScheduledQueryIntent.time.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

void sub_24A6AF490(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t CreateDailyScheduledQueryIntent.$time.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateDailyScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_24A6AE628(&qword_2697AF000);
  uint64_t v34 = *(void *)(v1 - 8);
  uint64_t v35 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v33 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6DAB90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = v15;
  uint64_t v16 = sub_24A6DACC0();
  uint64_t v32 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v30 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v31(v15, 1, 1, v16);
  uint64_t v18 = sub_24A6DB410();
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  uint64_t v19 = sub_24A6DA990();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v29 = v20 + 56;
  v28(v9, 1, 1, v19);
  uint64_t v21 = *MEMORY[0x263EFBDC8];
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v26[1] = v4 + 104;
  uint64_t v27 = v22;
  v22(v6, v21, v3);
  unint64_t v23 = (char *)v26[0];
  uint64_t v30 = sub_24A6DAA90();
  sub_24A6AE628(&qword_2697AF028);
  sub_24A6DAC90();
  v31(v23, 1, 1, v32);
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, *MEMORY[0x263EFB988], v35);
  v28(v9, 1, 1, v19);
  v27(v6, v21, v3);
  uint64_t result = sub_24A6DAA70();
  uint64_t v25 = v36;
  *uint64_t v36 = v30;
  v25[1] = result;
  return result;
}

uint64_t CreateDailyScheduledQueryIntent.init(query:time:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X8>)
{
  int v58 = a3;
  v59 = a4;
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  uint64_t v4 = sub_24A6DAC50();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v55 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v52 = (char *)&v39 - v7;
  uint64_t v8 = sub_24A6AE628(&qword_2697AF000);
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v51 = v8;
  MEMORY[0x270FA5388](v8);
  v49 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24A6DAB90();
  uint64_t v10 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A6DACC0();
  uint64_t v47 = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v44 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v46(v20, 1, 1, v21);
  uint64_t v23 = sub_24A6DB410();
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  uint64_t v24 = sub_24A6DA990();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v43 = v25 + 56;
  v42(v14, 1, 1, v24);
  unsigned int v41 = *MEMORY[0x263EFBDC8];
  unint64_t v26 = *(void (**)(void))(v10 + 104);
  uint64_t v39 = v10 + 104;
  unint64_t v40 = (void (*)(char *, void, uint64_t))v26;
  uint64_t v27 = v45;
  uint64_t v28 = v48;
  v26(v45);
  uint64_t v29 = sub_24A6DAA90();
  sub_24A6AE628(&qword_2697AF028);
  swift_retain();
  sub_24A6DAC90();
  v46(v20, 1, 1, v47);
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263EFB988], v51);
  v42(v14, 1, 1, v24);
  v40(v27, v41, v28);
  uint64_t v30 = sub_24A6DAA70();
  uint64_t v60 = v53;
  uint64_t v61 = v54;
  swift_retain_n();
  swift_retain();
  sub_24A6DAA20();
  swift_release();
  swift_release();
  uint64_t v32 = v56;
  uint64_t v31 = v57;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
  uint64_t v34 = v52;
  uint64_t v35 = v58;
  v33(v52, (uint64_t)v58, v57);
  v33(v55, (uint64_t)v34, v31);
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v32 + 8);
  v36(v34, v31);
  v36(v35, v31);
  swift_release_n();
  uint64_t result = swift_release_n();
  uint64_t v38 = v59;
  uint64_t *v59 = v29;
  v38[1] = v30;
  return result;
}

uint64_t CreateDailyScheduledQueryIntent.perform()(uint64_t a1)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = type metadata accessor for ScheduledQuerySnippetView();
  *(void *)(v2 + 200) = swift_task_alloc();
  sub_24A6DACC0();
  *(void *)(v2 + 208) = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  *(void *)(v2 + 216) = v3;
  *(void *)(v2 + 224) = *(void *)(v3 - 8);
  *(void *)(v2 + 232) = swift_task_alloc();
  uint64_t v4 = sub_24A6DAE60();
  *(void *)(v2 + 240) = v4;
  *(void *)(v2 + 248) = *(void *)(v4 - 8);
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = type metadata accessor for ScheduledQueryEntity();
  *(void *)(v2 + 272) = swift_task_alloc();
  *(void *)(v2 + 280) = swift_task_alloc();
  uint64_t v5 = sub_24A6DB080();
  *(void *)(v2 + 288) = v5;
  *(void *)(v2 + 296) = *(void *)(v5 - 8);
  *(void *)(v2 + 304) = swift_task_alloc();
  *(void *)(v2 + 312) = swift_task_alloc();
  uint64_t v6 = sub_24A6DAC50();
  *(void *)(v2 + 320) = v6;
  *(void *)(v2 + 328) = *(void *)(v6 - 8);
  *(void *)(v2 + 336) = swift_task_alloc();
  uint64_t v7 = sub_24A6DADE0();
  *(void *)(v2 + 344) = v7;
  *(void *)(v2 + 352) = *(void *)(v7 - 8);
  *(void *)(v2 + 360) = swift_task_alloc();
  *(void *)(v2 + 368) = swift_task_alloc();
  uint64_t v8 = sub_24A6DB040();
  *(void *)(v2 + 376) = v8;
  *(void *)(v2 + 384) = *(void *)(v8 - 8);
  *(void *)(v2 + 392) = swift_task_alloc();
  *(void *)(v2 + 400) = swift_task_alloc();
  *(void *)(v2 + 408) = swift_task_alloc();
  *(void *)(v2 + 416) = swift_task_alloc();
  uint64_t v9 = sub_24A6DB070();
  *(void *)(v2 + 424) = v9;
  *(void *)(v2 + 432) = *(void *)(v9 - 8);
  *(void *)(v2 + 440) = swift_task_alloc();
  uint64_t v10 = sub_24A6DAB60();
  *(void *)(v2 + 448) = v10;
  *(void *)(v2 + 456) = *(void *)(v10 - 8);
  *(void *)(v2 + 464) = swift_task_alloc();
  uint64_t v11 = sub_24A6AE628(&qword_2697AF038);
  *(void *)(v2 + 472) = v11;
  *(void *)(v2 + 480) = *(void *)(v11 - 8);
  *(void *)(v2 + 488) = swift_task_alloc();
  uint64_t v12 = sub_24A6DB110();
  *(void *)(v2 + 496) = v12;
  *(void *)(v2 + 504) = *(void *)(v12 - 8);
  *(void *)(v2 + 512) = swift_task_alloc();
  *(void *)(v2 + 520) = swift_task_alloc();
  *(void *)(v2 + 528) = swift_task_alloc();
  *(void *)(v2 + 536) = swift_task_alloc();
  *(void *)(v2 + 544) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF008);
  *(void *)(v2 + 552) = swift_task_alloc();
  uint64_t v13 = sub_24A6DAC10();
  *(void *)(v2 + 560) = v13;
  *(void *)(v2 + 568) = *(void *)(v13 - 8);
  *(void *)(v2 + 576) = swift_task_alloc();
  uint64_t v14 = sub_24A6DAD90();
  *(void *)(v2 + 584) = v14;
  *(void *)(v2 + 592) = *(void *)(v14 - 8);
  *(void *)(v2 + 600) = swift_task_alloc();
  *(_OWORD *)(v2 + 608) = *v1;
  return MEMORY[0x270FA2498](sub_24A6B05C0, 0, 0);
}

uint64_t sub_24A6B05C0()
{
  uint64_t v68 = v0;
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v2 = *(void *)(v0 + 592);
  uint64_t v3 = *(void *)(v0 + 584);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F33298], v3);
  char v4 = sub_24A6DAD80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 576);
    uint64_t v6 = *(void *)(v0 + 568);
    uint64_t v7 = *(void *)(v0 + 560);
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    *(void *)(v0 + 56) = *(void *)(v0 + 88);
    *(void *)(v0 + 64) = *(void *)(v0 + 96);
    sub_24A6DAC00();
    sub_24A6B28C8();
    uint64_t v8 = sub_24A6DB5D0();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      sub_24A6B291C();
      if (sub_24A6DB550())
      {
        sub_24A6DB0E0();
        uint64_t v12 = sub_24A6DB100();
        os_log_type_t v13 = sub_24A6DB540();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_24A6AB000, v12, v13, "We will request confirmation for creating a task", v14, 2u);
          MEMORY[0x24C5CC2B0](v14, -1, -1);
        }
        uint64_t v15 = *(void *)(v0 + 544);
        uint64_t v16 = *(void *)(v0 + 496);
        uint64_t v17 = *(void *)(v0 + 504);
        long long v65 = *(_OWORD *)(v0 + 608);

        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
        *(_OWORD *)(v0 + 120) = v65;
        sub_24A6DA9F0();
        sub_24A6DAB50();
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 624) = v18;
        unint64_t v19 = sub_24A6B3194();
        uint64_t v20 = sub_24A6B36E4(&qword_2697AF080, &qword_2697AF038);
        *uint64_t v18 = v0;
        v18[1] = sub_24A6B1020;
        uint64_t v21 = *(void *)(v0 + 488);
        uint64_t v22 = *(void *)(v0 + 464);
        uint64_t v23 = *(void *)(v0 + 472);
        return MEMORY[0x270EE0D08](v21, v22, 1, &type metadata for CreateDailyScheduledQueryIntent, v23, v19, v20);
      }
      else
      {
        sub_24A6DB0E0();
        swift_retain_n();
        swift_retain_n();
        uint64_t v35 = sub_24A6DB100();
        os_log_type_t v36 = sub_24A6DB540();
        BOOL v37 = os_log_type_enabled(v35, v36);
        uint64_t v38 = *(void *)(v0 + 536);
        uint64_t v39 = *(void *)(v0 + 496);
        uint64_t v40 = *(void *)(v0 + 504);
        if (v37)
        {
          uint64_t v66 = *(void *)(v0 + 536);
          uint64_t v64 = *(void *)(v0 + 496);
          unsigned int v41 = (uint8_t *)swift_slowAlloc();
          uint64_t v42 = swift_slowAlloc();
          v67[0] = v42;
          *(_DWORD *)unsigned int v41 = 136315138;
          swift_retain();
          swift_retain();
          sub_24A6DAA10();
          swift_release();
          swift_release();
          *(void *)(v0 + 168) = sub_24A6B2A14(*(void *)(v0 + 136), *(void *)(v0 + 144), v67);
          sub_24A6DB5B0();
          swift_release_n();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24A6AB000, v35, v36, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v41, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5CC2B0](v42, -1, -1);
          MEMORY[0x24C5CC2B0](v41, -1, -1);

          uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v43(v66, v64);
        }
        else
        {

          swift_release_n();
          swift_release_n();
          uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v43(v38, v39);
        }
        *(void *)(v0 + 640) = v43;
        sub_24A6DB0F0();
        sub_24A6DB050();
        sub_24A6DB060();
        sub_24A6DB020();
        uint64_t v44 = sub_24A6DB060();
        os_signpost_type_t v45 = sub_24A6DB580();
        if (sub_24A6DB590())
        {
          uint64_t v46 = *(void *)(v0 + 408);
          uint64_t v47 = *(void *)(v0 + 376);
          uint64_t v48 = *(void *)(v0 + 384);
          v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
          unint64_t v50 = (v48 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          v49(v46, *(void *)(v0 + 416), v47);
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v51 = 0;
          os_signpost_id_t v52 = sub_24A6DB030();
          _os_signpost_emit_with_name_impl(&dword_24A6AB000, v44, v45, v52, "CE.Intent.Create.Daily", "", v51, 2u);
          MEMORY[0x24C5CC2B0](v51, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
        }
        else
        {
          uint64_t v53 = *(void *)(v0 + 384);

          v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
          unint64_t v50 = (v53 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        }
        *(void *)(v0 + 648) = v49;
        uint64_t v55 = *(void *)(v0 + 408);
        uint64_t v54 = *(void *)(v0 + 416);
        uint64_t v56 = *(void *)(v0 + 376);
        *(void *)(v0 + 656) = v50;
        v49(v55, v54, v56);
        sub_24A6DB0C0();
        swift_allocObject();
        *(void *)(v0 + 664) = sub_24A6DB0B0();
        static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v67);
        uint64_t v57 = v67[0];
        *(void *)(v0 + 672) = v67[0];
        sub_24A6DAF70();
        *(void *)(v0 + 680) = sub_24A6DAF60();
        swift_retain();
        swift_retain();
        sub_24A6DAA10();
        sub_24A6DAA10();
        swift_release();
        swift_release();
        uint64_t v59 = *(void *)(v0 + 72);
        uint64_t v58 = *(void *)(v0 + 80);
        *(void *)(v0 + 688) = v58;
        *(void *)(v0 + 40) = &type metadata for ShortcutsRunScheduledQueryIntent;
        *(void *)(v0 + 48) = sub_24A6B295C();
        *(void *)(v0 + 16) = v57;
        swift_retain();
        uint64_t v60 = (void *)swift_task_alloc();
        *(void *)(v0 + 696) = v60;
        *uint64_t v60 = v0;
        v60[1] = sub_24A6B1630;
        uint64_t v61 = *(void *)(v0 + 368);
        uint64_t v62 = *(void *)(v0 + 336);
        return MEMORY[0x270F184D8](v61, v62, v59, v58, v0 + 16);
      }
    }
    uint64_t v31 = *(void *)(v0 + 552);
    uint64_t v32 = *(void *)(v0 + 216);
    uint64_t v33 = *(void *)(v0 + 224);
    swift_retain();
    swift_retain();
    sub_24A6DAA30();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v31, 1, 1, v32);
    sub_24A6DA8E0();
    sub_24A6B32E8(&qword_2697AF088, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_24A6DAA40();
    swift_release();
    sub_24A6B31E8(v31);
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v24 = sub_24A6DB100();
    os_log_type_t v25 = sub_24A6DB520();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v26 = 0;
      _os_log_impl(&dword_24A6AB000, v24, v25, "Feature flag is disabled", v26, 2u);
      MEMORY[0x24C5CC2B0](v26, -1, -1);
    }
    uint64_t v27 = *(void *)(v0 + 520);
    uint64_t v28 = *(void *)(v0 + 496);
    uint64_t v29 = *(void *)(v0 + 504);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v30 = 0;
    *(void *)(v30 + 8) = 0;
    *(unsigned char *)(v30 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_24A6B1020()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[60];
    uint64_t v3 = v2[61];
    uint64_t v5 = v2[59];
    (*(void (**)(void, void))(v2[57] + 8))(v2[58], v2[56]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_24A6B1F18;
  }
  else
  {
    uint64_t v8 = v2[60];
    uint64_t v7 = v2[61];
    uint64_t v9 = v2[59];
    (*(void (**)(void, void))(v2[57] + 8))(v2[58], v2[56]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    uint64_t v6 = sub_24A6B11A4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A6B11A4()
{
  uint64_t v33 = v0;
  sub_24A6DB0E0();
  swift_retain_n();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = v0[63];
    uint64_t v30 = v0[62];
    uint64_t v31 = v0[67];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v32 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    v0[21] = sub_24A6B2A14(v0[17], v0[18], &v32);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_24A6AB000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v4, -1, -1);
    MEMORY[0x24C5CC2B0](v3, -1, -1);

    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v5(v31, v30);
  }
  else
  {
    uint64_t v6 = v0[67];
    uint64_t v7 = v0[62];
    uint64_t v8 = v0[63];
    swift_release_n();
    swift_release_n();

    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v5(v6, v7);
  }
  v0[80] = v5;
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v9 = sub_24A6DB060();
  os_signpost_type_t v10 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v11 = v0[51];
    uint64_t v12 = v0[47];
    uint64_t v13 = v0[48];
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    unint64_t v15 = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v14(v11, v0[52], v12);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v9, v10, v17, "CE.Intent.Create.Daily", "", v16, 2u);
    MEMORY[0x24C5CC2B0](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    uint64_t v18 = v0[48];

    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    unint64_t v15 = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v0[81] = v14;
  uint64_t v20 = v0[51];
  uint64_t v19 = v0[52];
  uint64_t v21 = v0[47];
  v0[82] = v15;
  v14(v20, v19, v21);
  sub_24A6DB0C0();
  swift_allocObject();
  v0[83] = sub_24A6DB0B0();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v32);
  uint64_t v22 = v32;
  v0[84] = v32;
  sub_24A6DAF70();
  v0[85] = sub_24A6DAF60();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  uint64_t v24 = v0[9];
  uint64_t v23 = v0[10];
  v0[86] = v23;
  v0[5] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[6] = sub_24A6B295C();
  v0[2] = v22;
  swift_retain();
  os_log_type_t v25 = (void *)swift_task_alloc();
  v0[87] = v25;
  *os_log_type_t v25 = v0;
  v25[1] = sub_24A6B1630;
  uint64_t v26 = v0[46];
  uint64_t v27 = v0[42];
  return MEMORY[0x270F184D8](v26, v27, v24, v23, v0 + 2);
}

uint64_t sub_24A6B1630()
{
  os_log_type_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 704) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[41] + 8))(v2[42], v2[40]);
  swift_bridgeObjectRelease();
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_24A6B20F0;
  }
  else
  {
    sub_24A6B3728((uint64_t)(v2 + 2));
    uint64_t v3 = sub_24A6B17B8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A6B17B8()
{
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v1);
  os_log_type_t v2 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v3 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v39 = v3;
    uint64_t v4 = *(void *)(v0 + 312);
    uint64_t v6 = *(void *)(v0 + 288);
    uint64_t v5 = *(void *)(v0 + 296);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x263F90238])
    {
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 312), *(void *)(v0 + 288));
      uint64_t v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v7 = 1;
    }
    format = (char *)v8;
    uint64_t v14 = *(void *)(v0 + 400);
    uint64_t v15 = *(void *)(v0 + 376);
    uint64_t v16 = *(void *)(v0 + 384);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 648))(*(void *)(v0 + 408), v14, v15);
    uint64_t v17 = swift_slowAlloc();
    *(unsigned char *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 1) = v7;
    *(_WORD *)(v17 + 2) = 2050;
    *(void *)(v0 + 152) = 0;
    sub_24A6DB5B0();
    os_signpost_id_t v18 = sub_24A6DB030();
    uint64_t v9 = (uint64_t *)(v0 + 408);
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v2, v39, v18, "CE.Intent.Create.Daily", format, (uint8_t *)v17, 0xCu);
    MEMORY[0x24C5CC2B0](v17, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, void))(v16 + 8);
    uint64_t v12 = v16 + 8;
    uint64_t v11 = v19;
    v19(v14, v15);
  }
  else
  {
    uint64_t v9 = (uint64_t *)(v0 + 400);
    uint64_t v10 = *(void *)(v0 + 384);

    uint64_t v13 = *(void (**)(uint64_t, void))(v10 + 8);
    uint64_t v12 = v10 + 8;
    uint64_t v11 = v13;
  }
  uint64_t v20 = *v9;
  *(void *)(v0 + 720) = v12;
  *(void *)(v0 + 712) = v11;
  uint64_t v21 = *(void *)(v0 + 368);
  uint64_t v23 = *(void *)(v0 + 352);
  uint64_t v22 = *(void *)(v0 + 360);
  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v26 = *(uint64_t **)(v0 + 272);
  uint64_t v25 = *(void *)(v0 + 280);
  uint64_t v27 = *(void *)(v0 + 248);
  uint64_t v35 = *(void *)(v0 + 256);
  uint64_t v36 = *(void *)(v0 + 264);
  uint64_t v37 = *(void *)(v0 + 240);
  v11(v20, *(void *)(v0 + 376));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
  *uint64_t v26 = sub_24A6DADC0();
  v26[1] = v28;
  void v26[2] = sub_24A6DADD0();
  v26[3] = v29;
  v26[4] = sub_24A6DADB0();
  v26[5] = v30;
  sub_24A6DADA0();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 728) = v31;
  *(void *)(v0 + 736) = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v31(v22, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))((char *)v26 + *(int *)(v36 + 28), v35, v37);
  sub_24A6B306C((uint64_t)v26, v25);
  sub_24A6DAE20();
  sub_24A6DA9A0();
  sub_24A6B30D0(v25, (uint64_t)v26);
  sub_24A6DB500();
  *(void *)(v0 + 744) = sub_24A6DB4F0();
  uint64_t v33 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6B1B3C, v33, v32);
}

uint64_t sub_24A6B1B3C()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 200);
  swift_release();
  sub_24A6B306C(v1, v2);
  return MEMORY[0x270FA2498](sub_24A6B1BB8, 0, 0);
}

uint64_t sub_24A6B1BB8()
{
  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[91];
  uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[89];
  uint64_t v1 = v0[54];
  uint64_t v13 = v0[53];
  uint64_t v14 = v0[55];
  uint64_t v12 = v0[52];
  uint64_t v10 = v0[46];
  uint64_t v11 = v0[47];
  uint64_t v9 = v0[43];
  uint64_t v2 = v0[35];
  uint64_t v4 = v0[28];
  uint64_t v3 = v0[29];
  uint64_t v8 = v0[27];
  uint64_t v5 = v0[25];
  sub_24A6B32E8(&qword_2697AF068, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  sub_24A6B32E8(&qword_2697AF070, (void (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView);
  sub_24A6DA9B0();
  swift_release();
  swift_release();
  sub_24A6B3134(v5, (uint64_t (*)(void))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v8);
  sub_24A6B3134(v2, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  v15(v10, v9);
  v16(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
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
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24A6B1F18()
{
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
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6B20F0()
{
  uint64_t v1 = *(void **)(v0 + 704);
  sub_24A6B3728(v0 + 16);
  sub_24A6DB0E0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 704);
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 160) = v10;
    sub_24A6DB5B0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed creating daily query: %@", v7, 0xCu);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v8, -1, -1);
    MEMORY[0x24C5CC2B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 704);
  }
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v13 = *(void *)(v0 + 512);
  uint64_t v14 = *(void *)(v0 + 496);

  v12(v13, v14);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v15);
  uint64_t v16 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v17 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v42 = v17;
    uint64_t v18 = *(void *)(v0 + 296);
    uint64_t v19 = *(void *)(v0 + 304);
    uint64_t v20 = *(void *)(v0 + 288);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x263F90238])
    {
      char v21 = 0;
      uint64_t v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
      uint64_t v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v21 = 1;
    }
    uint64_t v23 = (uint64_t *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 384);
    uint64_t v40 = *(void *)(v0 + 392);
    uint64_t v27 = *(void *)(v0 + 376);
    (*(void (**)(void))(v0 + 648))(*(void *)(v0 + 408));
    uint64_t v28 = swift_slowAlloc();
    *(unsigned char *)uint64_t v28 = 0;
    *(unsigned char *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(void *)(v0 + 176) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v29 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v16, v42, v29, "CE.Intent.Create.Daily", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x24C5CC2B0](v28, -1, -1);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v25(v40, v27);
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v0 + 392);
    uint64_t v24 = *(void *)(v0 + 384);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  id v38 = *(id *)(v0 + 704);
  uint64_t v30 = *(void *)(v0 + 432);
  uint64_t v31 = *(void *)(v0 + 416);
  uint64_t v39 = *(void *)(v0 + 424);
  uint64_t v41 = *(void *)(v0 + 440);
  uint64_t v32 = *(void *)(v0 + 376);
  v25(*v23, v32);
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  uint64_t v34 = *(void *)(v0 + 104);
  uint64_t v33 = *(void *)(v0 + 112);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v35 = v34;
  *(void *)(v35 + 8) = v33;
  *(unsigned char *)(v35 + 16) = 2;
  swift_willThrow();
  swift_release();

  swift_release();
  v25(v31, v32);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v41, v39);
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
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_24A6B26C0()
{
  return sub_24A6DB090();
}

uint64_t sub_24A6B2730@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AEFE8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6B27F0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return CreateDailyScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6B288C(uint64_t a1)
{
  unint64_t v2 = sub_24A6B3194();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_24A6B28C8()
{
  unint64_t result = qword_2697AF040;
  if (!qword_2697AF040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF040);
  }
  return result;
}

unint64_t sub_24A6B291C()
{
  unint64_t result = qword_2697AF048;
  if (!qword_2697AF048)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697AF048);
  }
  return result;
}

unint64_t sub_24A6B295C()
{
  unint64_t result = qword_2697AF050;
  if (!qword_2697AF050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF050);
  }
  return result;
}

unint64_t sub_24A6B29B0()
{
  unint64_t result = qword_2697AF058;
  if (!qword_2697AF058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF058);
  }
  return result;
}

uint64_t sub_24A6B2A04(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24A6B2A14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A6B2AE8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A6B3778((uint64_t)v12, *a3);
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
      sub_24A6B3778((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24A6B3728((uint64_t)v12);
  return v7;
}

uint64_t sub_24A6B2AE8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A6DB5C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A6B2CA4(a5, a6);
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
  uint64_t v8 = sub_24A6DB610();
  if (!v8)
  {
    sub_24A6DB620();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A6DB630();
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

uint64_t sub_24A6B2CA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A6B2D3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A6B2F1C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A6B2F1C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A6B2D3C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A6B2EB4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A6DB600();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A6DB620();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A6DB4B0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A6DB630();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A6DB620();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A6B2EB4(uint64_t a1, uint64_t a2)
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
  sub_24A6AE628(&qword_2697AF0D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A6B2F1C(char a1, int64_t a2, char a3, char *a4)
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
    sub_24A6AE628(&qword_2697AF0D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_24A6DB630();
  __break(1u);
  return result;
}

uint64_t sub_24A6B306C(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 32))(a2, a1, Entity);
  return a2;
}

uint64_t sub_24A6B30D0(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 16))(a2, a1, Entity);
  return a2;
}

uint64_t sub_24A6B3134(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A6B3194()
{
  unint64_t result = qword_2697AF078;
  if (!qword_2697AF078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF078);
  }
  return result;
}

uint64_t sub_24A6B31E8(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A6B324C()
{
  unint64_t result = qword_2697AF090;
  if (!qword_2697AF090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF090);
  }
  return result;
}

uint64_t sub_24A6B32A0()
{
  return sub_24A6B32E8((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
}

uint64_t sub_24A6B32E8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24A6B3338()
{
  unint64_t result = qword_2697AF0A0;
  if (!qword_2697AF0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF0A0);
  }
  return result;
}

unint64_t sub_24A6B3390()
{
  unint64_t result = qword_2697AF0A8;
  if (!qword_2697AF0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF0A8);
  }
  return result;
}

uint64_t sub_24A6B33E4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6B3418()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for CreateDailyScheduledQueryIntent()
{
  swift_release();
  return swift_release();
}

void *_s27ConditionalEngineAppIntents31CreateDailyScheduledQueryIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CreateDailyScheduledQueryIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CreateDailyScheduledQueryIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CreateDailyScheduledQueryIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateDailyScheduledQueryIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateDailyScheduledQueryIntent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateDailyScheduledQueryIntent()
{
  return &type metadata for CreateDailyScheduledQueryIntent;
}

uint64_t sub_24A6B3630()
{
  return sub_24A6B36E4(&qword_2697AF0B8, &qword_2697AF0C0);
}

uint64_t sub_24A6B366C()
{
  return sub_24A6B36E4(&qword_2697AF0C8, &qword_2697AF0C0);
}

uint64_t sub_24A6B36A8()
{
  return sub_24A6B36E4(&qword_2697AF0D0, &qword_2697AF0C0);
}

uint64_t sub_24A6B36E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24A6AE5E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A6B3728(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24A6B3778(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A6B37D4()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF0E0);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF0E0);
  return sub_24A6DAC90();
}

uint64_t static CreateDateScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF0E0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateDateScheduledQueryIntent.title.setter(uint64_t a1)
{
  if (qword_2697AEEF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF0E0);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateDateScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEEF0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF0E0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateDateScheduledQueryIntent.query.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t CreateDateScheduledQueryIntent.query.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateDateScheduledQueryIntent.query.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateDateScheduledQueryIntent.$query.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateDateScheduledQueryIntent.date.getter()
{
  return sub_24A6DAA10();
}

uint64_t sub_24A6B3B90(uint64_t a1)
{
  uint64_t v2 = sub_24A6DACD0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v8 = (char *)&v11 - v7;
  int64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  return swift_release();
}

uint64_t CreateDateScheduledQueryIntent.date.setter(uint64_t a1)
{
  uint64_t v2 = sub_24A6DACD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_24A6DAA20();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*CreateDateScheduledQueryIntent.date.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateDateScheduledQueryIntent.$date.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateDateScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_24A6AE628(&qword_2697AF0F8);
  uint64_t v34 = *(void *)(v1 - 8);
  uint64_t v35 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v33 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6DAB90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v7 - 8);
  int64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = v15;
  uint64_t v16 = sub_24A6DACC0();
  uint64_t v32 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v30 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v31(v15, 1, 1, v16);
  uint64_t v18 = sub_24A6DB410();
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  uint64_t v19 = sub_24A6DA990();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v29 = v20 + 56;
  v28(v9, 1, 1, v19);
  uint64_t v21 = *MEMORY[0x263EFBDC8];
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v26[1] = v4 + 104;
  uint64_t v27 = v22;
  v22(v6, v21, v3);
  uint64_t v23 = (char *)v26[0];
  uint64_t v30 = sub_24A6DAA90();
  sub_24A6AE628(&qword_2697AF100);
  sub_24A6DAC90();
  v31(v23, 1, 1, v32);
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, *MEMORY[0x263EFB990], v35);
  v28(v9, 1, 1, v19);
  v27(v6, v21, v3);
  uint64_t result = sub_24A6DAA80();
  uint64_t v25 = v36;
  *uint64_t v36 = v30;
  v25[1] = result;
  return result;
}

uint64_t CreateDateScheduledQueryIntent.init(query:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v59 = a4;
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v55 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  os_signpost_id_t v52 = (char *)&v39 - v7;
  uint64_t v8 = sub_24A6AE628(&qword_2697AF0F8);
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v51 = v8;
  MEMORY[0x270FA5388](v8);
  v49 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24A6DAB90();
  uint64_t v10 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  os_signpost_type_t v45 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A6DACC0();
  uint64_t v47 = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v44 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v46(v20, 1, 1, v21);
  uint64_t v23 = sub_24A6DB410();
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  uint64_t v24 = sub_24A6DA990();
  uint64_t v25 = *(void *)(v24 - 8);
  os_signpost_type_t v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v43 = v25 + 56;
  v42(v14, 1, 1, v24);
  unsigned int v41 = *MEMORY[0x263EFBDC8];
  uint64_t v26 = *(void (**)(void))(v10 + 104);
  uint64_t v39 = v10 + 104;
  uint64_t v40 = (void (*)(char *, void, uint64_t))v26;
  uint64_t v27 = v45;
  uint64_t v28 = v48;
  v26(v45);
  uint64_t v29 = sub_24A6DAA90();
  sub_24A6AE628(&qword_2697AF100);
  swift_retain();
  sub_24A6DAC90();
  v46(v20, 1, 1, v47);
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263EFB990], v51);
  v42(v14, 1, 1, v24);
  v40(v27, v41, v28);
  uint64_t v30 = sub_24A6DAA80();
  uint64_t v60 = v53;
  uint64_t v61 = v54;
  swift_retain_n();
  swift_retain();
  sub_24A6DAA20();
  swift_release();
  swift_release();
  uint64_t v32 = v56;
  uint64_t v31 = v57;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
  uint64_t v34 = v52;
  uint64_t v35 = v58;
  v33(v52, (uint64_t)v58, v57);
  v33(v55, (uint64_t)v34, v31);
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v32 + 8);
  v36(v34, v31);
  v36(v35, v31);
  swift_release_n();
  uint64_t result = swift_release_n();
  uint64_t v38 = v59;
  uint64_t *v59 = v29;
  v38[1] = v30;
  return result;
}

uint64_t CreateDateScheduledQueryIntent.perform()(uint64_t a1)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = type metadata accessor for ScheduledQuerySnippetView();
  *(void *)(v2 + 200) = swift_task_alloc();
  sub_24A6DACC0();
  *(void *)(v2 + 208) = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  *(void *)(v2 + 216) = v3;
  *(void *)(v2 + 224) = *(void *)(v3 - 8);
  *(void *)(v2 + 232) = swift_task_alloc();
  uint64_t v4 = sub_24A6DAE60();
  *(void *)(v2 + 240) = v4;
  *(void *)(v2 + 248) = *(void *)(v4 - 8);
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = type metadata accessor for ScheduledQueryEntity();
  *(void *)(v2 + 272) = swift_task_alloc();
  *(void *)(v2 + 280) = swift_task_alloc();
  uint64_t v5 = sub_24A6DB080();
  *(void *)(v2 + 288) = v5;
  *(void *)(v2 + 296) = *(void *)(v5 - 8);
  *(void *)(v2 + 304) = swift_task_alloc();
  *(void *)(v2 + 312) = swift_task_alloc();
  uint64_t v6 = sub_24A6DACD0();
  *(void *)(v2 + 320) = v6;
  *(void *)(v2 + 328) = *(void *)(v6 - 8);
  *(void *)(v2 + 336) = swift_task_alloc();
  uint64_t v7 = sub_24A6DADE0();
  *(void *)(v2 + 344) = v7;
  *(void *)(v2 + 352) = *(void *)(v7 - 8);
  *(void *)(v2 + 360) = swift_task_alloc();
  *(void *)(v2 + 368) = swift_task_alloc();
  uint64_t v8 = sub_24A6DB040();
  *(void *)(v2 + 376) = v8;
  *(void *)(v2 + 384) = *(void *)(v8 - 8);
  *(void *)(v2 + 392) = swift_task_alloc();
  *(void *)(v2 + 400) = swift_task_alloc();
  *(void *)(v2 + 408) = swift_task_alloc();
  *(void *)(v2 + 416) = swift_task_alloc();
  uint64_t v9 = sub_24A6DB070();
  *(void *)(v2 + 424) = v9;
  *(void *)(v2 + 432) = *(void *)(v9 - 8);
  *(void *)(v2 + 440) = swift_task_alloc();
  uint64_t v10 = sub_24A6DAB60();
  *(void *)(v2 + 448) = v10;
  *(void *)(v2 + 456) = *(void *)(v10 - 8);
  *(void *)(v2 + 464) = swift_task_alloc();
  uint64_t v11 = sub_24A6AE628(&qword_2697AF038);
  *(void *)(v2 + 472) = v11;
  *(void *)(v2 + 480) = *(void *)(v11 - 8);
  *(void *)(v2 + 488) = swift_task_alloc();
  uint64_t v12 = sub_24A6DB110();
  *(void *)(v2 + 496) = v12;
  *(void *)(v2 + 504) = *(void *)(v12 - 8);
  *(void *)(v2 + 512) = swift_task_alloc();
  *(void *)(v2 + 520) = swift_task_alloc();
  *(void *)(v2 + 528) = swift_task_alloc();
  *(void *)(v2 + 536) = swift_task_alloc();
  *(void *)(v2 + 544) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF008);
  *(void *)(v2 + 552) = swift_task_alloc();
  uint64_t v13 = sub_24A6DAC10();
  *(void *)(v2 + 560) = v13;
  *(void *)(v2 + 568) = *(void *)(v13 - 8);
  *(void *)(v2 + 576) = swift_task_alloc();
  uint64_t v14 = sub_24A6DAD90();
  *(void *)(v2 + 584) = v14;
  *(void *)(v2 + 592) = *(void *)(v14 - 8);
  *(void *)(v2 + 600) = swift_task_alloc();
  *(_OWORD *)(v2 + 608) = *v1;
  return MEMORY[0x270FA2498](sub_24A6B4F1C, 0, 0);
}

uint64_t sub_24A6B4F1C()
{
  uint64_t v68 = v0;
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v2 = *(void *)(v0 + 592);
  uint64_t v3 = *(void *)(v0 + 584);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F33298], v3);
  char v4 = sub_24A6DAD80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 576);
    uint64_t v6 = *(void *)(v0 + 568);
    uint64_t v7 = *(void *)(v0 + 560);
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    *(void *)(v0 + 56) = *(void *)(v0 + 88);
    *(void *)(v0 + 64) = *(void *)(v0 + 96);
    sub_24A6DAC00();
    sub_24A6B28C8();
    uint64_t v8 = sub_24A6DB5D0();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      sub_24A6B291C();
      if (sub_24A6DB550())
      {
        sub_24A6DB0E0();
        uint64_t v12 = sub_24A6DB100();
        os_log_type_t v13 = sub_24A6DB540();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_24A6AB000, v12, v13, "We will request confirmation for creating a task", v14, 2u);
          MEMORY[0x24C5CC2B0](v14, -1, -1);
        }
        uint64_t v15 = *(void *)(v0 + 544);
        uint64_t v16 = *(void *)(v0 + 496);
        uint64_t v17 = *(void *)(v0 + 504);
        long long v65 = *(_OWORD *)(v0 + 608);

        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
        *(_OWORD *)(v0 + 120) = v65;
        sub_24A6DA9F0();
        sub_24A6DAB50();
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 624) = v18;
        unint64_t v19 = sub_24A6B6C00();
        uint64_t v20 = sub_24A6B36E4(&qword_2697AF080, &qword_2697AF038);
        *uint64_t v18 = v0;
        v18[1] = sub_24A6B597C;
        uint64_t v21 = *(void *)(v0 + 488);
        uint64_t v22 = *(void *)(v0 + 464);
        uint64_t v23 = *(void *)(v0 + 472);
        return MEMORY[0x270EE0D08](v21, v22, 1, &type metadata for CreateDateScheduledQueryIntent, v23, v19, v20);
      }
      else
      {
        sub_24A6DB0E0();
        swift_retain_n();
        swift_retain_n();
        uint64_t v35 = sub_24A6DB100();
        os_log_type_t v36 = sub_24A6DB540();
        BOOL v37 = os_log_type_enabled(v35, v36);
        uint64_t v38 = *(void *)(v0 + 536);
        uint64_t v39 = *(void *)(v0 + 496);
        uint64_t v40 = *(void *)(v0 + 504);
        if (v37)
        {
          uint64_t v66 = *(void *)(v0 + 536);
          uint64_t v64 = *(void *)(v0 + 496);
          unsigned int v41 = (uint8_t *)swift_slowAlloc();
          uint64_t v42 = swift_slowAlloc();
          v67[0] = v42;
          *(_DWORD *)unsigned int v41 = 136315138;
          swift_retain();
          swift_retain();
          sub_24A6DAA10();
          swift_release();
          swift_release();
          *(void *)(v0 + 168) = sub_24A6B2A14(*(void *)(v0 + 136), *(void *)(v0 + 144), v67);
          sub_24A6DB5B0();
          swift_release_n();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24A6AB000, v35, v36, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v41, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5CC2B0](v42, -1, -1);
          MEMORY[0x24C5CC2B0](v41, -1, -1);

          uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v43(v66, v64);
        }
        else
        {

          swift_release_n();
          swift_release_n();
          uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v43(v38, v39);
        }
        *(void *)(v0 + 640) = v43;
        sub_24A6DB0F0();
        sub_24A6DB050();
        sub_24A6DB060();
        sub_24A6DB020();
        uint64_t v44 = sub_24A6DB060();
        os_signpost_type_t v45 = sub_24A6DB580();
        if (sub_24A6DB590())
        {
          uint64_t v46 = *(void *)(v0 + 408);
          uint64_t v47 = *(void *)(v0 + 376);
          uint64_t v48 = *(void *)(v0 + 384);
          v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
          unint64_t v50 = (v48 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          v49(v46, *(void *)(v0 + 416), v47);
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v51 = 0;
          os_signpost_id_t v52 = sub_24A6DB030();
          _os_signpost_emit_with_name_impl(&dword_24A6AB000, v44, v45, v52, "CE.Intent.Create.Date", "", v51, 2u);
          MEMORY[0x24C5CC2B0](v51, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
        }
        else
        {
          uint64_t v53 = *(void *)(v0 + 384);

          v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
          unint64_t v50 = (v53 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        }
        *(void *)(v0 + 648) = v49;
        uint64_t v55 = *(void *)(v0 + 408);
        uint64_t v54 = *(void *)(v0 + 416);
        uint64_t v56 = *(void *)(v0 + 376);
        *(void *)(v0 + 656) = v50;
        v49(v55, v54, v56);
        sub_24A6DB0C0();
        swift_allocObject();
        *(void *)(v0 + 664) = sub_24A6DB0B0();
        static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v67);
        uint64_t v57 = v67[0];
        *(void *)(v0 + 672) = v67[0];
        sub_24A6DAF70();
        *(void *)(v0 + 680) = sub_24A6DAF60();
        swift_retain();
        swift_retain();
        sub_24A6DAA10();
        sub_24A6DAA10();
        swift_release();
        swift_release();
        uint64_t v59 = *(void *)(v0 + 72);
        uint64_t v58 = *(void *)(v0 + 80);
        *(void *)(v0 + 688) = v58;
        *(void *)(v0 + 40) = &type metadata for ShortcutsRunScheduledQueryIntent;
        *(void *)(v0 + 48) = sub_24A6B295C();
        *(void *)(v0 + 16) = v57;
        swift_retain();
        uint64_t v60 = (void *)swift_task_alloc();
        *(void *)(v0 + 696) = v60;
        *uint64_t v60 = v0;
        v60[1] = sub_24A6B5F8C;
        uint64_t v61 = *(void *)(v0 + 368);
        uint64_t v62 = *(void *)(v0 + 336);
        return MEMORY[0x270F184D0](v61, v62, v59, v58, v0 + 16);
      }
    }
    uint64_t v31 = *(void *)(v0 + 552);
    uint64_t v32 = *(void *)(v0 + 216);
    uint64_t v33 = *(void *)(v0 + 224);
    swift_retain();
    swift_retain();
    sub_24A6DAA30();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v31, 1, 1, v32);
    sub_24A6DA8E0();
    sub_24A6B32E8(&qword_2697AF088, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_24A6DAA40();
    swift_release();
    sub_24A6B31E8(v31);
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v24 = sub_24A6DB100();
    os_log_type_t v25 = sub_24A6DB520();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_24A6AB000, v24, v25, "Feature flag is disabled", v26, 2u);
      MEMORY[0x24C5CC2B0](v26, -1, -1);
    }
    uint64_t v27 = *(void *)(v0 + 520);
    uint64_t v28 = *(void *)(v0 + 496);
    uint64_t v29 = *(void *)(v0 + 504);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v30 = 0;
    *(void *)(v30 + 8) = 0;
    *(unsigned char *)(v30 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_24A6B597C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[60];
    uint64_t v3 = v2[61];
    uint64_t v5 = v2[59];
    (*(void (**)(void, void))(v2[57] + 8))(v2[58], v2[56]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_24A6B1F18;
  }
  else
  {
    uint64_t v8 = v2[60];
    uint64_t v7 = v2[61];
    uint64_t v9 = v2[59];
    (*(void (**)(void, void))(v2[57] + 8))(v2[58], v2[56]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    uint64_t v6 = sub_24A6B5B00;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A6B5B00()
{
  uint64_t v33 = v0;
  sub_24A6DB0E0();
  swift_retain_n();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = v0[63];
    uint64_t v30 = v0[62];
    uint64_t v31 = v0[67];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v32 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    v0[21] = sub_24A6B2A14(v0[17], v0[18], &v32);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_24A6AB000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v4, -1, -1);
    MEMORY[0x24C5CC2B0](v3, -1, -1);

    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v5(v31, v30);
  }
  else
  {
    uint64_t v6 = v0[67];
    uint64_t v7 = v0[62];
    uint64_t v8 = v0[63];
    swift_release_n();
    swift_release_n();

    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v5(v6, v7);
  }
  v0[80] = v5;
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v9 = sub_24A6DB060();
  os_signpost_type_t v10 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v11 = v0[51];
    uint64_t v12 = v0[47];
    uint64_t v13 = v0[48];
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    unint64_t v15 = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v14(v11, v0[52], v12);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v9, v10, v17, "CE.Intent.Create.Date", "", v16, 2u);
    MEMORY[0x24C5CC2B0](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    uint64_t v18 = v0[48];

    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    unint64_t v15 = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v0[81] = v14;
  uint64_t v20 = v0[51];
  uint64_t v19 = v0[52];
  uint64_t v21 = v0[47];
  v0[82] = v15;
  v14(v20, v19, v21);
  sub_24A6DB0C0();
  swift_allocObject();
  v0[83] = sub_24A6DB0B0();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v32);
  uint64_t v22 = v32;
  v0[84] = v32;
  sub_24A6DAF70();
  v0[85] = sub_24A6DAF60();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  uint64_t v24 = v0[9];
  uint64_t v23 = v0[10];
  v0[86] = v23;
  v0[5] = &type metadata for ShortcutsRunScheduledQueryIntent;
  v0[6] = sub_24A6B295C();
  v0[2] = v22;
  swift_retain();
  os_log_type_t v25 = (void *)swift_task_alloc();
  v0[87] = v25;
  *os_log_type_t v25 = v0;
  v25[1] = sub_24A6B5F8C;
  uint64_t v26 = v0[46];
  uint64_t v27 = v0[42];
  return MEMORY[0x270F184D0](v26, v27, v24, v23, v0 + 2);
}

uint64_t sub_24A6B5F8C()
{
  os_log_type_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 704) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[41] + 8))(v2[42], v2[40]);
  swift_bridgeObjectRelease();
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_24A6B6498;
  }
  else
  {
    sub_24A6B3728((uint64_t)(v2 + 2));
    uint64_t v3 = sub_24A6B6114;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A6B6114()
{
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v1);
  os_log_type_t v2 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v3 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v39 = v3;
    uint64_t v4 = *(void *)(v0 + 312);
    uint64_t v6 = *(void *)(v0 + 288);
    uint64_t v5 = *(void *)(v0 + 296);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x263F90238])
    {
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 312), *(void *)(v0 + 288));
      uint64_t v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v7 = 1;
    }
    format = (char *)v8;
    uint64_t v14 = *(void *)(v0 + 400);
    uint64_t v15 = *(void *)(v0 + 376);
    uint64_t v16 = *(void *)(v0 + 384);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 648))(*(void *)(v0 + 408), v14, v15);
    uint64_t v17 = swift_slowAlloc();
    *(unsigned char *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 1) = v7;
    *(_WORD *)(v17 + 2) = 2050;
    *(void *)(v0 + 152) = 0;
    sub_24A6DB5B0();
    os_signpost_id_t v18 = sub_24A6DB030();
    uint64_t v9 = (uint64_t *)(v0 + 408);
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v2, v39, v18, "CE.Intent.Create.Date", format, (uint8_t *)v17, 0xCu);
    MEMORY[0x24C5CC2B0](v17, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, void))(v16 + 8);
    uint64_t v12 = v16 + 8;
    uint64_t v11 = v19;
    v19(v14, v15);
  }
  else
  {
    uint64_t v9 = (uint64_t *)(v0 + 400);
    uint64_t v10 = *(void *)(v0 + 384);

    uint64_t v13 = *(void (**)(uint64_t, void))(v10 + 8);
    uint64_t v12 = v10 + 8;
    uint64_t v11 = v13;
  }
  uint64_t v20 = *v9;
  *(void *)(v0 + 720) = v12;
  *(void *)(v0 + 712) = v11;
  uint64_t v21 = *(void *)(v0 + 368);
  uint64_t v23 = *(void *)(v0 + 352);
  uint64_t v22 = *(void *)(v0 + 360);
  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v26 = *(uint64_t **)(v0 + 272);
  uint64_t v25 = *(void *)(v0 + 280);
  uint64_t v27 = *(void *)(v0 + 248);
  uint64_t v35 = *(void *)(v0 + 256);
  uint64_t v36 = *(void *)(v0 + 264);
  uint64_t v37 = *(void *)(v0 + 240);
  v11(v20, *(void *)(v0 + 376));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
  *uint64_t v26 = sub_24A6DADC0();
  v26[1] = v28;
  void v26[2] = sub_24A6DADD0();
  v26[3] = v29;
  v26[4] = sub_24A6DADB0();
  v26[5] = v30;
  sub_24A6DADA0();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 728) = v31;
  *(void *)(v0 + 736) = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v31(v22, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))((char *)v26 + *(int *)(v36 + 28), v35, v37);
  sub_24A6B306C((uint64_t)v26, v25);
  sub_24A6DAE20();
  sub_24A6DA9A0();
  sub_24A6B30D0(v25, (uint64_t)v26);
  sub_24A6DB500();
  *(void *)(v0 + 744) = sub_24A6DB4F0();
  uint64_t v33 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6B1B3C, v33, v32);
}

uint64_t sub_24A6B6498()
{
  uint64_t v1 = *(void **)(v0 + 704);
  sub_24A6B3728(v0 + 16);
  sub_24A6DB0E0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 704);
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 160) = v10;
    sub_24A6DB5B0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed creating date query: %@", v7, 0xCu);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v8, -1, -1);
    MEMORY[0x24C5CC2B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 704);
  }
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v13 = *(void *)(v0 + 512);
  uint64_t v14 = *(void *)(v0 + 496);

  v12(v13, v14);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v15);
  uint64_t v16 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v17 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v42 = v17;
    uint64_t v18 = *(void *)(v0 + 296);
    uint64_t v19 = *(void *)(v0 + 304);
    uint64_t v20 = *(void *)(v0 + 288);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x263F90238])
    {
      char v21 = 0;
      uint64_t v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
      uint64_t v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v21 = 1;
    }
    uint64_t v23 = (uint64_t *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 384);
    uint64_t v40 = *(void *)(v0 + 392);
    uint64_t v27 = *(void *)(v0 + 376);
    (*(void (**)(void))(v0 + 648))(*(void *)(v0 + 408));
    uint64_t v28 = swift_slowAlloc();
    *(unsigned char *)uint64_t v28 = 0;
    *(unsigned char *)(v28 + 1) = v21;
    *(_WORD *)(v28 + 2) = 2050;
    *(void *)(v0 + 176) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v29 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v16, v42, v29, "CE.Intent.Create.Date", v22, (uint8_t *)v28, 0xCu);
    MEMORY[0x24C5CC2B0](v28, -1, -1);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v25(v40, v27);
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v0 + 392);
    uint64_t v24 = *(void *)(v0 + 384);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  id v38 = *(id *)(v0 + 704);
  uint64_t v30 = *(void *)(v0 + 432);
  uint64_t v31 = *(void *)(v0 + 416);
  uint64_t v39 = *(void *)(v0 + 424);
  uint64_t v41 = *(void *)(v0 + 440);
  uint64_t v32 = *(void *)(v0 + 376);
  v25(*v23, v32);
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  uint64_t v34 = *(void *)(v0 + 104);
  uint64_t v33 = *(void *)(v0 + 112);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v35 = v34;
  *(void *)(v35 + 8) = v33;
  *(unsigned char *)(v35 + 16) = 2;
  swift_willThrow();
  swift_release();

  swift_release();
  v25(v31, v32);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v41, v39);
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
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_24A6B6A68@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF0E0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6B6B28(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return CreateDateScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6B6BC4(uint64_t a1)
{
  unint64_t v2 = sub_24A6B6C00();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_24A6B6C00()
{
  unint64_t result = qword_2697AF110;
  if (!qword_2697AF110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF110);
  }
  return result;
}

unint64_t sub_24A6B6C58()
{
  unint64_t result = qword_2697AF118;
  if (!qword_2697AF118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF118);
  }
  return result;
}

unint64_t sub_24A6B6CB4()
{
  unint64_t result = qword_2697AF120;
  if (!qword_2697AF120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF120);
  }
  return result;
}

unint64_t sub_24A6B6D0C()
{
  unint64_t result = qword_2697AF128;
  if (!qword_2697AF128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF128);
  }
  return result;
}

uint64_t sub_24A6B6D60()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6B6D94()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CreateDateScheduledQueryIntent()
{
  return &type metadata for CreateDateScheduledQueryIntent;
}

uint64_t sub_24A6B6E04()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF138);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF138);
  return sub_24A6DAC90();
}

uint64_t static CreateLocationEnteredScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF138);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateLocationEnteredScheduledQueryIntent.title.setter(uint64_t a1)
{
  if (qword_2697AEEF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF138);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateLocationEnteredScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEEF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF138);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.query.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6B70E8@<X0>(void *a1@<X8>)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A6B718C()
{
  return swift_release();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.query.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.query.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$query.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.location.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6B7318@<X0>(void *a1@<X8>)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A6B73BC(id *a1)
{
  id v1 = *a1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void CreateLocationEnteredScheduledQueryIntent.location.setter(void *a1)
{
  id v1 = a1;
  sub_24A6DAA20();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.location.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$location.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.locationName.getter()
{
  sub_24A6DAA10();
  return v1;
}

double sub_24A6B7554@<D0>(_OWORD *a1@<X8>)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24A6B75F8()
{
  return swift_release();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.locationName.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.locationName.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$locationName.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.radius.getter()
{
  return sub_24A6DAA10();
}

uint64_t sub_24A6B7774()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24A6B7814(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF150);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  char v7 = (char *)&v9 - v6;
  sub_24A6B79F0(a1, (uint64_t)&v9 - v6);
  sub_24A6B79F0((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  sub_24A6AE66C((uint64_t)v7, &qword_2697AF150);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.radius.setter(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF150);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24A6B79F0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24A6DAA20();
  return sub_24A6AE66C(a1, &qword_2697AF150);
}

uint64_t sub_24A6B79F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AF150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.radius.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$radius.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.runsOnce.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6B7B0C@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A6B7BB0()
{
  return swift_release();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.runsOnce.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationEnteredScheduledQueryIntent.runsOnce.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.$runsOnce.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationEnteredScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v1 = sub_24A6AE628(&qword_2697AF158);
  MEMORY[0x270FA5388](v1 - 8);
  v63 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6AE628(&qword_2697AF160);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v62 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A6AE628(&qword_2697AF168);
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v58 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A6DAB90();
  uint64_t v77 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v18;
  uint64_t v19 = sub_24A6DACC0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v69 = v20 + 56;
  uint64_t v70 = v19;
  v75(v18, 1, 1, v19);
  uint64_t v56 = sub_24A6DB410();
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v23 = *(void *)(v56 - 8);
  uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v57 = v23 + 56;
  uint64_t v54 = v15;
  v55(v15, 1, 1, v56);
  uint64_t v24 = sub_24A6DA990();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v67 = v25 + 56;
  uint64_t v68 = v26;
  v26(v12, 1, 1, v24);
  unsigned int v74 = *MEMORY[0x263EFBDC8];
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 104);
  v77 += 104;
  v73 = v27;
  uint64_t v28 = v9;
  uint64_t v71 = v7;
  ((void (*)(char *))v27)(v9);
  os_signpost_id_t v29 = v72;
  uint64_t v61 = sub_24A6DAA90();
  uint64_t v53 = sub_24A6AE628(&qword_2697AF170);
  uint64_t v30 = v22;
  sub_24A6DAC90();
  uint64_t v31 = v75;
  v75(v29, 1, 1, v19);
  uint64_t v76 = v24;
  uint64_t v32 = v24;
  uint64_t v33 = v68;
  v68(v12, 1, 1, v32);
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, *MEMORY[0x263EFB978], v60);
  v73(v28, v74, v7);
  long long v65 = v30;
  uint64_t v34 = v72;
  uint64_t v60 = sub_24A6DAAB0();
  uint64_t v59 = sub_24A6AE628(&qword_2697AF178);
  sub_24A6DAC90();
  uint64_t v35 = v70;
  v31(v34, 1, 1, v70);
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  v55(v54, 1, 1, v56);
  uint64_t v36 = v12;
  v33(v12, 1, 1, v76);
  uint64_t v66 = v28;
  uint64_t v37 = v28;
  uint64_t v38 = v74;
  uint64_t v39 = v73;
  v73(v37, v74, v71);
  uint64_t v40 = v72;
  uint64_t v41 = v36;
  uint64_t v59 = sub_24A6DAA90();
  uint64_t v58 = (char *)sub_24A6AE628(&qword_2697AF180);
  sub_24A6DAC90();
  v75(v40, 1, 1, v35);
  uint64_t v42 = *MEMORY[0x263EFB9A0];
  uint64_t v43 = sub_24A6AE628(&qword_2697AF188);
  uint64_t v44 = *(void *)(v43 - 8);
  os_signpost_type_t v45 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 104))(v62, v42, v43);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v45, 0, 1, v43);
  uint64_t v46 = v68;
  v68(v41, 1, 1, v76);
  uint64_t v47 = v71;
  v39(v66, v38, v71);
  uint64_t v48 = sub_24A6DAA60();
  sub_24A6AE628(&qword_2697AF190);
  sub_24A6DAC90();
  v75(v40, 1, 1, v70);
  LOBYTE(v78) = 2;
  uint64_t v49 = sub_24A6DB4D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v63, 1, 1, v49);
  v46(v41, 1, 1, v76);
  v73(v66, v74, v47);
  uint64_t result = sub_24A6DAAA0();
  uint64_t v51 = v64;
  uint64_t v52 = v60;
  *uint64_t v64 = v61;
  v51[1] = v52;
  v51[2] = v59;
  v51[3] = v48;
  v51[4] = result;
  return result;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.init(query:latitude:longitude:locationName:radius:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v87 = a5;
  uint64_t v83 = a3;
  uint64_t v84 = a4;
  uint64_t v82 = a2;
  v81 = a1;
  v88 = a6;
  uint64_t v10 = sub_24A6AE628(&qword_2697AF150);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v86 = (uint64_t)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v85 = (char *)v70 - v13;
  uint64_t v14 = sub_24A6AE628(&qword_2697AF158);
  MEMORY[0x270FA5388](v14 - 8);
  v80 = (char *)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A6AE628(&qword_2697AF160);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v79 = (char *)v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_24A6AE628(&qword_2697AF168);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  v75 = (char *)v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_24A6DAB90();
  uint64_t v19 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v21 = (char *)v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)v70 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_24A6DACC0();
  uint64_t v95 = v31;
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v78 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v94 = v32 + 56;
  v33(v30, 1, 1, v31);
  v90 = v33;
  uint64_t v73 = sub_24A6DB410();
  id v100 = 0;
  uint64_t v101 = 0;
  uint64_t v34 = *(void *)(v73 - 8);
  v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v74 = v34 + 56;
  uint64_t v71 = v27;
  v72(v27, 1, 1, v73);
  uint64_t v99 = sub_24A6DA990();
  uint64_t v35 = *(void *)(v99 - 8);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v92 = v35 + 56;
  v93 = v36;
  v36(v24, 1, 1, v99);
  unsigned int v96 = *MEMORY[0x263EFBDC8];
  uint64_t v37 = *(void (**)(void))(v19 + 104);
  uint64_t v91 = v19 + 104;
  v98 = (void (*)(char *, uint64_t, uint64_t))v37;
  v37(v21);
  uint64_t v78 = sub_24A6DAA90();
  v70[1] = sub_24A6AE628(&qword_2697AF170);
  swift_retain();
  sub_24A6DAC90();
  uint64_t v38 = v30;
  uint64_t v39 = v95;
  v33(v30, 1, 1, v95);
  v70[0] = v24;
  v93(v24, 1, 1, v99);
  (*(void (**)(char *, void, uint64_t))(v76 + 104))(v75, *MEMORY[0x263EFB978], v77);
  v89 = v21;
  uint64_t v40 = v96;
  uint64_t v41 = v97;
  v98(v21, v96, v97);
  uint64_t v77 = sub_24A6DAAB0();
  uint64_t v76 = sub_24A6AE628(&qword_2697AF178);
  swift_retain();
  sub_24A6DAC90();
  uint64_t v42 = v90;
  v90(v38, 1, 1, v39);
  id v100 = 0;
  uint64_t v101 = 0;
  v72(v71, 1, 1, v73);
  uint64_t v43 = (char *)v70[0];
  v93((char *)v70[0], 1, 1, v99);
  v98(v89, v40, v41);
  uint64_t v44 = v43;
  uint64_t v76 = sub_24A6DAA90();
  v75 = (char *)sub_24A6AE628(&qword_2697AF180);
  swift_retain();
  sub_24A6DAC90();
  v42(v38, 1, 1, v95);
  uint64_t v45 = *MEMORY[0x263EFB9A0];
  uint64_t v46 = sub_24A6AE628(&qword_2697AF188);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 104))(v79, v45, v46);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v46);
  uint64_t v49 = v44;
  unint64_t v50 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v93;
  v93(v44, 1, 1, v99);
  uint64_t v51 = v89;
  uint64_t v52 = v97;
  v98(v89, v96, v97);
  uint64_t v53 = sub_24A6DAA60();
  sub_24A6AE628(&qword_2697AF190);
  swift_retain();
  sub_24A6DAC90();
  v90(v38, 1, 1, v95);
  LOBYTE(v100) = 2;
  uint64_t v54 = sub_24A6DB4D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v80, 1, 1, v54);
  v50((uint64_t)v49, 1, 1, v99);
  v98(v51, v96, v52);
  uint64_t v55 = sub_24A6DAAA0();
  id v100 = v81;
  uint64_t v101 = v82;
  swift_retain_n();
  uint64_t v56 = v78;
  swift_retain();
  uint64_t v57 = v77;
  swift_retain();
  uint64_t v58 = v76;
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v59 = objc_allocWithZone(MEMORY[0x263F00A50]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v60 = objc_msgSend(v59, sel_initWithLatitude_longitude_, a7, a8);
  uint64_t v61 = (void *)sub_24A6DB460();
  swift_bridgeObjectRelease();
  id v62 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v60, v61, 0);

  id v100 = v62;
  id v63 = v62;
  sub_24A6DAA20();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  uint64_t v64 = sub_24A6AE628(&qword_2697AF198);
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = (uint64_t)v85;
  uint64_t v67 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v85, v87, v64);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v64);
  sub_24A6B79F0(v66, v86);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  sub_24A6AE66C(v66, &qword_2697AF150);
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v64);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  uint64_t result = swift_release_n();
  uint64_t v69 = v88;
  uint64_t *v88 = v56;
  v69[1] = v57;
  v69[2] = v58;
  v69[3] = v53;
  v69[4] = v55;
  return result;
}

uint64_t CreateLocationEnteredScheduledQueryIntent.perform()(uint64_t a1)
{
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = type metadata accessor for ScheduledQuerySnippetView();
  *(void *)(v2 + 248) = swift_task_alloc();
  sub_24A6DACC0();
  *(void *)(v2 + 256) = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  *(void *)(v2 + 264) = v3;
  *(void *)(v2 + 272) = *(void *)(v3 - 8);
  *(void *)(v2 + 280) = swift_task_alloc();
  uint64_t v4 = sub_24A6DAE60();
  *(void *)(v2 + 288) = v4;
  *(void *)(v2 + 296) = *(void *)(v4 - 8);
  *(void *)(v2 + 304) = swift_task_alloc();
  *(void *)(v2 + 312) = type metadata accessor for ScheduledQueryEntity();
  *(void *)(v2 + 320) = swift_task_alloc();
  *(void *)(v2 + 328) = swift_task_alloc();
  uint64_t v5 = sub_24A6DB080();
  *(void *)(v2 + 336) = v5;
  *(void *)(v2 + 344) = *(void *)(v5 - 8);
  *(void *)(v2 + 352) = swift_task_alloc();
  *(void *)(v2 + 360) = swift_task_alloc();
  uint64_t v6 = sub_24A6DADE0();
  *(void *)(v2 + 368) = v6;
  *(void *)(v2 + 376) = *(void *)(v6 - 8);
  *(void *)(v2 + 384) = swift_task_alloc();
  *(void *)(v2 + 392) = swift_task_alloc();
  uint64_t v7 = sub_24A6DB040();
  *(void *)(v2 + 400) = v7;
  *(void *)(v2 + 408) = *(void *)(v7 - 8);
  *(void *)(v2 + 416) = swift_task_alloc();
  *(void *)(v2 + 424) = swift_task_alloc();
  *(void *)(v2 + 432) = swift_task_alloc();
  *(void *)(v2 + 440) = swift_task_alloc();
  uint64_t v8 = sub_24A6DB070();
  *(void *)(v2 + 448) = v8;
  *(void *)(v2 + 456) = *(void *)(v8 - 8);
  *(void *)(v2 + 464) = swift_task_alloc();
  uint64_t v9 = sub_24A6DAB60();
  *(void *)(v2 + 472) = v9;
  *(void *)(v2 + 480) = *(void *)(v9 - 8);
  *(void *)(v2 + 488) = swift_task_alloc();
  uint64_t v10 = sub_24A6AE628(&qword_2697AF038);
  *(void *)(v2 + 496) = v10;
  *(void *)(v2 + 504) = *(void *)(v10 - 8);
  *(void *)(v2 + 512) = swift_task_alloc();
  uint64_t v11 = sub_24A6DB110();
  *(void *)(v2 + 520) = v11;
  *(void *)(v2 + 528) = *(void *)(v11 - 8);
  *(void *)(v2 + 536) = swift_task_alloc();
  *(void *)(v2 + 544) = swift_task_alloc();
  *(void *)(v2 + 552) = swift_task_alloc();
  *(void *)(v2 + 560) = swift_task_alloc();
  *(void *)(v2 + 568) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF150);
  *(void *)(v2 + 576) = swift_task_alloc();
  uint64_t v12 = sub_24A6AE628(&qword_2697AF198);
  *(void *)(v2 + 584) = v12;
  *(void *)(v2 + 592) = *(void *)(v12 - 8);
  *(void *)(v2 + 600) = swift_task_alloc();
  *(void *)(v2 + 608) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF008);
  *(void *)(v2 + 616) = swift_task_alloc();
  uint64_t v13 = sub_24A6DAC10();
  *(void *)(v2 + 624) = v13;
  *(void *)(v2 + 632) = *(void *)(v13 - 8);
  *(void *)(v2 + 640) = swift_task_alloc();
  uint64_t v14 = sub_24A6DAD90();
  *(void *)(v2 + 648) = v14;
  *(void *)(v2 + 656) = *(void *)(v14 - 8);
  *(void *)(v2 + 664) = swift_task_alloc();
  long long v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 672) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 688) = v15;
  *(void *)(v2 + 704) = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_24A6B98E8, 0, 0);
}

uint64_t sub_24A6B98E8()
{
  uint64_t v1 = v0[83];
  uint64_t v2 = v0[82];
  uint64_t v3 = v0[81];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F33298], v3);
  char v4 = sub_24A6DAD80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v5 = v0[80];
    uint64_t v6 = v0[79];
    uint64_t v7 = v0[78];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v0[20] = v0[22];
    v0[21] = v0[23];
    sub_24A6DAC00();
    sub_24A6B28C8();
    uint64_t v8 = sub_24A6DB5D0();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_24A6DAA10();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v13 = v0[12];
      uint64_t v12 = v0[13];
      v0[89] = v12;
      uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2697AF1A8 + dword_2697AF1A8);
      uint64_t v14 = (void *)swift_task_alloc();
      v0[90] = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_24A6B9F20;
      return v27(v13, v12);
    }
    uint64_t v23 = v0[77];
    uint64_t v24 = v0[33];
    uint64_t v25 = v0[34];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA30();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    sub_24A6DA8E0();
    sub_24A6BE794(&qword_2697AF088, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_24A6DAA40();
    swift_release();
    sub_24A6AE66C(v23, &qword_2697AF008);
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v16 = sub_24A6DB100();
    os_log_type_t v17 = sub_24A6DB520();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24A6AB000, v16, v17, "Feature flag is disabled", v18, 2u);
      MEMORY[0x24C5CC2B0](v18, -1, -1);
    }
    uint64_t v19 = v0[68];
    uint64_t v20 = v0[66];
    uint64_t v21 = v0[65];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v22 = 0;
    *(void *)(v22 + 8) = 0;
    *(unsigned char *)(v22 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_24A6B9F20(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 728) = a1;
  *(void *)(v3 + 736) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v4 = sub_24A6BAC80;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v4 = sub_24A6BA040;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6BA040()
{
  uint64_t v69 = v0;
  uint64_t v1 = *(void **)(v0 + 728);
  uint64_t v2 = v1;
  if (v1) {
    goto LABEL_4;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 192);
  if (v2)
  {
    uint64_t v1 = *(void **)(v0 + 728);
LABEL_4:
    *(void *)(v0 + 744) = v2;
    uint64_t v3 = *(void *)(v0 + 592);
    uint64_t v4 = *(void *)(v0 + 584);
    uint64_t v5 = *(void *)(v0 + 576);
    id v6 = v1;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4))
    {
      sub_24A6AE66C(*(void *)(v0 + 576), &qword_2697AF150);
      sub_24A6B291C();
      sub_24A6DB560();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v9 = *(void *)(v0 + 608);
      uint64_t v10 = *(void *)(v0 + 600);
      uint64_t v11 = *(void *)(v0 + 592);
      uint64_t v12 = *(void *)(v0 + 584);
      uint64_t v13 = *(void *)(v0 + 576);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v13, v12);
      sub_24A6AE66C(v13, &qword_2697AF150);
      id v14 = objc_msgSend(self, sel_meters);
      sub_24A6DABF0();

      long long v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v15(v10, v12);
      sub_24A6DABE0();
      uint64_t v8 = v16;
      v15(v9, v12);
    }
    *(void *)(v0 + 752) = v8;
    sub_24A6B291C();
    if (sub_24A6DB550())
    {
      sub_24A6DB0E0();
      os_log_type_t v17 = sub_24A6DB100();
      os_log_type_t v18 = sub_24A6DB540();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_24A6AB000, v17, v18, "We will request confirmation for creating a task", v19, 2u);
        MEMORY[0x24C5CC2B0](v19, -1, -1);
      }
      uint64_t v20 = *(void *)(v0 + 704);
      uint64_t v21 = *(void *)(v0 + 568);
      uint64_t v22 = *(void *)(v0 + 528);
      uint64_t v23 = *(void *)(v0 + 520);
      long long v65 = *(_OWORD *)(v0 + 672);
      long long v63 = *(_OWORD *)(v0 + 688);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      *(_OWORD *)(v0 + 16) = v65;
      *(_OWORD *)(v0 + 32) = v63;
      *(void *)(v0 + 48) = v20;
      sub_24A6DA9F0();
      sub_24A6DAB50();
      uint64_t v24 = (void *)swift_task_alloc();
      *(void *)(v0 + 760) = v24;
      unint64_t v25 = sub_24A6BE1D0();
      uint64_t v26 = sub_24A6B36E4(&qword_2697AF080, &qword_2697AF038);
      *uint64_t v24 = v0;
      v24[1] = sub_24A6BAE80;
      uint64_t v27 = *(void *)(v0 + 512);
      uint64_t v28 = *(void *)(v0 + 488);
      uint64_t v29 = *(void *)(v0 + 496);
      return MEMORY[0x270EE0D08](v27, v28, 1, &type metadata for CreateLocationEnteredScheduledQueryIntent, v29, v25, v26);
    }
    else
    {
      sub_24A6DB0E0();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v30 = sub_24A6DB100();
      os_log_type_t v66 = sub_24A6DB540();
      BOOL v31 = os_log_type_enabled(v30, v66);
      uint64_t v32 = *(void *)(v0 + 560);
      uint64_t v33 = *(void *)(v0 + 528);
      uint64_t v34 = *(void *)(v0 + 520);
      if (v31)
      {
        uint64_t v64 = *(void *)(v0 + 560);
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        v68[0] = v61;
        *(_DWORD *)uint64_t v35 = 136315138;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        sub_24A6DAA10();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        *(void *)(v0 + 216) = sub_24A6B2A14(*(void *)(v0 + 144), *(void *)(v0 + 152), v68);
        sub_24A6DB5B0();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A6AB000, v30, v66, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CC2B0](v61, -1, -1);
        MEMORY[0x24C5CC2B0](v35, -1, -1);

        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
        v36(v64, v34);
      }
      else
      {

        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
        v36(v32, v34);
      }
      *(void *)(v0 + 776) = v36;
      sub_24A6DB0F0();
      sub_24A6DB050();
      sub_24A6DB060();
      sub_24A6DB020();
      uint64_t v37 = sub_24A6DB060();
      os_signpost_type_t v38 = sub_24A6DB580();
      if (sub_24A6DB590())
      {
        uint64_t v39 = *(void *)(v0 + 432);
        uint64_t v40 = *(void *)(v0 + 400);
        uint64_t v41 = *(void *)(v0 + 408);
        uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
        unint64_t v43 = (v41 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        v42(v39, *(void *)(v0 + 440), v40);
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        os_signpost_id_t v45 = sub_24A6DB030();
        _os_signpost_emit_with_name_impl(&dword_24A6AB000, v37, v38, v45, "CE.Intent.Create.Enter", "", v44, 2u);
        MEMORY[0x24C5CC2B0](v44, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
      }
      else
      {
        uint64_t v46 = *(void *)(v0 + 408);

        uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
        unint64_t v43 = (v46 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      }
      *(void *)(v0 + 784) = v42;
      uint64_t v67 = *(void *)(v0 + 744);
      uint64_t v48 = *(void *)(v0 + 432);
      uint64_t v47 = *(void *)(v0 + 440);
      uint64_t v49 = *(void *)(v0 + 400);
      *(void *)(v0 + 792) = v43;
      v42(v48, v47, v49);
      sub_24A6DB0C0();
      swift_allocObject();
      *(void *)(v0 + 800) = sub_24A6DB0B0();
      static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v68);
      uint64_t v50 = v68[0];
      *(void *)(v0 + 808) = v68[0];
      sub_24A6DAF70();
      *(void *)(v0 + 816) = sub_24A6DAF60();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_24A6DAA10();
      uint64_t v51 = *(void *)(v0 + 136);
      uint64_t v62 = *(void *)(v0 + 128);
      *(void *)(v0 + 824) = v51;
      sub_24A6DAA10();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v52 = *(unsigned __int8 *)(v0 + 888);
      *(void *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
      *(void *)(v0 + 88) = sub_24A6B295C();
      *(void *)(v0 + 56) = v50;
      swift_retain();
      uint64_t v53 = (void *)swift_task_alloc();
      *(void *)(v0 + 832) = v53;
      *uint64_t v53 = v0;
      v53[1] = sub_24A6BB5C0;
      v54.n128_u64[0] = *(void *)(v0 + 752);
      uint64_t v55 = *(void *)(v0 + 392);
      return MEMORY[0x270F184E8](v55, v67, v62, v51, v52, v0 + 56, v54);
    }
  }
  uint64_t v56 = *(void *)(v0 + 616);
  uint64_t v57 = *(void *)(v0 + 264);
  uint64_t v58 = *(void *)(v0 + 272);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA30();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v56, 1, 1, v57);
  sub_24A6DA8E0();
  sub_24A6BE794(&qword_2697AF088, MEMORY[0x263EFB650]);
  swift_allocError();
  sub_24A6DAA40();
  swift_release();
  sub_24A6AE66C(v56, &qword_2697AF008);
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v59 = *(uint64_t (**)(void))(v0 + 8);
  return v59();
}

uint64_t sub_24A6BAC80()
{
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6BAE80()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 768) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[63];
    uint64_t v3 = v2[64];
    uint64_t v5 = v2[62];
    (*(void (**)(void, void))(v2[60] + 8))(v2[61], v2[59]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24A6BBE9C;
  }
  else
  {
    uint64_t v8 = v2[63];
    uint64_t v7 = v2[64];
    uint64_t v9 = v2[62];
    (*(void (**)(void, void))(v2[60] + 8))(v2[61], v2[59]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    id v6 = sub_24A6BB004;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A6BB004()
{
  uint64_t v35 = v0;
  sub_24A6DB0E0();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = *(void *)(v0 + 528);
    uint64_t v31 = *(void *)(v0 + 520);
    uint64_t v32 = *(void *)(v0 + 560);
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v34 = v28;
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(v0 + 216) = sub_24A6B2A14(*(void *)(v0 + 144), *(void *)(v0 + 152), &v34);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_24A6AB000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v28, -1, -1);
    MEMORY[0x24C5CC2B0](v3, -1, -1);

    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v4(v32, v31);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 560);
    uint64_t v6 = *(void *)(v0 + 528);
    uint64_t v7 = *(void *)(v0 + 520);
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();

    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v4(v5, v7);
  }
  *(void *)(v0 + 776) = v4;
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v8 = sub_24A6DB060();
  os_signpost_type_t v9 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v10 = *(void *)(v0 + 432);
    uint64_t v11 = *(void *)(v0 + 400);
    uint64_t v12 = *(void *)(v0 + 408);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    unint64_t v14 = (v12 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v13(v10, *(void *)(v0 + 440), v11);
    long long v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v15 = 0;
    os_signpost_id_t v16 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v8, v9, v16, "CE.Intent.Create.Enter", "", v15, 2u);
    MEMORY[0x24C5CC2B0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 408);

    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    unint64_t v14 = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  *(void *)(v0 + 784) = v13;
  uint64_t v33 = *(void *)(v0 + 744);
  uint64_t v19 = *(void *)(v0 + 432);
  uint64_t v18 = *(void *)(v0 + 440);
  uint64_t v20 = *(void *)(v0 + 400);
  *(void *)(v0 + 792) = v14;
  v13(v19, v18, v20);
  sub_24A6DB0C0();
  swift_allocObject();
  *(void *)(v0 + 800) = sub_24A6DB0B0();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v34);
  uint64_t v21 = v34;
  *(void *)(v0 + 808) = v34;
  sub_24A6DAF70();
  *(void *)(v0 + 816) = sub_24A6DAF60();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  uint64_t v22 = *(void *)(v0 + 136);
  uint64_t v30 = *(void *)(v0 + 128);
  *(void *)(v0 + 824) = v22;
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = *(unsigned __int8 *)(v0 + 888);
  *(void *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
  *(void *)(v0 + 88) = sub_24A6B295C();
  *(void *)(v0 + 56) = v21;
  swift_retain();
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 832) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_24A6BB5C0;
  v25.n128_u64[0] = *(void *)(v0 + 752);
  uint64_t v26 = *(void *)(v0 + 392);
  return MEMORY[0x270F184E8](v26, v33, v30, v22, v23, v0 + 56, v25);
}

uint64_t sub_24A6BB5C0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 840) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_24A6BC0A4;
  }
  else
  {
    sub_24A6B3728(v2 + 56);
    uint64_t v3 = sub_24A6BB708;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A6BB708()
{
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v1);
  uint64_t v2 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v3 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v39 = v3;
    uint64_t v4 = *(void *)(v0 + 360);
    uint64_t v6 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 344);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x263F90238])
    {
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
      uint64_t v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v7 = 1;
    }
    format = (char *)v8;
    uint64_t v14 = *(void *)(v0 + 424);
    uint64_t v15 = *(void *)(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 408);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 784))(*(void *)(v0 + 432), v14, v15);
    uint64_t v17 = swift_slowAlloc();
    *(unsigned char *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 1) = v7;
    *(_WORD *)(v17 + 2) = 2050;
    *(void *)(v0 + 208) = 0;
    sub_24A6DB5B0();
    os_signpost_id_t v18 = sub_24A6DB030();
    os_signpost_type_t v9 = (uint64_t *)(v0 + 432);
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v2, v39, v18, "CE.Intent.Create.Enter", format, (uint8_t *)v17, 0xCu);
    MEMORY[0x24C5CC2B0](v17, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, void))(v16 + 8);
    uint64_t v12 = v16 + 8;
    uint64_t v11 = v19;
    v19(v14, v15);
  }
  else
  {
    os_signpost_type_t v9 = (uint64_t *)(v0 + 424);
    uint64_t v10 = *(void *)(v0 + 408);

    uint64_t v13 = *(void (**)(uint64_t, void))(v10 + 8);
    uint64_t v12 = v10 + 8;
    uint64_t v11 = v13;
  }
  uint64_t v20 = *v9;
  *(void *)(v0 + 856) = v12;
  *(void *)(v0 + 848) = v11;
  uint64_t v21 = *(void *)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 376);
  uint64_t v22 = *(void *)(v0 + 384);
  uint64_t v24 = *(void *)(v0 + 368);
  uint64_t v26 = *(uint64_t **)(v0 + 320);
  uint64_t v25 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 296);
  uint64_t v35 = *(void *)(v0 + 304);
  uint64_t v36 = *(void *)(v0 + 312);
  uint64_t v37 = *(void *)(v0 + 288);
  v11(v20, *(void *)(v0 + 400));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
  *uint64_t v26 = sub_24A6DADC0();
  v26[1] = v28;
  void v26[2] = sub_24A6DADD0();
  v26[3] = v29;
  v26[4] = sub_24A6DADB0();
  v26[5] = v30;
  sub_24A6DADA0();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 864) = v31;
  *(void *)(v0 + 872) = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v31(v22, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))((char *)v26 + *(int *)(v36 + 28), v35, v37);
  sub_24A6B306C((uint64_t)v26, v25);
  sub_24A6DAE20();
  sub_24A6DA9A0();
  sub_24A6B30D0(v25, (uint64_t)v26);
  sub_24A6DB500();
  *(void *)(v0 + 880) = sub_24A6DB4F0();
  uint64_t v33 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6BBA8C, v33, v32);
}

uint64_t sub_24A6BBA8C()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 248);
  swift_release();
  sub_24A6B306C(v1, v2);
  return MEMORY[0x270FA2498](sub_24A6BBB08, 0, 0);
}

uint64_t sub_24A6BBB08()
{
  uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[108];
  os_signpost_id_t v18 = (void (*)(uint64_t, uint64_t))v0[106];
  os_signpost_type_t v9 = (void *)v0[93];
  uint64_t v10 = (void *)v0[91];
  uint64_t v1 = v0[57];
  uint64_t v15 = v0[56];
  uint64_t v16 = v0[58];
  uint64_t v14 = v0[55];
  uint64_t v12 = v0[49];
  uint64_t v13 = v0[50];
  uint64_t v11 = v0[46];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v8 = v0[33];
  uint64_t v5 = v0[31];
  sub_24A6BE794(&qword_2697AF068, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  sub_24A6BE794(&qword_2697AF070, (void (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView);
  sub_24A6DA9B0();

  swift_release();
  swift_release();

  sub_24A6B3134(v5, (uint64_t (*)(void))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v8);
  sub_24A6B3134(v2, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  v17(v12, v11);
  v18(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v16, v15);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24A6BBE9C()
{
  uint64_t v1 = *(void **)(v0 + 744);

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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A6BC0A4()
{
  uint64_t v1 = *(void **)(v0 + 840);
  sub_24A6B3728(v0 + 56);
  sub_24A6DB0E0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 840);
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 200) = v10;
    sub_24A6DB5B0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed creating location query: %@", v7, 0xCu);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v8, -1, -1);
    MEMORY[0x24C5CC2B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 840);
  }
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 776);
  uint64_t v13 = *(void *)(v0 + 536);
  uint64_t v14 = *(void *)(v0 + 520);

  v12(v13, v14);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v15);
  uint64_t v16 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v17 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v44 = v17;
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v19 = *(void *)(v0 + 352);
    uint64_t v20 = *(void *)(v0 + 336);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x263F90238])
    {
      char v21 = 0;
      uint64_t v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 352), *(void *)(v0 + 336));
      uint64_t v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v21 = 1;
    }
    uint64_t v23 = (uint64_t *)(v0 + 432);
    uint64_t v27 = *(void *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 416);
    uint64_t v28 = *(void *)(v0 + 400);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 784))(*(void *)(v0 + 432), v26, v28);
    uint64_t v29 = swift_slowAlloc();
    *(unsigned char *)uint64_t v29 = 0;
    *(unsigned char *)(v29 + 1) = v21;
    *(_WORD *)(v29 + 2) = 2050;
    *(void *)(v0 + 224) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v30 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v16, v44, v30, "CE.Intent.Create.Enter", v22, (uint8_t *)v29, 0xCu);
    MEMORY[0x24C5CC2B0](v29, -1, -1);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v25(v26, v28);
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v0 + 416);
    uint64_t v24 = *(void *)(v0 + 408);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  uint64_t v31 = *v23;
  id v41 = *(id *)(v0 + 840);
  os_signpost_type_t v38 = *(void **)(v0 + 744);
  uint64_t v32 = *(void *)(v0 + 456);
  uint64_t v45 = *(void *)(v0 + 464);
  uint64_t v42 = *(void **)(v0 + 728);
  uint64_t v43 = *(void *)(v0 + 448);
  uint64_t v39 = *(void *)(v0 + 400);
  uint64_t v40 = *(void *)(v0 + 440);
  ((void (*)(uint64_t))v25)(v31);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v34 = *(void *)(v0 + 112);
  uint64_t v33 = *(void *)(v0 + 120);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v35 = v34;
  *(void *)(v35 + 8) = v33;
  *(unsigned char *)(v35 + 16) = 2;
  swift_willThrow();

  swift_release();
  swift_release();

  v25(v40, v39);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v43);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_24A6BC6FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEEF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF138);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6BC7BC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return CreateLocationEnteredScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6BC858(uint64_t a1)
{
  unint64_t v2 = sub_24A6BE1D0();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_24A6BC894(uint64_t a1, uint64_t a2)
{
  sub_24A6DB6C0();
  sub_24A6DB490();
  uint64_t v4 = sub_24A6DB6D0();
  return sub_24A6BC90C(a1, a2, v4);
}

unint64_t sub_24A6BC90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A6DB650() & 1) == 0)
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
      while (!v14 && (sub_24A6DB650() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24A6BC9F0(uint64_t a1, uint64_t a2)
{
  v2[6] = a1;
  v2[7] = a2;
  sub_24A6AE628(&qword_2697AF1D8);
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_24A6DAEC0();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_24A6DB110();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF1E0);
  v2[20] = swift_task_alloc();
  uint64_t v5 = sub_24A6DAFB0();
  v2[21] = v5;
  v2[22] = *(void *)(v5 - 8);
  v2[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A6BCC0C, 0, 0);
}

uint64_t sub_24A6BCC0C()
{
  if (v0[7])
  {
    sub_24A6DAFE0();
    swift_bridgeObjectRetain();
    v0[24] = sub_24A6DAFC0();
    sub_24A6BE794(&qword_2697AF1E8, MEMORY[0x263F33308]);
    uint64_t v2 = sub_24A6DB4E0();
    return MEMORY[0x270FA2498](sub_24A6BCDAC, v2, v1);
  }
  else
  {
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
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3(0);
  }
}

uint64_t sub_24A6BCDAC()
{
  sub_24A6DAFD0();
  *(void *)(v0 + 200) = 0;
  swift_release();
  return MEMORY[0x270FA2498](sub_24A6BCE58, 0, 0);
}

uint64_t sub_24A6BCE58()
{
  __n128 v54 = v0;
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    uint64_t v5 = v0[6];
    uint64_t v4 = v0[7];
    sub_24A6AE66C(v3, &qword_2697AF1E0);
    BOOL v6 = v5 == 1701995880 && v4 == 0xE400000000000000;
    if (!v6 && (sub_24A6DB650() & 1) == 0)
    {
      sub_24A6DAED0();
      v0[30] = sub_24A6DAE70();
      uint64_t v52 = (uint64_t (*)(void))((int)*MEMORY[0x263F332C0] + MEMORY[0x263F332C0]);
      uint64_t v45 = (void *)swift_task_alloc();
      v0[31] = v45;
      *uint64_t v45 = v0;
      v45[1] = sub_24A6BD8F0;
      goto LABEL_24;
    }
    sub_24A6DB0E0();
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_24A6DB100();
    os_log_type_t v8 = sub_24A6DB540();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = v0[18];
    uint64_t v12 = v0[13];
    uint64_t v11 = v0[14];
    unint64_t v13 = v0[7];
    if (v9)
    {
      uint64_t v46 = v0[6];
      uint64_t v48 = v0[18];
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v53[0] = v15;
      *(_DWORD *)BOOL v14 = 136315138;
      swift_bridgeObjectRetain();
      v0[4] = sub_24A6B2A14(v46, v13, v53);
      sub_24A6DB5B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6AB000, v7, v8, "Using current location for: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CC2B0](v15, -1, -1);
      MEMORY[0x24C5CC2B0](v14, -1, -1);

      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v16(v48, v12);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v16(v10, v12);
    }
    sub_24A6DAE10();
    uint64_t v36 = (void *)sub_24A6DAE00();
    v0[26] = v36;
    if (sub_24A6DADF0())
    {
      uint64_t v52 = (uint64_t (*)(void))((int)*MEMORY[0x263F332B0] + MEMORY[0x263F332B0]);
      uint64_t v37 = (void *)swift_task_alloc();
      v0[27] = v37;
      *uint64_t v37 = v0;
      v37[1] = sub_24A6BD608;
LABEL_24:
      return v52();
    }
    swift_bridgeObjectRelease();
    sub_24A6DB0E0();
    os_signpost_type_t v38 = sub_24A6DB100();
    os_log_type_t v39 = sub_24A6DB520();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_24A6AB000, v38, v39, "Location access is not authorized", v40, 2u);
      MEMORY[0x24C5CC2B0](v40, -1, -1);
    }
    uint64_t v41 = v0[17];
    uint64_t v42 = v0[13];

    v16(v41, v42);
    sub_24A6ACC7C();
    swift_allocError();
    *(_OWORD *)uint64_t v43 = xmmword_24A6DC110;
    *(unsigned char *)(v43 + 16) = 4;
    swift_willThrow();

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
    os_signpost_type_t v44 = (uint64_t (*)(void))v0[1];
    return v44();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v1 + 32))(v0[23], v3, v2);
    sub_24A6DB0E0();
    swift_bridgeObjectRetain();
    os_signpost_type_t v17 = sub_24A6DB100();
    os_log_type_t v18 = sub_24A6DB540();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v20 = v0[19];
    uint64_t v21 = v0[13];
    uint64_t v22 = v0[14];
    unint64_t v23 = v0[7];
    if (v19)
    {
      uint64_t v47 = v0[6];
      uint64_t v50 = v0[19];
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = v21;
      uint64_t v25 = swift_slowAlloc();
      v53[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      v0[5] = sub_24A6B2A14(v47, v23, v53);
      sub_24A6DB5B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6AB000, v17, v18, "Using override location for: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CC2B0](v25, -1, -1);
      MEMORY[0x24C5CC2B0](v24, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v50, v49);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    }
    uint64_t v27 = v0[22];
    uint64_t v26 = v0[23];
    uint64_t v28 = v0[21];
    sub_24A6DAF90();
    double v30 = v29;
    sub_24A6DAFA0();
    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v30, v31);
    sub_24A6DAF80();
    uint64_t v33 = (void *)sub_24A6DB460();
    swift_bridgeObjectRelease();
    id v51 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v32, v33, 0);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
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
    uint64_t v34 = (uint64_t (*)(id))v0[1];
    return v34(v51);
  }
}

uint64_t sub_24A6BD608(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 224) = a1;
  *(void *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24A6BE0D4;
  }
  else {
    uint64_t v4 = sub_24A6BD71C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6BD71C()
{
  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = (void *)v0[26];
  if (v1)
  {
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v1, 0, 0);

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
    uint64_t v3 = (uint64_t (*)(id))v0[1];
    return v3(v6);
  }
  else
  {

    sub_24A6DAED0();
    v0[30] = sub_24A6DAE70();
    uint64_t v7 = (uint64_t (*)(void))((int)*MEMORY[0x263F332C0] + MEMORY[0x263F332C0]);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[31] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24A6BD8F0;
    return v7();
  }
}

uint64_t sub_24A6BD8F0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 256) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24A6BDA10, 0, 0);
}

uint64_t sub_24A6BDA10()
{
  id v51 = v0;
  if (*(void *)(v0[32] + 16))
  {
    uint64_t v2 = v0[6];
    uint64_t v1 = v0[7];
    swift_bridgeObjectRetain();
    unint64_t v3 = sub_24A6BC894(v2, v1);
    if (v4)
    {
      uint64_t v6 = v0[9];
      uint64_t v5 = v0[10];
      uint64_t v7 = v0[8];
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v0[32] + 56) + *(void *)(v5 + 72) * v3, v6);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v6);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v0[10] + 56))(v0[8], 1, 1, v0[9]);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[10] + 56))(v0[8], 1, 1, v0[9]);
  }
  uint64_t v9 = v0[9];
  uint64_t v8 = v0[10];
  uint64_t v10 = v0[8];
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v9) == 1)
  {
    sub_24A6AE66C(v0[8], &qword_2697AF1D8);
    sub_24A6DB0E0();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24A6DB100();
    os_log_type_t v12 = sub_24A6DB540();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = v0[14];
    uint64_t v15 = v0[15];
    uint64_t v16 = v0[13];
    unint64_t v17 = v0[7];
    if (v13)
    {
      uint64_t v45 = v0[6];
      uint64_t v47 = v0[15];
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v50 = v19;
      *(_DWORD *)os_log_type_t v18 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = sub_24A6B2A14(v45, v17, &v50);
      sub_24A6DB5B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6AB000, v11, v12, "No override location found for: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CC2B0](v19, -1, -1);
      MEMORY[0x24C5CC2B0](v18, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v47, v16);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    }
    id v49 = 0;
  }
  else
  {
    (*(void (**)(void, void, void))(v0[10] + 32))(v0[12], v0[8], v0[9]);
    sub_24A6DB0E0();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_24A6DB100();
    os_log_type_t v21 = sub_24A6DB540();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[13];
    uint64_t v25 = v0[14];
    unint64_t v26 = v0[7];
    if (v22)
    {
      uint64_t v46 = v0[6];
      uint64_t v48 = v0[13];
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v50 = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      v0[3] = sub_24A6B2A14(v46, v26, &v50);
      sub_24A6DB5B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6AB000, v20, v21, "Using CoreRoutine location for: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CC2B0](v28, -1, -1);
      MEMORY[0x24C5CC2B0](v27, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v48);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
    uint64_t v30 = v0[11];
    uint64_t v29 = v0[12];
    uint64_t v31 = v0[9];
    uint64_t v32 = v0[10];
    sub_24A6DAEA0();
    double v34 = v33;
    sub_24A6DAEB0();
    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v34, v35);
    sub_24A6DAE80();
    uint64_t v38 = v37;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, v29, v31);
    if (!v38) {
      sub_24A6DAE90();
    }
    uint64_t v39 = v0[12];
    uint64_t v40 = v0[9];
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0[10] + 8);
    v41(v0[11], v40);
    uint64_t v42 = (void *)sub_24A6DB460();
    swift_bridgeObjectRelease();
    id v49 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v36, v42, 0);

    v41(v39, v40);
  }
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
  uint64_t v43 = (uint64_t (*)(id))v0[1];
  return v43(v49);
}

uint64_t sub_24A6BDFEC()
{
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6BE0D4()
{
  swift_bridgeObjectRelease();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_24A6BE1D0()
{
  unint64_t result = qword_2697AF1B0;
  if (!qword_2697AF1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF1B0);
  }
  return result;
}

unint64_t sub_24A6BE228()
{
  unint64_t result = qword_2697AF1B8;
  if (!qword_2697AF1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF1B8);
  }
  return result;
}

uint64_t sub_24A6BE27C()
{
  return sub_24A6BE794((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
}

unint64_t sub_24A6BE2CC()
{
  unint64_t result = qword_2697AF1C0;
  if (!qword_2697AF1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF1C0);
  }
  return result;
}

unint64_t sub_24A6BE324()
{
  unint64_t result = qword_2697AF1C8;
  if (!qword_2697AF1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF1C8);
  }
  return result;
}

uint64_t sub_24A6BE378()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6BE3AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for CreateLocationEnteredScheduledQueryIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CreateLocationEnteredScheduledQueryIntent()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for CreateLocationEnteredScheduledQueryIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CreateLocationEnteredScheduledQueryIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CreateLocationEnteredScheduledQueryIntent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CreateLocationEnteredScheduledQueryIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateLocationEnteredScheduledQueryIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CreateLocationEnteredScheduledQueryIntent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateLocationEnteredScheduledQueryIntent()
{
  return &type metadata for CreateLocationEnteredScheduledQueryIntent;
}

uint64_t sub_24A6BE6E0()
{
  return sub_24A6B36E4(&qword_2697AF0B8, &qword_2697AF0C0);
}

uint64_t sub_24A6BE71C()
{
  return sub_24A6B36E4(&qword_2697AF0C8, &qword_2697AF0C0);
}

uint64_t sub_24A6BE758()
{
  return sub_24A6B36E4(&qword_2697AF0D0, &qword_2697AF0C0);
}

uint64_t sub_24A6BE794(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A6BE7DC()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF1F0);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF1F0);
  return sub_24A6DAC90();
}

uint64_t static CreateLocationExitedScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF1F0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CreateLocationExitedScheduledQueryIntent.title.setter(uint64_t a1)
{
  if (qword_2697AEF00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF1F0);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CreateLocationExitedScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEF00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF1F0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CreateLocationExitedScheduledQueryIntent.query.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t CreateLocationExitedScheduledQueryIntent.query.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.query.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$query.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationExitedScheduledQueryIntent.location.getter()
{
  sub_24A6DAA10();
  return v1;
}

void CreateLocationExitedScheduledQueryIntent.location.setter(void *a1)
{
  id v1 = a1;
  sub_24A6DAA20();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.location.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$location.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationExitedScheduledQueryIntent.locationName.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t CreateLocationExitedScheduledQueryIntent.locationName.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.locationName.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$locationName.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationExitedScheduledQueryIntent.radius.getter()
{
  return sub_24A6DAA10();
}

uint64_t sub_24A6BED74(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF150);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_24A6B79F0(a1, (uint64_t)&v9 - v6);
  sub_24A6B79F0((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  sub_24A6AE66C((uint64_t)v7, &qword_2697AF150);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t CreateLocationExitedScheduledQueryIntent.radius.setter(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF150);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24A6B79F0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24A6DAA20();
  return sub_24A6AE66C(a1, &qword_2697AF150);
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.radius.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$radius.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationExitedScheduledQueryIntent.runsOnce.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t CreateLocationExitedScheduledQueryIntent.runsOnce.setter()
{
  return sub_24A6DAA20();
}

uint64_t (*CreateLocationExitedScheduledQueryIntent.runsOnce.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF13C;
}

uint64_t CreateLocationExitedScheduledQueryIntent.$runsOnce.getter()
{
  return sub_24A6DAA30();
}

uint64_t CreateLocationExitedScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v1 = sub_24A6AE628(&qword_2697AF158);
  MEMORY[0x270FA5388](v1 - 8);
  long long v63 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6AE628(&qword_2697AF160);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v62 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A6AE628(&qword_2697AF168);
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v58 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A6DAB90();
  uint64_t v77 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v10 - 8);
  os_log_type_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v16 - 8);
  os_log_type_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v18;
  uint64_t v19 = sub_24A6DACC0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  BOOL v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v69 = v20 + 56;
  uint64_t v70 = v19;
  v75(v18, 1, 1, v19);
  uint64_t v56 = sub_24A6DB410();
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v23 = *(void *)(v56 - 8);
  uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v57 = v23 + 56;
  __n128 v54 = v15;
  v55(v15, 1, 1, v56);
  uint64_t v24 = sub_24A6DA990();
  uint64_t v25 = *(void *)(v24 - 8);
  unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v67 = v25 + 56;
  uint64_t v68 = v26;
  v26(v12, 1, 1, v24);
  unsigned int v74 = *MEMORY[0x263EFBDC8];
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 104);
  v77 += 104;
  uint64_t v73 = v27;
  uint64_t v28 = v9;
  uint64_t v71 = v7;
  ((void (*)(char *))v27)(v9);
  uint64_t v29 = v72;
  uint64_t v61 = sub_24A6DAA90();
  uint64_t v53 = sub_24A6AE628(&qword_2697AF170);
  uint64_t v30 = v22;
  sub_24A6DAC90();
  uint64_t v31 = v75;
  v75(v29, 1, 1, v19);
  uint64_t v76 = v24;
  uint64_t v32 = v24;
  double v33 = v68;
  v68(v12, 1, 1, v32);
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, *MEMORY[0x263EFB978], v60);
  v73(v28, v74, v7);
  long long v65 = v30;
  double v34 = v72;
  uint64_t v60 = sub_24A6DAAB0();
  uint64_t v59 = sub_24A6AE628(&qword_2697AF178);
  sub_24A6DAC90();
  uint64_t v35 = v70;
  v31(v34, 1, 1, v70);
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  v55(v54, 1, 1, v56);
  id v36 = v12;
  v33(v12, 1, 1, v76);
  os_log_type_t v66 = v28;
  uint64_t v37 = v28;
  uint64_t v38 = v74;
  uint64_t v39 = v73;
  v73(v37, v74, v71);
  uint64_t v40 = v72;
  uint64_t v41 = v36;
  uint64_t v59 = sub_24A6DAA90();
  uint64_t v58 = (char *)sub_24A6AE628(&qword_2697AF180);
  sub_24A6DAC90();
  v75(v40, 1, 1, v35);
  uint64_t v42 = *MEMORY[0x263EFB9A0];
  uint64_t v43 = sub_24A6AE628(&qword_2697AF188);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 104))(v62, v42, v43);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v45, 0, 1, v43);
  uint64_t v46 = v68;
  v68(v41, 1, 1, v76);
  uint64_t v47 = v71;
  v39(v66, v38, v71);
  uint64_t v48 = sub_24A6DAA60();
  sub_24A6AE628(&qword_2697AF190);
  sub_24A6DAC90();
  v75(v40, 1, 1, v70);
  LOBYTE(v78) = 2;
  uint64_t v49 = sub_24A6DB4D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v63, 1, 1, v49);
  v46(v41, 1, 1, v76);
  v73(v66, v74, v47);
  uint64_t result = sub_24A6DAAA0();
  id v51 = v64;
  uint64_t v52 = v60;
  *uint64_t v64 = v61;
  v51[1] = v52;
  v51[2] = v59;
  v51[3] = v48;
  v51[4] = result;
  return result;
}

uint64_t CreateLocationExitedScheduledQueryIntent.init(query:latitude:longitude:locationName:radius:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v87 = a5;
  uint64_t v83 = a3;
  uint64_t v84 = a4;
  uint64_t v82 = a2;
  v81 = a1;
  v88 = a6;
  uint64_t v10 = sub_24A6AE628(&qword_2697AF150);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v86 = (uint64_t)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v85 = (char *)v70 - v13;
  uint64_t v14 = sub_24A6AE628(&qword_2697AF158);
  MEMORY[0x270FA5388](v14 - 8);
  v80 = (char *)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A6AE628(&qword_2697AF160);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v79 = (char *)v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_24A6AE628(&qword_2697AF168);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  v75 = (char *)v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_24A6DAB90();
  uint64_t v19 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v21 = (char *)v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)v70 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_24A6DACC0();
  uint64_t v95 = v31;
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v78 = sub_24A6AE628(&qword_2697AF020);
  sub_24A6DAC90();
  double v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v94 = v32 + 56;
  v33(v30, 1, 1, v31);
  v90 = v33;
  uint64_t v73 = sub_24A6DB410();
  id v100 = 0;
  uint64_t v101 = 0;
  uint64_t v34 = *(void *)(v73 - 8);
  v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v74 = v34 + 56;
  uint64_t v71 = v27;
  v72(v27, 1, 1, v73);
  uint64_t v99 = sub_24A6DA990();
  uint64_t v35 = *(void *)(v99 - 8);
  id v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v92 = v35 + 56;
  v93 = v36;
  v36(v24, 1, 1, v99);
  unsigned int v96 = *MEMORY[0x263EFBDC8];
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
  uint64_t v91 = v19 + 104;
  v98 = v37;
  ((void (*)(char *))v37)(v21);
  uint64_t v78 = sub_24A6DAA90();
  v70[1] = sub_24A6AE628(&qword_2697AF170);
  swift_retain();
  sub_24A6DAC90();
  uint64_t v38 = v30;
  uint64_t v39 = v95;
  v33(v30, 1, 1, v95);
  v70[0] = v24;
  v93(v24, 1, 1, v99);
  (*(void (**)(char *, void, uint64_t))(v76 + 104))(v75, *MEMORY[0x263EFB978], v77);
  v89 = v21;
  uint64_t v40 = v96;
  uint64_t v41 = v97;
  v98(v21, v96, v97);
  uint64_t v77 = sub_24A6DAAB0();
  uint64_t v76 = sub_24A6AE628(&qword_2697AF178);
  swift_retain();
  sub_24A6DAC90();
  uint64_t v42 = v90;
  v90(v38, 1, 1, v39);
  id v100 = 0;
  uint64_t v101 = 0;
  v72(v71, 1, 1, v73);
  uint64_t v43 = (char *)v70[0];
  v93((char *)v70[0], 1, 1, v99);
  v98(v89, v40, v41);
  uint64_t v44 = v43;
  uint64_t v76 = sub_24A6DAA90();
  v75 = (char *)sub_24A6AE628(&qword_2697AF180);
  swift_retain();
  sub_24A6DAC90();
  v42(v38, 1, 1, v95);
  uint64_t v45 = *MEMORY[0x263EFB9A0];
  uint64_t v46 = sub_24A6AE628(&qword_2697AF188);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 104))(v79, v45, v46);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v46);
  uint64_t v49 = v44;
  uint64_t v50 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v93;
  v93(v44, 1, 1, v99);
  id v51 = v89;
  uint64_t v52 = v97;
  v98(v89, v96, v97);
  uint64_t v53 = sub_24A6DAA60();
  sub_24A6AE628(&qword_2697AF190);
  swift_retain();
  sub_24A6DAC90();
  v90(v38, 1, 1, v95);
  LOBYTE(v100) = 2;
  uint64_t v54 = sub_24A6DB4D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v80, 1, 1, v54);
  v50((uint64_t)v49, 1, 1, v99);
  v98(v51, v96, v52);
  uint64_t v55 = sub_24A6DAAA0();
  id v100 = v81;
  uint64_t v101 = v82;
  swift_retain_n();
  uint64_t v56 = v78;
  swift_retain();
  uint64_t v57 = v77;
  swift_retain();
  uint64_t v58 = v76;
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v59 = objc_allocWithZone(MEMORY[0x263F00A50]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v60 = objc_msgSend(v59, sel_initWithLatitude_longitude_, a7, a8);
  uint64_t v61 = (void *)sub_24A6DB460();
  swift_bridgeObjectRelease();
  id v62 = objc_msgSend(self, sel_placemarkWithLocation_name_postalAddress_, v60, v61, 0);

  id v100 = v62;
  id v63 = v62;
  sub_24A6DAA20();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  uint64_t v64 = sub_24A6AE628(&qword_2697AF198);
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = (uint64_t)v85;
  uint64_t v67 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v85, v87, v64);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v64);
  sub_24A6B79F0(v66, v86);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA20();
  sub_24A6AE66C(v66, &qword_2697AF150);
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v64);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  uint64_t result = swift_release_n();
  uint64_t v69 = v88;
  uint64_t *v88 = v56;
  v69[1] = v57;
  v69[2] = v58;
  v69[3] = v53;
  v69[4] = v55;
  return result;
}

uint64_t CreateLocationExitedScheduledQueryIntent.perform()(uint64_t a1)
{
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = type metadata accessor for ScheduledQuerySnippetView();
  *(void *)(v2 + 248) = swift_task_alloc();
  sub_24A6DACC0();
  *(void *)(v2 + 256) = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  *(void *)(v2 + 264) = v3;
  *(void *)(v2 + 272) = *(void *)(v3 - 8);
  *(void *)(v2 + 280) = swift_task_alloc();
  uint64_t v4 = sub_24A6DAE60();
  *(void *)(v2 + 288) = v4;
  *(void *)(v2 + 296) = *(void *)(v4 - 8);
  *(void *)(v2 + 304) = swift_task_alloc();
  *(void *)(v2 + 312) = type metadata accessor for ScheduledQueryEntity();
  *(void *)(v2 + 320) = swift_task_alloc();
  *(void *)(v2 + 328) = swift_task_alloc();
  uint64_t v5 = sub_24A6DB080();
  *(void *)(v2 + 336) = v5;
  *(void *)(v2 + 344) = *(void *)(v5 - 8);
  *(void *)(v2 + 352) = swift_task_alloc();
  *(void *)(v2 + 360) = swift_task_alloc();
  uint64_t v6 = sub_24A6DADE0();
  *(void *)(v2 + 368) = v6;
  *(void *)(v2 + 376) = *(void *)(v6 - 8);
  *(void *)(v2 + 384) = swift_task_alloc();
  *(void *)(v2 + 392) = swift_task_alloc();
  uint64_t v7 = sub_24A6DB040();
  *(void *)(v2 + 400) = v7;
  *(void *)(v2 + 408) = *(void *)(v7 - 8);
  *(void *)(v2 + 416) = swift_task_alloc();
  *(void *)(v2 + 424) = swift_task_alloc();
  *(void *)(v2 + 432) = swift_task_alloc();
  *(void *)(v2 + 440) = swift_task_alloc();
  uint64_t v8 = sub_24A6DB070();
  *(void *)(v2 + 448) = v8;
  *(void *)(v2 + 456) = *(void *)(v8 - 8);
  *(void *)(v2 + 464) = swift_task_alloc();
  uint64_t v9 = sub_24A6DAB60();
  *(void *)(v2 + 472) = v9;
  *(void *)(v2 + 480) = *(void *)(v9 - 8);
  *(void *)(v2 + 488) = swift_task_alloc();
  uint64_t v10 = sub_24A6AE628(&qword_2697AF038);
  *(void *)(v2 + 496) = v10;
  *(void *)(v2 + 504) = *(void *)(v10 - 8);
  *(void *)(v2 + 512) = swift_task_alloc();
  uint64_t v11 = sub_24A6DB110();
  *(void *)(v2 + 520) = v11;
  *(void *)(v2 + 528) = *(void *)(v11 - 8);
  *(void *)(v2 + 536) = swift_task_alloc();
  *(void *)(v2 + 544) = swift_task_alloc();
  *(void *)(v2 + 552) = swift_task_alloc();
  *(void *)(v2 + 560) = swift_task_alloc();
  *(void *)(v2 + 568) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF150);
  *(void *)(v2 + 576) = swift_task_alloc();
  uint64_t v12 = sub_24A6AE628(&qword_2697AF198);
  *(void *)(v2 + 584) = v12;
  *(void *)(v2 + 592) = *(void *)(v12 - 8);
  *(void *)(v2 + 600) = swift_task_alloc();
  *(void *)(v2 + 608) = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF008);
  *(void *)(v2 + 616) = swift_task_alloc();
  uint64_t v13 = sub_24A6DAC10();
  *(void *)(v2 + 624) = v13;
  *(void *)(v2 + 632) = *(void *)(v13 - 8);
  *(void *)(v2 + 640) = swift_task_alloc();
  uint64_t v14 = sub_24A6DAD90();
  *(void *)(v2 + 648) = v14;
  *(void *)(v2 + 656) = *(void *)(v14 - 8);
  *(void *)(v2 + 664) = swift_task_alloc();
  long long v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 672) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 688) = v15;
  *(void *)(v2 + 704) = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_24A6C0C9C, 0, 0);
}

uint64_t sub_24A6C0C9C()
{
  uint64_t v1 = v0[83];
  uint64_t v2 = v0[82];
  uint64_t v3 = v0[81];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F33298], v3);
  char v4 = sub_24A6DAD80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v5 = v0[80];
    uint64_t v6 = v0[79];
    uint64_t v7 = v0[78];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v0[20] = v0[22];
    v0[21] = v0[23];
    sub_24A6DAC00();
    sub_24A6B28C8();
    uint64_t v8 = sub_24A6DB5D0();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_24A6DAA10();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v13 = v0[12];
      uint64_t v12 = v0[13];
      v0[89] = v12;
      uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2697AF1A8 + dword_2697AF1A8);
      uint64_t v14 = (void *)swift_task_alloc();
      v0[90] = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_24A6C12D4;
      return v27(v13, v12);
    }
    uint64_t v23 = v0[77];
    uint64_t v24 = v0[33];
    uint64_t v25 = v0[34];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA30();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    sub_24A6DA8E0();
    sub_24A6C3934(&qword_2697AF088, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_24A6DAA40();
    swift_release();
    sub_24A6AE66C(v23, &qword_2697AF008);
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v16 = sub_24A6DB100();
    os_log_type_t v17 = sub_24A6DB520();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24A6AB000, v16, v17, "Feature flag is disabled", v18, 2u);
      MEMORY[0x24C5CC2B0](v18, -1, -1);
    }
    uint64_t v19 = v0[68];
    uint64_t v20 = v0[66];
    uint64_t v21 = v0[65];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v22 = 0;
    *(void *)(v22 + 8) = 0;
    *(unsigned char *)(v22 + 16) = 4;
  }
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_24A6C12D4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 728) = a1;
  *(void *)(v3 + 736) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v4 = sub_24A6BAC80;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v4 = sub_24A6C13F4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6C13F4()
{
  uint64_t v69 = v0;
  uint64_t v1 = *(void **)(v0 + 728);
  uint64_t v2 = v1;
  if (v1) {
    goto LABEL_4;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 192);
  if (v2)
  {
    uint64_t v1 = *(void **)(v0 + 728);
LABEL_4:
    *(void *)(v0 + 744) = v2;
    uint64_t v3 = *(void *)(v0 + 592);
    uint64_t v4 = *(void *)(v0 + 584);
    uint64_t v5 = *(void *)(v0 + 576);
    id v6 = v1;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4))
    {
      sub_24A6AE66C(*(void *)(v0 + 576), &qword_2697AF150);
      sub_24A6B291C();
      sub_24A6DB560();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v9 = *(void *)(v0 + 608);
      uint64_t v10 = *(void *)(v0 + 600);
      uint64_t v11 = *(void *)(v0 + 592);
      uint64_t v12 = *(void *)(v0 + 584);
      uint64_t v13 = *(void *)(v0 + 576);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v13, v12);
      sub_24A6AE66C(v13, &qword_2697AF150);
      id v14 = objc_msgSend(self, sel_meters);
      sub_24A6DABF0();

      long long v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v15(v10, v12);
      sub_24A6DABE0();
      uint64_t v8 = v16;
      v15(v9, v12);
    }
    *(void *)(v0 + 752) = v8;
    sub_24A6B291C();
    if (sub_24A6DB550())
    {
      sub_24A6DB0E0();
      os_log_type_t v17 = sub_24A6DB100();
      os_log_type_t v18 = sub_24A6DB540();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_24A6AB000, v17, v18, "We will request confirmation for creating a task", v19, 2u);
        MEMORY[0x24C5CC2B0](v19, -1, -1);
      }
      uint64_t v20 = *(void *)(v0 + 704);
      uint64_t v21 = *(void *)(v0 + 568);
      uint64_t v22 = *(void *)(v0 + 528);
      uint64_t v23 = *(void *)(v0 + 520);
      long long v65 = *(_OWORD *)(v0 + 672);
      long long v63 = *(_OWORD *)(v0 + 688);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      *(_OWORD *)(v0 + 16) = v65;
      *(_OWORD *)(v0 + 32) = v63;
      *(void *)(v0 + 48) = v20;
      sub_24A6DA9F0();
      sub_24A6DAB50();
      uint64_t v24 = (void *)swift_task_alloc();
      *(void *)(v0 + 760) = v24;
      unint64_t v25 = sub_24A6C3840();
      uint64_t v26 = sub_24A6B36E4(&qword_2697AF080, &qword_2697AF038);
      *uint64_t v24 = v0;
      v24[1] = sub_24A6C2034;
      uint64_t v27 = *(void *)(v0 + 512);
      uint64_t v28 = *(void *)(v0 + 488);
      uint64_t v29 = *(void *)(v0 + 496);
      return MEMORY[0x270EE0D08](v27, v28, 1, &type metadata for CreateLocationExitedScheduledQueryIntent, v29, v25, v26);
    }
    else
    {
      sub_24A6DB0E0();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v30 = sub_24A6DB100();
      os_log_type_t v66 = sub_24A6DB540();
      BOOL v31 = os_log_type_enabled(v30, v66);
      uint64_t v32 = *(void *)(v0 + 560);
      uint64_t v33 = *(void *)(v0 + 528);
      uint64_t v34 = *(void *)(v0 + 520);
      if (v31)
      {
        uint64_t v64 = *(void *)(v0 + 560);
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        v68[0] = v61;
        *(_DWORD *)uint64_t v35 = 136315138;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        sub_24A6DAA10();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        *(void *)(v0 + 216) = sub_24A6B2A14(*(void *)(v0 + 144), *(void *)(v0 + 152), v68);
        sub_24A6DB5B0();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A6AB000, v30, v66, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CC2B0](v61, -1, -1);
        MEMORY[0x24C5CC2B0](v35, -1, -1);

        id v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
        v36(v64, v34);
      }
      else
      {

        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        id v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
        v36(v32, v34);
      }
      *(void *)(v0 + 776) = v36;
      sub_24A6DB0F0();
      sub_24A6DB050();
      sub_24A6DB060();
      sub_24A6DB020();
      uint64_t v37 = sub_24A6DB060();
      os_signpost_type_t v38 = sub_24A6DB580();
      if (sub_24A6DB590())
      {
        uint64_t v39 = *(void *)(v0 + 432);
        uint64_t v40 = *(void *)(v0 + 400);
        uint64_t v41 = *(void *)(v0 + 408);
        uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
        unint64_t v43 = (v41 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        v42(v39, *(void *)(v0 + 440), v40);
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        os_signpost_id_t v45 = sub_24A6DB030();
        _os_signpost_emit_with_name_impl(&dword_24A6AB000, v37, v38, v45, "CE.Intent.Create.Exit", "", v44, 2u);
        MEMORY[0x24C5CC2B0](v44, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
      }
      else
      {
        uint64_t v46 = *(void *)(v0 + 408);

        uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
        unint64_t v43 = (v46 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      }
      *(void *)(v0 + 784) = v42;
      uint64_t v67 = *(void *)(v0 + 744);
      uint64_t v48 = *(void *)(v0 + 432);
      uint64_t v47 = *(void *)(v0 + 440);
      uint64_t v49 = *(void *)(v0 + 400);
      *(void *)(v0 + 792) = v43;
      v42(v48, v47, v49);
      sub_24A6DB0C0();
      swift_allocObject();
      *(void *)(v0 + 800) = sub_24A6DB0B0();
      static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(v68);
      uint64_t v50 = v68[0];
      *(void *)(v0 + 808) = v68[0];
      sub_24A6DAF70();
      *(void *)(v0 + 816) = sub_24A6DAF60();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_24A6DAA10();
      uint64_t v51 = *(void *)(v0 + 136);
      uint64_t v62 = *(void *)(v0 + 128);
      *(void *)(v0 + 824) = v51;
      sub_24A6DAA10();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v52 = *(unsigned __int8 *)(v0 + 888);
      *(void *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
      *(void *)(v0 + 88) = sub_24A6B295C();
      *(void *)(v0 + 56) = v50;
      swift_retain();
      uint64_t v53 = (void *)swift_task_alloc();
      *(void *)(v0 + 832) = v53;
      *uint64_t v53 = v0;
      v53[1] = sub_24A6C2774;
      v54.n128_u64[0] = *(void *)(v0 + 752);
      uint64_t v55 = *(void *)(v0 + 392);
      return MEMORY[0x270F184E0](v55, v67, v62, v51, v52, v0 + 56, v54);
    }
  }
  uint64_t v56 = *(void *)(v0 + 616);
  uint64_t v57 = *(void *)(v0 + 264);
  uint64_t v58 = *(void *)(v0 + 272);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA30();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v56, 1, 1, v57);
  sub_24A6DA8E0();
  sub_24A6C3934(&qword_2697AF088, MEMORY[0x263EFB650]);
  swift_allocError();
  sub_24A6DAA40();
  swift_release();
  sub_24A6AE66C(v56, &qword_2697AF008);
  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v59 = *(uint64_t (**)(void))(v0 + 8);
  return v59();
}

uint64_t sub_24A6C2034()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 768) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[63];
    uint64_t v3 = v2[64];
    uint64_t v5 = v2[62];
    (*(void (**)(void, void))(v2[60] + 8))(v2[61], v2[59]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24A6BBE9C;
  }
  else
  {
    uint64_t v8 = v2[63];
    uint64_t v7 = v2[64];
    uint64_t v9 = v2[62];
    (*(void (**)(void, void))(v2[60] + 8))(v2[61], v2[59]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    id v6 = sub_24A6C21B8;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A6C21B8()
{
  uint64_t v35 = v0;
  sub_24A6DB0E0();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = *(void *)(v0 + 528);
    uint64_t v31 = *(void *)(v0 + 520);
    uint64_t v32 = *(void *)(v0 + 560);
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v34 = v28;
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(v0 + 216) = sub_24A6B2A14(*(void *)(v0 + 144), *(void *)(v0 + 152), &v34);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_24A6AB000, v1, v2, "CreateLocationEnteredScheduledQueryIntent perform query=%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v28, -1, -1);
    MEMORY[0x24C5CC2B0](v3, -1, -1);

    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v4(v32, v31);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 560);
    uint64_t v6 = *(void *)(v0 + 528);
    uint64_t v7 = *(void *)(v0 + 520);
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();

    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v4(v5, v7);
  }
  *(void *)(v0 + 776) = v4;
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v8 = sub_24A6DB060();
  os_signpost_type_t v9 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v10 = *(void *)(v0 + 432);
    uint64_t v11 = *(void *)(v0 + 400);
    uint64_t v12 = *(void *)(v0 + 408);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    unint64_t v14 = (v12 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v13(v10, *(void *)(v0 + 440), v11);
    long long v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v15 = 0;
    os_signpost_id_t v16 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v8, v9, v16, "CE.Intent.Create.Exit", "", v15, 2u);
    MEMORY[0x24C5CC2B0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 408);

    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    unint64_t v14 = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  *(void *)(v0 + 784) = v13;
  uint64_t v33 = *(void *)(v0 + 744);
  uint64_t v19 = *(void *)(v0 + 432);
  uint64_t v18 = *(void *)(v0 + 440);
  uint64_t v20 = *(void *)(v0 + 400);
  *(void *)(v0 + 792) = v14;
  v13(v19, v18, v20);
  sub_24A6DB0C0();
  swift_allocObject();
  *(void *)(v0 + 800) = sub_24A6DB0B0();
  static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()(&v34);
  uint64_t v21 = v34;
  *(void *)(v0 + 808) = v34;
  sub_24A6DAF70();
  *(void *)(v0 + 816) = sub_24A6DAF60();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  uint64_t v22 = *(void *)(v0 + 136);
  uint64_t v30 = *(void *)(v0 + 128);
  *(void *)(v0 + 824) = v22;
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = *(unsigned __int8 *)(v0 + 888);
  *(void *)(v0 + 80) = &type metadata for ShortcutsRunScheduledQueryIntent;
  *(void *)(v0 + 88) = sub_24A6B295C();
  *(void *)(v0 + 56) = v21;
  swift_retain();
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 832) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_24A6C2774;
  v25.n128_u64[0] = *(void *)(v0 + 752);
  uint64_t v26 = *(void *)(v0 + 392);
  return MEMORY[0x270F184E0](v26, v33, v30, v22, v23, v0 + 56, v25);
}

uint64_t sub_24A6C2774()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 840) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_24A6C3050;
  }
  else
  {
    sub_24A6B3728(v2 + 56);
    uint64_t v3 = sub_24A6C28BC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A6C28BC()
{
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v1);
  uint64_t v2 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v3 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v39 = v3;
    uint64_t v4 = *(void *)(v0 + 360);
    uint64_t v6 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 344);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x263F90238])
    {
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 360), *(void *)(v0 + 336));
      uint64_t v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v7 = 1;
    }
    format = (char *)v8;
    uint64_t v14 = *(void *)(v0 + 424);
    uint64_t v15 = *(void *)(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 408);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 784))(*(void *)(v0 + 432), v14, v15);
    uint64_t v17 = swift_slowAlloc();
    *(unsigned char *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 1) = v7;
    *(_WORD *)(v17 + 2) = 2050;
    *(void *)(v0 + 208) = 0;
    sub_24A6DB5B0();
    os_signpost_id_t v18 = sub_24A6DB030();
    os_signpost_type_t v9 = (uint64_t *)(v0 + 432);
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v2, v39, v18, "CE.Intent.Create.Exit", format, (uint8_t *)v17, 0xCu);
    MEMORY[0x24C5CC2B0](v17, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, void))(v16 + 8);
    uint64_t v12 = v16 + 8;
    uint64_t v11 = v19;
    v19(v14, v15);
  }
  else
  {
    os_signpost_type_t v9 = (uint64_t *)(v0 + 424);
    uint64_t v10 = *(void *)(v0 + 408);

    uint64_t v13 = *(void (**)(uint64_t, void))(v10 + 8);
    uint64_t v12 = v10 + 8;
    uint64_t v11 = v13;
  }
  uint64_t v20 = *v9;
  *(void *)(v0 + 856) = v12;
  *(void *)(v0 + 848) = v11;
  uint64_t v21 = *(void *)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 376);
  uint64_t v22 = *(void *)(v0 + 384);
  uint64_t v24 = *(void *)(v0 + 368);
  uint64_t v26 = *(uint64_t **)(v0 + 320);
  uint64_t v25 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 296);
  uint64_t v35 = *(void *)(v0 + 304);
  uint64_t v36 = *(void *)(v0 + 312);
  uint64_t v37 = *(void *)(v0 + 288);
  v11(v20, *(void *)(v0 + 400));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
  *uint64_t v26 = sub_24A6DADC0();
  v26[1] = v28;
  void v26[2] = sub_24A6DADD0();
  v26[3] = v29;
  v26[4] = sub_24A6DADB0();
  v26[5] = v30;
  sub_24A6DADA0();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 864) = v31;
  *(void *)(v0 + 872) = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v31(v22, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))((char *)v26 + *(int *)(v36 + 28), v35, v37);
  sub_24A6B306C((uint64_t)v26, v25);
  sub_24A6DAE20();
  sub_24A6DA9A0();
  sub_24A6B30D0(v25, (uint64_t)v26);
  sub_24A6DB500();
  *(void *)(v0 + 880) = sub_24A6DB4F0();
  uint64_t v33 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6C2C40, v33, v32);
}

uint64_t sub_24A6C2C40()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 248);
  swift_release();
  sub_24A6B306C(v1, v2);
  return MEMORY[0x270FA2498](sub_24A6C2CBC, 0, 0);
}

uint64_t sub_24A6C2CBC()
{
  uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[108];
  os_signpost_id_t v18 = (void (*)(uint64_t, uint64_t))v0[106];
  os_signpost_type_t v9 = (void *)v0[93];
  uint64_t v10 = (void *)v0[91];
  uint64_t v1 = v0[57];
  uint64_t v15 = v0[56];
  uint64_t v16 = v0[58];
  uint64_t v14 = v0[55];
  uint64_t v12 = v0[49];
  uint64_t v13 = v0[50];
  uint64_t v11 = v0[46];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v8 = v0[33];
  uint64_t v5 = v0[31];
  sub_24A6C3934(&qword_2697AF068, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  sub_24A6C3934(&qword_2697AF070, (void (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView);
  sub_24A6DA9B0();

  swift_release();
  swift_release();

  sub_24A6B3134(v5, (uint64_t (*)(void))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v8);
  sub_24A6B3134(v2, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  v17(v12, v11);
  v18(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v16, v15);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24A6C3050()
{
  uint64_t v1 = *(void **)(v0 + 840);
  sub_24A6B3728(v0 + 56);
  sub_24A6DB0E0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 840);
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 200) = v10;
    sub_24A6DB5B0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed creating location query: %@", v7, 0xCu);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v8, -1, -1);
    MEMORY[0x24C5CC2B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 840);
  }
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 776);
  uint64_t v13 = *(void *)(v0 + 536);
  uint64_t v14 = *(void *)(v0 + 520);

  v12(v13, v14);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v15);
  uint64_t v16 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v17 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    os_signpost_type_t v44 = v17;
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v19 = *(void *)(v0 + 352);
    uint64_t v20 = *(void *)(v0 + 336);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v19, v20) == *MEMORY[0x263F90238])
    {
      char v21 = 0;
      uint64_t v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 352), *(void *)(v0 + 336));
      uint64_t v22 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v21 = 1;
    }
    uint64_t v23 = (uint64_t *)(v0 + 432);
    uint64_t v27 = *(void *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 416);
    uint64_t v28 = *(void *)(v0 + 400);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 784))(*(void *)(v0 + 432), v26, v28);
    uint64_t v29 = swift_slowAlloc();
    *(unsigned char *)uint64_t v29 = 0;
    *(unsigned char *)(v29 + 1) = v21;
    *(_WORD *)(v29 + 2) = 2050;
    *(void *)(v0 + 224) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v30 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v16, v44, v30, "CE.Intent.Create.Exit", v22, (uint8_t *)v29, 0xCu);
    MEMORY[0x24C5CC2B0](v29, -1, -1);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v25(v26, v28);
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v0 + 416);
    uint64_t v24 = *(void *)(v0 + 408);

    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  }
  uint64_t v31 = *v23;
  id v41 = *(id *)(v0 + 840);
  os_signpost_type_t v38 = *(void **)(v0 + 744);
  uint64_t v32 = *(void *)(v0 + 456);
  uint64_t v45 = *(void *)(v0 + 464);
  uint64_t v42 = *(void **)(v0 + 728);
  uint64_t v43 = *(void *)(v0 + 448);
  uint64_t v39 = *(void *)(v0 + 400);
  uint64_t v40 = *(void *)(v0 + 440);
  ((void (*)(uint64_t))v25)(v31);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v34 = *(void *)(v0 + 112);
  uint64_t v33 = *(void *)(v0 + 120);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v35 = v34;
  *(void *)(v35 + 8) = v33;
  *(unsigned char *)(v35 + 16) = 2;
  swift_willThrow();

  swift_release();
  swift_release();

  v25(v40, v39);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v43);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_24A6C36A8@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF1F0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6C3768(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return CreateLocationExitedScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6C3804(uint64_t a1)
{
  unint64_t v2 = sub_24A6C3840();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_24A6C3840()
{
  unint64_t result = qword_2697AF210;
  if (!qword_2697AF210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF210);
  }
  return result;
}

unint64_t sub_24A6C3898()
{
  unint64_t result = qword_2697AF218;
  if (!qword_2697AF218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF218);
  }
  return result;
}

uint64_t sub_24A6C38EC()
{
  return sub_24A6C3934((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
}

uint64_t sub_24A6C3934(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24A6C3984()
{
  unint64_t result = qword_2697AF220;
  if (!qword_2697AF220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF220);
  }
  return result;
}

unint64_t sub_24A6C39DC()
{
  unint64_t result = qword_2697AF228;
  if (!qword_2697AF228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF228);
  }
  return result;
}

uint64_t sub_24A6C3A30()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6C3A64()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CreateLocationExitedScheduledQueryIntent()
{
  return &type metadata for CreateLocationExitedScheduledQueryIntent;
}

uint64_t DailySnippetView.time.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24A6DAC50();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t DailySnippetView.init(time:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A6DAC50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t DailySnippetView.body.getter()
{
  uint64_t v1 = sub_24A6DB160();
  sub_24A6C3CCC(v0, (uint64_t)&v14);
  uint64_t v2 = v14;
  uint64_t v3 = v15;
  char v4 = v16;
  uint64_t v6 = v17;
  uint64_t v5 = v18;
  char v7 = v19;
  uint64_t v8 = v20;
  uint64_t v9 = v21;
  uint64_t v10 = v22;
  uint64_t v13 = v23;
  char v12 = v24;
  uint64_t v14 = v1;
  uint64_t v15 = 0;
  char v16 = 1;
  uint64_t v17 = v2;
  uint64_t v18 = v3;
  char v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v5;
  LOBYTE(v22) = v7;
  uint64_t v23 = v8;
  uint64_t v24 = v9;
  uint64_t v25 = v10;
  uint64_t v26 = v13;
  char v27 = v12;
  sub_24A6DB230();
  sub_24A6AE628(&qword_2697AF238);
  sub_24A6C4210();
  sub_24A6DB340();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  return sub_24A6C427C(v8, v9, v10);
}

uint64_t sub_24A6C3CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v3 = sub_24A6DB2D0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v47 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A6DB1C0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v48 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_24A6DAD30();
  uint64_t v7 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AEFB0);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6DACD0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v45 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v46 = (char *)&v45 - v17;
  sub_24A6DB1D0();
  uint64_t v18 = sub_24A6DB2F0();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t v23 = sub_24A6DB290();
  uint64_t v52 = v24;
  uint64_t v53 = v23;
  int v51 = v25;
  uint64_t v54 = v26;
  uint64_t v27 = v20;
  uint64_t v28 = v13;
  sub_24A6C426C(v18, v27, v22);
  swift_bridgeObjectRelease();
  sub_24A6DAD20();
  sub_24A6DAD10();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v49);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_24A6C489C((uint64_t)v12);
    sub_24A6DB1B0();
    sub_24A6DB1A0();
    sub_24A6DAC40();
    sub_24A6DB190();
    swift_bridgeObjectRelease();
    sub_24A6DB1A0();
    sub_24A6DB1E0();
    uint64_t v55 = sub_24A6DB2F0();
    uint64_t v56 = v29;
    uint64_t v57 = v30 & 1;
    uint64_t v58 = v31;
    char v59 = 1;
    sub_24A6DB220();
    uint64_t v32 = v60;
    uint64_t v33 = v61;
    uint64_t v34 = v62;
    uint64_t v35 = v63;
    char v36 = v64;
  }
  else
  {
    uint64_t v37 = v46;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v46, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v45, v37, v13);
    sub_24A6DB2C0();
    uint64_t v55 = sub_24A6DB2E0();
    uint64_t v56 = v38;
    uint64_t v57 = v39 & 1;
    uint64_t v58 = v40;
    char v59 = 0;
    sub_24A6DB220();
    uint64_t v32 = v60;
    uint64_t v33 = v61;
    uint64_t v34 = v62;
    uint64_t v35 = v63;
    char v36 = v64;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v37, v28);
  }
  char v41 = v51 & 1;
  uint64_t v43 = v52;
  uint64_t v42 = v53;
  *(void *)a2 = v53;
  *(void *)(a2 + 8) = v43;
  *(unsigned char *)(a2 + 16) = v41;
  *(void *)(a2 + 24) = v54;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v32;
  *(void *)(a2 + 56) = v33;
  *(void *)(a2 + 64) = v34;
  *(void *)(a2 + 72) = v35;
  *(unsigned char *)(a2 + 80) = v36;
  sub_24A6C48FC(v42, v43, v41);
  swift_bridgeObjectRetain();
  sub_24A6C490C(v32, v33, v34);
  sub_24A6C427C(v32, v33, v34);
  sub_24A6C426C(v42, v43, v41);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24A6C4210()
{
  unint64_t result = qword_2697AF240;
  if (!qword_2697AF240)
  {
    sub_24A6AE5E0(&qword_2697AF238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF240);
  }
  return result;
}

uint64_t sub_24A6C426C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24A6C427C(uint64_t a1, uint64_t a2, char a3)
{
  sub_24A6C426C(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6C42B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6C42DC()
{
  return sub_24A6DB350();
}

uint64_t sub_24A6C42F8()
{
  uint64_t v1 = sub_24A6DB160();
  sub_24A6C3CCC(v0, (uint64_t)&v14);
  uint64_t v2 = v14;
  uint64_t v3 = v15;
  char v4 = v16;
  uint64_t v6 = v17;
  uint64_t v5 = v18;
  char v7 = v19;
  uint64_t v8 = v20;
  uint64_t v9 = v21;
  uint64_t v10 = v22;
  uint64_t v13 = v23;
  char v12 = v24;
  uint64_t v14 = v1;
  uint64_t v15 = 0;
  char v16 = 1;
  uint64_t v17 = v2;
  uint64_t v18 = v3;
  char v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v5;
  LOBYTE(v22) = v7;
  uint64_t v23 = v8;
  uint64_t v24 = v9;
  uint64_t v25 = v10;
  uint64_t v26 = v13;
  char v27 = v12;
  sub_24A6DB230();
  sub_24A6AE628(&qword_2697AF238);
  sub_24A6C4210();
  sub_24A6DB340();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  return sub_24A6C427C(v8, v9, v10);
}

uint64_t initializeBufferWithCopyOfBuffer for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for DailySnippetView(uint64_t a1)
{
  uint64_t v2 = sub_24A6DAC50();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DailySnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DailySnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6C4678);
}

uint64_t sub_24A6C4678(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DailySnippetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6C46F8);
}

uint64_t sub_24A6C46F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAC50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DailySnippetView()
{
  uint64_t result = qword_2697AF248;
  if (!qword_2697AF248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6C47B4()
{
  uint64_t result = sub_24A6DAC50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A6C4840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6C489C(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AEFB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6C48FC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24A6C490C(uint64_t a1, uint64_t a2, char a3)
{
  sub_24A6C48FC(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t DateSnippetView.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24A6DACD0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t DateSnippetView.date.setter(uint64_t a1)
{
  uint64_t v3 = sub_24A6DACD0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*DateSnippetView.date.modify())()
{
  return nullsub_1;
}

uint64_t DateSnippetView.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t DateSnippetView.body.getter()
{
  uint64_t v1 = sub_24A6DB160();
  sub_24A6C4BF8(v0, (uint64_t)&v19);
  uint64_t v2 = v19;
  uint64_t v3 = v20;
  char v4 = v21;
  uint64_t v6 = v22;
  uint64_t v5 = v23;
  uint64_t v7 = v25;
  uint64_t v8 = v26;
  char v9 = v27;
  uint64_t v11 = v28;
  uint64_t v10 = v29;
  uint64_t v16 = v25;
  uint64_t v12 = v30;
  uint64_t v17 = v30;
  uint64_t v18 = v29;
  char v13 = v31;
  uint64_t v14 = v32;
  char v40 = 1;
  char v39 = v21;
  char v38 = v24;
  char v37 = v27;
  char v36 = v31;
  uint64_t v19 = v1;
  uint64_t v20 = 0;
  char v21 = 1;
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  char v24 = v39;
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  char v27 = v38;
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  LOBYTE(v30) = v37;
  uint64_t v31 = v11;
  uint64_t v32 = v10;
  uint64_t v33 = v12;
  char v34 = v36;
  uint64_t v35 = v14;
  sub_24A6DB230();
  sub_24A6AE628(&qword_2697AF258);
  sub_24A6C4ED0();
  sub_24A6DB340();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v16, v8, v9);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v18, v17, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6C4BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v3 = sub_24A6DB2D0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6DB1D0();
  uint64_t v8 = sub_24A6DB2F0();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = sub_24A6DB290();
  uint64_t v40 = v14;
  uint64_t v41 = v13;
  uint64_t v43 = v15;
  int v39 = v16 & 1;
  sub_24A6C426C(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v18 = v42;
  uint64_t v19 = v4;
  v17(v7, v42, v4);
  sub_24A6DB2B0();
  uint64_t v20 = sub_24A6DB2E0();
  uint64_t v22 = v21;
  uint64_t v38 = v23;
  char v25 = v24 & 1;
  v17(v7, v18, v19);
  sub_24A6DB2C0();
  uint64_t v26 = sub_24A6DB2E0();
  uint64_t v28 = v27;
  char v29 = v39;
  char v45 = v39;
  char v44 = v25;
  LOBYTE(v5) = v30 & 1;
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  uint64_t v33 = v43;
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v33;
  *(unsigned char *)(a2 + 16) = v29;
  *(void *)(a2 + 24) = v32;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v22;
  *(unsigned char *)(a2 + 64) = v25;
  *(void *)(a2 + 72) = v38;
  *(void *)(a2 + 80) = v26;
  *(void *)(a2 + 88) = v28;
  *(unsigned char *)(a2 + 96) = v30 & 1;
  *(void *)(a2 + 104) = v34;
  uint64_t v35 = v31;
  sub_24A6C48FC(v31, v33, v29);
  swift_bridgeObjectRetain();
  sub_24A6C48FC(v20, v22, v25);
  swift_bridgeObjectRetain();
  sub_24A6C48FC(v26, v28, v5);
  swift_bridgeObjectRetain();
  sub_24A6C426C(v26, v28, v5);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v20, v22, v44);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v35, v43, v45);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24A6C4ED0()
{
  unint64_t result = qword_2697AF260;
  if (!qword_2697AF260)
  {
    sub_24A6AE5E0(&qword_2697AF258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF260);
  }
  return result;
}

uint64_t sub_24A6C4F2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6C4F48()
{
  uint64_t v1 = sub_24A6DB160();
  sub_24A6C4BF8(v0, (uint64_t)&v19);
  uint64_t v2 = v19;
  uint64_t v3 = v20;
  char v4 = v21;
  uint64_t v6 = v22;
  uint64_t v5 = v23;
  uint64_t v7 = v25;
  uint64_t v8 = v26;
  char v9 = v27;
  uint64_t v11 = v28;
  uint64_t v10 = v29;
  uint64_t v16 = v25;
  uint64_t v12 = v30;
  uint64_t v17 = v30;
  uint64_t v18 = v29;
  char v13 = v31;
  uint64_t v14 = v32;
  char v40 = 1;
  char v39 = v21;
  char v38 = v24;
  char v37 = v27;
  char v36 = v31;
  uint64_t v19 = v1;
  uint64_t v20 = 0;
  char v21 = 1;
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  char v24 = v39;
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  char v27 = v38;
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  LOBYTE(v30) = v37;
  uint64_t v31 = v11;
  uint64_t v32 = v10;
  uint64_t v33 = v12;
  char v34 = v36;
  uint64_t v35 = v14;
  sub_24A6DB230();
  sub_24A6AE628(&qword_2697AF258);
  sub_24A6C4ED0();
  sub_24A6DB340();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v16, v8, v9);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v18, v17, v13);
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for DateSnippetView(uint64_t a1)
{
  uint64_t v2 = sub_24A6DACD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DateSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DateSnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6C5310);
}

uint64_t sub_24A6C5310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DateSnippetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6C5390);
}

uint64_t sub_24A6C5390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACD0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DateSnippetView()
{
  uint64_t result = qword_2697AF268;
  if (!qword_2697AF268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6C544C()
{
  uint64_t result = sub_24A6DACD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A6C54D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6C5534()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF278);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF278);
  return sub_24A6DAC90();
}

uint64_t static DeleteScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF08, MEMORY[0x263F06D40], (uint64_t)qword_2697AF278, a1);
}

uint64_t static DeleteScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF08, MEMORY[0x263F06D40], (uint64_t)qword_2697AF278);
}

uint64_t (*static DeleteScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEF08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF278);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A6C56A0()
{
  uint64_t v0 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6DACC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = sub_24A6DAAC0();
  sub_24A6AEB44(v5, qword_2697AF290);
  sub_24A6AEB0C(v5, (uint64_t)qword_2697AF290);
  sub_24A6DAC90();
  sub_24A6DAC90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_24A6AE628(&qword_2697AF2F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24A6DC500;
  sub_24A6DAC90();
  sub_24A6DAC90();
  return sub_24A6DAAE0();
}

uint64_t static DeleteScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF10, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF290, a1);
}

uint64_t sub_24A6C58EC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_24A6AEB0C(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static DeleteScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF10, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF290);
}

uint64_t sub_24A6C59D4(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v7 = a3(0);
  uint64_t v8 = sub_24A6AEB0C(v7, a4);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static DeleteScheduledQueryIntent.description.modify())()
{
  if (qword_2697AEF10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DAAC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF290);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t DeleteScheduledQueryIntent.entities.getter()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6C5B88@<X0>(void *a1@<X8>)
{
  swift_retain();
  sub_24A6DAA10();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A6C5BD4()
{
  return swift_release();
}

uint64_t DeleteScheduledQueryIntent.entities.setter()
{
  return sub_24A6DAA20();
}

void (*DeleteScheduledQueryIntent.entities.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF490;
}

uint64_t DeleteScheduledQueryIntent.$entities.getter()
{
  return sub_24A6DAA30();
}

uint64_t DeleteScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v19 = sub_24A6DAB90();
  uint64_t v1 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A6AE628(&qword_2697AF008);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6DACC0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  sub_24A6AE628(&qword_2697AF2A8);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  uint64_t v21 = 0;
  uint64_t v15 = sub_24A6DA990();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v9, 1, 1, v15);
  v16(v7, 1, 1, v15);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v19);
  sub_24A6C5FBC();
  uint64_t result = sub_24A6DAA50();
  *uint64_t v20 = result;
  return result;
}

unint64_t sub_24A6C5FBC()
{
  unint64_t result = qword_2697AF098;
  if (!qword_2697AF098)
  {
    type metadata accessor for ScheduledQueryEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF098);
  }
  return result;
}

uint64_t DeleteScheduledQueryIntent.init(entities:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v20 = sub_24A6DAB90();
  uint64_t v2 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A6AE628(&qword_2697AF008);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24A6DACC0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  sub_24A6AE628(&qword_2697AF2A8);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  uint64_t v23 = 0;
  uint64_t v16 = sub_24A6DA990();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263EFBDC8], v20);
  sub_24A6C5FBC();
  uint64_t v18 = sub_24A6DAA50();
  uint64_t v23 = v21;
  swift_retain();
  sub_24A6DAA20();
  uint64_t result = swift_release();
  *uint64_t v22 = v18;
  return result;
}

uint64_t DeleteScheduledQueryIntent.perform()(uint64_t a1)
{
  v2[13] = a1;
  sub_24A6DACC0();
  v2[14] = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v4 = sub_24A6DB080();
  v2[18] = v4;
  v2[19] = *(void *)(v4 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = *(void *)(type metadata accessor for ScheduledQueryEntity() - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v5 = sub_24A6DB040();
  v2[25] = v5;
  v2[26] = *(void *)(v5 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v6 = sub_24A6DB070();
  v2[31] = v6;
  v2[32] = *(void *)(v6 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v7 = sub_24A6DB110();
  v2[34] = v7;
  v2[35] = *(void *)(v7 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *v1;
  v2[38] = v8;
  v2[39] = v9;
  return MEMORY[0x270FA2498](sub_24A6C6638, 0, 0);
}

uint64_t sub_24A6C6638()
{
  sub_24A6DB0E0();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134217984;
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    uint64_t v4 = *(void *)(*(void *)(v0 + 88) + 16);
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)(v0 + 96) = v4;
    sub_24A6DB5B0();
    swift_release();
    _os_log_impl(&dword_24A6AB000, v1, v2, "Performing delete scheduled %ld queries", v3, 0xCu);
    MEMORY[0x24C5CC2B0](v3, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v5 = *(void *)(v0 + 304);
  uint64_t v6 = *(void *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 280);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 320) = v8;
  *(void *)(v0 + 328) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v6);
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v9 = sub_24A6DB060();
  os_signpost_type_t v10 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v11 = *(void *)(v0 + 232);
    uint64_t v12 = *(void *)(v0 + 200);
    uint64_t v13 = *(void *)(v0 + 208);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    unint64_t v15 = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v14(v11, *(void *)(v0 + 240), v12);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v9, v10, v17, "CE.Intent.Delete", "", v16, 2u);
    MEMORY[0x24C5CC2B0](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 208);

    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    unint64_t v15 = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v20 = (uint64_t *)(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 200);
  *(void *)(v0 + 336) = v14;
  *(void *)(v0 + 344) = v15;
  v14(v19, v21, v22);
  sub_24A6DB0C0();
  swift_allocObject();
  *(void *)(v0 + 352) = sub_24A6DB0B0();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  uint64_t v23 = *(void *)(v0 + 16);
  *(void *)(v0 + 360) = v23;
  uint64_t v24 = *(void *)(v23 + 16);
  *(void *)(v0 + 368) = v24;
  if (v24)
  {
    uint64_t v25 = *(uint64_t **)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 176);
    *(void *)(v0 + 376) = sub_24A6DAF70();
    int v27 = *(_DWORD *)(v26 + 80);
    *(_DWORD *)(v0 + 472) = v27;
    *(void *)(v0 + 384) = *(void *)(v26 + 72);
    *(void *)(v0 + 392) = 0;
    sub_24A6B30D0(v23 + ((v27 + 32) & ~(unint64_t)v27), (uint64_t)v25);
    uint64_t v28 = *v25;
    *(void *)(v0 + 400) = *v25;
    uint64_t v29 = v25[1];
    *(void *)(v0 + 408) = v29;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 416) = sub_24A6DAF60();
    uint64_t v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 424) = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_24A6C6CF4;
    return MEMORY[0x270F18508](v28, v29);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24A6B29B0();
    sub_24A6B26C0();
    sub_24A6B2A04(v31);
    uint64_t v32 = sub_24A6DB060();
    sub_24A6DB0A0();
    os_signpost_type_t v33 = sub_24A6DB570();
    if (sub_24A6DB590())
    {
      os_signpost_type_t v53 = v33;
      uint64_t v34 = *(void *)(v0 + 168);
      uint64_t v36 = *(void *)(v0 + 144);
      uint64_t v35 = *(void *)(v0 + 152);
      swift_retain();
      sub_24A6DB0D0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v35 + 88))(v34, v36) == *MEMORY[0x263F90238])
      {
        char v37 = 0;
        char v38 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 144));
        char v38 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
        char v37 = 1;
      }
      uint64_t v43 = *(void *)(v0 + 224);
      uint64_t v44 = *(void *)(v0 + 200);
      uint64_t v45 = *(void *)(v0 + 208);
      (*(void (**)(void, uint64_t, uint64_t))(v0 + 336))(*(void *)(v0 + 232), v43, v44);
      uint64_t v46 = swift_slowAlloc();
      *(unsigned char *)uint64_t v46 = 0;
      *(unsigned char *)(v46 + 1) = v37;
      *(_WORD *)(v46 + 2) = 2050;
      *(void *)(v0 + 80) = 0;
      sub_24A6DB5B0();
      os_signpost_id_t v47 = sub_24A6DB030();
      _os_signpost_emit_with_name_impl(&dword_24A6AB000, v32, v53, v47, "CE.Intent.Delete", v38, (uint8_t *)v46, 0xCu);
      MEMORY[0x24C5CC2B0](v46, -1, -1);

      uint64_t v48 = *(void (**)(uint64_t, void))(v45 + 8);
      uint64_t v40 = v45 + 8;
      uint64_t v41 = v48;
      v48(v43, v44);
    }
    else
    {
      uint64_t v39 = *(void *)(v0 + 208);

      uint64_t v42 = *(void (**)(uint64_t, void))(v39 + 8);
      uint64_t v40 = v39 + 8;
      uint64_t v41 = v42;
      uint64_t v20 = (uint64_t *)(v0 + 224);
    }
    uint64_t v49 = *v20;
    *(void *)(v0 + 440) = v41;
    *(void *)(v0 + 448) = v40;
    v41(v49, *(void *)(v0 + 200));
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_bridgeObjectRelease();
    sub_24A6DAC90();
    sub_24A6DA9A0();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    *(void *)(v0 + 456) = *(void *)(v0 + 64);
    sub_24A6DB500();
    *(void *)(v0 + 464) = sub_24A6DB4F0();
    uint64_t v51 = sub_24A6DB4E0();
    return MEMORY[0x270FA2498](sub_24A6C7270, v51, v50);
  }
}

uint64_t sub_24A6C6CF4()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  if (v0) {
    os_log_type_t v2 = sub_24A6C74B8;
  }
  else {
    os_log_type_t v2 = sub_24A6C6E44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A6C6E44()
{
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 392) + 1;
  sub_24A6C7C98(*(void *)(v0 + 192));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = (uint64_t *)(v0 + 224);
    sub_24A6B29B0();
    sub_24A6B26C0();
    sub_24A6B2A04(v4);
    uint64_t v5 = sub_24A6DB060();
    sub_24A6DB0A0();
    os_signpost_type_t v6 = sub_24A6DB570();
    if (sub_24A6DB590())
    {
      os_signpost_type_t v32 = v6;
      uint64_t v7 = *(void *)(v0 + 168);
      uint64_t v9 = *(void *)(v0 + 144);
      uint64_t v8 = *(void *)(v0 + 152);
      swift_retain();
      sub_24A6DB0D0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x263F90238])
      {
        char v10 = 0;
        uint64_t v11 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 144));
        uint64_t v11 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
        char v10 = 1;
      }
      uint64_t v3 = (uint64_t *)(v0 + 232);
      uint64_t v22 = *(void *)(v0 + 224);
      uint64_t v23 = *(void *)(v0 + 200);
      uint64_t v24 = *(void *)(v0 + 208);
      (*(void (**)(void, uint64_t, uint64_t))(v0 + 336))(*(void *)(v0 + 232), v22, v23);
      uint64_t v25 = swift_slowAlloc();
      *(unsigned char *)uint64_t v25 = 0;
      *(unsigned char *)(v25 + 1) = v10;
      *(_WORD *)(v25 + 2) = 2050;
      *(void *)(v0 + 80) = 0;
      sub_24A6DB5B0();
      os_signpost_id_t v26 = sub_24A6DB030();
      _os_signpost_emit_with_name_impl(&dword_24A6AB000, v5, v32, v26, "CE.Intent.Delete", v11, (uint8_t *)v25, 0xCu);
      MEMORY[0x24C5CC2B0](v25, -1, -1);

      int v27 = *(void (**)(uint64_t, void))(v24 + 8);
      uint64_t v19 = v24 + 8;
      uint64_t v20 = v27;
      v27(v22, v23);
    }
    else
    {
      uint64_t v18 = *(void *)(v0 + 208);

      uint64_t v21 = *(void (**)(uint64_t, void))(v18 + 8);
      uint64_t v19 = v18 + 8;
      uint64_t v20 = v21;
    }
    uint64_t v28 = *v3;
    *(void *)(v0 + 440) = v20;
    *(void *)(v0 + 448) = v19;
    v20(v28, *(void *)(v0 + 200));
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    swift_bridgeObjectRelease();
    sub_24A6DAC90();
    sub_24A6DA9A0();
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    *(void *)(v0 + 456) = *(void *)(v0 + 64);
    sub_24A6DB500();
    *(void *)(v0 + 464) = sub_24A6DB4F0();
    uint64_t v30 = sub_24A6DB4E0();
    return MEMORY[0x270FA2498](sub_24A6C7270, v30, v29);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 384);
    uint64_t v13 = *(void *)(v0 + 392) + 1;
    *(void *)(v0 + 392) = v13;
    uint64_t v14 = *(uint64_t **)(v0 + 192);
    sub_24A6B30D0(*(void *)(v0 + 360)+ ((*(unsigned __int8 *)(v0 + 472) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 472))+ v12 * v13, (uint64_t)v14);
    uint64_t v15 = *v14;
    *(void *)(v0 + 400) = *v14;
    uint64_t v16 = v14[1];
    *(void *)(v0 + 408) = v16;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 416) = sub_24A6DAF60();
    os_signpost_id_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 424) = v17;
    *os_signpost_id_t v17 = v0;
    v17[1] = sub_24A6C6CF4;
    return MEMORY[0x270F18508](v15, v16);
  }
}

uint64_t sub_24A6C7270()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A6C72D8, 0, 0);
}

uint64_t sub_24A6C72D8()
{
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[55];
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v9 = v0[30];
  uint64_t v10 = v0[31];
  uint64_t v8 = v0[25];
  uint64_t v4 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v5 = v0[15];
  v0[9] = v0[57];
  sub_24A6C7CF4();
  sub_24A6DA9C0();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v11(v9, v8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
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
  os_signpost_type_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24A6C74B8()
{
  uint64_t v57 = v0;
  uint64_t v1 = *(void **)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  sub_24A6DB0E0();
  sub_24A6B30D0(v2, v3);
  id v4 = v1;
  swift_bridgeObjectRetain();
  id v5 = v1;
  os_signpost_type_t v6 = sub_24A6DB100();
  os_log_type_t v7 = sub_24A6DB520();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void **)(v0 + 432);
    unint64_t v9 = *(void *)(v0 + 408);
    uint64_t v48 = *(void *)(v0 + 400);
    uint64_t v53 = *(void *)(v0 + 288);
    uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    uint64_t v52 = *(void *)(v0 + 272);
    uint64_t v10 = *(void *)(v0 + 184);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v50 = (void *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v56[0] = v51;
    *(_DWORD *)uint64_t v11 = 136315650;
    log = v6;
    uint64_t v12 = *(void *)(v10 + 16);
    unint64_t v13 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = sub_24A6B2A14(v12, v13, v56);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    sub_24A6C7C98(v10);
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 40) = sub_24A6B2A14(v48, v9, v56);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2112;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v15;
    sub_24A6DB5B0();
    *uint64_t v50 = v15;

    _os_log_impl(&dword_24A6AB000, log, v7, "Failed to delete scheduled query %s (%s): %@", (uint8_t *)v11, 0x20u);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v50, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v51, -1, -1);
    MEMORY[0x24C5CC2B0](v11, -1, -1);

    v54(v53, v52);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 432);
    os_signpost_id_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    uint64_t v18 = *(void *)(v0 + 288);
    uint64_t v19 = *(void *)(v0 + 272);
    sub_24A6C7C98(*(void *)(v0 + 184));
    swift_bridgeObjectRelease_n();

    v17(v18, v19);
  }
  uint64_t v20 = (uint64_t *)(v0 + 216);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v21);
  uint64_t v22 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v23 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    uint64_t v55 = v22;
    uint64_t v24 = *(void *)(v0 + 152);
    uint64_t v25 = *(void *)(v0 + 160);
    uint64_t v26 = *(void *)(v0 + 144);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v25, v26) == *MEMORY[0x263F90238])
    {
      char v27 = 0;
      uint64_t v28 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
      uint64_t v28 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v27 = 1;
    }
    uint64_t v20 = (uint64_t *)(v0 + 232);
    uint64_t v31 = *(void *)(v0 + 208);
    uint64_t v32 = *(void *)(v0 + 216);
    uint64_t v33 = *(void *)(v0 + 200);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 336))(*(void *)(v0 + 232), v32, v33);
    uint64_t v34 = swift_slowAlloc();
    *(unsigned char *)uint64_t v34 = 0;
    *(unsigned char *)(v34 + 1) = v27;
    *(_WORD *)(v34 + 2) = 2050;
    *(void *)(v0 + 24) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v35 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v55, v23, v35, "CE.Intent.Delete", v28, (uint8_t *)v34, 0xCu);
    MEMORY[0x24C5CC2B0](v34, -1, -1);

    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v30(v32, v33);
  }
  else
  {
    uint64_t v29 = *(void *)(v0 + 208);

    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  }
  uint64_t v37 = *(void *)(v0 + 256);
  uint64_t v36 = *(void *)(v0 + 264);
  id v46 = *(id *)(v0 + 432);
  uint64_t v47 = *(void *)(v0 + 248);
  uint64_t v45 = *(void *)(v0 + 240);
  uint64_t v39 = *(void *)(v0 + 192);
  uint64_t v38 = *(void *)(v0 + 200);
  v30(*v20, v38);
  uint64_t v41 = *(void *)(v39 + 16);
  uint64_t v40 = *(void *)(v39 + 24);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v42 = v41;
  *(void *)(v42 + 8) = v40;
  *(unsigned char *)(v42 + 16) = 3;
  swift_bridgeObjectRetain();
  swift_willThrow();
  swift_release();

  sub_24A6C7C98(v39);
  v30(v45, v38);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v47);
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
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t sub_24A6C7B00@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF278);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6C7BC0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return DeleteScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6C7C5C(uint64_t a1)
{
  unint64_t v2 = sub_24A6C7E7C();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_24A6C7C98(uint64_t a1)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(Entity - 8) + 8))(a1, Entity);
  return a1;
}

unint64_t sub_24A6C7CF4()
{
  unint64_t result = qword_2697AF2B8;
  if (!qword_2697AF2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF2B8);
  }
  return result;
}

unint64_t sub_24A6C7D4C()
{
  unint64_t result = qword_2697AF2C0;
  if (!qword_2697AF2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF2C0);
  }
  return result;
}

unint64_t sub_24A6C7DA4()
{
  unint64_t result = qword_2697AF2C8;
  if (!qword_2697AF2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF2C8);
  }
  return result;
}

uint64_t sub_24A6C7DF8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6C7E2C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A6C7E7C()
{
  unint64_t result = qword_2697AF2D0;
  if (!qword_2697AF2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF2D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeleteScheduledQueryIntent()
{
  return &type metadata for DeleteScheduledQueryIntent;
}

uint64_t sub_24A6C7EE8()
{
  return sub_24A6C7F50(&qword_2697AF2E0);
}

uint64_t sub_24A6C7F1C()
{
  return sub_24A6C7F50(&qword_2697AF2F0);
}

uint64_t sub_24A6C7F50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24A6AE5E0(&qword_2697AF2E8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id EnterLocationSnippetView.placemark.getter()
{
  return *v0;
}

void EnterLocationSnippetView.placemark.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*EnterLocationSnippetView.placemark.modify())()
{
  return nullsub_1;
}

double EnterLocationSnippetView.radius.getter()
{
  return *(double *)(v0 + 8);
}

void EnterLocationSnippetView.radius.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*EnterLocationSnippetView.radius.modify())()
{
  return nullsub_1;
}

uint64_t EnterLocationSnippetView.init(placemark:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(void *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t EnterLocationSnippetView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  id v4 = *(void **)v1;
  type metadata accessor for LocationSnippetView();
  id v5 = v4;
  uint64_t result = sub_24A6DAC90();
  *a1 = v5;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6C80A0()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for EnterLocationSnippetView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for EnterLocationSnippetView(id *a1)
{
}

uint64_t assignWithCopy for EnterLocationSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for EnterLocationSnippetView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for EnterLocationSnippetView()
{
  return &type metadata for EnterLocationSnippetView;
}

unint64_t sub_24A6C8198()
{
  unint64_t result = qword_2697AF300;
  if (!qword_2697AF300)
  {
    type metadata accessor for LocationSnippetView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF300);
  }
  return result;
}

id ExitLocationSnippetView.placemark.getter()
{
  return *v0;
}

void ExitLocationSnippetView.placemark.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*ExitLocationSnippetView.placemark.modify())()
{
  return nullsub_1;
}

double ExitLocationSnippetView.radius.getter()
{
  return *(double *)(v0 + 8);
}

void ExitLocationSnippetView.radius.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*ExitLocationSnippetView.radius.modify())()
{
  return nullsub_1;
}

uint64_t ExitLocationSnippetView.init(placemark:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(void *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t ExitLocationSnippetView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void **)v1;
  type metadata accessor for LocationSnippetView();
  id v5 = v4;
  uint64_t result = sub_24A6DAC90();
  *a1 = v5;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6C82F8()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for ExitLocationSnippetView()
{
  return &type metadata for ExitLocationSnippetView;
}

unint64_t sub_24A6C8328(uint64_t a1)
{
  uint64_t v43 = sub_24A6DAE60();
  uint64_t v3 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v42 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_24A6DADE0();
  uint64_t v5 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  os_log_type_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v39 = *(void *)(Entity - 8);
  uint64_t v40 = Entity;
  uint64_t v9 = MEMORY[0x270FA5388](Entity);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (void *)((char *)v32 - v13);
  MEMORY[0x270FA5388](v12);
  uint64_t v38 = (uint64_t)v32 - v15;
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v17 = v5 + 16;
  uint64_t v19 = a1;
  uint64_t v20 = a1 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
  os_signpost_id_t v35 = (void (**)(char *, uint64_t))(v17 - 8);
  uint64_t v36 = v18;
  uint64_t v34 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v37 = v17;
  uint64_t v21 = *(void *)(v17 + 56);
  v32[1] = v1;
  uint64_t v33 = v21;
  v32[0] = v19;
  swift_bridgeObjectRetain();
  unint64_t v22 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v23 = v41;
    v36(v7, v20, v41);
    *id v14 = sub_24A6DADC0();
    v14[1] = v24;
    v14[2] = sub_24A6DADD0();
    v14[3] = v25;
    v14[4] = sub_24A6DADB0();
    v14[5] = v26;
    char v27 = v42;
    sub_24A6DADA0();
    (*v35)(v7, v23);
    (*v34)((char *)v14 + *(int *)(v40 + 28), v27, v43);
    uint64_t v28 = v38;
    sub_24A6B306C((uint64_t)v14, v38);
    sub_24A6B306C(v28, (uint64_t)v11);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v22 = sub_24A6AE794(0, *(void *)(v22 + 16) + 1, 1, v22);
    }
    unint64_t v30 = *(void *)(v22 + 16);
    unint64_t v29 = *(void *)(v22 + 24);
    if (v30 >= v29 >> 1) {
      unint64_t v22 = sub_24A6AE794(v29 > 1, v30 + 1, 1, v22);
    }
    *(void *)(v22 + 16) = v30 + 1;
    sub_24A6B306C((uint64_t)v11, v22+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v30);
    v20 += v33;
    --v16;
  }
  while (v16);
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_24A6C86D0()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF308);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF308);
  return sub_24A6DAC90();
}

uint64_t static GetScheduledQueriesIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF18, MEMORY[0x263F06D40], (uint64_t)qword_2697AF308, a1);
}

uint64_t static GetScheduledQueriesIntent.title.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF18, MEMORY[0x263F06D40], (uint64_t)qword_2697AF308);
}

uint64_t (*static GetScheduledQueriesIntent.title.modify())()
{
  if (qword_2697AEF18 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF308);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A6C8838()
{
  uint64_t v0 = sub_24A6AE628(&qword_2697AF018);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v11 - v4;
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_24A6DAAC0();
  sub_24A6AEB44(v8, qword_2697AF320);
  sub_24A6AEB0C(v8, (uint64_t)qword_2697AF320);
  sub_24A6DAC90();
  sub_24A6DAC90();
  uint64_t v9 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v9(v5, 0, 1, v6);
  sub_24A6AE628(&qword_2697AF2F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24A6DC500;
  sub_24A6DAC90();
  sub_24A6DAC90();
  sub_24A6DAC90();
  v9(v3, 0, 1, v6);
  return sub_24A6DAAD0();
}

uint64_t static GetScheduledQueriesIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF20, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF320, a1);
}

uint64_t static GetScheduledQueriesIntent.description.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF20, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF320);
}

uint64_t (*static GetScheduledQueriesIntent.description.modify())()
{
  if (qword_2697AEF20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DAAC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF320);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t GetScheduledQueriesIntent.perform()(uint64_t a1)
{
  v1[7] = a1;
  uint64_t v2 = sub_24A6DA990();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_24A6DB080();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v4 = sub_24A6DB040();
  v1[15] = v4;
  v1[16] = *(void *)(v4 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_24A6DB070();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v6 = sub_24A6DB110();
  v1[24] = v6;
  v1[25] = *(void *)(v6 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A6C8E34, 0, 0);
}

uint64_t sub_24A6C8E34()
{
  sub_24A6DB0E0();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_24A6AB000, v1, v2, "GetScheduledQueriesIntent perform", v3, 2u);
    MEMORY[0x24C5CC2B0](v3, -1, -1);
  }
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[25];

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[29] = v7;
  v0[30] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v5);
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v8 = sub_24A6DB060();
  os_signpost_type_t v9 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v10 = v0[19];
    uint64_t v11 = v0[15];
    uint64_t v12 = v0[16];
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    unint64_t v14 = (v12 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v13(v10, v0[20], v11);
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    os_signpost_id_t v16 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v8, v9, v16, "CE.Intent.Get", "", v15, 2u);
    MEMORY[0x24C5CC2B0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    uint64_t v17 = v0[16];

    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    unint64_t v14 = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v19 = v0[19];
  uint64_t v18 = v0[20];
  uint64_t v20 = v0[15];
  v0[31] = v13;
  v0[32] = v14;
  v13(v19, v18, v20);
  sub_24A6DB0C0();
  swift_allocObject();
  v0[33] = sub_24A6DB0B0();
  sub_24A6DAF70();
  v0[34] = sub_24A6DAF60();
  uint64_t v21 = (void *)swift_task_alloc();
  v0[35] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_24A6C90D0;
  return MEMORY[0x270F184F0]();
}

uint64_t sub_24A6C90D0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 288) = a1;
  *(void *)(v3 + 296) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24A6C97BC;
  }
  else {
    uint64_t v4 = sub_24A6C91E4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6C91E4()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v25 = *(void **)(v0 + 288);
  swift_bridgeObjectRetain();
  sub_24A6C9E08(&v25);
  if (v1)
  {
    return swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = sub_24A6C8328((uint64_t)v25);
    *(void *)(v0 + 304) = v3;
    swift_release();
    sub_24A6B29B0();
    sub_24A6B26C0();
    sub_24A6B2A04(v4);
    uint64_t v5 = sub_24A6DB060();
    sub_24A6DB0A0();
    os_signpost_type_t v6 = sub_24A6DB570();
    if (sub_24A6DB590())
    {
      os_signpost_type_t v24 = v6;
      uint64_t v7 = *(void *)(v0 + 112);
      uint64_t v9 = *(void *)(v0 + 88);
      uint64_t v8 = *(void *)(v0 + 96);
      swift_retain();
      sub_24A6DB0D0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x263F90238])
      {
        char v10 = 0;
        uint64_t v11 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 88));
        uint64_t v11 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
        char v10 = 1;
      }
      uint64_t v17 = *(void *)(v0 + 144);
      uint64_t v16 = *(void *)(v0 + 152);
      uint64_t v18 = *(void *)(v0 + 120);
      uint64_t v19 = *(void *)(v0 + 128);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 248))(v16, v17, v18);
      uint64_t v20 = swift_slowAlloc();
      *(unsigned char *)uint64_t v20 = 0;
      *(unsigned char *)(v20 + 1) = v10;
      *(_WORD *)(v20 + 2) = 2050;
      *(void *)(v0 + 48) = 0;
      sub_24A6DB5B0();
      os_signpost_id_t v21 = sub_24A6DB030();
      _os_signpost_emit_with_name_impl(&dword_24A6AB000, v5, v24, v21, "CE.Intent.Get", v11, (uint8_t *)v20, 0xCu);
      MEMORY[0x24C5CC2B0](v20, -1, -1);

      uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v15(v17, v18);
      v15(v16, v18);
    }
    else
    {
      uint64_t v12 = *(void *)(v0 + 144);
      uint64_t v13 = *(void *)(v0 + 120);
      uint64_t v14 = *(void *)(v0 + 128);

      uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v15(v12, v13);
    }
    *(void *)(v0 + 312) = v15;
    sub_24A6DA980();
    *(void *)(v0 + 32) = v3;
    sub_24A6DB500();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 320) = sub_24A6DB4F0();
    uint64_t v23 = sub_24A6DB4E0();
    return MEMORY[0x270FA2498](sub_24A6C9550, v23, v22);
  }
}

uint64_t sub_24A6C9550()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24A6C95B8, 0, 0);
}

uint64_t sub_24A6C95B8()
{
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v1 = v0[22];
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[23];
  uint64_t v8 = v0[20];
  uint64_t v7 = v0[15];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v6 = v0[8];
  v0[5] = v0[38];
  sub_24A6AE628(&qword_2697AF340);
  sub_24A6C9EB0();
  sub_24A6C7CF4();
  sub_24A6DA9B0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v6);
  v11(v8, v7);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v10, v9);
  swift_bridgeObjectRelease();
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A6C97BC()
{
  uint64_t v1 = *(void **)(v0 + 296);
  sub_24A6DB0E0();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 296);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v10;
    sub_24A6DB5B0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed list queries: %@", v7, 0xCu);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v8, -1, -1);
    MEMORY[0x24C5CC2B0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 296);
  }
  uint64_t v12 = (uint64_t *)(v0 + 136);
  (*(void (**)(void, void))(v0 + 232))(*(void *)(v0 + 208), *(void *)(v0 + 192));
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v13);
  uint64_t v14 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v15 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    uint64_t v16 = *(void *)(v0 + 96);
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v18 = *(void *)(v0 + 88);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v17, v18) == *MEMORY[0x263F90238])
    {
      char v19 = 0;
      uint64_t v20 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
      uint64_t v20 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v19 = 1;
    }
    format = (char *)v20;
    uint64_t v12 = (uint64_t *)(v0 + 152);
    os_signpost_type_t v23 = v15;
    uint64_t v24 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 120);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 248))(*(void *)(v0 + 152), v25, v26);
    uint64_t v27 = swift_slowAlloc();
    *(unsigned char *)uint64_t v27 = 0;
    *(unsigned char *)(v27 + 1) = v19;
    *(_WORD *)(v27 + 2) = 2050;
    *(void *)(v0 + 16) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v28 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v14, v23, v28, "CE.Intent.Get", format, (uint8_t *)v27, 0xCu);
    MEMORY[0x24C5CC2B0](v27, -1, -1);

    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v22(v25, v26);
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 128);

    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  }
  uint64_t v29 = *v12;
  id v37 = *(id *)(v0 + 296);
  uint64_t v31 = *(void *)(v0 + 176);
  uint64_t v30 = *(void *)(v0 + 184);
  uint64_t v32 = *(void *)(v0 + 160);
  uint64_t v38 = *(void *)(v0 + 168);
  uint64_t v33 = *(void *)(v0 + 120);
  v22(v29, v33);
  sub_24A6ACC7C();
  swift_allocError();
  *(_OWORD *)uint64_t v34 = xmmword_24A6DC720;
  *(unsigned char *)(v34 + 16) = 4;
  swift_willThrow();
  swift_release();
  swift_release();

  v22(v32, v33);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v38);
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
  os_signpost_id_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_24A6C9C74@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF308);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6C9D34(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return GetScheduledQueriesIntent.perform()(a1);
}

uint64_t sub_24A6C9DCC(uint64_t a1)
{
  unint64_t v2 = sub_24A6CA088();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_24A6C9E08(void **a1)
{
  uint64_t v2 = *(void *)(sub_24A6DADE0() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_24A6CB934(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_24A6CA1D0(v6);
  *a1 = v3;
  return result;
}

unint64_t sub_24A6C9EB0()
{
  unint64_t result = qword_2697AF348;
  if (!qword_2697AF348)
  {
    sub_24A6AE5E0(&qword_2697AF340);
    sub_24A6CB948(&qword_2697AF068, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF348);
  }
  return result;
}

unint64_t sub_24A6C9F58()
{
  unint64_t result = qword_2697AF350;
  if (!qword_2697AF350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF350);
  }
  return result;
}

unint64_t sub_24A6C9FB0()
{
  unint64_t result = qword_2697AF358;
  if (!qword_2697AF358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF358);
  }
  return result;
}

uint64_t sub_24A6CA004()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6CA038()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A6CA088()
{
  unint64_t result = qword_2697AF360;
  if (!qword_2697AF360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF360);
  }
  return result;
}

ValueMetadata *type metadata accessor for GetScheduledQueriesIntent()
{
  return &type metadata for GetScheduledQueriesIntent;
}

uint64_t sub_24A6CA0EC()
{
  return sub_24A6CA188(&qword_2697AF370);
}

uint64_t sub_24A6CA120()
{
  return sub_24A6CA188(&qword_2697AF380);
}

uint64_t sub_24A6CA154()
{
  return sub_24A6CA188(&qword_2697AF388);
}

uint64_t sub_24A6CA188(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24A6AE5E0(&qword_2697AF378);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A6CA1D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24A6DADE0();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v136 = (char *)&v131 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v151 = (char *)&v131 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v146 = (char *)&v131 - v11;
  MEMORY[0x270FA5388](v10);
  v147 = (char *)&v131 - v12;
  uint64_t v13 = a1[1];
  uint64_t result = sub_24A6DB640();
  if (result >= v13)
  {
    if (v13 < 0) {
      goto LABEL_140;
    }
    if (v13) {
      return sub_24A6CAD90(0, v13, 1, a1);
    }
    return result;
  }
  if (v13 >= 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 + 1;
  }
  if (v13 < -1) {
    goto LABEL_148;
  }
  uint64_t v149 = v4;
  v150 = a1;
  uint64_t v133 = result;
  if (v13 < 2)
  {
    char v19 = (char *)MEMORY[0x263F8EE78];
    unint64_t v138 = MEMORY[0x263F8EE78]
         + ((*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80));
    uint64_t v132 = MEMORY[0x263F8EE78];
    if (v13 != 1)
    {
      unint64_t v21 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v21 >= 2)
      {
        uint64_t v125 = *v150;
        do
        {
          unint64_t v126 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_135;
          }
          if (!v125) {
            goto LABEL_147;
          }
          uint64_t v127 = *(void *)&v19[16 * v126 + 32];
          uint64_t v128 = *(void *)&v19[16 * v21 + 24];
          sub_24A6CB0B0(v125 + v5[9] * v127, v125 + v5[9] * *(void *)&v19[16 * v21 + 16], v125 + v5[9] * v128, v138);
          if (v2) {
            break;
          }
          if (v128 < v127) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v19 = sub_24A6CB920((uint64_t)v19);
          }
          if (v126 >= *((void *)v19 + 2)) {
            goto LABEL_137;
          }
          v129 = &v19[16 * v126 + 32];
          *(void *)v129 = v127;
          *((void *)v129 + 1) = v128;
          unint64_t v130 = *((void *)v19 + 2);
          if (v21 > v130) {
            goto LABEL_138;
          }
          memmove(&v19[16 * v21 + 16], &v19[16 * v21 + 32], 16 * (v130 - v21));
          *((void *)v19 + 2) = v130 - 1;
          unint64_t v21 = v130 - 1;
        }
        while (v130 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v132 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v16 = v15 >> 1;
    uint64_t v17 = sub_24A6DB4C0();
    *(void *)(v17 + 16) = v16;
    unint64_t v18 = (*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80);
    uint64_t v132 = v17;
    unint64_t v138 = v17 + v18;
  }
  uint64_t v20 = 0;
  v144 = (void (**)(char *, uint64_t))(v5 + 1);
  v145 = v5 + 2;
  v154 = (void (**)(char *, uint64_t, uint64_t))(v5 + 4);
  char v19 = (char *)MEMORY[0x263F8EE78];
  v139 = v5;
  while (1)
  {
    uint64_t v22 = v20;
    uint64_t v23 = v20 + 1;
    uint64_t v137 = v20;
    if (v20 + 1 >= v13) {
      goto LABEL_37;
    }
    uint64_t v24 = v149;
    uint64_t v25 = *v150;
    uint64_t v141 = v25;
    uint64_t v142 = v20 + 1;
    uint64_t v153 = v139[9];
    uint64_t v26 = v153;
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t))v139[2];
    v27(v147, v25 + v153 * v23, v149);
    uint64_t v28 = v25 + v26 * v22;
    uint64_t v29 = v146;
    v27(v146, v28, v24);
    uint64_t v30 = sub_24A6CB948(&qword_2697AF390, MEMORY[0x263F332A0]);
    uint64_t v31 = v147;
    uint64_t v148 = v30;
    LODWORD(v152) = sub_24A6DB400();
    uint64_t v32 = v13;
    uint64_t v33 = (void (*)(char *, uint64_t))v139[1];
    uint64_t v34 = v29;
    uint64_t v22 = v137;
    v33(v34, v24);
    v33(v31, v24);
    uint64_t v35 = v153;
    uint64_t v23 = v22 + 2;
    uint64_t v143 = v32;
    if (v22 + 2 >= v32)
    {
      uint64_t v13 = v143;
      if ((v152 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      v134 = v19;
      uint64_t v131 = v2;
      v142 *= v153;
      uint64_t v36 = v141;
      uint64_t v37 = v153 * v23;
      while (1)
      {
        uint64_t v38 = v23;
        uint64_t v39 = v147;
        uint64_t v40 = v149;
        v27(v147, v36 + v37, v149);
        uint64_t v41 = v146;
        v27(v146, v36 + v142, v40);
        int v42 = sub_24A6DB400();
        v33(v41, v40);
        v33(v39, v40);
        if ((v152 ^ v42)) {
          break;
        }
        uint64_t v23 = v38 + 1;
        uint64_t v35 = v153;
        v36 += v153;
        if (v143 == v38 + 1)
        {
          uint64_t v13 = v143;
          uint64_t v23 = v143;
          uint64_t v2 = v131;
          char v19 = v134;
          uint64_t v22 = v137;
          if (v152) {
            goto LABEL_25;
          }
          goto LABEL_37;
        }
      }
      uint64_t v2 = v131;
      char v19 = v134;
      uint64_t v23 = v38;
      uint64_t v22 = v137;
      uint64_t v13 = v143;
      uint64_t v35 = v153;
      if ((v152 & 1) == 0) {
        goto LABEL_37;
      }
    }
LABEL_25:
    if (v23 < v22) {
      goto LABEL_141;
    }
    if (v22 >= v23)
    {
LABEL_37:
      uint64_t v47 = v150;
      goto LABEL_38;
    }
    v134 = v19;
    uint64_t v43 = 0;
    uint64_t v44 = v35 * (v23 - 1);
    uint64_t v45 = v23 * v35;
    uint64_t v46 = v22 * v35;
    uint64_t v47 = v150;
    uint64_t v148 = v23;
    do
    {
      if (v22 != v23 + v43 - 1)
      {
        uint64_t v49 = v141;
        if (!v141) {
          goto LABEL_146;
        }
        uint64_t v50 = v2;
        unint64_t v51 = v141 + v46;
        uint64_t v52 = (char *)(v141 + v44);
        v152 = *v154;
        v152(v136, v141 + v46, v149);
        if (v46 < v44 || v51 >= v49 + v45)
        {
          uint64_t v48 = v149;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v48 = v149;
          if (v46 != v44) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v152(v52, (uint64_t)v136, v48);
        uint64_t v2 = v50;
        uint64_t v47 = v150;
        uint64_t v23 = v148;
        uint64_t v35 = v153;
      }
      ++v22;
      --v43;
      v44 -= v35;
      v45 -= v35;
      v46 += v35;
    }
    while (v22 < v23 + v43);
    char v19 = v134;
    uint64_t v22 = v137;
    uint64_t v13 = v143;
LABEL_38:
    uint64_t v53 = v149;
    if (v23 >= v13) {
      goto LABEL_57;
    }
    if (__OFSUB__(v23, v22)) {
      goto LABEL_139;
    }
    if (v23 - v22 >= v133) {
      goto LABEL_57;
    }
    if (__OFADD__(v22, v133)) {
      goto LABEL_142;
    }
    uint64_t v54 = v22 + v133 >= v13 ? v13 : v22 + v133;
    if (v54 < v22) {
      break;
    }
    if (v23 != v54)
    {
      v134 = v19;
      uint64_t v131 = v2;
      uint64_t v55 = v139[9];
      v140 = (void (*)(char *, uint64_t, uint64_t))v139[2];
      uint64_t v141 = v55;
      uint64_t v56 = v55 * (v23 - 1);
      uint64_t v57 = v23 * v55;
      uint64_t v135 = v54;
      do
      {
        uint64_t v59 = 0;
        uint64_t v148 = v23;
        uint64_t v142 = v57;
        uint64_t v143 = v56;
        while (1)
        {
          uint64_t v60 = *v47;
          v152 = (void (*)(char *, uint64_t, uint64_t))(v57 + v59);
          uint64_t v153 = v22;
          uint64_t v61 = v57 + v59 + v60;
          uint64_t v62 = v147;
          uint64_t v63 = v47;
          char v64 = v140;
          v140(v147, v61, v53);
          uint64_t v65 = v56 + v59 + v60;
          os_log_type_t v66 = v146;
          v64(v146, v65, v53);
          sub_24A6CB948(&qword_2697AF390, MEMORY[0x263F332A0]);
          LOBYTE(v60) = sub_24A6DB400();
          uint64_t v67 = *v144;
          (*v144)(v66, v53);
          v67(v62, v53);
          if ((v60 & 1) == 0) {
            break;
          }
          uint64_t v68 = *v63;
          if (!*v63) {
            goto LABEL_144;
          }
          uint64_t v57 = v142;
          uint64_t v56 = v143;
          uint64_t v69 = (char *)(v68 + v143 + v59);
          uint64_t v70 = *v154;
          uint64_t v71 = v149;
          (*v154)(v151, v68 + v142 + v59, v149);
          uint64_t v53 = v71;
          swift_arrayInitWithTakeFrontToBack();
          v70(v69, (uint64_t)v151, v71);
          v59 -= v141;
          uint64_t v22 = v153 + 1;
          uint64_t v58 = v148;
          uint64_t v47 = v150;
          if (v148 == v153 + 1) {
            goto LABEL_49;
          }
        }
        uint64_t v58 = v148;
        uint64_t v53 = v149;
        uint64_t v47 = v63;
        uint64_t v57 = v142;
        uint64_t v56 = v143;
LABEL_49:
        uint64_t v23 = v58 + 1;
        v56 += v141;
        v57 += v141;
        uint64_t v22 = v137;
      }
      while (v23 != v135);
      uint64_t v23 = v135;
      uint64_t v2 = v131;
      char v19 = v134;
    }
LABEL_57:
    if (v23 < v22) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v148 = v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      char v19 = sub_24A6CB6E4(0, *((void *)v19 + 2) + 1, 1, v19);
    }
    unint64_t v74 = *((void *)v19 + 2);
    unint64_t v73 = *((void *)v19 + 3);
    unint64_t v21 = v74 + 1;
    if (v74 >= v73 >> 1) {
      char v19 = sub_24A6CB6E4((char *)(v73 > 1), v74 + 1, 1, v19);
    }
    *((void *)v19 + 2) = v21;
    v75 = v19 + 32;
    uint64_t v76 = &v19[16 * v74 + 32];
    uint64_t v77 = v148;
    *(void *)uint64_t v76 = v22;
    *((void *)v76 + 1) = v77;
    if (v74)
    {
      while (1)
      {
        unint64_t v78 = v21 - 1;
        if (v21 >= 4)
        {
          uint64_t v83 = &v75[16 * v21];
          uint64_t v84 = *((void *)v83 - 8);
          uint64_t v85 = *((void *)v83 - 7);
          BOOL v89 = __OFSUB__(v85, v84);
          uint64_t v86 = v85 - v84;
          if (v89) {
            goto LABEL_123;
          }
          uint64_t v88 = *((void *)v83 - 6);
          uint64_t v87 = *((void *)v83 - 5);
          BOOL v89 = __OFSUB__(v87, v88);
          uint64_t v81 = v87 - v88;
          char v82 = v89;
          if (v89) {
            goto LABEL_124;
          }
          unint64_t v90 = v21 - 2;
          uint64_t v91 = &v75[16 * v21 - 32];
          uint64_t v93 = *(void *)v91;
          uint64_t v92 = *((void *)v91 + 1);
          BOOL v89 = __OFSUB__(v92, v93);
          uint64_t v94 = v92 - v93;
          if (v89) {
            goto LABEL_126;
          }
          BOOL v89 = __OFADD__(v81, v94);
          uint64_t v95 = v81 + v94;
          if (v89) {
            goto LABEL_129;
          }
          if (v95 >= v86)
          {
            v113 = &v75[16 * v78];
            uint64_t v115 = *(void *)v113;
            uint64_t v114 = *((void *)v113 + 1);
            BOOL v89 = __OFSUB__(v114, v115);
            uint64_t v116 = v114 - v115;
            if (v89) {
              goto LABEL_133;
            }
            BOOL v106 = v81 < v116;
            goto LABEL_94;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v107 = *((void *)v19 + 4);
            uint64_t v108 = *((void *)v19 + 5);
            BOOL v89 = __OFSUB__(v108, v107);
            uint64_t v100 = v108 - v107;
            char v101 = v89;
            goto LABEL_88;
          }
          uint64_t v80 = *((void *)v19 + 4);
          uint64_t v79 = *((void *)v19 + 5);
          BOOL v89 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          char v82 = v89;
        }
        if (v82) {
          goto LABEL_125;
        }
        unint64_t v90 = v21 - 2;
        unsigned int v96 = &v75[16 * v21 - 32];
        uint64_t v98 = *(void *)v96;
        uint64_t v97 = *((void *)v96 + 1);
        BOOL v99 = __OFSUB__(v97, v98);
        uint64_t v100 = v97 - v98;
        char v101 = v99;
        if (v99) {
          goto LABEL_128;
        }
        v102 = &v75[16 * v78];
        uint64_t v104 = *(void *)v102;
        uint64_t v103 = *((void *)v102 + 1);
        BOOL v89 = __OFSUB__(v103, v104);
        uint64_t v105 = v103 - v104;
        if (v89) {
          goto LABEL_131;
        }
        if (__OFADD__(v100, v105)) {
          goto LABEL_132;
        }
        if (v100 + v105 >= v81)
        {
          BOOL v106 = v81 < v105;
LABEL_94:
          if (v106) {
            unint64_t v78 = v90;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v101) {
          goto LABEL_127;
        }
        v109 = &v75[16 * v78];
        uint64_t v111 = *(void *)v109;
        uint64_t v110 = *((void *)v109 + 1);
        BOOL v89 = __OFSUB__(v110, v111);
        uint64_t v112 = v110 - v111;
        if (v89) {
          goto LABEL_130;
        }
        if (v112 < v100) {
          goto LABEL_14;
        }
LABEL_96:
        unint64_t v117 = v78 - 1;
        if (v78 - 1 >= v21)
        {
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
        if (!*v150) {
          goto LABEL_145;
        }
        v118 = v19;
        v119 = &v75[16 * v117];
        uint64_t v120 = *(void *)v119;
        v121 = &v75[16 * v78];
        uint64_t v122 = *((void *)v121 + 1);
        sub_24A6CB0B0(*v150 + v139[9] * *(void *)v119, *v150 + v139[9] * *(void *)v121, *v150 + v139[9] * v122, v138);
        if (v2) {
          goto LABEL_117;
        }
        if (v122 < v120) {
          goto LABEL_120;
        }
        if (v78 > *((void *)v118 + 2)) {
          goto LABEL_121;
        }
        v123 = v118;
        *(void *)v119 = v120;
        *(void *)&v75[16 * v117 + 8] = v122;
        unint64_t v124 = *((void *)v118 + 2);
        if (v78 >= v124) {
          goto LABEL_122;
        }
        char v19 = v123;
        unint64_t v21 = v124 - 1;
        memmove(&v75[16 * v78], v121 + 16, 16 * (v124 - 1 - v78));
        *((void *)v19 + 2) = v124 - 1;
        if (v124 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v21 = 1;
LABEL_14:
    uint64_t v13 = v150[1];
    uint64_t v20 = v148;
    uint64_t v5 = v139;
    if (v148 >= v13) {
      goto LABEL_106;
    }
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
LABEL_148:
  uint64_t result = sub_24A6DB620();
  __break(1u);
  return result;
}

uint64_t sub_24A6CAD90(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v31 = a1;
  uint64_t v7 = sub_24A6DADE0();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v29 - v11;
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)&v29 - v14;
  uint64_t v39 = a3;
  uint64_t v30 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void (**)(void, void, void))(v13 + 16);
    uint64_t v15 = v13 + 16;
    uint64_t v17 = *(void *)(v15 + 56);
    uint64_t v32 = (uint64_t (**)(char *, uint64_t))(v15 - 8);
    uint64_t v33 = (void (*)(char *, uint64_t, uint64_t))v16;
    uint64_t v34 = a4;
    uint64_t v35 = v15;
    uint64_t v40 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v44 = v17 * (v39 - 1);
    uint64_t v38 = v17;
    uint64_t v43 = v17 * v39;
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v42 = v31;
    while (1)
    {
      uint64_t v19 = *a4;
      uint64_t v20 = v43 + v18 + *a4;
      unint64_t v21 = v36;
      uint64_t v22 = v33;
      v33(v36, v20, v7);
      uint64_t v23 = v37;
      v22(v37, v44 + v18 + v19, v7);
      sub_24A6CB948(&qword_2697AF390, MEMORY[0x263F332A0]);
      LOBYTE(v22) = sub_24A6DB400();
      uint64_t v24 = *v32;
      (*v32)(v23, v7);
      uint64_t v25 = v21;
      a4 = v34;
      uint64_t result = v24(v25, v7);
      if ((v22 & 1) == 0)
      {
LABEL_4:
        v44 += v38;
        v43 += v38;
        if (++v39 == v30) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v26 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v27 = v26 + v44 + v18;
      uint64_t v28 = *v40;
      (*v40)(v41, v26 + v43 + v18, v7);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v27, v41, v7);
      v18 -= v38;
      if (v39 == ++v42) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24A6CB0B0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24A6DADE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v56 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v55 = (char *)v49 - v12;
  uint64_t v57 = *(void *)(v13 + 72);
  if (!v57)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (a2 - a1 == 0x8000000000000000 && v57 == -1) {
    goto LABEL_68;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v57 == -1) {
    goto LABEL_69;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v57;
  unint64_t v60 = a1;
  unint64_t v59 = a4;
  uint64_t v16 = v14 / v57;
  if (v15 >= v14 / v57)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v57;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v19 = v9;
      }
      else
      {
        uint64_t v19 = v9;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v34 = a4 + v18;
      unint64_t v58 = a4 + v18;
      unint64_t v60 = a2;
      unint64_t v52 = a1;
      if (v18 >= 1 && a1 < a2)
      {
        unint64_t v36 = -v57;
        uint64_t v38 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
        uint64_t v37 = v19 + 16;
        v49[1] = v37 - 8;
        uint64_t v50 = v38;
        unint64_t v53 = -v57;
        uint64_t v54 = v37;
        unint64_t v51 = a4;
        uint64_t v39 = v55;
        uint64_t v40 = (void (**)(char *, uint64_t))(v37 - 8);
        do
        {
          uint64_t v57 = a3 + v36;
          uint64_t v41 = v50;
          v50(v39, v34 + v36, v8);
          unint64_t v42 = a2 + v36;
          unint64_t v43 = a3;
          uint64_t v44 = v56;
          v41(v56, v42, v8);
          sub_24A6CB948(&qword_2697AF390, MEMORY[0x263F332A0]);
          LOBYTE(v41) = sub_24A6DB400();
          uint64_t v45 = *v40;
          (*v40)(v44, v8);
          v45(v39, v8);
          if (v41)
          {
            a3 = v57;
            if (v43 < a2 || v57 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v46 = v51;
            }
            else
            {
              unint64_t v46 = v51;
              if (v43 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v36 = v53;
            v60 += v53;
          }
          else
          {
            a3 = v57;
            unint64_t v47 = v58;
            v58 += v53;
            if (v43 < v47 || v57 >= v47)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v42 = a2;
              unint64_t v36 = v53;
              unint64_t v46 = v51;
            }
            else
            {
              unint64_t v46 = v51;
              if (v43 != v47) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v42 = a2;
              unint64_t v36 = v53;
            }
          }
          unint64_t v34 = v58;
          if (v58 <= v46) {
            break;
          }
          a2 = v42;
        }
        while (v42 > v52);
      }
      goto LABEL_66;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v57;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v53 = a4 + v17;
    unint64_t v58 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      unint64_t v21 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v54 = v9 + 16;
      uint64_t v22 = (void (**)(char *, uint64_t))(v9 + 8);
      do
      {
        unint64_t v23 = a3;
        uint64_t v24 = v55;
        v21(v55, a2, v8);
        unint64_t v25 = a4;
        uint64_t v26 = v56;
        v21(v56, v25, v8);
        sub_24A6CB948(&qword_2697AF390, MEMORY[0x263F332A0]);
        char v27 = sub_24A6DB400();
        uint64_t v28 = *v22;
        (*v22)(v26, v8);
        v28(v24, v8);
        unint64_t v29 = v60;
        if (v27)
        {
          unint64_t v30 = a2 + v57;
          if (v60 < a2 || v60 >= v30)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v23;
          }
          else
          {
            a3 = v23;
            if (v60 == a2) {
              unint64_t v29 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v32 = v59 + v57;
          if (v60 < v59 || v60 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v23;
          }
          else
          {
            a3 = v23;
            if (v60 != v59) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v59 = v32;
          unint64_t v30 = a2;
        }
        unint64_t v60 = v29 + v57;
        a4 = v59;
        if (v59 >= v53) {
          break;
        }
        a2 = v30;
      }
      while (v30 < a3);
    }
LABEL_66:
    sub_24A6CB7E0(&v60, &v59, (uint64_t *)&v58);
    return 1;
  }
LABEL_70:
  uint64_t result = sub_24A6DB630();
  __break(1u);
  return result;
}

char *sub_24A6CB6E4(char *result, int64_t a2, char a3, char *a4)
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
    sub_24A6AE628(&qword_2697AF398);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A6CB7E0(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_24A6DADE0();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24A6DB630();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_24A6CB920(uint64_t a1)
{
  return sub_24A6CB6E4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A6CB934(void *a1)
{
  return sub_24A6D0E48(0, a1[2], 0, a1);
}

uint64_t sub_24A6CB948(unint64_t *a1, void (*a2)(uint64_t))
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

ConditionalEngineAppIntents::ListScheduledQueriesSnippetView __swiftcall ListScheduledQueriesSnippetView.init(queries:)(ConditionalEngineAppIntents::ListScheduledQueriesSnippetView queries)
{
  v1->queries._rawValue = queries.queries._rawValue;
  return queries;
}

uint64_t ListScheduledQueriesSnippetView.queries.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ListScheduledQueriesSnippetView.queries.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*ListScheduledQueriesSnippetView.queries.modify())()
{
  return nullsub_1;
}

uint64_t ListScheduledQueriesSnippetView.body.getter()
{
  uint64_t v1 = sub_24A6AE628(&qword_2697AF3A0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  *(void *)unint64_t v3 = sub_24A6DB200();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  sub_24A6AE628(&qword_2697AF3A8);
  v6[1] = v4;
  swift_bridgeObjectRetain();
  sub_24A6AE628(&qword_2697AF340);
  type metadata accessor for ScheduledQueryEntityView();
  sub_24A6B36E4(&qword_2697AF3B0, &qword_2697AF340);
  sub_24A6CBC08(&qword_2697AF3B8, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntityView);
  sub_24A6CBC08(&qword_2697AF3C0, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  sub_24A6DB3C0();
  sub_24A6DB230();
  sub_24A6B36E4(&qword_2697AF3C8, &qword_2697AF3A0);
  sub_24A6DB340();
  return sub_24A6CBC50((uint64_t)v3);
}

uint64_t sub_24A6CBC00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A6B30D0(a1, a2);
}

uint64_t sub_24A6CBC08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A6CBC50(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF3A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6CBCB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6CBCCC()
{
  uint64_t v1 = sub_24A6AE628(&qword_2697AF3A0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  *(void *)unint64_t v3 = sub_24A6DB200();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  sub_24A6AE628(&qword_2697AF3A8);
  v6[1] = v4;
  swift_bridgeObjectRetain();
  sub_24A6AE628(&qword_2697AF340);
  type metadata accessor for ScheduledQueryEntityView();
  sub_24A6B36E4(&qword_2697AF3B0, &qword_2697AF340);
  sub_24A6CBC08(&qword_2697AF3B8, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntityView);
  sub_24A6CBC08(&qword_2697AF3C0, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  sub_24A6DB3C0();
  sub_24A6DB230();
  sub_24A6B36E4(&qword_2697AF3C8, &qword_2697AF3A0);
  sub_24A6DB340();
  return sub_24A6CBC50((uint64_t)v3);
}

ValueMetadata *type metadata accessor for ListScheduledQueriesSnippetView()
{
  return &type metadata for ListScheduledQueriesSnippetView;
}

uint64_t sub_24A6CBEF0()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_24A6CBF70(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_24A6DACC0();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    int64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24A6CC058(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24A6DACC0();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24A6CC0D0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24A6DACC0();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_24A6CC164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24A6DACC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *sub_24A6CC1FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24A6DACC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_24A6CC278(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24A6DACC0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24A6CC30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6CC320);
}

uint64_t sub_24A6CC320(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24A6DACC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24A6CC3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6CC3E4);
}

void *sub_24A6CC3E4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24A6DACC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LocationSnippetView()
{
  uint64_t result = qword_2697AF3D0;
  if (!qword_2697AF3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6CC4D8()
{
  uint64_t result = sub_24A6DACC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A6CC580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6CC59C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A6DB1C0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24A6DACC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LocationSnippetView();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)a1 + *(int *)(v9 + 24), v5);
  uint64_t v10 = sub_24A6DB300();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  uint64_t v15 = sub_24A6DB290();
  uint64_t v17 = v16;
  int v32 = v18;
  uint64_t v20 = v19;
  sub_24A6C426C(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_24A6DB1B0();
  sub_24A6DB1A0();
  id v21 = objc_msgSend(*a1, sel_name);
  if (v21)
  {
    uint64_t v22 = v21;
    sub_24A6DB470();
  }
  char v23 = v32 & 1;
  sub_24A6DB190();
  swift_bridgeObjectRelease();
  sub_24A6DB1A0();
  sub_24A6DB1E0();
  uint64_t v24 = sub_24A6DB2F0();
  uint64_t v26 = v25;
  char v33 = v23;
  char v28 = v27 & 1;
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v17;
  *(unsigned char *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v24;
  *(void *)(a2 + 56) = v25;
  *(unsigned char *)(a2 + 64) = v27 & 1;
  *(void *)(a2 + 72) = v29;
  sub_24A6C48FC(v15, v17, v23);
  swift_bridgeObjectRetain();
  sub_24A6C48FC(v24, v26, v28);
  swift_bridgeObjectRetain();
  sub_24A6C426C(v24, v26, v28);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v15, v17, v33);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6CC86C()
{
  uint64_t v1 = sub_24A6DB160();
  sub_24A6CC59C(v0, (uint64_t)&v13);
  uint64_t v2 = v13;
  uint64_t v3 = v14;
  char v4 = v15;
  uint64_t v6 = v16;
  uint64_t v5 = v17;
  char v7 = v18;
  uint64_t v8 = v19;
  uint64_t v9 = v20;
  char v10 = v21;
  uint64_t v12 = v22;
  uint64_t v13 = v1;
  uint64_t v14 = 0;
  char v15 = 1;
  uint64_t v16 = v2;
  uint64_t v17 = v3;
  char v18 = v4;
  uint64_t v19 = v6;
  uint64_t v20 = v5;
  char v21 = v7;
  uint64_t v22 = v8;
  uint64_t v23 = v9;
  char v24 = v10;
  uint64_t v25 = v12;
  sub_24A6DB230();
  sub_24A6AE628(&qword_2697AF3E0);
  sub_24A6CC974();
  sub_24A6DB340();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_24A6C426C(v8, v9, v10);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24A6CC974()
{
  unint64_t result = qword_2697AF3E8;
  if (!qword_2697AF3E8)
  {
    sub_24A6AE5E0(&qword_2697AF3E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF3E8);
  }
  return result;
}

uint64_t sub_24A6CC9D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6CCA2C()
{
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB44(v0, qword_2697AF3F0);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF3F0);
  return sub_24A6DAC90();
}

uint64_t static RunScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF28, MEMORY[0x263F06D40], (uint64_t)qword_2697AF3F0, a1);
}

uint64_t static RunScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF28, MEMORY[0x263F06D40], (uint64_t)qword_2697AF3F0);
}

uint64_t (*static RunScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEF28 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF3F0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A6CCB98()
{
  uint64_t v0 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6DACC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = sub_24A6DAAC0();
  sub_24A6AEB44(v5, qword_2697AF408);
  sub_24A6AEB0C(v5, (uint64_t)qword_2697AF408);
  sub_24A6DAC90();
  sub_24A6DAC90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_24A6AE628(&qword_2697AF2F8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24A6DC500;
  sub_24A6DAC90();
  sub_24A6DAC90();
  return sub_24A6DAAE0();
}

uint64_t static RunScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6C58EC(&qword_2697AEF30, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF408, a1);
}

uint64_t static RunScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_24A6C59D4(a1, &qword_2697AEF30, MEMORY[0x263EFBA28], (uint64_t)qword_2697AF408);
}

uint64_t (*static RunScheduledQueryIntent.description.modify())()
{
  if (qword_2697AEF30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DAAC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF408);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t RunScheduledQueryIntent.scheduledQuery.getter()
{
  return sub_24A6DAA10();
}

uint64_t sub_24A6CCED0(uint64_t a1)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v3 = MEMORY[0x270FA5388](Entity - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_24A6B30D0(a1, (uint64_t)&v9 - v6);
  sub_24A6B30D0((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_24A6DAA20();
  sub_24A6CEE88((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  return swift_release();
}

uint64_t RunScheduledQueryIntent.scheduledQuery.setter(uint64_t a1)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  MEMORY[0x270FA5388](Entity - 8);
  sub_24A6B30D0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24A6DAA20();
  return sub_24A6CEE88(a1, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
}

void (*RunScheduledQueryIntent.scheduledQuery.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF490;
}

uint64_t RunScheduledQueryIntent.$scheduledQuery.getter()
{
  return sub_24A6DAA30();
}

uint64_t RunScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  char v24 = a1;
  uint64_t v23 = sub_24A6DAB90();
  uint64_t v1 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A6AE628(&qword_2697AF008);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v22 - v8;
  uint64_t v10 = sub_24A6AE628(&qword_2697AF420);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v13 - 8);
  char v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24A6DACC0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v22[1] = sub_24A6AE628(&qword_2697AF428);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 56))(v12, 1, 1, Entity);
  uint64_t v19 = sub_24A6DA990();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v9, 1, 1, v19);
  v20(v7, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBDC8], v23);
  sub_24A6CEE40((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  uint64_t result = sub_24A6DAA50();
  *char v24 = result;
  return result;
}

uint64_t RunScheduledQueryIntent.init(scheduledQuery:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v33 = a1;
  unint64_t v34 = a2;
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v2 = *(void *)(Entity - 8);
  uint64_t v3 = MEMORY[0x270FA5388](Entity);
  uint64_t v32 = (uint64_t)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v28 - v5;
  uint64_t v31 = sub_24A6DAB90();
  uint64_t v7 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v29 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A6AE628(&qword_2697AF008);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v28 - v13;
  uint64_t v15 = sub_24A6AE628(&qword_2697AF420);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A6DACC0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  v28[1] = sub_24A6AE628(&qword_2697AF428);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v17, 1, 1, Entity);
  uint64_t v23 = sub_24A6DA990();
  char v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  v24(v14, 1, 1, v23);
  v24(v12, 1, 1, v23);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v29, *MEMORY[0x263EFBDC8], v31);
  sub_24A6CEE40((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
  uint64_t v25 = sub_24A6DAA50();
  uint64_t v26 = v33;
  sub_24A6B30D0(v33, (uint64_t)v6);
  sub_24A6B30D0((uint64_t)v6, v32);
  swift_retain();
  sub_24A6DAA20();
  sub_24A6CEE88((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  swift_release();
  uint64_t result = sub_24A6CEE88(v26, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  *unint64_t v34 = v25;
  return result;
}

uint64_t RunScheduledQueryIntent.perform()(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for ScheduledQuerySnippetView();
  v2[14] = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v4 = sub_24A6DACC0();
  v2[18] = v4;
  v2[19] = *(void *)(v4 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v5 = sub_24A6DAE60();
  v2[21] = v5;
  v2[22] = *(void *)(v5 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v6 = sub_24A6DB080();
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  uint64_t v7 = sub_24A6DB040();
  v2[28] = v7;
  v2[29] = *(void *)(v7 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  uint64_t v8 = sub_24A6DB110();
  v2[34] = v8;
  v2[35] = *(void *)(v8 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  uint64_t v9 = sub_24A6DB070();
  v2[38] = v9;
  v2[39] = *(void *)(v9 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = type metadata accessor for ScheduledQueryEntity();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = *v1;
  v2[42] = v10;
  v2[43] = v11;
  return MEMORY[0x270FA2498](sub_24A6CDC78, 0, 0);
}

uint64_t sub_24A6CDC78()
{
  uint64_t v1 = (uint64_t *)v0[42];
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  uint64_t v2 = *v1;
  v0[44] = *v1;
  uint64_t v3 = v1[1];
  v0[45] = v3;
  swift_bridgeObjectRetain();
  sub_24A6CEE88((uint64_t)v1, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  sub_24A6DB0F0();
  sub_24A6DB050();
  sub_24A6DB060();
  sub_24A6DB020();
  uint64_t v4 = sub_24A6DB060();
  os_signpost_type_t v5 = sub_24A6DB580();
  if (sub_24A6DB590())
  {
    uint64_t v6 = v0[32];
    uint64_t v19 = v2;
    uint64_t v8 = v0[28];
    uint64_t v7 = v0[29];
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    unint64_t v10 = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v9(v6, v0[33], v8);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_signpost_id_t v12 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v4, v5, v12, "CE.Intent.Run", "", v11, 2u);
    MEMORY[0x24C5CC2B0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v2 = v19;
  }
  else
  {
    uint64_t v13 = v0[29];

    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    unint64_t v10 = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v15 = v0[32];
  uint64_t v14 = v0[33];
  uint64_t v16 = v0[28];
  v0[46] = v9;
  v0[47] = v10;
  v9(v15, v14, v16);
  sub_24A6DB0C0();
  swift_allocObject();
  v0[48] = sub_24A6DB0B0();
  sub_24A6DAF70();
  v0[49] = sub_24A6DAF60();
  uint64_t v17 = (void *)swift_task_alloc();
  v0[50] = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_24A6CDEE0;
  return MEMORY[0x270F18500](v2, v3);
}

uint64_t sub_24A6CDEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[51] = v2;
  swift_task_dealloc();
  if (v2)
  {
    os_signpost_type_t v5 = sub_24A6CE690;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    os_signpost_type_t v5 = sub_24A6CE010;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A6CE010()
{
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v1);
  uint64_t v2 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v3 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    uint64_t v4 = *(void *)(v0 + 216);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v5 = *(void *)(v0 + 200);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x263F90238])
    {
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 192));
      uint64_t v8 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v7 = 1;
    }
    uint64_t v16 = *(void *)(v0 + 248);
    uint64_t v15 = *(void *)(v0 + 256);
    uint64_t v17 = *(void *)(v0 + 224);
    uint64_t v18 = *(void *)(v0 + 232);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 368))(v15, v16, v17);
    uint64_t v19 = swift_slowAlloc();
    *(unsigned char *)uint64_t v19 = 0;
    *(unsigned char *)(v19 + 1) = v7;
    *(_WORD *)(v19 + 2) = 2050;
    *(void *)(v0 + 88) = 0;
    sub_24A6DB5B0();
    os_signpost_id_t v20 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v2, v3, v20, "CE.Intent.Run", v8, (uint8_t *)v19, 0xCu);
    MEMORY[0x24C5CC2B0](v19, -1, -1);

    uint64_t v21 = *(void (**)(void, void))(v18 + 8);
    uint64_t v13 = v18 + 8;
    os_signpost_id_t v12 = v21;
    v21(v16, v17);
    v21(v15, v17);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 232);

    uint64_t v14 = *(void (**)(void, void))(v11 + 8);
    uint64_t v13 = v11 + 8;
    os_signpost_id_t v12 = v14;
    v14(v9, v10);
  }
  *(void *)(v0 + 416) = v13;
  *(void *)(v0 + 424) = v12;
  unint64_t v35 = *(void *)(v0 + 32);
  uint64_t v36 = *(void *)(v0 + 24);
  uint64_t v22 = *(void *)(v0 + 336);
  uint64_t v23 = *(void *)(v0 + 328);
  uint64_t v24 = *(void *)(v0 + 176);
  uint64_t v25 = *(void *)(v0 + 184);
  uint64_t v27 = *(void *)(v0 + 160);
  uint64_t v26 = *(void *)(v0 + 168);
  uint64_t v28 = *(void *)(v0 + 152);
  uint64_t v34 = *(void *)(v0 + 144);
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v25, v22 + *(int *)(v23 + 28), v26);
  sub_24A6CEE88(v22, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  sub_24A6DAE40();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  sub_24A6DACB0();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v34);
  swift_bridgeObjectRelease();
  sub_24A6DB4A0();
  if (v35) {
    uint64_t v29 = v36;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v35) {
    unint64_t v30 = v35;
  }
  else {
    unint64_t v30 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  sub_24A6DB4A0();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 48) = v29;
  *(void *)(v0 + 56) = v30;
  sub_24A6DA980();
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  sub_24A6DB500();
  *(void *)(v0 + 432) = sub_24A6DB4F0();
  uint64_t v32 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6CE3D8, v32, v31);
}

uint64_t sub_24A6CE3D8()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 112);
  swift_release();
  sub_24A6B306C(v1, v2);
  return MEMORY[0x270FA2498](sub_24A6CE454, 0, 0);
}

uint64_t sub_24A6CE454()
{
  uint64_t v1 = v0[39];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[53];
  uint64_t v12 = v0[40];
  uint64_t v10 = v0[38];
  uint64_t v8 = v0[28];
  uint64_t v9 = v0[33];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[14];
  uint64_t v7 = v0[15];
  sub_24A6CEDEC();
  sub_24A6CEE40(&qword_2697AF070, (void (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView);
  sub_24A6DA9B0();
  swift_release();
  sub_24A6CEE88(v4, (uint64_t (*)(void))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v7);
  swift_bridgeObjectRelease();
  v11(v9, v8);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v10);
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
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24A6CE690()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void **)(v0 + 408);
  swift_release();
  sub_24A6DB0E0();
  swift_bridgeObjectRetain();
  id v2 = v1;
  swift_bridgeObjectRetain();
  id v3 = v1;
  uint64_t v4 = sub_24A6DB100();
  os_log_type_t v5 = sub_24A6DB520();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 408);
    uint64_t v7 = *(void *)(v0 + 352);
    unint64_t v8 = *(void *)(v0 + 360);
    uint64_t v50 = *(void *)(v0 + 288);
    uint64_t v47 = *(void *)(v0 + 280);
    format = *(char **)(v0 + 272);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v51 = v46;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 72) = sub_24A6B2A14(v7, v8, &v51);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2112;
    id v11 = v6;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v12;
    sub_24A6DB5B0();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_24A6AB000, v4, v5, "Failed to run task %s: %@", (uint8_t *)v9, 0x16u);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v46, -1, -1);
    MEMORY[0x24C5CC2B0](v9, -1, -1);

    (*(void (**)(uint64_t, char *))(v47 + 8))(v50, format);
  }
  else
  {
    uint64_t v13 = *(void **)(v0 + 408);
    uint64_t v15 = *(void *)(v0 + 280);
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v16 = *(void *)(v0 + 272);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  uint64_t v17 = (uint64_t *)(v0 + 240);
  sub_24A6B29B0();
  sub_24A6B26C0();
  sub_24A6B2A04(v18);
  uint64_t v19 = sub_24A6DB060();
  sub_24A6DB0A0();
  os_signpost_type_t v20 = sub_24A6DB570();
  if (sub_24A6DB590())
  {
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v22 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 192);
    swift_retain();
    sub_24A6DB0D0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 88))(v22, v23) == *MEMORY[0x263F90238])
    {
      char v24 = 0;
      uint64_t v25 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
      uint64_t v25 = "error=%{signpost.telemetry:number1,public}ld enableTelemetry=YES";
      char v24 = 1;
    }
    formata = (char *)v25;
    uint64_t v17 = (uint64_t *)(v0 + 256);
    os_signpost_type_t v28 = v20;
    uint64_t v29 = *(void *)(v0 + 232);
    uint64_t v30 = *(void *)(v0 + 240);
    uint64_t v31 = *(void *)(v0 + 224);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 368))(*(void *)(v0 + 256), v30, v31);
    uint64_t v32 = swift_slowAlloc();
    *(unsigned char *)uint64_t v32 = 0;
    *(unsigned char *)(v32 + 1) = v24;
    *(_WORD *)(v32 + 2) = 2050;
    *(void *)(v0 + 64) = 1;
    sub_24A6DB5B0();
    os_signpost_id_t v33 = sub_24A6DB030();
    _os_signpost_emit_with_name_impl(&dword_24A6AB000, v19, v28, v33, "CE.Intent.Run", formata, (uint8_t *)v32, 0xCu);
    MEMORY[0x24C5CC2B0](v32, -1, -1);

    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v27(v30, v31);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 232);

    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  }
  uint64_t v34 = *v17;
  id v44 = *(id *)(v0 + 408);
  uint64_t v36 = *(void *)(v0 + 352);
  uint64_t v35 = *(void *)(v0 + 360);
  uint64_t v38 = *(void *)(v0 + 312);
  uint64_t v37 = *(void *)(v0 + 320);
  uint64_t v45 = *(void *)(v0 + 304);
  uint64_t v39 = *(void *)(v0 + 264);
  uint64_t v40 = *(void *)(v0 + 224);
  v27(v34, v40);
  sub_24A6ACC7C();
  swift_allocError();
  *(void *)uint64_t v41 = v36;
  *(void *)(v41 + 8) = v35;
  *(unsigned char *)(v41 + 16) = 1;
  swift_willThrow();
  swift_release();

  v27(v39, v40);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v45);
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
  unint64_t v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42();
}

uint64_t sub_24A6CEC54@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF3F0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6CED14(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return RunScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6CEDB0(uint64_t a1)
{
  unint64_t v2 = sub_24A6CF01C();
  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_24A6CEDEC()
{
  unint64_t result = qword_2697AF438;
  if (!qword_2697AF438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF438);
  }
  return result;
}

uint64_t sub_24A6CEE40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A6CEE88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A6CEEEC()
{
  unint64_t result = qword_2697AF440;
  if (!qword_2697AF440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF440);
  }
  return result;
}

unint64_t sub_24A6CEF44()
{
  unint64_t result = qword_2697AF448;
  if (!qword_2697AF448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF448);
  }
  return result;
}

uint64_t sub_24A6CEF98()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6CEFCC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A6CF01C()
{
  unint64_t result = qword_2697AF450;
  if (!qword_2697AF450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF450);
  }
  return result;
}

uint64_t sub_24A6CF070()
{
  swift_retain();
  sub_24A6DAA10();
  return swift_release();
}

ValueMetadata *type metadata accessor for RunScheduledQueryIntent()
{
  return &type metadata for RunScheduledQueryIntent;
}

uint64_t sub_24A6CF0CC()
{
  return sub_24A6CF168(&qword_2697AF460);
}

uint64_t sub_24A6CF100()
{
  return sub_24A6CF168(&qword_2697AF470);
}

uint64_t sub_24A6CF134()
{
  return sub_24A6CF168(&qword_2697AF478);
}

uint64_t sub_24A6CF168(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24A6AE5E0(&qword_2697AF468);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ScheduledQueryEntity.init(scheduledQuery:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_24A6DAE60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = sub_24A6DADC0();
  a2[1] = v8;
  a2[2] = sub_24A6DADD0();
  a2[3] = v9;
  a2[4] = sub_24A6DADB0();
  a2[5] = v10;
  sub_24A6DADA0();
  uint64_t v11 = sub_24A6DADE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)a2 + *(int *)(Entity + 28), v7, v4);
}

uint64_t type metadata accessor for ScheduledQueryEntity()
{
  uint64_t result = qword_2697AF538;
  if (!qword_2697AF538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t (*static ScheduledQueryEntity.defaultQuery.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.query.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.query.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.query.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.shortcutsTriggerIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduledQueryEntity.shortcutsTriggerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ScheduledQueryEntity.shortcutsTriggerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQueryEntity.triggerParameters.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v4 = sub_24A6DAE60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ScheduledQueryEntity.triggerParameters.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v4 = sub_24A6DAE60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*ScheduledQueryEntity.triggerParameters.modify())()
{
  return nullsub_1;
}

uint64_t sub_24A6CF624()
{
  uint64_t v0 = sub_24A6DABC0();
  sub_24A6AEB44(v0, qword_2697AF480);
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF480);
  return sub_24A6DABB0();
}

uint64_t static ScheduledQueryEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF38 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DABC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF480);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ScheduledQueryEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_2697AEF38 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DABC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF480);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ScheduledQueryEntity.typeDisplayRepresentation.modify())()
{
  if (qword_2697AEF38 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DABC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF480);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ScheduledQueryEntity.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  v21[1] = a1;
  uint64_t v1 = sub_24A6AE628(&qword_2697AF498);
  MEMORY[0x270FA5388](v1 - 8);
  v21[0] = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v21 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v21 - v14;
  swift_bridgeObjectRetain();
  sub_24A6DAC90();
  type metadata accessor for ScheduledQueryEntity();
  sub_24A6DAE50();
  sub_24A6DAE30();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v10, v15, v6);
  v16(v5, v13, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v17 = v21[0];
  sub_24A6DAAF0();
  uint64_t v18 = sub_24A6DAB00();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  sub_24A6DAB20();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v13, v6);
  return ((uint64_t (*)(char *, uint64_t))v19)(v15, v6);
}

uint64_t sub_24A6CFB90@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A6CFBA0@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF38 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DABC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF480);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6CFC60(uint64_t a1)
{
  uint64_t v2 = sub_24A6D205C((unint64_t *)&qword_2697AF098);
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_24A6CFCCC(uint64_t a1)
{
  uint64_t v2 = sub_24A6D205C(&qword_2697AF4D8);
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t ScheduledQueryQuery.entities(for:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A6CFD54, 0, 0);
}

uint64_t sub_24A6CFD54()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  *(void *)(v0 + 24) = sub_24A6D1990(v1);
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24A6CFDFC;
  return ScheduledQueryQuery.suggestedEntities()();
}

uint64_t sub_24A6CFDFC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_24A6CFFBC;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v5 = sub_24A6CFF2C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A6CFF2C()
{
  uint64_t v1 = sub_24A6D1A28(v0[6], v0[3]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_24A6CFFBC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScheduledQueryQuery.suggestedEntities()()
{
  uint64_t v1 = sub_24A6DB110();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_24A6DAE60();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  uint64_t v3 = sub_24A6DADE0();
  v0[8] = v3;
  v0[9] = *(void *)(v3 - 8);
  v0[10] = swift_task_alloc();
  v0[11] = swift_task_alloc();
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  v0[12] = Entity;
  v0[13] = *(void *)(Entity - 8);
  v0[14] = swift_task_alloc();
  v0[15] = swift_task_alloc();
  uint64_t v5 = sub_24A6DAD90();
  v0[16] = v5;
  v0[17] = *(void *)(v5 - 8);
  v0[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A6D0220, 0, 0);
}

uint64_t sub_24A6D0220()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F33298], v3);
  char v4 = sub_24A6DAD80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    sub_24A6DAF70();
    v0[19] = sub_24A6DAF60();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[20] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24A6D0484;
    return MEMORY[0x270F184F8]();
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v6 = sub_24A6DB100();
    os_log_type_t v7 = sub_24A6DB520();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24A6AB000, v6, v7, "Feature flag is disabled", v8, 2u);
      MEMORY[0x24C5CC2B0](v8, -1, -1);
    }
    uint64_t v10 = v0[3];
    uint64_t v9 = v0[4];
    uint64_t v11 = v0[2];

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v12 = 0;
    *(void *)(v12 + 8) = 0;
    *(unsigned char *)(v12 + 16) = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_24A6D0484(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v4 = sub_24A6D086C;
  }
  else
  {
    swift_release();
    char v4 = sub_24A6D05A0;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24A6D05A0()
{
  uint64_t v1 = v0[21];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v27 = v0[13];
    os_signpost_type_t v28 = (void *)v0[14];
    uint64_t v26 = v0[12];
    uint64_t v3 = v0[9];
    uint64_t v4 = v0[6];
    uint64_t v32 = MEMORY[0x263F8EE78];
    sub_24A6D0E0C(0, v2, 0);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v3 += 16;
    uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    uint64_t v24 = *(void *)(v3 + 56);
    uint64_t v25 = v5;
    uint64_t v22 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
    uint64_t v23 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    uint64_t v7 = v32;
    do
    {
      uint64_t v8 = (uint64_t *)v0[14];
      uint64_t v30 = v0[15];
      int64_t v31 = v2;
      uint64_t v9 = v0[10];
      uint64_t v10 = v0[11];
      uint64_t v12 = v0[7];
      uint64_t v11 = v0[8];
      uint64_t v29 = v0[5];
      v25(v10, v6, v11);
      v25(v9, v10, v11);
      *uint64_t v8 = sub_24A6DADC0();
      v28[1] = v13;
      void v28[2] = sub_24A6DADD0();
      v28[3] = v14;
      v28[4] = sub_24A6DADB0();
      v28[5] = v15;
      sub_24A6DADA0();
      uint64_t v16 = *v23;
      (*v23)(v9, v11);
      (*v22)((char *)v8 + *(int *)(v26 + 28), v12, v29);
      sub_24A6B306C((uint64_t)v8, v30);
      v16(v10, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A6D0E0C(0, *(void *)(v7 + 16) + 1, 1);
        uint64_t v7 = v32;
      }
      unint64_t v18 = *(void *)(v7 + 16);
      unint64_t v17 = *(void *)(v7 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_24A6D0E0C(v17 > 1, v18 + 1, 1);
        uint64_t v7 = v32;
      }
      uint64_t v19 = v0[15];
      *(void *)(v7 + 16) = v18 + 1;
      sub_24A6B306C(v19, v7+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v18);
      v6 += v24;
      --v2;
    }
    while (v31 != 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_signpost_type_t v20 = (uint64_t (*)(uint64_t))v0[1];
  return v20(v7);
}

uint64_t sub_24A6D086C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6D0930(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24A6CFD54, 0, 0);
}

uint64_t sub_24A6D0950(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  int64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *int64_t v2 = v1;
  v2[1] = sub_24A6D09E0;
  return ScheduledQueryQuery.suggestedEntities()();
}

uint64_t sub_24A6D09E0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_24A6D0AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_24A6D1DA8();
  *uint64_t v5 = v2;
  v5[1] = sub_24A6AE440;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_24A6D0BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24A6AE440;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

uint64_t sub_24A6D0C5C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24A6DB6C0();
  swift_bridgeObjectRetain();
  sub_24A6DB490();
  uint64_t v8 = sub_24A6DB6D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24A6DB650() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24A6DB650() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24A6D1390(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24A6D0E0C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24A6D0E68(a1, a2, a3, (void *)*v3, &qword_2697AEFE0, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24A6D0E48(char a1, int64_t a2, char a3, void *a4)
{
  return sub_24A6D0E68(a1, a2, a3, a4, &qword_2697AF550, MEMORY[0x263F332A0]);
}

uint64_t sub_24A6D0E68(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24A6AE628(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_24A6DB630();
  __break(1u);
  return result;
}

uint64_t sub_24A6D10B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_24A6AE628(&qword_2697AF548);
  uint64_t v3 = sub_24A6DB5F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24A6DB6C0();
      sub_24A6DB490();
      uint64_t result = sub_24A6DB6D0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24A6D1390(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24A6D10B0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24A6D152C();
      goto LABEL_22;
    }
    sub_24A6D16E0();
  }
  uint64_t v11 = *v4;
  sub_24A6DB6C0();
  sub_24A6DB490();
  uint64_t result = sub_24A6DB6D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24A6DB650(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24A6DB660();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24A6DB650();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24A6D152C()
{
  uint64_t v1 = v0;
  sub_24A6AE628(&qword_2697AF548);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A6DB5E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A6D16E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_24A6AE628(&qword_2697AF548);
  uint64_t v3 = sub_24A6DB5F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24A6DB6C0();
    swift_bridgeObjectRetain();
    sub_24A6DB490();
    uint64_t result = sub_24A6DB6D0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A6D1990(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24A6DB510();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24A6D0C5C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24A6D1A28(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ScheduledQueryEntity() - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v32 = (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v29 - v9);
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v34 = *(void *)(a1 + 16);
  if (v34)
  {
    uint64_t v29 = v2;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)(v8 + 72);
    unint64_t v30 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v33 = a1 + v30;
    uint64_t v35 = a2 + 56;
    uint64_t v14 = MEMORY[0x263F8EE78];
    uint64_t v31 = v13;
    while (1)
    {
      sub_24A6B30D0(v33 + v13 * v12, (uint64_t)v10);
      if (*(void *)(a2 + 16))
      {
        uint64_t v16 = *v10;
        uint64_t v15 = v10[1];
        sub_24A6DB6C0();
        swift_bridgeObjectRetain();
        sub_24A6DB490();
        uint64_t v17 = sub_24A6DB6D0();
        uint64_t v18 = -1 << *(unsigned char *)(a2 + 32);
        unint64_t v19 = v17 & ~v18;
        if ((*(void *)(v35 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
        {
          uint64_t v20 = *(void *)(a2 + 48);
          uint64_t v21 = (void *)(v20 + 16 * v19);
          BOOL v22 = *v21 == v16 && v21[1] == v15;
          if (v22 || (sub_24A6DB650() & 1) != 0)
          {
LABEL_13:
            swift_bridgeObjectRelease();
            sub_24A6B306C((uint64_t)v10, v32);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_24A6D0E0C(0, *(void *)(v14 + 16) + 1, 1);
            }
            uint64_t v14 = v36;
            unint64_t v24 = *(void *)(v36 + 16);
            unint64_t v23 = *(void *)(v36 + 24);
            if (v24 >= v23 >> 1)
            {
              sub_24A6D0E0C(v23 > 1, v24 + 1, 1);
              uint64_t v14 = v36;
            }
            *(void *)(v14 + 16) = v24 + 1;
            uint64_t v25 = v14 + v30 + v24 * v31;
            uint64_t v13 = v31;
            sub_24A6B306C(v32, v25);
            goto LABEL_5;
          }
          uint64_t v26 = ~v18;
          while (1)
          {
            unint64_t v19 = (v19 + 1) & v26;
            if (((*(void *)(v35 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
              break;
            }
            BOOL v27 = (void *)(v20 + 16 * v19);
            BOOL v28 = *v27 == v16 && v27[1] == v15;
            if (v28 || (sub_24A6DB650() & 1) != 0) {
              goto LABEL_13;
            }
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v13 = v31;
      }
      sub_24A6C7C98((uint64_t)v10);
LABEL_5:
      if (++v12 == v34) {
        return v36;
      }
    }
  }
  return result;
}

uint64_t sub_24A6D1D08()
{
  return sub_24A6D205C(&qword_2697AF4B0);
}

uint64_t sub_24A6D1D3C()
{
  return sub_24A6D205C(&qword_2697AF4B8);
}

uint64_t sub_24A6D1D70()
{
  return sub_24A6D205C(&qword_2697AF3C0);
}

unint64_t sub_24A6D1DA8()
{
  unint64_t result = qword_2697AF4C0;
  if (!qword_2697AF4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF4C0);
  }
  return result;
}

uint64_t sub_24A6D1DFC()
{
  return MEMORY[0x263EFC020];
}

uint64_t sub_24A6D1E08()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24A6D1E14()
{
  return sub_24A6D205C(&qword_2697AF4C8);
}

uint64_t sub_24A6D1E48()
{
  return sub_24A6D205C(&qword_2697AF4D0);
}

uint64_t sub_24A6D1E7C()
{
  return sub_24A6D205C(&qword_2697AF068);
}

uint64_t sub_24A6D1EB0()
{
  return sub_24A6D205C(&qword_2697AF4D8);
}

unint64_t sub_24A6D1EE8()
{
  unint64_t result = qword_2697AF4E0;
  if (!qword_2697AF4E0)
  {
    sub_24A6AE5E0(&qword_2697AF4E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF4E0);
  }
  return result;
}

uint64_t sub_24A6D1F44()
{
  return sub_24A6D205C(&qword_2697AF4F0);
}

unint64_t sub_24A6D1F7C()
{
  unint64_t result = qword_2697AF4F8;
  if (!qword_2697AF4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF4F8);
  }
  return result;
}

unint64_t sub_24A6D1FD4()
{
  unint64_t result = qword_2697AF500[0];
  if (!qword_2697AF500[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697AF500);
  }
  return result;
}

uint64_t sub_24A6D2028()
{
  return sub_24A6D205C((unint64_t *)&qword_2697AF098);
}

uint64_t sub_24A6D205C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ScheduledQueryEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A6D20A4()
{
  unint64_t result = qword_2697AF518;
  if (!qword_2697AF518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF518);
  }
  return result;
}

unint64_t sub_24A6D20FC()
{
  unint64_t result = qword_2697AF520[0];
  if (!qword_2697AF520[0])
  {
    sub_24A6AE5E0(&qword_2697AF340);
    sub_24A6D205C(&qword_2697AF068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697AF520);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQueryEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_24A6DAE60();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for ScheduledQueryEntity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24A6DAE60();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for ScheduledQueryEntity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_24A6DAE60();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for ScheduledQueryEntity(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ScheduledQueryEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ScheduledQueryEntity(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D2604);
}

uint64_t sub_24A6D2604(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24A6DAE60();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScheduledQueryEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D26C8);
}

uint64_t sub_24A6D26C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24A6DAE60();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24A6D2770()
{
  uint64_t result = sub_24A6DAE60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduledQueryQuery()
{
  return &type metadata for ScheduledQueryQuery;
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQuerySnippetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  int v5 = *(_DWORD *)(*(void *)(Entity - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
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
    uint64_t v9 = *(int *)(Entity + 28);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24A6DAE60();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for ScheduledQuerySnippetView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v3 = sub_24A6DAE60();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *initializeWithCopy for ScheduledQuerySnippetView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24A6DAE60();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

void *assignWithCopy for ScheduledQuerySnippetView(void *a1, void *a2)
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
  uint64_t v4 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for ScheduledQuerySnippetView(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ScheduledQuerySnippetView(void *a1, void *a2)
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
  uint64_t v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24A6D2CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D2CC4);
}

uint64_t sub_24A6D2CC4(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 48);
  return v5(a1, a2, Entity);
}

uint64_t sub_24A6D2D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D2D44);
}

uint64_t sub_24A6D2D44(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 56);
  return v5(a1, a2, a2, Entity);
}

uint64_t type metadata accessor for ScheduledQueryEntityView()
{
  uint64_t result = qword_2697AF558;
  if (!qword_2697AF558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6D2E00()
{
  uint64_t result = type metadata accessor for ScheduledQueryEntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A6D2E8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6D2EA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v4 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
  uint64_t View = type metadata accessor for ScheduledQueryView(0);
  uint64_t result = ScheduledQueryEntity.displayRepresentation.getter(a1 + *(int *)(View + 20));
  *(unsigned char *)(a1 + *(int *)(View + 24)) = 0;
  return result;
}

unint64_t sub_24A6D2F40()
{
  unint64_t result = qword_2697AF568;
  if (!qword_2697AF568)
  {
    type metadata accessor for ScheduledQueryView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF568);
  }
  return result;
}

uint64_t ScheduledQueryErrorView.init(scheduledQuery:error:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24A6B306C(a1, a3);
  uint64_t result = type metadata accessor for ScheduledQueryErrorView(0);
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for ScheduledQueryErrorView(uint64_t a1)
{
  return sub_24A6D360C(a1, (uint64_t *)&unk_2697AF590);
}

uint64_t ScheduledQueryErrorView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v42 = a1;
  uint64_t Representation = type metadata accessor for QueryRepresentation(0);
  uint64_t v4 = MEMORY[0x270FA5388](Representation - 8);
  uint64_t v46 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - v6;
  uint64_t v8 = sub_24A6AE628(&qword_2697AF570);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v10 = sub_24A6DB210();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v41 = v10;
  uint64_t v11 = (uint64_t)&v10[*(int *)(sub_24A6AE628(&qword_2697AF578) + 44)];
  uint64_t v40 = v7;
  sub_24A6D3954(v2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  uint64_t v44 = sub_24A6DB160();
  sub_24A6D3644((uint64_t)&v61);
  uint64_t v43 = v61;
  LOBYTE(v10) = v63;
  unsigned __int8 v12 = v64;
  int v33 = v63;
  int v34 = v64;
  uint64_t v38 = v62;
  uint64_t v39 = v65;
  char v13 = v66;
  uint64_t v14 = v70;
  uint64_t v36 = v69;
  uint64_t v37 = v67;
  uint64_t v35 = v71;
  uint64_t v45 = v72;
  uint64_t v47 = v74;
  char v52 = 1;
  unsigned __int8 v51 = v63;
  char v50 = v66;
  char v49 = v68;
  char v48 = v73;
  char v15 = v73;
  char v16 = v68;
  uint64_t v17 = (uint64_t)v7;
  uint64_t v18 = v46;
  sub_24A6D3954(v17, v46, type metadata accessor for QueryRepresentation);
  sub_24A6D3954(v18, v11, type metadata accessor for QueryRepresentation);
  unint64_t v19 = (_OWORD *)(v11 + *(int *)(sub_24A6AE628(&qword_2697AF580) + 48));
  v53[0] = v44;
  v53[1] = 0;
  LOBYTE(v54) = 1;
  uint64_t v20 = v37;
  uint64_t v21 = v38;
  *((void *)&v54 + 1) = v43;
  *(void *)&long long v55 = v38;
  BYTE8(v55) = (_BYTE)v10;
  BYTE9(v55) = v12;
  uint64_t v22 = v39;
  *(void *)&long long v56 = v39;
  BYTE8(v56) = v13;
  *(void *)&long long v57 = v37;
  BYTE8(v57) = v16;
  uint64_t v24 = v35;
  uint64_t v23 = v36;
  *(void *)&long long v58 = v36;
  *((void *)&v58 + 1) = v14;
  *(void *)&long long v59 = v35;
  *((void *)&v59 + 1) = v45;
  LOBYTE(v60) = v15;
  *((void *)&v60 + 1) = v47;
  long long v25 = v54;
  *unint64_t v19 = (unint64_t)v44;
  v19[1] = v25;
  long long v26 = v56;
  v19[2] = v55;
  v19[3] = v26;
  long long v27 = v60;
  v19[6] = v59;
  v19[7] = v27;
  long long v28 = v58;
  v19[4] = v57;
  v19[5] = v28;
  sub_24A6D39BC((uint64_t)v53);
  sub_24A6D3A1C((uint64_t)v40);
  uint64_t v61 = v44;
  uint64_t v62 = 0;
  unsigned __int8 v63 = 1;
  uint64_t v65 = v43;
  uint64_t v66 = v21;
  LOBYTE(v67) = v33;
  BYTE1(v67) = v34;
  uint64_t v68 = v22;
  LOBYTE(v69) = v13;
  uint64_t v70 = v20;
  LOBYTE(v71) = v16;
  uint64_t v72 = v23;
  uint64_t v73 = v14;
  uint64_t v74 = v24;
  uint64_t v75 = v45;
  char v76 = v15;
  uint64_t v77 = v47;
  sub_24A6D3A78((uint64_t)&v61);
  sub_24A6D3A1C(v46);
  LOBYTE(v23) = sub_24A6DB230();
  uint64_t v30 = (uint64_t)v41;
  uint64_t v29 = v42;
  sub_24A6D3AD8((uint64_t)v41, v42);
  uint64_t v31 = v29 + *(int *)(sub_24A6AE628(&qword_2697AF588) + 36);
  *(unsigned char *)uint64_t v31 = v23;
  *(_OWORD *)(v31 + 8) = 0u;
  *(_OWORD *)(v31 + 24) = 0u;
  *(unsigned char *)(v31 + 40) = 1;
  return sub_24A6D3B40(v30);
}

uint64_t sub_24A6D3350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t Representation = type metadata accessor for QueryRepresentation(0);
  uint64_t v4 = MEMORY[0x270FA5388](Representation - 8);
  uint64_t v42 = &v30[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v30[-v6];
  uint64_t v39 = &v30[-v6];
  sub_24A6D3954(a1, (uint64_t)&v30[-v6], (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
  uint64_t v8 = sub_24A6DB160();
  sub_24A6D3644((uint64_t)&v58);
  uint64_t v36 = v59;
  uint64_t v37 = v58;
  unsigned __int8 v9 = v60;
  unsigned __int8 v10 = v61;
  int v31 = v60;
  int v32 = v61;
  uint64_t v38 = v62;
  char v11 = v63;
  uint64_t v41 = v64;
  uint64_t v12 = v67;
  uint64_t v34 = v68;
  uint64_t v35 = v66;
  char v13 = v70;
  uint64_t v43 = v69;
  uint64_t v44 = v71;
  char v49 = 1;
  unsigned __int8 v48 = v60;
  char v47 = v63;
  int v33 = v63;
  char v46 = v65;
  char v45 = v70;
  char v14 = v65;
  uint64_t v15 = (uint64_t)v7;
  char v16 = v42;
  sub_24A6D3954(v15, (uint64_t)v42, type metadata accessor for QueryRepresentation);
  uint64_t v17 = (uint64_t)v16;
  uint64_t v18 = v40;
  sub_24A6D3954(v17, v40, type metadata accessor for QueryRepresentation);
  unint64_t v19 = (_OWORD *)(v18 + *(int *)(sub_24A6AE628(&qword_2697AF580) + 48));
  v50[0] = v8;
  v50[1] = 0;
  LOBYTE(v51) = 1;
  uint64_t v21 = v36;
  uint64_t v20 = v37;
  *((void *)&v51 + 1) = v37;
  *(void *)&long long v52 = v36;
  BYTE8(v52) = v9;
  BYTE9(v52) = v10;
  uint64_t v22 = v38;
  *(void *)&long long v53 = v38;
  BYTE8(v53) = v11;
  *(void *)&long long v54 = v41;
  BYTE8(v54) = v14;
  uint64_t v23 = v34;
  uint64_t v24 = v35;
  *(void *)&long long v55 = v35;
  *((void *)&v55 + 1) = v12;
  *(void *)&long long v56 = v34;
  *((void *)&v56 + 1) = v43;
  LOBYTE(v57) = v13;
  *((void *)&v57 + 1) = v44;
  long long v25 = v51;
  *unint64_t v19 = (unint64_t)v8;
  v19[1] = v25;
  long long v26 = v53;
  v19[2] = v52;
  v19[3] = v26;
  long long v27 = v57;
  v19[6] = v56;
  v19[7] = v27;
  long long v28 = v55;
  v19[4] = v54;
  v19[5] = v28;
  sub_24A6D39BC((uint64_t)v50);
  sub_24A6D3A1C((uint64_t)v39);
  uint64_t v58 = v8;
  uint64_t v59 = 0;
  unsigned __int8 v60 = 1;
  uint64_t v62 = v20;
  uint64_t v63 = v21;
  LOBYTE(v64) = v31;
  BYTE1(v64) = v32;
  uint64_t v65 = v22;
  LOBYTE(v66) = v33;
  uint64_t v67 = v41;
  LOBYTE(v68) = v14;
  uint64_t v69 = v24;
  uint64_t v70 = v12;
  uint64_t v71 = v23;
  uint64_t v72 = v43;
  char v73 = v13;
  uint64_t v74 = v44;
  sub_24A6D3A78((uint64_t)&v58);
  return sub_24A6D3A1C((uint64_t)v42);
}

uint64_t type metadata accessor for QueryRepresentation(uint64_t a1)
{
  return sub_24A6D360C(a1, (uint64_t *)&unk_2697AF5B0);
}

uint64_t sub_24A6D360C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6D3644@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24A6DB3A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6DB390();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v32 = sub_24A6DB3B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_24A6DB3D0();
  sub_24A6DB130();
  uint64_t v31 = v35;
  int v30 = v36;
  uint64_t v29 = v37;
  int v28 = v38;
  uint64_t v26 = v40;
  uint64_t v27 = v39;
  type metadata accessor for ScheduledQueryErrorView(0);
  swift_getErrorValue();
  uint64_t v33 = sub_24A6DB690();
  uint64_t v34 = v6;
  sub_24A6B28C8();
  uint64_t v7 = sub_24A6DB310();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_24A6DB360();
  uint64_t v12 = sub_24A6DB280();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_24A6C426C(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_24A6DB240();
  uint64_t v17 = sub_24A6DB270();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_24A6C426C(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v32;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v31;
  *(unsigned char *)(a1 + 32) = v30;
  *(void *)(a1 + 40) = v29;
  *(unsigned char *)(a1 + 48) = v28;
  uint64_t v24 = v26;
  *(void *)(a1 + 56) = v27;
  *(void *)(a1 + 64) = v24;
  *(void *)(a1 + 72) = v17;
  *(void *)(a1 + 80) = v19;
  *(unsigned char *)(a1 + 88) = v23;
  *(void *)(a1 + 96) = v21;
  swift_retain();
  sub_24A6C48FC(v17, v19, v23);
  swift_bridgeObjectRetain();
  sub_24A6C426C(v17, v19, v23);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6D3954(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A6D39BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  swift_retain();
  sub_24A6C48FC(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24A6D3A1C(uint64_t a1)
{
  uint64_t Representation = type metadata accessor for QueryRepresentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(Representation - 8) + 8))(a1, Representation);
  return a1;
}

uint64_t sub_24A6D3A78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  swift_release();
  sub_24A6C426C(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24A6D3AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AF570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A6D3B40(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF570);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6D3BA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6D3BBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24A6AE628(&qword_2697AF570);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_24A6DB210();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_24A6AE628(&qword_2697AF578);
  sub_24A6D3350(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  char v7 = sub_24A6DB230();
  sub_24A6D3AD8((uint64_t)v5, a1);
  uint64_t v8 = a1 + *(int *)(sub_24A6AE628(&qword_2697AF588) + 36);
  *(unsigned char *)uint64_t v8 = v7;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(unsigned char *)(v8 + 40) = 1;
  return sub_24A6D3B40((uint64_t)v5);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScheduledQueryErrorView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v10 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
    uint64_t v19 = (char *)v4 + v10;
    char v11 = (char *)a2 + v10;
    uint64_t v12 = sub_24A6DAE60();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v19, v11, v12);
    uint64_t v14 = *(int *)(a3 + 20);
    char v15 = *(void **)((char *)a2 + v14);
    id v16 = v15;
    *(uint64_t *)((char *)v4 + v14) = (uint64_t)v15;
  }
  return v4;
}

void destroy for ScheduledQueryErrorView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v5 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 20));
}

void *initializeWithCopy for ScheduledQueryErrorView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24A6DAE60();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = *(void **)((char *)a2 + v13);
  id v15 = v14;
  *(void *)((char *)a1 + v13) = v14;
  return a1;
}

void *assignWithCopy for ScheduledQueryErrorView(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = *(void **)((char *)a2 + v10);
  id v12 = v11;
  uint64_t v13 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;

  return a1;
}

_OWORD *initializeWithTake for ScheduledQueryErrorView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for ScheduledQueryErrorView(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = *(int *)(type metadata accessor for ScheduledQueryEntity() + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = *(void **)((char *)a1 + v13);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);

  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryErrorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D4208);
}

uint64_t sub_24A6D4208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v7 = *(void *)(Entity - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, Entity);
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

uint64_t storeEnumTagSinglePayload for ScheduledQueryErrorView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D42DC);
}

uint64_t sub_24A6D42DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ScheduledQueryEntity();
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

uint64_t sub_24A6D4398()
{
  uint64_t result = type metadata accessor for ScheduledQueryEntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24A6D4430()
{
  unint64_t result = qword_2697AF5A0;
  if (!qword_2697AF5A0)
  {
    sub_24A6AE5E0(&qword_2697AF588);
    sub_24A6D44AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF5A0);
  }
  return result;
}

unint64_t sub_24A6D44AC()
{
  unint64_t result = qword_2697AF5A8;
  if (!qword_2697AF5A8)
  {
    sub_24A6AE5E0(&qword_2697AF570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF5A8);
  }
  return result;
}

uint64_t sub_24A6D4508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D451C);
}

uint64_t sub_24A6D451C(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 48);
  return v5(a1, a2, Entity);
}

uint64_t sub_24A6D4588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D459C);
}

uint64_t sub_24A6D459C(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 56);
  return v5(a1, a2, a2, Entity);
}

uint64_t sub_24A6D460C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t ScheduledQuerySnippetView.init(query:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A6B306C(a1, a2);
}

uint64_t ScheduledQuerySnippetView.query.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6B30D0(v1, a1);
}

uint64_t ScheduledQuerySnippetView.query.setter(uint64_t a1)
{
  return sub_24A6D464C(a1, v1);
}

uint64_t sub_24A6D464C(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 40))(a2, a1, Entity);
  return a2;
}

uint64_t (*ScheduledQuerySnippetView.query.modify())()
{
  return nullsub_1;
}

uint64_t ScheduledQuerySnippetView.body.getter()
{
  uint64_t v1 = sub_24A6AE628(&qword_2697AF5C0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_24A6DB200();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = sub_24A6AE628(&qword_2697AF5C8);
  sub_24A6B30D0(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_24A6DB230();
  sub_24A6D47A4();
  sub_24A6DB340();
  return sub_24A6D4800((uint64_t)v3);
}

unint64_t sub_24A6D47A4()
{
  unint64_t result = qword_2697AF5D0;
  if (!qword_2697AF5D0)
  {
    sub_24A6AE5E0(&qword_2697AF5C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF5D0);
  }
  return result;
}

uint64_t sub_24A6D4800(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF5C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6D4860()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6D487C()
{
  uint64_t v1 = sub_24A6AE628(&qword_2697AF5C0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_24A6DB200();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = sub_24A6AE628(&qword_2697AF5C8);
  sub_24A6B30D0(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_24A6DB230();
  sub_24A6D47A4();
  sub_24A6DB340();
  return sub_24A6D4800((uint64_t)v3);
}

uint64_t getEnumTagSinglePayload for ScheduledQuerySnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D4964);
}

uint64_t sub_24A6D4964(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 48);
  return v5(a1, a2, Entity);
}

uint64_t storeEnumTagSinglePayload for ScheduledQuerySnippetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D49E4);
}

uint64_t sub_24A6D49E4(uint64_t a1, uint64_t a2)
{
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(Entity - 8) + 56);
  return v5(a1, a2, a2, Entity);
}

uint64_t type metadata accessor for ScheduledQuerySnippetView()
{
  uint64_t result = qword_2697AF5D8;
  if (!qword_2697AF5D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6D4AA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t ScheduledQueryView.init(triggerParameters:displayRepresentation:showDetail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t View = type metadata accessor for ScheduledQueryView(0);
  uint64_t v10 = a4 + *(int *)(View + 20);
  uint64_t v11 = sub_24A6DAB40();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  *(unsigned char *)(a4 + *(int *)(View + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for ScheduledQueryView(uint64_t a1)
{
  return sub_24A6D360C(a1, (uint64_t *)&unk_2697AF5F0);
}

uint64_t ScheduledQueryView.body.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_24A6DB150();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_24A6AE628(&qword_2697AF5E8);
  return sub_24A6D4C38(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_24A6D4C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AF680);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = sub_24A6DB3A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6DAE30();
  sub_24A6DB390();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
  uint64_t v14 = sub_24A6DB3B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_24A6DB3D0();
  sub_24A6DB130();
  uint64_t v15 = v24;
  LOBYTE(v13) = v25;
  uint64_t v16 = v26;
  LOBYTE(v11) = v27;
  uint64_t v17 = v29;
  uint64_t v23 = v28;
  *(void *)uint64_t v9 = sub_24A6DB210();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v18 = sub_24A6AE628(&qword_2697AF688);
  sub_24A6D4EFC(a1, (uint64_t *)&v9[*(int *)(v18 + 44)]);
  sub_24A6D7594((uint64_t)v9, (uint64_t)v7, &qword_2697AF680);
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = (_BYTE)v13;
  *(void *)(a2 + 40) = v16;
  *(unsigned char *)(a2 + 48) = v11;
  *(void *)(a2 + 56) = v23;
  *(void *)(a2 + 64) = v17;
  uint64_t v19 = sub_24A6AE628(&qword_2697AF690);
  sub_24A6D7594((uint64_t)v7, a2 + *(int *)(v19 + 48), &qword_2697AF680);
  uint64_t v20 = a2 + *(int *)(v19 + 64);
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  swift_retain();
  sub_24A6AE66C((uint64_t)v9, &qword_2697AF680);
  sub_24A6AE66C((uint64_t)v7, &qword_2697AF680);
  return swift_release();
}

uint64_t sub_24A6D4EE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A6D4EFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v3 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v3 - 8);
  long long v56 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24A6AE628(&qword_2697AF698);
  MEMORY[0x270FA5388](v61);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for ScheduledQueryView.SubtitleView(0);
  MEMORY[0x270FA5388](v62);
  long long v55 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A6AE628(&qword_2697AF6A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v64 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (char *)&v52 - v11;
  uint64_t v12 = sub_24A6DACC0();
  uint64_t v53 = *(void *)(v12 - 8);
  uint64_t v54 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t View = type metadata accessor for ScheduledQueryView(0);
  sub_24A6DAB10();
  uint64_t v17 = sub_24A6DB300();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_24A6DB250();
  uint64_t v22 = sub_24A6DB2A0();
  uint64_t v58 = v23;
  uint64_t v59 = v22;
  int v57 = v24;
  uint64_t v60 = v25;
  swift_release();
  sub_24A6C426C(v17, v19, v21);
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a1 + *(int *)(View + 24)) == 1)
  {
    uint64_t v26 = (uint64_t)v55;
    sub_24A6DAB30();
    uint64_t v27 = v26 + *(int *)(v62 + 20);
    uint64_t v28 = sub_24A6DAE60();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v27, a1, v28);
    sub_24A6D75F8(v26, (uint64_t)v6, type metadata accessor for ScheduledQueryView.SubtitleView);
    swift_storeEnumTagMultiPayload();
    sub_24A6D753C();
    uint64_t v29 = (uint64_t)v63;
    sub_24A6DB220();
    sub_24A6D7660(v26, type metadata accessor for ScheduledQueryView.SubtitleView);
  }
  else
  {
    uint64_t v30 = (uint64_t)v56;
    sub_24A6DAB30();
    uint64_t v32 = v53;
    uint64_t v31 = v54;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v30, 1, v54) == 1)
    {
      sub_24A6DAC90();
      sub_24A6AE66C(v30, &qword_2697AF018);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v15, v30, v31);
    }
    uint64_t v33 = sub_24A6DB300();
    uint64_t v35 = v34;
    char v37 = v36 & 1;
    sub_24A6DB260();
    uint64_t v38 = sub_24A6DB2A0();
    uint64_t v40 = v39;
    char v42 = v41;
    uint64_t v44 = v43;
    swift_release();
    sub_24A6C426C(v33, v35, v37);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v6 = v38;
    *((void *)v6 + 1) = v40;
    v6[16] = v42 & 1;
    *((void *)v6 + 3) = v44;
    swift_storeEnumTagMultiPayload();
    sub_24A6D753C();
    uint64_t v29 = (uint64_t)v63;
    sub_24A6DB220();
  }
  char v45 = v57 & 1;
  uint64_t v46 = v64;
  sub_24A6D7594(v29, v64, &qword_2697AF6A0);
  char v47 = v65;
  uint64_t v49 = v58;
  uint64_t v48 = v59;
  *uint64_t v65 = v59;
  v47[1] = v49;
  *((unsigned char *)v47 + 16) = v45;
  v47[3] = v60;
  uint64_t v50 = sub_24A6AE628(&qword_2697AF6B0);
  sub_24A6D7594(v46, (uint64_t)v47 + *(int *)(v50 + 48), &qword_2697AF6A0);
  sub_24A6C48FC(v48, v49, v45);
  swift_bridgeObjectRetain();
  sub_24A6AE66C(v29, &qword_2697AF6A0);
  sub_24A6AE66C(v46, &qword_2697AF6A0);
  sub_24A6C426C(v48, v49, v45);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6D5450@<X0>(uint64_t a1@<X8>)
{
  uint64_t v100 = a1;
  uint64_t v98 = sub_24A6AE628(&qword_2697AF628);
  MEMORY[0x270FA5388](v98);
  BOOL v99 = &v87[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v94 = sub_24A6AE628(&qword_2697AF630);
  MEMORY[0x270FA5388](v94);
  unsigned int v96 = &v87[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v92 = sub_24A6DB140();
  MEMORY[0x270FA5388](v92);
  uint64_t v95 = &v87[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_24A6AE628(&qword_2697AF018);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = &v87[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  unint64_t v90 = &v87[-v9];
  uint64_t v10 = sub_24A6DACC0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v87[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = &v87[-v15];
  uint64_t v17 = sub_24A6DB1C0();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v97 = sub_24A6AE628(&qword_2697AF638);
  uint64_t v18 = MEMORY[0x270FA5388](v97);
  uint64_t v91 = &v87[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v93 = &v87[-v20];
  uint64_t v21 = sub_24A6DAE60();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  int v24 = &v87[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = type metadata accessor for ScheduledQueryView.SubtitleView(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v22 + 16))(v24, v1 + *(int *)(v25 + 20), v21);
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v22 + 88))(v24, v21) == *MEMORY[0x263F332B8])
  {
    (*(void (**)(unsigned char *, uint64_t))(v22 + 96))(v24, v21);
    LODWORD(v89) = v24[40];
    swift_bridgeObjectRelease();
    sub_24A6DB1B0();
    sub_24A6DB1A0();
    sub_24A6DB390();
    sub_24A6DB180();
    swift_release();
    sub_24A6DB1A0();
    uint64_t v26 = v90;
    sub_24A6D7594(v1, (uint64_t)v90, &qword_2697AF018);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v26, 1, v10) == 1)
    {
      sub_24A6DAC90();
      sub_24A6AE66C((uint64_t)v26, &qword_2697AF018);
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32))(v16, v26, v10);
    }
    sub_24A6DB170();
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v16, v10);
    sub_24A6DB1A0();
    sub_24A6DB1E0();
    uint64_t v27 = sub_24A6DB2F0();
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    sub_24A6DB260();
    uint64_t v32 = sub_24A6DB2A0();
    uint64_t v34 = v33;
    char v36 = v35;
    swift_release();
    char v37 = v36 & 1;
    sub_24A6C426C(v27, v29, v31);
    swift_bridgeObjectRelease();
    uint64_t v38 = sub_24A6DB290();
    uint64_t v40 = v39;
    char v42 = v41;
    sub_24A6C426C(v32, v34, v37);
    swift_bridgeObjectRelease();
    if (v89) {
      sub_24A6DB360();
    }
    else {
      sub_24A6DB370();
    }
    uint64_t v55 = sub_24A6DB280();
    uint64_t v89 = v56;
    unint64_t v90 = v57;
    char v59 = v58;
    swift_release();
    char v60 = v59 & 1;
    sub_24A6C426C(v38, v40, v42 & 1);
    swift_bridgeObjectRelease();
    int v88 = sub_24A6DB230();
    sub_24A6DB120();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v68 = v67;
    id v69 = objc_msgSend(self, sel_systemGray5Color);
    uint64_t v70 = MEMORY[0x24C5CBB40](v69);
    char v71 = sub_24A6DB230();
    uint64_t v72 = v95;
    char v73 = &v95[*(int *)(v92 + 20)];
    uint64_t v74 = *MEMORY[0x263F19860];
    uint64_t v75 = sub_24A6DB1F0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104))(v73, v74, v75);
    __asm { FMOV            V0.2D, #4.0 }
    _OWORD *v72 = _Q0;
    uint64_t v81 = (uint64_t (*)(void))MEMORY[0x263F19048];
    char v82 = v96;
    sub_24A6D75F8((uint64_t)v72, (uint64_t)v96, MEMORY[0x263F19048]);
    *(_WORD *)&v82[*(int *)(v94 + 36)] = 256;
    uint64_t v83 = (uint64_t)v91;
    sub_24A6D7594((uint64_t)v82, (uint64_t)&v91[*(int *)(v97 + 36)], &qword_2697AF630);
    uint64_t v84 = v89;
    *(void *)uint64_t v83 = v55;
    *(void *)(v83 + 8) = v84;
    LOBYTE(v74) = v60;
    *(unsigned char *)(v83 + 16) = v60;
    *(void *)(v83 + 24) = v90;
    *(unsigned char *)(v83 + 32) = v88;
    *(void *)(v83 + 40) = v62;
    *(void *)(v83 + 48) = v64;
    *(void *)(v83 + 56) = v66;
    *(void *)(v83 + 64) = v68;
    *(unsigned char *)(v83 + 72) = 0;
    *(void *)(v83 + 80) = v70;
    *(unsigned char *)(v83 + 88) = v71;
    uint64_t v85 = v84;
    sub_24A6C48FC(v55, v84, v74);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24A6AE66C((uint64_t)v82, &qword_2697AF630);
    sub_24A6D7660((uint64_t)v72, v81);
    sub_24A6C426C(v55, v85, v74);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v86 = v93;
    sub_24A6D74D4(v83, (uint64_t)v93);
    sub_24A6D7594((uint64_t)v86, (uint64_t)v99, &qword_2697AF638);
    swift_storeEnumTagMultiPayload();
    sub_24A6D7320();
    sub_24A6DB220();
    return sub_24A6AE66C((uint64_t)v86, &qword_2697AF638);
  }
  else
  {
    sub_24A6D7594(v1, (uint64_t)v8, &qword_2697AF018);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
    {
      sub_24A6DAC90();
      sub_24A6AE66C((uint64_t)v8, &qword_2697AF018);
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32))(v14, v8, v10);
    }
    uint64_t v43 = sub_24A6DB300();
    uint64_t v45 = v44;
    char v47 = v46 & 1;
    sub_24A6DB260();
    uint64_t v95 = (unsigned char *)sub_24A6DB2A0();
    unsigned int v96 = v48;
    uint64_t v50 = v49;
    char v52 = v51;
    swift_release();
    sub_24A6C426C(v43, v45, v47);
    swift_bridgeObjectRelease();
    uint64_t v53 = v99;
    *BOOL v99 = v95;
    v53[1] = v50;
    *((unsigned char *)v53 + 16) = v52 & 1;
    v53[3] = v96;
    swift_storeEnumTagMultiPayload();
    sub_24A6D7320();
    sub_24A6DB220();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v22 + 8))(v24, v21);
  }
}

uint64_t sub_24A6D5DE4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_24A6DB150();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_24A6AE628(&qword_2697AF5E8);
  return sub_24A6D4C38(v1, a1 + *(int *)(v3 + 44));
}

void *initializeBufferWithCopyOfBuffer for ScheduledQueryView(void *a1, void *a2, uint64_t a3)
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
    uint64_t v7 = sub_24A6DAE60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24A6DAB40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for ScheduledQueryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24A6DAB40();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A6DAB40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A6DAB40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A6DAB40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DAE60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A6DAB40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D6338);
}

uint64_t sub_24A6D6338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DAE60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_24A6DAB40();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
      if (v14 >= 2) {
        return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ScheduledQueryView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D6470);
}

uint64_t sub_24A6D6470(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24A6DAE60();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24A6DAB40();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24A6D6580()
{
  uint64_t result = sub_24A6DAE60();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24A6DAB40();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24A6D6650()
{
  return sub_24A6B36E4(&qword_2697AF600, &qword_2697AF608);
}

uint64_t *sub_24A6D668C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24A6DACC0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_24A6AE628(&qword_2697AF018);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_24A6DAE60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_24A6D6840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6DACC0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_24A6DAE60();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

char *sub_24A6D6940(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_24A6AE628(&qword_2697AF018);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

char *sub_24A6D6AA4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_24A6AE628(&qword_2697AF018);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

char *sub_24A6D6C6C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_24A6AE628(&qword_2697AF018);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_24A6D6DD0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6DACC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_24A6AE628(&qword_2697AF018);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_24A6DAE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_24A6D6F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6D6FAC);
}

uint64_t sub_24A6D6FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A6AE628(&qword_2697AF018);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_24A6DAE60();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_24A6D70A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6D70BC);
}

uint64_t sub_24A6D70BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24A6AE628(&qword_2697AF018);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_24A6DAE60();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for ScheduledQueryView.SubtitleView(uint64_t a1)
{
  return sub_24A6D360C(a1, (uint64_t *)&unk_2697AF610);
}

void sub_24A6D71E4()
{
  sub_24A6D72AC();
  if (v0 <= 0x3F)
  {
    sub_24A6DAE60();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24A6D72AC()
{
  if (!qword_2697AF620)
  {
    sub_24A6DACC0();
    unint64_t v0 = sub_24A6DB5A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2697AF620);
    }
  }
}

uint64_t sub_24A6D7304()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A6D7320()
{
  unint64_t result = qword_2697AF640;
  if (!qword_2697AF640)
  {
    sub_24A6AE5E0(&qword_2697AF638);
    sub_24A6D73C0();
    sub_24A6B36E4(&qword_2697AF678, &qword_2697AF630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF640);
  }
  return result;
}

unint64_t sub_24A6D73C0()
{
  unint64_t result = qword_2697AF648;
  if (!qword_2697AF648)
  {
    sub_24A6AE5E0(&qword_2697AF650);
    sub_24A6D7460();
    sub_24A6B36E4(&qword_2697AF668, &qword_2697AF670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF648);
  }
  return result;
}

unint64_t sub_24A6D7460()
{
  unint64_t result = qword_2697AF658;
  if (!qword_2697AF658)
  {
    sub_24A6AE5E0(&qword_2697AF660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF658);
  }
  return result;
}

uint64_t sub_24A6D74D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6AE628(&qword_2697AF638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A6D753C()
{
  unint64_t result = qword_2697AF6A8;
  if (!qword_2697AF6A8)
  {
    type metadata accessor for ScheduledQueryView.SubtitleView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF6A8);
  }
  return result;
}

uint64_t sub_24A6D7594(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_24A6AE628(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A6D75F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A6D7660(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A6D76C4()
{
  unint64_t result = qword_2697AF6B8;
  if (!qword_2697AF6B8)
  {
    sub_24A6AE5E0(&qword_2697AF6C0);
    sub_24A6D7320();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF6B8);
  }
  return result;
}

uint64_t static ShortcutsRunScheduledQueryIntent.createIntentWithGeneratedIdentifier()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24A6DAB90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v44 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v43 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v10 - 8);
  char v42 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24A6DACC0();
  uint64_t v39 = *(void *)(v12 - 8);
  uint64_t v40 = v12;
  MEMORY[0x270FA5388](v12);
  char v41 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_24A6DB110();
  uint64_t v14 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24A6DAD00();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6DACF0();
  uint64_t v45 = sub_24A6DACE0();
  unint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_24A6DB0E0();
  swift_bridgeObjectRetain_n();
  uint64_t v23 = sub_24A6DB100();
  os_log_type_t v24 = sub_24A6DB540();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v36 = v3;
    uint64_t v25 = swift_slowAlloc();
    char v37 = a1;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    char v35 = v5;
    uint64_t v28 = v27;
    uint64_t v47 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_24A6B2A14(v45, v22, &v47);
    uint64_t v3 = v36;
    sub_24A6DB5B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A6AB000, v23, v24, "Create Run Intent with generated query identifier = %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v28;
    uint64_t v5 = v35;
    MEMORY[0x24C5CC2B0](v29, -1, -1);
    char v30 = v26;
    a1 = v37;
    MEMORY[0x24C5CC2B0](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v38);
  sub_24A6AE628(&qword_2697AF178);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v42, 1, 1, v40);
  uint64_t v31 = sub_24A6DB410();
  uint64_t v47 = 0;
  unint64_t v48 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v43, 1, 1, v31);
  uint64_t v32 = sub_24A6DA990();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v44, 1, 1, v32);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263EFBDC8], v2);
  uint64_t v33 = sub_24A6DAA90();
  uint64_t v47 = v45;
  unint64_t v48 = v22;
  swift_retain();
  sub_24A6DAA20();
  uint64_t result = swift_release();
  *a1 = v33;
  return result;
}

uint64_t sub_24A6D7D28(uint64_t a1)
{
  return sub_24A6D7E4C(a1, qword_2697AF6C8);
}

uint64_t static ShortcutsRunScheduledQueryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6D7ED0(&qword_2697AEF40, (uint64_t)qword_2697AF6C8, a1);
}

uint64_t static ShortcutsRunScheduledQueryIntent.title.setter(uint64_t a1)
{
  return sub_24A6D7F9C(a1, &qword_2697AEF40, (uint64_t)qword_2697AF6C8);
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.title.modify())()
{
  if (qword_2697AEF40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF6C8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A6D7E28(uint64_t a1)
{
  return sub_24A6D7E4C(a1, qword_2697AF6E0);
}

uint64_t sub_24A6D7E4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24A6DACC0();
  sub_24A6AEB44(v3, a2);
  sub_24A6AEB0C(v3, (uint64_t)a2);
  return sub_24A6DAC90();
}

uint64_t static ShortcutsRunScheduledQueryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A6D7ED0(&qword_2697AEF48, (uint64_t)qword_2697AF6E0, a1);
}

uint64_t sub_24A6D7ED0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24A6DACC0();
  uint64_t v6 = sub_24A6AEB0C(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static ShortcutsRunScheduledQueryIntent.description.setter(uint64_t a1)
{
  return sub_24A6D7F9C(a1, &qword_2697AEF48, (uint64_t)qword_2697AF6E0);
}

uint64_t sub_24A6D7F9C(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24A6DACC0();
  uint64_t v6 = sub_24A6AEB0C(v5, a3);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.description.modify())()
{
  if (qword_2697AEF48 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24A6DACC0();
  sub_24A6AEB0C(v0, (uint64_t)qword_2697AF6E0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.getter()
{
  sub_24A6DAA10();
  return v1;
}

double sub_24A6D8148@<D0>(_OWORD *a1@<X8>)
{
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24A6D8194()
{
  return swift_release();
}

uint64_t ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.setter()
{
  return sub_24A6DAA20();
}

void (*ShortcutsRunScheduledQueryIntent.scheduledQueryIdentifier.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A6DAA00();
  return sub_24A6AF490;
}

uint64_t ShortcutsRunScheduledQueryIntent.$scheduledQueryIdentifier.getter()
{
  return sub_24A6DAA30();
}

uint64_t static ShortcutsRunScheduledQueryIntent.isDiscoverable.getter()
{
  return byte_2697AF6F8;
}

uint64_t static ShortcutsRunScheduledQueryIntent.isDiscoverable.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_2697AF6F8 = a1;
  return result;
}

uint64_t (*static ShortcutsRunScheduledQueryIntent.isDiscoverable.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ShortcutsRunScheduledQueryIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_24A6DAB90();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A6AE628(&qword_2697AF008);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A6AE628(&qword_2697AF010);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A6AE628(&qword_2697AF018);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24A6DACC0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  sub_24A6AE628(&qword_2697AF178);
  sub_24A6DAC90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  uint64_t v16 = sub_24A6DB410();
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  uint64_t v17 = sub_24A6DA990();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263EFBDC8], v1);
  uint64_t result = sub_24A6DAA90();
  *uint64_t v20 = result;
  return result;
}

uint64_t ShortcutsRunScheduledQueryIntent.perform()(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = type metadata accessor for ScheduledQueryErrorView(0);
  v2[21] = swift_task_alloc();
  v2[22] = type metadata accessor for ScheduledQuerySnippetView();
  v2[23] = swift_task_alloc();
  uint64_t v3 = sub_24A6DA990();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v4 = sub_24A6AE628(&qword_2697AF468);
  v2[27] = v4;
  v2[28] = *(void *)(v4 - 8);
  v2[29] = swift_task_alloc();
  uint64_t v5 = sub_24A6DAB90();
  v2[30] = v5;
  v2[31] = *(void *)(v5 - 8);
  v2[32] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF008);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF018);
  v2[35] = swift_task_alloc();
  uint64_t v6 = sub_24A6DACC0();
  v2[36] = v6;
  v2[37] = *(void *)(v6 - 8);
  v2[38] = swift_task_alloc();
  sub_24A6AE628(&qword_2697AF420);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  uint64_t Entity = type metadata accessor for ScheduledQueryEntity();
  v2[41] = Entity;
  v2[42] = *(void *)(Entity - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  uint64_t v8 = sub_24A6DB110();
  v2[47] = v8;
  v2[48] = *(void *)(v8 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = *v1;
  v2[52] = v9;
  v2[53] = v10;
  return MEMORY[0x270FA2498](sub_24A6D8AA4, 0, 0);
}

uint64_t sub_24A6D8AA4()
{
  uint64_t v28 = v0;
  sub_24A6DB0E0();
  swift_retain_n();
  uint64_t v1 = sub_24A6DB100();
  os_log_type_t v2 = sub_24A6DB540();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v24 = v0[48];
    uint64_t v25 = v0[47];
    uint64_t v26 = v0[52];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v27 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    sub_24A6DAA10();
    swift_release();
    uint64_t v5 = v0[11];
    if (v5) {
      uint64_t v6 = v0[10];
    }
    else {
      uint64_t v6 = 7104878;
    }
    if (v5) {
      unint64_t v7 = v0[11];
    }
    else {
      unint64_t v7 = 0xE300000000000000;
    }
    v0[18] = sub_24A6B2A14(v6, v7, &v27);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24A6AB000, v1, v2, "Perform with query identifier = %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v4, -1, -1);
    MEMORY[0x24C5CC2B0](v3, -1, -1);

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v8(v26, v25);
  }
  else
  {
    uint64_t v9 = v0[52];
    uint64_t v11 = v0[47];
    uint64_t v10 = v0[48];
    swift_release_n();

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v8(v9, v11);
  }
  v0[54] = v8;
  swift_retain();
  sub_24A6DAA10();
  swift_release();
  uint64_t v13 = v0[8];
  uint64_t v12 = v0[9];
  v0[55] = v13;
  v0[56] = v12;
  if (v12)
  {
    sub_24A6AE628(&qword_2697AF708);
    uint64_t inited = swift_initStackObject();
    v0[57] = inited;
    *(_OWORD *)(inited + 16) = xmmword_24A6DBD10;
    *(void *)(inited + 32) = v13;
    *(void *)(inited + 40) = v12;
    swift_bridgeObjectRetain();
    v0[58] = sub_24A6D1990(inited);
    uint64_t v15 = (void *)swift_task_alloc();
    v0[59] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_24A6D8F6C;
    return ScheduledQueryQuery.suggestedEntities()();
  }
  else
  {
    sub_24A6DB0E0();
    uint64_t v17 = sub_24A6DB100();
    os_log_type_t v18 = sub_24A6DB530();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_24A6AB000, v17, v18, "Missing entity identifier = nil", v19, 2u);
      MEMORY[0x24C5CC2B0](v19, -1, -1);
    }
    uint64_t v20 = v0[50];
    uint64_t v21 = v0[47];

    v8(v20, v21);
    sub_24A6ACC7C();
    swift_allocError();
    *(_OWORD *)uint64_t v22 = xmmword_24A6DD060;
    *(unsigned char *)(v22 + 16) = 0;
    swift_willThrow();
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
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_24A6D8F6C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 480) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_24A6D96E0;
  }
  else
  {
    *(void *)(v4 + 488) = a1;
    uint64_t v5 = sub_24A6D909C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A6D909C()
{
  unint64_t v48 = v0;
  uint64_t v1 = sub_24A6D1A28(v0[61], v0[58]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v2 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v4 = v0[40];
  if (*(void *)(v1 + 16))
  {
    sub_24A6B30D0(v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v0[40]);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v5(v4, 0, 1, v2);
  }
  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v5(v0[40], 1, 1, v2);
  }
  uint64_t v6 = v0[41];
  uint64_t v7 = v0[42];
  uint64_t v8 = v0[40];
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_24A6DA5BC(v0[40]);
    sub_24A6DB0E0();
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_24A6DB100();
    os_log_type_t v10 = sub_24A6DB520();
    BOOL v11 = os_log_type_enabled(v9, v10);
    unint64_t v12 = v0[56];
    if (v11)
    {
      uint64_t v13 = v0[55];
      uint64_t v43 = v0[51];
      uint64_t v45 = (void (*)(uint64_t, uint64_t))v0[54];
      uint64_t v42 = v0[47];
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v47 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      v0[17] = sub_24A6B2A14(v13, v12, &v47);
      sub_24A6DB5B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6AB000, v9, v10, "Missing entity identifier = %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CC2B0](v15, -1, -1);
      MEMORY[0x24C5CC2B0](v14, -1, -1);

      v45(v43, v42);
    }
    else
    {
      uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[54];
      uint64_t v29 = v0[51];
      uint64_t v30 = v0[47];

      swift_bridgeObjectRelease_n();
      v28(v29, v30);
    }
    uint64_t v31 = v0[55];
    uint64_t v32 = v0[56];
    sub_24A6ACC7C();
    swift_allocError();
    *(void *)uint64_t v33 = v31;
    *(void *)(v33 + 8) = v32;
    *(unsigned char *)(v33 + 16) = 0;
    swift_willThrow();
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
    uint64_t v34 = (uint64_t (*)(void))v0[1];
    return v34();
  }
  else
  {
    uint64_t v16 = v0[46];
    uint64_t v44 = v0[45];
    uint64_t v46 = v0[44];
    uint64_t v17 = v0[40];
    uint64_t v36 = v0[39];
    uint64_t v18 = v0[37];
    uint64_t v35 = v0[36];
    uint64_t v19 = v0[35];
    uint64_t v37 = v0[34];
    uint64_t v38 = v0[41];
    uint64_t v39 = v0[33];
    uint64_t v20 = v0[31];
    uint64_t v40 = v0[32];
    uint64_t v41 = v0[30];
    uint64_t v21 = v0[24];
    uint64_t v22 = v0[25];
    swift_bridgeObjectRelease();
    sub_24A6B306C(v17, v16);
    sub_24A6AE628(&qword_2697AF428);
    sub_24A6DAC90();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v19, 1, 1, v35);
    v5(v36, 1, 1, v38);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    v23(v37, 1, 1, v21);
    v23(v39, 1, 1, v21);
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v40, *MEMORY[0x263EFBDC8], v41);
    sub_24A6DA61C((unint64_t *)&qword_2697AF098, (void (*)(uint64_t))type metadata accessor for ScheduledQueryEntity);
    uint64_t v24 = sub_24A6DAA50();
    v0[62] = v24;
    sub_24A6B30D0(v16, v44);
    sub_24A6B30D0(v44, v46);
    sub_24A6DAA20();
    sub_24A6DA664(v44, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
    v0[16] = v24;
    uint64_t v25 = (void *)swift_task_alloc();
    v0[63] = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_24A6D9854;
    uint64_t v26 = v0[29];
    return RunScheduledQueryIntent.perform()(v26);
  }
}

uint64_t sub_24A6D96E0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A6D9854()
{
  *(void *)(*(void *)v1 + 512) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24A6D9DAC;
  }
  else {
    uint64_t v2 = sub_24A6D9968;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A6D9968()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[38];
  uint64_t v4 = v0[36];
  uint64_t v8 = v0[45];
  sub_24A6DAE40();
  sub_24A6DACB0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_24A6DB4A0();
  sub_24A6B36E4(&qword_2697AF718, &qword_2697AF468);
  sub_24A6DA9D0();
  sub_24A6DB4A0();
  swift_bridgeObjectRelease();
  sub_24A6DA980();
  sub_24A6B30D0(v1, v8);
  sub_24A6DB500();
  v0[65] = sub_24A6DB4F0();
  uint64_t v6 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6D9B0C, v6, v5);
}

uint64_t sub_24A6D9B0C()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 184);
  swift_release();
  sub_24A6B306C(v1, v2);
  return MEMORY[0x270FA2498](sub_24A6D9B88, 0, 0);
}

uint64_t sub_24A6D9B88()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  sub_24A6DA61C(&qword_2697AF070, (void (*)(uint64_t))type metadata accessor for ScheduledQuerySnippetView);
  sub_24A6DA9C0();
  swift_release();
  sub_24A6DA664(v4, (uint64_t (*)(void))type metadata accessor for ScheduledQuerySnippetView);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = v0[46];
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  sub_24A6DA664(v5, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
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
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24A6D9DAC()
{
  uint64_t v32 = v0;
  uint64_t v1 = (void *)v0[64];
  uint64_t v2 = v0[46];
  uint64_t v3 = v0[43];
  sub_24A6DB0E0();
  sub_24A6B30D0(v2, v3);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_24A6DB100();
  os_log_type_t v7 = sub_24A6DB520();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[64];
    uint64_t v29 = v0[49];
    uint64_t v30 = (void (*)(uint64_t, uint64_t))v0[54];
    uint64_t v28 = v0[47];
    uint64_t v9 = v0[43];
    uint64_t v10 = swift_slowAlloc();
    BOOL v11 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v31 = v27;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = *(void *)(v9 + 16);
    unint64_t v13 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain();
    v0[14] = sub_24A6B2A14(v12, v13, &v31);
    sub_24A6DB5B0();
    swift_bridgeObjectRelease();
    sub_24A6DA664(v9, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
    *(_WORD *)(v10 + 12) = 2112;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v15;
    sub_24A6DB5B0();
    *BOOL v11 = v15;

    _os_log_impl(&dword_24A6AB000, v6, v7, "Failed to run scheduled query %s: %@", (uint8_t *)v10, 0x16u);
    sub_24A6AE628(&qword_2697AF060);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C5CC2B0](v27, -1, -1);
    MEMORY[0x24C5CC2B0](v10, -1, -1);

    v30(v29, v28);
  }
  else
  {
    uint64_t v16 = (void *)v0[64];
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[54];
    uint64_t v18 = v0[49];
    uint64_t v19 = v0[47];
    sub_24A6DA664(v0[43], (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);

    v17(v18, v19);
  }
  uint64_t v20 = (void *)v0[64];
  uint64_t v22 = v0[45];
  uint64_t v21 = v0[46];
  sub_24A6DA980();
  sub_24A6B30D0(v21, v22);
  sub_24A6DB500();
  id v23 = v20;
  v0[66] = sub_24A6DB4F0();
  uint64_t v25 = sub_24A6DB4E0();
  return MEMORY[0x270FA2498](sub_24A6DA10C, v25, v24);
}

uint64_t sub_24A6DA10C()
{
  uint64_t v1 = v0[64];
  uint64_t v2 = v0[45];
  uint64_t v4 = v0[20];
  uint64_t v3 = v0[21];
  swift_release();
  sub_24A6B306C(v2, v3);
  *(void *)(v3 + *(int *)(v4 + 20)) = v1;
  return MEMORY[0x270FA2498](sub_24A6DA19C, 0, 0);
}

uint64_t sub_24A6DA19C()
{
  uint64_t v1 = (void *)v0[64];
  uint64_t v2 = v0[21];
  sub_24A6DA61C(&qword_2697AF710, (void (*)(uint64_t))type metadata accessor for ScheduledQueryErrorView);
  sub_24A6DA9C0();

  swift_release();
  sub_24A6DA664(v2, type metadata accessor for ScheduledQueryErrorView);
  uint64_t v3 = v0[46];
  (*(void (**)(void))(v0[25] + 8))();
  sub_24A6DA664(v3, (uint64_t (*)(void))type metadata accessor for ScheduledQueryEntity);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24A6DA3AC()
{
  sub_24A6DAA10();
  return v1;
}

uint64_t sub_24A6DA3E0@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697AEF40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A6DACC0();
  uint64_t v3 = sub_24A6AEB0C(v2, (uint64_t)qword_2697AF6C8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A6DA4A0()
{
  return byte_2697AF6F8;
}

uint64_t sub_24A6DA4E4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A6AE440;
  return ShortcutsRunScheduledQueryIntent.perform()(a1);
}

uint64_t sub_24A6DA580(uint64_t a1)
{
  unint64_t v2 = sub_24A6DA6C8();
  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_24A6DA5BC(uint64_t a1)
{
  uint64_t v2 = sub_24A6AE628(&qword_2697AF420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A6DA61C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A6DA664(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A6DA6C8()
{
  unint64_t result = qword_2697AF720;
  if (!qword_2697AF720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF720);
  }
  return result;
}

unint64_t sub_24A6DA720()
{
  unint64_t result = qword_2697AF728;
  if (!qword_2697AF728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF728);
  }
  return result;
}

unint64_t sub_24A6DA778()
{
  unint64_t result = qword_2697AF730;
  if (!qword_2697AF730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697AF730);
  }
  return result;
}

uint64_t sub_24A6DA7CC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_24A6DA800()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for ShortcutsRunScheduledQueryIntent()
{
  return &type metadata for ShortcutsRunScheduledQueryIntent;
}

uint64_t sub_24A6DA868()
{
  return sub_24A6B36E4(&qword_2697AF2E0, &qword_2697AF2E8);
}

uint64_t sub_24A6DA8A4()
{
  return sub_24A6B36E4(&qword_2697AF2F0, &qword_2697AF2E8);
}

uint64_t sub_24A6DA8E0()
{
  return MEMORY[0x270EE0A98]();
}

uint64_t sub_24A6DA900()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_24A6DA910()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_24A6DA920()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_24A6DA930()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_24A6DA950()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_24A6DA980()
{
  return MEMORY[0x270EE0E68]();
}

uint64_t sub_24A6DA990()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_24A6DA9A0()
{
  return MEMORY[0x270EE0E98]();
}

uint64_t sub_24A6DA9B0()
{
  return MEMORY[0x270F07DD0]();
}

uint64_t sub_24A6DA9C0()
{
  return MEMORY[0x270F07DD8]();
}

uint64_t sub_24A6DA9D0()
{
  return MEMORY[0x270EE0F48]();
}

uint64_t sub_24A6DA9E0()
{
  return MEMORY[0x270EE0F98]();
}

uint64_t sub_24A6DA9F0()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_24A6DAA00()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_24A6DAA10()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_24A6DAA20()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_24A6DAA30()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_24A6DAA40()
{
  return MEMORY[0x270EE1208]();
}

uint64_t sub_24A6DAA50()
{
  return MEMORY[0x270EE1270]();
}

uint64_t sub_24A6DAA60()
{
  return MEMORY[0x270EE12B0]();
}

uint64_t sub_24A6DAA70()
{
  return MEMORY[0x270EE12B8]();
}

uint64_t sub_24A6DAA80()
{
  return MEMORY[0x270EE12D0]();
}

uint64_t sub_24A6DAA90()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_24A6DAAA0()
{
  return MEMORY[0x270EE1308]();
}

uint64_t sub_24A6DAAB0()
{
  return MEMORY[0x270EE1330]();
}

uint64_t sub_24A6DAAC0()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_24A6DAAD0()
{
  return MEMORY[0x270EE1590]();
}

uint64_t sub_24A6DAAE0()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_24A6DAAF0()
{
  return MEMORY[0x270EE18D8]();
}

uint64_t sub_24A6DAB00()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_24A6DAB10()
{
  return MEMORY[0x270EE1920]();
}

uint64_t sub_24A6DAB20()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_24A6DAB30()
{
  return MEMORY[0x270EE1948]();
}

uint64_t sub_24A6DAB40()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_24A6DAB50()
{
  return MEMORY[0x270EE19C8]();
}

uint64_t sub_24A6DAB60()
{
  return MEMORY[0x270EE19E8]();
}

uint64_t sub_24A6DAB80()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_24A6DAB90()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_24A6DABA0()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_24A6DABB0()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_24A6DABC0()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_24A6DABE0()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_24A6DABF0()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_24A6DAC00()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_24A6DAC10()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24A6DAC20()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_24A6DAC30()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_24A6DAC40()
{
  return MEMORY[0x270EEE6E8]();
}

uint64_t sub_24A6DAC50()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24A6DAC60()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24A6DAC70()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24A6DAC80()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24A6DAC90()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_24A6DACA0()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_24A6DACB0()
{
  return MEMORY[0x270EEF898]();
}

uint64_t sub_24A6DACC0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24A6DACD0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A6DACE0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24A6DACF0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24A6DAD00()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A6DAD10()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_24A6DAD20()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24A6DAD30()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24A6DAD40()
{
  return MEMORY[0x270F41250]();
}

uint64_t sub_24A6DAD50()
{
  return MEMORY[0x270F41518]();
}

uint64_t sub_24A6DAD60()
{
  return MEMORY[0x270F41550]();
}

uint64_t sub_24A6DAD80()
{
  return MEMORY[0x270F18420]();
}

uint64_t sub_24A6DAD90()
{
  return MEMORY[0x270F18428]();
}

uint64_t sub_24A6DADA0()
{
  return MEMORY[0x270F18430]();
}

uint64_t sub_24A6DADB0()
{
  return MEMORY[0x270F18438]();
}

uint64_t sub_24A6DADC0()
{
  return MEMORY[0x270F18440]();
}

uint64_t sub_24A6DADD0()
{
  return MEMORY[0x270F18448]();
}

uint64_t sub_24A6DADE0()
{
  return MEMORY[0x270F18450]();
}

uint64_t sub_24A6DADF0()
{
  return MEMORY[0x270F18458]();
}

uint64_t sub_24A6DAE00()
{
  return MEMORY[0x270F18460]();
}

uint64_t sub_24A6DAE10()
{
  return MEMORY[0x270F18468]();
}

uint64_t sub_24A6DAE20()
{
  return MEMORY[0x270F18470]();
}

uint64_t sub_24A6DAE30()
{
  return MEMORY[0x270F18478]();
}

uint64_t sub_24A6DAE40()
{
  return MEMORY[0x270F18480]();
}

uint64_t sub_24A6DAE50()
{
  return MEMORY[0x270F18488]();
}

uint64_t sub_24A6DAE60()
{
  return MEMORY[0x270F18490]();
}

uint64_t sub_24A6DAE70()
{
  return MEMORY[0x270F18498]();
}

uint64_t sub_24A6DAE80()
{
  return MEMORY[0x270F184A0]();
}

uint64_t sub_24A6DAE90()
{
  return MEMORY[0x270F184A8]();
}

uint64_t sub_24A6DAEA0()
{
  return MEMORY[0x270F184B0]();
}

uint64_t sub_24A6DAEB0()
{
  return MEMORY[0x270F184B8]();
}

uint64_t sub_24A6DAEC0()
{
  return MEMORY[0x270F184C0]();
}

uint64_t sub_24A6DAED0()
{
  return MEMORY[0x270F184C8]();
}

uint64_t sub_24A6DAF60()
{
  return MEMORY[0x270F18510]();
}

uint64_t sub_24A6DAF70()
{
  return MEMORY[0x270F18518]();
}

uint64_t sub_24A6DAF80()
{
  return MEMORY[0x270F18520]();
}

uint64_t sub_24A6DAF90()
{
  return MEMORY[0x270F18528]();
}

uint64_t sub_24A6DAFA0()
{
  return MEMORY[0x270F18530]();
}

uint64_t sub_24A6DAFB0()
{
  return MEMORY[0x270F18538]();
}

uint64_t sub_24A6DAFC0()
{
  return MEMORY[0x270F18550]();
}

uint64_t sub_24A6DAFD0()
{
  return MEMORY[0x270F18558]();
}

uint64_t sub_24A6DAFE0()
{
  return MEMORY[0x270F18560]();
}

uint64_t sub_24A6DB000()
{
  return MEMORY[0x270F3EFD0]();
}

uint64_t sub_24A6DB010()
{
  return MEMORY[0x270F3EFD8]();
}

uint64_t sub_24A6DB020()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_24A6DB030()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_24A6DB040()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24A6DB050()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_24A6DB060()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_24A6DB070()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_24A6DB080()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_24A6DB090()
{
  return MEMORY[0x270FA2DA8]();
}

uint64_t sub_24A6DB0A0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_24A6DB0B0()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_24A6DB0C0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_24A6DB0D0()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_24A6DB0E0()
{
  return MEMORY[0x270F18578]();
}

uint64_t sub_24A6DB0F0()
{
  return MEMORY[0x270F18580]();
}

uint64_t sub_24A6DB100()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A6DB110()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A6DB120()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24A6DB130()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24A6DB140()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24A6DB150()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24A6DB160()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24A6DB170()
{
  return MEMORY[0x270F01208]();
}

uint64_t sub_24A6DB180()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_24A6DB190()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_24A6DB1A0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24A6DB1B0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24A6DB1C0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24A6DB1D0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24A6DB1E0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24A6DB1F0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24A6DB200()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24A6DB210()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24A6DB220()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24A6DB230()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24A6DB240()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24A6DB250()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24A6DB260()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24A6DB270()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_24A6DB280()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24A6DB290()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_24A6DB2A0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24A6DB2B0()
{
  return MEMORY[0x270F03180]();
}

uint64_t sub_24A6DB2C0()
{
  return MEMORY[0x270F03188]();
}

uint64_t sub_24A6DB2D0()
{
  return MEMORY[0x270F031A0]();
}

uint64_t sub_24A6DB2E0()
{
  return MEMORY[0x270F03218]();
}

uint64_t sub_24A6DB2F0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24A6DB300()
{
  return MEMORY[0x270F03248]();
}

uint64_t sub_24A6DB310()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24A6DB320()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24A6DB330()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24A6DB340()
{
  return MEMORY[0x270F035F0]();
}

uint64_t sub_24A6DB350()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24A6DB360()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_24A6DB370()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_24A6DB380()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24A6DB390()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24A6DB3A0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24A6DB3B0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24A6DB3C0()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24A6DB3D0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24A6DB3E0()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_24A6DB3F0()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_24A6DB400()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24A6DB410()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_24A6DB420()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24A6DB430()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24A6DB440()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24A6DB450()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24A6DB460()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A6DB470()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A6DB480()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_24A6DB490()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A6DB4A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A6DB4B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A6DB4C0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24A6DB4D0()
{
  return MEMORY[0x270EE1F10]();
}

uint64_t sub_24A6DB4E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24A6DB4F0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24A6DB500()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24A6DB510()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24A6DB520()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A6DB530()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24A6DB540()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A6DB550()
{
  return MEMORY[0x270F18590]();
}

uint64_t sub_24A6DB560()
{
  return MEMORY[0x270F18598]();
}

uint64_t sub_24A6DB570()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_24A6DB580()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_24A6DB590()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_24A6DB5A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24A6DB5B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A6DB5C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A6DB5D0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_24A6DB5E0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24A6DB5F0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24A6DB600()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A6DB610()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A6DB620()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A6DB630()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A6DB640()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24A6DB650()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A6DB660()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24A6DB690()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A6DB6A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A6DB6B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A6DB6C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A6DB6D0()
{
  return MEMORY[0x270F9FC90]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}