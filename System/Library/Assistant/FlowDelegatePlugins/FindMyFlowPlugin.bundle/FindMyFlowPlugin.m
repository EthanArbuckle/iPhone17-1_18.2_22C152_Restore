uint64_t sub_3F08()
{
  return swift_allocObject();
}

uint64_t sub_3F18(uint64_t a1)
{
  uint64_t v2 = sub_7050();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6E40();
  uint64_t v6 = sub_6E30();
  sub_40D8((uint64_t)v8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if (!v6)
  {
    sub_6E20();
    uint64_t v6 = sub_6E10();
    sub_412C((uint64_t)v8);
  }
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_4054()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindMyFlowPlugin()
{
  return self;
}

uint64_t sub_4088@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3F08();
  *a1 = result;
  return result;
}

uint64_t sub_40BC(uint64_t a1)
{
  return sub_3F18(a1);
}

uint64_t sub_40D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_412C(uint64_t a1)
{
  return a1;
}

BOOL sub_4180()
{
  type metadata accessor for RedirectToCompanionFlow.State(0);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state;
  swift_beginAccess();
  sub_61F4(v3, (uint64_t)v2);
  uint64_t v4 = sub_7040();
  BOOL v5 = sub_5468((uint64_t)v2, 2, v4) == 0;
  sub_6258((uint64_t)v2);
  return v5;
}

uint64_t sub_4240()
{
  sub_6E04();
  v1[8] = v2;
  v1[9] = v0;
  sub_6044(&qword_C380);
  v1[10] = sub_6DDC();
  uint64_t v3 = sub_6EC0();
  v1[11] = v3;
  sub_6DAC(v3);
  v1[12] = v4;
  v1[13] = sub_6DDC();
  uint64_t v5 = sub_7030();
  v1[14] = v5;
  sub_6DAC(v5);
  v1[15] = v6;
  v1[16] = sub_6DDC();
  uint64_t v7 = sub_6EB0();
  v1[17] = v7;
  sub_6DAC(v7);
  v1[18] = v8;
  v1[19] = sub_6DDC();
  uint64_t v9 = sub_7020();
  v1[20] = v9;
  sub_6DAC(v9);
  v1[21] = v10;
  v1[22] = sub_6DDC();
  uint64_t v11 = sub_6F90();
  v1[23] = v11;
  sub_6DAC(v11);
  v1[24] = v12;
  v1[25] = sub_6DDC();
  type metadata accessor for RedirectToCompanionFlow.State(0);
  v1[26] = sub_6DDC();
  uint64_t v13 = sub_7040();
  v1[27] = v13;
  sub_6DAC(v13);
  v1[28] = v14;
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  return _swift_task_switch(sub_4424, 0, 0);
}

uint64_t sub_4424()
{
  if (qword_C150 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_70B0();
  sub_61BC(v1, (uint64_t)qword_C650);
  uint64_t v2 = sub_7090();
  os_log_type_t v3 = sub_70F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "[RedirectToCompanionFlow] Executing", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[26];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[9];

  uint64_t v8 = v7 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state;
  swift_beginAccess();
  sub_61F4(v8, v6);
  int v9 = sub_5468(v6, 2, v5);
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v10 = v0[26];
      sub_6FF0();
      sub_6258(v10);
    }
    else
    {
      uint64_t v22 = v0[24];
      uint64_t v21 = v0[25];
      uint64_t v23 = v0[23];
      (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, enum case for FlowUnhandledReason.needsServerExecution(_:), v23);
      sub_7000();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
  }
  else
  {
    uint64_t v11 = v0[30];
    uint64_t v12 = v0[27];
    uint64_t v14 = v0[21];
    uint64_t v13 = v0[22];
    uint64_t v15 = v0[20];
    uint64_t v26 = v0[19];
    uint64_t v27 = v0[29];
    uint64_t v16 = v0[16];
    uint64_t v30 = v0[18];
    uint64_t v31 = v0[17];
    uint64_t v17 = v0[15];
    uint64_t v28 = v0[14];
    uint64_t v32 = v0[13];
    uint64_t v33 = v0[12];
    uint64_t v34 = v0[11];
    uint64_t v29 = v0[10];
    uint64_t v35 = v0[28];
    (*(void (**)(uint64_t, void, uint64_t))(v35 + 32))(v11, v0[26], v12);
    sub_6EF0();
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for CompanionDeviceInfoRequirement.supportsPeerToPeerHandoff(_:), v15);
    sub_6EE0();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    sub_62B4();
    swift_retain();
    sub_6EA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v27, v11, v12);
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, enum case for ExecuteOnRemoteDeviceSpecification.userCompanion(_:), v28);
    sub_7010();
    sub_6E70();
    swift_allocObject();
    v0[5] = sub_6E60();
    sub_6044(&qword_C390);
    uint64_t v18 = sub_6F30();
    sub_6DAC(v18);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_7470;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v29, v26, v31);
    sub_5490(v29, 0, 1, v31);
    sub_6E90();
    sub_6F10();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    sub_6F20();
    uint64_t v19 = sub_6E50();
    swift_bridgeObjectRelease();
    v0[6] = v19;
    sub_6F00();
    uint64_t v20 = sub_6F60();
    swift_release();
    swift_release();
    v0[7] = v20;
    swift_retain();
    sub_6044(&qword_C398);
    sub_6308();
    sub_6FE0();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v26, v31);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v11, v12);
    swift_release();
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
  v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_49FC(uint64_t a1, uint8_t *a2)
{
  uint64_t v4 = sub_6E80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v55 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (uint64_t *)((char *)&v55 - v13);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = sub_6044(&qword_C3A8);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for RedirectToCompanionFlow.State(0);
  __chkstk_darwin(v20 - 8);
  uint64_t v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_63A4(a1, (uint64_t)v19);
  uint64_t v23 = sub_6044(&qword_C3B0);
  if (sub_5468((uint64_t)v19, 1, v23) == 1)
  {
    if (qword_C150 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_70B0();
    sub_61BC(v24, (uint64_t)qword_C650);
    v25 = sub_7090();
    os_log_type_t v26 = sub_70E0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "[RedirectToCompanionFlow] ExecuteOnRemote guard flows failed, assuming a server redirect or handoff should have happened, doing nothing.", v27, 2u);
      swift_slowDealloc();
    }

    uint64_t v28 = sub_7040();
    sub_5490((uint64_t)v22, 1, 2, v28);
    sub_640C((uint64_t)v19);
  }
  else
  {
    v59 = v22;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v16, v19, v4);
    uint64_t v29 = v16;
    uint64_t v30 = *(void (**)(uint64_t *))(v5 + 16);
    v60 = v29;
    v30(v14);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 88))(v14, v4) == enum case for ExecuteOnRemoteFlowResult.remoteFlowFailure(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v5 + 96))(v14, v4);
      uint64_t v31 = *v14;
      if (qword_C150 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_70B0();
      sub_61BC(v32, (uint64_t)qword_C650);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v33 = sub_7090();
      os_log_type_t v34 = sub_70E0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v61 = v31;
        v62[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        v58 = v35 + 4;
        swift_errorRetain();
        sub_6044(&qword_C3B8);
        uint64_t v37 = sub_70C0();
        uint64_t v61 = sub_64D0(v37, v38, v62);
        sub_7100();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v33, v34, "[RedirectToCompanionFlow] ExecuteOnRemote failed with an error=%s: Possible server redirect. Will redirect this input to server as a fallback.", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v60, v4);
      uint64_t v22 = v59;
      uint64_t v50 = sub_7040();
      sub_5490((uint64_t)v22, 2, 2, v50);
    }
    else
    {
      v58 = a2;
      if (qword_C150 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_70B0();
      sub_61BC(v39, (uint64_t)qword_C650);
      v40 = v60;
      ((void (*)(char *, char *, uint64_t))v30)(v11, v60, v4);
      v41 = sub_7090();
      os_log_type_t v42 = sub_70F0();
      int v43 = v42;
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v44 = swift_slowAlloc();
        int v56 = v43;
        v45 = (uint8_t *)v44;
        uint64_t v57 = swift_slowAlloc();
        v62[0] = v57;
        *(_DWORD *)v45 = 136315138;
        v55 = v45 + 4;
        ((void (*)(char *, char *, uint64_t))v30)(v8, v11, v4);
        uint64_t v46 = sub_70C0();
        uint64_t v61 = sub_64D0(v46, v47, v62);
        sub_7100();
        swift_bridgeObjectRelease();
        v48 = *(void (**)(char *, uint64_t))(v5 + 8);
        v48(v11, v4);
        _os_log_impl(&dword_0, v41, (os_log_type_t)v56, "[RedirectToCompanionFlow] ExecuteOnRemote flow completed with: %s", v45, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v49 = v60;
      }
      else
      {

        v48 = *(void (**)(char *, uint64_t))(v5 + 8);
        v48(v11, v4);
        v49 = v40;
      }
      v48(v49, v4);
      a2 = v58;
      uint64_t v51 = sub_7040();
      uint64_t v52 = (uint64_t)v59;
      sub_5490((uint64_t)v59, 1, 2, v51);
      v48((char *)v14, v4);
      uint64_t v22 = (char *)v52;
    }
  }
  uint64_t v53 = (uint64_t)&a2[OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state];
  swift_beginAccess();
  sub_646C((uint64_t)v22, v53);
  swift_endAccess();
  return sub_6258((uint64_t)v22);
}

uint64_t sub_5180()
{
  return sub_6F40();
}

uint64_t sub_51FC()
{
  sub_6258(v0 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_5260()
{
  return type metadata accessor for RedirectToCompanionFlow(0);
}

uint64_t type metadata accessor for RedirectToCompanionFlow(uint64_t a1)
{
  return sub_5338(a1, (uint64_t *)&unk_C220);
}

uint64_t sub_5288()
{
  uint64_t result = type metadata accessor for RedirectToCompanionFlow.State(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for RedirectToCompanionFlow.State(uint64_t a1)
{
  return sub_5338(a1, qword_C350);
}

uint64_t sub_5338(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_536C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_7040();
    if (sub_5468((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      sub_5490((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_5468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_5490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_54B8(uint64_t a1)
{
  uint64_t v2 = sub_7040();
  uint64_t result = sub_5468(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_5540(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_7040();
  if (sub_5468((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    sub_5490((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_5600(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_7040();
  int v7 = sub_5468((uint64_t)a1, 2, v6);
  int v8 = sub_5468((uint64_t)a2, 2, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  sub_5490((uint64_t)a1, 0, 2, v6);
  return a1;
}

void *sub_5748(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_7040();
  if (sub_5468((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    sub_5490((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_5808(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_7040();
  int v7 = sub_5468((uint64_t)a1, 2, v6);
  int v8 = sub_5468((uint64_t)a2, 2, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  sub_5490((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_5950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5964);
}

uint64_t sub_5964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040();
  unsigned int v5 = sub_5468(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_59AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_59C0);
}

uint64_t sub_59C0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_7040();

  return sub_5490(a1, v5, a3, v6);
}

uint64_t sub_5A20(uint64_t a1)
{
  uint64_t v2 = sub_7040();

  return sub_5468(a1, 2, v2);
}

uint64_t sub_5A68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_7040();

  return sub_5490(a1, a2, 2, v4);
}

uint64_t sub_5AB4()
{
  uint64_t result = sub_7040();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_5B2C()
{
  return sub_7070();
}

uint64_t sub_5B50()
{
  return sub_7080();
}

void (*sub_5B74(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_7060();
  return sub_5BE8;
}

void sub_5BE8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

BOOL sub_5C30()
{
  return sub_4180();
}

uint64_t sub_5C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int v7 = v3;
  v7[1] = sub_5D08;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_5D08()
{
  sub_6E04();
  uint64_t v2 = v1;
  sub_6DC4();
  uint64_t v3 = *v0;
  sub_6DF4();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_5DD4()
{
  return sub_5180();
}

uint64_t sub_5DF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_5E94;
  return sub_4240();
}

uint64_t sub_5E94()
{
  sub_6E04();
  sub_6DC4();
  uint64_t v1 = *v0;
  sub_6DF4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_5F58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for RedirectToCompanionFlow(0);

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_5F98()
{
  return sub_6000(&qword_C370);
}

uint64_t sub_5FCC()
{
  return sub_6000(&qword_C378);
}

uint64_t sub_6000(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RedirectToCompanionFlow(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6044(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_5E94;
  return HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()(a1, a2, a3);
}

uint64_t sub_613C()
{
  uint64_t v0 = sub_70B0();
  sub_6D38(v0, qword_C650);
  sub_61BC(v0, (uint64_t)qword_C650);
  return sub_70A0();
}

uint64_t sub_61BC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_61F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6258(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_62B4()
{
  unint64_t result = qword_C388;
  if (!qword_C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C388);
  }
  return result;
}

uint64_t sub_6300(uint64_t a1)
{
  return sub_49FC(a1, v1);
}

unint64_t sub_6308()
{
  unint64_t result = qword_C3A0;
  if (!qword_C3A0)
  {
    sub_635C(&qword_C398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C3A0);
  }
  return result;
}

uint64_t sub_635C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_63A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6044(&qword_C3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_640C(uint64_t a1)
{
  uint64_t v2 = sub_6044(&qword_C3A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_646C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_64D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_65A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6CD8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_6CD8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6C88((uint64_t)v12);
  return v7;
}

uint64_t sub_65A4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_66FC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_7110();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_67D4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_7130();
    if (!v8)
    {
      uint64_t result = sub_7140();
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

void *sub_66FC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7150();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_67D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_686C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6A48(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6A48((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_686C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_70D0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_69E0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_7120();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_7150();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_7140();
  __break(1u);
  return result;
}

void *sub_69E0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_6044((uint64_t *)&unk_C3C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_6A48(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_6044((uint64_t *)&unk_C3C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_6BF8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_6B20(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_6B20(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7150();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_6BF8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_7150();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_6C88(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_6D38(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for SimpleHandoffStrategy()
{
  return &type metadata for SimpleHandoffStrategy;
}

uint64_t sub_6DAC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_6DDC()
{
  return swift_task_alloc();
}

uint64_t sub_6E10()
{
  return FindDeviceFlowFactory.makeFlowFrom(parse:)();
}

uint64_t sub_6E20()
{
  return FindDeviceFlowFactory.init()();
}

uint64_t sub_6E30()
{
  return FindMyFriendFlowProvider.makeFlow(parse:)();
}

uint64_t sub_6E40()
{
  return FindMyFriendFlowProvider.init()();
}

uint64_t sub_6E50()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t sub_6E60()
{
  return ExecuteOnRemoteFlow.init(inputToExecute:device:outputPublisher:)();
}

uint64_t sub_6E70()
{
  return type metadata accessor for ExecuteOnRemoteFlow();
}

uint64_t sub_6E80()
{
  return type metadata accessor for ExecuteOnRemoteFlowResult();
}

uint64_t sub_6E90()
{
  return UserIdentityCheckFlowStrategy.init(allowsAnonymousUser:allowsUserInteraction:handoffConfiguration:requireSpeechProfile:)();
}

uint64_t sub_6EA0()
{
  return UserIdentityCheckFlowStrategy.HandoffConfiguration.init(companionCompatiblityCheck:handoffStrategy:)();
}

uint64_t sub_6EB0()
{
  return type metadata accessor for UserIdentityCheckFlowStrategy.HandoffConfiguration();
}

uint64_t sub_6EC0()
{
  return type metadata accessor for UserIdentityCheckFlowStrategy();
}

uint64_t sub_6EE0()
{
  return static CompanionCompatibilityCheckFlowStrategy.require(_:redirectToServerOnFailure:)();
}

uint64_t sub_6EF0()
{
  return type metadata accessor for CompanionCompatibilityCheckFlowStrategy();
}

uint64_t sub_6F00()
{
  return type metadata accessor for GuardFlow();
}

uint64_t sub_6F10()
{
  return static CommonFlowGuard.ensuringUserIdentity(using:)();
}

uint64_t sub_6F20()
{
  return static CommonFlowGuard.ensuringUserHasSupportedCompanion(using:)();
}

uint64_t sub_6F30()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t sub_6F40()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_6F50()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_6F60()
{
  return Flow.guarded<A>(by:)();
}

uint64_t sub_6F90()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_6FA0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_6FB0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_6FC0(Swift::String refId)
{
}

void sub_6FD0()
{
}

uint64_t sub_6FE0()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_6FF0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_7000()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_7010()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_7020()
{
  return type metadata accessor for CompanionDeviceInfoRequirement();
}

uint64_t sub_7030()
{
  return type metadata accessor for ExecuteOnRemoteDeviceSpecification();
}

uint64_t sub_7040()
{
  return type metadata accessor for Input();
}

uint64_t sub_7050()
{
  return type metadata accessor for Parse();
}

uint64_t sub_7060()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t sub_7070()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_7080()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t sub_7090()
{
  return Logger.logObject.getter();
}

uint64_t sub_70A0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_70B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_70C0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_70D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_70E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_70F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_7100()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_7110()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_7120()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_7130()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_7140()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7150()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}