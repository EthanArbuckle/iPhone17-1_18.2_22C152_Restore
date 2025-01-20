void sub_25325DA58()
{
  sub_25325E510();
}

void sub_25325DA84()
{
  sub_252E79294();
  uint64_t v42 = v5;
  sub_253270728();
  sub_252E76F94();
  MEMORY[0x270FA5388](v6);
  sub_252E770C0();
  uint64_t v46 = sub_253276568();
  sub_252E76F94();
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v8);
  sub_252EE87F0();
  uint64_t v9 = sub_252E6FE84(&qword_269CB7F98);
  uint64_t v10 = sub_252E7733C(v9);
  MEMORY[0x270FA5388](v10);
  sub_252E892E0();
  MEMORY[0x270FA5388](v11);
  sub_2530073F0();
  uint64_t v12 = sub_253273978();
  sub_252E76F94();
  uint64_t v44 = v13;
  MEMORY[0x270FA5388](v14);
  sub_252E77324();
  uint64_t v15 = MEMORY[0x2533D06E0]();
  swift_retain();
  uint64_t v16 = sub_25325B818(v15);
  uint64_t v17 = swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t v40 = v3;
    uint64_t v41 = v2;
    uint64_t v18 = *(void *)(MEMORY[0x2533D06E0](v17) + 16);
    swift_bridgeObjectRelease();
    uint64_t v19 = v43;
    if (v18 - *(void *)(v16 + 16) >= 1)
    {
      uint64_t v20 = v0;
      sub_253271EF8();
      v21 = sub_253273968();
      os_log_type_t v22 = sub_253277428();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v0 = v43;
        v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v23 = 134217984;
        sub_253277628();
        _os_log_impl(&dword_252E65000, v21, v22, "%ld unhandled disambiguation values", v23, 0xCu);
        sub_252E770A8();
      }

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v20, v12);
    }
    uint64_t v24 = *(void *)(v42 + 16);
    if (v24)
    {
      v45 = *(void (**)(uint64_t))(v43 + 16);
      sub_253266310();
      uint64_t v25 = *(void *)(v43 + 72);
      sub_25326FBC8();
      while (1)
      {
        uint64_t v26 = sub_2530E1744();
        v45(v26);
        uint64_t v27 = sub_253276528();
        uint64_t v29 = v28;
        if (v27 == sub_2532706F8() && v29 == v30) {
          break;
        }
        sub_2532662B0();
        char v32 = sub_253277CF8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v32) {
          goto LABEL_17;
        }
        uint64_t v33 = v46;
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v4, v46);
        v0 += v25;
        if (!--v24)
        {
          swift_bridgeObjectRelease();
          uint64_t v34 = 1;
          uint64_t v35 = v41;
          uint64_t v19 = v43;
          goto LABEL_18;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      uint64_t v19 = v43;
      uint64_t v35 = v41;
      uint64_t v33 = v46;
      sub_252E7C948();
      v37();
      uint64_t v34 = 0;
LABEL_18:
      uint64_t v36 = v40;
    }
    else
    {
      uint64_t v34 = 1;
      uint64_t v35 = v2;
      uint64_t v33 = v46;
      uint64_t v36 = v40;
    }
    _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v35, v34, 1, v33);
    sub_252E98440(v35, v36, &qword_269CB7F98);
    if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(v36, 1, v33) == 1)
    {
      sub_252E76A5C(v36, &qword_269CB7F98);
      uint64_t v36 = 0;
    }
    else
    {
      sub_253276538();
      sub_253249218();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v36, v46);
    }
    sub_252E772B8();
    v38();
    if (!v36)
    {
      sub_2532706F8();
      sub_253249218();
    }
    sub_252E7C978();
    v39();
    sub_252E997F0();
    sub_253276E18();
    swift_bridgeObjectRelease();
    sub_252E76A5C(v35, &qword_269CB7F98);
  }
  sub_252E79228();
}

void sub_25325DF5C()
{
  sub_252E79294();
  uint64_t v2 = sub_253273978();
  sub_252E76F94();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_252E79210();
  uint64_t v6 = MEMORY[0x2533D05D0]();
  swift_retain();
  uint64_t v7 = sub_25325B818(v6);
  uint64_t v8 = swift_bridgeObjectRelease();
  if (!v0)
  {
    uint64_t v9 = *(void *)(MEMORY[0x2533D05D0](v8) + 16);
    swift_bridgeObjectRelease();
    if (v9 - *(void *)(v7 + 16) >= 1)
    {
      sub_253271EF8();
      uint64_t v10 = sub_253273968();
      os_log_type_t v11 = sub_253277428();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 134217984;
        sub_253277628();
        _os_log_impl(&dword_252E65000, v10, v11, "%ld unhandled disambiguation values", v12, 0xCu);
        sub_252E770A8();
      }

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
    }
  }
  sub_252E79228();
}

void sub_25325E0E0()
{
  sub_252E79294();
  uint64_t v46 = v2;
  uint64_t v47 = v0;
  uint64_t v45 = v3;
  sub_253275E58();
  sub_252E76F94();
  MEMORY[0x270FA5388](v4);
  sub_252F3ED28();
  uint64_t v5 = sub_2532761A8();
  sub_252E76F94();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_252EE8808();
  MEMORY[0x270FA5388](v9);
  os_log_type_t v11 = (char *)&v44 - v10;
  sub_25326FEE8();
  if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v11, v5) == *MEMORY[0x263F804A0])
  {
    uint64_t v12 = sub_2532661DC();
    v13(v12);
    swift_projectBox();
    sub_252E772B8();
    v14();
    uint64_t v15 = sub_253275E48();
    swift_retain();
    uint64_t v16 = v47;
    uint64_t v17 = sub_25325B818(v15);
    if (!v16)
    {
      uint64_t v32 = v17;
      swift_bridgeObjectRelease();
      uint64_t v33 = v46;
      sub_25326FBC8();
      uint64_t v34 = sub_25325BEFC(v32, v45, v33);
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_25325C6F0(v34, &qword_269CBCEB0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_253261CB8);
      sub_25325EE58(v35);
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_2532661EC();
    v19(v18);
    swift_release();
  }
  else
  {
    sub_25326FEE8();
    uint64_t v20 = v47;
    sub_2531F26D0(v1, v21, v22, v23, v24, v25, v26, v27, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
    if (v20)
    {
      uint64_t v30 = *(void (**)(void))(v7 + 8);
      sub_252EC5908();
      v30();
      uint64_t v31 = sub_2532661DC();
      ((void (*)(uint64_t))v30)(v31);
    }
    else
    {
      uint64_t v36 = v28;
      uint64_t v37 = v29;
      v38 = *(void (**)(void))(v7 + 8);
      sub_252EC5908();
      v38();
      if (v37)
      {
        sub_252E6FE84(&qword_269CB7A38);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_253278DA0;
        uint64_t v40 = v46;
        *(void *)(inited + 32) = v45;
        *(void *)(inited + 40) = v40;
        uint64_t v41 = swift_allocObject();
        *(void *)(v41 + 16) = v36;
        *(void *)(v41 + 24) = v37;
        *(void *)(inited + 48) = sub_253264444;
        *(void *)(inited + 56) = v41;
        sub_25326FBC8();
      }
      uint64_t v42 = sub_253276B38();
      sub_25325EE58(v42);
      swift_bridgeObjectRelease();
      uint64_t v43 = sub_2532661DC();
      ((void (*)(uint64_t))v38)(v43);
    }
  }
  sub_252E79228();
}

unint64_t sub_25325E430()
{
  sub_25326FE08();
  sub_252E76F94();
  MEMORY[0x270FA5388](v1);
  sub_252E79210();
  sub_25326FE48();
  char v2 = sub_2531EE58C(v0);
  sub_252E7C978();
  v3();
  unint64_t result = 0;
  if (v2 != 24) {
    return sub_2531EE774(v2);
  }
  return result;
}

void sub_25325E4E4()
{
}

void sub_25325E510()
{
  sub_252E77194();
  uint64_t v52 = v1;
  uint64_t v53 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4(0);
  sub_252E76F94();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v44 - v9;
  uint64_t v11 = sub_253276568();
  sub_252E76F94();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  sub_252E79170();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_252E6FE84(&qword_269CB7F98);
  uint64_t v19 = sub_252E7733C(v18);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v44 - v23;
  uint64_t v25 = *(void *)(v3 + 16);
  if (v25)
  {
    uint64_t v45 = v22;
    uint64_t v46 = v13;
    uint64_t v47 = (char *)&v44 - v23;
    uint64_t v48 = v10;
    uint64_t v49 = v7;
    uint64_t v50 = v5;
    uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    sub_252E773EC();
    uint64_t v27 = v3 + v26;
    uint64_t v28 = *(void *)(v13 + 72);
    uint64_t v44 = v3;
    sub_25326FBC8();
    while (1)
    {
      v51(v17, v27, v11);
      uint64_t v29 = sub_253276528();
      uint64_t v31 = v30;
      if (v29 == v52() && v31 == v32) {
        break;
      }
      sub_2532662B0();
      char v34 = sub_253277CF8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_12;
      }
      sub_252E7C978();
      v35();
      v27 += v28;
      if (!--v25)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = 1;
        uint64_t v24 = v47;
        uint64_t v22 = v45;
        uint64_t v13 = v46;
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v13 = v46;
    uint64_t v24 = v47;
    sub_252E7C948();
    v37();
    uint64_t v36 = 0;
    uint64_t v22 = v45;
  }
  else
  {
    uint64_t v36 = 1;
  }
LABEL_13:
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v24, v36, 1, v11);
  uint64_t v38 = sub_2530E1744();
  sub_252E98440(v38, v39, v40);
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0((uint64_t)v22, 1, v11) == 1)
  {
    sub_252E76A5C((uint64_t)v22, &qword_269CB7F98);
    uint64_t v22 = 0;
  }
  else
  {
    sub_253276538();
    sub_253249218();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v11);
  }
  sub_252E772B8();
  uint64_t v42 = v41();
  if (!v22)
  {
    ((void (*)(uint64_t))v52)(v42);
    sub_253249218();
  }
  sub_252E7C978();
  v43();
  sub_252E997F0();
  sub_253276E18();
  swift_bridgeObjectRelease();
  sub_252E76A5C((uint64_t)v24, &qword_269CB7F98);
  sub_252E771AC();
}

uint64_t sub_25325E880()
{
  uint64_t v0 = MEMORY[0x2533D03A0]();
  if (!v0) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v1 = v0;
  sub_253270FB8();
  sub_25326FBC8();
  id v2 = (id)sub_253270F98();
  uint64_t v3 = sub_25325B9C4(v1, v2);
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t sub_25325E940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v48 = a2;
  uint64_t v4 = sub_253275468();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_253273978();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v53 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2532761A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_253274718();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v43 - v16;
  sub_253275458();
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 88))(v17, v13) == *MEMORY[0x263F4D970])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v17, v13);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v17, v9);
    uint64_t v18 = v50;
    sub_2531F26D0((uint64_t)v12, v19, v20, v21, v22, v23, v24, v25, v43, (uint64_t)v44, (uint64_t)v45, v46, v47, v48, (uint64_t)v49, v50, v51, v52, v53,
      v54);
    if (v18) {
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
    unint64_t v38 = v27;
    if (v27)
    {
      uint64_t v39 = v26;
      if ((v27 & 0x2000000000000000) != 0) {
        uint64_t v40 = HIBYTE(v27) & 0xF;
      }
      else {
        uint64_t v40 = v26 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      if (v40)
      {
        uint64_t v41 = v49;
        *uint64_t v49 = v39;
        v41[1] = v38;
        return result;
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
    uint64_t v42 = v49;
    *uint64_t v49 = 0;
    v42[1] = 0;
  }
  else
  {
    sub_253271EF8();
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v6, a1, v52);
    uint64_t v29 = sub_253273968();
    os_log_type_t v30 = sub_253277428();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      uint64_t v55 = v48;
      os_log_t v45 = v29;
      uint64_t v32 = v31;
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v44 = v31 + 4;
      sub_253275458();
      uint64_t v33 = sub_253276D28();
      uint64_t v54 = sub_252E71344(v33, v34, &v55);
      sub_253277628();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v52);
      os_log_t v35 = v45;
      _os_log_impl(&dword_252E65000, v45, v30, "Unhandled tool parameter value: %s", v32, 0xCu);
      uint64_t v36 = v48;
      swift_arrayDestroy();
      MEMORY[0x2533D8A00](v36, -1, -1);
      MEMORY[0x2533D8A00](v32, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v52);
    }
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v53, v47);
    uint64_t v37 = v49;
    *uint64_t v49 = 0;
    v37[1] = 0;
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  return result;
}

void sub_25325EE58(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_252E73D68();
    uint64_t v2 = v19;
    uint64_t v4 = sub_2530663E8(a1);
    if ((v4 & 0x8000000000000000) == 0)
    {
      unint64_t v6 = v4;
      if (v4 < 1 << *(unsigned char *)(a1 + 32))
      {
        uint64_t v7 = a1 + 64;
        while ((*(void *)(v7 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
        {
          if (v5 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_18;
          }
          uint64_t v16 = v1;
          int v17 = v5;
          uint64_t v8 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v6);
          uint64_t v9 = v8[1];
          uint64_t v18 = *v8;
          sub_25326FBC8();
          swift_retain();
          uint64_t v10 = sub_253276E18();
          uint64_t v12 = v11;
          swift_bridgeObjectRelease();
          unint64_t v13 = *(void *)(v19 + 16);
          if (v13 >= *(void *)(v19 + 24) >> 1) {
            sub_252E73D68();
          }
          *(void *)(v19 + 16) = v13 + 1;
          uint64_t v14 = (void *)(v19 + 32 * v13);
          v14[4] = v10;
          v14[5] = v12;
          v14[6] = v18;
          v14[7] = v9;
          if ((uint64_t)v6 >= -(-1 << *(unsigned char *)(a1 + 32))) {
            goto LABEL_19;
          }
          uint64_t v7 = a1 + 64;
          if ((*(void *)(a1 + 64 + 8 * (v6 >> 6)) & (1 << v6)) == 0) {
            goto LABEL_20;
          }
          if (v17 != *(_DWORD *)(a1 + 36)) {
            goto LABEL_21;
          }
          uint64_t v15 = sub_253277758();
          uint64_t v1 = v16 - 1;
          if (v16 == 1) {
            goto LABEL_16;
          }
          unint64_t v6 = v15;
          if ((v15 & 0x8000000000000000) == 0)
          {
            int v5 = *(_DWORD *)(a1 + 36);
            if (v15 < 1 << *(unsigned char *)(a1 + 32)) {
              continue;
            }
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
    }
LABEL_22:
    __break(1u);
  }
  else
  {
LABEL_16:
    sub_25325C0A0(v2, &qword_269CBCEB0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_253261F9C);
  }
}

uint64_t sub_25325F064(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x416D7269666E6F63 && a2 == 0xED00006E6F697463)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25325F110()
{
  return 0x416D7269666E6F63;
}

void sub_25325F134()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDC40);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_253264994();
  sub_253007024();
  sub_2532649E0();
  sub_2532660A4();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_25325F1F8()
{
  return 0x736D61726170;
}

uint64_t sub_25325F210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325F064(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25325F23C(uint64_t a1)
{
  unint64_t v2 = sub_253264994();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325F278(uint64_t a1)
{
  unint64_t v2 = sub_253264994();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325F2B4()
{
}

uint64_t sub_25325F2D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325F540(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25325F300(uint64_t a1)
{
  unint64_t v2 = sub_253265618();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325F33C(uint64_t a1)
{
  unint64_t v2 = sub_253265618();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325F378()
{
}

uint64_t sub_25325F3BC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x566D7269666E6F63 && a2 == 0xEC00000065756C61)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25325F45C()
{
  return 0x566D7269666E6F63;
}

void sub_25325F47C()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDC28);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_2532648FC();
  sub_253007024();
  sub_253264948();
  sub_2532660A4();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_25325F540(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x736D61726170 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_25325F5C0()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDD80);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_2532655CC();
  sub_253007024();
  sub_252E6FE84(&qword_269CBB6F8);
  sub_2531D2918();
  sub_253266184();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_25325F68C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325F3BC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25325F6B8(uint64_t a1)
{
  unint64_t v2 = sub_2532648FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325F6F4(uint64_t a1)
{
  unint64_t v2 = sub_2532648FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325F730()
{
}

uint64_t sub_25325F74C(void *a1, void *a2)
{
  return sub_25325F3B8(*a1, *a2);
}

uint64_t sub_25325F758(uint64_t a1)
{
  unint64_t v2 = sub_2532655CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325F794(uint64_t a1)
{
  unint64_t v2 = sub_2532655CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325F7D0()
{
}

BOOL sub_25325F7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5 = a1 == a4 && a2 == a5;
  BOOL result = 0;
  if (v5 || (sub_253277CF8() & 1) != 0)
  {
    unint64_t v6 = (void *)sub_252E997F0();
    if (sub_252ED738C(v6, v7)) {
      return 1;
    }
  }
  return result;
}

void sub_25325F848()
{
  sub_252E79294();
  uint64_t v1 = v0;
  sub_252E6FE84(&qword_269CBDC00);
  sub_252E76F94();
  MEMORY[0x270FA5388](v2);
  sub_252EE87F0();
  sub_252E983FC(v1, v1[3]);
  sub_253264818();
  sub_253277E78();
  sub_253264864();
  sub_253277C48();
  sub_252E7C978();
  v3();
  sub_252E79228();
}

uint64_t sub_25325F954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5 = a1 == a4 && a2 == a5;
  if (!v5 && (sub_253277CF8() & 1) == 0) {
    return 0;
  }
  unint64_t v6 = (void *)sub_252E997F0();
  return sub_252ED738C(v6, v7);
}

uint64_t sub_25325F9BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D614E6D61726170 && a2 == 0xE900000000000065;
  if (v2 || (sub_253277CF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61566D61726170 && a2 == 0xEB00000000736575)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253277CF8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25325FAD0(char a1)
{
  if (a1) {
    return 0x6C61566D61726170;
  }
  else {
    return 0x6D614E6D61726170;
  }
}

void sub_25325FB14()
{
  sub_252E79294();
  BOOL v2 = v1;
  sub_252E6FE84(&qword_269CBDD70);
  sub_252E76F94();
  MEMORY[0x270FA5388](v3);
  sub_252E79210();
  sub_252E983FC(v2, v2[3]);
  sub_253265580();
  sub_253277E78();
  sub_253277C08();
  if (!v0)
  {
    sub_252E6FE84(&qword_26B240400);
    sub_253265514();
    sub_253277C48();
  }
  sub_252E7C978();
  v4();
  sub_252E79228();
}

uint64_t sub_25325FC64(uint64_t a1)
{
  unint64_t v2 = sub_253264818();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325FCA0(uint64_t a1)
{
  unint64_t v2 = sub_253264818();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325FCDC()
{
}

uint64_t sub_25325FCFC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25325FDF4(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_25325F7EC);
}

uint64_t sub_25325FD14()
{
  return sub_25325FAD0(*v0);
}

uint64_t sub_25325FD1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325F9BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25325FD44(uint64_t a1)
{
  unint64_t v2 = sub_253265580();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25325FD80(uint64_t a1)
{
  unint64_t v2 = sub_253265580();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25325FDBC()
{
}

uint64_t sub_25325FDDC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25325FDF4(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_25325F954);
}

uint64_t sub_25325FDF4(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_25325FE1C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x80000002532965E0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_25325FEA4()
{
  return 0xD000000000000012;
}

void sub_25325FEC0()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDBE8);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_253264780();
  sub_253007024();
  sub_2532647CC();
  sub_2532660A4();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_25325FF84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6C61566D61726170 && a2 == 0xEB00000000736575)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260024()
{
  return 0x6C61566D61726170;
}

void sub_253260044()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDD60);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_2532654C8();
  sub_253007024();
  sub_252E6FE84(&qword_26B240400);
  sub_253265514();
  sub_253266184();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_25326010C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325FE1C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253260138(uint64_t a1)
{
  unint64_t v2 = sub_253264780();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260174(uint64_t a1)
{
  unint64_t v2 = sub_253264780();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_2532601B0()
{
}

uint64_t sub_2532601CC(void *a1, void *a2)
{
  return sub_25325FE18(*a1, *a2);
}

uint64_t sub_2532601DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25325FF84(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253260208(uint64_t a1)
{
  unint64_t v2 = sub_2532654C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260244(uint64_t a1)
{
  unint64_t v2 = sub_2532654C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253260280()
{
}

uint64_t sub_25326029C()
{
  return 0x5674736575716572;
}

uint64_t sub_2532602C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253260588(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2532602EC(uint64_t a1)
{
  unint64_t v2 = sub_2532648B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260328(uint64_t a1)
{
  unint64_t v2 = sub_2532648B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253260364()
{
}

uint64_t sub_2532603A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7250676F6C616964 && a2 == 0xEE0064656469766FLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260450()
{
  return 0x7250676F6C616964;
}

uint64_t sub_253260478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2532603A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2532604A4(uint64_t a1)
{
  unint64_t v2 = sub_253264A2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2532604E0(uint64_t a1)
{
  unint64_t v2 = sub_253264A2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25326051C()
{
}

uint64_t sub_25326055C(uint64_t *a1, uint64_t *a2)
{
  return sub_253260A28(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_253260588(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x5674736575716572 && a2 == 0xEC00000065756C61)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260628(uint64_t a1)
{
  unint64_t v2 = sub_253264604();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260664(uint64_t a1)
{
  unint64_t v2 = sub_253264604();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_2532606A0()
{
}

uint64_t sub_2532606E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000253296600)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_253260768()
{
  return 0xD000000000000010;
}

void sub_253260784()
{
  sub_252E79294();
  uint64_t v1 = v0;
  char v3 = v2;
  sub_252E6FE84(v4);
  sub_252E76F94();
  MEMORY[0x270FA5388](v5);
  sub_252EE87F0();
  sub_252E983FC(v3, v3[3]);
  v1();
  sub_253277E78();
  sub_252E6FE84(&qword_269CBCF60);
  sub_2531D7418();
  sub_253277C48();
  sub_2530E1744();
  sub_252EC5908();
  v6();
  sub_252E79228();
}

uint64_t sub_253260894(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6562697263736564 && a2 == 0xEE0074757074754FLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260940()
{
  return 0x6562697263736564;
}

void sub_253260964()
{
  sub_2532662C0();
  sub_25326605C();
  sub_252E6FE84(&qword_269CBDBD0);
  sub_252E76F94();
  MEMORY[0x270FA5388](v0);
  sub_253265ED4();
  sub_2532646E8();
  sub_253007024();
  sub_253264734();
  sub_2532660A4();
  uint64_t v1 = sub_253265EB8();
  v2(v1);
  sub_253266160();
  sub_253266338();
}

uint64_t sub_253260A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_253011AAC();
  }
}

uint64_t sub_253260A40(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x707954726F727265 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260AD4()
{
  return 0x707954726F727265;
}

void sub_253260AF0()
{
  sub_252E79294();
  uint64_t v1 = v0;
  char v3 = v2;
  sub_252E6FE84(v4);
  sub_252E76F94();
  MEMORY[0x270FA5388](v5);
  sub_252F3ED28();
  sub_252E983FC(v3, v3[3]);
  v1();
  sub_253277E78();
  sub_253277C08();
  sub_252E7C978();
  v6();
  sub_252E79228();
}

uint64_t sub_253260BEC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6562697263736564 && a2 == 0xED0000726F727245)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253277CF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253260C98()
{
  return 0x6562697263736564;
}

void sub_253260CBC()
{
  sub_252E79294();
  uint64_t v1 = v0;
  uint64_t v2 = sub_252E6FE84(&qword_269CBDBB8);
  sub_252E76F94();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_252E79170();
  uint64_t v8 = v7 - v6;
  sub_252E983FC(v1, v1[3]);
  sub_253264650();
  sub_253277E78();
  sub_25326469C();
  sub_253277C48();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  sub_252E79228();
}

uint64_t sub_253260DD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2532606E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253260DFC(uint64_t a1)
{
  unint64_t v2 = sub_25326547C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260E38(uint64_t a1)
{
  unint64_t v2 = sub_25326547C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253260E74()
{
}

uint64_t sub_253260EB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253260894(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253260EE4(uint64_t a1)
{
  unint64_t v2 = sub_2532646E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260F20(uint64_t a1)
{
  unint64_t v2 = sub_2532646E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253260F5C()
{
}

uint64_t sub_253260F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253260A40(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253260FA8(uint64_t a1)
{
  unint64_t v2 = sub_253265430();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253260FE4(uint64_t a1)
{
  unint64_t v2 = sub_253265430();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253261020()
{
}

uint64_t sub_253261064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253260BEC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253261090(uint64_t a1)
{
  unint64_t v2 = sub_253264650();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2532610CC(uint64_t a1)
{
  unint64_t v2 = sub_253264650();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_253261108()
{
}

uint64_t sub_253261124(uint64_t *a1, uint64_t *a2)
{
  return sub_253260A28(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_253261138(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_253261160()
{
  return sub_2532775A8();
}

uint64_t sub_2532611C0()
{
  return sub_253276EB8();
}

uint64_t sub_2532611D8(uint64_t a1)
{
  return sub_253261138(a1, *v1);
}

uint64_t sub_2532611F4(uint64_t a1)
{
  sub_252E6FE84(&qword_269CBCEB0);
  uint64_t result = sub_253277A48();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v30 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v28 = v6;
  int64_t v29 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = result + 64;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v12 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v4 << 6))
  {
    int v17 = (uint64_t *)(*(void *)(v30 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v30 + 56) + 16 * i);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v21;
    *(void *)(result + 24) = v22;
    *(void *)(v11 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v23 = (void *)(v3[6] + 16 * i);
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (uint64_t (**)())(v3[7] + 16 * i);
    *uint64_t v24 = sub_253265E98;
    v24[1] = (uint64_t (*)())result;
    uint64_t v25 = v3[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v27;
    sub_25326FBC8();
    uint64_t result = sub_25326FBC8();
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v14 >= v29) {
      return (uint64_t)v3;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v29) {
        return (uint64_t)v3;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v29) {
          return (uint64_t)v3;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v4);
        if (!v15) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29) {
    return (uint64_t)v3;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v29) {
      return (uint64_t)v3;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25326141C()
{
  sub_25326625C();
  uint64_t v4 = sub_2532709D8();
  sub_252E77000();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v3, v1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v2, v0, v4);
}

uint64_t sub_2532614B8(uint64_t a1, uint64_t a2)
{
  sub_2532709D8();
  sub_252E77000();
  sub_252E771F8();
  v3();
  swift_retain();
  return a2;
}

uint64_t sub_253261524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_253261664(a1, a2, a3, a4, MEMORY[0x263F07508], MEMORY[0x263F7FED0]);
}

uint64_t sub_253261550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253265664(a3, a1, (void (*)(void))type metadata accessor for ProvisionalToolPromptMap);
  return sub_25326FBC8();
}

uint64_t sub_2532615A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  sub_25326FBC8();
  swift_retain();
  return a2;
}

uint64_t sub_2532615F0()
{
  sub_253266204();
  sub_253265664(v1, v0, (void (*)(void))type metadata accessor for ProvisionalParameterPromptMap);
  sub_25326FBC8();
  return sub_252E997F0();
}

uint64_t sub_253261638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_253261664(a1, a2, a3, a4, MEMORY[0x263F4D648], MEMORY[0x263F4E108]);
}

uint64_t sub_253261664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), void (*a6)(void))
{
  a5(0);
  sub_252E77000();
  sub_252E771F8();
  v9();
  a6(0);
  sub_252E77000();
  unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  return v12(a2, a4, v10);
}

uint64_t sub_25326171C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253265664(a3, a1, (void (*)(void))type metadata accessor for ActionResolver.Parameter);
  sub_253275928();
  sub_252E77000();
  uint64_t v3 = sub_252E997F0();
  return v4(v3);
}

uint64_t sub_25326179C()
{
  sub_25326625C();
  sub_253270A48();
  sub_252E77000();
  sub_252E771F8();
  v1();
  sub_25326FBC8();
  return v0;
}

uint64_t sub_253261800()
{
  sub_253266204();
  sub_253265664(v1, v0, (void (*)(void))type metadata accessor for DialogValue);
  sub_25326FBC8();
  return sub_252E997F0();
}

uint64_t sub_253261848()
{
  sub_253266204();
  sub_252E76B6C(v1, v0);
  sub_25326FBC8();
  return sub_252E997F0();
}

void sub_25326187C(uint64_t a1, char a2, void *a3)
{
  uint64_t v43 = a3;
  uint64_t v6 = sub_2532709D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_252E6FE84(&qword_269CB7E60);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  int64_t v14 = (void *)((char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    return;
  }
  v36[0] = v3;
  v36[1] = a1;
  int64_t v16 = (char *)v14 + *(int *)(v11 + 48);
  uint64_t v40 = v7;
  uint64_t v41 = v16;
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v38 = *(void *)(v12 + 72);
  uint64_t v39 = v9;
  uint64_t v42 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v37 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  while (1)
  {
    sub_252E98440(v17, (uint64_t)v14, &qword_269CB7E60);
    uint64_t v18 = *v14;
    uint64_t v47 = *v14;
    uint64_t v19 = *v42;
    uint64_t v20 = v6;
    (*v42)(v9, v41, v6);
    uint64_t v21 = (void *)*v43;
    unint64_t v23 = sub_25305D22C();
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_253277D38();
      __break(1u);
      goto LABEL_20;
    }
    char v26 = v22;
    if (v21[3] < v24 + v25) {
      break;
    }
    if (a2)
    {
      if (v22) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_252E6FE84(&qword_269CB8D90);
      sub_2532779D8();
      if (v26) {
        goto LABEL_14;
      }
    }
LABEL_10:
    int64_t v29 = (void *)*v43;
    *(void *)(*v43 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    *(void *)(v29[6] + 8 * v23) = v18;
    unint64_t v30 = v29[7] + *(void *)(v40 + 72) * v23;
    uint64_t v9 = v39;
    uint64_t v6 = v20;
    v19((char *)v30, v39, v20);
    uint64_t v31 = v29[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_18;
    }
    v29[2] = v33;
    int64_t v14 = (uint64_t *)v37;
    v17 += v38;
    a2 = 1;
    if (!--v15) {
      goto LABEL_12;
    }
  }
  sub_2531D2C60();
  unint64_t v27 = sub_25305D22C();
  if ((v26 & 1) != (v28 & 1)) {
    goto LABEL_19;
  }
  unint64_t v23 = v27;
  if ((v26 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  unint64_t v34 = (void *)swift_allocError();
  swift_willThrow();
  id v46 = v34;
  id v35 = v34;
  sub_252E6FE84(&qword_269CB84D8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v20);
    swift_bridgeObjectRelease();
    swift_release();

    return;
  }
LABEL_20:
  uint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  sub_2532777E8();
  sub_253276EA8();
  sub_2532779A8();
  sub_253276EA8();
  sub_253277A28();
  __break(1u);
}

void sub_253261CB8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (unint64_t i = (uint64_t *)(sub_25326FBC8() + 56); ; i += 4)
  {
    uint64_t v7 = *(i - 3);
    uint64_t v6 = *(i - 2);
    uint64_t v9 = *(i - 1);
    uint64_t v8 = *i;
    uint64_t v10 = (void *)*a3;
    sub_25326FBC8();
    swift_retain();
    unint64_t v12 = sub_25305D284(v7, v6);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_253277D38();
      __break(1u);
      goto LABEL_20;
    }
    char v15 = v11;
    if (v10[3] < v13 + v14) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_252E6FE84(&qword_269CBDB68);
      sub_2532779D8();
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v19 = (uint64_t *)(v18[6] + 16 * v12);
    *uint64_t v19 = v7;
    v19[1] = v6;
    uint64_t v20 = (void *)(v18[7] + 16 * v12);
    *uint64_t v20 = v9;
    v20[1] = v8;
    uint64_t v21 = v18[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_18;
    }
    v18[2] = v23;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_2531D50C0();
  uint64_t v16 = sub_25305D284(v7, v6);
  if ((v15 & 1) != (v17 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v16;
  if ((v15 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v24 = (void *)swift_allocError();
  swift_willThrow();
  id v25 = v24;
  sub_252E6FE84(&qword_269CB84D8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_2532777E8();
  sub_253276EA8();
  sub_2532779A8();
  sub_253276EA8();
  sub_253277A28();
  __break(1u);
}

uint64_t sub_253261F9C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  sub_25326FBC8();
  for (unint64_t i = (uint64_t *)(a1 + 56); ; i += 4)
  {
    uint64_t v8 = *(i - 3);
    uint64_t v7 = *(i - 2);
    uint64_t v9 = *i;
    uint64_t v29 = *(i - 1);
    uint64_t v10 = (void *)*a3;
    sub_25326FBC8();
    swift_retain();
    unint64_t v12 = sub_25305D284(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v15 = v11;
    if (v10[3] >= v13 + v14)
    {
      if ((a2 & 1) == 0)
      {
        sub_252E6FE84(&qword_269CBDB68);
        sub_2532779D8();
      }
    }
    else
    {
      sub_2531D50C0();
      uint64_t v16 = sub_25305D284(v8, v7);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_18;
      }
      unint64_t v12 = v16;
    }
    uint64_t v18 = (void *)*a3;
    if (v15)
    {
      uint64_t v19 = (uint64_t *)(v18[7] + 16 * v12);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      swift_retain();
      swift_bridgeObjectRelease();
      swift_release();
      BOOL v22 = (void *)(v18[7] + 16 * v12);
      swift_release();
      *BOOL v22 = v21;
      v22[1] = v20;
    }
    else
    {
      v18[(v12 >> 6) + 8] |= 1 << v12;
      uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
      uint64_t *v23 = v8;
      v23[1] = v7;
      uint64_t v24 = (void *)(v18[7] + 16 * v12);
      *uint64_t v24 = v29;
      v24[1] = v9;
      uint64_t v25 = v18[2];
      BOOL v26 = __OFADD__(v25, 1);
      uint64_t v27 = v25 + 1;
      if (v26) {
        goto LABEL_17;
      }
      v18[2] = v27;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_253277D38();
  __break(1u);
  return result;
}

uint64_t sub_253262188(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_2532629A0(a1, a2, a3, &v37);
  sub_25326FBC8();
  swift_retain();
  uint64_t v7 = sub_253263500();
  if (v8)
  {
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    while (1)
    {
      char v15 = (void *)*a5;
      unint64_t v17 = sub_25305D284(v11, v12);
      uint64_t v18 = v15[2];
      BOOL v19 = (v16 & 1) == 0;
      if (__OFADD__(v18, v19)) {
        break;
      }
      char v20 = v16;
      if (v15[3] >= v18 + v19)
      {
        if ((a4 & 1) == 0)
        {
          sub_252E6FE84(&qword_269CBDB68);
          sub_2532779D8();
        }
      }
      else
      {
        sub_2531D50C0();
        uint64_t v21 = sub_25305D284(v11, v12);
        if ((v20 & 1) != (v22 & 1)) {
          goto LABEL_17;
        }
        unint64_t v17 = v21;
      }
      uint64_t v23 = (void *)*a5;
      if (v20)
      {
        uint64_t v24 = (uint64_t *)(v23[7] + 16 * v17);
        uint64_t v26 = *v24;
        uint64_t v25 = v24[1];
        swift_retain();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v27 = (void *)(v23[7] + 16 * v17);
        swift_release();
        *uint64_t v27 = v26;
        v27[1] = v25;
      }
      else
      {
        v23[(v17 >> 6) + 8] |= 1 << v17;
        char v28 = (uint64_t *)(v23[6] + 16 * v17);
        *char v28 = v11;
        v28[1] = v12;
        uint64_t v29 = (void *)(v23[7] + 16 * v17);
        *uint64_t v29 = v13;
        v29[1] = v14;
        uint64_t v30 = v23[2];
        BOOL v31 = __OFADD__(v30, 1);
        uint64_t v32 = v30 + 1;
        if (v31) {
          goto LABEL_16;
        }
        v23[2] = v32;
      }
      uint64_t v11 = sub_253263500();
      uint64_t v12 = v33;
      uint64_t v13 = v34;
      uint64_t v14 = v35;
      a4 = 1;
      if (!v33) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_253277D38();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_252E79E98();
    return swift_release();
  }
  return result;
}

void sub_2532623B4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v5 = (uint64_t *)(sub_25326FBC8() + 56);
  while (1)
  {
    uint64_t v7 = *(v5 - 3);
    uint64_t v6 = *(v5 - 2);
    uint64_t v9 = *(v5 - 1);
    uint64_t v8 = *v5;
    uint64_t v10 = (void *)*a3;
    sub_25326FBC8();
    sub_25326FBC8();
    unint64_t v12 = sub_25305D284(v7, v6);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_253277D38();
      __break(1u);
      goto LABEL_20;
    }
    char v15 = v11;
    if (v10[3] < v13 + v14) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_252E6FE84(&qword_269CB8A50);
      sub_2532779D8();
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    BOOL v19 = (uint64_t *)(v18[6] + 16 * v12);
    *BOOL v19 = v7;
    v19[1] = v6;
    char v20 = (void *)(v18[7] + 16 * v12);
    *char v20 = v9;
    v20[1] = v8;
    uint64_t v21 = v18[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_18;
    }
    v5 += 4;
    v18[2] = v23;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_2531D5524();
  uint64_t v16 = sub_25305D284(v7, v6);
  if ((v15 & 1) != (v17 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v16;
  if ((v15 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v24 = (void *)swift_allocError();
  swift_willThrow();
  id v25 = v24;
  sub_252E6FE84(&qword_269CB84D8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_2532777E8();
  sub_253276EA8();
  sub_2532779A8();
  sub_253276EA8();
  sub_253277A28();
  __break(1u);
}

void sub_253262698(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = (uint64_t *)(sub_25326FBC8() + 56);
    while (1)
    {
      uint64_t v6 = *(v5 - 3);
      uint64_t v7 = *(v5 - 2);
      uint64_t v9 = *(v5 - 1);
      uint64_t v8 = *v5;
      uint64_t v10 = (void *)*a3;
      sub_25326FBC8();
      sub_25326FBC8();
      unint64_t v12 = sub_25305D284(v6, v7);
      uint64_t v13 = v10[2];
      BOOL v14 = (v11 & 1) == 0;
      if (__OFADD__(v13, v14))
      {
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        sub_253277D38();
        __break(1u);
        goto LABEL_19;
      }
      char v15 = v11;
      if (v10[3] >= v13 + v14)
      {
        if ((a2 & 1) == 0)
        {
          sub_252E6FE84(&qword_269CB8A50);
          sub_2532779D8();
        }
      }
      else
      {
        sub_2531D5524();
        uint64_t v16 = sub_25305D284(v6, v7);
        if ((v15 & 1) != (v17 & 1)) {
          goto LABEL_18;
        }
        unint64_t v12 = v16;
      }
      uint64_t v18 = (void *)*a3;
      if (v15) {
        break;
      }
      v18[(v12 >> 6) + 8] |= 1 << v12;
      BOOL v19 = (uint64_t *)(v18[6] + 16 * v12);
      *BOOL v19 = v6;
      v19[1] = v7;
      char v20 = (void *)(v18[7] + 16 * v12);
      *char v20 = v9;
      v20[1] = v8;
      uint64_t v21 = v18[2];
      BOOL v22 = __OFADD__(v21, 1);
      uint64_t v23 = v21 + 1;
      if (v22) {
        goto LABEL_17;
      }
      v5 += 4;
      v18[2] = v23;
      a2 = 1;
      if (!--v3)
      {
        swift_bridgeObjectRelease_n();
        return;
      }
    }
    uint64_t v24 = (uint64_t *)(v18[7] + 16 * v12);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    sub_25326447C();
    uint64_t v27 = (void *)swift_allocError();
    *char v28 = v26;
    v28[1] = v25;
    sub_25326FBC8();
    swift_willThrow();
    id v29 = v27;
    sub_252E6FE84(&qword_269CB84D8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
LABEL_19:
    sub_2532777E8();
    sub_253276EA8();
    sub_2532779A8();
    sub_253276EA8();
    sub_253277A28();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2532629A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

void sub_2532629DC()
{
  sub_252E77194();
  uint64_t v5 = v4;
  uint64_t v6 = sub_252E6FE84(&qword_269CB89D0);
  sub_252E77000();
  MEMORY[0x270FA5388](v7);
  sub_252E79170();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_252E6FE84(&qword_269CBB850);
  uint64_t v12 = sub_252E7733C(v11);
  MEMORY[0x270FA5388](v12);
  sub_252EAE7F8();
  MEMORY[0x270FA5388](v13);
  sub_252FCEA74();
  uint64_t v15 = *v1;
  uint64_t v14 = v1[1];
  uint64_t v16 = v1[3];
  unint64_t v17 = v1[4];
  uint64_t v44 = v10;
  uint64_t v49 = v1[2];
  if (!v17)
  {
    int64_t v32 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      return;
    }
    if (v32 >= (uint64_t)((unint64_t)(v1[2] + 64) >> 6))
    {
      int64_t v48 = v1[3];
      sub_2532662E0();
      goto LABEL_4;
    }
    unint64_t v33 = *(void *)(v14 + 8 * v32);
    if (v33) {
      goto LABEL_10;
    }
    sub_252E89090();
    if (v35 == v36)
    {
LABEL_30:
      sub_2532662E0();
      int64_t v48 = v41;
      goto LABEL_4;
    }
    unint64_t v33 = *(void *)(v14 + 8 * v34);
    if (v33)
    {
LABEL_15:
      int64_t v32 = v34;
      goto LABEL_10;
    }
    sub_252E89084();
    if (v35 != v36)
    {
      unint64_t v33 = *(void *)(v14 + 8 * v37);
      if (v33)
      {
        int64_t v32 = v37;
        goto LABEL_10;
      }
      sub_252E89078();
      if (v35 == v36)
      {
        sub_2532662E0();
        int64_t v48 = v43;
        goto LABEL_4;
      }
      unint64_t v33 = *(void *)(v14 + 8 * v34);
      if (v33) {
        goto LABEL_15;
      }
      sub_252E8906C();
      if (v35 != v36)
      {
        unint64_t v33 = *(void *)(v14 + 8 * v32);
        if (!v33)
        {
          uint64_t v40 = v39 + 6;
          while (v40 < v38)
          {
            unint64_t v33 = *(void *)(v14 + 8 * v40++);
            if (v33)
            {
              int64_t v32 = v40 - 1;
              goto LABEL_10;
            }
          }
          goto LABEL_30;
        }
LABEL_10:
        uint64_t v45 = v14;
        uint64_t v46 = v5;
        uint64_t v18 = v6;
        uint64_t v47 = v3;
        int64_t v48 = v32;
        uint64_t v0 = (v33 - 1) & v33;
        unint64_t v19 = __clz(__rbit64(v33)) + (v32 << 6);
        goto LABEL_3;
      }
    }
    sub_2532662E0();
    int64_t v48 = v42;
    goto LABEL_4;
  }
  uint64_t v45 = v1[1];
  uint64_t v46 = v5;
  uint64_t v18 = v6;
  uint64_t v47 = v3;
  int64_t v48 = v1[3];
  uint64_t v0 = (v17 - 1) & v17;
  unint64_t v19 = __clz(__rbit64(v17)) | (v16 << 6);
LABEL_3:
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = sub_2532709D8();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v15;
  uint64_t v24 = *(void (**)(uint64_t, unint64_t, uint64_t))(v22 + 16);
  unint64_t v25 = *(void *)(v22 + 72) * v19;
  v24(v2, v20 + v25, v21);
  unint64_t v26 = *(void *)(v23 + 56) + v25;
  uint64_t v6 = v18;
  v24(v2 + *(int *)(v18 + 48), v26, v21);
  uint64_t v15 = v23;
  uint64_t v27 = 0;
  uint64_t v5 = v46;
  uint64_t v3 = v47;
  uint64_t v14 = v45;
LABEL_4:
  uint64_t v28 = 1;
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v2, v27, 1, v6);
  *uint64_t v1 = v15;
  v1[1] = v14;
  v1[2] = v49;
  v1[3] = v48;
  v1[4] = v0;
  id v29 = (void (*)(uint64_t))v1[5];
  sub_252E7909C(v2, v3, &qword_269CBB850);
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(v3, 1, v6) != 1)
  {
    sub_252E7909C(v3, v44, &qword_269CB89D0);
    uint64_t v30 = sub_253266020();
    v29(v30);
    sub_25326616C();
    uint64_t v28 = 0;
  }
  uint64_t v31 = sub_252E6FE84(&qword_269CB89D8);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v5, v28, 1, v31);
  sub_252E771AC();
}

void sub_253262CE8()
{
  sub_252E77194();
  uint64_t v5 = v4;
  uint64_t v6 = sub_252E6FE84(&qword_269CB8A20);
  sub_252E77000();
  MEMORY[0x270FA5388](v7);
  sub_252E77324();
  uint64_t v8 = sub_252E6FE84(&qword_269CBB818);
  uint64_t v9 = sub_252E7733C(v8);
  MEMORY[0x270FA5388](v9);
  sub_252EE8808();
  MEMORY[0x270FA5388](v10);
  sub_252FCEA74();
  uint64_t v12 = *v1;
  uint64_t v11 = v1[1];
  uint64_t v14 = v1[2];
  int64_t v13 = v1[3];
  int64_t v15 = v13;
  unint64_t v16 = v1[4];
  uint64_t v33 = v0;
  if (!v16)
  {
    int64_t v24 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      return;
    }
    int64_t v25 = (unint64_t)(v14 + 64) >> 6;
    if (v24 < v25)
    {
      unint64_t v26 = *(void *)(v11 + 8 * v24);
      if (v26)
      {
LABEL_7:
        uint64_t v35 = v14;
        uint64_t v36 = v2;
        uint64_t v34 = v11;
        uint64_t v17 = v5;
        uint64_t v18 = (v26 - 1) & v26;
        unint64_t v19 = __clz(__rbit64(v26)) + (v24 << 6);
        int64_t v15 = v24;
        goto LABEL_3;
      }
      int64_t v27 = v13 + 2;
      int64_t v15 = v13 + 1;
      if (v13 + 2 < v25)
      {
        unint64_t v26 = *(void *)(v11 + 8 * v27);
        if (v26)
        {
LABEL_10:
          int64_t v24 = v27;
          goto LABEL_7;
        }
        int64_t v15 = v13 + 2;
        if (v13 + 3 < v25)
        {
          unint64_t v26 = *(void *)(v11 + 8 * (v13 + 3));
          if (v26)
          {
            int64_t v24 = v13 + 3;
            goto LABEL_7;
          }
          int64_t v27 = v13 + 4;
          int64_t v15 = v13 + 3;
          if (v13 + 4 < v25)
          {
            unint64_t v26 = *(void *)(v11 + 8 * v27);
            if (v26) {
              goto LABEL_10;
            }
            int64_t v24 = v13 + 5;
            int64_t v15 = v13 + 4;
            if (v13 + 5 < v25)
            {
              unint64_t v26 = *(void *)(v11 + 8 * v24);
              if (v26) {
                goto LABEL_7;
              }
              int64_t v15 = v25 - 1;
              int64_t v28 = v13 + 6;
              while (v28 < v25)
              {
                sub_2532662D4();
                if (v26)
                {
                  int64_t v24 = v28 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t v22 = _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v3, 1, 1, v6);
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  uint64_t v35 = v1[2];
  uint64_t v36 = v2;
  uint64_t v34 = v1[1];
  uint64_t v17 = v5;
  uint64_t v18 = (v16 - 1) & v16;
  unint64_t v19 = __clz(__rbit64(v16)) | (v13 << 6);
LABEL_3:
  uint64_t v20 = *(void *)(*(void *)(v12 + 48) + 8 * v19);
  sub_2532709D8();
  sub_252E77000();
  sub_252E771F8();
  v21();
  *uint64_t v3 = v20;
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v3, 0, 1, v6);
  uint64_t v22 = swift_retain();
  uint64_t v5 = v17;
  uint64_t v11 = v34;
  uint64_t v14 = v35;
  uint64_t v2 = v36;
LABEL_23:
  *uint64_t v1 = v12;
  v1[1] = v11;
  v1[2] = v14;
  v1[3] = v15;
  v1[4] = v18;
  id v29 = (void (*)(uint64_t))v1[5];
  sub_2532662EC(v22, v23, &qword_269CBB818);
  uint64_t v30 = 1;
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(v2, 1, v6) != 1)
  {
    sub_252E7909C(v2, v33, &qword_269CB8A20);
    uint64_t v31 = sub_253266020();
    v29(v31);
    sub_25326616C();
    uint64_t v30 = 0;
  }
  uint64_t v32 = sub_252E6FE84(&qword_269CB7E60);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v5, v30, 1, v32);
  sub_252E771AC();
}

void sub_253262FC0()
{
  sub_252E77194();
  uint64_t v4 = v3;
  sub_252E6FE84(&qword_269CB9A20);
  sub_252E77000();
  MEMORY[0x270FA5388](v5);
  sub_252E7CA40();
  uint64_t v6 = sub_252E6FE84(&qword_269CBDDA0);
  uint64_t v7 = sub_252E7733C(v6);
  MEMORY[0x270FA5388](v7);
  sub_252EE8808();
  MEMORY[0x270FA5388](v8);
  sub_253265FA4();
  if (v9)
  {
    sub_253266040();
LABEL_3:
    sub_25326E958();
    sub_252E77000();
    sub_252E771F8();
    v10();
    sub_253275B98();
    sub_252E77000();
    sub_252E771F8();
    uint64_t v12 = v11();
    uint64_t v13 = 0;
LABEL_4:
    uint64_t v4 = v1;
    goto LABEL_5;
  }
  if (__OFADD__(v0, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  sub_2532661CC();
  if (v21 == v22)
  {
    uint64_t v13 = 1;
    goto LABEL_5;
  }
  if (*(void *)(v20 + 8 * v19))
  {
    uint64_t v1 = v4;
LABEL_13:
    sub_253266088();
    goto LABEL_3;
  }
  sub_252E89090();
  if (v21 == v22)
  {
    sub_253266030();
    goto LABEL_5;
  }
  if (*(void *)(v24 + 8 * v23))
  {
LABEL_17:
    uint64_t v1 = v4;
    goto LABEL_13;
  }
  sub_252E89084();
  if (v21 != v22)
  {
    if (*(void *)(v26 + 8 * v25))
    {
      uint64_t v1 = v4;
      goto LABEL_13;
    }
    sub_252E89078();
    if (v21 == v22)
    {
      sub_2532661AC();
      goto LABEL_5;
    }
    if (*(void *)(v28 + 8 * v27)) {
      goto LABEL_17;
    }
    sub_252E8906C();
    if (v21 != v22)
    {
      uint64_t v1 = v4;
      if (*(void *)(v31 + 8 * v29)) {
        goto LABEL_13;
      }
      uint64_t v32 = (uint64_t)v0 + 6;
      while (v32 < v30)
      {
        if (*(void *)(v31 + 8 * v32++)) {
          goto LABEL_13;
        }
      }
LABEL_34:
      sub_253266030();
      goto LABEL_4;
    }
  }
  sub_2532661BC();
LABEL_5:
  uint64_t v14 = sub_253265EF8(v12, v13);
  sub_2532662EC(v14, v15, &qword_269CBDDA0);
  sub_253265F34();
  if (!v16)
  {
    sub_253266130();
    uint64_t v17 = sub_253266290();
    v0(v17);
    sub_252E76A5C(v1, &qword_269CB9A20);
    uint64_t v2 = 0;
  }
  uint64_t v18 = sub_252E6FE84(&qword_269CB9A28);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v4, v2, 1, v18);
  sub_252E771AC();
}

void sub_25326322C()
{
  sub_252E77194();
  uint64_t v5 = v4;
  uint64_t v6 = sub_252E6FE84(&qword_269CB9A40);
  sub_252E77000();
  MEMORY[0x270FA5388](v7);
  sub_252E77324();
  uint64_t v8 = sub_252E6FE84(&qword_269CBDDA8);
  uint64_t v9 = sub_252E7733C(v8);
  MEMORY[0x270FA5388](v9);
  sub_252EAE7F8();
  MEMORY[0x270FA5388](v10);
  sub_252FCEA74();
  uint64_t v11 = v1[1];
  unint64_t v12 = (unint64_t)v1[2];
  uint64_t v13 = v1[3];
  uint64_t v32 = v0;
  if (!v1[4])
  {
    if (__OFADD__(v1[3], 1))
    {
      __break(1u);
      return;
    }
    sub_253266150();
    if (v24 == v25) {
      goto LABEL_23;
    }
    unint64_t v26 = *((void *)v11 + (void)v21);
    if (v26)
    {
LABEL_8:
      unint64_t v34 = v12;
      uint64_t v35 = v3;
      uint64_t v33 = v11;
      uint64_t v14 = v5;
      unint64_t v12 = __clz(__rbit64(v26)) + ((void)v21 << 6);
      uint64_t v13 = v21;
      goto LABEL_3;
    }
    uint64_t v27 = (void (*)(uint64_t))((char *)v21 + 1);
    uint64_t v13 = v21;
    if ((uint64_t)v21 + 1 < (uint64_t)v23)
    {
      unint64_t v26 = *((void *)v11 + (void)v27);
      if (v26)
      {
LABEL_11:
        char v21 = v27;
        goto LABEL_8;
      }
      uint64_t v13 = (void (*)(uint64_t))((char *)v21 + 1);
      if ((uint64_t)v21 + 2 < (uint64_t)v23)
      {
        unint64_t v26 = *((void *)v11 + (void)v21 + 2);
        if (v26)
        {
          char v21 = (void (*)(uint64_t))((char *)v21 + 2);
          goto LABEL_8;
        }
        uint64_t v27 = (void (*)(uint64_t))((char *)v21 + 3);
        uint64_t v13 = (void (*)(uint64_t))((char *)v21 + 2);
        if ((uint64_t)v21 + 3 < (uint64_t)v23)
        {
          unint64_t v26 = *((void *)v11 + (void)v27);
          if (v26) {
            goto LABEL_11;
          }
          char v21 = (void (*)(uint64_t))((char *)v21 + 4);
          uint64_t v13 = v27;
          if ((uint64_t)v21 < (uint64_t)v23)
          {
            unint64_t v26 = *((void *)v11 + (void)v21);
            if (v26) {
              goto LABEL_8;
            }
            uint64_t v13 = (void (*)(uint64_t))((char *)v23 - 1);
            uint64_t v28 = (void (*)(uint64_t))(v22 + 6);
            while ((uint64_t)v28 < (uint64_t)v23)
            {
              unint64_t v26 = *((void *)v11 + (void)v28);
              uint64_t v28 = (void (*)(uint64_t))((char *)v28 + 1);
              if (v26)
              {
                char v21 = (void (*)(uint64_t))((char *)v28 - 1);
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
LABEL_23:
    uint64_t v18 = (void (*)(uint64_t))v15;
    _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v2, 1, 1, v6);
    goto LABEL_24;
  }
  unint64_t v34 = (unint64_t)v1[2];
  uint64_t v35 = v3;
  uint64_t v33 = v1[1];
  uint64_t v14 = v5;
  sub_253266008();
LABEL_3:
  uint64_t v16 = *(void *)(v15 + 56);
  uint64_t v17 = *(void *)(*(void *)(v15 + 48) + 8 * v12);
  uint64_t v18 = (void (*)(uint64_t))v15;
  uint64_t v19 = type metadata accessor for ProvisionalToolPromptMap(0);
  sub_252E7733C(v19);
  sub_253265664(v16 + *(void *)(v20 + 72) * v12, (uint64_t)v2 + *(int *)(v6 + 48), (void (*)(void))type metadata accessor for ProvisionalToolPromptMap);
  *uint64_t v2 = v17;
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v2, 0, 1, v6);
  sub_25326FBC8();
  uint64_t v5 = v14;
  uint64_t v11 = v33;
  unint64_t v12 = v34;
  uint64_t v3 = v35;
LABEL_24:
  *uint64_t v1 = v18;
  v1[1] = v11;
  v1[2] = (void (*)(uint64_t))v12;
  v1[3] = v13;
  sub_253266104();
  sub_252E7909C((uint64_t)v2, v3, &qword_269CBDDA8);
  uint64_t v29 = 1;
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(v3, 1, v6) != 1)
  {
    sub_252E7909C(v3, v32, &qword_269CB9A40);
    uint64_t v30 = sub_253266020();
    v18(v30);
    sub_25326616C();
    uint64_t v29 = 0;
  }
  uint64_t v31 = sub_252E6FE84(&qword_269CB9A48);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v5, v29, 1, v31);
  sub_252E771AC();
}

uint64_t sub_253263500()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  void v22[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 56) + 16 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v13 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    sub_25326FBC8();
    swift_retain();
    v13(&v21, v22);
    swift_release();
    swift_bridgeObjectRelease();
    return v21;
  }
  uint64_t v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      uint64_t v17 = v0[1];
      uint64_t v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v5 = (v18 - 1) & v18;
        unint64_t v6 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v4 = v15;
        goto LABEL_3;
      }
      uint64_t v19 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        uint64_t v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          uint64_t v15 = v19;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          uint64_t v18 = *(void *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            uint64_t v15 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v19 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            uint64_t v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            uint64_t v15 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              uint64_t v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v4 = v16 - 1;
              uint64_t v20 = v3 + 6;
              while (v20 < v16)
              {
                uint64_t v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  uint64_t v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

void sub_2532636A0()
{
  sub_252E77194();
  uint64_t v8 = v7;
  uint64_t v9 = sub_252E6FE84(&qword_269CB8EB0);
  sub_252E77000();
  MEMORY[0x270FA5388](v10);
  sub_252E77324();
  uint64_t v11 = sub_252E6FE84(&qword_269CBB820);
  uint64_t v12 = sub_252E7733C(v11);
  MEMORY[0x270FA5388](v12);
  sub_25326606C();
  MEMORY[0x270FA5388](v13);
  sub_253265F58();
  if (!v15)
  {
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      return;
    }
    sub_253266150();
    if (v20 == v21) {
      goto LABEL_26;
    }
    if (*(void *)(v5 + 8 * v19))
    {
LABEL_8:
      sub_253265F80();
      goto LABEL_3;
    }
    sub_253266234();
    if (v20 != v21)
    {
      if (*(void *)(v5 + 8 * v22)) {
        goto LABEL_8;
      }
      sub_253266224();
      if (v20 != v21)
      {
        if (*(void *)(v5 + 8 * v23)) {
          goto LABEL_8;
        }
        sub_253266214();
        if (v20 != v21)
        {
          if (*(void *)(v5 + 8 * v24)) {
            goto LABEL_8;
          }
          sub_2532662A0();
          if (v20 != v21)
          {
            if (*(void *)(v5 + 8 * v25)) {
              goto LABEL_8;
            }
            uint64_t v2 = v27 - 1;
            uint64_t v28 = v26 + 6;
            while (v28 < v27)
            {
              sub_2532662D4();
              if (v29) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
LABEL_26:
    sub_2532660DC();
    goto LABEL_27;
  }
  uint64_t v36 = v6;
  uint64_t v37 = v5;
  uint64_t v38 = v8;
  sub_253266008();
LABEL_3:
  uint64_t v16 = sub_2532660C4();
  uint64_t v17 = type metadata accessor for ProvisionalParameterPromptMap(v16);
  sub_252E7733C(v17);
  sub_253265664(v8 + *(void *)(v18 + 72) * v6, v3 + *(int *)(v9 + 48), (void (*)(void))type metadata accessor for ProvisionalParameterPromptMap);
  sub_253265FC8();
  uint64_t v5 = v37;
  uint64_t v8 = v38;
  uint64_t v6 = v36;
LABEL_27:
  *uint64_t v1 = v4;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v2;
  sub_253266104();
  sub_253266274(v30, v31, &qword_269CBB820);
  uint64_t v32 = 1;
  sub_253265F34();
  if (!v33)
  {
    sub_253266110();
    uint64_t v34 = sub_253266020();
    v0(v34);
    sub_25326616C();
    uint64_t v32 = 0;
  }
  uint64_t v35 = sub_252E6FE84(&qword_269CB9A68);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v8, v32, 1, v35);
  sub_252E771AC();
}

void sub_2532638AC()
{
  sub_252E77194();
  uint64_t v4 = v3;
  sub_252E6FE84(&qword_269CB9B60);
  sub_252E77000();
  MEMORY[0x270FA5388](v5);
  sub_252E7CA40();
  uint64_t v6 = sub_252E6FE84(&qword_269CB9B58);
  uint64_t v7 = sub_252E7733C(v6);
  MEMORY[0x270FA5388](v7);
  sub_252EE8808();
  MEMORY[0x270FA5388](v8);
  sub_253265FA4();
  if (v9)
  {
    sub_253266040();
LABEL_3:
    sub_253273DB8();
    sub_252E77000();
    sub_252E771F8();
    v10();
    sub_253275928();
    sub_252E77000();
    sub_252E771F8();
    uint64_t v12 = v11();
    uint64_t v13 = 0;
LABEL_4:
    uint64_t v4 = v1;
    goto LABEL_5;
  }
  if (__OFADD__(v0, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  sub_2532661CC();
  if (v21 == v22)
  {
    uint64_t v13 = 1;
    goto LABEL_5;
  }
  if (*(void *)(v20 + 8 * v19))
  {
    uint64_t v1 = v4;
LABEL_13:
    sub_253266088();
    goto LABEL_3;
  }
  sub_252E89090();
  if (v21 == v22)
  {
    sub_253266030();
    goto LABEL_5;
  }
  if (*(void *)(v24 + 8 * v23))
  {
LABEL_17:
    uint64_t v1 = v4;
    goto LABEL_13;
  }
  sub_252E89084();
  if (v21 != v22)
  {
    if (*(void *)(v26 + 8 * v25))
    {
      uint64_t v1 = v4;
      goto LABEL_13;
    }
    sub_252E89078();
    if (v21 == v22)
    {
      sub_2532661AC();
      goto LABEL_5;
    }
    if (*(void *)(v28 + 8 * v27)) {
      goto LABEL_17;
    }
    sub_252E8906C();
    if (v21 != v22)
    {
      uint64_t v1 = v4;
      if (*(void *)(v31 + 8 * v29)) {
        goto LABEL_13;
      }
      uint64_t v32 = (uint64_t)v0 + 6;
      while (v32 < v30)
      {
        if (*(void *)(v31 + 8 * v32++)) {
          goto LABEL_13;
        }
      }
LABEL_34:
      sub_253266030();
      goto LABEL_4;
    }
  }
  sub_2532661BC();
LABEL_5:
  uint64_t v14 = sub_253265EF8(v12, v13);
  sub_2532662EC(v14, v15, &qword_269CB9B58);
  sub_253265F34();
  if (!v16)
  {
    sub_253266130();
    uint64_t v17 = sub_253266290();
    v0(v17);
    sub_252E76A5C(v1, &qword_269CB9B60);
    uint64_t v2 = 0;
  }
  uint64_t v18 = sub_252E6FE84(&qword_269CBB0F0);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v4, v2, 1, v18);
  sub_252E771AC();
}

void sub_253263B18()
{
  sub_252E77194();
  uint64_t v6 = v5;
  sub_252E6FE84(&qword_269CBAF18);
  sub_252E77000();
  MEMORY[0x270FA5388](v7);
  sub_252E7CA40();
  uint64_t v8 = sub_252E6FE84(&qword_269CBDBA0);
  uint64_t v9 = sub_252E7733C(v8);
  MEMORY[0x270FA5388](v9);
  sub_252EE8808();
  MEMORY[0x270FA5388](v10);
  sub_253265FA4();
  if (v11)
  {
    sub_253266040();
LABEL_3:
    uint64_t v12 = *(void *)(v4 + 48);
    uint64_t v13 = type metadata accessor for ActionResolver.Parameter(0);
    sub_252E7733C(v13);
    sub_253265664(v12 + *(void *)(v14 + 72) * v3, v2, (void (*)(void))type metadata accessor for ActionResolver.Parameter);
    sub_253275928();
    sub_252E77000();
    sub_252E771F8();
    uint64_t v16 = v15();
    uint64_t v17 = 0;
LABEL_4:
    uint64_t v6 = v1;
    goto LABEL_5;
  }
  if (__OFADD__(v0, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  sub_2532661CC();
  if (v25 == v26)
  {
    uint64_t v17 = 1;
    goto LABEL_5;
  }
  if (*(void *)(v24 + 8 * v23))
  {
    uint64_t v1 = v6;
LABEL_13:
    sub_253266088();
    goto LABEL_3;
  }
  sub_252E89090();
  if (v25 == v26)
  {
    sub_253266030();
    goto LABEL_5;
  }
  if (*(void *)(v28 + 8 * v27))
  {
LABEL_17:
    uint64_t v1 = v6;
    goto LABEL_13;
  }
  sub_252E89084();
  if (v25 != v26)
  {
    if (*(void *)(v30 + 8 * v29))
    {
      uint64_t v1 = v6;
      goto LABEL_13;
    }
    sub_252E89078();
    if (v25 == v26)
    {
      sub_2532661AC();
      goto LABEL_5;
    }
    if (*(void *)(v32 + 8 * v31)) {
      goto LABEL_17;
    }
    sub_252E8906C();
    if (v25 != v26)
    {
      uint64_t v1 = v6;
      if (*(void *)(v35 + 8 * v33)) {
        goto LABEL_13;
      }
      uint64_t v36 = (uint64_t)v0 + 6;
      while (v36 < v34)
      {
        if (*(void *)(v35 + 8 * v36++)) {
          goto LABEL_13;
        }
      }
LABEL_34:
      sub_253266030();
      goto LABEL_4;
    }
  }
  sub_2532661BC();
LABEL_5:
  uint64_t v18 = sub_253265EF8(v16, v17);
  sub_2532662EC(v18, v19, &qword_269CBDBA0);
  sub_253265F34();
  if (!v20)
  {
    sub_253266130();
    uint64_t v21 = sub_253266290();
    v0(v21);
    sub_252E76A5C(v1, &qword_269CBAF18);
    uint64_t v3 = 0;
  }
  uint64_t v22 = sub_252E6FE84(&qword_269CBB0D0);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v6, v3, 1, v22);
  sub_252E771AC();
}

void sub_253263D88()
{
  sub_252E77194();
  uint64_t v7 = v6;
  sub_252E6FE84(&qword_269CBB308);
  sub_252E77000();
  MEMORY[0x270FA5388](v8);
  sub_252E77324();
  uint64_t v9 = sub_252E6FE84(&qword_269CBDB98);
  uint64_t v10 = sub_252E7733C(v9);
  MEMORY[0x270FA5388](v10);
  sub_25326606C();
  MEMORY[0x270FA5388](v11);
  sub_253265F58();
  if (!v13)
  {
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      return;
    }
    sub_253266150();
    if (v16 == v17) {
      goto LABEL_26;
    }
    if (*(void *)(v4 + 8 * v15))
    {
LABEL_8:
      sub_253265F80();
      goto LABEL_3;
    }
    sub_253266234();
    if (v16 != v17)
    {
      if (*(void *)(v4 + 8 * v18)) {
        goto LABEL_8;
      }
      sub_253266224();
      if (v16 != v17)
      {
        if (*(void *)(v4 + 8 * v19)) {
          goto LABEL_8;
        }
        sub_253266214();
        if (v16 != v17)
        {
          if (*(void *)(v4 + 8 * v20)) {
            goto LABEL_8;
          }
          sub_2532662A0();
          if (v16 != v17)
          {
            if (*(void *)(v4 + 8 * v21)) {
              goto LABEL_8;
            }
            uint64_t v2 = v23 - 1;
            uint64_t v24 = v22 + 6;
            while (v24 < v23)
            {
              sub_2532662D4();
              if (v25) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
LABEL_26:
    sub_2532660DC();
    goto LABEL_27;
  }
  uint64_t v32 = v5;
  uint64_t v33 = v4;
  uint64_t v34 = v7;
  sub_253266008();
LABEL_3:
  sub_2532660C4();
  sub_253270A48();
  sub_252E77000();
  sub_252E771F8();
  v14();
  sub_253265FC8();
  uint64_t v4 = v33;
  uint64_t v7 = v34;
  uint64_t v5 = v32;
LABEL_27:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v5;
  v1[3] = v2;
  sub_253266104();
  sub_253266274(v26, v27, &qword_269CBDB98);
  uint64_t v28 = 1;
  sub_253265F34();
  if (!v29)
  {
    sub_253266110();
    uint64_t v30 = sub_253266020();
    v0(v30);
    sub_25326616C();
    uint64_t v28 = 0;
  }
  uint64_t v31 = sub_252E6FE84(&qword_269CBB310);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v7, v28, 1, v31);
  sub_252E771AC();
}

void sub_253263F90()
{
  sub_252E77194();
  uint64_t v8 = v7;
  uint64_t v9 = sub_252E6FE84(&qword_269CBD3D8);
  sub_252E77000();
  MEMORY[0x270FA5388](v10);
  sub_252E77324();
  uint64_t v11 = sub_252E6FE84(&qword_269CBDB90);
  uint64_t v12 = sub_252E7733C(v11);
  MEMORY[0x270FA5388](v12);
  sub_25326606C();
  MEMORY[0x270FA5388](v13);
  sub_253265F58();
  if (!v15)
  {
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      return;
    }
    sub_253266150();
    if (v20 == v21) {
      goto LABEL_26;
    }
    if (*(void *)(v5 + 8 * v19))
    {
LABEL_8:
      sub_253265F80();
      goto LABEL_3;
    }
    sub_253266234();
    if (v20 != v21)
    {
      if (*(void *)(v5 + 8 * v22)) {
        goto LABEL_8;
      }
      sub_253266224();
      if (v20 != v21)
      {
        if (*(void *)(v5 + 8 * v23)) {
          goto LABEL_8;
        }
        sub_253266214();
        if (v20 != v21)
        {
          if (*(void *)(v5 + 8 * v24)) {
            goto LABEL_8;
          }
          sub_2532662A0();
          if (v20 != v21)
          {
            if (*(void *)(v5 + 8 * v25)) {
              goto LABEL_8;
            }
            uint64_t v2 = v27 - 1;
            uint64_t v28 = v26 + 6;
            while (v28 < v27)
            {
              sub_2532662D4();
              if (v29) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
LABEL_26:
    sub_2532660DC();
    goto LABEL_27;
  }
  uint64_t v36 = v6;
  uint64_t v37 = v5;
  uint64_t v38 = v8;
  sub_253266008();
LABEL_3:
  uint64_t v16 = sub_2532660C4();
  uint64_t v17 = type metadata accessor for DialogValue(v16);
  sub_252E7733C(v17);
  sub_253265664(v8 + *(void *)(v18 + 72) * v6, v3 + *(int *)(v9 + 48), (void (*)(void))type metadata accessor for DialogValue);
  sub_253265FC8();
  uint64_t v5 = v37;
  uint64_t v8 = v38;
  uint64_t v6 = v36;
LABEL_27:
  *uint64_t v1 = v4;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v2;
  sub_253266104();
  sub_253266274(v30, v31, &qword_269CBDB90);
  uint64_t v32 = 1;
  sub_253265F34();
  if (!v33)
  {
    sub_253266110();
    uint64_t v34 = sub_253266020();
    v0(v34);
    sub_25326616C();
    uint64_t v32 = 0;
  }
  uint64_t v35 = sub_252E6FE84(&qword_269CB7A58);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v8, v32, 1, v35);
  sub_252E771AC();
}

uint64_t sub_25326419C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_252E76B6C(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    sub_25326FBC8();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v18 < v15)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_252E7909C((uint64_t)&v23, (uint64_t)v22, &qword_269CBDB80);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_252E76A5C((uint64_t)v21, &qword_269CBDB88);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_253264388()
{
  return sub_253261160();
}

__n128 sub_2532643A8@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = sub_2532615A4(&v6, *a1, a1[1], a1[2], a1[3]);
  __n128 result = v6;
  a2->n128_u64[0] = v3;
  a2->n128_u64[1] = v5;
  a2[1] = result;
  return result;
}

uint64_t sub_2532643EC()
{
  return sub_2532611C0();
}

uint64_t sub_25326440C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253264444()
{
  return sub_2532643EC();
}

uint64_t sub_253264460()
{
  return sub_253264388();
}

unint64_t sub_25326447C()
{
  unint64_t result = qword_269CBDB78;
  if (!qword_269CBDB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDB78);
  }
  return result;
}

void _s12DuplicateKeyVMa()
{
}

void _s19FormattedParametersVMa()
{
}

void _s19FormattedParametersVMa_0()
{
}

void _s19FormattedParametersVMa_1()
{
}

void _s19FormattedParametersVMa_2()
{
}

void _s19FormattedParametersVMa_3()
{
}

void _s19FormattedParametersVMa_4()
{
}

void type metadata accessor for SuccessFormattedParameters()
{
}

void type metadata accessor for ErrorFormattedParameters()
{
}

void _s19FormattedParametersVMa_5()
{
}

void *sub_253264550(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_253264580()
{
  return swift_release();
}

void *sub_253264588(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_2532645C4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

void type metadata accessor for ParameterEncodable()
{
}

unint64_t sub_253264604()
{
  unint64_t result = qword_269CBDBB0;
  if (!qword_269CBDBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBB0);
  }
  return result;
}

unint64_t sub_253264650()
{
  unint64_t result = qword_269CBDBC0;
  if (!qword_269CBDBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBC0);
  }
  return result;
}

unint64_t sub_25326469C()
{
  unint64_t result = qword_269CBDBC8;
  if (!qword_269CBDBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBC8);
  }
  return result;
}

unint64_t sub_2532646E8()
{
  unint64_t result = qword_269CBDBD8;
  if (!qword_269CBDBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBD8);
  }
  return result;
}

unint64_t sub_253264734()
{
  unint64_t result = qword_269CBDBE0;
  if (!qword_269CBDBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBE0);
  }
  return result;
}

unint64_t sub_253264780()
{
  unint64_t result = qword_269CBDBF0;
  if (!qword_269CBDBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBF0);
  }
  return result;
}

unint64_t sub_2532647CC()
{
  unint64_t result = qword_269CBDBF8;
  if (!qword_269CBDBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDBF8);
  }
  return result;
}

unint64_t sub_253264818()
{
  unint64_t result = qword_269CBDC08;
  if (!qword_269CBDC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC08);
  }
  return result;
}

unint64_t sub_253264864()
{
  unint64_t result = qword_269CBDC10;
  if (!qword_269CBDC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC10);
  }
  return result;
}

unint64_t sub_2532648B0()
{
  unint64_t result = qword_269CBDC20;
  if (!qword_269CBDC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC20);
  }
  return result;
}

unint64_t sub_2532648FC()
{
  unint64_t result = qword_269CBDC30;
  if (!qword_269CBDC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC30);
  }
  return result;
}

unint64_t sub_253264948()
{
  unint64_t result = qword_269CBDC38;
  if (!qword_269CBDC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC38);
  }
  return result;
}

unint64_t sub_253264994()
{
  unint64_t result = qword_269CBDC48;
  if (!qword_269CBDC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC48);
  }
  return result;
}

unint64_t sub_2532649E0()
{
  unint64_t result = qword_269CBDC50;
  if (!qword_269CBDC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC50);
  }
  return result;
}

unint64_t sub_253264A2C()
{
  unint64_t result = qword_269CBDC60;
  if (!qword_269CBDC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC60);
  }
  return result;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa()
{
  return &_s19FormattedParametersV10CodingKeysON;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_0()
{
  return &_s19FormattedParametersV10CodingKeysON_0;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_1()
{
  return &_s19FormattedParametersV10CodingKeysON_1;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_2()
{
  return &_s19FormattedParametersV10CodingKeysON_2;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_3()
{
  return &_s19FormattedParametersV10CodingKeysON_3;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_4()
{
  return &_s19FormattedParametersV10CodingKeysON_4;
}

ValueMetadata *type metadata accessor for SuccessFormattedParameters.CodingKeys()
{
  return &type metadata for SuccessFormattedParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for ErrorFormattedParameters.CodingKeys()
{
  return &type metadata for ErrorFormattedParameters.CodingKeys;
}

ValueMetadata *_s19FormattedParametersV10CodingKeysOMa_5()
{
  return &_s19FormattedParametersV10CodingKeysON_5;
}

void _s13ConfirmActionVMa()
{
}

void _s12ConfirmValueVMa()
{
}

uint64_t sub_253264B24(uint64_t result, int a2, int a3)
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
      return sub_253266304(result, a2);
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      return sub_253266304(result, a2);
    }
  }
  return result;
}

void _s18DisambiguateValuesVMa()
{
}

void _s18DisambiguateValuesVMa_0()
{
}

void type metadata accessor for SuccessFormattedParameters.DescribeOutput()
{
}

uint64_t sub_253264B80(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      return sub_253266304(result, a2);
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      return sub_253266304(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ErrorFormattedParameters.DescribeError()
{
}

unint64_t sub_253264BC4()
{
  unint64_t result = qword_269CBDC68;
  if (!qword_269CBDC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC68);
  }
  return result;
}

unint64_t sub_253264C14()
{
  unint64_t result = qword_269CBDC70;
  if (!qword_269CBDC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC70);
  }
  return result;
}

unint64_t sub_253264C64()
{
  unint64_t result = qword_269CBDC78;
  if (!qword_269CBDC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC78);
  }
  return result;
}

unint64_t sub_253264CB4()
{
  unint64_t result = qword_269CBDC80;
  if (!qword_269CBDC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC80);
  }
  return result;
}

unint64_t sub_253264D04()
{
  unint64_t result = qword_269CBDC88;
  if (!qword_269CBDC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC88);
  }
  return result;
}

unint64_t sub_253264D54()
{
  unint64_t result = qword_269CBDC90;
  if (!qword_269CBDC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC90);
  }
  return result;
}

unint64_t sub_253264DA4()
{
  unint64_t result = qword_269CBDC98;
  if (!qword_269CBDC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDC98);
  }
  return result;
}

unint64_t sub_253264DF4()
{
  unint64_t result = qword_269CBDCA0;
  if (!qword_269CBDCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCA0);
  }
  return result;
}

unint64_t sub_253264E44()
{
  unint64_t result = qword_269CBDCA8;
  if (!qword_269CBDCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCA8);
  }
  return result;
}

unint64_t sub_253264E94()
{
  unint64_t result = qword_269CBDCB0;
  if (!qword_269CBDCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCB0);
  }
  return result;
}

unint64_t sub_253264EE4()
{
  unint64_t result = qword_269CBDCB8;
  if (!qword_269CBDCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCB8);
  }
  return result;
}

unint64_t sub_253264F34()
{
  unint64_t result = qword_269CBDCC0;
  if (!qword_269CBDCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCC0);
  }
  return result;
}

unint64_t sub_253264F84()
{
  unint64_t result = qword_269CBDCC8;
  if (!qword_269CBDCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCC8);
  }
  return result;
}

unint64_t sub_253264FD4()
{
  unint64_t result = qword_269CBDCD0;
  if (!qword_269CBDCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCD0);
  }
  return result;
}

unint64_t sub_253265024()
{
  unint64_t result = qword_269CBDCD8;
  if (!qword_269CBDCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCD8);
  }
  return result;
}

unint64_t sub_253265074()
{
  unint64_t result = qword_269CBDCE0;
  if (!qword_269CBDCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCE0);
  }
  return result;
}

unint64_t sub_2532650C4()
{
  unint64_t result = qword_269CBDCE8;
  if (!qword_269CBDCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCE8);
  }
  return result;
}

unint64_t sub_253265114()
{
  unint64_t result = qword_269CBDCF0;
  if (!qword_269CBDCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCF0);
  }
  return result;
}

unint64_t sub_253265164()
{
  unint64_t result = qword_269CBDCF8;
  if (!qword_269CBDCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDCF8);
  }
  return result;
}

unint64_t sub_2532651B4()
{
  unint64_t result = qword_269CBDD00;
  if (!qword_269CBDD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD00);
  }
  return result;
}

unint64_t sub_253265204()
{
  unint64_t result = qword_269CBDD08;
  if (!qword_269CBDD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD08);
  }
  return result;
}

unint64_t sub_253265254()
{
  unint64_t result = qword_269CBDD10;
  if (!qword_269CBDD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD10);
  }
  return result;
}

unint64_t sub_2532652A4()
{
  unint64_t result = qword_269CBDD18;
  if (!qword_269CBDD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD18);
  }
  return result;
}

unint64_t sub_2532652F4()
{
  unint64_t result = qword_269CBDD20;
  if (!qword_269CBDD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD20);
  }
  return result;
}

unint64_t sub_253265344()
{
  unint64_t result = qword_269CBDD28;
  if (!qword_269CBDD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD28);
  }
  return result;
}

unint64_t sub_253265394()
{
  unint64_t result = qword_269CBDD30;
  if (!qword_269CBDD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD30);
  }
  return result;
}

unint64_t sub_2532653E4()
{
  unint64_t result = qword_269CBDD38;
  if (!qword_269CBDD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD38);
  }
  return result;
}

unint64_t sub_253265430()
{
  unint64_t result = qword_269CBDD48;
  if (!qword_269CBDD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD48);
  }
  return result;
}

unint64_t sub_25326547C()
{
  unint64_t result = qword_269CBDD58;
  if (!qword_269CBDD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD58);
  }
  return result;
}

unint64_t sub_2532654C8()
{
  unint64_t result = qword_269CBDD68;
  if (!qword_269CBDD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD68);
  }
  return result;
}

unint64_t sub_253265514()
{
  unint64_t result = qword_269CBA080;
  if (!qword_269CBA080)
  {
    sub_252E81F58(&qword_26B240400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBA080);
  }
  return result;
}

unint64_t sub_253265580()
{
  unint64_t result = qword_269CBDD78;
  if (!qword_269CBDD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD78);
  }
  return result;
}

unint64_t sub_2532655CC()
{
  unint64_t result = qword_269CBDD88;
  if (!qword_269CBDD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD88);
  }
  return result;
}

unint64_t sub_253265618()
{
  unint64_t result = qword_269CBDD98;
  if (!qword_269CBDD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDD98);
  }
  return result;
}

uint64_t sub_253265664(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252E77000();
  sub_252E771F8();
  v4();
  return a2;
}

ValueMetadata *_s13ConfirmActionV10CodingKeysOMa()
{
  return &_s13ConfirmActionV10CodingKeysON;
}

ValueMetadata *_s12ConfirmValueV10CodingKeysOMa()
{
  return &_s12ConfirmValueV10CodingKeysON;
}

unsigned char *_s18DisambiguateValuesV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2532657ACLL);
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

ValueMetadata *_s18DisambiguateValuesV10CodingKeysOMa()
{
  return &_s18DisambiguateValuesV10CodingKeysON;
}

ValueMetadata *_s18DisambiguateValuesV10CodingKeysOMa_0()
{
  return &_s18DisambiguateValuesV10CodingKeysON_0;
}

ValueMetadata *type metadata accessor for SuccessFormattedParameters.DescribeOutput.CodingKeys()
{
  return &type metadata for SuccessFormattedParameters.DescribeOutput.CodingKeys;
}

unsigned char *_s19FormattedParametersV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2532658A0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorFormattedParameters.DescribeError.CodingKeys()
{
  return &type metadata for ErrorFormattedParameters.DescribeError.CodingKeys;
}

unint64_t sub_2532658DC()
{
  unint64_t result = qword_269CBDDB0;
  if (!qword_269CBDDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDB0);
  }
  return result;
}

unint64_t sub_25326592C()
{
  unint64_t result = qword_269CBDDB8;
  if (!qword_269CBDDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDB8);
  }
  return result;
}

unint64_t sub_25326597C()
{
  unint64_t result = qword_269CBDDC0;
  if (!qword_269CBDDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDC0);
  }
  return result;
}

unint64_t sub_2532659CC()
{
  unint64_t result = qword_269CBDDC8;
  if (!qword_269CBDDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDC8);
  }
  return result;
}

unint64_t sub_253265A1C()
{
  unint64_t result = qword_269CBDDD0;
  if (!qword_269CBDDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDD0);
  }
  return result;
}

unint64_t sub_253265A6C()
{
  unint64_t result = qword_269CBDDD8;
  if (!qword_269CBDDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDD8);
  }
  return result;
}

unint64_t sub_253265ABC()
{
  unint64_t result = qword_269CBDDE0;
  if (!qword_269CBDDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDE0);
  }
  return result;
}

unint64_t sub_253265B0C()
{
  unint64_t result = qword_269CBDDE8;
  if (!qword_269CBDDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDE8);
  }
  return result;
}

unint64_t sub_253265B5C()
{
  unint64_t result = qword_269CBDDF0;
  if (!qword_269CBDDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDF0);
  }
  return result;
}

unint64_t sub_253265BAC()
{
  unint64_t result = qword_269CBDDF8;
  if (!qword_269CBDDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDDF8);
  }
  return result;
}

unint64_t sub_253265BFC()
{
  unint64_t result = qword_269CBDE00;
  if (!qword_269CBDE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE00);
  }
  return result;
}

unint64_t sub_253265C4C()
{
  unint64_t result = qword_269CBDE08;
  if (!qword_269CBDE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE08);
  }
  return result;
}

unint64_t sub_253265C9C()
{
  unint64_t result = qword_269CBDE10;
  if (!qword_269CBDE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE10);
  }
  return result;
}

unint64_t sub_253265CEC()
{
  unint64_t result = qword_269CBDE18;
  if (!qword_269CBDE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE18);
  }
  return result;
}

unint64_t sub_253265D3C()
{
  unint64_t result = qword_269CBDE20;
  if (!qword_269CBDE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE20);
  }
  return result;
}

unint64_t sub_253265D8C()
{
  unint64_t result = qword_269CBDE28;
  if (!qword_269CBDE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE28);
  }
  return result;
}

unint64_t sub_253265DDC()
{
  unint64_t result = qword_269CBDE30;
  if (!qword_269CBDE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE30);
  }
  return result;
}

unint64_t sub_253265E2C()
{
  unint64_t result = qword_269CBDE38;
  if (!qword_269CBDE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDE38);
  }
  return result;
}

uint64_t sub_253265E98()
{
  return sub_253264444();
}

uint64_t sub_253265EB8()
{
  return v0;
}

void *sub_253265ED4()
{
  return sub_252E983FC(v0, v0[3]);
}

uint64_t sub_253265EF8(uint64_t a1, uint64_t a2)
{
  uint64_t result = _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v5, a2, 1, v4);
  uint64_t v10 = *(void *)(v8 - 88);
  *int v3 = v6;
  v3[1] = v10;
  v3[2] = *(void *)(v8 - 96);
  v3[3] = v2;
  v3[4] = v7;
  return result;
}

uint64_t sub_253265F34()
{
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(v1, 1, v0);
}

void sub_253265F58()
{
  *(void *)(v2 - 120) = v1;
  *(void *)(v2 - 88) = v0;
}

void sub_253265F80()
{
  *(void *)(v3 - 112) = v2;
  *(void *)(v3 - 104) = v1;
  *(void *)(v3 - 96) = v0;
}

void sub_253265FA4()
{
  uint64_t v3 = *(void *)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 16);
  *(void *)(v2 - 104) = v1;
  *(void *)(v2 - 96) = v4;
  *(void *)(v2 - 88) = v3;
}

uint64_t sub_253265FC8()
{
  *uint64_t v2 = v0;
  v2[1] = v3;
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v2, 0, 1, v1);
  return sub_25326FBC8();
}

uint64_t sub_253266020()
{
  return v0;
}

uint64_t sub_2532660A4()
{
  return sub_253277C48();
}

uint64_t sub_2532660C4()
{
  return 0;
}

uint64_t sub_2532660DC()
{
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v1, 1, 1, v0);
}

void sub_253266104()
{
  *(void *)(v0 + 32) = v1;
}

uint64_t sub_253266110()
{
  uint64_t v4 = *(void *)(v2 - 120);
  return sub_252E7909C(v1, v4, v0);
}

uint64_t sub_253266130()
{
  uint64_t v4 = *(void *)(v2 - 104);
  return sub_252E7909C(v1, v4, v0);
}

uint64_t sub_25326616C()
{
  return sub_252E76A5C(v1, v0);
}

uint64_t sub_253266184()
{
  return sub_253277C48();
}

uint64_t sub_2532661DC()
{
  return v0;
}

uint64_t sub_2532661EC()
{
  return v0;
}

uint64_t sub_253266244()
{
  return 0;
}

uint64_t sub_25326625C()
{
  return 0;
}

uint64_t sub_253266274(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *(void *)(v4 - 88);
  return sub_252E7909C(v3, v6, a3);
}

uint64_t sub_253266290()
{
  return v0;
}

uint64_t sub_2532662B0()
{
  return v0;
}

uint64_t sub_2532662EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_252E7909C(v4, v3, a3);
}

uint64_t sub_253266304(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TypedValueFormatter(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25326EA68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    sub_25326FBC8();
  }
  return a1;
}

uint64_t destroy for TypedValueFormatter(uint64_t a1)
{
  uint64_t v2 = sub_25326EA68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326EA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  sub_25326FBC8();
  return a1;
}

uint64_t assignWithCopy for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326EA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  sub_25326FBC8();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326EA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326EA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2532666DC);
}

uint64_t sub_2532666DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25326EA68();
  sub_252E9F900();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TypedValueFormatter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25326678C);
}

void sub_25326678C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25326EA68();
  sub_252E9F900();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
}

uint64_t type metadata accessor for TypedValueFormatter(uint64_t a1)
{
  return sub_252E71BA4(a1, (uint64_t *)&unk_269CBDE50);
}

uint64_t sub_253266838()
{
  uint64_t result = sub_25326EA68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2532668CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_252E6FE84(&qword_269CBDE68);
  sub_252E77000();
  MEMORY[0x270FA5388](v4);
  sub_252E77068();
  uint64_t v41 = v5;
  sub_252E7707C();
  MEMORY[0x270FA5388](v6);
  sub_252E7C96C();
  uint64_t v45 = v7;
  sub_252E77258();
  sub_25326E5A8();
  sub_252E76F94();
  uint64_t v47 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v50 = (char *)&v36 - v12;
  sub_252E7707C();
  MEMORY[0x270FA5388](v13);
  sub_252E7C96C();
  uint64_t v48 = v14;
  uint64_t v42 = sub_252E6FE84(&qword_269CBDE70);
  sub_252E77000();
  MEMORY[0x270FA5388](v15);
  sub_252E77068();
  uint64_t v43 = v16;
  sub_252E7707C();
  MEMORY[0x270FA5388](v17);
  sub_252E7C96C();
  uint64_t v44 = v18;
  uint64_t v19 = sub_252E6FE84(&qword_269CBDE78);
  uint64_t v20 = sub_252E7733C(v19);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25326E588();
  uint64_t v24 = sub_253268390(&qword_269CBDE80, MEMORY[0x263F066D8]);
  uint64_t v51 = v23;
  uint64_t v49 = v24;
  sub_2532772F8();
  sub_253268390(&qword_269CBDE88, MEMORY[0x263F067E8]);
  uint64_t result = sub_253276C18();
  if (result)
  {
    uint64_t v46 = v3;
    uint64_t v39 = a1;
    uint64_t v26 = v47;
    uint64_t v27 = *(void (**)(void))(v47 + 16);
    sub_2530C3758();
    v27();
    uint64_t v40 = v1;
    sub_253277338();
    sub_2530C3758();
    v27();
    uint64_t v38 = v27;
    sub_2530C3758();
    v27();
    sub_252E76A5C((uint64_t)v22, &qword_269CBDE78);
    sub_253268390(&qword_269CBDE90, MEMORY[0x263F067E8]);
    char v28 = sub_253276C08();
    uint64_t v29 = *(void (**)(void))(v26 + 8);
    sub_252E99A7C();
    v29();
    sub_252E99A7C();
    uint64_t result = ((uint64_t (*)(void))v29)();
    if (v28)
    {
      uint64_t v37 = v29;
      uint64_t v30 = v45 + *(int *)(v46 + 48);
      uint64_t v31 = *(void (**)(void))(v47 + 32);
      sub_253268894();
      v31();
      uint64_t v36 = v30;
      sub_253268894();
      v31();
      uint64_t v32 = v38;
      sub_2530C3758();
      v32();
      sub_2530C3758();
      v32();
      uint64_t v33 = v43;
      sub_253268894();
      v31();
      uint64_t v34 = v37;
      sub_252E99A7C();
      v34();
      sub_253268894();
      v31();
      sub_253268894();
      v31();
      sub_253268894();
      v31();
      sub_252E99A7C();
      v34();
      uint64_t v35 = v44;
      sub_2532683D8(v33, v44);
      sub_253277378();
      return sub_252E76A5C(v35, &qword_269CBDE70);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *sub_253266D94(uint64_t *a1)
{
  sub_253273978();
  sub_252E76F94();
  uint64_t v153 = v4;
  uint64_t v154 = v3;
  MEMORY[0x270FA5388](v3);
  sub_252E770C0();
  uint64_t v157 = v5;
  sub_252E77258();
  uint64_t v138 = sub_253276018();
  sub_252E76F94();
  uint64_t v137 = v6;
  MEMORY[0x270FA5388](v7);
  sub_252E770C0();
  uint64_t v136 = v8;
  uint64_t v141 = sub_252E6FE84(&qword_269CB92F8);
  sub_252E76F94();
  uint64_t v140 = v9;
  MEMORY[0x270FA5388](v10);
  sub_252E770C0();
  uint64_t v139 = v11;
  sub_252E77258();
  uint64_t v135 = sub_2532760A8();
  sub_252E76F94();
  uint64_t v134 = v12;
  MEMORY[0x270FA5388](v13);
  sub_252E770C0();
  uint64_t v133 = v14;
  sub_252E77258();
  sub_25326E908();
  sub_252E76F94();
  uint64_t v150 = v16;
  uint64_t v151 = v15;
  MEMORY[0x270FA5388](v15);
  sub_252E770C0();
  uint64_t v149 = v17;
  uint64_t v18 = sub_252E6FE84(&qword_269CBBAD0);
  uint64_t v19 = sub_252E7733C(v18);
  MEMORY[0x270FA5388](v19);
  sub_252E770C0();
  uint64_t v148 = v20;
  sub_252E77258();
  sub_25326E588();
  sub_252E76F94();
  uint64_t v146 = v22;
  uint64_t v147 = v21;
  MEMORY[0x270FA5388](v21);
  sub_252E770C0();
  uint64_t v143 = v23;
  sub_252E77258();
  uint64_t v145 = sub_25326E5B8();
  sub_252E76F94();
  uint64_t v144 = v24;
  MEMORY[0x270FA5388](v25);
  sub_252E770C0();
  uint64_t v142 = v26;
  sub_252E77258();
  sub_2532760E8();
  sub_252E76F94();
  uint64_t v159 = v28;
  v160 = v27;
  MEMORY[0x270FA5388](v27);
  sub_252E77068();
  uint64_t v161 = v29;
  sub_252E7707C();
  MEMORY[0x270FA5388](v30);
  sub_252E7C96C();
  uint64_t v162 = v31;
  sub_252E77258();
  sub_253275E58();
  sub_252E76F94();
  uint64_t v155 = v33;
  uint64_t v156 = v32;
  MEMORY[0x270FA5388](v32);
  sub_252E77324();
  uint64_t v34 = sub_2532761A8();
  sub_252E76F94();
  uint64_t v36 = v35;
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v40 = (char *)&v130 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  v152 = (uint64_t *)((char *)&v130 - v41);
  sub_252E7707C();
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (uint64_t *)((char *)&v130 - v44);
  uint64_t v46 = sub_252E6FE84(&qword_269CB7D60);
  uint64_t v47 = sub_252E7733C(v46);
  MEMORY[0x270FA5388](v47);
  uint64_t v49 = (uint64_t *)((char *)&v130 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_253276178();
  uint64_t v50 = sub_253276658();
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0((uint64_t)v49, 1, v50) == 1)
  {
    sub_252E76A5C((uint64_t)v49, &qword_269CB7D60);
    uint64_t v51 = v36 + 16;
    v132 = *(void (**)(void))(v36 + 16);
    sub_2530C3758();
    v52();
    uint64_t v53 = sub_252EC5C28();
    int v55 = v54(v53);
    if (v55 == *MEMORY[0x263F804E8])
    {
      v131 = a1;
      uint64_t v155 = v36;
      uint64_t v156 = v34;
      uint64_t v56 = sub_252EC5C28();
      v57(v56);
      uint64_t v157 = *v45;
      uint64_t v58 = swift_projectBox();
      uint64_t v59 = v159;
      v60 = v160;
      v61 = *(void (**)(uint64_t, uint64_t, uint8_t *))(v159 + 16);
      uint64_t v62 = v162;
      v61(v162, v58, v160);
      v63 = (uint64_t **)v161;
      v61(v161, v62, v60);
      int v64 = (*(uint64_t (**)(uint64_t **, uint8_t *))(v59 + 88))(v63, v60);
      if (v64 == *MEMORY[0x263F80488])
      {
        (*(void (**)(uint64_t, uint8_t *))(v59 + 8))(v62, v60);
        (*(void (**)(uint64_t **, uint8_t *))(v59 + 96))(v63, v60);
        v65 = *v63;
LABEL_21:
        swift_release();
        return v65;
      }
      if (v64 == *MEMORY[0x263F80460])
      {
        uint64_t v75 = sub_253268878();
        v76(v75);
        uint64_t v77 = v149;
        uint64_t v51 = v150;
        sub_252EC5C28();
        uint64_t v78 = v151;
        sub_252EC5A7C();
        v79();
        uint64_t v80 = type metadata accessor for TypedValueFormatter(0);
        uint64_t v81 = sub_253267C10(v158, *(void *)(v158 + *(int *)(v80 + 20)), *(void *)(v158 + *(int *)(v80 + 20) + 8));
      }
      else
      {
        if (v64 != *MEMORY[0x263F80438])
        {
          if (v64 == *MEMORY[0x263F80410])
          {
            uint64_t v106 = sub_253268878();
            v107(v106);
            uint64_t v108 = v140;
            uint64_t v109 = v139;
            uint64_t v110 = v141;
            (*(void (**)(uint64_t, uint64_t **, uint64_t))(v140 + 32))(v139, v63, v141);
            id v111 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
            objc_msgSend(v111, sel_setUnitOptions_, 1);
            objc_msgSend(v111, sel_setUnitStyle_, 3);
            v112 = (void *)sub_25326E318();
            id v113 = objc_msgSend(v111, sel_stringFromUnit_, v112);

            uint64_t v161 = sub_253276CA8();
            sub_25326E338();

            v164[0] = sub_253268288();
            v164[1] = v114;
            sub_253276EA8();
            sub_25326FBC8();
            sub_253276EA8();
            swift_bridgeObjectRelease_n();
            v65 = (uint64_t *)v164[0];
            (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v109, v110);
            sub_252E99A7C();
            v115();
            goto LABEL_21;
          }
          if (v64 == *MEMORY[0x263F80420])
          {
            uint64_t v116 = sub_253268878();
            v117(v116);
            sub_2532688A4();
            uint64_t v118 = v136;
            uint64_t v119 = v138;
            sub_252EC5A7C();
            v120();
            v65 = (uint64_t *)sub_253267E40(v158);
            (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v118, v119);
            (*(void (**)(uint64_t, uint8_t *))(v59 + 8))(v62, v60);
            goto LABEL_21;
          }
          if (v64 != *MEMORY[0x263F80480])
          {
            if (v64 == *MEMORY[0x263F80470])
            {
              (*(void (**)(uint64_t, uint8_t *))(v59 + 8))(v62, v60);
              swift_release();
              return 0;
            }
            v65 = v131;
            sub_253276158();
            sub_252E7CABC();
            v127 = v132;
            sub_2530C3758();
            v127();
            if (!v62)
            {
              v65 = v152;
              sub_2530C3758();
              v127();
              sub_253276D28();
              sub_252E7CABC();
            }
            sub_252E77150();
            v128();
            v129 = *(void (**)(uint64_t, uint8_t *))(v59 + 8);
            v129(v162, v60);
            v129(v161, v60);
            goto LABEL_21;
          }
          uint64_t v121 = sub_253268878();
          v122(v121);
          sub_2532688A4();
          uint64_t v123 = sub_252EC5C28();
          v124(v123);
          v125 = (void *)sub_253276098();
          id v126 = objc_msgSend(v125, sel_displayName);

          v65 = (uint64_t *)sub_253276CA8();
          uint64_t v98 = v62;

          uint64_t v100 = sub_252EC5C28();
          goto LABEL_16;
        }
        uint64_t v94 = sub_253268878();
        v95(v94);
        sub_2532688A4();
        uint64_t v77 = v142;
        sub_252EC5C28();
        uint64_t v78 = v145;
        sub_252EC5A7C();
        v96();
        sub_25326E578();
        sub_2532668CC(v148);
        sub_252E77150();
        v97();
        uint64_t v81 = sub_253276D18();
      }
      v65 = (uint64_t *)v81;
      uint64_t v98 = v62;
      v99 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      uint64_t v100 = v77;
      uint64_t v101 = v78;
LABEL_16:
      v99(v100, v101);
      (*(void (**)(uint64_t, uint8_t *))(v59 + 8))(v98, v60);
      goto LABEL_21;
    }
    uint64_t v67 = v36;
    if (v55 == *MEMORY[0x263F804A0])
    {
      uint64_t v68 = sub_252EC5C28();
      v69(v68);
      uint64_t v70 = swift_projectBox();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v155 + 16))(v1, v70, v156);
      v65 = (uint64_t *)sub_253275E48();
      MEMORY[0x270FA5388](v65);
      *(&v130 - 2) = v158;
      v71 = v163;
      sub_253047354((void (*)(uint64_t *__return_ptr, uint64_t))sub_253268374, (uint64_t)(&v130 - 4), (uint64_t)v65);
      if (!v71)
      {
        uint64_t v103 = v72;
        swift_bridgeObjectRelease();
        v164[0] = v103;
        sub_252E6FE84(&qword_26B240400);
        sub_252E9834C();
        v65 = v164;
        sub_253276BF8();
        sub_252E7CABC();
        swift_bridgeObjectRelease();
        uint64_t v104 = sub_2532688B4();
        v105(v104);
        goto LABEL_21;
      }
      swift_bridgeObjectRelease();
      uint64_t v73 = sub_2532688B4();
      v74(v73);
      swift_release();
    }
    else
    {
      sub_253271EF8();
      v82 = (uint64_t *)v34;
      v83 = v132;
      sub_2530C3758();
      v83();
      v84 = sub_253273968();
      os_log_type_t v85 = sub_253277428();
      v163 = v84;
      LODWORD(v162) = v85;
      BOOL v86 = os_log_type_enabled(v84, v85);
      v131 = a1;
      if (v86)
      {
        v87 = (uint8_t *)swift_slowAlloc();
        uint64_t v161 = swift_slowAlloc();
        v164[0] = v161;
        *(_DWORD *)v87 = 136315138;
        v160 = v87 + 4;
        sub_2530C3758();
        v83();
        uint64_t v88 = sub_253276D28();
        v164[2] = sub_252E71344(v88, v89, v164);
        sub_253277628();
        swift_bridgeObjectRelease();
        v90 = *(void (**)(char *, uint64_t *))(v67 + 8);
        v90(v40, v82);
        v91 = v163;
        _os_log_impl(&dword_252E65000, v163, (os_log_type_t)v162, "Unsupported type %s", v87, 0xCu);
        uint64_t v92 = v161;
        swift_arrayDestroy();
        MEMORY[0x2533D8A00](v92, -1, -1);
        MEMORY[0x2533D8A00](v87, -1, -1);
      }
      else
      {
        v90 = *(void (**)(char *, uint64_t *))(v67 + 8);
        v90(v40, v82);
      }
      sub_252E77150();
      v93();
      v65 = v82;
      type metadata accessor for TypedValueFormatterError(0);
      sub_253268390(&qword_269CBDE60, (void (*)(uint64_t))type metadata accessor for TypedValueFormatterError);
      swift_allocError();
      sub_2530C3758();
      v83();
      swift_willThrow();
      v90((char *)v45, v82);
    }
  }
  else
  {
    v65 = v49;
    sub_253276618();
    sub_252E7CABC();
    sub_252E77150();
    v66();
  }
  return v65;
}

uint64_t type metadata accessor for TypedValueFormatterError(uint64_t a1)
{
  return sub_252E71BA4(a1, (uint64_t *)&unk_269CBDEA0);
}

uint64_t sub_253267BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_253266D94();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t sub_253267C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_252E6FE84(&qword_269CBCE20);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  sub_253270F48();
  swift_allocObject();
  sub_253270F38();
  sub_25326E8A8();
  sub_253270F08();
  if (a3)
  {
    sub_25326FBC8();
    sub_253271018();
    uint64_t v10 = sub_253271048();
    _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v9, 0, 1, v10);
    sub_253270F28();
  }
  sub_253270F18();
  sub_253270FB8();
  sub_25326E978();
  sub_253270F98();
  sub_253270EE8();
  sub_253270EF8();
  uint64_t v11 = sub_253271048();
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0((uint64_t)v7, 1, v11) == 1)
  {
    swift_release();
    swift_release();
    sub_252E76A5C((uint64_t)v7, &qword_269CBCE20);
    return 0;
  }
  else
  {
    uint64_t v12 = sub_253271028();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v7, v11);
  }
  return v12;
}

uint64_t sub_253267E40(uint64_t a1)
{
  v21[2] = a1;
  uint64_t v1 = sub_252E6FE84(&qword_269CBCE20);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253270F68();
  swift_allocObject();
  v21[0] = sub_253270F58();
  unint64_t v4 = sub_253276008();
  int v5 = v4;
  __int16 v7 = v6;
  __int16 v9 = v8;
  unint64_t v10 = HIDWORD(v4);
  unint64_t v11 = HIWORD(v4);
  unint64_t v12 = v6 >> 16;
  unint64_t v13 = HIDWORD(v6);
  unint64_t v14 = HIWORD(v6);
  unsigned int v15 = HIWORD(v8);
  id v16 = objc_allocWithZone(MEMORY[0x263F087B0]);
  int v22 = v5;
  __int16 v23 = v10;
  __int16 v24 = v11;
  __int16 v25 = v7;
  __int16 v26 = v12;
  __int16 v27 = v13;
  __int16 v28 = v14;
  __int16 v29 = v9;
  __int16 v30 = v15;
  id v17 = objc_msgSend(v16, sel_initWithDecimal_, &v22);
  objc_msgSend(v17, sel_doubleValue);

  sub_253270ED8();
  swift_release();
  sub_253275FE8();
  sub_253270EC8();
  swift_release();
  swift_bridgeObjectRelease();
  sub_253270EB8();
  swift_release();
  sub_253270FB8();
  swift_retain();
  sub_25326E978();
  sub_253270F98();
  sub_253270EA8();
  swift_release();
  sub_253270F78();
  uint64_t v18 = sub_253271048();
  if (_s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0((uint64_t)v3, 1, v18) == 1)
  {
    swift_release();
    sub_252E76A5C((uint64_t)v3, &qword_269CBCE20);
    return 0;
  }
  else
  {
    uint64_t v19 = sub_253271028();
    swift_release();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v3, v18);
  }
  return v19;
}

uint64_t sub_2532680D0()
{
  uint64_t v2 = type metadata accessor for TypedValueFormatterError(0);
  uint64_t v3 = sub_252E7733C(v2);
  MEMORY[0x270FA5388](v3);
  sub_252E77324();
  sub_253268814(v1, v0);
  sub_2532761A8();
  sub_252E77000();
  sub_252E77150();
  v4();
  return 0;
}

uint64_t sub_25326815C(uint64_t a1)
{
  uint64_t v2 = sub_253268390(qword_269CBDEB0, (void (*)(uint64_t))type metadata accessor for TypedValueFormatterError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_2532681C8(uint64_t a1)
{
  uint64_t v2 = sub_253268390(qword_269CBDEB0, (void (*)(uint64_t))type metadata accessor for TypedValueFormatterError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_253268234()
{
  uint64_t v0 = qword_269CBDE40;
  sub_25326FBC8();
  return v0;
}

uint64_t sub_25326826C()
{
  return 0;
}

uint64_t sub_253268288()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v0, sel_setMinimumFractionDigits_, 0);
  objc_msgSend(v0, sel_setMaximumFractionDigits_, 2);
  objc_msgSend(v0, sel_setNumberStyle_, 1);
  uint64_t v1 = (void *)sub_253277218();
  id v2 = objc_msgSend(v0, sel_stringFromNumber_, v1);

  if (v2)
  {
    uint64_t v3 = sub_253276CA8();
  }
  else
  {

    return 6369134;
  }
  return v3;
}

uint64_t sub_253268374@<X0>(uint64_t *a1@<X8>)
{
  return sub_253267BE0(a1);
}

uint64_t sub_253268390(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2532683D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252E6FE84(&qword_269CBDE70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_253268440(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = sub_2532761A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_2532684F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2532761A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_253268554(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2532761A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2532685B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2532761A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25326861C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2532761A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_253268680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252E6FE84(&qword_269CBDE98);
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(a1, a2, v4);
}

uint64_t sub_2532686CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252E6FE84(&qword_269CBDE98);
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(a1, a2, a3, v6);
}

uint64_t sub_253268728(uint64_t a1)
{
  uint64_t result = sub_2532761A8();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t sub_2532687CC()
{
  return sub_253268390(&qword_269CBDE60, (void (*)(uint64_t))type metadata accessor for TypedValueFormatterError);
}

uint64_t sub_253268814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TypedValueFormatterError(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_253268878()
{
  return v0;
}

uint64_t sub_2532688B4()
{
  return v0;
}

uint64_t Bool.init(level:)(void *a1)
{
  if (objc_msgSend(a1, sel_levelOneOfCase) == 10)
  {
    id v2 = objc_msgSend(a1, sel_BOOLeanValue);
  }
  else
  {

    return 2;
  }
  return (uint64_t)v2;
}

uint64_t sub_253268928@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = Bool.init(level:)(a1);
  *a2 = result;
  return result;
}

id Int.init(level:)(void *a1)
{
  if (objc_msgSend(a1, sel_levelOneOfCase) == 13)
  {
    id v2 = objc_msgSend(a1, sel_longValue);
  }
  else if (objc_msgSend(a1, sel_levelOneOfCase) == 12)
  {
    LODWORD(v2) = objc_msgSend(a1, sel_intValue);

    return (id)(int)v2;
  }
  else
  {

    return 0;
  }
  return v2;
}

id sub_2532689EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result = Int.init(level:)(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t dispatch thunk of ConvertableFromTrialLevel.init(level:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_253268A30()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_253268ACC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    unint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    sub_25326FBC8();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_253268BD4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_253268C48(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  sub_25326FBC8();
  v6(v8, v9, v5);
  return a1;
}

void *sub_253268CD8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_25326FBC8();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_253268D70(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_253268DE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_253268E68(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(((unint64_t)a1 + v7 + 16) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_253268FF8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x253269244);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v20 = (unint64_t)&a1[v10 + 16] & ~v10;
          _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v20, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for TrialFactor()
{
  return sub_252E9F88C();
}

void *sub_253269284(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 72);
  uint64_t v6 = *(void *)(v5 + 16);
  sub_25326FBC8();
  if (v6 && (uint64_t v7 = sub_25305D284(a1, a2), (v8 & 1) != 0))
  {
    unsigned int v9 = *(void **)(*(void *)(v5 + 56) + 8 * v7);
    id v10 = v9;
  }
  else
  {
    unsigned int v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_253269318()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  sub_252E983FC(v0 + 4, v1);
  unint64_t v3 = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(v2 + 8))(v0[2], v0[3], v1, v2);
  sub_252FB3C1C(0, &qword_26B240430);
  uint64_t v4 = (void *)sub_253276B38();
  if (!(v3 >> 62))
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_25326FBC8();
    if (v5) {
      goto LABEL_3;
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v4;
  }
LABEL_27:
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_253277A38();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_23;
  }
LABEL_3:
  unint64_t v6 = v3 & 0xC000000000000001;
  uint64_t v7 = 4;
  uint64_t v29 = v5;
  unint64_t v30 = v3;
  unint64_t v28 = v3 & 0xC000000000000001;
  while (1)
  {
    if (v6) {
      id v8 = (id)MEMORY[0x2533D77E0](v7 - 4, v3);
    }
    else {
      id v8 = *(id *)(v3 + 8 * v7);
    }
    unsigned int v9 = v8;
    uint64_t v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    id v11 = objc_msgSend(v8, sel_factor);
    if (!v11) {
      break;
    }
    uint64_t v12 = sub_25326A21C(v11);
    if (v13)
    {
      uint64_t v14 = v12;
      uint64_t v15 = v13;
      id v16 = objc_msgSend(v9, sel_level);
      if (v16)
      {
        id v31 = v16;
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v17 = sub_25305D284(v14, v15);
        if (__OFADD__(v4[2], (v18 & 1) == 0)) {
          goto LABEL_25;
        }
        unint64_t v3 = v17;
        char v19 = v18;
        sub_252E6FE84(&qword_26B240448);
        if (sub_2532779C8())
        {
          uint64_t v20 = sub_25305D284(v14, v15);
          if ((v19 & 1) != (v21 & 1)) {
            goto LABEL_30;
          }
          unint64_t v3 = v20;
        }
        if (v19)
        {
          uint64_t v22 = v4[7];

          *(void *)(v22 + 8 * v3) = v31;
        }
        else
        {
          v4[(v3 >> 6) + 8] |= 1 << v3;
          __int16 v23 = (uint64_t *)(v4[6] + 16 * v3);
          uint64_t *v23 = v14;
          v23[1] = v15;
          *(void *)(v4[7] + 8 * v3) = v31;
          uint64_t v24 = v4[2];
          BOOL v25 = __OFADD__(v24, 1);
          uint64_t v26 = v24 + 1;
          if (v25) {
            goto LABEL_26;
          }
          v4[2] = v26;
          sub_25326FBC8();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v5 = v29;
        unint64_t v3 = v30;
        unint64_t v6 = v28;
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
    ++v7;
    if (v10 == v5) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_30:
  uint64_t result = sub_253277D38();
  __break(1u);
  return result;
}

void sub_253269608(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  BOOL v25 = v1 + 4;
  sub_252E983FC(v1 + 4, v4);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  id v8 = (void *)(*(uint64_t (**)(void, void, uint64_t, uint64_t))(v5 + 24))(v2[2], v2[3], v4, v5);
  unsigned int v9 = v8;
  if (v8)
  {
    uint64_t v24 = (int)objc_msgSend(v8, sel_deploymentId);
    sub_25326FBC8();
    id v10 = objc_msgSend(v9, sel_experimentId);
    uint64_t v11 = sub_253276CA8();
    uint64_t v22 = v12;
    uint64_t v23 = v11;

    id v13 = objc_msgSend(v9, sel_treatmentId);
    uint64_t v14 = sub_253276CA8();
    uint64_t v16 = v15;

    uint64_t v17 = v9;
  }
  else
  {
    sub_25326FBC8();
    uint64_t v17 = 0;
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  BOOL v18 = v9 == 0;
  uint64_t v20 = v2[7];
  uint64_t v19 = v2[8];
  sub_252E983FC(v25, v20);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 32))(v6, v7, v20, v19);

  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v23;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v14;
  *(void *)(a1 + 40) = v16;
  *(void *)(a1 + 48) = v24;
  *(unsigned char *)(a1 + 56) = v18;
  *(_DWORD *)(a1 + 60) = v21;
}

uint64_t sub_2532697A0(uint64_t a1)
{
  uint64_t v2 = sub_253273978();
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v28 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  sub_2532777E8();
  sub_253276EA8();
  sub_25326FBC8();
  sub_253276EA8();
  swift_bridgeObjectRelease();
  sub_253276EA8();
  v30[0] = *(void *)(a1 + 16);
  sub_253277C98();
  sub_253276EA8();
  swift_bridgeObjectRelease();
  sub_253276EA8();
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = sub_25326FBC8();
  int64_t v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    v30[0] = 34;
    v30[1] = 0xE100000000000000;
    sub_25326FBC8();
    id v17 = v16;
    sub_253276EA8();
    swift_bridgeObjectRelease();
    sub_253276EA8();
    id v18 = objc_msgSend(v17, sel_description);
    sub_253276CA8();

    sub_253276EA8();
    swift_bridgeObjectRelease();
    sub_253276EA8();
    sub_253276EA8();

    uint64_t result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      return result;
    }
    if (v13 >= v8) {
      goto LABEL_21;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v8) {
        goto LABEL_21;
      }
      unint64_t v14 = *(void *)(v4 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v8) {
          goto LABEL_21;
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 < v8)
  {
    unint64_t v14 = *(void *)(v4 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v10 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_26;
        }
        if (v10 >= v8) {
          goto LABEL_21;
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        ++v15;
        if (v14) {
          goto LABEL_18;
        }
      }
    }
    int64_t v10 = v15;
    goto LABEL_18;
  }
LABEL_21:
  swift_release();
  uint64_t v19 = v28;
  sub_253271F38();
  uint64_t v21 = v31;
  unint64_t v20 = v32;
  sub_25326FBC8();
  uint64_t v22 = sub_253273968();
  os_log_type_t v23 = sub_253277418();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v30[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    sub_25326FBC8();
    uint64_t v29 = sub_252E71344(v21, v20, v30);
    sub_253277628();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252E65000, v22, v23, "%s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533D8A00](v25, -1, -1);
    MEMORY[0x2533D8A00](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v19, v27);
}

uint64_t sub_253269C1C(char a1)
{
  uint64_t v2 = v1;
  sub_252FB3C1C(0, &qword_26B240430);
  *(void *)(v2 + 72) = sub_253276B38();
  unint64_t v4 = 0x80000002532966A0;
  if ((a1 & 1) == 0) {
    unint64_t v4 = 0x8000000253290B50;
  }
  *(_OWORD *)(v2 + 80) = xmmword_253279960;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(void *)(v2 + 16) = 0xD000000000000021;
  *(void *)(v2 + 24) = v4;
  id v5 = objc_msgSend(self, sel_clientWithIdentifier_, 336);
  uint64_t v6 = sub_252FB3C1C(0, &qword_26B240438);
  *(void *)(v2 + 56) = v6;
  *(void *)(v2 + 64) = &off_270336160;
  *(void *)(v2 + 32) = v5;
  sub_252E983FC((void *)(v2 + 32), v6);
  sub_253269EC0();
  uint64_t v7 = sub_253269318();
  swift_beginAccess();
  *(void *)(v2 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_25326FBC8();
  sub_2532697A0(v8);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_253269D88()
{
  swift_bridgeObjectRelease();
  _s30IntelligenceFlowPlannerRuntime34FullPlannerGrammarGeneratorHelpersO19CLIGrammarGeneratorVwxx_0(v0 + 32);
  swift_bridgeObjectRelease();
  sub_2530E98F4(*(void *)(v0 + 80), *(void *)(v0 + 88));
  return v0;
}

uint64_t sub_253269DCC()
{
  sub_253269D88();
  return swift_deallocClassInstance();
}

uint64_t sub_253269E00()
{
  return sub_253269E24();
}

uint64_t sub_253269E24()
{
  uint64_t v1 = (void *)sub_253276C78();
  id v2 = objc_msgSend(v0, sel_factorLevelsWithNamespaceName_, v1);

  sub_252FB3C1C(0, &qword_26B240420);
  uint64_t v3 = sub_253277098();

  return v3;
}

id sub_253269E9C()
{
  return sub_253269EC0();
}

id sub_253269EC0()
{
  return objc_msgSend(v0, sel_refresh);
}

id sub_253269ED0()
{
  return sub_253269EF4();
}

id sub_253269EF4()
{
  uint64_t v1 = (void *)sub_253276C78();
  id v2 = objc_msgSend(v0, sel_experimentIdentifiersWithNamespaceName_, v1);

  return v2;
}

id sub_253269F40()
{
  return sub_25326A1D8();
}

uint64_t type metadata accessor for TrialManager()
{
  return self;
}

uint64_t initializeWithCopy for TrialEnrollment(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  sub_25326FBC8();
  sub_25326FBC8();
  sub_25326FBC8();
  return a1;
}

uint64_t assignWithCopy for TrialEnrollment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_25326FBC8();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_25326FBC8();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_25326FBC8();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  return a1;
}

uint64_t assignWithTake for TrialEnrollment(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialEnrollment(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TrialEnrollment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for TrialEnrollment()
{
  return &type metadata for TrialEnrollment;
}

id sub_25326A1D8()
{
  uint64_t v1 = (void *)sub_253276C78();
  id v2 = objc_msgSend(v0, sel_compatibilityVersionWithNamespaceName_, v1);

  return v2;
}

uint64_t sub_25326A21C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_name);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_253276CA8();

  return v3;
}

uint64_t sub_25326A28C()
{
  uint64_t v0 = sub_252E6FE84(&qword_26B2400D8);
  MEMORY[0x270FA5388](v0 - 8);
  sub_25326E918();
  swift_bridgeObjectRelease();
  return sub_2532737D8();
}

uint64_t sub_25326A35C(char a1, uint64_t a2, void *a3)
{
  uint64_t v120 = a2;
  sub_253273978();
  sub_252E76F94();
  uint64_t v135 = v6;
  uint64_t v136 = v5;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unsigned int v9 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v125 = (char *)&v108 - v10;
  uint64_t v11 = sub_252E6FE84(&qword_269CBBA18);
  uint64_t v12 = sub_252E7733C(v11);
  MEMORY[0x270FA5388](v12);
  sub_252E770C0();
  uint64_t v122 = v13;
  uint64_t v14 = sub_252E6FE84(&qword_269CBDF38);
  uint64_t v15 = sub_252E7733C(v14);
  MEMORY[0x270FA5388](v15);
  sub_252E770C0();
  uint64_t v121 = v16;
  uint64_t v17 = sub_252E6FE84(&qword_269CBBA28);
  uint64_t v18 = sub_252E7733C(v17);
  MEMORY[0x270FA5388](v18);
  sub_252E770C0();
  uint64_t v119 = v19;
  uint64_t v124 = sub_253272EA8();
  sub_252E76F94();
  uint64_t v123 = v20;
  MEMORY[0x270FA5388](v21);
  sub_252E770C0();
  uint64_t v132 = v22;
  uint64_t v118 = sub_2532729F8();
  sub_252E76F94();
  uint64_t v131 = v23;
  MEMORY[0x270FA5388](v24);
  sub_252E770C0();
  uint64_t v126 = v25;
  sub_253272C18();
  sub_252E76F94();
  uint64_t v129 = v27;
  uint64_t v130 = v26;
  MEMORY[0x270FA5388](v26);
  sub_252E770C0();
  uint64_t v134 = v28;
  uint64_t v29 = sub_252E6FE84(&qword_269CBBA30);
  uint64_t v30 = sub_252E7733C(v29);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v108 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v108 - v34;
  uint64_t v36 = sub_252E6FE84(&qword_26B2400D8);
  uint64_t v37 = sub_252E7733C(v36);
  MEMORY[0x270FA5388](v37);
  uint64_t v39 = (char *)&v108 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253272BD8();
  sub_252E76F94();
  uint64_t v127 = v41;
  uint64_t v128 = v40;
  MEMORY[0x270FA5388](v40);
  sub_252E770C0();
  uint64_t v133 = v42;
  uint64_t v43 = sub_253269284(0x6874617065646F63, 0xEB00000000736469);
  if (!v43) {
    goto LABEL_9;
  }
  uint64_t v44 = sub_25326B020(v43);
  if (!v45) {
    goto LABEL_9;
  }
  int v46 = a1 & 1;
  v138[0] = v44;
  v138[1] = v45;
  unint64_t v47 = (a1 & 1) != 0 ? 0x8000000253296700 : 0x8000000253296730;
  v139[0] = 0xD000000000000024;
  v139[1] = v47;
  sub_252E86EE0();
  char v48 = sub_2532776A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48)
  {
    id v111 = v35;
    v112 = v33;
    int v113 = v46;
    uint64_t v49 = a3[10];
    uint64_t v50 = a3[11];
    uint64_t v117 = a3[12];
    uint64_t v51 = a3[14];
    uint64_t v116 = a3[13];
    uint64_t v52 = a3[15];
    sub_253273768();
    uint64_t v114 = v49;
    uint64_t v115 = v50;
    sub_25326B148();
    sub_25326B090(v53, v54);
    sub_253110014();
    uint64_t v55 = v137;
    sub_2532737A8();
    if (v55)
    {
      sub_25326B148();
      return sub_2530E98F4(v56, v57);
    }
    else
    {
      uint64_t v108 = v52;
      uint64_t v62 = v114;
      uint64_t v109 = v51;
      unint64_t v110 = v47;
      sub_253272BC8();
      sub_25326E948();
      uint64_t v63 = sub_25326E958();
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v39, 0, 1, v63);
      sub_253272BB8();
      uint64_t v64 = sub_2532737F8();
      MEMORY[0x270FA5388](v64);
      sub_25326B164();
      *(void *)(v65 - 16) = v120;
      sub_253273868();
      uint64_t v137 = 0;
      uint64_t v66 = sub_25326B174();
      uint64_t v67 = v64;
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v66, v68, v69, v64);
      sub_253272BA8();
      sub_253272C08();
      uint64_t v70 = v126;
      sub_2532729E8();
      uint64_t v71 = v115;
      LOBYTE(v139[0]) = v115 == 1;
      sub_2532729D8();
      uint64_t v72 = v70;
      sub_2532729A8();
      if (v71 == 1)
      {
        sub_2532729B8();
      }
      else
      {
        sub_25326FBC8();
        sub_2532729B8();
        sub_25326FBC8();
      }
      sub_2532729C8();
      if (v71 == 1 || (uint64_t v73 = v108, sub_25326FBC8(), v74 = v109, v75 = sub_2530E98F4(v62, v71), !v73))
      {
        sub_25326B184();
        uint64_t v77 = v67;
      }
      else
      {
        MEMORY[0x270FA5388](v75);
        sub_25326B164();
        *(void *)(v76 - 16) = v74;
        *(void *)(v76 - 8) = v73;
        uint64_t v77 = v67;
        uint64_t v78 = v137;
        sub_253273868();
        uint64_t v137 = v78;
        swift_bridgeObjectRelease();
        uint64_t v79 = sub_25326B174();
        _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v79, v80, v81, v67);
        sub_253272998();
        sub_25326B184();
      }
      MEMORY[0x270FA5388](v82);
      sub_25326B164();
      *(unsigned char *)(v83 - 16) = v84;
      uint64_t v85 = v137;
      sub_253273868();
      uint64_t v137 = v85;
      uint64_t v86 = sub_25326B174();
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v86, v87, v88, v77);
      uint64_t v89 = v134;
      sub_253272BF8();
      sub_252E6FE84(&qword_269CBDF40);
      uint64_t v90 = v131;
      unint64_t v91 = (*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80);
      uint64_t v92 = swift_allocObject();
      *(_OWORD *)(v92 + 16) = xmmword_253278DA0;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v90 + 16))(v92 + v91, v72, v71);
      sub_253272BE8();
      sub_253272E98();
      uint64_t v93 = v128;
      uint64_t v94 = v119;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 16))(v119, v133, v128);
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v94, 0, 1, v93);
      sub_253272908();
      uint64_t v95 = v130;
      uint64_t v96 = v121;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v121, v89, v130);
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v96, 0, 1, v95);
      sub_253272C68();
      uint64_t v97 = v122;
      sub_2532737B8();
      uint64_t v98 = sub_2532737C8();
      _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(v97, 0, 1, v98);
      sub_253272E88();
      sub_253271E58();
      v99 = sub_253273968();
      os_log_type_t v100 = sub_253277418();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = (uint8_t *)swift_slowAlloc();
        uint64_t v102 = swift_slowAlloc();
        v139[0] = v102;
        *(_DWORD *)uint64_t v101 = 136315138;
        v139[4] = sub_252E71344(0xD000000000000024, v110, v139);
        sub_253277628();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_252E65000, v99, v100, "Emitting triggered log for codepathid %s", v101, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533D8A00](v102, -1, -1);
        MEMORY[0x2533D8A00](v101, -1, -1);
      }

      sub_252E77150();
      v103();
      sub_252E983FC(v138, v138[3]);
      sub_253273858();
      sub_252E77150();
      v104();
      sub_252E77150();
      v105();
      sub_252E77150();
      v106();
      sub_252E77150();
      v107();
      return _s30IntelligenceFlowPlannerRuntime34FullPlannerGrammarGeneratorHelpersO19CLIGrammarGeneratorVwxx_0((uint64_t)v138);
    }
  }
  else
  {
LABEL_9:
    sub_253271E58();
    uint64_t v59 = sub_253273968();
    os_log_type_t v60 = sub_253277418();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_252E65000, v59, v60, "Not emitting triggered log as the device is not enrolled in an experiment with the necessary codepathid", v61, 2u);
      MEMORY[0x2533D8A00](v61, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v135 + 8))(v9, v136);
  }
}

uint64_t sub_25326AE90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_252E6FE84(&qword_26B2400D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25326E958();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v5, a2, v6);
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v5, 0, 1, v6);
  return sub_2532737D8();
}

uint64_t sub_25326AF78()
{
  uint64_t v0 = sub_252E6FE84(&qword_26B2400D8);
  MEMORY[0x270FA5388](v0 - 8);
  sub_25326E918();
  return sub_2532737D8();
}

uint64_t sub_25326B020(void *a1)
{
  id v2 = objc_msgSend(a1, sel_stringValue);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_253276CA8();

  return v3;
}

uint64_t sub_25326B090(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    sub_25326FBC8();
    sub_25326FBC8();
    return sub_25326FBC8();
  }
  return result;
}

uint64_t sub_25326B0E4(uint64_t a1)
{
  return sub_25326AE90(a1, *(void *)(v1 + 16));
}

uint64_t sub_25326B100()
{
  return sub_25326A28C();
}

uint64_t sub_25326B11C()
{
  return sub_25326AF78();
}

ValueMetadata *type metadata accessor for JointResolverBiomeLogger()
{
  return &type metadata for JointResolverBiomeLogger;
}

uint64_t sub_25326B174()
{
  return v0;
}

uint64_t PlannerService.description.getter()
{
  return sub_253276D28();
}

uint64_t static PlannerService.isEnabled()()
{
  return 1;
}

uint64_t PlannerServiceContext.contextId.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25326E958();
  sub_252E77000();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t PlannerServiceContext.planCycleId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PlannerServiceContext() + 20);
  sub_25326E958();
  sub_252E77000();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for PlannerServiceContext()
{
  uint64_t result = qword_269CBDF58;
  if (!qword_269CBDF58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PlannerServiceContext.init(contextId:planCycleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25326E958();
  sub_252E77000();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v10(a3, a1, v6);
  uint64_t v8 = a3 + *(int *)(type metadata accessor for PlannerServiceContext() + 20);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v10)(v8, a2, v6);
}

uint64_t dispatch thunk of PlannerService.setup(sessionState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2530159F8;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PlannerService.handle(_:plannerServiceContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  unsigned int v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unsigned int v9 = v4;
  v9[1] = sub_25326B5A8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25326B5A8(uint64_t a1)
{
  sub_252E996B8();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of PlannerService.telemetryTarget.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static PlannerService.isEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t *initializeBufferWithCopyOfBuffer for PlannerServiceContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25326E958();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for PlannerServiceContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25326E958();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  return v7(v5, v4);
}

uint64_t initializeWithCopy for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326E958();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326E958();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326E958();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25326E958();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25326BAA4);
}

uint64_t sub_25326BAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25326E958();
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwet_0(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PlannerServiceContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25326BB00);
}

uint64_t sub_25326BB00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25326E958();
  return _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0(a1, a2, a2, v4);
}

uint64_t sub_25326BB4C()
{
  uint64_t result = sub_25326E958();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t ToolboxResources.makeQueryableToolbox()()
{
  uint64_t v1 = sub_2532757F8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252E6FE84(&qword_26B2400D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253274578();
  v11[3] = (uint64_t)&type metadata for PlannerToolboxDelegate;
  v11[4] = sub_25326BD70();
  PlannerToolboxDelegate.init()(v11);
  uint64_t v8 = sub_25326E738();
  _s30IntelligenceFlowPlannerRuntime21SearchToolUnwrapErrorOwst_0((uint64_t)v7, 1, 1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC30IntelligenceFlowPlannerRuntime16ToolboxResources_toolbox, v1);
  sub_25326BDBC();
  return sub_253274558();
}

unint64_t sub_25326BD70()
{
  unint64_t result = qword_269CBDF68;
  if (!qword_269CBDF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDF68);
  }
  return result;
}

unint64_t sub_25326BDBC()
{
  unint64_t result = qword_269CBDF70;
  if (!qword_269CBDF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CBDF70);
  }
  return result;
}

uint64_t ToolboxResources.__allocating_init(toolbox:)()
{
  uint64_t v0 = swift_allocObject();
  sub_2532757F8();
  sub_252E77000();
  uint64_t v1 = sub_25326C148();
  v2(v1);
  return v0;
}

uint64_t ToolboxResources.init(toolbox:)()
{
  sub_2532757F8();
  sub_252E77000();
  uint64_t v1 = sub_25326C148();
  v2(v1);
  return v0;
}

uint64_t ToolboxResources.toolbox.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC30IntelligenceFlowPlannerRuntime16ToolboxResources_toolbox;
  sub_2532757F8();
  sub_252E77000();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t ToolboxResources.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC30IntelligenceFlowPlannerRuntime16ToolboxResources_toolbox;
  sub_2532757F8();
  sub_252E77000();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t ToolboxResources.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC30IntelligenceFlowPlannerRuntime16ToolboxResources_toolbox;
  sub_2532757F8();
  sub_252E77000();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return swift_deallocClassInstance();
}

uint64_t sub_25326C03C()
{
  return type metadata accessor for ToolboxResources();
}

uint64_t type metadata accessor for ToolboxResources()
{
  uint64_t result = qword_26B23E870;
  if (!qword_26B23E870) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25326C08C()
{
  uint64_t result = sub_2532757F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ToolboxResources(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolboxResources);
}

uint64_t dispatch thunk of ToolboxResources.__allocating_init(toolbox:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_25326C148()
{
  return v0;
}

void sub_25326C1C8()
{
}

id sub_25326C1D4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73656C707574 && a2 == 0xE600000000000000;
  if (v3 || (sub_253277CF8() & 1) != 0)
  {
    uint64_t v6 = v2 + 2;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v8 = a1 == 0x6F43656369766564 && a2 == 0xED0000747865746ELL;
  if (v8 || (sub_252F5F1F4(), (sub_253277CF8() & 1) != 0))
  {
    uint64_t v6 = v2 + 3;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0xD000000000000015 && (sub_2532535B8(), v3) || (sub_25326CAC8() & 1) != 0)
  {
    uint64_t v6 = v2 + 4;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0xD00000000000001CLL && (sub_2532535B8(), v3) || (sub_25326CAC8() & 1) != 0)
  {
    uint64_t v6 = v2 + 5;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0xD00000000000001BLL && (sub_2532535B8(), v3) || (sub_25326CAC8() & 1) != 0)
  {
    uint64_t v6 = v2 + 6;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0xD000000000000010 && (sub_2532535B8(), v3) || (sub_25326CAEC() & 1) != 0)
  {
    uint64_t v6 = v2 + 7;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v9 = a1 == 0x6576654C6B736972 && a2 == 0xE90000000000006CLL;
  if (v9 || (sub_252F5F1F4(), (sub_253277CF8() & 1) != 0))
  {
    uint64_t v6 = v2 + 8;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0xD000000000000010 && (sub_2532535B8(), v3) || (sub_25326CAEC() & 1) != 0)
  {
    uint64_t v6 = v2 + 9;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v10 = a1 == 0x6574656D61726170 && a2 == 0xED00006570795472;
  if (v10 || (sub_252F5F1F4(), (sub_253277CF8() & 1) != 0))
  {
    uint64_t v6 = v2 + 10;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v11 = a1 == 0x5079646165726C61 && a2 == 0xEF646574706D6F72;
  if (v11 || (sub_252F5F1F4(), (sub_253277CF8() & 1) != 0))
  {
    uint64_t v6 = v2 + 11;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  BOOL v12 = a1 == 0x6E656E6F706D6F63 && a2 == 0xE900000000000074;
  if (v12 || (sub_252F5F1F4(), (sub_253277CF8() & 1) != 0))
  {
    uint64_t v6 = v2 + 12;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  return 0;
}

uint64_t sub_25326C538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  *(void *)(v10 + 32) = a3;
  *(void *)(v10 + 40) = a4;
  *(void *)(v10 + 48) = a5;
  *(void *)(v10 + 56) = a6;
  *(void *)(v10 + 64) = a7;
  *(void *)(v10 + 72) = a8;
  *(_OWORD *)(v10 + 80) = a9;
  *(void *)(v10 + 96) = a10;
  return v10;
}

id *sub_25326C560()
{
  return v0;
}

uint64_t sub_25326C5D0()
{
  sub_25326C560();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PlanResolutionModelInput()
{
  return self;
}

void sub_25326C628()
{
}

void sub_25326C63C()
{
}

void sub_25326C654()
{
}

void sub_25326C668()
{
}

void sub_25326C684()
{
}

void sub_25326C69C()
{
}

void sub_25326C6BC()
{
}

void sub_25326C6DC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_253276C78();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  id v4 = objc_msgSend(v3, sel_multiArrayValue);

  if (!v4) {
LABEL_5:
  }
    __break(1u);
}

uint64_t sub_25326C7C8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_featureNames);
  uint64_t v2 = sub_253277288();

  return v2;
}

id sub_25326C820()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_253276C78();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  return v3;
}

id sub_25326C888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_253276CA8();
  uint64_t v7 = v6;
  swift_retain();
  BOOL v8 = (void *)a4(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t type metadata accessor for PlanResolutionModelOutput()
{
  return self;
}

uint64_t sub_25326C928(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00DC8]), sel_init);
  uint64_t v3 = sub_25326C994(a1, (uint64_t)v2);

  return v3;
}

uint64_t sub_25326C994(uint64_t a1, uint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  id v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  id v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for PlanResolutionModelOutput();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v8;
    id v9 = v7;
  }
  else
  {
    id v10 = v12[0];
    sub_25326E628();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_25326CA6C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PlanResolutionModel()
{
  return self;
}

uint64_t sub_25326CAC8()
{
  return sub_253277CF8();
}

uint64_t sub_25326CAEC()
{
  return sub_253277CF8();
}

void sub_25326CB18()
{
}

void sub_25326CB20()
{
}

uint64_t *sub_25326CC00(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v5 = *(void *)(v2 - 8);
    uint64_t v4 = v2 - 8;
    uint64_t v3 = v5;
    if (v5)
    {
      uint64_t v6 = 8 * v3;
      do
      {
        uint64_t v7 = *(void *)(v4 + v6);
        if (v7) {
          MEMORY[0x2533D8060](v7, 0x1000C8077774924);
        }
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x2533D8060](v4 - 8, 0x10C80436913F5);
  }
  return a1;
}

void sub_25326CD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::Agent::~Agent((marisa::Agent *)&a9);
  _Unwind_Resume(a1);
}

void sub_25326CF88(void *a1)
{
}

void sub_25326D11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  _Unwind_Resume(a1);
}

void *sub_25326D170(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_25326D218();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void sub_25326D218()
{
}

void sub_25326D228()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25326D27C(exception);
  __cxa_throw(exception, (struct type_info *)off_265395470, MEMORY[0x263F8C060]);
}

void sub_25326D268(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25326D27C(std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_25326D4D0(_Unwind_Exception *a1, void *a2, void *a3, ...)
{
  va_start(va, a3);

  marisa::Agent::~Agent((marisa::Agent *)va);
  _Unwind_Resume(a1);
}

void sub_25326D5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25326D7F4()
{
  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x25326D870);
}

void sub_25326D810(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_25326CF88(a1);
  }
  _Unwind_Resume(a1);
}

void sub_25326D820()
{
}

void sub_25326D82C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  marisa::Agent::~Agent((marisa::Agent *)&v24);

  JUMPOUT(0x25326D870);
}

void sub_25326DAAC()
{
  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x25326DB34);
}

void sub_25326DAC8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_25326CF88(a1);
  }
  _Unwind_Resume(a1);
}

void sub_25326DAD8()
{
}

void sub_25326DAE4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  marisa::Agent::~Agent((marisa::Agent *)&v25);

  JUMPOUT(0x25326DB34);
}

void sub_25326DBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25326DCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_25326DE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25326E094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25326E154()
{
  qword_269CDA340 = (uint64_t)os_log_create("com.apple.intelligenceflow", "PlanOverrides");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_25326E198()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_25326E1A8()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_25326E1B8()
{
  return MEMORY[0x270EEDBE0]();
}

uint64_t sub_25326E1C8()
{
  return MEMORY[0x270EEDBE8]();
}

uint64_t sub_25326E1D8()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_25326E1E8()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_25326E1F8()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_25326E208()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_25326E218()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25326E228()
{
  return MEMORY[0x270EEDD68]();
}

uint64_t sub_25326E238()
{
  return MEMORY[0x270EEDD70]();
}

uint64_t sub_25326E248()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25326E258()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25326E268()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25326E278()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_25326E288()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25326E298()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25326E2A8()
{
  return MEMORY[0x270EEDE80]();
}

uint64_t sub_25326E2B8()
{
  return MEMORY[0x270EEDE90]();
}

uint64_t sub_25326E2C8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25326E2D8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25326E2E8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25326E2F8()
{
  return MEMORY[0x270EEDF48]();
}

uint64_t sub_25326E308()
{
  return MEMORY[0x270EEDF60]();
}

uint64_t sub_25326E318()
{
  return MEMORY[0x270EEDFA0]();
}

uint64_t sub_25326E328()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_25326E338()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_25326E348()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_25326E358()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_25326E368()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25326E378()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_25326E388()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25326E398()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_25326E3A8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25326E3B8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25326E3C8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25326E3D8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25326E3E8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25326E3F8()
{
  return MEMORY[0x270EEE6C0]();
}

uint64_t sub_25326E408()
{
  return MEMORY[0x270EEE6C8]();
}

uint64_t sub_25326E418()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_25326E428()
{
  return MEMORY[0x270EEE6E0]();
}

uint64_t sub_25326E438()
{
  return MEMORY[0x270EEE6E8]();
}

uint64_t sub_25326E448()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_25326E458()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_25326E468()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_25326E478()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_25326E488()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_25326E498()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_25326E4A8()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_25326E4B8()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_25326E4C8()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_25326E4D8()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_25326E4E8()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_25326E4F8()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_25326E508()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_25326E518()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_25326E528()
{
  return MEMORY[0x270EEE860]();
}

uint64_t sub_25326E538()
{
  return MEMORY[0x270EEE868]();
}

uint64_t sub_25326E548()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_25326E558()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25326E568()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_25326E578()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_25326E588()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_25326E598()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_25326E5A8()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_25326E5B8()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_25326E5C8()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_25326E5D8()
{
  return MEMORY[0x270EEEEB0]();
}

uint64_t sub_25326E5E8()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25326E5F8()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25326E608()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25326E618()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25326E628()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25326E638()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_25326E648()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25326E658()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_25326E668()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25326E678()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25326E688()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25326E698()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25326E6A8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25326E6B8()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_25326E6C8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25326E6D8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25326E6E8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25326E6F8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25326E708()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25326E718()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_25326E728()
{
  return MEMORY[0x270EEFF60]();
}

uint64_t sub_25326E738()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25326E748()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25326E758()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25326E768()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25326E778()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25326E788()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25326E798()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25326E7A8()
{
  return MEMORY[0x270EF0098]();
}

uint64_t sub_25326E7B8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_25326E7C8()
{
  return MEMORY[0x270EF00D8]();
}

uint64_t sub_25326E7D8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25326E7E8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25326E7F8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25326E808()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25326E818()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_25326E828()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_25326E838()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_25326E848()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_25326E858()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_25326E868()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_25326E878()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25326E888()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25326E898()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25326E8A8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25326E8B8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25326E8C8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25326E8D8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25326E8E8()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_25326E8F8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25326E908()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25326E918()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25326E928()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25326E938()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25326E948()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25326E958()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25326E968()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25326E978()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25326E988()
{
  return MEMORY[0x270EF0D90]();
}

uint64_t sub_25326E998()
{
  return MEMORY[0x270EF0DA8]();
}

uint64_t sub_25326E9A8()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_25326E9B8()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_25326E9C8()
{
  return MEMORY[0x270EF0E00]();
}

uint64_t sub_25326E9D8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_25326E9E8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_25326E9F8()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_25326EA08()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_25326EA18()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_25326EA28()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25326EA38()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_25326EA48()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25326EA58()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25326EA68()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25326EA78()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_25326EA88()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_25326EA98()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_25326EAA8()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_25326EAB8()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_25326EAC8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25326EAD8()
{
  return MEMORY[0x270EF13C8]();
}

uint64_t sub_25326EAE8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25326EAF8()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25326EB08()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25326EB18()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25326EB28()
{
  return MEMORY[0x270EF14F8]();
}

uint64_t sub_25326EB38()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_25326EB48()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25326EB58()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25326EB68()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25326EB78()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25326EB88()
{
  return MEMORY[0x270F51288]();
}

uint64_t sub_25326EB98()
{
  return MEMORY[0x270F51290]();
}

uint64_t sub_25326EBA8()
{
  return MEMORY[0x270F51298]();
}

uint64_t sub_25326EBB8()
{
  return MEMORY[0x270F512A0]();
}

uint64_t sub_25326EBC8()
{
  return MEMORY[0x270F512A8]();
}

uint64_t sub_25326EBD8()
{
  return MEMORY[0x270F512B0]();
}

uint64_t sub_25326EBE8()
{
  return MEMORY[0x270F512B8]();
}

uint64_t sub_25326EBF8()
{
  return MEMORY[0x270F512C0]();
}

uint64_t sub_25326EC08()
{
  return MEMORY[0x270F512C8]();
}

uint64_t sub_25326EC18()
{
  return MEMORY[0x270F512D0]();
}

uint64_t sub_25326EC28()
{
  return MEMORY[0x270F512D8]();
}

uint64_t sub_25326EC38()
{
  return MEMORY[0x270F512E0]();
}

uint64_t sub_25326EC48()
{
  return MEMORY[0x270F512E8]();
}

uint64_t sub_25326EC58()
{
  return MEMORY[0x270F512F0]();
}

uint64_t sub_25326EC68()
{
  return MEMORY[0x270F512F8]();
}

uint64_t sub_25326EC78()
{
  return MEMORY[0x270F51300]();
}

uint64_t sub_25326EC88()
{
  return MEMORY[0x270F51308]();
}

uint64_t sub_25326EC98()
{
  return MEMORY[0x270F51310]();
}

uint64_t sub_25326ECA8()
{
  return MEMORY[0x270F51318]();
}

uint64_t sub_25326ECB8()
{
  return MEMORY[0x270F51320]();
}

uint64_t sub_25326ECC8()
{
  return MEMORY[0x270F51328]();
}

uint64_t sub_25326ECD8()
{
  return MEMORY[0x270F51330]();
}

uint64_t sub_25326ECE8()
{
  return MEMORY[0x270F51338]();
}

uint64_t sub_25326ECF8()
{
  return MEMORY[0x270F51340]();
}

uint64_t sub_25326ED08()
{
  return MEMORY[0x270F51348]();
}

uint64_t sub_25326ED18()
{
  return MEMORY[0x270F51350]();
}

uint64_t sub_25326ED28()
{
  return MEMORY[0x270F51358]();
}

uint64_t sub_25326ED38()
{
  return MEMORY[0x270F51360]();
}

uint64_t sub_25326ED48()
{
  return MEMORY[0x270F51368]();
}

uint64_t sub_25326ED58()
{
  return MEMORY[0x270F51370]();
}

uint64_t sub_25326ED68()
{
  return MEMORY[0x270F51378]();
}

uint64_t sub_25326ED78()
{
  return MEMORY[0x270F51380]();
}

uint64_t sub_25326ED88()
{
  return MEMORY[0x270F51388]();
}

uint64_t sub_25326ED98()
{
  return MEMORY[0x270F51390]();
}

uint64_t sub_25326EDA8()
{
  return MEMORY[0x270F51398]();
}

uint64_t sub_25326EDB8()
{
  return MEMORY[0x270F513A0]();
}

uint64_t sub_25326EDC8()
{
  return MEMORY[0x270F513A8]();
}

uint64_t sub_25326EDD8()
{
  return MEMORY[0x270F513B0]();
}

uint64_t sub_25326EDE8()
{
  return MEMORY[0x270F513B8]();
}

uint64_t sub_25326EDF8()
{
  return MEMORY[0x270F513C0]();
}

uint64_t sub_25326EE08()
{
  return MEMORY[0x270F513C8]();
}

uint64_t sub_25326EE18()
{
  return MEMORY[0x270F513D0]();
}

uint64_t sub_25326EE28()
{
  return MEMORY[0x270F513D8]();
}

uint64_t sub_25326EE38()
{
  return MEMORY[0x270F513E0]();
}

uint64_t sub_25326EE48()
{
  return MEMORY[0x270F513E8]();
}

uint64_t sub_25326EE58()
{
  return MEMORY[0x270F513F0]();
}

uint64_t sub_25326EE68()
{
  return MEMORY[0x270F513F8]();
}

uint64_t sub_25326EE78()
{
  return MEMORY[0x270F51400]();
}

uint64_t sub_25326EE88()
{
  return MEMORY[0x270F51408]();
}

uint64_t sub_25326EE98()
{
  return MEMORY[0x270F51410]();
}

uint64_t sub_25326EEA8()
{
  return MEMORY[0x270F51418]();
}

uint64_t sub_25326EEB8()
{
  return MEMORY[0x270F51420]();
}

uint64_t sub_25326EEC8()
{
  return MEMORY[0x270F51428]();
}

uint64_t sub_25326EED8()
{
  return MEMORY[0x270F51430]();
}

uint64_t sub_25326EEE8()
{
  return MEMORY[0x270F51438]();
}

uint64_t sub_25326EEF8()
{
  return MEMORY[0x270F51440]();
}

uint64_t sub_25326EF08()
{
  return MEMORY[0x270F51448]();
}

uint64_t sub_25326EF18()
{
  return MEMORY[0x270F51450]();
}

uint64_t sub_25326EF28()
{
  return MEMORY[0x270F51458]();
}

uint64_t sub_25326EF38()
{
  return MEMORY[0x270F51460]();
}

uint64_t sub_25326EF48()
{
  return MEMORY[0x270F51468]();
}

uint64_t sub_25326EF58()
{
  return MEMORY[0x270F51470]();
}

uint64_t sub_25326EF68()
{
  return MEMORY[0x270F51478]();
}

uint64_t sub_25326EF78()
{
  return MEMORY[0x270F51480]();
}

uint64_t sub_25326EF88()
{
  return MEMORY[0x270F51488]();
}

uint64_t sub_25326EF98()
{
  return MEMORY[0x270F51490]();
}

uint64_t sub_25326EFA8()
{
  return MEMORY[0x270F51498]();
}

uint64_t sub_25326EFB8()
{
  return MEMORY[0x270F286B0]();
}

uint64_t sub_25326EFD8()
{
  return MEMORY[0x270F286C0]();
}

uint64_t sub_25326EFE8()
{
  return MEMORY[0x270F286C8]();
}

uint64_t sub_25326F008()
{
  return MEMORY[0x270F2DDD0]();
}

uint64_t sub_25326F018()
{
  return MEMORY[0x270F2DDD8]();
}

uint64_t sub_25326F028()
{
  return MEMORY[0x270F2DE80]();
}

uint64_t sub_25326F038()
{
  return MEMORY[0x270F2DE90]();
}

uint64_t sub_25326F048()
{
  return MEMORY[0x270F2DEA8]();
}

uint64_t sub_25326F058()
{
  return MEMORY[0x270F2DEB0]();
}

uint64_t sub_25326F068()
{
  return MEMORY[0x270F2DEB8]();
}

uint64_t sub_25326F078()
{
  return MEMORY[0x270F2DEC8]();
}

uint64_t sub_25326F088()
{
  return MEMORY[0x270F2DED0]();
}

uint64_t sub_25326F098()
{
  return MEMORY[0x270F2DED8]();
}

uint64_t sub_25326F0A8()
{
  return MEMORY[0x270F2DF28]();
}

uint64_t sub_25326F0B8()
{
  return MEMORY[0x270F2DF30]();
}

uint64_t sub_25326F0C8()
{
  return MEMORY[0x270F2DF38]();
}

uint64_t sub_25326F0D8()
{
  return MEMORY[0x270F2DF40]();
}

uint64_t sub_25326F0E8()
{
  return MEMORY[0x270F2DFA8]();
}

uint64_t sub_25326F0F8()
{
  return MEMORY[0x270F2DFC8]();
}

uint64_t sub_25326F108()
{
  return MEMORY[0x270F2DFD0]();
}

uint64_t sub_25326F118()
{
  return MEMORY[0x270F2DFD8]();
}

uint64_t sub_25326F128()
{
  return MEMORY[0x270F2DFE0]();
}

uint64_t sub_25326F138()
{
  return MEMORY[0x270F2DFE8]();
}

uint64_t sub_25326F158()
{
  return MEMORY[0x270F2E008]();
}

uint64_t sub_25326F168()
{
  return MEMORY[0x270F2E010]();
}

uint64_t sub_25326F178()
{
  return MEMORY[0x270F2E018]();
}

uint64_t sub_25326F188()
{
  return MEMORY[0x270F2E020]();
}

uint64_t sub_25326F198()
{
  return MEMORY[0x270F2E028]();
}

uint64_t sub_25326F1B8()
{
  return MEMORY[0x270F2E1B0]();
}

uint64_t sub_25326F1C8()
{
  return MEMORY[0x270F2E1B8]();
}

uint64_t sub_25326F1D8()
{
  return MEMORY[0x270F2E270]();
}

uint64_t sub_25326F1E8()
{
  return MEMORY[0x270F2E298]();
}

uint64_t sub_25326F1F8()
{
  return MEMORY[0x270F2E2A0]();
}

uint64_t sub_25326F208()
{
  return MEMORY[0x270F2E2A8]();
}

uint64_t sub_25326F218()
{
  return MEMORY[0x270F2E2B0]();
}

uint64_t sub_25326F228()
{
  return MEMORY[0x270F2E2B8]();
}

uint64_t sub_25326F238()
{
  return MEMORY[0x270F2E2C0]();
}

uint64_t sub_25326F248()
{
  return MEMORY[0x270F2E2C8]();
}

uint64_t sub_25326F258()
{
  return MEMORY[0x270F2E440]();
}

uint64_t sub_25326F268()
{
  return MEMORY[0x270F2E450]();
}

uint64_t sub_25326F278()
{
  return MEMORY[0x270F4B8B0]();
}

uint64_t sub_25326F288()
{
  return MEMORY[0x270F4BFC0]();
}

uint64_t sub_25326F298()
{
  return MEMORY[0x270F4BFD0]();
}

uint64_t sub_25326F2A8()
{
  return MEMORY[0x270F4C160]();
}

uint64_t sub_25326F2B8()
{
  return MEMORY[0x270F4C4B0]();
}

uint64_t sub_25326F2C8()
{
  return MEMORY[0x270F4C4B8]();
}

uint64_t sub_25326F2D8()
{
  return MEMORY[0x270F4C4C0]();
}

uint64_t sub_25326F2E8()
{
  return MEMORY[0x270F4C4C8]();
}

uint64_t sub_25326F2F8()
{
  return MEMORY[0x270F4C4D0]();
}

uint64_t sub_25326F308()
{
  return MEMORY[0x270F4C4D8]();
}

uint64_t sub_25326F318()
{
  return MEMORY[0x270F4C4E0]();
}

uint64_t sub_25326F328()
{
  return MEMORY[0x270F4C4E8]();
}

uint64_t sub_25326F338()
{
  return MEMORY[0x270F4C4F0]();
}

uint64_t sub_25326F348()
{
  return MEMORY[0x270F4C4F8]();
}

uint64_t sub_25326F358()
{
  return MEMORY[0x270F4C500]();
}

uint64_t sub_25326F368()
{
  return MEMORY[0x270F4C508]();
}

uint64_t sub_25326F378()
{
  return MEMORY[0x270F4C510]();
}

uint64_t sub_25326F388()
{
  return MEMORY[0x270F4C518]();
}

uint64_t sub_25326F398()
{
  return MEMORY[0x270F4C520]();
}

uint64_t sub_25326F3A8()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_25326F3B8()
{
  return MEMORY[0x270F6CDB8]();
}

uint64_t sub_25326F3C8()
{
  return MEMORY[0x270F65420]();
}

uint64_t sub_25326F3D8()
{
  return MEMORY[0x270F6CF50]();
}

uint64_t sub_25326F3E8()
{
  return MEMORY[0x270F65428]();
}

uint64_t sub_25326F3F8()
{
  return MEMORY[0x270F6CFB0]();
}

uint64_t sub_25326F408()
{
  return MEMORY[0x270F65440]();
}

uint64_t sub_25326F418()
{
  return MEMORY[0x270F6D280]();
}

uint64_t sub_25326F428()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_25326F438()
{
  return MEMORY[0x270F65450]();
}

uint64_t sub_25326F448()
{
  return MEMORY[0x270F6DC18]();
}

uint64_t sub_25326F458()
{
  return MEMORY[0x270F65458]();
}

uint64_t sub_25326F468()
{
  return MEMORY[0x270F6E140]();
}

uint64_t sub_25326F478()
{
  return MEMORY[0x270F65460]();
}

uint64_t sub_25326F488()
{
  return MEMORY[0x270F6E148]();
}

uint64_t sub_25326F498()
{
  return MEMORY[0x270F65470]();
}

uint64_t sub_25326F4A8()
{
  return MEMORY[0x270F6EDA0]();
}

uint64_t sub_25326F4B8()
{
  return MEMORY[0x270F6EDA8]();
}

uint64_t sub_25326F4C8()
{
  return MEMORY[0x270F6F280]();
}

uint64_t sub_25326F4D8()
{
  return MEMORY[0x270F83BB8]();
}

uint64_t sub_25326F4E8()
{
  return MEMORY[0x270F656C8]();
}

uint64_t sub_25326F4F8()
{
  return MEMORY[0x270F65750]();
}

uint64_t sub_25326F508()
{
  return MEMORY[0x270F65760]();
}

uint64_t sub_25326F518()
{
  return MEMORY[0x270F65778]();
}

uint64_t sub_25326F528()
{
  return MEMORY[0x270F65830]();
}

uint64_t sub_25326F538()
{
  return MEMORY[0x270F65850]();
}

uint64_t sub_25326F548()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_25326F558()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_25326F568()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_25326F578()
{
  return MEMORY[0x270F65870]();
}

uint64_t sub_25326F588()
{
  return MEMORY[0x270F65880]();
}

uint64_t sub_25326F598()
{
  return MEMORY[0x270F65888]();
}

uint64_t sub_25326F5A8()
{
  return MEMORY[0x270F658F0]();
}

uint64_t sub_25326F5B8()
{
  return MEMORY[0x270F65900]();
}

uint64_t sub_25326F5C8()
{
  return MEMORY[0x270F65908]();
}

uint64_t sub_25326F5D8()
{
  return MEMORY[0x270F65910]();
}

uint64_t sub_25326F5E8()
{
  return MEMORY[0x270F65950]();
}

uint64_t sub_25326F5F8()
{
  return MEMORY[0x270F65958]();
}

uint64_t sub_25326F608()
{
  return MEMORY[0x270F65960]();
}

uint64_t sub_25326F618()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_25326F628()
{
  return MEMORY[0x270F65980]();
}

uint64_t sub_25326F638()
{
  return MEMORY[0x270F65988]();
}

uint64_t sub_25326F648()
{
  return MEMORY[0x270F65990]();
}

uint64_t sub_25326F658()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_25326F668()
{
  return MEMORY[0x270F659C8]();
}

uint64_t sub_25326F678()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_25326F688()
{
  return MEMORY[0x270F659F8]();
}

uint64_t sub_25326F698()
{
  return MEMORY[0x270F65A00]();
}

uint64_t sub_25326F6A8()
{
  return MEMORY[0x270F65A50]();
}

uint64_t sub_25326F6B8()
{
  return MEMORY[0x270F65A58]();
}

uint64_t sub_25326F6C8()
{
  return MEMORY[0x270F65A78]();
}

uint64_t sub_25326F6D8()
{
  return MEMORY[0x270F65A98]();
}

uint64_t sub_25326F6E8()
{
  return MEMORY[0x270F65AB8]();
}

uint64_t sub_25326F6F8()
{
  return MEMORY[0x270F65AC0]();
}

uint64_t sub_25326F708()
{
  return MEMORY[0x270F65B50]();
}

uint64_t sub_25326F718()
{
  return MEMORY[0x270F65B58]();
}

uint64_t sub_25326F728()
{
  return MEMORY[0x270F65B68]();
}

uint64_t sub_25326F738()
{
  return MEMORY[0x270F65BE0]();
}

uint64_t sub_25326F748()
{
  return MEMORY[0x270F65C10]();
}

uint64_t sub_25326F758()
{
  return MEMORY[0x270F65C28]();
}

uint64_t sub_25326F768()
{
  return MEMORY[0x270F65C30]();
}

uint64_t sub_25326F778()
{
  return MEMORY[0x270F65C38]();
}

uint64_t sub_25326F788()
{
  return MEMORY[0x270F65C48]();
}

uint64_t sub_25326F798()
{
  return MEMORY[0x270F65C50]();
}

uint64_t sub_25326F7A8()
{
  return MEMORY[0x270F65C58]();
}

uint64_t sub_25326F7B8()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_25326F7C8()
{
  return MEMORY[0x270F65DA0]();
}

uint64_t sub_25326F7D8()
{
  return MEMORY[0x270F65DA8]();
}

uint64_t sub_25326F7E8()
{
  return MEMORY[0x270F65DC8]();
}

uint64_t sub_25326F7F8()
{
  return MEMORY[0x270F65DD0]();
}

uint64_t sub_25326F808()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_25326F818()
{
  return MEMORY[0x270F65E40]();
}

uint64_t sub_25326F828()
{
  return MEMORY[0x270F65E58]();
}

uint64_t sub_25326F838()
{
  return MEMORY[0x270F65E68]();
}

uint64_t sub_25326F848()
{
  return MEMORY[0x270F65E70]();
}

uint64_t sub_25326F858()
{
  return MEMORY[0x270F65EA8]();
}

uint64_t sub_25326F868()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_25326F878()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_25326F888()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_25326F898()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25326F8A8()
{
  return MEMORY[0x270F72A80]();
}

uint64_t sub_25326F8B8()
{
  return MEMORY[0x270F7EB78]();
}

uint64_t sub_25326F8C8()
{
  return MEMORY[0x270F7EB80]();
}

uint64_t sub_25326F8E8()
{
  return MEMORY[0x270F7EBA0]();
}

uint64_t sub_25326F8F8()
{
  return MEMORY[0x270F7EBE8]();
}

uint64_t sub_25326F908()
{
  return MEMORY[0x270F2F820]();
}

uint64_t sub_25326F918()
{
  return MEMORY[0x270F7EBF0]();
}

uint64_t sub_25326F928()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_25326F938()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_25326F948()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_25326F958()
{
  return MEMORY[0x270F7EC60]();
}

uint64_t sub_25326F968()
{
  return MEMORY[0x270F7EC78]();
}

uint64_t sub_25326F978()
{
  return MEMORY[0x270F7ECD8]();
}

uint64_t sub_25326F988()
{
  return MEMORY[0x270F7ED10]();
}

uint64_t sub_25326F998()
{
  return MEMORY[0x270F7ED60]();
}

uint64_t sub_25326F9A8()
{
  return MEMORY[0x270F7ED88]();
}

uint64_t sub_25326F9B8()
{
  return MEMORY[0x270F7ED90]();
}

uint64_t sub_25326F9C8()
{
  return MEMORY[0x270F7EDD8]();
}

uint64_t sub_25326F9D8()
{
  return MEMORY[0x270F7EDE0]();
}

uint64_t sub_25326F9E8()
{
  return MEMORY[0x270F7EDE8]();
}

uint64_t sub_25326F9F8()
{
  return MEMORY[0x270F7EDF8]();
}

uint64_t sub_25326FA08()
{
  return MEMORY[0x270F7EE20]();
}

uint64_t sub_25326FA18()
{
  return MEMORY[0x270F7EE38]();
}

uint64_t sub_25326FA28()
{
  return MEMORY[0x270F7EE40]();
}

uint64_t sub_25326FA38()
{
  return MEMORY[0x270F7EE60]();
}

uint64_t sub_25326FA48()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_25326FA58()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_25326FA68()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_25326FA78()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_25326FA88()
{
  return MEMORY[0x270F7EF00]();
}

uint64_t sub_25326FA98()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_25326FAA8()
{
  return MEMORY[0x270F7EF90]();
}

uint64_t sub_25326FAB8()
{
  return MEMORY[0x270F7EFE8]();
}

uint64_t sub_25326FAD8()
{
  return MEMORY[0x270F2F840]();
}

uint64_t sub_25326FAE8()
{
  return MEMORY[0x270F2F848]();
}

uint64_t sub_25326FAF8()
{
  return MEMORY[0x270F2FCF0]();
}

uint64_t sub_25326FB08()
{
  return MEMORY[0x270F2FCF8]();
}

uint64_t sub_25326FB18()
{
  return MEMORY[0x270F2FD00]();
}

uint64_t sub_25326FB28()
{
  return MEMORY[0x270F2FB58]();
}

uint64_t sub_25326FB38()
{
  return MEMORY[0x270F2FB60]();
}

uint64_t sub_25326FB58()
{
  return MEMORY[0x270F2FD40]();
}

uint64_t sub_25326FB68()
{
  return MEMORY[0x270F2FD48]();
}

uint64_t sub_25326FB78()
{
  return MEMORY[0x270F2FD50]();
}

uint64_t sub_25326FB88()
{
  return MEMORY[0x270F2FD58]();
}

uint64_t sub_25326FB98()
{
  return MEMORY[0x270F2FD60]();
}

uint64_t sub_25326FBA8()
{
  return MEMORY[0x270F2FD68]();
}

uint64_t sub_25326FBB8()
{
  return MEMORY[0x270F2FD70]();
}

uint64_t sub_25326FBC8()
{
  return MEMORY[0x270F7F2B8]();
}

uint64_t sub_25326FBD8()
{
  return MEMORY[0x270F7F2C8]();
}

uint64_t sub_25326FBE8()
{
  return MEMORY[0x270F2FDE0]();
}

uint64_t sub_25326FBF8()
{
  return MEMORY[0x270F2FDF8]();
}

uint64_t sub_25326FC08()
{
  return MEMORY[0x270F7F2D8]();
}

uint64_t sub_25326FC18()
{
  return MEMORY[0x270F7F2E8]();
}

uint64_t sub_25326FC28()
{
  return MEMORY[0x270F3D6A8]();
}

uint64_t sub_25326FC38()
{
  return MEMORY[0x270F3D6B0]();
}

uint64_t sub_25326FC48()
{
  return MEMORY[0x270F3D6B8]();
}

uint64_t sub_25326FC58()
{
  return MEMORY[0x270F3D6C0]();
}

uint64_t sub_25326FC68()
{
  return MEMORY[0x270F3D6C8]();
}

uint64_t sub_25326FC78()
{
  return MEMORY[0x270F3D6D0]();
}

uint64_t sub_25326FC88()
{
  return MEMORY[0x270F3D6E0]();
}

uint64_t sub_25326FC98()
{
  return MEMORY[0x270F3D6F0]();
}

uint64_t sub_25326FCA8()
{
  return MEMORY[0x270F3D730]();
}

uint64_t sub_25326FCB8()
{
  return MEMORY[0x270F3D738]();
}

uint64_t sub_25326FCC8()
{
  return MEMORY[0x270F3D740]();
}

uint64_t sub_25326FCD8()
{
  return MEMORY[0x270F3D750]();
}

uint64_t sub_25326FCE8()
{
  return MEMORY[0x270F3D758]();
}

uint64_t sub_25326FCF8()
{
  return MEMORY[0x270F3D798]();
}

uint64_t sub_25326FD08()
{
  return MEMORY[0x270F3D7A0]();
}

uint64_t sub_25326FD18()
{
  return MEMORY[0x270F3D7A8]();
}

uint64_t sub_25326FD38()
{
  return MEMORY[0x270F3D7B8]();
}

uint64_t sub_25326FD48()
{
  return MEMORY[0x270F3D7C0]();
}

uint64_t sub_25326FD58()
{
  return MEMORY[0x270F3D7C8]();
}

uint64_t sub_25326FD68()
{
  return MEMORY[0x270F3D7D0]();
}

uint64_t sub_25326FD78()
{
  return MEMORY[0x270F3F758]();
}

uint64_t sub_25326FD88()
{
  return MEMORY[0x270F3F760]();
}

uint64_t sub_25326FD98()
{
  return MEMORY[0x270F3D7E0]();
}

uint64_t sub_25326FDA8()
{
  return MEMORY[0x270F3D7E8]();
}

uint64_t sub_25326FDB8()
{
  return MEMORY[0x270F3D7F0]();
}

uint64_t sub_25326FDC8()
{
  return MEMORY[0x270F3D7F8]();
}

uint64_t sub_25326FDE8()
{
  return MEMORY[0x270F3D808]();
}

uint64_t sub_25326FDF8()
{
  return MEMORY[0x270F3D810]();
}

uint64_t sub_25326FE08()
{
  return MEMORY[0x270F3D8C8]();
}

uint64_t sub_25326FE18()
{
  return MEMORY[0x270F3D8D8]();
}

uint64_t sub_25326FE28()
{
  return MEMORY[0x270F3D8F0]();
}

uint64_t sub_25326FE38()
{
  return MEMORY[0x270F3D900]();
}

uint64_t sub_25326FE48()
{
  return MEMORY[0x270F3D908]();
}

uint64_t sub_25326FE58()
{
  return MEMORY[0x270F3D910]();
}

uint64_t sub_25326FE68()
{
  return MEMORY[0x270F3D918]();
}

uint64_t sub_25326FE78()
{
  return MEMORY[0x270F3D928]();
}

uint64_t sub_25326FE88()
{
  return MEMORY[0x270F3D980]();
}

uint64_t sub_25326FE98()
{
  return MEMORY[0x270F3D988]();
}

uint64_t sub_25326FEA8()
{
  return MEMORY[0x270F3D998]();
}

uint64_t sub_25326FEB8()
{
  return MEMORY[0x270F3D9A8]();
}

uint64_t sub_25326FEC8()
{
  return MEMORY[0x270F3D9B0]();
}

uint64_t sub_25326FED8()
{
  return MEMORY[0x270F3D9D0]();
}

uint64_t sub_25326FEE8()
{
  return MEMORY[0x270F3D9D8]();
}

uint64_t sub_25326FEF8()
{
  return MEMORY[0x270F3D9E0]();
}

uint64_t sub_25326FF08()
{
  return MEMORY[0x270F3D9E8]();
}

uint64_t sub_25326FF18()
{
  return MEMORY[0x270F3D9F0]();
}

uint64_t sub_25326FF28()
{
  return MEMORY[0x270F3D9F8]();
}

uint64_t sub_25326FF38()
{
  return MEMORY[0x270F3DA08]();
}

uint64_t sub_25326FF48()
{
  return MEMORY[0x270F3DA48]();
}

uint64_t sub_25326FF58()
{
  return MEMORY[0x270F3DA60]();
}

uint64_t sub_25326FF68()
{
  return MEMORY[0x270F3DA68]();
}

uint64_t sub_25326FF78()
{
  return MEMORY[0x270F3DA70]();
}

uint64_t sub_25326FF88()
{
  return MEMORY[0x270F3DAB0]();
}

uint64_t sub_25326FF98()
{
  return MEMORY[0x270F3DAB8]();
}

uint64_t sub_25326FFA8()
{
  return MEMORY[0x270F3DAC0]();
}

uint64_t sub_25326FFB8()
{
  return MEMORY[0x270F3DAD0]();
}

uint64_t sub_25326FFC8()
{
  return MEMORY[0x270F3DAD8]();
}

uint64_t sub_25326FFD8()
{
  return MEMORY[0x270F3DAE0]();
}

uint64_t sub_25326FFE8()
{
  return MEMORY[0x270F3DAE8]();
}

uint64_t sub_25326FFF8()
{
  return MEMORY[0x270F3DAF0]();
}

uint64_t sub_253270008()
{
  return MEMORY[0x270F3DB18]();
}

uint64_t sub_253270018()
{
  return MEMORY[0x270F3DB48]();
}

uint64_t sub_253270028()
{
  return MEMORY[0x270F3E008]();
}

uint64_t sub_253270038()
{
  return MEMORY[0x270F3E010]();
}

uint64_t sub_253270048()
{
  return MEMORY[0x270F3E018]();
}

uint64_t sub_253270058()
{
  return MEMORY[0x270F3E020]();
}

uint64_t sub_253270068()
{
  return MEMORY[0x270F3E028]();
}

uint64_t sub_253270078()
{
  return MEMORY[0x270F3E030]();
}

uint64_t sub_253270088()
{
  return MEMORY[0x270F3E038]();
}

uint64_t sub_253270098()
{
  return MEMORY[0x270F3E040]();
}

uint64_t sub_2532700A8()
{
  return MEMORY[0x270F3E048]();
}

uint64_t sub_2532700B8()
{
  return MEMORY[0x270F3E050]();
}

uint64_t sub_2532700C8()
{
  return MEMORY[0x270F3E058]();
}

uint64_t sub_2532700D8()
{
  return MEMORY[0x270F3E060]();
}

uint64_t sub_2532700E8()
{
  return MEMORY[0x270F3E068]();
}

uint64_t sub_2532700F8()
{
  return MEMORY[0x270F3E070]();
}

uint64_t sub_253270108()
{
  return MEMORY[0x270F3E078]();
}

uint64_t sub_253270118()
{
  return MEMORY[0x270F3E080]();
}

uint64_t sub_253270128()
{
  return MEMORY[0x270F3E088]();
}

uint64_t sub_253270148()
{
  return MEMORY[0x270F3E098]();
}

uint64_t sub_253270158()
{
  return MEMORY[0x270F3E0B8]();
}

uint64_t sub_253270168()
{
  return MEMORY[0x270F3E0D8]();
}

uint64_t sub_253270178()
{
  return MEMORY[0x270F3E0E8]();
}

uint64_t sub_253270188()
{
  return MEMORY[0x270F3E108]();
}

uint64_t sub_253270198()
{
  return MEMORY[0x270F3E110]();
}

uint64_t sub_2532701A8()
{
  return MEMORY[0x270F3E120]();
}

uint64_t sub_2532701B8()
{
  return MEMORY[0x270F3E128]();
}

uint64_t sub_2532701C8()
{
  return MEMORY[0x270F3E130]();
}

uint64_t sub_2532701D8()
{
  return MEMORY[0x270F3E148]();
}

uint64_t sub_2532701E8()
{
  return MEMORY[0x270F3E150]();
}

uint64_t sub_2532701F8()
{
  return MEMORY[0x270F3E180]();
}

uint64_t sub_253270208()
{
  return MEMORY[0x270F3E190]();
}

uint64_t sub_253270218()
{
  return MEMORY[0x270F3E198]();
}

uint64_t sub_253270228()
{
  return MEMORY[0x270F3E1B0]();
}

uint64_t sub_253270238()
{
  return MEMORY[0x270F3E1B8]();
}

uint64_t sub_253270248()
{
  return MEMORY[0x270F3E1C8]();
}

uint64_t sub_253270258()
{
  return MEMORY[0x270F3E1D0]();
}

uint64_t sub_253270268()
{
  return MEMORY[0x270F3E1E0]();
}

uint64_t sub_253270278()
{
  return MEMORY[0x270F3E1F0]();
}

uint64_t sub_253270288()
{
  return MEMORY[0x270F3E200]();
}

uint64_t sub_253270298()
{
  return MEMORY[0x270F3E208]();
}

uint64_t sub_2532702A8()
{
  return MEMORY[0x270F3E210]();
}

uint64_t sub_2532702B8()
{
  return MEMORY[0x270F3E220]();
}

uint64_t sub_2532702C8()
{
  return MEMORY[0x270F3E228]();
}

uint64_t sub_2532702D8()
{
  return MEMORY[0x270F3E230]();
}

uint64_t sub_2532702E8()
{
  return MEMORY[0x270F3E238]();
}

uint64_t sub_2532702F8()
{
  return MEMORY[0x270F3E250]();
}

uint64_t sub_253270308()
{
  return MEMORY[0x270F3E258]();
}

uint64_t sub_253270318()
{
  return MEMORY[0x270F3E260]();
}

uint64_t sub_253270328()
{
  return MEMORY[0x270F3E268]();
}

uint64_t sub_253270338()
{
  return MEMORY[0x270F3E270]();
}

uint64_t sub_253270348()
{
  return MEMORY[0x270F3E280]();
}

uint64_t sub_253270358()
{
  return MEMORY[0x270F3E290]();
}

uint64_t sub_253270368()
{
  return MEMORY[0x270F3E2A8]();
}

uint64_t sub_253270378()
{
  return MEMORY[0x270F3E2B0]();
}

uint64_t sub_253270388()
{
  return MEMORY[0x270F3E2B8]();
}

uint64_t sub_253270398()
{
  return MEMORY[0x270F3E2D8]();
}

uint64_t sub_2532703A8()
{
  return MEMORY[0x270F3E308]();
}

uint64_t sub_2532703B8()
{
  return MEMORY[0x270F3E390]();
}

uint64_t sub_2532703C8()
{
  return MEMORY[0x270F3E398]();
}

uint64_t sub_2532703D8()
{
  return MEMORY[0x270F3E3A8]();
}

uint64_t sub_2532703E8()
{
  return MEMORY[0x270F3E3B8]();
}

uint64_t sub_2532703F8()
{
  return MEMORY[0x270F3E3D0]();
}

uint64_t sub_253270408()
{
  return MEMORY[0x270F3E3E8]();
}

uint64_t sub_253270418()
{
  return MEMORY[0x270F3E408]();
}

uint64_t sub_253270428()
{
  return MEMORY[0x270F3E410]();
}

uint64_t sub_253270438()
{
  return MEMORY[0x270F3E428]();
}

uint64_t sub_253270448()
{
  return MEMORY[0x270F3E450]();
}

uint64_t sub_253270458()
{
  return MEMORY[0x270F3E458]();
}

uint64_t sub_253270468()
{
  return MEMORY[0x270F3E460]();
}

uint64_t sub_253270478()
{
  return MEMORY[0x270F3E468]();
}

uint64_t sub_253270488()
{
  return MEMORY[0x270F3E470]();
}

uint64_t sub_253270498()
{
  return MEMORY[0x270F3E478]();
}

uint64_t sub_2532704A8()
{
  return MEMORY[0x270F3E508]();
}

uint64_t sub_2532704B8()
{
  return MEMORY[0x270F3E518]();
}

uint64_t sub_2532704C8()
{
  return MEMORY[0x270F3E520]();
}

uint64_t sub_2532704D8()
{
  return MEMORY[0x270F3E528]();
}

uint64_t sub_2532704E8()
{
  return MEMORY[0x270F3E530]();
}

uint64_t sub_2532704F8()
{
  return MEMORY[0x270F3E540]();
}

uint64_t sub_253270508()
{
  return MEMORY[0x270F3E560]();
}

uint64_t sub_253270518()
{
  return MEMORY[0x270F3E568]();
}

uint64_t sub_253270528()
{
  return MEMORY[0x270F3E578]();
}

uint64_t sub_253270538()
{
  return MEMORY[0x270F3E580]();
}

uint64_t sub_253270548()
{
  return MEMORY[0x270F3E5E8]();
}

uint64_t sub_253270558()
{
  return MEMORY[0x270F3E608]();
}

uint64_t sub_253270568()
{
  return MEMORY[0x270F3E618]();
}

uint64_t sub_253270578()
{
  return MEMORY[0x270F3E620]();
}

uint64_t sub_253270588()
{
  return MEMORY[0x270F3E650]();
}

uint64_t sub_253270598()
{
  return MEMORY[0x270F3E658]();
}

uint64_t sub_2532705A8()
{
  return MEMORY[0x270F3E660]();
}

uint64_t sub_2532705B8()
{
  return MEMORY[0x270F3E670]();
}

uint64_t sub_2532705C8()
{
  return MEMORY[0x270F3E678]();
}

uint64_t sub_2532705D8()
{
  return MEMORY[0x270F3E6A0]();
}

uint64_t sub_2532705E8()
{
  return MEMORY[0x270F3E6B8]();
}

uint64_t sub_2532705F8()
{
  return MEMORY[0x270F3E758]();
}

uint64_t sub_253270608()
{
  return MEMORY[0x270F3E760]();
}

uint64_t sub_253270618()
{
  return MEMORY[0x270F3E768]();
}

uint64_t sub_253270628()
{
  return MEMORY[0x270F3F798]();
}

uint64_t sub_253270638()
{
  return MEMORY[0x270F3E770]();
}

uint64_t sub_253270648()
{
  return MEMORY[0x270F3E778]();
}

uint64_t sub_253270658()
{
  return MEMORY[0x270F3E7D0]();
}

uint64_t sub_253270668()
{
  return MEMORY[0x270F3E8A8]();
}

uint64_t sub_253270678()
{
  return MEMORY[0x270F3E8B0]();
}

uint64_t sub_253270688()
{
  return MEMORY[0x270F3E8B8]();
}

uint64_t sub_253270698()
{
  return MEMORY[0x270F3E8C0]();
}

uint64_t sub_2532706A8()
{
  return MEMORY[0x270F3E8C8]();
}

uint64_t sub_2532706B8()
{
  return MEMORY[0x270F3E8D0]();
}

uint64_t sub_2532706C8()
{
  return MEMORY[0x270F3E8D8]();
}

uint64_t sub_2532706D8()
{
  return MEMORY[0x270F3E8E0]();
}

uint64_t sub_2532706E8()
{
  return MEMORY[0x270F3E9A8]();
}

uint64_t sub_2532706F8()
{
  return MEMORY[0x270F3E9B0]();
}

uint64_t sub_253270708()
{
  return MEMORY[0x270F3E9B8]();
}

uint64_t sub_253270718()
{
  return MEMORY[0x270F3E9C0]();
}

uint64_t sub_253270728()
{
  return MEMORY[0x270F3E9C8]();
}

uint64_t sub_253270738()
{
  return MEMORY[0x270F3E9D0]();
}

uint64_t sub_253270748()
{
  return MEMORY[0x270F3E9D8]();
}

uint64_t sub_253270758()
{
  return MEMORY[0x270F3E9F8]();
}

uint64_t sub_253270768()
{
  return MEMORY[0x270F3EA00]();
}

uint64_t sub_253270778()
{
  return MEMORY[0x270F3EA28]();
}

uint64_t sub_253270788()
{
  return MEMORY[0x270F3EA30]();
}

uint64_t sub_253270798()
{
  return MEMORY[0x270F3EA38]();
}

uint64_t sub_2532707A8()
{
  return MEMORY[0x270F3EA40]();
}

uint64_t sub_2532707B8()
{
  return MEMORY[0x270F3EA50]();
}

uint64_t sub_2532707C8()
{
  return MEMORY[0x270F3EA58]();
}

uint64_t sub_2532707D8()
{
  return MEMORY[0x270F3EA60]();
}

uint64_t sub_2532707E8()
{
  return MEMORY[0x270F3EA70]();
}

uint64_t sub_2532707F8()
{
  return MEMORY[0x270F3EA78]();
}

uint64_t sub_253270808()
{
  return MEMORY[0x270F3EA80]();
}

uint64_t sub_253270818()
{
  return MEMORY[0x270F3EA88]();
}

uint64_t sub_253270828()
{
  return MEMORY[0x270F3EC68]();
}

uint64_t sub_253270838()
{
  return MEMORY[0x270F3EC70]();
}

uint64_t sub_253270848()
{
  return MEMORY[0x270F3EC78]();
}

uint64_t sub_253270858()
{
  return MEMORY[0x270F3EC80]();
}

uint64_t sub_253270868()
{
  return MEMORY[0x270F3EC88]();
}

uint64_t sub_253270878()
{
  return MEMORY[0x270F3EC90]();
}

uint64_t sub_253270888()
{
  return MEMORY[0x270F3ECB0]();
}

uint64_t sub_253270898()
{
  return MEMORY[0x270F3ECB8]();
}

uint64_t sub_2532708A8()
{
  return MEMORY[0x270F3ECC0]();
}

uint64_t sub_2532708B8()
{
  return MEMORY[0x270F3ECC8]();
}

uint64_t sub_2532708C8()
{
  return MEMORY[0x270F3ECD0]();
}

uint64_t sub_2532708D8()
{
  return MEMORY[0x270F3ECD8]();
}

uint64_t sub_2532708E8()
{
  return MEMORY[0x270F3ECE0]();
}

uint64_t sub_2532708F8()
{
  return MEMORY[0x270F3ECE8]();
}

uint64_t sub_253270908()
{
  return MEMORY[0x270F3F7B8]();
}

uint64_t sub_253270918()
{
  return MEMORY[0x270F3F7C0]();
}

uint64_t sub_253270928()
{
  return MEMORY[0x270F3F7C8]();
}

uint64_t sub_253270938()
{
  return MEMORY[0x270F3F7D0]();
}

uint64_t sub_253270948()
{
  return MEMORY[0x270F3F7D8]();
}

uint64_t sub_253270958()
{
  return MEMORY[0x270F3F7E0]();
}

uint64_t sub_253270968()
{
  return MEMORY[0x270F3F7E8]();
}

uint64_t sub_253270978()
{
  return MEMORY[0x270F3F7F0]();
}

uint64_t sub_253270988()
{
  return MEMORY[0x270F3F7F8]();
}

uint64_t sub_253270998()
{
  return MEMORY[0x270F3F800]();
}

uint64_t sub_2532709A8()
{
  return MEMORY[0x270F3F808]();
}

uint64_t sub_2532709B8()
{
  return MEMORY[0x270F3F810]();
}

uint64_t sub_2532709C8()
{
  return MEMORY[0x270F3F818]();
}

uint64_t sub_2532709D8()
{
  return MEMORY[0x270F3F820]();
}

uint64_t sub_2532709E8()
{
  return MEMORY[0x270F3F828]();
}

uint64_t sub_253270A08()
{
  return MEMORY[0x270F3F838]();
}

uint64_t sub_253270A18()
{
  return MEMORY[0x270F3F840]();
}

uint64_t sub_253270A28()
{
  return MEMORY[0x270F3F848]();
}

uint64_t sub_253270A38()
{
  return MEMORY[0x270F3F850]();
}

uint64_t sub_253270A48()
{
  return MEMORY[0x270F3F858]();
}

uint64_t sub_253270A58()
{
  return MEMORY[0x270F3ED18]();
}

uint64_t sub_253270A68()
{
  return MEMORY[0x270F3ED20]();
}

uint64_t sub_253270A78()
{
  return MEMORY[0x270F3ED28]();
}

uint64_t sub_253270A88()
{
  return MEMORY[0x270F3ED30]();
}

uint64_t sub_253270A98()
{
  return MEMORY[0x270F3ED38]();
}

uint64_t sub_253270AA8()
{
  return MEMORY[0x270F3ED40]();
}

uint64_t sub_253270AB8()
{
  return MEMORY[0x270F3ED48]();
}

uint64_t sub_253270AC8()
{
  return MEMORY[0x270F3ED50]();
}

uint64_t sub_253270AD8()
{
  return MEMORY[0x270F3ED58]();
}

uint64_t sub_253270AE8()
{
  return MEMORY[0x270F3ED60]();
}

uint64_t sub_253270AF8()
{
  return MEMORY[0x270F3ED68]();
}

uint64_t sub_253270B08()
{
  return MEMORY[0x270F3ED70]();
}

uint64_t sub_253270B18()
{
  return MEMORY[0x270F3ED78]();
}

uint64_t sub_253270B28()
{
  return MEMORY[0x270F3ED80]();
}

uint64_t sub_253270B38()
{
  return MEMORY[0x270F3ED88]();
}

uint64_t sub_253270B48()
{
  return MEMORY[0x270F3ED90]();
}

uint64_t sub_253270B58()
{
  return MEMORY[0x270F3ED98]();
}

uint64_t sub_253270B68()
{
  return MEMORY[0x270F3EDA0]();
}

uint64_t sub_253270B78()
{
  return MEMORY[0x270F3EDA8]();
}

uint64_t sub_253270B88()
{
  return MEMORY[0x270F3EDB0]();
}

uint64_t sub_253270B98()
{
  return MEMORY[0x270F3EDB8]();
}

uint64_t sub_253270BA8()
{
  return MEMORY[0x270F3EDC0]();
}

uint64_t sub_253270BB8()
{
  return MEMORY[0x270F3EDC8]();
}

uint64_t sub_253270BC8()
{
  return MEMORY[0x270F3EDD0]();
}

uint64_t sub_253270BD8()
{
  return MEMORY[0x270F3EDD8]();
}

uint64_t sub_253270BE8()
{
  return MEMORY[0x270F3EDE0]();
}

uint64_t sub_253270BF8()
{
  return MEMORY[0x270F3EDE8]();
}

uint64_t sub_253270C08()
{
  return MEMORY[0x270F3EDF0]();
}

uint64_t sub_253270C18()
{
  return MEMORY[0x270F3EDF8]();
}

uint64_t sub_253270C28()
{
  return MEMORY[0x270F3EE00]();
}

uint64_t sub_253270C38()
{
  return MEMORY[0x270F3EE08]();
}

uint64_t sub_253270C48()
{
  return MEMORY[0x270F3EE10]();
}

uint64_t sub_253270C58()
{
  return MEMORY[0x270F3EE18]();
}

uint64_t sub_253270C68()
{
  return MEMORY[0x270F3EE20]();
}

uint64_t sub_253270C78()
{
  return MEMORY[0x270F3EE28]();
}

uint64_t sub_253270C88()
{
  return MEMORY[0x270F3EE30]();
}

uint64_t sub_253270C98()
{
  return MEMORY[0x270F3EE38]();
}

uint64_t sub_253270CA8()
{
  return MEMORY[0x270F3EE40]();
}

uint64_t sub_253270CB8()
{
  return MEMORY[0x270F3EE48]();
}

uint64_t sub_253270CC8()
{
  return MEMORY[0x270F3EE50]();
}

uint64_t sub_253270CD8()
{
  return MEMORY[0x270F3EE58]();
}

uint64_t sub_253270CE8()
{
  return MEMORY[0x270F3EE60]();
}

uint64_t sub_253270CF8()
{
  return MEMORY[0x270F3EE68]();
}

uint64_t sub_253270D08()
{
  return MEMORY[0x270F3EE70]();
}

uint64_t sub_253270D18()
{
  return MEMORY[0x270F3EE78]();
}

uint64_t sub_253270D28()
{
  return MEMORY[0x270F3EE80]();
}

uint64_t sub_253270D38()
{
  return MEMORY[0x270F3EE88]();
}

uint64_t sub_253270D48()
{
  return MEMORY[0x270F3EE90]();
}

uint64_t sub_253270D58()
{
  return MEMORY[0x270F3EE98]();
}

uint64_t sub_253270D68()
{
  return MEMORY[0x270F3EEA0]();
}

uint64_t sub_253270D78()
{
  return MEMORY[0x270F3EEA8]();
}

uint64_t sub_253270D88()
{
  return MEMORY[0x270F3EEB0]();
}

uint64_t sub_253270D98()
{
  return MEMORY[0x270F3EEB8]();
}

uint64_t sub_253270DA8()
{
  return MEMORY[0x270F3EEC0]();
}

uint64_t sub_253270DB8()
{
  return MEMORY[0x270F3EEC8]();
}

uint64_t sub_253270DC8()
{
  return MEMORY[0x270F3EED0]();
}

uint64_t sub_253270DD8()
{
  return MEMORY[0x270F3EED8]();
}

uint64_t sub_253270DE8()
{
  return MEMORY[0x270F3EEE0]();
}

uint64_t sub_253270DF8()
{
  return MEMORY[0x270F3EEE8]();
}

uint64_t sub_253270E08()
{
  return MEMORY[0x270F3EEF0]();
}

uint64_t sub_253270E18()
{
  return MEMORY[0x270F3EEF8]();
}

uint64_t sub_253270E28()
{
  return MEMORY[0x270F3EF00]();
}

uint64_t sub_253270E38()
{
  return MEMORY[0x270F3EF08]();
}

uint64_t sub_253270E48()
{
  return MEMORY[0x270F3EF10]();
}

uint64_t sub_253270E58()
{
  return MEMORY[0x270F3EF18]();
}

uint64_t sub_253270E68()
{
  return MEMORY[0x270F3EF38]();
}

uint64_t sub_253270E78()
{
  return MEMORY[0x270F3EF40]();
}

uint64_t sub_253270E88()
{
  return MEMORY[0x270F3EF48]();
}

uint64_t sub_253270E98()
{
  return MEMORY[0x270F3EF58]();
}

uint64_t sub_253270EA8()
{
  return MEMORY[0x270F64A78]();
}

uint64_t sub_253270EB8()
{
  return MEMORY[0x270F64A90]();
}

uint64_t sub_253270EC8()
{
  return MEMORY[0x270F64A98]();
}

uint64_t sub_253270ED8()
{
  return MEMORY[0x270F64AA8]();
}

uint64_t sub_253270EE8()
{
  return MEMORY[0x270F64CB8]();
}

uint64_t sub_253270EF8()
{
  return MEMORY[0x270F64CD8]();
}

uint64_t sub_253270F08()
{
  return MEMORY[0x270F64CF0]();
}

uint64_t sub_253270F18()
{
  return MEMORY[0x270F64CF8]();
}

uint64_t sub_253270F28()
{
  return MEMORY[0x270F64D00]();
}

uint64_t sub_253270F38()
{
  return MEMORY[0x270F64D10]();
}

uint64_t sub_253270F48()
{
  return MEMORY[0x270F64D18]();
}

uint64_t sub_253270F58()
{
  return MEMORY[0x270F64D48]();
}

uint64_t sub_253270F68()
{
  return MEMORY[0x270F64D50]();
}

uint64_t sub_253270F78()
{
  return MEMORY[0x270F64D58]();
}

uint64_t sub_253270F88()
{
  return MEMORY[0x270F64E20]();
}

uint64_t sub_253270F98()
{
  return MEMORY[0x270F64E28]();
}

uint64_t sub_253270FA8()
{
  return MEMORY[0x270F64E98]();
}

uint64_t sub_253270FB8()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_253270FD8()
{
  return MEMORY[0x270F64F60]();
}

uint64_t sub_253270FE8()
{
  return MEMORY[0x270F64F80]();
}

uint64_t sub_253270FF8()
{
  return MEMORY[0x270F64F88]();
}

uint64_t sub_253271008()
{
  return MEMORY[0x270F64F90]();
}

uint64_t sub_253271018()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_253271028()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_253271038()
{
  return MEMORY[0x270F64FB0]();
}

uint64_t sub_253271048()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_253271058()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_253271068()
{
  return MEMORY[0x270F65138]();
}

uint64_t sub_253271078()
{
  return MEMORY[0x270F65140]();
}

uint64_t sub_253271088()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_253271098()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_2532710A8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2532710B8()
{
  return MEMORY[0x270FA2A78]();
}

uint64_t sub_2532710C8()
{
  return MEMORY[0x270FA2A80]();
}

uint64_t sub_2532710D8()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_2532710E8()
{
  return MEMORY[0x270FA2AB0]();
}

uint64_t sub_2532710F8()
{
  return MEMORY[0x270FA2AB8]();
}

uint64_t sub_253271108()
{
  return MEMORY[0x270FA2AD0]();
}

uint64_t sub_253271118()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_253271128()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_253271138()
{
  return MEMORY[0x270F18148]();
}

uint64_t sub_253271148()
{
  return MEMORY[0x270F18150]();
}

uint64_t sub_253271158()
{
  return MEMORY[0x270F18158]();
}

uint64_t sub_253271168()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_253271178()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_253271188()
{
  return MEMORY[0x270F18170]();
}

uint64_t sub_253271198()
{
  return MEMORY[0x270F18178]();
}

uint64_t sub_2532711A8()
{
  return MEMORY[0x270F18180]();
}

uint64_t sub_2532711B8()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_2532711C8()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_2532711D8()
{
  return MEMORY[0x270F18198]();
}

uint64_t sub_2532711E8()
{
  return MEMORY[0x270F181A0]();
}

uint64_t sub_2532711F8()
{
  return MEMORY[0x270F181A8]();
}

uint64_t sub_253271208()
{
  return MEMORY[0x270F181B0]();
}

uint64_t sub_253271218()
{
  return MEMORY[0x270F18248]();
}

uint64_t sub_253271228()
{
  return MEMORY[0x270F18290]();
}

uint64_t sub_253271238()
{
  return MEMORY[0x270F2EE10]();
}

uint64_t sub_253271248()
{
  return MEMORY[0x270F2EE20]();
}

uint64_t sub_253271258()
{
  return MEMORY[0x270F2EE30]();
}

uint64_t sub_253271268()
{
  return MEMORY[0x270F2EE48]();
}

uint64_t sub_253271298()
{
  return MEMORY[0x270F41C10]();
}

uint64_t sub_2532712A8()
{
  return MEMORY[0x270F41C18]();
}

uint64_t sub_2532712B8()
{
  return MEMORY[0x270F41C28]();
}

uint64_t sub_2532712C8()
{
  return MEMORY[0x270F41C30]();
}

uint64_t sub_2532712D8()
{
  return MEMORY[0x270F41C38]();
}

uint64_t sub_2532712E8()
{
  return MEMORY[0x270F41C40]();
}

uint64_t sub_2532712F8()
{
  return MEMORY[0x270F41C48]();
}

uint64_t sub_253271308()
{
  return MEMORY[0x270F41C50]();
}

uint64_t sub_253271318()
{
  return MEMORY[0x270F41C58]();
}

uint64_t sub_253271328()
{
  return MEMORY[0x270F41C60]();
}

uint64_t sub_253271338()
{
  return MEMORY[0x270F41C68]();
}

uint64_t sub_253271348()
{
  return MEMORY[0x270F41C70]();
}

uint64_t sub_253271358()
{
  return MEMORY[0x270F41C78]();
}

uint64_t sub_253271368()
{
  return MEMORY[0x270F41C80]();
}

uint64_t sub_253271378()
{
  return MEMORY[0x270F41C88]();
}

uint64_t sub_253271388()
{
  return MEMORY[0x270F41C90]();
}

uint64_t sub_253271398()
{
  return MEMORY[0x270F41C98]();
}

uint64_t sub_2532713A8()
{
  return MEMORY[0x270F41CA0]();
}

uint64_t sub_2532713B8()
{
  return MEMORY[0x270F41CA8]();
}

uint64_t sub_2532713C8()
{
  return MEMORY[0x270F41CB0]();
}

uint64_t sub_2532713D8()
{
  return MEMORY[0x270F41CB8]();
}

uint64_t sub_2532713E8()
{
  return MEMORY[0x270F41CC0]();
}

uint64_t sub_2532713F8()
{
  return MEMORY[0x270F41D28]();
}

uint64_t sub_253271408()
{
  return MEMORY[0x270F41D38]();
}

uint64_t sub_253271418()
{
  return MEMORY[0x270F41D40]();
}

uint64_t sub_253271428()
{
  return MEMORY[0x270F41DC8]();
}

uint64_t sub_253271438()
{
  return MEMORY[0x270F41DD0]();
}

uint64_t sub_253271448()
{
  return MEMORY[0x270F41E38]();
}

uint64_t sub_253271458()
{
  return MEMORY[0x270F41E40]();
}

uint64_t sub_253271468()
{
  return MEMORY[0x270F41E48]();
}

uint64_t sub_253271478()
{
  return MEMORY[0x270F41E50]();
}

uint64_t sub_253271488()
{
  return MEMORY[0x270F41198]();
}

uint64_t sub_253271498()
{
  return MEMORY[0x270F411A0]();
}

uint64_t sub_2532714A8()
{
  return MEMORY[0x270F411A8]();
}

uint64_t sub_2532714B8()
{
  return MEMORY[0x270F411B0]();
}

uint64_t sub_2532714C8()
{
  return MEMORY[0x270F411B8]();
}

uint64_t sub_2532714D8()
{
  return MEMORY[0x270F411C0]();
}

uint64_t sub_2532714E8()
{
  return MEMORY[0x270F411C8]();
}

uint64_t sub_2532714F8()
{
  return MEMORY[0x270F411D0]();
}

uint64_t sub_253271508()
{
  return MEMORY[0x270F411D8]();
}

uint64_t sub_253271518()
{
  return MEMORY[0x270F411E8]();
}

uint64_t sub_253271528()
{
  return MEMORY[0x270F411F8]();
}

uint64_t sub_253271538()
{
  return MEMORY[0x270F41218]();
}

uint64_t sub_253271548()
{
  return MEMORY[0x270F41220]();
}

uint64_t sub_253271558()
{
  return MEMORY[0x270F41228]();
}

uint64_t sub_253271568()
{
  return MEMORY[0x270F41230]();
}

uint64_t sub_253271578()
{
  return MEMORY[0x270F41238]();
}

uint64_t sub_253271588()
{
  return MEMORY[0x270F41248]();
}

uint64_t sub_253271598()
{
  return MEMORY[0x270F41250]();
}

uint64_t sub_2532715A8()
{
  return MEMORY[0x270F41258]();
}

uint64_t sub_2532715B8()
{
  return MEMORY[0x270F41270]();
}

uint64_t sub_2532715C8()
{
  return MEMORY[0x270F41278]();
}

uint64_t sub_2532715D8()
{
  return MEMORY[0x270F41280]();
}

uint64_t sub_2532715E8()
{
  return MEMORY[0x270F41290]();
}

uint64_t sub_2532715F8()
{
  return MEMORY[0x270F41298]();
}

uint64_t sub_253271608()
{
  return MEMORY[0x270F412A0]();
}

uint64_t sub_253271618()
{
  return MEMORY[0x270F412A8]();
}

uint64_t sub_253271628()
{
  return MEMORY[0x270F412B0]();
}

uint64_t sub_253271638()
{
  return MEMORY[0x270F412B8]();
}

uint64_t sub_253271648()
{
  return MEMORY[0x270F412C0]();
}

uint64_t sub_253271658()
{
  return MEMORY[0x270F412C8]();
}

uint64_t sub_253271668()
{
  return MEMORY[0x270F412D8]();
}

uint64_t sub_253271678()
{
  return MEMORY[0x270F412E0]();
}

uint64_t sub_253271688()
{
  return MEMORY[0x270F412E8]();
}

uint64_t sub_253271698()
{
  return MEMORY[0x270F412F8]();
}

uint64_t sub_2532716A8()
{
  return MEMORY[0x270F41300]();
}

uint64_t sub_2532716B8()
{
  return MEMORY[0x270F41308]();
}

uint64_t sub_2532716C8()
{
  return MEMORY[0x270F41310]();
}

uint64_t sub_2532716D8()
{
  return MEMORY[0x270F41318]();
}

uint64_t sub_2532716E8()
{
  return MEMORY[0x270F41320]();
}

uint64_t sub_2532716F8()
{
  return MEMORY[0x270F41328]();
}

uint64_t sub_253271708()
{
  return MEMORY[0x270F41390]();
}

uint64_t sub_253271718()
{
  return MEMORY[0x270F41398]();
}

uint64_t sub_253271728()
{
  return MEMORY[0x270F413A0]();
}

uint64_t sub_253271738()
{
  return MEMORY[0x270F413A8]();
}

uint64_t sub_253271748()
{
  return MEMORY[0x270F413B0]();
}

uint64_t sub_253271758()
{
  return MEMORY[0x270F413B8]();
}

uint64_t sub_253271768()
{
  return MEMORY[0x270F413C0]();
}

uint64_t sub_253271778()
{
  return MEMORY[0x270F413C8]();
}

uint64_t sub_253271788()
{
  return MEMORY[0x270F413D0]();
}

uint64_t sub_253271798()
{
  return MEMORY[0x270F413D8]();
}

uint64_t sub_2532717A8()
{
  return MEMORY[0x270F413E0]();
}

uint64_t sub_2532717B8()
{
  return MEMORY[0x270F413E8]();
}

uint64_t sub_2532717C8()
{
  return MEMORY[0x270F413F0]();
}

uint64_t sub_2532717D8()
{
  return MEMORY[0x270F413F8]();
}

uint64_t sub_2532717E8()
{
  return MEMORY[0x270F41400]();
}

uint64_t sub_2532717F8()
{
  return MEMORY[0x270F41408]();
}

uint64_t sub_253271808()
{
  return MEMORY[0x270F41410]();
}

uint64_t sub_253271818()
{
  return MEMORY[0x270F41420]();
}

uint64_t sub_253271828()
{
  return MEMORY[0x270F41430]();
}

uint64_t sub_253271838()
{
  return MEMORY[0x270F41440]();
}

uint64_t sub_253271848()
{
  return MEMORY[0x270F41448]();
}

uint64_t sub_253271858()
{
  return MEMORY[0x270F41450]();
}

uint64_t sub_253271868()
{
  return MEMORY[0x270F41458]();
}

uint64_t sub_253271878()
{
  return MEMORY[0x270F41480]();
}

uint64_t sub_253271888()
{
  return MEMORY[0x270F41490]();
}

uint64_t sub_253271898()
{
  return MEMORY[0x270F414A0]();
}

uint64_t sub_2532718A8()
{
  return MEMORY[0x270F414B0]();
}

uint64_t sub_2532718B8()
{
  return MEMORY[0x270F414B8]();
}

uint64_t sub_2532718C8()
{
  return MEMORY[0x270F414C0]();
}

uint64_t sub_2532718D8()
{
  return MEMORY[0x270F414C8]();
}

uint64_t sub_2532718E8()
{
  return MEMORY[0x270F41500]();
}

uint64_t sub_2532718F8()
{
  return MEMORY[0x270F41508]();
}

uint64_t sub_253271908()
{
  return MEMORY[0x270F41510]();
}

uint64_t sub_253271918()
{
  return MEMORY[0x270F41518]();
}

uint64_t sub_253271928()
{
  return MEMORY[0x270F41528]();
}

uint64_t sub_253271938()
{
  return MEMORY[0x270F41530]();
}

uint64_t sub_253271948()
{
  return MEMORY[0x270F41538]();
}

uint64_t sub_253271958()
{
  return MEMORY[0x270F41540]();
}

uint64_t sub_253271968()
{
  return MEMORY[0x270F41548]();
}

uint64_t sub_253271978()
{
  return MEMORY[0x270F41550]();
}

uint64_t sub_253271988()
{
  return MEMORY[0x270F41558]();
}

uint64_t sub_253271998()
{
  return MEMORY[0x270F41570]();
}

uint64_t sub_2532719A8()
{
  return MEMORY[0x270F41578]();
}

uint64_t sub_2532719B8()
{
  return MEMORY[0x270F41580]();
}

uint64_t sub_2532719C8()
{
  return MEMORY[0x270F41588]();
}

uint64_t sub_2532719D8()
{
  return MEMORY[0x270F41598]();
}

uint64_t sub_2532719E8()
{
  return MEMORY[0x270F415A0]();
}

uint64_t sub_2532719F8()
{
  return MEMORY[0x270F415A8]();
}

uint64_t sub_253271A08()
{
  return MEMORY[0x270F415B0]();
}

uint64_t sub_253271A18()
{
  return MEMORY[0x270F415F0]();
}

uint64_t sub_253271A28()
{
  return MEMORY[0x270F41618]();
}

uint64_t sub_253271A38()
{
  return MEMORY[0x270F41620]();
}

uint64_t sub_253271A48()
{
  return MEMORY[0x270F41628]();
}

uint64_t sub_253271A58()
{
  return MEMORY[0x270F41638]();
}

uint64_t sub_253271A68()
{
  return MEMORY[0x270F41640]();
}

uint64_t sub_253271A78()
{
  return MEMORY[0x270F41698]();
}

uint64_t sub_253271A88()
{
  return MEMORY[0x270F416A0]();
}

uint64_t sub_253271A98()
{
  return MEMORY[0x270F416A8]();
}

uint64_t sub_253271AA8()
{
  return MEMORY[0x270F416B0]();
}

uint64_t sub_253271AB8()
{
  return MEMORY[0x270F416C0]();
}

uint64_t sub_253271AC8()
{
  return MEMORY[0x270F416C8]();
}

uint64_t sub_253271AD8()
{
  return MEMORY[0x270F416D0]();
}

uint64_t sub_253271AE8()
{
  return MEMORY[0x270F416D8]();
}

uint64_t sub_253271AF8()
{
  return MEMORY[0x270F416E8]();
}

uint64_t sub_253271B08()
{
  return MEMORY[0x270F416F0]();
}

uint64_t sub_253271B18()
{
  return MEMORY[0x270F417A0]();
}

uint64_t sub_253271B28()
{
  return MEMORY[0x270F417B0]();
}

uint64_t sub_253271B38()
{
  return MEMORY[0x270F417C0]();
}

uint64_t sub_253271B48()
{
  return MEMORY[0x270F417D8]();
}

uint64_t sub_253271B58()
{
  return MEMORY[0x270F417E0]();
}

uint64_t sub_253271B68()
{
  return MEMORY[0x270F417E8]();
}

uint64_t sub_253271B78()
{
  return MEMORY[0x270F417F0]();
}

uint64_t sub_253271B88()
{
  return MEMORY[0x270F417F8]();
}

uint64_t sub_253271B98()
{
  return MEMORY[0x270F41800]();
}

uint64_t sub_253271BA8()
{
  return MEMORY[0x270F41810]();
}

uint64_t sub_253271BB8()
{
  return MEMORY[0x270F41848]();
}

uint64_t sub_253271BC8()
{
  return MEMORY[0x270F41850]();
}

uint64_t sub_253271BD8()
{
  return MEMORY[0x270F41860]();
}

uint64_t sub_253271BE8()
{
  return MEMORY[0x270F41868]();
}

uint64_t sub_253271BF8()
{
  return MEMORY[0x270F41870]();
}

uint64_t sub_253271C08()
{
  return MEMORY[0x270F41878]();
}

uint64_t sub_253271C18()
{
  return MEMORY[0x270F41880]();
}

uint64_t sub_253271C28()
{
  return MEMORY[0x270F41888]();
}

uint64_t sub_253271C38()
{
  return MEMORY[0x270F41890]();
}

uint64_t sub_253271C48()
{
  return MEMORY[0x270F41898]();
}

uint64_t sub_253271C58()
{
  return MEMORY[0x270F418A0]();
}

uint64_t sub_253271C68()
{
  return MEMORY[0x270F418A8]();
}

uint64_t sub_253271C78()
{
  return MEMORY[0x270F418B0]();
}

uint64_t sub_253271C88()
{
  return MEMORY[0x270F418B8]();
}

uint64_t sub_253271C98()
{
  return MEMORY[0x270F418C8]();
}

uint64_t sub_253271CA8()
{
  return MEMORY[0x270F418D0]();
}

uint64_t sub_253271CB8()
{
  return MEMORY[0x270F418D8]();
}

uint64_t sub_253271CC8()
{
  return MEMORY[0x270F41900]();
}

uint64_t sub_253271CD8()
{
  return MEMORY[0x270F41910]();
}

uint64_t sub_253271CE8()
{
  return MEMORY[0x270F41920]();
}

uint64_t sub_253271CF8()
{
  return MEMORY[0x270F41928]();
}

uint64_t sub_253271D08()
{
  return MEMORY[0x270F41930]();
}

uint64_t sub_253271D18()
{
  return MEMORY[0x270F41940]();
}

uint64_t sub_253271D28()
{
  return MEMORY[0x270F41948]();
}

uint64_t sub_253271D38()
{
  return MEMORY[0x270F41950]();
}

uint64_t sub_253271D48()
{
  return MEMORY[0x270F41960]();
}

uint64_t sub_253271D58()
{
  return MEMORY[0x270F41968]();
}

uint64_t sub_253271D68()
{
  return MEMORY[0x270F41970]();
}

uint64_t sub_253271D78()
{
  return MEMORY[0x270F41988]();
}

uint64_t sub_253271D88()
{
  return MEMORY[0x270F41990]();
}

uint64_t sub_253271D98()
{
  return MEMORY[0x270F41998]();
}

uint64_t sub_253271DA8()
{
  return MEMORY[0x270F419A0]();
}

uint64_t sub_253271DB8()
{
  return MEMORY[0x270F419A8]();
}

uint64_t sub_253271DC8()
{
  return MEMORY[0x270F419B0]();
}

uint64_t sub_253271DD8()
{
  return MEMORY[0x270F419B8]();
}

uint64_t sub_253271DE8()
{
  return MEMORY[0x270F419C0]();
}

uint64_t sub_253271DF8()
{
  return MEMORY[0x270F419E0]();
}

uint64_t sub_253271E08()
{
  return MEMORY[0x270F419E8]();
}

uint64_t sub_253271E18()
{
  return MEMORY[0x270F419F0]();
}

uint64_t sub_253271E28()
{
  return MEMORY[0x270F419F8]();
}

uint64_t sub_253271E38()
{
  return MEMORY[0x270F41A00]();
}

uint64_t sub_253271E48()
{
  return MEMORY[0x270F41A10]();
}

uint64_t sub_253271E58()
{
  return MEMORY[0x270F41A18]();
}

uint64_t sub_253271E68()
{
  return MEMORY[0x270F41A20]();
}

uint64_t sub_253271E78()
{
  return MEMORY[0x270F41A28]();
}

uint64_t sub_253271E88()
{
  return MEMORY[0x270F41A30]();
}

uint64_t sub_253271E98()
{
  return MEMORY[0x270F41A38]();
}

uint64_t sub_253271EA8()
{
  return MEMORY[0x270F41A50]();
}

uint64_t sub_253271EB8()
{
  return MEMORY[0x270F41A58]();
}

uint64_t sub_253271EC8()
{
  return MEMORY[0x270F41A60]();
}

uint64_t sub_253271ED8()
{
  return MEMORY[0x270F41A70]();
}

uint64_t sub_253271EE8()
{
  return MEMORY[0x270F41A78]();
}

uint64_t sub_253271EF8()
{
  return MEMORY[0x270F41A80]();
}

uint64_t sub_253271F08()
{
  return MEMORY[0x270F41A90]();
}

uint64_t sub_253271F18()
{
  return MEMORY[0x270F41A98]();
}

uint64_t sub_253271F28()
{
  return MEMORY[0x270F41AA8]();
}

uint64_t sub_253271F38()
{
  return MEMORY[0x270F41AC8]();
}

uint64_t sub_253271F48()
{
  return MEMORY[0x270F41AD0]();
}

uint64_t sub_253271F58()
{
  return MEMORY[0x270F41AE0]();
}

uint64_t sub_253271F68()
{
  return MEMORY[0x270F41AE8]();
}

uint64_t sub_253271F78()
{
  return MEMORY[0x270F57600]();
}

uint64_t sub_253271F88()
{
  return MEMORY[0x270F57648]();
}

uint64_t sub_253271F98()
{
  return MEMORY[0x270F57660]();
}

uint64_t sub_253271FA8()
{
  return MEMORY[0x270F57690]();
}

uint64_t sub_253271FB8()
{
  return MEMORY[0x270F576A0]();
}

uint64_t sub_253271FC8()
{
  return MEMORY[0x270F576B0]();
}

uint64_t sub_253271FD8()
{
  return MEMORY[0x270F576B8]();
}

uint64_t sub_253271FE8()
{
  return MEMORY[0x270F576C0]();
}

uint64_t sub_253271FF8()
{
  return MEMORY[0x270F576C8]();
}

uint64_t sub_253272008()
{
  return MEMORY[0x270F576D0]();
}

uint64_t sub_253272018()
{
  return MEMORY[0x270F57730]();
}

uint64_t sub_253272038()
{
  return MEMORY[0x270F57748]();
}

uint64_t sub_253272058()
{
  return MEMORY[0x270F57758]();
}

uint64_t sub_253272068()
{
  return MEMORY[0x270F57760]();
}

uint64_t sub_253272078()
{
  return MEMORY[0x270F57768]();
}

uint64_t sub_253272098()
{
  return MEMORY[0x270F57778]();
}

uint64_t sub_2532720A8()
{
  return MEMORY[0x270F57780]();
}

uint64_t sub_2532720B8()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_2532720C8()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_2532720D8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2532720E8()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2532720F8()
{
  return MEMORY[0x270F3EF98]();
}

uint64_t sub_253272108()
{
  return MEMORY[0x270F3EFA0]();
}

uint64_t sub_253272118()
{
  return MEMORY[0x270F3EFA8]();
}

uint64_t sub_253272128()
{
  return MEMORY[0x270F3EFB0]();
}

uint64_t sub_253272138()
{
  return MEMORY[0x270F3EFB8]();
}

uint64_t sub_253272158()
{
  return MEMORY[0x270F3EFD0]();
}

uint64_t sub_253272168()
{
  return MEMORY[0x270F3EFD8]();
}

uint64_t sub_253272178()
{
  return MEMORY[0x270F3F0A8]();
}

uint64_t sub_253272188()
{
  return MEMORY[0x270F3F188]();
}

uint64_t sub_253272198()
{
  return MEMORY[0x270F3F1B8]();
}

uint64_t sub_2532721B8()
{
  return MEMORY[0x270F3F1E0]();
}

uint64_t sub_2532721C8()
{
  return MEMORY[0x270F3F1E8]();
}

uint64_t sub_2532721D8()
{
  return MEMORY[0x270F3F360]();
}

uint64_t sub_2532721E8()
{
  return MEMORY[0x270F3F370]();
}

uint64_t sub_2532721F8()
{
  return MEMORY[0x270F3F418]();
}

uint64_t sub_253272208()
{
  return MEMORY[0x270F3F428]();
}

uint64_t sub_253272218()
{
  return MEMORY[0x270F3F430]();
}

uint64_t sub_253272228()
{
  return MEMORY[0x270F3F438]();
}

uint64_t sub_253272238()
{
  return MEMORY[0x270F2FEB8]();
}

uint64_t sub_253272248()
{
  return MEMORY[0x270F2FEE0]();
}

uint64_t sub_253272258()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t sub_253272268()
{
  return MEMORY[0x270F3F860]();
}

uint64_t sub_253272278()
{
  return MEMORY[0x270F41F88]();
}

uint64_t sub_253272288()
{
  return MEMORY[0x270F41F90]();
}

uint64_t sub_253272298()
{
  return MEMORY[0x270F41FA0]();
}

uint64_t sub_2532722A8()
{
  return MEMORY[0x270F41FB0]();
}

uint64_t sub_2532722B8()
{
  return MEMORY[0x270F41FB8]();
}

uint64_t sub_2532722C8()
{
  return MEMORY[0x270F41FC0]();
}

uint64_t sub_2532722D8()
{
  return MEMORY[0x270F41FC8]();
}

uint64_t sub_2532722E8()
{
  return MEMORY[0x270F41FD0]();
}

uint64_t sub_2532722F8()
{
  return MEMORY[0x270F41FE0]();
}

uint64_t sub_253272308()
{
  return MEMORY[0x270F41FE8]();
}

uint64_t sub_253272318()
{
  return MEMORY[0x270F41FF0]();
}

uint64_t sub_253272328()
{
  return MEMORY[0x270F42470]();
}

uint64_t sub_253272338()
{
  return MEMORY[0x270F42478]();
}

uint64_t sub_253272348()
{
  return MEMORY[0x270F42480]();
}

uint64_t sub_253272358()
{
  return MEMORY[0x270F42488]();
}

uint64_t sub_253272368()
{
  return MEMORY[0x270F42490]();
}

uint64_t sub_253272378()
{
  return MEMORY[0x270F42498]();
}

uint64_t sub_253272388()
{
  return MEMORY[0x270F424A0]();
}

uint64_t sub_253272398()
{
  return MEMORY[0x270F424A8]();
}

uint64_t sub_2532723A8()
{
  return MEMORY[0x270F424B0]();
}

uint64_t sub_2532723B8()
{
  return MEMORY[0x270F424B8]();
}

uint64_t sub_2532723C8()
{
  return MEMORY[0x270F424C0]();
}

uint64_t sub_2532723D8()
{
  return MEMORY[0x270F424C8]();
}

uint64_t sub_2532723E8()
{
  return MEMORY[0x270F424D0]();
}

uint64_t sub_2532723F8()
{
  return MEMORY[0x270F424D8]();
}

uint64_t sub_253272408()
{
  return MEMORY[0x270F424E0]();
}

uint64_t sub_253272418()
{
  return MEMORY[0x270F424E8]();
}

uint64_t sub_253272428()
{
  return MEMORY[0x270F424F0]();
}

uint64_t sub_253272438()
{
  return MEMORY[0x270F424F8]();
}

uint64_t sub_253272448()
{
  return MEMORY[0x270F42500]();
}

uint64_t sub_253272458()
{
  return MEMORY[0x270F42508]();
}

uint64_t sub_253272468()
{
  return MEMORY[0x270F42510]();
}

uint64_t sub_253272478()
{
  return MEMORY[0x270F42518]();
}

uint64_t sub_253272488()
{
  return MEMORY[0x270F42520]();
}

uint64_t sub_253272498()
{
  return MEMORY[0x270F42528]();
}

uint64_t sub_2532724A8()
{
  return MEMORY[0x270F42530]();
}

uint64_t sub_2532724B8()
{
  return MEMORY[0x270F42538]();
}

uint64_t sub_2532724C8()
{
  return MEMORY[0x270F42540]();
}

uint64_t sub_2532724D8()
{
  return MEMORY[0x270F42548]();
}

uint64_t sub_2532724E8()
{
  return MEMORY[0x270F42550]();
}

uint64_t sub_2532724F8()
{
  return MEMORY[0x270F42558]();
}

uint64_t sub_253272508()
{
  return MEMORY[0x270F42560]();
}

uint64_t sub_253272518()
{
  return MEMORY[0x270F42568]();
}

uint64_t sub_253272528()
{
  return MEMORY[0x270F42570]();
}

uint64_t sub_253272538()
{
  return MEMORY[0x270F42578]();
}

uint64_t sub_253272548()
{
  return MEMORY[0x270F42580]();
}

uint64_t sub_253272558()
{
  return MEMORY[0x270F42588]();
}

uint64_t sub_253272568()
{
  return MEMORY[0x270F42590]();
}

uint64_t sub_253272578()
{
  return MEMORY[0x270F42598]();
}

uint64_t sub_253272588()
{
  return MEMORY[0x270F425A0]();
}

uint64_t sub_253272598()
{
  return MEMORY[0x270F425A8]();
}

uint64_t sub_2532725A8()
{
  return MEMORY[0x270F425B0]();
}

uint64_t sub_2532725B8()
{
  return MEMORY[0x270F425B8]();
}

uint64_t sub_2532725C8()
{
  return MEMORY[0x270F425C0]();
}

uint64_t sub_2532725D8()
{
  return MEMORY[0x270F425C8]();
}

uint64_t sub_2532725E8()
{
  return MEMORY[0x270F425D0]();
}

uint64_t sub_2532725F8()
{
  return MEMORY[0x270F425D8]();
}

uint64_t sub_253272608()
{
  return MEMORY[0x270F425E0]();
}

uint64_t sub_253272618()
{
  return MEMORY[0x270F425E8]();
}

uint64_t sub_253272628()
{
  return MEMORY[0x270F425F0]();
}

uint64_t sub_253272638()
{
  return MEMORY[0x270F425F8]();
}

uint64_t sub_253272648()
{
  return MEMORY[0x270F42600]();
}

uint64_t sub_253272658()
{
  return MEMORY[0x270F42608]();
}

uint64_t sub_253272668()
{
  return MEMORY[0x270F42610]();
}

uint64_t sub_253272678()
{
  return MEMORY[0x270F42618]();
}

uint64_t sub_253272688()
{
  return MEMORY[0x270F42620]();
}

uint64_t sub_253272698()
{
  return MEMORY[0x270F42628]();
}

uint64_t sub_2532726A8()
{
  return MEMORY[0x270F42630]();
}

uint64_t sub_2532726B8()
{
  return MEMORY[0x270F42638]();
}

uint64_t sub_2532726C8()
{
  return MEMORY[0x270F42640]();
}

uint64_t sub_2532726D8()
{
  return MEMORY[0x270F42648]();
}

uint64_t sub_2532726E8()
{
  return MEMORY[0x270F42650]();
}

uint64_t sub_2532726F8()
{
  return MEMORY[0x270F42658]();
}

uint64_t sub_253272708()
{
  return MEMORY[0x270F42660]();
}

uint64_t sub_253272718()
{
  return MEMORY[0x270F42668]();
}

uint64_t sub_253272738()
{
  return MEMORY[0x270F42678]();
}

uint64_t sub_253272748()
{
  return MEMORY[0x270F42680]();
}

uint64_t sub_253272758()
{
  return MEMORY[0x270F42688]();
}

uint64_t sub_253272768()
{
  return MEMORY[0x270F42690]();
}

uint64_t sub_253272778()
{
  return MEMORY[0x270F42698]();
}

uint64_t sub_253272788()
{
  return MEMORY[0x270F426A0]();
}

uint64_t sub_253272798()
{
  return MEMORY[0x270F426A8]();
}

uint64_t sub_2532727A8()
{
  return MEMORY[0x270F426B0]();
}

uint64_t sub_2532727B8()
{
  return MEMORY[0x270F426B8]();
}

uint64_t sub_2532727C8()
{
  return MEMORY[0x270F426C0]();
}

uint64_t sub_2532727D8()
{
  return MEMORY[0x270F426C8]();
}

uint64_t sub_2532727E8()
{
  return MEMORY[0x270F426D0]();
}

uint64_t sub_2532727F8()
{
  return MEMORY[0x270F426D8]();
}

uint64_t sub_253272808()
{
  return MEMORY[0x270F426E0]();
}

uint64_t sub_253272818()
{
  return MEMORY[0x270F426E8]();
}

uint64_t sub_253272828()
{
  return MEMORY[0x270F426F0]();
}

uint64_t sub_253272838()
{
  return MEMORY[0x270F426F8]();
}

uint64_t sub_253272848()
{
  return MEMORY[0x270F42700]();
}

uint64_t sub_253272858()
{
  return MEMORY[0x270F42708]();
}

uint64_t sub_253272868()
{
  return MEMORY[0x270F42710]();
}

uint64_t sub_253272878()
{
  return MEMORY[0x270F42718]();
}

uint64_t sub_253272888()
{
  return MEMORY[0x270F42AA8]();
}

uint64_t sub_253272898()
{
  return MEMORY[0x270F42AB0]();
}

uint64_t sub_2532728A8()
{
  return MEMORY[0x270F42AB8]();
}

uint64_t sub_2532728B8()
{
  return MEMORY[0x270F42AC0]();
}

uint64_t sub_2532728C8()
{
  return MEMORY[0x270F42AC8]();
}

uint64_t sub_2532728D8()
{
  return MEMORY[0x270F42AD0]();
}

uint64_t sub_2532728E8()
{
  return MEMORY[0x270F42AD8]();
}

uint64_t sub_2532728F8()
{
  return MEMORY[0x270F42AE0]();
}

uint64_t sub_253272908()
{
  return MEMORY[0x270F42AE8]();
}

uint64_t sub_253272918()
{
  return MEMORY[0x270F42AF0]();
}

uint64_t sub_253272928()
{
  return MEMORY[0x270F42AF8]();
}

uint64_t sub_253272938()
{
  return MEMORY[0x270F42B00]();
}

uint64_t sub_253272948()
{
  return MEMORY[0x270F42B08]();
}

uint64_t sub_253272958()
{
  return MEMORY[0x270F42B10]();
}

uint64_t sub_253272968()
{
  return MEMORY[0x270F42B18]();
}

uint64_t sub_253272978()
{
  return MEMORY[0x270F42B20]();
}

uint64_t sub_253272988()
{
  return MEMORY[0x270F42B28]();
}

uint64_t sub_253272998()
{
  return MEMORY[0x270F42B30]();
}

uint64_t sub_2532729A8()
{
  return MEMORY[0x270F42B38]();
}

uint64_t sub_2532729B8()
{
  return MEMORY[0x270F42B40]();
}

uint64_t sub_2532729C8()
{
  return MEMORY[0x270F42B48]();
}

uint64_t sub_2532729D8()
{
  return MEMORY[0x270F42B50]();
}

uint64_t sub_2532729E8()
{
  return MEMORY[0x270F42B58]();
}

uint64_t sub_2532729F8()
{
  return MEMORY[0x270F42B60]();
}

uint64_t sub_253272A08()
{
  return MEMORY[0x270F42B68]();
}

uint64_t sub_253272A18()
{
  return MEMORY[0x270F42B70]();
}

uint64_t sub_253272A28()
{
  return MEMORY[0x270F42B78]();
}

uint64_t sub_253272A38()
{
  return MEMORY[0x270F42B80]();
}

uint64_t sub_253272A48()
{
  return MEMORY[0x270F42B88]();
}

uint64_t sub_253272A58()
{
  return MEMORY[0x270F42B90]();
}

uint64_t sub_253272A68()
{
  return MEMORY[0x270F42B98]();
}

uint64_t sub_253272A78()
{
  return MEMORY[0x270F42BA0]();
}

uint64_t sub_253272A88()
{
  return MEMORY[0x270F42BA8]();
}

uint64_t sub_253272A98()
{
  return MEMORY[0x270F42BB0]();
}

uint64_t sub_253272AA8()
{
  return MEMORY[0x270F42BB8]();
}

uint64_t sub_253272AB8()
{
  return MEMORY[0x270F42BC0]();
}

uint64_t sub_253272AC8()
{
  return MEMORY[0x270F42BC8]();
}

uint64_t sub_253272AD8()
{
  return MEMORY[0x270F42BD0]();
}

uint64_t sub_253272AE8()
{
  return MEMORY[0x270F42BD8]();
}

uint64_t sub_253272AF8()
{
  return MEMORY[0x270F42BE0]();
}

uint64_t sub_253272B08()
{
  return MEMORY[0x270F42BE8]();
}

uint64_t sub_253272B18()
{
  return MEMORY[0x270F42BF0]();
}

uint64_t sub_253272B28()
{
  return MEMORY[0x270F42BF8]();
}

uint64_t sub_253272B38()
{
  return MEMORY[0x270F42C00]();
}

uint64_t sub_253272B48()
{
  return MEMORY[0x270F42C08]();
}

uint64_t sub_253272B58()
{
  return MEMORY[0x270F42C10]();
}

uint64_t sub_253272B68()
{
  return MEMORY[0x270F42C18]();
}

uint64_t sub_253272B78()
{
  return MEMORY[0x270F42C20]();
}

uint64_t sub_253272B88()
{
  return MEMORY[0x270F42C28]();
}

uint64_t sub_253272B98()
{
  return MEMORY[0x270F42C30]();
}

uint64_t sub_253272BA8()
{
  return MEMORY[0x270F42C38]();
}

uint64_t sub_253272BB8()
{
  return MEMORY[0x270F42C40]();
}

uint64_t sub_253272BC8()
{
  return MEMORY[0x270F42C48]();
}

uint64_t sub_253272BD8()
{
  return MEMORY[0x270F42C50]();
}

uint64_t sub_253272BE8()
{
  return MEMORY[0x270F42C58]();
}

uint64_t sub_253272BF8()
{
  return MEMORY[0x270F42C60]();
}

uint64_t sub_253272C08()
{
  return MEMORY[0x270F42C68]();
}

uint64_t sub_253272C18()
{
  return MEMORY[0x270F42C70]();
}

uint64_t sub_253272C28()
{
  return MEMORY[0x270F42C78]();
}

uint64_t sub_253272C38()
{
  return MEMORY[0x270F42C80]();
}

uint64_t sub_253272C48()
{
  return MEMORY[0x270F42C88]();
}

uint64_t sub_253272C58()
{
  return MEMORY[0x270F42C90]();
}

uint64_t sub_253272C68()
{
  return MEMORY[0x270F42C98]();
}

uint64_t sub_253272C78()
{
  return MEMORY[0x270F42CA0]();
}

uint64_t sub_253272C88()
{
  return MEMORY[0x270F42CA8]();
}

uint64_t sub_253272C98()
{
  return MEMORY[0x270F42CB0]();
}

uint64_t sub_253272CA8()
{
  return MEMORY[0x270F42CB8]();
}

uint64_t sub_253272CB8()
{
  return MEMORY[0x270F42CC0]();
}

uint64_t sub_253272CC8()
{
  return MEMORY[0x270F42CC8]();
}

uint64_t sub_253272CD8()
{
  return MEMORY[0x270F42CD0]();
}

uint64_t sub_253272CE8()
{
  return MEMORY[0x270F42CD8]();
}

uint64_t sub_253272CF8()
{
  return MEMORY[0x270F42CE0]();
}

uint64_t sub_253272D08()
{
  return MEMORY[0x270F42CE8]();
}

uint64_t sub_253272D18()
{
  return MEMORY[0x270F42CF0]();
}

uint64_t sub_253272D28()
{
  return MEMORY[0x270F42CF8]();
}

uint64_t sub_253272D38()
{
  return MEMORY[0x270F42D00]();
}

uint64_t sub_253272D48()
{
  return MEMORY[0x270F42D08]();
}

uint64_t sub_253272D58()
{
  return MEMORY[0x270F42D10]();
}

uint64_t sub_253272D68()
{
  return MEMORY[0x270F42D18]();
}

uint64_t sub_253272D78()
{
  return MEMORY[0x270F42D20]();
}

uint64_t sub_253272D88()
{
  return MEMORY[0x270F42D28]();
}

uint64_t sub_253272D98()
{
  return MEMORY[0x270F42D30]();
}

uint64_t sub_253272DA8()
{
  return MEMORY[0x270F42D38]();
}

uint64_t sub_253272DB8()
{
  return MEMORY[0x270F42D40]();
}

uint64_t sub_253272DC8()
{
  return MEMORY[0x270F42D48]();
}

uint64_t sub_253272DD8()
{
  return MEMORY[0x270F42D50]();
}

uint64_t sub_253272DE8()
{
  return MEMORY[0x270F42D58]();
}

uint64_t sub_253272DF8()
{
  return MEMORY[0x270F42D60]();
}

uint64_t sub_253272E08()
{
  return MEMORY[0x270F42D68]();
}

uint64_t sub_253272E18()
{
  return MEMORY[0x270F42D70]();
}

uint64_t sub_253272E28()
{
  return MEMORY[0x270F42D78]();
}

uint64_t sub_253272E38()
{
  return MEMORY[0x270F42D80]();
}

uint64_t sub_253272E48()
{
  return MEMORY[0x270F42D88]();
}

uint64_t sub_253272E58()
{
  return MEMORY[0x270F42D90]();
}

uint64_t sub_253272E68()
{
  return MEMORY[0x270F42D98]();
}

uint64_t sub_253272E78()
{
  return MEMORY[0x270F42DA0]();
}

uint64_t sub_253272E88()
{
  return MEMORY[0x270F42DA8]();
}

uint64_t sub_253272E98()
{
  return MEMORY[0x270F42DB0]();
}

uint64_t sub_253272EA8()
{
  return MEMORY[0x270F42DB8]();
}

uint64_t sub_253272EB8()
{
  return MEMORY[0x270F42DC0]();
}

uint64_t sub_253272EC8()
{
  return MEMORY[0x270F42DC8]();
}

uint64_t sub_253272ED8()
{
  return MEMORY[0x270F42DD0]();
}

uint64_t sub_253272EE8()
{
  return MEMORY[0x270F42DD8]();
}

uint64_t sub_253272EF8()
{
  return MEMORY[0x270F42DE0]();
}

uint64_t sub_253272F08()
{
  return MEMORY[0x270F42DE8]();
}

uint64_t sub_253272F18()
{
  return MEMORY[0x270F42DF0]();
}

uint64_t sub_253272F28()
{
  return MEMORY[0x270F42DF8]();
}

uint64_t sub_253272F38()
{
  return MEMORY[0x270F42E00]();
}

uint64_t sub_253272F48()
{
  return MEMORY[0x270F42E08]();
}

uint64_t sub_253272F58()
{
  return MEMORY[0x270F42E10]();
}

uint64_t sub_253272F68()
{
  return MEMORY[0x270F42E18]();
}

uint64_t sub_253272F78()
{
  return MEMORY[0x270F42E20]();
}

uint64_t sub_253272F88()
{
  return MEMORY[0x270F42E28]();
}

uint64_t sub_253272F98()
{
  return MEMORY[0x270F42E30]();
}

uint64_t sub_253272FA8()
{
  return MEMORY[0x270F42E38]();
}

uint64_t sub_253272FB8()
{
  return MEMORY[0x270F42E40]();
}

uint64_t sub_253272FC8()
{
  return MEMORY[0x270F42E48]();
}

uint64_t sub_253272FD8()
{
  return MEMORY[0x270F42E50]();
}

uint64_t sub_253272FE8()
{
  return MEMORY[0x270F42E58]();
}

uint64_t sub_253272FF8()
{
  return MEMORY[0x270F42E60]();
}

uint64_t sub_253273008()
{
  return MEMORY[0x270F42E68]();
}

uint64_t sub_253273018()
{
  return MEMORY[0x270F42E70]();
}

uint64_t sub_253273028()
{
  return MEMORY[0x270F42E78]();
}

uint64_t sub_253273038()
{
  return MEMORY[0x270F42E80]();
}

uint64_t sub_253273048()
{
  return MEMORY[0x270F42E88]();
}

uint64_t sub_253273058()
{
  return MEMORY[0x270F42E90]();
}

uint64_t sub_253273068()
{
  return MEMORY[0x270F42E98]();
}

uint64_t sub_253273078()
{
  return MEMORY[0x270F42EA0]();
}

uint64_t sub_253273088()
{
  return MEMORY[0x270F42EA8]();
}

uint64_t sub_253273098()
{
  return MEMORY[0x270F42EB0]();
}

uint64_t sub_2532730A8()
{
  return MEMORY[0x270F42EB8]();
}

uint64_t sub_2532730B8()
{
  return MEMORY[0x270F42EC0]();
}

uint64_t sub_2532730C8()
{
  return MEMORY[0x270F42EC8]();
}

uint64_t sub_2532730D8()
{
  return MEMORY[0x270F42ED0]();
}

uint64_t sub_2532730E8()
{
  return MEMORY[0x270F42ED8]();
}

uint64_t sub_2532730F8()
{
  return MEMORY[0x270F42EE0]();
}

uint64_t sub_253273108()
{
  return MEMORY[0x270F42EE8]();
}

uint64_t sub_253273118()
{
  return MEMORY[0x270F42EF0]();
}

uint64_t sub_253273128()
{
  return MEMORY[0x270F42EF8]();
}

uint64_t sub_253273138()
{
  return MEMORY[0x270F42F00]();
}

uint64_t sub_253273148()
{
  return MEMORY[0x270F42F08]();
}

uint64_t sub_253273158()
{
  return MEMORY[0x270F42F10]();
}

uint64_t sub_253273168()
{
  return MEMORY[0x270F42F18]();
}

uint64_t sub_253273178()
{
  return MEMORY[0x270F42F20]();
}

uint64_t sub_253273188()
{
  return MEMORY[0x270F42F28]();
}

uint64_t sub_253273198()
{
  return MEMORY[0x270F42F30]();
}

uint64_t sub_2532731A8()
{
  return MEMORY[0x270F42F38]();
}

uint64_t sub_2532731B8()
{
  return MEMORY[0x270F42F40]();
}

uint64_t sub_2532731C8()
{
  return MEMORY[0x270F42F48]();
}

uint64_t sub_2532731D8()
{
  return MEMORY[0x270F42F50]();
}

uint64_t sub_2532731E8()
{
  return MEMORY[0x270F42F58]();
}

uint64_t sub_2532731F8()
{
  return MEMORY[0x270F42F60]();
}

uint64_t sub_253273208()
{
  return MEMORY[0x270F42F68]();
}

uint64_t sub_253273218()
{
  return MEMORY[0x270F42F70]();
}

uint64_t sub_253273228()
{
  return MEMORY[0x270F42F78]();
}

uint64_t sub_253273238()
{
  return MEMORY[0x270F42F80]();
}

uint64_t sub_253273248()
{
  return MEMORY[0x270F42F88]();
}

uint64_t sub_253273258()
{
  return MEMORY[0x270F42F90]();
}

uint64_t sub_253273268()
{
  return MEMORY[0x270F42F98]();
}

uint64_t sub_253273278()
{
  return MEMORY[0x270F42FA0]();
}

uint64_t sub_253273288()
{
  return MEMORY[0x270F42FA8]();
}

uint64_t sub_253273298()
{
  return MEMORY[0x270F42FB0]();
}

uint64_t sub_2532732A8()
{
  return MEMORY[0x270F42FB8]();
}

uint64_t sub_2532732B8()
{
  return MEMORY[0x270F42FC0]();
}

uint64_t sub_2532732C8()
{
  return MEMORY[0x270F42FC8]();
}

uint64_t sub_2532732D8()
{
  return MEMORY[0x270F42FD0]();
}

uint64_t sub_2532732E8()
{
  return MEMORY[0x270F42FD8]();
}

uint64_t sub_2532732F8()
{
  return MEMORY[0x270F42FE0]();
}

uint64_t sub_253273308()
{
  return MEMORY[0x270F42FE8]();
}

uint64_t sub_253273318()
{
  return MEMORY[0x270F42FF0]();
}

uint64_t sub_253273328()
{
  return MEMORY[0x270F42FF8]();
}

uint64_t sub_253273338()
{
  return MEMORY[0x270F43000]();
}

uint64_t sub_253273348()
{
  return MEMORY[0x270F43008]();
}

uint64_t sub_253273358()
{
  return MEMORY[0x270F43010]();
}

uint64_t sub_253273368()
{
  return MEMORY[0x270F43018]();
}

uint64_t sub_253273378()
{
  return MEMORY[0x270F43020]();
}

uint64_t sub_253273388()
{
  return MEMORY[0x270F43028]();
}

uint64_t sub_253273398()
{
  return MEMORY[0x270F43030]();
}

uint64_t sub_2532733A8()
{
  return MEMORY[0x270F43038]();
}

uint64_t sub_2532733B8()
{
  return MEMORY[0x270F43040]();
}

uint64_t sub_2532733C8()
{
  return MEMORY[0x270F43048]();
}

uint64_t sub_2532733D8()
{
  return MEMORY[0x270F43050]();
}

uint64_t sub_2532733E8()
{
  return MEMORY[0x270F43058]();
}

uint64_t sub_2532733F8()
{
  return MEMORY[0x270F43060]();
}

uint64_t sub_253273408()
{
  return MEMORY[0x270F43068]();
}

uint64_t sub_253273418()
{
  return MEMORY[0x270F43070]();
}

uint64_t sub_253273428()
{
  return MEMORY[0x270F43078]();
}

uint64_t sub_253273438()
{
  return MEMORY[0x270F43080]();
}

uint64_t sub_253273448()
{
  return MEMORY[0x270F43088]();
}

uint64_t sub_253273458()
{
  return MEMORY[0x270F43090]();
}

uint64_t sub_253273468()
{
  return MEMORY[0x270F43098]();
}

uint64_t sub_253273478()
{
  return MEMORY[0x270F430A0]();
}

uint64_t sub_253273488()
{
  return MEMORY[0x270F430A8]();
}

uint64_t sub_253273498()
{
  return MEMORY[0x270F430B0]();
}

uint64_t sub_2532734A8()
{
  return MEMORY[0x270F430B8]();
}

uint64_t sub_2532734B8()
{
  return MEMORY[0x270F430C0]();
}

uint64_t sub_2532734C8()
{
  return MEMORY[0x270F430C8]();
}

uint64_t sub_2532734D8()
{
  return MEMORY[0x270F430D0]();
}

uint64_t sub_2532734E8()
{
  return MEMORY[0x270F430D8]();
}

uint64_t sub_2532734F8()
{
  return MEMORY[0x270F430E0]();
}

uint64_t sub_253273508()
{
  return MEMORY[0x270F430E8]();
}

uint64_t sub_253273518()
{
  return MEMORY[0x270F430F0]();
}

uint64_t sub_253273528()
{
  return MEMORY[0x270F430F8]();
}

uint64_t sub_253273538()
{
  return MEMORY[0x270F43100]();
}

uint64_t sub_253273548()
{
  return MEMORY[0x270F43108]();
}

uint64_t sub_253273558()
{
  return MEMORY[0x270F43110]();
}

uint64_t sub_253273568()
{
  return MEMORY[0x270F43118]();
}

uint64_t sub_253273578()
{
  return MEMORY[0x270F43120]();
}

uint64_t sub_253273588()
{
  return MEMORY[0x270F43128]();
}

uint64_t sub_253273598()
{
  return MEMORY[0x270F43130]();
}

uint64_t sub_2532735A8()
{
  return MEMORY[0x270F43138]();
}

uint64_t sub_2532735B8()
{
  return MEMORY[0x270F43140]();
}

uint64_t sub_2532735C8()
{
  return MEMORY[0x270F43148]();
}

uint64_t sub_2532735D8()
{
  return MEMORY[0x270F43150]();
}

uint64_t sub_2532735E8()
{
  return MEMORY[0x270F43158]();
}

uint64_t sub_2532735F8()
{
  return MEMORY[0x270F43160]();
}

uint64_t sub_253273608()
{
  return MEMORY[0x270F43168]();
}

uint64_t sub_253273618()
{
  return MEMORY[0x270F43170]();
}

uint64_t sub_253273628()
{
  return MEMORY[0x270F43178]();
}

uint64_t sub_253273638()
{
  return MEMORY[0x270F43180]();
}

uint64_t sub_253273648()
{
  return MEMORY[0x270F43188]();
}

uint64_t sub_253273658()
{
  return MEMORY[0x270F43190]();
}

uint64_t sub_253273668()
{
  return MEMORY[0x270F43198]();
}

uint64_t sub_253273678()
{
  return MEMORY[0x270F431A0]();
}

uint64_t sub_253273688()
{
  return MEMORY[0x270F431A8]();
}

uint64_t sub_253273698()
{
  return MEMORY[0x270F431B0]();
}

uint64_t sub_2532736A8()
{
  return MEMORY[0x270F431B8]();
}

uint64_t sub_2532736B8()
{
  return MEMORY[0x270F431C0]();
}

uint64_t sub_2532736C8()
{
  return MEMORY[0x270F431C8]();
}

uint64_t sub_2532736D8()
{
  return MEMORY[0x270F431D0]();
}

uint64_t sub_2532736E8()
{
  return MEMORY[0x270F431D8]();
}

uint64_t sub_2532736F8()
{
  return MEMORY[0x270F431E0]();
}

uint64_t sub_253273708()
{
  return MEMORY[0x270F431E8]();
}

uint64_t sub_253273718()
{
  return MEMORY[0x270F431F0]();
}

uint64_t sub_253273728()
{
  return MEMORY[0x270F431F8]();
}

uint64_t sub_253273738()
{
  return MEMORY[0x270F43200]();
}

uint64_t sub_253273748()
{
  return MEMORY[0x270F43208]();
}

uint64_t sub_253273758()
{
  return MEMORY[0x270F43288]();
}

uint64_t sub_253273768()
{
  return MEMORY[0x270F43298]();
}

uint64_t sub_253273778()
{
  return MEMORY[0x270F432A0]();
}

uint64_t sub_253273788()
{
  return MEMORY[0x270F432A8]();
}

uint64_t sub_253273798()
{
  return MEMORY[0x270F433D8]();
}

uint64_t sub_2532737A8()
{
  return MEMORY[0x270F43438]();
}

uint64_t sub_2532737B8()
{
  return MEMORY[0x270F43530]();
}

uint64_t sub_2532737C8()
{
  return MEMORY[0x270F43558]();
}

uint64_t sub_2532737D8()
{
  return MEMORY[0x270F441B8]();
}

uint64_t sub_2532737E8()
{
  return MEMORY[0x270F441C0]();
}

uint64_t sub_2532737F8()
{
  return MEMORY[0x270F441C8]();
}

uint64_t sub_253273808()
{
  return MEMORY[0x270F441D0]();
}

uint64_t sub_253273818()
{
  return MEMORY[0x270F441D8]();
}

uint64_t sub_253273828()
{
  return MEMORY[0x270F441E0]();
}

uint64_t sub_253273838()
{
  return MEMORY[0x270F441E8]();
}

uint64_t sub_253273848()
{
  return MEMORY[0x270F441F0]();
}

uint64_t sub_253273858()
{
  return MEMORY[0x270F44208]();
}

uint64_t sub_253273868()
{
  return MEMORY[0x270F44210]();
}

uint64_t sub_253273878()
{
  return MEMORY[0x270F2F158]();
}

uint64_t sub_253273888()
{
  return MEMORY[0x270F2F2A8]();
}

uint64_t sub_253273898()
{
  return MEMORY[0x270F2F2D0]();
}

uint64_t sub_2532738A8()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_2532738B8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2532738C8()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_2532738D8()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2532738E8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2532738F8()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_253273908()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_253273918()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_253273928()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_253273938()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_253273948()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_253273958()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_253273968()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_253273978()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_253273988()
{
  return MEMORY[0x270F3F890]();
}

uint64_t sub_253273998()
{
  return MEMORY[0x270F3F898]();
}

uint64_t sub_2532739A8()
{
  return MEMORY[0x270F3F8A0]();
}

uint64_t sub_2532739B8()
{
  return MEMORY[0x270F3F8A8]();
}

uint64_t sub_2532739C8()
{
  return MEMORY[0x270F3F8B0]();
}

uint64_t sub_2532739D8()
{
  return MEMORY[0x270F3F8B8]();
}

uint64_t sub_2532739E8()
{
  return MEMORY[0x270F3F8D8]();
}

uint64_t sub_2532739F8()
{
  return MEMORY[0x270F3F8E8]();
}

uint64_t sub_253273A08()
{
  return MEMORY[0x270F3F900]();
}

uint64_t sub_253273A18()
{
  return MEMORY[0x270F3F918]();
}

uint64_t sub_253273A28()
{
  return MEMORY[0x270F3F920]();
}

uint64_t sub_253273A38()
{
  return MEMORY[0x270F3F928]();
}

uint64_t sub_253273A48()
{
  return MEMORY[0x270F3F930]();
}

uint64_t sub_253273A58()
{
  return MEMORY[0x270F3F938]();
}

uint64_t sub_253273A68()
{
  return MEMORY[0x270F3F940]();
}

uint64_t sub_253273A78()
{
  return MEMORY[0x270F3F948]();
}

uint64_t sub_253273A88()
{
  return MEMORY[0x270F3F950]();
}

uint64_t sub_253273A98()
{
  return MEMORY[0x270F3F958]();
}

uint64_t sub_253273AA8()
{
  return MEMORY[0x270F3F960]();
}

uint64_t sub_253273AB8()
{
  return MEMORY[0x270F3F970]();
}

uint64_t sub_253273AC8()
{
  return MEMORY[0x270F3F978]();
}

uint64_t sub_253273AD8()
{
  return MEMORY[0x270F3F980]();
}

uint64_t sub_253273AE8()
{
  return MEMORY[0x270F3F990]();
}

uint64_t sub_253273AF8()
{
  return MEMORY[0x270F3F998]();
}

uint64_t sub_253273B08()
{
  return MEMORY[0x270F3F9A0]();
}

uint64_t sub_253273B18()
{
  return MEMORY[0x270F3F9A8]();
}

uint64_t sub_253273B28()
{
  return MEMORY[0x270F3F9B8]();
}

uint64_t sub_253273B38()
{
  return MEMORY[0x270F3F9C0]();
}

uint64_t sub_253273B48()
{
  return MEMORY[0x270F3F9C8]();
}

uint64_t sub_253273B58()
{
  return MEMORY[0x270F3F9D0]();
}

uint64_t sub_253273B68()
{
  return MEMORY[0x270F3F9E0]();
}

uint64_t sub_253273B78()
{
  return MEMORY[0x270F3F9E8]();
}

uint64_t sub_253273B88()
{
  return MEMORY[0x270F3F9F0]();
}

uint64_t sub_253273B98()
{
  return MEMORY[0x270F3F9F8]();
}

uint64_t sub_253273BA8()
{
  return MEMORY[0x270F3FA00]();
}

uint64_t sub_253273BB8()
{
  return MEMORY[0x270F3FA08]();
}

uint64_t sub_253273BC8()
{
  return MEMORY[0x270F3FA10]();
}

uint64_t sub_253273BD8()
{
  return MEMORY[0x270F3FA20]();
}

uint64_t sub_253273BE8()
{
  return MEMORY[0x270F3FA28]();
}

uint64_t sub_253273BF8()
{
  return MEMORY[0x270F3FA38]();
}

uint64_t sub_253273C08()
{
  return MEMORY[0x270F3FA50]();
}

uint64_t sub_253273C18()
{
  return MEMORY[0x270F3FA68]();
}

uint64_t sub_253273C28()
{
  return MEMORY[0x270F3FA70]();
}

uint64_t sub_253273C38()
{
  return MEMORY[0x270F3FA78]();
}

uint64_t sub_253273C48()
{
  return MEMORY[0x270F3FA90]();
}

uint64_t sub_253273C58()
{
  return MEMORY[0x270F3FA98]();
}

uint64_t sub_253273C68()
{
  return MEMORY[0x270F3FAA0]();
}

uint64_t sub_253273C78()
{
  return MEMORY[0x270F3FAA8]();
}

uint64_t sub_253273C88()
{
  return MEMORY[0x270F3FAB0]();
}

uint64_t sub_253273C98()
{
  return MEMORY[0x270F3FAC8]();
}

uint64_t sub_253273CA8()
{
  return MEMORY[0x270F3FAD0]();
}

uint64_t sub_253273CB8()
{
  return MEMORY[0x270F3FAE0]();
}

uint64_t sub_253273CC8()
{
  return MEMORY[0x270F3FAE8]();
}

uint64_t sub_253273CD8()
{
  return MEMORY[0x270F3FAF0]();
}

uint64_t sub_253273CE8()
{
  return MEMORY[0x270F3FAF8]();
}

uint64_t sub_253273CF8()
{
  return MEMORY[0x270F3FB00]();
}

uint64_t sub_253273D08()
{
  return MEMORY[0x270F3FB08]();
}

uint64_t sub_253273D18()
{
  return MEMORY[0x270F3FB10]();
}

uint64_t sub_253273D28()
{
  return MEMORY[0x270F3FB18]();
}

uint64_t sub_253273D38()
{
  return MEMORY[0x270F3FB20]();
}

uint64_t sub_253273D48()
{
  return MEMORY[0x270F3FB28]();
}

uint64_t sub_253273D58()
{
  return MEMORY[0x270F3FB40]();
}

uint64_t sub_253273D68()
{
  return MEMORY[0x270F3FB48]();
}

uint64_t sub_253273D78()
{
  return MEMORY[0x270F3FB50]();
}

uint64_t sub_253273D88()
{
  return MEMORY[0x270F3FB58]();
}

uint64_t sub_253273D98()
{
  return MEMORY[0x270F3FB60]();
}

uint64_t sub_253273DA8()
{
  return MEMORY[0x270F3FB68]();
}

uint64_t sub_253273DB8()
{
  return MEMORY[0x270F3FB70]();
}

uint64_t sub_253273DC8()
{
  return MEMORY[0x270F3FBC8]();
}

uint64_t sub_253273DD8()
{
  return MEMORY[0x270F3FBE8]();
}

uint64_t sub_253273DE8()
{
  return MEMORY[0x270F3FBF0]();
}

uint64_t sub_253273DF8()
{
  return MEMORY[0x270F3FBF8]();
}

uint64_t sub_253273E08()
{
  return MEMORY[0x270F3FC00]();
}

uint64_t sub_253273E18()
{
  return MEMORY[0x270F3FC08]();
}

uint64_t sub_253273E28()
{
  return MEMORY[0x270F3FC10]();
}

uint64_t sub_253273E38()
{
  return MEMORY[0x270F3FC18]();
}

uint64_t sub_253273E48()
{
  return MEMORY[0x270F3FC20]();
}

uint64_t sub_253273E58()
{
  return MEMORY[0x270F3FC28]();
}

uint64_t sub_253273E68()
{
  return MEMORY[0x270F3FC30]();
}

uint64_t sub_253273E78()
{
  return MEMORY[0x270F3FC38]();
}

uint64_t sub_253273E88()
{
  return MEMORY[0x270F3FC70]();
}

uint64_t sub_253273E98()
{
  return MEMORY[0x270F3FC78]();
}

uint64_t sub_253273EA8()
{
  return MEMORY[0x270F3FC80]();
}

uint64_t sub_253273EB8()
{
  return MEMORY[0x270F3FC88]();
}

uint64_t sub_253273EC8()
{
  return MEMORY[0x270F3FCA0]();
}

uint64_t sub_253273ED8()
{
  return MEMORY[0x270F3FCA8]();
}

uint64_t sub_253273EE8()
{
  return MEMORY[0x270F3FCB8]();
}

uint64_t sub_253273EF8()
{
  return MEMORY[0x270F3FCC0]();
}

uint64_t sub_253273F08()
{
  return MEMORY[0x270F3FCC8]();
}

uint64_t sub_253273F18()
{
  return MEMORY[0x270F3FCD0]();
}

uint64_t sub_253273F28()
{
  return MEMORY[0x270F3FCD8]();
}

uint64_t sub_253273F38()
{
  return MEMORY[0x270F3FD00]();
}

uint64_t sub_253273F48()
{
  return MEMORY[0x270F3FD08]();
}

uint64_t sub_253273F58()
{
  return MEMORY[0x270F3FD10]();
}

uint64_t sub_253273F68()
{
  return MEMORY[0x270F3FD18]();
}

uint64_t sub_253273F78()
{
  return MEMORY[0x270F3FD20]();
}

uint64_t sub_253273F88()
{
  return MEMORY[0x270F3FD28]();
}

uint64_t sub_253273F98()
{
  return MEMORY[0x270F3FD30]();
}

uint64_t sub_253273FA8()
{
  return MEMORY[0x270F3FD38]();
}

uint64_t sub_253273FB8()
{
  return MEMORY[0x270F3FD40]();
}

uint64_t sub_253273FC8()
{
  return MEMORY[0x270F3FD48]();
}

uint64_t sub_253273FD8()
{
  return MEMORY[0x270F3FD50]();
}

uint64_t sub_253273FE8()
{
  return MEMORY[0x270F3FD58]();
}

uint64_t sub_253273FF8()
{
  return MEMORY[0x270F3FD60]();
}

uint64_t sub_253274008()
{
  return MEMORY[0x270F3FD68]();
}

uint64_t sub_253274018()
{
  return MEMORY[0x270F3FD70]();
}

uint64_t sub_253274028()
{
  return MEMORY[0x270F3FD78]();
}

uint64_t sub_253274038()
{
  return MEMORY[0x270F3FD88]();
}

uint64_t sub_253274048()
{
  return MEMORY[0x270F3FD90]();
}

uint64_t sub_253274058()
{
  return MEMORY[0x270F3FD98]();
}

uint64_t sub_253274068()
{
  return MEMORY[0x270F3FDA0]();
}

uint64_t sub_253274078()
{
  return MEMORY[0x270F3FDA8]();
}

uint64_t sub_253274088()
{
  return MEMORY[0x270F3FDB0]();
}

uint64_t sub_253274098()
{
  return MEMORY[0x270F3FDC8]();
}

uint64_t sub_2532740A8()
{
  return MEMORY[0x270F3FDD0]();
}

uint64_t sub_2532740B8()
{
  return MEMORY[0x270F3FDD8]();
}

uint64_t sub_2532740C8()
{
  return MEMORY[0x270F3FDE0]();
}

uint64_t sub_2532740D8()
{
  return MEMORY[0x270F3FDE8]();
}

uint64_t sub_2532740E8()
{
  return MEMORY[0x270F3FDF0]();
}

uint64_t sub_2532740F8()
{
  return MEMORY[0x270F3FDF8]();
}

uint64_t sub_253274108()
{
  return MEMORY[0x270F3FE00]();
}

uint64_t sub_253274118()
{
  return MEMORY[0x270F3FE08]();
}

uint64_t sub_253274128()
{
  return MEMORY[0x270F3FE10]();
}

uint64_t sub_253274138()
{
  return MEMORY[0x270F3FE18]();
}

uint64_t sub_253274148()
{
  return MEMORY[0x270F3FE20]();
}

uint64_t sub_253274158()
{
  return MEMORY[0x270F3FE28]();
}

uint64_t sub_253274168()
{
  return MEMORY[0x270F3FE30]();
}

uint64_t sub_253274178()
{
  return MEMORY[0x270F3FE38]();
}

uint64_t sub_253274188()
{
  return MEMORY[0x270F3FE40]();
}

uint64_t sub_253274198()
{
  return MEMORY[0x270F3FE58]();
}

uint64_t sub_2532741A8()
{
  return MEMORY[0x270F3FE60]();
}

uint64_t sub_2532741B8()
{
  return MEMORY[0x270F3FE68]();
}

uint64_t sub_2532741C8()
{
  return MEMORY[0x270F3FE70]();
}

uint64_t sub_2532741D8()
{
  return MEMORY[0x270F3FE78]();
}

uint64_t sub_2532741E8()
{
  return MEMORY[0x270F3FE80]();
}

uint64_t sub_2532741F8()
{
  return MEMORY[0x270F3FE88]();
}

uint64_t sub_253274208()
{
  return MEMORY[0x270F3FE90]();
}

uint64_t sub_253274218()
{
  return MEMORY[0x270F3FE98]();
}

uint64_t sub_253274228()
{
  return MEMORY[0x270F3FEA0]();
}

uint64_t sub_253274238()
{
  return MEMORY[0x270F3FEA8]();
}

uint64_t sub_253274248()
{
  return MEMORY[0x270F3FEB0]();
}

uint64_t sub_253274258()
{
  return MEMORY[0x270F3FEB8]();
}

uint64_t sub_253274268()
{
  return MEMORY[0x270F3FEC0]();
}

uint64_t sub_253274278()
{
  return MEMORY[0x270F3FEC8]();
}

uint64_t sub_253274288()
{
  return MEMORY[0x270F3FF00]();
}

uint64_t sub_253274298()
{
  return MEMORY[0x270F3FF08]();
}

uint64_t sub_2532742A8()
{
  return MEMORY[0x270F3FF10]();
}

uint64_t sub_2532742B8()
{
  return MEMORY[0x270F3FF48]();
}

uint64_t sub_2532742C8()
{
  return MEMORY[0x270F3FF50]();
}

uint64_t sub_2532742D8()
{
  return MEMORY[0x270F3FF60]();
}

uint64_t sub_2532742E8()
{
  return MEMORY[0x270F3FF70]();
}

uint64_t sub_2532742F8()
{
  return MEMORY[0x270F3FF78]();
}

uint64_t sub_253274308()
{
  return MEMORY[0x270F3FF80]();
}

uint64_t sub_253274318()
{
  return MEMORY[0x270F3FF90]();
}

uint64_t sub_253274328()
{
  return MEMORY[0x270F3FF98]();
}

uint64_t sub_253274338()
{
  return MEMORY[0x270F3FFA0]();
}

uint64_t sub_253274348()
{
  return MEMORY[0x270F3FFA8]();
}

uint64_t sub_253274358()
{
  return MEMORY[0x270F3FFB0]();
}

uint64_t sub_253274368()
{
  return MEMORY[0x270F3FFB8]();
}

uint64_t sub_253274378()
{
  return MEMORY[0x270F3FFC0]();
}

uint64_t sub_253274388()
{
  return MEMORY[0x270F3FFC8]();
}

uint64_t sub_253274398()
{
  return MEMORY[0x270F3FFD0]();
}

uint64_t sub_2532743A8()
{
  return MEMORY[0x270F3FFD8]();
}

uint64_t sub_2532743B8()
{
  return MEMORY[0x270F3FFE0]();
}

uint64_t sub_2532743C8()
{
  return MEMORY[0x270F3FFE8]();
}

uint64_t sub_2532743D8()
{
  return MEMORY[0x270F3FFF0]();
}

uint64_t sub_2532743E8()
{
  return MEMORY[0x270F3FFF8]();
}

uint64_t sub_2532743F8()
{
  return MEMORY[0x270F40000]();
}

uint64_t sub_253274408()
{
  return MEMORY[0x270F40008]();
}

uint64_t sub_253274418()
{
  return MEMORY[0x270F40010]();
}

uint64_t sub_253274428()
{
  return MEMORY[0x270F40018]();
}

uint64_t sub_253274448()
{
  return MEMORY[0x270F40028]();
}

uint64_t sub_253274458()
{
  return MEMORY[0x270F40030]();
}

uint64_t sub_253274468()
{
  return MEMORY[0x270F40038]();
}

uint64_t sub_253274478()
{
  return MEMORY[0x270F40040]();
}

uint64_t sub_253274488()
{
  return MEMORY[0x270F40048]();
}

uint64_t sub_253274498()
{
  return MEMORY[0x270F40050]();
}

uint64_t sub_2532744A8()
{
  return MEMORY[0x270F40058]();
}

uint64_t sub_2532744B8()
{
  return MEMORY[0x270F40068]();
}

uint64_t sub_2532744C8()
{
  return MEMORY[0x270F40070]();
}

uint64_t sub_2532744D8()
{
  return MEMORY[0x270F40078]();
}

uint64_t sub_2532744E8()
{
  return MEMORY[0x270F40080]();
}

uint64_t sub_2532744F8()
{
  return MEMORY[0x270F40088]();
}

uint64_t sub_253274508()
{
  return MEMORY[0x270F400B0]();
}

uint64_t sub_253274518()
{
  return MEMORY[0x270F400B8]();
}

uint64_t sub_253274528()
{
  return MEMORY[0x270F400C0]();
}

uint64_t sub_253274538()
{
  return MEMORY[0x270F400C8]();
}

uint64_t sub_253274548()
{
  return MEMORY[0x270F400D0]();
}

uint64_t sub_253274558()
{
  return MEMORY[0x270F400D8]();
}

uint64_t sub_253274568()
{
  return MEMORY[0x270F400E8]();
}

uint64_t sub_253274578()
{
  return MEMORY[0x270F400F0]();
}

uint64_t sub_253274588()
{
  return MEMORY[0x270F400F8]();
}

uint64_t sub_253274598()
{
  return MEMORY[0x270F40100]();
}

uint64_t sub_2532745A8()
{
  return MEMORY[0x270F40108]();
}

uint64_t sub_2532745B8()
{
  return MEMORY[0x270F40110]();
}

uint64_t sub_2532745C8()
{
  return MEMORY[0x270F40118]();
}

uint64_t sub_2532745D8()
{
  return MEMORY[0x270F40120]();
}

uint64_t sub_2532745E8()
{
  return MEMORY[0x270F40128]();
}

uint64_t sub_2532745F8()
{
  return MEMORY[0x270F40130]();
}

uint64_t sub_253274618()
{
  return MEMORY[0x270F40140]();
}

uint64_t sub_253274628()
{
  return MEMORY[0x270F40158]();
}

uint64_t sub_253274638()
{
  return MEMORY[0x270F40160]();
}

uint64_t sub_253274648()
{
  return MEMORY[0x270F40168]();
}

uint64_t sub_253274658()
{
  return MEMORY[0x270F40170]();
}

uint64_t sub_253274668()
{
  return MEMORY[0x270F40178]();
}

uint64_t sub_253274678()
{
  return MEMORY[0x270F40180]();
}

uint64_t sub_253274688()
{
  return MEMORY[0x270F40190]();
}

uint64_t sub_253274698()
{
  return MEMORY[0x270F401A0]();
}

uint64_t sub_2532746A8()
{
  return MEMORY[0x270F401B0]();
}

uint64_t sub_2532746B8()
{
  return MEMORY[0x270F401B8]();
}

uint64_t sub_2532746C8()
{
  return MEMORY[0x270F401D8]();
}

uint64_t sub_2532746D8()
{
  return MEMORY[0x270F401E0]();
}

uint64_t sub_2532746E8()
{
  return MEMORY[0x270F401E8]();
}

uint64_t sub_2532746F8()
{
  return MEMORY[0x270F401F0]();
}

uint64_t sub_253274708()
{
  return MEMORY[0x270F40208]();
}

uint64_t sub_253274718()
{
  return MEMORY[0x270F40218]();
}

uint64_t sub_253274728()
{
  return MEMORY[0x270F40220]();
}

uint64_t sub_253274738()
{
  return MEMORY[0x270F40228]();
}

uint64_t sub_253274748()
{
  return MEMORY[0x270F40230]();
}

uint64_t sub_253274758()
{
  return MEMORY[0x270F40238]();
}

uint64_t sub_253274768()
{
  return MEMORY[0x270F40240]();
}

uint64_t sub_253274778()
{
  return MEMORY[0x270F40248]();
}

uint64_t sub_253274788()
{
  return MEMORY[0x270F40250]();
}

uint64_t sub_253274798()
{
  return MEMORY[0x270F40258]();
}

uint64_t sub_2532747A8()
{
  return MEMORY[0x270F40278]();
}

uint64_t sub_2532747B8()
{
  return MEMORY[0x270F40280]();
}

uint64_t sub_2532747C8()
{
  return MEMORY[0x270F40290]();
}

uint64_t sub_2532747D8()
{
  return MEMORY[0x270F40298]();
}

uint64_t sub_2532747E8()
{
  return MEMORY[0x270F402C8]();
}

uint64_t sub_2532747F8()
{
  return MEMORY[0x270F402D0]();
}

uint64_t sub_253274808()
{
  return MEMORY[0x270F402E8]();
}

uint64_t sub_253274818()
{
  return MEMORY[0x270F402F0]();
}

uint64_t sub_253274828()
{
  return MEMORY[0x270F402F8]();
}

uint64_t sub_253274838()
{
  return MEMORY[0x270F40300]();
}

uint64_t sub_253274848()
{
  return MEMORY[0x270F40310]();
}

uint64_t sub_253274858()
{
  return MEMORY[0x270F40320]();
}

uint64_t sub_253274868()
{
  return MEMORY[0x270F40328]();
}

uint64_t sub_253274878()
{
  return MEMORY[0x270F40338]();
}

uint64_t sub_253274888()
{
  return MEMORY[0x270F40378]();
}

uint64_t sub_253274898()
{
  return MEMORY[0x270F40388]();
}

uint64_t sub_2532748A8()
{
  return MEMORY[0x270F40390]();
}

uint64_t sub_2532748B8()
{
  return MEMORY[0x270F40398]();
}

uint64_t sub_2532748C8()
{
  return MEMORY[0x270F403A0]();
}

uint64_t sub_2532748D8()
{
  return MEMORY[0x270F403A8]();
}

uint64_t sub_2532748E8()
{
  return MEMORY[0x270F403B0]();
}

uint64_t sub_2532748F8()
{
  return MEMORY[0x270F403B8]();
}

uint64_t sub_253274908()
{
  return MEMORY[0x270F403C0]();
}

uint64_t sub_253274918()
{
  return MEMORY[0x270F403C8]();
}

uint64_t sub_253274928()
{
  return MEMORY[0x270F403D0]();
}

uint64_t sub_253274938()
{
  return MEMORY[0x270F403D8]();
}

uint64_t sub_253274948()
{
  return MEMORY[0x270F403E0]();
}

uint64_t sub_253274958()
{
  return MEMORY[0x270F403E8]();
}

uint64_t sub_253274968()
{
  return MEMORY[0x270F403F0]();
}

uint64_t sub_253274978()
{
  return MEMORY[0x270F403F8]();
}

uint64_t sub_253274988()
{
  return MEMORY[0x270F40400]();
}

uint64_t sub_253274998()
{
  return MEMORY[0x270F40408]();
}

uint64_t sub_2532749A8()
{
  return MEMORY[0x270F40410]();
}

uint64_t sub_2532749B8()
{
  return MEMORY[0x270F40418]();
}

uint64_t sub_2532749C8()
{
  return MEMORY[0x270F40420]();
}

uint64_t sub_2532749D8()
{
  return MEMORY[0x270F40428]();
}

uint64_t sub_2532749E8()
{
  return MEMORY[0x270F40430]();
}

uint64_t sub_2532749F8()
{
  return MEMORY[0x270F40438]();
}

uint64_t sub_253274A08()
{
  return MEMORY[0x270F40440]();
}

uint64_t sub_253274A18()
{
  return MEMORY[0x270F40448]();
}

uint64_t sub_253274A28()
{
  return MEMORY[0x270F40450]();
}

uint64_t sub_253274A38()
{
  return MEMORY[0x270F40458]();
}

uint64_t sub_253274A48()
{
  return MEMORY[0x270F40460]();
}

uint64_t sub_253274A58()
{
  return MEMORY[0x270F40468]();
}

uint64_t sub_253274A68()
{
  return MEMORY[0x270F40478]();
}

uint64_t sub_253274A78()
{
  return MEMORY[0x270F40488]();
}

uint64_t sub_253274A88()
{
  return MEMORY[0x270F40498]();
}

uint64_t sub_253274A98()
{
  return MEMORY[0x270F404A8]();
}

uint64_t sub_253274AA8()
{
  return MEMORY[0x270F404B0]();
}

uint64_t sub_253274AB8()
{
  return MEMORY[0x270F404B8]();
}

uint64_t sub_253274AC8()
{
  return MEMORY[0x270F404D0]();
}

uint64_t sub_253274AD8()
{
  return MEMORY[0x270F404D8]();
}

uint64_t sub_253274AE8()
{
  return MEMORY[0x270F404E8]();
}

uint64_t sub_253274AF8()
{
  return MEMORY[0x270F404F0]();
}

uint64_t sub_253274B08()
{
  return MEMORY[0x270F404F8]();
}

uint64_t sub_253274B18()
{
  return MEMORY[0x270F40500]();
}

uint64_t sub_253274B28()
{
  return MEMORY[0x270F40508]();
}

uint64_t sub_253274B38()
{
  return MEMORY[0x270F40510]();
}

uint64_t sub_253274B48()
{
  return MEMORY[0x270F40518]();
}

uint64_t sub_253274B58()
{
  return MEMORY[0x270F40520]();
}

uint64_t sub_253274B68()
{
  return MEMORY[0x270F40528]();
}

uint64_t sub_253274B78()
{
  return MEMORY[0x270F40530]();
}

uint64_t sub_253274B88()
{
  return MEMORY[0x270F40538]();
}

uint64_t sub_253274B98()
{
  return MEMORY[0x270F40540]();
}

uint64_t sub_253274BA8()
{
  return MEMORY[0x270F40548]();
}

uint64_t sub_253274BB8()
{
  return MEMORY[0x270F40550]();
}

uint64_t sub_253274BC8()
{
  return MEMORY[0x270F40558]();
}

uint64_t sub_253274BD8()
{
  return MEMORY[0x270F40560]();
}

uint64_t sub_253274BE8()
{
  return MEMORY[0x270F40568]();
}

uint64_t sub_253274BF8()
{
  return MEMORY[0x270F40570]();
}

uint64_t sub_253274C08()
{
  return MEMORY[0x270F40578]();
}

uint64_t sub_253274C18()
{
  return MEMORY[0x270F40580]();
}

uint64_t sub_253274C28()
{
  return MEMORY[0x270F40588]();
}

uint64_t sub_253274C38()
{
  return MEMORY[0x270F40590]();
}

uint64_t sub_253274C48()
{
  return MEMORY[0x270F40598]();
}

uint64_t sub_253274C58()
{
  return MEMORY[0x270F405A0]();
}

uint64_t sub_253274C68()
{
  return MEMORY[0x270F405A8]();
}

uint64_t sub_253274C78()
{
  return MEMORY[0x270F405B0]();
}

uint64_t sub_253274C88()
{
  return MEMORY[0x270F405B8]();
}

uint64_t sub_253274C98()
{
  return MEMORY[0x270F405C0]();
}

uint64_t sub_253274CA8()
{
  return MEMORY[0x270F405C8]();
}

uint64_t sub_253274CB8()
{
  return MEMORY[0x270F405D0]();
}

uint64_t sub_253274CC8()
{
  return MEMORY[0x270F405D8]();
}

uint64_t sub_253274CD8()
{
  return MEMORY[0x270F405E0]();
}

uint64_t sub_253274CE8()
{
  return MEMORY[0x270F405E8]();
}

uint64_t sub_253274CF8()
{
  return MEMORY[0x270F405F0]();
}

uint64_t sub_253274D08()
{
  return MEMORY[0x270F405F8]();
}

uint64_t sub_253274D18()
{
  return MEMORY[0x270F40600]();
}

uint64_t sub_253274D28()
{
  return MEMORY[0x270F40608]();
}

uint64_t sub_253274D38()
{
  return MEMORY[0x270F40610]();
}

uint64_t sub_253274D48()
{
  return MEMORY[0x270F40618]();
}

uint64_t sub_253274D58()
{
  return MEMORY[0x270F40620]();
}

uint64_t sub_253274D68()
{
  return MEMORY[0x270F40628]();
}

uint64_t sub_253274D78()
{
  return MEMORY[0x270F40630]();
}

uint64_t sub_253274D88()
{
  return MEMORY[0x270F40638]();
}

uint64_t sub_253274D98()
{
  return MEMORY[0x270F40640]();
}

uint64_t sub_253274DA8()
{
  return MEMORY[0x270F40648]();
}

uint64_t sub_253274DB8()
{
  return MEMORY[0x270F40650]();
}

uint64_t sub_253274DC8()
{
  return MEMORY[0x270F40658]();
}

uint64_t sub_253274DD8()
{
  return MEMORY[0x270F40660]();
}

uint64_t sub_253274DE8()
{
  return MEMORY[0x270F40668]();
}

uint64_t sub_253274DF8()
{
  return MEMORY[0x270F40670]();
}

uint64_t sub_253274E08()
{
  return MEMORY[0x270F40688]();
}

uint64_t sub_253274E18()
{
  return MEMORY[0x270F40690]();
}

uint64_t sub_253274E28()
{
  return MEMORY[0x270F40698]();
}

uint64_t sub_253274E38()
{
  return MEMORY[0x270F406A0]();
}

uint64_t sub_253274E58()
{
  return MEMORY[0x270F406B0]();
}

uint64_t sub_253274E68()
{
  return MEMORY[0x270F406B8]();
}

uint64_t sub_253274E78()
{
  return MEMORY[0x270F406C0]();
}

uint64_t sub_253274E88()
{
  return MEMORY[0x270F406E0]();
}

uint64_t sub_253274E98()
{
  return MEMORY[0x270F406E8]();
}

uint64_t sub_253274EA8()
{
  return MEMORY[0x270F406F8]();
}

uint64_t sub_253274EB8()
{
  return MEMORY[0x270F40700]();
}

uint64_t sub_253274EC8()
{
  return MEMORY[0x270F40708]();
}

uint64_t sub_253274ED8()
{
  return MEMORY[0x270F40710]();
}

uint64_t sub_253274EE8()
{
  return MEMORY[0x270F40728]();
}

uint64_t sub_253274EF8()
{
  return MEMORY[0x270F40730]();
}

uint64_t sub_253274F08()
{
  return MEMORY[0x270F40738]();
}

uint64_t sub_253274F18()
{
  return MEMORY[0x270F40740]();
}

uint64_t sub_253274F28()
{
  return MEMORY[0x270F40748]();
}

uint64_t sub_253274F38()
{
  return MEMORY[0x270F40750]();
}

uint64_t sub_253274F48()
{
  return MEMORY[0x270F40758]();
}

uint64_t sub_253274F58()
{
  return MEMORY[0x270F40760]();
}

uint64_t sub_253274F68()
{
  return MEMORY[0x270F40768]();
}

uint64_t sub_253274F78()
{
  return MEMORY[0x270F40770]();
}

uint64_t sub_253274F88()
{
  return MEMORY[0x270F40778]();
}

uint64_t sub_253274F98()
{
  return MEMORY[0x270F40788]();
}

uint64_t sub_253274FA8()
{
  return MEMORY[0x270F40798]();
}

uint64_t sub_253274FB8()
{
  return MEMORY[0x270F407A0]();
}

uint64_t sub_253274FC8()
{
  return MEMORY[0x270F407A8]();
}

uint64_t sub_253274FD8()
{
  return MEMORY[0x270F407B0]();
}

uint64_t sub_253274FE8()
{
  return MEMORY[0x270F407B8]();
}

uint64_t sub_253274FF8()
{
  return MEMORY[0x270F407C0]();
}

uint64_t sub_253275008()
{
  return MEMORY[0x270F407C8]();
}

uint64_t sub_253275048()
{
  return MEMORY[0x270F40808]();
}

uint64_t sub_253275058()
{
  return MEMORY[0x270F40830]();
}

uint64_t sub_253275068()
{
  return MEMORY[0x270F40838]();
}

uint64_t sub_253275078()
{
  return MEMORY[0x270F40840]();
}

uint64_t sub_253275088()
{
  return MEMORY[0x270F40848]();
}

uint64_t sub_253275098()
{
  return MEMORY[0x270F40850]();
}

uint64_t sub_2532750A8()
{
  return MEMORY[0x270F40858]();
}

uint64_t sub_2532750B8()
{
  return MEMORY[0x270F40860]();
}

uint64_t sub_2532750C8()
{
  return MEMORY[0x270F40868]();
}

uint64_t sub_2532750D8()
{
  return MEMORY[0x270F40870]();
}

uint64_t sub_2532750E8()
{
  return MEMORY[0x270F40878]();
}

uint64_t sub_2532750F8()
{
  return MEMORY[0x270F40888]();
}

uint64_t sub_253275108()
{
  return MEMORY[0x270F40890]();
}

uint64_t sub_253275118()
{
  return MEMORY[0x270F408F0]();
}

uint64_t sub_253275128()
{
  return MEMORY[0x270F408F8]();
}

uint64_t sub_253275138()
{
  return MEMORY[0x270F40900]();
}

uint64_t sub_253275148()
{
  return MEMORY[0x270F40908]();
}

uint64_t sub_253275158()
{
  return MEMORY[0x270F40910]();
}

uint64_t sub_253275168()
{
  return MEMORY[0x270F40918]();
}

uint64_t sub_253275178()
{
  return MEMORY[0x270F40920]();
}

uint64_t sub_253275188()
{
  return MEMORY[0x270F40928]();
}

uint64_t sub_253275198()
{
  return MEMORY[0x270F40978]();
}

uint64_t sub_2532751A8()
{
  return MEMORY[0x270F40980]();
}

uint64_t sub_2532751B8()
{
  return MEMORY[0x270F40988]();
}

uint64_t sub_2532751C8()
{
  return MEMORY[0x270F40998]();
}

uint64_t sub_2532751D8()
{
  return MEMORY[0x270F409A0]();
}

uint64_t sub_2532751E8()
{
  return MEMORY[0x270F409A8]();
}

uint64_t sub_2532751F8()
{
  return MEMORY[0x270F409B0]();
}

uint64_t sub_253275208()
{
  return MEMORY[0x270F409B8]();
}

uint64_t sub_253275218()
{
  return MEMORY[0x270F409C0]();
}

uint64_t sub_253275228()
{
  return MEMORY[0x270F409C8]();
}

uint64_t sub_253275238()
{
  return MEMORY[0x270F409D0]();
}

uint64_t sub_253275248()
{
  return MEMORY[0x270F409D8]();
}

uint64_t sub_253275258()
{
  return MEMORY[0x270F409E8]();
}

uint64_t sub_253275268()
{
  return MEMORY[0x270F409F0]();
}

uint64_t sub_253275278()
{
  return MEMORY[0x270F409F8]();
}

uint64_t sub_253275288()
{
  return MEMORY[0x270F40A10]();
}

uint64_t sub_253275298()
{
  return MEMORY[0x270F40A18]();
}

uint64_t sub_2532752A8()
{
  return MEMORY[0x270F40A20]();
}

uint64_t sub_2532752B8()
{
  return MEMORY[0x270F40A28]();
}

uint64_t sub_2532752C8()
{
  return MEMORY[0x270F40A30]();
}

uint64_t sub_2532752D8()
{
  return MEMORY[0x270F40A38]();
}

uint64_t sub_2532752E8()
{
  return MEMORY[0x270F40A40]();
}

uint64_t sub_2532752F8()
{
  return MEMORY[0x270F40A90]();
}

uint64_t sub_253275308()
{
  return MEMORY[0x270F40AA0]();
}

uint64_t sub_253275318()
{
  return MEMORY[0x270F40AA8]();
}

uint64_t sub_253275328()
{
  return MEMORY[0x270F40AB0]();
}

uint64_t sub_253275338()
{
  return MEMORY[0x270F40AD0]();
}

uint64_t sub_253275348()
{
  return MEMORY[0x270F40AD8]();
}

uint64_t sub_253275358()
{
  return MEMORY[0x270F40AE0]();
}

uint64_t sub_253275368()
{
  return MEMORY[0x270F40AE8]();
}

uint64_t sub_253275378()
{
  return MEMORY[0x270F40AF0]();
}

uint64_t sub_253275388()
{
  return MEMORY[0x270F40B38]();
}

uint64_t sub_2532753D8()
{
  return MEMORY[0x270F40B88]();
}

uint64_t sub_2532753E8()
{
  return MEMORY[0x270F40B90]();
}

uint64_t sub_2532753F8()
{
  return MEMORY[0x270F40B98]();
}

uint64_t sub_253275408()
{
  return MEMORY[0x270F40BA0]();
}

uint64_t sub_253275418()
{
  return MEMORY[0x270F40BA8]();
}

uint64_t sub_253275428()
{
  return MEMORY[0x270F40BC0]();
}

uint64_t sub_253275438()
{
  return MEMORY[0x270F40BC8]();
}

uint64_t sub_253275448()
{
  return MEMORY[0x270F40BE0]();
}

uint64_t sub_253275458()
{
  return MEMORY[0x270F40BE8]();
}

uint64_t sub_253275468()
{
  return MEMORY[0x270F40BF0]();
}

uint64_t sub_253275478()
{
  return MEMORY[0x270F40BF8]();
}

uint64_t sub_253275488()
{
  return MEMORY[0x270F40C00]();
}

uint64_t sub_253275498()
{
  return MEMORY[0x270F40C08]();
}

uint64_t sub_2532754A8()
{
  return MEMORY[0x270F40C10]();
}

uint64_t sub_2532754B8()
{
  return MEMORY[0x270F40C28]();
}

uint64_t sub_2532754C8()
{
  return MEMORY[0x270F40C30]();
}

uint64_t sub_2532754D8()
{
  return MEMORY[0x270F40C78]();
}

uint64_t sub_2532754E8()
{
  return MEMORY[0x270F40C80]();
}

uint64_t sub_2532754F8()
{
  return MEMORY[0x270F40C88]();
}

uint64_t sub_253275508()
{
  return MEMORY[0x270F40C98]();
}

uint64_t sub_253275518()
{
  return MEMORY[0x270F40CA0]();
}

uint64_t sub_253275528()
{
  return MEMORY[0x270F40CB8]();
}

uint64_t sub_253275538()
{
  return MEMORY[0x270F40CC8]();
}

uint64_t sub_253275548()
{
  return MEMORY[0x270F40CD8]();
}

uint64_t sub_253275558()
{
  return MEMORY[0x270F40CE8]();
}

uint64_t sub_253275568()
{
  return MEMORY[0x270F40CF8]();
}

uint64_t sub_253275578()
{
  return MEMORY[0x270F40D20]();
}

uint64_t sub_253275588()
{
  return MEMORY[0x270F40D30]();
}

uint64_t sub_253275598()
{
  return MEMORY[0x270F40D38]();
}

uint64_t sub_2532755A8()
{
  return MEMORY[0x270F40D48]();
}

uint64_t sub_2532755B8()
{
  return MEMORY[0x270F40DE0]();
}

uint64_t sub_2532755C8()
{
  return MEMORY[0x270F40E00]();
}

uint64_t sub_2532755D8()
{
  return MEMORY[0x270F40E08]();
}

uint64_t sub_2532755E8()
{
  return MEMORY[0x270F40E10]();
}

uint64_t sub_2532755F8()
{
  return MEMORY[0x270F40E18]();
}

uint64_t sub_253275608()
{
  return MEMORY[0x270F40E20]();
}

uint64_t sub_253275618()
{
  return MEMORY[0x270F40E28]();
}

uint64_t sub_253275628()
{
  return MEMORY[0x270F40E30]();
}

uint64_t sub_253275638()
{
  return MEMORY[0x270F40E38]();
}

uint64_t sub_253275648()
{
  return MEMORY[0x270F40E40]();
}

uint64_t sub_253275658()
{
  return MEMORY[0x270F40E48]();
}

uint64_t sub_253275668()
{
  return MEMORY[0x270F40E58]();
}

uint64_t sub_253275678()
{
  return MEMORY[0x270F40E68]();
}

uint64_t sub_253275688()
{
  return MEMORY[0x270F40E88]();
}

uint64_t sub_253275698()
{
  return MEMORY[0x270F40EA0]();
}

uint64_t sub_2532756A8()
{
  return MEMORY[0x270F40EB0]();
}

uint64_t sub_2532756B8()
{
  return MEMORY[0x270F40EB8]();
}

uint64_t sub_2532756C8()
{
  return MEMORY[0x270F40EC0]();
}

uint64_t sub_2532756D8()
{
  return MEMORY[0x270F40EC8]();
}

uint64_t sub_2532756E8()
{
  return MEMORY[0x270F40ED8]();
}

uint64_t sub_2532756F8()
{
  return MEMORY[0x270F40EE0]();
}

uint64_t sub_253275708()
{
  return MEMORY[0x270F40EF0]();
}

uint64_t sub_253275718()
{
  return MEMORY[0x270F40EF8]();
}

uint64_t sub_253275728()
{
  return MEMORY[0x270F40F00]();
}

uint64_t sub_253275738()
{
  return MEMORY[0x270F40F08]();
}

uint64_t sub_253275748()
{
  return MEMORY[0x270F40F10]();
}

uint64_t sub_253275758()
{
  return MEMORY[0x270F40F18]();
}

uint64_t sub_253275768()
{
  return MEMORY[0x270F40F20]();
}

uint64_t sub_253275778()
{
  return MEMORY[0x270F40F28]();
}

uint64_t sub_253275788()
{
  return MEMORY[0x270F40F30]();
}

uint64_t sub_253275798()
{
  return MEMORY[0x270F40F40]();
}

uint64_t sub_2532757A8()
{
  return MEMORY[0x270F40F48]();
}

uint64_t sub_2532757B8()
{
  return MEMORY[0x270F40F58]();
}

uint64_t sub_2532757C8()
{
  return MEMORY[0x270F40F70]();
}

uint64_t sub_2532757D8()
{
  return MEMORY[0x270F40F78]();
}

uint64_t sub_2532757E8()
{
  return MEMORY[0x270F40F80]();
}

uint64_t sub_2532757F8()
{
  return MEMORY[0x270F40F88]();
}

uint64_t sub_253275808()
{
  return MEMORY[0x270F40F90]();
}

uint64_t sub_253275818()
{
  return MEMORY[0x270F40F98]();
}

uint64_t sub_253275828()
{
  return MEMORY[0x270F40FA0]();
}

uint64_t sub_253275838()
{
  return MEMORY[0x270F40FD8]();
}

uint64_t sub_253275848()
{
  return MEMORY[0x270F40FE0]();
}

uint64_t sub_253275858()
{
  return MEMORY[0x270F40FE8]();
}

uint64_t sub_253275868()
{
  return MEMORY[0x270F40FF0]();
}

uint64_t sub_253275878()
{
  return MEMORY[0x270F40FF8]();
}

uint64_t sub_253275888()
{
  return MEMORY[0x270F41000]();
}

uint64_t sub_253275898()
{
  return MEMORY[0x270F41008]();
}

uint64_t sub_2532758A8()
{
  return MEMORY[0x270F41010]();
}

uint64_t sub_2532758B8()
{
  return MEMORY[0x270F41018]();
}

uint64_t sub_2532758C8()
{
  return MEMORY[0x270F41020]();
}

uint64_t sub_2532758D8()
{
  return MEMORY[0x270F41028]();
}

uint64_t sub_2532758E8()
{
  return MEMORY[0x270F41030]();
}

uint64_t sub_2532758F8()
{
  return MEMORY[0x270F41038]();
}

uint64_t sub_253275908()
{
  return MEMORY[0x270F41040]();
}

uint64_t sub_253275918()
{
  return MEMORY[0x270F41048]();
}

uint64_t sub_253275928()
{
  return MEMORY[0x270F41050]();
}

uint64_t sub_253275938()
{
  return MEMORY[0x270F41058]();
}

uint64_t sub_253275948()
{
  return MEMORY[0x270F41060]();
}

uint64_t sub_253275958()
{
  return MEMORY[0x270F41068]();
}

uint64_t sub_253275968()
{
  return MEMORY[0x270F41070]();
}

uint64_t sub_253275978()
{
  return MEMORY[0x270F41078]();
}

uint64_t sub_253275988()
{
  return MEMORY[0x270F41080]();
}

uint64_t sub_253275998()
{
  return MEMORY[0x270F41090]();
}

uint64_t sub_2532759A8()
{
  return MEMORY[0x270F410A0]();
}

uint64_t sub_2532759B8()
{
  return MEMORY[0x270F410A8]();
}

uint64_t sub_2532759C8()
{
  return MEMORY[0x270F410D8]();
}

uint64_t sub_2532759D8()
{
  return MEMORY[0x270F410E0]();
}

uint64_t sub_2532759E8()
{
  return MEMORY[0x270F410E8]();
}

uint64_t sub_2532759F8()
{
  return MEMORY[0x270F410F0]();
}

uint64_t sub_253275A08()
{
  return MEMORY[0x270F410F8]();
}

uint64_t sub_253275A18()
{
  return MEMORY[0x270F41100]();
}

uint64_t sub_253275A28()
{
  return MEMORY[0x270F41108]();
}

uint64_t sub_253275A38()
{
  return MEMORY[0x270F7F908]();
}

uint64_t sub_253275A48()
{
  return MEMORY[0x270F7F910]();
}

uint64_t sub_253275A58()
{
  return MEMORY[0x270F7F920]();
}

uint64_t sub_253275A68()
{
  return MEMORY[0x270F7F928]();
}

uint64_t sub_253275A78()
{
  return MEMORY[0x270F7F930]();
}

uint64_t sub_253275A88()
{
  return MEMORY[0x270F7F948]();
}

uint64_t sub_253275A98()
{
  return MEMORY[0x270F7F968]();
}

uint64_t sub_253275AA8()
{
  return MEMORY[0x270F7F970]();
}

uint64_t sub_253275AB8()
{
  return MEMORY[0x270F7F978]();
}

uint64_t sub_253275AC8()
{
  return MEMORY[0x270F7F980]();
}

uint64_t sub_253275AD8()
{
  return MEMORY[0x270F7F988]();
}

uint64_t sub_253275AE8()
{
  return MEMORY[0x270F7F990]();
}

uint64_t sub_253275AF8()
{
  return MEMORY[0x270F7F998]();
}

uint64_t sub_253275B08()
{
  return MEMORY[0x270F7F9A0]();
}

uint64_t sub_253275B18()
{
  return MEMORY[0x270F7F9A8]();
}

uint64_t sub_253275B28()
{
  return MEMORY[0x270F7F9B0]();
}

uint64_t sub_253275B38()
{
  return MEMORY[0x270F7F9B8]();
}

uint64_t sub_253275B48()
{
  return MEMORY[0x270F7F9C8]();
}

uint64_t sub_253275B58()
{
  return MEMORY[0x270F7F9D8]();
}

uint64_t sub_253275B68()
{
  return MEMORY[0x270F7F9E0]();
}

uint64_t sub_253275B78()
{
  return MEMORY[0x270F7F9E8]();
}

uint64_t sub_253275B88()
{
  return MEMORY[0x270F7FA00]();
}

uint64_t sub_253275B98()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_253275BA8()
{
  return MEMORY[0x270F7FA18]();
}

uint64_t sub_253275BB8()
{
  return MEMORY[0x270F7FA20]();
}

uint64_t sub_253275BC8()
{
  return MEMORY[0x270F7FA30]();
}

uint64_t sub_253275BD8()
{
  return MEMORY[0x270F7FA50]();
}

uint64_t sub_253275CB8()
{
  return MEMORY[0x270F7FB00]();
}

uint64_t sub_253275CC8()
{
  return MEMORY[0x270F7FB10]();
}

uint64_t sub_253275CD8()
{
  return MEMORY[0x270F7FB20]();
}

uint64_t sub_253275CE8()
{
  return MEMORY[0x270F7FB30]();
}

uint64_t sub_253275CF8()
{
  return MEMORY[0x270F7FB38]();
}

uint64_t sub_253275D08()
{
  return MEMORY[0x270F7FB40]();
}

uint64_t sub_253275D18()
{
  return MEMORY[0x270F7FB58]();
}

uint64_t sub_253275D28()
{
  return MEMORY[0x270F7FB98]();
}

uint64_t sub_253275D38()
{
  return MEMORY[0x270F7FBA0]();
}

uint64_t sub_253275D48()
{
  return MEMORY[0x270F7FBA8]();
}

uint64_t sub_253275D58()
{
  return MEMORY[0x270F7FBB0]();
}

uint64_t sub_253275D68()
{
  return MEMORY[0x270F7FC40]();
}

uint64_t sub_253275D78()
{
  return MEMORY[0x270F7FC78]();
}

uint64_t sub_253275D88()
{
  return MEMORY[0x270F7FC80]();
}

uint64_t sub_253275D98()
{
  return MEMORY[0x270F7FC90]();
}

uint64_t sub_253275DA8()
{
  return MEMORY[0x270F7FC98]();
}

uint64_t sub_253275DB8()
{
  return MEMORY[0x270F7FCA0]();
}

uint64_t sub_253275DC8()
{
  return MEMORY[0x270F7FD00]();
}

uint64_t sub_253275DD8()
{
  return MEMORY[0x270F7FD28]();
}

uint64_t sub_253275DE8()
{
  return MEMORY[0x270F7FD30]();
}

uint64_t sub_253275DF8()
{
  return MEMORY[0x270F7FD38]();
}

uint64_t sub_253275E08()
{
  return MEMORY[0x270F7FD68]();
}

uint64_t sub_253275E18()
{
  return MEMORY[0x270F7FDE8]();
}

uint64_t sub_253275E28()
{
  return MEMORY[0x270F7FE38]();
}

uint64_t sub_253275E38()
{
  return MEMORY[0x270F7FE40]();
}

uint64_t sub_253275E48()
{
  return MEMORY[0x270F7FE48]();
}

uint64_t sub_253275E58()
{
  return MEMORY[0x270F7FE50]();
}

uint64_t sub_253275E68()
{
  return MEMORY[0x270F7FE58]();
}

uint64_t sub_253275E78()
{
  return MEMORY[0x270F7FE60]();
}

uint64_t sub_253275E88()
{
  return MEMORY[0x270F7FE68]();
}

uint64_t sub_253275E98()
{
  return MEMORY[0x270F7FE70]();
}

uint64_t sub_253275EA8()
{
  return MEMORY[0x270F7FE78]();
}

uint64_t sub_253275EB8()
{
  return MEMORY[0x270F7FE80]();
}

uint64_t sub_253275EC8()
{
  return MEMORY[0x270F7FE88]();
}

uint64_t sub_253275ED8()
{
  return MEMORY[0x270F7FE90]();
}

uint64_t sub_253275EE8()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_253275EF8()
{
  return MEMORY[0x270F7FEA0]();
}

uint64_t sub_253275F08()
{
  return MEMORY[0x270F7FEA8]();
}

uint64_t sub_253275F18()
{
  return MEMORY[0x270F7FEB0]();
}

uint64_t sub_253275F28()
{
  return MEMORY[0x270F7FEB8]();
}

uint64_t sub_253275F38()
{
  return MEMORY[0x270F7FEC0]();
}

uint64_t sub_253275F48()
{
  return MEMORY[0x270F7FEC8]();
}

uint64_t sub_253275F58()
{
  return MEMORY[0x270F7FED0]();
}

uint64_t sub_253275F68()
{
  return MEMORY[0x270F7FED8]();
}

uint64_t sub_253275F78()
{
  return MEMORY[0x270F7FEE8]();
}

uint64_t sub_253275F88()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_253275F98()
{
  return MEMORY[0x270F7FEF8]();
}

uint64_t sub_253275FA8()
{
  return MEMORY[0x270F7FF00]();
}

uint64_t sub_253275FB8()
{
  return MEMORY[0x270F7FF08]();
}

uint64_t sub_253275FC8()
{
  return MEMORY[0x270F7FF10]();
}

uint64_t sub_253275FD8()
{
  return MEMORY[0x270F7FF18]();
}

uint64_t sub_253275FE8()
{
  return MEMORY[0x270F7FF20]();
}

uint64_t sub_253275FF8()
{
  return MEMORY[0x270F7FF28]();
}

uint64_t sub_253276008()
{
  return MEMORY[0x270F7FF30]();
}

uint64_t sub_253276018()
{
  return MEMORY[0x270F7FF38]();
}

uint64_t sub_253276028()
{
  return MEMORY[0x270F7FF40]();
}

uint64_t sub_253276038()
{
  return MEMORY[0x270F7FF48]();
}

uint64_t sub_253276048()
{
  return MEMORY[0x270F7FF50]();
}

uint64_t sub_253276058()
{
  return MEMORY[0x270F7FF58]();
}

uint64_t sub_253276068()
{
  return MEMORY[0x270F7FF68]();
}

uint64_t sub_253276078()
{
  return MEMORY[0x270F7FF70]();
}

uint64_t sub_253276088()
{
  return MEMORY[0x270F7FF78]();
}

uint64_t sub_253276098()
{
  return MEMORY[0x270F7FF80]();
}

uint64_t sub_2532760A8()
{
  return MEMORY[0x270F7FF88]();
}

uint64_t sub_2532760B8()
{
  return MEMORY[0x270F7FF90]();
}

uint64_t sub_2532760C8()
{
  return MEMORY[0x270F7FF98]();
}

uint64_t sub_2532760D8()
{
  return MEMORY[0x270F7FFA0]();
}

uint64_t sub_2532760E8()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_2532760F8()
{
  return MEMORY[0x270F7FFB0]();
}

uint64_t sub_253276108()
{
  return MEMORY[0x270F7FFB8]();
}

uint64_t sub_253276118()
{
  return MEMORY[0x270F7FFC0]();
}

uint64_t sub_253276128()
{
  return MEMORY[0x270F7FFC8]();
}

uint64_t sub_253276138()
{
  return MEMORY[0x270F3EF60]();
}

uint64_t sub_253276148()
{
  return MEMORY[0x270F3EF68]();
}

uint64_t sub_253276158()
{
  return MEMORY[0x270F3EF70]();
}

uint64_t sub_253276168()
{
  return MEMORY[0x270F7FFD0]();
}

uint64_t sub_253276178()
{
  return MEMORY[0x270F7FFD8]();
}

uint64_t sub_253276188()
{
  return MEMORY[0x270F7FFE0]();
}

uint64_t sub_253276198()
{
  return MEMORY[0x270F7FFE8]();
}

uint64_t sub_2532761A8()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_2532761B8()
{
  return MEMORY[0x270F80018]();
}

uint64_t sub_2532761C8()
{
  return MEMORY[0x270F80020]();
}

uint64_t sub_2532761D8()
{
  return MEMORY[0x270F80028]();
}

uint64_t sub_2532761E8()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_2532761F8()
{
  return MEMORY[0x270F80050]();
}

uint64_t sub_253276208()
{
  return MEMORY[0x270F80058]();
}

uint64_t sub_253276218()
{
  return MEMORY[0x270F80060]();
}

uint64_t sub_253276228()
{
  return MEMORY[0x270F80078]();
}

uint64_t sub_253276238()
{
  return MEMORY[0x270F80088]();
}

uint64_t sub_253276248()
{
  return MEMORY[0x270F800B0]();
}

uint64_t sub_253276258()
{
  return MEMORY[0x270F800B8]();
}

uint64_t sub_253276268()
{
  return MEMORY[0x270F800C0]();
}

uint64_t sub_253276278()
{
  return MEMORY[0x270F800C8]();
}

uint64_t sub_253276288()
{
  return MEMORY[0x270F800D0]();
}

uint64_t sub_253276298()
{
  return MEMORY[0x270F800D8]();
}

uint64_t sub_2532762A8()
{
  return MEMORY[0x270F41118]();
}

uint64_t sub_2532762B8()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_2532762C8()
{
  return MEMORY[0x270F800F8]();
}

uint64_t sub_2532762D8()
{
  return MEMORY[0x270F80118]();
}

uint64_t sub_2532762E8()
{
  return MEMORY[0x270F80120]();
}

uint64_t sub_2532762F8()
{
  return MEMORY[0x270F80130]();
}

uint64_t sub_253276308()
{
  return MEMORY[0x270F80138]();
}

uint64_t sub_253276318()
{
  return MEMORY[0x270F80140]();
}

uint64_t sub_253276328()
{
  return MEMORY[0x270F80148]();
}

uint64_t sub_253276338()
{
  return MEMORY[0x270F80158]();
}

uint64_t sub_253276348()
{
  return MEMORY[0x270F80160]();
}

uint64_t sub_253276358()
{
  return MEMORY[0x270F80168]();
}

uint64_t sub_253276368()
{
  return MEMORY[0x270F80180]();
}

uint64_t sub_253276378()
{
  return MEMORY[0x270F80198]();
}

uint64_t sub_253276388()
{
  return MEMORY[0x270F801A0]();
}

uint64_t sub_253276398()
{
  return MEMORY[0x270F801C8]();
}

uint64_t sub_2532763A8()
{
  return MEMORY[0x270F801D0]();
}

uint64_t sub_2532763B8()
{
  return MEMORY[0x270F801F8]();
}

uint64_t sub_2532763C8()
{
  return MEMORY[0x270F80200]();
}

uint64_t sub_2532763D8()
{
  return MEMORY[0x270F80208]();
}

uint64_t sub_2532763E8()
{
  return MEMORY[0x270F80210]();
}

uint64_t sub_2532763F8()
{
  return MEMORY[0x270F80218]();
}

uint64_t sub_253276408()
{
  return MEMORY[0x270F80230]();
}

uint64_t sub_253276418()
{
  return MEMORY[0x270F80290]();
}

uint64_t sub_253276428()
{
  return MEMORY[0x270F80298]();
}

uint64_t sub_253276438()
{
  return MEMORY[0x270F802A0]();
}

uint64_t sub_253276448()
{
  return MEMORY[0x270F802A8]();
}

uint64_t sub_253276458()
{
  return MEMORY[0x270F802B0]();
}

uint64_t sub_253276468()
{
  return MEMORY[0x270F802B8]();
}

uint64_t sub_253276478()
{
  return MEMORY[0x270F80310]();
}

uint64_t sub_253276488()
{
  return MEMORY[0x270F80318]();
}

uint64_t sub_253276498()
{
  return MEMORY[0x270F80328]();
}

uint64_t sub_2532764A8()
{
  return MEMORY[0x270F80330]();
}

uint64_t sub_2532764B8()
{
  return MEMORY[0x270F80338]();
}

uint64_t sub_2532764C8()
{
  return MEMORY[0x270F80350]();
}

uint64_t sub_2532764D8()
{
  return MEMORY[0x270F80360]();
}

uint64_t sub_2532764E8()
{
  return MEMORY[0x270F80368]();
}

uint64_t sub_2532764F8()
{
  return MEMORY[0x270F80378]();
}

uint64_t sub_253276508()
{
  return MEMORY[0x270F80380]();
}

uint64_t sub_253276518()
{
  return MEMORY[0x270F80388]();
}

uint64_t sub_253276528()
{
  return MEMORY[0x270F80398]();
}

uint64_t sub_253276538()
{
  return MEMORY[0x270F803A0]();
}

uint64_t sub_253276548()
{
  return MEMORY[0x270F803A8]();
}

uint64_t sub_253276558()
{
  return MEMORY[0x270F803B0]();
}

uint64_t sub_253276568()
{
  return MEMORY[0x270F803B8]();
}

uint64_t sub_253276578()
{
  return MEMORY[0x270F803C8]();
}

uint64_t sub_253276588()
{
  return MEMORY[0x270F803D0]();
}

uint64_t sub_253276598()
{
  return MEMORY[0x270F803D8]();
}

uint64_t sub_2532765A8()
{
  return MEMORY[0x270F803E0]();
}

uint64_t sub_2532765B8()
{
  return MEMORY[0x270F80400]();
}

uint64_t sub_2532765C8()
{
  return MEMORY[0x270F80408]();
}

uint64_t sub_2532765D8()
{
  return MEMORY[0x270F80410]();
}

uint64_t sub_2532765E8()
{
  return MEMORY[0x270F80418]();
}

uint64_t sub_2532765F8()
{
  return MEMORY[0x270F80420]();
}

uint64_t sub_253276608()
{
  return MEMORY[0x270F80428]();
}

uint64_t sub_253276618()
{
  return MEMORY[0x270F80440]();
}

uint64_t sub_253276628()
{
  return MEMORY[0x270F80448]();
}

uint64_t sub_253276638()
{
  return MEMORY[0x270F80450]();
}

uint64_t sub_253276648()
{
  return MEMORY[0x270F80458]();
}

uint64_t sub_253276658()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_253276668()
{
  return MEMORY[0x270F80470]();
}

uint64_t sub_253276678()
{
  return MEMORY[0x270F80478]();
}

uint64_t sub_253276688()
{
  return MEMORY[0x270F80488]();
}

uint64_t sub_253276698()
{
  return MEMORY[0x270F80490]();
}

uint64_t sub_2532766A8()
{
  return MEMORY[0x270F80498]();
}

uint64_t sub_2532766B8()
{
  return MEMORY[0x270F804A0]();
}

uint64_t sub_2532766C8()
{
  return MEMORY[0x270F80530]();
}

uint64_t sub_2532766D8()
{
  return MEMORY[0x270F80538]();
}

uint64_t sub_2532766E8()
{
  return MEMORY[0x270F80540]();
}

uint64_t sub_2532766F8()
{
  return MEMORY[0x270F80550]();
}

uint64_t sub_253276708()
{
  return MEMORY[0x270F80558]();
}

uint64_t sub_253276718()
{
  return MEMORY[0x270F41120]();
}

uint64_t sub_253276728()
{
  return MEMORY[0x270F805C8]();
}

uint64_t sub_253276738()
{
  return MEMORY[0x270F805E8]();
}

uint64_t sub_253276748()
{
  return MEMORY[0x270F805F0]();
}

uint64_t sub_253276758()
{
  return MEMORY[0x270F805F8]();
}

uint64_t sub_253276768()
{
  return MEMORY[0x270F80610]();
}

uint64_t sub_253276778()
{
  return MEMORY[0x270F80618]();
}

uint64_t sub_253276788()
{
  return MEMORY[0x270F80630]();
}

uint64_t sub_253276798()
{
  return MEMORY[0x270F80640]();
}

uint64_t sub_2532767A8()
{
  return MEMORY[0x270F80668]();
}

uint64_t sub_2532767B8()
{
  return MEMORY[0x270F80670]();
}

uint64_t sub_2532767C8()
{
  return MEMORY[0x270F806B8]();
}

uint64_t sub_2532767D8()
{
  return MEMORY[0x270F806C0]();
}

uint64_t sub_2532767E8()
{
  return MEMORY[0x270F806E8]();
}

uint64_t sub_2532767F8()
{
  return MEMORY[0x270F806F0]();
}

uint64_t sub_253276808()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_253276818()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_253276828()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t sub_253276838()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_253276848()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_253276868()
{
  return MEMORY[0x270F46A10]();
}

uint64_t sub_2532768A8()
{
  return MEMORY[0x270F46A38]();
}

uint64_t sub_2532768B8()
{
  return MEMORY[0x270F46A40]();
}

uint64_t sub_2532768C8()
{
  return MEMORY[0x270F46A48]();
}

uint64_t sub_2532768D8()
{
  return MEMORY[0x270F46A50]();
}

uint64_t sub_2532768E8()
{
  return MEMORY[0x270F46A60]();
}

uint64_t sub_2532768F8()
{
  return MEMORY[0x270F46A68]();
}

uint64_t sub_253276908()
{
  return MEMORY[0x270F46A70]();
}

uint64_t sub_253276918()
{
  return MEMORY[0x270F46A78]();
}

uint64_t sub_253276928()
{
  return MEMORY[0x270F46A80]();
}

uint64_t sub_253276938()
{
  return MEMORY[0x270F46A88]();
}

uint64_t sub_253276948()
{
  return MEMORY[0x270F46A90]();
}

uint64_t sub_253276958()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_253276968()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_253276978()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_253276988()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_253276998()
{
  return MEMORY[0x270EEB060]();
}

uint64_t sub_2532769A8()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2532769B8()
{
  return MEMORY[0x270EEB0C0]();
}

uint64_t sub_2532769C8()
{
  return MEMORY[0x270EEB0C8]();
}

uint64_t sub_2532769D8()
{
  return MEMORY[0x270EEB0D0]();
}

uint64_t sub_2532769E8()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t sub_2532769F8()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t sub_253276A08()
{
  return MEMORY[0x270F58050]();
}

uint64_t sub_253276A18()
{
  return MEMORY[0x270F58060]();
}

uint64_t sub_253276A28()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_253276A38()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_253276A48()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_253276A58()
{
  return MEMORY[0x270F30050]();
}

uint64_t sub_253276A68()
{
  return MEMORY[0x270F2F510]();
}

uint64_t sub_253276A78()
{
  return MEMORY[0x270F7F300]();
}

uint64_t sub_253276A88()
{
  return MEMORY[0x270F7F308]();
}

uint64_t sub_253276A98()
{
  return MEMORY[0x270F7F318]();
}

uint64_t sub_253276AA8()
{
  return MEMORY[0x270F7F328]();
}

uint64_t sub_253276AB8()
{
  return MEMORY[0x270F2EF00]();
}

uint64_t sub_253276AC8()
{
  return MEMORY[0x270F583D0]();
}

uint64_t sub_253276AD8()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_253276AE8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_253276AF8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_253276B08()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_253276B18()
{
  return MEMORY[0x270F9D090]();
}

uint64_t sub_253276B28()
{
  return MEMORY[0x270F65188]();
}

uint64_t sub_253276B38()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_253276B48()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_253276B58()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_253276B68()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_253276B78()
{
  return MEMORY[0x270F41130]();
}

uint64_t sub_253276B88()
{
  return MEMORY[0x270F41138]();
}

uint64_t sub_253276B98()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_253276BA8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_253276BB8()
{
  return MEMORY[0x270FA2B48]();
}

uint64_t sub_253276BC8()
{
  return MEMORY[0x270FA2B68]();
}

uint64_t sub_253276BD8()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_253276BE8()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t sub_253276BF8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_253276C08()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_253276C18()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_253276C28()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_253276C38()
{
  return MEMORY[0x270EF18B8]();
}

uint64_t sub_253276C48()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_253276C58()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_253276C68()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_253276C78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_253276C88()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_253276C98()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_253276CA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_253276CB8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_253276CC8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_253276CD8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_253276CE8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_253276CF8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_253276D18()
{
  return MEMORY[0x270EF1B30]();
}

uint64_t sub_253276D28()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_253276D38()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_253276D48()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_253276D58()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_253276D68()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_253276D78()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_253276D88()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_253276D98()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_253276DA8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_253276DB8()
{
  return MEMORY[0x270F41140]();
}

uint64_t sub_253276DC8()
{
  return MEMORY[0x270F41148]();
}

uint64_t sub_253276DD8()
{
  return MEMORY[0x270F41150]();
}

uint64_t sub_253276DE8()
{
  return MEMORY[0x270F41158]();
}

uint64_t sub_253276DF8()
{
  return MEMORY[0x270F41160]();
}

uint64_t sub_253276E08()
{
  return MEMORY[0x270F41168]();
}

uint64_t sub_253276E18()
{
  return MEMORY[0x270F41170]();
}

uint64_t sub_253276E28()
{
  return MEMORY[0x270F41178]();
}

uint64_t sub_253276E38()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_253276E48()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_253276E58()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_253276E68()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_253276E78()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_253276E88()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_253276E98()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_253276EA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_253276EB8()
{
  return MEMORY[0x270F9D7A0]();
}

uint64_t sub_253276EC8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_253276ED8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_253276EE8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_253276EF8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_253276F08()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_253276F18()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_253276F28()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_253276F38()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_253276F48()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_253276F58()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_253276F68()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_253276F78()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_253276F88()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_253276F98()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_253276FA8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_253276FB8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_253276FC8()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_253276FD8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_253276FE8()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_253276FF8()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_253277008()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_253277018()
{
  return MEMORY[0x270F9D9C8]();
}

uint64_t sub_253277028()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_253277038()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_253277048()
{
  return MEMORY[0x270F9DA88]();
}

uint64_t sub_253277058()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_253277068()
{
  return MEMORY[0x270F9DB08]();
}

uint64_t sub_253277078()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_253277088()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_253277098()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2532770A8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2532770B8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2532770C8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2532770D8()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_2532770E8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2532770F8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_253277108()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_253277118()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_253277128()
{
  return MEMORY[0x270F9DD58]();
}

uint64_t sub_253277138()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_253277148()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_253277158()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_253277188()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_253277198()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2532771A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2532771D8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2532771F8()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_253277218()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_253277228()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_253277238()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t sub_253277248()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_253277258()
{
  return MEMORY[0x270EF1C90]();
}

uint64_t sub_253277268()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_253277278()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_253277288()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_253277298()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2532772A8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2532772B8()
{
  return MEMORY[0x270F9DEF8]();
}

uint64_t sub_2532772C8()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_2532772D8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2532772E8()
{
  return MEMORY[0x270EF1D20]();
}

uint64_t sub_2532772F8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_253277308()
{
  return MEMORY[0x270F41180]();
}

uint64_t sub_253277318()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_253277328()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_253277338()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_253277348()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_253277358()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_253277368()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_253277378()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_253277388()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_253277398()
{
  return MEMORY[0x270FA2BD0]();
}

uint64_t sub_2532773A8()
{
  return MEMORY[0x270FA2BD8]();
}

uint64_t sub_2532773B8()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t sub_2532773C8()
{
  return MEMORY[0x270FA2BE8]();
}

uint64_t sub_2532773D8()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2532773E8()
{
  return MEMORY[0x270FA10E0]();
}

uint64_t sub_253277408()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_253277418()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_253277428()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_253277438()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_253277448()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_253277458()
{
  return MEMORY[0x270F3EF90]();
}

uint64_t sub_253277468()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_253277478()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_253277488()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_253277498()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2532774A8()
{
  return MEMORY[0x270F6F4D8]();
}

uint64_t sub_2532774B8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2532774C8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2532774D8()
{
  return MEMORY[0x270FA1110]();
}

uint64_t sub_2532774E8()
{
  return MEMORY[0x270FA1118]();
}

uint64_t sub_2532774F8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_253277508()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_253277518()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_253277528()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t sub_253277538()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_253277548()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_253277558()
{
  return MEMORY[0x270EF2250]();
}

uint64_t sub_253277568()
{
  return MEMORY[0x270EF22D8]();
}

uint64_t sub_253277578()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_253277588()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_253277598()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2532775A8()
{
  return MEMORY[0x270F9E3C8]();
}

uint64_t sub_2532775B8()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_2532775C8()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_2532775D8()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_2532775E8()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2532775F8()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_253277608()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_253277618()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_253277628()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_253277638()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_253277648()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_253277658()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_253277668()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_253277678()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_253277688()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_253277698()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_2532776A8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2532776B8()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_2532776C8()
{
  return MEMORY[0x270F9E608]();
}

uint64_t sub_2532776D8()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_2532776E8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2532776F8()
{
  return MEMORY[0x270F9E6C8]();
}

uint64_t sub_253277708()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_253277718()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_253277728()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_253277738()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_253277748()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_253277758()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_253277768()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_253277778()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_253277788()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_253277798()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2532777A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2532777B8()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2532777D8()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2532777E8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2532777F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_253277808()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_253277818()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_253277828()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_253277838()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_253277848()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_253277858()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_253277878()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_253277888()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_253277898()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2532778A8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2532778B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2532778C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2532778D8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2532778E8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2532778F8()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_253277908()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_253277918()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_253277928()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_253277938()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_253277948()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_253277958()
{
  return MEMORY[0x270FA21B8]();
}

uint64_t sub_253277968()
{
  return MEMORY[0x270FA21F0]();
}

uint64_t sub_253277978()
{
  return MEMORY[0x270FA21F8]();
}

uint64_t sub_253277988()
{
  return MEMORY[0x270FA2200]();
}

uint64_t sub_253277998()
{
  return MEMORY[0x270FA2208]();
}

uint64_t sub_2532779A8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2532779B8()
{
  return MEMORY[0x270F9EE48]();
}

uint64_t sub_2532779C8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2532779D8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_2532779E8()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2532779F8()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_253277A08()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_253277A18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_253277A28()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_253277A38()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_253277A48()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_253277A58()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_253277A68()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_253277A78()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_253277A98()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_253277AB8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_253277AC8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_253277AD8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_253277AE8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_253277AF8()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_253277B08()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_253277B18()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_253277B28()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_253277B38()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_253277B48()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_253277B58()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_253277B68()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_253277B78()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_253277B88()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_253277B98()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_253277BA8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_253277BB8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_253277BC8()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_253277BD8()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_253277BE8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_253277BF8()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_253277C08()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_253277C18()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_253277C28()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_253277C38()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_253277C48()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_253277C58()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_253277C68()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_253277C78()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_253277C88()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_253277C98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_253277CB8()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_253277CC8()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_253277CD8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_253277CE8()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_253277CF8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_253277D08()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_253277D18()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_253277D28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_253277D38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_253277D68()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_253277D78()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_253277D88()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_253277D98()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_253277DA8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_253277DB8()
{
  return MEMORY[0x270EF2690]();
}

uint64_t sub_253277DC8()
{
  return MEMORY[0x270F9FC20]();
}

uint64_t sub_253277DE8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_253277DF8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_253277E08()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_253277E18()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_253277E28()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_253277E38()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_253277E48()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_253277E58()
{
  return MEMORY[0x270EF2788]();
}

uint64_t sub_253277E68()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_253277E78()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_253277E88()
{
  return MEMORY[0x270F9FF50]();
}

uint64_t sub_253277E98()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_253277EA8()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t _AFSupportPreferencesBoolForKeyWithDefault()
{
  return MEMORY[0x270F0F080]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99C30](this, a2);
}

uint64_t marisa::Trie::build(marisa::Trie *this, Keyset *a2)
{
  return MEMORY[0x270F99C38](this, a2);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x270F99C48](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x270F99C58](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x270F99C60](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x270F99C68](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2, float a3)
{
  return MEMORY[0x270F99C80](this, a2, a3);
}

uint64_t marisa::Keyset::Keyset(marisa::Keyset *this)
{
  return MEMORY[0x270F99C88](this);
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C90](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C98](this, a2);
}

uint64_t marisa::Trie::save(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99CA0](this, a2);
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  return MEMORY[0x270F99CA8](this);
}

uint64_t marisa::Trie::lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99CB8](this, a2);
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  return MEMORY[0x270F99CC0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x270FA2448]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x270F79688]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x270F79698]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x270F796D8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x270F796F8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x270F79700]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x270F79710]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x270F79718]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x270F79750]();
}