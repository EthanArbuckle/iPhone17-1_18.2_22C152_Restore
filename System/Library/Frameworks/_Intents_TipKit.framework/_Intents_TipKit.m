void sub_2465498F8()
{
  qword_26B118190 = MEMORY[0x263F8EE80];
}

uint64_t sub_24654990C(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118178);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_24654D1C0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118180);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_24654D290();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = sub_24654D2C0();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246549AF4, 0, 0);
}

uint64_t sub_246549AF4()
{
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    uint64_t v3 = v0[15];
    uint64_t v4 = v0[16];
    uint64_t v6 = v0[13];
    uint64_t v5 = v0[14];
    uint64_t v7 = (void *)v0[9];
    v8 = (void *)v0[4];
    sub_24654D3D0();

    sub_24654D2B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v4, v6);
    sub_24654A34C(MEMORY[0x263F8EE78]);
    *uint64_t v7 = v8;
    uint64_t v9 = *MEMORY[0x263F74CF8];
    uint64_t v10 = sub_24654D2F0();
    uint64_t v11 = *(void *)(v10 - 8);
    (*(void (**)(void *, uint64_t, uint64_t))(v11 + 104))(v7, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    id v12 = v8;
    sub_24654D280();
    if (qword_26B118160 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24654D320();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B118198);
    v14 = sub_24654D300();
    os_log_type_t v15 = sub_24654D410();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_246548000, v14, v15, "Calling SiriSuggestionsAPI to fetch example utterance for intent", v16, 2u);
      MEMORY[0x24C52E390](v16, -1, -1);
    }

    sub_24654D1F0();
    v0[17] = sub_24654D1E0();
    uint64_t v19 = v0[5];
    sub_24654D1B0();
    uint64_t v20 = sub_24654D2A0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    v21 = (void *)swift_task_alloc();
    v0[18] = v21;
    void *v21 = v0;
    v21[1] = sub_24654A094;
    uint64_t v23 = v0[12];
    uint64_t v24 = v0[8];
    uint64_t v25 = v0[5];
    uint64_t v26 = v0[3];
    v22.n128_u64[0] = 1.0;
    return MEMORY[0x270F716D0](v26, v23, v24, v25, v22);
  }
  else
  {
    uint64_t v17 = v0[3];
    uint64_t v18 = sub_24654D220();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v27 = (uint64_t (*)(void))v0[1];
    return v27();
  }
}

uint64_t sub_24654A094()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 64);
  uint64_t v2 = *(void *)(*(void *)v0 + 56);
  uint64_t v3 = *(void *)(*(void *)v0 + 48);
  uint64_t v4 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  swift_release();
  sub_24654A4B4(v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24654A22C, 0, 0);
}

uint64_t sub_24654A22C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
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

unint64_t sub_24654A34C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B930);
  uint64_t v2 = sub_24654D4A0();
  uint64_t v3 = (void *)v2;
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
    sub_24654A514(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24654C148(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24654A57C(v17, (_OWORD *)(v3[7] + 48 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 64;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24654A4B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B118178);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24654A514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24654A57C(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t static SiriKitIntentTip.create(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  uint64_t v7 = sub_24654D270();
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v8 = sub_24654D250();
  v5[13] = v8;
  v5[14] = *(void *)(v8 - 8);
  v5[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118168);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  uint64_t v9 = sub_24654D220();
  v5[18] = v9;
  v5[19] = *(void *)(v9 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = *(void *)(a3 - 8);
  v5[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24654A7A8, 0, 0);
}

uint64_t sub_24654A7A8()
{
  (*(void (**)(void))(v0[8] + 40))(v0[7]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[23] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24654A860;
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[6];
  return sub_24654990C(v2, v3);
}

uint64_t sub_24654A860()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24654A95C, 0, 0);
}

uint64_t sub_24654A95C()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[21];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[5];
    (*(void (**)(void, uint64_t))(v4 + 8))(v0[22], v5);
    sub_24654C1C0(v3, &qword_26B118168);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, 1, 1, v5);
  }
  else
  {
    uint64_t v8 = v0[14];
    uint64_t v7 = v0[15];
    uint64_t v9 = v0[12];
    uint64_t v10 = v0[11];
    uint64_t v24 = v0[13];
    uint64_t v25 = v0[10];
    uint64_t v27 = v0[8];
    uint64_t v29 = v0[7];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[20], v3, v1);
    sub_24654D200();
    sub_24654D230();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v24);
    uint64_t v11 = sub_24654D260();
    uint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 24))(v11, v13, v29);
    if (qword_26B118170 != -1) {
      swift_once();
    }
    uint64_t v14 = v0[21];
    uint64_t v15 = v0[19];
    uint64_t v16 = v0[20];
    uint64_t v17 = v0[18];
    uint64_t v18 = v0[16];
    uint64_t v19 = v0[7];
    uint64_t v28 = v0[22];
    uint64_t v30 = v0[5];
    uint64_t v20 = sub_24654D330();
    uint64_t v26 = v21;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v16, v17);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v17);
    swift_beginAccess();
    sub_24654AC9C(v18, v20, v26);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v30, v28, v19);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v30, 0, 1, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __n128 v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_24654AC9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118168);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24654D220();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_24654C1C0(a1, &qword_26B118168);
    sub_24654C400(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_24654C1C0((uint64_t)v9, &qword_26B118168);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_24654CBA0((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t SiriKitIntentTip.exampleUtterance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t SiriKitIntentTip.siriDidExecuteIntent.getter(uint64_t a1, uint64_t a2)
{
  return sub_24654B40C(a1, a2, MEMORY[0x263F74838]);
}

uint64_t sub_24654AEA4()
{
  uint64_t v0 = sub_24654D2E0();
  uint64_t v31 = *(void *)(v0 - 8);
  uint64_t v32 = v0;
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24654D250();
  uint64_t v30 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24654D220();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118168);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  if (qword_26B118170 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24654D330();
  uint64_t v14 = v13;
  swift_beginAccess();
  uint64_t v15 = qword_26B118190;
  if (*(void *)(qword_26B118190 + 16) && (unint64_t v16 = sub_24654C148(v12, v14), (v17 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v11, *(void *)(v15 + 56) + *(void *)(v7 + 72) * v16, v6);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v11, v18, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    sub_24654C1C0((uint64_t)v11, &qword_26B118168);
    swift_endAccess();
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v11, v6);
    sub_24654C1C0((uint64_t)v11, &qword_26B118168);
    swift_endAccess();
    sub_24654D200();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_24654D240();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
    uint64_t v19 = sub_24654D2D0();
    unint64_t v20 = v21;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v2, v32);
  }
  uint64_t v35 = v19;
  unint64_t v36 = v20;
  uint64_t v22 = qword_26B118160;
  swift_bridgeObjectRetain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24654D320();
  __swift_project_value_buffer(v23, (uint64_t)qword_26B118198);
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_24654D300();
  os_log_type_t v25 = sub_24654D410();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v34[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_24654BAF0(v19, v20, v34);
    sub_24654D420();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246548000, v24, v25, "Derived loggingIntentIdentifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C52E390](v27, -1, -1);
    MEMORY[0x24C52E390](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return v35;
}

uint64_t SiriKitIntentTip.siriEducatedIntent.getter(uint64_t a1, uint64_t a2)
{
  return sub_24654B40C(a1, a2, MEMORY[0x263F74830]);
}

uint64_t sub_24654B40C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v6 = v3;
  sub_24654AEA4();
  sub_24654D3F0();
  swift_bridgeObjectRelease();

  return MEMORY[0x270F05D20](v5, v6);
}

uint64_t (*SiriKitIntentTip.notifySiriTipOnDisplay.getter())()
{
  uint64_t v0 = sub_24654D220();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118168);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B118170 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24654D330();
  uint64_t v8 = v7;
  swift_beginAccess();
  uint64_t v9 = qword_26B118190;
  if (*(void *)(qword_26B118190 + 16) && (unint64_t v10 = sub_24654C148(v6, v8), (v11 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v5, *(void *)(v9 + 56) + *(void *)(v1 + 72) * v10, v0);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v5, v12, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0))
  {
    sub_24654C1C0((uint64_t)v5, &qword_26B118168);
    swift_endAccess();
    if (qword_26B118160 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24654D320();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B118198);
    uint64_t v14 = sub_24654D300();
    os_log_type_t v15 = sub_24654D410();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_246548000, v14, v15, "Could not get callback function from cache", v16, 2u);
      MEMORY[0x24C52E390](v16, -1, -1);
    }

    return nullsub_1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v3, v5, v0);
    sub_24654C1C0((uint64_t)v5, &qword_26B118168);
    swift_endAccess();
    uint64_t v17 = sub_24654D210();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return (uint64_t (*)())v17;
}

uint64_t SiriKitIntentTip.siriIcon.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B948);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v15 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24654D370();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    sub_24654D380();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
    sub_24654D3A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_24654D350();
    uint64_t v6 = sub_24654D360();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
    uint64_t v7 = sub_24654D390();
    swift_release();
    sub_24654C1C0((uint64_t)v1, &qword_268F8B948);
  }
  else
  {
    uint64_t v8 = (void *)sub_24654D3C0();
    id v9 = objc_msgSend(self, sel_bundleWithIdentifier_, v8);

    if (v9)
    {
      return sub_24654D3B0();
    }
    else
    {
      if (qword_26B118160 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_24654D320();
      __swift_project_value_buffer(v10, (uint64_t)qword_26B118198);
      char v11 = sub_24654D300();
      os_log_type_t v12 = sub_24654D410();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_246548000, v11, v12, "Could not get bundle for identifier to get the siriIcon", v13, 2u);
        MEMORY[0x24C52E390](v13, -1, -1);
      }

      return 0;
    }
  }
  return v7;
}

uint64_t sub_24654BAF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24654BBC4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24654C3A0((uint64_t)v12, *a3);
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
      sub_24654C3A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24654BBC4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24654D430();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24654BD80(a5, a6);
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
  uint64_t v8 = sub_24654D460();
  if (!v8)
  {
    sub_24654D470();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24654D4B0();
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

uint64_t sub_24654BD80(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24654BE18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24654BFF8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24654BFF8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24654BE18(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24654BF90(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24654D450();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24654D470();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24654D400();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24654D4B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24654D470();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24654BF90(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B950);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24654BFF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8B950);
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
  uint64_t result = sub_24654D4B0();
  __break(1u);
  return result;
}

unint64_t sub_24654C148(uint64_t a1, uint64_t a2)
{
  sub_24654D4E0();
  sub_24654D3E0();
  uint64_t v4 = sub_24654D4F0();

  return sub_24654C26C(a1, a2, v4);
}

uint64_t sub_24654C1C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SiriKitIntentTip.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t sub_24654C26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24654D4C0() & 1) == 0)
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
      while (!v14 && (sub_24654D4C0() & 1) == 0);
    }
  }
  return v6;
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

uint64_t sub_24654C3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24654C400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24654C148(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24654CDD0();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_24654D220();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_24654C990(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_24654D220();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_24654C5A8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_24654D220();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388]();
  v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118188);
  int v47 = a2;
  uint64_t v8 = sub_24654D490();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  BOOL v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_24654D4E0();
    sub_24654D3E0();
    uint64_t result = sub_24654D4F0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_24654C990(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24654D440();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_24654D4E0();
        swift_bridgeObjectRetain();
        sub_24654D3E0();
        uint64_t v9 = sub_24654D4F0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_24654D220() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
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
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24654CBA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24654C148(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24654CDD0();
      goto LABEL_7;
    }
    sub_24654C5A8(v15, a4 & 1);
    unint64_t v26 = sub_24654C148(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24654D4D0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_24654D220();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_24654CD20(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24654CD20(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_24654D220();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_24654CDD0()
{
  uint64_t v35 = sub_24654D220();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B118188);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_24654D480();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *uint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24654D094()
{
  uint64_t v0 = sub_24654D320();
  __swift_allocate_value_buffer(v0, qword_26B118198);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B118198);
  return sub_24654D310();
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

uint64_t sub_24654D17C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24654D1B0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24654D1C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24654D1E0()
{
  return MEMORY[0x270F716D8]();
}

uint64_t sub_24654D1F0()
{
  return MEMORY[0x270F716E0]();
}

uint64_t sub_24654D200()
{
  return MEMORY[0x270F716E8]();
}

uint64_t sub_24654D210()
{
  return MEMORY[0x270F716F0]();
}

uint64_t sub_24654D220()
{
  return MEMORY[0x270F716F8]();
}

uint64_t sub_24654D230()
{
  return MEMORY[0x270F71728]();
}

uint64_t sub_24654D240()
{
  return MEMORY[0x270F71738]();
}

uint64_t sub_24654D250()
{
  return MEMORY[0x270F71758]();
}

uint64_t sub_24654D260()
{
  return MEMORY[0x270F71770]();
}

uint64_t sub_24654D270()
{
  return MEMORY[0x270F71780]();
}

uint64_t sub_24654D280()
{
  return MEMORY[0x270F71940]();
}

uint64_t sub_24654D290()
{
  return MEMORY[0x270F71968]();
}

uint64_t sub_24654D2A0()
{
  return MEMORY[0x270F71A70]();
}

uint64_t sub_24654D2B0()
{
  return MEMORY[0x270F71A80]();
}

uint64_t sub_24654D2C0()
{
  return MEMORY[0x270F71AA0]();
}

uint64_t sub_24654D2D0()
{
  return MEMORY[0x270F71CD8]();
}

uint64_t sub_24654D2E0()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_24654D2F0()
{
  return MEMORY[0x270F71D18]();
}

uint64_t sub_24654D300()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24654D310()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24654D320()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24654D330()
{
  return MEMORY[0x270F05B38]();
}

uint64_t sub_24654D350()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_24654D360()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_24654D370()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24654D380()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24654D390()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_24654D3A0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24654D3B0()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24654D3C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24654D3D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24654D3E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24654D3F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24654D400()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24654D410()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24654D420()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24654D430()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24654D440()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24654D450()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24654D460()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24654D470()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24654D480()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24654D490()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24654D4A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24654D4B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24654D4C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24654D4D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24654D4E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24654D4F0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x270F0ECF0]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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