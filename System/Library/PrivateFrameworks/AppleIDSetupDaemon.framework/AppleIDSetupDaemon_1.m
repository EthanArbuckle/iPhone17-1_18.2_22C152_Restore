uint64_t sub_248286A6C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  BOOL v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  BOOL v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void (*v49)(uint64_t, uint64_t);
  os_log_type_t type;
  uint64_t v51;
  NSObject *log;
  os_log_t loga;
  void (*v54)(uint64_t, os_log_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v56 = v0;
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
  v2 = *(void *)(v0 + 96);
  v3 = *(void *)(v0 + 64);
  v4 = *(void *)(v0 + 72);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v2, *(void *)(v0 + 112), v3);
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v2, v3);
  v6 = *MEMORY[0x263F27340];
  v1(v2, v3);
  if (v4 == v6)
  {
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 200);
    v8 = *(void *)(v0 + 136);
    v9 = *(void *)(v0 + 120);
    v10 = *(void *)(v0 + 48);
    sub_24829A880();
    v7(v8, v10, v9);
    v11 = sub_24829AA90();
    v12 = sub_24829AE50();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
    v15 = *(void *)(v0 + 136);
    v16 = *(void *)(v0 + 120);
    if (v13)
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v17 = 67109120;
      log = v11;
      v18 = sub_24829A060() & 1;
      v14(v15, v16);
      *(_DWORD *)(v0 + 264) = v18;
      sub_24829AF60();
      _os_log_impl(&dword_2481C8000, log, v12, "Sent model update and received receipt back (expectsResponse: %{BOOL}d)", v17, 8u);
      MEMORY[0x24C577040](v17, -1, -1);
      v19 = log;
    }
    else
    {
      v14(*(void *)(v0 + 136), *(void *)(v0 + 120));
      v19 = v11;
    }
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v37 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    v38 = *(void *)(v0 + 176);
    v39 = *(void *)(v0 + 160);
    v40 = *(void *)(v0 + 112);
    v41 = *(void *)(v0 + 64);

    v37(v38, v39);
    v36(v40, v41);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v42 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v20 = *(void *)(v0 + 112);
    v21 = *(void *)(v0 + 88);
    v22 = *(void *)(v0 + 64);
    sub_24829A880();
    v5(v21, v20, v22);
    v23 = sub_24829AA90();
    v24 = sub_24829AE60();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    v27 = *(void *)(v0 + 184);
    v28 = *(void *)(v0 + 160);
    v29 = *(void *)(v0 + 88);
    if (v25)
    {
      v49 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v54 = *(void (**)(uint64_t, os_log_t))(v0 + 224);
      v30 = *(void *)(v0 + 80);
      type = v24;
      v31 = *(void *)(v0 + 64);
      loga = *(os_log_t *)(v0 + 160);
      v32 = (uint8_t *)swift_slowAlloc();
      v51 = v27;
      v33 = swift_slowAlloc();
      v55 = v33;
      *(_DWORD *)v32 = 136315138;
      v5(v30, v29, v31);
      v34 = sub_24829AC90();
      *(void *)(v0 + 16) = sub_248227614(v34, v35, &v55);
      sub_24829AF60();
      swift_bridgeObjectRelease();
      v49(v29, v31);
      _os_log_impl(&dword_2481C8000, v23, type, "Failed to send model update via session, got unexpected response back: %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v33, -1, -1);
      MEMORY[0x24C577040](v32, -1, -1);

      v54(v51, loga);
    }
    else
    {
      (*(void (**)(void, void))(v0 + 248))(*(void *)(v0 + 88), *(void *)(v0 + 64));

      v26(v27, v28);
    }
    v43 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v44 = *(void *)(v0 + 112);
    v45 = *(void *)(v0 + 64);
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930F758);
    sub_2481D1B6C(&qword_26930F760, &qword_26930F758);
    swift_allocError();
    *v47 = 0xD000000000000031;
    v47[1] = 0x800000024829EAB0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v46 - 8) + 104))(v47, *MEMORY[0x263F27058], v46);
    swift_willThrow();
    v43(v44, v45);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v42 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v42();
}

uint64_t sub_248287050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v6 - 8);
  v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24829AB60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v28 - v13;
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24829AAA0();
  __swift_project_value_buffer(v15, (uint64_t)qword_269310900);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v16(v14, a1, v8);
  v17 = sub_24829AA90();
  os_log_type_t v18 = sub_24829AE60();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v35 = v29;
    uint64_t v30 = a4;
    *(_DWORD *)v19 = 136315138;
    v28 = v19 + 4;
    v16(v12, (uint64_t)v14, v8);
    uint64_t v20 = sub_24829AC90();
    uint64_t v34 = sub_248227614(v20, v21, &v35);
    a4 = v30;
    sub_24829AF60();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    _os_log_impl(&dword_2481C8000, v17, v18, "Received cancellation error from mach setup service: %s", v19, 0xCu);
    uint64_t v22 = v29;
    swift_arrayDestroy();
    MEMORY[0x24C577040](v22, -1, -1);
    MEMORY[0x24C577040](v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }

  uint64_t v23 = sub_24829AD90();
  uint64_t v24 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v31, 1, 1, v23);
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  uint64_t v26 = v33;
  v25[4] = v32;
  v25[5] = v26;
  v25[6] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2482652F8(v24, (uint64_t)&unk_269310950, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_2482873E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a6;
  return MEMORY[0x270FA2498](sub_248287408, 0, 0);
}

uint64_t sub_248287408()
{
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24829AAA0();
  __swift_project_value_buffer(v1, (uint64_t)qword_269310900);
  v2 = sub_24829AA90();
  os_log_type_t v3 = sub_24829AE50();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2481C8000, v2, v3, "Invalidating coordinated setup model", v4, 2u);
    MEMORY[0x24C577040](v4, -1, -1);
  }

  sub_24829AA20();
  uint64_t v5 = v0[2];
  v0[4] = v5;
  if (v5)
  {
    uint64_t v9 = (uint64_t (*)(void))((int)*MEMORY[0x263F272C0] + MEMORY[0x263F272C0]);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[5] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_2482875C0;
    return v9();
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_2482875C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2482876D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  uint64_t v6 = sub_24829AAA0();
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310970);
  v5[13] = v7;
  v5[14] = *(void *)(v7 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v8 = sub_248299E80();
  v5[16] = v8;
  v5[17] = *(void *)(v8 - 8);
  v5[18] = swift_task_alloc();
  uint64_t v9 = sub_248299BA0();
  v5[19] = v9;
  v5[20] = *(void *)(v9 - 8);
  v5[21] = swift_task_alloc();
  uint64_t v10 = sub_24829A500();
  v5[22] = v10;
  v5[23] = *(void *)(v10 - 8);
  v5[24] = swift_task_alloc();
  uint64_t v11 = sub_248299A10();
  v5[25] = v11;
  v5[26] = *(void *)(v11 - 8);
  v5[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248287978, 0, 0);
}

uint64_t sub_248287978()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F26DA8], v3);
  char v4 = sub_248299A00();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) == 0)
  {
    sub_24829A8B0();
    uint64_t v20 = sub_24829AA90();
    os_log_type_t v21 = sub_24829AE60();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_2481C8000, v20, v21, "Not allowing mach setup service calls, disabled", v22, 2u);
      MEMORY[0x24C577040](v22, -1, -1);
    }
    uint64_t v24 = v0[10];
    uint64_t v23 = v0[11];
    uint64_t v25 = v0[9];

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    sub_24828C824();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(void))v0[1];
    goto LABEL_19;
  }
  uint64_t v6 = v0[23];
  uint64_t v5 = v0[24];
  uint64_t v7 = v0[22];
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v5, v0[5], v7);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v5, v7);
  if (v8 == *MEMORY[0x263F27328])
  {
    uint64_t v9 = v0[24];
    uint64_t v10 = v0[21];
    uint64_t v11 = v0[19];
    uint64_t v12 = v0[20];
    (*(void (**)(uint64_t, void))(v0[23] + 96))(v9, v0[22]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v10, v9, v11);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[28] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_248287ECC;
    uint64_t v14 = v0[21];
    uint64_t v15 = v0[18];
    uint64_t v16 = v0[7];
    uint64_t v17 = v0[8];
    uint64_t v18 = v0[6];
    return sub_248288634(v15, v14, v18, v16, v17);
  }
  if (v8 == *MEMORY[0x263F27330])
  {
    uint64_t v28 = v0[23];
    uint64_t v27 = v0[24];
    uint64_t v29 = v0[22];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v28 + 56))(v0[4], 1, 1, v29);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
LABEL_18:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(void))v0[1];
LABEL_19:
    return v26();
  }
  uint64_t v31 = v0[23];
  uint64_t v30 = v0[24];
  uint64_t v32 = v0[22];
  if (v8 != *MEMORY[0x263F27320])
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v31 + 56))(v0[4], 1, 1, v0[22]);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    goto LABEL_18;
  }
  uint64_t v34 = v0[14];
  uint64_t v33 = v0[15];
  uint64_t v35 = v0[13];
  (*(void (**)(void, void))(v31 + 96))(v0[24], v0[22]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v33, v30, v35);
  sub_24829AA20();
  uint64_t v36 = v0[2];
  v0[30] = v36;
  if (!v36)
  {
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    uint64_t v39 = v0[22];
    uint64_t v40 = v0[23];
    uint64_t v41 = v0[4];
    (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v41, *MEMORY[0x263F27340], v39);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v41, 0, 1, v39);
    goto LABEL_18;
  }
  v42 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F272E8] + MEMORY[0x263F272E8]);
  v37 = (void *)swift_task_alloc();
  v0[31] = v37;
  void *v37 = v0;
  v37[1] = sub_248288120;
  uint64_t v38 = v0[15];
  return v42(v38);
}

uint64_t sub_248287ECC()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24828855C;
  }
  else {
    uint64_t v2 = sub_248287FE0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248287FE0()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[4];
  (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v6, v3, v4);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, *MEMORY[0x263F27330], v1);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v6, 0, 1, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_248288120(char a1)
{
  *(unsigned char *)(*(void *)v1 + 256) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_248288240, 0, 0);
}

uint64_t sub_248288240()
{
  uint64_t v29 = v0;
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_269310900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_24829AA90();
  os_log_type_t v6 = sub_24829AE50();
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = *(unsigned __int8 *)(v0 + 256);
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v26 = *(void *)(v0 + 104);
    uint64_t v27 = *(void *)(v0 + 120);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v24 = *(void *)(v0 + 72);
    uint64_t v25 = *(void *)(v0 + 96);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v28 = v11;
    if (v7) {
      uint64_t v12 = 0x6465747065636361;
    }
    else {
      uint64_t v12 = 0x64657463656A6572;
    }
    *(void *)(v0 + 24) = sub_248227614(v12, 0xE800000000000000, &v28);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2481C8000, v5, v6, "Model update was %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v11, -1, -1);
    MEMORY[0x24C577040](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v25, v24);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v27, v26);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 96);
    uint64_t v15 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 72);
    uint64_t v18 = *(void *)(v0 + 80);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  uint64_t v19 = *(void *)(v0 + 176);
  uint64_t v20 = *(void *)(v0 + 184);
  uint64_t v21 = *(void *)(v0 + 32);
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v21, *MEMORY[0x263F27340], v19);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v21, 0, 1, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_24828855C()
{
  (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_248288634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  uint64_t v6 = sub_248299B60();
  v5[12] = v6;
  v5[13] = *(void *)(v6 - 8);
  v5[14] = swift_task_alloc();
  uint64_t v7 = sub_248299AF0();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B13C998);
  v5[18] = swift_task_alloc();
  uint64_t v8 = sub_248299BA0();
  v5[19] = v8;
  v5[20] = *(void *)(v8 - 8);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248288800, 0, 0);
}

uint64_t sub_248288800()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[8];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[24] = v6;
  v0[25] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v5, v3);
  v6(v1, v2, v3);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[26] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2482888F4;
  uint64_t v10 = v0[22];
  uint64_t v11 = v0[11];
  uint64_t v12 = v0[7];
  return sub_248289190(v12, v10, v7, v8, v11);
}

uint64_t sub_2482888F4()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 176);
  uint64_t v4 = *(void *)(*(void *)v1 + 160);
  uint64_t v5 = *(void *)(*(void *)v1 + 152);
  v2[27] = v0;
  swift_task_dealloc();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v2[28] = v6;
  v2[29] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v3, v5);
  if (v0) {
    uint64_t v7 = sub_248288B30;
  }
  else {
    uint64_t v7 = sub_248288A78;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_248288A78()
{
  (*(void (**)(void, void))(v0 + 224))(*(void *)(v0 + 184), *(void *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248288B30()
{
  uint64_t v1 = *(void **)(v0 + 216);
  *(void *)(v0 + 48) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B13CA08);
  if (swift_dynamicCast())
  {

    if (qword_26930EFF8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24829AAA0();
    __swift_project_value_buffer(v3, (uint64_t)qword_269310900);
    uint64_t v4 = sub_24829AA90();
    os_log_type_t v5 = sub_24829AE50();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2481C8000, v4, v5, "Creating manual model modifications and calling setup again", v6, 2u);
      MEMORY[0x24C577040](v6, -1, -1);
    }
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 192);
    uint64_t v8 = *(void *)(v0 + 144);
    uint64_t v25 = *(void *)(v0 + 168);
    uint64_t v26 = *(void *)(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v10 = *(void *)(v0 + 136);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v23 = *(void *)(v0 + 120);
    uint64_t v24 = *(void *)(v0 + 96);

    uint64_t v13 = sub_248299D90();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
    uint64_t v14 = (void (*)(uint64_t, void))sub_248299A70();
    sub_24829A6A0();
    v14(v0 + 16, 0);
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v10, *MEMORY[0x263F26E28], v23);
    sub_248299B10();
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, *MEMORY[0x263F26EB8], v24);
    sub_248299B90();
    v27(v25, v7, v26);
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v17;
    void *v17 = v0;
    v17[1] = sub_248288E84;
    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v19 = *(void *)(v0 + 88);
    uint64_t v20 = *(void *)(v0 + 56);
    return sub_248289190(v20, v18, v15, v16, v19);
  }
  else
  {
    (*(void (**)(void, void))(v0 + 224))(*(void *)(v0 + 184), *(void *)(v0 + 152));

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
}

uint64_t sub_248288E84()
{
  id v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 224);
  uint64_t v3 = *(void *)(*(void *)v1 + 168);
  uint64_t v4 = *(void *)(*(void *)v1 + 152);
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0) {
    os_log_type_t v5 = sub_2482890C4;
  }
  else {
    os_log_type_t v5 = sub_248289004;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_248289004()
{
  (*(void (**)(void, void))(v0 + 224))(*(void *)(v0 + 184), *(void *)(v0 + 152));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2482890C4()
{
  (*(void (**)(void, void))(v0 + 224))(*(void *)(v0 + 184), *(void *)(v0 + 152));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248289190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[46] = a2;
  v5[47] = a5;
  v5[45] = a1;
  v5[48] = __swift_instantiateConcreteTypeFromMangledName(&qword_269310990);
  v5[49] = swift_task_alloc();
  uint64_t v6 = sub_248299AF0();
  v5[50] = v6;
  v5[51] = *(void *)(v6 - 8);
  v5[52] = swift_task_alloc();
  uint64_t v7 = sub_248299B60();
  v5[53] = v7;
  v5[54] = *(void *)(v7 - 8);
  v5[55] = swift_task_alloc();
  uint64_t v8 = sub_248299E80();
  v5[56] = v8;
  v5[57] = *(void *)(v8 - 8);
  v5[58] = swift_task_alloc();
  v5[59] = swift_task_alloc();
  v5[60] = swift_task_alloc();
  v5[61] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248289368, 0, 0);
}

id sub_248289368()
{
  sub_24829AA20();
  uint64_t v1 = *(void *)(v0 + 336);
  *(void *)(v0 + 496) = v1;
  if (v1)
  {
    v81 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F272D8] + MEMORY[0x263F272D8]);
    id v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 504) = v2;
    void *v2 = v0;
    v2[1] = sub_248289FF4;
    uint64_t v3 = *(void *)(v0 + 368);
    return (id)v81(v3);
  }
  os_log_type_t v5 = self;
  id v6 = objc_msgSend(v5, sel_sharedInstance);
  id result = objc_msgSend(self, sel_defaultStore);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D88]), sel_initWithAccountStore_, result);

  uint64_t v9 = sub_24829A420();
  uint64_t v10 = sub_24829A410();
  uint64_t v11 = MEMORY[0x263F271F0];
  *(void *)(v0 + 80) = v9;
  *(void *)(v0 + 88) = v11;
  *(void *)(v0 + 56) = v10;
  type metadata accessor for LocalSetupService();
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 520) = v12;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_OWORD *)(v12 + 32) = 0u;
  *(void *)(v12 + 112) = 0;
  *(void *)(v12 + 120) = 0;
  *(void *)(v12 + 48) = 0;
  *(void *)(v12 + 56) = v6;
  *(void *)(v12 + 64) = v8;
  sub_248221324((long long *)(v0 + 56), v12 + 72);
  swift_retain();
  id v82 = objc_msgSend(v5, sel_sharedInstance);
  id v77 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (qword_26930EFA0 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(v0 + 432);
  uint64_t v14 = *(void *)(v0 + 440);
  uint64_t v15 = *(void *)(v0 + 416);
  uint64_t v16 = *(void *)(v0 + 408);
  uint64_t v78 = *(void *)(v0 + 424);
  uint64_t v79 = *(void *)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 392);
  uint64_t v76 = *(void *)(v0 + 384);
  uint64_t v18 = qword_26930F3E0;
  type metadata accessor for ProximityTransportConnector();
  uint64_t v19 = swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  *(void *)(v19 + 152) = 0;
  *(_OWORD *)(v19 + 136) = 0u;
  *(_OWORD *)(v19 + 120) = 0u;
  *(void *)(v19 + 112) = v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310368);
  swift_allocObject();
  uint64_t v21 = sub_24826502C(v12, (uint64_t)v82, (uint64_t)v77, v19);
  *(void *)(v0 + 120) = v20;
  *(void *)(v0 + 128) = &off_26FC50838;
  *(void *)(v0 + 96) = v21;
  sub_248299B80();
  sub_248299B00();
  uint64_t v22 = *(int *)(v76 + 48);
  *(_DWORD *)(v0 + 576) = v22;
  uint64_t v23 = v17 + v22;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v17, v14, v78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v23, v15, v79);
  int v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 88))(v17, v78);
  if (v24 == *MEMORY[0x263F26EB8])
  {
    uint64_t v25 = v0 + 96;
    if ((*(unsigned int (**)(uint64_t, void))(*(void *)(v0 + 408) + 88))(v23, *(void *)(v0 + 400)) == *MEMORY[0x263F26E28])
    {
      if (qword_26930EFF8 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_24829AAA0();
      __swift_project_value_buffer(v26, (uint64_t)qword_269310900);
      uint64_t v27 = sub_24829AA90();
      os_log_type_t v28 = sub_24829AE40();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_2481C8000, v27, v28, "Restricted to local setup", v29, 2u);
        MEMORY[0x24C577040](v29, -1, -1);
      }

      sub_24829AA20();
      uint64_t v30 = *(void *)(v0 + 352);
      *(void *)(v0 + 528) = v30;
      if (v30)
      {
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 536) = v31;
        void *v31 = v0;
        v31[1] = sub_24828ACF4;
        uint64_t v32 = *(void *)(v0 + 480);
        return (id)sub_248228A30(v32, v30);
      }
      v70 = sub_24829AA90();
      os_log_type_t v71 = sub_24829AE60();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v72 = 0;
        _os_log_impl(&dword_2481C8000, v70, v71, "Model is not available for local setup, Cancelling early", v72, 2u);
        MEMORY[0x24C577040](v72, -1, -1);
      }
      uint64_t v37 = *(void *)(v0 + 424);
      uint64_t v38 = *(void *)(v0 + 432);
      uint64_t v39 = *(void *)(v0 + 392);

      uint64_t v73 = sub_248299A60();
      sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v73 - 8) + 104))(v74, *MEMORY[0x263F26DD8], v73);
      swift_willThrow();
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v25 = v0 + 96;
    if (v24 == *MEMORY[0x263F26EB0]
      && (*(unsigned int (**)(uint64_t, void))(*(void *)(v0 + 408) + 88))(v23, *(void *)(v0 + 400)) == *MEMORY[0x263F26E28])
    {
      if (qword_26930EFF8 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_24829AAA0();
      __swift_project_value_buffer(v33, (uint64_t)qword_269310900);
      uint64_t v34 = sub_24829AA90();
      os_log_type_t v35 = sub_24829AE60();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_2481C8000, v34, v35, "Both roles are restricted.", v36, 2u);
        MEMORY[0x24C577040](v36, -1, -1);
      }
      uint64_t v37 = *(void *)(v0 + 424);
      uint64_t v38 = *(void *)(v0 + 432);
      uint64_t v39 = *(void *)(v0 + 392);

      sub_248241EE8();
      swift_allocError();
      *uint64_t v40 = 0;
      v40[1] = 0;
      swift_willThrow();
LABEL_43:
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
LABEL_44:
      sub_24828C8E0(v25);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v75 = *(uint64_t (**)(void))(v0 + 8);
      return (id)v75();
    }
  }
  uint64_t v83 = v23;
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_24829AAA0();
  __swift_project_value_buffer(v41, (uint64_t)qword_269310900);
  v42 = sub_24829AA90();
  os_log_type_t v43 = sub_24829AE40();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_2481C8000, v42, v43, "Remote setup is not restricted, proceeding", v44, 2u);
    MEMORY[0x24C577040](v44, -1, -1);
  }

  sub_24828C878(v25, v0 + 176);
  if (!*(void *)(v0 + 200))
  {
    sub_24828C8E0(v0 + 176);
    v50 = sub_24829AA90();
    os_log_type_t v51 = sub_24829AE60();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_2481C8000, v50, v51, "Remote setup is not available. Cannot continue", v52, 2u);
      MEMORY[0x24C577040](v52, -1, -1);
    }
    uint64_t v53 = *(void *)(v0 + 424);
    uint64_t v54 = *(void *)(v0 + 432);
    uint64_t v56 = *(void *)(v0 + 400);
    uint64_t v55 = *(void *)(v0 + 408);
    uint64_t v57 = *(void *)(v0 + 392);

    uint64_t v58 = sub_248299A60();
    sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v58 - 8) + 104))(v59, *MEMORY[0x263F26DD8], v58);
    swift_willThrow();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v83, v56);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v53);
    goto LABEL_44;
  }
  sub_248221324((long long *)(v0 + 176), v0 + 136);
  sub_24829AA20();
  uint64_t v45 = *(void *)(v0 + 328);
  *(void *)(v0 + 552) = v45;
  if (!v45)
  {
    v60 = sub_24829AA90();
    os_log_type_t v61 = sub_24829AE60();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl(&dword_2481C8000, v60, v61, "Model is not available for remote setup, Cancelling", v62, 2u);
      MEMORY[0x24C577040](v62, -1, -1);
    }
    uint64_t v64 = *(void *)(v0 + 424);
    uint64_t v63 = *(void *)(v0 + 432);
    uint64_t v66 = *(void *)(v0 + 400);
    uint64_t v65 = *(void *)(v0 + 408);
    uint64_t v67 = *(void *)(v0 + 392);

    uint64_t v68 = sub_248299A60();
    sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v68 - 8) + 104))(v69, *MEMORY[0x263F26DD8], v68);
    swift_willThrow();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 136);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v83, v66);
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v67, v64);
    goto LABEL_44;
  }
  uint64_t v46 = *(void *)(v0 + 160);
  uint64_t v47 = *(void *)(v0 + 168);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), v46);
  v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 + 16) + **(int **)(v47 + 16));
  v48 = (void *)swift_task_alloc();
  *(void *)(v0 + 560) = v48;
  void *v48 = v0;
  v48[1] = sub_24828B38C;
  uint64_t v49 = *(void *)(v0 + 472);
  return (id)v80(v49, v45, v46, v47);
}

uint64_t sub_248289FF4()
{
  *(void *)(*(void *)v1 + 512) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_24828BA5C;
  }
  else
  {
    swift_release();
    id v2 = sub_24828A110;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

id sub_24828A110()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedInstance);
  id result = objc_msgSend(self, sel_defaultStore);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = result;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D88]), sel_initWithAccountStore_, result);

  uint64_t v6 = sub_24829A420();
  *(void *)(v0 + 56) = sub_24829A410();
  uint64_t v7 = MEMORY[0x263F271F0];
  *(void *)(v0 + 80) = v6;
  *(void *)(v0 + 88) = v7;
  type metadata accessor for LocalSetupService();
  uint64_t v8 = swift_allocObject();
  *(void *)(v0 + 520) = v8;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_OWORD *)(v8 + 32) = 0u;
  *(void *)(v8 + 112) = 0;
  *(void *)(v8 + 120) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 56) = v2;
  *(void *)(v8 + 64) = v5;
  sub_248221324((long long *)(v0 + 56), v8 + 72);
  swift_retain();
  id v76 = objc_msgSend(v1, sel_sharedInstance);
  id v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (qword_26930EFA0 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void *)(v0 + 432);
  uint64_t v10 = *(void *)(v0 + 440);
  uint64_t v11 = *(void *)(v0 + 416);
  uint64_t v12 = *(void *)(v0 + 408);
  uint64_t v74 = *(void *)(v0 + 424);
  uint64_t v75 = *(void *)(v0 + 400);
  uint64_t v13 = *(void *)(v0 + 392);
  uint64_t v72 = *(void *)(v0 + 384);
  uint64_t v14 = qword_26930F3E0;
  type metadata accessor for ProximityTransportConnector();
  uint64_t v15 = swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  *(void *)(v15 + 152) = 0;
  *(_OWORD *)(v15 + 136) = 0u;
  *(_OWORD *)(v15 + 120) = 0u;
  *(void *)(v15 + 112) = v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310368);
  swift_allocObject();
  uint64_t v17 = sub_24826502C(v8, (uint64_t)v76, (uint64_t)v73, v15);
  *(void *)(v0 + 120) = v16;
  *(void *)(v0 + 128) = &off_26FC50838;
  *(void *)(v0 + 96) = v17;
  sub_248299B80();
  sub_248299B00();
  uint64_t v18 = *(int *)(v72 + 48);
  *(_DWORD *)(v0 + 576) = v18;
  uint64_t v19 = v13 + v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v13, v10, v74);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v19, v11, v75);
  int v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v13, v74);
  if (v20 == *MEMORY[0x263F26EB8])
  {
    uint64_t v21 = v0 + 96;
    if ((*(unsigned int (**)(uint64_t, void))(*(void *)(v0 + 408) + 88))(v19, *(void *)(v0 + 400)) == *MEMORY[0x263F26E28])
    {
      if (qword_26930EFF8 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_24829AAA0();
      __swift_project_value_buffer(v22, (uint64_t)qword_269310900);
      uint64_t v23 = sub_24829AA90();
      os_log_type_t v24 = sub_24829AE40();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_2481C8000, v23, v24, "Restricted to local setup", v25, 2u);
        MEMORY[0x24C577040](v25, -1, -1);
      }

      sub_24829AA20();
      uint64_t v26 = *(void *)(v0 + 352);
      *(void *)(v0 + 528) = v26;
      if (v26)
      {
        uint64_t v27 = (void *)swift_task_alloc();
        *(void *)(v0 + 536) = v27;
        *uint64_t v27 = v0;
        v27[1] = sub_24828ACF4;
        uint64_t v28 = *(void *)(v0 + 480);
        return (id)sub_248228A30(v28, v26);
      }
      uint64_t v66 = sub_24829AA90();
      os_log_type_t v67 = sub_24829AE60();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_2481C8000, v66, v67, "Model is not available for local setup, Cancelling early", v68, 2u);
        MEMORY[0x24C577040](v68, -1, -1);
      }
      uint64_t v33 = *(void *)(v0 + 424);
      uint64_t v34 = *(void *)(v0 + 432);
      uint64_t v35 = *(void *)(v0 + 392);

      uint64_t v69 = sub_248299A60();
      sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v69 - 8) + 104))(v70, *MEMORY[0x263F26DD8], v69);
      swift_willThrow();
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v21 = v0 + 96;
    if (v20 == *MEMORY[0x263F26EB0]
      && (*(unsigned int (**)(uint64_t, void))(*(void *)(v0 + 408) + 88))(v19, *(void *)(v0 + 400)) == *MEMORY[0x263F26E28])
    {
      if (qword_26930EFF8 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_24829AAA0();
      __swift_project_value_buffer(v29, (uint64_t)qword_269310900);
      uint64_t v30 = sub_24829AA90();
      os_log_type_t v31 = sub_24829AE60();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_2481C8000, v30, v31, "Both roles are restricted.", v32, 2u);
        MEMORY[0x24C577040](v32, -1, -1);
      }
      uint64_t v33 = *(void *)(v0 + 424);
      uint64_t v34 = *(void *)(v0 + 432);
      uint64_t v35 = *(void *)(v0 + 392);

      sub_248241EE8();
      swift_allocError();
      *uint64_t v36 = 0;
      v36[1] = 0;
      swift_willThrow();
LABEL_39:
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
LABEL_40:
      sub_24828C8E0(v21);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      os_log_type_t v71 = *(uint64_t (**)(void))(v0 + 8);
      return (id)v71();
    }
  }
  uint64_t v78 = v19;
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_24829AAA0();
  __swift_project_value_buffer(v37, (uint64_t)qword_269310900);
  uint64_t v38 = sub_24829AA90();
  os_log_type_t v39 = sub_24829AE40();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_2481C8000, v38, v39, "Remote setup is not restricted, proceeding", v40, 2u);
    MEMORY[0x24C577040](v40, -1, -1);
  }

  sub_24828C878(v21, v0 + 176);
  if (!*(void *)(v0 + 200))
  {
    sub_24828C8E0(v0 + 176);
    uint64_t v46 = sub_24829AA90();
    os_log_type_t v47 = sub_24829AE60();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_2481C8000, v46, v47, "Remote setup is not available. Cannot continue", v48, 2u);
      MEMORY[0x24C577040](v48, -1, -1);
    }
    uint64_t v49 = *(void *)(v0 + 424);
    uint64_t v50 = *(void *)(v0 + 432);
    uint64_t v52 = *(void *)(v0 + 400);
    uint64_t v51 = *(void *)(v0 + 408);
    uint64_t v53 = *(void *)(v0 + 392);

    uint64_t v54 = sub_248299A60();
    sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v54 - 8) + 104))(v55, *MEMORY[0x263F26DD8], v54);
    swift_willThrow();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v78, v52);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v49);
    goto LABEL_40;
  }
  sub_248221324((long long *)(v0 + 176), v0 + 136);
  sub_24829AA20();
  uint64_t v41 = *(void *)(v0 + 328);
  *(void *)(v0 + 552) = v41;
  if (!v41)
  {
    uint64_t v56 = sub_24829AA90();
    os_log_type_t v57 = sub_24829AE60();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v58 = 0;
      _os_log_impl(&dword_2481C8000, v56, v57, "Model is not available for remote setup, Cancelling", v58, 2u);
      MEMORY[0x24C577040](v58, -1, -1);
    }
    uint64_t v60 = *(void *)(v0 + 424);
    uint64_t v59 = *(void *)(v0 + 432);
    uint64_t v62 = *(void *)(v0 + 400);
    uint64_t v61 = *(void *)(v0 + 408);
    uint64_t v63 = *(void *)(v0 + 392);

    uint64_t v64 = sub_248299A60();
    sub_24828C940((unint64_t *)&unk_26930FF60, MEMORY[0x263F26DE8]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v64 - 8) + 104))(v65, *MEMORY[0x263F26DD8], v64);
    swift_willThrow();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 136);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v78, v62);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v63, v60);
    goto LABEL_40;
  }
  uint64_t v42 = *(void *)(v0 + 160);
  uint64_t v43 = *(void *)(v0 + 168);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), v42);
  id v77 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 + 16) + **(int **)(v43 + 16));
  v44 = (void *)swift_task_alloc();
  *(void *)(v0 + 560) = v44;
  void *v44 = v0;
  v44[1] = sub_24828B38C;
  uint64_t v45 = *(void *)(v0 + 472);
  return (id)v77(v45, v41, v42, v43);
}

uint64_t sub_24828ACF4()
{
  *(void *)(*(void *)v1 + 544) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_24828BB20;
  }
  else {
    id v2 = sub_24828AE08;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24828AE08()
{
  uint64_t v37 = v0;
  uint64_t v1 = v0[60];
  uint64_t v2 = v0[61];
  uint64_t v3 = v0[56];
  uint64_t v4 = v0[57];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  (*(void (**)(void, void))(v0[54] + 8))(v0[49], v0[53]);
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v5 = (uint64_t)(v0 + 12);
  uint64_t v6 = sub_24829AAA0();
  __swift_project_value_buffer(v6, (uint64_t)qword_269310900);
  uint64_t v7 = sub_24829AA90();
  os_log_type_t v8 = sub_24829AE50();
  uint64_t v35 = (uint64_t)(v0 + 12);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v36 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v5 = (uint64_t)(v0 + 12);
    swift_beginAccess();
    sub_24828C878(v35, (uint64_t)(v0 + 2));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FDF0);
    uint64_t v11 = sub_24829AC90();
    v0[43] = sub_248227614(v11, v12, &v36);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2481C8000, v7, v8, "Cleaning up RemoteSetupService %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v10, -1, -1);
    MEMORY[0x24C577040](v9, -1, -1);
  }

  swift_beginAccess();
  sub_24828C8E0(v5);
  uint64_t v13 = sub_24829AA90();
  os_log_type_t v14 = sub_24829AE50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_2481C8000, v13, v14, "Cleaning up SetupService", v15, 2u);
    MEMORY[0x24C577040](v15, -1, -1);
  }

  *(void *)(v5 + 32) = 0;
  *(_OWORD *)uint64_t v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  swift_endAccess();
  uint64_t v16 = sub_24829AA90();
  os_log_type_t v17 = sub_24829AE50();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_2481C8000, v16, v17, "Cleaning up SetupModel", v18, 2u);
    MEMORY[0x24C577040](v18, -1, -1);
  }

  v0[39] = 0;
  sub_24829AA30();
  uint64_t v19 = sub_24829AA90();
  os_log_type_t v20 = sub_24829AE40();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = v0[61];
    uint64_t v23 = v0[57];
    uint64_t v22 = v0[58];
    uint64_t v24 = v0[56];
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v36 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
    uint64_t v27 = sub_24829AC90();
    v0[40] = sub_248227614(v27, v28, &v36);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2481C8000, v19, v20, "Finished setup with report: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v26, -1, -1);
    MEMORY[0x24C577040](v25, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
  }
  uint64_t v29 = v0[61];
  uint64_t v30 = v0[56];
  uint64_t v31 = v0[57];
  uint64_t v32 = v0[45];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v32, v29, v30);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
  sub_24828C8E0(v35);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(void))v0[1];
  return v33();
}

uint64_t sub_24828B38C()
{
  *(void *)(*(void *)v1 + 568) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24828BC1C;
  }
  else {
    uint64_t v2 = sub_24828B4A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24828B4A0()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(int *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 472);
  uint64_t v4 = *(void *)(v0 + 448);
  uint64_t v5 = *(void *)(v0 + 456);
  uint64_t v6 = *(void *)(v0 + 400);
  uint64_t v7 = *(void *)(v0 + 408);
  uint64_t v8 = *(void *)(v0 + 392);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8 + v1, v6);
  (*(void (**)(void, void))(*(void *)(v0 + 432) + 8))(*(void *)(v0 + 392), *(void *)(v0 + 424));
  if (qword_26930EFF8 != -1) {
    swift_once();
  }
  uint64_t v9 = v0 + 96;
  uint64_t v10 = sub_24829AAA0();
  __swift_project_value_buffer(v10, (uint64_t)qword_269310900);
  uint64_t v11 = sub_24829AA90();
  os_log_type_t v12 = sub_24829AE50();
  uint64_t v39 = v0 + 96;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v40 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v9 = v0 + 96;
    swift_beginAccess();
    sub_24828C878(v39, v0 + 16);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FDF0);
    uint64_t v15 = sub_24829AC90();
    *(void *)(v0 + 344) = sub_248227614(v15, v16, &v40);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2481C8000, v11, v12, "Cleaning up RemoteSetupService %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v14, -1, -1);
    MEMORY[0x24C577040](v13, -1, -1);
  }

  swift_beginAccess();
  sub_24828C8E0(v9);
  os_log_type_t v17 = sub_24829AA90();
  os_log_type_t v18 = sub_24829AE50();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_2481C8000, v17, v18, "Cleaning up SetupService", v19, 2u);
    MEMORY[0x24C577040](v19, -1, -1);
  }

  *(void *)(v9 + 32) = 0;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  swift_endAccess();
  os_log_type_t v20 = sub_24829AA90();
  os_log_type_t v21 = sub_24829AE50();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_2481C8000, v20, v21, "Cleaning up SetupModel", v22, 2u);
    MEMORY[0x24C577040](v22, -1, -1);
  }

  *(void *)(v0 + 312) = 0;
  sub_24829AA30();
  uint64_t v23 = sub_24829AA90();
  os_log_type_t v24 = sub_24829AE40();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = *(void *)(v0 + 488);
    uint64_t v27 = *(void *)(v0 + 456);
    uint64_t v26 = *(void *)(v0 + 464);
    uint64_t v28 = *(void *)(v0 + 448);
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v40 = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v25, v28);
    uint64_t v31 = sub_24829AC90();
    *(void *)(v0 + 320) = sub_248227614(v31, v32, &v40);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2481C8000, v23, v24, "Finished setup with report: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v30, -1, -1);
    MEMORY[0x24C577040](v29, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
  }
  uint64_t v33 = *(void *)(v0 + 488);
  uint64_t v34 = *(void *)(v0 + 448);
  uint64_t v35 = *(void *)(v0 + 456);
  uint64_t v36 = *(void *)(v0 + 360);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v36, v33, v34);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
  sub_24828C8E0(v39);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_24828BA5C()
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

uint64_t sub_24828BB20()
{
  uint64_t v1 = v0[53];
  uint64_t v2 = v0[54];
  uint64_t v3 = v0[49];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  sub_24828C8E0((uint64_t)(v0 + 12));
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

uint64_t sub_24828BC1C()
{
  uint64_t v1 = *(int *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 400);
  uint64_t v5 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 392);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6 + v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  sub_24828C8E0(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

double sub_24828BD50@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v4 = sub_24829ABA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  uint64_t v10 = v2[1];
  uint64_t v12 = v2[2];
  uint64_t v13 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 4) = v11;
  *((void *)v15 + 5) = v10;
  *((void *)v15 + 6) = v12;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v14], (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_248265658((uint64_t)v9, (uint64_t)&unk_269310960, (uint64_t)v15);
  swift_release();
  unint64_t v16 = (_OWORD *)v19;
  *(void *)(v19 + 32) = 0;
  double result = 0.0;
  *unint64_t v16 = 0u;
  v16[1] = 0u;
  return result;
}

uint64_t sub_24828BF5C(uint64_t a1)
{
  return sub_248287050(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_24828BF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v10 = *a4;
  uint64_t v11 = a4[1];
  uint64_t v12 = a4[2];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v13;
  *uint64_t v13 = v5;
  v13[1] = sub_2481CC140;
  return sub_24826CF98(a1, a2, a3, v10, v11, v12, a5);
}

uint64_t sub_24828C044()
{
  uint64_t v0 = sub_248299BA0();
  MEMORY[0x270FA5388](v0 - 8);
  type metadata accessor for AuditReport();
  uint64_t v1 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v1 + 112) = 2;
  *(_OWORD *)(v1 + 116) = 0u;
  *(_OWORD *)(v1 + 132) = 0u;
  *(unsigned char *)(v1 + 148) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269310918);
  swift_allocObject();
  swift_retain();
  sub_24829AA00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269310920);
  swift_retain();
  swift_retain();
  sub_248299AB0();
  swift_retain();
  sub_24829A080();
  sub_2481D1B6C(&qword_269310938, &qword_269310920);
  sub_24829A6E0();
  swift_release();
  swift_retain();
  swift_retain();
  sub_24829AA30();
  swift_release();
  swift_release();
  swift_release_n();
  swift_release();
  return v1;
}

uint64_t sub_24828C214(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2481D20AC;
  return sub_2482862F0(a1, a2, v2);
}

uint64_t destroy for MachSetupService()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s18AppleIDSetupDaemon16MachSetupServiceVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MachSetupService(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MachSetupService(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MachSetupService(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MachSetupService(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MachSetupService()
{
  return &type metadata for MachSetupService;
}

uint64_t sub_24828C4C8()
{
  return sub_24828C940(&qword_2693103F0, MEMORY[0x263F27348]);
}

unint64_t sub_24828C514(uint64_t a1)
{
  unint64_t result = sub_248228220();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24828C53C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24828C58C()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2481CC140;
  v3[3] = v2;
  return MEMORY[0x270FA2498](sub_248287408, 0, 0);
}

uint64_t sub_24828C638()
{
  uint64_t v1 = sub_24829ABA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24828C71C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24829ABA0() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1 + 4;
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2481CC140;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))((char *)&dword_269310958
                                                                              + dword_269310958);
  return v10(a1, v5, v6, v7, v8);
}

unint64_t sub_24828C824()
{
  unint64_t result = qword_269310978;
  if (!qword_269310978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269310978);
  }
  return result;
}

uint64_t sub_24828C878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24828C8E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FDF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24828C940(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for MachSetupService.Failure(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24828CA24);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MachSetupService.Failure()
{
  return &type metadata for MachSetupService.Failure;
}

unint64_t sub_24828CA60()
{
  unint64_t result = qword_269310998;
  if (!qword_269310998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269310998);
  }
  return result;
}

id sub_24828CAB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24829AAA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24829A8B0();
  uint64_t v6 = sub_24829AA90();
  os_log_type_t v7 = sub_24829AE50();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2481C8000, v6, v7, "ConnectionManager deinit", v8, 2u);
    MEMORY[0x24C577040](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener], sel_invalidate);
  objc_msgSend(*(id *)&v1[v9], sel_setDelegate_, 0);
  uint64_t v10 = (objc_class *)type metadata accessor for ConnectionManager();
  v12.receiver = v1;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

id sub_24828CC74()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24829AAA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener;
  id v7 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener), sel_serviceName);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_24829AC80();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = sub_24829A700();
    unint64_t v11 = v12;
  }
  sub_24829A8B0();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24829AA90();
  os_log_type_t v14 = sub_24829AE50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v25 = v2;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v3;
    unint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = v1;
    uint64_t v18 = v6;
    uint64_t v19 = v9;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v27 = v20;
    *(_DWORD *)unint64_t v16 = 136315138;
    v23[1] = v16 + 4;
    swift_bridgeObjectRetain();
    uint64_t v21 = v19;
    uint64_t v6 = v18;
    uint64_t v1 = v17;
    uint64_t v26 = sub_248227614(v21, v11, &v27);
    sub_24829AF60();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2481C8000, v13, v14, "Starting XPC listener for Mach service %s...", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v20, -1, -1);
    MEMORY[0x24C577040](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  objc_msgSend(*(id *)(v1 + v6), sel_setDelegate_, v1);
  return objc_msgSend(*(id *)(v1 + v6), sel_resume);
}

uint64_t type metadata accessor for ConnectionManager()
{
  return self;
}

uint64_t sub_24828CF64()
{
  uint64_t v1 = sub_24829AAA0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24828D020, 0, 0);
}

id sub_24828D020()
{
  sub_24829A8B0();
  uint64_t v1 = sub_24829AA90();
  os_log_type_t v2 = sub_24829AE40();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2481C8000, v1, v2, "Checking in Managed Accounts", v3, 2u);
    MEMORY[0x24C577040](v3, -1, -1);
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  objc_msgSend(self, sel_sharedInstance);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29118]), sel_init);
  if (result)
  {
    sub_24829A4F0();
    swift_allocObject();
    v0[5] = sub_24829A4E0();
    uint64_t v9 = (uint64_t (*)(void))((int)*MEMORY[0x263F27310] + MEMORY[0x263F27310]);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[6] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24828D1EC;
    return (id)v9();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24828D1EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24828D318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24828E0E4(a1, (uint64_t)v8);
  uint64_t v9 = sub_24829AD90();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2481D1E28((uint64_t)v8, &qword_26B13C9D0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_24829AD30();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24829AD80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_24828D564(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24829AAA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v26 - v12;
  if (sub_24829A790() == a1 && v14 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_24829A8B0();
    unint64_t v16 = sub_24829AA90();
    os_log_type_t v17 = sub_24829AE50();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_2481C8000, v16, v17, "Received notification to check in Managed Accounts", v18, 2u);
      MEMORY[0x24C577040](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    sub_24829AD70();
    uint64_t v19 = sub_24829AD90();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 0;
    *(void *)(v20 + 24) = 0;
    sub_24828D318((uint64_t)v6, (uint64_t)&unk_269310A20, v20);
    swift_release();
    return sub_2481D1E28((uint64_t)v6, &qword_26B13C9D0);
  }
  char v15 = sub_24829B150();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_5;
  }
  sub_24829A8B0();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_24829AA90();
  os_log_type_t v23 = sub_24829AE50();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    v26[1] = v24 + 4;
    swift_bridgeObjectRetain();
    v26[2] = sub_248227614(a1, a2, &v27);
    sub_24829AF60();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2481C8000, v22, v23, "No special handling written for XPC event: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v25, -1, -1);
    MEMORY[0x24C577040](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_24828D944(uint64_t result)
{
  if (qword_26FC50398)
  {
    uint64_t v1 = (void *)result;
    swift_bridgeObjectRetain();
    os_log_type_t v2 = (void *)sub_24829AC50();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(v1, sel_valueForEntitlement_, v2);

    if (v3)
    {
      sub_24829AF80();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v5, 0, sizeof(v5));
    }
    sub_24828DF98((uint64_t)v5, (uint64_t)v6);
    if (v7)
    {
      if (swift_dynamicCast() & 1) != 0 && (v4) {
        return 1;
      }
    }
    else
    {
      sub_2481D1E28((uint64_t)v6, &qword_269310B80);
    }
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24828DA58(void *a1)
{
  uint64_t v2 = sub_24829AAA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v39 - v7;
  int v9 = sub_24828D944((uint64_t)a1);
  if ((v9 & 1) == 0)
  {
    sub_24829A8B0();
    uint64_t v36 = sub_24829AA90();
    os_log_type_t v37 = sub_24829AE60();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_2481C8000, v36, v37, "Client does not have any valid entitlemnts.", v38, 2u);
      MEMORY[0x24C577040](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return (id)(v9 & 1);
  }
  uint64_t v10 = self;
  id result = objc_msgSend(v10, sel_defaultStore);
  if (result)
  {
    uint64_t v12 = result;
    int v42 = v9;
    uint64_t v43 = v3;
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D88]), sel_initWithAccountStore_, result);

    v48[3] = sub_248228708(0, &qword_26B13CDE0);
    v48[4] = &off_26FC51498;
    v48[0] = v13;
    id result = objc_msgSend(v10, sel_defaultStore);
    if (result)
    {
      uint64_t v14 = result;
      uint64_t v15 = type metadata accessor for AISSignOutService();
      sub_2481D1BB0((uint64_t)v48, (uint64_t)v45);
      uint64_t v16 = v46;
      uint64_t v17 = v47;
      uint64_t v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, v46);
      MEMORY[0x270FA5388](v18);
      uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v21 + 16))(v20);
      v44 = v14;
      uint64_t v22 = sub_248228708(0, &qword_26B13CDD0);
      uint64_t v23 = sub_24827D06C((uint64_t)v20, (uint64_t)&v44, v15, v16, v22, v17, (uint64_t)&off_26FC514A8);
      uint64_t v24 = v14;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      objc_msgSend(a1, sel_setExportedObject_, v23);
      sub_24829A570();
      uint64_t v25 = (void *)sub_24829A560();
      objc_msgSend(a1, sel_setExportedInterface_, v25);

      objc_msgSend(a1, sel_resume);
      sub_24829A8B0();
      uint64_t v26 = a1;
      uint64_t v27 = sub_24829AA90();
      os_log_type_t v28 = sub_24829AE50();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v39 = v24;
        uint64_t v30 = (uint8_t *)v29;
        uint64_t v31 = swift_slowAlloc();
        uint64_t v41 = v2;
        unint64_t v32 = (void *)v31;
        *(_DWORD *)uint64_t v30 = 138412290;
        v45[0] = v26;
        uint64_t v33 = v26;
        uint64_t v40 = v8;
        uint64_t v34 = v33;
        sub_24829AF60();
        *unint64_t v32 = v26;

        uint64_t v8 = v40;
        _os_log_impl(&dword_2481C8000, v27, v28, "New connection accepted: %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9F0);
        swift_arrayDestroy();
        uint64_t v35 = v32;
        uint64_t v2 = v41;
        MEMORY[0x24C577040](v35, -1, -1);
        MEMORY[0x24C577040](v30, -1, -1);
        uint64_t v26 = v39;
      }
      else
      {

        uint64_t v27 = v24;
      }
      LOBYTE(v9) = v42;

      swift_release();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
      return (id)(v9 & 1);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
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

uint64_t sub_24828DF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24828E000()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24828E038()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2481CC140;
  return sub_24828CF64();
}

uint64_t sub_24828E0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24828E14C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24828E184(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2481CC140;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269310328 + dword_269310328);
  return v6(a1, v4);
}

uint64_t sub_24828E23C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_24828E250(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_24828E264(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_24828E278(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_24828E28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 80) + **(int **)(a4 + 80));
  int v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int v9 = v4;
  v9[1] = sub_2481CC140;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24828E39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  int v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int v9 = v4;
  v9[1] = sub_2481CC140;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24828E4AC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v3 = v1 + 64;
  uint64_t v2 = v4;
  uint64_t v5 = 1 << *(unsigned char *)(*(void *)(v0 + 112) + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  uint64_t v7 = v6 & v2;
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    int64_t v11 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v8) {
      goto LABEL_25;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v10;
    if (!v12)
    {
      int64_t v10 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_25;
      }
      uint64_t v12 = *(void *)(v3 + 8 * v10);
      if (!v12)
      {
        int64_t v10 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_25;
        }
        uint64_t v12 = *(void *)(v3 + 8 * v10);
        if (!v12)
        {
          int64_t v10 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_25;
          }
          uint64_t v12 = *(void *)(v3 + 8 * v10);
          if (!v12)
          {
            int64_t v10 = v11 + 4;
            if (v11 + 4 >= v8) {
              goto LABEL_25;
            }
            uint64_t v12 = *(void *)(v3 + 8 * v10);
            if (!v12) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    uint64_t v7 = (v12 - 1) & v12;
LABEL_5:
    uint64_t result = sub_24829AB30();
  }
  int64_t v13 = v11 + 5;
  if (v13 >= v8)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_defaultActor_destroy();
    return v0;
  }
  uint64_t v12 = *(void *)(v3 + 8 * v13);
  if (v12)
  {
    int64_t v10 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v10 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_25;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v10);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24828E654()
{
  sub_24828E4AC();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for MachServiceManager()
{
  return self;
}

uint64_t sub_24828E6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t *)(v3 + 112);
  swift_beginAccess();
  if (*(void *)(*(void *)(v3 + 112) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_248277690(a2, a3);
    if (v8)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24829AB30();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v7;
    *uint64_t v7 = 0x8000000000000000;
    sub_2482918F0(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v7 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24828EB80(a2, a3);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_endAccess();
}

uint64_t sub_24828E814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_248277820(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24829210C();
      uint64_t v9 = v19;
    }

    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = sub_248299D30();
    uint64_t v18 = *(void *)(v11 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 32))(a2, v10 + *(void *)(v18 + 72) * v6, v11);
    sub_248290AD4(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = sub_248299D30();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_24828E9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_248277788(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2482929A0();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_248299D30();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_248299C60();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_248290D00(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_248299C60();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_24828EB80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_248277690(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_248292D48();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_248290FF0(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24828EC50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FE60);
  char v36 = a2;
  uint64_t v6 = sub_24829B0D0();
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24829B200();
    sub_24829ACA0();
    uint64_t result = sub_24829B220();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
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
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24828EF68(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = sub_248299D30();
  uint64_t v5 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC28);
  int v43 = a2;
  uint64_t v8 = sub_24829B0D0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v40 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  v44 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  uint64_t v42 = v7;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v20 >= v39) {
      break;
    }
    int64_t v21 = v40;
    unint64_t v22 = v40[v20];
    ++v16;
    if (!v22)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v22 = v40[v16];
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v22 = v40[v23];
        if (!v22)
        {
          while (1)
          {
            int64_t v16 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v39) {
              goto LABEL_34;
            }
            unint64_t v22 = v40[v16];
            ++v23;
            if (v22) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v23;
      }
    }
LABEL_21:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v16 << 6);
LABEL_22:
    int64_t v24 = *(void **)(*(void *)(v7 + 48) + 8 * v19);
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v7 + 56) + v26 * v19;
    if (v43)
    {
      (*v44)(v45, v27, v46);
    }
    else
    {
      (*v41)(v45, v27, v46);
      id v28 = v24;
    }
    sub_24829AC80();
    sub_24829B200();
    sub_24829ACA0();
    uint64_t v29 = sub_24829B220();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v30 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v14 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v31) & ~*(void *)(v14 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v14 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v17 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v9 + 48) + 8 * v17) = v24;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v44)(*(void *)(v9 + 56) + v26 * v17, v45, v46);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v42;
    uint64_t v5 = v25;
  }
  swift_release();
  uint64_t v3 = v38;
  int64_t v21 = v40;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v7 + 32);
  if (v37 >= 64) {
    bzero(v21, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v21 = -1 << v37;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_24828F378(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20);
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_248299D30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC40);
  int v50 = a2;
  uint64_t v12 = v11;
  uint64_t v13 = sub_24829B0D0();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_41;
  }
  uint64_t v53 = v7;
  uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 64);
  uint64_t v46 = (void *)(v12 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  v44 = v2;
  int64_t v45 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v19 = v13 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v48 = v12;
  uint64_t v51 = v10;
  while (1)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    uint64_t v26 = v46;
    unint64_t v27 = v46[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v18 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
    uint64_t v10 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v12 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v10, v31, v53);
      uint64_t v32 = *(void *)(v12 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_248228020(v32 + v33 * v24, v54);
    }
    else
    {
      (*v47)(v10, v31, v53);
      uint64_t v34 = *(void *)(v12 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_248293354(v34 + v33 * v24, v54);
    }
    sub_248293294();
    uint64_t result = sub_24829AC30();
    uint64_t v35 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v10 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      uint64_t v10 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v19 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v14 + 48) + v30 * v22), (unint64_t)v10, v53);
    uint64_t result = sub_248228020(v54, *(void *)(v14 + 56) + v33 * v22);
    ++*(void *)(v14 + 16);
    uint64_t v12 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  uint64_t v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v12 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v42;
  }
  *(void *)(v12 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v14;
  return result;
}

uint64_t sub_24828F834(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_248299D30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC50);
  int v48 = a2;
  uint64_t v10 = sub_24829B0D0();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v42 = v2;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  v44 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  int64_t v43 = (unint64_t)(v12 + 63) >> 6;
  int64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v49 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  int v50 = v8;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v46 = v9;
  uint64_t v47 = v6;
  uint64_t v51 = v5;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v43) {
      break;
    }
    unint64_t v24 = v44;
    unint64_t v25 = v44[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v25 = v44[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v44[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v43) {
              goto LABEL_34;
            }
            unint64_t v25 = v44[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    uint64_t v29 = 16 * v22;
    if (v48)
    {
      (*v49)(v50, v28, v51);
      uint64_t v30 = *(void *)(v9 + 56) + v29;
      id v31 = *(id *)v30;
      char v32 = *(unsigned char *)(v30 + 8);
    }
    else
    {
      (*v45)(v50, v28, v51);
      uint64_t v33 = *(void *)(v9 + 56) + v29;
      id v31 = *(id *)v33;
      char v32 = *(unsigned char *)(v33 + 8);
      sub_248207B3C(*(id *)v33, v32);
    }
    sub_248293294();
    uint64_t result = sub_24829AC30();
    uint64_t v34 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v6 = v47;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      uint64_t v6 = v47;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v16 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v19 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v49)(*(void *)(v11 + 48) + v27 * v19, v50, v51);
    uint64_t v20 = *(void *)(v11 + 56) + 16 * v19;
    *(void *)uint64_t v20 = v31;
    *(unsigned char *)(v20 + 8) = v32;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v46;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v24 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v9 + 32);
  if (v41 >= 64) {
    bzero(v24, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v41;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24828FC5C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = sub_248299C60();
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v54 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_248299D30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC18);
  int v51 = a2;
  uint64_t v12 = sub_24829B0D0();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v53 = v7;
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  int64_t v45 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int64_t v43 = v2;
  int64_t v44 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v46 = v5 + 16;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  int64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v50 = v5;
  uint64_t v52 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v48 = v11;
  uint64_t v49 = v8;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44) {
      break;
    }
    int64_t v26 = v45;
    unint64_t v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v44) {
        goto LABEL_34;
      }
      unint64_t v27 = v45[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v43;
          if ((v51 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v44) {
              goto LABEL_34;
            }
            unint64_t v27 = v45[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v8 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v51)
    {
      (*v18)(v10, v30, v53);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 32))(v54, v31 + v32 * v24, v55);
    }
    else
    {
      (*v47)(v10, v30, v53);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v50 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v54, v33 + v32 * v24, v55);
    }
    sub_248293294();
    uint64_t result = sub_24829AC30();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v8 = v49;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      uint64_t v8 = v49;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v53);
    uint64_t result = (*v52)(*(void *)(v13 + 56) + v32 * v22, v54, v55);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
  }
  swift_release();
  uint64_t v3 = v43;
  int64_t v26 = v45;
  if ((v51 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_248290138(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B13CDF8);
  char v36 = a2;
  uint64_t v6 = sub_24829B0D0();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_24829B200();
    sub_24829ACA0();
    uint64_t result = sub_24829B220();
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
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_248290450(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FFC0);
  char v39 = a2;
  uint64_t v6 = sub_24829B0D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v37 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v36) {
      break;
    }
    unint64_t v23 = v37;
    unint64_t v24 = v37[v22];
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v24 = v37[v13];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_33:
          swift_release();
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = v37[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v24 = v37[v13];
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
    uint64_t v31 = *(void *)(v5 + 56) + 16 * v21;
    uint64_t v32 = *(void **)v31;
    char v33 = *(unsigned char *)(v31 + 8);
    if ((v39 & 1) == 0)
    {
      id v34 = v30;
      sub_248228014(v32, v33);
    }
    sub_24829AC80();
    sub_24829B200();
    sub_24829ACA0();
    uint64_t v14 = sub_24829B220();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v30;
    uint64_t v19 = *(void *)(v7 + 56) + 16 * v18;
    *(void *)uint64_t v19 = v32;
    *(unsigned char *)(v19 + 8) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v23 = v37;
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_248290798(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC00);
  char v35 = a2;
  uint64_t v6 = sub_24829B0D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
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
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    unint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    unint64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    int64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_248228004(v22, v36);
    }
    else
    {
      sub_248228088((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_24829AC80();
    sub_24829B200();
    sub_24829ACA0();
    uint64_t v24 = sub_24829B220();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_248228004(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_248290AD4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24829AFA0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        uint64_t v9 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_24829AC80();
        sub_24829B200();
        id v10 = v9;
        sub_24829ACA0();
        uint64_t v11 = sub_24829B220();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v12 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        unint64_t v14 = (void *)(v13 + 8 * v3);
        unint64_t v15 = (void *)(v13 + 8 * v6);
        if (v3 != v6 || v14 >= v15 + 1) {
          void *v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(sub_248299D30() - 8) + 72);
        int64_t v18 = v17 * v3;
        uint64_t result = v16 + v17 * v3;
        int64_t v19 = v17 * v6;
        unint64_t v20 = v16 + v17 * v6 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_248290D00(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_248299D30();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v41 = a2 + 64;
    unint64_t result = sub_24829AFA0();
    uint64_t v12 = v41;
    if ((*(void *)(v41 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v39 = (result + 1) & v11;
      unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      unint64_t v38 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v38(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        sub_248293294();
        uint64_t v18 = sub_24829AC30();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v39)
        {
          if (v19 < v39 || a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else if (v19 < v39 && a1 < (uint64_t)v19)
        {
          goto LABEL_6;
        }
        uint64_t v22 = *(void *)(a2 + 48);
        unint64_t v23 = v22 + v15 * a1;
        unint64_t v24 = v22 + v17 + v15;
        if (v15 * a1 < v17 || v23 >= v24)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v15 * a1 != v17)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v26 = *(void *)(a2 + 56);
        uint64_t v27 = *(void *)(*(void *)(sub_248299C60() - 8) + 72);
        int64_t v28 = v27 * a1;
        unint64_t result = v26 + v27 * a1;
        int64_t v29 = v27 * v10;
        unint64_t v30 = v26 + v27 * v10 + v27;
        if (v28 < v29 || result >= v30)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v28 == v29) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v41;
      }
      while (((*(void *)(v41 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v32 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v33 = *v32;
    uint64_t v34 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v32 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v34 = *v32;
    uint64_t v33 = (-1 << a1) - 1;
  }
  *uint64_t v32 = v34 & v33;
  uint64_t v35 = *(void *)(a2 + 16);
  BOOL v36 = __OFSUB__(v35, 1);
  uint64_t v37 = v35 - 1;
  if (v36)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v37;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_248290FF0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_24829AFA0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24829B200();
        swift_bridgeObjectRetain();
        sub_24829ACA0();
        uint64_t v9 = sub_24829B220();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_2482911C8(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_248277820((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_24829210C();
      goto LABEL_7;
    }
    sub_24828EF68(v12, a3 & 1);
    unint64_t v23 = sub_248277820((uint64_t)a2);
    if ((v13 & 1) == (v24 & 1))
    {
      unint64_t v9 = v23;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for AIDAServiceType(0);
    id result = (id)sub_24829B180();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_248299D30();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v9;
    return (id)v19(v21, a1, v20);
  }
LABEL_13:
  sub_248291BA4(v9, (uint64_t)a2, a1, v15);
  return a2;
}

uint64_t sub_248291338(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_248299D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_248277788(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2482923A0();
      goto LABEL_7;
    }
    sub_24828F378(v17, a3 & 1);
    unint64_t v24 = sub_248277788(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_248291C50(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_24829B180();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21
      + *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20) - 8) + 72) * v14;
  return sub_2482932EC(a1, v22);
}

void sub_248291524(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v27 = a1;
  uint64_t v9 = sub_248299D30();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (void *)*v4;
  unint64_t v15 = sub_248277788(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0) {
    goto LABEL_9;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_2482926BC();
    goto LABEL_9;
  }
  sub_24828F834(v18, a4 & 1);
  unint64_t v21 = sub_248277788(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_24829B180();
    __break(1u);
    return;
  }
  unint64_t v15 = v21;
LABEL_9:
  int v23 = a2 & 1;
  unint64_t v24 = *v5;
  if (v19)
  {
    uint64_t v25 = v24[7] + 16 * v15;
    sub_248207B30(*(id *)v25, *(unsigned char *)(v25 + 8));
    *(void *)uint64_t v25 = v27;
    *(unsigned char *)(v25 + 8) = v23 != 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
    sub_248291D30(v15, (uint64_t)v12, v27, v23, v24);
  }
}

uint64_t sub_2482916EC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_248299D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_248277788(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2482929A0();
      goto LABEL_7;
    }
    sub_24828FC5C(v17, a3 & 1);
    unint64_t v28 = sub_248277788(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_248291DF8(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_24829B180();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_248299C60();
  uint64_t v23 = *(void *)(v22 - 8);
  unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;
  return v24(v26, a1, v25);
}

uint64_t sub_2482918F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_248277690(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_248292D48();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_248290138(v15, a4 & 1);
  unint64_t v21 = sub_248277690(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24829B180();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

_OWORD *sub_248291A60(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_248277820((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_2482930CC();
      goto LABEL_7;
    }
    sub_248290798(v12, a3 & 1);
    unint64_t v18 = sub_248277820((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for AIDAServiceType(0);
    uint64_t result = (_OWORD *)sub_24829B180();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    char v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_248228004(a1, v16);
  }
LABEL_13:
  sub_248291EEC(v9, (uint64_t)a2, a1, v15);
  return a2;
}

uint64_t sub_248291BA4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_248299D30();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_248291C50(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_248299D30();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20);
  uint64_t result = sub_248228020(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_248291D30(unint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_248299D30();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = a5[7] + 16 * a1;
  *(void *)uint64_t v13 = a3;
  *(unsigned char *)(v13 + 8) = a4 & 1;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

uint64_t sub_248291DF8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_248299D30();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_248299C60();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

_OWORD *sub_248291EEC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_248228004(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void *sub_248291F54()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FE60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24829B0C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

id sub_24829210C()
{
  uint64_t v1 = sub_248299D30();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC28);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24829B0C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v5 + 48) + 8 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(void *)(*(void *)(v7 + 48) + v16) = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2482923A0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20);
  uint64_t v29 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_248299D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC40);
  uint64_t v24 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_24829B0C0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *uint64_t v24 = v10;
    return result;
  }
  id result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v25 = v8 + 64;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v5 + 32;
  uint64_t v28 = v5 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v13);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v5 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v19, v4);
    unint64_t v20 = *(void *)(v29 + 72) * v18;
    sub_248293354(*(void *)(v8 + 56) + v20, (uint64_t)v3);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v19, v7, v4);
    id result = (void *)sub_248228020((uint64_t)v3, *(void *)(v10 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_2482926BC()
{
  uint64_t v39 = sub_248299D30();
  uint64_t v1 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  unint64_t v38 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC50);
  uint64_t v33 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24829B0C0();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v41 = v4;
  if (!v5)
  {
    id result = (char *)swift_release();
    uint64_t v31 = v41;
    uint64_t v30 = v33;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  id result = (char *)(v4 + 64);
  uint64_t v8 = (char *)(v3 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  uint64_t v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    id result = (char *)memmove(result, v8, 8 * v9);
    uint64_t v6 = v41;
  }
  int64_t v10 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v40 = v3;
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  uint64_t v37 = v1 + 16;
  int64_t v35 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v36 = v1 + 32;
  uint64_t v15 = v38;
  uint64_t v14 = v39;
  uint64_t v16 = v41;
  while (1)
  {
    if (v13)
    {
      unint64_t v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v18 = v17 | (v10 << 6);
      uint64_t v19 = v40;
      goto LABEL_9;
    }
    int64_t v27 = v10 + 1;
    uint64_t v19 = v40;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v34 + 8 * v27);
    ++v10;
    if (!v28)
    {
      int64_t v10 = v27 + 1;
      if (v27 + 1 >= v35) {
        goto LABEL_23;
      }
      unint64_t v28 = *(void *)(v34 + 8 * v10);
      if (!v28) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v28 - 1) & v28;
    unint64_t v18 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(void *)(v19 + 48) + v20, v14);
    uint64_t v21 = *(void *)(v19 + 56);
    uint64_t v22 = 16 * v18;
    uint64_t v23 = v21 + 16 * v18;
    uint64_t v24 = *(void **)v23;
    char v25 = *(unsigned char *)(v23 + 8);
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v16 + 48) + v20, v15, v14);
    uint64_t v26 = *(void *)(v16 + 56) + v22;
    *(void *)uint64_t v26 = v24;
    *(unsigned char *)(v26 + 8) = v25;
    id result = (char *)sub_248207B3C(v24, v25);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v35)
  {
LABEL_23:
    id result = (char *)swift_release();
    uint64_t v30 = v33;
    uint64_t v31 = v41;
    goto LABEL_25;
  }
  unint64_t v28 = *(void *)(v34 + 8 * v29);
  if (v28)
  {
    int64_t v10 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v10 >= v35) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v34 + 8 * v10);
    ++v29;
    if (v28) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2482929A0()
{
  uint64_t v42 = sub_248299C60();
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_248299D30();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC18);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24829B0C0();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    id result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  id result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  uint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    char v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_248292D48()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B13CDF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24829B0C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    id result = (void *)swift_retain();
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

void *sub_248292F00()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FFC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24829B0C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void **)v19;
    char v21 = *(unsigned char *)(v19 + 8);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = *(void *)(v4 + 56) + v18;
    *(void *)uint64_t v22 = v20;
    *(unsigned char *)(v22 + 8) = v21;
    id v23 = v17;
    id result = sub_248228014(v20, v21);
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2482930CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26930FC00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24829B0C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_248228088(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_248228004(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_248293294()
{
  unint64_t result = qword_269310528;
  if (!qword_269310528)
  {
    sub_248299D30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269310528);
  }
  return result;
}

uint64_t sub_2482932EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_248293354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26930FF20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2482933BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2482933D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_2481D20AC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2482934E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_248264D8C;
  return v9(a1, a2, a3);
}

uint64_t sub_2482935E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_2481D20AC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2482936F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_248265028;
  return v9(a1, a2, a3);
}

uint64_t sub_2482937F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_2481D20AC;
  return v9(a1, a2, a3);
}

uint64_t sub_2482938FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 56) + **(int **)(a4 + 56));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_2481CC140;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_248293A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 64) + **(int **)(a3 + 64));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_2481D20AC;
  return v9(a1, a2, a3);
}

uint64_t sub_248293B0C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  int64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 72) + **(int **)(a5 + 72));
  uint64_t v10 = a3 & 1;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_2481D20AC;
  return v13(a1, a2, v10, a4, a5);
}

uint64_t sub_248293C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 80) + **(int **)(a3 + 80));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_2481D20AC;
  return v9(a1, a2, a3);
}

uint64_t sub_248293D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 88) + **(int **)(a4 + 88));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_2481D20AC;
  return v11(a1, a2, a3, a4);
}

void *initializeBufferWithCopyOfBuffer for AuthenticationReport(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AuthenticationReport()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AuthenticationReport(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for AuthenticationReport(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthenticationReport(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AuthenticationReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationReport()
{
  return &type metadata for AuthenticationReport;
}

uint64_t *sub_248293FA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_248299D30();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_248294078(uint64_t a1)
{
  uint64_t v2 = sub_248299D30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2482940EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248299D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24829416C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248299D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2482941F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248299D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248294274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248299D30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2482942F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24829430C);
}

uint64_t sub_24829430C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248299D30();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
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

uint64_t sub_2482943CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2482943E0);
}

uint64_t sub_2482943E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_248299D30();
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

uint64_t type metadata accessor for SignInReport()
{
  uint64_t result = qword_269310A98;
  if (!qword_269310A98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2482944E8()
{
  uint64_t result = sub_248299D30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_248294580()
{
  unint64_t v1 = (void *)v0;
  uint64_t v2 = sub_24829AAA0();
  uint64_t v73 = *(void *)(v2 - 8);
  uint64_t v74 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v66 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v66 - v10;
  MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&v66 - v12;
  uint64_t v14 = sub_248299C30();
  if (v15 >> 60 == 15) {
    return 0;
  }
  uint64_t v17 = v14;
  unint64_t v18 = v15;
  uint64_t v72 = v5;
  uint64_t v70 = v11;
  sub_24829A890();
  sub_248296518(v17, v18);
  sub_2482739EC(v17, v18);
  int64_t v19 = sub_24829AA90();
  os_log_type_t v20 = sub_24829AE50();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    os_log_type_t v71 = v8;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    v77[0] = (uint64_t)v68;
    *(_DWORD *)uint64_t v22 = 136315138;
    os_log_type_t v67 = v22 + 4;
    sub_2482739EC(v17, v18);
    uint64_t v23 = sub_248299990();
    uint64_t v69 = (void *)v0;
    unint64_t v24 = v18;
    unint64_t v26 = v25;
    sub_2482050AC(v17, v24);
    v76[0] = sub_248227614(v23, v26, v77);
    sub_24829AF60();
    unint64_t v18 = v24;
    unint64_t v1 = v69;
    swift_bridgeObjectRelease();
    sub_2482050AC(v17, v18);
    sub_2482050AC(v17, v18);
    _os_log_impl(&dword_2481C8000, v19, v20, "Attempting to unarchive SRP results: %s", v22, 0xCu);
    unint64_t v27 = v68;
    swift_arrayDestroy();
    MEMORY[0x24C577040](v27, -1, -1);
    int64_t v28 = v22;
    uint64_t v8 = v71;
    MEMORY[0x24C577040](v28, -1, -1);
  }
  else
  {
    sub_2482050AC(v17, v18);
    sub_2482050AC(v17, v18);
  }

  int64_t v29 = *(char **)(v73 + 8);
  ((void (*)(char *, uint64_t))v29)(v13, v74);
  sub_248228708(0, &qword_269310AF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269310B00);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_24829D810;
  *(void *)(v30 + 32) = sub_248228708(0, &qword_269310B08);
  *(void *)(v30 + 40) = sub_248228708(0, &qword_269310B10);
  *(void *)(v30 + 48) = sub_248228708(0, (unint64_t *)&unk_269310B18);
  *(void *)(v30 + 56) = sub_248228708(0, (unint64_t *)&unk_269310AE8);
  *(void *)(v30 + 64) = sub_248228708(0, &qword_26930FF50);
  *(void *)(v30 + 72) = sub_248228708(0, &qword_269310B28);
  *(void *)(v30 + 80) = sub_248228708(0, &qword_269310B30);
  *(void *)(v30 + 88) = sub_248228708(0, &qword_269310B38);
  *(void *)(v30 + 96) = sub_248228708(0, &qword_269310B40);
  *(void *)(v30 + 104) = sub_248228708(0, &qword_269310B48);
  *(void *)(v30 + 112) = sub_248228708(0, &qword_269310B50);
  *(void *)(v30 + 120) = sub_248228708(0, &qword_269310B58);
  *(void *)(v30 + 128) = sub_248228708(0, &qword_269310B60);
  *(void *)(v30 + 136) = sub_248228708(0, &qword_269310B68);
  sub_24829AEC0();
  if (v1)
  {
    swift_bridgeObjectRelease();
    unint64_t v31 = (unint64_t)v72;
    sub_24829A890();
    id v32 = v1;
    id v33 = v1;
    int64_t v34 = sub_24829AA90();
    os_log_type_t v35 = sub_24829AE60();
    uint64_t v16 = v35;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v69 = (void *)v17;
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v71 = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 138412290;
      id v37 = v1;
      uint64_t v38 = v29;
      unint64_t v39 = v18;
      uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
      v76[0] = v40;
      uint64_t v17 = (uint64_t)v69;
      sub_24829AF60();
      uint64_t v41 = v71;
      *(void *)os_log_type_t v71 = v40;
      unint64_t v18 = v39;
      int64_t v29 = v38;

      _os_log_impl(&dword_2481C8000, v34, (os_log_type_t)v16, "Failed to unarchive SRP results: %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9F0);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v41, -1, -1);
      uint64_t v42 = v36;
      unint64_t v31 = (unint64_t)v72;
      MEMORY[0x24C577040](v42, -1, -1);
    }
    else
    {
    }
    ((void (*)(unint64_t, uint64_t))v29)(v31, v74);
    sub_24829652C();
    swift_allocError();
    *uint64_t v54 = v1;
    id v55 = v1;
    swift_willThrow();
    sub_2482050AC(v17, v18);

    return v16;
  }
  swift_bridgeObjectRelease();
  sub_24828DF98((uint64_t)v76, (uint64_t)v77);
  sub_248296580((uint64_t)v77, (uint64_t)v76);
  if (v76[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269310B88);
    if (swift_dynamicCast())
    {
      uint64_t v16 = v75[0];
      uint64_t v43 = v70;
      sub_24829A890();
      swift_bridgeObjectRetain_n();
      uint64_t v44 = sub_24829AA90();
      os_log_type_t v45 = sub_24829AE50();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v69 = (void *)v17;
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        os_log_type_t v71 = v29;
        uint64_t v48 = v47;
        v76[0] = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        os_log_type_t v67 = v46 + 4;
        uint64_t v68 = v46;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
        uint64_t v49 = sub_24829AC20();
        uint64_t v72 = (char *)v18;
        uint64_t v50 = v49;
        unint64_t v52 = v51;
        swift_bridgeObjectRelease();
        v75[0] = sub_248227614(v50, v52, v76);
        sub_24829AF60();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        uint64_t v53 = v68;
        _os_log_impl(&dword_2481C8000, v44, v45, "Unarchived SRP results: %s", v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C577040](v48, -1, -1);
        MEMORY[0x24C577040](v53, -1, -1);

        sub_2482050AC((uint64_t)v69, (unint64_t)v72);
        ((void (*)(char *, uint64_t))v71)(v43, v74);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        sub_2482050AC(v17, v18);
        ((void (*)(char *, uint64_t))v29)(v43, v74);
      }
      sub_2481D1E28((uint64_t)v77, &qword_269310B80);
      return v16;
    }
  }
  else
  {
    sub_2481D1E28((uint64_t)v76, &qword_269310B80);
  }
  sub_24829A890();
  sub_248296580((uint64_t)v77, (uint64_t)v76);
  uint64_t v56 = sub_24829AA90();
  os_log_type_t v57 = sub_24829AE60();
  uint64_t v16 = v57;
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v69 = (void *)v17;
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v72 = (char *)v18;
    uint64_t v60 = v59;
    uint64_t v78 = v59;
    *(_DWORD *)uint64_t v58 = 136315138;
    sub_248296580((uint64_t)v76, (uint64_t)v75);
    os_log_type_t v71 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269310B80);
    uint64_t v61 = sub_24829AC90();
    v75[0] = sub_248227614(v61, v62, &v78);
    uint64_t v17 = (uint64_t)v69;
    sub_24829AF60();
    swift_bridgeObjectRelease();
    sub_2481D1E28((uint64_t)v76, &qword_269310B80);
    _os_log_impl(&dword_2481C8000, v56, (os_log_type_t)v16, "Unarchived SRP results were not of the expected type: %s", v58, 0xCu);
    swift_arrayDestroy();
    uint64_t v63 = v60;
    unint64_t v18 = (unint64_t)v72;
    MEMORY[0x24C577040](v63, -1, -1);
    MEMORY[0x24C577040](v58, -1, -1);

    ((void (*)(char *, uint64_t))v29)(v71, v74);
  }
  else
  {
    sub_2481D1E28((uint64_t)v76, &qword_269310B80);

    ((void (*)(char *, uint64_t))v29)(v8, v74);
  }
  sub_24829652C();
  swift_allocError();
  *uint64_t v64 = 1;
  swift_willThrow();
  sub_2482050AC(v17, v18);
  sub_2481D1E28((uint64_t)v77, &qword_269310B80);
  return v16;
}

uint64_t sub_248295054(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_24829AC80();
    if (*(void *)(v1 + 16) && (sub_248277690(v2, v3), (v4 & 1) != 0))
    {
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
      if (swift_dynamicCast()) {
        return v5;
      }
      else {
        return 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return result;
}

double sub_24829511C@<D0>(uint64_t a1@<X8>)
{
  return sub_248295160(a1);
}

double sub_248295160@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_248295170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v10;
  long long v11 = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v5 + 32) = v11;
  uint64_t v12 = type metadata accessor for RemoteSetupService();
  *uint64_t v10 = v5;
  v10[1] = sub_24829525C;
  v10[10] = a4;
  v10[11] = v4;
  v10[8] = a2;
  v10[9] = v12;
  v10[7] = a1;
  return MEMORY[0x270FA2498](sub_248295378, 0, 0);
}

uint64_t sub_24829525C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248295350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return MEMORY[0x270FA2498](sub_248295378, 0, 0);
}

uint64_t sub_248295378()
{
  (*(void (**)(void))(v0[10] + 8))(v0[9]);
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v2 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 56) + **(int **)(v2 + 56));
    uint64_t v3 = (void *)swift_task_alloc();
    v0[12] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_248295500;
    uint64_t v5 = v0[7];
    uint64_t v4 = v0[8];
    return v8(v5, v4, v1, v2);
  }
  else
  {
    sub_2481D1E28((uint64_t)(v0 + 2), (uint64_t *)&unk_26930FDF0);
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_248295500()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_248295678;
  }
  else {
    uint64_t v2 = sub_248295614;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248295614()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248295678()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2482956DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 48) = v8;
  long long v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v4 + 32) = v9;
  uint64_t v10 = type metadata accessor for RemoteSetupService();
  *uint64_t v8 = v4;
  v8[1] = sub_24829683C;
  v8[9] = a3;
  v8[10] = v3;
  v8[7] = a1;
  v8[8] = v10;
  return MEMORY[0x270FA2498](sub_2482957E4, 0, 0);
}

uint64_t sub_2482957C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  return MEMORY[0x270FA2498](sub_2482957E4, 0, 0);
}

uint64_t sub_2482957E4()
{
  (*(void (**)(void))(v0[9] + 8))(v0[8]);
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v2 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 80) + **(int **)(v2 + 80));
    uint64_t v3 = (void *)swift_task_alloc();
    v0[11] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24829596C;
    uint64_t v4 = v0[7];
    return v7(v4, v1, v2);
  }
  else
  {
    sub_2481D1E28((uint64_t)(v0 + 2), (uint64_t *)&unk_26930FDF0);
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24829596C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_248295A80;
  }
  else {
    uint64_t v2 = sub_248295614;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248295A80()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248295AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v10;
  long long v11 = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v5 + 32) = v11;
  uint64_t v12 = type metadata accessor for RemoteSetupService();
  *uint64_t v10 = v5;
  v10[1] = sub_24829683C;
  v10[10] = a4;
  v10[11] = v4;
  v10[8] = a2;
  v10[9] = v12;
  v10[7] = a1;
  return MEMORY[0x270FA2498](sub_248295BF8, 0, 0);
}

uint64_t sub_248295BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return MEMORY[0x270FA2498](sub_248295BF8, 0, 0);
}

uint64_t sub_248295BF8()
{
  (*(void (**)(void))(v0[10] + 8))(v0[9]);
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v2 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 88) + **(int **)(v2 + 88));
    uint64_t v3 = (void *)swift_task_alloc();
    v0[12] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_248295D80;
    uint64_t v5 = v0[7];
    uint64_t v4 = v0[8];
    return v8(v5, v4, v1, v2);
  }
  else
  {
    sub_2481D1E28((uint64_t)(v0 + 2), (uint64_t *)&unk_26930FDF0);
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_248295D80()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24829682C;
  }
  else {
    uint64_t v2 = sub_248296834;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248295E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v4 = sub_24829AC80();
  if (!*(void *)(a1 + 16) || (sub_248277690(v4, v5), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    uint64_t v10 = sub_248299D30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  uint64_t v7 = sub_24829AC80();
  if (*(void *)(a1 + 16) && (sub_248277690(v7, v8), (v9 & 1) != 0))
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = sub_24829AC80();
  if (*(void *)(a1 + 16) && (sub_248277690(v12, v13), (v14 & 1) != 0))
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_248299D00();
  uint64_t v15 = sub_248299D30();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 0, 1, v15);
}

uint64_t sub_2482960FC(uint64_t *a1, uint64_t *a2)
{
  return sub_248296414(*a1, *a2);
}

void sub_248296108(void *a1@<X1>, uint64_t *a2@<X8>)
{
  unint64_t v26 = a1;
  v27[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_24829AAA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
  uint64_t v8 = (void *)sub_24829ABF0();
  v27[0] = 0;
  id v9 = objc_msgSend(v7, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v27);

  id v10 = v27[0];
  if (v9)
  {
    uint64_t v11 = sub_2482999B0();
    uint64_t v13 = v12;

    *a2 = v11;
    a2[1] = v13;
  }
  else
  {
    char v14 = v10;
    uint64_t v15 = (void *)sub_248299950();

    swift_willThrow();
    sub_24829A890();
    id v16 = v15;
    id v17 = v15;
    unint64_t v18 = sub_24829AA90();
    os_log_type_t v19 = sub_24829AE50();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v25 = v4;
      *(_DWORD *)os_log_type_t v20 = 138412290;
      v24[1] = v20 + 4;
      id v22 = v15;
      uint64_t v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v27[0] = v23;
      uint64_t v4 = v25;
      sub_24829AF60();
      *uint64_t v21 = v23;

      _os_log_impl(&dword_2481C8000, v18, v19, "Failed to unarchive SRP results: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9F0);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v21, -1, -1);
      MEMORY[0x24C577040](v20, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_willThrow();
    *unint64_t v26 = v15;
  }
}

uint64_t sub_248296414(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
    uint64_t v3 = sub_24829ABF0();
    uint64_t v4 = (void *)v3;
    if (!a2)
    {
      if (!v3) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (!a2) {
      goto LABEL_14;
    }
    uint64_t v4 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26930FEA0);
  uint64_t v5 = sub_24829ABF0();
  char v6 = (void *)v5;
  if (!v4)
  {
    if (v5)
    {
      char v8 = 0;
      goto LABEL_13;
    }
LABEL_14:
    char v8 = 1;
    return v8 & 1;
  }
  if (!v5)
  {
LABEL_10:
    char v8 = 0;
    char v6 = v4;
    goto LABEL_13;
  }
  sub_248228708(0, (unint64_t *)&unk_269310AE8);
  id v7 = v4;
  char v8 = sub_24829AF10();

LABEL_13:
  return v8 & 1;
}

uint64_t sub_248296518(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2482739EC(a1, a2);
  }
  return a1;
}

unint64_t sub_24829652C()
{
  unint64_t result = qword_269310B70;
  if (!qword_269310B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269310B70);
  }
  return result;
}

uint64_t sub_248296580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *_s17ConversionFailureOwCP(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void _s17ConversionFailureOwxx(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **_s17ConversionFailureOwca(void **a1, void **a2)
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
    char v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void **_s17ConversionFailureOwta(void **a1, unint64_t *a2)
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

uint64_t _s17ConversionFailureOwet(uint64_t *a1, unsigned int a2)
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

uint64_t _s17ConversionFailureOwst(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2482967E4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2482967FC(void *result, int a2)
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

ValueMetadata *_s17ConversionFailureOMa()
{
  return &_s17ConversionFailureON;
}

uint64_t sub_248296840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  id v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *id v9 = v4;
  v9[1] = sub_2481CC140;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_248296950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_248264D8C;
  return v9(a1, a2, a3);
}

uint64_t destroy for SymptomReportGenerator(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SymptomReportGenerator(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  char v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SymptomReportGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
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

uint64_t assignWithTake for SymptomReportGenerator(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  *(_OWORD *)(a1 + 16) = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymptomReportGenerator(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymptomReportGenerator(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymptomReportGenerator()
{
  return &type metadata for SymptomReportGenerator;
}

uint64_t sub_248296C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  uint64_t v7 = sub_24829A250();
  v6[11] = v7;
  v6[12] = *(void *)(v7 - 8);
  v6[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269310188);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  uint64_t v8 = sub_24829A810();
  v6[17] = v8;
  v6[18] = *(void *)(v8 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  uint64_t v9 = sub_248299D30();
  unsigned char v6[24] = v9;
  v6[25] = *(void *)(v9 - 8);
  v6[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248296E70, 0, 0);
}

uint64_t sub_248296E70()
{
  uint64_t v23 = v0;
  if (qword_26930F000 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[6];
  uint64_t v5 = sub_24829AAA0();
  v0[27] = __swift_project_value_buffer(v5, (uint64_t)qword_269310B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  id v6 = sub_24829AA90();
  os_log_type_t v7 = sub_24829AE50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[25];
  uint64_t v9 = v0[26];
  uint64_t v11 = v0[24];
  if (v8)
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = v13;
    *(_DWORD *)id v12 = 136315138;
    sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
    uint64_t v14 = sub_24829B140();
    v0[4] = sub_248227614(v14, v15, &v22);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl(&dword_2481C8000, v6, v7, "Generating symptom report for account with id: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v13, -1, -1);
    MEMORY[0x24C577040](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[26], v0[24]);
  }

  v0[2] = MEMORY[0x263F8EE88];
  id v17 = (void *)swift_task_alloc();
  v0[28] = v17;
  void *v17 = v0;
  v17[1] = sub_24829711C;
  uint64_t v18 = v0[16];
  uint64_t v19 = v0[8];
  uint64_t v20 = v0[6];
  return sub_248297E7C(v18, v20, v16, v19);
}

uint64_t sub_24829711C()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_248297964;
  }
  else
  {
    uint64_t v1 = sub_248297234;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_248297234()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2482988F8(v3);
  }
  else
  {
    uint64_t v5 = v0[22];
    uint64_t v4 = v0[23];
    id v6 = (char *)v0[21];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v3, v1);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v4, v1);
    sub_24826DD84(v5, v6);
    os_log_type_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v7(v5, v1);
    v7(v4, v1);
  }
  uint64_t v10 = (void *)swift_task_alloc();
  v0[29] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2482973A8;
  uint64_t v11 = v0[15];
  uint64_t v12 = v0[9];
  uint64_t v13 = v0[6];
  return sub_248298958(v11, v13, v8, v9, v12);
}

uint64_t sub_2482973A8()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_248297A28;
  }
  else
  {
    uint64_t v1 = sub_2482974C0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_2482974C0()
{
  id v37 = v0;
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2482988F8(v3);
  }
  else
  {
    uint64_t v5 = (char *)v0[21];
    uint64_t v4 = v0[22];
    uint64_t v6 = v0[20];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v3, v1);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
    sub_24826DD84(v4, v5);
    os_log_type_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v7(v4, v1);
    v7(v6, v1);
  }
  uint64_t v8 = sub_24829AA90();
  os_log_type_t v9 = sub_24829AE40();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2481C8000, v8, v9, "Skipping missing services check for this platform", v10, 2u);
    MEMORY[0x24C577040](v10, -1, -1);
  }
  uint64_t v11 = v0[17];
  uint64_t v12 = v0[18];
  uint64_t v13 = v0[14];

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v13, 1, 1, v11);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
  {
    sub_2482988F8(v0[14]);
  }
  else
  {
    uint64_t v14 = (char *)v0[21];
    uint64_t v15 = v0[22];
    uint64_t v17 = v0[18];
    uint64_t v16 = v0[19];
    uint64_t v18 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 32))(v16, v0[14], v18);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v14, v16, v18);
    sub_24826DD84(v15, v14);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v19(v15, v18);
    v19(v16, v18);
  }
  uint64_t v21 = v0[12];
  uint64_t v20 = v0[13];
  uint64_t v22 = v0[11];
  uint64_t v23 = v0[5];
  sub_248299D10();
  sub_24829A220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v23, v22);
  uint64_t v24 = sub_24829AA90();
  os_log_type_t v25 = sub_24829AE40();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v28 = v0[12];
  uint64_t v27 = v0[13];
  uint64_t v29 = v0[11];
  if (v26)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    sub_2482997BC(&qword_269310148, MEMORY[0x263F27128]);
    uint64_t v32 = sub_24829B140();
    v0[3] = sub_248227614(v32, v33, &v36);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    _os_log_impl(&dword_2481C8000, v24, v25, "Generated symptom report: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v31, -1, -1);
    MEMORY[0x24C577040](v30, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v28 + 8))(v0[13], v0[11]);
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
  int64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_248297964()
{
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[18] + 56))(v0[16], 1, 1, v0[17]);
  sub_2482988F8(v0[16]);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[29] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2482973A8;
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[6];
  return sub_248298958(v4, v6, v1, v2, v5);
}

uint64_t sub_248297A28()
{
  uint64_t v30 = v0;
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[18] + 56))(v0[15], 1, 1, v0[17]);
  sub_2482988F8(v0[15]);
  uint64_t v1 = sub_24829AA90();
  os_log_type_t v2 = sub_24829AE40();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2481C8000, v1, v2, "Skipping missing services check for this platform", v3, 2u);
    MEMORY[0x24C577040](v3, -1, -1);
  }
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[14];

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v6, 1, 1, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
  {
    sub_2482988F8(v0[14]);
  }
  else
  {
    uint64_t v8 = (char *)v0[21];
    uint64_t v7 = v0[22];
    uint64_t v10 = v0[18];
    uint64_t v9 = v0[19];
    uint64_t v11 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 32))(v9, v0[14], v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v9, v11);
    sub_24826DD84(v7, v8);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v12(v7, v11);
    v12(v9, v11);
  }
  uint64_t v14 = v0[12];
  uint64_t v13 = v0[13];
  uint64_t v15 = v0[11];
  uint64_t v16 = v0[5];
  sub_248299D10();
  sub_24829A220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v16, v15);
  uint64_t v17 = sub_24829AA90();
  os_log_type_t v18 = sub_24829AE40();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v21 = v0[12];
  uint64_t v20 = v0[13];
  uint64_t v22 = v0[11];
  if (v19)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v29 = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    sub_2482997BC(&qword_269310148, MEMORY[0x263F27128]);
    uint64_t v25 = sub_24829B140();
    v0[3] = sub_248227614(v25, v26, &v29);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    _os_log_impl(&dword_2481C8000, v17, v18, "Generated symptom report: %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v24, -1, -1);
    MEMORY[0x24C577040](v23, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v21 + 8))(v0[13], v0[11]);
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
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_248297E30()
{
  uint64_t v0 = sub_24829AAA0();
  __swift_allocate_value_buffer(v0, qword_269310B90);
  __swift_project_value_buffer(v0, (uint64_t)qword_269310B90);
  return sub_24829A8C0();
}

uint64_t sub_248297E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a2;
  v4[9] = a4;
  v4[7] = a1;
  sub_24829A7E0();
  v4[10] = swift_task_alloc();
  uint64_t v5 = sub_24829A7C0();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v6 = sub_24829A7A0();
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = sub_248299D30();
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248298040, 0, 0);
}

uint64_t sub_248298040()
{
  uint64_t v63 = v0;
  if (qword_26930F000 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = sub_24829AAA0();
  __swift_project_value_buffer(v5, (uint64_t)qword_269310B90);
  type = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  type(v1, v4, v3);
  uint64_t v6 = sub_24829AA90();
  os_log_type_t v7 = sub_24829AE50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 144);
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v62[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
    uint64_t v14 = sub_24829B140();
    *(void *)(v0 + 48) = sub_248227614(v14, v15, v62);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v16(v9, v11);
    _os_log_impl(&dword_2481C8000, v6, v7, "Checking IdMS symptom for account: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v13, -1, -1);
    MEMORY[0x24C577040](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v16(*(void *)(v0 + 168), *(void *)(v0 + 136));
  }

  sub_248264FE4();
  uint64_t v17 = (void *)sub_24829AF30();
  id v18 = objc_msgSend(*(id *)(v0 + 72), sel_continuationTokenForAccount_, v17);
  if (v18)
  {
    BOOL v19 = v18;
    uint64_t v55 = sub_24829AC80();
    unint64_t v57 = v20;
  }
  else
  {
    uint64_t v55 = 0;
    unint64_t v57 = 0;
  }
  uint64_t v21 = v17;
  uint64_t v22 = sub_24829AA90();
  os_log_type_t v23 = sub_24829AE50();
  uint64_t v56 = v16;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412290;
    *(void *)(v0 + 40) = v21;
    unint64_t v26 = v21;
    sub_24829AF60();
    void *v25 = v21;

    _os_log_impl(&dword_2481C8000, v22, v23, "Checking for CK loss symptom using account: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9F0);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v25, -1, -1);
    MEMORY[0x24C577040](v24, -1, -1);
  }
  else
  {

    uint64_t v22 = v21;
  }

  if (v57)
  {
    type(*(void *)(v0 + 160), *(void *)(v0 + 64), *(void *)(v0 + 136));
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_24829AA90();
    os_log_type_t v28 = sub_24829AE50();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = *(void *)(v0 + 160);
    uint64_t v31 = *(void *)(v0 + 136);
    if (v29)
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v62[0] = v60;
      *(_DWORD *)uint64_t v32 = 136315395;
      sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
      uint64_t v33 = sub_24829B140();
      *(void *)(v0 + 24) = sub_248227614(v33, v34, v62);
      sub_24829AF60();
      swift_bridgeObjectRelease();
      v56(v30, v31);
      *(_WORD *)(v32 + 12) = 2085;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 32) = sub_248227614(v55, v57, v62);
      sub_24829AF60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2481C8000, v27, v28, "Found a valid CK, IdMS account for altDSID: %s is good: %{sensitive}s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v60, -1, -1);
      MEMORY[0x24C577040](v32, -1, -1);
    }
    else
    {

      v56(v30, v31);
      swift_bridgeObjectRelease_n();
    }
    uint64_t v35 = 1;
  }
  else
  {
    uint64_t v36 = v21;
    id v37 = sub_24829AA90();
    os_log_type_t v38 = sub_24829AE60();
    os_log_t log = v36;
    if (os_log_type_enabled(v37, v38))
    {
      unint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v39 = 138412290;
      *(void *)(v0 + 16) = v36;
      uint64_t v41 = v36;
      sub_24829AF60();
      *uint64_t v40 = v36;

      _os_log_impl(&dword_2481C8000, v37, v38, "Detected CK loss symptom, account will not be able to silent auth: %@", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9F0);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v40, -1, -1);
      MEMORY[0x24C577040](v39, -1, -1);
      uint64_t v42 = v37;
    }
    else
    {

      uint64_t v42 = v36;
    }
    uint64_t v43 = *(void *)(v0 + 152);
    uint64_t v45 = *(void *)(v0 + 128);
    uint64_t v44 = *(void *)(v0 + 136);
    uint64_t v47 = *(void *)(v0 + 112);
    uint64_t v46 = *(void *)(v0 + 120);
    uint64_t v49 = *(void *)(v0 + 96);
    uint64_t v48 = *(void *)(v0 + 104);
    uint64_t v50 = *(void *)(v0 + 64);
    uint64_t v58 = *(void *)(v0 + 88);

    type(v43, v50, v44);
    (*(void (**)(uint64_t, void, uint64_t))(v46 + 104))(v45, *MEMORY[0x263F275E8], v47);
    (*(void (**)(uint64_t, void, uint64_t))(v49 + 104))(v48, *MEMORY[0x263F27608], v58);
    sub_24829A7D0();
    sub_24829A7F0();

    uint64_t v35 = 0;
  }
  uint64_t v51 = *(void *)(v0 + 56);
  uint64_t v52 = sub_24829A810();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v51, v35, 1, v52);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v53 = *(uint64_t (**)(void))(v0 + 8);
  return v53();
}

uint64_t sub_2482988F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269310188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248298958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a2;
  v5[20] = a5;
  v5[18] = a1;
  sub_24829A7E0();
  v5[21] = swift_task_alloc();
  uint64_t v6 = sub_24829A7C0();
  v5[22] = v6;
  v5[23] = *(void *)(v6 - 8);
  v5[24] = swift_task_alloc();
  uint64_t v7 = sub_24829A7A0();
  v5[25] = v7;
  v5[26] = *(void *)(v7 - 8);
  v5[27] = swift_task_alloc();
  uint64_t v8 = sub_248299D30();
  v5[28] = v8;
  v5[29] = *(void *)(v8 - 8);
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248298B28, 0, 0);
}

uint64_t sub_248298B28()
{
  uint64_t v41 = v0;
  if (qword_26930F000 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[19];
  uint64_t v5 = sub_24829AAA0();
  v0[34] = __swift_project_value_buffer(v5, (uint64_t)qword_269310B90);
  uint64_t v6 = *(void (**)(void, void, void))(v3 + 16);
  v0[35] = v6;
  v0[36] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  os_log_type_t v38 = v6;
  v6(v1, v4, v2);
  uint64_t v7 = sub_24829AA90();
  os_log_type_t v8 = sub_24829AE50();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[33];
  uint64_t v11 = v0[28];
  uint64_t v12 = v0[29];
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v40[0] = v37;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
    uint64_t v14 = sub_24829B140();
    v0[17] = sub_248227614(v14, v15, v40);
    sub_24829AF60();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v10, v11);
    _os_log_impl(&dword_2481C8000, v7, v8, "Checking CDP symptom for account: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C577040](v37, -1, -1);
    MEMORY[0x24C577040](v13, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v0[33], v0[28]);
  }

  v0[37] = v16;
  sub_248299D10();
  uint64_t v17 = (void *)sub_24829AC50();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel_contextForAccountWithAltDSID_, v17);
  v0[38] = v18;

  if (v18)
  {
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F343F0]), sel_initWithContext_, v18);
    v0[39] = v19;
    if (v19)
    {
      id v20 = objc_msgSend(objc_allocWithZone((Class)AISDCloudDataProtectionHelper), sel_initWithStateController_queue_, v19, v0[20]);
      v0[40] = v20;
      v0[2] = v0;
      v0[7] = v0 + 42;
      v0[3] = sub_2482991E4;
      uint64_t v21 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_24825E57C;
      v0[13] = &block_descriptor_4;
      v0[14] = v21;
      objc_msgSend(v20, sel_checkAvailabilityWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    uint64_t v30 = sub_24829AA90();
    os_log_type_t v31 = sub_24829AE60();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_2481C8000, v30, v31, "Failed to init CDPStateController", v32, 2u);
      MEMORY[0x24C577040](v32, -1, -1);
    }

    sub_248299804();
    swift_allocError();
    *uint64_t v33 = 0xD000000000000012;
    v33[1] = 0x800000024829DCE0;
    swift_willThrow();
  }
  else
  {
    v38(v0[30], v0[19], v0[28]);
    uint64_t v22 = sub_24829AA90();
    os_log_type_t v23 = sub_24829AE60();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = v0[30];
    uint64_t v26 = v0[28];
    if (v24)
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v40[0] = v39;
      *(_DWORD *)uint64_t v27 = 136315138;
      sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
      uint64_t v28 = sub_24829B140();
      v0[15] = sub_248227614(v28, v29, v40);
      sub_24829AF60();
      swift_bridgeObjectRelease();
      v16(v25, v26);
      _os_log_impl(&dword_2481C8000, v22, v23, "Failed to build CDP context for account with altDSID: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v39, -1, -1);
      MEMORY[0x24C577040](v27, -1, -1);
    }
    else
    {
      v16(v0[30], v0[28]);
    }

    sub_248299804();
    swift_allocError();
    *unint64_t v34 = xmmword_24829C930;
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t sub_2482991E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    uint64_t v2 = sub_2482996E8;
  }
  else {
    uint64_t v2 = sub_2482992F4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2482992F4()
{
  uint64_t v34 = v0;
  if (*(unsigned char *)(v0 + 336) == 1)
  {
    uint64_t v1 = sub_24829AA90();
    os_log_type_t v2 = sub_24829AE50();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = *(NSObject **)(v0 + 312);
    uint64_t v4 = *(NSObject **)(v0 + 320);
    uint64_t v6 = *(NSObject **)(v0 + 304);
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2481C8000, v1, v2, "Account has access to manatee, no symptom.", v7, 2u);
      MEMORY[0x24C577040](v7, -1, -1);

      uint64_t v8 = 1;
      BOOL v9 = v1;
    }
    else
    {

      uint64_t v8 = 1;
      BOOL v9 = v5;
      uint64_t v5 = v4;
      uint64_t v6 = v1;
    }
  }
  else
  {
    (*(void (**)(void, void, void))(v0 + 280))(*(void *)(v0 + 256), *(void *)(v0 + 152), *(void *)(v0 + 224));
    uint64_t v10 = sub_24829AA90();
    os_log_type_t v11 = sub_24829AE60();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 256);
    uint64_t v14 = *(void *)(v0 + 224);
    if (v12)
    {
      os_log_type_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v33 = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      sub_2482997BC(&qword_26930F1F8, MEMORY[0x263F26F38]);
      uint64_t v17 = sub_24829B140();
      *(void *)(v0 + 128) = sub_248227614(v17, v18, &v33);
      sub_24829AF60();
      swift_bridgeObjectRelease();
      v31(v13, v14);
      _os_log_impl(&dword_2481C8000, v10, v11, "Detected CDP state symptom, account does not have access to manatee: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C577040](v16, -1, -1);
      MEMORY[0x24C577040](v15, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v0 + 296))(*(void *)(v0 + 256), *(void *)(v0 + 224));
    }

    BOOL v9 = *(NSObject **)(v0 + 304);
    uint64_t v30 = *(NSObject **)(v0 + 312);
    uint64_t v32 = *(NSObject **)(v0 + 320);
    uint64_t v19 = *(void *)(v0 + 216);
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 184);
    uint64_t v22 = *(void *)(v0 + 192);
    uint64_t v24 = *(void *)(v0 + 176);
    (*(void (**)(void, void, void))(v0 + 280))(*(void *)(v0 + 248), *(void *)(v0 + 152), *(void *)(v0 + 224));
    (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v19, *MEMORY[0x263F275E0], v20);
    uint64_t v25 = v24;
    uint64_t v5 = v30;
    (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v22, *MEMORY[0x263F27600], v25);
    sub_24829A7D0();
    uint64_t v6 = v32;
    sub_24829A7F0();
    uint64_t v8 = 0;
  }

  uint64_t v26 = *(void *)(v0 + 144);
  uint64_t v27 = sub_24829A810();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, v8, 1, v27);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_2482996E8()
{
  uint64_t v1 = (void *)v0[40];
  BOOL v3 = (void *)v0[38];
  os_log_type_t v2 = (void *)v0[39];
  swift_willThrow();

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

uint64_t sub_2482997BC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_248299804()
{
  unint64_t result = qword_269310BD0;
  if (!qword_269310BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269310BD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymptomReportGenerator.Failure()
{
  return &type metadata for SymptomReportGenerator.Failure;
}

uint64_t sub_2482998B0()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_2482998C0()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_2482998D0()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_2482998E0()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_2482998F0()
{
  return MEMORY[0x270EEDC88]();
}

uint64_t sub_248299900()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_248299910()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_248299920()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_248299930()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_248299940()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_248299950()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_248299960()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_248299970()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_248299980()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_248299990()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_2482999A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2482999B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2482999C0()
{
  return MEMORY[0x270F0D5C8]();
}

uint64_t sub_2482999D0()
{
  return MEMORY[0x270F0D5D0]();
}

uint64_t sub_2482999E0()
{
  return MEMORY[0x270F0D5D8]();
}

uint64_t sub_2482999F0()
{
  return MEMORY[0x270F0D5E0]();
}

uint64_t sub_248299A00()
{
  return MEMORY[0x270F0D5E8]();
}

uint64_t sub_248299A10()
{
  return MEMORY[0x270F0D5F0]();
}

uint64_t sub_248299A20()
{
  return MEMORY[0x270F0D5F8]();
}

uint64_t sub_248299A30()
{
  return MEMORY[0x270F0D600]();
}

uint64_t sub_248299A40()
{
  return MEMORY[0x270F0D608]();
}

uint64_t sub_248299A50()
{
  return MEMORY[0x270F0D610]();
}

uint64_t sub_248299A60()
{
  return MEMORY[0x270F0D618]();
}

uint64_t sub_248299A70()
{
  return MEMORY[0x270F0D620]();
}

uint64_t sub_248299A80()
{
  return MEMORY[0x270F0D628]();
}

uint64_t sub_248299A90()
{
  return MEMORY[0x270F0D630]();
}

uint64_t sub_248299AA0()
{
  return MEMORY[0x270F0D638]();
}

uint64_t sub_248299AB0()
{
  return MEMORY[0x270F0D640]();
}

uint64_t sub_248299AC0()
{
  return MEMORY[0x270F0D648]();
}

uint64_t sub_248299AD0()
{
  return MEMORY[0x270F0D650]();
}

uint64_t sub_248299AE0()
{
  return MEMORY[0x270F0D658]();
}

uint64_t sub_248299AF0()
{
  return MEMORY[0x270F0D660]();
}

uint64_t sub_248299B00()
{
  return MEMORY[0x270F0D668]();
}

uint64_t sub_248299B10()
{
  return MEMORY[0x270F0D670]();
}

uint64_t sub_248299B20()
{
  return MEMORY[0x270F0D678]();
}

uint64_t sub_248299B30()
{
  return MEMORY[0x270F0D680]();
}

uint64_t sub_248299B40()
{
  return MEMORY[0x270F0D688]();
}

uint64_t sub_248299B50()
{
  return MEMORY[0x270F0D698]();
}

uint64_t sub_248299B60()
{
  return MEMORY[0x270F0D6A0]();
}

uint64_t sub_248299B70()
{
  return MEMORY[0x270F0D6A8]();
}

uint64_t sub_248299B80()
{
  return MEMORY[0x270F0D6B0]();
}

uint64_t sub_248299B90()
{
  return MEMORY[0x270F0D6B8]();
}

uint64_t sub_248299BA0()
{
  return MEMORY[0x270F0D6C0]();
}

uint64_t sub_248299BB0()
{
  return MEMORY[0x270F0D6D8]();
}

uint64_t sub_248299BC0()
{
  return MEMORY[0x270F0D6E0]();
}

uint64_t sub_248299BD0()
{
  return MEMORY[0x270F0D6E8]();
}

uint64_t sub_248299BE0()
{
  return MEMORY[0x270F0D6F0]();
}

uint64_t sub_248299BF0()
{
  return MEMORY[0x270F0D6F8]();
}

uint64_t sub_248299C00()
{
  return MEMORY[0x270F0D700]();
}

uint64_t sub_248299C10()
{
  return MEMORY[0x270F0D708]();
}

uint64_t sub_248299C20()
{
  return MEMORY[0x270F0D710]();
}

uint64_t sub_248299C30()
{
  return MEMORY[0x270F0D718]();
}

uint64_t sub_248299C40()
{
  return MEMORY[0x270F0D720]();
}

uint64_t sub_248299C50()
{
  return MEMORY[0x270F0D728]();
}

uint64_t sub_248299C60()
{
  return MEMORY[0x270F0D730]();
}

uint64_t sub_248299C70()
{
  return MEMORY[0x270F0D738]();
}

uint64_t sub_248299C80()
{
  return MEMORY[0x270F0D740]();
}

uint64_t sub_248299C90()
{
  return MEMORY[0x270F0D748]();
}

uint64_t sub_248299CA0()
{
  return MEMORY[0x270F0D750]();
}

uint64_t sub_248299CB0()
{
  return MEMORY[0x270F0D758]();
}

uint64_t sub_248299CD0()
{
  return MEMORY[0x270F0D768]();
}

uint64_t sub_248299CE0()
{
  return MEMORY[0x270F0D770]();
}

uint64_t sub_248299CF0()
{
  return MEMORY[0x270F0D778]();
}

uint64_t sub_248299D00()
{
  return MEMORY[0x270F0D780]();
}

uint64_t sub_248299D10()
{
  return MEMORY[0x270F0D788]();
}

uint64_t sub_248299D20()
{
  return MEMORY[0x270F0D790]();
}

uint64_t sub_248299D30()
{
  return MEMORY[0x270F0D798]();
}

uint64_t sub_248299D40()
{
  return MEMORY[0x270F0D7A0]();
}

uint64_t sub_248299D50()
{
  return MEMORY[0x270F0D7A8]();
}

uint64_t sub_248299D60()
{
  return MEMORY[0x270F0D7B0]();
}

uint64_t sub_248299D70()
{
  return MEMORY[0x270F0D7B8]();
}

uint64_t sub_248299D80()
{
  return MEMORY[0x270F0D7C0]();
}

uint64_t sub_248299D90()
{
  return MEMORY[0x270F0D7C8]();
}

uint64_t sub_248299DA0()
{
  return MEMORY[0x270F0D7D0]();
}

uint64_t sub_248299DB0()
{
  return MEMORY[0x270F0D7D8]();
}

uint64_t sub_248299DC0()
{
  return MEMORY[0x270F0D7E0]();
}

uint64_t sub_248299DD0()
{
  return MEMORY[0x270F0D7E8]();
}

uint64_t sub_248299DE0()
{
  return MEMORY[0x270F0D7F0]();
}

uint64_t sub_248299DF0()
{
  return MEMORY[0x270F0D7F8]();
}

uint64_t sub_248299E00()
{
  return MEMORY[0x270F0D800]();
}

uint64_t sub_248299E10()
{
  return MEMORY[0x270F0D808]();
}

uint64_t sub_248299E20()
{
  return MEMORY[0x270F0D810]();
}

uint64_t sub_248299E30()
{
  return MEMORY[0x270F0D820]();
}

uint64_t sub_248299E40()
{
  return MEMORY[0x270F0D828]();
}

uint64_t sub_248299E50()
{
  return MEMORY[0x270F0D830]();
}

uint64_t sub_248299E60()
{
  return MEMORY[0x270F0D838]();
}

uint64_t sub_248299E70()
{
  return MEMORY[0x270F0D840]();
}

uint64_t sub_248299E80()
{
  return MEMORY[0x270F0D850]();
}

uint64_t sub_248299E90()
{
  return MEMORY[0x270F0D860]();
}

uint64_t sub_248299EA0()
{
  return MEMORY[0x270F0D868]();
}

uint64_t sub_248299EB0()
{
  return MEMORY[0x270F0D878]();
}

uint64_t sub_248299EC0()
{
  return MEMORY[0x270F0D880]();
}

uint64_t sub_248299ED0()
{
  return MEMORY[0x270F0D888]();
}

uint64_t sub_248299EE0()
{
  return MEMORY[0x270F0D890]();
}

uint64_t sub_248299EF0()
{
  return MEMORY[0x270F0D898]();
}

uint64_t sub_248299F00()
{
  return MEMORY[0x270F0D8A0]();
}

uint64_t sub_248299F10()
{
  return MEMORY[0x270F0D8A8]();
}

uint64_t sub_248299F20()
{
  return MEMORY[0x270F0D8B0]();
}

uint64_t sub_248299F30()
{
  return MEMORY[0x270F0D8B8]();
}

uint64_t sub_248299F40()
{
  return MEMORY[0x270F0D8C0]();
}

uint64_t sub_248299F50()
{
  return MEMORY[0x270F0D8C8]();
}

uint64_t sub_248299F60()
{
  return MEMORY[0x270F0D8D0]();
}

uint64_t sub_248299F70()
{
  return MEMORY[0x270F0D8D8]();
}

uint64_t sub_248299F80()
{
  return MEMORY[0x270F0D8E0]();
}

uint64_t sub_248299F90()
{
  return MEMORY[0x270F0D8E8]();
}

uint64_t sub_248299FA0()
{
  return MEMORY[0x270F0D8F8]();
}

uint64_t sub_248299FB0()
{
  return MEMORY[0x270F0D900]();
}

uint64_t sub_248299FC0()
{
  return MEMORY[0x270F0D908]();
}

uint64_t sub_248299FD0()
{
  return MEMORY[0x270F0D910]();
}

uint64_t sub_248299FE0()
{
  return MEMORY[0x270F0D918]();
}

uint64_t sub_248299FF0()
{
  return MEMORY[0x270F0D920]();
}

uint64_t sub_24829A000()
{
  return MEMORY[0x270F0D928]();
}

uint64_t sub_24829A010()
{
  return MEMORY[0x270F0D940]();
}

uint64_t sub_24829A020()
{
  return MEMORY[0x270F0D948]();
}

uint64_t sub_24829A030()
{
  return MEMORY[0x270F0D958]();
}

uint64_t sub_24829A040()
{
  return MEMORY[0x270F0D960]();
}

uint64_t sub_24829A050()
{
  return MEMORY[0x270F0D9B0]();
}

uint64_t sub_24829A060()
{
  return MEMORY[0x270F0D9B8]();
}

uint64_t sub_24829A070()
{
  return MEMORY[0x270F0D9C0]();
}

uint64_t sub_24829A080()
{
  return MEMORY[0x270F0D9C8]();
}

uint64_t sub_24829A090()
{
  return MEMORY[0x270F0D9D0]();
}

uint64_t sub_24829A0A0()
{
  return MEMORY[0x270F0D9D8]();
}

uint64_t sub_24829A0B0()
{
  return MEMORY[0x270F0D9E0]();
}

uint64_t sub_24829A0C0()
{
  return MEMORY[0x270F0D9E8]();
}

uint64_t sub_24829A0D0()
{
  return MEMORY[0x270F0D9F0]();
}

uint64_t sub_24829A0E0()
{
  return MEMORY[0x270F0D9F8]();
}

uint64_t sub_24829A0F0()
{
  return MEMORY[0x270F0DA00]();
}

uint64_t sub_24829A100()
{
  return MEMORY[0x270F0DA08]();
}

uint64_t sub_24829A110()
{
  return MEMORY[0x270F0DA10]();
}

uint64_t sub_24829A120()
{
  return MEMORY[0x270F0DA18]();
}

uint64_t sub_24829A130()
{
  return MEMORY[0x270F0DA20]();
}

uint64_t sub_24829A140()
{
  return MEMORY[0x270F0DA40]();
}

uint64_t sub_24829A150()
{
  return MEMORY[0x270F0DA48]();
}

uint64_t sub_24829A160()
{
  return MEMORY[0x270F0DA88]();
}

uint64_t sub_24829A170()
{
  return MEMORY[0x270F0DA90]();
}

uint64_t sub_24829A180()
{
  return MEMORY[0x270F0DA98]();
}

uint64_t sub_24829A190()
{
  return MEMORY[0x270F0DAA0]();
}

uint64_t sub_24829A1A0()
{
  return MEMORY[0x270F0DAA8]();
}

uint64_t sub_24829A1B0()
{
  return MEMORY[0x270F0DAB0]();
}

uint64_t sub_24829A1C0()
{
  return MEMORY[0x270F0DAB8]();
}

uint64_t sub_24829A1D0()
{
  return MEMORY[0x270F0DAC0]();
}

uint64_t sub_24829A1E0()
{
  return MEMORY[0x270F0DAC8]();
}

uint64_t sub_24829A1F0()
{
  return MEMORY[0x270F0DAD0]();
}

uint64_t sub_24829A200()
{
  return MEMORY[0x270F0DAD8]();
}

uint64_t sub_24829A210()
{
  return MEMORY[0x270F0DAE0]();
}

uint64_t sub_24829A220()
{
  return MEMORY[0x270F0DAE8]();
}

uint64_t sub_24829A230()
{
  return MEMORY[0x270F0DAF0]();
}

uint64_t sub_24829A240()
{
  return MEMORY[0x270F0DAF8]();
}

uint64_t sub_24829A250()
{
  return MEMORY[0x270F0DB00]();
}

uint64_t sub_24829A260()
{
  return MEMORY[0x270F0DB28]();
}

uint64_t sub_24829A270()
{
  return MEMORY[0x270F0DB38]();
}

uint64_t sub_24829A280()
{
  return MEMORY[0x270F0DB50]();
}

uint64_t sub_24829A290()
{
  return MEMORY[0x270F0DB58]();
}

uint64_t sub_24829A2A0()
{
  return MEMORY[0x270F0DB60]();
}

uint64_t sub_24829A2B0()
{
  return MEMORY[0x270F0DB70]();
}

uint64_t sub_24829A2C0()
{
  return MEMORY[0x270F0DB80]();
}

uint64_t sub_24829A2D0()
{
  return MEMORY[0x270F0DB90]();
}

uint64_t sub_24829A2E0()
{
  return MEMORY[0x270F0DB98]();
}

uint64_t sub_24829A2F0()
{
  return MEMORY[0x270F0DBA0]();
}

uint64_t sub_24829A300()
{
  return MEMORY[0x270F0DBA8]();
}

uint64_t sub_24829A310()
{
  return MEMORY[0x270F0DBB0]();
}

uint64_t sub_24829A320()
{
  return MEMORY[0x270F0DBB8]();
}

uint64_t sub_24829A330()
{
  return MEMORY[0x270F0DBC8]();
}

uint64_t sub_24829A340()
{
  return MEMORY[0x270F0DBD8]();
}

uint64_t sub_24829A350()
{
  return MEMORY[0x270F0DBE8]();
}

uint64_t sub_24829A360()
{
  return MEMORY[0x270F0DBF0]();
}

uint64_t sub_24829A370()
{
  return MEMORY[0x270F0DBF8]();
}

uint64_t sub_24829A380()
{
  return MEMORY[0x270F0DC00]();
}

uint64_t sub_24829A390()
{
  return MEMORY[0x270F0DC10]();
}

uint64_t sub_24829A3A0()
{
  return MEMORY[0x270F0DC18]();
}

uint64_t sub_24829A3B0()
{
  return MEMORY[0x270F0DC28]();
}

uint64_t sub_24829A3C0()
{
  return MEMORY[0x270F0DC30]();
}

uint64_t sub_24829A3D0()
{
  return MEMORY[0x270F0DC38]();
}

uint64_t sub_24829A3E0()
{
  return MEMORY[0x270F0DC40]();
}

uint64_t sub_24829A3F0()
{
  return MEMORY[0x270F0DC48]();
}

uint64_t sub_24829A400()
{
  return MEMORY[0x270F0DC50]();
}

uint64_t sub_24829A410()
{
  return MEMORY[0x270F0DC58]();
}

uint64_t sub_24829A420()
{
  return MEMORY[0x270F0DC60]();
}

uint64_t sub_24829A430()
{
  return MEMORY[0x270F0DC68]();
}

uint64_t sub_24829A440()
{
  return MEMORY[0x270F0DC70]();
}

uint64_t sub_24829A450()
{
  return MEMORY[0x270F0DC78]();
}

uint64_t sub_24829A460()
{
  return MEMORY[0x270F0DC80]();
}

uint64_t sub_24829A470()
{
  return MEMORY[0x270F0DC88]();
}

uint64_t sub_24829A480()
{
  return MEMORY[0x270F0DC90]();
}

uint64_t sub_24829A490()
{
  return MEMORY[0x270F0DC98]();
}

uint64_t sub_24829A4A0()
{
  return MEMORY[0x270F0DCA0]();
}

uint64_t sub_24829A4B0()
{
  return MEMORY[0x270F0DCA8]();
}

uint64_t sub_24829A4C0()
{
  return MEMORY[0x270F0DCB0]();
}

uint64_t sub_24829A4D0()
{
  return MEMORY[0x270F0DCB8]();
}

uint64_t sub_24829A4E0()
{
  return MEMORY[0x270F0DD08]();
}

uint64_t sub_24829A4F0()
{
  return MEMORY[0x270F0DD10]();
}

uint64_t sub_24829A500()
{
  return MEMORY[0x270F0DD18]();
}

uint64_t sub_24829A510()
{
  return MEMORY[0x270F0DD38]();
}

uint64_t sub_24829A520()
{
  return MEMORY[0x270F0DD40]();
}

uint64_t sub_24829A530()
{
  return MEMORY[0x270F0DD48]();
}

uint64_t sub_24829A540()
{
  return MEMORY[0x270F0DD50]();
}

uint64_t sub_24829A550()
{
  return MEMORY[0x270F0DD58]();
}

uint64_t sub_24829A560()
{
  return MEMORY[0x270F0DD60]();
}

uint64_t sub_24829A570()
{
  return MEMORY[0x270F0DD68]();
}

uint64_t sub_24829A580()
{
  return MEMORY[0x270F0DD80]();
}

uint64_t sub_24829A590()
{
  return MEMORY[0x270F0DD88]();
}

uint64_t sub_24829A5A0()
{
  return MEMORY[0x270F0DD90]();
}

uint64_t sub_24829A5B0()
{
  return MEMORY[0x270F0DD98]();
}

uint64_t sub_24829A5C0()
{
  return MEMORY[0x270F0DDA0]();
}

uint64_t sub_24829A5D0()
{
  return MEMORY[0x270F0DDA8]();
}

uint64_t sub_24829A5E0()
{
  return MEMORY[0x270F0DDB0]();
}

uint64_t sub_24829A5F0()
{
  return MEMORY[0x270F0DEB0]();
}

uint64_t sub_24829A600()
{
  return MEMORY[0x270F0DEB8]();
}

uint64_t sub_24829A610()
{
  return MEMORY[0x270F0DEC0]();
}

uint64_t sub_24829A620()
{
  return MEMORY[0x270F0DEC8]();
}

uint64_t sub_24829A630()
{
  return MEMORY[0x270F0DED0]();
}

uint64_t sub_24829A640()
{
  return MEMORY[0x270F0DED8]();
}

uint64_t sub_24829A650()
{
  return MEMORY[0x270F0DF18]();
}

uint64_t sub_24829A660()
{
  return MEMORY[0x270F0DF20]();
}

uint64_t sub_24829A670()
{
  return MEMORY[0x270F0DF40]();
}

uint64_t sub_24829A680()
{
  return MEMORY[0x270F0DF58]();
}

uint64_t sub_24829A690()
{
  return MEMORY[0x270F0DF60]();
}

uint64_t sub_24829A6A0()
{
  return MEMORY[0x270F0DF68]();
}

uint64_t sub_24829A6B0()
{
  return MEMORY[0x270F0DF70]();
}

uint64_t sub_24829A6C0()
{
  return MEMORY[0x270F0DFC0]();
}

uint64_t sub_24829A6D0()
{
  return MEMORY[0x270F0DFD8]();
}

uint64_t sub_24829A6E0()
{
  return MEMORY[0x270F0DFE0]();
}

uint64_t sub_24829A700()
{
  return MEMORY[0x270F0E008]();
}

uint64_t sub_24829A710()
{
  return MEMORY[0x270F0E010]();
}

uint64_t sub_24829A720()
{
  return MEMORY[0x270F0E018]();
}

uint64_t sub_24829A730()
{
  return MEMORY[0x270F0E020]();
}

uint64_t sub_24829A740()
{
  return MEMORY[0x270F0E028]();
}

uint64_t sub_24829A750()
{
  return MEMORY[0x270F0E040]();
}

uint64_t sub_24829A760()
{
  return MEMORY[0x270F0E048]();
}

uint64_t sub_24829A770()
{
  return MEMORY[0x270F0E070]();
}

uint64_t sub_24829A780()
{
  return MEMORY[0x270F0E0E8]();
}

uint64_t sub_24829A790()
{
  return MEMORY[0x270F0E178]();
}

uint64_t sub_24829A7A0()
{
  return MEMORY[0x270F0E188]();
}

uint64_t sub_24829A7B0()
{
  return MEMORY[0x270F0E190]();
}

uint64_t sub_24829A7C0()
{
  return MEMORY[0x270F0E198]();
}

uint64_t sub_24829A7D0()
{
  return MEMORY[0x270F0E1A0]();
}

uint64_t sub_24829A7E0()
{
  return MEMORY[0x270F0E1A8]();
}

uint64_t sub_24829A7F0()
{
  return MEMORY[0x270F0E1B0]();
}

uint64_t sub_24829A800()
{
  return MEMORY[0x270F0E1B8]();
}

uint64_t sub_24829A810()
{
  return MEMORY[0x270F0E1C0]();
}

uint64_t sub_24829A820()
{
  return MEMORY[0x270F0E1D8]();
}

uint64_t sub_24829A830()
{
  return MEMORY[0x270F0E1E0]();
}

uint64_t sub_24829A840()
{
  return MEMORY[0x270F0E1E8]();
}

uint64_t sub_24829A850()
{
  return MEMORY[0x270F0E1F0]();
}

uint64_t sub_24829A860()
{
  return MEMORY[0x270F0E1F8]();
}

uint64_t sub_24829A870()
{
  return MEMORY[0x270F0E200]();
}

uint64_t sub_24829A880()
{
  return MEMORY[0x270F0E208]();
}

uint64_t sub_24829A890()
{
  return MEMORY[0x270F0E210]();
}

uint64_t sub_24829A8A0()
{
  return MEMORY[0x270F0E218]();
}

uint64_t sub_24829A8B0()
{
  return MEMORY[0x270F0E220]();
}

uint64_t sub_24829A8C0()
{
  return MEMORY[0x270F0E228]();
}

uint64_t sub_24829A8D0()
{
  return MEMORY[0x270F0E230]();
}

uint64_t sub_24829A8E0()
{
  return MEMORY[0x270F0E238]();
}

uint64_t sub_24829A8F0()
{
  return MEMORY[0x270F0E240]();
}

uint64_t sub_24829A900()
{
  return MEMORY[0x270F0E248]();
}

uint64_t sub_24829A910()
{
  return MEMORY[0x270F0E250]();
}

uint64_t sub_24829A920()
{
  return MEMORY[0x270F0E258]();
}

uint64_t sub_24829A930()
{
  return MEMORY[0x270F0E260]();
}

uint64_t sub_24829A940()
{
  return MEMORY[0x270F0E268]();
}

uint64_t sub_24829A950()
{
  return MEMORY[0x270F0E270]();
}

uint64_t sub_24829A960()
{
  return MEMORY[0x270F0E278]();
}

uint64_t sub_24829A970()
{
  return MEMORY[0x270F0E280]();
}

uint64_t sub_24829A980()
{
  return MEMORY[0x270F0E288]();
}

uint64_t sub_24829A990()
{
  return MEMORY[0x270F0E290]();
}

uint64_t sub_24829A9A0()
{
  return MEMORY[0x270F0E298]();
}

uint64_t sub_24829A9B0()
{
  return MEMORY[0x270F0E2B0]();
}

uint64_t sub_24829A9C0()
{
  return MEMORY[0x270F0E2B8]();
}

uint64_t sub_24829A9D0()
{
  return MEMORY[0x270F0E2C0]();
}

uint64_t sub_24829A9E0()
{
  return MEMORY[0x270F0E2C8]();
}

uint64_t sub_24829AA00()
{
  return MEMORY[0x270F08370]();
}

uint64_t sub_24829AA10()
{
  return MEMORY[0x270F08378]();
}

uint64_t sub_24829AA20()
{
  return MEMORY[0x270F08380]();
}

uint64_t sub_24829AA30()
{
  return MEMORY[0x270F08388]();
}

uint64_t sub_24829AA40()
{
  return MEMORY[0x270F083A0]();
}

uint64_t sub_24829AA50()
{
  return MEMORY[0x270F083B0]();
}

uint64_t sub_24829AA60()
{
  return MEMORY[0x270F083C8]();
}

uint64_t sub_24829AA70()
{
  return MEMORY[0x270F083D0]();
}

uint64_t sub_24829AA80()
{
  return MEMORY[0x270F083D8]();
}

uint64_t sub_24829AA90()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24829AAA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24829AAB0()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_24829AAD0()
{
  return MEMORY[0x270FA1AB8]();
}

uint64_t sub_24829AAE0()
{
  return MEMORY[0x270FA1B48]();
}

uint64_t sub_24829AAF0()
{
  return MEMORY[0x270FA1B90]();
}

uint64_t sub_24829AB00()
{
  return MEMORY[0x270FA1BB0]();
}

uint64_t sub_24829AB10()
{
  return MEMORY[0x270FA1BC8]();
}

uint64_t sub_24829AB20()
{
  return MEMORY[0x270FA1C00]();
}

uint64_t sub_24829AB30()
{
  return MEMORY[0x270FA1C28]();
}

uint64_t sub_24829AB40()
{
  return MEMORY[0x270FA1C38]();
}

uint64_t sub_24829AB50()
{
  return MEMORY[0x270FA1C60]();
}

uint64_t sub_24829AB60()
{
  return MEMORY[0x270FA1C88]();
}

uint64_t sub_24829AB70()
{
  return MEMORY[0x270FA1D38]();
}

uint64_t sub_24829AB80()
{
  return MEMORY[0x270FA1D68]();
}

uint64_t sub_24829AB90()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t sub_24829ABA0()
{
  return MEMORY[0x270FA1D98]();
}

uint64_t sub_24829ABB0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24829ABC0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24829ABD0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24829ABE0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24829ABF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24829AC00()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_24829AC10()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24829AC20()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24829AC30()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24829AC40()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24829AC50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24829AC60()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24829AC70()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24829AC80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24829AC90()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24829ACA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24829ACB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24829ACC0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24829ACD0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24829ACE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24829ACF0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24829AD00()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24829AD10()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_24829AD20()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24829AD30()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24829AD40()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24829AD50()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24829AD60()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24829AD70()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24829AD80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24829AD90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24829ADB0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_24829ADC0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_24829ADD0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_24829ADF0()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_24829AE00()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24829AE10()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24829AE20()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24829AE30()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24829AE40()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24829AE50()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24829AE60()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24829AE70()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24829AE80()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24829AE90()
{
  return MEMORY[0x270F0E2E8]();
}

uint64_t sub_24829AEA0()
{
  return MEMORY[0x270F0E2F0]();
}

uint64_t sub_24829AEB0()
{
  return MEMORY[0x270F0E2F8]();
}

uint64_t sub_24829AEC0()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_24829AED0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24829AEE0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24829AEF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24829AF00()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24829AF10()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24829AF20()
{
  return MEMORY[0x270F0E300]();
}

uint64_t sub_24829AF30()
{
  return MEMORY[0x270F0E308]();
}

uint64_t sub_24829AF40()
{
  return MEMORY[0x270F0E310]();
}

uint64_t sub_24829AF50()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24829AF60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24829AF70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24829AF80()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24829AF90()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24829AFA0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24829AFB0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24829AFC0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24829AFD0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24829AFE0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24829AFF0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24829B000()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24829B010()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24829B020()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24829B030()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24829B040()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24829B050()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24829B060()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24829B070()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24829B080()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24829B090()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24829B0A0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24829B0B0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24829B0C0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24829B0D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24829B0E0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24829B0F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24829B110()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24829B120()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24829B130()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24829B140()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24829B150()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24829B170()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24829B180()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24829B190()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24829B1A0()
{
  return MEMORY[0x270F0E318]();
}

uint64_t sub_24829B1B0()
{
  return MEMORY[0x270F0E320]();
}

uint64_t sub_24829B1C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24829B1D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24829B1E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24829B1F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24829B200()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24829B210()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24829B220()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24829B230()
{
  return MEMORY[0x270F0E328]();
}

uint64_t sub_24829B240()
{
  return MEMORY[0x270F0E330]();
}

uint64_t sub_24829B260()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24829B270()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24829B280()
{
  return MEMORY[0x270F9FD98]();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x270EFDCC8](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x270FA0380]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}