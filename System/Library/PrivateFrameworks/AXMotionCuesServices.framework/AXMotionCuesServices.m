AXMotionCuesService *AXMotionCuesManager()
{
  return +[AXMotionCuesService sharedInstance];
}

uint64_t sub_24721F450()
{
  uint64_t v0 = sub_2472254F8();
  __swift_allocate_value_buffer(v0, qword_269241E38);
  __swift_project_value_buffer(v0, (uint64_t)qword_269241E38);
  return sub_2472254E8();
}

uint64_t MCLog.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2472254F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269241E38);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t MCLog.setter(uint64_t a1)
{
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2472254F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269241E38);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*MCLog.modify())()
{
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2472254F8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269241E38);
  swift_beginAccess();
  return j__swift_endAccess;
}

id AXMotionCueSharedInstance.getter()
{
  if (qword_26B129070 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B129068;
  return v0;
}

id sub_24721F7B0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXMotionCuesService()), sel_init);
  qword_26B129068 = (uint64_t)result;
  return result;
}

id static AXMotionCuesService.sharedInstance.getter()
{
  if (qword_26B129070 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B129068;
  return v0;
}

unint64_t AXMotionCuesService.serviceName.getter()
{
  return 0xD000000000000012;
}

id sub_24721F950()
{
  uint64_t v1 = OBJC_IVAR___AXMotionCuesService__client;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___AXMotionCuesService__client);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___AXMotionCuesService__client);
LABEL_6:
    id v13 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  sub_247225608();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_247225698();
  sub_247225558();
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x263F22198]);
  v7 = (void *)sub_247225548();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_247225548();
  id v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  v10 = *(void **)(v4 + v1);
  *(void *)(v4 + v1) = v9;

  id result = *(id *)(v4 + v1);
  if (result)
  {
    id result = objc_msgSend(result, sel_setDelegate_, v4);
    v12 = *(void **)(v4 + v1);
    if (v12)
    {
      id v3 = v12;
      uint64_t v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t AXMotionCuesService.enable(completionBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2472254F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_269241E38);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = sub_2472254D8();
  os_log_type_t v10 = sub_247225598();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24721D000, v9, v10, "Client requested enable for Motion Cues", v11, 2u);
    MEMORY[0x24C54E3D0](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v12 = sub_24721F950();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_24721FDEC;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_24722306C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247221578;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v15);
  _Block_release(v15);

  return swift_release();
}

uint64_t sub_24721FDB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24721FDEC(void *a1, char a2)
{
  sub_247220184(a1, a2 & 1, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), "Failed to enable Motion Cues: %@", "Client received success for Motion Cues enable");
}

void sub_24721FE50(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_247225488();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t AXMotionCuesService.disable(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2472254F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_269241E38);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = sub_2472254D8();
  os_log_type_t v10 = sub_247225598();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24721D000, v9, v10, "Client requested disable for Motion Cues", v11, 2u);
    MEMORY[0x24C54E3D0](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v12 = sub_24721F950();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_24722308C;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_247225454;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247221578;
  aBlock[3] = &block_descriptor_13;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v15);
  _Block_release(v15);

  return swift_release();
}

void sub_247220184(void *a1, char a2, void (*a3)(void, void), uint64_t a4, const char *a5, const char *a6)
{
  uint64_t v12 = sub_2472254F8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v39 - v17;
  if (a2)
  {
    id v23 = a1;
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v12, (uint64_t)qword_269241E38);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v24, v12);
    id v25 = a1;
    id v26 = a1;
    v27 = sub_2472254D8();
    os_log_type_t v28 = sub_247225588();
    if (os_log_type_enabled(v27, v28))
    {
      v42 = a3;
      uint64_t v29 = swift_slowAlloc();
      v40 = a5;
      v30 = (uint8_t *)v29;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v41 = a4;
      v32 = (void *)v31;
      *(_DWORD *)v30 = 138412290;
      v39 = v30 + 4;
      sub_2472251E0();
      swift_allocError();
      void *v33 = a1;
      id v34 = a1;
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v43 = v35;
      sub_2472255A8();
      void *v32 = v35;
      a3 = v42;
      sub_2472251D4(a1, 1);
      sub_2472251D4(a1, 1);
      _os_log_impl(&dword_24721D000, v27, v28, v40, v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269241D80);
      swift_arrayDestroy();
      MEMORY[0x24C54E3D0](v32, -1, -1);
      MEMORY[0x24C54E3D0](v30, -1, -1);
    }
    else
    {
      sub_2472251D4(a1, 1);
      sub_2472251D4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    sub_2472251E0();
    v36 = (void *)swift_allocError();
    void *v37 = a1;
    id v38 = a1;
    a3(0, v36);

    sub_2472251D4(a1, 1);
  }
  else
  {
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v12, (uint64_t)qword_269241E38);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v19, v12);
    v20 = sub_2472254D8();
    os_log_type_t v21 = sub_247225598();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_24721D000, v20, v21, a6, v22, 2u);
      MEMORY[0x24C54E3D0](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    a3(1, 0);
  }
}

uint64_t sub_247220614(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);

  return swift_release();
}

unint64_t sub_2472206A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B129050);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241D78);
  uint64_t v6 = sub_247225678();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247225160(v12, (uint64_t)v5, (uint64_t *)&unk_26B129050);
    unint64_t result = sub_2472237B8((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_2472254C8();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(_OWORD *)(v7[7] + 16 * v16) = *(_OWORD *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_24722089C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241DB0);
  uint64_t v2 = sub_247225678();
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
    sub_247225160(v6, (uint64_t)v15, &qword_269241DB8);
    unint64_t result = sub_24722383C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2472251C4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t AXMotionCuesService.registerMotionCuesMoving(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v37 = a1;
  unint64_t v40 = a3;
  uint64_t v3 = sub_2472254F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_2472254C8();
  uint64_t v7 = *(void *)(v38 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v38);
  long long v10 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - v11;
  sub_2472254B8();
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_269241E38);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  uint64_t v14 = sub_2472254D8();
  os_log_type_t v15 = sub_247225598();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_24721D000, v14, v15, "Attempting to register handler for Motion Cues moving", v16, 2u);
    MEMORY[0x24C54E3D0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v36 = sub_24721F950();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241C80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247225BE0;
  uint64_t aBlock = 0x7265747369676572;
  unint64_t v43 = 0xE800000000000000;
  sub_2472255F8();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  sub_24722089C(inited);
  uint64_t v35 = sub_247225508();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel_mainAccessQueue);
  uint64_t v19 = v7;
  BOOL v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v21 = v38;
  v20(v10, v12, v38);
  unint64_t v22 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v23 = (v8 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  id v25 = *(void (**)(unint64_t, char *, uint64_t))(v19 + 32);
  v25(v24 + v22, v10, v21);
  id v26 = v41;
  *(void *)(v24 + v23) = v41;
  v27 = (void *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v28 = v39;
  void *v27 = v37;
  v27[1] = v28;
  v46 = sub_247223148;
  uint64_t v47 = v24;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v43 = 1107296256;
  v44 = sub_247221578;
  v45 = &block_descriptor_19;
  uint64_t v29 = _Block_copy(&aBlock);
  id v30 = v26;
  swift_retain();
  swift_release();
  id v31 = v36;
  v32 = (void *)v35;
  objc_msgSend(v36, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v35, 4, v18, v29);
  _Block_release(v29);

  unint64_t v33 = v40;
  v25(v40, v12, v21);
  return (*(uint64_t (**)(unint64_t, void, uint64_t, uint64_t))(v19 + 56))(v33, 0, 1, v21);
}

uint64_t sub_247220EF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v67 = a5;
  uint64_t v9 = sub_2472254C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)&v58 - v14;
  uint64_t v16 = sub_2472254F8();
  uint64_t v68 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  if (a1)
  {
    id v21 = a1;
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v16, (uint64_t)qword_269241E38);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v19, v22, v16);
    id v23 = a1;
    id v24 = a1;
    id v25 = sub_2472254D8();
    os_log_type_t v26 = sub_247225588();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      id v29 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      v70[0] = v30;
      sub_2472255A8();
      *uint64_t v28 = v30;

      _os_log_impl(&dword_24721D000, v25, v26, "Failed to register moving handler with error: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269241D80);
      swift_arrayDestroy();
      MEMORY[0x24C54E3D0](v28, -1, -1);
      MEMORY[0x24C54E3D0](v27, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v19, v16);
  }
  else
  {
    v63 = v15;
    uint64_t v64 = a4;
    id v31 = (char *)&v58 - v20;
    v65 = v13;
    uint64_t v66 = a2;
    uint64_t v62 = a3;
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v16, (uint64_t)qword_269241E38);
    swift_beginAccess();
    unint64_t v33 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v31, v32, v16);
    uint64_t v34 = v10;
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    id v36 = v63;
    uint64_t v37 = v9;
    v35(v63, v66, v9);
    uint64_t v38 = sub_2472254D8();
    os_log_type_t v39 = sub_247225598();
    unint64_t v40 = v38;
    BOOL v41 = os_log_type_enabled(v38, v39);
    uint64_t v61 = v16;
    if (v41)
    {
      v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v70[0] = v60;
      v59 = v42;
      *(_DWORD *)v42 = 136315138;
      v58 = v42 + 4;
      sub_24722511C(&qword_269241D90);
      uint64_t v43 = sub_247225698();
      uint64_t v69 = sub_247223160(v43, v44, v70);
      sub_2472255A8();
      swift_bridgeObjectRelease();
      v45 = *(void (**)(char *, uint64_t))(v34 + 8);
      v45(v36, v37);
      v46 = (void (*)(uint64_t, uint64_t))v45;
      os_log_type_t v47 = v39;
      v48 = v59;
      _os_log_impl(&dword_24721D000, v40, v47, "Motion Cues moving registration handler received: %s", v59, 0xCu);
      uint64_t v49 = v60;
      swift_arrayDestroy();
      MEMORY[0x24C54E3D0](v49, -1, -1);
      MEMORY[0x24C54E3D0](v48, -1, -1);
    }
    else
    {
      v51 = *(void (**)(char *, uint64_t))(v34 + 8);
      v51(v36, v37);
      v46 = (void (*)(uint64_t, uint64_t))v51;
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v33, v61);
    uint64_t v52 = v64;
    uint64_t v53 = (uint64_t)v65;
    v35(v65, v66, v37);
    uint64_t v54 = swift_allocObject();
    uint64_t v55 = v67;
    *(void *)(v54 + 16) = v52;
    *(void *)(v54 + 24) = v55;
    v56 = (uint64_t *)(v62 + OBJC_IVAR___AXMotionCuesService_movingHandlers);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v69 = *v56;
    uint64_t *v56 = 0x8000000000000000;
    sub_2472242FC((uint64_t)sub_24722541C, v54, v53, isUniquelyReferenced_nonNull_native);
    uint64_t *v56 = v69;
    swift_bridgeObjectRelease();
    v46(v53, v37);
    return swift_endAccess();
  }
}

uint64_t sub_247221578(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_247225518();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t AXMotionCuesService.unregisterMotionCuesMoving(_:)(uint64_t a1)
{
  return sub_2472223C0(a1, &OBJC_IVAR___AXMotionCuesService_movingHandlers);
}

uint64_t AXMotionCuesService.registerMotionCuesVisible(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v37 = a1;
  unint64_t v40 = a3;
  uint64_t v3 = sub_2472254F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_2472254C8();
  uint64_t v7 = *(void *)(v38 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v38);
  uint64_t v10 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - v11;
  sub_2472254B8();
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_269241E38);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  uint64_t v14 = sub_2472254D8();
  os_log_type_t v15 = sub_247225598();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_24721D000, v14, v15, "Attempting to register handler for Motion Cues visible", v16, 2u);
    MEMORY[0x24C54E3D0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v36 = sub_24721F950();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241C80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247225BE0;
  uint64_t aBlock = 0x7265747369676572;
  unint64_t v43 = 0xE800000000000000;
  sub_2472255F8();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  sub_24722089C(inited);
  uint64_t v35 = sub_247225508();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel_mainAccessQueue);
  uint64_t v19 = v7;
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v21 = v38;
  v20(v10, v12, v38);
  unint64_t v22 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v23 = (v8 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  id v25 = *(void (**)(unint64_t, char *, uint64_t))(v19 + 32);
  v25(v24 + v22, v10, v21);
  os_log_type_t v26 = v41;
  *(void *)(v24 + v23) = v41;
  v27 = (void *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v28 = v39;
  void *v27 = v37;
  v27[1] = v28;
  v46 = sub_2472248E0;
  uint64_t v47 = v24;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v43 = 1107296256;
  unint64_t v44 = sub_247221578;
  v45 = &block_descriptor_25;
  id v29 = _Block_copy(&aBlock);
  id v30 = v26;
  swift_retain();
  swift_release();
  id v31 = v36;
  uint64_t v32 = (void *)v35;
  objc_msgSend(v36, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v35, 3, v18, v29);
  _Block_release(v29);

  unint64_t v33 = v40;
  v25(v40, v12, v21);
  return (*(uint64_t (**)(unint64_t, void, uint64_t, uint64_t))(v19 + 56))(v33, 0, 1, v21);
}

uint64_t sub_247221B80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v67 = a5;
  uint64_t v9 = sub_2472254C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)&v58 - v14;
  uint64_t v16 = sub_2472254F8();
  uint64_t v68 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  if (a1)
  {
    id v21 = a1;
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v16, (uint64_t)qword_269241E38);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v19, v22, v16);
    id v23 = a1;
    id v24 = a1;
    id v25 = sub_2472254D8();
    os_log_type_t v26 = sub_247225588();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      id v29 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      v70[0] = v30;
      sub_2472255A8();
      *uint64_t v28 = v30;

      _os_log_impl(&dword_24721D000, v25, v26, "Failed to register visible handler with error: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269241D80);
      swift_arrayDestroy();
      MEMORY[0x24C54E3D0](v28, -1, -1);
      MEMORY[0x24C54E3D0](v27, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v19, v16);
  }
  else
  {
    v63 = v15;
    uint64_t v64 = a4;
    id v31 = (char *)&v58 - v20;
    v65 = v13;
    uint64_t v66 = a2;
    uint64_t v62 = a3;
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v16, (uint64_t)qword_269241E38);
    swift_beginAccess();
    unint64_t v33 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v31, v32, v16);
    uint64_t v34 = v10;
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    id v36 = v63;
    uint64_t v37 = v9;
    v35(v63, v66, v9);
    uint64_t v38 = sub_2472254D8();
    os_log_type_t v39 = sub_247225598();
    unint64_t v40 = v38;
    BOOL v41 = os_log_type_enabled(v38, v39);
    uint64_t v61 = v16;
    if (v41)
    {
      v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v70[0] = v60;
      v59 = v42;
      *(_DWORD *)v42 = 136315138;
      v58 = v42 + 4;
      sub_24722511C(&qword_269241D90);
      uint64_t v43 = sub_247225698();
      uint64_t v69 = sub_247223160(v43, v44, v70);
      sub_2472255A8();
      swift_bridgeObjectRelease();
      v45 = *(void (**)(char *, uint64_t))(v34 + 8);
      v45(v36, v37);
      v46 = (void (*)(uint64_t, uint64_t))v45;
      os_log_type_t v47 = v39;
      v48 = v59;
      _os_log_impl(&dword_24721D000, v40, v47, "Motion cues visible registration handler received %s", v59, 0xCu);
      uint64_t v49 = v60;
      swift_arrayDestroy();
      MEMORY[0x24C54E3D0](v49, -1, -1);
      MEMORY[0x24C54E3D0](v48, -1, -1);
    }
    else
    {
      v51 = *(void (**)(char *, uint64_t))(v34 + 8);
      v51(v36, v37);
      v46 = (void (*)(uint64_t, uint64_t))v51;
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v33, v61);
    uint64_t v52 = v64;
    uint64_t v53 = (uint64_t)v65;
    v35(v65, v66, v37);
    uint64_t v54 = swift_allocObject();
    uint64_t v55 = v67;
    *(void *)(v54 + 16) = v52;
    *(void *)(v54 + 24) = v55;
    v56 = (uint64_t *)(v62 + OBJC_IVAR___AXMotionCuesService_visibleHandlers);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v69 = *v56;
    uint64_t *v56 = 0x8000000000000000;
    sub_2472242FC((uint64_t)sub_24722509C, v54, v53, isUniquelyReferenced_nonNull_native);
    uint64_t *v56 = v69;
    swift_bridgeObjectRelease();
    v46(v53, v37);
    return swift_endAccess();
  }
}

id sub_24722223C(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269241D68);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a3);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = a1;
  a6(a5, v14);

  swift_release();
  uint64_t v16 = sub_2472254C8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) != 1)
  {
    uint64_t v18 = (void *)sub_247225498();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v16);
  }
  return v18;
}

uint64_t AXMotionCuesService.unregisterMotionCuesVisible(_:)(uint64_t a1)
{
  return sub_2472223C0(a1, &OBJC_IVAR___AXMotionCuesService_visibleHandlers);
}

uint64_t sub_2472223C0(uint64_t a1, void *a2)
{
  uint64_t v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_2472237B8(a1);
  char v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = 0;
  if (v7)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v4;
    uint64_t v14 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_247224574();
      uint64_t v10 = v14;
    }
    uint64_t v11 = *(void *)(v10 + 48);
    uint64_t v12 = sub_2472254C8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11 + *(void *)(*(void *)(v12 - 8) + 72) * v5, v12);
    uint64_t v8 = *(void *)(*(void *)(v14 + 56) + 16 * v5);
    sub_247224018(v5, v14);
    *uint64_t v4 = v14;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return sub_247225234(v8);
}

uint64_t sub_2472224F8(void *a1)
{
  uint64_t v2 = sub_2472254C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2472254A8();
  swift_beginAccess();
  id v6 = a1;
  uint64_t v7 = sub_247223AF4((uint64_t)v5);
  swift_endAccess();
  sub_247225234(v7);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t AXMotionCuesService.userInterfaceClient(_:processMessageFromServer:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2472249B8(a2, a3);
}

id AXMotionCuesService.userInterfaceClient(_:accessQueueForProcessingMessageWithIdentifier:)()
{
  id v0 = objc_msgSend(self, sel_mainAccessQueue);
  return v0;
}

void AXMotionCuesService.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(id a1)
{
  uint64_t v2 = sub_2472254F8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - v7;
  id v9 = sub_24721F950();

  if (a1 && v9 == a1)
  {
    if (qword_269241E30 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_269241E38);
    swift_beginAccess();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v11(v8, v10, v2);
    uint64_t v12 = sub_2472254D8();
    os_log_type_t v13 = sub_247225588();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = v11;
      id v15 = v14;
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_24721D000, v12, v13, "Connection to Motion Cues UI Service was interrupted", v14, 2u);
      uint64_t v11 = v20;
      MEMORY[0x24C54E3D0](v15, -1, -1);
    }

    uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v8, v2);
    if (_AXSMotionCuesEnabled())
    {
      v11(v6, v10, v2);
      uint64_t v17 = sub_2472254D8();
      os_log_type_t v18 = sub_247225578();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_24721D000, v17, v18, "Motion Cues still enabled. Will attempt to relaunch", v19, 2u);
        MEMORY[0x24C54E3D0](v19, -1, -1);
      }

      v16(v6, v2);
      AXMotionCuesService.enable(completionBlock:)((uint64_t)sub_247222AC8, 0);
    }
  }
}

uint64_t sub_247222AC8(char a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_2472254F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269241E30 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_269241E38);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a2;
  id v10 = a2;
  uint64_t v11 = sub_2472254D8();
  os_log_type_t v12 = sub_247225598();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 67109378;
    LODWORD(v19) = a1 & 1;
    sub_2472255A8();
    *(_WORD *)(v13 + 8) = 2112;
    if (a2)
    {
      id v15 = a2;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v19 = v16;
      sub_2472255A8();
    }
    else
    {
      uint64_t v19 = 0;
      sub_2472255A8();
      uint64_t v16 = 0;
    }
    *uint64_t v14 = v16;

    _os_log_impl(&dword_24721D000, v11, v12, "Enabled Motion Cues: success %{BOOL}d, error %@", (uint8_t *)v13, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269241D80);
    swift_arrayDestroy();
    MEMORY[0x24C54E3D0](v14, -1, -1);
    MEMORY[0x24C54E3D0](v13, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id AXMotionCuesService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247222EAC(void *a1)
{
  id v2 = a1;
  sub_247225558();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241DC8);
  sub_247225638();

  return 0;
}

uint64_t sub_247222F40()
{
  return sub_247222EAC(*v0);
}

uint64_t sub_247222F64(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  if (a3)
  {
    if (a2)
    {
      sub_247225244((uint64_t)a3);
      id v5 = a2;
      a3(a2, 1);

      return sub_247225234((uint64_t)a3);
    }
    else
    {
      unint64_t v6 = result;
      if (result)
      {
        swift_retain();
        unint64_t v7 = v6;
      }
      else
      {
        swift_retain();
        unint64_t v7 = sub_24722089C(MEMORY[0x263F8EE78]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_247225234((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_24722306C(uint64_t a1, void *a2)
{
  return sub_247222F64(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

void sub_24722308C(void *a1, char a2)
{
  sub_247220184(a1, a2 & 1, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), "Failed to disable Motion Cues: %@", "Client received success for Motion Cues disable");
}

uint64_t objectdestroy_2Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_247223148(uint64_t a1, uint64_t a2)
{
  return sub_2472248F8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_247220EF0);
}

uint64_t sub_247223160(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247223234(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_247224FE4((uint64_t)v12, *a3);
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
      sub_247224FE4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_247223234(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2472255B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2472233F0(a5, a6);
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
  uint64_t v8 = sub_247225628();
  if (!v8)
  {
    sub_247225648();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247225688();
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

uint64_t sub_2472233F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247223488(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247223668(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247223668(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247223488(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247223600(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247225618();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247225648();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247225568();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247225688();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247225648();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247223600(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241D98);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247223668(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269241D98);
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
  uint64_t result = sub_247225688();
  __break(1u);
  return result;
}

unint64_t sub_2472237B8(uint64_t a1)
{
  sub_2472254C8();
  sub_24722511C(&qword_269241DA0);
  uint64_t v2 = sub_247225528();
  return sub_247223880(a1, v2);
}

unint64_t sub_24722383C(uint64_t a1)
{
  uint64_t v2 = sub_2472255D8();
  return sub_247223A2C(a1, v2);
}

unint64_t sub_247223880(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2472254C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24722511C(&qword_269241DA8);
      char v15 = sub_247225538();
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

unint64_t sub_247223A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_247225040(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C54DF10](v9, a1);
      sub_247224F30((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_247223AF4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_2472237B8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_247224574();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_2472254C8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_247224018(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_247223C00(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_2472254C8();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241D78);
  int v45 = a2;
  uint64_t v9 = sub_247225668();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    unint64_t v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    BOOL v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    uint64_t v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        long long v47 = *(_OWORD *)(*(void *)(v8 + 56) + 16 * v20);
      }
      else
      {
        (*v41)(v43, v26, v44);
        long long v47 = *(_OWORD *)(*(void *)(v8 + 56) + 16 * v20);
        swift_retain();
      }
      sub_24722511C(&qword_269241DA0);
      uint64_t result = sub_247225528();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v46)(*(void *)(v10 + 48) + v25 * v18, v27, v28);
      *(_OWORD *)(*(void *)(v10 + 56) + 16 * v18) = v47;
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_247224018(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2472254C8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_2472255C8();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      char v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_24722511C(&qword_269241DA0);
        uint64_t v17 = sub_247225528();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            int64_t v23 = (_OWORD *)(v22 + 16 * a1);
            uint64_t v24 = (_OWORD *)(v22 + 16 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *int64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2472242FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v28 = a2;
  uint64_t v9 = sub_2472254C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_2472237B8(a3);
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
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v5;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = (uint64_t *)(v21[7] + 16 * v15);
      uint64_t result = swift_release();
      uint64_t v24 = v28;
      uint64_t *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_247224574();
    goto LABEL_7;
  }
  sub_247223C00(v18, a4 & 1);
  unint64_t v25 = sub_2472237B8(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = sub_2472256A8();
    __break(1u);
    return result;
  }
  unint64_t v15 = v25;
  uint64_t v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_2472244B4(v15, (uint64_t)v12, a1, v28, v21);
}

uint64_t sub_2472244B4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_2472254C8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = (void *)(a5[7] + 16 * a1);
  *uint64_t v13 = a3;
  v13[1] = a4;
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

void *sub_247224574()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2472254C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241D78);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_247225658();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v24 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v25 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 16 * v16;
    unint64_t v19 = *(void *)(v8 + 48) + v17;
    uint64_t v20 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    long long v28 = *(_OWORD *)(*(void *)(v6 + 56) + v18);
    v20(v19, v5, v2);
    *(_OWORD *)(*(void *)(v8 + 56) + v18) = v28;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v1 = sub_2472254C8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_2472248E0(uint64_t a1, uint64_t a2)
{
  return sub_2472248F8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_247221B80);
}

uint64_t sub_2472248F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(sub_2472254C8() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v3 + v6;
  uint64_t v9 = *(void *)(v3 + v7);
  unint64_t v10 = (uint64_t *)(v3 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  return a3(a2, v8, v9, v11, v12);
}

uint64_t sub_2472249B8(uint64_t a1, uint64_t a2)
{
  if (a2 == 6)
  {
    int64_t v21 = (uint64_t *)(v2 + OBJC_IVAR___AXMotionCuesService_movingHandlers);
    swift_beginAccess();
    uint64_t v22 = *v21;
    uint64_t v38 = *v21 + 64;
    uint64_t v23 = 1 << *(unsigned char *)(*v21 + 32);
    uint64_t v24 = -1;
    if (v23 < 64) {
      uint64_t v24 = ~(-1 << v23);
    }
    unint64_t v25 = v24 & *(void *)(*v21 + 64);
    int64_t v26 = (unint64_t)(v23 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v27 = 0;
    while (1)
    {
      if (v25)
      {
        unint64_t v29 = __clz(__rbit64(v25));
        v25 &= v25 - 1;
        unint64_t v30 = v29 | (v27 << 6);
        if (!a1) {
          goto LABEL_74;
        }
      }
      else
      {
        int64_t v31 = v27 + 1;
        if (__OFADD__(v27, 1))
        {
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        if (v31 >= v26) {
          goto LABEL_67;
        }
        unint64_t v32 = *(void *)(v38 + 8 * v31);
        ++v27;
        if (!v32)
        {
          int64_t v27 = v31 + 1;
          if (v31 + 1 >= v26) {
            goto LABEL_67;
          }
          unint64_t v32 = *(void *)(v38 + 8 * v27);
          if (!v32)
          {
            int64_t v27 = v31 + 2;
            if (v31 + 2 >= v26) {
              goto LABEL_67;
            }
            unint64_t v32 = *(void *)(v38 + 8 * v27);
            if (!v32)
            {
              int64_t v27 = v31 + 3;
              if (v31 + 3 >= v26) {
                goto LABEL_67;
              }
              unint64_t v32 = *(void *)(v38 + 8 * v27);
              if (!v32)
              {
                int64_t v33 = v31 + 4;
                if (v33 >= v26) {
                  goto LABEL_67;
                }
                unint64_t v32 = *(void *)(v38 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    int64_t v27 = v33 + 1;
                    if (__OFADD__(v33, 1)) {
                      goto LABEL_72;
                    }
                    if (v27 >= v26) {
                      break;
                    }
                    unint64_t v32 = *(void *)(v38 + 8 * v27);
                    ++v33;
                    if (v32) {
                      goto LABEL_59;
                    }
                  }
LABEL_67:
                  swift_release();
                  return sub_24722089C(MEMORY[0x263F8EE78]);
                }
                int64_t v27 = v33;
              }
            }
          }
        }
LABEL_59:
        unint64_t v25 = (v32 - 1) & v32;
        unint64_t v30 = __clz(__rbit64(v32)) + (v27 << 6);
        if (!a1) {
          goto LABEL_74;
        }
      }
      uint64_t v34 = *(void (**)(unsigned char *))(*(void *)(v22 + 56) + 16 * v30);
      *(void *)&long long v40 = 0x676E69766F6DLL;
      *((void *)&v40 + 1) = 0xE600000000000000;
      swift_retain();
      sub_2472255F8();
      if (*(void *)(a1 + 16) && (unint64_t v35 = sub_24722383C((uint64_t)v39), (v36 & 1) != 0))
      {
        sub_247224FE4(*(void *)(a1 + 56) + 32 * v35, (uint64_t)&v40);
      }
      else
      {
        long long v40 = 0u;
        long long v41 = 0u;
      }
      sub_247224F30((uint64_t)v39);
      if (!*((void *)&v41 + 1)) {
        break;
      }
      if (!swift_dynamicCast()) {
        goto LABEL_39;
      }
      char v28 = v42;
LABEL_40:
      v39[0] = v28;
      v34(v39);
      uint64_t result = swift_release();
    }
    sub_247224F84((uint64_t)&v40);
LABEL_39:
    char v28 = 0;
    goto LABEL_40;
  }
  if (a2 != 5) {
    return sub_24722089C(MEMORY[0x263F8EE78]);
  }
  uint64_t v4 = (uint64_t *)(v2 + OBJC_IVAR___AXMotionCuesService_visibleHandlers);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v37 = *v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(*v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(*v4 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      if (!a1) {
        goto LABEL_73;
      }
      goto LABEL_28;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_70;
    }
    if (v15 >= v9) {
      goto LABEL_67;
    }
    unint64_t v16 = *(void *)(v37 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_67;
      }
      unint64_t v16 = *(void *)(v37 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_67;
        }
        unint64_t v16 = *(void *)(v37 + 8 * v11);
        if (!v16)
        {
          int64_t v11 = v15 + 3;
          if (v15 + 3 >= v9) {
            goto LABEL_67;
          }
          unint64_t v16 = *(void *)(v37 + 8 * v11);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (!a1) {
      goto LABEL_73;
    }
LABEL_28:
    uint64_t v18 = *(void (**)(unsigned char *))(*(void *)(v5 + 56) + 16 * v14);
    *(void *)&long long v40 = 0x656C6269736976;
    *((void *)&v40 + 1) = 0xE700000000000000;
    swift_retain();
    sub_2472255F8();
    if (*(void *)(a1 + 16) && (unint64_t v19 = sub_24722383C((uint64_t)v39), (v20 & 1) != 0))
    {
      sub_247224FE4(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v40);
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
    }
    sub_247224F30((uint64_t)v39);
    if (!*((void *)&v41 + 1))
    {
      sub_247224F84((uint64_t)&v40);
LABEL_7:
      char v12 = 0;
      goto LABEL_8;
    }
    if (!swift_dynamicCast()) {
      goto LABEL_7;
    }
    char v12 = v42;
LABEL_8:
    v39[0] = v12;
    v18(v39);
    uint64_t result = swift_release();
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v9) {
    goto LABEL_67;
  }
  unint64_t v16 = *(void *)(v37 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_67;
    }
    unint64_t v16 = *(void *)(v37 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_27;
    }
  }
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AXMotionCuesService()
{
  return self;
}

uint64_t sub_247224ED8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247224F10(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

void sub_247224F28(char a1, uint64_t a2)
{
  sub_24721FE50(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_247224F30(uint64_t a1)
{
  return a1;
}

uint64_t sub_247224F84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241D88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247224FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247225040(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24722509C(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
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

uint64_t sub_24722511C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2472254C8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247225160(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_2472251C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_2472251D4(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_2472251E0()
{
  unint64_t result = qword_269241DC0;
  if (!qword_269241DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269241DC0);
  }
  return result;
}

uint64_t sub_247225234(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_247225244(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
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

void *initializeBufferWithCopyOfBuffer for AXUIError(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIError(id *a1)
{
}

void **assignWithCopy for AXUIError(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for AXUIError(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIError(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_2472253F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

uint64_t sub_247225458()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_247225468()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_247225478()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_247225488()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247225498()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2472254A8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2472254B8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2472254C8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2472254D8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2472254E8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2472254F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247225508()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247225518()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247225528()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247225538()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247225548()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247225558()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247225568()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247225578()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247225588()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247225598()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2472255A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2472255B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2472255C8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2472255D8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2472255E8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2472255F8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_247225608()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247225618()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247225628()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247225638()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_247225648()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247225658()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247225668()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247225678()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247225688()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247225698()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2472256A8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2472256B8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2472256C8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2472256D8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2472256E8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t _AXSMotionCuesEnabled()
{
  return MEMORY[0x270F90900]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}