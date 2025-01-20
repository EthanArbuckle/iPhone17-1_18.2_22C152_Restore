uint64_t sub_24F90E1C4()
{
  uint64_t v0;
  uint64_t v1;

  *(void *)(v1 + 56) = v0;
  return MEMORY[0x270FA2498](sub_24F90E1E4, 0, 0);
}

uint64_t sub_24F90E1E4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_24F90E3A4;
    return sub_24F912F48();
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_24F90F0BC(v0 + 16, &qword_269A33188);
    if (qword_269A33140 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24F91C228();
    __swift_project_value_buffer(v4, (uint64_t)qword_269A334B0);
    v5 = sub_24F91C208();
    os_log_type_t v6 = sub_24F91C338();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (_WORD *)swift_slowAlloc();
      _WORD *v7 = 0;
      OUTLINED_FUNCTION_6(&dword_24F90C000, v8, v9, "Failed to create GameOverlayUI Multiplayer Remote Proxy");
      MEMORY[0x253365DE0](v7, -1, -1);
    }

    v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10(0);
  }
}

uint64_t sub_24F90E3A4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  void *v2 = v1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24F90E48C, 0, 0);
}

uint64_t sub_24F90E48C()
{
  OUTLINED_FUNCTION_5();
  if (v0[5])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A33190);
    if (swift_dynamicCast())
    {
      uint64_t v1 = v0[6];
      goto LABEL_10;
    }
  }
  else
  {
    sub_24F90F0BC((uint64_t)(v0 + 2), &qword_269A33188);
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24F91C228();
  __swift_project_value_buffer(v2, (uint64_t)qword_269A334B0);
  v3 = sub_24F91C208();
  os_log_type_t v4 = sub_24F91C338();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (_WORD *)swift_slowAlloc();
    _WORD *v5 = 0;
    OUTLINED_FUNCTION_6(&dword_24F90C000, v6, v7, "Failed to create GameOverlayUI Multiplayer Remote Proxy");
    MEMORY[0x253365DE0](v5, -1, -1);
  }

  uint64_t v1 = 0;
LABEL_10:
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v1);
}

uint64_t sub_24F90E5E8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24F91C308();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  os_log_type_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v0;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  id v6 = v0;
  if (EnumTagSinglePayload == 1)
  {
    sub_24F90F0BC((uint64_t)v2, &qword_269A33158);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    sub_24F91C2F8();
    (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
    if (v4[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v7 = sub_24F91C2D8();
      uint64_t v8 = v9;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &unk_269A33168;
  *(void *)(v10 + 24) = v4;
  if (v8 | v7)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v7;
    v12[3] = v8;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24F90E7EC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F90E87C;
  return sub_24F90E1C4();
}

uint64_t sub_24F90E87C()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  *(void *)(v1 + 24) = v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24F90E954, 0, 0);
}

uint64_t sub_24F90E954()
{
  OUTLINED_FUNCTION_2();
  if (*(void *)(v0 + 24))
  {
    objc_msgSend(*(id *)(v0 + 24), sel_showMultiplayerUI);
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v1();
}

uint64_t sub_24F90E9C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F91C308();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24F90F0BC(a1, &qword_269A33158);
  }
  else
  {
    sub_24F91C2F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24F91C2D8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24F90EBA0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24F90EBE0()
{
  OUTLINED_FUNCTION_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90EC88;
  return sub_24F90E7EC();
}

uint64_t sub_24F90EC88()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

char *MultiplayerClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  id v3 = objc_allocWithZone(v1);
  char v5 = *a1;
  return ClientProxy.init(serviceKind:)(&v5);
}

char *MultiplayerClientProxy.init(serviceKind:)(char *a1)
{
  char v2 = *a1;
  return ClientProxy.init(serviceKind:)(&v2);
}

id MultiplayerClientProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiplayerClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24F90EE14(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F90EEF0;
  return v6(a1);
}

uint64_t sub_24F90EEF0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v3();
}

uint64_t sub_24F90EFB4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90F220;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return v4(v3);
}

uint64_t type metadata accessor for MultiplayerClientProxy()
{
  return self;
}

uint64_t method lookup function for MultiplayerClientProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MultiplayerClientProxy);
}

uint64_t dispatch thunk of MultiplayerClientProxy.showMultiplayerUI()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t sub_24F90F0BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24F90F150()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F90F188()
{
  OUTLINED_FUNCTION_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90EC88;
  uint64_t v3 = OUTLINED_FUNCTION_3();
  return v4(v3);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0 + 8;
}

uint64_t sub_24F90F2C0()
{
  return sub_24F90F338();
}

uint64_t sub_24F90F2EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  swift_beginAccess();
  return MEMORY[0x253365E80](v1);
}

uint64_t sub_24F90F338()
{
  return swift_unknownObjectRelease();
}

void (*sub_24F90F394(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x253365E80](v5);
  return sub_24F90F418;
}

void sub_24F90F418(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_24F90F498()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x270FA2498](sub_24F90F4B8, 0, 0);
}

uint64_t sub_24F90F4B8()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = *(void *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_24F90F670;
    return sub_24F912F48();
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_24F9103DC(v0 + 16);
    if (qword_269A33140 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24F91C228();
    __swift_project_value_buffer(v4, (uint64_t)qword_269A334B0);
    uint64_t v5 = sub_24F91C208();
    os_log_type_t v6 = sub_24F91C338();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (_WORD *)swift_slowAlloc();
      _WORD *v7 = 0;
      OUTLINED_FUNCTION_6(&dword_24F90C000, v8, v9, "Failed to create GameOverlayUI Authentication Remote Proxy");
      MEMORY[0x253365DE0](v7, -1, -1);
    }

    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10(0);
  }
}

uint64_t sub_24F90F670()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24F90F75C, 0, 0);
}

uint64_t sub_24F90F75C()
{
  OUTLINED_FUNCTION_5();
  if (v0[5])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A331D0);
    if (swift_dynamicCast())
    {
      uint64_t v1 = v0[6];
      goto LABEL_10;
    }
  }
  else
  {
    sub_24F9103DC((uint64_t)(v0 + 2));
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24F91C228();
  __swift_project_value_buffer(v2, (uint64_t)qword_269A334B0);
  uint64_t v3 = sub_24F91C208();
  os_log_type_t v4 = sub_24F91C338();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)swift_slowAlloc();
    _WORD *v5 = 0;
    OUTLINED_FUNCTION_6(&dword_24F90C000, v6, v7, "Failed to create GameOverlayUI Authentication Remote Proxy");
    MEMORY[0x253365DE0](v5, -1, -1);
  }

  uint64_t v1 = 0;
LABEL_10:
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v1);
}

uint64_t sub_24F90F8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24F90FC80(a1, a2, a3, a4, (uint64_t)&unk_27010FE68, (uint64_t)&unk_269A331B0);
}

uint64_t sub_24F90F8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  uint64_t v9 = (void *)swift_task_alloc();
  v8[6] = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_24F90F968;
  return sub_24F90F498();
}

uint64_t sub_24F90F968()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24F90FA3C, 0, 0);
}

uint64_t sub_24F90FA3C()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (void *)v0[7];
  if (v1)
  {
    uint64_t v2 = (void *)v0[5];
    uint64_t v3 = (void *)sub_24F91C268();
    if (v2) {
      uint64_t v2 = (void *)sub_24F91C268();
    }
    objc_msgSend(v1, sel_presentOnboardingFlowWithGameBundleID_sceneIdentifier_, v3, v2);

    swift_unknownObjectRelease();
  }
  os_log_type_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24F90FAEC()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F90FB98;
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  return sub_24F90F8D0(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_24F90FB98()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_24F90FC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24F90FC80(a1, a2, a3, a4, (uint64_t)&unk_27010FE90, (uint64_t)&unk_269A331C0);
}

uint64_t sub_24F90FC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24F91C308();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v6;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_bridgeObjectRetain();
  id v16 = v6;
  swift_bridgeObjectRetain();
  sub_24F90E9C4((uint64_t)v13, a6, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_24F90FD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  uint64_t v9 = (void *)swift_task_alloc();
  v8[6] = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_24F90FE18;
  return sub_24F90F498();
}

uint64_t sub_24F90FE18()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24F90FEEC, 0, 0);
}

uint64_t sub_24F90FEEC()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (void *)v0[7];
  if (v1)
  {
    uint64_t v2 = (void *)v0[5];
    uint64_t v3 = (void *)sub_24F91C268();
    if (v2) {
      uint64_t v2 = (void *)sub_24F91C268();
    }
    objc_msgSend(v1, sel_presentActivitySharingRepromptWithRecipientName_sceneIdentifier_, v3, v2);

    swift_unknownObjectRelease();
  }
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24F90FFEC()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F91043C;
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  return sub_24F90FD80(v2, v3, v4, v5, v6, v7, v8, v9);
}

char *AuthenticationClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AuthenticationClientProxy.init(serviceKind:)(a1);
}

char *AuthenticationClientProxy.init(serviceKind:)(char *a1)
{
  char v1 = *a1;
  swift_unknownObjectWeakInit();
  char v3 = v1;
  return ClientProxy.init(serviceKind:)(&v3);
}

uint64_t sub_24F910114()
{
  return sub_24F9103B4(v0 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate);
}

id AuthenticationClientProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthenticationClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthenticationClientProxy()
{
  return self;
}

Swift::Void __swiftcall AuthenticationClientProxy.didFinishOnboarding(error:)(NSError_optional *error)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x253365E80](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_didFinishOnboardingWithError_, error);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_24F9101FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F90F2EC();
  *a1 = result;
  return result;
}

uint64_t method lookup function for AuthenticationClientProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AuthenticationClientProxy);
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.presentOnboardingFlow(gameBundleID:sceneIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.presentActivitySharingReprompt(recipientName:sceneIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t sub_24F9103B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F9103DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

char *ClientProxy.init(serviceKind:)(char *a1)
{
  char v2 = *a1;
  *(void *)&v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler];
  void *v3 = 0;
  v3[1] = 0;
  v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind] = v2;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ClientProxy();
  id v4 = objc_msgSendSuper2(&v8, sel_init);
  type metadata accessor for ClientProxy.ConnectionHelper();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (char *)v4;
  sub_24F910A00(v6);
  *(void *)&v6[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = v5;
  swift_release();
  return v6;
}

uint64_t type metadata accessor for ClientProxy()
{
  return self;
}

uint64_t type metadata accessor for ClientProxy.ConnectionHelper()
{
  return self;
}

uint64_t sub_24F91057C()
{
  swift_beginAccess();
  uint64_t v0 = OUTLINED_FUNCTION_8();
  sub_24F910A4C(v0);
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_24F9105D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_24F910A5C(v6);
}

uint64_t (*sub_24F910630())()
{
  return j__swift_endAccess;
}

id sub_24F91068C()
{
  if (qword_269A33138 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24F9108A4();
}

void *sub_24F910734()
{
  type metadata accessor for GameOverlayUIConfig.SharedResources();
  swift_allocObject();
  uint64_t result = GameOverlayUIConfig.SharedResources.init()();
  qword_269A334A8 = (uint64_t)result;
  return result;
}

void sub_24F910774()
{
  unk_269A331E6 = -4864;
}

uint64_t sub_24F9107A4@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t result = sub_24F91057C();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_24F913C1C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_24F910814(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_24F913BF4;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_24F910A4C(v1);
  return sub_24F9105D0((uint64_t)v4, v3);
}

id sub_24F9108A4()
{
  uint64_t v0 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributeWithDomain_name_, v0, v1);

  return v2;
}

void sub_24F910938()
{
  *(void *)&v0[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;

  sub_24F91C418();
  __break(1u);
}

char *ClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ClientProxy.init(serviceKind:)(a1);
}

uint64_t sub_24F910A00(void *a1)
{
  swift_defaultActor_initialize();
  swift_unknownObjectWeakInit();
  *(void *)(v1 + 120) = 0;
  *(void *)(v1 + 128) = 0;
  *(unsigned char *)(v1 + 136) = 0;
  swift_unknownObjectWeakAssign();

  return v1;
}

uint64_t sub_24F910A4C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24F910A5C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24F910A6C()
{
  OUTLINED_FUNCTION_2();
  *(void *)(v1 + 48) = v0;
  *(unsigned char *)(v1 + 108) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  *(void *)(v1 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F910B00, v0, 0);
}

uint64_t sub_24F910B00()
{
  uint64_t v1 = MEMORY[0x253365E80](*(void *)(v0 + 48) + 112);
  *(void *)(v0 + 64) = v1;
  if (!v1)
  {
    if (qword_269A33140 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24F91C228();
    __swift_project_value_buffer(v6, (uint64_t)qword_269A334B0);
    uint64_t v7 = sub_24F91C208();
    os_log_type_t v8 = sub_24F91C338();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24F90C000, v7, v8, "Connection helper unexpectedly has a nil client proxy", v9, 2u);
      OUTLINED_FUNCTION_3_0();
    }

    goto LABEL_11;
  }
  char v2 = (void *)v1;
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void **)(v3 + 120);
  if (v4 && *(unsigned char *)(v3 + 136) == 1)
  {
    id v5 = v4;
    if (objc_msgSend(v5, sel_remoteTarget))
    {
      sub_24F91C3A8();

      swift_unknownObjectRelease();
      sub_24F913690(v0 + 16, &qword_269A33188);
LABEL_11:
      swift_task_dealloc();
      OUTLINED_FUNCTION_7();
      return v10();
    }

    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_24F913690(v0 + 16, &qword_269A33188);
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24F91C228();
  __swift_project_value_buffer(v12, (uint64_t)qword_269A334B0);
  swift_retain();
  v13 = sub_24F91C208();
  os_log_type_t v14 = sub_24F91C328();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_15();
    *(_DWORD *)v15 = 67109120;
    *(_DWORD *)(v0 + 104) = *(void *)(v3 + 120) == 0;
    sub_24F91C388();
    swift_release();
    _os_log_impl(&dword_24F90C000, v13, v14, "Connection helper start setting up connection. is connection nil %{BOOL}d", v15, 8u);
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
    swift_release();
  }

  uint64_t v16 = *(void *)(v0 + 48);
  objc_msgSend(*(id *)(v3 + 120), sel_invalidate);
  v17 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = 0;

  uint64_t v18 = *(void *)(v16 + 128);
  *(void *)(v0 + 72) = v18;
  if (v18)
  {
    swift_retain();
    v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v19;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33298);
    void *v19 = v0;
    v21 = sub_24F910FA4;
  }
  else
  {
    uint64_t v23 = *(void *)(v0 + 48);
    uint64_t v22 = *(void *)(v0 + 56);
    char v24 = *(unsigned char *)(v0 + 108);
    uint64_t v25 = sub_24F91C308();
    __swift_storeEnumTagSinglePayload(v22, 1, 1, v25);
    unint64_t v26 = sub_24F91353C();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v23;
    *(void *)(v27 + 24) = v26;
    *(unsigned char *)(v27 + 32) = v24;
    *(void *)(v27 + 40) = v2;
    *(void *)(v27 + 48) = v23;
    swift_retain_n();
    id v28 = v2;
    *(void *)(v16 + 128) = sub_24F912D60(v22, (uint64_t)&unk_269A33290, v27);
    swift_release();
    uint64_t v18 = *(void *)(v16 + 128);
    *(void *)(v0 + 88) = v18;
    if (!v18)
    {

      OUTLINED_FUNCTION_11();
      goto LABEL_11;
    }
    swift_retain();
    v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v19;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33298);
    void *v19 = v0;
    v21 = sub_24F911144;
  }
  v19[1] = v21;
  uint64_t v29 = MEMORY[0x263F8EE60] + 8;
  uint64_t v30 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v20, v18, v29, v20, v30);
}

uint64_t sub_24F910FA4()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_1();
  void *v3 = v2;
  swift_task_dealloc();
  if (v0) {

  }
  OUTLINED_FUNCTION_14();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F9110CC()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void *)(v0 + 48);

  swift_release();
  *(void *)(v1 + 128) = 0;
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v2();
}

uint64_t sub_24F911144()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1();
  void *v5 = v4;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = *(void *)(v3 + 48);

    swift_release();
    uint64_t v7 = sub_24F9112BC;
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v8 = *(void *)(v3 + 48);
    uint64_t v7 = sub_24F91124C;
  }
  return MEMORY[0x270FA2498](v7, v8, 0);
}

uint64_t sub_24F91124C()
{
  OUTLINED_FUNCTION_2();

  swift_release();
  OUTLINED_FUNCTION_11();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v1();
}

uint64_t sub_24F9112BC()
{
  OUTLINED_FUNCTION_2();

  OUTLINED_FUNCTION_11();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v1();
}

uint64_t sub_24F911320(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 88) = a5;
  *(void *)(v6 + 96) = a6;
  *(unsigned char *)(v6 + 202) = a4;
  uint64_t v8 = sub_24F91C228();
  *(void *)(v6 + 104) = v8;
  *(void *)(v6 + 112) = *(void *)(v8 - 8);
  *(void *)(v6 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F9113E8, a6, 0);
}

uint64_t sub_24F9113E8()
{
  if (*(unsigned char *)(v0 + 202) != 1) {
    goto LABEL_14;
  }
  if (qword_269A33150 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_269A33440;
  uint64_t v2 = *(void *)algn_269A33448;
  switch(*(unsigned char *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind))
  {
    case 1:
    case 2:
    case 3:
      OUTLINED_FUNCTION_17();
      break;
    default:
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_5_0();
      break;
  }
  sub_24F91C298();
  sub_24F913B80(0, &qword_269A33310);
  swift_bridgeObjectRetain();
  id v3 = sub_24F9121DC(v1, v2, v24, v25, 0, 0);
  if (v3)
  {
    id v4 = v3;
    *(void *)(v0 + 144) = v3;
    *(void *)(v0 + 152) = v3;
    id v5 = v3;
    id v6 = objc_msgSend(self, sel_connectionWithEndpoint_, v5);
    *(void *)(v0 + 160) = v6;
    if (!v6)
    {
      if (qword_269A33140 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 104), (uint64_t)qword_269A334B0);
      uint64_t v16 = v5;
      v17 = sub_24F91C208();
      os_log_type_t v18 = sub_24F91C338();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)OUTLINED_FUNCTION_16();
        uint64_t v23 = (void *)OUTLINED_FUNCTION_15();
        *(_DWORD *)v19 = 138412290;
        *(void *)(v0 + 80) = v16;
        uint64_t v16 = v16;
        sub_24F91C388();
        *uint64_t v23 = v4;

        _os_log_impl(&dword_24F90C000, v17, v18, "Could not create connection with endpoint: %@", v19, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_0();
      }
      else
      {

        v17 = v16;
      }

      swift_task_dealloc();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_9();
      __asm { BRAA            X1, X16 }
    }
    if (qword_269A33130 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void *)(v0 + 88);
    *(void *)(v0 + 168) = qword_269A334A8;
    LOBYTE(v7) = *(unsigned char *)(v7 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind);
    *(unsigned char *)(v0 + 203) = v7;
    *(unsigned char *)(v0 + 200) = v7;
    OUTLINED_FUNCTION_9();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
LABEL_14:
    uint64_t v12 = *(void *)(v0 + 88);
    sub_24F91353C();
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 128) = v13;
    *(void *)(v13 + 16) = v12;
    os_log_type_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A0);
    *os_log_type_t v14 = v0;
    v14[1] = sub_24F911884;
    OUTLINED_FUNCTION_9();
    return MEMORY[0x270FA2318]();
  }
}

uint64_t sub_24F911884()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1();
  void *v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24F91197C()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void **)(v0 + 64);
  if (v1)
  {
    *(void *)(v0 + 144) = v1;
    *(void *)(v0 + 152) = v1;
    id v2 = v1;
    id v3 = objc_msgSend(self, sel_connectionWithEndpoint_, v2);
    *(void *)(v0 + 160) = v3;
    if (v3)
    {
      if (qword_269A33130 != -1) {
        swift_once();
      }
      uint64_t v4 = *(void *)(v0 + 88);
      uint64_t v5 = qword_269A334A8;
      *(void *)(v0 + 168) = qword_269A334A8;
      LOBYTE(v4) = *(unsigned char *)(v4 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind);
      *(unsigned char *)(v0 + 203) = v4;
      *(unsigned char *)(v0 + 200) = v4;
      return MEMORY[0x270FA2498](sub_24F911ED0, v5, 0);
    }
    if (qword_269A33140 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 104), (uint64_t)qword_269A334B0);
    id v17 = v2;
    os_log_type_t v18 = sub_24F91C208();
    os_log_type_t v19 = sub_24F91C338();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_16();
      uint64_t v21 = (void *)OUTLINED_FUNCTION_15();
      *(_DWORD *)uint64_t v20 = 138412290;
      *(void *)(v0 + 80) = v17;
      id v22 = v17;
      sub_24F91C388();
      *uint64_t v21 = v1;

      _os_log_impl(&dword_24F90C000, v18, v19, "Could not create connection with endpoint: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
    }
  }
  else
  {
    if (qword_269A33140 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v9 = *(void **)(v0 + 88);
    uint64_t v10 = __swift_project_value_buffer(v8, (uint64_t)qword_269A334B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v10, v8);
    id v11 = v9;
    uint64_t v12 = sub_24F91C208();
    os_log_type_t v13 = sub_24F91C338();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = *(void *)(v0 + 88);
      uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_16();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = *(unsigned __int8 *)(v14 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind);
      if (qword_269A33150 != -1) {
        swift_once();
      }
      switch(v16)
      {
        case 1:
        case 2:
        case 3:
          uint64_t v33 = qword_269A33440;
          unint64_t v34 = *(void *)algn_269A33448;
          swift_bridgeObjectRetain();
          break;
        default:
          uint64_t v33 = qword_269A33440;
          unint64_t v34 = *(void *)algn_269A33448;
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_5_0();
          break;
      }
      sub_24F91C298();
      uint64_t v26 = *(void *)(v0 + 112);
      uint64_t v27 = *(void *)(v0 + 120);
      uint64_t v28 = *(void *)(v0 + 104);
      uint64_t v29 = *(void **)(v0 + 88);
      *(void *)(v0 + 72) = sub_24F9188B8(v33, v34, &v32);
      sub_24F91C388();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24F90C000, v12, v13, "Could not create endpoint for service name: %s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
    }
    else
    {
      uint64_t v23 = *(void **)(v0 + 88);

      uint64_t v24 = OUTLINED_FUNCTION_8();
      v25(v24);
    }
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return v30();
}

uint64_t sub_24F911ED0()
{
  OUTLINED_FUNCTION_2();
  *(void *)(v0 + 176) = sub_24F91AB0C((unsigned __int8 *)(v0 + 200));
  OUTLINED_FUNCTION_14();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24F911F3C()
{
  char v1 = *(unsigned char *)(v0 + 203);
  uint64_t v2 = qword_269A334A8;
  *(void *)(v0 + 184) = qword_269A334A8;
  *(unsigned char *)(v0 + 201) = v1;
  return MEMORY[0x270FA2498](sub_24F911F68, v2, 0);
}

uint64_t sub_24F911F68()
{
  OUTLINED_FUNCTION_2();
  *(void *)(v0 + 192) = sub_24F91B1BC((unsigned __int8 *)(v0 + 201));
  OUTLINED_FUNCTION_14();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24F911FD4()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  uint64_t v5 = (void *)v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v1;
  v6[3] = v2;
  v6[4] = v5;
  v6[5] = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24F913738;
  *(void *)(v7 + 24) = v6;
  v0[6] = sub_24F913754;
  v0[7] = v7;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24F912D0C;
  v0[5] = &block_descriptor;
  uint64_t v8 = _Block_copy(v0 + 2);
  id v9 = v5;
  id v10 = v1;
  id v11 = v2;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_configureConnection_, v8);
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    os_log_type_t v13 = (void *)v0[24];
    uint64_t v14 = (void *)v0[22];
    uint64_t v16 = (void *)v0[19];
    uint64_t v15 = (void *)v0[20];
    id v17 = (void *)v0[18];
    uint64_t v18 = v0[12];
    os_log_type_t v19 = *(void **)(v18 + 120);
    *(void *)(v18 + 120) = v15;
    id v20 = v15;

    objc_msgSend(v20, sel_activate);
    swift_release();

    swift_task_dealloc();
    OUTLINED_FUNCTION_13();
    return v21();
  }
  return result;
}

id sub_24F9121DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  if (a6)
  {
    id v9 = (void *)sub_24F91C268();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_endpointForSystemMachName_service_instance_, v7, v8, v9);

  return v10;
}

void sub_24F9122B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33348);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388]();
  id v5 = objc_msgSend(self, sel_proxyForLocalPlayer);
  id v6 = objc_msgSend(v5, sel_utilityService);

  if (qword_269A33150 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_269A33440;
  uint64_t v7 = *(void *)algn_269A33448;
  id v9 = (void *)sub_24F91C268();
  uint64_t aBlock = v8;
  uint64_t v15 = v7;
  swift_bridgeObjectRetain();
  sub_24F91C298();
  id v10 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v11, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  uint64_t v18 = sub_24F913B0C;
  uint64_t v19 = v12;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_24F912658;
  id v17 = &block_descriptor_61;
  os_log_type_t v13 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v6, sel_getBSServiceConnectionEndpointForMachName_service_instance_handler_, v9, v10, 0, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();
}

uint64_t sub_24F912610(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33348);
  return sub_24F91C2E8();
}

void sub_24F912658(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_24F9126C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(a1, sel_setTargetQueue_, a2);
  id v7 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v7);

  objc_msgSend(a1, sel_setInterface_, a3);
  objc_msgSend(a1, sel_setInterfaceTarget_, a4);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = sub_24F9137CC;
  uint64_t v19 = v8;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_24F9129A8;
  id v17 = &block_descriptor_35;
  id v9 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v9);
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = sub_24F91380C;
  uint64_t v19 = v10;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_24F9129A8;
  id v17 = &block_descriptor_39;
  unint64_t v11 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v11);
  _Block_release(v11);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = sub_24F91384C;
  uint64_t v19 = v12;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  uint64_t v16 = sub_24F9129A8;
  id v17 = &block_descriptor_43;
  os_log_type_t v13 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v13);
  _Block_release(v13);
}

uint64_t sub_24F912964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24F912984, a4, 0);
}

uint64_t sub_24F912984()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 136) = 1;
  OUTLINED_FUNCTION_7();
  return v1();
}

void sub_24F9129A8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24F912A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24F912A30, a4, 0);
}

uint64_t sub_24F912A30()
{
  OUTLINED_FUNCTION_2();
  sub_24F912EA8(0);
  OUTLINED_FUNCTION_7();
  return v0();
}

uint64_t sub_24F912A8C(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a2 + 16;
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24F91C228();
  __swift_project_value_buffer(v13, (uint64_t)qword_269A334B0);
  id v14 = a1;
  uint64_t v15 = sub_24F91C208();
  os_log_type_t v16 = sub_24F91C328();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v30 = a4;
    uint64_t v17 = OUTLINED_FUNCTION_16();
    uint64_t v31 = a5;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = (void *)OUTLINED_FUNCTION_15();
    *(_DWORD *)uint64_t v18 = 138412290;
    id v32 = v14;
    uint64_t v28 = a3;
    id v20 = v14;
    uint64_t v29 = v12;
    uint64_t v21 = v11;
    id v22 = v20;
    sub_24F91C388();
    void *v19 = v14;

    unint64_t v11 = v21;
    _os_log_impl(&dword_24F90C000, v15, v16, v28, v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_0();
    a5 = v31;
    OUTLINED_FUNCTION_3_0();
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v24 = result;
    uint64_t v25 = sub_24F91C308();
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v25);
    uint64_t v26 = (void *)swift_allocObject();
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = v24;
    sub_24F90E9C4((uint64_t)v11, a5, (uint64_t)v26);
    return swift_release();
  }
  return result;
}

uint64_t sub_24F912CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24F913CD0, a4, 0);
}

uint64_t sub_24F912D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_24F912D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24F91C308();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_24F913690(a1, &qword_269A33158);
  }
  else
  {
    sub_24F91C2F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24F91C2D8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_24F912EA8(char a1)
{
  *(unsigned char *)(v1 + 136) = a1;
  if ((a1 & 1) == 0)
  {
    objc_msgSend(*(id *)(v1 + 120), sel_invalidate);
    uint64_t v2 = MEMORY[0x253365E80](v1 + 112);
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler);
      swift_beginAccess();
      uint64_t v5 = (void (*)(void))*v4;
      sub_24F910A4C(*v4);

      if (v5)
      {
        v5();
        sub_24F910A5C((uint64_t)v5);
      }
    }
  }
}

uint64_t sub_24F912F48()
{
  OUTLINED_FUNCTION_2();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[9] = v3;
  void *v3 = v1;
  v3[1] = sub_24F912FDC;
  return sub_24F910A6C();
}

uint64_t sub_24F912FDC()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24F9130BC, v2, 0);
}

uint64_t sub_24F9130BC()
{
  uint64_t v1 = MEMORY[0x253365E80](*(void *)(v0 + 64) + 112);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = *(void **)(*(void *)(v0 + 64) + 120);
    if (v3)
    {
      *(void *)(v0 + 48) = &unk_270113F80;
      uint64_t v4 = swift_dynamicCastObjCProtocolConditional();
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A33270);
        uint64_t v6 = swift_allocObject();
        *(_OWORD *)(v6 + 16) = xmmword_24F91E510;
        id v7 = v3;
        *(void *)(v6 + 32) = sub_24F91068C();
        sub_24F91C2C8();
        sub_24F913B80(0, &qword_269A33278);
        uint64_t v8 = (void *)sub_24F91C2B8();
        swift_bridgeObjectRelease();
        id v9 = objc_msgSend(v5, sel_remoteTargetWithLaunchingAssertionAttributes_, v8);

        if (v9)
        {
          sub_24F91C3A8();
          swift_unknownObjectRelease();
        }
        else
        {

          *(_OWORD *)(v0 + 16) = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
        }
        sub_24F913454(v0 + 16, *(void *)(v0 + 56));
        goto LABEL_10;
      }
    }
  }
  uint64_t v10 = *(_OWORD **)(v0 + 56);
  *uint64_t v10 = 0u;
  v10[1] = 0u;
LABEL_10:
  OUTLINED_FUNCTION_7();
  return v11();
}

uint64_t sub_24F913260()
{
  uint64_t v1 = *(void **)(v0 + 120);
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24F9132AC()
{
  sub_24F913260();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24F9132D8()
{
  return v0;
}

uint64_t sub_24F9132E4()
{
  return sub_24F9132D8();
}

id ClientProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ClientProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClientProxy);
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ClientProxy.__allocating_init(serviceKind:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_24F913454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F9134BC()
{
  uint64_t v0 = sub_24F91C228();
  __swift_allocate_value_buffer(v0, qword_269A334B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A334B0);
  return sub_24F91C218();
}

unint64_t sub_24F91353C()
{
  unint64_t result = qword_269A33288;
  if (!qword_269A33288)
  {
    type metadata accessor for ClientProxy.ConnectionHelper();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33288);
  }
  return result;
}

uint64_t sub_24F913588()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24F9135D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  char v5 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v8 = swift_task_alloc();
  id v9 = (void *)OUTLINED_FUNCTION_4(v8);
  *id v9 = v10;
  v9[1] = sub_24F90EC88;
  return sub_24F911320(a1, v3, v4, v5, v7, v6);
}

uint64_t sub_24F913690(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_18();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_24F9136E0(uint64_t a1)
{
}

uint64_t sub_24F9136E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_24F913738(void *a1)
{
  sub_24F9126C4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24F913744()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F913754()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_24F913794()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24F9137CC(void *a1)
{
  return sub_24F912A8C(a1, v1, "GameOverlayUI Client Proxy Activation Handler: %@", (uint64_t)&unk_270110048, (uint64_t)&unk_269A33340);
}

uint64_t sub_24F91380C(void *a1)
{
  return sub_24F912A8C(a1, v1, "GameOverlayUI Client Proxy Invalidation Handler: %@", (uint64_t)&unk_270110020, (uint64_t)&unk_269A33330);
}

uint64_t sub_24F91384C(void *a1)
{
  return sub_24F912A8C(a1, v1, "GameOverlayUI Client Proxy Interruption Handler: %@", (uint64_t)&unk_27010FFF8, (uint64_t)&unk_269A33320);
}

uint64_t sub_24F913890()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90F220;
  uint64_t v3 = OUTLINED_FUNCTION_4_1();
  return sub_24F912CEC(v3, v4, v5, v6);
}

uint64_t sub_24F913924()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90EC88;
  uint64_t v3 = OUTLINED_FUNCTION_4_1();
  return sub_24F912A10(v3, v4, v5, v6);
}

uint64_t objectdestroy_45Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24F9139F8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F90F220;
  uint64_t v3 = OUTLINED_FUNCTION_4_1();
  return sub_24F912964(v3, v4, v5, v6);
}

uint64_t sub_24F913A88()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33348);
  OUTLINED_FUNCTION_18();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + ((v2 + 16) & ~v2));
  uint64_t v4 = OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA0238](v4, v5, v3);
}

uint64_t sub_24F913B0C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33348);
  return sub_24F912610(a1);
}

uint64_t sub_24F913B80(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24F913BBC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F913BF4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24F913C1C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

void OUTLINED_FUNCTION_3_0()
{
  JUMPOUT(0x253365DE0);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return 0x65732D687475612ELL;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  *(void *)(*(void *)(v0 + 48) + 128) = 0;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_bridgeObjectRetain();
}

uint64_t AccessPointAnchoring.bottom.getter()
{
  int v1 = *v0;
  char v2 = 1;
  switch(*v0)
  {
    case 1:
      OUTLINED_FUNCTION_45();
      goto LABEL_4;
    case 2:
      goto LABEL_10;
    case 3:
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_40();
      goto LABEL_4;
    default:
LABEL_4:
      char v3 = OUTLINED_FUNCTION_8_0();
      swift_bridgeObjectRelease();
      if ((v3 & 1) == 0)
      {
        switch(v1)
        {
          case 0:
            goto LABEL_9;
          case 1:
            OUTLINED_FUNCTION_31();
            OUTLINED_FUNCTION_47();
            goto LABEL_9;
          case 2:
            OUTLINED_FUNCTION_36();
            goto LABEL_9;
          case 3:
            break;
          case 4:
            OUTLINED_FUNCTION_13_0();
LABEL_9:
            char v2 = sub_24F91C468();
            break;
          default:
            JUMPOUT(0);
        }
LABEL_10:
        swift_bridgeObjectRelease();
      }
      return v2 & 1;
  }
}

uint64_t sub_24F913FA8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000024F91CB10;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEF796C6E4F746E69;
      unint64_t v5 = 0x6F50737365636361;
      break;
    case 2:
      unint64_t v5 = 0xD00000000000001BLL;
      uint64_t v6 = "y";
      goto LABEL_6;
    case 3:
      uint64_t v6 = "welcomeBannerAndAccessPoint";
      goto LABEL_6;
    case 4:
      uint64_t v6 = "achievementBanner";
LABEL_6:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v3 = 0xEC00000072656E6ELL;
      unint64_t v5 = 0x6142656D61476E69;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000024F91CB10;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEF796C6E4F746E69;
      unint64_t v2 = 0x6F50737365636361;
      break;
    case 2:
      unint64_t v2 = 0xD00000000000001BLL;
      uint64_t v8 = "y";
      goto LABEL_13;
    case 3:
      uint64_t v8 = "welcomeBannerAndAccessPoint";
      goto LABEL_13;
    case 4:
      uint64_t v8 = "achievementBanner";
LABEL_13:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v7 = 0xEC00000072656E6ELL;
      unint64_t v2 = 0x6142656D61476E69;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_24F91C468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_24F91417C(char a1, char a2)
{
  if (*(void *)&aTopleaditoptra[8 * a1] == *(void *)&aTopleaditoptra[8 * a2]
    && *(void *)&aTopleaditoptra[8 * a1 + 40] == *(void *)&aTopleaditoptra[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24F91C468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24F914204(char a1, char a2)
{
  if (qword_269A33150 != -1) {
    swift_once();
  }
  switch(a1)
  {
    case 1:
    case 2:
      OUTLINED_FUNCTION_12_0();
      break;
    case 3:
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_34();
      break;
    default:
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_11_0();
      break;
  }
  sub_24F91C298();
  switch(a2)
  {
    case 1:
    case 2:
      OUTLINED_FUNCTION_12_0();
      break;
    case 3:
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_34();
      break;
    default:
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_11_0();
      break;
  }
  sub_24F91C298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t AccessPointAnchoring.leading.getter()
{
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_47();
  int v1 = *v0;
  char v2 = 1;
  switch(*v0)
  {
    case 1:
    case 2:
    case 4:
      goto LABEL_3;
    case 3:
      OUTLINED_FUNCTION_41();
LABEL_3:
      char v3 = sub_24F91C468();
      swift_bridgeObjectRelease();
      if (v3) {
        return v2 & 1;
      }
      switch(v1)
      {
        case 2:
          break;
        case 3:
          OUTLINED_FUNCTION_37();
          goto LABEL_7;
        case 4:
          OUTLINED_FUNCTION_13_0();
          goto LABEL_7;
        default:
LABEL_7:
          char v2 = OUTLINED_FUNCTION_8_0();
          break;
      }
LABEL_8:
      swift_bridgeObjectRelease();
      return v2 & 1;
    default:
      goto LABEL_8;
  }
}

uint64_t AccessPointAnchoring.centered.getter()
{
  uint64_t v1 = *v0;
  char v2 = 1;
  switch(v1)
  {
    case 1:
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_45();
      goto LABEL_5;
    case 2:
      OUTLINED_FUNCTION_36();
      goto LABEL_5;
    case 3:
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_40();
      goto LABEL_5;
    case 4:
      goto LABEL_6;
    default:
LABEL_5:
      char v2 = sub_24F91C468();
LABEL_6:
      swift_bridgeObjectRelease();
      return v2 & 1;
  }
}

GameCenterOverlayService::AccessPointAnchoring_optional __swiftcall AccessPointAnchoring.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_24F91C438();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t AccessPointAnchoring.rawValue.getter()
{
  return *(void *)&aTopleaditoptra[8 * *v0];
}

uint64_t sub_24F9146E4(char *a1, char *a2)
{
  return sub_24F91417C(*a1, *a2);
}

uint64_t sub_24F9146F0()
{
  return sub_24F919F70(*v0);
}

uint64_t sub_24F9146F8()
{
  return sub_24F91A0F0();
}

uint64_t sub_24F914700(uint64_t a1)
{
  return sub_24F91A2A8(a1, *v1);
}

GameCenterOverlayService::AccessPointAnchoring_optional sub_24F914708(Swift::String *a1)
{
  return AccessPointAnchoring.init(rawValue:)(*a1);
}

uint64_t sub_24F914714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AccessPointAnchoring.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F91473C()
{
  return sub_24F914774();
}

uint64_t sub_24F914768()
{
  return sub_24F9148D8();
}

uint64_t sub_24F914774()
{
  return sub_24F914918();
}

void (*sub_24F914780(void *a1))(void **, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  OUTLINED_FUNCTION_7_0((uint64_t)v3, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  v3[3] = MEMORY[0x253365E80](v1);
  return sub_24F9147EC;
}

uint64_t sub_24F9147F0()
{
  return sub_24F914828();
}

uint64_t sub_24F91481C()
{
  return sub_24F9148D8();
}

uint64_t sub_24F914828()
{
  return sub_24F914918();
}

void (*sub_24F914834(void *a1))(void **, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  OUTLINED_FUNCTION_7_0((uint64_t)v3, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  v3[3] = MEMORY[0x253365E80](v1);
  return sub_24F9147EC;
}

uint64_t sub_24F9148A0()
{
  return sub_24F91490C();
}

uint64_t sub_24F9148CC()
{
  return sub_24F9148D8();
}

uint64_t sub_24F9148D8()
{
  OUTLINED_FUNCTION_33();
  return MEMORY[0x253365E80](v0);
}

uint64_t sub_24F91490C()
{
  return sub_24F914918();
}

uint64_t sub_24F914918()
{
  return swift_unknownObjectRelease();
}

void (*sub_24F914970(void *a1))(void **, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  OUTLINED_FUNCTION_7_0((uint64_t)v3, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate);
  v3[3] = MEMORY[0x253365E80](v1);
  return sub_24F9147EC;
}

uint64_t sub_24F9149DC(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 80) = a1;
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_24F914A04()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_24F914BAC;
    return sub_24F912F48();
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_24F9103DC(v0 + 16);
    if (qword_269A33140 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24F91C228();
    __swift_project_value_buffer(v4, (uint64_t)qword_269A334B0);
    uint64_t v5 = sub_24F91C208();
    os_log_type_t v6 = sub_24F91C338();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_28() = 0;
      OUTLINED_FUNCTION_6(&dword_24F90C000, v7, v8, "Failed to create GameOverlayUI Dashboard Remote Proxy");
      OUTLINED_FUNCTION_3_1();
    }

    id v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9(0);
  }
}

uint64_t sub_24F914BAC()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_24F914C98()
{
  if (v0[5])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A33420);
    if (swift_dynamicCast())
    {
      uint64_t v1 = v0[6];
      goto LABEL_10;
    }
  }
  else
  {
    sub_24F9103DC((uint64_t)(v0 + 2));
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24F91C228();
  __swift_project_value_buffer(v2, (uint64_t)qword_269A334B0);
  uint64_t v3 = sub_24F91C208();
  os_log_type_t v4 = sub_24F91C338();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_28() = 0;
    OUTLINED_FUNCTION_6(&dword_24F90C000, v5, v6, "Failed to create GameOverlayUI Dashboard Remote Proxy");
    OUTLINED_FUNCTION_3_1();
  }

  uint64_t v1 = 0;
LABEL_10:
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v1);
}

uint64_t sub_24F914DDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v12 = OUTLINED_FUNCTION_25(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_18_0();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_24F91C308();
  OUTLINED_FUNCTION_23(v15, v17, v18, v16);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  *(void *)(v19 + 32) = v5;
  *(unsigned char *)(v19 + 40) = a4;
  *(void *)(v19 + 48) = a1;
  *(unsigned char *)(v19 + 56) = a5;
  *(void *)(v19 + 64) = a2;
  *(void *)(v19 + 72) = a3;
  swift_bridgeObjectRetain();
  id v20 = v5;
  swift_bridgeObjectRetain();
  sub_24F90E9C4(v15, (uint64_t)&unk_269A33378, v19);
  return swift_release();
}

uint64_t sub_24F914EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 32) = a8;
  *(void *)(v8 + 40) = v13;
  *(unsigned char *)(v8 + 64) = a7;
  *(void *)(v8 + 24) = a6;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v8 + 48) = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_24F914FC0;
  return sub_24F9149DC(a5);
}

uint64_t sub_24F914FC0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F9150B8()
{
  OUTLINED_FUNCTION_39();
  uint64_t v1 = *(void **)(v0 + 56);
  if (v1)
  {
    uint64_t v2 = self;
    uint64_t v3 = (void *)sub_24F91C258();
    *(void *)(v0 + 16) = 0;
    id v4 = objc_msgSend(v2, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v3, 1, v0 + 16);

    id v5 = *(id *)(v0 + 16);
    if (v4)
    {
      uint64_t v6 = *(void **)(v0 + 40);
      uint64_t v7 = *(unsigned __int8 *)(v0 + 64);
      uint64_t v8 = sub_24F91C1E8();
      unint64_t v10 = v9;

      id v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v7);
      uint64_t v12 = (void *)sub_24F91C1D8();
      if (v6) {
        uint64_t v6 = (void *)sub_24F91C268();
      }
      objc_msgSend(v1, sel_showDashboardWithInitialState_canDismissWithGesture_sceneIdentifier_, v12, v11, v6);

      sub_24F918300(v8, v10);
    }
    else
    {
      uint64_t v13 = v5;
      uint64_t v14 = (void *)sub_24F91C1C8();

      swift_willThrow();
      if (qword_269A33140 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_24F91C228();
      __swift_project_value_buffer(v15, (uint64_t)qword_269A334B0);
      uint64_t v16 = sub_24F91C208();
      os_log_type_t v17 = sub_24F91C338();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_28();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_24F90C000, v16, v17, "Failed to serialize initialState dictionary", v18, 2u);
        OUTLINED_FUNCTION_3_0();
      }
    }
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v19();
}

char *DashboardClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DashboardClientProxy.init(serviceKind:)(a1);
}

char *DashboardClientProxy.init(serviceKind:)(char *a1)
{
  char v1 = *a1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  char v3 = v1;
  return ClientProxy.init(serviceKind:)(&v3);
}

uint64_t sub_24F9153D4()
{
  sub_24F9103B4(v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  sub_24F9103B4(v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  uint64_t v1 = v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate;
  return sub_24F9103B4(v1);
}

id DashboardClientProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase_optional __swiftcall DashboardClientProxy.AccessPointUseCase.init(rawValue:)(Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_24F91C438();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t DashboardClientProxy.AccessPointUseCase.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6F50737365636361;
      break;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0x6142656D61476E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F9155D8(unsigned __int8 *a1, char *a2)
{
  return sub_24F913FA8(*a1, *a2);
}

uint64_t sub_24F9155E4()
{
  return sub_24F919F88(*v0);
}

uint64_t sub_24F9155EC()
{
  return sub_24F919FF0();
}

uint64_t sub_24F9155F4(uint64_t a1)
{
  return sub_24F91A2C0(a1, *v1);
}

GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase_optional sub_24F9155FC(Swift::String *a1)
{
  return DashboardClientProxy.AccessPointUseCase.init(rawValue:)(*a1);
}

unint64_t sub_24F915608@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DashboardClientProxy.AccessPointUseCase.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

Swift::Void __swiftcall DashboardClientProxy.setUpAccessPoint(anchoring:useCase:didReturnToForeground:newToGameCenter:sceneIdentifier:)(GameCenterOverlayService::AccessPointAnchoring anchoring, GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase useCase, Swift::Bool didReturnToForeground, Swift::Bool newToGameCenter, Swift::String_optional sceneIdentifier)
{
  object = sceneIdentifier.value._object;
  uint64_t countAndFlagsBits = sceneIdentifier.value._countAndFlagsBits;
  unint64_t v10 = (char *)useCase;
  id v11 = (unsigned char *)anchoring;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v13 = OUTLINED_FUNCTION_25(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_18_0();
  uint64_t v16 = v15 - v14;
  LOBYTE(v11) = *v11;
  char v17 = *v10;
  uint64_t v18 = sub_24F91C308();
  OUTLINED_FUNCTION_23(v16, v19, v20, v18);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  *(void *)(v21 + 32) = v5;
  *(unsigned char *)(v21 + 40) = (_BYTE)v11;
  *(unsigned char *)(v21 + 41) = v17;
  *(unsigned char *)(v21 + 42) = didReturnToForeground;
  *(unsigned char *)(v21 + 43) = newToGameCenter;
  *(void *)(v21 + 48) = countAndFlagsBits;
  *(void *)(v21 + 56) = object;
  swift_bridgeObjectRetain();
  id v22 = v5;
  sub_24F90E9C4(v16, (uint64_t)&unk_269A33388, v21);
  swift_release();
}

uint64_t sub_24F915744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, char a8)
{
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v13;
  *(unsigned char *)(v8 + 67) = a8;
  *(unsigned char *)(v8 + 66) = a7;
  *(unsigned char *)(v8 + 65) = a6;
  *(unsigned char *)(v8 + 64) = a5;
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 48) = v9;
  *unint64_t v9 = v8;
  v9[1] = sub_24F915820;
  return sub_24F9149DC(0);
}

uint64_t sub_24F915820()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F915918()
{
  if (*(void *)(v0 + 56))
  {
    self;
    id v1 = objc_msgSend(self, sel_currentGame);
    id v2 = objc_msgSend(v1, sel_internal);

    *(void *)(v0 + 16) = 0;
    id v4 = OUTLINED_FUNCTION_16_0(v3, sel_archivedDataWithRootObject_requiringSecureCoding_error_);

    id v5 = *(id *)(v0 + 16);
    if (v4)
    {
      uint64_t v6 = sub_24F91C1E8();
      unint64_t v8 = v7;
    }
    else
    {
      unint64_t v9 = v5;
      unint64_t v10 = (_DWORD *)sub_24F91C1C8();

      swift_willThrow();
      if (qword_269A33140 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_24F91C228();
      __swift_project_value_buffer(v11, (uint64_t)qword_269A334B0);
      uint64_t v12 = v10;
      uint64_t v13 = v10;
      uint64_t v14 = (void *)sub_24F91C208();
      os_log_type_t v15 = sub_24F91C338();
      if (OUTLINED_FUNCTION_30(v15))
      {
        swift_slowAlloc();
        uint64_t v16 = (void *)OUTLINED_FUNCTION_26();
        *unint64_t v10 = 138412290;
        char v17 = v10;
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 24) = v18;
        sub_24F91C388();
        *uint64_t v16 = v18;

        OUTLINED_FUNCTION_15_0(&dword_24F90C000, v19, v20, "Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      uint64_t v6 = 0;
      unint64_t v8 = 0xC000000000000000;
    }
    id v32 = (void *)sub_24F91C268();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void **)(v0 + 40);
    uint64_t v22 = *(unsigned __int8 *)(v0 + 67);
    uint64_t v23 = *(unsigned __int8 *)(v0 + 66);
    uint64_t v24 = (void *)sub_24F91C268();
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)sub_24F91C1D8();
    id v26 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v23);
    id v27 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v22);
    if (v21) {
      uint64_t v21 = (void *)sub_24F91C268();
    }
    OUTLINED_FUNCTION_46();
    [v28 v29];
    sub_24F918300(v6, v8);

    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v30();
}

Swift::Void __swiftcall DashboardClientProxy.tearDownAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
}

uint64_t sub_24F915DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  unint64_t v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  void *v7 = v6;
  v7[1] = sub_24F915E38;
  return sub_24F9149DC(0);
}

uint64_t sub_24F915E38()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  OUTLINED_FUNCTION_44(v3);
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F915EFC()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    if (*(void *)(v0 + 24)) {
      id v2 = (void *)sub_24F91C268();
    }
    else {
      id v2 = 0;
    }
    objc_msgSend(v1, sel_tearDownAccessPointWithSceneIdentifier_, v2);

    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v3();
}

Swift::Void __swiftcall DashboardClientProxy.showAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
}

uint64_t sub_24F915FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  unint64_t v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  void *v7 = v6;
  v7[1] = sub_24F916048;
  return sub_24F9149DC(0);
}

uint64_t sub_24F916048()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  OUTLINED_FUNCTION_44(v3);
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F91610C()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    if (*(void *)(v0 + 24)) {
      id v2 = (void *)sub_24F91C268();
    }
    else {
      id v2 = 0;
    }
    objc_msgSend(v1, sel_showAccessPointWithSceneIdentifier_, v2);

    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v3();
}

Swift::Void __swiftcall DashboardClientProxy.hideAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
}

uint64_t sub_24F9161C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v10 = OUTLINED_FUNCTION_25(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_23(v5, v12, v13, v11);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v4;
  v14[5] = a1;
  v14[6] = a2;
  swift_bridgeObjectRetain();
  id v15 = v4;
  sub_24F90E9C4(v5, a4, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24F916280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  unint64_t v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  void *v7 = v6;
  v7[1] = sub_24F916318;
  return sub_24F9149DC(0);
}

uint64_t sub_24F916318()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  OUTLINED_FUNCTION_44(v3);
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F9163DC()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    if (*(void *)(v0 + 24)) {
      id v2 = (void *)sub_24F91C268();
    }
    else {
      id v2 = 0;
    }
    objc_msgSend(v1, sel_hideAccessPointWithSceneIdentifier_, v2);

    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v3();
}

Swift::Void __swiftcall DashboardClientProxy.updateAccessPoint(anchoring:sceneIdentifier:)(GameCenterOverlayService::AccessPointAnchoring anchoring, Swift::String_optional sceneIdentifier)
{
  object = sceneIdentifier.value._object;
  uint64_t countAndFlagsBits = sceneIdentifier.value._countAndFlagsBits;
  uint64_t v5 = (char *)anchoring;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v7 = OUTLINED_FUNCTION_25(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_18_0();
  uint64_t v10 = v9 - v8;
  char v11 = *v5;
  uint64_t v12 = sub_24F91C308();
  OUTLINED_FUNCTION_23(v10, v13, v14, v12);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 32) = v2;
  *(unsigned char *)(v15 + 40) = v11;
  *(void *)(v15 + 48) = countAndFlagsBits;
  *(void *)(v15 + 56) = object;
  swift_bridgeObjectRetain();
  id v16 = v2;
  sub_24F90E9C4(v10, (uint64_t)&unk_269A333C8, v15);
  swift_release();
}

uint64_t sub_24F916558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 32) = a6;
  *(void *)(v7 + 40) = a7;
  *(unsigned char *)(v7 + 64) = a5;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v7 + 48) = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_24F916620;
  return sub_24F9149DC(0);
}

uint64_t sub_24F916620()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F916718()
{
  if (*(void *)(v0 + 56))
  {
    self;
    id v2 = objc_msgSend(self, sel_currentGame);
    id v3 = objc_msgSend(v2, sel_internal);

    *(void *)(v0 + 16) = 0;
    id v5 = OUTLINED_FUNCTION_16_0(v4, sel_archivedDataWithRootObject_requiringSecureCoding_error_);

    id v6 = *(id *)(v0 + 16);
    if (v5)
    {
      uint64_t v7 = sub_24F91C1E8();
      unint64_t v9 = v8;
    }
    else
    {
      uint64_t v10 = v6;
      char v11 = (void *)sub_24F91C1C8();

      swift_willThrow();
      if (qword_269A33140 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_24F91C228();
      __swift_project_value_buffer(v12, (uint64_t)qword_269A334B0);
      id v13 = v11;
      id v14 = v11;
      uint64_t v15 = (void *)sub_24F91C208();
      os_log_type_t v16 = sub_24F91C338();
      if (OUTLINED_FUNCTION_30(v16))
      {
        OUTLINED_FUNCTION_29();
        char v17 = (void *)OUTLINED_FUNCTION_26();
        OUTLINED_FUNCTION_38(5.7779e-34);
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        OUTLINED_FUNCTION_22(v18);
        void *v17 = v1;

        OUTLINED_FUNCTION_15_0(&dword_24F90C000, v19, v20, "Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      uint64_t v7 = 0;
      unint64_t v9 = 0xC000000000000000;
    }
    uint64_t v21 = *(void **)(v0 + 40);
    uint64_t v22 = (void *)sub_24F91C268();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_24F91C1D8();
    uint64_t v24 = (void *)v23;
    if (v21)
    {
      uint64_t v23 = sub_24F91C268();
      uint64_t v21 = (void *)v23;
    }
    OUTLINED_FUNCTION_43(v23, sel_updateAccessPointWithLocation_gameInternal_sceneIdentifier_);
    sub_24F918300(v7, v9);

    swift_unknownObjectRelease();
  }
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t DashboardClientProxy.showInGameBanner(data:sceneIdentifier:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v11 = OUTLINED_FUNCTION_25(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_23(v5, v13, v14, v12);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v4;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  id v16 = v4;
  sub_24F91841C(a1, a2);
  swift_bridgeObjectRetain();
  sub_24F90E9C4(v5, (uint64_t)&unk_269A333D8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_24F916AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  unint64_t v9 = (void *)swift_task_alloc();
  v8[8] = v9;
  *unint64_t v9 = v8;
  v9[1] = sub_24F916BB0;
  return sub_24F9149DC(0);
}

uint64_t sub_24F916BB0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 72) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F916CA8()
{
  if (*(void *)(v0 + 72))
  {
    self;
    id v2 = objc_msgSend(self, sel_currentGame);
    id v3 = objc_msgSend(v2, sel_internal);

    *(void *)(v0 + 16) = 0;
    id v5 = OUTLINED_FUNCTION_16_0(v4, sel_archivedDataWithRootObject_requiringSecureCoding_error_);

    id v6 = *(id *)(v0 + 16);
    if (v5)
    {
      uint64_t v7 = sub_24F91C1E8();
      unint64_t v9 = v8;
    }
    else
    {
      uint64_t v10 = v6;
      uint64_t v11 = (void *)sub_24F91C1C8();

      swift_willThrow();
      if (qword_269A33140 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_24F91C228();
      __swift_project_value_buffer(v12, (uint64_t)qword_269A334B0);
      id v13 = v11;
      id v14 = v11;
      uint64_t v15 = (void *)sub_24F91C208();
      os_log_type_t v16 = sub_24F91C338();
      if (OUTLINED_FUNCTION_30(v16))
      {
        OUTLINED_FUNCTION_29();
        char v17 = (void *)OUTLINED_FUNCTION_26();
        OUTLINED_FUNCTION_38(5.7779e-34);
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        OUTLINED_FUNCTION_22(v18);
        void *v17 = v1;

        OUTLINED_FUNCTION_15_0(&dword_24F90C000, v19, v20, "showInGameBanner: Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      uint64_t v7 = 0;
      unint64_t v9 = 0xF000000000000000;
    }
    uint64_t v21 = sub_24F91C1D8();
    uint64_t v22 = (void *)v21;
    if (v9 >> 60 == 15)
    {
      uint64_t v23 = 0;
    }
    else
    {
      sub_24F91841C(v7, v9);
      uint64_t v23 = (void *)sub_24F91C1D8();
      uint64_t v21 = sub_24F9198E4(v7, v9);
    }
    if (*(void *)(v0 + 56))
    {
      uint64_t v21 = sub_24F91C268();
      uint64_t v24 = (void *)v21;
    }
    else
    {
      uint64_t v24 = 0;
    }
    OUTLINED_FUNCTION_43(v21, sel_showInGameBannerWithData_gameInternal_sceneIdentifier_);
    sub_24F9198E4(v7, v9);

    swift_unknownObjectRelease();
  }
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

Swift::Void __swiftcall DashboardClientProxy.showGameModeBanner(bundleIdentifier:available:required:enabled:showText:usingLocalEndPoint:)(Swift::String bundleIdentifier, Swift::Bool available, Swift::Bool required, Swift::Bool enabled, Swift::Bool showText, Swift::Bool usingLocalEndPoint)
{
  object = bundleIdentifier._object;
  uint64_t countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A33158);
  uint64_t v15 = OUTLINED_FUNCTION_25(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_18_0();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_24F91C308();
  OUTLINED_FUNCTION_23(v18, v20, v21, v19);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = 0;
  *(void *)(v22 + 32) = v6;
  *(unsigned char *)(v22 + 40) = usingLocalEndPoint;
  *(void *)(v22 + 48) = countAndFlagsBits;
  *(void *)(v22 + 56) = object;
  *(unsigned char *)(v22 + 64) = available;
  *(unsigned char *)(v22 + 65) = required;
  *(unsigned char *)(v22 + 66) = enabled;
  *(unsigned char *)(v22 + 67) = showText;
  id v23 = v6;
  swift_bridgeObjectRetain();
  sub_24F90E9C4(v18, (uint64_t)&unk_269A333E8, v22);
  swift_release();
}

uint64_t sub_24F9170B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  *(_WORD *)(v8 + 50) = v14;
  *(unsigned char *)(v8 + 49) = v13;
  *(unsigned char *)(v8 + 48) = a8;
  *(void *)(v8 + 16) = a6;
  *(void *)(v8 + 24) = a7;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v8 + 32) = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_24F917170;
  return sub_24F9149DC(a5);
}

uint64_t sub_24F917170()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  void *v2 = v1;
  void *v2 = *v0;
  OUTLINED_FUNCTION_44(v3);
  OUTLINED_FUNCTION_9_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_24F917234()
{
  OUTLINED_FUNCTION_39();
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned __int8 *)(v0 + 51);
    uint64_t v3 = *(unsigned __int8 *)(v0 + 50);
    uint64_t v4 = *(unsigned __int8 *)(v0 + 49);
    uint64_t v5 = *(unsigned __int8 *)(v0 + 48);
    uint64_t v6 = (void *)sub_24F91C268();
    id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v5);
    id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v4);
    id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v3);
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v2);
    objc_msgSend(v1, sel_showGameModeBannerWithBundleIdentifier_available_required_enabled_showText_, v6, v7, v8, v9, v10);

    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_7();
  return v11();
}

Swift::Void __swiftcall DashboardClientProxy.didDismissDashboard()()
{
}

Swift::Void __swiftcall DashboardClientProxy.updateAccessPointFrameCoordinates(_:)(NSValue a1)
{
  double v1 = MEMORY[0x253365950](a1.super.isa);
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  OUTLINED_FUNCTION_33();
  id v8 = (void *)MEMORY[0x253365E80]();
  if (v8)
  {
    objc_msgSend(v8, sel_updateAccessPointFrameCoordinates_, v1, v3, v5, v7);
    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall DashboardClientProxy.isPresentingDashboardFromAccessPoint(_:)(NSValue a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate;
  OUTLINED_FUNCTION_10();
  double v4 = (void *)MEMORY[0x253365E80](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_isPresentingDashboardFromAccessPoint_, -[objc_class BOOLValueSafe](a1.super.isa, sel_BOOLValueSafe));
    swift_unknownObjectRelease();
  }
}

void DashboardClientProxy.finishAndPlay(_:)()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate;
  OUTLINED_FUNCTION_10();
  uint64_t v2 = MEMORY[0x253365E80](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_24F913B80(0, &qword_269A333F0);
    sub_24F913B80(0, &qword_269A333F8);
    uint64_t v4 = sub_24F91C348();
    double v6 = v4;
    if (v4)
    {
      id v9 = objc_msgSend(self, sel_challengeForInternalRepresentation_, v4);
      if (v9)
      {
        id v10 = v9;
        objc_msgSend(v3, sel_finishAndPlay_, v9);
      }
      swift_unknownObjectRelease();
      goto LABEL_11;
    }
    swift_unknownObjectRelease();
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24F91C228();
  __swift_project_value_buffer(v5, (uint64_t)qword_269A334B0);
  double v6 = sub_24F91C208();
  os_log_type_t v7 = sub_24F91C338();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)OUTLINED_FUNCTION_28();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_24F90C000, v6, v7, "Could not deserialize challenge data", v8, 2u);
    OUTLINED_FUNCTION_3_1();
  }
LABEL_11:
}

void DashboardClientProxy.finish(with:)(uint64_t a1, uint64_t a2)
{
}

void DashboardClientProxy.quitTurnBasedMatch(_:)(uint64_t a1, uint64_t a2)
{
}

void sub_24F917794(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = v3 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate;
  OUTLINED_FUNCTION_10();
  uint64_t v6 = MEMORY[0x253365E80](v5);
  if (v6)
  {
    os_log_type_t v7 = (void *)v6;
    sub_24F913B80(0, &qword_269A333F0);
    uint64_t v8 = sub_24F913B80(0, &qword_269A33400);
    uint64_t v9 = sub_24F91C348();
    __int16 v14 = (void *)v9;
    if (v9)
    {
      v17[3] = v8;
      v17[0] = v9;
      objc_allocWithZone(MEMORY[0x263F402E0]);
      uint64_t v11 = v14;
      id v15 = sub_24F918680(v17);
      if (v15)
      {
        uint64_t v16 = v15;
        objc_msgSend(v7, *a3, v15, v17[0]);
      }
      swift_unknownObjectRelease();
      goto LABEL_11;
    }
    swift_unknownObjectRelease();
  }
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24F91C228();
  __swift_project_value_buffer(v10, (uint64_t)qword_269A334B0);
  uint64_t v11 = sub_24F91C208();
  os_log_type_t v12 = sub_24F91C338();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_28();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24F90C000, v11, v12, "Could not deserialize turn based match data", v13, 2u);
    OUTLINED_FUNCTION_3_0();
  }
LABEL_11:
}

void sub_24F91797C(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t, unint64_t))
{
  id v6 = a3;
  id v10 = a1;
  uint64_t v7 = sub_24F91C1E8();
  unint64_t v9 = v8;

  a4(v7, v9);
  sub_24F918300(v7, v9);
}

Swift::Void __swiftcall DashboardClientProxy.setGameMode(bundleIdentifier:enabled:)(Swift::String bundleIdentifier, NSValue enabled)
{
  uint64_t v3 = v2;
  object = bundleIdentifier._object;
  uint64_t countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  if (qword_269A33140 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24F91C228();
  __swift_project_value_buffer(v7, (uint64_t)qword_269A334B0);
  swift_bridgeObjectRetain_n();
  unint64_t v8 = enabled.super.isa;
  unint64_t v9 = sub_24F91C208();
  os_log_type_t v10 = sub_24F91C328();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    sub_24F9188B8(countAndFlagsBits, (unint64_t)object, v18);
    sub_24F91C388();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2112;
    os_log_type_t v12 = v8;
    sub_24F91C388();
    void *v17 = v8;

    _os_log_impl(&dword_24F90C000, v9, v10, "Game Mode for bundleID %s was enabled: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A332A8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_3_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = v3 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate;
  OUTLINED_FUNCTION_10();
  uint64_t v14 = MEMORY[0x253365E80](v13);
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = (void *)sub_24F91C268();
    objc_msgSend(v15, sel_setGameModeWithBundleIdentifier_enabled_, v16, -[objc_class BOOLValueSafe](v8, sel_BOOLValueSafe));

    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall DashboardClientProxy.requireOnboardingFlow()()
{
}

void *sub_24F917D38(void *a1, SEL *a2)
{
  uint64_t v4 = v2 + *a1;
  OUTLINED_FUNCTION_10();
  unint64_t result = (void *)MEMORY[0x253365E80](v4);
  if (result)
  {
    [result *a2];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24F917DD8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24F917E28()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_35();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F919900;
  OUTLINED_FUNCTION_17_0();
  return sub_24F914EE0(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for DashboardClientProxy()
{
  return self;
}

uint64_t sub_24F917F18()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_35();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F919900;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_17_0();
  return sub_24F915744(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24F917FD8()
{
  OUTLINED_FUNCTION_19();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F919900;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24F915DA0(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24F918078()
{
  OUTLINED_FUNCTION_19();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F919900;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24F915FB0(v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24F918160()
{
  OUTLINED_FUNCTION_19();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F919900;
  uint64_t v3 = OUTLINED_FUNCTION_6_0();
  return sub_24F916280(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24F918200()
{
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_35();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_4(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_24F919900;
  uint64_t v6 = OUTLINED_FUNCTION_20();
  return sub_24F916558(v6, v7, v8, v9, v10, v1, v2);
}

uint64_t sub_24F9182B0()
{
  swift_unknownObjectRelease();

  sub_24F918300(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24F918300(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24F918358()
{
  OUTLINED_FUNCTION_39();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_4(v2);
  void *v3 = v4;
  v3[1] = sub_24F919900;
  OUTLINED_FUNCTION_46();
  return sub_24F916AE8(v5, v6, v7, v8, v9, v10, v11, v1);
}

uint64_t sub_24F91841C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_24F918474()
{
  return objectdestroy_4Tm(68);
}

uint64_t objectdestroy_4Tm(uint64_t a1)
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24F9184D0()
{
  OUTLINED_FUNCTION_32();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F9185B8;
  OUTLINED_FUNCTION_17_0();
  return sub_24F9170B0(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24F9185B8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7();
  return v0();
}

id sub_24F918680(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    uint64_t v5 = *(void *)(v2 - 8);
    MEMORY[0x270FA5388](v4);
    char v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = sub_24F91C458();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v1, sel_initWithInternalRepresentation_, v8);
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_24F9187BC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24F9187CC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_24F918808(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_24F918818(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24F918840(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24F9188B8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24F91C388();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24F9188B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_9_0();
  uint64_t v9 = sub_24F918988(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_24F919840((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_24F919840((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v10;
}

uint64_t sub_24F918988(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24F918AE0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24F91C398();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_24F918BB8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_24F91C3E8();
    if (!v8)
    {
      uint64_t result = sub_24F91C408();
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

void *sub_24F918AE0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24F91C428();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_24F918BB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24F918C50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_24F918E2C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_24F918E2C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24F918C50(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_24F91C2A8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_24F918DC4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_24F91C3D8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_24F91C428();
  __break(1u);
LABEL_14:
  uint64_t result = sub_24F91C408();
  __break(1u);
  return result;
}

void *sub_24F918DC4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A33428);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24F918E2C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A33428);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_24F918FDC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24F918F04(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24F918F04(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_24F91C428();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_24F918FDC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24F91C428();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_24F91906C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_24F919094(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24F91C388();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_24F919150()
{
  unint64_t result = qword_269A33408;
  if (!qword_269A33408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33408);
  }
  return result;
}

unint64_t sub_24F9191A0()
{
  unint64_t result = qword_269A33410;
  if (!qword_269A33410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A33410);
  }
  return result;
}

uint64_t sub_24F9191EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F914768();
  *a1 = result;
  return result;
}

uint64_t sub_24F91921C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F91481C();
  *a1 = result;
  return result;
}

uint64_t sub_24F91924C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F9148CC();
  *a1 = result;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccessPointAnchoring(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccessPointAnchoring(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F9193E0);
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

uint64_t sub_24F919408(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F919414(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccessPointAnchoring()
{
  return &type metadata for AccessPointAnchoring;
}

uint64_t method lookup function for DashboardClientProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DashboardClientProxy);
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DashboardClientProxy.showDashboard(initialState:sceneIdentifier:usingLocalEndPoint:canDismissWithGesture:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t getEnumTagSinglePayload for DashboardClientProxy.AccessPointUseCase(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DashboardClientProxy.AccessPointUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x24F9197B8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DashboardClientProxy.AccessPointUseCase()
{
  return &type metadata for DashboardClientProxy.AccessPointUseCase;
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

uint64_t sub_24F919840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24F9198E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24F918300(a1, a2);
  }
  return a1;
}

void OUTLINED_FUNCTION_3_1()
{
  JUMPOUT(0x253365DE0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = a2;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_24F91C468();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return 0x65732D687475612ELL;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_15_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

id OUTLINED_FUNCTION_16_0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v4, 1, v3);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return objectdestroy_4Tm(64);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_24F91C388();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_24F91C308();
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_beginAccess();
}

unint64_t OUTLINED_FUNCTION_34()
{
  return 0xD000000000000011;
}

id OUTLINED_FUNCTION_38(float a1)
{
  *uint64_t v1 = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return 0x72546D6F74746F62;
}

id OUTLINED_FUNCTION_43(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return 0x6C69617254706F74;
}

char *InternalClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  id v3 = objc_allocWithZone(v1);
  char v5 = *a1;
  return ClientProxy.init(serviceKind:)(&v5);
}

char *InternalClientProxy.init(serviceKind:)(char *a1)
{
  char v2 = *a1;
  return ClientProxy.init(serviceKind:)(&v2);
}

id InternalClientProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InternalClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for InternalClientProxy()
{
  return self;
}

uint64_t method lookup function for InternalClientProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InternalClientProxy);
}

uint64_t GameOverlayUIConfig.SharedResources.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  GameOverlayUIConfig.SharedResources.init()();
  return v0;
}

uint64_t GameOverlayUIConfig.ServiceKind.rawValue.getter()
{
  uint64_t v1 = *v0;
  if (qword_269A33150 != -1) {
    swift_once();
  }
  switch(v1)
  {
    case 1:
      uint64_t v3 = qword_269A33440;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_2_2();
      break;
    case 2:
      uint64_t v3 = qword_269A33440;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_3_2();
      break;
    case 3:
      uint64_t v3 = qword_269A33440;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_2();
      break;
    default:
      uint64_t v3 = qword_269A33440;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_5_0();
      break;
  }
  sub_24F91C298();
  return v3;
}

uint64_t sub_24F919F70(uint64_t a1)
{
  return sub_24F919FA0(a1, (void (*)(unsigned char *, uint64_t))sub_24F91A0F0);
}

uint64_t sub_24F919F88(uint64_t a1)
{
  return sub_24F919FA0(a1, (void (*)(unsigned char *, uint64_t))sub_24F919FF0);
}

uint64_t sub_24F919FA0(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_24F91C488();
  a2(v5, a1);
  return sub_24F91C4A8();
}

uint64_t sub_24F919FF0()
{
  sub_24F91C288();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F91A0F0()
{
  sub_24F91C288();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F91A144()
{
  if (qword_269A33150 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_24F91C298();
  sub_24F91C288();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F91A2A8(uint64_t a1, uint64_t a2)
{
  return sub_24F91A2D8(a1, a2, (void (*)(unsigned char *, uint64_t))sub_24F91A0F0);
}

uint64_t sub_24F91A2C0(uint64_t a1, uint64_t a2)
{
  return sub_24F91A2D8(a1, a2, (void (*)(unsigned char *, uint64_t))sub_24F919FF0);
}

uint64_t sub_24F91A2D8(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_24F91C488();
  a3(v6, a2);
  return sub_24F91C4A8();
}

const char *sub_24F91A324()
{
  return "gseui";
}

const char *sub_24F91A338(char a1)
{
  if (a1) {
    return "ff491a45";
  }
  else {
    return "de7bbd8e";
  }
}

BOOL sub_24F91A35C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24F91A36C()
{
  return sub_24F91C498();
}

uint64_t sub_24F91A394()
{
  return sub_24F91C4A8();
}

BOOL sub_24F91A3DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24F91A35C(*a1, *a2);
}

uint64_t sub_24F91A3E8()
{
  return sub_24F91A394();
}

uint64_t sub_24F91A3F0()
{
  return sub_24F91A36C();
}

uint64_t sub_24F91A3F8()
{
  return sub_24F91C4A8();
}

const char *sub_24F91A43C()
{
  return sub_24F91A324();
}

const char *sub_24F91A444()
{
  return sub_24F91A338(*v0);
}

uint64_t static GameOverlayUIConfig.shouldUseGameOverlayUIInternal.getter()
{
  uint64_t v0 = self;
  uint64_t v1 = sub_24F91BAE0(objc_msgSend(v0, sel_mainBundle));
  uint64_t v3 = v2;
  uint64_t v4 = sub_24F91C278();
  if (v3)
  {
    if (v1 == v4 && v3 == v5)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_17:
      char v15 = 1;
      return v15 & 1;
    }
    char v7 = sub_24F91C468();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_17;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = sub_24F91BAE0(objc_msgSend(v0, sel_mainBundle));
  uint64_t v10 = v9;
  uint64_t v11 = sub_24F91C278();
  if (v10)
  {
    if (v8 == v11 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v15 = 0;
      return v15 & 1;
    }
    char v14 = sub_24F91C468();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v15 = 0;
    if (v14) {
      return v15 & 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = &type metadata for GKFeatureFlags;
  unint64_t v16 = sub_24F91BB50();
  unint64_t v22 = v16;
  v20[0] = 0;
  char v17 = sub_24F91C1F8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
  char v15 = 0;
  if (v17)
  {
    uint64_t v21 = &type metadata for GKFeatureFlags;
    unint64_t v22 = v16;
    v20[0] = 1;
    char v18 = sub_24F91C1F8();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
    char v15 = v18 ^ 1;
  }
  return v15 & 1;
}

uint64_t sub_24F91A624()
{
  uint64_t result = static GameOverlayUIConfig.shouldUseGameOverlayUIInternal.getter();
  unint64_t v1 = 0xD000000000000017;
  if (result) {
    unint64_t v1 = 0xD00000000000001FLL;
  }
  unint64_t v2 = 0x800000024F91D9D0;
  if (result) {
    unint64_t v2 = 0x800000024F91D9F0;
  }
  qword_269A33430 = v1;
  *(void *)algn_269A33438 = v2;
  return result;
}

uint64_t static GameOverlayUIConfig.machServiceDomain.getter()
{
  return sub_24F91A72C(&qword_269A33148, &qword_269A33430);
}

uint64_t sub_24F91A6A8()
{
  uint64_t result = static GameOverlayUIConfig.shouldUseGameOverlayUIInternal.getter();
  unint64_t v1 = 0xD000000000000017;
  if (result) {
    unint64_t v1 = 0xD00000000000001FLL;
  }
  unint64_t v2 = 0x800000024F91D9D0;
  if (result) {
    unint64_t v2 = 0x800000024F91D9F0;
  }
  qword_269A33440 = v1;
  *(void *)algn_269A33448 = v2;
  return result;
}

uint64_t static GameOverlayUIConfig.machServiceName.getter()
{
  return sub_24F91A72C(&qword_269A33150, &qword_269A33440);
}

uint64_t sub_24F91A72C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id GameOverlayUIConfig.ServiceKind.serverProtocol.getter()
{
  return OUTLINED_FUNCTION_5_1(*v0);
}

id GameOverlayUIConfig.ServiceKind.clientProtocol.getter()
{
  return OUTLINED_FUNCTION_5_1(*v0);
}

uint64_t static GameOverlayUIConfig.ServiceKind.from(name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (qword_269A33150 != -1) {
    swift_once();
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = byte_27010FD38[v5++ + 32];
    switch(v6)
    {
      case 1:
        uint64_t v11 = qword_269A33440;
        uint64_t v12 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_2_2();
        break;
      case 2:
        uint64_t v11 = qword_269A33440;
        uint64_t v12 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_3_2();
        break;
      case 3:
        uint64_t v11 = qword_269A33440;
        uint64_t v12 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_4_2();
        break;
      default:
        uint64_t v11 = qword_269A33440;
        uint64_t v12 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_5_0();
        break;
    }
    sub_24F91C298();
    if (v11 == a1 && v12 == a2) {
      break;
    }
    char v8 = sub_24F91C468();
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_17;
    }
    if (v5 == 4)
    {
      sub_24F91C3C8();
      swift_bridgeObjectRelease();
      sub_24F91C298();
      sub_24F91C418();
      __break(1u);
      break;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
LABEL_17:
  *a3 = v6;
  return result;
}

GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional __swiftcall GameOverlayUIConfig.ServiceKind.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_24F91C438();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_24F91AA34(char *a1, char *a2)
{
  return sub_24F914204(*a1, *a2);
}

uint64_t sub_24F91AA40()
{
  return sub_24F919FA0(*v0, (void (*)(unsigned char *, uint64_t))sub_24F91A144);
}

uint64_t sub_24F91AA70()
{
  return sub_24F91A144();
}

uint64_t sub_24F91AA78(uint64_t a1)
{
  return sub_24F91A2D8(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_24F91A144);
}

GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional sub_24F91AAA8(Swift::String *a1)
{
  return GameOverlayUIConfig.ServiceKind.init(rawValue:)(*a1);
}

uint64_t sub_24F91AAB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GameOverlayUIConfig.ServiceKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *GameOverlayUIConfig.SharedResources.init()()
{
  swift_defaultActor_initialize();
  uint64_t v1 = MEMORY[0x263F8EE80];
  v0[14] = MEMORY[0x263F8EE80];
  v0[15] = v1;
  v0[16] = v1;
  return v0;
}

id sub_24F91AB0C(unsigned __int8 *a1)
{
  uint64_t v2 = (char)*a1;
  uint64_t v3 = *a1;
  if (qword_269A33150 != -1) {
    swift_once();
  }
  switch(v3)
  {
    case 1:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_2_2();
      break;
    case 2:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_3_2();
      break;
    case 3:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_2();
      break;
    default:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_5_0();
      break;
  }
  sub_24F91C298();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  id v5 = sub_24F91AFB0(v17, v18, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v5)
  {
    switch((char)v2)
    {
      case 0:
        uint64_t v6 = v2;
        uint64_t v13 = qword_269A33440;
        uint64_t v15 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_5_0();
        sub_24F91C298();
        sub_24F913B80(0, &qword_269A33458);
        id v7 = OUTLINED_FUNCTION_1_1();
        char v8 = (void **)&protocolRef__TtP24GameCenterOverlayService18AuthServerProtocol_;
        break;
      case 1:
        uint64_t v6 = v2;
        uint64_t v13 = qword_269A33440;
        uint64_t v15 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_8_1();
        sub_24F91C298();
        sub_24F913B80(0, &qword_269A33458);
        id v7 = OUTLINED_FUNCTION_1_1();
        char v8 = (void **)&protocolRef__TtP24GameCenterOverlayService23DashboardServerProtocol_;
        break;
      case 2:
        uint64_t v6 = v2;
        uint64_t v13 = qword_269A33440;
        uint64_t v15 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_9_1();
        sub_24F91C298();
        sub_24F913B80(0, &qword_269A33458);
        id v7 = OUTLINED_FUNCTION_1_1();
        char v8 = (void **)&protocolRef__TtP24GameCenterOverlayService25MultiplayerServerProtocol_;
        break;
      case 3:
        uint64_t v6 = v2;
        uint64_t v13 = qword_269A33440;
        uint64_t v15 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_4_2();
        sub_24F91C298();
        sub_24F913B80(0, &qword_269A33458);
        id v7 = OUTLINED_FUNCTION_1_1();
        char v8 = (void **)&protocolRef__TtP24GameCenterOverlayService22InternalServerProtocol_;
        break;
      default:
LABEL_23:
        JUMPOUT(0);
    }
    uint64_t v9 = *v8;
    sub_24F913B80(0, &qword_269A33460);
    id v10 = sub_24F91B05C(v9, (uint64_t)sub_24F91C13C, 0);
    objc_msgSend(v7, sel_setServer_, v10, v13, v15);

    id v11 = sub_24F91B05C(*off_26533D398[v2], (uint64_t)sub_24F91B1B0, 0);
    objc_msgSend(v7, sel_setClient_, v11);

    objc_msgSend(v7, sel_setClientMessagingExpectation_, 0);
    switch(v6)
    {
      case 0:
        uint64_t v14 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_5_0();
        goto LABEL_21;
      case 1:
        uint64_t v14 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_8_1();
        goto LABEL_21;
      case 2:
        uint64_t v14 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_9_1();
        goto LABEL_21;
      case 3:
        uint64_t v14 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_4_2();
LABEL_21:
        sub_24F91C298();
        swift_beginAccess();
        id v5 = v7;
        sub_24F91B7E8((uint64_t)v5, v14, v16, &qword_269A334A0);
        swift_endAccess();
        swift_bridgeObjectRelease();
        return v5;
      default:
        goto LABEL_23;
    }
  }
  return v5;
}

void *sub_24F91AFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_24F91B770(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

id sub_24F91AFF8()
{
  uint64_t v0 = (void *)sub_24F91C268();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_interfaceWithIdentifier_, v0);

  return v1;
}

id sub_24F91B05C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a2;
    *(void *)(v6 + 24) = a3;
    v10[4] = sub_24F91C0FC;
    v10[5] = v6;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_24F91B15C;
    v10[3] = &block_descriptor_0;
    id v7 = _Block_copy(v10);
    swift_release();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_protocolForProtocol_interpreter_, a1, v7);

  _Block_release(v7);
  return v8;
}

id sub_24F91B15C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  unint64_t v4 = (void *)v2();

  return v4;
}

id sub_24F91B1B0(void *a1)
{
  return objc_msgSend(a1, sel_copyAsOnewayVoid);
}

id sub_24F91B1BC(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24F91C368();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18_0();
  uint64_t v13 = v6 - v5;
  sub_24F91C358();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18_0();
  sub_24F91C248();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_18_0();
  uint64_t v7 = *a1;
  if (qword_269A33150 != -1) {
    swift_once();
  }
  switch(v7)
  {
    case 1:
    case 2:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      break;
    case 3:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_2();
      break;
    default:
      uint64_t v17 = qword_269A33440;
      uint64_t v18 = *(void *)algn_269A33448;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_5_0();
      break;
  }
  sub_24F91C298();
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 120);
  swift_bridgeObjectRetain();
  id v9 = sub_24F91AFB0(v17, v18, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v9)
  {
    switch(v7)
    {
      case 0:
        uint64_t v10 = v7;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_5_0();
        break;
      case 1:
        uint64_t v10 = v7;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_2_2();
        break;
      case 2:
        uint64_t v10 = v7;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_3_2();
        break;
      case 3:
        uint64_t v10 = v7;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_4_2();
        break;
      default:
LABEL_22:
        JUMPOUT(0);
    }
    sub_24F91C298();
    sub_24F91C298();
    swift_bridgeObjectRelease();
    sub_24F913B80(0, &qword_269A33468);
    sub_24F91C298();
    sub_24F91C238();
    sub_24F91BB9C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A33478);
    sub_24F91BBEC();
    sub_24F91C3B8();
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x263F8F130], v4);
    id v11 = (void *)sub_24F91C378();
    switch(v10)
    {
      case 0:
        uint64_t v15 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_5_0();
        goto LABEL_20;
      case 1:
        uint64_t v15 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_2_2();
        goto LABEL_20;
      case 2:
        uint64_t v15 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_3_2();
        goto LABEL_20;
      case 3:
        uint64_t v15 = qword_269A33440;
        uint64_t v16 = *(void *)algn_269A33448;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_4_2();
LABEL_20:
        sub_24F91C298();
        swift_beginAccess();
        id v9 = v11;
        sub_24F91B7E8((uint64_t)v9, v15, v16, &qword_269A33498);
        swift_endAccess();
        swift_bridgeObjectRelease();
        return v9;
      default:
        goto LABEL_22;
    }
  }
  return v9;
}

uint64_t GameOverlayUIConfig.SharedResources.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t GameOverlayUIConfig.SharedResources.__deallocating_deinit()
{
  GameOverlayUIConfig.SharedResources.deinit();
  return MEMORY[0x270FA2418](v0);
}

void GameOverlayUIConfig.SharedResources.unownedExecutor.getter()
{
}

void sub_24F91B754()
{
}

unint64_t sub_24F91B770(uint64_t a1, uint64_t a2)
{
  sub_24F91C488();
  sub_24F91C288();
  uint64_t v4 = sub_24F91C4A8();
  return sub_24F91B9FC(a1, a2, v4);
}

uint64_t sub_24F91B7E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_24F91B880(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  *uint64_t v4 = v11;
  return swift_bridgeObjectRelease();
}

void sub_24F91B880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = (void **)v5;
  uint64_t v11 = (void *)*v5;
  unint64_t v12 = sub_24F91B770(a2, a3);
  if (__OFADD__(v11[2], (v13 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v12;
  char v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  if ((sub_24F91C3F8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_24F91B770(a2, a3);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    sub_24F91C478();
    __break(1u);
    return;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v7;
  if (v15)
  {
    uint64_t v19 = v18[7];

    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    sub_24F91B9B4(v14, a2, a3, a1, v18);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_24F91B9B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_24F91B9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24F91C468() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24F91C468() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24F91BAE0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24F91C278();

  return v3;
}

unint64_t sub_24F91BB50()
{
  unint64_t result = qword_269A33450;
  if (!qword_269A33450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33450);
  }
  return result;
}

unint64_t sub_24F91BB9C()
{
  unint64_t result = qword_269A33470;
  if (!qword_269A33470)
  {
    sub_24F91C358();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33470);
  }
  return result;
}

unint64_t sub_24F91BBEC()
{
  unint64_t result = qword_269A33480;
  if (!qword_269A33480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A33478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33480);
  }
  return result;
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

unint64_t sub_24F91BC8C()
{
  unint64_t result = qword_269A33488;
  if (!qword_269A33488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33488);
  }
  return result;
}

void type metadata accessor for GameOverlayUIConfig()
{
}

uint64_t getEnumTagSinglePayload for GameOverlayUIConfig.ServiceKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for GameOverlayUIConfig.ServiceKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F91BE38);
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

void type metadata accessor for GameOverlayUIConfig.ServiceKind()
{
}

uint64_t type metadata accessor for GameOverlayUIConfig.SharedResources()
{
  return self;
}

uint64_t method lookup function for GameOverlayUIConfig.SharedResources(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GameOverlayUIConfig.SharedResources);
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.interface(kind:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.connectionQueue(kind:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t getEnumTagSinglePayload for GKFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for GKFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F91C058);
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

unsigned char *sub_24F91C080(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GKFeatureFlags()
{
  return &type metadata for GKFeatureFlags;
}

unint64_t sub_24F91C0A0()
{
  unint64_t result = qword_269A33490;
  if (!qword_269A33490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A33490);
  }
  return result;
}

uint64_t sub_24F91C0EC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F91C0FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

id OUTLINED_FUNCTION_1_1()
{
  return sub_24F91AFF8();
}

unint64_t OUTLINED_FUNCTION_2_2()
{
  return 0xD000000000000012;
}

unint64_t OUTLINED_FUNCTION_3_2()
{
  return 0xD000000000000014;
}

unint64_t OUTLINED_FUNCTION_4_2()
{
  return 0xD000000000000011;
}

id OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X8>)
{
  return **(id **)(v1 + 8 * a1);
}

unint64_t OUTLINED_FUNCTION_8_1()
{
  return 0xD000000000000012;
}

unint64_t OUTLINED_FUNCTION_9_1()
{
  return 0xD000000000000014;
}

uint64_t sub_24F91C1C8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24F91C1D8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24F91C1E8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24F91C1F8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24F91C208()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F91C218()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F91C228()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F91C238()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24F91C248()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24F91C258()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24F91C268()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24F91C278()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24F91C288()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F91C298()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24F91C2A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24F91C2B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24F91C2C8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24F91C2D8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F91C2E8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24F91C2F8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24F91C308()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24F91C328()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24F91C338()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24F91C348()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_24F91C358()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24F91C368()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24F91C378()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24F91C388()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24F91C398()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24F91C3A8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24F91C3B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24F91C3C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24F91C3D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24F91C3E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24F91C3F8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24F91C408()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F91C418()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24F91C428()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F91C438()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F91C458()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24F91C468()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F91C478()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24F91C488()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F91C498()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F91C4A8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BSRectFromValue()
{
  return MEMORY[0x270F108C0]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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