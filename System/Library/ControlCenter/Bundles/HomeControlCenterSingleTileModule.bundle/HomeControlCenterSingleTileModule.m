uint64_t variable initialization expression of ControlCenterModule.context()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.lockState()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.viewController()
{
  return 0;
}

id ControlCenterModule.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

char *ControlCenterModule.init()()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_242789B74(&qword_268D56D00);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_242790040();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context] = 0;
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState] = 0;
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration] = 0;
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion] = 0;
  *(void *)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation] = 0;
  v20.receiver = v1;
  v20.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v20, sel_init);
  sub_242790020();
  v11 = sub_242790030();
  os_log_type_t v12 = sub_242790290();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_242787000, v11, v12, "Initializing ControlCenterModule", v13, 2u);
    MEMORY[0x24566D9B0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v14 = objc_msgSend(self, sel_sharedManager);
  objc_msgSend(v14, sel_bootstrap);

  type metadata accessor for LockStateHandler();
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = -1;
  *(void *)(v15 + 32) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v15 + 32) = &off_26F84D240;
  swift_unknownObjectWeakAssign();
  v16 = (char *)v10;
  sub_24278F2EC();

  *(void *)&v16[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState] = v15;
  swift_release();
  uint64_t v17 = sub_242790250();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  sub_242789D5C((uint64_t)v5, (uint64_t)&unk_268D56D40, (uint64_t)v18);
  swift_release();
  return v16;
}

uint64_t sub_242789B74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of ControlCenterModule.registration()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.homeKitActiveAssertion()
{
  return 0;
}

uint64_t variable initialization expression of ControlCenterModule.scheduledRegistrationCancelation()
{
  return 0;
}

uint64_t sub_242789BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_242789BF0, 0, 0);
}

uint64_t sub_242789BF0()
{
  sub_242790170();
  *(void *)(v0 + 24) = sub_242790150();
  *(void *)(v0 + 32) = sub_24278EFAC(&qword_268D57008, v1, (void (*)(uint64_t))type metadata accessor for ControlCenterModule);
  sub_24278EFAC(&qword_268D57010, 255, MEMORY[0x263F49AB0]);
  uint64_t v3 = sub_242790210();
  return MEMORY[0x270FA2498](sub_242789CF0, v3, v2);
}

uint64_t sub_242789CF0()
{
  sub_242790160();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_242789D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_242790250();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_242790240();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24278F198(a1, &qword_268D56D00);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_242790210();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id ControlCenterModule.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion;
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion];
  if (v3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    id v5 = objc_msgSend(v4, sel_sharedDispatcher);
    id v6 = objc_msgSend(v5, sel_homeManager);

    objc_msgSend(v6, sel__endActiveAssertion_, v3);
    swift_unknownObjectRelease();
  }
  *(void *)&v0[v2] = 0;
  swift_unknownObjectRelease();
  v8.receiver = v0;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

uint64_t ControlCenterModule.moduleDescription.getter()
{
  uint64_t v0 = (void *)sub_2427901B0();
  id v1 = (id)HULocalizedString();

  uint64_t v2 = sub_2427901C0();
  return v2;
}

uint64_t ControlCenterModule.supportedGridSizeClasses.getter()
{
  return 21;
}

uint64_t ControlCenterModule.expandsGridSizeClassesForAccessibility.getter()
{
  return 1;
}

id ControlCenterModule.setContentModuleContext(_:)(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  *(void *)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context) = a1;

  return a1;
}

void *ControlCenterModule.contentModuleContext.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  id v2 = v1;
  return v1;
}

uint64_t sub_24278A334()
{
  uint64_t v1 = sub_242790040();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242790020();
  id v5 = v0;
  id v6 = sub_242790030();
  os_log_type_t v7 = sub_242790290();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v18 = v1;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v2;
    v9 = (uint8_t *)v8;
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v19 = v5;
    v11 = v5;
    sub_2427902F0();
    *id v10 = v5;

    uint64_t v1 = v18;
    _os_log_impl(&dword_242787000, v6, v7, "%@:CharacteristicRegistration canceling scheduled characteristic deregistration", v9, 0xCu);
    sub_242789B74(&qword_268D56D98);
    swift_arrayDestroy();
    MEMORY[0x24566D9B0](v10, -1, -1);
    os_log_type_t v12 = v9;
    uint64_t v2 = v17;
    MEMORY[0x24566D9B0](v12, -1, -1);
  }
  else
  {

    id v6 = v5;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v13 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation;
  id v14 = *(Class *)((char *)&v5->isa
                 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation);
  if (v14) {
    objc_msgSend(v14, sel_cancel);
  }
  *(Class *)((char *)&v5->isa + v13) = 0;
  return swift_unknownObjectRelease();
}

void ControlCenterModule.controlCenterModuleViewController(_:didChangeDisplayedItems:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_242789B74(&qword_268D56D00);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v25[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(a1, sel_itemManager);
  id v24 = objc_msgSend(v9, sel_home);

  if (v24)
  {
    if (objc_msgSend(a1, sel_allowsCharacteristicNotifications)
      && (id v10 = objc_msgSend(self, sel_sharedDispatcher),
          id v11 = objc_msgSend(v10, sel_homeManager),
          v11,
          v10,
          v11))
    {
      uint64_t v12 = sub_242790250();
      uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
      v13(v8, 1, 1, v12);
      id v14 = (void *)swift_allocObject();
      v14[2] = 0;
      v14[3] = 0;
      v14[4] = a2;
      v14[5] = v24;
      swift_bridgeObjectRetain();
      id v15 = v24;
      sub_242789D5C((uint64_t)v8, (uint64_t)&unk_268D56D50, (uint64_t)v14);
      swift_release();
      sub_242790120();
      v25[3] = sub_242789B74(&qword_268D56D58);
      v25[4] = sub_24278E9E4();
      v25[0] = a2;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_2427900E0();
      sub_24278EEFC((uint64_t)v25);
      uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration);
      v13(v8, 1, 1, v12);
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_242790090();
      swift_retain_n();
      swift_bridgeObjectRetain();
      id v19 = v15;
      swift_retain();
      uint64_t v20 = sub_242790080();
      uint64_t v21 = sub_24278EFAC(&qword_268D56D70, 255, MEMORY[0x263F47848]);
      v22 = (void *)swift_allocObject();
      v22[2] = v20;
      v22[3] = v21;
      v22[4] = v17;
      v22[5] = v16;
      v22[6] = a2;
      v22[7] = v18;
      v22[8] = v19;
      swift_release();
      sub_242789D5C((uint64_t)v8, (uint64_t)&unk_268D56D78, (uint64_t)v22);
      swift_release();
      swift_release();
    }
    else
    {
      id v23 = v24;
    }
  }
}

uint64_t sub_24278A928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24278A948, 0, 0);
}

uint64_t sub_24278A948()
{
  sub_242790070();
  v0[4] = sub_242790060();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F47820] + MEMORY[0x263F47820]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24278AA08;
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  return v5(v3, v2);
}

uint64_t sub_24278AA08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24278AB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[9] = a4;
  uint64_t v9 = sub_242790140();
  v8[14] = v9;
  v8[15] = *(void *)(v9 - 8);
  v8[16] = swift_task_alloc();
  sub_242790090();
  v8[17] = sub_242790080();
  sub_24278EFAC(&qword_268D56D70, 255, MEMORY[0x263F47848]);
  uint64_t v11 = sub_242790210();
  v8[18] = v11;
  v8[19] = v10;
  return MEMORY[0x270FA2498](sub_24278AC48, v11, v10);
}

uint64_t sub_24278AC48()
{
  uint64_t v1 = v0[9];
  if (v1)
  {
    uint64_t v2 = v0[10];
    uint64_t v3 = sub_2427900B0();
    sub_24278D530(v3, v2);
    LOBYTE(v2) = v4;
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_7;
    }
  }
  if ((v0[10] & 0xC000000000000001) != 0 && sub_242790320() < 0) {
    return sub_242790380();
  }
  uint64_t v7 = v0[15];
  uint64_t v6 = v0[16];
  uint64_t v8 = v0[14];
  sub_24278B5B4(v0[11]);
  sub_242790130();
  sub_24278EFAC(&qword_268D56FD8, 255, MEMORY[0x263F49AA8]);
  sub_242790010();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if (v1)
  {
LABEL_7:
    swift_retain();
    swift_release();
    sub_2427900A0();
    swift_release();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v10 = v0[12] + 16;
    swift_beginAccess();
    uint64_t v11 = MEMORY[0x24566DA50](v10);
    v0[20] = v11;
    if (v11)
    {
      sub_242790230();
      v0[21] = sub_242790220();
      uint64_t v13 = sub_242790210();
      return MEMORY[0x270FA2498](sub_24278B004, v13, v12);
    }
    else
    {
      id v14 = (void *)v0[13];
      uint64_t v15 = v0[12] + 16;
      sub_2427900D0();
      swift_allocObject();
      id v16 = v14;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_2427900C0();
      v0[26] = v17;
      swift_beginAccess();
      uint64_t v18 = MEMORY[0x24566DA50](v15);
      if (v18)
      {
        id v19 = (void *)v18;
        *(void *)(v18 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v17;
        swift_retain();
        swift_release();
      }
      sub_242790120();
      v0[27] = sub_242790110();
      uint64_t v20 = (void *)swift_task_alloc();
      v0[28] = v20;
      *uint64_t v20 = v0;
      v20[1] = sub_24278B3FC;
      return MEMORY[0x270F3A088](v17);
    }
  }
}

uint64_t sub_24278B004()
{
  uint64_t v1 = v0[20];
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController);
  if (v2 && (self, (uint64_t v3 = swift_dynamicCastObjCClass()) != 0))
  {
    char v4 = (void *)v3;
    uint64_t v5 = (void *)v0[20];
    id v6 = v2;
    id v7 = objc_msgSend(v4, sel_fullDescription);
    uint64_t v8 = sub_2427901C0();
    uint64_t v10 = v9;

    v0[22] = v8;
    v0[23] = v10;
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[19];
    uint64_t v13 = sub_24278B12C;
  }
  else
  {
    id v14 = (void *)v0[20];
    v0[8] = v2;
    sub_242789B74(&qword_268D56FE0);
    uint64_t v15 = sub_2427902E0();
    uint64_t v17 = v16;

    v0[24] = v15;
    v0[25] = v17;
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[19];
    uint64_t v13 = sub_24278B294;
  }
  return MEMORY[0x270FA2498](v13, v11, v12);
}

uint64_t sub_24278B12C()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v0[12] + 16;
  sub_2427900D0();
  swift_allocObject();
  id v3 = v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2427900C0();
  v0[26] = v4;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24566DA50](v2);
  if (v5)
  {
    id v6 = (void *)v5;
    *(void *)(v5 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v4;
    swift_retain();
    swift_release();
  }
  sub_242790120();
  v0[27] = sub_242790110();
  id v7 = (void *)swift_task_alloc();
  v0[28] = v7;
  *id v7 = v0;
  v7[1] = sub_24278B3FC;
  return MEMORY[0x270F3A088](v4);
}

uint64_t sub_24278B294()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v0[12] + 16;
  sub_2427900D0();
  swift_allocObject();
  id v3 = v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2427900C0();
  v0[26] = v4;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24566DA50](v2);
  if (v5)
  {
    id v6 = (void *)v5;
    *(void *)(v5 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration) = v4;
    swift_retain();
    swift_release();
  }
  sub_242790120();
  v0[27] = sub_242790110();
  id v7 = (void *)swift_task_alloc();
  v0[28] = v7;
  *id v7 = v0;
  v7[1] = sub_24278B3FC;
  return MEMORY[0x270F3A088](v4);
}

uint64_t sub_24278B3FC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return MEMORY[0x270FA2498](sub_24278B540, v3, v2);
}

uint64_t sub_24278B540()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24278B5B4(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_242790310();
    sub_24278F0FC(0, &qword_268D56FA8);
    sub_24278EE94();
    sub_242790270();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v3;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_242790340()) {
      goto LABEL_31;
    }
    sub_24278F0FC(0, &qword_268D56FA8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v10 = v23;
    swift_unknownObjectRelease();
    if (!v23) {
      goto LABEL_31;
    }
LABEL_10:
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();

    if (v11) {
      goto LABEL_31;
    }
  }
  if (v4)
  {
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v9 = v8 | (v3 << 6);
LABEL_9:
    id v10 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      uint64_t v3 = v12 + 2;
      if (v12 + 2 >= v16) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v3);
      if (!v14)
      {
        uint64_t v3 = v12 + 3;
        if (v12 + 3 >= v16) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v17 + 8 * v3);
        if (!v14)
        {
          uint64_t v3 = v12 + 4;
          if (v12 + 4 >= v16) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v17 + 8 * v3);
          if (!v14)
          {
            uint64_t v3 = v12 + 5;
            if (v12 + 5 >= v16) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v17 + 8 * v3);
            if (!v14)
            {
              uint64_t v15 = v12 + 6;
              while (v16 != v15)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  uint64_t v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_24278F138();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v4 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t ControlCenterModule.controlCenterModuleViewController(_:moduleDidDisappear:)()
{
  uint64_t v0 = sub_242789B74(&qword_268D56D00);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(self, sel_sharedManager);
  objc_msgSend(v3, sel_exitModuleViewDidDisappear);

  sub_24278BA60();
  uint64_t v4 = sub_242790250();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  sub_242789D5C((uint64_t)v2, (uint64_t)&unk_268D56D88, v5);
  return swift_release();
}

uint64_t sub_24278BA60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_242790040();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation;
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation];
  if (v7) {
    objc_msgSend(v7, sel_cancel);
  }
  sub_242790020();
  unint64_t v8 = v1;
  unint64_t v9 = sub_242790030();
  os_log_type_t v10 = sub_242790290();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v24 = v2;
    uint64_t v11 = swift_slowAlloc();
    v26 = v1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v6;
    id v23 = (void *)v13;
    *(_DWORD *)uint64_t v12 = 138412290;
    aBlock[0] = v8;
    unint64_t v14 = v8;
    sub_2427902F0();
    uint64_t v15 = v23;
    *id v23 = v8;

    uint64_t v2 = v24;
    _os_log_impl(&dword_242787000, v9, v10, "%@:CharacteristicRegistration scheduling characteristic deregistration", v12, 0xCu);
    sub_242789B74(&qword_268D56D98);
    swift_arrayDestroy();
    int64_t v16 = v15;
    uint64_t v6 = v25;
    MEMORY[0x24566D9B0](v16, -1, -1);
    uint64_t v17 = v12;
    uint64_t v1 = v26;
    MEMORY[0x24566D9B0](v17, -1, -1);
  }
  else
  {

    unint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v18 = objc_msgSend(self, sel_mainThreadScheduler);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_24278EFF4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24278C8E4;
  aBlock[3] = &unk_26F84D278;
  uint64_t v20 = _Block_copy(aBlock);
  swift_release();
  id v21 = objc_msgSend(v18, sel_afterDelay_performBlock_, v20, 5.0);
  swift_unknownObjectRelease();
  _Block_release(v20);
  *(void *)&v1[v6] = v21;
  return swift_unknownObjectRelease();
}

uint64_t sub_24278BD80()
{
  return MEMORY[0x270FA2498](sub_24278BD9C, 0, 0);
}

uint64_t sub_24278BD9C()
{
  sub_242790070();
  *(void *)(v0 + 16) = sub_242790060();
  sub_24278EFAC(&qword_268D56FC0, 255, MEMORY[0x263F47828]);
  uint64_t v2 = sub_242790210();
  return MEMORY[0x270FA2498](sub_24278BE64, v2, v1);
}

uint64_t sub_24278BE64()
{
  sub_242790050();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t ControlCenterModule.launchHomeApp(for:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_242790040();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_242789B74(&qword_268D56D90);
  MEMORY[0x270FA5388](v8 - 8);
  os_log_type_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24278FFE0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24278FFD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_24278F198((uint64_t)v10, &qword_268D56D90);
  }
  int64_t v16 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v33 = v14;
  v16(v14, v10, v11);
  sub_242790020();
  uint64_t v17 = a1;
  id v18 = sub_242790030();
  os_log_type_t v19 = sub_242790290();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v32 = v2;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    v29 = (void *)swift_slowAlloc();
    v30 = v20;
    uint64_t v31 = v4;
    *(_DWORD *)uint64_t v20 = 138412290;
    v28[1] = v20 + 4;
    v34 = v17;
    id v21 = v17;
    uint64_t v4 = v31;
    sub_2427902F0();
    unint64_t v22 = v29;
    void *v29 = v17;

    uint64_t v2 = v32;
    id v23 = v30;
    _os_log_impl(&dword_242787000, v18, v19, "Launching Home app for moduleViewController %@", v30, 0xCu);
    sub_242789B74(&qword_268D56D98);
    swift_arrayDestroy();
    MEMORY[0x24566D9B0](v22, -1, -1);
    MEMORY[0x24566D9B0](v23, -1, -1);
  }
  else
  {

    id v18 = v17;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = *(void **)(v2 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  uint64_t v25 = v33;
  if (v24)
  {
    id v26 = v24;
    v27 = (void *)sub_24278FFC0();
    objc_msgSend(v26, sel_openURL_completionHandler_, v27, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v25, v11);
}

BOOL ControlCenterModule.isDeviceUnlocked(for:)()
{
  return *(void *)(v0 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState)
      && sub_24278F9AC();
}

char *sub_24278C494(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_242789B74(&qword_268D56D00);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_242790040();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + 16;
  sub_242790020();
  swift_retain();
  os_log_type_t v10 = sub_242790030();
  os_log_type_t v11 = sub_242790290();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v31 = v5;
    uint64_t v32 = v4;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    swift_beginAccess();
    uint64_t v14 = MEMORY[0x24566DA50](a1 + 16);
    uint64_t v15 = v14;
    if (v14) {
      uint64_t v33 = v14;
    }
    else {
      uint64_t v33 = 0;
    }
    sub_2427902F0();
    void *v13 = v15;
    swift_release();
    _os_log_impl(&dword_242787000, v10, v11, "%@:CharacteristicRegistration deregistering characteristic notifications", v12, 0xCu);
    sub_242789B74(&qword_268D56D98);
    swift_arrayDestroy();
    MEMORY[0x24566D9B0](v13, -1, -1);
    MEMORY[0x24566D9B0](v12, -1, -1);

    uint64_t v5 = v31;
    uint64_t v4 = v32;
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  int64_t v16 = (char *)MEMORY[0x24566DA50](a1 + 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration;
    uint64_t v19 = *(void *)&v16[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_registration];
    if (v19)
    {
      uint64_t v20 = sub_242790250();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 1, 1, v20);
      id v21 = (void *)swift_allocObject();
      v21[2] = 0;
      v21[3] = 0;
      v21[4] = v19;
      swift_retain();
      sub_242789D5C((uint64_t)v4, (uint64_t)&unk_268D56FD0, (uint64_t)v21);
      swift_release();
      *(void *)&v17[v18] = 0;

      swift_release();
    }
    else
    {
    }
  }
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x24566DA50](v9);
  if (v22)
  {
    id v23 = (char *)v22;
    uint64_t v24 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion;
    uint64_t v25 = *(void *)(v22
                    + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion);
    if (v25)
    {
      id v26 = self;
      swift_unknownObjectRetain();
      id v27 = objc_msgSend(v26, sel_sharedDispatcher);
      id v28 = objc_msgSend(v27, sel_homeManager);

      objc_msgSend(v28, sel__endActiveAssertion_, v25);
      swift_unknownObjectRelease();
    }
    *(void *)&v23[v24] = 0;

    swift_unknownObjectRelease();
  }
  swift_beginAccess();
  uint64_t result = (char *)MEMORY[0x24566DA50](v9);
  if (result)
  {
    *(void *)&result[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_scheduledRegistrationCancelation] = 0;

    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24278C8E4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_24278C928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24278C948, 0, 0);
}

uint64_t sub_24278C948()
{
  *(void *)(v0 + 24) = sub_242790120();
  sub_242790090();
  *(void *)(v0 + 32) = sub_242790080();
  sub_24278EFAC(&qword_268D56D70, 255, MEMORY[0x263F47848]);
  uint64_t v2 = sub_242790210();
  return MEMORY[0x270FA2498](sub_24278CA1C, v2, v1);
}

uint64_t sub_24278CA1C()
{
  swift_release();
  v0[5] = sub_242790110();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24278CAC8;
  uint64_t v2 = v0[2];
  return MEMORY[0x270F3A090](v2);
}

uint64_t sub_24278CAC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24278CBD8()
{
  swift_getObjectType();
  uint64_t v3 = sub_2427903B0();
  sub_2427901D0();
  id v1 = objc_msgSend(v0, sel_description);
  sub_2427901C0();

  sub_2427901D0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t ControlCenterModule.configuration.getter(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  v2[6] = swift_getObjectType();
  uint64_t v3 = sub_242790040();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24278CD40, 0, 0);
}

uint64_t sub_24278CD40()
{
  uint64_t v1 = *(void **)(v0[5] + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController);
  v0[10] = v1;
  if (v1 && (self, uint64_t v2 = swift_dynamicCastObjCClass(), (v0[11] = v2) != 0))
  {
    v0[12] = sub_242790230();
    id v3 = v1;
    v0[13] = sub_242790220();
    uint64_t v5 = sub_242790210();
    return MEMORY[0x270FA2498](sub_24278CE94, v5, v4);
  }
  else
  {
    uint64_t v6 = v0[4];
    uint64_t v7 = sub_2427901A0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_24278CE94()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = (void *)v0[11];
  swift_release();
  v0[14] = objc_msgSend(v2, sel_itemManager);

  return MEMORY[0x270FA2498](sub_24278CF20, 0, 0);
}

uint64_t sub_24278CF20()
{
  id v28 = v0;
  uint64_t v1 = (void *)v0[14];
  sub_242790190();
  uint64_t v2 = swift_dynamicCastClass();
  v0[15] = v2;
  if (v2)
  {
    id v3 = v1;
    v0[16] = sub_242790220();
    uint64_t v5 = sub_242790210();
    return MEMORY[0x270FA2498](sub_24278D27C, v5, v4);
  }
  else
  {
    sub_242790020();
    id v6 = v1;
    uint64_t v7 = sub_242790030();
    os_log_type_t v8 = sub_242790280();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = (void *)v0[14];
    uint64_t v11 = v0[9];
    uint64_t v12 = (void *)v0[10];
    uint64_t v13 = v0[7];
    uint64_t v14 = v0[8];
    if (v9)
    {
      uint64_t v26 = v0[9];
      log = v7;
      uint64_t v15 = swift_slowAlloc();
      id v23 = (void *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v27 = v25;
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v16 = sub_2427903B0();
      v0[2] = sub_24278DB90(v16, v17, &v27);
      sub_2427902F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      v0[3] = v10;
      id v18 = v10;
      sub_2427902F0();
      *id v23 = v10;

      _os_log_impl(&dword_242787000, log, v8, "%s: Failed to unwrap item manager to ControlCenterModuleItemManager: %@", (uint8_t *)v15, 0x16u);
      sub_242789B74(&qword_268D56D98);
      swift_arrayDestroy();
      MEMORY[0x24566D9B0](v23, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24566D9B0](v25, -1, -1);
      MEMORY[0x24566D9B0](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v26, v13);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v13);
    }
    uint64_t v19 = v0[4];
    uint64_t v20 = sub_2427901A0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    swift_task_dealloc();
    id v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
}

uint64_t sub_24278D27C()
{
  swift_release();
  sub_242790180();
  return MEMORY[0x270FA2498](sub_24278D2F0, 0, 0);
}

uint64_t sub_24278D2F0()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = (void *)v0[10];
  uint64_t v3 = v0[4];

  uint64_t v4 = sub_2427901A0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24278D3B0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24278F2E8;
  return ControlCenterModule.configuration.getter(a1);
}

uint64_t sub_24278D448()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24278D488()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24278F2E8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_242789BF0, 0, 0);
}

void sub_24278D530(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (a2 < 0) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_57;
    }
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v8 = a1;
LABEL_18:
    sub_24278D868(v7, v8);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v28 = a1 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  uint64_t v6 = sub_24278F0FC(0, &qword_268D56FE8);
  int64_t v12 = 0;
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = a2 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_46;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v16 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        return;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          return;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            return;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_45:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_46:
    id v19 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v20 = sub_2427902C0();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_53;
    }
    int64_t v30 = v12;
    id v23 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
    char v24 = sub_2427902D0();

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
        char v27 = sub_2427902D0();

        if (v27) {
          goto LABEL_27;
        }
      }
LABEL_53:

      return;
    }
LABEL_27:

    int64_t v12 = v30;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29) {
    return;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_45;
    }
  }
LABEL_56:
  __break(1u);
LABEL_57:
  MEMORY[0x270F9E868](v6, v5);
}

void sub_24278D868(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_242790320()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_6:
    id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v11);
    char v13 = sub_242790350();

    if ((v13 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v4;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v4 = v14 + 1;
  if (v14 + 1 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_24278D9BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int64_t v4 = v2;
  v4[1] = sub_24278DA98;
  return v6(a1);
}

uint64_t sub_24278DA98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24278DB90(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24278DC64(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24278EF4C((uint64_t)v12, *a3);
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
      sub_24278EF4C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24278EEFC((uint64_t)v12);
  return v7;
}

uint64_t sub_24278DC64(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_242790300();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24278DE20(a5, a6);
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
  uint64_t v8 = sub_242790370();
  if (!v8)
  {
    sub_242790380();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2427903A0();
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

uint64_t sub_24278DE20(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24278DEB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24278E098(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24278E098(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24278DEB8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24278E030(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_242790360();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_242790380();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2427901E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2427903A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_242790380();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24278E030(uint64_t a1, uint64_t a2)
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
  sub_242789B74(&qword_268D56FB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24278E098(char a1, int64_t a2, char a3, char *a4)
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
    sub_242789B74(&qword_268D56FB8);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_2427903A0();
  __break(1u);
  return result;
}

uint64_t _s33HomeControlCenterSingleTileModule0bcF0C21contentViewController3forSo011CCUIContentf7ContenthI0_So06UIViewI0CXcSo0kF19PresentationContextCSg_tF_0()
{
  uint64_t v1 = v0;
  v53[1] = *(id *)MEMORY[0x263EF8340];
  swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController;
  unint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController];
  if (v3)
  {
    id v4 = *(id *)&v0[OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController];
LABEL_10:
    id v43 = v3;
    return (uint64_t)v4;
  }
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v7 = objc_allocWithZone(MEMORY[0x263F1C318]);
  int64_t v8 = (void *)sub_2427901B0();
  id v9 = objc_msgSend(v7, sel_initWithName_bundle_, v8, v6);

  if (v9)
  {
    v51 = v9;
    uint64_t v52 = v2;
    id v10 = objc_msgSend(v9, sel_data);
    uint64_t v11 = sub_242790000();
    unint64_t v13 = v12;

    sub_2427901C0();
    int64_t v14 = (void *)sub_24278FFF0();
    unint64_t v15 = (void *)sub_2427901B0();
    swift_bridgeObjectRelease();
    v53[0] = 0;
    id v16 = objc_msgSend(self, sel_packageWithData_type_options_error_, v14, v15, 0, v53);

    if (v16)
    {
      id v17 = v53[0];
      sub_24278F140(v11, v13);
      int64_t v18 = self;
      id v48 = objc_msgSend(v18, sel_previewWithPackage_forGridSize_, v16, 1, 2);
      v50 = v16;
      id v47 = objc_msgSend(v18, sel_previewWithPackage_forGridSize_, v16, 1, 4);
      id v19 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 6, 2, 25.0);
      sub_2427901C0();
      id v20 = objc_allocWithZone(MEMORY[0x263F47B68]);
      id v21 = v19;
      unint64_t v22 = (void *)sub_2427901B0();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v20, sel_initWithSystemImageNamed_configuration_, v22, v21);

      v49 = v21;
      char v24 = self;
      id v25 = objc_msgSend(v24, sel_systemWhiteColor);
      id v26 = (void *)sub_2427901B0();
      id v27 = (id)HULocalizedString();

      if (!v27)
      {
        sub_2427901C0();
        id v27 = (id)sub_2427901B0();
        swift_bridgeObjectRelease();
      }
      id v28 = objc_msgSend(v18, sel_previewWithTemplate_tintColor_title_subtitle_forGridSize_, v23, v25, v27, 0, 2, 2);

      id v29 = objc_msgSend(v24, sel_systemWhiteColor);
      int64_t v30 = (void *)sub_2427901B0();
      id v31 = (id)HULocalizedString();

      if (!v31)
      {
        sub_2427901C0();
        id v31 = (id)sub_2427901B0();
        swift_bridgeObjectRelease();
      }
      id v32 = objc_msgSend(v18, sel_previewWithTemplate_tintColor_title_subtitle_forGridSize_, v23, v29, v31, 0, 2, 4);

      sub_242789B74(&qword_268D56FF0);
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_2427909B0;
      *(void *)(v33 + 32) = v48;
      *(void *)(v33 + 40) = v47;
      *(void *)(v33 + 48) = v28;
      *(void *)(v33 + 56) = v32;
      v53[0] = (id)v33;
      sub_242790200();
      id v34 = objc_allocWithZone(MEMORY[0x263F49B28]);
      sub_2427902B0();
      id v35 = v48;
      id v36 = v47;
      id v37 = v28;
      id v38 = v32;
      v39 = v1;
      v40 = (void *)sub_2427901F0();
      swift_bridgeObjectRelease();
      id v41 = objc_msgSend(v34, sel_initWithDelegate_ofKind_withPreviews_, v39, 1, v40);

      v42 = *(void **)&v1[v52];
      *(void *)&v1[v52] = v41;
      id v4 = v41;

      unint64_t v3 = 0;
      goto LABEL_10;
    }
    id v45 = v53[0];
    v46 = (void *)sub_24278FFB0();

    swift_willThrow();
    sub_24278F140(v11, v13);
  }
  uint64_t result = sub_242790390();
  __break(1u);
  return result;
}

void _s33HomeControlCenterSingleTileModule0bcF0C07controlcF14ViewController_16moduleWillAppearySo09HUControlcfhI0C_SbtF_0()
{
  sub_24278A334();
  uint64_t v1 = OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion;
  if (!*(void *)(v0 + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_homeKitActiveAssertion))
  {
    sub_24278CBD8();
    id v2 = objc_msgSend(self, sel_sharedDispatcher);
    id v3 = objc_msgSend(v2, sel_homeManager);

    if (v3)
    {
      id v4 = (void *)sub_2427901B0();
      swift_bridgeObjectRelease();
      id v5 = objc_msgSend(v3, sel__beginActiveAssertionWithReason_, v4);
    }
    else
    {
      swift_bridgeObjectRelease();
      id v5 = 0;
    }
    *(void *)(v0 + v1) = v5;
    swift_unknownObjectRelease();
  }
  id v6 = objc_msgSend(self, sel_sharedManager);
  objc_msgSend(v6, sel_enterModuleViewWillAppear);
}

uint64_t sub_24278E8F0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24278E938()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24278F2E8;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_24278A948, 0, 0);
}

unint64_t sub_24278E9E4()
{
  unint64_t result = qword_268D56D60;
  if (!qword_268D56D60)
  {
    sub_24278EA40(&qword_268D56D58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D56D60);
  }
  return result;
}

uint64_t sub_24278EA40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24278EA88()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24278EAC0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24278EB20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24278F2E8;
  return sub_24278AB18(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24278EBFC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24278EC34()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24278F2E8;
  return MEMORY[0x270FA2498](sub_24278BD9C, 0, 0);
}

uint64_t type metadata accessor for ControlCenterModule()
{
  return self;
}

uint64_t sub_24278ECFC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24278EDA0;
  return MEMORY[0x270FA2498](sub_24278BD9C, 0, 0);
}

uint64_t sub_24278EDA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24278EE94()
{
  unint64_t result = qword_268D56FB0;
  if (!qword_268D56FB0)
  {
    sub_24278F0FC(255, &qword_268D56FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D56FB0);
  }
  return result;
}

uint64_t sub_24278EEFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24278EF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24278EFAC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_24278EFF4()
{
  return sub_24278C494(v0);
}

uint64_t sub_24278EFFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24278F00C()
{
  return swift_release();
}

uint64_t sub_24278F014()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24278F054()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24278F2E8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24278C948, 0, 0);
}

uint64_t sub_24278F0FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24278F138()
{
  return swift_release();
}

uint64_t sub_24278F140(uint64_t a1, unint64_t a2)
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

uint64_t sub_24278F198(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_242789B74(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24278F1F4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24278F22C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24278EDA0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D56FF8 + dword_268D56FF8);
  return v6(a1, v4);
}

void sub_24278F2EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_242790040();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242790020();
  uint64_t v6 = sub_242790030();
  os_log_type_t v7 = sub_242790290();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_242787000, v6, v7, "Registering for lock state notifications", v8, 2u);
    MEMORY[0x24566D9B0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = (int *)(v1 + 16);
  swift_beginAccess();
  if (*(_DWORD *)(v1 + 16) == -1)
  {
    uint64_t v10 = (const char *)*MEMORY[0x263F55A78];
    sub_24278FBE0();
    uint64_t v11 = sub_2427902A0();
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_24278FC58;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24278F958;
    aBlock[3] = &unk_26F84D318;
    uint64_t v13 = _Block_copy(aBlock);
    swift_release();
    swift_beginAccess();
    notify_register_dispatch(v10, v9, v11, v13);
    swift_endAccess();
    _Block_release(v13);
  }
}

uint64_t sub_24278F540()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_242790040();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 32) = 0;
  swift_unknownObjectWeakAssign();
  sub_242790020();
  uint64_t v6 = sub_242790030();
  os_log_type_t v7 = sub_242790290();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_242787000, v6, v7, "Unregistering lock state notifications", v8, 2u);
    MEMORY[0x24566D9B0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  int v9 = *(_DWORD *)(v1 + 16);
  if (v9 != -1)
  {
    notify_cancel(v9);
    *(_DWORD *)(v1 + 16) = -1;
  }
  sub_24278F704(v1 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LockStateHandler()
{
  return self;
}

uint64_t sub_24278F704(uint64_t a1)
{
  return a1;
}

uint64_t sub_24278F72C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24278F784();
    return swift_release();
  }
  return result;
}

uint64_t sub_24278F784()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_242790040();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v6 = sub_24278FC78();
  sub_242790020();
  os_log_type_t v7 = sub_242790030();
  os_log_type_t v8 = sub_242790290();
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v9 = 67109120;
    uint64_t v12[3] = v6;
    sub_2427902F0();
    _os_log_impl(&dword_242787000, v7, v8, "Access allowed for current lock state is %{BOOL}d, updating delegate", v9, 8u);
    MEMORY[0x24566D9B0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = MEMORY[0x24566DA50](v1 + 24);
  if (result)
  {
    if (*(void *)(result + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController))
    {
      self;
      uint64_t v11 = (void *)swift_dynamicCastObjCClass();
      if (v11) {
        objc_msgSend(v11, sel_setAccessAllowedForCurrentLockState_, v6);
      }
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24278F958(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

BOOL sub_24278F9AC()
{
  uint64_t v0 = sub_242790040();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  BOOL v6 = (char *)v17 - v5;
  sub_242790020();
  os_log_type_t v7 = sub_242790030();
  os_log_type_t v8 = sub_242790290();
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_242787000, v7, v8, "Checking if device is unlocked", v9, 2u);
    MEMORY[0x24566D9B0](v9, -1, -1);
  }

  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v6, v0);
  int v11 = MKBGetDeviceLockState();
  sub_242790020();
  uint64_t v12 = sub_242790030();
  os_log_type_t v13 = sub_242790290();
  if (os_log_type_enabled(v12, v13))
  {
    int64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v14 = 67109120;
    v17[3] = v11;
    sub_2427902F0();
    _os_log_impl(&dword_242787000, v12, v13, "Lock state is %d", v14, 8u);
    MEMORY[0x24566D9B0](v14, -1, -1);
  }

  v10(v4, v0);
  return !v11 || v11 == 3;
}

unint64_t sub_24278FBE0()
{
  unint64_t result = qword_268D57018;
  if (!qword_268D57018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D57018);
  }
  return result;
}

uint64_t sub_24278FC20()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24278FC58()
{
  return sub_24278F72C();
}

uint64_t sub_24278FC60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24278FC70()
{
  return swift_release();
}

BOOL sub_24278FC78()
{
  uint64_t v0 = sub_242790040();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  os_log_type_t v7 = (char *)&v25 - v6;
  MEMORY[0x270FA5388](v5);
  int v9 = (char *)&v25 - v8;
  sub_242790020();
  uint64_t v10 = sub_242790030();
  os_log_type_t v11 = sub_242790290();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_242787000, v10, v11, "Checking if access is allowed for current lock state", v12, 2u);
    MEMORY[0x24566D9B0](v12, -1, -1);
  }

  os_log_type_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v9, v0);
  id v14 = objc_msgSend(self, sel_sharedDispatcher);
  id v15 = objc_msgSend(v14, sel_homeManager);

  if (v15 && (unsigned int v16 = objc_msgSend(v15, sel_isAccessAllowedWhenLocked), v15, v16))
  {
    sub_242790020();
    id v17 = sub_242790030();
    os_log_type_t v18 = sub_242790290();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_242787000, v17, v18, "Home manager doesn't care about lock state, returning YES", v19, 2u);
      MEMORY[0x24566D9B0](v19, -1, -1);
    }

    v13(v7, v0);
    return 1;
  }
  else
  {
    sub_242790020();
    id v21 = sub_242790030();
    os_log_type_t v22 = sub_242790290();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_242787000, v21, v22, "Home manager does care, checking lock state", v23, 2u);
      MEMORY[0x24566D9B0](v23, -1, -1);
    }

    v13(v4, v0);
    return sub_24278F9AC();
  }
}

uint64_t sub_24278FF7C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24278FFB0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24278FFC0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24278FFD0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24278FFE0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24278FFF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_242790000()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_242790010()
{
  return MEMORY[0x270F3AD80]();
}

uint64_t sub_242790020()
{
  return MEMORY[0x270F3C440]();
}

uint64_t sub_242790030()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_242790040()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_242790050()
{
  return MEMORY[0x270F3A000]();
}

uint64_t sub_242790060()
{
  return MEMORY[0x270F3A008]();
}

uint64_t sub_242790070()
{
  return MEMORY[0x270F3A010]();
}

uint64_t sub_242790080()
{
  return MEMORY[0x270F3A048]();
}

uint64_t sub_242790090()
{
  return MEMORY[0x270F3A050]();
}

uint64_t sub_2427900A0()
{
  return MEMORY[0x270F3A058]();
}

uint64_t sub_2427900B0()
{
  return MEMORY[0x270F3A060]();
}

uint64_t sub_2427900C0()
{
  return MEMORY[0x270F3A068]();
}

uint64_t sub_2427900D0()
{
  return MEMORY[0x270F3A078]();
}

uint64_t sub_2427900E0()
{
  return MEMORY[0x270F3A080]();
}

uint64_t sub_242790110()
{
  return MEMORY[0x270F3A098]();
}

uint64_t sub_242790120()
{
  return MEMORY[0x270F3A0A0]();
}

uint64_t sub_242790130()
{
  return MEMORY[0x270F3C448]();
}

uint64_t sub_242790140()
{
  return MEMORY[0x270F3C450]();
}

uint64_t sub_242790150()
{
  return MEMORY[0x270F3C458]();
}

uint64_t sub_242790160()
{
  return MEMORY[0x270F3C460]();
}

uint64_t sub_242790170()
{
  return MEMORY[0x270F3C468]();
}

uint64_t sub_242790180()
{
  return MEMORY[0x270F3C470]();
}

uint64_t sub_242790190()
{
  return MEMORY[0x270F3C478]();
}

uint64_t sub_2427901A0()
{
  return MEMORY[0x270F3C480]();
}

uint64_t sub_2427901B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2427901C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2427901D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2427901E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2427901F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_242790200()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_242790210()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_242790220()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_242790230()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_242790240()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_242790250()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_242790260()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_242790270()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_242790280()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_242790290()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2427902A0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2427902B0()
{
  return MEMORY[0x270F3C4B0]();
}

uint64_t sub_2427902C0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2427902D0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2427902E0()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2427902F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_242790300()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_242790310()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_242790320()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_242790340()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_242790350()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_242790360()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_242790370()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_242790380()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_242790390()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2427903A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2427903B0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HULocalizedString()
{
  return MEMORY[0x270F3C4D0]();
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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