uint64_t sub_254EBF748()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70988);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_254ED2200;
  *(_OWORD *)(inited + 32) = xmmword_254ED2210;
  *(void *)(inited + 48) = 0xE400000000000000;
  *(_OWORD *)(inited + 56) = xmmword_254ED2220;
  *(void *)(inited + 72) = 0xE400000000000000;
  *(_OWORD *)(inited + 80) = xmmword_254ED2230;
  *(void *)(inited + 96) = 0xE600000000000000;
  *(_OWORD *)(inited + 104) = xmmword_254ED2240;
  *(void *)(inited + 120) = 0xE300000000000000;
  *(_OWORD *)(inited + 128) = xmmword_254ED2250;
  *(void *)(inited + 144) = 0xE700000000000000;
  v1 = sub_254ECED64((void *)inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70990);
  result = swift_arrayDestroy();
  qword_269E709E8 = v1;
  return result;
}

unint64_t sub_254EBF830(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708D0);
  uint64_t v2 = sub_254ED1CF0();
  v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_254ECF7D8(v6, (uint64_t)&v15, &qword_269E708E0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_254ECBB9C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_254ECF50C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_254EBF968(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708B0);
  uint64_t v2 = (void *)sub_254ED1CF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_254ECBB9C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_254EBFA84(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  char v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = sub_254ED1CF0();
  uint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_254ECF7D8(v16, (uint64_t)v9, a2);
    unint64_t result = sub_254ECBC14((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = sub_254ED16D0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v20) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t runAnalysisCommand(startDate:endDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v6 = sub_254ED17D0();
  v3[6] = v6;
  v3[7] = *(void *)(v6 - 8);
  v3[8] = swift_task_alloc();
  uint64_t v7 = sub_254ED1790();
  v3[9] = v7;
  v3[10] = *(void *)(v7 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  v3[14] = v8;
  char v9 = (void *)swift_task_alloc();
  v3[15] = v9;
  *char v9 = v3;
  v9[1] = sub_254EBFE08;
  return sub_254EC0698(v8, a2, a3);
}

uint64_t sub_254EBFE08()
{
  v1 = (void *)*v0;
  uint64_t v2 = (void *)*v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[16] = v3;
  void *v3 = v2;
  v3[1] = sub_254EBFF74;
  uint64_t v4 = v1[13];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[4];
  return sub_254EC275C(v4, v6, v5);
}

uint64_t sub_254EBFF74()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_254EC0070, 0, 0);
}

uint64_t sub_254EC0070()
{
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 24);
  *(_DWORD *)(v0 + 184) = *MEMORY[0x263F1BF68];
  uint64_t v5 = *(void (**)(uint64_t))(v2 + 104);
  *(void *)(v0 + 136) = v5;
  *(void *)(v0 + 144) = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v5(v1);
  sub_254EC4460(v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 152) = v6;
  *(void *)(v0 + 160) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_254EC01A4;
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 32);
  uint64_t v10 = *(void *)(v0 + 40);
  return sub_254EC48CC(v8, v9, v10);
}

uint64_t sub_254EC01A4()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_254EC0438;
  }
  else {
    uint64_t v2 = sub_254EC02B8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_254EC02B8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v12 = *(void *)(v0 + 104);
  uint64_t v13 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v8 = *(void *)(v0 + 24);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 136))(v6, *(unsigned int *)(v0 + 184), v7);
  sub_254EC4460(v3);
  v1(v6, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v5);
  v9(v8, v5);
  v9(v12, v5);
  v9(v13, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_254EC0438()
{
  if (qword_269E707A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = sub_254ED1AC0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269E709F0);
  MEMORY[0x25A280D50](v1);
  MEMORY[0x25A280D50](v1);
  uint64_t v3 = sub_254ED1AA0();
  os_log_type_t v4 = sub_254ED1C00();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[22];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x25A280D50](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    sub_254ED1C10();
    *uint64_t v8 = v9;

    _os_log_impl(&dword_254EBE000, v3, v4, "Encountered error when getting life event metrics: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E707E0);
    swift_arrayDestroy();
    MEMORY[0x25A280E30](v8, -1, -1);
    MEMORY[0x25A280E30](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[9];
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0[10] + 8);
  v12(v0[13], v11);
  v12(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_254EC0698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[47] = a2;
  v3[48] = a3;
  v3[46] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70840);
  v3[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70818);
  v3[50] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70820);
  v3[51] = v4;
  v3[52] = *(void *)(v4 - 8);
  v3[53] = swift_task_alloc();
  uint64_t v5 = sub_254ED1790();
  v3[54] = v5;
  v3[55] = *(void *)(v5 - 8);
  v3[56] = swift_task_alloc();
  uint64_t v6 = sub_254ED1720();
  v3[57] = v6;
  v3[58] = *(void *)(v6 - 8);
  v3[59] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70828);
  v3[60] = swift_task_alloc();
  v3[61] = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  v3[62] = swift_task_alloc();
  v3[63] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  v3[64] = v7;
  v3[65] = *(void *)(v7 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  v3[69] = swift_task_alloc();
  uint64_t v8 = sub_254ED16D0();
  v3[70] = v8;
  v3[71] = *(void *)(v8 - 8);
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_254EC0A04, 0, 0);
}

uint64_t sub_254EC0A04()
{
  uint64_t v1 = v0[47];
  id v2 = objc_msgSend(self, sel_defaultManager);
  v0[77] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[78] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[79] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70978);
  *uint64_t v4 = v0;
  v4[1] = sub_254EC0B30;
  return MEMORY[0x270FA2318](v0 + 45, 0, 0, 0xD000000000000025, 0x8000000254ED2CA0, sub_254ECF8E4, v3, v5);
}

uint64_t sub_254EC0B30()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_254EC0C48, 0, 0);
}

uint64_t sub_254EC0C48()
{
  unint64_t v3 = v1[45];
  unint64_t v4 = sub_254EBFA84(MEMORY[0x263F8EE78], &qword_269E70900, &qword_269E708A0);
  unint64_t v5 = v3;
  uint64_t v6 = v4;
  unint64_t v209 = v3;
  if (v3 >> 62) {
    goto LABEL_71;
  }
  uint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (i = v1; v7; i = v1)
  {
    v265 = 0;
    v266 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = v1[71];
    unint64_t v10 = v5 & 0xC000000000000001;
    uint64_t v11 = v1[65];
    unint64_t v205 = v5 + 32;
    uint64_t v206 = v5 & 0xFFFFFFFFFFFFFF8;
    uint64_t v226 = v1[64];
    v258 = (void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    uint64_t v223 = v1[61];
    v225 = (void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
    uint64_t v232 = v9;
    v252 = (void (**)(uint64_t, uint64_t))(v9 + 8);
    uint64_t v216 = v11;
    v246 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    v237 = (void (**)(uint64_t, uint64_t))(v1[58] + 8);
    unint64_t v207 = v5 & 0xC000000000000001;
    uint64_t v208 = v7;
    v248 = (void *)(v11 + 56);
    while (1)
    {
      if (v10)
      {
        unint64_t v12 = v8;
        id v13 = (id)MEMORY[0x25A280930](v8, v5);
      }
      else
      {
        if (v8 >= *(void *)(v206 + 16))
        {
LABEL_198:
          __break(1u);
          goto LABEL_199;
        }
        unint64_t v12 = v8;
        id v13 = *(id *)(v205 + 8 * v8);
      }
      v228[0] = v13;
      BOOL v14 = __OFADD__(v12, 1);
      unint64_t v15 = v12 + 1;
      if (v14) {
        break;
      }
      unint64_t v210 = v15;
      if (qword_269E707A0 != -1) {
        swift_once();
      }
      uint64_t v16 = qword_269E709E8;
      id v17 = objc_msgSend(v228[0], sel_type);
      if (*(void *)(v16 + 16) && (unint64_t v18 = sub_254ECBB30((uint64_t)v17), (v19 & 1) != 0))
      {
        unint64_t v20 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v18);
        unint64_t v21 = v20[1];
        uint64_t v239 = *v20;
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v21 = 0xE700000000000000;
        uint64_t v239 = 0x6E776F6E6B6E75;
      }
      id v22 = objc_msgSend(v228[0], sel_visits);
      sub_254ECFA08(0, &qword_269E70980);
      unint64_t v23 = sub_254ED1B70();

      if (v23 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v2 = sub_254ED1CC0();
        swift_bridgeObjectRelease();
        if (v2)
        {
LABEL_17:
          unint64_t v24 = 0;
          unint64_t v227 = v23 & 0xC000000000000001;
          unint64_t v212 = v23 + 32;
          uint64_t v214 = v23 & 0xFFFFFFFFFFFFFF8;
          uint64_t v267 = v21;
          unint64_t v218 = v23;
          unint64_t v220 = v2;
          while (1)
          {
            if (v227)
            {
              id v25 = (id)MEMORY[0x25A280930](v24, v23);
              BOOL v14 = __OFADD__(v24, 1);
              unint64_t v26 = v24 + 1;
              if (v14) {
                goto LABEL_67;
              }
            }
            else
            {
              if (v24 >= *(void *)(v214 + 16)) {
                goto LABEL_70;
              }
              id v25 = *(id *)(v212 + 8 * v24);
              BOOL v14 = __OFADD__(v24, 1);
              unint64_t v26 = v24 + 1;
              if (v14) {
                goto LABEL_67;
              }
            }
            unint64_t v230 = v26;
            uint64_t v269 = v1[70];
            v27 = v25;
            id v28 = objc_msgSend(v25, sel_entryDate);
            sub_254ED16B0();

            v229 = v27;
            id v29 = objc_msgSend(v27, sel_exitDate);
            sub_254ED16B0();

            sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
            if ((sub_254ED1B00() & 1) == 0) {
              goto LABEL_68;
            }
            uint64_t v269 = v6;
            uint64_t v30 = v1[75];
            uint64_t v31 = v1[70];
            uint64_t v261 = v1[69];
            uint64_t v32 = v1[68];
            uint64_t v34 = v1[62];
            uint64_t v33 = v1[63];
            uint64_t v35 = v33 + *(int *)(v223 + 48);
            v36 = *v258;
            (*v258)(v33, v1[76], v31);
            v36(v35, v30, v31);
            uint64_t v37 = v34 + *(int *)(v223 + 48);
            v36(v34, v33, v31);
            v255 = (void (*)(unint64_t, uint64_t, uint64_t))v36;
            v36(v37, v35, v31);
            v38 = *v225;
            (*v225)(v32, v34, v31);
            v39 = *v252;
            (*v252)(v37, v31);
            uint64_t v40 = v34 + *(int *)(v223 + 48);
            v38(v34, v33, v31);
            v38(v40, v35, v31);
            v38(v32 + *(int *)(v226 + 36), v40, v31);
            v41 = v248;
            v250 = v39;
            v39(v34, v31);
            sub_254ECF63C(v32, v261, &qword_269E70838);
            unint64_t v42 = sub_254EC7CF4(v261);
            sub_254ECF6BC(v261, &qword_269E70838);
            uint64_t v43 = *(void *)(v42 + 16);
            if (v43) {
              break;
            }
            uint64_t v6 = v269;
            unint64_t v23 = v218;
            ((void (*)(void, uint64_t, uint64_t, void))*v248)(v1[60], 1, 1, v1[64]);
LABEL_57:
            uint64_t v92 = v1[76];
            uint64_t v93 = v1[75];
            unint64_t inited = v1[70];

            swift_bridgeObjectRelease();
            v250(v93, inited);
            v250(v92, inited);
            unint64_t v2 = v220;
            unint64_t v24 = v230;
            if (v230 == v220) {
              goto LABEL_58;
            }
          }
          unint64_t v244 = (*(unsigned __int8 *)(v216 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v216 + 80);
          uint64_t v44 = v42 + v244;
          uint64_t v242 = *(void *)(v216 + 72);
          uint64_t v6 = v269;
          while (1)
          {
            uint64_t v45 = v1[64];
            uint64_t v46 = v1[60];
            sub_254ECF7D8(v44, v46, &qword_269E70838);
            v47 = (void (*)(uint64_t, void, uint64_t, uint64_t))*v41;
            ((void (*)(uint64_t, void, uint64_t, uint64_t))*v41)(v46, 0, 1, v45);
            if ((*v246)(v46, 1, v45) == 1)
            {
              unint64_t v23 = v218;
              goto LABEL_57;
            }
            v234 = v47;
            uint64_t v262 = v43;
            uint64_t v48 = v1[74];
            unint64_t inited = v1[73];
            uint64_t v49 = v1[70];
            uint64_t v50 = v1[67];
            uint64_t v51 = v6;
            uint64_t v52 = v1[66];
            uint64_t v53 = v1[59];
            uint64_t v54 = v1[57];
            sub_254ECF63C(v1[60], v50, &qword_269E70838);
            sub_254ED1700();
            sub_254ED16E0();
            (*v237)(v53, v54);
            v255(inited, v48, v49);
            uint64_t v55 = v52;
            uint64_t v6 = v51;
            sub_254ECF7D8(v50, v55, &qword_269E70838);
            swift_bridgeObjectRetain();
            sub_254ECF498((uint64_t)v266);
            int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v2 = sub_254ECBC14(inited);
            uint64_t v58 = *(void *)(v51 + 16);
            BOOL v59 = (v57 & 1) == 0;
            uint64_t v60 = v58 + v59;
            if (__OFADD__(v58, v59)) {
              break;
            }
            char v61 = v57;
            if (*(void *)(v51 + 24) >= v60)
            {
              uint64_t v1 = i;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_254ECD21C(&qword_269E708A0);
                uint64_t v6 = v51;
              }
            }
            else
            {
              uint64_t v1 = i;
              uint64_t v62 = i[73];
              sub_254ECC604(v60, isUniquelyReferenced_nonNull_native, &qword_269E708A0);
              uint64_t v6 = v51;
              unint64_t v63 = sub_254ECBC14(v62);
              if ((v61 & 1) != (v64 & 1)) {
                goto LABEL_179;
              }
              unint64_t v2 = v63;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            if ((v61 & 1) == 0)
            {
              uint64_t v65 = v1[73];
              uint64_t v66 = v1[70];
              unint64_t inited = sub_254EBF968(MEMORY[0x263F8EE78]);
              *(void *)(v6 + 8 * (v2 >> 6) + 64) |= 1 << v2;
              v255(*(void *)(v6 + 48) + *(void *)(v232 + 72) * v2, v65, v66);
              *(void *)(*(void *)(v6 + 56) + 8 * v2) = inited;
              uint64_t v67 = *(void *)(v6 + 16);
              BOOL v14 = __OFADD__(v67, 1);
              uint64_t v68 = v67 + 1;
              if (v14) {
                goto LABEL_65;
              }
              *(void *)(v6 + 16) = v68;
            }
            uint64_t v69 = *(void *)(v6 + 56);
            uint64_t v269 = v6;
            swift_bridgeObjectRelease();
            unint64_t inited = 8 * v2;
            sub_254ECF498((uint64_t)v265);
            uint64_t v6 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v271 = *(void *)(v69 + 8 * v2);
            uint64_t v70 = v271;
            *(void *)(v69 + 8 * v2) = 0x8000000000000000;
            uint64_t v1 = (void *)v239;
            unint64_t v2 = sub_254ECBB9C(v239, v267);
            uint64_t v72 = *(void *)(v271 + 16);
            BOOL v73 = (v71 & 1) == 0;
            uint64_t v74 = v72 + v73;
            if (__OFADD__(v72, v73)) {
              goto LABEL_64;
            }
            char v75 = v71;
            if (*(void *)(v271 + 24) >= v74)
            {
              if ((v6 & 1) == 0)
              {
                sub_254ECD064();
                uint64_t v70 = v271;
              }
            }
            else
            {
              sub_254ECC2EC(v74, v6);
              uint64_t v70 = v271;
              unint64_t v76 = sub_254ECBB9C(v239, v267);
              if ((v75 & 1) != (v77 & 1))
              {
LABEL_179:
                return sub_254ED1D60();
              }
              unint64_t v2 = v76;
            }
            *(void *)(v69 + inited) = v70;
            swift_bridgeObjectRelease();
            v78 = *(void **)(v69 + inited);
            if ((v75 & 1) == 0)
            {
              v78[(v2 >> 6) + 8] |= 1 << v2;
              v79 = (uint64_t *)(v78[6] + 16 * v2);
              uint64_t *v79 = v239;
              v79[1] = v267;
              *(void *)(v78[7] + 8 * v2) = MEMORY[0x263F8EE78];
              uint64_t v80 = v78[2];
              uint64_t v81 = v80 + 1;
              unint64_t inited = __OFADD__(v80, 1);
              swift_bridgeObjectRetain();
              if (inited) {
                goto LABEL_66;
              }
              v78[2] = v81;
            }
            uint64_t v82 = v78[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            unint64_t v83 = *(void *)(v82 + 8 * v2);
            char v84 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)(v82 + 8 * v2) = v83;
            if ((v84 & 1) == 0)
            {
              unint64_t v83 = sub_254ECAFA4(0, *(void *)(v83 + 16) + 1, 1, v83);
              *(void *)(v82 + 8 * v2) = v83;
            }
            unint64_t v86 = *(void *)(v83 + 16);
            unint64_t v85 = *(void *)(v83 + 24);
            if (v86 >= v85 >> 1)
            {
              unint64_t v83 = sub_254ECAFA4(v85 > 1, v86 + 1, 1, v83);
              *(void *)(v82 + 8 * v2) = v83;
            }
            uint64_t v1 = i;
            uint64_t v87 = i[74];
            uint64_t v88 = i[73];
            uint64_t v89 = i[70];
            uint64_t v90 = i[67];
            uint64_t v91 = i[66];
            *(void *)(v83 + 16) = v86 + 1;
            sub_254ECF63C(v91, v83 + v244 + v86 * v242, &qword_269E70838);
            swift_bridgeObjectRelease();
            v250(v88, v89);
            v250(v87, v89);
            sub_254ECF6BC(v90, &qword_269E70838);
            v44 += v242;
            v265 = sub_254EC8754;
            v266 = sub_254EC8724;
            uint64_t v43 = v262 - 1;
            uint64_t v6 = v269;
            v41 = v248;
            if (v262 == 1)
            {
              unint64_t v23 = v218;
              v234(i[60], 1, 1, i[64]);
              goto LABEL_57;
            }
          }
          __break(1u);
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
          break;
        }
      }
      else
      {
        unint64_t v2 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v2) {
          goto LABEL_17;
        }
      }
LABEL_58:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      unint64_t v5 = v209;
      unint64_t v8 = v210;
      unint64_t v10 = v207;
      if (v210 == v208) {
        goto LABEL_73;
      }
    }
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_254ED1CC0();
    swift_bridgeObjectRelease();
    unint64_t v5 = v209;
  }
  v265 = 0;
  v266 = 0;
LABEL_73:
  swift_bridgeObjectRelease();
  sub_254ED1670();
  double v95 = v94;
  sub_254ED1670();
  double v97 = (v95 - v96) / 86400.0;
  if ((~*(void *)&v97 & 0x7FF0000000000000) == 0)
  {
LABEL_199:
    __break(1u);
    goto LABEL_200;
  }
  if (v97 <= -9.22337204e18)
  {
LABEL_200:
    __break(1u);
    goto LABEL_201;
  }
  if (v97 >= 9.22337204e18)
  {
LABEL_201:
    __break(1u);
    goto LABEL_202;
  }
  uint64_t v269 = v6;
  uint64_t v99 = v1[52];
  uint64_t v98 = v1[53];
  uint64_t v100 = v1[51];
  unint64_t inited = (uint64_t)v97;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70870);
  sub_254ED17F0();
  unint64_t v2 = swift_allocObject();
  *(_OWORD *)v228 = xmmword_254ED2260;
  *(_OWORD *)(v2 + 16) = xmmword_254ED2260;
  sub_254ED17C0();
  sub_254ED17B0();
  sub_254ED17A0();
  (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v100);
  if (qword_269E707A0 != -1) {
LABEL_202:
  }
    swift_once();
  uint64_t v102 = v1[47];
  uint64_t v101 = v1[48];
  uint64_t v103 = swift_bridgeObjectRetain();
  uint64_t v104 = sub_254EC8764(v103, inited);
  swift_bridgeObjectRelease();
  sub_254ECCAE4(v104);
  v1[44] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70880);
  sub_254ECF76C(&qword_269E70888, &qword_269E70880);
  sub_254ED1770();
  uint64_t result = sub_254EC8AF8(v102, v101);
  uint64_t v106 = result;
  uint64_t v107 = v1[71];
  uint64_t v108 = v269;
  if (!*(void *)(result + 16))
  {
    v202 = *(void (**)(void, uint64_t, uint64_t, void))(v107 + 56);
    goto LABEL_183;
  }
  unint64_t v109 = 0;
  v243 = v1 + 12;
  v251 = v1 + 20;
  v247 = v1 + 16;
  v249 = v1 + 24;
  v231 = v1 + 28;
  v268 = v1 + 32;
  v233 = v1 + 36;
  v245 = v1 + 40;
  unint64_t v110 = result + ((*(unsigned __int8 *)(v107 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80));
  v224 = (void (**)(void, void, void))(v107 + 32);
  v211 = (uint64_t (**)(uint64_t, uint64_t))(v107 + 8);
  unint64_t v213 = v110;
  uint64_t v217 = v1[71];
  uint64_t v219 = result;
  uint64_t v215 = *(void *)(result + 16);
  while (2)
  {
    if (v109 >= *(void *)(v106 + 16))
    {
      __break(1u);
      goto LABEL_204;
    }
    uint64_t v111 = v1[70];
    uint64_t v112 = v1[49];
    unint64_t v2 = *(void *)(v107 + 16);
    ((void (*)(uint64_t, unint64_t, uint64_t))v2)(v112, v110 + *(void *)(v107 + 72) * v109, v111);
    v222 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v107 + 56);
    v222(v112, 0, 1, v111);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48))(v112, 1, v111) == 1)
    {
      v203 = (void *)v1[77];
      goto LABEL_184;
    }
    (*v224)(v1[72], v1[49], v1[70]);
    if (*(void *)(v108 + 16) && (unint64_t v113 = sub_254ECBC14(v1[72]), (v114 & 1) != 0))
    {
      uint64_t v235 = *(void *)(*(void *)(v108 + 56) + 8 * v113);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v235 = 0;
    }
    unint64_t v221 = v109 + 1;
    uint64_t v115 = v1[72];
    uint64_t v116 = v1[70];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70890);
    unint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = *(_OWORD *)v228;
    *(void *)(inited + 32) = 1702125924;
    *(void *)(inited + 40) = 0xE400000000000000;
    *(void *)(inited + 72) = v116;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
    ((void (*)(uint64_t *, uint64_t, uint64_t))v2)(boxed_opaque_existential_0, v115, v116);
    v118 = (void *)sub_254EBF830(inited);
    uint64_t v238 = qword_269E709E8 + 64;
    uint64_t v119 = -1 << *(unsigned char *)(qword_269E709E8 + 32);
    if (-v119 < 64) {
      uint64_t v120 = ~(-1 << -(char)v119);
    }
    else {
      uint64_t v120 = -1;
    }
    unint64_t v121 = v120 & *(void *)(qword_269E709E8 + 64);
    int64_t v240 = (unint64_t)(63 - v119) >> 6;
    uint64_t v253 = qword_269E709E8;
    uint64_t result = swift_bridgeObjectRetain();
    for (int64_t j = 0; ; int64_t j = v259)
    {
      if (v121)
      {
        uint64_t v256 = (v121 - 1) & v121;
        int64_t v259 = j;
        unint64_t v124 = __clz(__rbit64(v121)) | (j << 6);
        goto LABEL_109;
      }
      int64_t v125 = j + 1;
      if (__OFADD__(j, 1)) {
        goto LABEL_192;
      }
      if (v125 >= v240) {
        break;
      }
      unint64_t v126 = *(void *)(v238 + 8 * v125);
      int64_t v127 = j + 1;
      if (!v126)
      {
        int64_t v127 = j + 2;
        if (j + 2 >= v240) {
          break;
        }
        unint64_t v126 = *(void *)(v238 + 8 * v127);
        if (!v126)
        {
          int64_t v127 = j + 3;
          if (j + 3 >= v240) {
            break;
          }
          unint64_t v126 = *(void *)(v238 + 8 * v127);
          if (!v126)
          {
            int64_t v127 = j + 4;
            if (j + 4 >= v240) {
              break;
            }
            unint64_t v126 = *(void *)(v238 + 8 * v127);
            if (!v126)
            {
              uint64_t v128 = j + 5;
              if (j + 5 >= v240) {
                break;
              }
              unint64_t v126 = *(void *)(v238 + 8 * v128);
              if (!v126)
              {
                while (1)
                {
                  int64_t v127 = v128 + 1;
                  if (__OFADD__(v128, 1)) {
                    break;
                  }
                  if (v127 >= v240) {
                    goto LABEL_131;
                  }
                  unint64_t v126 = *(void *)(v238 + 8 * v127);
                  ++v128;
                  if (v126) {
                    goto LABEL_108;
                  }
                }
LABEL_204:
                __break(1u);
LABEL_205:
                __break(1u);
                return result;
              }
              int64_t v127 = j + 5;
            }
          }
        }
      }
LABEL_108:
      uint64_t v256 = (v126 - 1) & v126;
      int64_t v259 = v127;
      unint64_t v124 = __clz(__rbit64(v126)) + (v127 << 6);
LABEL_109:
      v129 = (uint64_t *)(*(void *)(v253 + 56) + 16 * v124);
      uint64_t v130 = v129[1];
      uint64_t v263 = *v129;
      uint64_t v272 = *v129;
      swift_bridgeObjectRetain();
      sub_254ED1B40();
      unint64_t v2 = v272;
      id v131 = objc_allocWithZone(NSNumber);
      swift_bridgeObjectRetain();
      id v132 = objc_msgSend(v131, sel_initWithInteger_, 0);
      unint64_t inited = sub_254ECFA08(0, &qword_269E70878);
      v1[23] = inited;
      v1[20] = v132;
      uint64_t v1 = v249;
      sub_254ECF50C(v251, v249);
      char v133 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v135 = sub_254ECBB9C(v272, v130);
      uint64_t v136 = v118[2];
      BOOL v137 = (v134 & 1) == 0;
      uint64_t v138 = v136 + v137;
      if (__OFADD__(v136, v137))
      {
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
LABEL_195:
        __break(1u);
LABEL_196:
        __break(1u);
LABEL_197:
        __break(1u);
        goto LABEL_198;
      }
      char v139 = v134;
      if (v118[3] >= v138)
      {
        if (v133)
        {
          if (v134) {
            goto LABEL_117;
          }
        }
        else
        {
          sub_254ECCE7C();
          if (v139) {
            goto LABEL_117;
          }
        }
      }
      else
      {
        sub_254ECBFEC(v138, v133);
        unint64_t v140 = sub_254ECBB9C(v272, v130);
        if ((v139 & 1) != (v141 & 1)) {
          goto LABEL_179;
        }
        unint64_t v135 = v140;
        if (v139)
        {
LABEL_117:
          v145 = (_OWORD *)(v118[7] + 32 * v135);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v145);
          sub_254ECF50C(v249, v145);
          goto LABEL_118;
        }
      }
      v118[(v135 >> 6) + 8] |= 1 << v135;
      v142 = (uint64_t *)(v118[6] + 16 * v135);
      uint64_t *v142 = v272;
      v142[1] = v130;
      sub_254ECF50C(v249, (_OWORD *)(v118[7] + 32 * v135));
      uint64_t v143 = v118[2];
      BOOL v14 = __OFADD__(v143, 1);
      uint64_t v144 = v143 + 1;
      if (v14) {
        goto LABEL_190;
      }
      v118[2] = v144;
      swift_bridgeObjectRetain();
LABEL_118:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_254ED1B40();
      swift_bridgeObjectRelease();
      unint64_t v2 = v263;
      id v146 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 0.0);
      uint64_t v1 = i;
      i[19] = inited;
      i[16] = v146;
      sub_254ECF50C(v247, v268);
      char v147 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t inited = sub_254ECBB9C(v263, v130);
      uint64_t v149 = v118[2];
      BOOL v150 = (v148 & 1) == 0;
      uint64_t v151 = v149 + v150;
      if (__OFADD__(v149, v150)) {
        goto LABEL_189;
      }
      char v152 = v148;
      if (v118[3] >= v151)
      {
        if (v147)
        {
          if (v148) {
            goto LABEL_89;
          }
        }
        else
        {
          sub_254ECCE7C();
          if (v152) {
            goto LABEL_89;
          }
        }
      }
      else
      {
        sub_254ECBFEC(v151, v147);
        unint64_t v153 = sub_254ECBB9C(v263, v130);
        if ((v152 & 1) != (v154 & 1)) {
          goto LABEL_179;
        }
        unint64_t inited = v153;
        if (v152)
        {
LABEL_89:
          v123 = (_OWORD *)(v118[7] + 32 * inited);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v123);
          sub_254ECF50C(v268, v123);
          goto LABEL_90;
        }
      }
      v118[(inited >> 6) + 8] |= 1 << inited;
      v155 = (uint64_t *)(v118[6] + 16 * inited);
      uint64_t *v155 = v263;
      v155[1] = v130;
      sub_254ECF50C(v268, (_OWORD *)(v118[7] + 32 * inited));
      uint64_t v156 = v118[2];
      BOOL v14 = __OFADD__(v156, 1);
      uint64_t v157 = v156 + 1;
      if (v14) {
        goto LABEL_191;
      }
      v118[2] = v157;
      swift_bridgeObjectRetain();
LABEL_90:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v121 = v256;
    }
LABEL_131:
    swift_release();
    uint64_t result = v235;
    if (!v235) {
      uint64_t result = sub_254EBF968(MEMORY[0x263F8EE78]);
    }
    int64_t v158 = 0;
    uint64_t v241 = result + 64;
    uint64_t v159 = -1 << *(unsigned char *)(result + 32);
    if (-v159 < 64) {
      uint64_t v160 = ~(-1 << -(char)v159);
    }
    else {
      uint64_t v160 = -1;
    }
    unint64_t v161 = v160 & *(void *)(result + 64);
    int64_t v254 = (unint64_t)(63 - v159) >> 6;
    uint64_t v236 = result;
    while (2)
    {
      if (v161)
      {
        uint64_t v257 = (v161 - 1) & v161;
        int64_t v260 = v158;
        unint64_t v163 = __clz(__rbit64(v161)) | (v158 << 6);
        goto LABEL_155;
      }
      int64_t v164 = v158 + 1;
      if (__OFADD__(v158, 1)) {
        goto LABEL_197;
      }
      if (v164 < v254)
      {
        unint64_t v165 = *(void *)(v241 + 8 * v164);
        int64_t v166 = v158 + 1;
        if (!v165)
        {
          int64_t v166 = v158 + 2;
          if (v158 + 2 >= v254) {
            break;
          }
          unint64_t v165 = *(void *)(v241 + 8 * v166);
          if (!v165)
          {
            int64_t v166 = v158 + 3;
            if (v158 + 3 >= v254) {
              break;
            }
            unint64_t v165 = *(void *)(v241 + 8 * v166);
            if (!v165)
            {
              uint64_t v167 = v158 + 4;
              if (v158 + 4 >= v254) {
                break;
              }
              unint64_t v165 = *(void *)(v241 + 8 * v167);
              if (!v165)
              {
                while (1)
                {
                  int64_t v166 = v167 + 1;
                  if (__OFADD__(v167, 1)) {
                    goto LABEL_205;
                  }
                  if (v166 >= v254) {
                    goto LABEL_177;
                  }
                  unint64_t v165 = *(void *)(v241 + 8 * v166);
                  ++v167;
                  if (v165) {
                    goto LABEL_154;
                  }
                }
              }
              int64_t v166 = v158 + 4;
            }
          }
        }
LABEL_154:
        uint64_t v257 = (v165 - 1) & v165;
        int64_t v260 = v166;
        unint64_t v163 = __clz(__rbit64(v165)) + (v166 << 6);
LABEL_155:
        v168 = (uint64_t *)(*(void *)(result + 48) + 16 * v163);
        uint64_t v1 = (void *)*v168;
        uint64_t v169 = v168[1];
        v170 = *(void **)(*(void *)(result + 56) + 8 * v163);
        uint64_t v273 = *v168;
        swift_bridgeObjectRetain();
        sub_254ED1B40();
        unint64_t v2 = v273;
        uint64_t v171 = v170[2];
        unint64_t inited = 0x263F08A18uLL;
        id v172 = objc_allocWithZone(NSNumber);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v173 = objc_msgSend(v172, sel_initWithInteger_, v171);
        uint64_t v264 = sub_254ECFA08(0, &qword_269E70878);
        i[39] = v264;
        i[36] = v173;
        sub_254ECF50C(v233, v245);
        char v174 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v176 = sub_254ECBB9C(v273, v169);
        uint64_t v177 = v118[2];
        BOOL v178 = (v175 & 1) == 0;
        uint64_t v179 = v177 + v178;
        if (__OFADD__(v177, v178)) {
          goto LABEL_193;
        }
        unint64_t inited = v175;
        if (v118[3] >= v179)
        {
          if (v174)
          {
            if ((v175 & 1) == 0) {
              goto LABEL_159;
            }
          }
          else
          {
            sub_254ECCE7C();
            if ((inited & 1) == 0) {
              goto LABEL_159;
            }
          }
        }
        else
        {
          sub_254ECBFEC(v179, v174);
          unint64_t v180 = sub_254ECBB9C(v273, v169);
          if ((inited & 1) != (v181 & 1)) {
            goto LABEL_179;
          }
          unint64_t v176 = v180;
          if ((inited & 1) == 0)
          {
LABEL_159:
            v118[(v176 >> 6) + 8] |= 1 << v176;
            v182 = (uint64_t *)(v118[6] + 16 * v176);
            uint64_t *v182 = v273;
            v182[1] = v169;
            sub_254ECF50C(v245, (_OWORD *)(v118[7] + 32 * v176));
            uint64_t v183 = v118[2];
            BOOL v14 = __OFADD__(v183, 1);
            uint64_t v184 = v183 + 1;
            if (v14) {
              goto LABEL_195;
            }
            v118[2] = v184;
            swift_bridgeObjectRetain();
LABEL_164:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            sub_254ED1B40();
            swift_bridgeObjectRelease();
            unint64_t v2 = (unint64_t)v1;
            sub_254EC8E74(v170);
            double v187 = v186;
            swift_bridgeObjectRelease();
            id v188 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v187 / 86400.0);
            uint64_t v1 = i;
            i[31] = v264;
            i[28] = v188;
            sub_254ECF50C(v231, v243);
            char v189 = swift_isUniquelyReferenced_nonNull_native();
            unint64_t inited = sub_254ECBB9C(v2, v169);
            uint64_t v191 = v118[2];
            BOOL v192 = (v190 & 1) == 0;
            uint64_t v193 = v191 + v192;
            if (__OFADD__(v191, v192)) {
              goto LABEL_194;
            }
            char v194 = v190;
            if (v118[3] >= v193)
            {
              if (v189)
              {
                if ((v190 & 1) == 0) {
                  goto LABEL_171;
                }
              }
              else
              {
                sub_254ECCE7C();
                if ((v194 & 1) == 0) {
                  goto LABEL_171;
                }
              }
            }
            else
            {
              sub_254ECBFEC(v193, v189);
              unint64_t v195 = sub_254ECBB9C(v2, v169);
              if ((v194 & 1) != (v196 & 1)) {
                goto LABEL_179;
              }
              unint64_t inited = v195;
              if ((v194 & 1) == 0)
              {
LABEL_171:
                v118[(inited >> 6) + 8] |= 1 << inited;
                v197 = (unint64_t *)(v118[6] + 16 * inited);
                unint64_t *v197 = v2;
                v197[1] = v169;
                sub_254ECF50C(v243, (_OWORD *)(v118[7] + 32 * inited));
                uint64_t v198 = v118[2];
                BOOL v14 = __OFADD__(v198, 1);
                uint64_t v199 = v198 + 1;
                if (v14) {
                  goto LABEL_196;
                }
                v118[2] = v199;
                swift_bridgeObjectRetain();
                goto LABEL_138;
              }
            }
            v162 = (_OWORD *)(v118[7] + 32 * inited);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v162);
            sub_254ECF50C(v243, v162);
LABEL_138:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t result = v236;
            unint64_t v161 = v257;
            int64_t v158 = v260;
            continue;
          }
        }
        v185 = (_OWORD *)(v118[7] + 32 * v176);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v185);
        sub_254ECF50C(v245, v185);
        goto LABEL_164;
      }
      break;
    }
LABEL_177:
    uint64_t v200 = v1[72];
    uint64_t v201 = v1[70];
    swift_release();
    sub_254EC970C((uint64_t)v118);
    swift_bridgeObjectRelease();
    sub_254ED1750();
    swift_bridgeObjectRelease();
    uint64_t result = (*v211)(v200, v201);
    uint64_t v107 = v217;
    uint64_t v106 = v219;
    unint64_t v109 = v221;
    uint64_t v108 = v269;
    unint64_t v110 = v213;
    v202 = v222;
    if (v221 != v215) {
      continue;
    }
    break;
  }
LABEL_183:
  v203 = (void *)v1[77];
  v202(v1[49], 1, 1, v1[70]);
LABEL_184:
  swift_bridgeObjectRelease();

  (*(void (**)(void, void, void))(v1[55] + 32))(v1[46], v1[56], v1[54]);
  swift_bridgeObjectRelease();
  sub_254ECF498((uint64_t)v266);
  sub_254ECF498((uint64_t)v265);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v204 = (uint64_t (*)(void))v1[1];
  return v204();
}

uint64_t sub_254EC275C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70808);
  v3[14] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70810);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70818);
  v3[18] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70820);
  v3[19] = v6;
  v3[20] = *(void *)(v6 - 8);
  v3[21] = swift_task_alloc();
  uint64_t v7 = sub_254ED1790();
  v3[22] = v7;
  v3[23] = *(void *)(v7 - 8);
  v3[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70840);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  uint64_t v8 = sub_254ED1720();
  v3[29] = v8;
  v3[30] = *(void *)(v8 - 8);
  v3[31] = swift_task_alloc();
  uint64_t v9 = sub_254ED16D0();
  v3[32] = v9;
  v3[33] = *(void *)(v9 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_254EC2B50, 0, 0);
}

uint64_t sub_254EC2B50()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B98]), sel_init);
  v0[41] = v1;
  uint64_t v2 = swift_task_alloc();
  v0[42] = v2;
  *(void *)(v2 + 16) = v1;
  unint64_t v3 = (void *)swift_task_alloc();
  v0[43] = v3;
  void *v3 = v0;
  v3[1] = sub_254EC2C58;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_254EC2C58()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_254EC2D70, 0, 0);
}

uint64_t sub_254EC2D70()
{
  uint64_t v190 = v0;
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = (void *)sub_254ED1680();
  unint64_t v3 = (void *)sub_254ED1680();
  id v4 = objc_msgSend(v1, sel_predicateForEventsWithStartDate_endDate_calendars_, v2, v3, 0);

  uint64_t v143 = v4;
  id v5 = objc_msgSend(v1, sel_eventsMatchingPredicate_, v4);
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))sub_254ECFA08(0, &qword_269E70948);
  unint64_t v7 = sub_254ED1B70();

  if (qword_269E707A8 != -1) {
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v8 = sub_254ED1AC0();
    __swift_project_value_buffer(v8, (uint64_t)qword_269E709F0);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_254ED1AA0();
    os_log_type_t v10 = sub_254ED1BF0();
    unint64_t v177 = v7;
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v189[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = swift_bridgeObjectRetain();
      uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x25A280860](v13, v6);
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      uint64_t v16 = v165;
      *(void *)(v165 + 24) = sub_254ECB494((uint64_t)v6, v15, v189);
      sub_254ED1C10();
      unint64_t v7 = v177;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254EBE000, v9, v10, "ekEvents: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A280E30](v12, -1, -1);
      MEMORY[0x25A280E30](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v16 = v165;
    }
    unint64_t v17 = sub_254EBFA84(MEMORY[0x263F8EE78], &qword_269E70968, &qword_269E70960);
    unint64_t v18 = v17;
    if (v7 >> 62) {
      break;
    }
    uint64_t v19 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v153 = v17;
    if (!v19) {
      goto LABEL_25;
    }
LABEL_7:
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)(v16 + 264);
    uint64_t v171 = (void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
    uint64_t v174 = v21 + 56;
    unint64_t v175 = v7 & 0xC000000000000001;
    int64_t v166 = (void (**)(uint64_t, uint64_t))(*(void *)(v16 + 240) + 8);
    v168 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
    id v22 = (void (**)(uint64_t, uint64_t))(v21 + 8);
    v185 = (void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
    uint64_t v164 = v19;
    while (1)
    {
      id v23 = v175 ? (id)MEMORY[0x25A280930](v20, v7) : *(id *)(v7 + 8 * v20 + 32);
      unint64_t v24 = v23;
      uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v165;
      uint64_t v25 = v20 + 1;
      if (__OFADD__(v20, 1)) {
        break;
      }
      sub_254ED1700();
      id v26 = objc_msgSend(v24, sel_startDate);
      if (!v26) {
        goto LABEL_128;
      }
      v27 = v26;
      uint64_t v183 = v20;
      id v28 = v24;
      uint64_t v29 = *(void *)(v165 + 312);
      uint64_t v30 = *(void *)(v165 + 256);
      uint64_t v31 = *(void *)(v165 + 224);
      sub_254ED16B0();

      (*v171)(v31, v29, v30);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))v174)(v31, 0, 1, v30);
      uint64_t result = (*v168)(v31, 1, v30);
      if (result == 1)
      {
LABEL_129:
        __break(1u);
        return result;
      }
      uint64_t v33 = *(void *)(v165 + 320);
      uint64_t v34 = *(void *)(v165 + 304);
      uint64_t v35 = *(void *)(v165 + 248);
      uint64_t v36 = *(void *)(v165 + 256);
      uint64_t v37 = *(void *)(v165 + 224);
      uint64_t v38 = *(void *)(v165 + 232);
      sub_254ED16E0();
      (*v166)(v35, v38);
      v39 = *v22;
      (*v22)(v37, v36);
      uint64_t v6 = *v185;
      (*v185)(v34, v33, v36);
      uint64_t v180 = v25;
      if (*(void *)(v153 + 16))
      {
        sub_254ECBC14(*(void *)(v165 + 304));
        uint64_t v40 = MEMORY[0x263F8EE78];
        if (v41) {
          uint64_t v40 = swift_bridgeObjectRetain();
        }
      }
      else
      {
        uint64_t v40 = MEMORY[0x263F8EE78];
      }
      uint64_t v188 = v40;
      v39(*(void *)(v165 + 304), *(void *)(v165 + 256));
      id v42 = v28;
      MEMORY[0x25A280840]();
      if (*(void *)((v188 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v188 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_254ED1BA0();
      }
      uint64_t v44 = *(void *)(v165 + 312);
      uint64_t v43 = *(void *)(v165 + 320);
      uint64_t v45 = *(void *)(v165 + 256);
      sub_254ED1BC0();
      sub_254ED1B90();
      v6(v44, v43, v45);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v189[0] = v153;
      sub_254ECCCC4(v188, v44, isUniquelyReferenced_nonNull_native);
      uint64_t v153 = v189[0];
      swift_bridgeObjectRelease();
      v39(v44, v45);

      v39(v43, v45);
      uint64_t v20 = v183 + 1;
      unint64_t v7 = v177;
      if (v180 == v164) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_23:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_254ED1CC0();
  swift_bridgeObjectRelease();
  uint64_t v153 = v18;
  if (v19) {
    goto LABEL_7;
  }
LABEL_25:
  uint64_t v47 = v165;
  swift_bridgeObjectRelease();
  sub_254ED1670();
  double v49 = v48;
  sub_254ED1670();
  double v51 = (v49 - v50) / 86400.0;
  if ((~*(void *)&v51 & 0x7FF0000000000000) == 0)
  {
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  if (v51 <= -9.22337204e18)
  {
LABEL_122:
    __break(1u);
    goto LABEL_123;
  }
  if (v51 >= 9.22337204e18)
  {
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  uint64_t v53 = *(void *)(v165 + 160);
  uint64_t v52 = *(void *)(v165 + 168);
  uint64_t v54 = *(void *)(v165 + 136);
  uint64_t v186 = *(void *)(v165 + 128);
  uint64_t v169 = *(void *)(v165 + 120);
  uint64_t v172 = *(void *)(v165 + 152);
  uint64_t v178 = *(void *)(v165 + 48);
  uint64_t v176 = *(void *)(v165 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70870);
  sub_254ED17F0();
  uint64_t v174 = swift_allocObject();
  *(_OWORD *)(v174 + 16) = xmmword_254ED2270;
  sub_254ED17C0();
  sub_254ED17B0();
  sub_254ED17A0();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v172);
  uint64_t v55 = sub_254ECFA08(0, &qword_269E70878);
  sub_254ED17C0();
  uint64_t v56 = v54;
  sub_254ED17B0();
  sub_254ED17A0();
  char v57 = *(void (**)(uint64_t, uint64_t))(v186 + 8);
  v57(v56, v169);
  sub_254ED17C0();
  sub_254ED17B0();
  sub_254ED17A0();
  v57(v56, v169);
  sub_254ED17C0();
  uint64_t v47 = v165;
  uint64_t v148 = v55;
  sub_254ED17B0();
  sub_254ED17A0();
  v57(v56, v169);
  *(void *)(v165 + 16) = v174;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70880);
  sub_254ECF76C(&qword_269E70888, &qword_269E70880);
  sub_254ED1770();
  unint64_t v58 = sub_254EC8AF8(v176, v178);
  unint64_t v59 = v58;
  uint64_t v60 = *(void *)(v165 + 264);
  uint64_t v147 = *(void *)(v58 + 16);
  if (v147)
  {
    uint64_t v6 = 0;
    unint64_t v61 = 0;
    unint64_t v146 = v58 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
    uint64_t v155 = *(void *)(v165 + 80);
    uint64_t v156 = *(void *)(v165 + 88);
    uint64_t v154 = *(void *)(v165 + 56);
    double v187 = (void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32);
    uint64_t v179 = (void (**)(uint64_t, uint64_t))(v60 + 8);
    uint64_t v144 = *(void *)(v165 + 264);
    unint64_t v145 = v58;
    while (1)
    {
      if (v61 >= *(void *)(v59 + 16))
      {
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
        __break(1u);
        goto LABEL_120;
      }
      uint64_t v47 = v165;
      uint64_t v73 = *(void *)(v165 + 256);
      uint64_t v74 = *(void *)(v165 + 216);
      char v75 = *(void (**)(uint64_t, unint64_t, uint64_t))(v60 + 16);
      v75(v74, v146 + *(void *)(v60 + 72) * v61, v73);
      unint64_t v161 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 56);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v161)(v74, 0, 1, v73);
      uint64_t v160 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48);
      if (v160(v74, 1, v73) == 1)
      {
        BOOL v137 = *(void **)(v165 + 328);
        goto LABEL_113;
      }
      unint64_t v152 = v61;
      unint64_t v76 = *(void *)(v165 + 296);
      uint64_t v77 = *(void *)(v165 + 280);
      uint64_t v78 = *(void *)(v165 + 256);
      uint64_t v184 = *v187;
      (*v187)(v76, *(void *)(v165 + 216), v78);
      sub_254ED16C0();
      v75(v77, v76, v78);
      if (*(void *)(v153 + 16))
      {
        unint64_t v79 = sub_254ECBC14(*(void *)(v165 + 280));
        uint64_t v80 = MEMORY[0x263F8EE78];
        unint64_t v81 = MEMORY[0x263F8EE78];
        uint64_t v82 = v179;
        if (v83)
        {
          unint64_t v81 = *(void *)(*(void *)(v153 + 56) + 8 * v79);
          swift_bridgeObjectRetain();
        }
      }
      else
      {
        uint64_t v80 = MEMORY[0x263F8EE78];
        unint64_t v81 = MEMORY[0x263F8EE78];
        uint64_t v82 = v179;
      }
      unint64_t v163 = v75;
      int8x16_t v181 = *(int8x16_t *)(v165 + 288);
      v162 = *v82;
      (*v82)(*(void *)(v165 + 280), *(void *)(v165 + 256));
      char v84 = (int8x16_t *)swift_task_alloc();
      v84[1] = vextq_s8(v181, v181, 8uLL);
      unint64_t v85 = sub_254ECA9A4(sub_254ECF7B8, (uint64_t)v84, v81);
      swift_task_dealloc();
      v189[0] = v80;
      if (v85 >> 62)
      {
        uint64_t v86 = sub_254ED1CC0();
        if (!v86)
        {
LABEL_51:
          swift_bridgeObjectRelease();
          uint64_t v91 = v80;
          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v86 = *(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v86) {
          goto LABEL_51;
        }
      }
      if (v86 < 1) {
        goto LABEL_118;
      }
      for (uint64_t i = 0; i != v86; ++i)
      {
        if ((v85 & 0xC000000000000001) != 0) {
          id v88 = (id)MEMORY[0x25A280930](i, v85);
        }
        else {
          id v88 = *(id *)(v85 + 8 * i + 32);
        }
        uint64_t v89 = v88;
        if (objc_msgSend(v88, sel_status) == (id)3
          || (id v90 = objc_msgSend(v89, sel_organizer), v90, !v90))
        {
        }
        else
        {
          sub_254ED1C70();
          sub_254ED1C90();
          sub_254ED1CA0();
          sub_254ED1C80();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v91 = v189[0];
LABEL_52:
      if (v91 < 0) {
        uint64_t v47 = 1;
      }
      else {
        uint64_t v47 = ((unint64_t)v91 >> 62) & 1;
      }
      if (v47 == 1)
      {
        swift_bridgeObjectRetain();
        uint64_t v92 = sub_254ED1CC0();
        swift_release();
      }
      else
      {
        uint64_t v92 = *(void *)(v91 + 16);
      }
      id v151 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v92);
      v189[0] = v80;
      if (v47)
      {
        swift_retain();
        uint64_t v93 = sub_254ED1CC0();
        if (!v93) {
          goto LABEL_72;
        }
      }
      else
      {
        uint64_t v93 = *(void *)(v91 + 16);
        swift_retain();
        if (!v93)
        {
LABEL_72:
          uint64_t v47 = v165;
          swift_release();
          uint64_t v100 = v80;
          if (v80 < 0) {
            goto LABEL_106;
          }
          goto LABEL_73;
        }
      }
      if (v93 < 1) {
        goto LABEL_119;
      }
      for (uint64_t j = 0; j != v93; ++j)
      {
        if ((v91 & 0xC000000000000001) != 0) {
          id v95 = (id)MEMORY[0x25A280930](j, v91);
        }
        else {
          id v95 = *(id *)(v91 + 8 * j + 32);
        }
        double v96 = v95;
        id v97 = objc_msgSend(v95, sel_organizer);
        if (v97
          && (uint64_t v98 = v97, v99 = objc_msgSend(v97, sel_isCurrentUser), v98, (v99 & 1) != 0))
        {
          sub_254ED1C70();
          sub_254ED1C90();
          sub_254ED1CA0();
          sub_254ED1C80();
        }
        else
        {
        }
      }
      swift_release();
      uint64_t v100 = v189[0];
      uint64_t v47 = v165;
      if (v189[0] < 0) {
        goto LABEL_106;
      }
LABEL_73:
      if ((v100 & 0x4000000000000000) == 0)
      {
        uint64_t v101 = *(void *)(v100 + 16);
        goto LABEL_75;
      }
LABEL_106:
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_254ED1CC0();
      swift_release();
LABEL_75:
      swift_release();
      id v102 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v101);
      v189[0] = v80;
      BOOL v150 = v102;
      if (v93)
      {
        for (uint64_t k = 0; k != v93; ++k)
        {
          if ((v91 & 0xC000000000000001) != 0) {
            id v104 = (id)MEMORY[0x25A280930](k, v91);
          }
          else {
            id v104 = *(id *)(v91 + 8 * k + 32);
          }
          v105 = v104;
          if (objc_msgSend(v104, sel_isAllDay))
          {
          }
          else
          {
            sub_254ED1C70();
            sub_254ED1C90();
            sub_254ED1CA0();
            sub_254ED1C80();
          }
        }
        swift_release();
        uint64_t v106 = v189[0];
        uint64_t v47 = v165;
      }
      else
      {
        swift_release();
        uint64_t v106 = v80;
      }
      uint64_t v149 = v6;
      if (v106 < 0 || (v106 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v107 = sub_254ED1CC0();
        swift_release();
        if (v107)
        {
LABEL_89:
          v189[0] = v80;
          sub_254ECD4B0(0, v107 & ~(v107 >> 63), 0);
          if ((v107 & 0x8000000000000000) == 0)
          {
            uint64_t v108 = v47;
            uint64_t v109 = 0;
            uint64_t v158 = v106;
            unint64_t v159 = v106 & 0xC000000000000001;
            uint64_t v157 = v107;
            while (1)
            {
              uint64_t v174 = v109;
              id v110 = v159 ? (id)MEMORY[0x25A280930](v109, v106) : *(id *)(v106 + 8 * v109 + 32);
              id v111 = v110;
              uint64_t v6 = v161;
              uint64_t v47 = v108;
              id v112 = objc_msgSend(v110, sel_startDate);
              if (!v112) {
                break;
              }
              unint64_t v113 = v112;
              v182 = v111;
              uint64_t v114 = *(void *)(v47 + 312);
              uint64_t v115 = *(void *)(v47 + 256);
              uint64_t v116 = *(void *)(v47 + 208);
              sub_254ED16B0();

              v184(v116, v114, v115);
              ((void (*)(uint64_t, void, uint64_t, uint64_t))v161)(v116, 0, 1, v115);
              if (v160(v116, 1, v115) == 1) {
                goto LABEL_125;
              }
              id v117 = objc_msgSend(v182, sel_endDate);
              if (!v117) {
                goto LABEL_126;
              }
              v118 = v117;
              uint64_t v119 = *(void *)(v47 + 312);
              uint64_t v120 = *(void *)(v47 + 256);
              uint64_t v121 = *(void *)(v47 + 200);
              sub_254ED16B0();

              v184(v121, v119, v120);
              ((void (*)(uint64_t, void, uint64_t, uint64_t))v161)(v121, 0, 1, v120);
              if (v160(v121, 1, v120) == 1) {
                goto LABEL_127;
              }
              uint64_t v122 = *(void *)(v47 + 312);
              uint64_t v123 = *(void *)(v47 + 272);
              uint64_t v124 = *(void *)(v47 + 256);
              unint64_t v125 = *(void *)(v47 + 200);
              v163(v122, *(void *)(v47 + 208), v124);
              v163(v123, v125, v124);
              sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
              LOBYTE(v125) = sub_254ED1B00();
              v162(v123, v124);
              v162(v122, v124);
              if ((v125 & 1) == 0)
              {
                __break(1u);
                goto LABEL_117;
              }
              uint64_t v126 = *(void *)(v47 + 256);
              unint64_t v167 = *(void *)(v47 + 200);
              uint64_t v127 = *(void *)(v47 + 96);
              uint64_t v170 = *(void *)(v47 + 104);
              uint64_t v173 = *(void *)(v47 + 208);
              uint64_t v129 = *(void *)(v47 + 64);
              unint64_t v128 = *(void *)(v47 + 72);
              unint64_t v130 = v128 + *(int *)(v154 + 48);
              ((void (*)(unint64_t))v163)(v128);
              v163(v130, v167, v126);
              uint64_t v131 = v129 + *(int *)(v154 + 48);
              v163(v129, v128, v126);
              v163(v131, v130, v126);
              v184(v127, v129, v126);
              v162(v131, v126);
              uint64_t v132 = v129 + *(int *)(v154 + 48);
              v184(v129, v128, v126);
              v184(v132, v130, v126);
              v184(v127 + *(int *)(v155 + 36), v132, v126);
              v162(v129, v126);
              sub_254ECF63C(v127, v170, &qword_269E70838);
              v162(v167, v126);
              v162(v173, v126);

              uint64_t v80 = v189[0];
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_254ECD4B0(0, *(void *)(v80 + 16) + 1, 1);
                uint64_t v80 = v189[0];
              }
              uint64_t v106 = v158;
              unint64_t v134 = *(void *)(v80 + 16);
              unint64_t v133 = *(void *)(v80 + 24);
              if (v134 >= v133 >> 1)
              {
                sub_254ECD4B0(v133 > 1, v134 + 1, 1);
                uint64_t v80 = v189[0];
              }
              uint64_t v109 = v174 + 1;
              uint64_t v108 = v165;
              uint64_t v135 = *(void *)(v165 + 104);
              *(void *)(v80 + 16) = v134 + 1;
              sub_254ECF63C(v135, v80+ ((*(unsigned __int8 *)(v156 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v156 + 80))+ *(void *)(v156 + 72) * v134, &qword_269E70838);
              if (v157 == v174 + 1)
              {
                swift_release();
                uint64_t v47 = v165;
                goto LABEL_30;
              }
            }
LABEL_124:
            ((void (*)(void, uint64_t, uint64_t, void))v6)(*(void *)(v47 + 208), 1, 1, *(void *)(v47 + 256));
LABEL_125:
            __break(1u);
LABEL_126:
            ((void (*)(void, uint64_t, uint64_t, void))v6)(*(void *)(v47 + 200), 1, 1, *(void *)(v47 + 256));
LABEL_127:
            __break(1u);
LABEL_128:
            uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, void))v174)(*((void *)v6 + 28), 1, 1, *((void *)v6 + 32));
            goto LABEL_129;
          }
LABEL_120:
          __break(1u);
          goto LABEL_121;
        }
      }
      else
      {
        uint64_t v107 = *(void *)(v106 + 16);
        if (v107) {
          goto LABEL_89;
        }
      }
      swift_release();
LABEL_30:
      uint64_t v63 = *(void *)(v47 + 288);
      unint64_t v62 = *(void *)(v47 + 296);
      uint64_t v64 = *(void *)(v47 + 256);
      sub_254EC8E74((void *)v80);
      double v66 = v65;
      swift_bridgeObjectRelease();
      id v67 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v66 / 86400.0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E70950);
      uint64_t v68 = swift_allocObject();
      *(_OWORD *)(v68 + 16) = xmmword_254ED2270;
      *(void *)(v68 + 56) = v64;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v68 + 32));
      v163((uint64_t)boxed_opaque_existential_0, v62, v64);
      *(void *)(v68 + 64) = v151;
      *(void *)(v68 + 88) = v148;
      *(void *)(v68 + 96) = v150;
      *(void *)(v68 + 152) = v148;
      *(void *)(v68 + 120) = v148;
      *(void *)(v68 + 128) = v67;
      id v70 = v151;
      id v71 = v150;
      id v72 = v67;
      sub_254ED1760();

      unint64_t v61 = v152 + 1;
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint64_t)v162;
      v162(v63, v64);
      v162(v62, v64);
      uint64_t v60 = v144;
      unint64_t v59 = v145;
      uint64_t v6 = v149;
      if (v152 + 1 == v147)
      {
        uint64_t v47 = v165;
        uint64_t v136 = (void (*)(void, uint64_t, uint64_t, void))v161;
        goto LABEL_112;
      }
    }
  }
  uint64_t v136 = *(void (**)(void, uint64_t, uint64_t, void))(v60 + 56);
LABEL_112:
  BOOL v137 = *(void **)(v47 + 328);
  v136(*(void *)(v47 + 216), 1, 1, *(void *)(v47 + 256));
LABEL_113:
  swift_bridgeObjectRelease();

  uint64_t v138 = *(void *)(v47 + 192);
  uint64_t v139 = *(void *)(v47 + 176);
  uint64_t v140 = *(void *)(v47 + 184);
  uint64_t v141 = *(void *)(v47 + 32);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v140 + 32))(v141, v138, v139);
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
  v142 = *(uint64_t (**)(void))(v47 + 8);
  return v142();
}

uint64_t sub_254EC4460@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_254ED17F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v40 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70928);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70930);
  uint64_t v30 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254ED1790();
  sub_254ED1730();
  char v41 = v8;
  sub_254ED1800();
  uint64_t v9 = sub_254ED1780();
  uint64_t v10 = *(void *)(v9 + 16);
  v29[1] = v9;
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v13 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v36 = v6;
    uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v33 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v34 = v14;
    uint64_t v32 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v38 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 40);
    v39 = v12;
    v29[0] = (v11 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v35 = a1;
    unint64_t v15 = v40;
    while (1)
    {
      v39(v6, v13, v2);
      uint64_t v16 = *v38;
      (*v38)(v6, 0, 1, v2);
      if ((*v37)(v6, 1, v2) == 1) {
        break;
      }
      uint64_t v31 = v16;
      (*v33)(v15, v6, v2);
      uint64_t v43 = v10;
      uint64_t v44 = sub_254ED17E0();
      uint64_t v45 = v17;
      sub_254ECF718();
      sub_254ECF76C(&qword_269E70940, &qword_269E70930);
      uint64_t v18 = sub_254ED1AE0();
      uint64_t v19 = v2;
      uint64_t v20 = v11;
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      swift_bridgeObjectRelease();
      sub_254ED17E0();
      MEMORY[0x25A280800](v18, v22, v24, v26);
      swift_bridgeObjectRelease();
      uint64_t v11 = v20;
      uint64_t v2 = v19;
      sub_254ED1740();
      uint64_t v27 = v43;
      swift_bridgeObjectRelease();
      uint64_t v6 = v36;
      swift_bridgeObjectRelease();
      (*v32)(v15, v19);
      v13 += v34;
      uint64_t v10 = v27 - 1;
      if (!v10)
      {
        v31(v6, 1, 1, v19);
        break;
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v6, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v41, v42);
}

uint64_t sub_254EC48CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[47] = a2;
  v3[48] = a3;
  v3[46] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70808);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70810);
  v3[51] = v4;
  v3[52] = *(void *)(v4 - 8);
  v3[53] = swift_task_alloc();
  v3[54] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70818);
  v3[55] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70820);
  v3[56] = v5;
  v3[57] = *(void *)(v5 - 8);
  v3[58] = swift_task_alloc();
  uint64_t v6 = sub_254ED1790();
  v3[59] = v6;
  v3[60] = *(void *)(v6 - 8);
  v3[61] = swift_task_alloc();
  uint64_t v7 = sub_254ED1720();
  v3[62] = v7;
  v3[63] = *(void *)(v7 - 8);
  v3[64] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70828);
  v3[65] = swift_task_alloc();
  v3[66] = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  v3[69] = v8;
  v3[70] = *(void *)(v8 - 8);
  v3[71] = swift_task_alloc();
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70840);
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  uint64_t v9 = sub_254ED16D0();
  v3[78] = v9;
  v3[79] = *(void *)(v9 - 8);
  v3[80] = swift_task_alloc();
  v3[81] = swift_task_alloc();
  v3[82] = swift_task_alloc();
  v3[83] = swift_task_alloc();
  v3[84] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70848);
  v3[85] = swift_task_alloc();
  uint64_t v10 = sub_254ED1A90();
  v3[86] = v10;
  v3[87] = *(void *)(v10 - 8);
  v3[88] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70850);
  v3[89] = swift_task_alloc();
  uint64_t v11 = sub_254ED19F0();
  v3[90] = v11;
  v3[91] = *(void *)(v11 - 8);
  v3[92] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70858);
  v3[93] = v12;
  v3[94] = *(void *)(v12 - 8);
  v3[95] = swift_task_alloc();
  uint64_t v13 = sub_254ED1A60();
  v3[96] = v13;
  v3[97] = *(void *)(v13 - 8);
  v3[98] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_254EC4F04, 0, 0);
}

uint64_t sub_254EC4F04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70860);
  uint64_t v1 = sub_254ED1A30();
  *(void *)(v0 + 792) = v1;
  uint64_t v2 = v1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 800) = v3;
  long long v4 = *(_OWORD *)(v0 + 376);
  *(void *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 808) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70868);
  *uint64_t v5 = v0;
  v5[1] = sub_254EC5254;
  return MEMORY[0x270FA2360](v0 + 360, 0, 0, 0xD000000000000028, 0x8000000254ED2830, sub_254ECF444, v3, v6);
}

uint64_t sub_254EC5254()
{
  *(void *)(*(void *)v1 + 816) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_254EC73DC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_254EC53A4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_254EC53A4()
{
  v345 = v0;
  uint64_t v1 = v0;
  uint64_t v344 = *MEMORY[0x263EF8340];
  uint64_t v2 = v0[45];
  uint64_t v3 = (void *)sub_254EBFA84(MEMORY[0x263F8EE78], &qword_269E70900, &qword_269E708A0);
  uint64_t v4 = *(void *)(v2 + 16);
  v341 = v1;
  if (v4)
  {
    v306 = 0;
    v307 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = v1[97];
    uint64_t v308 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v305 = (void (**)(uint64_t, uint64_t))(v1[94] + 8);
    v303 = (void (**)(uint64_t, uint64_t))(v1[91] + 8);
    uint64_t v7 = v1[87];
    v299 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v279 = (void (**)(void, void, void))(v7 + 32);
    uint64_t v8 = v1[79];
    uint64_t v9 = v1[70];
    uint64_t v268 = v1[69];
    v319 = (void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v275 = v8;
    v313 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    v292 = (void *)(v9 + 56);
    uint64_t v265 = v9;
    v287 = (void (**)(uint64_t, uint64_t))(v1[63] + 8);
    v289 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    v277 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v311 = v6;
    v297 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    uint64_t v269 = *(void *)(v2 + 16);
    uint64_t v272 = v1[66];
    uint64_t v266 = v2;
    v301 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v273 = (void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    while (1)
    {
      if (v5 >= *(void *)(v2 + 16)) {
        goto LABEL_169;
      }
      uint64_t v12 = v1[95];
      uint64_t v13 = v1[93];
      uint64_t v14 = v1[92];
      uint64_t v15 = v1[90];
      uint64_t v16 = v1[89];
      unint64_t v334 = v5;
      uint64_t v17 = (*(uint64_t (**)(void, unint64_t, void))(v311 + 16))(v1[98], v308 + *(void *)(v311 + 72) * v5, v1[96]);
      MEMORY[0x25A280730](v17);
      sub_254ED1A10();
      (*v305)(v12, v13);
      sub_254ED19E0();
      (*v303)(v14, v15);
      uint64_t v18 = sub_254ED19D0();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v16, 1, v18) == 1) {
        goto LABEL_191;
      }
      ActivityType.init(entityClass:)((char *)v1[89], (char *)&v342);
      char v330 = (char)v342;
      if (v342 == 34) {
        goto LABEL_192;
      }
      uint64_t v19 = v1[86];
      uint64_t v20 = v1[85];
      sub_254ED1A40();
      int v21 = (*v299)(v20, 1, v19);
      uint64_t v22 = v1[85];
      if (v21 == 1)
      {
        (*v297)(v1[98], v1[96]);
        uint64_t v10 = v22;
        uint64_t v11 = (uint64_t *)&unk_269E70848;
      }
      else
      {
        uint64_t v23 = v1[78];
        uint64_t v24 = v1[77];
        (*v279)(v1[88], v1[85], v1[86]);
        sub_254ED1A80();
        uint64_t v25 = *v301;
        if ((*v301)(v24, 1, v23) != 1)
        {
          uint64_t v29 = v1[78];
          uint64_t v30 = v1[76];
          v338 = *v273;
          (*v273)(v1[84], v1[77], v29);
          sub_254ED1A70();
          if (v25(v30, 1, v29) == 1)
          {
            uint64_t v31 = v1[98];
            uint64_t v32 = v1[96];
            uint64_t v33 = v1[88];
            uint64_t v34 = v1[86];
            uint64_t v35 = v1[76];
            (*v313)(v1[84], v1[78]);
            (*v277)(v33, v34);
            (*v297)(v31, v32);
            sub_254ECF6BC(v35, &qword_269E70840);
            uint64_t v4 = v269;
          }
          else
          {
            v338(v1[83], v1[76], v1[78]);
            sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
            if ((sub_254ED1B00() & 1) == 0) {
              goto LABEL_185;
            }
            uint64_t v316 = v1[83];
            uint64_t v36 = v1[78];
            uint64_t v325 = v1[74];
            uint64_t v37 = v1[73];
            uint64_t v38 = v1[68];
            uint64_t v39 = v1[67];
            uint64_t v40 = v38 + *(int *)(v272 + 48);
            char v41 = *v319;
            (*v319)(v38, v1[84], v36);
            uint64_t v322 = v40;
            v41(v40, v316, v36);
            uint64_t v294 = v39 + *(int *)(v272 + 48);
            v41(v39, v38, v36);
            v317 = v41;
            v41(v294, v40, v36);
            v338(v37, v39, v36);
            uint64_t v42 = *v313;
            (*v313)(v294, v36);
            uint64_t v43 = v39 + *(int *)(v272 + 48);
            v338(v39, v38, v36);
            v338(v43, v322, v36);
            v338(v37 + *(int *)(v268 + 36), v43, v36);
            v295 = v42;
            v42(v39, v36);
            sub_254ECF63C(v37, v325, &qword_269E70838);
            unint64_t v44 = sub_254EC7CF4(v325);
            uint64_t v45 = *(void *)(v44 + 16);
            uint64_t v46 = v292;
            if (v45)
            {
              unint64_t v285 = (*(unsigned __int8 *)(v265 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v265 + 80);
              uint64_t v47 = v44 + v285;
              uint64_t v283 = *(void *)(v265 + 72);
              while (1)
              {
                uint64_t v48 = v1[69];
                uint64_t v49 = v1[65];
                sub_254ECF7D8(v47, v49, &qword_269E70838);
                double v50 = (void (*)(uint64_t, void, uint64_t, uint64_t))*v46;
                ((void (*)(uint64_t, void, uint64_t, uint64_t))*v46)(v49, 0, 1, v48);
                if ((*v289)(v49, 1, v48) == 1) {
                  goto LABEL_46;
                }
                uint64_t v323 = v47;
                v281 = v50;
                uint64_t v326 = v45;
                uint64_t v51 = v1[82];
                uint64_t v52 = v1[81];
                uint64_t v53 = v1[78];
                uint64_t v54 = v1[72];
                uint64_t v55 = v1[71];
                uint64_t v56 = v1[64];
                uint64_t v57 = v1[62];
                sub_254ECF63C(v1[65], v54, &qword_269E70838);
                sub_254ED1700();
                sub_254ED16E0();
                (*v287)(v56, v57);
                v317(v52, v51, v53);
                LOBYTE(v342) = v330;
                uint64_t v58 = ActivityType.rawValue.getter();
                uint64_t v60 = v59;
                sub_254ECF7D8(v54, v55, &qword_269E70838);
                sub_254ECF498((uint64_t)v307);
                int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v342 = v3;
                unint64_t v63 = sub_254ECBC14(v52);
                uint64_t v64 = v3[2];
                BOOL v65 = (v62 & 1) == 0;
                uint64_t v66 = v64 + v65;
                if (__OFADD__(v64, v65)) {
                  goto LABEL_170;
                }
                char v67 = v62;
                if (v3[3] >= v66)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  {
                    sub_254ECD21C(&qword_269E708A0);
                    uint64_t v3 = v342;
                  }
                }
                else
                {
                  uint64_t v68 = v1[81];
                  sub_254ECC604(v66, isUniquelyReferenced_nonNull_native, &qword_269E708A0);
                  uint64_t v3 = v342;
                  unint64_t v69 = sub_254ECBC14(v68);
                  if ((v67 & 1) != (v70 & 1)) {
                    goto LABEL_164;
                  }
                  unint64_t v63 = v69;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                if ((v67 & 1) == 0)
                {
                  uint64_t v71 = v1[81];
                  uint64_t v72 = v1[78];
                  unint64_t v73 = sub_254EBF968(MEMORY[0x263F8EE78]);
                  v3[(v63 >> 6) + 8] |= 1 << v63;
                  v317(v3[6] + *(void *)(v275 + 72) * v63, v71, v72);
                  *(void *)(v3[7] + 8 * v63) = v73;
                  uint64_t v74 = v3[2];
                  BOOL v75 = __OFADD__(v74, 1);
                  uint64_t v76 = v74 + 1;
                  if (v75) {
                    goto LABEL_178;
                  }
                  v3[2] = v76;
                }
                uint64_t v77 = v3[7];
                uint64_t v78 = v3;
                swift_bridgeObjectRelease();
                uint64_t v79 = 8 * v63;
                sub_254ECF498((uint64_t)v306);
                char v80 = swift_isUniquelyReferenced_nonNull_native();
                v342 = *(void **)(v77 + 8 * v63);
                unint64_t v81 = v342;
                *(void *)(v77 + 8 * v63) = 0x8000000000000000;
                unint64_t v83 = sub_254ECBB9C(v58, v60);
                uint64_t v84 = v81[2];
                BOOL v85 = (v82 & 1) == 0;
                uint64_t v86 = v84 + v85;
                if (__OFADD__(v84, v85)) {
                  goto LABEL_171;
                }
                char v87 = v82;
                if (v81[3] >= v86)
                {
                  if ((v80 & 1) == 0)
                  {
                    sub_254ECD064();
                    unint64_t v81 = v342;
                  }
                }
                else
                {
                  sub_254ECC2EC(v86, v80);
                  unint64_t v81 = v342;
                  unint64_t v88 = sub_254ECBB9C(v58, v60);
                  if ((v87 & 1) != (v89 & 1))
                  {
LABEL_164:
                    return sub_254ED1D60();
                  }
                  unint64_t v83 = v88;
                }
                *(void *)(v77 + v79) = v81;
                swift_bridgeObjectRelease();
                id v90 = *(void **)(v77 + v79);
                if ((v87 & 1) == 0)
                {
                  v90[(v83 >> 6) + 8] |= 1 << v83;
                  uint64_t v91 = (uint64_t *)(v90[6] + 16 * v83);
                  *uint64_t v91 = v58;
                  v91[1] = v60;
                  *(void *)(v90[7] + 8 * v83) = MEMORY[0x263F8EE78];
                  uint64_t v92 = v90[2];
                  uint64_t v93 = v92 + 1;
                  BOOL v94 = __OFADD__(v92, 1);
                  swift_bridgeObjectRetain();
                  if (v94) {
                    goto LABEL_179;
                  }
                  v90[2] = v93;
                }
                uint64_t v95 = v90[7];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                unint64_t v96 = *(void *)(v95 + 8 * v83);
                char v97 = swift_isUniquelyReferenced_nonNull_native();
                *(void *)(v95 + 8 * v83) = v96;
                if ((v97 & 1) == 0)
                {
                  unint64_t v96 = sub_254ECAFA4(0, *(void *)(v96 + 16) + 1, 1, v96);
                  *(void *)(v95 + 8 * v83) = v96;
                }
                unint64_t v99 = *(void *)(v96 + 16);
                unint64_t v98 = *(void *)(v96 + 24);
                unint64_t v100 = v99 + 1;
                if (v99 >= v98 >> 1)
                {
                  unint64_t v96 = sub_254ECAFA4(v98 > 1, v99 + 1, 1, v96);
                  *(void *)(v95 + 8 * v83) = v96;
                }
                uint64_t v101 = v341[82];
                uint64_t v102 = v341[81];
                uint64_t v103 = v341[78];
                uint64_t v104 = v341[72];
                uint64_t v105 = v341[71];
                uint64_t v106 = v96 + v285 + v99 * v283;
                uint64_t v1 = v341;
                *(void *)(v96 + 16) = v100;
                sub_254ECF63C(v105, v106, &qword_269E70838);
                swift_bridgeObjectRelease();
                v295(v102, v103);
                v295(v101, v103);
                sub_254ECF6BC(v104, &qword_269E70838);
                uint64_t v47 = v323 + v283;
                v306 = sub_254EC8754;
                v307 = sub_254ECFB2C;
                uint64_t v45 = v326 - 1;
                uint64_t v3 = v78;
                uint64_t v46 = v292;
                if (v326 == 1)
                {
                  v281(v341[65], 1, 1, v341[69]);
                  goto LABEL_46;
                }
              }
            }
            ((void (*)(void, uint64_t, uint64_t, void))*v292)(v1[65], 1, 1, v1[69]);
LABEL_46:
            uint64_t v107 = v1[98];
            uint64_t v108 = v1[96];
            uint64_t v109 = v1[88];
            uint64_t v110 = v1[86];
            uint64_t v111 = v1[84];
            uint64_t v112 = v1[83];
            uint64_t v113 = v1[78];
            uint64_t v114 = v1[74];
            swift_bridgeObjectRelease();
            sub_254ECF6BC(v114, &qword_269E70838);
            v295(v112, v113);
            v295(v111, v113);
            (*v277)(v109, v110);
            (*v297)(v107, v108);
            uint64_t v2 = v266;
            uint64_t v4 = v269;
          }
          goto LABEL_5;
        }
        uint64_t v26 = v1[98];
        uint64_t v27 = v1[96];
        uint64_t v28 = v1[77];
        (*v277)(v1[88], v1[86]);
        (*v297)(v26, v27);
        uint64_t v10 = v28;
        uint64_t v11 = &qword_269E70840;
      }
      sub_254ECF6BC(v10, v11);
LABEL_5:
      unint64_t v5 = v334 + 1;
      if (v334 + 1 == v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
  }
  swift_bridgeObjectRelease();
  v306 = 0;
  v307 = 0;
LABEL_49:
  v302 = v1 + 12;
  uint64_t v274 = v1 + 16;
  v276 = v1 + 24;
  v278 = v1 + 20;
  v280 = v1 + 28;
  v284 = v1 + 36;
  v286 = v1 + 32;
  v282 = v1 + 40;
  v342 = (void *)MEMORY[0x263F8EE78];
  sub_254ECD4D0(0, 34, 0);
  uint64_t v115 = 0;
  uint64_t v116 = v342;
  do
  {
    uint64_t v117 = ActivityType.rawValue.getter();
    uint64_t v119 = v118;
    v342 = v116;
    unint64_t v121 = v116[2];
    unint64_t v120 = v116[3];
    if (v121 >= v120 >> 1)
    {
      sub_254ECD4D0(v120 > 1, v121 + 1, 1);
      uint64_t v116 = v342;
    }
    ++v115;
    v116[2] = v121 + 1;
    uint64_t v122 = &v116[2 * v121];
    v122[4] = v117;
    v122[5] = v119;
  }
  while (v115 != 34);
  sub_254ED1670();
  double v124 = v123;
  sub_254ED1670();
  double v126 = (v124 - v125) / 86400.0;
  if ((~*(void *)&v126 & 0x7FF0000000000000) == 0) {
    goto LABEL_187;
  }
  if (v126 <= -9.22337204e18)
  {
LABEL_188:
    __break(1u);
    goto LABEL_189;
  }
  if (v126 >= 9.22337204e18)
  {
LABEL_189:
    __break(1u);
LABEL_190:
    __break(1u);
LABEL_191:
    __break(1u);
LABEL_192:
    __break(1u);
  }
  uint64_t v128 = v1[57];
  uint64_t v127 = v1[58];
  uint64_t v339 = v1[56];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70870);
  uint64_t v129 = *(void *)(sub_254ED17F0() - 8);
  unint64_t v130 = (*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80);
  uint64_t v335 = *(void *)(v129 + 72);
  uint64_t v131 = swift_allocObject();
  *(_OWORD *)(v131 + 16) = xmmword_254ED2260;
  uint64_t v270 = v131;
  sub_254ED17C0();
  sub_254ED17B0();
  sub_254ED17A0();
  (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v339);
  uint64_t v132 = v116[2];
  v340 = v3;
  v288 = v116;
  if (v132)
  {
    uint64_t v133 = v1[52];
    sub_254ECFA08(0, &qword_269E70878);
    swift_bridgeObjectRetain();
    unint64_t v134 = v116 + 5;
    uint64_t v135 = MEMORY[0x263F8EE78];
    unint64_t v290 = v130;
    uint64_t v136 = (void (**)(uint64_t, uint64_t))(v133 + 8);
    while (1)
    {
      v312 = v134;
      uint64_t v314 = v132;
      uint64_t v139 = v1[54];
      uint64_t v327 = v1[53];
      unint64_t v331 = v135;
      uint64_t v140 = v1[51];
      uint64_t v141 = (void *)*(v134 - 1);
      uint64_t v142 = *v134;
      uint64_t v143 = swift_allocObject();
      *(_OWORD *)(v143 + 16) = xmmword_254ED2280;
      v342 = v141;
      uint64_t v343 = v142;
      swift_bridgeObjectRetain_n();
      sub_254ED1B40();
      sub_254ED17C0();
      sub_254ED17B0();
      sub_254ED17A0();
      uint64_t v144 = *v136;
      (*v136)(v139, v140);
      unint64_t v145 = v143 + v130;
      v342 = v141;
      uint64_t v343 = v142;
      swift_bridgeObjectRetain();
      sub_254ED1B40();
      sub_254ED17C0();
      sub_254ED17B0();
      sub_254ED17A0();
      uint64_t v146 = v140;
      uint64_t v135 = v331;
      v144(v327, v146);
      swift_bridgeObjectRelease();
      uint64_t v147 = *(void *)(v143 + 16);
      int64_t v148 = *(void *)(v331 + 16);
      int64_t v149 = v148 + v147;
      if (__OFADD__(v148, v147)) {
        break;
      }
      char v150 = swift_isUniquelyReferenced_nonNull_native();
      if ((v150 & 1) == 0 || v149 > *(void *)(v331 + 24) >> 1)
      {
        if (v148 <= v149) {
          int64_t v151 = v148 + v147;
        }
        else {
          int64_t v151 = v148;
        }
        uint64_t v135 = sub_254ECB214(v150, v151, 1, v331, &qword_269E70870, MEMORY[0x263F1BF70], MEMORY[0x263F1BF70]);
      }
      unint64_t v130 = v290;
      if (v147)
      {
        uint64_t v152 = *(void *)(v135 + 16);
        if ((*(void *)(v135 + 24) >> 1) - v152 < v147) {
          goto LABEL_172;
        }
        unint64_t v153 = v135 + v290 + v152 * v335;
        if (v145 < v153 + v147 * v335 && v153 < v145 + v147 * v335) {
          return sub_254ED1D00();
        }
        swift_arrayInitWithCopy();
        uint64_t v137 = *(void *)(v135 + 16);
        BOOL v75 = __OFADD__(v137, v147);
        uint64_t v138 = v137 + v147;
        if (v75) {
          goto LABEL_173;
        }
        *(void *)(v135 + 16) = v138;
      }
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      unint64_t v134 = v312 + 2;
      uint64_t v132 = v314 - 1;
      uint64_t v1 = v341;
      if (v314 == 1)
      {
        uint64_t v116 = v288;
        swift_bridgeObjectRelease();
        uint64_t v3 = v340;
        goto LABEL_75;
      }
    }
    __break(1u);
LABEL_169:
    __break(1u);
LABEL_170:
    __break(1u);
LABEL_171:
    __break(1u);
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
LABEL_175:
    __break(1u);
LABEL_176:
    __break(1u);
LABEL_177:
    __break(1u);
LABEL_178:
    __break(1u);
LABEL_179:
    __break(1u);
LABEL_180:
    __break(1u);
LABEL_181:
    __break(1u);
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    __break(1u);
    goto LABEL_186;
  }
  uint64_t v135 = MEMORY[0x263F8EE78];
LABEL_75:
  uint64_t v156 = v1[47];
  uint64_t v155 = v1[48];
  v342 = (void *)v270;
  sub_254ECCAE4(v135);
  v1[44] = v342;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70880);
  sub_254ECF76C(&qword_269E70888, &qword_269E70880);
  sub_254ED1770();
  unint64_t v157 = sub_254EC8AF8(v156, v155);
  unint64_t v158 = v157;
  uint64_t v159 = v1[79];
  if (!*(void *)(v157 + 16))
  {
    int64_t v259 = *(void (**)(void, uint64_t, uint64_t, void))(v159 + 56);
    goto LABEL_160;
  }
  unint64_t v160 = 0;
  unint64_t v161 = v157 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
  v304 = (void (**)(void, void, void))(v159 + 32);
  uint64_t v267 = (void (**)(uint64_t, uint64_t))(v159 + 8);
  v300 = v116 + 5;
  unint64_t v296 = v157;
  uint64_t v291 = *(void *)(v157 + 16);
  uint64_t v293 = v1[79];
  unint64_t v271 = v161;
LABEL_77:
  if (v160 >= *(void *)(v158 + 16)) {
    goto LABEL_190;
  }
  uint64_t v162 = v1[78];
  uint64_t v163 = v1[75];
  uint64_t v164 = *(void (**)(uint64_t, unint64_t, uint64_t))(v159 + 16);
  v164(v163, v161 + *(void *)(v159 + 72) * v160, v162);
  v298 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v159 + 56);
  v298(v163, 0, 1, v162);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v163, 1, v162) != 1)
  {
    (*v304)(v1[80], v1[75], v1[78]);
    unint64_t v309 = v160;
    if (v3[2] && (unint64_t v165 = sub_254ECBC14(v1[80]), (v166 & 1) != 0))
    {
      unint64_t v167 = *(void *)(v3[7] + 8 * v165);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v167 = 0;
    }
    unint64_t v168 = v1[80];
    uint64_t v169 = v1[78];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70890);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_254ED2260;
    *(void *)(inited + 32) = 1702125924;
    *(void *)(inited + 40) = 0xE400000000000000;
    *(void *)(inited + 72) = v169;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
    v164((uint64_t)boxed_opaque_existential_0, v168, v169);
    uint64_t v172 = (void *)sub_254EBF830(inited);
    uint64_t v173 = v116[2];
    if (v173)
    {
      unint64_t v320 = v167;
      swift_bridgeObjectRetain();
      uint64_t v174 = v300;
      while (1)
      {
        v328 = v174;
        uint64_t v332 = v173;
        uint64_t v176 = *v174;
        v336 = (void *)*(v174 - 1);
        v342 = v336;
        uint64_t v343 = v176;
        swift_bridgeObjectRetain_n();
        sub_254ED1B40();
        uint64_t v178 = (uint64_t)v342;
        uint64_t v177 = v343;
        id v179 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
        uint64_t v180 = sub_254ECFA08(0, &qword_269E70878);
        v1[23] = v180;
        v1[20] = v179;
        sub_254ECF50C(v278, v276);
        char v181 = swift_isUniquelyReferenced_nonNull_native();
        v342 = v172;
        unint64_t v183 = sub_254ECBB9C(v178, v177);
        uint64_t v184 = v172[2];
        BOOL v185 = (v182 & 1) == 0;
        uint64_t v186 = v184 + v185;
        if (__OFADD__(v184, v185)) {
          goto LABEL_176;
        }
        char v187 = v182;
        if (v172[3] >= v186)
        {
          if (v181)
          {
            if (v182) {
              goto LABEL_95;
            }
          }
          else
          {
            sub_254ECCE7C();
            uint64_t v172 = v342;
            if (v187) {
              goto LABEL_95;
            }
          }
        }
        else
        {
          sub_254ECBFEC(v186, v181);
          uint64_t v172 = v342;
          unint64_t v188 = sub_254ECBB9C(v178, v177);
          if ((v187 & 1) != (v189 & 1)) {
            goto LABEL_164;
          }
          unint64_t v183 = v188;
          if (v187)
          {
LABEL_95:
            uint64_t v193 = (_OWORD *)(v172[7] + 32 * v183);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v193);
            sub_254ECF50C(v276, v193);
            goto LABEL_96;
          }
        }
        v172[(v183 >> 6) + 8] |= 1 << v183;
        uint64_t v190 = (uint64_t *)(v172[6] + 16 * v183);
        *uint64_t v190 = v178;
        v190[1] = v177;
        sub_254ECF50C(v276, (_OWORD *)(v172[7] + 32 * v183));
        uint64_t v191 = v172[2];
        BOOL v75 = __OFADD__(v191, 1);
        uint64_t v192 = v191 + 1;
        if (v75) {
          goto LABEL_182;
        }
        v172[2] = v192;
        swift_bridgeObjectRetain();
LABEL_96:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v342 = v336;
        uint64_t v343 = v176;
        swift_bridgeObjectRetain();
        sub_254ED1B40();
        swift_bridgeObjectRelease();
        uint64_t v195 = (uint64_t)v342;
        uint64_t v194 = v343;
        id v196 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 0.0);
        uint64_t v1 = v341;
        v341[19] = v180;
        v341[16] = v196;
        sub_254ECF50C(v274, v286);
        char v197 = swift_isUniquelyReferenced_nonNull_native();
        v342 = v172;
        unint64_t v199 = sub_254ECBB9C(v195, v194);
        uint64_t v200 = v172[2];
        BOOL v201 = (v198 & 1) == 0;
        uint64_t v202 = v200 + v201;
        uint64_t v3 = v340;
        uint64_t v116 = v288;
        if (__OFADD__(v200, v201)) {
          goto LABEL_177;
        }
        char v203 = v198;
        if (v172[3] >= v202)
        {
          if (v197)
          {
            if ((v198 & 1) == 0) {
              goto LABEL_103;
            }
          }
          else
          {
            sub_254ECCE7C();
            uint64_t v172 = v342;
            if ((v203 & 1) == 0) {
              goto LABEL_103;
            }
          }
        }
        else
        {
          sub_254ECBFEC(v202, v197);
          uint64_t v172 = v342;
          unint64_t v204 = sub_254ECBB9C(v195, v194);
          if ((v203 & 1) != (v205 & 1)) {
            goto LABEL_164;
          }
          unint64_t v199 = v204;
          if ((v203 & 1) == 0)
          {
LABEL_103:
            v172[(v199 >> 6) + 8] |= 1 << v199;
            uint64_t v206 = (uint64_t *)(v172[6] + 16 * v199);
            *uint64_t v206 = v195;
            v206[1] = v194;
            sub_254ECF50C(v286, (_OWORD *)(v172[7] + 32 * v199));
            uint64_t v207 = v172[2];
            BOOL v75 = __OFADD__(v207, 1);
            uint64_t v208 = v207 + 1;
            if (v75) {
              goto LABEL_183;
            }
            v172[2] = v208;
            swift_bridgeObjectRetain();
            goto LABEL_86;
          }
        }
        unint64_t v175 = (_OWORD *)(v172[7] + 32 * v199);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v175);
        sub_254ECF50C(v286, v175);
LABEL_86:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v174 = v328 + 2;
        uint64_t v173 = v332 - 1;
        if (v332 == 1)
        {
          swift_bridgeObjectRelease();
          unint64_t v167 = v320;
          break;
        }
      }
    }
    if (!v167) {
      unint64_t v167 = sub_254EBF968(MEMORY[0x263F8EE78]);
    }
    int64_t v209 = 0;
    unint64_t v310 = v309 + 1;
    unint64_t v315 = v167 + 64;
    uint64_t v210 = -1 << *(unsigned char *)(v167 + 32);
    if (-v210 < 64) {
      uint64_t v211 = ~(-1 << -(char)v210);
    }
    else {
      uint64_t v211 = -1;
    }
    unint64_t v212 = v211 & *(void *)(v167 + 64);
    int64_t v318 = (unint64_t)(63 - v210) >> 6;
    unint64_t v321 = v167;
    while (1)
    {
      if (v212)
      {
        uint64_t v324 = (v212 - 1) & v212;
        int64_t v329 = v209;
        unint64_t v214 = __clz(__rbit64(v212)) | (v209 << 6);
      }
      else
      {
        int64_t v215 = v209 + 1;
        if (__OFADD__(v209, 1)) {
          goto LABEL_184;
        }
        if (v215 >= v318)
        {
LABEL_156:
          uint64_t v257 = v1[80];
          uint64_t v258 = v1[78];
          swift_release();
          sub_254EC970C((uint64_t)v172);
          swift_bridgeObjectRelease();
          sub_254ED1750();
          swift_bridgeObjectRelease();
          (*v267)(v257, v258);
          uint64_t v159 = v293;
          unint64_t v160 = v310;
          unint64_t v158 = v296;
          int64_t v259 = v298;
          unint64_t v161 = v271;
          if (v310 == v291)
          {
LABEL_160:
            v259(v1[75], 1, 1, v1[78]);
            break;
          }
          goto LABEL_77;
        }
        unint64_t v216 = *(void *)(v315 + 8 * v215);
        int64_t v217 = v209 + 1;
        if (!v216)
        {
          int64_t v217 = v209 + 2;
          if (v209 + 2 >= v318) {
            goto LABEL_156;
          }
          unint64_t v216 = *(void *)(v315 + 8 * v217);
          if (!v216)
          {
            int64_t v217 = v209 + 3;
            if (v209 + 3 >= v318) {
              goto LABEL_156;
            }
            unint64_t v216 = *(void *)(v315 + 8 * v217);
            if (!v216)
            {
              uint64_t v218 = v209 + 4;
              if (v209 + 4 >= v318) {
                goto LABEL_156;
              }
              unint64_t v216 = *(void *)(v315 + 8 * v218);
              if (!v216)
              {
                while (1)
                {
                  int64_t v217 = v218 + 1;
                  if (__OFADD__(v218, 1)) {
                    break;
                  }
                  if (v217 >= v318) {
                    goto LABEL_156;
                  }
                  unint64_t v216 = *(void *)(v315 + 8 * v217);
                  ++v218;
                  if (v216) {
                    goto LABEL_133;
                  }
                }
LABEL_186:
                __break(1u);
LABEL_187:
                __break(1u);
                goto LABEL_188;
              }
              int64_t v217 = v209 + 4;
            }
          }
        }
LABEL_133:
        uint64_t v324 = (v216 - 1) & v216;
        int64_t v329 = v217;
        unint64_t v214 = __clz(__rbit64(v216)) + (v217 << 6);
      }
      uint64_t v219 = (void *)(*(void *)(v167 + 48) + 16 * v214);
      uint64_t v220 = v219[1];
      unint64_t v221 = *(void **)(*(void *)(v167 + 56) + 8 * v214);
      v337 = (void *)*v219;
      v342 = (void *)*v219;
      uint64_t v343 = v220;
      swift_bridgeObjectRetain();
      sub_254ED1B40();
      uint64_t v223 = (uint64_t)v342;
      uint64_t v222 = v343;
      uint64_t v224 = v221[2];
      id v225 = objc_allocWithZone(NSNumber);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v226 = objc_msgSend(v225, sel_initWithInteger_, v224);
      uint64_t v333 = sub_254ECFA08(0, &qword_269E70878);
      v341[39] = v333;
      v341[36] = v226;
      sub_254ECF50C(v284, v282);
      char v227 = swift_isUniquelyReferenced_nonNull_native();
      v342 = v172;
      unint64_t v229 = sub_254ECBB9C(v223, v222);
      uint64_t v230 = v172[2];
      BOOL v231 = (v228 & 1) == 0;
      uint64_t v232 = v230 + v231;
      if (__OFADD__(v230, v231)) {
        goto LABEL_174;
      }
      char v233 = v228;
      if (v172[3] >= v232)
      {
        if (v227)
        {
          if (v228) {
            goto LABEL_142;
          }
        }
        else
        {
          sub_254ECCE7C();
          uint64_t v172 = v342;
          if (v233) {
            goto LABEL_142;
          }
        }
      }
      else
      {
        sub_254ECBFEC(v232, v227);
        uint64_t v172 = v342;
        unint64_t v234 = sub_254ECBB9C(v223, v222);
        if ((v233 & 1) != (v235 & 1)) {
          goto LABEL_164;
        }
        unint64_t v229 = v234;
        if (v233)
        {
LABEL_142:
          uint64_t v239 = (_OWORD *)(v172[7] + 32 * v229);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v239);
          sub_254ECF50C(v282, v239);
          goto LABEL_143;
        }
      }
      v172[(v229 >> 6) + 8] |= 1 << v229;
      uint64_t v236 = (uint64_t *)(v172[6] + 16 * v229);
      *uint64_t v236 = v223;
      v236[1] = v222;
      sub_254ECF50C(v282, (_OWORD *)(v172[7] + 32 * v229));
      uint64_t v237 = v172[2];
      BOOL v75 = __OFADD__(v237, 1);
      uint64_t v238 = v237 + 1;
      if (v75) {
        goto LABEL_180;
      }
      v172[2] = v238;
      swift_bridgeObjectRetain();
LABEL_143:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v342 = v337;
      uint64_t v343 = v220;
      swift_bridgeObjectRetain();
      sub_254ED1B40();
      swift_bridgeObjectRelease();
      uint64_t v241 = (uint64_t)v342;
      uint64_t v240 = v343;
      sub_254EC8E74(v221);
      double v243 = v242;
      swift_bridgeObjectRelease();
      id v244 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v243 / 86400.0);
      uint64_t v1 = v341;
      v341[31] = v333;
      v341[28] = v244;
      sub_254ECF50C(v280, v302);
      char v245 = swift_isUniquelyReferenced_nonNull_native();
      v342 = v172;
      unint64_t v247 = sub_254ECBB9C(v241, v240);
      uint64_t v248 = v172[2];
      BOOL v249 = (v246 & 1) == 0;
      uint64_t v250 = v248 + v249;
      uint64_t v3 = v340;
      if (__OFADD__(v248, v249)) {
        goto LABEL_175;
      }
      char v251 = v246;
      if (v172[3] >= v250)
      {
        if (v245)
        {
          unint64_t v167 = v321;
          if (v246) {
            goto LABEL_116;
          }
        }
        else
        {
          sub_254ECCE7C();
          uint64_t v172 = v342;
          unint64_t v167 = v321;
          if (v251) {
            goto LABEL_116;
          }
        }
      }
      else
      {
        sub_254ECBFEC(v250, v245);
        uint64_t v172 = v342;
        unint64_t v252 = sub_254ECBB9C(v241, v240);
        if ((v251 & 1) != (v253 & 1)) {
          goto LABEL_164;
        }
        unint64_t v247 = v252;
        unint64_t v167 = v321;
        if (v251)
        {
LABEL_116:
          unint64_t v213 = (_OWORD *)(v172[7] + 32 * v247);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v213);
          sub_254ECF50C(v302, v213);
          goto LABEL_117;
        }
      }
      v172[(v247 >> 6) + 8] |= 1 << v247;
      int64_t v254 = (uint64_t *)(v172[6] + 16 * v247);
      *int64_t v254 = v241;
      v254[1] = v240;
      sub_254ECF50C(v302, (_OWORD *)(v172[7] + 32 * v247));
      uint64_t v255 = v172[2];
      BOOL v75 = __OFADD__(v255, 1);
      uint64_t v256 = v255 + 1;
      if (v75) {
        goto LABEL_181;
      }
      v172[2] = v256;
      swift_bridgeObjectRetain();
LABEL_117:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v116 = v288;
      unint64_t v212 = v324;
      int64_t v209 = v329;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v260 = v1[61];
  uint64_t v261 = v341[60];
  uint64_t v262 = v341[59];
  uint64_t v263 = v341[46];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v261 + 32))(v263, v260, v262);
  swift_bridgeObjectRelease();
  sub_254ECF498((uint64_t)v307);
  sub_254ECF498((uint64_t)v306);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v264 = (uint64_t (*)(void))v341[1];
  return v264();
}

uint64_t sub_254EC73DC()
{
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_254EC761C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v47 = a2;
  uint64_t v49 = a1;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  uint64_t v6 = MEMORY[0x270FA5388](v46);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)&v39 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70908);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = sub_254ED1A00();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v51 = MEMORY[0x263F8EE78];
  uint64_t v19 = *(void (**)(void))(v17 + 104);
  uint64_t v48 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19();
  uint64_t v20 = sub_254ED16D0();
  sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
  uint64_t v21 = a3;
  uint64_t v44 = a4;
  uint64_t result = sub_254ED1B00();
  if (result)
  {
    uint64_t v42 = v17;
    uint64_t v43 = v16;
    uint64_t v23 = v13;
    uint64_t v39 = v13;
    uint64_t v40 = v10;
    uint64_t v24 = v45;
    uint64_t v25 = v46;
    uint64_t v26 = *(int *)(v46 + 48);
    char v41 = v15;
    uint64_t v27 = &v45[v26];
    uint64_t v28 = *(void **)(v20 - 8);
    uint64_t v29 = (void (*)(char *, uint64_t, uint64_t))v28[2];
    v29(v45, v21, v20);
    v29(v27, v44, v20);
    uint64_t v30 = &v8[*(int *)(v25 + 48)];
    v29(v8, (uint64_t)v24, v20);
    v29(v30, (uint64_t)v27, v20);
    uint64_t v31 = (void (*)(char *, char *, uint64_t))v28[4];
    v31(v23, v8, v20);
    uint64_t v32 = (void (*)(char *, uint64_t))v28[1];
    v32(v30, v20);
    uint64_t v33 = &v8[*(int *)(v25 + 48)];
    v31(v8, v24, v20);
    uint64_t v34 = v27;
    uint64_t v35 = (uint64_t)v41;
    v31(v33, v34, v20);
    uint64_t v36 = (uint64_t)v39;
    v31(&v39[*(int *)(v40 + 36)], v33, v20);
    v32(v8, v20);
    uint64_t v37 = sub_254ECF63C(v36, v35, &qword_269E70908);
    MEMORY[0x270FA5388](v37);
    *(&v39 - 2) = (char *)&v51;
    sub_254ECFAE4(&qword_269E70910, MEMORY[0x263F4E800]);
    uint64_t v38 = v48;
    sub_254ED1A20();
    sub_254ECF6BC(v35, &qword_269E70908);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v38, v43);
    uint64_t v50 = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70918);
    return sub_254ED1BE0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_254EC7B14(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v5 = sub_254ED1A60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v9 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_254ECB214(0, *(void *)(v9 + 16) + 1, 1, v9, &qword_269E70920, MEMORY[0x263F4E840], MEMORY[0x263F4E840]);
    *a3 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_254ECB214(v11 > 1, v12 + 1, 1, v9, &qword_269E70920, MEMORY[0x263F4E840], MEMORY[0x263F4E840]);
    *a3 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v12, v8, v5);
}

unint64_t sub_254EC7CF4(uint64_t a1)
{
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v100 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  char v97 = (char *)&v89 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  uint64_t v101 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  id v90 = (char **)((char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v96 = (char *)&v89 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v106 = (uint64_t)&v89 - v10;
  uint64_t v110 = sub_254ED1720();
  uint64_t v11 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  uint64_t v104 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_254ED16D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v108 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v107 = (char *)&v89 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v103 = (char *)&v89 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v102 = (char *)&v89 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v89 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v89 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v89 - v29;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v14 += 16;
  v31((char *)&v89 - v29, a1, v13);
  uint64_t v98 = v5;
  v31(v28, a1 + *(int *)(v5 + 36), v13);
  char v89 = v30;
  uint64_t v32 = v30;
  uint64_t v33 = v25;
  uint64_t v111 = v13;
  uint64_t v92 = (void (*)(void, void, void))v31;
  v31(v25, (uint64_t)v32, v13);
  uint64_t v34 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v35 = (void (**)(char *, uint64_t))(v14 - 8);
  uint64_t v93 = v14;
  uint64_t v109 = (void (**)(char *, char *, uint64_t))(v14 + 16);
  unint64_t v113 = MEMORY[0x263F8EE78];
  uint64_t v36 = v28;
  BOOL v94 = v28;
  uint64_t v95 = v25;
  uint64_t v91 = (void (**)(char *, uint64_t))(v11 + 8);
  while (1)
  {
    uint64_t v37 = v104;
    sub_254ED1700();
    uint64_t v38 = v102;
    sub_254ED16E0();
    uint64_t v39 = v33;
    uint64_t v40 = *v34;
    uint64_t v41 = v110;
    (*v34)(v37, v110);
    sub_254ED1700();
    uint64_t v42 = v103;
    sub_254ED16E0();
    v40(v37, v41);
    char v43 = sub_254ED16A0();
    uint64_t v44 = *v35;
    uint64_t v45 = v42;
    uint64_t v46 = v111;
    (*v35)(v45, v111);
    uint64_t v112 = v44;
    v44(v38, v46);
    uint64_t v47 = v35;
    if ((v43 & 1) == 0) {
      break;
    }
    sub_254ED1700();
    sub_254ED16E0();
    v40(v37, v110);
    uint64_t v48 = v108;
    sub_254ED16C0();
    sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
    uint64_t v49 = v111;
    if ((sub_254ED1B00() & 1) == 0)
    {
      __break(1u);
      goto LABEL_15;
    }
    uint64_t v50 = v35;
    uint64_t v51 = v99;
    uint64_t v52 = v97;
    uint64_t v53 = &v97[*(int *)(v99 + 48)];
    uint64_t v54 = (void (*)(char *, char *, uint64_t))v92;
    v92(v97, v39, v49);
    uint64_t v105 = v53;
    v54(v53, v48, v49);
    uint64_t v55 = v100;
    uint64_t v56 = &v100[*(int *)(v51 + 48)];
    v54(v100, v52, v49);
    v54(v56, v53, v49);
    uint64_t v57 = *v109;
    uint64_t v58 = (uint64_t)v96;
    (*v109)(v96, v55, v49);
    uint64_t v59 = v112;
    v112(v56, v49);
    uint64_t v60 = &v55[*(int *)(v51 + 48)];
    v57(v55, v52, v49);
    v57(v60, v105, v49);
    v57((char *)(v58 + *(int *)(v98 + 36)), v60, v49);
    uint64_t v61 = v49;
    v59(v55, v49);
    sub_254ECF63C(v58, v106, &qword_269E70838);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v113 = sub_254ECAFA4(0, *(void *)(v113 + 16) + 1, 1, v113);
    }
    unint64_t v63 = *(void *)(v113 + 16);
    unint64_t v62 = *(void *)(v113 + 24);
    uint64_t v36 = v94;
    uint64_t v33 = v95;
    uint64_t v64 = v61;
    if (v63 >= v62 >> 1) {
      unint64_t v113 = sub_254ECAFA4(v62 > 1, v63 + 1, 1, v113);
    }
    unint64_t v65 = v113;
    *(void *)(v113 + 16) = v63 + 1;
    sub_254ECF63C(v106, v65+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(void *)(v101 + 72) * v63, &qword_269E70838);
    uint64_t v66 = v61;
    char v67 = v112;
    v112(v107, v66);
    v67(v33, v64);
    v57(v33, v108, v64);
    uint64_t v34 = v91;
    uint64_t v35 = v50;
  }
  sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
  uint64_t v68 = v111;
  if ((sub_254ED1B00() & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v69 = v39;
  uint64_t v70 = v99;
  uint64_t v71 = v97;
  uint64_t v72 = &v97[*(int *)(v99 + 48)];
  unint64_t v73 = (void (*)(char *, char *, uint64_t))v92;
  v92(v97, v69, v68);
  v73(v72, v36, v68);
  uint64_t v74 = *(int *)(v70 + 48);
  uint64_t v110 = (uint64_t)v47;
  BOOL v75 = v100;
  uint64_t v76 = &v100[v74];
  v73(v100, v71, v68);
  v73(v76, v72, v68);
  uint64_t v77 = *v109;
  uint64_t v78 = (uint64_t)v96;
  (*v109)(v96, v75, v68);
  uint64_t v79 = v68;
  char v80 = (char *)v68;
  unint64_t v81 = v112;
  v112(v76, v79);
  char v82 = &v75[*(int *)(v70 + 48)];
  v77(v75, v71, (uint64_t)v80);
  v77(v82, v72, (uint64_t)v80);
  v77((char *)(v78 + *(int *)(v98 + 36)), v82, (uint64_t)v80);
  uint64_t v39 = v80;
  v81(v75, (uint64_t)v80);
  uint64_t v40 = (void (*)(char *, uint64_t))v90;
  sub_254ECF63C(v78, (uint64_t)v90, &qword_269E70838);
  if (swift_isUniquelyReferenced_nonNull_native()) {
    goto LABEL_11;
  }
LABEL_16:
  unint64_t v113 = sub_254ECAFA4(0, *(void *)(v113 + 16) + 1, 1, v113);
LABEL_11:
  unint64_t v84 = *(void *)(v113 + 16);
  unint64_t v83 = *(void *)(v113 + 24);
  BOOL v85 = v94;
  if (v84 >= v83 >> 1) {
    unint64_t v113 = sub_254ECAFA4(v83 > 1, v84 + 1, 1, v113);
  }
  unint64_t v86 = v113;
  *(void *)(v113 + 16) = v84 + 1;
  sub_254ECF63C((uint64_t)v40, v86+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(void *)(v101 + 72) * v84, &qword_269E70838);
  char v87 = v112;
  v112(v95, (uint64_t)v39);
  v87(v85, (uint64_t)v39);
  v87(v89, (uint64_t)v39);
  return v86;
}

unint64_t sub_254EC8724@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_254EBF968(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

void sub_254EC8754(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_254EC8764(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v38 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  unint64_t v8 = MEMORY[0x263F8EE78];
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_19;
    }
    BOOL v11 = __OFADD__(v7++, 1);
    if (v11) {
      goto LABEL_50;
    }
    if (v7 >= v38)
    {
LABEL_45:
      swift_release();
      return v8;
    }
    unint64_t v12 = *(void *)(v37 + 8 * v7);
    if (!v12) {
      break;
    }
LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
LABEL_19:
    uint64_t v14 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v15 = v14[1];
    v40[0] = *v14;
    v40[1] = v15;
    swift_bridgeObjectRetain();
    sub_254EC9DD0(v40, a2, &v41);
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return v8;
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = v41;
    uint64_t v17 = *(void *)(v41 + 16);
    int64_t v18 = *(void *)(v8 + 16);
    int64_t v19 = v18 + v17;
    if (__OFADD__(v18, v17))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) != 0 && v19 <= *(void *)(v8 + 24) >> 1)
    {
      if (!*(void *)(v16 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v18 <= v19) {
        int64_t v21 = v18 + v17;
      }
      else {
        int64_t v21 = v18;
      }
      unint64_t v8 = sub_254ECB214(isUniquelyReferenced_nonNull_native, v21, 1, v8, &qword_269E70870, MEMORY[0x263F1BF70], MEMORY[0x263F1BF70]);
      if (!*(void *)(v16 + 16))
      {
LABEL_4:
        if (v17) {
          goto LABEL_48;
        }
        goto LABEL_5;
      }
    }
    uint64_t v22 = *(void *)(v8 + 16);
    uint64_t v23 = (*(void *)(v8 + 24) >> 1) - v22;
    uint64_t v24 = *(void *)(sub_254ED17F0() - 8);
    uint64_t v25 = *(void *)(v24 + 72);
    if (v23 < v17) {
      goto LABEL_49;
    }
    unint64_t v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    unint64_t v27 = v8 + v26 + v25 * v22;
    unint64_t v28 = v16 + v26;
    uint64_t v29 = v25 * v17;
    unint64_t v30 = v27 + v29;
    unint64_t v31 = v28 + v29;
    if (v28 < v30 && v27 < v31) {
      goto LABEL_53;
    }
    swift_arrayInitWithCopy();
    if (v17)
    {
      uint64_t v33 = *(void *)(v8 + 16);
      BOOL v11 = __OFADD__(v33, v17);
      uint64_t v34 = v33 + v17;
      if (v11) {
        goto LABEL_51;
      }
      *(void *)(v8 + 16) = v34;
    }
LABEL_5:
    swift_bridgeObjectRelease();
  }
  int64_t v13 = v7 + 1;
  if (v7 + 1 >= v38) {
    goto LABEL_45;
  }
  unint64_t v12 = *(void *)(v37 + 8 * v13);
  if (v12) {
    goto LABEL_17;
  }
  int64_t v13 = v7 + 2;
  if (v7 + 2 >= v38) {
    goto LABEL_45;
  }
  unint64_t v12 = *(void *)(v37 + 8 * v13);
  if (v12) {
    goto LABEL_17;
  }
  int64_t v13 = v7 + 3;
  if (v7 + 3 >= v38) {
    goto LABEL_45;
  }
  unint64_t v12 = *(void *)(v37 + 8 * v13);
  if (v12)
  {
LABEL_17:
    int64_t v7 = v13;
    goto LABEL_18;
  }
  int64_t v35 = v7 + 4;
  if (v7 + 4 >= v38) {
    goto LABEL_45;
  }
  unint64_t v12 = *(void *)(v37 + 8 * v35);
  v7 += 4;
  if (v12) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v7 >= v38) {
      goto LABEL_45;
    }
    unint64_t v12 = *(void *)(v37 + 8 * v7);
    ++v35;
    if (v12) {
      goto LABEL_18;
    }
  }
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

unint64_t sub_254EC8AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_254ED1720();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_254ED16D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v24 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v24 - v15;
  sub_254ED1700();
  sub_254ED16E0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v26 = a2;
  if (sub_254ED16A0())
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    unint64_t v17 = MEMORY[0x263F8EE78];
    v24[1] = v8 + 8;
    v24[0] = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    do
    {
      v25(v14, v16, v7);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v17 = sub_254ECB214(0, *(void *)(v17 + 16) + 1, 1, v17, &qword_269E708F0, MEMORY[0x263F07490], MEMORY[0x263F07490]);
      }
      unint64_t v19 = *(void *)(v17 + 16);
      unint64_t v18 = *(void *)(v17 + 24);
      if (v19 >= v18 >> 1) {
        unint64_t v17 = sub_254ECB214(v18 > 1, v19 + 1, 1, v17, &qword_269E708F0, MEMORY[0x263F07490], MEMORY[0x263F07490]);
      }
      *(void *)(v17 + 16) = v19 + 1;
      unint64_t v20 = v17
          + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
          + *(void *)(v8 + 72) * v19;
      int64_t v21 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
      v21(v20, v14, v7);
      sub_254ED16C0();
      uint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
      v22(v16, v7);
      v21((unint64_t)v16, v11, v7);
    }
    while ((sub_254ED16A0() & 1) != 0);
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
    unint64_t v17 = MEMORY[0x263F8EE78];
  }
  v22(v16, v7);
  return v17;
}

uint64_t sub_254EC8E74(void *a1)
{
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70830);
  uint64_t v2 = MEMORY[0x270FA5388](v73);
  char v67 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v72 = (char *)&v62 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v71 = (uint64_t)&v62 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v78 = (uint64_t)&v62 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v70 = (uint64_t)&v62 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70828);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v65 = (uint64_t)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v66 = (uint64_t)&v62 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v76 = (char *)&v62 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v62 - v23;
  MEMORY[0x270FA5388](v22);
  char v82 = (char *)&v62 - v25;
  unint64_t v83 = a1;
  swift_bridgeObjectRetain();
  sub_254ECD8A4(&v83);
  uint64_t v26 = v83;
  uint64_t v27 = v83[2];
  if (!v27) {
    return swift_release();
  }
  unint64_t v63 = v9;
  uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v28 = v6 + 56;
  char v80 = v29;
  v29(v82, 1, 1, v5);
  unint64_t v30 = (*(unsigned __int8 *)(v28 + 24) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 24);
  uint64_t v64 = v26;
  uint64_t v31 = (uint64_t)v26 + v30;
  uint64_t v77 = *(void *)(v28 + 16);
  uint64_t v81 = v28;
  uint64_t v79 = (unsigned int (**)(char *, uint64_t, uint64_t))(v28 - 8);
  double v32 = 0.0;
  uint64_t v33 = &qword_269E70838;
  uint64_t v34 = v70;
  uint64_t v35 = (uint64_t)v76;
  uint64_t v69 = v5;
  while (1)
  {
    sub_254ECF7D8(v31, (uint64_t)v24, v33);
    v80(v24, 0, 1, v5);
    uint64_t v37 = v33;
    int64_t v38 = *v79;
    if ((*v79)(v24, 1, v5) == 1) {
      break;
    }
    sub_254ECF63C((uint64_t)v24, v34, v33);
    sub_254ECF7D8((uint64_t)v82, v35, &qword_269E70828);
    if (v38((char *)v35, 1, v5) == 1)
    {
      uint64_t v36 = (uint64_t)v82;
      sub_254ECF6BC((uint64_t)v82, &qword_269E70828);
      sub_254ECF6BC(v35, &qword_269E70828);
      sub_254ECF63C(v34, v36, v37);
      v80((char *)v36, 0, 1, v5);
      uint64_t v33 = v37;
    }
    else
    {
      sub_254ECF63C(v35, v78, v33);
      if (sub_254ED1690())
      {
        sub_254ED1670();
        double v40 = v39;
        uint64_t v41 = v78;
        sub_254ED1670();
        double v43 = v42;
        sub_254ECF6BC(v41, v33);
        uint64_t v44 = (uint64_t)v82;
        sub_254ECF6BC((uint64_t)v82, &qword_269E70828);
        double v32 = v32 + v40 - v43;
        sub_254ECF63C(v34, v44, v33);
        v80((char *)v44, 0, 1, v5);
      }
      else
      {
        uint64_t v45 = v34 + *(int *)(v5 + 36);
        if (sub_254ED1690())
        {
          uint64_t v46 = sub_254ED16D0();
          sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
          uint64_t v47 = v78;
          LODWORD(v75) = sub_254ED1B00();
          sub_254ECF6BC((uint64_t)v82, &qword_269E70828);
          if ((v75 & 1) == 0)
          {
            __break(1u);
            uint64_t result = swift_release();
            __break(1u);
            return result;
          }
          uint64_t v48 = *(int *)(v73 + 48);
          uint64_t v68 = (char *)v45;
          uint64_t v74 = &v72[v48];
          uint64_t v75 = *(void *)(v46 - 8);
          uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v75 + 16);
          v49(v72, v47, v46);
          sub_254ECF6BC(v47, v33);
          v49(v74, (uint64_t)v68, v46);
          sub_254ECF6BC(v70, v33);
          uint64_t v50 = v67;
          uint64_t v68 = &v67[*(int *)(v73 + 48)];
          uint64_t v51 = v68;
          v49(v67, (uint64_t)v72, v46);
          v49(v51, (uint64_t)v74, v46);
          uint64_t v52 = v75;
          uint64_t v53 = *(void (**)(uint64_t, char *, uint64_t))(v75 + 32);
          v53(v71, v50, v46);
          uint64_t v54 = *(void (**)(char *, uint64_t))(v52 + 8);
          uint64_t v75 = v52 + 8;
          v54(v68, v46);
          uint64_t v55 = &v50[*(int *)(v73 + 48)];
          v53((uint64_t)v50, v72, v46);
          v53((uint64_t)v55, v74, v46);
          uint64_t v56 = v55;
          uint64_t v34 = v70;
          v53(v71 + *(int *)(v69 + 36), v56, v46);
          uint64_t v57 = v50;
          uint64_t v33 = &qword_269E70838;
          v54(v57, v46);
          uint64_t v5 = v69;
          uint64_t v58 = v66;
          sub_254ECF63C(v71, v66, &qword_269E70838);
          v80((char *)v58, 0, 1, v5);
          sub_254ECF63C(v58, (uint64_t)v82, &qword_269E70828);
        }
        else
        {
          sub_254ECF6BC(v78, v33);
          sub_254ECF6BC(v34, v33);
        }
      }
      uint64_t v35 = (uint64_t)v76;
    }
    v31 += v77;
    if (!--v27)
    {
      v80(v24, 1, 1, v5);
      break;
    }
  }
  swift_release();
  uint64_t v60 = v65;
  sub_254ECF7D8((uint64_t)v82, v65, &qword_269E70828);
  if (v38((char *)v60, 1, v5) == 1)
  {
    sub_254ECF6BC((uint64_t)v82, &qword_269E70828);
    return sub_254ECF6BC(v60, &qword_269E70828);
  }
  else
  {
    uint64_t v61 = (uint64_t)v63;
    sub_254ECF63C(v60, (uint64_t)v63, &qword_269E70838);
    sub_254ED1670();
    sub_254ED1670();
    sub_254ECF6BC(v61, &qword_269E70838);
    return sub_254ECF6BC((uint64_t)v82, &qword_269E70828);
  }
}

unint64_t sub_254EC970C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E708C0);
    uint64_t v2 = (void *)sub_254ED1CF0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v34 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v33 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v47;
  uint64_t v7 = v45;
  uint64_t v8 = &v40;
  uint64_t v9 = &v42;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v35 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v18 = v35 + 1;
  if (__OFADD__(v35, 1)) {
    goto LABEL_35;
  }
  if (v18 >= v33) {
    goto LABEL_32;
  }
  unint64_t v19 = *(void *)(v34 + 8 * v18);
  int64_t v20 = v35 + 1;
  if (!v19)
  {
    int64_t v20 = v35 + 2;
    if (v35 + 2 >= v33) {
      goto LABEL_32;
    }
    unint64_t v19 = *(void *)(v34 + 8 * v20);
    if (!v19)
    {
      int64_t v20 = v35 + 3;
      if (v35 + 3 >= v33) {
        goto LABEL_32;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v20);
      if (!v19)
      {
        int64_t v20 = v35 + 4;
        if (v35 + 4 >= v33) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          int64_t v21 = v35 + 5;
          if (v35 + 5 < v33)
          {
            unint64_t v19 = *(void *)(v34 + 8 * v21);
            if (v19)
            {
              int64_t v20 = v35 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v20 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_36;
              }
              if (v20 >= v33) {
                break;
              }
              unint64_t v19 = *(void *)(v34 + 8 * v20);
              ++v21;
              if (v19) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_254ECF634();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v35 = v20;
  uint64_t v36 = (v19 - 1) & v19;
  for (unint64_t i = __clz(__rbit64(v19)) + (v20 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v35 << 6))
  {
    uint64_t v22 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    sub_254ECF570(*(void *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(void *)&long long v46 = v24;
    *((void *)&v46 + 1) = v23;
    long long v44 = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    uint64_t v38 = v24;
    uint64_t v39 = v23;
    sub_254ECF50C(v7, &v37);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E708C8);
    swift_dynamicCast();
    uint64_t v25 = v38;
    uint64_t v26 = v39;
    sub_254ECF63C((uint64_t)v8, (uint64_t)v9, &qword_269E708C8);
    sub_254ECF63C((uint64_t)v9, (uint64_t)v43, &qword_269E708C8);
    sub_254ECF63C((uint64_t)v43, (uint64_t)v41, &qword_269E708C8);
    unint64_t result = sub_254ECBB9C(v25, v26);
    unint64_t v27 = result;
    if (v28)
    {
      uint64_t v11 = v9;
      uint64_t v12 = v8;
      uint64_t v13 = v7;
      uint64_t v14 = v1;
      uint64_t v15 = v6;
      uint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v16 = v25;
      v16[1] = v26;
      uint64_t v6 = v15;
      uint64_t v1 = v14;
      uint64_t v7 = v13;
      uint64_t v8 = v12;
      uint64_t v9 = v11;
      unint64_t result = sub_254ECF5CC((uint64_t)v41, v2[7] + 32 * v27);
      unint64_t v5 = v36;
      if (!v36) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v29 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v29 = v25;
    v29[1] = v26;
    unint64_t result = sub_254ECF63C((uint64_t)v41, v2[7] + 32 * result, &qword_269E708C8);
    uint64_t v30 = v2[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_34;
    }
    v2[2] = v32;
    unint64_t v5 = v36;
    if (!v36) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v36 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void sub_254EC9ABC(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E709A0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (void *)sub_254ED1680();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_254ECF984;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_254EC9D2C;
  aBlock[3] = &block_descriptor_14;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_fetchLocationsOfInterestVisitedSinceDate_withHandler_, v7, v10);
  _Block_release(v10);
}

unint64_t sub_254EC9C78(unint64_t result)
{
  if (result)
  {
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v1 = sub_254ED1CC0();
      swift_bridgeObjectRelease();
      if (v1 < 1) {
        goto LABEL_6;
      }
    }
    else if (*(uint64_t *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
    {
LABEL_6:
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E709A0);
      return sub_254ED1BE0();
    }
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_254EC9D2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_254ECFA08(0, &qword_269E709A8);
    uint64_t v4 = sub_254ED1B70();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254EC9DD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v21 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70808);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v23 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70810);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v22 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v13 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v19 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70870);
  uint64_t v20 = *(void *)(*(void *)(sub_254ED17F0() - 8) + 72);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_254ED2280;
  uint64_t v25 = v13;
  uint64_t v26 = v12;
  swift_bridgeObjectRetain();
  sub_254ED1B40();
  sub_254ECFA08(0, &qword_269E70878);
  sub_254ED17C0();
  sub_254ED17B0();
  sub_254ED17A0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v27 + 8);
  v27 += 8;
  v15(v11, v7);
  uint64_t v25 = v19;
  uint64_t v26 = v12;
  swift_bridgeObjectRetain();
  sub_254ED1B40();
  sub_254ED17C0();
  uint64_t v16 = v22;
  sub_254ED17B0();
  sub_254ED17A0();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v15)(v16, v7);
  *uint64_t v24 = v14;
  return result;
}

void sub_254ECA104(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70970);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_254ECF848;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_254ECA55C;
  aBlock[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestFullAccessToEventsWithCompletion_, v9);
  _Block_release(v9);
}

uint64_t sub_254ECA2AC(uint64_t a1, void *a2)
{
  if (qword_269E707A8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_254ED1AC0();
  __swift_project_value_buffer(v3, (uint64_t)qword_269E709F0);
  uint64_t v4 = sub_254ED1AA0();
  os_log_type_t v5 = sub_254ED1BF0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    sub_254ED1C10();
    _os_log_impl(&dword_254EBE000, v4, v5, "EKStore request succeeded: %{BOOL}d", v6, 8u);
    MEMORY[0x25A280E30](v6, -1, -1);
  }

  MEMORY[0x25A280D50](a2);
  MEMORY[0x25A280D50](a2);
  unint64_t v7 = sub_254ED1AA0();
  os_log_type_t v8 = sub_254ED1BF0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    if (a2)
    {
      MEMORY[0x25A280D50](a2);
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_254ED1C10();
    }
    else
    {
      sub_254ED1C10();
      uint64_t v11 = 0;
    }
    *uint64_t v10 = v11;

    _os_log_impl(&dword_254EBE000, v7, v8, "EKStore request error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E707E0);
    swift_arrayDestroy();
    MEMORY[0x25A280E30](v10, -1, -1);
    MEMORY[0x25A280E30](v9, -1, -1);
  }
  else
  {
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70970);
  return sub_254ED1BE0();
}

void sub_254ECA55C(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_254ECA5D4(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_254ED16D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v26 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70840);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  BOOL v31 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v26 - v14;
  id v30 = *a1;
  id v16 = objc_msgSend(v30, sel_startDate);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v15, 1, 1, v5);
    goto LABEL_10;
  }
  uint64_t v17 = v16;
  uint64_t v33 = a3;
  sub_254ED16B0();

  char v28 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v28(v15, v10, v5);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v29(v15, 0, 1, v5);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v27(v15, 1, v5) == 1)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    uint64_t result = v29(v31, 1, 1, v5);
    goto LABEL_12;
  }
  v26[1] = sub_254ECFAE4(&qword_269E70898, MEMORY[0x263F07490]);
  char v18 = sub_254ED1AF0();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v6 + 8);
  v32(v15, v5);
  uint64_t v19 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v34, v33, v5);
  if (v18)
  {
    char v20 = 0;
    v32(v19, v5);
    return v20 & 1;
  }
  id v21 = objc_msgSend(v30, sel_endDate);
  if (!v21) {
    goto LABEL_11;
  }
  uint64_t v22 = v21;
  sub_254ED16B0();

  uint64_t v23 = v31;
  v28(v31, v10, v5);
  v29(v23, 0, 1, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v23, 1, v5);
  if (result != 1)
  {
    char v20 = sub_254ED1AF0() ^ 1;
    uint64_t v25 = v32;
    v32(v19, v5);
    v25(v23, v5);
    return v20 & 1;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_254ECA9A4(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x25A280930](v8, v4);
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_254ED1C70();
          sub_254ED1C90();
          unint64_t v4 = v15;
          sub_254ED1CA0();
          sub_254ED1C80();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_254ED1CC0();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t convertDateIntoNumericRepresentation(date:)(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v26 = sub_254ED1720();
  uint64_t v1 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_254ED1660();
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254ED1700();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E707E8);
  uint64_t v7 = sub_254ED1710();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_254ED2290;
  unint64_t v12 = v11 + v10;
  char v13 = *(void (**)(unint64_t, void, uint64_t))(v8 + 104);
  v13(v12, *MEMORY[0x263F07870], v7);
  v13(v12 + v9, *MEMORY[0x263F078A8], v7);
  v13(v12 + 2 * v9, *MEMORY[0x263F078A0], v7);
  sub_254ECF12C(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_254ED16F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v26);
  uint64_t result = sub_254ED1640();
  if (v15) {
    goto LABEL_13;
  }
  uint64_t v16 = 10000 * result;
  if ((unsigned __int128)(result * (__int128)10000) >> 64 != (10000 * result) >> 63)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = sub_254ED1650();
  if (v17)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v18 = 100 * result;
  if ((unsigned __int128)(result * (__int128)100) >> 64 != (100 * result) >> 63) {
    goto LABEL_10;
  }
  BOOL v19 = __OFADD__(v16, v18);
  uint64_t v20 = v16 + v18;
  if (v19)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t result = sub_254ED1630();
  if (v21)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v22 = result;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
  uint64_t result = v20 + v22;
  if (__OFADD__(v20, v22)) {
    goto LABEL_12;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_254ECAEBC()
{
  return sub_254ED1D90();
}

uint64_t sub_254ECAF04()
{
  return sub_254ED1D80();
}

uint64_t sub_254ECAF30()
{
  return sub_254ED1D90();
}

BOOL sub_254ECAF74(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_254ECAF88@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_254ECAF98(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_254ECAFA4(char a1, int64_t a2, char a3, unint64_t a4)
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708B8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_254ED1CB0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
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
    sub_254ECEE74(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_254ECB214(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    unint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_254ED1CB0();
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
    sub_254ECEFD0(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_254ECB494(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_254ECB568(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_254ECF570((uint64_t)v12, *a3);
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
      sub_254ECF570((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_254ECB568(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_254ED1C20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_254ECB724(a5, a6);
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
  uint64_t v8 = sub_254ED1C60();
  if (!v8)
  {
    sub_254ED1CB0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_254ED1D00();
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

uint64_t sub_254ECB724(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_254ECB7BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_254ECB99C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_254ECB99C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_254ECB7BC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_254ECB934(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_254ED1C40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_254ED1CB0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_254ED1B50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_254ED1D00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_254ED1CB0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_254ECB934(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70958);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_254ECB99C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E70958);
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
  uint64_t result = sub_254ED1D00();
  __break(1u);
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

unint64_t sub_254ECBB30(uint64_t a1)
{
  sub_254ED1D70();
  sub_254ED1D80();
  uint64_t v2 = sub_254ED1D90();
  return sub_254ECBCAC(a1, v2);
}

unint64_t sub_254ECBB9C(uint64_t a1, uint64_t a2)
{
  sub_254ED1D70();
  sub_254ED1B30();
  uint64_t v4 = sub_254ED1D90();
  return sub_254ECBD48(a1, a2, v4);
}

unint64_t sub_254ECBC14(uint64_t a1)
{
  sub_254ED16D0();
  sub_254ECFAE4(&qword_269E708A8, MEMORY[0x263F07490]);
  uint64_t v2 = sub_254ED1AD0();
  return sub_254ECBE2C(a1, v2);
}

unint64_t sub_254ECBCAC(uint64_t a1, uint64_t a2)
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

unint64_t sub_254ECBD48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_254ED1D30() & 1) == 0)
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
      while (!v14 && (sub_254ED1D30() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_254ECBE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_254ED16D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_254ECFAE4(&qword_269E708E8, MEMORY[0x263F07490]);
      char v15 = sub_254ED1B10();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_254ECBFEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708D0);
  uint64_t v6 = sub_254ED1CE0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_254ECF50C(v24, v35);
      }
      else
      {
        sub_254ECF570((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_254ED1D70();
      sub_254ED1B30();
      uint64_t result = sub_254ED1D90();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      char v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *char v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_254ECF50C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_254ECC2EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708B0);
  char v36 = a2;
  uint64_t v6 = sub_254ED1CE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_254ED1D70();
    sub_254ED1B30();
    uint64_t result = sub_254ED1D90();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_254ECC604(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_254ED16D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  int v48 = a2;
  uint64_t v12 = sub_254ED1CE0();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  long long v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    BOOL v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_bridgeObjectRetain();
    }
    sub_254ECFAE4(&qword_269E708A8, MEMORY[0x263F07490]);
    uint64_t result = sub_254ED1AD0();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  BOOL v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

uint64_t sub_254ECCA2C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_254ED16D0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_254ECCAE4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
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
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_254ECB214(isUniquelyReferenced_nonNull_native, v23, 1, v3, &qword_269E70870, MEMORY[0x263F1BF70], MEMORY[0x263F1BF70]);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_254ED17F0() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

uint64_t sub_254ECCCC4(uint64_t a1, uint64_t a2, char a3)
{
  int64_t v4 = (void **)v3;
  uint64_t v8 = sub_254ED16D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_254ECBC14(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_254ECD21C(&qword_269E70960);
    goto LABEL_7;
  }
  sub_254ECC604(v17, a3 & 1, &qword_269E70960);
  unint64_t v23 = sub_254ECBC14(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_254ED1D60();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_254ECCA2C(v14, (uint64_t)v11, a1, v20);
}

void *sub_254ECCE7C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_254ED1CD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_254ECF570(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_254ECF50C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_254ECD064()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_254ED1CD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_254ECD21C(uint64_t *a1)
{
  uint64_t v3 = sub_254ED16D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  int64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = sub_254ED1CD0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *int64_t v26 = v9;
    return result;
  }
  uint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_254ECD4B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_254ECD4F0(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_254ECD4D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_254ECD738(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_254ECD4F0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E708B8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

uint64_t sub_254ECD738(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E708F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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
  int64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

uint64_t sub_254ECD8A4(void **a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_254ECED50(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_254ECD950(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_254ECD950(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  uint64_t v4 = *(void *)(v130 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v130);
  uint64_t v126 = (uint64_t)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v136 = (uint64_t)&v121 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v133 = (uint64_t)&v121 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v132 = (uint64_t)&v121 - v11;
  uint64_t v12 = a1;
  uint64_t v13 = a1[1];
  uint64_t result = sub_254ED1D10();
  if (result >= v13)
  {
    if (v13 < 0) {
      goto LABEL_141;
    }
    if (v13) {
      return sub_254ECE3A4(0, v13, 1, a1);
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
    goto LABEL_149;
  }
  uint64_t v129 = v4;
  uint64_t v123 = result;
  if (v13 < 2)
  {
    uint64_t v20 = (char *)MEMORY[0x263F8EE78];
    unint64_t v128 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    unint64_t v19 = a1;
    uint64_t v122 = MEMORY[0x263F8EE78];
    if (v13 != 1)
    {
      unint64_t v22 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_107:
      uint64_t v114 = v20;
      if (v22 >= 2)
      {
        uint64_t v115 = *v19;
        do
        {
          unint64_t v116 = v22 - 2;
          if (v22 < 2) {
            goto LABEL_136;
          }
          if (!v115) {
            goto LABEL_148;
          }
          uint64_t v117 = *(void *)&v114[16 * v116 + 32];
          uint64_t v118 = *(void *)&v114[16 * v22 + 24];
          sub_254ECE628(v115 + *(void *)(v129 + 72) * v117, v115 + *(void *)(v129 + 72) * *(void *)&v114[16 * v22 + 16], v115 + *(void *)(v129 + 72) * v118, v128);
          if (v2) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_137;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v114 = sub_254ECED3C((uint64_t)v114);
          }
          if (v116 >= *((void *)v114 + 2)) {
            goto LABEL_138;
          }
          uint64_t v119 = &v114[16 * v116 + 32];
          *(void *)uint64_t v119 = v117;
          *((void *)v119 + 1) = v118;
          unint64_t v120 = *((void *)v114 + 2);
          if (v22 > v120) {
            goto LABEL_139;
          }
          memmove(&v114[16 * v22 + 16], &v114[16 * v22 + 32], 16 * (v120 - v22));
          *((void *)v114 + 2) = v120 - 1;
          unint64_t v22 = v120 - 1;
        }
        while (v120 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v122 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v16 = v15 >> 1;
    uint64_t v17 = sub_254ED1BB0();
    *(void *)(v17 + 16) = v16;
    uint64_t v18 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v122 = v17;
    unint64_t v128 = v17 + ((v18 + 32) & ~v18);
    unint64_t v19 = v12;
  }
  uint64_t v21 = 0;
  uint64_t v20 = (char *)MEMORY[0x263F8EE78];
  uint64_t v135 = v19;
  while (1)
  {
    uint64_t v23 = v21 + 1;
    uint64_t v127 = v21;
    if (v21 + 1 >= v13)
    {
      uint64_t v41 = v21 + 1;
      goto LABEL_58;
    }
    uint64_t v24 = *v19;
    uint64_t v25 = *(void *)(v129 + 72);
    uint64_t v26 = *v19 + v25 * v23;
    uint64_t v27 = v132;
    uint64_t v134 = v13;
    sub_254ECF7D8(v26, v132, &qword_269E70838);
    uint64_t v28 = v24 + v25 * v21;
    uint64_t v29 = v133;
    sub_254ECF7D8(v28, v133, &qword_269E70838);
    LODWORD(v131) = sub_254ED16A0();
    uint64_t v30 = v29;
    uint64_t v21 = v127;
    sub_254ECF6BC(v30, &qword_269E70838);
    uint64_t v31 = v134;
    sub_254ECF6BC(v27, &qword_269E70838);
    uint64_t v32 = v21 + 2;
    uint64_t v125 = v24;
    uint64_t v137 = v25;
    if (v21 + 2 >= v31)
    {
      uint64_t v35 = v21 + 2;
      unint64_t v19 = v135;
      uint64_t v40 = v25;
      if ((v131 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v124 = v2;
      uint64_t v33 = v25 * v23;
      uint64_t v34 = v24;
      uint64_t v35 = v32;
      uint64_t v36 = v25 * v32;
      do
      {
        uint64_t v37 = v132;
        sub_254ECF7D8(v34 + v36, v132, &qword_269E70838);
        uint64_t v38 = v133;
        sub_254ECF7D8(v34 + v33, v133, &qword_269E70838);
        int v39 = sub_254ED16A0();
        sub_254ECF6BC(v38, &qword_269E70838);
        sub_254ECF6BC(v37, &qword_269E70838);
        if ((v131 ^ v39))
        {
          uint64_t v31 = v134;
          unint64_t v19 = v135;
          uint64_t v2 = v124;
          uint64_t v24 = v125;
          uint64_t v21 = v127;
          uint64_t v40 = v137;
          if ((v131 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_24;
        }
        uint64_t v40 = v137;
        v34 += v137;
        ++v35;
        uint64_t v31 = v134;
      }
      while (v134 != v35);
      uint64_t v35 = v134;
      unint64_t v19 = v135;
      uint64_t v2 = v124;
      uint64_t v24 = v125;
      uint64_t v21 = v127;
      if ((v131 & 1) == 0)
      {
LABEL_37:
        uint64_t v41 = v35;
        break;
      }
    }
LABEL_24:
    if (v35 < v21) {
      goto LABEL_142;
    }
    uint64_t v41 = v35;
    if (v21 >= v35) {
      break;
    }
    uint64_t v124 = v2;
    uint64_t v42 = 0;
    uint64_t v43 = v40 * (v35 - 1);
    uint64_t v44 = v35 * v40;
    uint64_t v45 = v21 * v40;
    do
    {
      if (v21 != v41 + v42 - 1)
      {
        if (!v24) {
          goto LABEL_147;
        }
        uint64_t v131 = v24 + v43;
        sub_254ECF63C(v24 + v45, v126, &qword_269E70838);
        if (v45 < v43 || v24 + v45 >= (unint64_t)(v24 + v44))
        {
          uint64_t v46 = v131;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v46 = v131;
          if (v45 != v43) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        sub_254ECF63C(v126, v46, &qword_269E70838);
        unint64_t v19 = v135;
        uint64_t v41 = v35;
        uint64_t v24 = v125;
        uint64_t v40 = v137;
      }
      ++v21;
      --v42;
      v43 -= v40;
      v44 -= v40;
      v45 += v40;
    }
    while (v21 < v41 + v42);
    uint64_t v2 = v124;
    uint64_t v21 = v127;
    uint64_t v31 = v134;
    if (v41 < v134) {
      goto LABEL_39;
    }
LABEL_58:
    if (v41 < v21) {
      goto LABEL_135;
    }
    uint64_t v60 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v134 = v41;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v20 = sub_254ECEAFC(0, *((void *)v20 + 2) + 1, 1, v20);
    }
    unint64_t v63 = *((void *)v20 + 2);
    unint64_t v62 = *((void *)v20 + 3);
    unint64_t v22 = v63 + 1;
    if (v63 >= v62 >> 1) {
      uint64_t v20 = sub_254ECEAFC((char *)(v62 > 1), v63 + 1, 1, v20);
    }
    unint64_t v19 = v60;
    uint64_t v64 = v2;
    *((void *)v20 + 2) = v22;
    uint64_t v65 = v20 + 32;
    uint64_t v66 = &v20[16 * v63 + 32];
    uint64_t v67 = v134;
    *(void *)uint64_t v66 = v127;
    *((void *)v66 + 1) = v67;
    if (v63)
    {
      while (1)
      {
        unint64_t v68 = v22 - 1;
        if (v22 >= 4)
        {
          uint64_t v73 = &v65[16 * v22];
          uint64_t v74 = *((void *)v73 - 8);
          uint64_t v75 = *((void *)v73 - 7);
          BOOL v79 = __OFSUB__(v75, v74);
          uint64_t v76 = v75 - v74;
          if (v79) {
            goto LABEL_124;
          }
          uint64_t v78 = *((void *)v73 - 6);
          uint64_t v77 = *((void *)v73 - 5);
          BOOL v79 = __OFSUB__(v77, v78);
          uint64_t v71 = v77 - v78;
          char v72 = v79;
          if (v79) {
            goto LABEL_125;
          }
          unint64_t v80 = v22 - 2;
          uint64_t v81 = &v65[16 * v22 - 32];
          uint64_t v83 = *(void *)v81;
          uint64_t v82 = *((void *)v81 + 1);
          BOOL v79 = __OFSUB__(v82, v83);
          uint64_t v84 = v82 - v83;
          if (v79) {
            goto LABEL_127;
          }
          BOOL v79 = __OFADD__(v71, v84);
          uint64_t v85 = v71 + v84;
          if (v79) {
            goto LABEL_130;
          }
          if (v85 >= v76)
          {
            uint64_t v103 = &v65[16 * v68];
            uint64_t v105 = *(void *)v103;
            uint64_t v104 = *((void *)v103 + 1);
            BOOL v79 = __OFSUB__(v104, v105);
            uint64_t v106 = v104 - v105;
            if (v79) {
              goto LABEL_134;
            }
            BOOL v96 = v71 < v106;
            goto LABEL_95;
          }
        }
        else
        {
          if (v22 != 3)
          {
            uint64_t v97 = *((void *)v20 + 4);
            uint64_t v98 = *((void *)v20 + 5);
            BOOL v79 = __OFSUB__(v98, v97);
            uint64_t v90 = v98 - v97;
            char v91 = v79;
            goto LABEL_89;
          }
          uint64_t v70 = *((void *)v20 + 4);
          uint64_t v69 = *((void *)v20 + 5);
          BOOL v79 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          char v72 = v79;
        }
        if (v72) {
          goto LABEL_126;
        }
        unint64_t v80 = v22 - 2;
        unint64_t v86 = &v65[16 * v22 - 32];
        uint64_t v88 = *(void *)v86;
        uint64_t v87 = *((void *)v86 + 1);
        BOOL v89 = __OFSUB__(v87, v88);
        uint64_t v90 = v87 - v88;
        char v91 = v89;
        if (v89) {
          goto LABEL_129;
        }
        uint64_t v92 = &v65[16 * v68];
        uint64_t v94 = *(void *)v92;
        uint64_t v93 = *((void *)v92 + 1);
        BOOL v79 = __OFSUB__(v93, v94);
        uint64_t v95 = v93 - v94;
        if (v79) {
          goto LABEL_132;
        }
        if (__OFADD__(v90, v95)) {
          goto LABEL_133;
        }
        if (v90 + v95 >= v71)
        {
          BOOL v96 = v71 < v95;
LABEL_95:
          if (v96) {
            unint64_t v68 = v80;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v91) {
          goto LABEL_128;
        }
        uint64_t v99 = &v65[16 * v68];
        uint64_t v101 = *(void *)v99;
        uint64_t v100 = *((void *)v99 + 1);
        BOOL v79 = __OFSUB__(v100, v101);
        uint64_t v102 = v100 - v101;
        if (v79) {
          goto LABEL_131;
        }
        if (v102 < v90) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v107 = v68 - 1;
        if (v68 - 1 >= v22)
        {
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
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v19) {
          goto LABEL_146;
        }
        uint64_t v108 = v20;
        uint64_t v109 = &v65[16 * v107];
        uint64_t v110 = *(void *)v109;
        uint64_t v111 = &v65[16 * v68];
        uint64_t v112 = *((void *)v111 + 1);
        sub_254ECE628(*v19 + *(void *)(v129 + 72) * *(void *)v109, *v19 + *(void *)(v129 + 72) * *(void *)v111, *v19 + *(void *)(v129 + 72) * v112, v128);
        if (v64) {
          goto LABEL_118;
        }
        if (v112 < v110) {
          goto LABEL_121;
        }
        if (v68 > *((void *)v108 + 2)) {
          goto LABEL_122;
        }
        *(void *)uint64_t v109 = v110;
        *(void *)&v65[16 * v107 + 8] = v112;
        unint64_t v113 = *((void *)v108 + 2);
        if (v68 >= v113) {
          goto LABEL_123;
        }
        uint64_t v20 = v108;
        unint64_t v22 = v113 - 1;
        memmove(&v65[16 * v68], v111 + 16, 16 * (v113 - 1 - v68));
        *((void *)v108 + 2) = v113 - 1;
        unint64_t v19 = v135;
        if (v113 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v22 = 1;
LABEL_14:
    uint64_t v13 = v19[1];
    uint64_t v21 = v134;
    uint64_t v2 = v64;
    if (v134 >= v13) {
      goto LABEL_107;
    }
  }
  if (v41 >= v31) {
    goto LABEL_58;
  }
LABEL_39:
  if (__OFSUB__(v41, v21)) {
    goto LABEL_140;
  }
  if (v41 - v21 >= v123) {
    goto LABEL_58;
  }
  if (__OFADD__(v21, v123)) {
    goto LABEL_143;
  }
  if (v21 + v123 >= v31) {
    uint64_t v47 = v31;
  }
  else {
    uint64_t v47 = v21 + v123;
  }
  if (v47 >= v21)
  {
    if (v41 != v47)
    {
      unint64_t v121 = v20;
      uint64_t v124 = v2;
      uint64_t v125 = v47;
      uint64_t v48 = *(void *)(v129 + 72);
      uint64_t v137 = v48 * (v41 - 1);
      uint64_t v131 = v48;
      uint64_t v49 = v41 * v48;
      do
      {
        uint64_t v51 = 0;
        uint64_t v134 = v41;
        while (1)
        {
          uint64_t v52 = *v19;
          uint64_t v53 = v49;
          uint64_t v54 = v49 + v51;
          uint64_t v55 = v19;
          uint64_t v56 = v132;
          sub_254ECF7D8(v54 + *v19, v132, &qword_269E70838);
          uint64_t v57 = v133;
          sub_254ECF7D8(v137 + v51 + v52, v133, &qword_269E70838);
          LOBYTE(v52) = sub_254ED16A0();
          sub_254ECF6BC(v57, &qword_269E70838);
          sub_254ECF6BC(v56, &qword_269E70838);
          if ((v52 & 1) == 0) {
            break;
          }
          uint64_t v58 = *v55;
          if (!*v55) {
            goto LABEL_145;
          }
          uint64_t v49 = v53;
          uint64_t v59 = v58 + v137 + v51;
          sub_254ECF63C(v58 + v53 + v51, v136, &qword_269E70838);
          swift_arrayInitWithTakeFrontToBack();
          sub_254ECF63C(v136, v59, &qword_269E70838);
          v51 -= v131;
          ++v21;
          uint64_t v50 = v134;
          unint64_t v19 = v135;
          if (v134 == v21) {
            goto LABEL_49;
          }
        }
        uint64_t v50 = v134;
        unint64_t v19 = v55;
        uint64_t v49 = v53;
LABEL_49:
        uint64_t v41 = v50 + 1;
        v137 += v131;
        v49 += v131;
        uint64_t v21 = v127;
      }
      while (v41 != v125);
      uint64_t v41 = v125;
      uint64_t v2 = v124;
      uint64_t v20 = v121;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  uint64_t result = sub_254ED1CB0();
  __break(1u);
  return result;
}

uint64_t sub_254ECE3A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  uint64_t v7 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v27 = (uint64_t)&v23 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  size_t v14 = (char *)&v23 - v13;
  uint64_t v29 = a3;
  uint64_t v24 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v32 = v15 * (v29 - 1);
    uint64_t v28 = v15;
    uint64_t v31 = v15 * v29;
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v17 = v25;
    while (1)
    {
      uint64_t v18 = *a4;
      sub_254ECF7D8(v31 + v16 + *a4, (uint64_t)v14, &qword_269E70838);
      uint64_t v19 = v27;
      sub_254ECF7D8(v32 + v16 + v18, v27, &qword_269E70838);
      LOBYTE(v18) = sub_254ED16A0();
      sub_254ECF6BC(v19, &qword_269E70838);
      uint64_t result = sub_254ECF6BC((uint64_t)v14, &qword_269E70838);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        v32 += v28;
        v31 += v28;
        if (++v29 == v24) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = a4;
      uint64_t v22 = v20 + v32 + v16;
      sub_254ECF63C(v20 + v31 + v16, v30, &qword_269E70838);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_254ECF63C(v30, v22, &qword_269E70838);
      v16 -= v28;
      ++v17;
      a4 = v21;
      if (v29 == v17) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_254ECE628(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  uint64_t v44 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_62;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_63;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v13;
  unint64_t v47 = a1;
  unint64_t v46 = a4;
  uint64_t v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v25 = a4 + v18;
      unint64_t v45 = a4 + v18;
      unint64_t v47 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v27 = -v13;
        unint64_t v41 = a4;
        unint64_t v42 = a1;
        do
        {
          unint64_t v28 = a3 + v27;
          sub_254ECF7D8(v25 + v27, (uint64_t)v11, &qword_269E70838);
          unint64_t v29 = a2 + v27;
          unint64_t v30 = a3;
          uint64_t v31 = (uint64_t)v11;
          uint64_t v32 = v44;
          sub_254ECF7D8(a2 + v27, v44, &qword_269E70838);
          char v33 = sub_254ED16A0();
          uint64_t v34 = v32;
          uint64_t v11 = (char *)v31;
          sub_254ECF6BC(v34, &qword_269E70838);
          sub_254ECF6BC(v31, &qword_269E70838);
          if (v33)
          {
            if (v30 < a2 || v28 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v47 += v27;
          }
          else
          {
            unint64_t v38 = v45;
            v45 += v27;
            if (v30 < v38 || v28 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v29 = a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == v38;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v29 = a2;
            }
          }
          unint64_t v25 = v45;
          if (v45 <= v37) {
            break;
          }
          a2 = v29;
          a3 = v28;
        }
        while (v29 > v36);
      }
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v42 = a4 + v17;
    unint64_t v45 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v20 = v44;
      do
      {
        sub_254ECF7D8(a2, (uint64_t)v11, &qword_269E70838);
        sub_254ECF7D8(a4, v20, &qword_269E70838);
        char v21 = sub_254ED16A0();
        sub_254ECF6BC(v20, &qword_269E70838);
        sub_254ECF6BC((uint64_t)v11, &qword_269E70838);
        unint64_t v22 = v47;
        if (v21)
        {
          unint64_t v23 = a2 + v13;
          if (v47 < a2 || v47 >= v23)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            unint64_t v22 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v24 = v46 + v13;
          if (v47 < v46 || v47 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v46 = v24;
          unint64_t v23 = a2;
        }
        unint64_t v47 = v22 + v13;
        a4 = v46;
        if (v46 >= v42) {
          break;
        }
        a2 = v23;
      }
      while (v23 < a3);
    }
LABEL_60:
    sub_254ECEBF8(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_64:
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

char *sub_254ECEAFC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E708D8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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

uint64_t sub_254ECEBF8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269E70838);
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
    uint64_t result = sub_254ED1D00();
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

char *sub_254ECED3C(uint64_t a1)
{
  return sub_254ECEAFC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_254ECED50(void *a1)
{
  return sub_254ECD4F0(0, a1[2], 0, a1);
}

unint64_t sub_254ECED64(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70998);
  unint64_t v3 = (void *)sub_254ED1CF0();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_254ECBB30(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    uint64_t v10 = (void *)(v3[7] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_254ECBB30(v4);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_254ECEE74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269E70838) - 8);
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
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

uint64_t sub_254ECEFD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_254ED1D00();
  __break(1u);
  return result;
}

uint64_t sub_254ECF12C(uint64_t a1)
{
  uint64_t v2 = sub_254ED1710();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E707F0);
    uint64_t v9 = sub_254ED1C30();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    BOOL v35 = v12;
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
      sub_254ECFAE4(&qword_269E707F8, MEMORY[0x263F07908]);
      uint64_t v16 = sub_254ED1AD0();
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
          sub_254ECFAE4(&qword_269E70800, MEMORY[0x263F07908]);
          char v23 = sub_254ED1B10();
          unint64_t v24 = *v15;
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
        unint64_t v25 = v37;
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

uint64_t sub_254ECF444(uint64_t a1)
{
  return sub_254EC761C(a1, v1[2], v1[3], v1[4]);
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

uint64_t sub_254ECF498(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_254ECF50C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
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

uint64_t sub_254ECF570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_254ECF5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E708C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_254ECF634()
{
  return swift_release();
}

uint64_t sub_254ECF63C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_254ECF6A0(uint64_t a1, uint64_t a2)
{
  return sub_254EC7B14(a1, a2, *(unint64_t **)(v2 + 16));
}

uint64_t sub_254ECF6BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_254ECF718()
{
  unint64_t result = qword_269E70938;
  if (!qword_269E70938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E70938);
  }
  return result;
}

uint64_t sub_254ECF76C(unint64_t *a1, uint64_t *a2)
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

void sub_254ECF7B0(uint64_t a1)
{
  sub_254ECA104(a1, *(void **)(v1 + 16));
}

uint64_t sub_254ECF7B8(id *a1)
{
  return sub_254ECA5D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_254ECF7D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_254ECF83C()
{
  return objectdestroyTm(&qword_269E70970);
}

uint64_t sub_254ECF848(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E70970);
  return sub_254ECA2AC(a1, a2);
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

void sub_254ECF8E4(uint64_t a1)
{
  sub_254EC9ABC(a1, *(void **)(v1 + 16));
}

uint64_t sub_254ECF8EC()
{
  return objectdestroyTm(&qword_269E709A0);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

unint64_t sub_254ECF984(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E709A0);
  return sub_254EC9C78(a1);
}

uint64_t sub_254ECFA08(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for RTLocationOfInterestType()
{
  if (!qword_269E709B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269E709B0);
    }
  }
}

uint64_t sub_254ECFA9C()
{
  return sub_254ECFAE4(&qword_269E709B8, (void (*)(uint64_t))type metadata accessor for RTLocationOfInterestType);
}

uint64_t sub_254ECFAE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_254ECFB38()
{
  uint64_t v0 = sub_254ED1AC0();
  __swift_allocate_value_buffer(v0, qword_269E709F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269E709F0);
  return sub_254ED1AB0();
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

BOOL static DeviceLockState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DeviceLockState.hash(into:)()
{
  return sub_254ED1D80();
}

uint64_t DeviceLockState.hashValue.getter()
{
  return sub_254ED1D90();
}

BOOL sub_254ECFCA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_254ECFCBC()
{
  return sub_254ED1D90();
}

uint64_t sub_254ECFD04()
{
  return sub_254ED1D80();
}

uint64_t sub_254ECFD30()
{
  return sub_254ED1D90();
}

LighthouseQuartz::DeviceLockState __swiftcall getDeviceLockState()()
{
  uint64_t v1 = v0;
  int v2 = MKBGetDeviceLockState();
  char v3 = 5;
  switch(v2)
  {
    case 0:
      char v3 = 3;
      break;
    case 1:
      int v2 = MKBDeviceUnlockedSinceBoot();
      if (v2) {
        char v3 = 2;
      }
      else {
        char v3 = 1;
      }
      break;
    case 2:
      char v3 = 4;
      break;
    case 3:
      break;
    default:
      char v3 = 0;
      break;
  }
  char *v1 = v3;
  return (char)v2;
}

Swift::Bool __swiftcall isDiagnosticsSubmissionAllowed()()
{
  return sub_254ECFE20((SEL *)&selRef_isDiagnosticSubmissionAllowed);
}

Swift::Bool __swiftcall isHealthDataSubmissionAllowed()()
{
  return sub_254ECFE20((SEL *)&selRef_isHealthDataSubmissionAllowed);
}

id sub_254ECFE20(SEL *a1)
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    char v3 = result;
    id v4 = [result *a1];

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_254ECFE84()
{
  unint64_t result = qword_269E709C0;
  if (!qword_269E709C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E709C0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceLockState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeviceLockState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254ED0044);
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

uint64_t sub_254ED006C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_254ED0078(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceLockState()
{
  return &type metadata for DeviceLockState;
}

uint64_t ActivityType.init(entityClass:)@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_254ED19D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v48 - v9;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v48 - v9, a1, v4);
  sub_254ED1940();
  sub_254ED0BB0();
  char v11 = sub_254ED1B10();
  unint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if (v11)
  {
    char v13 = 0;
LABEL_51:
    v12(a1, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    goto LABEL_52;
  }
  sub_254ED1860();
  char v14 = sub_254ED1B10();
  v12(v8, v4);
  if (v14)
  {
    char v13 = 1;
    goto LABEL_51;
  }
  sub_254ED18C0();
  char v15 = sub_254ED1B10();
  v12(v8, v4);
  if (v15)
  {
    char v13 = 2;
    goto LABEL_51;
  }
  sub_254ED18C0();
  char v16 = sub_254ED1B10();
  v12(v8, v4);
  if (v16)
  {
    char v13 = 3;
    goto LABEL_51;
  }
  sub_254ED1940();
  char v17 = sub_254ED1B10();
  v12(v8, v4);
  if (v17)
  {
    char v13 = 4;
    goto LABEL_51;
  }
  sub_254ED18C0();
  char v18 = sub_254ED1B10();
  v12(v8, v4);
  if (v18)
  {
    char v13 = 5;
    goto LABEL_51;
  }
  sub_254ED1890();
  char v19 = sub_254ED1B10();
  v12(v8, v4);
  if (v19)
  {
    char v13 = 6;
    goto LABEL_51;
  }
  sub_254ED1880();
  char v20 = sub_254ED1B10();
  v12(v8, v4);
  if (v20)
  {
    char v13 = 7;
    goto LABEL_51;
  }
  sub_254ED1900();
  char v21 = sub_254ED1B10();
  v12(v8, v4);
  if (v21)
  {
    char v13 = 8;
    goto LABEL_51;
  }
  sub_254ED1840();
  char v22 = sub_254ED1B10();
  v12(v8, v4);
  if (v22)
  {
    char v13 = 9;
    goto LABEL_51;
  }
  sub_254ED1920();
  char v23 = sub_254ED1B10();
  v12(v8, v4);
  if (v23)
  {
    char v13 = 10;
    goto LABEL_51;
  }
  sub_254ED19B0();
  char v24 = sub_254ED1B10();
  v12(v8, v4);
  if (v24)
  {
    char v13 = 11;
    goto LABEL_51;
  }
  sub_254ED18B0();
  char v25 = sub_254ED1B10();
  v12(v8, v4);
  if (v25)
  {
    char v13 = 12;
    goto LABEL_51;
  }
  sub_254ED18A0();
  char v26 = sub_254ED1B10();
  v12(v8, v4);
  if (v26)
  {
    char v13 = 13;
    goto LABEL_51;
  }
  sub_254ED1860();
  char v27 = sub_254ED1B10();
  v12(v8, v4);
  if (v27)
  {
    char v13 = 14;
    goto LABEL_51;
  }
  sub_254ED1820();
  char v28 = sub_254ED1B10();
  v12(v8, v4);
  if (v28)
  {
    char v13 = 15;
    goto LABEL_51;
  }
  sub_254ED1960();
  char v29 = sub_254ED1B10();
  v12(v8, v4);
  if (v29)
  {
    char v13 = 16;
    goto LABEL_51;
  }
  sub_254ED18D0();
  char v30 = sub_254ED1B10();
  v12(v8, v4);
  if (v30)
  {
    char v13 = 17;
    goto LABEL_51;
  }
  sub_254ED1970();
  char v31 = sub_254ED1B10();
  v12(v8, v4);
  if (v31)
  {
    char v13 = 18;
    goto LABEL_51;
  }
  sub_254ED18E0();
  char v32 = sub_254ED1B10();
  v12(v8, v4);
  if (v32)
  {
    char v13 = 19;
    goto LABEL_51;
  }
  sub_254ED1910();
  char v33 = sub_254ED1B10();
  v12(v8, v4);
  if (v33)
  {
    char v13 = 20;
    goto LABEL_51;
  }
  sub_254ED1870();
  char v34 = sub_254ED1B10();
  v12(v8, v4);
  if (v34)
  {
    char v13 = 21;
    goto LABEL_51;
  }
  sub_254ED1990();
  char v35 = sub_254ED1B10();
  v12(v8, v4);
  if (v35)
  {
    char v13 = 22;
    goto LABEL_51;
  }
  sub_254ED1830();
  char v36 = sub_254ED1B10();
  v12(v8, v4);
  if (v36)
  {
    char v13 = 23;
    goto LABEL_51;
  }
  sub_254ED1980();
  char v37 = sub_254ED1B10();
  v12(v8, v4);
  if (v37)
  {
    char v13 = 24;
    goto LABEL_51;
  }
  sub_254ED18F0();
  char v39 = sub_254ED1B10();
  v12(v8, v4);
  if (v39)
  {
    v12(a1, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    char v13 = 25;
  }
  else
  {
    sub_254ED1930();
    char v40 = sub_254ED1B10();
    v12(v8, v4);
    if (v40)
    {
      v12(a1, v4);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
      char v13 = 26;
    }
    else
    {
      sub_254ED1950();
      char v41 = sub_254ED1B10();
      v12(v8, v4);
      if (v41)
      {
        v12(a1, v4);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
        char v13 = 27;
      }
      else
      {
        sub_254ED19B0();
        char v42 = sub_254ED1B10();
        v12(v8, v4);
        if (v42)
        {
          v12(a1, v4);
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
          char v13 = 28;
        }
        else
        {
          sub_254ED1910();
          char v43 = sub_254ED1B10();
          v12(v8, v4);
          if (v43)
          {
            v12(a1, v4);
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
            char v13 = 29;
          }
          else
          {
            sub_254ED1850();
            char v44 = sub_254ED1B10();
            v12(v8, v4);
            if (v44)
            {
              v12(a1, v4);
              uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
              char v13 = 30;
            }
            else
            {
              sub_254ED19C0();
              char v45 = sub_254ED1B10();
              v12(v8, v4);
              if (v45)
              {
                v12(a1, v4);
                uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                char v13 = 31;
              }
              else
              {
                sub_254ED1810();
                char v46 = sub_254ED1B10();
                v12(v8, v4);
                if (v46)
                {
                  v12(a1, v4);
                  uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                  char v13 = 32;
                }
                else
                {
                  sub_254ED19A0();
                  char v47 = sub_254ED1B10();
                  v12(a1, v4);
                  v12(v8, v4);
                  uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
                  if (v47) {
                    char v13 = 33;
                  }
                  else {
                    char v13 = 34;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_52:
  *a2 = v13;
  return result;
}

unint64_t sub_254ED0BB0()
{
  unint64_t result = qword_269E709C8;
  if (!qword_269E709C8)
  {
    sub_254ED19D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E709C8);
  }
  return result;
}

uint64_t ActivityType.rawValue.getter()
{
  uint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      return 0xD00000000000001DLL;
    case 2:
      return 0xD000000000000015;
    case 3:
      return 0xD00000000000001ALL;
    case 4:
      return 0xD000000000000012;
    case 5:
      return 0xD00000000000001ALL;
    case 6:
    case 7:
    case 8:
    case 0xA:
      return 0xD000000000000011;
    case 9:
      return 0xD000000000000010;
    case 0xB:
      return 0xD00000000000001DLL;
    case 0xC:
      return 0xD00000000000001FLL;
    case 0xD:
      unsigned int v2 = 1802661751;
      return v2 | 0x676E6900000000;
    case 0xE:
      unsigned int v2 = 1952802157;
      return v2 | 0x676E6900000000;
    case 0xF:
      return 0x676E69746165;
    case 0x10:
      return 0x676E696863746177;
    case 0x11:
      unsigned int v3 = 1886349427;
      return v3 | 0x676E697000000000;
    case 0x12:
      return 0x6E6C7566646E696DLL;
    case 0x13:
      unsigned int v3 = 1701145715;
      return v3 | 0x676E697000000000;
    case 0x14:
      uint64_t v4 = 0x6C6576617274;
      goto LABEL_32;
    case 0x15:
      unsigned int v2 = 1684104562;
      return v2 | 0x676E6900000000;
    case 0x16:
      return 0x6E6F697461636176;
    case 0x17:
      return 0x676E696D6167;
    case 0x18:
      return 0x7A696C6169636F73;
    case 0x19:
      return 0x7055676E696B6177;
    case 0x1A:
      return 0x656D6974646562;
    case 0x1B:
      return 0x616E6F6974617473;
    case 0x1C:
      return 0x746867696C66;
    case 0x1D:
      return 1885958772;
    case 0x1E:
      uint64_t v4 = 0x74756D6D6F63;
LABEL_32:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000;
      break;
    case 0x1F:
      uint64_t result = 0x6E69646E65747461;
      break;
    case 0x20:
      uint64_t result = 0x754F676E696E6964;
      break;
    case 0x21:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

void *static ActivityType.allCases.getter()
{
  return &unk_2703FA3A0;
}

LighthouseQuartz::ActivityType_optional __swiftcall ActivityType.init(rawValue:)(Swift::String rawValue)
{
  unsigned int v2 = v1;
  uint64_t v3 = sub_254ED1D40();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 16;
  switch(v3)
  {
    case 0:
      goto LABEL_18;
    case 1:
      char v5 = 1;
      goto LABEL_18;
    case 2:
      char v5 = 2;
      goto LABEL_18;
    case 3:
      char v5 = 3;
      goto LABEL_18;
    case 4:
      char v5 = 4;
      goto LABEL_18;
    case 5:
      char v5 = 5;
      goto LABEL_18;
    case 6:
      char v5 = 6;
      goto LABEL_18;
    case 7:
      char v5 = 7;
      goto LABEL_18;
    case 8:
      char v5 = 8;
      goto LABEL_18;
    case 9:
      char v5 = 9;
      goto LABEL_18;
    case 10:
      char v5 = 10;
      goto LABEL_18;
    case 11:
      char v5 = 11;
      goto LABEL_18;
    case 12:
      char v5 = 12;
      goto LABEL_18;
    case 13:
      char v5 = 13;
      goto LABEL_18;
    case 14:
      char v5 = 14;
      goto LABEL_18;
    case 15:
      char v5 = 15;
LABEL_18:
      char v6 = v5;
      break;
    case 16:
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    case 33:
      char v6 = 33;
      break;
    default:
      char v6 = 34;
      break;
  }
  *unsigned int v2 = v6;
  return result;
}

uint64_t sub_254ED11CC()
{
  return sub_254ED1230();
}

unint64_t sub_254ED11DC()
{
  unint64_t result = qword_269E709D0;
  if (!qword_269E709D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E709D0);
  }
  return result;
}

uint64_t sub_254ED1230()
{
  uint64_t v0 = ActivityType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == ActivityType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_254ED1D30();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_254ED12C8()
{
  return sub_254ED1D90();
}

uint64_t sub_254ED1330()
{
  ActivityType.rawValue.getter();
  sub_254ED1B30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_254ED1394()
{
  return sub_254ED1D90();
}

LighthouseQuartz::ActivityType_optional sub_254ED13F8(Swift::String *a1)
{
  return ActivityType.init(rawValue:)(*a1);
}

uint64_t sub_254ED1404@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ActivityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_254ED1430()
{
  unint64_t result = qword_269E709D8;
  if (!qword_269E709D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E709E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E709D8);
  }
  return result;
}

void sub_254ED148C(void *a1@<X8>)
{
  *a1 = &unk_2703FA3A0;
}

uint64_t getEnumTagSinglePayload for ActivityType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDF) {
    goto LABEL_17;
  }
  if (a2 + 33 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 33) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 33;
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
      return (*a1 | (v4 << 8)) - 33;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 33;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x22;
  int v8 = v6 - 34;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivityType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 33 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 33) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDE)
  {
    unsigned int v6 = ((a2 - 223) >> 8) + 1;
    *unint64_t result = a2 + 33;
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
        JUMPOUT(0x254ED15F8);
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
          *unint64_t result = a2 + 33;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityType()
{
  return &type metadata for ActivityType;
}

uint64_t sub_254ED1630()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_254ED1640()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_254ED1650()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_254ED1660()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_254ED1670()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_254ED1680()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_254ED1690()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_254ED16A0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_254ED16B0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_254ED16C0()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_254ED16D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_254ED16E0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_254ED16F0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_254ED1700()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_254ED1710()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_254ED1720()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_254ED1730()
{
  return MEMORY[0x270F05820]();
}

uint64_t sub_254ED1740()
{
  return MEMORY[0x270F05848]();
}

uint64_t sub_254ED1750()
{
  return MEMORY[0x270F05920]();
}

uint64_t sub_254ED1760()
{
  return MEMORY[0x270F05928]();
}

uint64_t sub_254ED1770()
{
  return MEMORY[0x270F05960]();
}

uint64_t sub_254ED1780()
{
  return MEMORY[0x270F05968]();
}

uint64_t sub_254ED1790()
{
  return MEMORY[0x270F05988]();
}

uint64_t sub_254ED17A0()
{
  return MEMORY[0x270F05A50]();
}

uint64_t sub_254ED17B0()
{
  return MEMORY[0x270F05AC8]();
}

uint64_t sub_254ED17C0()
{
  return MEMORY[0x270F05AF0]();
}

uint64_t sub_254ED17D0()
{
  return MEMORY[0x270F05B00]();
}

uint64_t sub_254ED17E0()
{
  return MEMORY[0x270F05B18]();
}

uint64_t sub_254ED17F0()
{
  return MEMORY[0x270F05B28]();
}

uint64_t sub_254ED1800()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_254ED1810()
{
  return MEMORY[0x270F41B18]();
}

uint64_t sub_254ED1820()
{
  return MEMORY[0x270F41B20]();
}

uint64_t sub_254ED1830()
{
  return MEMORY[0x270F41B28]();
}

uint64_t sub_254ED1840()
{
  return MEMORY[0x270F41B30]();
}

uint64_t sub_254ED1850()
{
  return MEMORY[0x270F41B38]();
}

uint64_t sub_254ED1860()
{
  return MEMORY[0x270F41B40]();
}

uint64_t sub_254ED1870()
{
  return MEMORY[0x270F41B48]();
}

uint64_t sub_254ED1880()
{
  return MEMORY[0x270F41B50]();
}

uint64_t sub_254ED1890()
{
  return MEMORY[0x270F41B58]();
}

uint64_t sub_254ED18A0()
{
  return MEMORY[0x270F41B60]();
}

uint64_t sub_254ED18B0()
{
  return MEMORY[0x270F41B68]();
}

uint64_t sub_254ED18C0()
{
  return MEMORY[0x270F41B70]();
}

uint64_t sub_254ED18D0()
{
  return MEMORY[0x270F41B78]();
}

uint64_t sub_254ED18E0()
{
  return MEMORY[0x270F41B80]();
}

uint64_t sub_254ED18F0()
{
  return MEMORY[0x270F41B88]();
}

uint64_t sub_254ED1900()
{
  return MEMORY[0x270F41B90]();
}

uint64_t sub_254ED1910()
{
  return MEMORY[0x270F41B98]();
}

uint64_t sub_254ED1920()
{
  return MEMORY[0x270F41BA0]();
}

uint64_t sub_254ED1930()
{
  return MEMORY[0x270F41BA8]();
}

uint64_t sub_254ED1940()
{
  return MEMORY[0x270F41BB0]();
}

uint64_t sub_254ED1950()
{
  return MEMORY[0x270F41BB8]();
}

uint64_t sub_254ED1960()
{
  return MEMORY[0x270F41BC0]();
}

uint64_t sub_254ED1970()
{
  return MEMORY[0x270F41BC8]();
}

uint64_t sub_254ED1980()
{
  return MEMORY[0x270F41BD0]();
}

uint64_t sub_254ED1990()
{
  return MEMORY[0x270F41BD8]();
}

uint64_t sub_254ED19A0()
{
  return MEMORY[0x270F41BE0]();
}

uint64_t sub_254ED19B0()
{
  return MEMORY[0x270F41BE8]();
}

uint64_t sub_254ED19C0()
{
  return MEMORY[0x270F41BF0]();
}

uint64_t sub_254ED19D0()
{
  return MEMORY[0x270F41C00]();
}

uint64_t sub_254ED19E0()
{
  return MEMORY[0x270F41D18]();
}

uint64_t sub_254ED19F0()
{
  return MEMORY[0x270F41D30]();
}

uint64_t sub_254ED1A00()
{
  return MEMORY[0x270F41D78]();
}

uint64_t sub_254ED1A10()
{
  return MEMORY[0x270F41DA0]();
}

uint64_t sub_254ED1A20()
{
  return MEMORY[0x270F41DB8]();
}

uint64_t sub_254ED1A30()
{
  return MEMORY[0x270F41DC0]();
}

uint64_t sub_254ED1A40()
{
  return MEMORY[0x270F41DD8]();
}

uint64_t sub_254ED1A50()
{
  return MEMORY[0x270F41DE8]();
}

uint64_t sub_254ED1A60()
{
  return MEMORY[0x270F41DF8]();
}

uint64_t sub_254ED1A70()
{
  return MEMORY[0x270F41E18]();
}

uint64_t sub_254ED1A80()
{
  return MEMORY[0x270F41E20]();
}

uint64_t sub_254ED1A90()
{
  return MEMORY[0x270F41E28]();
}

uint64_t sub_254ED1AA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_254ED1AB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_254ED1AC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_254ED1AD0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_254ED1AE0()
{
  return MEMORY[0x270FA2B58]();
}

uint64_t sub_254ED1AF0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_254ED1B00()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_254ED1B10()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_254ED1B20()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_254ED1B30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_254ED1B40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254ED1B50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_254ED1B60()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_254ED1B70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_254ED1B80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_254ED1B90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_254ED1BA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_254ED1BB0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_254ED1BC0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_254ED1BD0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_254ED1BE0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_254ED1BF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_254ED1C00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_254ED1C10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_254ED1C20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_254ED1C30()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_254ED1C40()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_254ED1C50()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_254ED1C60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_254ED1C70()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_254ED1C80()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_254ED1C90()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_254ED1CA0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_254ED1CB0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_254ED1CC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_254ED1CD0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_254ED1CE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_254ED1CF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_254ED1D00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_254ED1D10()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_254ED1D30()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_254ED1D40()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_254ED1D60()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_254ED1D70()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_254ED1D80()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_254ED1D90()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}