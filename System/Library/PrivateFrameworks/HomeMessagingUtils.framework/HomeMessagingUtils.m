id HomeManager.manager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager);
}

id HomeManager.accessorySettingsDataSource.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_accessorySettingsDataSource);
}

char *HomeManager.__allocating_init(homeDelegate:options:cachePolicy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return HomeManager.init(homeDelegate:options:cachePolicy:)(a1, a2, a3);
}

char *HomeManager.init(homeDelegate:options:cachePolicy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a1;
  uint64_t v22 = sub_21FF21D48();
  uint64_t v4 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FF21D38();
  MEMORY[0x270FA5388]();
  sub_21FF21CA8();
  MEMORY[0x270FA5388]();
  v3[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded] = 0;
  uint64_t v21 = OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue;
  v20[1] = sub_21FF1F3CC(0, &qword_267F02C80);
  id v7 = v3;
  sub_21FF21C98();
  uint64_t v27 = MEMORY[0x263F8EE78];
  sub_21FF1F2F4(&qword_267F02C88, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02C90);
  sub_21FF1F33C(&qword_267F02C98, &qword_267F02C90);
  sub_21FF21DE8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v22);
  *(void *)&v3[v21] = sub_21FF21D68();
  *(void *)&v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers] = MEMORY[0x263F8EE78];
  *(void *)&v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate] = 0;
  id v8 = objc_allocWithZone(MEMORY[0x263F0E5A8]);
  id v9 = objc_msgSend(v8, sel_initWithOptions_cachePolicy_, v23, v24);
  objc_msgSend(v9, sel_setDiscretionary_, 0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  objc_msgSend(v9, sel_setDelegateQueue_, v10);

  objc_msgSend(v9, sel_setAdaptive_, 1);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0E3C0]), sel_initWithConfiguration_, v9);
  *(void *)&v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager] = v11;
  id v12 = objc_msgSend(v11, sel_createAccessorySettingsDataSource);
  *(void *)&v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_accessorySettingsDataSource] = v12;

  v13 = (objc_class *)type metadata accessor for HomeManager();
  v26.receiver = v7;
  v26.super_class = v13;
  v14 = (char *)objc_msgSendSuper2(&v26, sel_init);
  *(void *)&v14[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate] = v25;
  v15 = v14;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v16 = *(void **)&v15[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager];
  v17 = v15;
  id v18 = v16;
  objc_msgSend(v18, sel_setDelegate_, v17);

  swift_unknownObjectRelease();
  return v17;
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

uint64_t type metadata accessor for HomeManager()
{
  return self;
}

id HomeManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *HomeManager.init()()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for HomeManager());
  id v1 = HomeManager.init(homeDelegate:options:cachePolicy:)(0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v1;
}

uint64_t sub_21FF1E5BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21FF21C88();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21FF21CA8();
  uint64_t v10 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388]();
  id v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *(void *)(v3 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_21FF1F2D0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21FF1EA20;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_21FF21C98();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_21FF1F2F4(&qword_267F02CB0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02CB8);
  sub_21FF1F33C(&qword_267F02CC0, &qword_267F02CB8);
  sub_21FF21DE8();
  MEMORY[0x223C61600](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v18);
  swift_release();
  return swift_release();
}

void sub_21FF1E8B4(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x223C61C70](v5);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    if (*(unsigned char *)(v6 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded))
    {
      a2();
    }
    else
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = a2;
      *(void *)(v8 + 24) = a3;
      id v9 = &v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers];
      swift_beginAccess();
      uint64_t v10 = *(void **)v9;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)id v9 = v10;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v10 = sub_21FF1F5E0(0, v10[2] + 1, 1, v10);
        *(void *)id v9 = v10;
      }
      unint64_t v13 = v10[2];
      unint64_t v12 = v10[3];
      if (v13 >= v12 >> 1)
      {
        uint64_t v10 = sub_21FF1F5E0((void *)(v12 > 1), v13 + 1, 1, v10);
        *(void *)id v9 = v10;
      }
      v10[2] = v13 + 1;
      v14 = &v10[2 * v13];
      v14[4] = sub_21FF1F5B8;
      v14[5] = v8;
      swift_endAccess();
    }
  }
  else
  {
    a2();
  }
}

uint64_t sub_21FF1EA20(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21FF1EA64()
{
  id v0 = dispatch_group_create();
  dispatch_group_enter(v0);
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  uint64_t v2 = v0;
  sub_21FF1E5BC((uint64_t)sub_21FF1F3C4, v1);
  swift_release();
  sub_21FF21D28();
}

uint64_t sub_21FF1EB00()
{
  uint64_t v1 = v0;
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = v2;
  sub_21FF1E5BC((uint64_t)sub_21FF1F804, v3);
  swift_release();
  sub_21FF21D28();

  id v5 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_homes));
  sub_21FF1F3CC(0, (unint64_t *)&unk_267F02CC8);
  uint64_t v6 = sub_21FF21CF8();

  return v6;
}

id sub_21FF1EBE0()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_currentHome);
  return v1;
}

id sub_21FF1EC20()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_currentAccessory);
  return v1;
}

id HomeManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HomeManager.homeManagerDidUpdateHomes(_:)(HMHomeManager a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21FF21C88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21FF21CA8();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v12 = (HMHomeManager *)swift_allocObject();
  v12[2].super.isa = (Class)v11;
  v12[3].super.isa = a1.super.isa;
  aBlock[4] = sub_21FF1F448;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21FF1EA20;
  aBlock[3] = &block_descriptor_17;
  unint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = a1.super.isa;
  sub_21FF21C98();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_21FF1F2F4(&qword_267F02CB0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02CB8);
  sub_21FF1F33C(&qword_267F02CC0, &qword_267F02CB8);
  sub_21FF21DE8();
  MEMORY[0x223C61600](0, v10, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  swift_release();
}

uint64_t sub_21FF1EFFC(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C61C70](v3);
  if (!result) {
    return result;
  }
  uint64_t v5 = (unsigned char *)result;
  id v6 = objc_msgSend(a2, sel_homes);
  sub_21FF1F3CC(0, (unint64_t *)&unk_267F02CC8);
  unint64_t v7 = sub_21FF21CF8();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_21FF21E38();
    uint64_t v8 = result;
    if (result) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_4:
      if (v8 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = 0;
      uint64_t v10 = OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate;
      do
      {
        if ((v7 & 0xC000000000000001) != 0) {
          id v11 = (id)MEMORY[0x223C616B0](v9, v7);
        }
        else {
          id v11 = *(id *)(v7 + 8 * v9 + 32);
        }
        unint64_t v12 = v11;
        ++v9;
        objc_msgSend(v11, sel_setDelegate_, *(void *)&v5[v10]);
      }
      while (v8 != v9);
    }
  }
  swift_bridgeObjectRelease_n();
  v5[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded] = 1;
  unint64_t v13 = &v5[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers];
  swift_beginAccess();
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *(void *)(*(void *)v13 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = v14 + 40;
    do
    {
      uint64_t v17 = *(void (**)(uint64_t))(v16 - 8);
      uint64_t v18 = swift_retain();
      v17(v18);
      swift_release();
      v16 += 16;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  *(void *)unint64_t v13 = MEMORY[0x263F8EE78];

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FF1F258()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21FF1F290()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21FF1F2D0()
{
  sub_21FF1E8B4(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32));
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

uint64_t sub_21FF1F2F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21FF1F33C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21FF1F38C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21FF1F3C4()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_21FF1F3CC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FF1F408()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21FF1F448()
{
  return sub_21FF1EFFC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t method lookup function for HomeManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeManager);
}

uint64_t dispatch thunk of HomeManager.__allocating_init(homeDelegate:options:cachePolicy:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of HomeManager.loadHomes(completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HomeManager.waitForHomesToLoad()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HomeManager.homes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HomeManager.currentHome.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HomeManager.currentAccessory.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t sub_21FF1F580()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21FF1F5B8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *sub_21FF1F5E0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F02D38);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21FF1F6F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21FF1F6F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F02D40);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21FF21E48();
  __break(1u);
  return result;
}

uint64_t sub_21FF1F810()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
  type metadata accessor for ContactStore();
  uint64_t v1 = swift_allocObject();
  sub_21FF21C38();
  *(void *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate + 8) = 0;
  uint64_t result = swift_unknownObjectWeakInit();
  *(void *)(v1 + 16) = v0;
  qword_267F02D50 = v1;
  return result;
}

uint64_t ContactStore.__allocating_init()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 160);
  return v2(v1);
}

uint64_t static ContactStore.sharedContactStore.getter()
{
  if (qword_267F02A10 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_21FF1F97C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  sub_21FF1F9F4();
  return swift_unknownObjectRelease();
}

uint64_t sub_21FF1F9F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02DA8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21FF21DB8();
  uint64_t v32 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21FF21D78();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02DB0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(void *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    uint64_t v15 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
    swift_retain();
    sub_21FF21C58();
    swift_release();
    uint64_t v14 = v15;
    uint64_t v1 = v0;
  }
  *(void *)(v1 + v14) = 0;
  uint64_t v16 = v14;
  swift_release();
  uint64_t v17 = v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x223C61C70](v17);
  uint64_t result = swift_unknownObjectRelease();
  if (v18)
  {
    id v20 = objc_msgSend(self, sel_defaultCenter);
    v30 = v9;
    sub_21FF21D88();

    uint64_t v31 = v16;
    uint64_t v21 = v6;
    sub_21FF21DA8();
    id v35 = objc_msgSend(self, sel_mainRunLoop);
    uint64_t v22 = sub_21FF21D98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v3, 1, 1, v22);
    sub_21FF1F3CC(0, &qword_267F02DB8);
    sub_21FF21A5C();
    uint64_t v23 = v32;
    uint64_t v29 = v10;
    sub_21FF21AB4();
    uint64_t v24 = v1;
    uint64_t v25 = v34;
    objc_super v26 = v30;
    sub_21FF21C68();
    sub_21FF21B1C((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v4);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v25);
    swift_allocObject();
    swift_weakInit();
    sub_21FF21BBC();
    uint64_t v27 = v29;
    uint64_t v28 = sub_21FF21C78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v27);
    *(void *)(v24 + v31) = v28;
    return swift_release();
  }
  return result;
}

uint64_t sub_21FF1FE5C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
    swift_beginAccess();
    if (MEMORY[0x223C61C70](v2))
    {
      uint64_t v3 = *(void *)(v2 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(v1, ObjectType, v3);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_21FF1FF24()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  return MEMORY[0x223C61C70](v1);
}

uint64_t sub_21FF1FF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  sub_21FF1F9F4();
  return swift_unknownObjectRelease();
}

void (*sub_21FF1FFE4(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x223C61C70](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_21FF2006C;
}

void sub_21FF2006C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
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
    sub_21FF1F9F4();
  }
  free(v3);
}

uint64_t ContactStore.__allocating_init(contactStore:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ContactStore.init(contactStore:)(a1);
  return v2;
}

uint64_t ContactStore.init(contactStore:)(uint64_t a1)
{
  sub_21FF21C38();
  *(void *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t ContactStore.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(void *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    swift_retain();
    sub_21FF21C58();
    swift_release();
  }
  *(void *)(v0 + v2) = 0;
  swift_release();

  uint64_t v3 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_logger;
  uint64_t v4 = sub_21FF21C48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_21FF20294(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate);
  return v1;
}

uint64_t sub_21FF20294(uint64_t a1)
{
  return a1;
}

uint64_t ContactStore.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(void *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    swift_retain();
    sub_21FF21C58();
    swift_release();
  }
  *(void *)(v0 + v2) = 0;
  swift_release();

  uint64_t v3 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_logger;
  uint64_t v4 = sub_21FF21C48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_21FF20294(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate);
  uint64_t v5 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x270FA0228](v1, v5, v6);
}

CNContact_optional __swiftcall ContactStore.contact(forPhoneNumber:keys:)(Swift::String forPhoneNumber, Swift::OpaquePointer keys)
{
  object = forPhoneNumber._object;
  uint64_t countAndFlagsBits = forPhoneNumber._countAndFlagsBits;
  v29[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = objc_allocWithZone(MEMORY[0x263EFEB28]);
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_21FF21CB8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithStringValue_, v6);

  id v8 = objc_msgSend(self, sel_predicateForContactsMatchingPhoneNumber_, v7);
  uint64_t v9 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02D68);
  uint64_t v10 = (void *)sub_21FF21CE8();
  v29[0] = 0;
  id v11 = objc_msgSend(v9, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v8, v10, v29);

  id v12 = v29[0];
  if (v11)
  {
    sub_21FF1F3CC(0, &qword_267F02D70);
    unint64_t v13 = sub_21FF21CF8();
    id v14 = v12;

    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_21FF21E38();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v15)
      {
LABEL_4:
        if ((v13 & 0xC000000000000001) != 0)
        {
          id v16 = (id)MEMORY[0x223C616B0](0, v13);
        }
        else
        {
          if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            __break(1u);
          }
          id v16 = *(id *)(v13 + 32);
        }
        uint64_t v15 = (uint64_t)v16;
      }
    }

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  id v18 = v29[0];
  uint64_t v19 = (void *)sub_21FF21C18();

  swift_willThrow();
  swift_bridgeObjectRetain();
  id v20 = v19;
  swift_bridgeObjectRetain();
  id v21 = v19;
  uint64_t v22 = sub_21FF21C28();
  os_log_type_t v23 = sub_21FF21D18();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    v29[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    swift_bridgeObjectRetain();
    sub_21FF21090(countAndFlagsBits, (unint64_t)object, (uint64_t *)v29);
    sub_21FF21DC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v26 = sub_21FF21E58();
    sub_21FF21090(v26, v27, (uint64_t *)v29);
    sub_21FF21DC8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21FF18000, v22, v23, "Failed to find contact with phone number %s %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C61C10](v25, -1, -1);
    MEMORY[0x223C61C10](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v15 = 0;
LABEL_13:
  uint64_t v28 = (objc_class *)v15;
  result.value.super.isa = v28;
  result.is_nil = v17;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(forEmailAddress:keys:)(Swift::String forEmailAddress, Swift::OpaquePointer keys)
{
  object = forEmailAddress._object;
  uint64_t countAndFlagsBits = forEmailAddress._countAndFlagsBits;
  v28[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = self;
  uint64_t v6 = (void *)sub_21FF21CB8();
  id v7 = objc_msgSend(v5, sel_predicateForContactsMatchingEmailAddress_, v6);

  id v8 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02D68);
  uint64_t v9 = (void *)sub_21FF21CE8();
  v28[0] = 0;
  id v10 = objc_msgSend(v8, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v7, v9, v28);

  id v11 = v28[0];
  if (v10)
  {
    sub_21FF1F3CC(0, &qword_267F02D70);
    unint64_t v12 = sub_21FF21CF8();
    id v13 = v11;

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_21FF21E38();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v14)
      {
LABEL_4:
        if ((v12 & 0xC000000000000001) != 0)
        {
          id v15 = (id)MEMORY[0x223C616B0](0, v12);
        }
        else
        {
          if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            __break(1u);
          }
          id v15 = *(id *)(v12 + 32);
        }
        uint64_t v14 = (uint64_t)v15;
      }
    }
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  id v17 = v28[0];
  id v18 = (void *)sub_21FF21C18();

  swift_willThrow();
  swift_bridgeObjectRetain();
  id v19 = v18;
  swift_bridgeObjectRetain();
  id v20 = v18;
  id v21 = sub_21FF21C28();
  os_log_type_t v22 = sub_21FF21D18();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    v28[0] = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    swift_bridgeObjectRetain();
    sub_21FF21090(countAndFlagsBits, (unint64_t)object, (uint64_t *)v28);
    sub_21FF21DC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v25 = sub_21FF21E58();
    sub_21FF21090(v25, v26, (uint64_t *)v28);
    sub_21FF21DC8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21FF18000, v21, v22, "Failed to find contact with email address %s %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C61C10](v24, -1, -1);
    MEMORY[0x223C61C10](v23, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = 0;
LABEL_13:
  unint64_t v27 = (objc_class *)v14;
  result.value.super.isa = v27;
  result.is_nil = v16;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(for:keys:)(Swift::String a1, Swift::OpaquePointer_optional keys)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (keys.value._rawValue) {
    v4._rawValue = keys.value._rawValue;
  }
  else {
    v4._rawValue = (void *)sub_21FF216E8();
  }
  swift_bridgeObjectRetain();
  id v5 = (void *)sub_21FF21CB8();
  unsigned int v6 = objc_msgSend(v5, sel_hmu_isEmail);

  uint64_t v7 = countAndFlagsBits;
  id v8 = object;
  if (v6)
  {
    unint64_t v9 = (unint64_t)ContactStore.contact(forEmailAddress:keys:)(*(Swift::String *)&v7, v4);
    goto LABEL_8;
  }
  id v10 = (void *)sub_21FF21CB8();
  unsigned int v11 = objc_msgSend(v10, sel_hmu_isPhoneNumber);

  if (v11)
  {
    v12._uint64_t countAndFlagsBits = countAndFlagsBits;
    v12._object = object;
    unint64_t v9 = (unint64_t)ContactStore.contact(forPhoneNumber:keys:)(v12, v4);
LABEL_8:
    id v13 = (objc_class *)v9;
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  id v15 = sub_21FF21C28();
  int v16 = sub_21FF21D18();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)id v17 = 136315138;
    swift_bridgeObjectRetain();
    sub_21FF21090(countAndFlagsBits, (unint64_t)object, &v24);
    sub_21FF21DC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FF18000, v15, (os_log_type_t)v16, "HMUser userID invalid %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C61C10](v18, -1, -1);
    MEMORY[0x223C61C10](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_14:
  swift_bridgeObjectRetain_n();
  id v19 = sub_21FF21C28();
  os_log_type_t v20 = sub_21FF21D18();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    sub_21FF21090(countAndFlagsBits, (unint64_t)object, &v24);
    sub_21FF21DC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21FF18000, v19, v20, "No contact found for userID %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C61C10](v22, -1, -1);
    MEMORY[0x223C61C10](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v13 = 0;
LABEL_18:
  uint64_t v23 = v13;
  result.value.super.isa = v23;
  result.is_nil = v14;
  return result;
}

Swift::String __swiftcall ContactStore.name(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA20]), sel_init);
  objc_msgSend(v3, sel_setStyle_, 1000);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F02D78);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21FF22980;
  *(void *)(v4 + 32) = objc_msgSend(self, sel_descriptorForRequiredKeysForStyle_, objc_msgSend(v3, sel_style));
  sub_21FF21D08();
  v5._uint64_t countAndFlagsBits = countAndFlagsBits;
  v5._object = object;
  v13.value._rawValue = (void *)v4;
  unsigned int v6 = (void *)ContactStore.contact(for:keys:)(v5, v13);
  swift_bridgeObjectRelease();
  if (v6)
  {
    id v7 = objc_msgSend(v3, sel_stringFromContact_, v6);
    if (v7)
    {
      id v8 = v7;
      uint64_t countAndFlagsBits = sub_21FF21CC8();
      object = v9;
    }
    else
    {

      swift_bridgeObjectRetain();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v10 = countAndFlagsBits;
  unsigned int v11 = object;
  result._object = v11;
  result._uint64_t countAndFlagsBits = v10;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(forUser:)(HMUser forUser)
{
  uint64_t v1 = (objc_class *)[(objc_class *)forUser.super.isa userID];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = sub_21FF21CC8();
    unsigned int v6 = v5;

    v7._uint64_t countAndFlagsBits = v4;
    v7._object = v6;
    v10.value._rawValue = 0;
    unint64_t v8 = (unint64_t)ContactStore.contact(for:keys:)(v7, v10);
    swift_bridgeObjectRelease();
    uint64_t v1 = (objc_class *)v8;
  }
  result.value.super.isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t sub_21FF21090(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21FF21164(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21FF21A00((uint64_t)v12, *a3);
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
      sub_21FF21A00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21FF21164(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21FF21DD8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21FF21320(a5, a6);
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
  uint64_t v8 = sub_21FF21E18();
  if (!v8)
  {
    sub_21FF21E28();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21FF21E48();
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

uint64_t sub_21FF21320(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21FF213B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21FF21598(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21FF21598(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21FF213B8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21FF21530(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21FF21DF8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21FF21E28();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21FF21CD8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21FF21E48();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21FF21E28();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21FF21530(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02DA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21FF21598(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F02DA0);
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
  Swift::OpaquePointer_optional v13 = a4 + 32;
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
  uint64_t result = sub_21FF21E48();
  __break(1u);
  return result;
}

uint64_t sub_21FF216E8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F02D78);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21FF22990;
  uint64_t v1 = (void *)*MEMORY[0x263EFE050];
  uint64_t v2 = (void *)*MEMORY[0x263EFDFC8];
  *(void *)(v0 + 32) = *MEMORY[0x263EFE050];
  *(void *)(v0 + 40) = v2;
  unint64_t v3 = (void *)*MEMORY[0x263EFDFB8];
  unint64_t v4 = (void *)*MEMORY[0x263EFDFF8];
  *(void *)(v0 + 48) = *MEMORY[0x263EFDFB8];
  *(void *)(v0 + 56) = v4;
  uint64_t v10 = v0;
  sub_21FF21D08();
  id v5 = v1;
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  return v10;
}

uint64_t sub_21FF2179C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C61C70](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t dispatch thunk of ContactsStoreDelegate.contactsStoreContactsDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_21FF21810()
{
  return type metadata accessor for ContactStore();
}

uint64_t type metadata accessor for ContactStore()
{
  uint64_t result = qword_267F02D88;
  if (!qword_267F02D88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21FF21864()
{
  uint64_t result = sub_21FF21C48();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ContactStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactStore);
}

uint64_t dispatch thunk of ContactStore.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ContactStore.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ContactStore.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ContactStore.__allocating_init(contactStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
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

uint64_t sub_21FF21A00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21FF21A5C()
{
  unint64_t result = qword_267F02DC0;
  if (!qword_267F02DC0)
  {
    sub_21FF21D78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02DC0);
  }
  return result;
}

unint64_t sub_21FF21AB4()
{
  unint64_t result = qword_267F02DC8;
  if (!qword_267F02DC8)
  {
    sub_21FF1F3CC(255, &qword_267F02DB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02DC8);
  }
  return result;
}

uint64_t sub_21FF21B1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02DA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FF21B7C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21FF21BB4()
{
  return sub_21FF1FE5C();
}

unint64_t sub_21FF21BBC()
{
  unint64_t result = qword_267F02DD0;
  if (!qword_267F02DD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F02DB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02DD0);
  }
  return result;
}

uint64_t sub_21FF21C18()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21FF21C28()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21FF21C38()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21FF21C48()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21FF21C58()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_21FF21C68()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_21FF21C78()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_21FF21C88()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21FF21C98()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21FF21CA8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21FF21CB8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FF21CC8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21FF21CD8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21FF21CE8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21FF21CF8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21FF21D08()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21FF21D18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21FF21D28()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_21FF21D38()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21FF21D48()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21FF21D58()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21FF21D68()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21FF21D78()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_21FF21D88()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_21FF21D98()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_21FF21DA8()
{
  return MEMORY[0x270EF2338]();
}

uint64_t sub_21FF21DB8()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_21FF21DC8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21FF21DD8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21FF21DE8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21FF21DF8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21FF21E08()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21FF21E18()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21FF21E28()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21FF21E38()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21FF21E48()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21FF21E58()
{
  return MEMORY[0x270EF2680]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x270F3C958]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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