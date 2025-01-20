uint64_t sub_24D0EC008()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  OUTLINED_FUNCTION_12_0();
  v3 = v2;
  OUTLINED_FUNCTION_0_4();
  v5 = v4;
  OUTLINED_FUNCTION_7_0();
  *v6 = v5;
  v7 = *v1;
  OUTLINED_FUNCTION_7_0();
  *v8 = v7;
  *(void *)(v5 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
  {

    swift_release();
  }
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_24D0EC104()
{
  v2 = (void *)v0[17];
  swift_release();
  id v3 = v2;
  id v4 = v2;
  v5 = sub_24D0F01A0();
  os_log_type_t v6 = sub_24D0F0900();
  if (OUTLINED_FUNCTION_205(v6))
  {
    v7 = (void *)v0[17];
    v8 = (void *)v0[11];
    v9 = (_DWORD *)OUTLINED_FUNCTION_28();
    v10 = (void *)OUTLINED_FUNCTION_6();
    _DWORD *v9 = 138412290;
    id v11 = v7;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v12;
    OUTLINED_FUNCTION_263();
    void *v10 = v12;

    OUTLINED_FUNCTION_101(&dword_24D055000, v5, v1, "Failed to reload conversation provider. Error: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
    OUTLINED_FUNCTION_229();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
    v13 = (void *)v0[17];
    v14 = (void *)v0[11];
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_5();
  return v15();
}

uint64_t sub_24D0EC304(float a1)
{
  uint64_t result = MEMORY[0x25331E240](v1 + OBJC_IVAR____TtC10DropInCore17CallCenterManager_delegate);
  if (result)
  {
    sub_24D0881A8(a1);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_24D0EC37C(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_24D0F0430();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  v39 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24D0F0460();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  v37 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D0EFF70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v1 + OBJC_IVAR____TtC10DropInCore17CallCenterManager_logger;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v11 = sub_24D0F01A0();
  os_log_type_t v12 = sub_24D0F0920();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    v36[1] = a1;
    v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    v36[2] = v10;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    v36[3] = v1;
    *(_DWORD *)v14 = 136315138;
    sub_24D0EE9B4(&qword_269853090, MEMORY[0x263F06320]);
    uint64_t v17 = sub_24D0F0E00();
    id v43 = (id)sub_24D090FD8(v17, v18, aBlock);
    sub_24D0F0AD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_24D055000, v11, v12, "Uplink Muted changed with notification: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25331E140](v16, -1, -1);
    MEMORY[0x25331E140](v14, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_24D0EFF60();
  if (v45)
  {
    sub_24D05BAFC(0, &qword_26B1862D8);
    if ((swift_dynamicCast() & 1) == 0) {
      return;
    }
    id v19 = v43;
    id v20 = objc_msgSend(v43, sel_callCenter);
    if (v20)
    {
      v21 = v20;
      sub_24D05BAFC(0, (unint64_t *)&qword_26B187640);
      if (sub_24D0F0A70())
      {
        uint64_t v22 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = v22;
        *(void *)(v23 + 24) = v19;
        v46 = sub_24D0EE994;
        uint64_t v47 = v23;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_24D0C378C;
        v45 = &block_descriptor_10;
        v24 = _Block_copy(aBlock);
        swift_retain();
        id v25 = v19;
        v26 = v37;
        sub_24D0F0440();
        id v43 = (id)MEMORY[0x263F8EE78];
        sub_24D0EE9B4((unint64_t *)&qword_26B186240, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B186250);
        sub_24D094AC0((unint64_t *)&qword_26B187210, (uint64_t *)&unk_26B186250);
        v27 = v39;
        uint64_t v28 = v42;
        sub_24D0F0B30();
        MEMORY[0x25331D310](0, v26, v27, v24);
        _Block_release(v24);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v28);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v40);
        swift_release();
        swift_release();
        return;
      }
    }
    id v29 = v19;
    v30 = sub_24D0F01A0();
    os_log_type_t v31 = sub_24D0F0920();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = (void *)swift_slowAlloc();
      *(_DWORD *)v32 = 138412290;
      id v34 = objc_msgSend(v29, sel_callCenter);
      id v35 = v34;
      if (v34) {
        aBlock[0] = (uint64_t)v34;
      }
      else {
        aBlock[0] = 0;
      }
      sub_24D0F0AD0();
      void *v33 = v35;

      _os_log_impl(&dword_24D055000, v30, v31, "Ignoring TUCall from different call center: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
      swift_arrayDestroy();
      MEMORY[0x25331E140](v33, -1, -1);
      MEMORY[0x25331E140](v32, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    sub_24D0EEEB8((uint64_t)aBlock, &qword_26B187690);
  }
}

void sub_24D0ECAD0(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x25331E240](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_24D0ECB2C(a2);
  }
}

void sub_24D0ECB2C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D0F0130();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_24D0F04A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (uint64_t *)((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC10DropInCore17CallCenterManager_serialQueue);
  void *v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0E0], v11);
  id v16 = v15;
  LOBYTE(v15) = sub_24D0F04C0();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
    __break(1u);
    return;
  }
  if (objc_msgSend(a1, sel_status) == 1)
  {
    if (objc_msgSend(a1, sel_isConversation))
    {
      uint64_t v17 = sub_24D09919C((uint64_t)a1);
      if (v17)
      {
        unint64_t v18 = v17;
        id v19 = *(void **)(v2 + OBJC_IVAR____TtC10DropInCore17CallCenterManager_activeConversation);
        if (v19)
        {
          id v20 = v19;
          id v21 = objc_msgSend(v18, sel_UUID);
          sub_24D0F0110();

          id v22 = objc_msgSend(v20, sel_UUID);
          sub_24D0F0110();

          LOBYTE(v22) = sub_24D0F0100();
          uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
          v23(v8, v4);
          v23(v10, v4);
          if (v22)
          {
            if (MEMORY[0x25331E240](v2 + OBJC_IVAR____TtC10DropInCore17CallCenterManager_delegate))
            {
              sub_24D088600(v2, (char)objc_msgSend(a1, sel_isUplinkMuted));

              swift_unknownObjectRelease();
            }
            else
            {
            }
            return;
          }
        }
      }
    }
  }
}

void sub_24D0ECE4C(uint64_t a1)
{
  uint64_t v2 = v1;
  v41[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24D0EFF70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v1[OBJC_IVAR____TtC10DropInCore17CallCenterManager_logger];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v9 = sub_24D0F01A0();
  os_log_type_t v10 = sub_24D0F0920();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v38[1] = a1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    v41[0] = v13;
    v38[2] = v8;
    v39 = v1;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_24D0EE9B4(&qword_269853090, MEMORY[0x263F06320]);
    uint64_t v14 = sub_24D0F0E00();
    id v40 = (id)sub_24D090FD8(v14, v15, v41);
    uint64_t v2 = v39;
    sub_24D0F0AD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_24D055000, v9, v10, "Call status changed with notification: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25331E140](v13, -1, -1);
    MEMORY[0x25331E140](v12, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_24D0EFF60();
  if (!v41[3])
  {
    sub_24D0EEEB8((uint64_t)v41, &qword_26B187690);
    return;
  }
  sub_24D05BAFC(0, &qword_26B1862D8);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  id v16 = v40;
  id v17 = objc_msgSend(v40, sel_callCenter);
  if (!v17) {
    goto LABEL_17;
  }
  unint64_t v18 = v17;
  sub_24D05BAFC(0, (unint64_t *)&qword_26B187640);
  if ((sub_24D0F0A70() & 1) == 0)
  {

LABEL_17:
    id v31 = v16;
    v32 = sub_24D0F01A0();
    os_log_type_t v33 = sub_24D0F0920();
    if (os_log_type_enabled(v32, v33))
    {
      id v34 = (uint8_t *)swift_slowAlloc();
      id v35 = (void *)swift_slowAlloc();
      *(_DWORD *)id v34 = 138412290;
      id v36 = objc_msgSend(v31, sel_callCenter);
      id v37 = v36;
      if (v36) {
        v41[0] = (uint64_t)v36;
      }
      else {
        v41[0] = 0;
      }
      sub_24D0F0AD0();
      *id v35 = v37;

      _os_log_impl(&dword_24D055000, v32, v33, "Ignoring TUCall from different call center: %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
      swift_arrayDestroy();
      MEMORY[0x25331E140](v35, -1, -1);
      MEMORY[0x25331E140](v34, -1, -1);
    }
    else
    {
    }
    return;
  }
  uint64_t v19 = OBJC_IVAR____TtC10DropInCore17CallCenterManager_activeCall;
  id v20 = *(void **)&v2[OBJC_IVAR____TtC10DropInCore17CallCenterManager_activeCall];
  if (v20)
  {
    id v16 = v16;
    id v21 = v20;
    char v22 = sub_24D0F0A70();

    if ((v22 & 1) != 0
      && (objc_msgSend(v16, sel_status) == 5 || objc_msgSend(v16, sel_status) == 6))
    {
      uint64_t v23 = v2;
      uint64_t v24 = sub_24D0F01A0();
      os_log_type_t v25 = sub_24D0F0920();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = v2;
        v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = (void *)swift_slowAlloc();
        *(_DWORD *)v27 = 138412290;
        id v29 = *(void **)&v26[v19];
        if (v29)
        {
          v39 = v27 + 12;
          v41[0] = (uint64_t)v29;
          id v30 = v29;
        }
        else
        {
          v41[0] = 0;
        }
        sub_24D0F0AD0();
        *uint64_t v28 = v29;

        _os_log_impl(&dword_24D055000, v24, v25, "Active call was disconnected ending conversation. Active Call: %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
        swift_arrayDestroy();
        MEMORY[0x25331E140](v28, -1, -1);
        MEMORY[0x25331E140](v27, -1, -1);
      }
      else
      {
      }
      (*(void (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v23) + 0x1A8))(0);
    }
  }
}

uint64_t sub_24D0ED4CC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = sub_24D0EFF70();
  OUTLINED_FUNCTION_0_3();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_53();
  sub_24D0EFF50();
  id v11 = a1;
  a4(v4);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
}

uint64_t sub_24D0ED584(uint64_t a1, uint64_t a2)
{
  v2[53] = a1;
  v2[54] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B186200);
  v2[55] = v3;
  v2[56] = *(void *)(v3 - 8);
  v2[57] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D0ED648, 0, 0);
}

uint64_t sub_24D0ED648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18_0();
  a21 = v24;
  a22 = v25;
  a20 = v23;
  OUTLINED_FUNCTION_1_5();
  uint64_t v26 = MEMORY[0x25331E240](v22);
  v23[58] = v26;
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = sub_24D0F03B0();
    unint64_t v30 = v29;
    v23[59] = v28;
    v23[60] = v29;
    v23[61] = OBJC_IVAR____TtC10DropInCore17CallCenterManager_logger;
    swift_bridgeObjectRetain_n();
    id v31 = sub_24D0F01A0();
    os_log_type_t v32 = sub_24D0F0920();
    if (os_log_type_enabled(v31, v32))
    {
      os_log_type_t v33 = (uint8_t *)OUTLINED_FUNCTION_28();
      a10 = OUTLINED_FUNCTION_2_2();
      *(_DWORD *)os_log_type_t v33 = 136315138;
      swift_bridgeObjectRetain();
      v23[49] = sub_24D090FD8(v28, v30, &a10);
      sub_24D0F0AD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D055000, v31, v32, "Looking up Conversation Provider with Service Name %s", v33, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v44 = OBJC_IVAR____TtC10DropInCore17CallCenterManager_conversationProviderManager;
    v23[62] = OBJC_IVAR____TtC10DropInCore17CallCenterManager_conversationProviderManager;
    v45 = *(void **)(v27 + v44);
    v23[63] = v45;
    id v46 = v45;
    uint64_t v47 = sub_24D0F0580();
    v23[64] = v47;
    v23[10] = v23;
    v23[15] = v23 + 47;
    v23[11] = sub_24D0ED918;
    uint64_t v48 = swift_continuation_init();
    v23[31] = MEMORY[0x263EF8330];
    v23[32] = 0x40000000;
    v23[33] = sub_24D0EE6C8;
    v23[34] = &block_descriptor_125;
    v23[35] = v48;
    objc_msgSend(v46, sel_conversationProviderForIdentifier_completionHandler_, v47, v23 + 31);
    OUTLINED_FUNCTION_17_0();
    return MEMORY[0x270FA23F0](v49);
  }
  else
  {
    sub_24D0714D8();
    swift_allocError();
    *id v34 = 0;
    swift_willThrow();
    swift_task_dealloc();
    OUTLINED_FUNCTION_2_5();
    OUTLINED_FUNCTION_17_0();
    return v36(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_24D0ED918()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_7_0();
  void *v2 = v1;
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24D0ED9EC()
{
  uint64_t v41 = v0;
  uint64_t v2 = *(void **)(v0 + 512);
  uint64_t v3 = *(void **)(v0 + 376);

  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_24D0F01A0();
    os_log_type_t v6 = sub_24D0F0920();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (_DWORD *)OUTLINED_FUNCTION_28();
      uint64_t v8 = (void *)OUTLINED_FUNCTION_6();
      _DWORD *v7 = 138412290;
      *(void *)(v0 + 416) = v4;
      id v9 = v4;
      sub_24D0F0AD0();
      void *v8 = v3;

      OUTLINED_FUNCTION_43_2(&dword_24D055000, v5, v10, "Found Existing Conversation Provider %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
    }
    *(void *)(v0 + 544) = v4;
    uint64_t v17 = *(void *)(v0 + 496);
    uint64_t v18 = *(void *)(v0 + 464);

    uint64_t v19 = *(void **)(v18 + v17);
    *(void *)(v0 + 552) = v19;
    id v20 = v19;
    uint64_t v21 = sub_24D0F0580();
    *(void *)(v0 + 560) = v21;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_24D0EE43C;
    uint64_t v22 = swift_continuation_init();
    *(void *)(v0 + 208) = MEMORY[0x263EF8330];
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = sub_24D0B4E04;
    *(void *)(v0 + 232) = &block_descriptor_127;
    *(void *)(v0 + 240) = v22;
    objc_msgSend(v20, sel_registerForCallbacksForProvider_completionHandler_, v21, v0 + 208);
    uint64_t v23 = v0 + 16;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain_n();
  id v11 = sub_24D0F01A0();
  os_log_type_t v12 = sub_24D0F0920();
  BOOL v13 = OUTLINED_FUNCTION_130(v12);
  unint64_t v14 = *(void *)(v0 + 480);
  if (v13)
  {
    uint64_t v15 = *(void *)(v0 + 472);
    id v16 = (uint8_t *)OUTLINED_FUNCTION_28();
    uint64_t v40 = OUTLINED_FUNCTION_2_2();
    *(_DWORD *)id v16 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 408) = sub_24D090FD8(v15, v14, &v40);
    sub_24D0F0AD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D055000, v11, v1, "Attempting to Register Conversation Provider with Service Name %s", v16, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_24D05BAFC(0, &qword_26B187278);
  swift_bridgeObjectRetain();
  id v24 = sub_24D0EE708();
  *(void *)(v0 + 520) = v24;
  sub_24D0EEAE4(0x6E49706F7244, 0xE600000000000000, v24);
  objc_msgSend(v24, sel_setWantsLeaveOnInvalidation_, 1);
  sub_24D0F0330();
  sub_24D094AC0((unint64_t *)&unk_26B1871A0, (uint64_t *)&unk_26B186200);
  sub_24D094AC0((unint64_t *)&unk_26B1871B0, (uint64_t *)&unk_26B186200);
  sub_24D094AC0((unint64_t *)&unk_26B1871C0, (uint64_t *)&unk_26B186200);
  sub_24D0F01F0();
  OUTLINED_FUNCTION_35_2();
  uint64_t v26 = v25();
  if (*(unsigned char *)(v0 + 576) == 1)
  {
    uint64_t v27 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 464)) + 0x188))(v26);
    uint64_t v29 = v28;
    swift_bridgeObjectRetain_n();
    unint64_t v30 = sub_24D0F01A0();
    os_log_type_t v31 = sub_24D0F0920();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)OUTLINED_FUNCTION_28();
      uint64_t v40 = OUTLINED_FUNCTION_2_2();
      *(_DWORD *)os_log_type_t v32 = 136315138;
      uint64_t v39 = v32 + 4;
      *(void *)(v0 + 352) = v27;
      *(void *)(v0 + 360) = v29;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B187410);
      uint64_t v33 = sub_24D0F05C0();
      *(void *)(v0 + 400) = sub_24D090FD8(v33, v34, &v40);
      sub_24D0F0AD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D055000, v30, v31, "Using client bundle ID: %s", v32, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      if (v29)
      {
LABEL_12:
        uint64_t v35 = (void *)sub_24D0F0580();
        swift_bridgeObjectRelease();
LABEL_15:
        objc_msgSend(v24, sel_setBundleID_, v35, v39);

        goto LABEL_16;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (v29) {
        goto LABEL_12;
      }
    }
    uint64_t v35 = 0;
    goto LABEL_15;
  }
LABEL_16:
  id v36 = *(void **)(*(void *)(v0 + 464) + *(void *)(v0 + 496));
  *(void *)(v0 + 528) = v36;
  *(void *)(v0 + 144) = v0;
  *(void *)(v0 + 184) = v0 + 368;
  *(void *)(v0 + 152) = sub_24D0EE0FC;
  uint64_t v37 = swift_continuation_init();
  *(void *)(v0 + 288) = MEMORY[0x263EF8330];
  *(void *)(v0 + 296) = 0x40000000;
  *(void *)(v0 + 304) = sub_24D082938;
  *(void *)(v0 + 312) = &block_descriptor_126;
  *(void *)(v0 + 320) = v37;
  objc_msgSend(v36, sel_registerConversationProviderForConfiguration_completionHandler_, v24, v0 + 288);
  uint64_t v23 = v0 + 144;
LABEL_17:
  return MEMORY[0x270FA23F0](v23);
}

uint64_t sub_24D0EE0FC()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_0();
  void *v2 = v1;
  void *v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 176);
  *(void *)(v1 + 536) = v4;
  if (v4) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24D0EE208()
{
  uint64_t v2 = *(void **)(v0 + 528);
  id v3 = *(id *)(v0 + 368);

  uint64_t v4 = v3;
  uint64_t v5 = sub_24D0F01A0();
  os_log_type_t v6 = sub_24D0F0920();
  if (OUTLINED_FUNCTION_205(v6))
  {
    uint64_t v7 = (_DWORD *)OUTLINED_FUNCTION_28();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_6();
    _DWORD *v7 = 138412290;
    *(void *)(v0 + 384) = v4;
    uint64_t v9 = v4;
    OUTLINED_FUNCTION_48_2();
    void *v8 = v4;

    OUTLINED_FUNCTION_101(&dword_24D055000, v5, v1, "Successfully Registered Conversation Provider %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1862F0);
    OUTLINED_FUNCTION_52_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {

    uint64_t v5 = v4;
  }

  uint64_t v10 = *(void **)(v0 + 520);
  *(void *)(v0 + 544) = v4;
  uint64_t v11 = *(void *)(v0 + 496);
  uint64_t v12 = *(void *)(v0 + 464);

  BOOL v13 = *(void **)(v12 + v11);
  *(void *)(v0 + 552) = v13;
  id v14 = v13;
  uint64_t v15 = sub_24D0F0580();
  *(void *)(v0 + 560) = v15;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24D0EE43C;
  uint64_t v16 = swift_continuation_init();
  *(void *)(v0 + 208) = MEMORY[0x263EF8330];
  *(void *)(v0 + 216) = 0x40000000;
  *(void *)(v0 + 224) = sub_24D0B4E04;
  *(void *)(v0 + 232) = &block_descriptor_127;
  *(void *)(v0 + 240) = v16;
  objc_msgSend(v14, sel_registerForCallbacksForProvider_completionHandler_, v15, v0 + 208);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D0EE43C()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_7_0();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 568) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24D0EE51C()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = *(void **)(v0 + 560);
  uint64_t v2 = *(void **)(v0 + 552);
  uint64_t v3 = *(void *)(v0 + 544);
  uint64_t v4 = *(void **)(v0 + 424);

  *uint64_t v4 = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_1();
  return v5();
}

uint64_t sub_24D0EE5A8()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = (void *)v0[66];
  uint64_t v2 = (void *)v0[65];
  uint64_t v3 = (void *)v0[58];
  swift_willThrow();

  swift_task_dealloc();
  OUTLINED_FUNCTION_2_5();
  return v4();
}

uint64_t sub_24D0EE634()
{
  OUTLINED_FUNCTION_31_0();
  uint64_t v1 = (void *)v0[70];
  uint64_t v2 = (void *)v0[69];
  uint64_t v3 = (void *)v0[68];
  uint64_t v4 = (void *)v0[58];
  swift_willThrow();

  swift_task_dealloc();
  OUTLINED_FUNCTION_2_5();
  return v5();
}

uint64_t sub_24D0EE6C8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;

  return sub_24D05B718(v3, (uint64_t)a2);
}

id sub_24D0EE708()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_24D0F0580();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  return v2;
}

uint64_t sub_24D0EE77C()
{
  unint64_t v0 = sub_24D0F0D90();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

void sub_24D0EE7C8(char a1)
{
  switch(a1)
  {
    case 3:
      OUTLINED_FUNCTION_75_0(24);
      break;
    case 4:
    case 5:
      OUTLINED_FUNCTION_22_6();
      break;
    default:
      return;
  }
}

uint64_t sub_24D0EE8CC(unsigned __int8 *a1, char *a2)
{
  return sub_24D071988(*a1, *a2);
}

uint64_t sub_24D0EE8D8()
{
  return sub_24D0A8CE4(*v0);
}

uint64_t sub_24D0EE8E0()
{
  return sub_24D0A8E98();
}

uint64_t sub_24D0EE8E8(uint64_t a1)
{
  return sub_24D0A90A8(a1, *v1);
}

uint64_t sub_24D0EE8F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24D0EE77C();
  *a1 = result;
  return result;
}

void sub_24D0EE920(void *a1@<X8>)
{
  sub_24D0EE7C8(*v1);
  *a1 = v3;
  a1[1] = v4;
}

unint64_t sub_24D0EE94C()
{
  return sub_24D0E5D9C(*v0);
}

uint64_t sub_24D0EE954()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D0EE98C()
{
  return objectdestroy_27Tm(32);
}

void sub_24D0EE994()
{
  sub_24D0ECAD0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_24D0EE9B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D0EE9FC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D0EEA3C()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_8_0(v6);
  void *v7 = v8;
  v7[1] = sub_24D09350C;
  return sub_24D0EBADC(v2, v3, v4, v5);
}

void sub_24D0EEAE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_24D0F0580();
  objc_msgSend(a3, sel_setPseudonymFeatureID_, v4);
}

uint64_t sub_24D0EEB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a1;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_24D0EEC04;
  return sub_24D0E74A8(a2, a3, a4, a5, a6);
}

uint64_t sub_24D0EEC04()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_7_0();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_7_0();
  void *v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_24D0EECE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a1;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_24D0EF5D8;
  return sub_24D0E78D0(a2, a3, a4, a5, a6);
}

uint64_t sub_24D0EEDB0()
{
  OUTLINED_FUNCTION_29();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_8_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24D09531C;
  uint64_t v3 = OUTLINED_FUNCTION_34_0();
  return v4(v3);
}

unint64_t sub_24D0EEE58()
{
  unint64_t result = qword_269851F60;
  if (!qword_269851F60)
  {
    sub_24D05BAFC(255, (unint64_t *)&qword_26B1862D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269851F60);
  }
  return result;
}

uint64_t sub_24D0EEEB8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_168();
  v3();
  return a1;
}

uint64_t sub_24D0EEF08()
{
  return objectdestroy_27Tm(33);
}

uint64_t objectdestroy_27Tm(uint64_t a1)
{
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

void sub_24D0EEF5C()
{
  sub_24D0E9070(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_24D0EEF68()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

void sub_24D0EEFA0()
{
  sub_24D0E8DC8(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_24D0EEFAC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

id sub_24D0EEFBC(id result, char a2)
{
  if (a2 == 1) {
    return result;
  }
  if (!a2) {
    return (id)swift_retain();
  }
  return result;
}

void sub_24D0EEFD8(void *a1, char a2)
{
  if (a2 == 1)
  {
  }
  else if (!a2)
  {
    swift_release();
  }
}

uint64_t objectdestroy_39Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24D0EF040()
{
  OUTLINED_FUNCTION_29();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_8_0(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24D09531C;
  uint64_t v3 = OUTLINED_FUNCTION_34_0();
  return v4(v3);
}

void sub_24D0EF0E8()
{
  sub_24D0EA040(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_24D0EF0F4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_24D0EA3E4(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24));
}

uint64_t sub_24D0EF104()
{
  return sub_24D0E915C(*(uint64_t (**)(void))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

#error "24D0EF158: call analysis failed (funcsize=17)"

uint64_t sub_24D0EF164()
{
  return objectdestroy_91Tm(&qword_269853148);
}

uint64_t sub_24D0EF170()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269853148);
  OUTLINED_FUNCTION_77(v0);

  return sub_24D0E9118();
}

#error "24D0EF20C: call analysis failed (funcsize=17)"

uint64_t sub_24D0EF218()
{
  return objectdestroy_91Tm(&qword_269853160);
}

uint64_t sub_24D0EF224(int a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269853160);
  OUTLINED_FUNCTION_77(v4);

  return sub_24D0E9B58(a1, a2);
}

void sub_24D0EF28C()
{
  sub_24D0E9DD8(*(void (**)(uint64_t, void *))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_24D0EF298(uint64_t a1)
{
  return sub_24D0E94AC(a1);
}

uint64_t sub_24D0EF2A4()
{
  return objectdestroy_91Tm(&qword_269853170);
}

uint64_t objectdestroy_91Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_11_0();
  v2 += 8;
  uint64_t v3 = *(unsigned __int8 *)(v2 + 72);
  uint64_t v4 = ((v3 + 16) & ~v3) + *(void *)(v2 + 56);
  uint64_t v5 = v3 | 7;
  OUTLINED_FUNCTION_168();
  v6();

  return MEMORY[0x270FA0238](v1, v4, v5);
}

uint64_t sub_24D0EF330(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269853170);
  OUTLINED_FUNCTION_77(v2);

  return sub_24D06EC38(a1);
}

uint64_t sub_24D0EF384()
{
  return objectdestroy_84Tm(41);
}

uint64_t objectdestroy_84Tm(uint64_t a1)
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

void sub_24D0EF3D8()
{
  sub_24D0E9820(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

void sub_24D0EF3E8()
{
  sub_24D0E86F4(v0);
}

uint64_t sub_24D0EF3F0()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v2 = v1;
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_8_0(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_24D09350C;
  return sub_24D0ED584(v2, v0);
}

unsigned char *storeEnumTagSinglePayload for CallCenterManager.CallCenterManagerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D0EF54CLL);
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

ValueMetadata *type metadata accessor for CallCenterManager.CallCenterManagerError()
{
  return &type metadata for CallCenterManager.CallCenterManagerError;
}

unint64_t sub_24D0EF58C()
{
  unint64_t result = qword_269853190;
  if (!qword_269853190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269853190);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return sub_24D0F0B30();
}

uint64_t OUTLINED_FUNCTION_20_10(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_3(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_43_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  return sub_24D0F0AD0();
}

uint64_t OUTLINED_FUNCTION_52_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54_2(uint64_t a1)
{
  *(void *)(v1 + 152) = a1;
  *(void *)(v2 + 128) = a1;
  *(unsigned char *)(v2 + 136) = 0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_55_2()
{
  return objectdestroy_84Tm(40);
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_61_1(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  *(void *)(v1 + 120) = v0;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_72_0(uint64_t a1)
{
  return a1 + 16;
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return sub_24D0F0430();
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_75_0(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

void OUTLINED_FUNCTION_77_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_80_0()
{
  sub_24D0EEFAC(v1);
  sub_24D0EEFBC(v0, 1);
  return sub_24D0F01A0();
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_83_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_86_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  return v0;
}

uint64_t sub_24D0EF9C4()
{
  return sub_24D0640EC();
}

uint64_t sub_24D0EF9EC()
{
  return sub_24D0640D4();
}

uint64_t sub_24D0EFA14()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10DropInCore22PhoneCallVolumeBooster_logger;
  uint64_t v2 = sub_24D0F01C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24D0EFA88()
{
  sub_24D0EFA14();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24D0EFAB4()
{
  return type metadata accessor for PhoneCallVolumeBooster();
}

uint64_t type metadata accessor for PhoneCallVolumeBooster()
{
  uint64_t result = qword_2698531A8;
  if (!qword_2698531A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D0EFB04()
{
  uint64_t result = sub_24D0F01C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_24D0EFBB8()
{
  sub_24D0F00C0();
  if (v0 <= 0x3F)
  {
    sub_24D0EFEB4(319, &qword_26B1861F8, MEMORY[0x263F07508]);
    if (v1 <= 0x3F)
    {
      sub_24D0EFEB4(319, qword_26B187138, (void (*)(uint64_t))type metadata accessor for Pseudonym);
      if (v2 <= 0x3F)
      {
        sub_24D0F01C0();
        if (v3 <= 0x3F) {
          swift_initClassMetadata2();
        }
      }
    }
  }
}

uint64_t sub_24D0EFD5C()
{
  sub_24D0F00C0();
  OUTLINED_FUNCTION_64();
  uint64_t v1 = OUTLINED_FUNCTION_8_2();
  v2(v1);
  sub_24D0EFF08(v0 + qword_26B187718, (uint64_t *)&unk_26B1875E0);
  sub_24D0EFF08(v0 + qword_26B187730, (uint64_t *)&unk_26B1875E0);

  sub_24D0EFF08(v0 + qword_26B187728, (uint64_t *)&unk_26B1875E0);
  sub_24D0EFF08(v0 + qword_26B187720, &qword_26B187568);
  swift_bridgeObjectRelease();
  sub_24D0F01C0();
  OUTLINED_FUNCTION_64();
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  v4(v3);
  sub_24D05C8DC(v0 + qword_26B186BE8);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24D0EFE70()
{
  sub_24D0EFD5C();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for SessionManager()
{
  return __swift_instantiateGenericMetadata();
}

void sub_24D0EFEB4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24D0F0AC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24D0EFF08(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_64();
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  v4(v3);
  return a1;
}

uint64_t sub_24D0EFF50()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24D0EFF60()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_24D0EFF70()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24D0EFF80()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_24D0EFF90()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_24D0EFFA0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24D0EFFB0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24D0EFFC0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24D0EFFD0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24D0EFFE0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D0EFFF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D0F0000()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D0F0010()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_24D0F0020()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24D0F0030()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24D0F0040()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24D0F0050()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24D0F0060()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24D0F0070()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24D0F0080()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24D0F0090()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24D0F00A0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D0F00B0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24D0F00C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D0F00D0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24D0F00E0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24D0F00F0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24D0F0100()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24D0F0110()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24D0F0120()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D0F0130()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D0F0140()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_24D0F0150()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_24D0F0160()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24D0F0170()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_24D0F0180()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_24D0F0190()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_24D0F01A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24D0F01B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24D0F01C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24D0F01D0()
{
  return MEMORY[0x270F26C38]();
}

uint64_t sub_24D0F01E0()
{
  return MEMORY[0x270F26C40]();
}

uint64_t sub_24D0F01F0()
{
  return MEMORY[0x270F26C48]();
}

uint64_t sub_24D0F0210()
{
  return MEMORY[0x270F26C58]();
}

uint64_t sub_24D0F0220()
{
  return MEMORY[0x270F26C60]();
}

uint64_t sub_24D0F0230()
{
  return MEMORY[0x270F26C68]();
}

uint64_t sub_24D0F0240()
{
  return MEMORY[0x270F26C70]();
}

uint64_t sub_24D0F0250()
{
  return MEMORY[0x270F26C78]();
}

uint64_t sub_24D0F0260()
{
  return MEMORY[0x270F26C80]();
}

uint64_t sub_24D0F0270()
{
  return MEMORY[0x270F26C88]();
}

uint64_t sub_24D0F0280()
{
  return MEMORY[0x270F26C90]();
}

uint64_t sub_24D0F0290()
{
  return MEMORY[0x270F26C98]();
}

uint64_t sub_24D0F02A0()
{
  return MEMORY[0x270F26CA0]();
}

uint64_t sub_24D0F02B0()
{
  return MEMORY[0x270F26CA8]();
}

uint64_t sub_24D0F02C0()
{
  return MEMORY[0x270F26CB0]();
}

uint64_t sub_24D0F02D0()
{
  return MEMORY[0x270F26CB8]();
}

uint64_t sub_24D0F02E0()
{
  return MEMORY[0x270F26CC0]();
}

uint64_t sub_24D0F02F0()
{
  return MEMORY[0x270F26CC8]();
}

uint64_t sub_24D0F0300()
{
  return MEMORY[0x270F26CD0]();
}

uint64_t sub_24D0F0310()
{
  return MEMORY[0x270F26CD8]();
}

uint64_t sub_24D0F0320()
{
  return MEMORY[0x270F26CE0]();
}

uint64_t sub_24D0F0330()
{
  return MEMORY[0x270F26CE8]();
}

uint64_t sub_24D0F0340()
{
  return MEMORY[0x270F26CF0]();
}

uint64_t sub_24D0F0350()
{
  return MEMORY[0x270F26CF8]();
}

uint64_t sub_24D0F0360()
{
  return MEMORY[0x270F26D00]();
}

uint64_t sub_24D0F0370()
{
  return MEMORY[0x270F26D08]();
}

uint64_t sub_24D0F0380()
{
  return MEMORY[0x270F26D10]();
}

uint64_t sub_24D0F0390()
{
  return MEMORY[0x270F26D18]();
}

uint64_t sub_24D0F03A0()
{
  return MEMORY[0x270F26D20]();
}

uint64_t sub_24D0F03B0()
{
  return MEMORY[0x270F26D28]();
}

uint64_t sub_24D0F03C0()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24D0F03E0()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_24D0F03F0()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_24D0F0400()
{
  return MEMORY[0x270EE3FA0]();
}

uint64_t sub_24D0F0410()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24D0F0420()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24D0F0430()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24D0F0440()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24D0F0450()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24D0F0460()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24D0F0470()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24D0F0480()
{
  return MEMORY[0x270FA0AE8]();
}

uint64_t sub_24D0F0490()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24D0F04A0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24D0F04B0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24D0F04C0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24D0F04D0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24D0F04E0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24D0F04F0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24D0F0500()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_24D0F0510()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24D0F0520()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_24D0F0530()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24D0F0540()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24D0F0550()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24D0F0560()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24D0F0570()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D0F0580()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D0F0590()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24D0F05A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D0F05B0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24D0F05C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D0F05E0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24D0F05F0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24D0F0600()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24D0F0610()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D0F0620()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24D0F0630()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24D0F0640()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D0F0650()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D0F0660()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24D0F0670()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24D0F0680()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24D0F06C0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24D0F06D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D0F06E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D0F06F0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24D0F0700()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24D0F0710()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24D0F0720()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24D0F0730()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24D0F0740()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24D0F0750()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24D0F0760()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24D0F0770()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24D0F0780()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24D0F07A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24D0F07B0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24D0F07C0()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_24D0F07D0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24D0F07F0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_24D0F0800()
{
  return MEMORY[0x270F9DD78]();
}

uint64_t sub_24D0F0810()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24D0F0820()
{
  return MEMORY[0x270F9DDB0]();
}

uint64_t sub_24D0F0830()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24D0F0840()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_24D0F0850()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24D0F0860()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24D0F0870()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24D0F0880()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24D0F0890()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24D0F08A0()
{
  return MEMORY[0x270F26D30]();
}

uint64_t sub_24D0F08B0()
{
  return MEMORY[0x270F26D38]();
}

uint64_t sub_24D0F08C0()
{
  return MEMORY[0x270F26D40]();
}

uint64_t sub_24D0F08D0()
{
  return MEMORY[0x270F26D48]();
}

uint64_t sub_24D0F08E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D0F08F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24D0F0900()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D0F0910()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24D0F0920()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D0F0930()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_24D0F0940()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_24D0F0950()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24D0F0960()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24D0F0970()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24D0F0980()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24D0F0990()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24D0F09A0()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_24D0F09B0()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_24D0F09C0()
{
  return MEMORY[0x270FA0E90]();
}

uint64_t sub_24D0F09D0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_24D0F09E0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_24D0F09F0()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_24D0F0A00()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_24D0F0A10()
{
  return MEMORY[0x270F26D50]();
}

uint64_t sub_24D0F0A20()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_24D0F0A30()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_24D0F0A40()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_24D0F0A50()
{
  return MEMORY[0x270F26D58]();
}

uint64_t sub_24D0F0A60()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24D0F0A70()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24D0F0A80()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24D0F0A90()
{
  return MEMORY[0x270EF2330]();
}

uint64_t sub_24D0F0AA0()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_24D0F0AB0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_24D0F0AC0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24D0F0AD0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D0F0AE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D0F0AF0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24D0F0B00()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_24D0F0B10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D0F0B30()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24D0F0B40()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24D0F0B50()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24D0F0B60()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24D0F0B70()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24D0F0B80()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24D0F0B90()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24D0F0BA0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_24D0F0BB0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24D0F0BC0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24D0F0BD0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24D0F0BE0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24D0F0BF0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24D0F0C00()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24D0F0C10()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24D0F0C20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D0F0C30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D0F0C40()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_24D0F0C50()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D0F0C60()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24D0F0C70()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24D0F0C80()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24D0F0C90()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D0F0CB0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24D0F0CC0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24D0F0CD0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24D0F0CE0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24D0F0CF0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24D0F0D00()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24D0F0D10()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24D0F0D20()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_24D0F0D30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D0F0D40()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D0F0D50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D0F0D60()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_24D0F0D70()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D0F0D80()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D0F0D90()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24D0F0DB0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24D0F0DC0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24D0F0DD0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24D0F0DE0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24D0F0DF0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24D0F0E00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D0F0E20()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_24D0F0E30()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_24D0F0E40()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D0F0E60()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_24D0F0E80()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24D0F0E90()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24D0F0EA0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D0F0ED0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24D0F0EE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D0F0EF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D0F0F00()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D0F0F10()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D0F0F20()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24D0F0F30()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D0F0F40()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D0F0F50()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24D0F0F60()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24D0F0F70()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24D0F0F80()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t IDSCopyBestGuessIDForID()
{
  return MEMORY[0x270F3C960]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

uint64_t IDSGetUUIDData()
{
  return MEMORY[0x270F3CA38]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}