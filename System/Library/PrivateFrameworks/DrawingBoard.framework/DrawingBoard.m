unint64_t sub_24CF8DA1C(uint64_t a1)
{
  return sub_24CF8DA3C(a1, &qword_2698489A0, (uint64_t (*)(id))sub_24CFC3124);
}

unint64_t sub_24CF8DA3C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(id))
{
  if (!*(void *)(a1 + 16))
  {
    v5 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = (void *)sub_24CFD3808();
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  v7 = (void **)(a1 + 40);
  while (1)
  {
    v8 = *v7;
    id v9 = *(v7 - 1);
    id v10 = v8;
    unint64_t result = a3(v9);
    if (v12) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = 8 * result;
    *(void *)(v5[6] + v13) = v9;
    *(void *)(v5[7] + v13) = v10;
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v7 += 2;
    if (!--v6)
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

unint64_t sub_24CF8DB54(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698489A8);
  v2 = (void *)sub_24CFD3808();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (long long *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 4);
    uint64_t v6 = *((void *)v4 - 3);
    long long v17 = *v4;
    long long v18 = *(v4 - 1);
    long long v15 = v4[2];
    long long v16 = v4[1];
    long long v14 = v4[3];
    uint64_t v7 = *((void *)v4 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    unint64_t result = sub_24CFC3064(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    uint64_t v10 = v2[7] + 96 * result;
    *(void *)uint64_t v10 = v6;
    *(_OWORD *)(v10 + 8) = v18;
    *(_OWORD *)(v10 + 24) = v17;
    *(_OWORD *)(v10 + 40) = v16;
    *(_OWORD *)(v10 + 56) = v15;
    *(_OWORD *)(v10 + 72) = v14;
    *(void *)(v10 + 88) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 = (long long *)((char *)v4 + 104);
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

uint64_t SceneWorkspace.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_24CF8DDCC(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_24CF8DE78((uint64_t)v7);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v4 = 0;
    return v4 & 1;
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier) == *(void *)&v6[OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier]
    && *(void *)(v1 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier + 8) == *(void *)&v6[OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier + 8])
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_24CFD38A8();
  }
  return v4 & 1;
}

uint64_t sub_24CF8DDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698488B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_24CF8DE78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698488B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SceneWorkspace.description.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

char *SceneWorkspace.__allocating_init(workspace:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SceneWorkspace.init(workspace:)(a1);
}

char *SceneWorkspace.init(workspace:)(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_sceneFutureMap;
  uint64_t v6 = v2;
  *(void *)&v2[v5] = sub_24CF8DA3C(MEMORY[0x263F8EE78], &qword_269848A18, (uint64_t (*)(id))sub_24CFC30D4);
  *(void *)&v6[OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace] = a1;
  id v7 = a1;
  id v8 = objc_msgSend(v7, sel_identifier);
  uint64_t v9 = sub_24CFD33A8();
  uint64_t v11 = v10;

  BOOL v12 = (uint64_t *)&v6[OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_identifier];
  *BOOL v12 = v9;
  v12[1] = v11;

  v18.receiver = v6;
  v18.super_class = ObjectType;
  uint64_t v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  long long v14 = *(void **)&v13[OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace];
  long long v15 = v13;
  id v16 = v14;
  objc_msgSend(v16, sel_addObserver_, v15);

  return v15;
}

id SceneWorkspace.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SceneWorkspace.init()()
{
}

id SceneWorkspace.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void SceneWorkspace.workspace(_:didAdd:)(uint64_t a1, void *a2)
{
}

void SceneWorkspace.workspace(_:willRemove:)(uint64_t a1, void *a2)
{
}

void sub_24CF8E318(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(id))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  a6(v11);
  swift_release();
}

void sub_24CF8E414(uint64_t a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = *(id *)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken);
  swift_release();
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_sceneFutureMap);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = v3;
  id v7 = sub_24CFCACFC(v6, v5);
  swift_endAccess();

  if (!v7)
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v7 = objc_msgSend(self, sel_weakObjectsHashTable);
    swift_release();
  }
  objc_msgSend(v7, sel_addObject_, a1);
  swift_beginAccess();
  id v8 = v6;
  id v9 = v7;
  sub_24CFCC02C((uint64_t)v9, (uint64_t)v8);
  swift_endAccess();
  swift_release();
}

uint64_t sub_24CF8E63C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t isEscapingClosureAtFileLocation = *(void *)(v5 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace);
  id v11 = (void *)sub_24CFD3398();
  id v12 = objc_msgSend((id)isEscapingClosureAtFileLocation, sel_sceneWithIdentifier_, v11);

  if (!v12)
  {
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = a1;
    v13[3] = a2;
    v13[4] = a3;
    v13[5] = a4;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_24CF8F3B8;
    *(void *)(v14 + 24) = v13;
    v27 = sub_24CF8F3D4;
    uint64_t v28 = v14;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v24 = 1107296256;
    v25 = sub_24CF8EB00;
    v26 = &block_descriptor;
    long long v15 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    id v16 = a3;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    id v17 = objc_msgSend((id)isEscapingClosureAtFileLocation, sel_createScene_, v15);
    _Block_release(v15);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      a5(v17);
      swift_release();
      swift_release();
      return (uint64_t)v17;
    }
    __break(1u);
  }
  v19 = (void *)sub_24CFD3398();
  id v20 = objc_msgSend((id)isEscapingClosureAtFileLocation, sel_sceneWithIdentifier_, v19);

  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t aBlock = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_24CFD36C8();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000017;
  unint64_t v24 = 0x800000024CFD81A0;
  sub_24CFD33F8();
  sub_24CFD33F8();
  if (!v20) {
    __break(1u);
  }
  id v21 = objc_msgSend(v20, sel_description);
  sub_24CFD33A8();

  sub_24CFD33F8();
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t result = sub_24CFD37B8();
  __break(1u);
  return result;
}

uint64_t sub_24CF8E9FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = (void *)sub_24CFD3398();
  objc_msgSend(a1, sel_setIdentifier_, v8);

  objc_msgSend(a1, sel_setSpecification_, a4);
  objc_msgSend(a1, sel_setClientIdentity_, a5);
  return swift_release();
}

uint64_t sub_24CF8EB00(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

BOOL sub_24CF8EB54(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_24CF8EB68(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_24CF8EB74@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24CF8EB84(void *a1)
{
  uint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_msgSend(a1, sel_identityToken);
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_sceneFutureMap);
  swift_beginAccess();
  id v6 = sub_24CFCACFC(v4, *v5);

  if (!v6)
  {
    swift_endAccess();
LABEL_17:
    swift_release();
    return;
  }
  swift_endAccess();
  id v7 = objc_msgSend(v6, sel_allObjects);
  type metadata accessor for SceneFuture();
  unint64_t v8 = sub_24CFD3438();

  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_6;
    }
LABEL_16:

    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24CFD37C8();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_16;
  }
LABEL_6:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v14 = v8 & 0xC000000000000001;
    uint64_t v15 = v9;
    unint64_t v16 = v8;
    do
    {
      if (v14) {
        id v11 = (id)MEMORY[0x253319E30](v10, v8);
      }
      else {
        id v11 = *(id *)(v8 + 8 * v10 + 32);
      }
      id v12 = v11;
      id v13 = a1;
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v10;
      swift_getKeyPath();
      MEMORY[0x270FA5388]();
      sub_24CF8F438();
      sub_24CFD2EC8();

      swift_release();
      swift_release();

      unint64_t v8 = v16;
    }
    while (v15 != v10);
    goto LABEL_16;
  }
  __break(1u);
}

void sub_24CF8EE90(void *a1)
{
  uint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_msgSend(a1, sel_identityToken);
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_sceneFutureMap);
  swift_beginAccess();
  id v6 = sub_24CFCACFC(v4, *v5);

  if (!v6)
  {
    swift_endAccess();
LABEL_17:
    swift_release();
    return;
  }
  swift_endAccess();
  id v13 = v6;
  id v7 = objc_msgSend(v6, sel_allObjects);
  type metadata accessor for SceneFuture();
  unint64_t v8 = sub_24CFD3438();

  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_6;
    }
LABEL_16:

    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24CFD37C8();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_16;
  }
LABEL_6:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v14 = v8 & 0xC000000000000001;
    unint64_t v15 = v8;
    do
    {
      if (v14) {
        id v11 = (id)MEMORY[0x253319E30](v10, v8);
      }
      else {
        id v11 = *(id *)(v8 + 8 * v10 + 32);
      }
      id v12 = v11;
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v10;
      swift_getKeyPath();
      MEMORY[0x270FA5388]();
      sub_24CF8F438();
      sub_24CFD2EC8();

      swift_release();
      swift_release();
      unint64_t v8 = v15;
    }
    while (v9 != v10);
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t type metadata accessor for SceneWorkspace()
{
  return self;
}

uint64_t method lookup function for SceneWorkspace(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneWorkspace);
}

uint64_t dispatch thunk of SceneWorkspace.__allocating_init(workspace:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
}

void type metadata accessor for FBSSceneInterruptionPolicy(uint64_t a1)
{
}

void type metadata accessor for BSInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for UISSystemReferenceAngleMode(uint64_t a1)
{
}

void type metadata accessor for ReferenceDisplayModeStatus(uint64_t a1)
{
}

void type metadata accessor for UIAccessibilityContrast(uint64_t a1)
{
}

void type metadata accessor for BSDeviceOrientation(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for _UIApplicationStatusBarPart(uint64_t a1)
{
}

uint64_t _s5EventOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24CF8F2D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CF8F2F4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
}

void type metadata accessor for UIApplicationSceneDeactivationReasonMask(uint64_t a1)
{
}

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
}

uint64_t sub_24CF8F370()
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CF8F3B8(void *a1)
{
  return sub_24CF8E9FC(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24CF8F3C4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF8F3D4()
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

void sub_24CF8F41C()
{
  sub_24CFCD544(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_24CF8F438()
{
  unint64_t result = qword_269848A10;
  if (!qword_269848A10)
  {
    type metadata accessor for SceneFuture();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848A10);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24CF8F49C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CF8F4BC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_24CF8F50C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_24CF8F56C()
{
}

uint64_t sub_24CF8F58C()
{
  uint64_t v0 = sub_24CFD35D8();
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (!v1) {
    goto LABEL_11;
  }
  uint64_t v2 = sub_24CFD35D8();
  if (!swift_isClassType()) {
    uint64_t v2 = 0;
  }
  if (v2)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    LODWORD(result) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
    if (v2 == v1) {
      return 0;
    }
    else {
      return result;
    }
  }
  else
  {
LABEL_11:
    swift_retain();
    sub_24CFD36C8();
    sub_24CFD33F8();
    sub_24CFD35F8();
    sub_24CFD3758();
    uint64_t result = sub_24CFD37B8();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CF8F7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

id sub_24CF8F844()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CF8F8C8()
{
  return type metadata accessor for SceneObserver();
}

uint64_t type metadata accessor for SceneObserver()
{
  uint64_t result = qword_269848B68;
  if (!qword_269848B68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CF8F91C()
{
  sub_24CF8F9B8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24CF8F9B8()
{
  if (!qword_269848B78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848B80);
    unint64_t v0 = sub_24CFD3588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269848B78);
    }
  }
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

uint64_t sub_24CF8FA5C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v1 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
  {
    sub_24CF92868((uint64_t)v4, &qword_269848BA0);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  else
  {
    id v10 = objc_msgSend(a1, sel_contentState);
    v13[1] = 0;
    v13[2] = 0;
    v13[0] = v10;
    char v14 = 0;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  sub_24CF92868((uint64_t)v6, &qword_269848BA8);
  return swift_release();
}

void sub_24CF8FEE0(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = a3;
  id v9 = a1;
  a5();
  swift_release();
}

void sub_24CF8FFE8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, char a6)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a1;
  sub_24CF91C80(v12, a5, a6);
  swift_release();
}

uint64_t sub_24CF90300(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v4 = a2(a1);
  swift_release();
  return v4 & 1;
}

uint64_t sub_24CF903B4@<X0>(unsigned char *a1@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t result = swift_release();
  *a1 = 0;
  return result;
}

id sub_24CF90580(id result, void *a2, void *a3, char a4)
{
  switch(a4)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_4;
    case 6:
      id v7 = result;
      id v5 = a3;
      id v6 = v7;
      uint64_t result = a2;
LABEL_4:
      uint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

void _s5EventOwxx(uint64_t a1)
{
}

void sub_24CF90640(void *a1, void *a2, void *a3, char a4)
{
  switch(a4)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_4;
    case 6:

      a1 = a3;
LABEL_4:

      break;
    default:
      return;
  }
}

uint64_t _s5EventOwcp(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24CF90580(*(id *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t _s5EventOwca(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24CF90580(*(id *)a2, v4, v5, v6);
  id v7 = *(void **)a1;
  id v8 = *(void **)(a1 + 8);
  id v9 = *(void **)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24CF90640(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s5EventOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  id v5 = *(void **)a1;
  id v7 = *(void **)(a1 + 8);
  char v6 = *(void **)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24CF90640(v5, v7, v6, v8);
  return a1;
}

uint64_t _s5EventOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s5EventOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CF908B8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 6u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_24CF908D4(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 7;
  if (a2 >= 7)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 7;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *_s5EventOMa()
{
  return &_s5EventON;
}

uint64_t sub_24CF90900(void *a1, uint64_t a2)
{
  uint64_t isEscapingClosureAtFileLocation = (uint64_t)v2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v2, sel_isActive))
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    a2 = swift_allocObject();
    *(void *)(a2 + 16) = sub_24CF90FE4;
    *(void *)(a2 + 24) = v6;
    unint64_t v16 = sub_24CF90FFC;
    uint64_t v17 = a2;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 1107296256;
    char v14 = sub_24CF90CB4;
    unint64_t v15 = &block_descriptor_16;
    a1 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_performUpdate_, a1);
    _Block_release(a1);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24CF90FA4;
  *(void *)(v9 + 24) = v8;
  unint64_t v16 = sub_24CF8F3D4;
  uint64_t v17 = v9;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  char v14 = sub_24CF90E04;
  unint64_t v15 = &block_descriptor_0;
  char v10 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  objc_msgSend((id)isEscapingClosureAtFileLocation, sel_updateSettingsWithBlock_, v10);
  _Block_release(v10);
  char v11 = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v11) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CF90BEC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a3(a1, a2);
  return swift_release();
}

void sub_24CF90CB4(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

uint64_t sub_24CF90D20(uint64_t a1, void (*a2)(uint64_t, void))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a2(a1, 0);
  return swift_release();
}

uint64_t sub_24CF90DDC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_24CF90E04(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_24CF90E50()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = objc_msgSend(v0, sel_definition);
  id v2 = objc_msgSend(v1, sel_clientIdentity);
  swift_release();

  id v3 = objc_msgSend(v2, sel_processIdentity);
  swift_release();

  return v3;
}

uint64_t sub_24CF90F94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF90FA4(uint64_t a1)
{
  return sub_24CF90D20(a1, *(void (**)(uint64_t, void))(v1 + 16));
}

uint64_t sub_24CF90FAC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_24CF90FD4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF90FE4(uint64_t a1, uint64_t a2)
{
  return sub_24CF90BEC(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_24CF90FEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF90FFC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24CF91024()
{
  unint64_t result = qword_269848B88;
  if (!qword_269848B88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269848B88);
  }
  return result;
}

unint64_t sub_24CF91064()
{
  unint64_t result = qword_269848B90;
  if (!qword_269848B90)
  {
    sub_24CF91024();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848B90);
  }
  return result;
}

void sub_24CF910BC(unint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *))
{
  uint64_t v21 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v11) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    ++v6;
    if (!v16)
    {
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (!v16)
      {
        int64_t v6 = v15 + 2;
        if (v15 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v7 + 8 * v6);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_5:
    id v23 = *(id *)(*(void *)(a3 + 48) + 8 * v13);
    id v14 = v23;
    a4(&v22, &v23);

    if (v22 == 1)
    {
      *(unint64_t *)((char *)a1 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_24CF91294(a1, a2, v21, a3);
        swift_release();
        return;
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v11) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16)
  {
    int64_t v6 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v6);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_24CF91294(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
  uint64_t result = sub_24CFD36B8();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_24CFD3568();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24CF914F4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v2);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_24CF92868((uint64_t)v2, &qword_269848BA0);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    char v11 = 7;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 0, 1, v8);
  }
  sub_24CF92868((uint64_t)v4, &qword_269848BA8);
  return swift_release();
}

uint64_t sub_24CF91770(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v1 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
  {
    sub_24CF92868((uint64_t)v4, &qword_269848BA0);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  else
  {
    v13[1] = 0;
    v13[2] = 0;
    v13[0] = a1;
    char v14 = 1;
    id v10 = a1;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  sub_24CF92868((uint64_t)v6, &qword_269848BA8);
  return swift_release();
}

uint64_t sub_24CF91A00()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v2);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_24CF92868((uint64_t)v2, &qword_269848BA0);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  else
  {
    v10[1] = 0;
    v10[2] = 0;
    v10[0] = 1;
    char v11 = 7;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 0, 1, v8);
  }
  sub_24CF92868((uint64_t)v4, &qword_269848BA8);
  return swift_release();
}

uint64_t sub_24CF91C80(void *a1, uint64_t a2, char a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v3 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
    sub_24CF92868((uint64_t)v7, &qword_269848BA0);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  else
  {
    v16[1] = 0;
    v16[2] = 0;
    v16[0] = a1;
    char v17 = a3;
    id v13 = a1;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 0, 1, v14);
  }
  sub_24CF92868((uint64_t)v9, &qword_269848BA8);
  return swift_release();
}

uint64_t sub_24CF91F18(void *a1, void *a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CF92800(v3 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848B80);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    sub_24CF92868((uint64_t)v8, &qword_269848BA0);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  else
  {
    v19[0] = a1;
    v19[1] = a2;
    v19[2] = a3;
    char v20 = 6;
    id v14 = a3;
    id v15 = a1;
    id v16 = a2;
    sub_24CFD34B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848BB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  sub_24CF92868((uint64_t)v10, &qword_269848BA8);
  return swift_release();
}

uint64_t sub_24CF921BC(uint64_t a1, void (*a2)(uint64_t *__return_ptr, id *))
{
  uint64_t v3 = v2;
  v15[1] = *MEMORY[0x263EF8340];
  char v6 = *(unsigned char *)(a1 + 32);
  unsigned int v7 = v6 & 0x3F;
  unint64_t v8 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v9 = 8 * v8;
  swift_retain_n();
  if (v7 <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x270FA5388]();
    bzero((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain();
    sub_24CF910BC((void *)((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    uint64_t v11 = v10;
    swift_release();
    if (v3) {
      swift_willThrow();
    }
    swift_release();
  }
  else
  {
    uint64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    swift_retain();
    sub_24CF910BC((unint64_t *)v12, v8, a1, a2);
    uint64_t v11 = v13;
    swift_release();
    MEMORY[0x25331A7D0](v12, -1, -1);
    swift_release();
  }
  swift_release();
  return v11;
}

uint64_t sub_24CF9238C(uint64_t a1, void (*a2)(uint64_t *__return_ptr, id *))
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_24CF921BC(a1, a2);
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v21 = MEMORY[0x263F8EE88];
  swift_retain();
  sub_24CFD3628();
  uint64_t v4 = sub_24CFD3668();
  if (v4)
  {
    uint64_t v5 = v4;
    sub_24CF91024();
    do
    {
      uint64_t v19 = v5;
      swift_dynamicCast();
      uint64_t v19 = (uint64_t)v20;
      a2((uint64_t *)&v18, (id *)&v19);
      id v6 = v20;
      if (v18)
      {
        uint64_t v7 = v21;
        if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
        {
          sub_24CFA1EE0();
          uint64_t v7 = v21;
        }
        uint64_t result = sub_24CFD3568();
        uint64_t v9 = v7 + 56;
        uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
        unint64_t v11 = result & ~v10;
        unint64_t v12 = v11 >> 6;
        if (((-1 << v11) & ~*(void *)(v7 + 56 + 8 * (v11 >> 6))) != 0)
        {
          unint64_t v13 = __clz(__rbit64((-1 << v11) & ~*(void *)(v7 + 56 + 8 * (v11 >> 6)))) | v11 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v10) >> 6;
          do
          {
            if (++v12 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v12 == v15;
            if (v12 == v15) {
              unint64_t v12 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v9 + 8 * v12);
          }
          while (v17 == -1);
          unint64_t v13 = __clz(__rbit64(~v17)) + (v12 << 6);
        }
        *(void *)(v9 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        *(void *)(*(void *)(v7 + 48) + 8 * v13) = v6;
        ++*(void *)(v7 + 16);
      }
      else
      {
      }
      uint64_t v5 = sub_24CFD3668();
    }
    while (v5);
    uint64_t v3 = v21;
  }
  swift_release();
  swift_release();
  return v3;
}

uint64_t sub_24CF925C0()
{
  void (*v5)(uint64_t *__return_ptr, id *);
  void (*v6)(uint64_t *__return_ptr, id *);
  uint64_t v7;
  uint64_t v8;

  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_actionHandler);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_actionHandler + 8);
  if (v1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_24CF927C0;
    *(void *)(v4 + 24) = v3;
    uint64_t v5 = (void (*)(uint64_t *__return_ptr, id *))sub_24CF927C8;
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v5 = (void (*)(uint64_t *__return_ptr, id *))sub_24CF903B4;
  }
  id v6 = v5;
  sub_24CF92778(v1);
  uint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_24CF9238C(v7, v6);
  swift_release();
  swift_release();
  return v8;
}

uint64_t sub_24CF92778(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CF92788()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF927C0(uint64_t a1)
{
  return sub_24CF90300(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_24CF927C8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_24CF92800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CF92868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CF928C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

id sub_24CF928E0(uint64_t a1, void *a2, int *a3)
{
  uint64_t v4 = v3;
  int v7 = *a3;
  int v35 = *((unsigned __int8 *)a3 + 4);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = sub_24CFCC7F0();
  uint64_t v9 = v8;
  uint64_t v10 = *v3;
  if (*v3)
  {
    if (!v8) {
      goto LABEL_20;
    }
    sub_24CF949B8(0, &qword_269848C00);
    id v11 = v9;
    id v12 = v10;
    char v13 = sub_24CFD3578();

    if ((v13 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_8:
    if (v4[1] != a2) {
      goto LABEL_14;
    }
    int v14 = *((_DWORD *)v4 + 4);
    if (*((unsigned char *)v4 + 20) == 1)
    {
      if (v14)
      {
        int v15 = v35;
        if (!v7) {
          int v15 = 0;
        }
        if (v15 != 1) {
          goto LABEL_14;
        }
LABEL_35:

        id v22 = v4[3];
        swift_unknownObjectRetain();
        swift_release();
        return v22;
      }
      char v33 = v35;
      if (v7) {
        char v33 = 0;
      }
      if (v33) {
        goto LABEL_35;
      }
    }
    else
    {
      BOOL v31 = v14 == v7;
      char v32 = v35;
      if (!v31) {
        char v32 = 1;
      }
      if ((v32 & 1) == 0) {
        goto LABEL_35;
      }
    }
LABEL_14:
    if (v9) {
      goto LABEL_15;
    }
LABEL_20:

    char *v4 = v9;
    v4[1] = a2;
    *((_DWORD *)v4 + 4) = v7;
    *((unsigned char *)v4 + 20) = v35;
    swift_release();
    swift_unknownObjectRelease();
    id v22 = 0;
    v4[3] = 0;
    return v22;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_15:
  id v11 = v9;
LABEL_16:
  id v34 = v11;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v39 = a1;
  sub_24CF948D4((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  BOOL v16 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v17 = v16;
  swift_release();
  if (v16)
  {
    id v18 = objc_msgSend(v17, sel_identifier);

    uint64_t v19 = sub_24CFD33A8();
    unint64_t v21 = v20;
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    unint64_t v21 = 0xEA00000000005D65;
    uint64_t v19 = 0x6E656373206F6E5BLL;
  }
  uint64_t v39 = v19;
  unint64_t v40 = v21;
  sub_24CFD33F8();
  int v38 = HIDWORD(a2);
  sub_24CFD3878();
  sub_24CFD33F8();
  swift_bridgeObjectRelease();
  sub_24CFD33F8();
  int v37 = v7;
  LOBYTE(v38) = v35;
  LayerTarget.description.getter();
  sub_24CFD33F8();
  swift_bridgeObjectRelease();
  sub_24CFD33F8();
  sub_24CFD33F8();
  char v23 = (objc_class *)type metadata accessor for LayerTarget._UILayerTarget();
  unint64_t v24 = (char *)objc_allocWithZone(v23);
  if (v7) {
    char v25 = 0;
  }
  else {
    char v25 = v35;
  }
  if (v25)
  {
    swift_deallocPartialClassInstance();
    uint64_t v26 = (void *)sub_24CFD3398();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v34, sel_createPresenterWithIdentifier_priority_, v26, a2);

    char *v4 = v9;
    v4[1] = a2;
    *((_DWORD *)v4 + 4) = 0;
    *((unsigned char *)v4 + 20) = 1;
  }
  else
  {
    v27 = &v24[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target];
    *(_DWORD *)v27 = v7;
    v27[4] = v35;
    v36.receiver = v24;
    v36.super_class = v23;
    id v28 = objc_msgSendSuper2(&v36, sel_init);
    v29 = (void *)sub_24CFD3398();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v34, sel_createPresenterForLayerTarget_identifier_priority_, v28, v29, a2);

    char *v4 = v9;
    v4[1] = a2;
    *((_DWORD *)v4 + 4) = v7;
    *((unsigned char *)v4 + 20) = v35;
  }
  swift_unknownObjectRetain();
  swift_release();
  swift_unknownObjectRelease();
  v4[3] = v22;
  return v22;
}

id sub_24CF92E34()
{
  uint64_t v1 = v0;
  sub_24CFD3488();
  uint64_t v9 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  id v10 = *(id *)(v0 + 56);
  swift_unknownObjectRetain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  id v2 = *(id *)(v0 + 64);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 72);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2ED8();
  swift_release();
  int v4 = *(_DWORD *)(v0 + 80);
  char v5 = *(unsigned char *)(v1 + 84);
  swift_release();
  int v11 = v4;
  char v12 = v5;
  swift_beginAccess();
  id v6 = sub_24CF928E0((uint64_t)v2, v3, &v11);
  swift_endAccess();

  if (v10)
  {
    if (v6 && v10 == v6)
    {
LABEL_18:
      swift_release();
      goto LABEL_19;
    }
    objc_msgSend(v10, sel_invalidate, v9);
  }
  else if (!v6)
  {
    swift_release();
    return v6;
  }
  swift_unknownObjectRetain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF948D4((unint64_t *)&qword_269848BF0, (void (*)(uint64_t))type metadata accessor for UIPresenterObserver);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  if (!v6) {
    goto LABEL_18;
  }
  objc_msgSend((id)swift_unknownObjectRetain(), sel_activate);
  swift_release();
  swift_unknownObjectRelease();
LABEL_19:
  swift_unknownObjectRelease();
  return v6;
}

id sub_24CF932E0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(id *)(v0 + 64);
  swift_release();
  return v1;
}

uint64_t sub_24CF933F0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_release();
  return v1;
}

uint64_t sub_24CF934F8@<X0>(uint64_t a1@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  char v3 = *(unsigned char *)(v1 + 84);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 80);
  *(unsigned char *)(a1 + 4) = v3;
  return swift_release();
}

void sub_24CF93614(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

void sub_24CF93770(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = a2;
  id v5 = a2;
  swift_release();
}

uint64_t sub_24CF9381C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF93974(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 72) = a2;
  return swift_release();
}

uint64_t sub_24CF93A14()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF93B80(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(_DWORD *)(a1 + 80) = a2;
  *(unsigned char *)(a1 + 84) = BYTE4(a2) & 1;
  return swift_release();
}

void sub_24CF93C28()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v6[0] = v0;
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = (char *)*(id *)(v0 + 64);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v6[0] = v1;
  sub_24CF948D4((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v2 = *(void **)&v1[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene];
  id v3 = v2;

  swift_release();
  if (!v2) {
    goto LABEL_11;
  }
  if (sub_24CF92E34())
  {
    sub_24CF949B8(0, &qword_269848C08);
    objc_msgSend(v3, sel_addExtension_, swift_getObjCClassFromMetadata());
    swift_getObjectType();
    uint64_t v4 = sub_24CFD3538();
    if (v4)
    {
      uint64_t v5 = v4;
      v6[3] = sub_24CFD2F58();
      v6[4] = MEMORY[0x263F81FB0];
      v6[0] = v5;
      swift_retain();
      sub_24CFD3548();
      swift_unknownObjectRelease();
      swift_release();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
LABEL_11:
      swift_release();
      return;
    }
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

void sub_24CF93F3C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = (char *)*(id *)(v0 + 64);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF948D4((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v2 = *(void **)&v1[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene];
  id v3 = v2;

  swift_release();
  if (v2)
  {
    sub_24CF949B8(0, &qword_269848C08);
    objc_msgSend(v3, sel_removeExtension_, swift_getObjCClassFromMetadata());
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24CF941CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_24CFD2EB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *a3;
  char v13 = *((unsigned char *)a3 + 4);
  sub_24CFD2EA8();
  uint64_t v14 = sub_24CFD2E98();
  unint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v18 = sub_24CF9491C(8, v14, v16, v17);
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = MEMORY[0x253319B10](v18, v20, v22, v24);
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  *(void *)(v4 + 16) = v25;
  *(void *)(v4 + 24) = v27;
  sub_24CFD2F08();
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a2;
  *(_DWORD *)(v4 + 80) = v12;
  *(unsigned char *)(v4 + 84) = v13;
  *(void *)(v4 + 88) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UIPresenterObserver()), sel_init);
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(_DWORD *)(v4 + 48) = 0;
  *(unsigned char *)(v4 + 52) = 1;
  *(void *)(v4 + 56) = 0;
  return v4;
}

uint64_t sub_24CF9436C()
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC12DrawingBoard23UISceneHostingViewModel___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CF94438()
{
  return type metadata accessor for UISceneHostingViewModel();
}

uint64_t type metadata accessor for UISceneHostingViewModel()
{
  uint64_t result = qword_269848BD0;
  if (!qword_269848BD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CF9448C()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t destroy for UISceneHostingViewModel.PresenterModelCache(id *a1)
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for UISceneHostingViewModel.PresenterModelCache(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v5 = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UISceneHostingViewModel.PresenterModelCache(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  int v7 = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for UISceneHostingViewModel.PresenterModelCache(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UISceneHostingViewModel.PresenterModelCache(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for UISceneHostingViewModel.PresenterModelCache(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UISceneHostingViewModel.PresenterModelCache()
{
  return &type metadata for UISceneHostingViewModel.PresenterModelCache;
}

uint64_t sub_24CF94780()
{
  return sub_24CF93B80(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32));
}

uint64_t sub_24CF947C0()
{
  return sub_24CF93974(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_24CF947E4()
{
  sub_24CF93770(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CF94800@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CF99A18();
  *a1 = result;
  return result;
}

uint64_t sub_24CF9482C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CF99A18();
  *a1 = result;
  return result;
}

uint64_t sub_24CF94858()
{
  return sub_24CF99194();
}

uint64_t sub_24CF94884()
{
  return sub_24CF99194();
}

uint64_t sub_24CF948B0()
{
  return sub_24CF99B00(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CF948D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CF9491C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_24CFD33E8();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_24CF949B8(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *initializeBufferWithCopyOfBuffer for SnapshotView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SnapshotView(id *a1)
{
  return swift_release();
}

uint64_t assignWithCopy for SnapshotView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

id *assignWithTake for SnapshotView(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnapshotView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SnapshotView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnapshotView()
{
  return &type metadata for SnapshotView;
}

uint64_t sub_24CF94BE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CF94C04@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848C10);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int v11 = (char *)&v19 - v10;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v22 = a2;
  sub_24CF95204((unint64_t *)&qword_269848C18, (void (*)(uint64_t))type metadata accessor for SnapshotSource);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v12 = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v13 = sub_24CFD3058();
  char v14 = sub_24CFD31D8();
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  char v24 = v14;
  id v21 = a1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  id v16 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848C20);
  type metadata accessor for SceneFuture();
  sub_24CF95190();
  sub_24CF95204(&qword_269848C30, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD3258();
  swift_release();

  swift_release();
  unint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v17(v11, v9, v5);
  v17(v20, v11, v5);
  return swift_release();
}

void sub_24CF94F4C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = v2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CF95204((unint64_t *)&qword_269848C18, (void (*)(uint64_t))type metadata accessor for SnapshotSource);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_24CF9511C()
{
  return sub_24CFD3228();
}

uint64_t sub_24CF95138@<X0>(char *a1@<X8>)
{
  return sub_24CF94C04(*(void **)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_24CF95148()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24CF95188(uint64_t a1, void **a2)
{
}

unint64_t sub_24CF95190()
{
  unint64_t result = qword_269848C28;
  if (!qword_269848C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848C20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C28);
  }
  return result;
}

uint64_t sub_24CF95204(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24CF95254()
{
  sub_24CFD280C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CF95270()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_24CF95424()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  id v1 = objc_msgSendSuper2(&v8, sel_defaultExtensions);
  if (v1)
  {
    uint64_t v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848C38);
    id v3 = (void *)sub_24CFD3438();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v3 = sub_24CF95628(0, v3[2] + 1, 1, v3);
  }
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1) {
    id v3 = sub_24CF95628((void *)(v4 > 1), v5 + 1, 1, v3);
  }
  uint64_t v6 = type metadata accessor for LocalSceneExtension();
  v3[2] = v5 + 1;
  v3[v5 + 4] = v6;
  return v3;
}

id sub_24CF955D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalSceneSpecification()
{
  return self;
}

void *sub_24CF95628(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269848C40);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      void v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CF95738(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_24CF95738(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_24CFD3818();
  __break(1u);
  return result;
}

BOOL sub_24CF95824(uint64_t a1)
{
  sub_24CF8DDCC(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_24CF8DE78((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for LocalSceneSpecification();
  if (!swift_dynamicCast())
  {
LABEL_5:
    id v1 = 0;
    goto LABEL_6;
  }
  id v1 = v4;
LABEL_6:
  BOOL v2 = v1 != 0;

  return v2;
}

unint64_t static Int.default.getter()
{
  return 0x8000000000000000;
}

ValueMetadata *type metadata accessor for PresentationView()
{
  return &type metadata for PresentationView;
}

uint64_t sub_24CF958C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CF958DC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFBAB98();
  return swift_release();
}

uint64_t sub_24CF9598C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CF95A34()
{
  return sub_24CF95AAC(&qword_269848C58, &qword_269848C60, (void (*)(void))sub_24CF95A70, (void (*)(void))sub_24CF95C58);
}

uint64_t sub_24CF95A70()
{
  return sub_24CF95AAC(&qword_269848C68, &qword_269848C70, (void (*)(void))sub_24CF95B34, (void (*)(void))sub_24CF95C04);
}

uint64_t sub_24CF95AAC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CF95B34()
{
  unint64_t result = qword_269848C78;
  if (!qword_269848C78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848C80);
    sub_24CF95BB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C78);
  }
  return result;
}

unint64_t sub_24CF95BB0()
{
  unint64_t result = qword_269848FA0;
  if (!qword_269848FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848FA0);
  }
  return result;
}

unint64_t sub_24CF95C04()
{
  unint64_t result = qword_269848C88;
  if (!qword_269848C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C88);
  }
  return result;
}

unint64_t sub_24CF95C58()
{
  unint64_t result = qword_269848C90;
  if (!qword_269848C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C90);
  }
  return result;
}

unint64_t sub_24CF95CAC()
{
  unint64_t result = qword_269848C98;
  if (!qword_269848C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C98);
  }
  return result;
}

uint64_t sub_24CF95D00@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v20 = a2;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*MEMORY[0x263F8E100] + *a1 + 8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v19 - v11;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = *(void *)(v8 + *MEMORY[0x263F8E100]);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v20, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = a3;
  *((void *)v15 + 3) = v9;
  uint64_t v16 = v23;
  uint64_t v17 = v21;
  *((void *)v15 + 4) = v23;
  *((void *)v15 + 5) = v17;
  *((void *)v15 + 6) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v15[v14], v12, v9);
  swift_retain();
  View.transformSceneSettings<A>(_:_:)(v13, (uint64_t)sub_24CF981E8, (uint64_t)v15, a3, v13, v16);
  swift_release();
  return swift_release();
}

uint64_t sub_24CF95F2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(*MEMORY[0x263F8E100] + *a2 + 8);
  uint64_t v10 = sub_24CFD3588();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v16 - v11;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, a3, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, v9);
  swift_retain();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269848D48);
  SceneSettings.subscript.setter(v12, a2, v14, a6);
  return swift_release();
}

uint64_t View.sceneUnderLock(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_underLock()
{
  return sel_underLock;
}

id sub_24CF96124@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_underLock);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF96158(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUnderLock_, *a1);
}

uint64_t View.sceneStatusBarStyleOverridesToSuppress(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848CA0, type metadata accessor for _UIStatusBarStyleOverrides);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_statusBarStyleOverridesToSuppress()
{
  return sel_statusBarStyleOverridesToSuppress;
}

id sub_24CF9629C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_statusBarStyleOverridesToSuppress);
  *a2 = result;
  return result;
}

id sub_24CF962D0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarStyleOverridesToSuppress_, *a1);
}

uint64_t View.sceneDeactivationReasonMask(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848CA8, type metadata accessor for UIApplicationSceneDeactivationReasonMask);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_deactivationReasons()
{
  return sel_deactivationReasons;
}

id sub_24CF96414@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_deactivationReasons);
  *a2 = result;
  return result;
}

id sub_24CF96448@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_deactivationReasons);
  *a2 = result;
  return result;
}

id sub_24CF9647C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeactivationReasons_, *a1);
}

id sub_24CF96490(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeactivationReasons_, *a1);
}

uint64_t sub_24CF964A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t View.sceneUserInterfaceStyle(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848CB0, type metadata accessor for UIUserInterfaceStyle);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_userInterfaceStyle()
{
  return sel_userInterfaceStyle;
}

id sub_24CF9661C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_userInterfaceStyle);
  *a2 = result;
  return result;
}

id sub_24CF96650@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_userInterfaceStyle);
  *a2 = result;
  return result;
}

id sub_24CF96684(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserInterfaceStyle_, *a1);
}

id sub_24CF96698(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserInterfaceStyle_, *a1);
}

uint64_t View.sceneForcedStatusBarStyle(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  sub_24CF949B8(0, &qword_269848CB8);
  uint64_t v7 = (void *)sub_24CFD3558();
  uint64_t v10 = v7;
  unint64_t v8 = sub_24CF96828();
  sub_24CF95D00(KeyPath, (uint64_t)&v10, a1, a2, v8, a3);
  swift_release();

  return swift_release();
}

char *keypath_get_selector_forcedStatusBarStyle()
{
  return sel_forcedStatusBarStyle;
}

id sub_24CF967D8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_forcedStatusBarStyle);
  *a2 = result;
  return result;
}

id sub_24CF96814(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForcedStatusBarStyle_, *a1);
}

unint64_t sub_24CF96828()
{
  unint64_t result = qword_269848CC0;
  if (!qword_269848CC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848CC8);
    sub_24CF968B4(&qword_269848CD0, &qword_269848CB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848CC0);
  }
  return result;
}

uint64_t sub_24CF968B4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CF949B8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t View.sceneForcedStatusBarForegroundTransparent(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_forcedStatusBarForegroundTransparent()
{
  return sel_forcedStatusBarForegroundTransparent;
}

id sub_24CF96920@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_forcedStatusBarForegroundTransparent);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF96954(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForcedStatusBarForegroundTransparent_, *a1);
}

uint64_t View.sceneCanShowAlerts(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_canShowAlerts()
{
  return sel_canShowAlerts;
}

id sub_24CF96984@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_canShowAlerts);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF969B8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCanShowAlerts_, *a1);
}

uint64_t View.sceneIdleModeEnabled(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_idleModeEnabled()
{
  return sel_idleModeEnabled;
}

id sub_24CF969E8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_idleModeEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF96A1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIdleModeEnabled_, *a1);
}

uint64_t View.sceneStatusBarDisabled(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_statusBarDisabled()
{
  return sel_statusBarDisabled;
}

id sub_24CF96A4C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_statusBarDisabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF96A80(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarDisabled_, *a1);
}

uint64_t View.scenePeripheryInsets(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  return sub_24CF96F00(a1, a2, a3, a4, a5, a6, a7);
}

char *keypath_get_selector_peripheryInsets()
{
  return sel_peripheryInsets;
}

id sub_24CF96AB0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_34Tm(a1, (SEL *)&selRef_peripheryInsets, a2);
}

id sub_24CF96ABC(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setPeripheryInsets_);
}

uint64_t View.sceneStatusBarParts(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848CE0, type metadata accessor for _UIApplicationStatusBarPart);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_statusBarParts()
{
  return sel_statusBarParts;
}

id sub_24CF96BF8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_statusBarParts);
  *a2 = result;
  return result;
}

id sub_24CF96C2C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarParts_, *a1);
}

uint64_t View.sceneStatusBarAvoidanceFrame(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  *(double *)uint64_t v17 = a4;
  *(double *)&v17[1] = a5;
  *(double *)&v17[2] = a6;
  *(double *)&v17[3] = a7;
  uint64_t v15 = sub_24CF964A4(&qword_269848CE8, type metadata accessor for CGRect);
  sub_24CF95D00(KeyPath, (uint64_t)v17, a1, a2, v15, a3);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_statusBarAvoidanceFrame()
{
  return sel_statusBarAvoidanceFrame;
}

id sub_24CF96D90@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_statusBarAvoidanceFrame);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_24CF96DC8(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setStatusBarAvoidanceFrame_);
}

uint64_t View.sceneStatusBarHeight(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  return sub_24CF97D50(a1, a2, a3, a4);
}

char *keypath_get_selector_statusBarHeight()
{
  return sel_statusBarHeight;
}

id sub_24CF96DF0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_statusBarHeight);
  *a2 = v4;
  return result;
}

id sub_24CF96E24(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarHeight_, *a1);
}

unint64_t sub_24CF96E38()
{
  unint64_t result = qword_269848CF0;
  if (!qword_269848CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848CF0);
  }
  return result;
}

uint64_t View.sceneSystemMinimumMargin(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  return sub_24CF97D50(a1, a2, a3, a4);
}

char *keypath_get_selector_systemMinimumMargin()
{
  return sel_systemMinimumMargin;
}

id sub_24CF96EA8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_systemMinimumMargin);
  *a2 = v4;
  return result;
}

id sub_24CF96EDC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSystemMinimumMargin_, *a1);
}

uint64_t View.sceneSafeAreaInsets(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  return sub_24CF96F00(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24CF96F00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  *(double *)uint64_t v17 = a4;
  *(double *)&v17[1] = a5;
  *(double *)&v17[2] = a6;
  *(double *)&v17[3] = a7;
  uint64_t v15 = sub_24CF964A4(&qword_269848CD8, type metadata accessor for UIEdgeInsets);
  sub_24CF95D00(KeyPath, (uint64_t)v17, a1, a2, v15, a3);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_safeAreaInsetsPortrait()
{
  return sel_safeAreaInsetsPortrait;
}

id sub_24CF9705C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_34Tm(a1, (SEL *)&selRef_safeAreaInsetsPortrait, a2);
}

id keypath_get_34Tm@<X0>(id *a1@<X0>, SEL *a2@<X3>, void *a3@<X8>)
{
  id result = [*a1 *a2];
  *a3 = v5;
  a3[1] = v6;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

id sub_24CF9709C(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setSafeAreaInsetsPortrait_);
}

id keypath_set_35Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1], a1[2], a1[3]);
}

uint64_t View.sceneHomeAffordanceOverlayAllowance(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  return sub_24CF97D50(a1, a2, a3, a4);
}

char *keypath_get_selector_homeAffordanceOverlayAllowance()
{
  return sel_homeAffordanceOverlayAllowance;
}

id sub_24CF970D8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_homeAffordanceOverlayAllowance);
  *a2 = v4;
  return result;
}

id sub_24CF9710C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHomeAffordanceOverlayAllowance_, *a1);
}

uint64_t View.sceneDeviceOrientation(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848CF8, type metadata accessor for BSDeviceOrientation);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_deviceOrientation()
{
  return sel_deviceOrientation;
}

id sub_24CF97250@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_deviceOrientation);
  *a2 = result;
  return result;
}

id sub_24CF97284(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeviceOrientation_, *a1);
}

uint64_t View.sceneArtworkSubtype(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF9764C(a1, a2, a3, MEMORY[0x263F8D6E8], a4);
}

char *keypath_get_selector_artworkSubtype()
{
  return sel_artworkSubtype;
}

id sub_24CF972BC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_artworkSubtype);
  *a2 = result;
  return result;
}

id sub_24CF972F0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setArtworkSubtype_, *a1);
}

uint64_t View.sceneCornerRadiusConfiguration(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v12 = a1;
  unint64_t v9 = sub_24CF97464();
  id v10 = a1;
  sub_24CF95D00(KeyPath, (uint64_t)&v12, a2, a3, v9, a4);
  swift_release();

  return swift_release();
}

char *keypath_get_selector_cornerRadiusConfiguration()
{
  return sel_cornerRadiusConfiguration;
}

id sub_24CF97414@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_cornerRadiusConfiguration);
  *a2 = result;
  return result;
}

id sub_24CF97450(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCornerRadiusConfiguration_, *a1);
}

unint64_t sub_24CF97464()
{
  unint64_t result = qword_269848D00;
  if (!qword_269848D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848D08);
    sub_24CF968B4(&qword_269848D10, &qword_269848D18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848D00);
  }
  return result;
}

uint64_t View.sceneHostContextIdentifierForSnapshotting(_:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  int v10 = a1;
  sub_24CF95D00(KeyPath, (uint64_t)&v10, a2, a3, MEMORY[0x263F8E918], a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_hostContextIdentifierForSnapshotting()
{
  return sel_hostContextIdentifierForSnapshotting;
}

id sub_24CF975EC@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hostContextIdentifierForSnapshotting);
  *a2 = result;
  return result;
}

id sub_24CF97620(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostContextIdentifierForSnapshotting_, *a1);
}

uint64_t View.scenePresenterRenderIdentifierForSnapshotting(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF9764C(a1, a2, a3, MEMORY[0x263F8E990], a4);
}

uint64_t sub_24CF9764C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v12 = a1;
  sub_24CF95D00(KeyPath, (uint64_t)&v12, a2, a3, a4, a5);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_scenePresenterRenderIdentifierForSnapshotting()
{
  return sel_scenePresenterRenderIdentifierForSnapshotting;
}

id sub_24CF97754@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_scenePresenterRenderIdentifierForSnapshotting);
  *a2 = result;
  return result;
}

id sub_24CF97788(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScenePresenterRenderIdentifierForSnapshotting_, *a1);
}

uint64_t View.sceneAccessibilityContrast(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848D20, type metadata accessor for UIAccessibilityContrast);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_accessibilityContrast()
{
  return sel_accessibilityContrast;
}

id sub_24CF978CC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_accessibilityContrast);
  *a2 = result;
  return result;
}

id sub_24CF97900(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAccessibilityContrast_, *a1);
}

uint64_t View.sceneScreenReferenceDisplayModeStatus(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848D28, type metadata accessor for ReferenceDisplayModeStatus);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_screenReferenceDisplayModeStatus()
{
  return sel_screenReferenceDisplayModeStatus;
}

id sub_24CF97A44@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_screenReferenceDisplayModeStatus);
  *a2 = result;
  return result;
}

id sub_24CF97A78@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_screenReferenceDisplayModeStatus);
  *a2 = result;
  return result;
}

id sub_24CF97AAC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScreenReferenceDisplayModeStatus_, *a1);
}

id sub_24CF97AC0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScreenReferenceDisplayModeStatus_, *a1);
}

uint64_t View.sceneEnhancedWindowingEnabled(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

char *keypath_get_selector_enhancedWindowingEnabled()
{
  return sel_enhancedWindowingEnabled;
}

id sub_24CF97AF0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_enhancedWindowingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF97B24@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_enhancedWindowingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF97B58(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnhancedWindowingEnabled_, *a1);
}

id sub_24CF97B6C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnhancedWindowingEnabled_, *a1);
}

uint64_t View.sceneHostReferenceAngleMode(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF964A4(&qword_269848D30, type metadata accessor for UISSystemReferenceAngleMode);
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_hostReferenceAngleMode()
{
  return sel_hostReferenceAngleMode;
}

id sub_24CF97CB0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hostReferenceAngleMode);
  *a2 = result;
  return result;
}

id sub_24CF97CE4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hostReferenceAngleMode);
  *a2 = result;
  return result;
}

id sub_24CF97D18(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostReferenceAngleMode_, *a1);
}

id sub_24CF97D2C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostReferenceAngleMode_, *a1);
}

uint64_t View.sceneAngleFromHostReferenceUprightDirection(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  return sub_24CF97D50(a1, a2, a3, a4);
}

uint64_t sub_24CF97D50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  double v11 = a4;
  unint64_t v9 = sub_24CF96E38();
  sub_24CF95D00(KeyPath, (uint64_t)&v11, a1, a2, v9, a3);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_angleFromHostReferenceUprightDirection()
{
  return sel_angleFromHostReferenceUprightDirection;
}

id sub_24CF97E64@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_angleFromHostReferenceUprightDirection);
  *a2 = v4;
  return result;
}

id sub_24CF97E98@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_angleFromHostReferenceUprightDirection);
  *a2 = v4;
  return result;
}

id sub_24CF97ECC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAngleFromHostReferenceUprightDirection_, *a1);
}

id sub_24CF97EE0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAngleFromHostReferenceUprightDirection_, *a1);
}

uint64_t View.sceneInLiveResize(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24CF97F04(a1, a2, a3, a4);
}

uint64_t sub_24CF97F04@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  char v10 = a1 & 1;
  sub_24CF95D00(KeyPath, (uint64_t)&v10, a2, a3, MEMORY[0x263F8D510], a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_inLiveResize()
{
  return sel_inLiveResize;
}

id sub_24CF98010@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_inLiveResize);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF98044(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInLiveResize_, *a1);
}

uint64_t sub_24CF98058()
{
  return swift_getWitnessTable();
}

unint64_t sub_24CF980C8()
{
  unint64_t result = qword_269848D40;
  if (!qword_269848D40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848D38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848D40);
  }
  return result;
}

uint64_t sub_24CF98124()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CF981E8(uint64_t a1)
{
  return sub_24CF95F2C(a1, *(uint64_t **)(v1 + 48), v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24CF9822C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v20 = a2;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*MEMORY[0x263F8E100] + *a1 + 8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v19 - v11;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = *(void *)(v8 + *MEMORY[0x263F8E100]);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v20, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = a3;
  *((void *)v15 + 3) = v9;
  uint64_t v16 = v23;
  uint64_t v17 = v21;
  *((void *)v15 + 4) = v23;
  *((void *)v15 + 5) = v17;
  *((void *)v15 + 6) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v15[v14], v12, v9);
  swift_retain();
  View.transformSceneSettings<A>(_:_:)(v13, (uint64_t)sub_24CF99150, (uint64_t)v15, a3, v13, v16);
  swift_release();
  return swift_release();
}

uint64_t sub_24CF98458(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(*MEMORY[0x263F8E100] + *a2 + 8);
  uint64_t v10 = sub_24CFD3588();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v16 - v11;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, a3, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, v9);
  swift_retain();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848D80);
  SceneSettings.subscript.setter(v12, a2, v14, a6);
  return swift_release();
}

uint64_t View.isSceneForeground(_:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  char v10 = a1 & 1;
  sub_24CF9822C(KeyPath, (uint64_t)&v10, a2, a3, MEMORY[0x263F8D510], a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_isForeground()
{
  return sel_isForeground;
}

id sub_24CF98734@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isForeground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24CF98768(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForeground_, *a1);
}

uint64_t View.sceneDisplayConfiguration(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v12 = a1;
  unint64_t v9 = sub_24CF98910();
  id v10 = a1;
  sub_24CF9822C(KeyPath, (uint64_t)&v12, a2, a3, v9, a4);
  swift_release();

  return swift_release();
}

id sub_24CF98880()
{
  id v1 = objc_msgSend(v0, sel_displayConfiguration);
  return v1;
}

id sub_24CF988B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_displayConfiguration);
  *a2 = result;
  return result;
}

void *sub_24CF988F4(void *result, id *a2)
{
  if (*result) {
    return objc_msgSend(*a2, sel_setDisplayConfiguration_);
  }
  return result;
}

unint64_t sub_24CF98910()
{
  unint64_t result = qword_269848D50;
  if (!qword_269848D50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848D58);
    sub_24CF98FD4(&qword_269848D60, (void (*)(uint64_t))sub_24CF989B4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848D50);
  }
  return result;
}

unint64_t sub_24CF989B4()
{
  unint64_t result = qword_269848D68;
  if (!qword_269848D68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269848D68);
  }
  return result;
}

uint64_t View.sceneLevel(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  double v11 = a4;
  unint64_t v9 = sub_24CF96E38();
  sub_24CF9822C(KeyPath, (uint64_t)&v11, a1, a2, v9, a3);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_level()
{
  return sel_level;
}

id sub_24CF98AFC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_level);
  *a2 = v4;
  return result;
}

id sub_24CF98B30(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLevel_, *a1);
}

uint64_t View.sceneFrame(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  *(double *)uint64_t v17 = a4;
  *(double *)&v17[1] = a5;
  *(double *)&v17[2] = a6;
  *(double *)&v17[3] = a7;
  uint64_t v15 = sub_24CF98FD4(&qword_269848CE8, type metadata accessor for CGRect);
  sub_24CF9822C(KeyPath, (uint64_t)v17, a1, a2, v15, a3);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_frame()
{
  return sel_frame;
}

id sub_24CF98C94@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_frame);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_24CF98CCC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFrame_, *a1, a1[1], a1[2], a1[3]);
}

uint64_t View.sceneInterfaceOrientation(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF98FD4(&qword_269848D70, type metadata accessor for BSInterfaceOrientation);
  sub_24CF9822C(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_interfaceOrientation()
{
  return sel_interfaceOrientation;
}

id sub_24CF98E14@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_interfaceOrientation);
  *a2 = result;
  return result;
}

id sub_24CF98E48(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterfaceOrientation_, *a1);
}

uint64_t View.sceneInterruptionPolicy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v9 = sub_24CF98FD4(&qword_269848D78, type metadata accessor for FBSSceneInterruptionPolicy);
  sub_24CF9822C(KeyPath, (uint64_t)&v11, a2, a3, v9, a4);
  swift_release();
  return swift_release();
}

char *keypath_get_selector_interruptionPolicy()
{
  return sel_interruptionPolicy;
}

id sub_24CF98F8C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_interruptionPolicy);
  *a2 = result;
  return result;
}

id sub_24CF98FC0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterruptionPolicy_, *a1);
}

uint64_t sub_24CF98FD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CF9901C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CF9908C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CF99150(uint64_t a1)
{
  return sub_24CF98458(a1, *(uint64_t **)(v1 + 48), v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24CF99194()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CF9A1F8();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CF992C4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9A1F8();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting);
  swift_release();
  return v1;
}

uint64_t sub_24CF993A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CF992C4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CF993D4()
{
  return sub_24CF993FC();
}

uint64_t sub_24CF993FC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF9A1F8();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF9952C(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting) = a2 & 1;
  return swift_release();
}

uint64_t sub_24CF995D8(void *a1)
{
  uint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9A1F8();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  swift_unknownObjectRetain();
  swift_release();
  if (!v5)
  {
    if (a1) {
      goto LABEL_8;
    }
    return swift_release();
  }
  swift_unknownObjectRelease();
  if (a1)
  {
    if (v5 != a1)
    {
LABEL_8:
      objc_msgSend(a1, sel_removeObserver_, v2);
      goto LABEL_9;
    }
    return swift_release();
  }
LABEL_9:
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v6 = *(void **)(v2 + v4);
  swift_unknownObjectRetain();
  swift_release();
  if (v6)
  {
    objc_msgSend(v6, sel_addObserver_, v2);
    swift_unknownObjectRelease();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v7 = *(void **)(v2 + v4);
  swift_unknownObjectRetain();
  swift_release();
  if (v7)
  {
    objc_msgSend(v7, sel_isHosting);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF99A18()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9A1F8();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  swift_unknownObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CF99B00(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter) = a2;
  swift_unknownObjectRetain();
  sub_24CF995D8(v4);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CF99C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 48) = a5;
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = sub_24CFD3488();
  *(void *)(v5 + 40) = sub_24CFD3478();
  uint64_t v7 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CF99CE0, v7, v6);
}

uint64_t sub_24CF99CE0()
{
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v1 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = v1;
  *(void *)(v0 + 16) = v2;
  sub_24CF9A1F8();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24CF9A0F8()
{
  return type metadata accessor for UIPresenterObserver();
}

uint64_t type metadata accessor for UIPresenterObserver()
{
  uint64_t result = qword_269848E10;
  if (!qword_269848E10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CF9A14C()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_24CF9A1F8()
{
  unint64_t result = qword_269848BF0;
  if (!qword_269848BF0)
  {
    type metadata accessor for UIPresenterObserver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848BF0);
  }
  return result;
}

uint64_t sub_24CF9A250@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CF992C4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CF9A280()
{
  return sub_24CF993FC();
}

uint64_t sub_24CF9A2A8()
{
  return sub_24CF9952C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CF9A2C8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_24CF9A308(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CF9A3CC;
  return sub_24CF99C40(a1, v4, v5, v6, v7);
}

uint64_t sub_24CF9A3CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CF9A4C0()
{
  return sub_24CF9A2A8();
}

uint64_t sub_24CF9A4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CFD34A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CFD3498();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CF9E550(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CFD3468();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CF9A67C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts);
  swift_release();
  return v1;
}

uint64_t sub_24CF9A78C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF9A8E4(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts) = a2;
  return swift_release();
}

double sub_24CF9A98C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2ED8();
  swift_release();
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__intervalExponent);
  swift_release();
  return v1;
}

uint64_t sub_24CF9AAA4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF9AC08(uint64_t a1, double a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(double *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__intervalExponent) = a2;
  return swift_release();
}

uint64_t sub_24CF9ACB8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__inCooldown);
  swift_release();
  return v1;
}

uint64_t sub_24CF9ADC8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CF9AF28(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__inCooldown) = a2 & 1;
  return swift_release();
}

BOOL sub_24CF9AFD4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts + 8))
  {
    swift_release();
    return 0;
  }
  else
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts);
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
    sub_24CFD2ED8();
    swift_release();
    unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts);
    swift_release();
    swift_release();
    return v3 >= v2;
  }
}

uint64_t sub_24CF9B174(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  sub_24CFD2F38();
  *(void *)(v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts) = 0;
  *(void *)(v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__intervalExponent) = 0;
  *(unsigned char *)(v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__inCooldown) = 0;
  sub_24CFD2F08();
  if ((a3 & 1) != 0 || a2)
  {
    *(void *)(v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture) = a1;
    uint64_t v11 = v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts;
    *(void *)uint64_t v11 = a2;
    *(unsigned char *)(v11 + 8) = a3 & 1;
    uint64_t v12 = (void *)(v5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_transitioner);
    *uint64_t v12 = a4;
    v12[1] = a5;
    return v5;
  }
  else
  {
    sub_24CFD3488();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t result = sub_24CFD37B8();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CF9B324()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_logger;
  uint64_t v2 = sub_24CFD2F48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel___observationRegistrar;
  uint64_t v4 = sub_24CFD2F18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24CF9B42C()
{
  return type metadata accessor for ActivatedPolicyModel();
}

uint64_t type metadata accessor for ActivatedPolicyModel()
{
  uint64_t result = qword_269848EB0;
  if (!qword_269848EB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CF9B480()
{
  uint64_t result = sub_24CFD2F48();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CFD2F18();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_24CF9B588(uint64_t *a1, uint64_t *a2)
{
  return sub_24CF9E250(*a1, *a2);
}

uint64_t sub_24CF9B594()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = sub_24CFA40C4((uint64_t)&unk_26FF57C58);
  if (sub_24CF9AFD4()) {
    goto LABEL_12;
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2ED8();
  swift_release();
  char v2 = *(unsigned char *)(v0 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__inCooldown);
  swift_release();
  swift_release();
  if (v2) {
    goto LABEL_12;
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned __int8 v3 = sub_24CFCCAB0();
  swift_release();
  if (v3)
  {
LABEL_12:
    swift_release();
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    unsigned __int8 v6 = sub_24CFCCCA8();
    char v4 = sub_24CF9B888(v6, v1);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v4 & 1;
}

uint64_t sub_24CF9B888(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_24CFD3948();
    sub_24CFD33D8();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24CFD3978();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v6 = v4 & ~v5;
    if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      uint64_t v7 = ~v5;
      uint64_t v8 = a1;
      while (1)
      {
        unint64_t v9 = 0x800000024CFD8060;
        unint64_t v10 = 0xD000000000000011;
        switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
        {
          case 1:
            unint64_t v10 = 0x6F69747265737361;
            unint64_t v9 = 0xED0000646C65486ELL;
            break;
          case 2:
            break;
          case 3:
            unint64_t v9 = 0xE700000000000000;
            unint64_t v10 = 0x656E6563536F6ELL;
            break;
          case 4:
            unint64_t v9 = 0xE700000000000000;
            unint64_t v10 = 0x6E776F6E6B6E75;
            break;
          default:
            unint64_t v9 = 0xE400000000000000;
            unint64_t v10 = 1701736302;
            break;
        }
        unint64_t v11 = 0x800000024CFD8060;
        unint64_t v12 = 0xD000000000000011;
        switch(v8)
        {
          case 1:
            unint64_t v11 = 0xED0000646C65486ELL;
            if (v10 == 0x6F69747265737361) {
              goto LABEL_16;
            }
            goto LABEL_17;
          case 2:
            goto LABEL_15;
          case 3:
            unint64_t v11 = 0xE700000000000000;
            unint64_t v12 = 0x656E6563536F6ELL;
LABEL_15:
            if (v10 == v12) {
              goto LABEL_16;
            }
            goto LABEL_17;
          case 4:
            unint64_t v11 = 0xE700000000000000;
            if (v10 != 0x6E776F6E6B6E75) {
              goto LABEL_17;
            }
            goto LABEL_16;
          default:
            unint64_t v11 = 0xE400000000000000;
            if (v10 != 1701736302) {
              goto LABEL_17;
            }
LABEL_16:
            if (v9 == v11)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v13 = 1;
              return v13 & 1;
            }
LABEL_17:
            char v13 = sub_24CFD38A8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v13) {
              return v13 & 1;
            }
            unint64_t v6 = (v6 + 1) & v7;
            if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
              return v13 & 1;
            }
            break;
        }
      }
    }
  }
  char v13 = 0;
  return v13 & 1;
}

uint64_t sub_24CF9BBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((sub_24CF9B594() & 1) == 0) {
    goto LABEL_11;
  }
  v19[7] = v3;
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v19[0] = v7;
  sub_24CF9E714((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v8 = *(void **)(v7 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v9 = v8;
  swift_release();
  if (!v8)
  {
LABEL_11:
    swift_release();
    uint64_t v17 = 0;
    return sub_24CF928C4((uint64_t)v17);
  }
  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  void v10[3] = a2;
  v10[4] = v9;
  v10[5] = v4;
  id v11 = v9;
  sub_24CF92778(a1);
  swift_retain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2ED8();
  swift_release();
  v19[0] = v4;
  swift_getKeyPath();
  sub_24CFD2EF8();
  uint64_t result = swift_release();
  uint64_t v13 = *(void *)(v4 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts);
  BOOL v14 = __CFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (!v14)
  {
    *(void *)(v4 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__numAttempts) = v15;
    swift_getKeyPath();
    sub_24CFD2EE8();
    swift_release();
    swift_release();
    sub_24CF9C0F4();
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = sub_24CF9E350;
    *(void *)(v16 + 16) = sub_24CF9E350;
    *(void *)(v16 + 24) = v10;
    v19[4] = sub_24CF8F3D4;
    v19[5] = v16;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = sub_24CF90E04;
    void v19[3] = &block_descriptor_1;
    uint64_t v18 = _Block_copy(v19);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_activate_, v18);
    _Block_release(v18);
    swift_release();

    swift_release();
    return sub_24CF928C4((uint64_t)v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_24CF9C004(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2) {
    a2(a4, a1);
  }
  (*(void (**)(uint64_t, uint64_t))(a5 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_transitioner))(a4, a1);
  return swift_release();
}

uint64_t sub_24CF9C0F4()
{
  uint64_t v1 = v0;
  uint64_t v13 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  uint64_t v5 = MEMORY[0x263F8F500];
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v12 - 2) = (uint64_t)v0;
  *((unsigned char *)&v12 - 8) = 1;
  BOOL v14 = v0;
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  uint64_t v7 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  swift_retain();
  uint64_t v8 = sub_24CFD3478();
  id v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v5;
  uint64_t v10 = v13;
  v9[4] = v1;
  v9[5] = v10;
  sub_24CF9A4D8((uint64_t)v4, (uint64_t)&unk_269848ED8, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_24CF9C3D4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  switch(sub_24CFCCCA8())
  {
    case 1u:
      swift_release();
      swift_bridgeObjectRelease();
      char v0 = 0;
      break;
    default:
      char v1 = sub_24CFD38A8();
      swift_release();
      swift_bridgeObjectRelease();
      char v0 = v1 ^ 1;
      break;
  }
  return v0 & 1;
}

uint64_t sub_24CF9C564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  uint64_t v5 = sub_24CFD3738();
  v4[17] = v5;
  v4[18] = *(void *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = sub_24CFD3488();
  v4[21] = sub_24CFD3478();
  uint64_t v7 = sub_24CFD3468();
  v4[22] = v7;
  v4[23] = v6;
  return MEMORY[0x270FA2498](sub_24CF9C65C, v7, v6);
}

uint64_t sub_24CF9C65C()
{
  double v1 = 3.0;
  if (sub_24CF9C3D4())
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v2 = *(void *)(v0 + 128);
    swift_getKeyPath();
    *(void *)(v0 + 104) = v2;
    sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
    sub_24CFD2ED8();
    swift_release();
    uint64_t v19 = OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__intervalExponent;
    double v3 = *(double *)(v2 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel__intervalExponent);
    swift_release();
    double v4 = v3 + 1.0;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = *(void *)(v0 + 128);
    swift_getKeyPath();
    uint64_t v6 = swift_task_alloc();
    *(void *)(v6 + 16) = v5;
    *(double *)(v6 + 24) = v4;
    *(void *)(v0 + 112) = v5;
    sub_24CFD2EC8();
    swift_release();
    swift_release();
    swift_task_dealloc();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v7 = *(void *)(v0 + 128);
    swift_getKeyPath();
    *(void *)(v0 + 120) = v7;
    sub_24CFD2ED8();
    swift_release();
    long double v8 = *(double *)(v2 + v19);
    swift_release();
    double v1 = exp2(v8) * 0.01;
  }
  *(double *)(v0 + 40) = v1;
  *(void *)(v0 + 192) = OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_logger;
  swift_retain_n();
  uint64_t v9 = sub_24CFD2F28();
  os_log_type_t v10 = sub_24CFD3528();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412546;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v12 = *(void *)(*(void *)(v0 + 128) + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture);
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v13 = *(id *)(v12 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken);
    swift_release();
    swift_release();
    *(void *)(v0 + 88) = v13;
    sub_24CFD3598();
    *uint64_t v20 = v13;
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2048;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    *(double *)(v0 + 96) = v1;
    sub_24CFD3598();
    _os_log_impl(&dword_24CF8B000, v9, v10, "[%@] Cooldown: %f seconds.", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848EF8);
    swift_arrayDestroy();
    MEMORY[0x25331A7D0](v20, -1, -1);
    MEMORY[0x25331A7D0](v11, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  swift_beginAccess();
  uint64_t v14 = sub_24CFD39A8();
  uint64_t v16 = v15;
  sub_24CFD3728();
  uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269848EF0 + dword_269848EF0);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_24CF9CC80;
  return v21(v14, v16, 0, 0, 1);
}

uint64_t sub_24CF9CC80()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[18] + 8))(v2[19], v2[17]);
  uint64_t v3 = v2[23];
  uint64_t v4 = v2[22];
  if (v0) {
    uint64_t v5 = sub_24CF9D400;
  }
  else {
    uint64_t v5 = sub_24CF9CE08;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24CF9CE08()
{
  uint64_t v1 = v0[16];
  swift_release();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v0[7] = v2;
  sub_24CF9E714((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v4 = v3;
  swift_release();
  if (v3)
  {
    unsigned __int8 v5 = objc_msgSend(v4, sel_isActive);

    if (v5)
    {
      swift_retain_n();
      uint64_t v6 = sub_24CFD2F28();
      os_log_type_t v7 = sub_24CFD34F8();
      if (os_log_type_enabled(v6, v7))
      {
        long double v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v9 = (void *)swift_slowAlloc();
        *(_DWORD *)long double v8 = 138412290;
        sub_24CFD3478();
        sub_24CFD3468();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24CFD3478();
        sub_24CFD3468();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v10 = *(id *)(v2 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken);
        swift_release();
        swift_release();
        v0[10] = v10;
        sub_24CFD3598();
        *uint64_t v9 = v10;
        swift_release_n();
        _os_log_impl(&dword_24CF8B000, v6, v7, "[%@] Resetting cooldown interval as scene is still active.", v8, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269848EF8);
        swift_arrayDestroy();
        MEMORY[0x25331A7D0](v9, -1, -1);
        MEMORY[0x25331A7D0](v8, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v11 = v0[16];
      swift_getKeyPath();
      uint64_t v12 = swift_task_alloc();
      *(void *)(v12 + 16) = v11;
      *(void *)(v12 + 24) = 0;
      v0[9] = v11;
      sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
      sub_24CFD2EC8();
      swift_release();
      swift_release();
      swift_task_dealloc();
    }
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = v0[16];
  swift_getKeyPath();
  uint64_t v14 = swift_task_alloc();
  *(void *)(v14 + 16) = v13;
  *(unsigned char *)(v14 + 24) = 0;
  v0[8] = v13;
  sub_24CF9E714(&qword_269848EC8, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24CF9D400()
{
  swift_release();
  swift_retain_n();
  uint64_t v1 = sub_24CFD2F28();
  os_log_type_t v2 = sub_24CFD3508();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v4 = *(void *)(*(void *)(v0 + 128) + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture);
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v8 = *(id *)(v0 + 208);
    id v5 = *(id *)(v4 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken);
    swift_release();
    swift_release();
    *(void *)(v0 + 48) = v5;
    sub_24CFD3598();
    *uint64_t v9 = v5;
    swift_release_n();
    _os_log_impl(&dword_24CF8B000, v1, v2, "[%@] Task cancelled during sleep for cooldown.", v3, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848EF8);
    swift_arrayDestroy();
    MEMORY[0x25331A7D0](v9, -1, -1);
    MEMORY[0x25331A7D0](v3, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24CF9D6A0()
{
  return sub_24CF9B594() & 1;
}

uint64_t sub_24CF9D6C8(uint64_t a1, uint64_t a2)
{
  return sub_24CF9BBC4(a1, a2);
}

uint64_t sub_24CF9D6EC(uint64_t a1)
{
  uint64_t result = sub_24CF9E714(&qword_269848EC0, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CF9D744(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000024CFD8060;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xED0000646C65486ELL;
      unint64_t v5 = 0x6F69747265737361;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x656E6563536F6ELL;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701736302;
      break;
  }
  unint64_t v6 = 0x800000024CFD8060;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED0000646C65486ELL;
      if (v5 == 0x6F69747265737361) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x656E6563536F6ELL;
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701736302) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24CFD38A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24CF9D910()
{
  sub_24CFD33D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CF9D9FC()
{
  return sub_24CFD3978();
}

void *sub_24CF9DAF8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24CFCC99C();
  *a1 = result;
  return result;
}

void sub_24CF9DB24(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24CFCC694(v1);
}

uint64_t sub_24CF9DB54(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24CF9DB64(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24CF9DBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24CFD3718();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24CF9DCA4, 0, 0);
}

uint64_t sub_24CF9DCA4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24CFD3738();
  uint64_t v5 = sub_24CF9E714(&qword_269848F00, MEMORY[0x263F8F710]);
  sub_24CFD38D8();
  sub_24CF9E714(&qword_269848F08, MEMORY[0x263F8F6D8]);
  sub_24CFD3748();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  char v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *char v7 = v0;
  v7[1] = sub_24CF9DE44;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24CF9DE44()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24CF9E000, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24CF9E000()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CF9E06C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24CF9E148;
  return v6(a1);
}

uint64_t sub_24CF9E148()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char **sub_24CF9E240(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_24CF9E250(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture) != *(void *)(a2 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_sceneFuture)) {
    return 0;
  }
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts);
  char v4 = *(unsigned char *)(a1 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts + 8);
  uint64_t result = *(unsigned __int8 *)(a2 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts + 8);
  if ((v4 & 1) == 0) {
    return (*v3 == *(void *)(a2 + OBJC_IVAR____TtC12DrawingBoard20ActivatedPolicyModel_maximumAttempts)) & ~result;
  }
  return result;
}

void *sub_24CF9E2A4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24CFCC99C();
  *a1 = result;
  return result;
}

void sub_24CF9E2D0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24CFCC694(v1);
}

uint64_t sub_24CF9E300()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CF9E350(uint64_t a1)
{
  return sub_24CF9C004(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24CF9E35C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CF9A67C();
  *a1 = result;
  return result;
}

uint64_t sub_24CF9E388()
{
  return sub_24CF9A78C();
}

uint64_t sub_24CF9E3B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_24CF9E3D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CF9ACB8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CF9E408()
{
  return sub_24CF9ADC8();
}

uint64_t sub_24CF9E430()
{
  return sub_24CF9AF28(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CF9E450()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CF9E490(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24CF9A3CC;
  return sub_24CF9C564(a1, v4, v5, v6);
}

uint64_t sub_24CF9E550(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CF9E5B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CF9E5E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24CF9A3CC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269848EE0 + dword_269848EE0);
  return v6(a1, v4);
}

void sub_24CF9E6A0(double *a1@<X8>)
{
  *a1 = sub_24CF9A98C();
}

uint64_t sub_24CF9E6CC()
{
  return sub_24CF9AAA4();
}

uint64_t sub_24CF9E6F4()
{
  return sub_24CF9AC08(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_24CF9E714(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CF9E75C()
{
  return sub_24CF9A8E4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CF9E778()
{
  return sub_24CF9E430();
}

uint64_t sub_24CF9E790()
{
  return sub_24CF9E6F4();
}

uint64_t sub_24CF9E7AC()
{
  return swift_initClassMetadata2();
}

id sub_24CF9E7F0(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[qword_269848F10] = 0;
  *(void *)&v4[qword_269848F18] = 0;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_24CF9E870(double a1, double a2, double a3, double a4)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = sub_24CF9E7F0(a1, a2, a3, a4);
  swift_release();
  return v8;
}

uint64_t sub_24CF9E93C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  uint64_t v5 = sub_24CF9ED50();
  swift_release();
  return v5;
}

void sub_24CF9E9E8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v19.receiver = v0;
  v19.super_class = ObjectType;
  objc_msgSendSuper2(&v19, sel_layoutSubviews);
  uint64_t v3 = qword_269848F18;
  id v4 = *(void **)&v0[qword_269848F18];
  uint64_t v5 = qword_269848F10;
  uint64_t v6 = *(void **)&v0[qword_269848F10];
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    id v8 = v6;
    char v9 = sub_24CFD3578();

    if (v9) {
      goto LABEL_18;
    }
    id v4 = *(void **)&v1[v3];
    if (v4)
    {
LABEL_7:
      id v10 = objc_msgSend(v4, sel_presenter);
      if (v10)
      {
        objc_msgSend(v10, sel_invalidate);
        swift_unknownObjectRelease();
      }
      objc_super v11 = *(void **)&v1[v3];
      if (v11) {
        objc_msgSend(v11, sel_removeFromSuperview);
      }
    }
    uint64_t v6 = *(void **)&v1[v5];
    if (!v6)
    {
      uint64_t v12 = 0;
      goto LABEL_15;
    }
  }
  else if (!v6)
  {
    goto LABEL_20;
  }
  objc_msgSend(v1, sel_addSubview_, v6);
  uint64_t v12 = *(void **)&v1[v5];
LABEL_15:
  uint64_t v13 = *(void **)&v1[v3];
  *(void *)&v1[v3] = v12;
  id v14 = v12;

  uint64_t v15 = *(void **)&v1[v3];
  if (v15)
  {
    id v16 = objc_msgSend(v15, sel_presenter);
    if (v16)
    {
      objc_msgSend(v16, sel_activate);
      swift_unknownObjectRelease();
    }
  }
LABEL_18:
  uint64_t v17 = *(void **)&v1[v5];
  if (v17)
  {
    id v18 = v17;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v18, sel_setFrame_);
    swift_release();

    return;
  }
LABEL_20:
  swift_release();
}

void sub_24CF9EC34(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = a1;
  sub_24CF9E9E8();
  swift_release();
}

void sub_24CF9ECEC(uint64_t a1)
{
  id v2 = *(void **)(a1 + qword_269848F18);
}

uint64_t type metadata accessor for ContainerUIView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CF9ED50()
{
  *(void *)&v0[qword_269848F10] = 0;
  *(void *)&v0[qword_269848F18] = 0;

  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24CFD37B8();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for UISceneHostingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for UISceneHostingView()
{
  return swift_release();
}

uint64_t assignWithCopy for UISceneHostingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for UISceneHostingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for UISceneHostingView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UISceneHostingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UISceneHostingView()
{
  return &type metadata for UISceneHostingView;
}

uint64_t sub_24CF9EFE4(char *a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = sub_24CF92E34();
  if (v6)
  {
    aBlock[4] = sub_24CF9F324;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24CF90E04;
    aBlock[3] = &block_descriptor_2;
    id v7 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v6, sel_modifyPresentationContext_, v7);
    swift_unknownObjectRelease();
    _Block_release(v7);
    uint64_t result = swift_isEscapingClosureAtFileLocation();
    if (result)
    {
      __break(1u);
      return result;
    }
    char v9 = a4;
    id v10 = objc_msgSend(v6, sel_presentationView);
  }
  else
  {
    char v9 = a4;
    id v10 = 0;
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_super v11 = *(void **)&a1[qword_269848F10];
  *(void *)&a1[qword_269848F10] = v10;
  id v12 = v10;

  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(a1, sel_setNeedsLayout);
  swift_release();

  swift_release();
  if (!v6)
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    if ((v9 & 1) == 0) {
      return swift_release();
    }
LABEL_18:
    sub_24CF93F3C();
    goto LABEL_21;
  }
  unsigned int v13 = objc_msgSend(v6, sel_isHosting);
  if ((v9 & 1) == 0)
  {
    if (v13) {
      sub_24CF93C28();
    }
    goto LABEL_21;
  }
  if ((v13 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_21:
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CF9F324(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setClippingDisabled_, 1);
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  return swift_release();
}

id sub_24CF9F3F4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848FB0)), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_release();
  return v0;
}

uint64_t sub_24CF9F4AC(char *a1, uint64_t a2)
{
  return sub_24CF9EFE4(a1, a2, *(void *)v2, *(unsigned char *)(v2 + 8));
}

uint64_t sub_24CF9F4C8()
{
  return sub_24CFD3118();
}

uint64_t sub_24CF9F50C()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_24CF9F518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CF9F608();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_24CF9F57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CF9F608();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_24CF9F5E0()
{
}

unint64_t sub_24CF9F608()
{
  unint64_t result = qword_269848FA8;
  if (!qword_269848FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848FA8);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24CF9F678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

id sub_24CF9F68C(id result, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  unint64_t v9 = a9 >> 62;
  if (a9 >> 62 == 2)
  {
    uint64_t v13 = a9 & 0x3FFFFFFFFFFFFFFFLL;
    sub_24CF9F760(result, a2 & 1);
    swift_bridgeObjectRetain();
    id v14 = a5;
    swift_unknownObjectRetain();
    swift_retain();
LABEL_7:
    objc_super v11 = (void *)v13;
    goto LABEL_8;
  }
  if (v9 == 1)
  {
    uint64_t v13 = a3;
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  if (v9) {
    return result;
  }
  id v10 = result;
  objc_super v11 = a2;
LABEL_8:
  return v11;
}

id sub_24CF9F760(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_24CF9F770(void *a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  unint64_t v9 = a9 >> 62;
  if (a9 >> 62 == 2)
  {
    sub_24CF9F864(a1, a2 & 1);

    swift_release();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (v9 == 1)
    {
      id v11 = a3;
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v9) {
        return;
      }
      id v11 = a2;
    }
  }
}

void sub_24CF9F864(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

void *sub_24CF9F8B8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v21 = *(void **)v0;
  uint64_t v22 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 24);
  long long v3 = *(void **)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  unint64_t v6 = *(void *)(v0 + 64);
  uint64_t v20 = *(void *)(v0 + 56);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v6 >> 62)
  {
    if (v6 >> 62 == 1)
    {
      swift_bridgeObjectRetain();
      id v7 = v1;
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v8 = objc_allocWithZone((Class)type metadata accessor for SceneFuture());
      swift_bridgeObjectRetain();
      id v9 = v7;
      id v10 = sub_24CFCD9B0((uint64_t)v21, v22, (uint64_t)v9);
      swift_release();

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24CF9F760(v21, v22 & 1);
      swift_bridgeObjectRetain();
      id v15 = v3;
      swift_unknownObjectRetain();
      swift_retain();
      id v16 = (id)(v6 & 0x3FFFFFFFFFFFFFFFLL);
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v21;
      *(unsigned char *)(v17 + 24) = v22 & 1;
      *(void *)(v17 + 32) = v1;
      *(void *)(v17 + 40) = v2;
      *(void *)(v17 + 48) = v15;
      *(void *)(v17 + 56) = v5;
      *(void *)(v17 + 64) = v4;
      *(void *)(v17 + 72) = v20;
      *(void *)(v17 + 80) = v16;
      objc_allocWithZone((Class)type metadata accessor for SceneFuture());
      sub_24CF9F68C(v21, (void *)v22, (uint64_t)v1, v2, v3, v5, v4, v20, v6);
      swift_bridgeObjectRetain();
      id v18 = v15;
      swift_unknownObjectRetain();
      id v10 = sub_24CFCDED4((uint64_t)v1, v2, (uint64_t)v18, v5, (uint64_t)v16, (uint64_t)sub_24CFA08D4, v17);
      swift_release();
      sub_24CF9F770(v21, (void *)v22, v1, v2, v3, v5, v4, v20, v6);
    }
  }
  else
  {
    id v11 = v21;
    id v12 = (id)v22;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v13 = objc_allocWithZone((Class)type metadata accessor for SceneFuture());
    id v14 = v12;
    id v10 = sub_24CFCE56C(v14);
    swift_release();
  }
  swift_release();
  return v10;
}

uint64_t sub_24CF9FC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t sub_24CF9FC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a2 + 64);
  long long v4 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v5;
  uint64_t v12 = v2;
  long long v6 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v7;
  uint64_t v10 = v3;
  return sub_24CFA02F4((void **)v11, (uint64_t)v9) & 1;
}

uint64_t sub_24CF9FCF8()
{
  if (sub_24CFD3578()) {
    return sub_24CFD3578() & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_24CF9FD60(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_24CFD38A8() & 1) == 0) {
    return 0;
  }
  sub_24CFA0830();
  return sub_24CFD3578() & 1;
}

uint64_t sub_24CF9FDD4(void *a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24CF9F760(*(id *)a2, v5);
  long long v6 = (void *)sub_24CFB3E10(v4, v5);
  sub_24CF9F864(v4, v5);
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = objc_msgSend(v6, sel_scene);

  if (!v7)
  {
    id v13 = 0;
    goto LABEL_10;
  }
  id v8 = objc_msgSend(v7, sel__FBSScene);

  id v9 = objc_msgSend(v8, sel_settings);
  id v10 = objc_msgSend(v9, sel_displayConfiguration);

  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  id v13 = sub_24CFA0914;
  *(void *)(v12 + 16) = sub_24CFA0914;
  *(void *)(v12 + 24) = v11;
  void v17[4] = sub_24CFA092C;
  v17[5] = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_24CF90E04;
  v17[3] = &block_descriptor_3;
  id v14 = _Block_copy(v17);
  id v15 = v10;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v14);

  _Block_release(v14);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v15)
  {
    __break(1u);
LABEL_8:
    id v13 = 0;
  }
LABEL_10:
  (*(void (**)(void *))(a2 + 48))(a1);
  swift_release();
  return sub_24CF928C4((uint64_t)v13);
}

uint64_t sub_24CFA008C(void *a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(a1, sel_setDisplayConfiguration_, a2);
  return swift_release();
}

uint64_t sub_24CFA0144(void *a1, void *a2)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  id v14 = (void *)a1[8];
  char v5 = (void *)a2[4];
  uint64_t v4 = a2[5];
  long long v6 = (void *)a2[8];
  if (a1[2] == a2[2] && a1[3] == a2[3] || (sub_24CFD38A8() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    id v7 = v2;
    swift_unknownObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    id v8 = v5;
    swift_unknownObjectRetain();
    swift_retain();
    if (objc_msgSend(v7, sel_isEqual_, v8))
    {
      unsigned __int8 v9 = objc_msgSend(v3, sel_isEqual_, v4);
      swift_release();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      if (v9)
      {
        sub_24CFA0830();
        id v10 = v14;
        id v11 = v6;
        char v12 = sub_24CFD3578();

        return v12 & 1;
      }
    }
    else
    {
      swift_release();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_24CFA02F4(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  BOOL v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = (uint64_t)a1[3];
  id v7 = a1[4];
  uint64_t v6 = (uint64_t)a1[5];
  uint64_t v9 = (uint64_t)a1[6];
  uint64_t v8 = (uint64_t)a1[7];
  unint64_t v10 = (unint64_t)a1[8];
  char v12 = *(void **)a2;
  id v11 = *(void **)(a2 + 8);
  id v13 = *(void **)(a2 + 16);
  uint64_t v14 = *(void *)(a2 + 24);
  id v16 = *(void **)(a2 + 32);
  uint64_t v15 = *(void *)(a2 + 40);
  uint64_t v18 = *(void *)(a2 + 48);
  uint64_t v17 = *(void *)(a2 + 56);
  unint64_t v19 = *(void *)(a2 + 64);
  v90[0] = *a1;
  v90[1] = v2;
  uint64_t v20 = v2;
  v90[2] = v4;
  v90[3] = v5;
  v90[4] = v7;
  v90[5] = v6;
  v90[6] = v9;
  v90[7] = v8;
  v90[8] = v10;
  v90[9] = v12;
  v90[10] = v11;
  v90[11] = v13;
  v90[12] = v14;
  v90[13] = v16;
  v90[14] = v15;
  v90[15] = v18;
  v90[16] = v17;
  v90[17] = v19;
  if (v10 >> 62)
  {
    if (v10 >> 62 == 1)
    {
      if (v19 >> 62 == 1)
      {
        uint64_t v47 = v8;
        uint64_t v49 = v17;
        uint64_t v57 = v5;
        v60 = v7;
        uint64_t v63 = v6;
        uint64_t v66 = v9;
        v69 = v4;
        v54 = v3;
        if (v3 == v12 && v2 == v11 || (v51 = v11, v21 = sub_24CFD38A8(), id v11 = v51, (v21 & 1) != 0))
        {
          uint64_t v22 = v11;
          sub_24CFA0830();
          sub_24CF9F68C(v12, v22, (uint64_t)v13, v14, v16, v15, v18, v49, v19);
          sub_24CF9F68C(v54, v20, (uint64_t)v69, v57, v60, v63, v66, v47, v10);
          swift_bridgeObjectRetain();
          id v23 = v69;
          swift_bridgeObjectRetain();
          id v24 = v13;
          char v25 = sub_24CFD3578();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        sub_24CF9F68C(v12, v51, (uint64_t)v13, v14, v16, v15, v18, v49, v19);
        sub_24CF9F68C(v54, v20, (uint64_t)v69, v5, v60, v63, v66, v47, v10);
LABEL_16:
        sub_24CFA078C((uint64_t)v90);
        goto LABEL_17;
      }
    }
    else if (v19 >> 62 == 2)
    {
      v81 = v3;
      v56 = v3;
      v46 = v2;
      char v82 = v2 & 1;
      v83 = v4;
      uint64_t v84 = v5;
      v85 = v7;
      uint64_t v86 = v6;
      uint64_t v87 = v9;
      uint64_t v88 = v8;
      uint64_t v89 = v10 & 0x3FFFFFFFFFFFFFFFLL;
      v71 = v4;
      v72 = v12;
      char v73 = v11 & 1;
      v74 = v13;
      uint64_t v75 = v14;
      v76 = v16;
      uint64_t v77 = v15;
      uint64_t v78 = v18;
      uint64_t v79 = v17;
      uint64_t v80 = v19 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v50 = v17;
      v53 = v11;
      uint64_t v59 = v5;
      v62 = v7;
      uint64_t v65 = v6;
      uint64_t v68 = v9;
      uint64_t v32 = v8;
      sub_24CF9F68C(v12, v11, (uint64_t)v13, v14, v16, v15, v18, v17, v19);
      sub_24CF9F68C(v56, v46, (uint64_t)v71, v5, v62, v65, v68, v32, v10);
      sub_24CF9F68C(v12, v53, (uint64_t)v13, v14, v16, v15, v18, v50, v19);
      sub_24CF9F68C(v56, v46, (uint64_t)v71, v5, v62, v65, v68, v32, v10);
      char v31 = sub_24CFA0144(&v81, &v72);
      sub_24CFA078C((uint64_t)v90);
      sub_24CF9F770(v12, v53, v13, v14, v16, v15, v18, v50, v19);
      sub_24CF9F770(v56, v46, v71, v59, v62, v65, v68, v32, v10);
      return v31 & 1;
    }
LABEL_15:
    unint64_t v45 = v19;
    char v33 = v12;
    uint64_t v34 = (uint64_t)v4;
    uint64_t v35 = (uint64_t)v13;
    uint64_t v36 = v14;
    int v37 = v7;
    int v38 = v16;
    uint64_t v39 = v6;
    uint64_t v40 = v9;
    uint64_t v41 = v18;
    uint64_t v42 = v8;
    v43 = v3;
    sub_24CF9F68C(v33, v11, v35, v36, v38, v15, v41, v17, v45);
    sub_24CF9F68C(v43, v20, v34, v5, v37, v39, v40, v42, v10);
    goto LABEL_16;
  }
  if (v19 >> 62) {
    goto LABEL_15;
  }
  v52 = v11;
  v55 = v3;
  uint64_t v48 = v8;
  uint64_t v67 = v9;
  uint64_t v70 = (uint64_t)v4;
  v61 = v7;
  uint64_t v64 = v6;
  uint64_t v58 = v5;
  uint64_t v26 = v17;
  sub_24CFA0830();
  sub_24CF9F68C(v12, v52, (uint64_t)v13, v14, v16, v15, v18, v26, v19);
  sub_24CF9F68C(v55, v20, v70, v58, v61, v64, v67, v48, v10);
  id v27 = v55;
  id v28 = v20;
  id v29 = v12;
  id v30 = v52;
  if ((sub_24CFD3578() & 1) == 0)
  {

    goto LABEL_16;
  }
  char v25 = sub_24CFD3578();

LABEL_11:
  sub_24CFA078C((uint64_t)v90);
  if ((v25 & 1) == 0)
  {
LABEL_17:
    char v31 = 0;
    return v31 & 1;
  }
  char v31 = 1;
  return v31 & 1;
}

uint64_t sub_24CFA078C(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 80);
  uint64_t v4 = *(void **)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void **)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 120);
  uint64_t v9 = *(void *)(a1 + 128);
  unint64_t v10 = *(void *)(a1 + 136);
  sub_24CF9F770(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), *(void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  sub_24CF9F770(v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return a1;
}

unint64_t sub_24CFA0830()
{
  unint64_t result = qword_269848FC0;
  if (!qword_269848FC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269848FC0);
  }
  return result;
}

uint64_t sub_24CFA0870()
{
  sub_24CF9F864(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_24CFA08D4(void *a1)
{
  return sub_24CF9FDD4(a1, v1 + 16);
}

uint64_t sub_24CFA08DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CFA0914(void *a1)
{
  return sub_24CFA008C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24CFA091C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFA092C(uint64_t a1)
{
  return sub_24CF90DDC(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void _s13ConfigurationV4KindOwxx_0(uint64_t a1)
{
}

void *_s13ConfigurationV4KindOwcp_0(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unint64_t v11 = *(void *)(a2 + 64);
  sub_24CF9F68C(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return a1;
}

uint64_t _s13ConfigurationV4KindOwca_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unint64_t v11 = *(void *)(a2 + 64);
  sub_24CF9F68C(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  char v12 = *(void **)a1;
  id v13 = *(void **)(a1 + 8);
  uint64_t v14 = *(void **)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  unint64_t v20 = *(void *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  sub_24CF9F770(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t _s13ConfigurationV4KindOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 64);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unint64_t v12 = *(void *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(void *)(a1 + 64) = v3;
  sub_24CF9F770(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s13ConfigurationV4KindOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)(a1 + 64) >> 57) >> 5) | (4
                                                           * ((*(void *)(a1 + 64) >> 57) & 0x18 | *(void *)(a1 + 64) & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s13ConfigurationV4KindOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)unint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(void *)(result + 64) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_24CFA0C0C(uint64_t a1)
{
  return *(void *)(a1 + 64) >> 62;
}

uint64_t sub_24CFA0C18(uint64_t result)
{
  *(void *)(result + 64) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_24CFA0C28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 64) = *(void *)(result + 64) & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *_s13ConfigurationV4KindOMa()
{
  return &_s13ConfigurationV4KindON;
}

void _s19CreateConfigurationVwxx(uint64_t a1)
{
  sub_24CF9F864(*(id *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 64);
}

uint64_t _s19CreateConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24CF9F760(*(id *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v8 = *(void **)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRetain();
  id v10 = v7;
  swift_unknownObjectRetain();
  swift_retain();
  id v11 = v8;
  return a1;
}

uint64_t _s19CreateConfigurationVwca(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24CF9F760(*(id *)a2, v5);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24CF9F864(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  id v10 = v8;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v11 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v11;
  swift_retain();
  swift_release();
  unint64_t v12 = *(void **)(a2 + 64);
  long long v13 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v12;
  id v14 = v12;

  return a1;
}

uint64_t _s19CreateConfigurationVwta(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24CF9F864(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);

  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  uint64_t v9 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);

  return a1;
}

uint64_t _s19CreateConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s19CreateConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s19CreateConfigurationVMa()
{
  return &_s19CreateConfigurationVN;
}

void _s21RetrieveConfigurationVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 16);
}

void *_s21RetrieveConfigurationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *_s21RetrieveConfigurationVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s21RetrieveConfigurationVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t _s21RetrieveConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s21RetrieveConfigurationVwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s21RetrieveConfigurationVMa()
{
  return &_s21RetrieveConfigurationVN;
}

void *_s21ExplicitConfigurationVwCP(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void _s21ExplicitConfigurationVwxx(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
}

uint64_t _s21ExplicitConfigurationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  char v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t _s21ExplicitConfigurationVwta(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *_s21ExplicitConfigurationVMa()
{
  return &_s21ExplicitConfigurationVN;
}

unint64_t PropagatedSceneSettings.init()@<X0>(unint64_t *a1@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_24CFD37C8()) {
    unint64_t result = sub_24CFA4464(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  *a1 = result;
  return result;
}

uint64_t sub_24CFA1294@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_24CFD37C8()) {
    unint64_t v4 = sub_24CFA4464(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v4 = MEMORY[0x263F8EE88];
  }
  uint64_t v5 = 0;
  unint64_t v11 = v4;
  while (2)
  {
    switch(v5)
    {
      case 0:
        id v6 = &qword_269848FE8;
        goto LABEL_5;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        id v6 = &qword_269848FF0;
LABEL_5:
        sub_24CF949B8(0, v6);
        uint64_t v7 = **(void **)(a1 + 8 * v5);
        swift_retain();
        sub_24CFA2594(&v10, v7);
        swift_release();
        if (++v5 != 8) {
          continue;
        }
        *a2 = v11;
        for (uint64_t i = 7; (unint64_t)(i - 1) < 7; --i)
        {
          sub_24CF949B8(0, &qword_269848FF0);
          swift_release();
        }
        if (i)
        {
          __break(1u);
LABEL_18:
          __break(1u);
          JUMPOUT(0x24CFA1454);
        }
        sub_24CF949B8(0, &qword_269848FE8);
        return swift_release();
      default:
        goto LABEL_18;
    }
  }
}

unint64_t PropagatedSceneSettings.init<each A>(_:)@<X0>(uint64_t **a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_24CFD37C8())
  {
    unint64_t result = sub_24CFA4464(MEMORY[0x263F8EE78]);
    unint64_t v12 = result;
    if (!a2) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t result = MEMORY[0x263F8EE88];
    unint64_t v12 = MEMORY[0x263F8EE88];
    if (!a2)
    {
LABEL_10:
      *a3 = result;
      return result;
    }
  }
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  do
  {
    id v9 = *v7++;
    uint64_t v10 = *v9;
    swift_retain();
    sub_24CFA2594(&v11, v10);
    swift_release();
    --v8;
  }
  while (v8);
  *a3 = v12;
  do
  {
    unint64_t result = swift_release();
    --a2;
  }
  while (a2);
  return result;
}

uint64_t PropagatedSceneSettings.insert<A>(_:)(uint64_t a1)
{
  swift_retain();
  sub_24CFA2594(&v3, a1);
  return swift_release();
}

uint64_t PropagatedSceneSettings.remove<A>(_:)()
{
  uint64_t v1 = swift_retain();
  sub_24CFA3D78(v1, v0);
  swift_release();
  return swift_release();
}

uint64_t static PropagatedSceneSettings.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24CFA163C(*a1, *a2);
}

uint64_t sub_24CFA163C(uint64_t a1, uint64_t a2)
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
      return MEMORY[0x270F9E868](v6, v5);
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
    return sub_24CFA3C20(v7, v8);
  }
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v23 = a1 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a1 + 32);
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v12 = v11 & *(void *)(a1 + 56);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  int64_t v13 = 0;
  int64_t v24 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = a2 + 56;
  if (!v12) {
    goto LABEL_29;
  }
LABEL_27:
  v12 &= v12 - 1;
  for (int64_t i = v13; ; int64_t i = v17)
  {
    swift_retain();
    uint64_t v19 = sub_24CFD3358();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v14 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
    {
LABEL_49:
      swift_release();
      return 0;
    }
    uint64_t v22 = ~v20;
    while ((sub_24CFD3388() & 1) == 0)
    {
      unint64_t v21 = (v21 + 1) & v22;
      if (((*(void *)(v14 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
        goto LABEL_49;
      }
    }
    uint64_t v6 = swift_release();
    int64_t v13 = i;
    if (v12) {
      goto LABEL_27;
    }
LABEL_29:
    int64_t v15 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_54;
    }
    if (v15 >= v24) {
      return 1;
    }
    uint64_t v16 = *(void *)(v23 + 8 * v15);
    int64_t v17 = v13 + 1;
    if (!v16)
    {
      int64_t v17 = v13 + 2;
      if (v13 + 2 >= v24) {
        return 1;
      }
      uint64_t v16 = *(void *)(v23 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v13 + 3;
        if (v13 + 3 >= v24) {
          return 1;
        }
        uint64_t v16 = *(void *)(v23 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v13 + 4;
          if (v13 + 4 >= v24) {
            return 1;
          }
          uint64_t v16 = *(void *)(v23 + 8 * v17);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_44:
    uint64_t v12 = (v16 - 1) & v16;
  }
  uint64_t v18 = v13 + 5;
  if (v13 + 5 >= v24) {
    return 1;
  }
  uint64_t v16 = *(void *)(v23 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v13 + 5;
    goto LABEL_44;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v24) {
      return 1;
    }
    uint64_t v16 = *(void *)(v23 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_44;
    }
  }
LABEL_54:
  __break(1u);
  return MEMORY[0x270F9E868](v6, v5);
}

uint64_t sub_24CFA1960(uint64_t *a1, uint64_t *a2)
{
  return sub_24CFA163C(*a1, *a2);
}

uint64_t sub_24CFA196C@<X0>(unint64_t *a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  v11[0] = &KeyPath;
  uint64_t v9 = swift_getKeyPath();
  v11[1] = &v9;
  uint64_t v8 = swift_getKeyPath();
  v11[2] = &v8;
  uint64_t v7 = swift_getKeyPath();
  v11[3] = &v7;
  uint64_t v6 = swift_getKeyPath();
  _OWORD v11[4] = &v6;
  uint64_t v5 = swift_getKeyPath();
  v11[5] = &v5;
  uint64_t v4 = swift_getKeyPath();
  v11[6] = &v4;
  uint64_t v3 = swift_getKeyPath();
  v11[7] = &v3;
  return sub_24CFA1294((uint64_t)v11, a1);
}

uint64_t sub_24CFA1A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_24CFA489C();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.propagatedSettings.getter()
{
  sub_24CFA46C8();
  return sub_24CFD30B8();
}

uint64_t sub_24CFA1B0C@<X0>(void *a1@<X8>)
{
  sub_24CFA46C8();
  uint64_t result = sub_24CFD30B8();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFA1B5C()
{
  return sub_24CFD30C8();
}

uint64_t EnvironmentValues.propagatedSettings.setter()
{
  return sub_24CFD30C8();
}

uint64_t (*EnvironmentValues.propagatedSettings.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_24CFA46C8();
  sub_24CFD30B8();
  return sub_24CFA1C5C;
}

uint64_t sub_24CFA1C5C(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_24CFD30C8();
  }
  swift_bridgeObjectRetain();
  sub_24CFD30C8();
  return swift_bridgeObjectRelease();
}

uint64_t View.propagateSceneSettings(_:)(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_24CFD3238();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA1E28(uint64_t a1, void (*a2)(uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a2(a1);
  return swift_release();
}

uint64_t sub_24CFA1EE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
  uint64_t v3 = sub_24CFD3698();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    id v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_24CFD3568();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24CFA2180()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269849008);
  uint64_t v3 = sub_24CFD3698();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v8) {
          goto LABEL_33;
        }
        unint64_t v16 = v27[v15];
        ++v11;
        if (!v16)
        {
          int64_t v11 = v15 + 1;
          if (v15 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v16 = v27[v11];
          if (!v16)
          {
            int64_t v11 = v15 + 2;
            if (v15 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v16 = v27[v11];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v27, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v27 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v27[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v27[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
      uint64_t result = sub_24CFD3358();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v9 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_24CFA2460(uint64_t a1, uint64_t a2)
{
  sub_24CFD3568();
  unint64_t result = sub_24CFD3618();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t sub_24CFA24E4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  sub_24CFD3358();
  unint64_t result = sub_24CFD3618();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24CFA2594(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v8 = sub_24CFD3648();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
      swift_dynamicCast();
      *a1 = v18;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24CFD3638();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v16 = sub_24CFA2AD0(v7, result + 1);
    uint64_t v20 = v16;
    if (*(void *)(v16 + 24) <= *(void *)(v16 + 16))
    {
      swift_retain();
      sub_24CFA2180();
      uint64_t v17 = v20;
    }
    else
    {
      uint64_t v17 = v16;
      swift_retain();
    }
    sub_24CFA24E4(a2, v17);
    *uint64_t v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  uint64_t v10 = sub_24CFD3358();
  uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    uint64_t v15 = swift_retain();
    sub_24CFA2EC8(v15, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v13 = ~v11;
  while ((sub_24CFD3388() & 1) == 0)
  {
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_11;
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t sub_24CFA2830(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_24CFD3648();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24CFD3638();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_24CFA2CD0(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_24CFA1EE0();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_24CFA2460((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24CFD3568();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_24CFD3578();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_24CFD3578();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_24CFA3048((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_24CFA2AD0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_269849008);
    uint64_t v2 = sub_24CFD36A8();
    uint64_t v14 = v2;
    sub_24CFD3628();
    for (; sub_24CFD3668(); ++*(void *)(v2 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
      swift_dynamicCast();
      if (*(void *)(v2 + 24) <= *(void *)(v2 + 16))
      {
        sub_24CFA2180();
        uint64_t v2 = v14;
      }
      uint64_t result = sub_24CFD3358();
      uint64_t v4 = v2 + 56;
      uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v6 = result & ~v5;
      unint64_t v7 = v6 >> 6;
      if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
      {
        unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v9 = 0;
        unint64_t v10 = (unint64_t)(63 - v5) >> 6;
        do
        {
          if (++v7 == v10 && (v9 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          BOOL v11 = v7 == v10;
          if (v7 == v10) {
            unint64_t v7 = 0;
          }
          v9 |= v11;
          uint64_t v12 = *(void *)(v4 + 8 * v7);
        }
        while (v12 == -1);
        unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      }
      *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
      *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_24CFA2CD0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
    uint64_t v2 = sub_24CFD36A8();
    uint64_t v14 = v2;
    sub_24CFD3628();
    if (sub_24CFD3668())
    {
      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_24CFA1EE0();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_24CFD3568();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_24CFD3668());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_24CFA2EC8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24CFA2180();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24CFA31D0();
      goto LABEL_12;
    }
    sub_24CFA3528();
  }
  uint64_t v8 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  uint64_t result = sub_24CFD3358();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = ~v9;
    do
    {
      uint64_t result = sub_24CFD3388();
      if (result) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v10;
    }
    while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v11 + 48) + 8 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (!v13)
  {
    *(void *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24CFD38B8();
  __break(1u);
  return result;
}

void sub_24CFA3048(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24CFA1EE0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_24CFA337C();
      goto LABEL_14;
    }
    sub_24CFA37DC();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_24CFD3568();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_24CFD3578();

    if (v12)
    {
LABEL_13:
      sub_24CFD38B8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_24CFD3578();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_24CFA31D0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269849008);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CFD3688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_24CFA337C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CFD3688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24CFA3528()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269849008);
  uint64_t v2 = sub_24CFD3698();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v5 = v1 + 56;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v1 + 56);
  int64_t v25 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v25) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v25) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v25) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(*(void *)(v1 + 48) + 8 * v13);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    uint64_t result = sub_24CFD3358();
    uint64_t v18 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v3 + 48) + 8 * v11) = v17;
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v25)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24CFA37DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
  uint64_t v3 = sub_24CFD3698();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_24CFD3568();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_24CFA3A58(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_24CFD3608();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
        uint64_t v10 = sub_24CFD3358() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_16:
            uint64_t v13 = *(void *)(v3 + 48);
            unint64_t v14 = (void *)(v13 + 8 * v2);
            unint64_t v15 = (void *)(v13 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v14 >= v15 + 1))
            {
              *unint64_t v14 = *v15;
              int64_t v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_24CFA3C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_24CFD3638();
  if (v3 != result) {
    return 0;
  }
  int64_t v5 = 0;
  uint64_t v6 = a2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  uint64_t v9 = v8 & *(void *)(a2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    v9 &= v9 - 1;
LABEL_6:
    swift_retain();
    char v11 = sub_24CFD3678();
    uint64_t result = swift_release();
    if ((v11 & 1) == 0) {
      return 0;
    }
  }
  int64_t v12 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v12 >= v10) {
    return 1;
  }
  uint64_t v13 = *(void *)(v6 + 8 * v12);
  ++v5;
  if (v13) {
    goto LABEL_19;
  }
  int64_t v5 = v12 + 1;
  if (v12 + 1 >= v10) {
    return 1;
  }
  uint64_t v13 = *(void *)(v6 + 8 * v5);
  if (v13)
  {
LABEL_19:
    uint64_t v9 = (v13 - 1) & v13;
    goto LABEL_6;
  }
  int64_t v14 = v12 + 2;
  if (v14 >= v10) {
    return 1;
  }
  uint64_t v13 = *(void *)(v6 + 8 * v14);
  if (v13)
  {
    int64_t v5 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v5 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v5 >= v10) {
      return 1;
    }
    uint64_t v13 = *(void *)(v6 + 8 * v5);
    ++v14;
    if (v13) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_24CFA3D78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((*a2 & 0xC000000000000001) != 0)
  {
    if (v3 < 0) {
      uint64_t v5 = *a2;
    }
    else {
      uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    char v6 = sub_24CFD3678();
    swift_release();
    if (v6)
    {
      uint64_t v7 = sub_24CFA3F40(v5, a1, a2);
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  uint64_t v8 = sub_24CFD3358();
  uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v3 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v11 = ~v9;
  while ((sub_24CFD3388() & 1) == 0)
  {
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v3 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_11;
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *a2;
  uint64_t v15 = *a2;
  *a2 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_24CFA31D0();
    uint64_t v14 = v15;
  }
  uint64_t v7 = *(void *)(*(void *)(v14 + 48) + 8 * v10);
  sub_24CFA3A58(v10);
  *a2 = v15;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_24CFA3F40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24CFD3638();
  uint64_t v5 = swift_unknownObjectRetain();
  uint64_t v6 = sub_24CFA2AD0(v5, v4);
  uint64_t v13 = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
  uint64_t v7 = sub_24CFD3358();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while ((sub_24CFD3388() & 1) == 0)
    {
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      {
        swift_release();
        __break(1u);
        break;
      }
    }
    swift_release();
    uint64_t v11 = *(void *)(*(void *)(v6 + 48) + 8 * v9);
    sub_24CFA3A58(v9);
    if (sub_24CFD3388())
    {
      *a3 = v13;
      return v11;
    }
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_24CFA40C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE88];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848FF8);
  uint64_t v3 = sub_24CFD36B8();
  uint64_t v4 = 0;
  uint64_t v5 = v3 + 56;
  uint64_t v22 = v1;
  uint64_t v23 = a1 + 32;
  do
  {
    int v6 = *(unsigned __int8 *)(v23 + v4++);
    sub_24CFD3948();
    sub_24CFD33D8();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24CFD3978();
    uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
    unint64_t v9 = v7 & v8;
    unint64_t v10 = (v7 & (unint64_t)v8) >> 6;
    uint64_t v11 = *(void *)(v5 + 8 * v10);
    uint64_t v12 = 1 << (v7 & v8);
    if ((v12 & v11) != 0)
    {
      while (1)
      {
        unint64_t v13 = 0x800000024CFD8060;
        unint64_t v14 = 0xD000000000000011;
        switch(*(unsigned char *)(*(void *)(v3 + 48) + v9))
        {
          case 1:
            unint64_t v14 = 0x6F69747265737361;
            unint64_t v13 = 0xED0000646C65486ELL;
            break;
          case 2:
            break;
          case 3:
            unint64_t v13 = 0xE700000000000000;
            unint64_t v14 = 0x656E6563536F6ELL;
            break;
          case 4:
            unint64_t v13 = 0xE700000000000000;
            unint64_t v14 = 0x6E776F6E6B6E75;
            break;
          default:
            unint64_t v13 = 0xE400000000000000;
            unint64_t v14 = 1701736302;
            break;
        }
        unint64_t v15 = 0x800000024CFD8060;
        unint64_t v16 = 0xD000000000000011;
        switch(v6)
        {
          case 1:
            unint64_t v15 = 0xED0000646C65486ELL;
            if (v14 == 0x6F69747265737361) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 2:
            goto LABEL_17;
          case 3:
            unint64_t v15 = 0xE700000000000000;
            unint64_t v16 = 0x656E6563536F6ELL;
LABEL_17:
            if (v14 == v16) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 4:
            unint64_t v15 = 0xE700000000000000;
            if (v14 != 0x6E776F6E6B6E75) {
              goto LABEL_19;
            }
            goto LABEL_18;
          default:
            unint64_t v15 = 0xE400000000000000;
            if (v14 != 1701736302) {
              goto LABEL_19;
            }
LABEL_18:
            if (v13 == v15)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_4;
            }
LABEL_19:
            char v17 = sub_24CFD38A8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v17) {
              goto LABEL_4;
            }
            unint64_t v9 = (v9 + 1) & v8;
            unint64_t v10 = v9 >> 6;
            uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
            uint64_t v12 = 1 << v9;
            if ((v11 & (1 << v9)) == 0) {
              goto LABEL_24;
            }
            break;
        }
      }
    }
LABEL_24:
    *(void *)(v5 + 8 * v10) = v12 | v11;
    *(unsigned char *)(*(void *)(v3 + 48) + v9) = v6;
    uint64_t v18 = *(void *)(v3 + 16);
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19)
    {
      __break(1u);
      JUMPOUT(0x24CFA4428);
    }
    *(void *)(v3 + 16) = v20;
LABEL_4:
    ;
  }
  while (v4 != v22);
  return v3;
}

unint64_t sub_24CFA4464(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24CFD37C8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(qword_269849008);
      uint64_t result = sub_24CFD36B8();
      unint64_t v3 = result;
      unint64_t v19 = v1;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_24CFD37C8();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v4) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
  unint64_t v19 = v1;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return v3;
  }
LABEL_9:
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  uint64_t v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    uint64_t result = MEMORY[0x253319E30](v6, v19);
    unint64_t v8 = result;
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      goto LABEL_25;
    }
LABEL_17:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    uint64_t result = sub_24CFD3358();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      while (1)
      {
        uint64_t result = sub_24CFD3388();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          uint64_t v4 = v18;
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
      uint64_t v4 = v18;
      if (v6 == v18) {
        return v3;
      }
    }
    else
    {
LABEL_22:
      *(void *)(v7 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_26;
      }
      *(void *)(v3 + 16) = v17;
      if (v6 == v4) {
        return v3;
      }
    }
  }
  if (v6 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_27;
  }
  unint64_t v8 = *(void *)(v19 + 32 + 8 * v6);
  uint64_t result = swift_retain();
  BOOL v9 = __OFADD__(v6++, 1);
  if (!v9) {
    goto LABEL_17;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_24CFA46C8()
{
  unint64_t result = qword_269848FC8;
  if (!qword_269848FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848FC8);
  }
  return result;
}

uint64_t sub_24CFA471C@<X0>(void *a1@<X8>)
{
  sub_24CFA46C8();
  uint64_t result = sub_24CFD30B8();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFA4770()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFA47A8(uint64_t a1)
{
  return sub_24CFA1E28(a1, *(void (**)(uint64_t))(v1 + 16));
}

ValueMetadata *type metadata accessor for PropagatedSceneSettings()
{
  return &type metadata for PropagatedSceneSettings;
}

uint64_t sub_24CFA47C0()
{
  return swift_getWitnessTable();
}

unint64_t sub_24CFA4830()
{
  unint64_t result = qword_269848FD8;
  if (!qword_269848FD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269848FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848FD8);
  }
  return result;
}

ValueMetadata *_s24__Key_propagatedSettingsVMa()
{
  return &_s24__Key_propagatedSettingsVN;
}

unint64_t sub_24CFA489C()
{
  unint64_t result = qword_269848FE0;
  if (!qword_269848FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848FE0);
  }
  return result;
}

char *keypath_get_selector_displayConfiguration()
{
  return sel_displayConfiguration;
}

id sub_24CFA48FC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_displayConfiguration);
  *a2 = result;
  return result;
}

id sub_24CFA4968@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_interfaceOrientation);
  *a2 = result;
  return result;
}

id sub_24CFA499C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterfaceOrientation_, *a1);
}

void sub_24CFA49B0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24CFD37C8();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_269848B98);
      uint64_t v3 = sub_24CFD36B8();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24CFD37C8();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x253319E30](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_24CFD3568();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_24CFD3578();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_24CFD3578();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_24CFD3568();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_24CFD3578();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_24CFD3578();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_24CFA4D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_24CFA4D14()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24CFA4DA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_24CFA4E5C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24CFA4E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CFA4ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CFA4F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CFA4F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24CFA4FC8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_24CFA5124(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x24CFA533CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for UnsafeSendable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFA537C()
{
  return sub_24CFD3388() & 1;
}

uint64_t sub_24CFA53A4()
{
  return sub_24CFA537C();
}

uint64_t sub_24CFA53B0(uint64_t a1, uint64_t a2)
{
  return sub_24CFA5410(a1, a2, MEMORY[0x263F8E0D0]);
}

uint64_t sub_24CFA53C8(uint64_t a1, uint64_t a2)
{
  return sub_24CFA5410(a1, *(void *)(a2 - 8), MEMORY[0x263F8E0D0]);
}

uint64_t sub_24CFA53F8(uint64_t a1, uint64_t a2)
{
  return sub_24CFA5410(a1, a2, MEMORY[0x263F8E2B0]);
}

uint64_t sub_24CFA5410(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t))
{
  return 60;
}

uint64_t sub_24CFA54B8(uint64_t a1, uint64_t a2)
{
  return sub_24CFA5410(a1, *(void *)(a2 - 8), MEMORY[0x263F8E2B0]);
}

uint64_t sub_24CFA54E8()
{
  uint64_t v0 = sub_24CFD2F48();
  __swift_allocate_value_buffer(v0, qword_26984D1E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26984D1E0);
  return sub_24CFD2F38();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24CFA55FC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  sub_24CFA8370(v1, *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle + 8));
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24CFA574C(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  sub_24CFA8380(a1, a2);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA5890(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFA8370(a2, a3);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle + 8);
  *uint64_t v6 = a2;
  v6[1] = (uint64_t)a3;
  sub_24CFA8380(v7, v8);
  swift_release();
  return swift_release();
}

void *sub_24CFA59B4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration);
  id v2 = v1;
  swift_release();
  swift_release();
  return v1;
}

void sub_24CFA5AF4(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

void sub_24CFA5C20(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v5 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration);
  *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration) = a2;
  swift_release();
  swift_release();
}

double sub_24CFA5D34()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24CFA5E78()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA5FAC(uint64_t a1, double a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(double *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level) = a2;
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA60B4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24CFA61F0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA6320(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground) = a2 & 1;
  swift_release();
  return swift_release();
}

double sub_24CFA642C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24CFA658C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA66D8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v10 = (double *)(a1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame);
  *unsigned int v10 = a2;
  v10[1] = a3;
  v10[2] = a4;
  void v10[3] = a5;
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA67FC()
{
  return sub_24CFA694C((uint64_t)&unk_24CFD6510, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation);
}

uint64_t sub_24CFA6810()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA6938()
{
  return sub_24CFA694C((uint64_t)&unk_24CFD6538, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle);
}

uint64_t sub_24CFA694C(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFA8318();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)(v2 + *a2);
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_24CFA6A90()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA6BB8()
{
  return sub_24CFA694C((uint64_t)&unk_24CFD6560, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation);
}

uint64_t sub_24CFA6BCC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFA8318();
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA6CF4(uint64_t a1, uint64_t a2, void *a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + *a3) = a2;
  swift_release();
  return swift_release();
}

void sub_24CFA6DFC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v3 - 8);
  unsigned int v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_settings);
  id v7 = objc_msgSend(v6, sel_displayConfiguration);

  id v8 = objc_msgSend(a1, sel_settings);
  objc_msgSend(v8, sel_level);
  uint64_t v10 = v9;

  id v11 = objc_msgSend(a1, sel_settings);
  objc_msgSend(v11, sel_frame);
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  id v20 = objc_msgSend(a1, sel_settings);
  unsigned int v35 = objc_msgSend(v20, sel_isForeground);

  id v21 = objc_msgSend(a1, sel_settings);
  id v22 = objc_msgSend(v21, sel_interfaceOrientation);

  id v23 = objc_msgSend(a1, sel_settings);
  self;
  uint64_t v24 = (void *)swift_dynamicCastObjCClass();
  uint64_t v25 = v24;
  if (v24)
  {
    id v26 = objc_msgSend(v24, sel_userInterfaceStyle);
    id v27 = objc_msgSend(v25, sel_deviceOrientation);
  }
  else
  {

    id v27 = 0;
    id v26 = 0;
  }
  uint64_t v28 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v5, 1, 1, v28);
  sub_24CFD3488();
  id v29 = v1;
  id v30 = v7;
  uint64_t v31 = sub_24CFD3478();
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = MEMORY[0x263F8F500];
  *(void *)(v32 + 16) = v31;
  *(void *)(v32 + 24) = v33;
  *(void *)(v32 + 32) = v29;
  *(void *)(v32 + 40) = v7;
  *(void *)(v32 + 48) = v10;
  *(void *)(v32 + 56) = v13;
  *(void *)(v32 + 64) = v15;
  *(void *)(v32 + 72) = v17;
  *(void *)(v32 + 80) = v19;
  *(unsigned char *)(v32 + 88) = v35;
  *(void *)(v32 + 96) = v22;
  *(void *)(v32 + 104) = v26;
  *(void *)(v32 + 112) = v27;
  sub_24CF9A4D8((uint64_t)v5, (uint64_t)&unk_269849188, v32);
  swift_release();
}

uint64_t sub_24CFA70DC(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  *(void *)(v13 + 88) = a13;
  *(void *)(v13 + 96) = v18;
  *(void *)(v13 + 80) = a12;
  *(unsigned char *)(v13 + 120) = a11;
  *(double *)(v13 + 64) = a4;
  *(double *)(v13 + 72) = a5;
  *(double *)(v13 + 48) = a2;
  *(double *)(v13 + 56) = a3;
  *(double *)(v13 + 40) = a1;
  *(void *)(v13 + 24) = a9;
  *(void *)(v13 + 32) = a10;
  *(void *)(v13 + 104) = sub_24CFD3488();
  *(void *)(v13 + 112) = sub_24CFD3478();
  uint64_t v15 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CFA7198, v15, v14);
}

uint64_t sub_24CFA7198()
{
  double v1 = *(void **)(v0 + 32);
  swift_release();
  id v2 = v1;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  swift_getKeyPath();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *(void *)(v0 + 16) = v4;
  sub_24CFA8318();
  sub_24CFD2EC8();

  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  *(void *)(v0 + 16) = v7;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v9 = *(void *)(v0 + 72);
  long long v27 = *(_OWORD *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v12 = swift_task_alloc();
  *(void *)(v12 + 16) = v11;
  *(_OWORD *)(v12 + 24) = v27;
  *(void *)(v12 + 40) = v10;
  *(void *)(v12 + 48) = v9;
  *(void *)(v0 + 16) = v11;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v13 = *(unsigned char *)(v0 + 120);
  uint64_t v14 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v15 = swift_task_alloc();
  *(void *)(v15 + 16) = v14;
  *(unsigned char *)(v15 + 24) = v13;
  *(void *)(v0 + 16) = v14;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v17 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v18 = swift_task_alloc();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v16;
  *(void *)(v0 + 16) = v17;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v19 = *(void *)(v0 + 88);
  uint64_t v20 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v21 = swift_task_alloc();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v19;
  *(void *)(v0 + 16) = v20;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = *(void *)(v0 + 96);
  uint64_t v23 = *(void *)(v0 + 24);
  swift_getKeyPath();
  uint64_t v24 = swift_task_alloc();
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v22;
  *(void *)(v0 + 16) = v23;
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

id sub_24CFA789C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostedSceneObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CFA7978()
{
  return type metadata accessor for HostedSceneObserver();
}

uint64_t type metadata accessor for HostedSceneObserver()
{
  uint64_t result = qword_2698490E8;
  if (!qword_2698490E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFA79CC()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CFA7AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 56) = a5;
  *(void *)(v6 + 24) = a4;
  *(void *)(v6 + 32) = a6;
  *(void *)(v6 + 40) = sub_24CFD3488();
  *(void *)(v6 + 48) = sub_24CFD3478();
  uint64_t v8 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CFA7B44, v8, v7);
}

uint64_t sub_24CFA7B44()
{
  unint64_t v1 = *(void **)(v0 + 32);
  swift_release();
  id v2 = v1;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(unsigned __int8 *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  swift_getKeyPath();
  uint64_t v6 = (void *)swift_task_alloc();
  v6[2] = v5;
  v6[3] = v3;
  v6[4] = v4;
  *(void *)(v0 + 16) = v5;
  sub_24CFA8318();
  sub_24CFD2EC8();

  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t initializeBufferWithCopyOfBuffer for HostHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void destroy for HostHandle(uint64_t a1)
{
}

uint64_t assignWithCopy for HostHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  id v4 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  id v5 = v4;

  return a1;
}

uint64_t assignWithTake for HostHandle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for HostHandle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HostHandle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostHandle()
{
  return &type metadata for HostHandle;
}

void sub_24CFA7F84(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    unsigned __int8 v6 = objc_msgSend(a1, sel_isLocal);
    id v7 = objc_msgSend(a1, sel_auditToken);
    objc_msgSend(v7, sel_copy);

    sub_24CFD35B8();
    swift_unknownObjectRelease();
    sub_24CF949B8(0, &qword_269849170);
    if (swift_dynamicCast()) {
      uint64_t v8 = (void *)v15[1];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
  sub_24CFD3488();
  id v10 = v8;
  id v11 = v1;
  uint64_t v12 = sub_24CFD3478();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v14;
  *(void *)(v13 + 32) = v11;
  *(unsigned char *)(v13 + 40) = v6;
  *(void *)(v13 + 48) = v8;
  sub_24CF9A4D8((uint64_t)v5, (uint64_t)&unk_269849168, v13);
  swift_release();
}

uint64_t sub_24CFA8174()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CFA81BC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24CFA8908;
  return sub_24CFA7AA4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24CFA8288@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFA55FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CFA82B4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)a1[1];
  sub_24CFA8370(*a1, v2);
  return sub_24CFA574C(v1, (uint64_t)v2);
}

uint64_t sub_24CFA82F8()
{
  return sub_24CFA5890(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_24CFA8318()
{
  unint64_t result = qword_269849178;
  if (!qword_269849178)
  {
    type metadata accessor for HostedSceneObserver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269849178);
  }
  return result;
}

id sub_24CFA8370(uint64_t a1, void *a2)
{
  if (a2 != (void *)1) {
    return a2;
  }
  return result;
}

uint64_t sub_24CFA8380(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t sub_24CFA8390()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_24CFA83D8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  double v8 = *(double *)(v1 + 48);
  double v9 = *(double *)(v1 + 56);
  double v10 = *(double *)(v1 + 64);
  double v11 = *(double *)(v1 + 72);
  double v12 = *(double *)(v1 + 80);
  char v13 = *(unsigned char *)(v1 + 88);
  uint64_t v14 = *(void *)(v1 + 96);
  uint64_t v15 = *(void *)(v1 + 104);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v16;
  *uint64_t v16 = v2;
  v16[1] = sub_24CF9A3CC;
  return sub_24CFA70DC(v8, v9, v10, v11, v12, a1, v4, v5, v6, v7, v13, v14, v15);
}

void *sub_24CFA84F8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24CFA59B4();
  *a1 = result;
  return result;
}

void sub_24CFA8524(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24CFA5AF4(v1);
}

void sub_24CFA8554()
{
  sub_24CFA5C20(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24CFA8570(double *a1@<X8>)
{
  *a1 = sub_24CFA5D34();
}

uint64_t sub_24CFA859C()
{
  return sub_24CFA5E78();
}

uint64_t sub_24CFA85C4()
{
  return sub_24CFA5FAC(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

void sub_24CFA85E4(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_24CFA642C();
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
}

uint64_t sub_24CFA8614()
{
  return sub_24CFA658C();
}

uint64_t sub_24CFA8640()
{
  return sub_24CFA8838();
}

uint64_t sub_24CFA8658@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CFA60B4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CFA8688()
{
  return sub_24CFA61F0();
}

uint64_t sub_24CFA86B0()
{
  return sub_24CFA6320(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CFA86D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFA67FC();
  *a1 = result;
  return result;
}

uint64_t sub_24CFA86FC()
{
  return sub_24CFA6810();
}

uint64_t sub_24CFA8724()
{
  return sub_24CFA6CF4(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation);
}

uint64_t sub_24CFA8748@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFA6938();
  *a1 = result;
  return result;
}

uint64_t sub_24CFA8774()
{
  return sub_24CFA6A90();
}

uint64_t sub_24CFA879C()
{
  return sub_24CFA6CF4(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle);
}

uint64_t sub_24CFA87C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFA6BB8();
  *a1 = result;
  return result;
}

uint64_t sub_24CFA87EC()
{
  return sub_24CFA6BCC();
}

uint64_t sub_24CFA8814()
{
  return sub_24CFA6CF4(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation);
}

uint64_t sub_24CFA8838()
{
  return sub_24CFA66D8(*(void *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_24CFA885C()
{
  return sub_24CFA8814();
}

uint64_t sub_24CFA8874()
{
  return sub_24CFA879C();
}

uint64_t sub_24CFA888C()
{
  return sub_24CFA8724();
}

uint64_t sub_24CFA88A4()
{
  return sub_24CFA86B0();
}

uint64_t sub_24CFA88BC()
{
  return sub_24CFA85C4();
}

void sub_24CFA88D4()
{
}

uint64_t sub_24CFA88EC()
{
  return sub_24CFA82F8();
}

void sub_24CFA890C(void *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t (*Transaction.sceneTransitioner.getter())(uint64_t, uint64_t)
{
  sub_24CFA89A4();
  sub_24CFD2F98();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_24CFA8B20;
}

unint64_t sub_24CFA89A4()
{
  unint64_t result = qword_269849190;
  if (!qword_269849190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849190);
  }
  return result;
}

double sub_24CFA89F8@<D0>(_OWORD *a1@<X8>)
{
  sub_24CFA89A4();
  sub_24CFD2F98();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24CFA8A4C()
{
  return sub_24CFD2FA8();
}

uint64_t sub_24CFA8AAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t *))
{
  uint64_t v4 = a2;
  uint64_t v5 = a1;
  return a3(&v5, &v4);
}

uint64_t sub_24CFA8AE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t Transaction.sceneTransitioner.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_24CFA89A4();
  return sub_24CFD2FA8();
}

uint64_t sub_24CFA8BA0(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

void (*Transaction.sceneTransitioner.modify(void *a1))(uint64_t **a1, char a2)
{
  long long v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_24CFA89A4();
  sub_24CFD2F98();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = *((_OWORD *)v3 + 1);
  *long long v3 = sub_24CFA8B20;
  v3[1] = v4;
  return sub_24CFA8C84;
}

void sub_24CFA8C84(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    *(void *)(v5 + 24) = v3;
    v2[2] = (uint64_t)sub_24CFA958C;
    v2[3] = v5;
    swift_retain();
    sub_24CFD2FA8();
    swift_release();
  }
  else
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v3;
    v2[2] = (uint64_t)sub_24CFA958C;
    v2[3] = v6;
    sub_24CFD2FA8();
  }
  free(v2);
}

uint64_t sub_24CFA8D74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t Transaction.init(sceneTransitioner:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_24CFA89A4();
  sub_24CFD2FA8();
  return 0;
}

uint64_t Transaction.init(actions:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_24CFA9560;
  *(void *)(v3 + 24) = v2;
  sub_24CFA89A4();
  sub_24CFD2FA8();
  return 0;
}

uint64_t sub_24CFA8ED8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t Transaction.init(action:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_269849198);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CFD6590;
  *(void *)(inited + 32) = a1;
  unint64_t v12 = inited;
  sub_24CFD3448();
  if (v12 >> 62)
  {
    id v7 = a1;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_24CFD37C8();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v4 = a1;
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_24CFA49B0(v12);
  uint64_t v6 = v5;
LABEL_6:
  swift_bridgeObjectRelease();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_24CFA9560;
  *(void *)(v10 + 24) = v9;
  sub_24CFA89A4();
  sub_24CFD2FA8();

  return 0;
}

uint64_t withSceneTransition<A>(transitioner:body:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  sub_24CFA9140(KeyPath);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFA9140(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  v4[1] = 0;
  (*(void (**)(char *))(v2 + 16))((char *)v4 - v1);
  swift_setAtWritableKeyPath();
  swift_retain();
  sub_24CFD3068();
  return swift_release_n();
}

uint64_t withSceneActions<A>(_:body:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  swift_bridgeObjectRetain();
  withSceneTransition<A>(transitioner:body:)((uint64_t)sub_24CFA9534, v2);
  return swift_release();
}

void sub_24CFA9340(uint64_t a1, void *a2)
{
  sub_24CF91024();
  sub_24CF91064();
  id v3 = (id)sub_24CFD34C8();
  objc_msgSend(a2, sel_setActions_, v3);
}

uint64_t withSceneAction<A>(_:body:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_269849198);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CFD6590;
  *(void *)(inited + 32) = a1;
  unint64_t v10 = inited;
  sub_24CFD3448();
  if (v10 >> 62)
  {
    id v7 = a1;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_24CFD37C8();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v4 = a1;
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_24CFA49B0(v10);
  uint64_t v6 = v5;
LABEL_6:
  swift_bridgeObjectRelease();
  withSceneActions<A>(_:body:)(v6);
  return swift_bridgeObjectRelease();
}

double sub_24CFA94DC@<D0>(_OWORD *a1@<X8>)
{
  sub_24CFA89A4();
  sub_24CFD2F98();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_24CFA9534(uint64_t a1, void *a2)
{
}

ValueMetadata *_s23__Key_sceneTransitionerVMa()
{
  return &_s23__Key_sceneTransitionerVN;
}

uint64_t sub_24CFA9590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_24CFA9598()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CFA9670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 184) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    uint64_t v40 = v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v45 = *(void *)(a3 + 16);
    uint64_t v10 = *(void *)a2;
    uint64_t v11 = *(void *)(a2 + 8);
    char v12 = *(unsigned char *)(a2 + 16);
    uint64_t v44 = *(void *)(v45 - 8);
    sub_24CFA98D8();
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v11;
    *(unsigned char *)(a1 + 16) = v12;
    uint64_t v46 = a1;
    unint64_t v13 = a1 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v14 = a2 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
    uint64_t v16 = *(void *)(v14 + 32);
    LOBYTE(v11) = *(unsigned char *)(v14 + 40);
    sub_24CFA98D8();
    *(void *)(v13 + 24) = v15;
    *(void *)(v13 + 32) = v16;
    *(unsigned char *)(v13 + 40) = v11;
    uint64_t v17 = *(void **)(v14 + 48);
    uint64_t v18 = *(void **)(v14 + 56);
    uint64_t v19 = *(void *)(v14 + 64);
    uint64_t v20 = *(void **)(v14 + 80);
    uint64_t v21 = *(void *)(v14 + 88);
    uint64_t v22 = *(void *)(v14 + 96);
    uint64_t v23 = *(void *)(v14 + 104);
    uint64_t v42 = *(void *)(v14 + 72);
    unint64_t v43 = *(void *)(v14 + 112);
    sub_24CF9F68C(v17, v18, v19, v42, v20, v21, v22, v23, v43);
    *(void *)(v13 + 48) = v17;
    *(void *)(v13 + 56) = v18;
    *(void *)(v13 + 64) = v19;
    *(void *)(v13 + 72) = v42;
    *(void *)(v13 + 80) = v20;
    *(void *)(v13 + 88) = v21;
    *(void *)(v13 + 96) = v22;
    *(void *)(v13 + 104) = v23;
    *(void *)(v13 + 112) = v43;
    uint64_t v24 = (void *)((v13 + 127) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (void *)((v14 + 127) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v26 = (unint64_t)v25 + 23;
    unint64_t v27 = (unint64_t)v25 + 63;
    unint64_t v28 = (unint64_t)v24 + 23;
    *uint64_t v24 = *v25;
    unint64_t v29 = (unint64_t)v24 + 63;
    unint64_t v30 = ((unint64_t)v24 + 11) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v31 = ((unint64_t)v25 + 11) & 0xFFFFFFFFFFFFFFF8;
    int v32 = *(_DWORD *)v31;
    *(unsigned char *)(v30 + 4) = *(unsigned char *)(v31 + 4);
    *(_DWORD *)unint64_t v30 = v32;
    unint64_t v33 = v28 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v34 = *(void *)(v26 & 0xFFFFFFFFFFFFFFF8);
    uint64_t v35 = *(void *)((v26 & 0xFFFFFFFFFFFFFFF8) + 8);
    uint64_t v36 = *(void *)((v26 & 0xFFFFFFFFFFFFFFF8) + 16);
    uint64_t v37 = *(void *)((v26 & 0xFFFFFFFFFFFFFFF8) + 24);
    LOBYTE(v20) = *(unsigned char *)((v26 & 0xFFFFFFFFFFFFFFF8) + 32);
    sub_24CFA98E4(v34, v35, v36, v37, v20);
    *(void *)unint64_t v33 = v34;
    *(void *)(v33 + 8) = v35;
    *(void *)(v33 + 16) = v36;
    *(void *)(v33 + 24) = v37;
    *(unsigned char *)(v33 + 32) = (_BYTE)v20;
    *(void *)(v29 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v27 & 0xFFFFFFFFFFFFFFF8);
    unint64_t v38 = ((v27 & 0xFFFFFFFFFFFFFFF8) + v6 + 8) & ~v6;
    uint64_t v39 = *(void (**)(unint64_t, unint64_t, uint64_t))(v44 + 16);
    swift_retain();
    v39(((v29 & 0xFFFFFFFFFFFFFFF8) + v6 + 8) & ~v6, v38, v45);
    return v46;
  }
  return v40;
}

uint64_t sub_24CFA98D8()
{
  return swift_retain();
}

uint64_t sub_24CFA98E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 1u) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CFA9904(uint64_t a1, uint64_t a2)
{
  sub_24CFA99E4();
  a1 &= 0xFFFFFFFFFFFFFFF8;
  sub_24CFA99E4();
  sub_24CF9F770(*(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void *)(a1 + 72), *(void **)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112));
  unint64_t v4 = (a1 + 127) & 0xFFFFFFFFFFFFFFF8;
  sub_24CFA99F0(*(void *)((v4 + 23) & 0xFFFFFFFFFFFFFFF8), *(void *)(((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(void *)(((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 16), *(void *)(((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 24), *(unsigned char *)(((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 32));
  swift_release();
  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (((v4 + 63) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return v6(v7);
}

uint64_t sub_24CFA99E4()
{
  return swift_release();
}

uint64_t sub_24CFA99F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 1u) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CFA9A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 16);
  sub_24CFA98D8();
  uint64_t v44 = a1;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  unint64_t v8 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  uint64_t v11 = *(void *)(v9 + 32);
  LOBYTE(v6) = *(unsigned char *)(v9 + 40);
  sub_24CFA98D8();
  *(void *)(v8 + 24) = v10;
  *(void *)(v8 + 32) = v11;
  *(unsigned char *)(v8 + 40) = v6;
  char v12 = *(void **)(v9 + 48);
  unint64_t v13 = *(void **)(v9 + 56);
  uint64_t v14 = *(void *)(v9 + 64);
  uint64_t v15 = *(void *)(v9 + 72);
  uint64_t v16 = *(void **)(v9 + 80);
  uint64_t v17 = *(void *)(v9 + 88);
  uint64_t v18 = *(void *)(v9 + 96);
  uint64_t v19 = *(void *)(v9 + 104);
  unint64_t v42 = *(void *)(v9 + 112);
  sub_24CF9F68C(v12, v13, v14, v15, v16, v17, v18, v19, v42);
  *(void *)(v8 + 48) = v12;
  *(void *)(v8 + 56) = v13;
  *(void *)(v8 + 64) = v14;
  *(void *)(v8 + 72) = v15;
  *(void *)(v8 + 80) = v16;
  *(void *)(v8 + 88) = v17;
  *(void *)(v8 + 96) = v18;
  *(void *)(v8 + 104) = v19;
  *(void *)(v8 + 112) = v42;
  uint64_t v20 = (void *)((v8 + 127) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)((v9 + 127) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (unint64_t)v21 + 23;
  uint64_t v23 = v21;
  unint64_t v24 = (unint64_t)v20 + 23;
  uint64_t v25 = v20;
  *uint64_t v20 = *v21;
  unint64_t v26 = ((unint64_t)v20 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = ((unint64_t)v21 + 11) & 0xFFFFFFFFFFFFFFF8;
  int v28 = *(_DWORD *)v27;
  *(unsigned char *)(v26 + 4) = *(unsigned char *)(v27 + 4);
  *(_DWORD *)unint64_t v26 = v28;
  unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = *(void *)(v22 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v31 = *(void *)((v22 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v32 = *(void *)((v22 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v33 = *(void *)((v22 & 0xFFFFFFFFFFFFFFF8) + 24);
  LOBYTE(v16) = *(unsigned char *)((v22 & 0xFFFFFFFFFFFFFFF8) + 32);
  sub_24CFA98E4(v30, v31, v32, v33, v16);
  *(void *)unint64_t v29 = v30;
  *(void *)(v29 + 8) = v31;
  *(void *)(v29 + 16) = v32;
  *(void *)(v29 + 24) = v33;
  *(unsigned char *)(v29 + 32) = (_BYTE)v16;
  uint64_t v34 = (void *)(((unint64_t)v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v35 = (void *)(((unint64_t)v23 + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v34 = *v35;
  uint64_t v36 = *(void *)(a3 + 16);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16);
  uint64_t v38 = *(unsigned __int8 *)(*(void *)(v36 - 8) + 80);
  uint64_t v39 = ((unint64_t)v34 + v38 + 8) & ~v38;
  uint64_t v40 = ((unint64_t)v35 + v38 + 8) & ~v38;
  swift_retain();
  v37(v39, v40, v36);
  return v44;
}

uint64_t sub_24CFA9BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 16);
  sub_24CFA98D8();
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  uint64_t v51 = a1;
  sub_24CFA99E4();
  a1 &= 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = a2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  LOBYTE(v6) = *(unsigned char *)(v8 + 40);
  sub_24CFA98D8();
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 40) = v6;
  sub_24CFA99E4();
  uint64_t v11 = *(void **)(v8 + 48);
  char v12 = *(void **)(v8 + 56);
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(void *)(v8 + 72);
  uint64_t v15 = *(void **)(v8 + 80);
  uint64_t v16 = *(void *)(v8 + 88);
  uint64_t v17 = *(void *)(v8 + 96);
  uint64_t v18 = *(void *)(v8 + 104);
  unint64_t v50 = *(void *)(v8 + 112);
  sub_24CF9F68C(v11, v12, v13, v14, v15, v16, v17, v18, v50);
  uint64_t v19 = *(void **)(a1 + 48);
  uint64_t v20 = *(void **)(a1 + 56);
  uint64_t v21 = *(void **)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  uint64_t v23 = *(void **)(a1 + 80);
  uint64_t v24 = *(void *)(a1 + 88);
  uint64_t v25 = *(void *)(a1 + 96);
  uint64_t v26 = *(void *)(a1 + 104);
  unint64_t v27 = *(void *)(a1 + 112);
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v17;
  *(void *)(a1 + 104) = v18;
  *(void *)(a1 + 112) = v50;
  sub_24CF9F770(v19, v20, v21, v22, v23, v24, v25, v26, v27);
  int v28 = (void *)((a1 + 127) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v29 = (void *)((v8 + 127) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v30 = (unint64_t)v29 + 23;
  uint64_t v31 = v29;
  unint64_t v32 = (unint64_t)v28 + 23;
  *int v28 = *v29;
  unint64_t v33 = (unint64_t)v28 + 63;
  unint64_t v34 = ((unint64_t)v28 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = ((unint64_t)v29 + 11) & 0xFFFFFFFFFFFFFFF8;
  int v36 = *(_DWORD *)v35;
  *(unsigned char *)(v34 + 4) = *(unsigned char *)(v35 + 4);
  *(_DWORD *)unint64_t v34 = v36;
  unint64_t v37 = v32 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = *(void *)(v30 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v39 = *(void *)((v30 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v40 = *(void *)((v30 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v41 = *(void *)((v30 & 0xFFFFFFFFFFFFFFF8) + 24);
  LOBYTE(v15) = *(unsigned char *)((v30 & 0xFFFFFFFFFFFFFFF8) + 32);
  sub_24CFA98E4(v38, v39, v40, v41, v15);
  uint64_t v42 = *(void *)v37;
  uint64_t v43 = *(void *)(v37 + 8);
  uint64_t v44 = *(void *)(v37 + 16);
  uint64_t v45 = *(void *)(v37 + 24);
  *(void *)unint64_t v37 = v38;
  *(void *)(v37 + 8) = v39;
  *(void *)(v37 + 16) = v40;
  *(void *)(v37 + 24) = v41;
  unsigned __int8 v46 = *(unsigned char *)(v37 + 32);
  *(unsigned char *)(v37 + 32) = (_BYTE)v15;
  sub_24CFA99F0(v42, v43, v44, v45, v46);
  v33 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v47 = (void *)(((unint64_t)v31 + 63) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v33 = *v47;
  swift_retain();
  swift_release();
  uint64_t v48 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v48 + 24))((*(unsigned __int8 *)(v48 + 80) + 8 + v33) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80), ((unint64_t)v47 + *(unsigned __int8 *)(v48 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
  return v51;
}

uint64_t sub_24CFA9E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF8;
  long long v5 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(unsigned char *)(v4 + 40) = *(unsigned char *)((a2 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(_OWORD *)(v4 + 24) = v5;
  long long v7 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 80);
  long long v6 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 96);
  long long v8 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 64);
  *(void *)(v4 + 112) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 112);
  *(_OWORD *)(v4 + 80) = v7;
  *(_OWORD *)(v4 + 96) = v6;
  *(_OWORD *)(v4 + 64) = v8;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
  uint64_t v9 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v9 = *v10;
  unint64_t v11 = ((unint64_t)v9 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = ((unint64_t)v10 + 11) & 0xFFFFFFFFFFFFFFF8;
  int v13 = *(_DWORD *)v12;
  *(unsigned char *)(v11 + 4) = *(unsigned char *)(v12 + 4);
  *(_DWORD *)unint64_t v11 = v13;
  unint64_t v14 = ((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v16 = *(_OWORD *)v15;
  long long v17 = *(_OWORD *)(v15 + 16);
  *(unsigned char *)(v14 + 32) = *(unsigned char *)(v15 + 32);
  *(_OWORD *)unint64_t v14 = v16;
  *(_OWORD *)(v14 + 16) = v17;
  uint64_t v18 = (void *)(((unint64_t)v9 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)v10 + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  uint64_t v20 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 32))(((unint64_t)v18 + *(unsigned __int8 *)(v20 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), ((unint64_t)v19 + *(unsigned __int8 *)(v20 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_24CFA9F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24CFA99E4();
  unint64_t v7 = a1 & 0xFFFFFFFFFFFFFFF8;
  v4 &= 0xFFFFFFFFFFFFFFF8;
  char v8 = *(unsigned char *)(v4 + 40);
  *(_OWORD *)(v7 + 24) = *(_OWORD *)(v4 + 24);
  *(unsigned char *)(v7 + 40) = v8;
  sub_24CFA99E4();
  uint64_t v9 = *(void *)(v4 + 112);
  uint64_t v10 = *(void **)((a1 & 0xFFFFFFFFFFFFFFF8) + 48);
  unint64_t v11 = *(void **)((a1 & 0xFFFFFFFFFFFFFFF8) + 56);
  unint64_t v12 = *(void **)((a1 & 0xFFFFFFFFFFFFFFF8) + 64);
  uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 72);
  unint64_t v14 = *(void **)((a1 & 0xFFFFFFFFFFFFFFF8) + 80);
  uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 88);
  uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 96);
  uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 104);
  unint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 112);
  long long v19 = *(_OWORD *)(v4 + 64);
  long long v20 = *(_OWORD *)(v4 + 80);
  long long v21 = *(_OWORD *)(v4 + 96);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v7 + 64) = v19;
  *(_OWORD *)(v7 + 80) = v20;
  *(_OWORD *)(v7 + 96) = v21;
  *(void *)(v7 + 112) = v9;
  sub_24CF9F770(v10, v11, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v22 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)((v4 + 127) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v24 = (unint64_t)v23 + 23;
  uint64_t v25 = v23;
  unint64_t v26 = (unint64_t)v22 + 11;
  unint64_t v27 = (unint64_t)v22 + 23;
  int v28 = v22;
  *uint64_t v22 = *v23;
  unint64_t v29 = ((unint64_t)v23 + 11) & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v23) = *(unsigned char *)(v29 + 4);
  unint64_t v30 = v26 & 0xFFFFFFFFFFFFFFF8;
  *(_DWORD *)unint64_t v30 = *(_DWORD *)v29;
  *(unsigned char *)(v30 + 4) = (_BYTE)v23;
  LOBYTE(v23) = *(unsigned char *)((v24 & 0xFFFFFFFFFFFFFFF8) + 32);
  unint64_t v31 = v27 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = *(void *)(v27 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v33 = *(void *)((v27 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v34 = *(void *)((v27 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v35 = *(void *)((v27 & 0xFFFFFFFFFFFFFFF8) + 24);
  long long v36 = *(_OWORD *)((v24 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(_OWORD *)unint64_t v31 = *(_OWORD *)(v24 & 0xFFFFFFFFFFFFFFF8);
  *(_OWORD *)(v31 + 16) = v36;
  unsigned __int8 v37 = *(unsigned char *)((v27 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(unsigned char *)(v31 + 32) = (_BYTE)v23;
  sub_24CFA99F0(v32, v33, v34, v35, v37);
  uint64_t v38 = (void *)(((unint64_t)v28 + 63) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v39 = (void *)(((unint64_t)v25 + 63) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v38 = *v39;
  swift_release();
  uint64_t v40 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v40 + 40))(((unint64_t)v38 + *(unsigned __int8 *)(v40 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80), ((unint64_t)v39 + *(unsigned __int8 *)(v40 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
  return a1;
}

uint64_t sub_24CFAA0A4(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v6 + 184) & ~v6) + v7;
  char v11 = 8 * (((v6 - 72) & ~(_BYTE)v6) + v7);
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)(a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      uint64_t v16 = (unint64_t *)(((((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v16 + v6 + 8) & ~v6);
      }
      unint64_t v17 = *v16;
      if (v17 >= 0xFFFFFFFF) {
        LODWORD(v17) = -1;
      }
      return (v17 + 1);
    }
  }
  int v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(unsigned char *)(a1 + v10)) {
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
        LODWORD(v10) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v10) = *(unsigned __int16 *)a1 | (*(unsigned __int8 *)(a1 + 2) << 16);
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

void sub_24CFAA258(unint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  size_t v11 = ((v10 + 184) & ~v10) + *(void *)(v6 + 64);
  BOOL v12 = a3 >= v9;
  unsigned int v13 = a3 - v9;
  if (v13 != 0 && v12)
  {
    if (v11 <= 3)
    {
      unsigned int v17 = ((v13 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
      if (HIWORD(v17))
      {
        int v14 = 4;
      }
      else if (v17 >= 0x100)
      {
        int v14 = 2;
      }
      else
      {
        int v14 = v17 > 1;
      }
    }
    else
    {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v15 = ~v9 + a2;
    if (v11 < 4)
    {
      int v16 = (v15 >> (8 * (((v10 - 72) & ~(_BYTE)v10) + *(unsigned char *)(v6 + 64)))) + 1;
      if (v11)
      {
        int v18 = v15 & ~(-1 << (8 * (((v10 - 72) & ~(_BYTE)v10) + *(unsigned char *)(v6 + 64))));
        bzero((void *)a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          *(unsigned char *)(a1 + 2) = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *(unsigned char *)a1 = v18;
        }
      }
    }
    else
    {
      bzero((void *)a1, v11);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        *(unsigned char *)(a1 + v11) = v16;
        return;
      case 2:
        *(_WORD *)(a1 + v11) = v16;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)(a1 + v11) = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      *(unsigned char *)(a1 + v11) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)(a1 + v11) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24CFAA4C8);
    case 4:
      *(_DWORD *)(a1 + v11) = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        long long v19 = (void *)(((((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
        if ((v8 & 0x80000000) != 0)
        {
          long long v21 = *(void (**)(unint64_t))(v7 + 56);
          v21(((unint64_t)v19 + v10 + 8) & ~v10);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v20 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v20 = a2 - 1;
          }
          void *v19 = v20;
        }
      }
      return;
  }
}

uint64_t _s13ConfigurationVMa_0()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFAA508@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v13 = v1[14];
  int v14 = (void *)v1[6];
  long long v3 = (void *)v1[7];
  uint64_t v4 = (void *)v1[8];
  uint64_t v5 = v1[9];
  uint64_t v6 = (void *)v1[10];
  uint64_t v7 = v1[11];
  uint64_t v8 = v1[12];
  uint64_t v9 = v1[13];
  sub_24CF9F68C(v14, v3, (uint64_t)v4, v5, v6, v7, v8, v9, v13);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = sub_24CF9F8B8();
  swift_release();
  sub_24CF9F770(v14, v3, v4, v5, v6, v7, v8, v9, v13);
  uint64_t v11 = v2[22];
  swift_retain();
  uint64_t result = swift_release();
  *a1 = v10;
  a1[1] = v11;
  return result;
}

uint64_t sub_24CFAA6B8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v71 = a1;
  uint64_t v78 = a2;
  uint64_t v77 = type metadata accessor for _SceneView();
  uint64_t v3 = MEMORY[0x270FA5388](v77);
  v69 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v74 = (uint64_t)&v64 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849250);
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v76 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  char v73 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v72 = (char *)&v64 - v9;
  uint64_t v10 = sub_24CFD3488();
  uint64_t v70 = sub_24CFD3478();
  uint64_t v79 = v10;
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = (void *)v2[6];
  BOOL v12 = (void *)v2[7];
  uint64_t v13 = v2[8];
  uint64_t v14 = v2[9];
  unsigned int v15 = (void *)v2[10];
  uint64_t v16 = v2[11];
  uint64_t v17 = v2[12];
  uint64_t v18 = v2[13];
  uint64_t v65 = v2;
  unint64_t v66 = v2[14];
  uint64_t v67 = v11;
  long long v19 = v12;
  uint64_t v20 = (void *)v13;
  uint64_t v21 = v14;
  uint64_t v22 = v15;
  uint64_t v23 = v16;
  uint64_t v24 = v17;
  uint64_t v25 = v18;
  sub_24CF9F68C(v11, v12, v13, v14, v15, v16, v17, v18, v66);
  uint64_t v64 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v26 = v67;
  *(void *)&long long v80 = v67;
  *((void *)&v80 + 1) = v19;
  *(void *)&long long v81 = v20;
  *((void *)&v81 + 1) = v21;
  char v82 = v22;
  uint64_t v83 = v23;
  uint64_t v84 = v24;
  uint64_t v85 = v25;
  unint64_t v27 = v66;
  unint64_t v86 = v66;
  uint64_t v68 = sub_24CF9F8B8();
  swift_release();
  sub_24CF9F770(v26, v19, v20, v21, v22, v23, v24, v25, v27);
  int v28 = v65;
  uint64_t v29 = v65[15];
  LODWORD(v67) = *((_DWORD *)v65 + 32);
  char v30 = *((unsigned char *)v65 + 132);
  long long v31 = *(_OWORD *)(v65 + 19);
  long long v80 = *(_OWORD *)(v65 + 17);
  long long v81 = v31;
  LOBYTE(v82) = *((unsigned char *)v65 + 168);
  sub_24CFAB7E0((uint64_t)&v80);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v32 = *v28;
  uint64_t v33 = v28[1];
  char v34 = *((unsigned char *)v28 + 16);
  sub_24CFA98D8();
  uint64_t v35 = sub_24CFB4030(v32, v33, v34);
  uint64_t v37 = v36;
  sub_24CFA99E4();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v35;
  *(void *)(v38 + 24) = v37;
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v39 = v28[3];
  uint64_t v40 = v28[4];
  char v41 = *((unsigned char *)v28 + 40);
  sub_24CFA98D8();
  uint64_t v42 = sub_24CFB4258(v39, v40, v41);
  uint64_t v44 = v43;
  sub_24CFA99E4();
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v42;
  *(void *)(v45 + 24) = v44;
  swift_release();
  unsigned __int8 v46 = (int *)v77;
  uint64_t v47 = v69;
  type metadata accessor for _SceneView.LifetimeAssertion();
  sub_24CFD3308();
  uint64_t v48 = swift_allocObject();
  long long v49 = v81;
  *(_OWORD *)(v48 + 40) = v80;
  unint64_t v50 = v68;
  *(void *)(v48 + 16) = v68;
  *(void *)(v48 + 24) = v29;
  LODWORD(v44) = v67;
  *(_DWORD *)(v48 + 32) = v67;
  *(unsigned char *)(v48 + 36) = v30;
  *(_OWORD *)(v48 + 56) = v49;
  *(unsigned char *)(v48 + 72) = (_BYTE)v82;
  *(void *)(v48 + 80) = sub_24CFAB850;
  *(void *)(v48 + 88) = v38;
  *(void *)(v48 + 96) = sub_24CFAB858;
  *(void *)(v48 + 104) = v45;
  sub_24CFAB7E0((uint64_t)&v80);
  type metadata accessor for Presentation();
  id v51 = v50;
  sub_24CFD3308();
  *(void *)&v47[v46[6]] = v51;
  *(void *)&v47[v46[7]] = v29;
  v52 = &v47[v46[8]];
  *(_DWORD *)v52 = v44;
  v52[4] = v30;
  v53 = &v47[v46[9]];
  long long v54 = v81;
  *(_OWORD *)v53 = v80;
  *((_OWORD *)v53 + 1) = v54;
  v53[32] = (char)v82;
  uint64_t v55 = (uint64_t)v47;
  uint64_t v56 = v74;
  uint64_t v57 = sub_24CFAB8E8(v55, v74);
  MEMORY[0x270FA5388](v57);
  *((_OWORD *)&v64 - 2) = *(_OWORD *)(v71 + 16);
  uint64_t v63 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849258);
  sub_24CFAB958((unint64_t *)&qword_269849260, (void (*)(uint64_t))type metadata accessor for _SceneView);
  sub_24CFAB9A0();
  uint64_t v58 = v73;
  sub_24CFD3218();
  sub_24CFABA78(v56);
  uint64_t v59 = v76;
  v60 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v61 = v72;
  v60(v72, v58, v76);
  v60(v78, v61, v59);
  return swift_release();
}

uint64_t sub_24CFAAD84()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((sub_24CFD2F68() & 1) == 0)
  {
    uint64_t v0 = sub_24CFD2F78();
    swift_release();
    if (!v0)
    {
      sub_24CFD32F8();
      sub_24CFD2F88();
    }
  }
  return swift_release();
}

uint64_t sub_24CFAAE60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849258);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (SnapshotSource.isActive.getter()) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849278);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v7, a1, v11);
  *(double *)&v7[*(int *)(v4 + 36)] = v10;
  sub_24CFABAD4((uint64_t)v7, (uint64_t)v9);
  sub_24CFABAD4((uint64_t)v9, a2);
  return swift_release();
}

uint64_t sub_24CFAB000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v20 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849220);
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = sub_24CFAB6F8();
  uint64_t v24 = v3;
  uint64_t v25 = v6;
  v19[2] = v7;
  void v19[3] = v6;
  uint64_t v26 = v7;
  unint64_t v27 = v8;
  v19[1] = v8;
  v19[0] = sub_24CFD31B8();
  uint64_t v9 = sub_24CFD3278();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)v19 - v14;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v5, v21 + *(int *)(a1 + 60), v3);
  sub_24CFD3268();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = swift_getWitnessTable();
  sub_24CFB6664(v13, v9, v16);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  sub_24CFB6664(v15, v9, v16);
  v17(v15, v9);
  return swift_release();
}

uint64_t sub_24CFAB2E0(uint64_t a1)
{
  uint64_t v2 = sub_24CFD30D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_24CFD32C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849238);
  sub_24CFAB958(&qword_269849240, MEMORY[0x263F19880]);
  sub_24CFAB76C();
  sub_24CFAB958(&qword_269849248, MEMORY[0x263F1B838]);
  sub_24CFD32B8();
  return swift_release();
}

uint64_t sub_24CFAB4E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = sub_24CFD3058();
  char v5 = sub_24CFD31D8();
  uint64_t v6 = sub_24CFD32D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  swift_release();
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269849238);
  uint64_t v8 = a2 + *(int *)(result + 36);
  *(void *)uint64_t v8 = v4;
  *(unsigned char *)(v8 + 8) = v5;
  return result;
}

uint64_t sub_24CFAB5E0@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X8>)
{
  long long v19 = a1[1];
  long long v20 = *a1;
  long long v17 = a1[3];
  long long v18 = a1[2];
  uint64_t v10 = *((void *)a1 + 8);
  int v11 = *a3;
  char v12 = *((unsigned char *)a3 + 4);
  long long v21 = *a4;
  uint64_t v13 = *((void *)a4 + 2);
  uint64_t v14 = *((void *)a4 + 3);
  char v15 = *((unsigned char *)a4 + 32);
  *(void *)a7 = swift_getKeyPath();
  *(void *)(a7 + 8) = 0;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = swift_getKeyPath();
  *(void *)(a7 + 32) = 0;
  *(unsigned char *)(a7 + 40) = 0;
  *(_OWORD *)(a7 + 48) = v20;
  *(_OWORD *)(a7 + 64) = v19;
  *(_OWORD *)(a7 + 80) = v18;
  *(_OWORD *)(a7 + 96) = v17;
  *(void *)(a7 + 112) = v10;
  *(void *)(a7 + 120) = a2;
  *(_DWORD *)(a7 + 128) = v11;
  *(unsigned char *)(a7 + 132) = v12;
  *(_OWORD *)(a7 + 136) = v21;
  *(void *)(a7 + 152) = v13;
  *(void *)(a7 + 160) = v14;
  *(unsigned char *)(a7 + 168) = v15;
  *(void *)(a7 + 176) = a5;
  _s13ConfigurationVMa_0();
  return a6();
}

unint64_t sub_24CFAB6F8()
{
  unint64_t result = qword_269849228;
  if (!qword_269849228)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849220);
    sub_24CFAB76C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849228);
  }
  return result;
}

unint64_t sub_24CFAB76C()
{
  unint64_t result = qword_269849230;
  if (!qword_269849230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849230);
  }
  return result;
}

uint64_t sub_24CFAB7E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFAB818()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFAB850(uint64_t a1)
{
  return sub_24CFB3C00(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_24CFAB858(uint64_t a1, uint64_t a2)
{
  return sub_24CFA8AAC(a1, a2, *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_24CFAB860()
{
  sub_24CFA99F0(*(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_24CFAB8B8@<X0>(void *a1@<X8>)
{
  return sub_24CFB295C(*(void **)(v1 + 16), *(void *)(v1 + 24), *(unsigned int *)(v1 + 32) | ((unint64_t)*(unsigned __int8 *)(v1 + 36) << 32), v1 + 40, *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), a1);
}

uint64_t sub_24CFAB8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _SceneView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFAB94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CFAAE60(a1, a2);
}

uint64_t sub_24CFAB958(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24CFAB9A0()
{
  unint64_t result = qword_269849268;
  if (!qword_269849268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849258);
    sub_24CFABA1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849268);
  }
  return result;
}

unint64_t sub_24CFABA1C()
{
  unint64_t result = qword_269849270;
  if (!qword_269849270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849270);
  }
  return result;
}

uint64_t sub_24CFABA78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _SceneView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CFABAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFABB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_24CFABBF4()
{
  return 1;
}

uint64_t sub_24CFABBFC()
{
  return sub_24CFD3978();
}

uint64_t sub_24CFABC40()
{
  return sub_24CFD3958();
}

uint64_t sub_24CFABC68()
{
  return sub_24CFD3978();
}

uint64_t sub_24CFABCAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CFAC3E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CFABCD8()
{
  return 0;
}

void sub_24CFABCE4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CFABCF0(uint64_t a1)
{
  unint64_t v2 = sub_24CFAC154();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CFABD2C(uint64_t a1)
{
  unint64_t v2 = sub_24CFAC154();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t type metadata accessor for LocalSceneActivationContext()
{
  return self;
}

void *sub_24CFABDA0(void *a1)
{
  uint64_t v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849288);
  uint64_t v16 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFAC154();
  uint64_t v9 = v3;
  sub_24CFD3988();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v16;
    uint64_t v11 = sub_24CFD3838();
    uint64_t v13 = (uint64_t *)&v9[OBJC_IVAR____TtC12DrawingBoard27LocalSceneActivationContext_message];
    *uint64_t v13 = v11;
    v13[1] = v14;

    v17.receiver = v9;
    v17.super_class = ObjectType;
    uint64_t v8 = objc_msgSendSuper2(&v17, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

void *sub_24CFABF80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  uint64_t result = sub_24CFABDA0(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24CFABFD0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849298);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CFAC154();
  sub_24CFD3998();
  sub_24CFD3848();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24CFAC154()
{
  unint64_t result = qword_269849290;
  if (!qword_269849290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849290);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LocalSceneActivationContext.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LocalSceneActivationContext.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CFAC298);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CFAC2C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalSceneActivationContext.CodingKeys()
{
  return &type metadata for LocalSceneActivationContext.CodingKeys;
}

unint64_t sub_24CFAC2DC()
{
  unint64_t result = qword_2698492A0;
  if (!qword_2698492A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698492A0);
  }
  return result;
}

unint64_t sub_24CFAC334()
{
  unint64_t result = qword_2698492A8;
  if (!qword_2698492A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698492A8);
  }
  return result;
}

unint64_t sub_24CFAC38C()
{
  unint64_t result = qword_2698492B0;
  if (!qword_2698492B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698492B0);
  }
  return result;
}

uint64_t sub_24CFAC3E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CFD38A8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CFAC468()
{
  return 0x6567617373656DLL;
}

id sub_24CFAC4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848C40);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24CFD68F0;
  *(void *)(v6 + 32) = a4(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848C38);
  uint64_t v7 = (void *)sub_24CFD3428();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_24CFAC568(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v2, sel_isValid)
    && (id v5 = objc_msgSend(v2, sel_hostScene)) != 0)
  {
    v8[2] = a1;
    v8[3] = a2;
    id v6 = (id)MEMORY[0x270FA5388](v5);
    sub_24CF90900(sub_24CFACD28, (uint64_t)v8);
    swift_release();

    return swift_release();
  }
  else
  {
    swift_release();
    return swift_release();
  }
}

void sub_24CFAC6D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = &unk_26FF69678;
  uint64_t v7 = swift_dynamicCastObjCProtocolConditional();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (objc_class *)type metadata accessor for ContentBuilderBox();
    uint64_t v10 = (char *)objc_allocWithZone(v9);
    uint64_t v11 = &v10[OBJC_IVAR____TtC12DrawingBoard17ContentBuilderBox_builder];
    *(void *)uint64_t v11 = a3;
    *((void *)v11 + 1) = a4;
    v14.receiver = v10;
    v14.super_class = v9;
    id v12 = a1;
    swift_retain();
    id v13 = objc_msgSendSuper2(&v14, sel_init);
    objc_msgSend(v8, sel_setBuilderBox_, v13);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

id sub_24CFAC83C()
{
  return sub_24CFACC04(type metadata accessor for LocalSceneExtension.HostComponent);
}

uint64_t (*sub_24CFAC854())(uint64_t a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v0, sel_isValid))
  {
    id v1 = objc_msgSend(v0, sel_clientScene);
    if (v1)
    {
      int v2 = v1;
      id v3 = objc_msgSend(v1, sel_settings);

      uint64_t v4 = swift_dynamicCastObjCProtocolConditional();
      if (v4)
      {
        *(void *)(swift_allocObject() + 16) = v4;
        swift_release();
        return sub_24CFACD20;
      }
    }
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  unint64_t result = (uint64_t (*)(uint64_t))sub_24CFD37B8();
  __break(1u);
  return result;
}

uint64_t sub_24CFACA38(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (char *)objc_msgSend(a2, sel_builderBox);
  id v5 = *(uint64_t (**)(uint64_t))&v4[OBJC_IVAR____TtC12DrawingBoard17ContentBuilderBox_builder];
  swift_retain();

  uint64_t v6 = v5(a1);
  swift_release();
  swift_release();
  return v6;
}

id sub_24CFACB44(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_24CFACBA0(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithScene_, a3);
}

id sub_24CFACBEC()
{
  return sub_24CFACC04(type metadata accessor for LocalSceneExtension.ClientComponent);
}

id sub_24CFACC04(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LocalSceneExtension()
{
  return self;
}

uint64_t type metadata accessor for LocalSceneExtension.HostComponent()
{
  return self;
}

uint64_t type metadata accessor for LocalSceneExtension.ClientComponent()
{
  return self;
}

uint64_t sub_24CFACCE8()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CFACD20(uint64_t a1)
{
  return sub_24CFACA38(a1, *(void **)(v1 + 16));
}

void sub_24CFACD28(void *a1, uint64_t a2)
{
  sub_24CFAC6D0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_24CFACD30()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for NullSceneActivationPolicyModel()
{
  return self;
}

uint64_t sub_24CFACD64()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0;
}

uint64_t sub_24CFACDEC()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  return swift_release();
}

unint64_t sub_24CFACE78(uint64_t a1)
{
  unint64_t result = sub_24CFACEA0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24CFACEA0()
{
  unint64_t result = qword_2698492B8;
  if (!qword_2698492B8)
  {
    type metadata accessor for NullSceneActivationPolicyModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698492B8);
  }
  return result;
}

id sub_24CFACF24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentBuilderBox();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContentBuilderBox()
{
  return self;
}

uint64_t destroy for AnyFBValue()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AnyFBValue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v3 = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AnyFBValue(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for AnyFBValue(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyFBValue(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyFBValue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyFBValue()
{
  return &type metadata for AnyFBValue;
}

uint64_t sub_24CFAD2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24CFAD2BC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24CFAD35C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  unint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(v5 + 64);
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || v7 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    objc_super v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
  }
  return a1;
}

uint64_t sub_24CFAD460(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_24CFAD4D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  swift_retain();
  v5(v7, v8, v4);
  return a1;
}

void *sub_24CFAD564(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

void *sub_24CFAD5F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_24CFAD664(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_24CFAD6EC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 8) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 8) & ~v6);
      }
      uint64_t v15 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24CFAD88C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 8) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24CFADAE8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v9 + 8] & ~v9;
          long long v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(v19);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = a2 - 1;
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for FBValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFADB28()
{
  return sub_24CFD3368();
}

uint64_t sub_24CFADB80(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v19[1] = a5;
  uint64_t v7 = type metadata accessor for FBValue();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int v13 = (char *)v19 - v12;
  sub_24CFD35F8();
  char v14 = MEMORY[0x253319D30](*a1, *a2);
  int v15 = *(void (**)(char *, void *, uint64_t))(v8 + 16);
  v15(v13, a1, v7);
  v15(v11, a2, v7);
  if (v14) {
    char v16 = sub_24CFD3388();
  }
  else {
    char v16 = 0;
  }
  int v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v7);
  v17(v13, v7);
  return v16 & 1;
}

double sub_24CFADD28@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  unsigned int v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  sub_24CFADE10(v5, a1[2], a1[3], a1[4], (uint64_t (**)())v11);
  long long v7 = v11[3];
  a2[2] = v11[2];
  a2[3] = v7;
  long long v8 = v11[5];
  a2[4] = v11[4];
  a2[5] = v8;
  double result = *(double *)v11;
  long long v10 = v11[1];
  *a2 = v11[0];
  a2[1] = v10;
  return result;
}

uint64_t sub_24CFADE10@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  v52 = a1;
  char v41 = a5;
  uint64_t v9 = type metadata accessor for FBValue();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  int v13 = (char *)&v39 - v12;
  unint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v50((char *)&v39 - v12, (uint64_t)a1, v9);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = (v14 + 40) & ~v14;
  uint64_t v51 = v15;
  uint64_t v47 = v14 | 7;
  uint64_t v45 = v15 + v11;
  char v16 = (uint64_t (*)())swift_allocObject();
  uint64_t v44 = v16;
  uint64_t v49 = a2;
  *((void *)v16 + 2) = a2;
  *((void *)v16 + 3) = a3;
  uint64_t v46 = a3;
  *((void *)v16 + 4) = a4;
  int v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v17((char *)v16 + v15, v13, v9);
  uint64_t v48 = v17;
  uint64_t v18 = v50;
  v50(v13, (uint64_t)v52, v9);
  unint64_t v19 = (uint64_t (*)())swift_allocObject();
  uint64_t v43 = v19;
  *((void *)v19 + 2) = a2;
  *((void *)v19 + 3) = a3;
  *((void *)v19 + 4) = a4;
  uint64_t v40 = a4;
  v17((char *)v19 + v51, v13, v9);
  long long v20 = v52;
  v18(v13, (uint64_t)v52, v9);
  long long v21 = (uint64_t (*)())swift_allocObject();
  uint64_t v42 = v21;
  uint64_t v22 = v48;
  uint64_t v23 = v49;
  uint64_t v24 = v46;
  *((void *)v21 + 2) = v49;
  *((void *)v21 + 3) = v24;
  *((void *)v21 + 4) = a4;
  uint64_t v25 = v51;
  v22((char *)v21 + v51, v13, v9);
  v50(v13, (uint64_t)v20, v9);
  uint64_t v26 = (uint64_t (*)())swift_allocObject();
  *((void *)v26 + 2) = v23;
  *((void *)v26 + 3) = v24;
  uint64_t v27 = v40;
  *((void *)v26 + 4) = v40;
  int v28 = (char *)v26 + v25;
  uint64_t v29 = v48;
  v48(v28, v13, v9);
  v50(v13, (uint64_t)v52, v9);
  char v30 = (uint64_t (*)())swift_allocObject();
  *((void *)v30 + 2) = v49;
  *((void *)v30 + 3) = v24;
  *((void *)v30 + 4) = v27;
  uint64_t v31 = v51;
  v29((char *)v30 + v51, v13, v9);
  v29(v13, v52, v9);
  uint64_t v32 = (uint64_t (*)())swift_allocObject();
  uint64_t v33 = v46;
  *((void *)v32 + 2) = v49;
  *((void *)v32 + 3) = v33;
  *((void *)v32 + 4) = v27;
  uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v29)((char *)v32 + v31, v13, v9);
  uint64_t v35 = v41;
  uint64_t v36 = v44;
  *char v41 = sub_24CFAEA54;
  v35[1] = v36;
  uint64_t v37 = v42;
  v35[2] = (uint64_t (*)())sub_24CFAEAE8;
  v35[3] = v37;
  v35[4] = sub_24CFAEB8C;
  v35[5] = v26;
  uint64_t v38 = v43;
  v35[6] = sub_24CFAEACC;
  v35[7] = v38;
  v35[8] = sub_24CFAEC5C;
  v35[9] = v30;
  v35[10] = sub_24CFAEDF4;
  v35[11] = v32;
  return result;
}

uint64_t sub_24CFAE1DC(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1 + *(int *)(v4 + 44));
  v7[1] = a1;
  swift_unknownObjectRetain();
  swift_setAtReferenceWritableKeyPath();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CFAE2C0()
{
  return 0;
}

uint64_t sub_24CFAE36C()
{
  return sub_24CFD3978();
}

uint64_t sub_24CFAE3B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t **a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)MEMORY[0x263F8E100];
  *a3 = a1;
  uint64_t v7 = *(void *)(v5 + *v6 + 8);
  long long v8 = (char *)a3 + *(int *)(type metadata accessor for FBValue() + 44);
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
  return v9(v8, a2, v7);
}

uint64_t sub_24CFAE478()
{
  return sub_24CFD3978();
}

uint64_t sub_24CFAE4C0(void *a1, void *a2, uint64_t *a3)
{
  return sub_24CFADB80(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t sub_24CFAE4D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CFAE4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1 + *(int *)(type metadata accessor for FBValue() + 44);
  a3[3] = a2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a3);
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16);
  return v7(boxed_opaque_existential_0, v5, a2);
}

uint64_t sub_24CFAE574(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = a2;
  uint64_t v9 = type metadata accessor for FBValue();
  uint64_t v10 = sub_24CFD3588();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(void *)(v9 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v18 = (uint64_t *)((char *)&v23 - v17);
  (*(void (**)(void *__return_ptr, uint64_t))(a1 + 32))(v25, v16);
  char v19 = swift_dynamicCast();
  long long v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  if (v19)
  {
    v20(v14, 0, 1, v9);
    (*(void (**)(void *, char *, uint64_t))(v15 + 32))(v18, v14, v9);
    char v21 = sub_24CFADB80(v24, v18, a3, a4, a5);
    (*(void (**)(void *, uint64_t))(v15 + 8))(v18, v9);
  }
  else
  {
    v20(v14, 1, 1, v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    char v21 = 0;
  }
  return v21 & 1;
}

uint64_t sub_24CFAE7B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FBValue();
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v6(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_24CFAE830()
{
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    type metadata accessor for FBValue();
    sub_24CFAE1DC(v1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24CFAE8CC()
{
  uint64_t v1 = *v0;
  sub_24CFD3948();
  v1(v3);
  return sub_24CFD3978();
}

uint64_t sub_24CFAE914()
{
  return (*v0)();
}

uint64_t sub_24CFAE93C()
{
  uint64_t v1 = *v0;
  sub_24CFD3948();
  v1(v3);
  return sub_24CFD3978();
}

uint64_t sub_24CFAE980()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_24CFAE9A8(uint64_t a1, _OWORD *a2)
{
  uint64_t v2 = *(uint64_t (**)(_OWORD *))(a1 + 16);
  long long v3 = a2[3];
  void v7[2] = a2[2];
  v7[3] = v3;
  long long v4 = a2[5];
  v7[4] = a2[4];
  v7[5] = v4;
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return v2(v7) & 1;
}

unint64_t sub_24CFAE9FC()
{
  unint64_t result = qword_269849348;
  if (!qword_269849348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849348);
  }
  return result;
}

uint64_t sub_24CFAEA54()
{
  return sub_24CFADB28();
}

uint64_t sub_24CFAEACC()
{
  return sub_24CFAEBA4((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_24CFAE4EC);
}

uint64_t sub_24CFAEAE8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = *(void *)(type metadata accessor for FBValue() - 8);
  uint64_t v7 = (void *)((char *)v1
                + ((*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
  return sub_24CFAE574(a1, v7, v3, v4, v5);
}

uint64_t sub_24CFAEB8C()
{
  return sub_24CFAEBA4((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_24CFAE7B0);
}

uint64_t sub_24CFAEBA4(uint64_t (*a1)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = *(void *)(type metadata accessor for FBValue() - 8);
  uint64_t v6 = (char *)v1 + ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a1(v6, v2, v3, v4);
}

uint64_t sub_24CFAEC5C()
{
  type metadata accessor for FBValue();
  return sub_24CFAE830();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (int *)(type metadata accessor for FBValue() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[13], v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CFAEDF4()
{
  return sub_24CFAE2C0();
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

uint64_t sub_24CFAEEC0@<X0>(uint64_t a1@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  swift_beginAccess();
  sub_24CFB1910(v1 + 16, a1);
  return swift_release();
}

uint64_t sub_24CFAEFF0@<X0>(uint64_t a1@<X8>)
{
  return sub_24CFAEEC0(a1);
}

uint64_t sub_24CFAF014(uint64_t a1)
{
  sub_24CFB1910(a1, (uint64_t)v2);
  return sub_24CFAF050((uint64_t)v2);
}

uint64_t sub_24CFAF050(uint64_t a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t sub_24CFAF1C0(uint64_t a1, uint64_t *a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), a2);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24CFAF290()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = MEMORY[0x25331A8E0](v0 + 56);
  swift_release();
  return v1;
}

uint64_t sub_24CFAF3A8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CFAF518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 64) = a3;
  swift_unknownObjectWeakAssign();
  return swift_release();
}

uint64_t sub_24CFAF5D0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 72);
  swift_release();
  return v1;
}

uint64_t sub_24CFAF6D8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFAF838(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + 72) = a2 & 1;
  return swift_release();
}

uint64_t sub_24CFAF8DC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v11[0] = v0;
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(id *)(v0 + 80);
  swift_release();
  type metadata accessor for SceneFuture();
  char v2 = sub_24CFD3578();

  if ((v2 & 1) == 0)
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    v11[0] = v0;
    sub_24CFD2ED8();
    swift_release();
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    unsigned __int8 v10 = *(unsigned char *)(v0 + 120);
    sub_24CFA98E4(v3, v4, v5, v6, v10);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    v11[0] = v0;
    sub_24CFD2ED8();
    swift_release();
    id v7 = *(id *)(v0 + 80);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v11[5] = v3;
    _OWORD v11[6] = v4;
    v11[7] = v5;
    void v11[8] = v6;
    unsigned __int8 v12 = v10;
    sub_24CFBA200(v7, (uint64_t)v11);

    swift_release();
    sub_24CFA99F0(v3, v4, v5, v6, v10);
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_24CFD2EC8();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    swift_release();
  }
  return swift_release();
}

id sub_24CFAFD4C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(id *)(v0 + 80);
  swift_release();
  return v1;
}

uint64_t sub_24CFAFE5C@<X0>(uint64_t a1@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 96);
  uint64_t v5 = *(void *)(v1 + 104);
  uint64_t v6 = *(void *)(v1 + 112);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v7 = *(unsigned char *)(v1 + 120);
  *(unsigned char *)(a1 + 32) = v7;
  sub_24CFA98E4(v3, v4, v5, v6, v7);
  return swift_release();
}

id sub_24CFAFF84@<X0>(void *a1@<X8>)
{
  id result = sub_24CFAFD4C();
  *a1 = result;
  return result;
}

void sub_24CFAFFB0(id *a1)
{
}

void sub_24CFAFFDC(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

void sub_24CFB0138(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v4;
  id v6 = v4;
  sub_24CFAF8DC();
  swift_release();
  swift_release();
}

uint64_t sub_24CFB0268(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1[1];
  uint64_t v17 = a1[2];
  uint64_t v19 = *a1;
  uint64_t v15 = a1[3];
  int v4 = *((unsigned __int8 *)a1 + 32);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v21[0] = v1;
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v5 = *(void *)(v1 + 88);
  uint64_t v6 = *(void *)(v2 + 96);
  uint64_t v8 = *(void *)(v2 + 104);
  uint64_t v7 = *(void *)(v2 + 112);
  int v9 = *(unsigned __int8 *)(v2 + 120);
  sub_24CFA98E4(*(void *)(v2 + 88), v6, v8, v7, *(unsigned char *)(v2 + 120));
  swift_release();
  if (!v9)
  {
    sub_24CFA99F0(v5, v6, v8, v7, 0);
    if (!v4) {
      return swift_release();
    }
    goto LABEL_17;
  }
  if (v9 != 1)
  {
    if (v4 == 2 && !(v17 | v15 | v19 | v3))
    {
      sub_24CFA99F0(v5, v6, v8, v7, 2u);
      return swift_release();
    }
    goto LABEL_16;
  }
  if (v4 != 1)
  {
LABEL_16:
    sub_24CFA99F0(v5, v6, v8, v7, v9);
    goto LABEL_17;
  }
  sub_24CFA99F0(v5, v6, v8, v7, 1u);
  if (v6)
  {
    if (v3) {
      return swift_release();
    }
  }
  else if ((v3 & 1) == 0 && v5 == v19)
  {
    return swift_release();
  }
LABEL_17:
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v21[0] = v2;
  sub_24CFD2ED8();
  swift_release();
  uint64_t v10 = *(void *)(v2 + 104);
  uint64_t v11 = *(void *)(v2 + 112);
  uint64_t v18 = *(void *)(v2 + 96);
  uint64_t v20 = *(void *)(v2 + 88);
  unsigned __int8 v16 = *(unsigned char *)(v2 + 120);
  sub_24CFA98E4(v20, v18, v10, v11, v16);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v21[0] = v2;
  sub_24CFD2ED8();
  swift_release();
  id v12 = *(id *)(v2 + 80);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v21[5] = v20;
  v21[6] = v18;
  v21[7] = v10;
  v21[8] = v11;
  unsigned __int8 v22 = v16;
  sub_24CFBA200(v12, (uint64_t)v21);

  swift_release();
  sub_24CFA99F0(v20, v18, v10, v11, v16);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD2EC8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB0798(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v1;
  char v5 = *(unsigned char *)(a1 + 32);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  sub_24CFB19AC((uint64_t)v4, (void (*)(void, void, void, void, void))sub_24CFA99F0);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB0924(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB19AC(a2, (void (*)(void, void, void, void, void))sub_24CFA98E4);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 112);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 104) = v8;
  char v9 = *(unsigned char *)(a2 + 32);
  unsigned __int8 v10 = *(unsigned char *)(a1 + 120);
  *(unsigned char *)(a1 + 120) = v9;
  sub_24CFA98E4(v4, v5, v7, v6, v10);
  sub_24CFA99F0(v4, v5, v7, v6, v10);
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v7;
  v12[3] = v6;
  unsigned __int8 v13 = v10;
  sub_24CFB0268(v12);
  sub_24CFA99F0(v4, v5, v7, v6, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB0ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3 == 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    sub_24CFA89A4();
    sub_24CFD2F98();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = v7;
    uint64_t v4 = sub_24CFAB858;
  }
  sub_24CFB0BF0((uint64_t)v4, v5);
  sub_24CF928C4((uint64_t)v4);
  return swift_release();
}

uint64_t sub_24CFB0BF0(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v11 = v2;
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  swift_beginAccess();
  sub_24CFB1910(v2 + 16, (uint64_t)&v8);
  swift_release();
  uint64_t v5 = v9;
  uint64_t v6 = v10;
  __swift_project_boxed_opaque_existential_1(&v8, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, a2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
  return swift_release();
}

uint64_t sub_24CFB135C()
{
  return sub_24CFB136C();
}

uint64_t sub_24CFB1364()
{
  return sub_24CFB136C();
}

uint64_t sub_24CFB136C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB0BF0(0, 0);
  return swift_release();
}

uint64_t sub_24CFB1420()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_24CFB19EC(v0 + 56);

  sub_24CFA99F0(*(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 112), *(unsigned char *)(v0 + 120));
  uint64_t v1 = v0 + OBJC_IVAR____TtC12DrawingBoard20ApplyActivationModel___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CFB14E8()
{
  return type metadata accessor for ApplyActivationModel();
}

uint64_t type metadata accessor for ApplyActivationModel()
{
  uint64_t result = qword_269849358;
  if (!qword_269849358) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFB153C()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_24CFB160C@<X0>(void *a1@<X8>)
{
  id result = sub_24CFAFD4C();
  *a1 = result;
  return result;
}

void sub_24CFB1638(id *a1)
{
}

uint64_t sub_24CFB1664@<X0>(uint64_t a1@<X8>)
{
  return sub_24CFAEEC0(a1);
}

uint64_t sub_24CFB1688(uint64_t a1)
{
  sub_24CFB1910(a1, (uint64_t)v2);
  return sub_24CFAF050((uint64_t)v2);
}

uint64_t sub_24CFB16C4()
{
  return sub_24CFAF1C0(*(void *)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        id result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *id result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_24CFB1910(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24CFB1974()
{
  sub_24CFB0138(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CFB1990()
{
  return sub_24CFB0924(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CFB19AC(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24CFB19EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFB1A1C(void *a1, long long *a2)
{
  uint64_t v3 = v2;
  long long v18 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  uint64_t v6 = *((void *)a2 + 3);
  char v7 = *((unsigned char *)a2 + 32);
  uint64_t v8 = type metadata accessor for NullSceneActivationPolicyModel();
  uint64_t v9 = swift_allocObject();
  *(void *)(v3 + 40) = v8;
  *(void *)(v3 + 48) = sub_24CFB1DC8(&qword_269849370, (void (*)(uint64_t))type metadata accessor for NullSceneActivationPolicyModel);
  *(void *)(v3 + 16) = v9;
  *(void *)(v3 + 64) = 0;
  swift_unknownObjectWeakInit();
  *(unsigned char *)(v3 + 72) = 0;
  sub_24CFD2F08();
  *(void *)(v3 + 80) = a1;
  *(_OWORD *)(v3 + 88) = v18;
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 112) = v6;
  *(unsigned char *)(v3 + 120) = v7;
  sub_24CFD3488();
  id v17 = a1;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v19[0] = v3;
  sub_24CFB1DC8((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v10 = *(void *)(v3 + 88);
  uint64_t v11 = *(void *)(v3 + 96);
  uint64_t v13 = *(void *)(v3 + 104);
  uint64_t v12 = *(void *)(v3 + 112);
  unsigned __int8 v14 = *(unsigned char *)(v3 + 120);
  sub_24CFA98E4(v10, v11, v13, v12, v14);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v19[5] = v10;
  v19[6] = v11;
  v19[7] = v13;
  void v19[8] = v12;
  unsigned __int8 v20 = v14;
  sub_24CFBA200(v17, (uint64_t)v19);
  swift_release();
  sub_24CFA99F0(v10, v11, v13, v12, v14);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD2EC8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  swift_release();
  return v3;
}

uint64_t sub_24CFB1D78()
{
  return sub_24CFAF518(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CFB1DA0()
{
  return sub_24CFAF838(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CFB1DC8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24CFB1E10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, unint64_t a6)
{
  switch(a6 >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:

      break;
    case 4uLL:
      char v7 = (void *)(a6 & 0x1FFFFFFFFFFFFFFFLL);
      sub_24CFA99F0((uint64_t)a1, a2, a3, a4, a5);

      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_24CFB1EA8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFB1EE0()
{
  return sub_24CFB16C4();
}

__n128 SceneView.init(_:workspace:priority:forLayers:activationPolicy:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int *a5@<X4>, __n128 *a6@<X5>, uint64_t a7@<X8>)
{
  int v11 = *a5;
  char v12 = *((unsigned char *)a5 + 4);
  __n128 v19 = *a6;
  unint64_t v13 = a6[1].n128_u64[0];
  unint64_t v14 = a6[1].n128_u64[1];
  unsigned __int8 v15 = a6[2].n128_u8[0];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_getKeyPath();
  *(void *)a7 = KeyPath;
  *(void *)(a7 + 8) = 0;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = v17;
  *(void *)(a7 + 32) = 0;
  *(unsigned char *)(a7 + 40) = 0;
  *(void *)(a7 + 48) = a1;
  *(void *)(a7 + 56) = a2;
  *(void *)(a7 + 64) = a3;
  *(_OWORD *)(a7 + 72) = 0u;
  *(_OWORD *)(a7 + 88) = 0u;
  *(void *)(a7 + 104) = 0;
  *(void *)(a7 + 112) = 0x4000000000000000;
  *(void *)(a7 + 120) = a4;
  *(_DWORD *)(a7 + 128) = v11;
  *(unsigned char *)(a7 + 132) = v12;
  __n128 result = v19;
  *(__n128 *)(a7 + 136) = v19;
  *(void *)(a7 + 152) = v13;
  *(void *)(a7 + 160) = v14;
  *(unsigned char *)(a7 + 168) = v15;
  return result;
}

__n128 SceneView.init(_:priority:forLayers:activationPolicy:)@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  int v8 = *a3;
  char v9 = *((unsigned char *)a3 + 4);
  __n128 v17 = *a4;
  unint64_t v10 = a4[1].n128_u64[0];
  unint64_t v11 = a4[1].n128_u64[1];
  unsigned __int8 v12 = a4[2].n128_u8[0];
  id v13 = objc_msgSend(a1, sel_identity);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = swift_getKeyPath();
  *(void *)a5 = KeyPath;
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = v15;
  *(void *)(a5 + 32) = 0;
  *(unsigned char *)(a5 + 40) = 0;
  *(void *)(a5 + 48) = v13;
  *(void *)(a5 + 56) = a1;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(void *)(a5 + 112) = 0;
  *(void *)(a5 + 120) = a2;
  *(_DWORD *)(a5 + 128) = v8;
  *(unsigned char *)(a5 + 132) = v9;
  __n128 result = v17;
  *(__n128 *)(a5 + 136) = v17;
  *(void *)(a5 + 152) = v10;
  *(void *)(a5 + 160) = v11;
  *(unsigned char *)(a5 + 168) = v12;
  return result;
}

__n128 SceneView.init(_:workspace:priority:forLayers:activationPolicy:)@<Q0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, __n128 *a5@<X4>, uint64_t a6@<X8>)
{
  long long v19 = a1[1];
  long long v20 = *a1;
  uint64_t v8 = *((void *)a1 + 4);
  uint64_t v9 = *((void *)a1 + 5);
  int v10 = *a4;
  char v11 = *((unsigned char *)a4 + 4);
  __n128 v22 = *a5;
  unint64_t v12 = a5[1].n128_u64[0];
  unint64_t v13 = a5[1].n128_u64[1];
  unsigned __int8 v21 = a5[2].n128_u8[0];
  uint64_t KeyPath = swift_getKeyPath();
  unint64_t v15 = a2 | 0x8000000000000000;
  uint64_t v16 = swift_getKeyPath();
  uint64_t v17 = swift_getKeyPath();
  *(void *)a6 = v16;
  *(void *)(a6 + 8) = 0;
  *(unsigned char *)(a6 + 16) = 0;
  *(void *)(a6 + 24) = v17;
  *(void *)(a6 + 32) = 0;
  *(unsigned char *)(a6 + 40) = 0;
  *(void *)(a6 + 48) = KeyPath;
  *(void *)(a6 + 56) = 0;
  *(_OWORD *)(a6 + 64) = v20;
  *(_OWORD *)(a6 + 80) = v19;
  *(void *)(a6 + 96) = v8;
  *(void *)(a6 + 104) = v9;
  *(void *)(a6 + 112) = v15;
  *(void *)(a6 + 120) = a3;
  *(_DWORD *)(a6 + 128) = v10;
  *(unsigned char *)(a6 + 132) = v11;
  __n128 result = v22;
  *(__n128 *)(a6 + 136) = v22;
  *(void *)(a6 + 152) = v12;
  *(void *)(a6 + 160) = v13;
  *(unsigned char *)(a6 + 168) = v21;
  return result;
}

uint64_t SceneView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v67 = a1;
  uint64_t v66 = type metadata accessor for _SceneView();
  uint64_t v2 = MEMORY[0x270FA5388](v66);
  uint64_t v65 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v64 = (uint64_t)&v52 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v63 = (uint64_t)&v52 - v6;
  long long v7 = v1[9];
  long long v83 = v1[8];
  *(_OWORD *)uint64_t v84 = v7;
  *(_OWORD *)&v84[9] = *(long long *)((char *)v1 + 153);
  long long v8 = v1[5];
  long long v79 = v1[4];
  long long v80 = v8;
  long long v9 = v1[7];
  long long v81 = v1[6];
  long long v82 = v9;
  long long v10 = v1[1];
  long long v75 = *v1;
  long long v11 = v1[2];
  long long v78 = v1[3];
  long long v76 = v10;
  long long v77 = v11;
  uint64_t v12 = sub_24CFD3488();
  uint64_t v62 = sub_24CFD3478();
  uint64_t v68 = v12;
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v13 = v82;
  unint64_t v14 = (void *)*((void *)&v78 + 1);
  v61 = (void *)v78;
  long long v15 = v79;
  long long v16 = v80;
  long long v17 = v81;
  sub_24CF9F68C((id)v78, *((void **)&v78 + 1), v79, *((uint64_t *)&v79 + 1), (void *)v80, *((uint64_t *)&v80 + 1), v81, *((uint64_t *)&v81 + 1), v82);
  uint64_t v60 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v18 = v61;
  v69 = v61;
  uint64_t v70 = v14;
  long long v71 = v15;
  long long v72 = v16;
  long long v73 = v17;
  unint64_t v74 = v13;
  uint64_t v59 = sub_24CF9F8B8();
  swift_release();
  sub_24CF9F770(v18, v14, (void *)v15, *((uint64_t *)&v15 + 1), (void *)v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v13);
  v61 = (void *)*((void *)&v83 + 1);
  uint64_t v57 = *(void *)v84;
  uint64_t v56 = *(void *)&v84[8];
  uint64_t v55 = *(void *)&v84[16];
  LODWORD(v60) = v84[24];
  sub_24CFA98E4(*((uint64_t *)&v83 + 1), *(uint64_t *)v84, *(uint64_t *)&v84[8], *(uint64_t *)&v84[16], v84[24]);
  sub_24CFB4A2C((uint64_t)&v75, (void (*)(void, void, void))sub_24CFB6654, (void (*)(uint64_t, uint64_t, uint64_t))sub_24CFA98D8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CF9F68C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24CFA98E4);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v19 = v75;
  char v20 = v76;
  sub_24CFA98D8();
  uint64_t v21 = sub_24CFB4030(v19, *((uint64_t *)&v19 + 1), v20);
  uint64_t v23 = v22;
  sub_24CFA99E4();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v21;
  *(void *)(v24 + 24) = v23;
  uint64_t v58 = v24;
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v25 = *((void *)&v82 + 1);
  uint64_t v53 = *((void *)&v82 + 1);
  int v26 = v83;
  int v54 = v83;
  char v27 = BYTE4(v83);
  LODWORD(v68) = BYTE4(v83);
  uint64_t v28 = *((void *)&v76 + 1);
  uint64_t v29 = v77;
  char v30 = BYTE8(v77);
  sub_24CFA98D8();
  uint64_t v31 = sub_24CFB4258(v28, v29, v30);
  uint64_t v33 = v32;
  sub_24CFA99E4();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v31;
  *(void *)(v34 + 24) = v33;
  swift_release();
  sub_24CFB4A2C((uint64_t)&v75, (void (*)(void, void, void))sub_24CFB6658, (void (*)(uint64_t, uint64_t, uint64_t))sub_24CFA99E4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CF9F770, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_24CFA99F0);
  uint64_t v35 = (int *)v66;
  uint64_t v36 = (uint64_t)v65;
  type metadata accessor for _SceneView.LifetimeAssertion();
  sub_24CFD3308();
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = v59;
  *(void *)(v37 + 16) = v59;
  *(void *)(v37 + 24) = v25;
  *(_DWORD *)(v37 + 32) = v26;
  *(unsigned char *)(v37 + 36) = v27;
  uint64_t v39 = (uint64_t)v61;
  uint64_t v40 = v57;
  *(void *)(v37 + 40) = v61;
  *(void *)(v37 + 48) = v40;
  uint64_t v41 = v56;
  uint64_t v42 = v55;
  *(void *)(v37 + 56) = v56;
  *(void *)(v37 + 64) = v42;
  unsigned __int8 v43 = v60;
  *(unsigned char *)(v37 + 72) = v60;
  uint64_t v44 = v58;
  *(void *)(v37 + 80) = sub_24CFB49C8;
  *(void *)(v37 + 88) = v44;
  *(void *)(v37 + 96) = sub_24CFB49F0;
  *(void *)(v37 + 104) = v34;
  sub_24CFA98E4(v39, v40, v41, v42, v43);
  type metadata accessor for Presentation();
  id v45 = v38;
  sub_24CFD3308();
  *(void *)(v36 + v35[6]) = v45;
  *(void *)(v36 + v35[7]) = v53;
  uint64_t v46 = v36 + v35[8];
  *(_DWORD *)uint64_t v46 = v54;
  *(unsigned char *)(v46 + 4) = v68;
  uint64_t v47 = v36 + v35[9];
  *(void *)uint64_t v47 = v39;
  *(void *)(v47 + 8) = v40;
  *(void *)(v47 + 16) = v41;
  *(void *)(v47 + 24) = v42;
  *(unsigned char *)(v47 + 32) = v43;
  uint64_t v48 = v64;
  sub_24CFAB8E8(v36, v64);
  uint64_t v49 = v48;
  uint64_t v50 = v63;
  sub_24CFAB8E8(v49, v63);
  sub_24CFAB8E8(v50, v67);
  return swift_release();
}

uint64_t sub_24CFB28DC()
{
  unint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_24CF928C4((uint64_t)v1);
    uint64_t v3 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_24CF928C4(v3);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24CFB295C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v24 = a3;
  char v25 = BYTE4(a3) & 1;
  long long v16 = *(_OWORD *)(a4 + 16);
  v22[0] = *(_OWORD *)a4;
  v22[1] = v16;
  char v23 = *(unsigned char *)(a4 + 32);
  type metadata accessor for Presentation();
  swift_allocObject();
  id v17 = a1;
  sub_24CFAB7E0(a4);
  swift_retain();
  swift_retain();
  long long v18 = sub_24CFBCCC0(v17, a2, &v24, (uint64_t)v22, a5, a6, a7, a8);
  uint64_t result = swift_release();
  *a9 = v18;
  return result;
}

uint64_t sub_24CFB2AA8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  v69 = a1;
  uint64_t v3 = type metadata accessor for _SceneView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698493C0);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v56 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698493C8);
  uint64_t v60 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v57 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698493D0);
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  MEMORY[0x270FA5388](v9);
  unint64_t v74 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698493D8);
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v66 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v64 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v63 = (char *)&v53 - v14;
  sub_24CFD3488();
  uint64_t v61 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  uint64_t v15 = v79;
  sub_24CFB5DDC(v2, (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  uint64_t v55 = v17 + v5;
  uint64_t v72 = v16 | 7;
  uint64_t v18 = swift_allocObject();
  uint64_t v71 = v17;
  sub_24CFAB8E8((uint64_t)v6, v18 + v17);
  uint64_t v79 = v15;
  long long v80 = sub_24CFB5E44;
  uint64_t v81 = v18;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  id v75 = *(id *)(v2 + *(int *)(v3 + 24));
  id v19 = v75;
  sub_24CFB5DDC(v2, (uint64_t)v6);
  uint64_t v20 = swift_allocObject();
  sub_24CFAB8E8((uint64_t)v6, v20 + v17);
  id v21 = v19;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698493E0);
  uint64_t v22 = (uint64_t (*)())type metadata accessor for SceneFuture();
  unint64_t v23 = sub_24CFB5EC0();
  uint64_t v24 = sub_24CFB63E4(&qword_269848C30, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  uint64_t v25 = v3;
  uint64_t v54 = v3;
  uint64_t v26 = v24;
  char v27 = v56;
  sub_24CFD3258();
  swift_release();

  swift_release();
  sub_24CF928C4((uint64_t)v80);
  sub_24CF928C4(v82);
  id v75 = *(id *)(v2 + *(int *)(v25 + 28));
  sub_24CFB5DDC(v2, (uint64_t)v6);
  uint64_t v70 = v2;
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v71;
  sub_24CFAB8E8((uint64_t)v6, v28 + v71);
  uint64_t v79 = v73;
  long long v80 = v22;
  uint64_t v81 = v23;
  uint64_t v82 = v26;
  uint64_t v73 = MEMORY[0x263F1B260];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v57;
  uint64_t v32 = v59;
  sub_24CFD3258();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v27, v32);
  uint64_t v33 = v54;
  uint64_t v34 = (int *)(v70 + *(int *)(v54 + 32));
  int v35 = *v34;
  LOBYTE(v34) = *((unsigned char *)v34 + 4);
  LODWORD(v75) = v35;
  BYTE4(v75) = (_BYTE)v34;
  sub_24CFB5DDC(v70, (uint64_t)v6);
  uint64_t v36 = swift_allocObject();
  sub_24CFAB8E8((uint64_t)v6, v36 + v29);
  uint64_t v79 = v32;
  long long v80 = (uint64_t (*)())MEMORY[0x263F8D6C8];
  uint64_t v81 = OpaqueTypeConformance2;
  uint64_t v82 = MEMORY[0x263F8D6E8];
  uint64_t v37 = swift_getOpaqueTypeConformance2();
  unint64_t v38 = sub_24CFB60C4();
  uint64_t v39 = (void *)v62;
  sub_24CFD3258();
  swift_release();
  (*(void (**)(char *, void *))(v60 + 8))(v31, v39);
  uint64_t v40 = v70 + *(int *)(v33 + 36);
  uint64_t v42 = *(uint64_t (**)())(v40 + 8);
  uint64_t v44 = *(void *)(v40 + 16);
  uint64_t v43 = *(void *)(v40 + 24);
  LOBYTE(v29) = *(unsigned char *)(v40 + 32);
  uint64_t v79 = *(void *)v40;
  uint64_t v41 = v79;
  long long v80 = v42;
  uint64_t v81 = v44;
  uint64_t v82 = v43;
  LOBYTE(v83) = v29;
  sub_24CFB5DDC(v70, (uint64_t)v6);
  uint64_t v45 = swift_allocObject();
  sub_24CFAB8E8((uint64_t)v6, v45 + v71);
  sub_24CFA98E4(v41, (uint64_t)v42, v44, v43, v29);
  id v75 = v39;
  long long v76 = &type metadata for LayerTarget;
  uint64_t v77 = v37;
  unint64_t v78 = v38;
  swift_getOpaqueTypeConformance2();
  sub_24CFB631C();
  uint64_t v46 = v64;
  uint64_t v47 = v68;
  uint64_t v48 = v74;
  sub_24CFD3258();
  swift_release();
  sub_24CFA99F0(v79, (uint64_t)v80, v81, v82, v83);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v47);
  uint64_t v49 = v66;
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
  uint64_t v51 = v63;
  v50(v63, v46, v66);
  v50(v69, v51, v49);
  return swift_release();
}

uint64_t sub_24CFB3354()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for _SceneView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  sub_24CFD3318();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  uint64_t v0 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = sub_24CFB642C;
  *(void *)(v2 + 24) = v2;
  sub_24CF928C4(v0);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB350C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFBB17C();
  return swift_release();
}

void sub_24CFB35AC(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  id v3 = v2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFB63E4(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_24CFB37F0()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  sub_24CFBB720();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB3918()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  sub_24CFBB8E0();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFB3A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  sub_24CFD3318();
  swift_release();
  uint64_t v4 = a3 + *(int *)(type metadata accessor for _SceneView() + 36);
  uint64_t v5 = *(void *)(v4 + 8);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v7 = *(void *)(v4 + 24);
  unsigned __int8 v8 = *(unsigned char *)(v4 + 32);
  v10[0] = *(void *)v4;
  v10[1] = v5;
  v10[2] = v6;
  void v10[3] = v7;
  unsigned __int8 v11 = v8;
  sub_24CFA98E4(v10[0], v5, v6, v7, v8);
  sub_24CFBBAAC((uint64_t)v10);
  swift_release();
  return swift_release();
}

id sub_24CFB3BA8@<X0>(void *a1@<X8>)
{
  id result = sub_24CFBC49C();
  *a1 = result;
  return result;
}

void sub_24CFB3BD4(id *a1)
{
}

uint64_t sub_24CFB3C00(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

double sub_24CFB3C28@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_24CFB6488, a1);
}

double sub_24CFB3C48@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_24CFB6488, a1);
}

uint64_t sub_24CFB3C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFB3D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24CFB6488);
}

uint64_t sub_24CFB3C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFB3D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24CFB6488);
}

double sub_24CFB3CBC@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_24CFB6434, a1);
}

double keypath_getTm@<D0>(void (*a1)(void)@<X3>, _OWORD *a2@<X8>)
{
  a1();
  sub_24CFD30B8();
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

double sub_24CFB3D38@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_24CFB6434, a1);
}

uint64_t sub_24CFB3D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFB3D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24CFB6434);
}

uint64_t sub_24CFB3D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  return sub_24CFD30C8();
}

uint64_t sub_24CFB3DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFB3D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24CFB6434);
}

uint64_t sub_24CFB3E10(void *a1, char a2)
{
  uint64_t v4 = sub_24CFD30A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_24CFD3518();
    uint64_t v9 = sub_24CFD31C8();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      unsigned __int8 v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)unsigned __int8 v11 = 136315138;
      v17[1] = v11 + 4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269849408);
      uint64_t v13 = sub_24CFD39D8();
      v17[2] = sub_24CFD0070(v13, v14, &v18);
      sub_24CFD3598();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CF8B000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25331A7D0](v12, -1, -1);
      MEMORY[0x25331A7D0](v11, -1, -1);
    }

    sub_24CFD3098();
    swift_getAtKeyPath();
    sub_24CF9F864(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v18;
  }
  return (uint64_t)a1;
}

uint64_t sub_24CFB4030(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_24CFD30A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v9 = sub_24CFD3518();
    os_log_type_t v10 = sub_24CFD31C8();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      v15[0] = v12 + 4;
      v15[1] = sub_24CFD0070(0xD000000000000012, 0x800000024CFD90D0, &v16);
      sub_24CFD3598();
      _os_log_impl(&dword_24CF8B000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25331A7D0](v13, -1, -1);
      MEMORY[0x25331A7D0](v12, -1, -1);
    }

    sub_24CFD3098();
    swift_getAtKeyPath();
    sub_24CFA99E4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v16;
  }
  return a1;
}

uint64_t sub_24CFB4258(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_24CFD30A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v9 = sub_24CFD3518();
    os_log_type_t v10 = sub_24CFD31C8();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)uint64_t v12 = 136315138;
      v17[1] = v12 + 4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269849400);
      uint64_t v13 = sub_24CFD39D8();
      uint64_t v19 = sub_24CFD0070(v13, v14, &v20);
      sub_24CFD3598();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CF8B000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      uint64_t v15 = v18;
      swift_arrayDestroy();
      MEMORY[0x25331A7D0](v15, -1, -1);
      MEMORY[0x25331A7D0](v12, -1, -1);
    }

    sub_24CFD3098();
    swift_getAtKeyPath();
    sub_24CFA99E4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v20;
  }
  return a1;
}

uint64_t sub_24CFB448C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_24CFD30A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1;
    return sub_24CFB663C(a1, 1);
  }
  else
  {
    sub_24CFB663C(a1, 0);
    os_log_type_t v10 = sub_24CFD3518();
    os_log_type_t v11 = sub_24CFD31C8();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v19[1] = a3;
      uint64_t v15 = v14;
      uint64_t v20 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      v19[0] = v13 + 4;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848D80);
      uint64_t v16 = sub_24CFD39D8();
      void v19[2] = sub_24CFD0070(v16, v17, &v20);
      sub_24CFD3598();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CF8B000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25331A7D0](v15, -1, -1);
      MEMORY[0x25331A7D0](v13, -1, -1);
    }

    sub_24CFD3098();
    swift_getAtKeyPath();
    sub_24CFB6648(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_24CFB46C0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_24CFD30A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1;
    return sub_24CFB663C(a1, 1);
  }
  else
  {
    sub_24CFB663C(a1, 0);
    os_log_type_t v10 = sub_24CFD3518();
    os_log_type_t v11 = sub_24CFD31C8();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v17[1] = a3;
      uint64_t v15 = v14;
      uint64_t v18 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      void v17[2] = sub_24CFD0070(0xD000000000000017, 0x800000024CFD90F0, &v18);
      sub_24CFD3598();
      _os_log_impl(&dword_24CF8B000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25331A7D0](v15, -1, -1);
      MEMORY[0x25331A7D0](v13, -1, -1);
    }

    sub_24CFD3098();
    swift_getAtKeyPath();
    sub_24CFB6648(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_24CFB48E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFD3078();
  *a1 = result;
  return result;
}

uint64_t sub_24CFB4914(id *a1)
{
  id v1 = *a1;
  return sub_24CFD3088();
}

uint64_t type metadata accessor for _SceneView()
{
  uint64_t result = qword_2698493A0;
  if (!qword_2698493A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFB4990()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFB49C8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24CFB49F0(uint64_t a1, uint64_t a2)
{
  id v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_24CFB4A2C(uint64_t a1, void (*a2)(void, void, void), void (*a3)(uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v17 = *(void *)(a1 + 96);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v22 = *(void *)(a1 + 144);
  uint64_t v23 = *(void *)(a1 + 136);
  uint64_t v20 = *(void *)(a1 + 160);
  uint64_t v21 = *(void *)(a1 + 152);
  unsigned int v19 = *(unsigned __int8 *)(a1 + 168);
  a2(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
  a3(v6, v7, v8);
  a4(v9, v10, v11, v18, v12, v13, v17, v16, v14);
  a5(v23, v22, v21, v20, v19);
  return a1;
}

uint64_t sub_24CFB4B38@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _SceneView.LifetimeAssertion();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for _SceneView.LifetimeAssertion()
{
  return self;
}

uint64_t sub_24CFB4B98()
{
  sub_24CFA99F0(*(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_24CFB4BF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SceneView(uint64_t a1)
{
  sub_24CFA99E4();
  sub_24CFA99E4();
  sub_24CF9F770(*(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void *)(a1 + 72), *(void **)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112));
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v3 = *(void *)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v5 = *(void *)(a1 + 160);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 168);
  return sub_24CFA99F0(v2, v3, v4, v5, v6);
}

uint64_t initializeWithCopy for SceneView(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24CFA98D8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  char v9 = *((unsigned char *)v2 + 40);
  sub_24CFA98D8();
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  uint64_t v10 = (void *)v2[6];
  uint64_t v11 = (void *)v2[7];
  uint64_t v12 = v2[8];
  uint64_t v13 = v2[9];
  uint64_t v14 = (void *)v2[10];
  uint64_t v15 = v2[11];
  uint64_t v16 = v2[12];
  uint64_t v17 = v2[13];
  unint64_t v24 = v2[14];
  sub_24CF9F68C(v10, v11, v12, v13, v14, v15, v16, v17, v24);
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  uint64_t v18 = v2[15];
  *(void *)(a1 + 112) = v24;
  *(void *)(a1 + 120) = v18;
  *(_DWORD *)(a1 + 128) = *((_DWORD *)v2 + 32);
  *(unsigned char *)(a1 + 132) = *((unsigned char *)v2 + 132);
  uint64_t v19 = v2[17];
  uint64_t v20 = v2[18];
  uint64_t v21 = v2[19];
  uint64_t v22 = v2[20];
  LOBYTE(v2) = *((unsigned char *)v2 + 168);
  sub_24CFA98E4(v19, v20, v21, v22, v2);
  *(void *)(a1 + 136) = v19;
  *(void *)(a1 + 144) = v20;
  *(void *)(a1 + 152) = v21;
  *(void *)(a1 + 160) = v22;
  *(unsigned char *)(a1 + 168) = (_BYTE)v2;
  return a1;
}

uint64_t assignWithCopy for SceneView(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24CFA98D8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24CFA99E4();
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  char v9 = *((unsigned char *)v2 + 40);
  sub_24CFA98D8();
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  sub_24CFA99E4();
  uint64_t v10 = (void *)v2[6];
  uint64_t v11 = (void *)v2[7];
  uint64_t v12 = v2[8];
  uint64_t v13 = v2[9];
  uint64_t v14 = (void *)v2[10];
  uint64_t v15 = v2[11];
  uint64_t v16 = v2[12];
  uint64_t v17 = v2[13];
  unint64_t v38 = v2[14];
  sub_24CF9F68C(v10, v11, v12, v13, v14, v15, v16, v17, v38);
  uint64_t v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void **)(a1 + 56);
  uint64_t v20 = *(void **)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  uint64_t v22 = *(void **)(a1 + 80);
  uint64_t v23 = *(void *)(a1 + 88);
  uint64_t v24 = *(void *)(a1 + 96);
  uint64_t v25 = *(void *)(a1 + 104);
  unint64_t v26 = *(void *)(a1 + 112);
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v38;
  sub_24CF9F770(v18, v19, v20, v21, v22, v23, v24, v25, v26);
  *(void *)(a1 + 120) = v2[15];
  int v27 = *((_DWORD *)v2 + 32);
  *(unsigned char *)(a1 + 132) = *((unsigned char *)v2 + 132);
  *(_DWORD *)(a1 + 128) = v27;
  uint64_t v28 = v2[17];
  uint64_t v29 = v2[18];
  uint64_t v30 = v2[19];
  uint64_t v31 = v2[20];
  LOBYTE(v2) = *((unsigned char *)v2 + 168);
  sub_24CFA98E4(v28, v29, v30, v31, v2);
  uint64_t v32 = *(void *)(a1 + 136);
  uint64_t v33 = *(void *)(a1 + 144);
  uint64_t v34 = *(void *)(a1 + 152);
  uint64_t v35 = *(void *)(a1 + 160);
  *(void *)(a1 + 136) = v28;
  *(void *)(a1 + 144) = v29;
  *(void *)(a1 + 152) = v30;
  *(void *)(a1 + 160) = v31;
  unsigned __int8 v36 = *(unsigned char *)(a1 + 168);
  *(unsigned char *)(a1 + 168) = (_BYTE)v2;
  sub_24CFA99F0(v32, v33, v34, v35, v36);
  return a1;
}

__n128 __swift_memcpy169_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(_OWORD *)(a1 + 153) = *(long long *)((char *)a2 + 153);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for SceneView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24CFA99E4();
  char v5 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v5;
  sub_24CFA99E4();
  long long v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  long long v8 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void **)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 104);
  unint64_t v14 = *(void *)(a1 + 112);
  long long v15 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v15;
  long long v16 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v16;
  sub_24CF9F770(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 132) = *(unsigned char *)(a2 + 132);
  char v17 = *(unsigned char *)(a2 + 168);
  uint64_t v18 = *(void *)(a1 + 136);
  uint64_t v19 = *(void *)(a1 + 144);
  uint64_t v20 = *(void *)(a1 + 152);
  uint64_t v21 = *(void *)(a1 + 160);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  unsigned __int8 v22 = *(unsigned char *)(a1 + 168);
  *(unsigned char *)(a1 + 168) = v17;
  sub_24CFA99F0(v18, v19, v20, v21, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 169)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 168) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 169) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 169) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneView()
{
  return &type metadata for SceneView;
}

uint64_t sub_24CFB50FC()
{
  return sub_24CFB63E4((unint64_t *)&qword_269849260, (void (*)(uint64_t))type metadata accessor for _SceneView);
}

uint64_t *sub_24CFB5144(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    swift_retain();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
    *(void *)&v10[*(int *)(v13 + 28)] = *(void *)&v11[*(int *)(v13 + 28)];
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    long long v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)a1 + v14) = (uint64_t)v16;
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    uint64_t v17 = a3[8];
    uint64_t v18 = a3[9];
    uint64_t v19 = (char *)a1 + v17;
    uint64_t v20 = (char *)a2 + v17;
    void v19[4] = v20[4];
    *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
    uint64_t v21 = (char *)a1 + v18;
    unsigned __int8 v22 = (char *)a2 + v18;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v18);
    uint64_t v24 = *((void *)v22 + 1);
    uint64_t v25 = *((void *)v22 + 2);
    uint64_t v26 = *((void *)v22 + 3);
    unsigned __int8 v27 = v22[32];
    swift_retain();
    id v28 = v16;
    sub_24CFA98E4(v23, v24, v25, v26, v27);
    *(void *)uint64_t v21 = v23;
    *((void *)v21 + 1) = v24;
    *((void *)v21 + 2) = v25;
    *((void *)v21 + 3) = v26;
    v21[32] = v27;
  }
  return a1;
}

uint64_t sub_24CFB5308(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  swift_release();
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  swift_release();

  uint64_t v7 = a1 + a2[9];
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v10 = *(void *)(v7 + 16);
  uint64_t v11 = *(void *)(v7 + 24);
  unsigned __int8 v12 = *(unsigned char *)(v7 + 32);
  return sub_24CFA99F0(v8, v9, v10, v11, v12);
}

uint64_t sub_24CFB5414(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  swift_retain();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)(a2 + v13);
  *(void *)(a1 + v13) = v15;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(unsigned char *)(v18 + 4) = *(unsigned char *)(v19 + 4);
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  uint64_t v22 = *(void *)(a2 + v17);
  uint64_t v23 = *(void *)(v21 + 8);
  uint64_t v24 = *(void *)(v21 + 16);
  uint64_t v25 = *(void *)(v21 + 24);
  unsigned __int8 v26 = *(unsigned char *)(v21 + 32);
  swift_retain();
  id v27 = v15;
  sub_24CFA98E4(v22, v23, v24, v25, v26);
  *(void *)uint64_t v20 = v22;
  *(void *)(v20 + 8) = v23;
  *(void *)(v20 + 16) = v24;
  *(void *)(v20 + 24) = v25;
  *(unsigned char *)(v20 + 32) = v26;
  return a1;
}

uint64_t sub_24CFB5588(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_retain();
  swift_release();
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)(a2 + v13);
  uint64_t v15 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = v14;
  id v16 = v14;

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  char v20 = *(unsigned char *)(v19 + 4);
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  *(unsigned char *)(v18 + 4) = v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)v23;
  uint64_t v25 = *(void *)(v23 + 8);
  uint64_t v26 = *(void *)(v23 + 16);
  uint64_t v27 = *(void *)(v23 + 24);
  unsigned __int8 v28 = *(unsigned char *)(v23 + 32);
  sub_24CFA98E4(*(void *)v23, v25, v26, v27, v28);
  uint64_t v29 = *(void *)v22;
  uint64_t v30 = *(void *)(v22 + 8);
  uint64_t v31 = *(void *)(v22 + 16);
  uint64_t v32 = *(void *)(v22 + 24);
  *(void *)uint64_t v22 = v24;
  *(void *)(v22 + 8) = v25;
  *(void *)(v22 + 16) = v26;
  *(void *)(v22 + 24) = v27;
  unsigned __int8 v33 = *(unsigned char *)(v22 + 32);
  *(unsigned char *)(v22 + 32) = v28;
  sub_24CFA99F0(v29, v30, v31, v32, v33);
  return a1;
}

uint64_t sub_24CFB5734(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  uint64_t v13 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  *(unsigned char *)(v16 + 4) = *(unsigned char *)(v17 + 4);
  uint64_t v18 = a1 + v15;
  uint64_t v19 = a2 + v15;
  *(unsigned char *)(v18 + 32) = *(unsigned char *)(v19 + 32);
  long long v20 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v20;
  return a1;
}

uint64_t sub_24CFB5874(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_release();
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);

  uint64_t v15 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  *(unsigned char *)(v16 + 4) = *(unsigned char *)(v17 + 4);
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  char v21 = *(unsigned char *)(v20 + 32);
  uint64_t v22 = *(void *)v19;
  uint64_t v23 = *(void *)(v19 + 8);
  uint64_t v24 = *(void *)(v19 + 16);
  uint64_t v25 = *(void *)(v19 + 24);
  unsigned __int8 v26 = *(unsigned char *)(v19 + 32);
  long long v27 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v27;
  *(unsigned char *)(v19 + 32) = v21;
  sub_24CFA99F0(v22, v23, v24, v25, v26);
  return a1;
}

uint64_t sub_24CFB59E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CFB59F4);
}

uint64_t sub_24CFB59F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_24CFB5B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CFB5B24);
}

uint64_t sub_24CFB5B24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_24CFB5C3C()
{
  sub_24CFB5D6C(319, &qword_2698493B0, (void (*)(uint64_t))type metadata accessor for Presentation);
  if (v0 <= 0x3F)
  {
    sub_24CFB5D6C(319, &qword_2698493B8, (void (*)(uint64_t))type metadata accessor for _SceneView.LifetimeAssertion);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24CFB5D6C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24CFD3328();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24CFB5DC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFB5DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _SceneView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFB5E44()
{
  type metadata accessor for _SceneView();
  return sub_24CFB3354();
}

uint64_t sub_24CFB5EA8(uint64_t a1, uint64_t a2)
{
  return sub_24CFB5FAC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFB35AC);
}

unint64_t sub_24CFB5EC0()
{
  unint64_t result = qword_2698493E8;
  if (!qword_2698493E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698493E0);
    sub_24CFB5F3C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698493E8);
  }
  return result;
}

unint64_t sub_24CFB5F3C()
{
  unint64_t result = qword_2698493F0;
  if (!qword_2698493F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698493F0);
  }
  return result;
}

uint64_t sub_24CFB5F94(uint64_t a1, uint64_t a2)
{
  return sub_24CFB5FAC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CFB37F0);
}

uint64_t sub_24CFB5FAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for _SceneView() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a3(a1, a2, v7);
}

uint64_t sub_24CFB6044()
{
  type metadata accessor for _SceneView();
  return sub_24CFB3918();
}

unint64_t sub_24CFB60C4()
{
  unint64_t result = qword_269849560;
  if (!qword_269849560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849560);
  }
  return result;
}

uint64_t objectdestroy_19Tm()
{
  unint64_t v1 = (int *)(type metadata accessor for _SceneView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849388);
  swift_release();
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849398);
  swift_release();

  uint64_t v10 = v6 + v1[11];
  sub_24CFA99F0(*(void *)v10, *(void *)(v10 + 8), *(void *)(v10 + 16), *(void *)(v10 + 24), *(unsigned char *)(v10 + 32));
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24CFB629C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for _SceneView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_24CFB3A54(a1, a2, v6);
}

unint64_t sub_24CFB631C()
{
  unint64_t result = qword_2698493F8;
  if (!qword_2698493F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698493F8);
  }
  return result;
}

id sub_24CFB6370@<X0>(void *a1@<X8>)
{
  id result = sub_24CFBC49C();
  *a1 = result;
  return result;
}

void sub_24CFB639C(id *a1)
{
}

void sub_24CFB63C8()
{
  sub_24CFBC5AC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CFB63E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CFB642C()
{
  return sub_24CFB350C();
}

unint64_t sub_24CFB6434()
{
  unint64_t result = qword_269849410;
  if (!qword_269849410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849410);
  }
  return result;
}

unint64_t sub_24CFB6488()
{
  unint64_t result = qword_269849418;
  if (!qword_269849418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849418);
  }
  return result;
}

uint64_t sub_24CFB64DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFB663C(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_24CFB6648(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_24CFB6668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

void SceneStack.init(_:priority:forLayers:activationPolicy:content:)(void *a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  char v10 = *((unsigned char *)a3 + 4);
  char v11 = *(unsigned char *)(a4 + 32);
  int v16 = *a3;
  char v17 = v10;
  long long v12 = *(_OWORD *)(a4 + 16);
  v14[0] = *(_OWORD *)a4;
  v14[1] = v12;
  char v15 = v11;
  type metadata accessor for SnapshotSource();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_24CFD32A8();
  *(void *)(v13 + 24) = 0;
  sub_24CFD2F08();
  SceneStack.init(_:priority:forLayers:activationPolicy:snapshotSource:content:)(a1, a2, (uint64_t)&v16, (uint64_t)v14, v13, a5, a6);
}

void SceneStack.init(_:priority:forLayers:activationPolicy:snapshotSource:content:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X8>)
{
  int v10 = *(_DWORD *)a3;
  char v11 = *(unsigned char *)(a3 + 4);
  long long v15 = *(_OWORD *)a4;
  uint64_t v13 = *(void *)(a4 + 16);
  uint64_t v12 = *(void *)(a4 + 24);
  char v14 = *(unsigned char *)(a4 + 32);
  id v17 = a1;
  *(void *)&v24[0] = objc_msgSend(v17, sel_identity);
  *((void *)&v24[0] + 1) = v17;
  memset(&v24[1], 0, 48);
  uint64_t v25 = 0;
  int v22 = v10;
  char v23 = v11;
  long long v18 = v15;
  uint64_t v19 = v13;
  uint64_t v20 = v12;
  char v21 = v14;
  sub_24CFAB5E0(v24, a2, &v22, &v18, a5, a6, a7);
  swift_release();
}

uint64_t SceneStack.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v20 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849420);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269849428);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849220);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v18 = v3;
  uint64_t v21 = v3;
  uint64_t v22 = v4;
  uint64_t v23 = v5;
  unint64_t v24 = sub_24CFAB6F8();
  sub_24CFD31B8();
  sub_24CFD3278();
  swift_getTupleTypeMetadata3();
  sub_24CFD3338();
  swift_getWitnessTable();
  uint64_t v6 = sub_24CFD3298();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  *(&v17 - 4) = v18;
  *(&v17 - 3) = v5;
  *(&v17 - 2) = v19;
  sub_24CFD32E8();
  sub_24CFD3288();
  swift_getWitnessTable();
  char v14 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v14(v12, v10, v6);
  long long v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v14(v20, v12, v6);
  v15(v12, v6);
  return swift_release();
}

void sub_24CFB6B68(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t WitnessTable = a1;
  uint64_t v40 = a4;
  uint64_t v34 = a2;
  uint64_t v48 = a2;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849220);
  uint64_t v50 = a3;
  unint64_t v51 = sub_24CFAB6F8();
  uint64_t v35 = sub_24CFD31B8();
  uint64_t v5 = sub_24CFD3278();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v38 = (char *)&v32 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849250);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(qword_269849428);
  uint64_t v14 = MEMORY[0x270FA5388](v41);
  int v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v42 = (uint64_t)&v32 - v17;
  sub_24CFD3488();
  uint64_t v37 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = _s13ConfigurationVMa_0();
  sub_24CFAA508(&v48);
  uint64_t v19 = v49;
  uint64_t v34 = v48;
  sub_24CFAA6B8(v18, v13);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  *(void *)&v16[*(int *)(v41 + 36)] = 0xBFF0000000000000;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v20 = (uint64_t)v16;
  unsigned __int8 v33 = v16;
  uint64_t v21 = v42;
  sub_24CFB7824(v20, v42);
  sub_24CFAB000(v18, (uint64_t)v8);
  v47[3] = swift_getWitnessTable();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = v38;
  uint64_t v23 = v39;
  unint64_t v24 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v24(v38, v8, v5);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v23 + 8);
  v25(v8, v5);
  unsigned __int8 v26 = v8;
  long long v27 = v34;
  v47[0] = v34;
  v47[1] = v19;
  v47[2] = 0xC000000000000000;
  uint64_t v48 = v47;
  uint64_t v28 = v21;
  uint64_t v29 = (uint64_t)v33;
  sub_24CFB788C(v28, (uint64_t)v33);
  uint64_t v49 = v29;
  v24(v26, v22, v5);
  uint64_t v50 = v26;
  id v30 = v27;
  swift_retain();
  v46[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_269849420);
  v46[1] = v41;
  v46[2] = v5;
  unint64_t v43 = sub_24CFB78F4();
  unint64_t v44 = sub_24CFB79E8();
  uint64_t v45 = WitnessTable;
  sub_24CFB7010((uint64_t)&v48, 3uLL, (uint64_t)v46);
  v25(v22, v5);
  sub_24CFB7B78(v42);
  swift_release();

  v25(v26, v5);
  sub_24CFB7B78(v29);
  uint64_t v31 = (void *)v47[0];
  swift_release();
  swift_release();
}

uint64_t sub_24CFB7010(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *uint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        int v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)int v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_24CFD3348();
}

void sub_24CFB71D8(uint64_t a1@<X8>)
{
  sub_24CFB6B68(*(void *)(v1 + 32), *(void **)(v1 + 16), *(char **)(v1 + 24), a1);
}

uint64_t sub_24CFB71E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFB7228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24CFB7230()
{
  uint64_t result = _s13ConfigurationVMa_0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CFB72C0(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v6 + 184) & ~v6) + v7;
  char v11 = 8 * (((v6 - 72) & ~(_BYTE)v6) + v7);
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)(a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      int v16 = (unint64_t *)(((((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v16 + v6 + 8) & ~v6);
      }
      unint64_t v17 = *v16;
      if (v17 >= 0xFFFFFFFF) {
        LODWORD(v17) = -1;
      }
      return (v17 + 1);
    }
  }
  int v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(unsigned char *)(a1 + v10)) {
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
        LODWORD(v10) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v10) = *(unsigned __int16 *)a1 | (*(unsigned __int8 *)(a1 + 2) << 16);
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

void sub_24CFB7474(unint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  size_t v11 = ((v10 + 184) & ~v10) + *(void *)(v6 + 64);
  BOOL v12 = a3 >= v9;
  unsigned int v13 = a3 - v9;
  if (v13 != 0 && v12)
  {
    if (v11 <= 3)
    {
      unsigned int v17 = ((v13 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
      if (HIWORD(v17))
      {
        int v14 = 4;
      }
      else if (v17 >= 0x100)
      {
        int v14 = 2;
      }
      else
      {
        int v14 = v17 > 1;
      }
    }
    else
    {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v15 = ~v9 + a2;
    if (v11 < 4)
    {
      int v16 = (v15 >> (8 * (((v10 - 72) & ~(_BYTE)v10) + *(unsigned char *)(v6 + 64)))) + 1;
      if (v11)
      {
        int v18 = v15 & ~(-1 << (8 * (((v10 - 72) & ~(_BYTE)v10) + *(unsigned char *)(v6 + 64))));
        bzero((void *)a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          *(unsigned char *)(a1 + 2) = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *(unsigned char *)a1 = v18;
        }
      }
    }
    else
    {
      bzero((void *)a1, v11);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        *(unsigned char *)(a1 + v11) = v16;
        return;
      case 2:
        *(_WORD *)(a1 + v11) = v16;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)(a1 + v11) = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      *(unsigned char *)(a1 + v11) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)(a1 + v11) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24CFB76E4);
    case 4:
      *(_DWORD *)(a1 + v11) = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        uint64_t v19 = (void *)(((((a1 & 0xFFFFFFFFFFFFFFF8) + 127) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
        if ((v8 & 0x80000000) != 0)
        {
          uint64_t v21 = *(void (**)(unint64_t))(v7 + 56);
          v21(((unint64_t)v19 + v10 + 8) & ~v10);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v20 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v20 = a2 - 1;
          }
          void *v19 = v20;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SceneStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFB7724()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CFB7824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269849428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFB788C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269849428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CFB78F4()
{
  unint64_t result = qword_2698494B0;
  if (!qword_2698494B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849420);
    sub_24CFB7994();
    sub_24CFB7B34(&qword_2698494C0, &qword_2698494C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698494B0);
  }
  return result;
}

unint64_t sub_24CFB7994()
{
  unint64_t result = qword_2698494B8;
  if (!qword_2698494B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698494B8);
  }
  return result;
}

unint64_t sub_24CFB79E8()
{
  unint64_t result = qword_2698494D0;
  if (!qword_2698494D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269849428);
    type metadata accessor for _SceneView();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849258);
    sub_24CFB7ADC();
    sub_24CFAB9A0();
    swift_getOpaqueTypeConformance2();
    sub_24CFB7B34(&qword_2698494C0, &qword_2698494C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698494D0);
  }
  return result;
}

unint64_t sub_24CFB7ADC()
{
  unint64_t result = qword_269849260;
  if (!qword_269849260)
  {
    type metadata accessor for _SceneView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849260);
  }
  return result;
}

uint64_t sub_24CFB7B34(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CFB7B78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_269849428);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void destroy for ApplySettingsViewModifier(uint64_t a1)
{
  sub_24CFB6648(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for ApplySettingsViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24CFB663C(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for ApplySettingsViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24CFB663C(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24CFB6648(v6, v7);
  unsigned int v8 = *(void **)(a1 + 16);
  unsigned int v9 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v9;
  id v10 = v9;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for ApplySettingsViewModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24CFB6648(v6, v7);
  unsigned int v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApplySettingsViewModifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ApplySettingsViewModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ApplySettingsViewModifier()
{
  return &type metadata for ApplySettingsViewModifier;
}

uint64_t sub_24CFB7E0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFB7E28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  char v5 = *(void **)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 24);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB663C(v3, v4);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB448C(v3, v4, &v16);
  sub_24CFB6648(v3, v4);
  swift_release();
  unsigned int v15 = v5;
  char v14 = v6;
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  unsigned int v8 = *(void (**)(char *, uint64_t))(*(void *)(MEMORY[0x263F8D4F8] - 8) + 8);
  id v9 = v5;
  swift_bridgeObjectRetain();
  id v10 = v9;
  v8(&v14, v7);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494E0);
  (*(void (**)(void **, uint64_t))(*(void *)(v11 - 8) + 8))(&v15, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848D80);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 8))(&v16, v12);
  return swift_release();
}

uint64_t sub_24CFB8038(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char v11 = a6 & 1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2 && a3 != 1)
  {
    sub_24CFA89A4();
    id v12 = a2;
    sub_24CFD2F98();
    unsigned int v13 = v16;
    id v15 = v12;
    uint64_t v16 = (void (*)(void, id *))a4;
    v13(&v16, &v15);

    swift_release();
  }
  sub_24CFB663C(a5, v11);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB448C(a5, v11, (uint64_t *)&v16);
  sub_24CFB6648(a5, v11);
  swift_release();
  sub_24CFB81E8(a1, (uint64_t)v16);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFB81E8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v17 = (uint64_t)sub_24CFB88A8(a2);
  sub_24CFB882C(&v17);
  swift_bridgeObjectRelease();
  uint64_t v3 = v17;
  if (v17 < 0 || (v17 & 0x4000000000000000) != 0) {
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)(v17 + 16);
  if (v4)
  {
    while (1)
    {
      unint64_t v14 = v3 & 0xC000000000000001;
      if ((v3 & 0xC000000000000001) != 0)
      {
        MEMORY[0x253319E30](0, v3);
        if (!*(void *)(a2 + 16)) {
          goto LABEL_27;
        }
      }
      else
      {
        if (!*(void *)(v3 + 16)) {
          goto LABEL_28;
        }
        swift_retain();
        if (!*(void *)(a2 + 16))
        {
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
      }
      uint64_t v5 = swift_retain();
      unint64_t v6 = sub_24CFC3064(v5);
      if (v7) {
        break;
      }
LABEL_18:
      swift_release();
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_24CFD37C8();
      swift_release();
      if (!v4) {
        goto LABEL_23;
      }
    }
    uint64_t v8 = 0;
    uint64_t v15 = v3;
    while (1)
    {
      id v9 = *(void (**)(uint64_t))(*(void *)(a2 + 56) + 96 * v6 + 64);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_release();
      v9(a1);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v3 = v15;
      if (v4 - 1 == v8) {
        break;
      }
      unint64_t v10 = v8 + 1;
      if (v14)
      {
        MEMORY[0x253319E30](v8 + 1, v15);
        if (__OFADD__(v10, 1)) {
          goto LABEL_19;
        }
      }
      else
      {
        if (v10 >= *(void *)(v15 + 16)) {
          goto LABEL_21;
        }
        swift_retain();
        if (__OFADD__(v10, 1)) {
          goto LABEL_19;
        }
      }
      if (!*(void *)(a2 + 16)) {
        goto LABEL_20;
      }
      uint64_t v11 = swift_retain();
      unint64_t v6 = sub_24CFC3064(v11);
      ++v8;
      if ((v12 & 1) == 0) {
        goto LABEL_18;
      }
    }
  }
LABEL_23:
  return swift_release();
}

void sub_24CFB8448(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  uint64_t v5 = *(void **)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 24);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB7E28((uint64_t)v12);
  uint64_t v7 = v12[0];
  id v11 = (id)v12[1];
  char v8 = v13;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v3;
  *(unsigned char *)(v9 + 24) = v4;
  *(void *)(v9 + 32) = v5;
  *(unsigned char *)(v9 + 40) = v6;
  sub_24CFB663C(v3, v4);
  id v10 = v5;
  sub_24CFBF1E0(v7, (uint64_t)v11, v8, (uint64_t)sub_24CFB87F0, v9, a1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_24CFB85BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, char a7)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  if (a6 && (a7 & 1) != 0)
  {
    MEMORY[0x270FA5388](isCurrentExecutor);
    _OWORD v14[2] = a3;
    v14[3] = a6;
    v14[4] = a4;
    char v15 = a5 & 1;
    uint64_t v16 = a6;
    char v17 = 1;
    id v13 = a6;
    sub_24CF90900(sub_24CFB880C, (uint64_t)v14);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
  }
}

uint64_t sub_24CFB878C()
{
  return sub_24CFD2FD8();
}

uint64_t sub_24CFB87AC()
{
  sub_24CFB6648(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_24CFB87F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24CFB85BC(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24), *(void **)(v3 + 32), *(unsigned char *)(v3 + 40));
}

uint64_t sub_24CFB880C(uint64_t a1, void *a2)
{
  return sub_24CFB8038(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned char *)(v2 + 40));
}

uint64_t sub_24CFB882C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_24CFB9DCC();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24CFB8994(v6);
  return sub_24CFD3708();
}

void *sub_24CFB88A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_269849198);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_24CFB9BC8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24CFB9DC4();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_24CFB8994(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_24CFD3868();
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_155;
    }
    if (v4) {
      return sub_24CFB93F0(0, v4, 1, v3);
    }
  }
  else
  {
    if (v4 >= 0) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = v4 + 1;
    }
    if (v4 < -1)
    {
      uint64_t result = sub_24CFD37A8();
      __break(1u);
    }
    else
    {
      uint64_t v98 = result;
      if (v4 < 2)
      {
        uint64_t v9 = (char *)MEMORY[0x263F8EE78];
        uint64_t v107 = MEMORY[0x263F8EE78];
        __dst = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
        if (v4 != 1)
        {
          unint64_t v40 = *(void *)(MEMORY[0x263F8EE78] + 16);
          if (v40 < 2) {
            goto LABEL_130;
          }
          goto LABEL_118;
        }
      }
      else
      {
        uint64_t v7 = v6 >> 1;
        sub_24CFD35F8();
        uint64_t v8 = sub_24CFD3458();
        *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
        __dst = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
        uint64_t v107 = v8;
      }
      uint64_t v10 = v4;
      uint64_t v11 = 0;
      v96 = v3;
      uint64_t v97 = *v3 - 8;
      uint64_t v9 = (char *)MEMORY[0x263F8EE78];
      uint64_t v100 = v10;
      uint64_t v106 = *v3;
      while (1)
      {
        uint64_t v12 = v11;
        uint64_t v101 = v11;
        if (v11 + 1 >= v10)
        {
          ++v11;
          goto LABEL_42;
        }
        uint64_t v13 = v10;
        swift_retain();
        swift_retain();
        int v14 = sub_24CF8F58C();
        if (v2) {
          break;
        }
        int v15 = v14;
        swift_release();
        swift_release();
        uint64_t v16 = v12 + 2;
        uint64_t v17 = v13;
        uint64_t v11 = v16;
        uint64_t v18 = v106;
        if (v16 < v17)
        {
          while (1)
          {
            while (1)
            {
              swift_retain();
              swift_retain();
              uint64_t v19 = sub_24CFD35D8();
              if (swift_isClassType()) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = 0;
              }
              if (!v20) {
                goto LABEL_163;
              }
              uint64_t v21 = sub_24CFD35D8();
              if (!swift_isClassType()) {
                uint64_t v21 = 0;
              }
              if (!v21) {
                goto LABEL_163;
              }
              uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
              LOBYTE(ObjCClassFromMetadata) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
              swift_release();
              swift_release();
              if (ObjCClassFromMetadata) {
                break;
              }
              uint64_t v18 = v106;
              if (v15)
              {
                uint64_t v11 = v16;
LABEL_35:
                uint64_t v12 = v101;
                if (v11 >= v101)
                {
                  uint64_t v2 = 0;
                  if (v101 < v11)
                  {
                    int v23 = (uint64_t *)(v97 + 8 * v11);
                    uint64_t v24 = v11;
                    uint64_t v25 = v101;
                    uint64_t v26 = (uint64_t *)(v18 + 8 * v101);
                    while (1)
                    {
                      if (v25 != --v24)
                      {
                        if (!v18) {
                          goto LABEL_161;
                        }
                        uint64_t v27 = *v26;
                        uint64_t *v26 = *v23;
                        *int v23 = v27;
                      }
                      ++v25;
                      --v23;
                      ++v26;
                      if (v25 >= v24) {
                        goto LABEL_42;
                      }
                    }
                  }
                  goto LABEL_42;
                }
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
                while (1)
                {
LABEL_163:
                  swift_retain();
                  sub_24CFD36C8();
                  sub_24CFD33F8();
                  sub_24CFD35F8();
                  sub_24CFD3758();
                  sub_24CFD37B8();
                  __break(1u);
                }
              }
              uint64_t v11 = v16 + 1;
              uint64_t v16 = v11;
              if (v11 >= v100) {
                goto LABEL_33;
              }
            }
            uint64_t v18 = v106;
            if (((v15 ^ (v21 == v20)) & 1) == 0) {
              break;
            }
            uint64_t v11 = v16 + 1;
            uint64_t v16 = v11;
            if (v11 >= v100) {
              goto LABEL_32;
            }
          }
          uint64_t v11 = v16;
        }
LABEL_32:
        if (v15) {
          goto LABEL_35;
        }
LABEL_33:
        uint64_t v2 = 0;
        uint64_t v12 = v101;
LABEL_42:
        if (v11 < v100)
        {
          if (__OFSUB__(v11, v12)) {
            goto LABEL_154;
          }
          if (v11 - v12 < v98)
          {
            if (__OFADD__(v12, v98)) {
              goto LABEL_156;
            }
            uint64_t v28 = v100;
            if (v12 + v98 < v100) {
              uint64_t v28 = v12 + v98;
            }
            if (v28 < v12)
            {
LABEL_157:
              __break(1u);
              goto LABEL_158;
            }
            if (v11 != v28)
            {
              uint64_t v104 = v2;
              uint64_t v29 = (void *)(v97 + 8 * v11);
              uint64_t v99 = v28;
              do
              {
                uint64_t v30 = v12;
                v102 = v29;
                uint64_t v31 = v29;
                do
                {
                  swift_retain();
                  swift_retain();
                  uint64_t v32 = sub_24CFD35D8();
                  if (swift_isClassType()) {
                    uint64_t v33 = v32;
                  }
                  else {
                    uint64_t v33 = 0;
                  }
                  if (!v33) {
                    goto LABEL_163;
                  }
                  uint64_t v34 = sub_24CFD35D8();
                  if (!swift_isClassType()) {
                    uint64_t v34 = 0;
                  }
                  if (!v34) {
                    goto LABEL_163;
                  }
                  uint64_t v35 = swift_getObjCClassFromMetadata();
                  unsigned __int8 v36 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, v35);
                  swift_release();
                  swift_release();
                  if (v34 == v33 || (v36 & 1) == 0) {
                    break;
                  }
                  if (!v106) {
                    goto LABEL_159;
                  }
                  uint64_t v37 = *v31;
                  *uint64_t v31 = v31[1];
                  v31[1] = v37;
                  --v31;
                  ++v30;
                }
                while (v11 != v30);
                ++v11;
                uint64_t v12 = v101;
                uint64_t v29 = v102 + 1;
              }
              while (v11 != v99);
              uint64_t v11 = v99;
              uint64_t v2 = v104;
            }
          }
        }
        if (v11 < v12) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v9 = sub_24CFB99FC(0, *((void *)v9 + 2) + 1, 1, v9);
        }
        unint64_t v39 = *((void *)v9 + 2);
        unint64_t v38 = *((void *)v9 + 3);
        unint64_t v40 = v39 + 1;
        uint64_t v41 = v106;
        if (v39 >= v38 >> 1)
        {
          uint64_t v89 = sub_24CFB99FC((char *)(v38 > 1), v39 + 1, 1, v9);
          uint64_t v41 = v106;
          uint64_t v9 = v89;
        }
        uint64_t v105 = v2;
        *((void *)v9 + 2) = v40;
        uint64_t v42 = v9 + 32;
        unint64_t v43 = &v9[16 * v39 + 32];
        *(void *)unint64_t v43 = v101;
        *((void *)v43 + 1) = v11;
        if (v39)
        {
          while (1)
          {
            unint64_t v44 = v40 - 1;
            if (v40 >= 4)
            {
              uint64_t v49 = &v42[16 * v40];
              uint64_t v50 = *((void *)v49 - 8);
              uint64_t v51 = *((void *)v49 - 7);
              BOOL v55 = __OFSUB__(v51, v50);
              uint64_t v52 = v51 - v50;
              if (v55) {
                goto LABEL_138;
              }
              uint64_t v54 = *((void *)v49 - 6);
              uint64_t v53 = *((void *)v49 - 5);
              BOOL v55 = __OFSUB__(v53, v54);
              uint64_t v47 = v53 - v54;
              char v48 = v55;
              if (v55) {
                goto LABEL_139;
              }
              unint64_t v56 = v40 - 2;
              uint64_t v57 = &v42[16 * v40 - 32];
              uint64_t v59 = *(void *)v57;
              uint64_t v58 = *((void *)v57 + 1);
              BOOL v55 = __OFSUB__(v58, v59);
              uint64_t v60 = v58 - v59;
              if (v55) {
                goto LABEL_141;
              }
              BOOL v55 = __OFADD__(v47, v60);
              uint64_t v61 = v47 + v60;
              if (v55) {
                goto LABEL_144;
              }
              if (v61 >= v52)
              {
                uint64_t v79 = &v42[16 * v44];
                uint64_t v81 = *(void *)v79;
                uint64_t v80 = *((void *)v79 + 1);
                BOOL v55 = __OFSUB__(v80, v81);
                uint64_t v82 = v80 - v81;
                if (v55) {
                  goto LABEL_148;
                }
                BOOL v72 = v47 < v82;
                goto LABEL_103;
              }
            }
            else
            {
              if (v40 != 3)
              {
                uint64_t v73 = *((void *)v9 + 4);
                uint64_t v74 = *((void *)v9 + 5);
                BOOL v55 = __OFSUB__(v74, v73);
                uint64_t v66 = v74 - v73;
                char v67 = v55;
                goto LABEL_97;
              }
              uint64_t v46 = *((void *)v9 + 4);
              uint64_t v45 = *((void *)v9 + 5);
              BOOL v55 = __OFSUB__(v45, v46);
              uint64_t v47 = v45 - v46;
              char v48 = v55;
            }
            if (v48) {
              goto LABEL_140;
            }
            unint64_t v56 = v40 - 2;
            uint64_t v62 = &v42[16 * v40 - 32];
            uint64_t v64 = *(void *)v62;
            uint64_t v63 = *((void *)v62 + 1);
            BOOL v65 = __OFSUB__(v63, v64);
            uint64_t v66 = v63 - v64;
            char v67 = v65;
            if (v65) {
              goto LABEL_143;
            }
            uint64_t v68 = &v42[16 * v44];
            uint64_t v70 = *(void *)v68;
            uint64_t v69 = *((void *)v68 + 1);
            BOOL v55 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            if (v55) {
              goto LABEL_146;
            }
            if (__OFADD__(v66, v71)) {
              goto LABEL_147;
            }
            if (v66 + v71 >= v47)
            {
              BOOL v72 = v47 < v71;
LABEL_103:
              if (v72) {
                unint64_t v44 = v56;
              }
              goto LABEL_105;
            }
LABEL_97:
            if (v67) {
              goto LABEL_142;
            }
            id v75 = &v42[16 * v44];
            uint64_t v77 = *(void *)v75;
            uint64_t v76 = *((void *)v75 + 1);
            BOOL v55 = __OFSUB__(v76, v77);
            uint64_t v78 = v76 - v77;
            if (v55) {
              goto LABEL_145;
            }
            if (v78 < v66) {
              goto LABEL_114;
            }
LABEL_105:
            unint64_t v83 = v44 - 1;
            if (v44 - 1 >= v40)
            {
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
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
              goto LABEL_157;
            }
            if (!v41) {
              goto LABEL_160;
            }
            uint64_t v84 = &v42[16 * v83];
            uint64_t v85 = *(void *)v84;
            unint64_t v86 = &v42[16 * v44];
            uint64_t v87 = *((void *)v86 + 1);
            sub_24CFB96A0((char *)(v41 + 8 * *(void *)v84), (char *)(v41 + 8 * *(void *)v86), v41 + 8 * v87, __dst);
            if (v105) {
              goto LABEL_130;
            }
            if (v87 < v85) {
              goto LABEL_135;
            }
            if (v44 > *((void *)v9 + 2)) {
              goto LABEL_136;
            }
            *(void *)uint64_t v84 = v85;
            *(void *)&v42[16 * v83 + 8] = v87;
            unint64_t v88 = *((void *)v9 + 2);
            if (v44 >= v88) {
              goto LABEL_137;
            }
            unint64_t v40 = v88 - 1;
            memmove(&v42[16 * v44], v86 + 16, 16 * (v88 - 1 - v44));
            *((void *)v9 + 2) = v88 - 1;
            uint64_t v41 = v106;
            if (v88 <= 2) {
              goto LABEL_114;
            }
          }
        }
        unint64_t v40 = 1;
LABEL_114:
        uint64_t v10 = v100;
        uint64_t v2 = v105;
        if (v11 >= v100)
        {
          uint64_t v3 = v96;
          if (v40 < 2)
          {
LABEL_130:
            swift_bridgeObjectRelease();
            goto LABEL_131;
          }
LABEL_118:
          uint64_t v90 = *v3;
          while (1)
          {
            unint64_t v91 = v40 - 2;
            if (v40 < 2) {
              goto LABEL_149;
            }
            if (!v90) {
              goto LABEL_162;
            }
            uint64_t v92 = *(void *)&v9[16 * v91 + 32];
            uint64_t v93 = *(void *)&v9[16 * v40 + 24];
            sub_24CFB96A0((char *)(v90 + 8 * v92), (char *)(v90 + 8 * *(void *)&v9[16 * v40 + 16]), v90 + 8 * v93, __dst);
            if (v2) {
              goto LABEL_130;
            }
            if (v93 < v92) {
              goto LABEL_151;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v9 = sub_24CFB9BB4((uint64_t)v9);
            }
            if (v91 >= *((void *)v9 + 2)) {
              goto LABEL_152;
            }
            v94 = &v9[16 * v91 + 32];
            *(void *)v94 = v92;
            *((void *)v94 + 1) = v93;
            unint64_t v95 = *((void *)v9 + 2);
            if (v40 > v95) {
              goto LABEL_153;
            }
            memmove(&v9[16 * v40 + 16], &v9[16 * v40 + 32], 16 * (v95 - v40));
            *((void *)v9 + 2) = v95 - 1;
            unint64_t v40 = v95 - 1;
            if (v95 <= 2) {
              goto LABEL_130;
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
LABEL_131:
      *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24CFD3448();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_24CFB93F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v15 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = (void *)(*a4 + 8 * a3 - 8);
LABEL_5:
    uint64_t v7 = v15;
    uint64_t v16 = v6;
    while (1)
    {
      swift_retain();
      swift_retain();
      uint64_t v8 = sub_24CFD35D8();
      uint64_t v9 = swift_isClassType() ? v8 : 0;
      if (!v9) {
        break;
      }
      uint64_t v10 = sub_24CFD35D8();
      if (!swift_isClassType()) {
        uint64_t v10 = 0;
      }
      if (!v10) {
        break;
      }
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      unsigned __int8 v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
      swift_release();
      uint64_t result = swift_release();
      if (v10 != v9 && (v12 & 1) != 0)
      {
        if (!v5)
        {
          __break(1u);
          break;
        }
        uint64_t v13 = *v6;
        *uint64_t v6 = v6[1];
        v6[1] = v13;
        --v6;
        if (v4 != ++v7) {
          continue;
        }
      }
      ++v4;
      uint64_t v6 = v16 + 1;
      if (v4 == a2) {
        return result;
      }
      goto LABEL_5;
    }
    swift_retain();
    sub_24CFD36C8();
    sub_24CFD33F8();
    sub_24CFD35F8();
    sub_24CFD3758();
    uint64_t result = sub_24CFD37B8();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CFB96A0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v33 = __src;
  uint64_t v32 = __dst;
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      uint64_t v19 = v4;
      if (__dst != a2 || &a2[8 * v13] <= __dst)
      {
        memmove(__dst, a2, 8 * v13);
        __dst = v30;
      }
      uint64_t v20 = &__dst[8 * v13];
      uint64_t v31 = v20;
      uint64_t v33 = v6;
      if (v7 >= v6 || v11 < 8) {
        goto LABEL_48;
      }
      uint64_t v21 = (char *)(a3 - 8);
      unint64_t v22 = v6;
      uint64_t v29 = v7;
      while (1)
      {
        int v23 = v20;
        v20 -= 8;
        v22 -= 8;
        swift_retain();
        swift_retain();
        char v24 = sub_24CF8F58C();
        if (v19) {
          goto LABEL_47;
        }
        char v25 = v24;
        uint64_t v26 = v21 + 8;
        swift_release();
        swift_release();
        if (v25)
        {
          uint64_t v27 = v30;
          if (v26 != v6 || v21 >= v6) {
            *(void *)uint64_t v21 = *(void *)v22;
          }
          uint64_t v33 = v22;
          uint64_t v19 = 0;
          uint64_t v20 = v23;
        }
        else
        {
          uint64_t v31 = v20;
          uint64_t v27 = v30;
          if (v26 < v23 || v21 >= v23 || v26 != v23) {
            *(void *)uint64_t v21 = *(void *)v20;
          }
          unint64_t v22 = v6;
          uint64_t v19 = 0;
        }
        if (v22 > v29)
        {
          v21 -= 8;
          uint64_t v6 = v22;
          if (v20 > v27) {
            continue;
          }
        }
        goto LABEL_48;
      }
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
    {
      memmove(__dst, __src, 8 * v10);
      __dst = v30;
    }
    int v14 = &__dst[8 * v10];
    uint64_t v31 = v14;
    if ((unint64_t)v6 >= a3 || v8 < 8) {
      goto LABEL_48;
    }
    while (1)
    {
      uint64_t v15 = __dst;
      swift_retain();
      swift_retain();
      char v16 = sub_24CF8F58C();
      if (v4) {
        break;
      }
      char v17 = v16;
      swift_release();
      swift_release();
      if (v17)
      {
        uint64_t v18 = v6 + 8;
        if (v7 < v6 || v7 >= v18 || v7 != v6) {
          *(void *)uint64_t v7 = *(void *)v6;
        }
        __dst = v15;
      }
      else
      {
        if (v7 != v15) {
          *(void *)uint64_t v7 = *(void *)v15;
        }
        __dst = v15 + 8;
        uint64_t v32 = v15 + 8;
        uint64_t v18 = v6;
      }
      v7 += 8;
      uint64_t v33 = v7;
      if (__dst < v14)
      {
        uint64_t v6 = v18;
        if ((unint64_t)v18 < a3) {
          continue;
        }
      }
      goto LABEL_48;
    }
LABEL_47:
    swift_release();
    swift_release();
LABEL_48:
    sub_24CFB9AF8((void **)&v33, &v32, &v31);
    return 1;
  }
  uint64_t result = sub_24CFD3818();
  __break(1u);
  return result;
}

char *sub_24CFB99FC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698494D8);
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
  int v14 = a4 + 32;
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

char *sub_24CFB9AF8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24CFD3818();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_24CFB9BB4(uint64_t a1)
{
  return sub_24CFB99FC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CFB9BC8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *int64_t v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24CFB9DC4()
{
  return swift_release();
}

void sub_24CFB9DCC()
{
}

uint64_t sub_24CFB9DE0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24CFB9EC8()
{
  unint64_t result = qword_269849508;
  if (!qword_269849508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698494F0);
    sub_24CFB7B34(&qword_269849510, (uint64_t *)&unk_269848D80);
    sub_24CFB9F78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849508);
  }
  return result;
}

unint64_t sub_24CFB9F78()
{
  unint64_t result = qword_269849518;
  if (!qword_269849518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698494E0);
    sub_24CFB9FEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849518);
  }
  return result;
}

unint64_t sub_24CFB9FEC()
{
  unint64_t result = qword_269849520;
  if (!qword_269849520)
  {
    sub_24CFBA044();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849520);
  }
  return result;
}

unint64_t sub_24CFBA044()
{
  unint64_t result = qword_269849528;
  if (!qword_269849528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269849528);
  }
  return result;
}

double static SceneActivationPolicy.activated.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 1;
  *(_OWORD *)a1 = xmmword_24CFD6FF0;
  *(void *)(a1 + 16) = j_nullsub_1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

double static SceneActivationPolicy.unspecified.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 2;
  return result;
}

uint64_t static SceneActivationPolicy.activated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = xmmword_24CFD6FF0;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(unsigned char *)(a3 + 32) = 1;
  return swift_retain();
}

double static SceneActivationPolicy.remainActivated.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = xmmword_24CFD7000;
  *(void *)(a1 + 16) = j_nullsub_1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t static SceneActivationPolicy.remainActivated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = xmmword_24CFD7000;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(unsigned char *)(a3 + 32) = 1;
  return swift_retain();
}

void static SceneActivationPolicy.deactivated.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = nullsub_1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
}

uint64_t static SceneActivationPolicy.deactivated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(void *)a3 = sub_24CF90FFC;
  *(void *)(a3 + 8) = v6;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  return swift_retain();
}

uint64_t sub_24CFBA1C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFBA200@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t)v2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFBA9EC(v2, (uint64_t)&v21);
  if (v24)
  {
    if (v24 == 1)
    {
      uint64_t v6 = v21;
      char v7 = BYTE8(v21);
      uint64_t v8 = v22;
      uint64_t v9 = v23;
      uint64_t v10 = type metadata accessor for ActivatedPolicyModel();
      swift_allocObject();
      sub_24CFAB7E0(v3);
      uint64_t v11 = sub_24CF9B174((uint64_t)a1, v6, v7, v8, v9);
      uint64_t v19 = v10;
      uint64_t v20 = sub_24CFBAA1C(&qword_269849530, (void (*)(uint64_t))type metadata accessor for ActivatedPolicyModel);
      *(void *)&long long v18 = v11;
    }
    else
    {
      uint64_t v15 = type metadata accessor for NullSceneActivationPolicyModel();
      uint64_t v16 = swift_allocObject();
      uint64_t v19 = v15;
      uint64_t v20 = sub_24CFBAA1C(&qword_269849370, (void (*)(uint64_t))type metadata accessor for NullSceneActivationPolicyModel);
      *(void *)&long long v18 = v16;
    }
  }
  else
  {
    uint64_t v12 = type metadata accessor for DeactivationSceneActivationPolicyModel();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a1;
    *(_OWORD *)(v13 + 24) = v21;
    uint64_t v19 = v12;
    uint64_t v20 = sub_24CFBAA1C(&qword_269849538, (void (*)(uint64_t))type metadata accessor for DeactivationSceneActivationPolicyModel);
    *(void *)&long long v18 = v13;
    sub_24CFAB7E0(v3);
    id v14 = a1;
  }
  sub_24CFBAA04(&v18, a2);
  return swift_release();
}

uint64_t sub_24CFBA444()
{
  sub_24CFBA9EC(v0, (uint64_t)&v2);
  if (!v4) {
    return 0x6176697463616544;
  }
  if (v4 != 1) {
    return 0x6669636570736E55;
  }
  uint64_t result = 0x6574617669746341;
  if ((v3 & 1) == 0)
  {
    sub_24CFD3878();
    sub_24CFD33F8();
    swift_bridgeObjectRelease();
    sub_24CFD33F8();
    return 0x6574617669746341;
  }
  return result;
}

uint64_t sub_24CFBA53C()
{
  sub_24CFBA9EC(v0, (uint64_t)v2);
  return sub_24CFBA444();
}

uint64_t sub_24CFBA574(uint64_t a1, uint64_t *a2)
{
  int v2 = *((unsigned __int8 *)a2 + 32);
  if (!*(unsigned char *)(a1 + 32)) {
    return v2 == 0;
  }
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*(unsigned char *)(a1 + 32) == 1)
  {
    if (v2 == 1)
    {
      BOOL v6 = (v4 & 1) == 0 && *(void *)a1 == v3;
      if (*(unsigned char *)(a1 + 8)) {
        return a2[1] & 1;
      }
      else {
        return v6;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = a2[2] | a2[3] | v3 | v4;
    return v2 == 2 && v8 == 0;
  }
}

BOOL static SceneActivationPolicy.== infix(_:_:)(uint64_t a1, uint64_t *a2)
{
  int v2 = *((unsigned __int8 *)a2 + 32);
  if (!*(unsigned char *)(a1 + 32)) {
    return !*((unsigned char *)a2 + 32);
  }
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*(unsigned char *)(a1 + 32) != 1)
  {
    uint64_t v6 = a2[2] | a2[3] | v3 | v4;
    return v2 == 2 && v6 == 0;
  }
  if (v2 != 1) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    return (v4 & 1) == 0 && *(void *)a1 == v3;
  }
  return (v4 & 1) != 0;
}

double static SceneActivationPolicy.remainActivatedWithUnlimitedAttempts.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = xmmword_24CFD7000;
  *(void *)(a1 + 16) = j_nullsub_1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t static SceneActivationPolicy.remainActivatedWithUnlimitedAttempts(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = xmmword_24CFD7000;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(unsigned char *)(a3 + 32) = 1;
  return swift_retain();
}

uint64_t SceneActivationPolicy.description.getter()
{
  if (!*(unsigned char *)(v0 + 32)) {
    return 0x6176697463616544;
  }
  if (*(unsigned char *)(v0 + 32) != 1) {
    return 0x6669636570736E55;
  }
  uint64_t result = 0x6574617669746341;
  if ((*(unsigned char *)(v0 + 8) & 1) == 0)
  {
    sub_24CFD3878();
    sub_24CFD33F8();
    swift_bridgeObjectRelease();
    sub_24CFD33F8();
    return 0x6574617669746341;
  }
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SceneActivationPolicy()
{
  return &type metadata for SceneActivationPolicy;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwxx_0(uint64_t a1)
{
  return sub_24CFA99F0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24CFA98E4(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24CFA98E4(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_24CFA99F0(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_24CFA99F0(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CFBA9A8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CFBA9C0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SceneActivationPolicy.Kind()
{
  return &type metadata for SceneActivationPolicy.Kind;
}

uint64_t sub_24CFBA9EC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24CFBAA04(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24CFBAA1C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_24CFBAA68@<X0>(void *a1@<X8>)
{
  id result = sub_24CF932E0();
  *a1 = result;
  return result;
}

void sub_24CFBAA94(id *a1)
{
}

uint64_t sub_24CFBAAC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CF933F0();
  *a1 = result;
  return result;
}

uint64_t sub_24CFBAAEC()
{
  return sub_24CF9381C();
}

uint64_t sub_24CFBAB14@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24CF934F8((uint64_t)&v4);
  char v3 = v5;
  *(_DWORD *)a1 = v4;
  *(unsigned char *)(a1 + 4) = v3;
  return result;
}

uint64_t sub_24CFBAB58()
{
  return sub_24CF93A14();
}

void sub_24CFBAB98()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24CFD3058();
  sub_24CFD31D8();
  char v3 = sub_24CFBC6DC();
  sub_24CFBC928();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  swift_release();
  uint64_t v0 = sub_24CFBC6DC();
  sub_24CFBC928();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = swift_getKeyPath();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404((unint64_t *)&qword_269848BF0, (void (*)(uint64_t))type metadata accessor for UIPresenterObserver);
  sub_24CFD2ED8();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269848C48);
  sub_24CFBD4CC(&qword_269848C50, &qword_269848C48, (void (*)(void))sub_24CF95A34, (void (*)(void))sub_24CF95CAC);
  sub_24CFD3258();
  swift_release();
  swift_release();
  sub_24CFB6648(KeyPath, 0);

  sub_24CFB6648(v1, 0);
  swift_release();
  swift_release();
}

uint64_t sub_24CFBB024@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFAF290();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CFBB050()
{
  return sub_24CFAF3A8();
}

uint64_t sub_24CFBB08C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CFAF5D0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CFBB0BC()
{
  return sub_24CFAF6D8();
}

double sub_24CFBB0E4@<D0>(uint64_t a1@<X8>)
{
  sub_24CFAFE5C((uint64_t)v5);
  char v2 = v6;
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_24CFBB128(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  v6[0] = *(void *)a1;
  v6[1] = v1;
  uint64_t v6[2] = v2;
  v6[3] = v3;
  unsigned __int8 v7 = v4;
  sub_24CFA98E4(v6[0], v1, v2, v3, v4);
  return sub_24CFB0798((uint64_t)v6);
}

uint64_t sub_24CFBB17C()
{
  uint64_t v1 = v0;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_2698488A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CFD2F48();
  __swift_project_value_buffer(v2, (uint64_t)qword_26984D1E0);
  uint64_t v3 = sub_24CFD2F28();
  os_log_type_t v4 = sub_24CFD34F8();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_24CF8B000, v3, v4, "#ScenePresentation Invalidated!", v5, 2u);
    MEMORY[0x25331A7D0](v5, -1, -1);
  }

  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2ED8();
  swift_release();
  char v6 = (char *)*(id *)(v1 + 48);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers], sel_removeObject_, v1);

  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2ED8();
  swift_release();
  unsigned __int8 v7 = (char *)*(id *)(v1 + 48);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers], sel_removeObject_, v1);

  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = sub_24CF92E34();
  if (v8)
  {
    objc_msgSend(v8, sel_invalidate);
    swift_release();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    return swift_release();
  }
}

void sub_24CFBB5C4(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFBD404(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

uint64_t sub_24CFBB720()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFBD404(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFBB8E0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFBD404(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFBBAAC(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v1;
  char v5 = *(unsigned char *)(a1 + 32);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFBD404((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  sub_24CFBD27C((uint64_t)v4);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFBBC88(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2ED8();
  swift_release();
  id v4 = *(id *)(v1 + 48);
  swift_release();
  type metadata accessor for SceneFuture();
  char v5 = sub_24CFD3578();

  if ((v5 & 1) == 0)
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers), sel_removeObject_, v2);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers), sel_removeObject_, v2);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_24CFD2ED8();
    swift_release();
    id v6 = *(id *)(v2 + 48);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_24CFBD404(&qword_269848BE8, (void (*)(uint64_t))type metadata accessor for UISceneHostingViewModel);
    sub_24CFD2EC8();
    swift_release();
    swift_release();

    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_24CFD2ED8();
    swift_release();
    id v8 = *(id *)(v2 + 48);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v9 = swift_getKeyPath();
    MEMORY[0x270FA5388](v9);
    sub_24CFBD404((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
    sub_24CFD2EC8();
    swift_release();
    swift_release();

    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_24CFD2ED8();
    swift_release();
    uint64_t v10 = (char *)*(id *)(v2 + 48);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers], sel_addObject_, v2);

    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_24CFD2ED8();
    swift_release();
    uint64_t v11 = (char *)*(id *)(v2 + 48);
    swift_release();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers], sel_addObject_, v2);
    swift_release();
  }
  return swift_release();
}

id sub_24CFBC49C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(id *)(v0 + 48);
  swift_release();
  return v1;
}

void sub_24CFBC5AC(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  id v6 = v4;
  sub_24CFBBC88((uint64_t)v5);
  swift_release();
  swift_release();
}

void *sub_24CFBC6DC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2ED8();
  swift_release();
  id v1 = (char *)*(id *)(v0 + 48);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene];
  id v3 = v2;
  swift_release();

  swift_release();
  return v2;
}

uint64_t sub_24CFBC928()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 56);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(v1 + 88);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFBD404((unint64_t *)&qword_269848BF0, (void (*)(uint64_t))type metadata accessor for UIPresenterObserver);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v3 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting);
  swift_release();
  swift_release();
  swift_release();
  return v3;
}

uint64_t sub_24CFBCAFC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFBD404((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_24CFBCCC0(void *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  int v16 = *a3;
  char v17 = *((unsigned char *)a3 + 4);
  long long v26 = *(_OWORD *)a4;
  uint64_t v24 = *(void *)(a4 + 24);
  uint64_t v25 = *(void *)(a4 + 16);
  char v18 = *(unsigned char *)(a4 + 32);
  sub_24CFD2F08();
  v9[2] = a5;
  v9[3] = a6;
  _OWORD v9[4] = a7;
  v9[5] = a8;
  v9[6] = a1;
  LODWORD(v27) = v16;
  BYTE4(v27) = v17;
  type metadata accessor for UISceneHostingViewModel();
  swift_allocObject();
  id v19 = a1;
  swift_retain();
  swift_retain();
  v9[7] = sub_24CF941CC((uint64_t)v19, a2, (int *)&v27);
  long long v27 = v26;
  uint64_t v28 = v25;
  uint64_t v29 = v24;
  char v30 = v18;
  type metadata accessor for ApplyActivationModel();
  swift_allocObject();
  uint64_t v20 = (char *)v19;
  uint64_t v21 = sub_24CFB1A1C(v20, &v27);

  v9[8] = v21;
  sub_24CFD3488();
  swift_retain();
  swift_retain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(void *)&long long v27 = v21;
  sub_24CFBD404((unint64_t *)&qword_269849368, (void (*)(uint64_t))type metadata accessor for ApplyActivationModel);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers], sel_addObject_, v9, v24, v25, v26);
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers], sel_addObject_, v9);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_24CFBD058()
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC12DrawingBoard12Presentation___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CFBD120()
{
  return type metadata accessor for Presentation();
}

uint64_t type metadata accessor for Presentation()
{
  uint64_t result = qword_269849548;
  if (!qword_269849548) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFBD174()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

double sub_24CFBD234@<D0>(uint64_t a1@<X8>)
{
  sub_24CFAFE5C((uint64_t)v5);
  char v2 = v6;
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_24CFBD27C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CFBD2B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24CF934F8((uint64_t)&v4);
  char v3 = v5;
  *(_DWORD *)a1 = v4;
  *(unsigned char *)(a1 + 4) = v3;
  return result;
}

uint64_t sub_24CFBD2F8()
{
  return sub_24CF93A14();
}

uint64_t sub_24CFBD338@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CF933F0();
  *a1 = result;
  return result;
}

uint64_t sub_24CFBD364()
{
  return sub_24CF9381C();
}

id sub_24CFBD394@<X0>(void *a1@<X8>)
{
  id result = sub_24CF932E0();
  *a1 = result;
  return result;
}

void sub_24CFBD3C0(id *a1)
{
}

uint64_t sub_24CFBD404(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CFBD44C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFAF290();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CFBD478()
{
  return sub_24CFAF3A8();
}

uint64_t sub_24CFBD4C4()
{
  return sub_24CFBCAFC();
}

uint64_t sub_24CFBD4CC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CFBD554@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CFAF5D0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CFBD584()
{
  return sub_24CFAF6D8();
}

uint64_t static LayerTarget.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  unsigned int v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 4);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(_DWORD *)a2) {
    unsigned int v2 = 0;
  }
  if (*(_DWORD *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 4) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t sub_24CFBD5E8(uint64_t a1)
{
  sub_24CF8DDCC(a1, (uint64_t)v9);
  if (v10)
  {
    type metadata accessor for LayerTarget._UILayerTarget();
    if (swift_dynamicCast())
    {
      int v2 = *(_DWORD *)(v1
                     + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target);
      int v3 = *(unsigned __int8 *)(v1
                              + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target
                              + 4);
      int v4 = *(_DWORD *)&v8[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target];
      int v5 = v8[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target
                             + 4];

      if (v3 == 1)
      {
        if (v2)
        {
          if (v5) {
            return v4 != 0;
          }
        }
        else if (v5)
        {
          return v4 == 0;
        }
      }
      else
      {
        if (v2 == v4) {
          char v7 = v5;
        }
        else {
          char v7 = 1;
        }
        if ((v7 & 1) == 0) {
          return 1;
        }
      }
    }
  }
  else
  {
    sub_24CF8DE78((uint64_t)v9);
  }
  return 0;
}

BOOL sub_24CFBD740(id a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target;
  int v4 = *(_DWORD *)(v1
                 + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target);
  if (*(unsigned char *)(v3 + 4) != 1) {
    return objc_msgSend(a1, sel_type) == (id)1 && v4 == objc_msgSend(a1, sel_contextID);
  }
  return !v4 || objc_msgSend(a1, sel_type) == (id)3 || objc_msgSend(a1, sel_type) == (id)4;
}

id sub_24CFBD86C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LayerTarget._UILayerTarget();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LayerTarget.hash(into:)()
{
  if (*(unsigned char *)(v0 + 4) == 1) {
    return sub_24CFD3958();
  }
  sub_24CFD3958();
  return sub_24CFD3968();
}

uint64_t LayerTarget.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 4);
  sub_24CFD3948();
  sub_24CFD3958();
  if (v1 != 1) {
    sub_24CFD3968();
  }
  return sub_24CFD3978();
}

uint64_t sub_24CFBD97C()
{
  int v1 = *(unsigned __int8 *)(v0 + 4);
  sub_24CFD3948();
  sub_24CFD3958();
  if (v1 != 1) {
    sub_24CFD3968();
  }
  return sub_24CFD3978();
}

uint64_t sub_24CFBD9F8()
{
  if (*(unsigned char *)(v0 + 4) == 1) {
    return sub_24CFD3958();
  }
  sub_24CFD3958();
  return sub_24CFD3968();
}

uint64_t sub_24CFBDA54()
{
  int v1 = *(unsigned __int8 *)(v0 + 4);
  sub_24CFD3948();
  sub_24CFD3958();
  if (v1 != 1) {
    sub_24CFD3968();
  }
  return sub_24CFD3978();
}

uint64_t sub_24CFBDACC(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  unsigned int v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 4);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(_DWORD *)a2) {
    unsigned int v2 = 0;
  }
  if (*(_DWORD *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 4) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t LayerTarget.description.getter()
{
  if (*(unsigned char *)(v0 + 4) == 1)
  {
    if (*(_DWORD *)v0) {
      return 0x6472616F6279656BLL;
    }
    else {
      return 0x726579614C6C6C61;
    }
  }
  else
  {
    sub_24CFD3878();
    sub_24CFD33F8();
    swift_bridgeObjectRelease();
    return 0x3A747865746E6F63;
  }
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LayerTarget(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LayerTarget(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_24CFBDC2C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CFBDC48(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LayerTarget()
{
  return &type metadata for LayerTarget;
}

uint64_t type metadata accessor for LayerTarget._UILayerTarget()
{
  return self;
}

uint64_t SceneConfiguration.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SceneConfiguration.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SceneConfiguration.identifier.modify())()
{
  return nullsub_1;
}

id SceneConfiguration.specification.getter()
{
  return *(id *)(v0 + 16);
}

void SceneConfiguration.specification.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*SceneConfiguration.specification.modify())()
{
  return nullsub_1;
}

uint64_t SceneConfiguration.clientIdentity.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t SceneConfiguration.clientIdentity.setter(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SceneConfiguration.clientIdentity.modify())()
{
  return nullsub_1;
}

uint64_t sub_24CFBDDD0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 32) = sub_24CFBE288;
  *(void *)(a2 + 40) = v5;
  return result;
}

uint64_t SceneConfiguration.onCreate.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t SceneConfiguration.onCreate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*SceneConfiguration.onCreate.modify())()
{
  return nullsub_1;
}

uint64_t SceneConfiguration.init(identifier:specification:clientIdentity:onCreate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

id _s12DrawingBoard18SceneConfigurationV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = (void *)a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_24CFD38A8(), id result = 0, (v7 & 1) != 0))
  {
    id result = objc_msgSend(v2, sel_isEqual_, v5);
    if (result) {
      return objc_msgSend(v3, sel_isEqual_, v4);
    }
  }
  return result;
}

uint64_t sub_24CFBDF6C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = sub_24CFBE2C0;
  a2[1] = v5;
  return swift_retain();
}

uint64_t destroy for SceneConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SceneConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneConfiguration()
{
  return &type metadata for SceneConfiguration;
}

uint64_t sub_24CFBE250()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFBE288(uint64_t a1)
{
  unint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_24CFBE2C0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t SceneActivationPolicyError.sceneIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SceneActivationPolicyError.description.getter()
{
  return 0;
}

uint64_t destroy for SceneActivationPolicyError(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s12DrawingBoard26SceneActivationPolicyErrorVwCP_0(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v5 = *(id *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *a1 = v4;
  a1[1] = v7;
  a1[2] = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SceneActivationPolicyError(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v5 = *(id *)a2;
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SceneActivationPolicyError(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneActivationPolicyError(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SceneActivationPolicyError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SceneActivationPolicyError()
{
  return &type metadata for SceneActivationPolicyError;
}

void sub_24CFBE5C8()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14.receiver = v0;
  v14.super_class = ObjectType;
  objc_msgSendSuper2(&v14, sel__readySceneForConnection);
  id v3 = objc_msgSend(v0, sel__FBSScene);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E88]), sel_initWithWindowScene_, v0);
  objc_msgSend(v4, sel_makeKeyAndVisible);
  type metadata accessor for LocalSceneExtension();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for LocalSceneExtension.ClientComponent();
  if (objc_msgSend(v3, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata()))
  {
    swift_dynamicCastClassUnconditional();
    uint64_t v6 = sub_24CFAC854();
    v6((uint64_t)v3);
    id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2698496B0));
    id v8 = (void *)sub_24CFD30E8();
    objc_msgSend(v4, sel_setRootViewController_, v8);

    uint64_t v9 = self;
    id v10 = v4;
    id v11 = objc_msgSend(v9, sel_blueColor);
    objc_msgSend(v10, sel_setBackgroundColor_, v11);

    swift_unknownObjectRelease();
    swift_release();
    unsigned __int8 v12 = *(void **)&v1[OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow];
    *(void *)&v1[OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow] = v10;
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698496A8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_24CFD68F0;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    *(void *)(v13 + 32) = 0xD000000000000030;
    *(void *)(v13 + 40) = 0x800000024CFD9440;
    sub_24CFD3938();
    swift_release();

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for LocalWindowScene()
{
  return self;
}

ValueMetadata *type metadata accessor for ApplyPropagatedSettingsViewModifier()
{
  return &type metadata for ApplyPropagatedSettingsViewModifier;
}

uint64_t sub_24CFBEB78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFBEB94(void *a1, uint64_t a2)
{
  swift_getObjectType();
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24CFD3628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    uint64_t result = sub_24CFD34E8();
    a2 = v26;
    uint64_t v24 = v27;
    uint64_t v4 = v28;
    uint64_t v5 = v29;
    unint64_t v6 = v30;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v24 = a2 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a2 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  while (a2 < 0)
  {
    if (!sub_24CFD3668()) {
      return sub_24CFB9DC4();
    }
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    uint64_t v13 = v5;
    uint64_t v11 = v6;
    if (!v25) {
      return sub_24CFB9DC4();
    }
LABEL_33:
    sub_24CFD35D8();
    uint64_t result = swift_isClassType();
    if ((result & 1) == 0) {
      goto LABEL_39;
    }
    swift_retain();
    sub_24CFD35C8();
    uint64_t v19 = v18;
    swift_release();
    if (v19)
    {
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      if (objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata))
      {
        uint64_t v21 = (NSString *)sub_24CFD3398();
        SEL v22 = NSSelectorFromString(v21);

        objc_msgSend(a1, sel_addPropagatedProperty_, v22);
      }
      swift_bridgeObjectRelease();
    }
    uint64_t result = swift_release();
    uint64_t v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v13 = v5;
LABEL_32:
    uint64_t v17 = *(void *)(*(void *)(a2 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      return sub_24CFB9DC4();
    }
    goto LABEL_33;
  }
  int64_t v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v10) {
      return sub_24CFB9DC4();
    }
    unint64_t v15 = *(void *)(v24 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        return sub_24CFB9DC4();
      }
      unint64_t v15 = *(void *)(v24 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          return sub_24CFB9DC4();
        }
        unint64_t v15 = *(void *)(v24 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            return sub_24CFB9DC4();
          }
          unint64_t v15 = *(void *)(v24 + 8 * v13);
          if (!v15)
          {
            uint64_t v13 = v5 + 5;
            if (v5 + 5 >= v10) {
              return sub_24CFB9DC4();
            }
            unint64_t v15 = *(void *)(v24 + 8 * v13);
            if (!v15)
            {
              uint64_t v16 = v5 + 6;
              while (v10 != v16)
              {
                unint64_t v15 = *(void *)(v24 + 8 * v16++);
                if (v15)
                {
                  uint64_t v13 = v16 - 1;
                  goto LABEL_31;
                }
              }
              return sub_24CFB9DC4();
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_32;
  }
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24CFBEEE0(void *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24CFD3628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    uint64_t result = sub_24CFD34E8();
    uint64_t v2 = v25;
    uint64_t v23 = v26;
    uint64_t v4 = v27;
    uint64_t v5 = v28;
    unint64_t v6 = v29;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v23 = a2 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a2 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  while (v2 < 0)
  {
    if (!sub_24CFD3668()) {
      return sub_24CFB9DC4();
    }
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849000);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    uint64_t v13 = v5;
    uint64_t v11 = v6;
    if (!v24) {
      return sub_24CFB9DC4();
    }
LABEL_32:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698496E8);
    if (swift_dynamicCastClass())
    {
      swift_retain();
      sub_24CFD35C8();
      uint64_t v19 = v18;
      swift_release();
      if (v19)
      {
        uint64_t v20 = (NSString *)sub_24CFD3398();
        SEL v21 = NSSelectorFromString(v20);

        objc_msgSend(a1, sel_removePropagatedProperty_, v21);
        swift_bridgeObjectRelease();
      }
    }
    uint64_t result = swift_release();
    uint64_t v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v13 = v5;
LABEL_31:
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      return sub_24CFB9DC4();
    }
    goto LABEL_32;
  }
  int64_t v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v10) {
      return sub_24CFB9DC4();
    }
    unint64_t v15 = *(void *)(v23 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        return sub_24CFB9DC4();
      }
      unint64_t v15 = *(void *)(v23 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          return sub_24CFB9DC4();
        }
        unint64_t v15 = *(void *)(v23 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            return sub_24CFB9DC4();
          }
          unint64_t v15 = *(void *)(v23 + 8 * v13);
          if (!v15)
          {
            uint64_t v13 = v5 + 5;
            if (v5 + 5 >= v10) {
              return sub_24CFB9DC4();
            }
            unint64_t v15 = *(void *)(v23 + 8 * v13);
            if (!v15)
            {
              uint64_t v16 = v5 + 6;
              while (v10 != v16)
              {
                unint64_t v15 = *(void *)(v23 + 8 * v16++);
                if (v15)
                {
                  uint64_t v13 = v16 - 1;
                  goto LABEL_30;
                }
              }
              return sub_24CFB9DC4();
            }
          }
        }
      }
    }
LABEL_30:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CFBF1E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v25 = a6;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494E8);
  uint64_t v11 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  char v32 = a3;
  sub_24CFD3488();
  uint64_t v24 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a4;
  *(void *)(v14 + 24) = a5;
  swift_retain();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494F8);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494F0);
  uint64_t v17 = sub_24CFB7B34(&qword_269849500, &qword_2698494F8);
  unint64_t v18 = sub_24CFB9EC8();
  sub_24CFD3258();
  swift_release();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a4;
  *(void *)(v19 + 24) = a5;
  swift_retain();
  uint64_t v26 = v15;
  uint64_t v27 = v16;
  uint64_t v28 = v17;
  unint64_t v29 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v23;
  sub_24CFD3248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  return swift_release();
}

uint64_t sub_24CFBF48C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v25 = a6;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496B8);
  uint64_t v11 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  char v32 = a3;
  sub_24CFD3488();
  uint64_t v24 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a4;
  *(void *)(v14 + 24) = a5;
  swift_retain();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496C0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496C8);
  uint64_t v17 = sub_24CFB7B34(&qword_2698496D0, &qword_2698496C0);
  unint64_t v18 = sub_24CFC0AF4();
  sub_24CFD3258();
  swift_release();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a4;
  *(void *)(v19 + 24) = a5;
  swift_retain();
  uint64_t v26 = v15;
  uint64_t v27 = v16;
  uint64_t v28 = v17;
  unint64_t v29 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v23;
  sub_24CFD3248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  return swift_release();
}

uint64_t sub_24CFBF738@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v21 = a4;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496F8);
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = a1[1];
  long long v26 = *a1;
  long long v27 = v10;
  char v28 = *((unsigned char *)a1 + 32);
  sub_24CFD3488();
  uint64_t v20 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  swift_retain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849700);
  uint64_t v13 = sub_24CFB7B34((unint64_t *)&qword_269849708, &qword_269849700);
  unint64_t v14 = sub_24CFB631C();
  sub_24CFD3258();
  swift_release();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  swift_retain();
  uint64_t v22 = v12;
  uint64_t v23 = &type metadata for SceneActivationPolicy;
  uint64_t v24 = v13;
  unint64_t v25 = v14;
  swift_getOpaqueTypeConformance2();
  uint64_t v16 = v19;
  sub_24CFD3248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
  return swift_release();
}

uint64_t sub_24CFBF9DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  uint64_t v5 = *(void **)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 24);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB663C(v3, v4);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFB46C0(v3, v4, &v15);
  sub_24CFB6648(v3, v4);
  swift_release();
  unint64_t v14 = v5;
  char v13 = v6;
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  uint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(MEMORY[0x263F8D4F8] - 8) + 8);
  id v9 = v5;
  swift_bridgeObjectRetain();
  id v10 = v9;
  v8(&v13, v7);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494E0);
  (*(void (**)(void **, uint64_t))(*(void *)(v11 - 8) + 8))(&v14, v11);
  (*(void (**)(uint64_t *))(qword_26FF58A70 + 8))(&v15);
  return swift_release();
}

uint64_t sub_24CFBFBE4(void *a1, void *a2, uint64_t a3, void (*a4)(void, id *), uint64_t a5, uint64_t a6)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2 && a3 != 1)
  {
    sub_24CFA89A4();
    id v12 = a2;
    sub_24CFD2F98();
    char v13 = v16;
    id v15 = v12;
    uint64_t v16 = a4;
    v13(&v16, &v15);

    swift_release();
  }
  sub_24CFBEEE0(a1, a5);
  sub_24CFBEB94(a1, a6);
  return swift_release();
}

void sub_24CFBFD18(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  uint64_t v5 = *(void **)(v1 + 16);
  char v6 = *(unsigned char *)(v1 + 24);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFBF9DC((uint64_t)v12);
  uint64_t v7 = v12[0];
  id v11 = (id)v12[1];
  char v8 = v13;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v3;
  *(unsigned char *)(v9 + 24) = v4;
  *(void *)(v9 + 32) = v5;
  *(unsigned char *)(v9 + 40) = v6;
  sub_24CFB663C(v3, v4);
  id v10 = v5;
  sub_24CFBF48C(v7, (uint64_t)v11, v8, (uint64_t)sub_24CFC00E4, v9, a1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_24CFBFE8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, char a7)
{
  uint64_t v12 = *a1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v16[7] = a4;
  char v17 = a5 & 1;
  uint64_t v18 = a6;
  char v19 = a7 & 1;
  sub_24CFBF9DC((uint64_t)v20);
  uint64_t v13 = v20[0];

  swift_bridgeObjectRetain();
  sub_24CFD3478();
  sub_24CFD3468();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  if (a6 && (a7 & 1) != 0)
  {
    MEMORY[0x270FA5388](isCurrentExecutor);
    v16[2] = a3;
    void v16[3] = a6;
    v16[4] = v12;
    v16[5] = v13;
    id v15 = a6;
    sub_24CF90900(sub_24CFC0C68, (uint64_t)v16);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t sub_24CFC00A0()
{
  sub_24CFB6648(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_24CFC00E4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_24CFBFE8C(a1, a2, a3, *(void *)(v3 + 16), *(unsigned char *)(v3 + 24), *(void **)(v3 + 32), *(unsigned char *)(v3 + 40));
}

uint64_t sub_24CFC0100(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, void (*a7)(void *, void *, uint64_t), uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, void, uint64_t, uint64_t, void))
{
  v19[0] = a1;
  v19[1] = a2;
  char v20 = a3;
  v17[0] = a4;
  v17[1] = a5;
  char v18 = a6;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a9(a1, a2, a3 & 1, a4, a5, a6 & 1)) {
    a7(v19, v17, 1);
  }
  return swift_release();
}

uint64_t sub_24CFC0220(uint64_t a1, uint64_t a2, void (*a3)(_OWORD *, _OWORD *, uint64_t))
{
  long long v6 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v6;
  char v16 = *(unsigned char *)(a1 + 32);
  long long v7 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v7;
  char v14 = *(unsigned char *)(a2 + 32);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFBA9EC((long long *)a1, (uint64_t)v18);
  sub_24CFBA9EC((long long *)a2, (uint64_t)v17);
  sub_24CFBA9EC(v18, (uint64_t)&v19);
  if (!v21)
  {
    sub_24CFBA9EC(v17, (uint64_t)v22);
    if (v23) {
      return swift_release();
    }
    goto LABEL_13;
  }
  if (v21 != 1)
  {
    sub_24CFBA9EC(v17, (uint64_t)v22);
    if (v23 != 2) {
      return swift_release();
    }
    int8x16_t v11 = vorrq_s8(v22[0], v22[1]);
    if (vorr_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL))) {
      return swift_release();
    }
LABEL_13:
    a3(v15, v13, 1);
    return swift_release();
  }
  uint64_t v8 = v19;
  char v9 = v20;
  sub_24CFBA9EC(v17, (uint64_t)v22);
  if (v23 == 1)
  {
    __int8 v10 = v22[0].i8[8];
    if (v9)
    {
      if (!v22[0].i8[8]) {
        return swift_release();
      }
      goto LABEL_13;
    }
    if (v8 != v22[0].i64[0]) {
      __int8 v10 = 1;
    }
    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }
  return swift_release();
}

uint64_t sub_24CFC03CC(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5, char a6)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  char v35 = a3;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  char v32 = a6;
  id v7 = a5;
  swift_bridgeObjectRetain();
  id v8 = a2;
  swift_bridgeObjectRetain();
  uint64_t v29 = 32;
  uint64_t v28 = 0;
LABEL_4:
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269848D80);
  uint64_t v10 = sub_24CFB7B34(&qword_269849510, (uint64_t *)&unk_269848D80);
LABEL_5:
  for (uint64_t i = v10; ; uint64_t i = MEMORY[0x263F8D510])
  {
    uint64_t v11 = *(void *)(v9 - 8);
    uint64_t v12 = MEMORY[0x270FA5388](v10);
    char v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x270FA5388](v12);
    char v16 = (char *)&v26 - v15;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496F0);
    uint64_t v18 = v29;
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v19(v14, (char *)&v33 + *(int *)(v17 + v29), v9);
    v19(v16, (char *)&v30 + *(int *)(v17 + v18), v9);
    char v20 = sub_24CFD3388();
    char v21 = *(void (**)(char *, uint64_t))(v11 + 8);
    v21(v16, v9);
    uint64_t v10 = ((uint64_t (*)(char *, uint64_t))v21)(v14, v9);
    if ((v20 & 1) == 0 || v28 == 2) {
      break;
    }
    v29 += 16;
    uint64_t v22 = v28 + 1;
    uint64_t v28 = v22;
    if (!v22) {
      goto LABEL_4;
    }
    if (v22 == 1)
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494E0);
      uint64_t v10 = sub_24CFB9F78();
      goto LABEL_5;
    }
    uint64_t v9 = MEMORY[0x263F8D4F8];
  }
  char v23 = v31;
  swift_bridgeObjectRelease();

  uint64_t v24 = v34;
  swift_bridgeObjectRelease();

  return v20 & 1;
}

uint64_t sub_24CFC0658(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5, char a6)
{
  uint64_t v49 = a1;
  uint64_t v50 = a2;
  char v51 = a3;
  uint64_t v46 = a4;
  uint64_t v47 = a5;
  char v48 = a6;
  sub_24CFA489C();
  uint64_t v8 = qword_26FF58A70;
  uint64_t v9 = *(void *)(qword_26FF58A70 + 64);
  swift_bridgeObjectRetain();
  id v10 = a2;
  swift_bridgeObjectRetain();
  id v11 = a5;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v46 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496E0);
  uint64_t v17 = *(void (**)(char *, char *, ValueMetadata *))(v8 + 16);
  v17(v13, (char *)&v49 + *(int *)(v16 + 32), &type metadata for PropagatedSceneSettings);
  v17(v15, (char *)&v46 + *(int *)(v16 + 32), &type metadata for PropagatedSceneSettings);
  char v18 = sub_24CFD3388();
  uint64_t v19 = *(void (**)(char *, ValueMetadata *))(v8 + 8);
  v19(v15, &type metadata for PropagatedSceneSettings);
  v19(v13, &type metadata for PropagatedSceneSettings);
  if ((v18 & 1) == 0) {
    goto LABEL_4;
  }
  sub_24CFB9F78();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698494E0);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v46 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496E0);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v28(v24, (char *)&v49 + *(int *)(v27 + 48), v20);
  v28(v26, (char *)&v46 + *(int *)(v27 + 48), v20);
  char v29 = sub_24CFD3388();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v21 + 8);
  v30(v26, v20);
  uint64_t v31 = ((uint64_t (*)(char *, uint64_t))v30)(v24, v20);
  if (v29)
  {
    uint64_t v32 = MEMORY[0x263F8D4F8];
    uint64_t v33 = *(void *)(MEMORY[0x263F8D4F8] - 8);
    uint64_t v34 = MEMORY[0x270FA5388](v31);
    unsigned __int8 v36 = (char *)&v46 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x270FA5388](v34);
    unint64_t v38 = (char *)&v46 - v37;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698496E0);
    unint64_t v40 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v40(v36, (char *)&v49 + *(int *)(v39 + 64), v32);
    v40(v38, (char *)&v46 + *(int *)(v39 + 64), v32);
    char v41 = sub_24CFD3388();
    uint64_t v42 = *(void (**)(char *, uint64_t))(v33 + 8);
    v42(v38, v32);
    v42(v36, v32);
  }
  else
  {
LABEL_4:
    char v41 = 0;
  }
  unint64_t v43 = v47;
  swift_bridgeObjectRelease();

  unint64_t v44 = v50;
  swift_bridgeObjectRelease();

  return v41 & 1;
}

uint64_t sub_24CFC0ADC(uint64_t a1, uint64_t a2)
{
  return sub_24CFC0C8C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, void))sub_24CFC0658);
}

unint64_t sub_24CFC0AF4()
{
  unint64_t result = qword_2698496D8;
  if (!qword_2698496D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698496C8);
    sub_24CFA489C();
    sub_24CFB9F78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698496D8);
  }
  return result;
}

uint64_t sub_24CFC0B80(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void *, void *, uint64_t))
{
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  char v10 = *((unsigned char *)a2 + 16);
  v14[0] = *(void *)a1;
  v14[1] = v6;
  char v15 = v7;
  v12[0] = v8;
  v12[1] = v9;
  char v13 = v10;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a4(v14, v12, a3);
  return swift_release();
}

uint64_t sub_24CFC0C68(void *a1, void *a2)
{
  return sub_24CFBFBE4(a1, a2, *(void *)(v2 + 16), *(void (**)(void, id *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_24CFC0C74(uint64_t a1, uint64_t a2)
{
  return sub_24CFC0C8C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, void))sub_24CFC03CC);
}

uint64_t sub_24CFC0C8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, uint64_t, uint64_t, void))
{
  return sub_24CFC0100(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16), *(void (**)(void *, void *, uint64_t))(v3 + 16), *(void *)(v3 + 24), a3);
}

uint64_t sub_24CFC0CD0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFC0D08(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_24CFC0B80(a1, a2, a3, *(void (**)(void *, void *, uint64_t))(v3 + 16));
}

uint64_t sub_24CFC0D24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(v2 + 16);
  long long v4 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v4;
  char v8 = *(unsigned char *)(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  char v10 = *(unsigned char *)(a2 + 32);
  return sub_24CFC0220((uint64_t)v7, (uint64_t)v9, v3);
}

uint64_t sub_24CFC0D70(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *, _OWORD *, uint64_t))
{
  char v6 = *(unsigned char *)(a1 + 32);
  char v7 = *(unsigned char *)(a2 + 32);
  long long v8 = *(_OWORD *)(a1 + 16);
  v13[0] = *(_OWORD *)a1;
  v13[1] = v8;
  char v14 = v6;
  long long v9 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v9;
  char v12 = v7;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a4(v13, v11, a3);
  return swift_release();
}

uint64_t sub_24CFC0E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CFC0D70(a1, a2, a3, *(void (**)(_OWORD *, _OWORD *, uint64_t))(v3 + 16));
}

uint64_t sub_24CFC0E60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t SceneSettings.subscript.setter(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*MEMORY[0x263F8E100] + *a2 + 8);
  uint64_t v30 = a4;
  char v7 = (uint64_t *)type metadata accessor for FBValue();
  uint64_t v28 = *(v7 - 1);
  char v29 = v7;
  MEMORY[0x270FA5388](v7);
  long long v9 = (uint64_t **)((char *)&v28 - v8);
  uint64_t v10 = sub_24CFD3588();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v28 - v13;
  uint64_t v15 = *(void *)(v6 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  char v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v28 - v19;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v32 = a1;
  v21(v14, (uint64_t)a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v6) == 1)
  {
    uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
    v22(v14, v10);
    sub_24CFC3354((uint64_t)a2, v34);
    v22(v32, v10);
    sub_24CFC3470(v34);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v14, v6);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v6);
    sub_24CFAE3B4(a2, (uint64_t)v18, v9);
    uint64_t v24 = v29;
    sub_24CFADD28(v29, v34);
    uint64_t v25 = *(void (**)(uint64_t **, uint64_t *))(v28 + 8);
    swift_retain_n();
    v25(v9, v24);
    uint64_t v26 = v31;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = *v26;
    uint64_t *v26 = 0x8000000000000000;
    sub_24CFC4574(v34, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v26 = v33;
    swift_release_n();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v32, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, v6);
  }
}

uint64_t View.transformSceneSettings<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v11 = (void *)swift_allocObject();
  _OWORD v11[2] = a4;
  v11[3] = a5;
  _OWORD v11[4] = a6;
  v11[5] = a2;
  _OWORD v11[6] = a3;
  swift_retain();
  sub_24CFD3238();
  swift_release();
  swift_release();
  return swift_release();
}

unint64_t sub_24CFC1460@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24CF8DB54(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

uint64_t sub_24CFC1490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24CFB7B34(&qword_269849510, (uint64_t *)&unk_269848D80);
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_24CFC1518()
{
  sub_24CFC5998();
  return sub_24CFD30B8();
}

uint64_t SceneSettings.subscript.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CFC196C(a1, 116, a2);
}

uint64_t sub_24CFC1568@<X0>(void **a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  SceneSettings.subscript.getter(v3, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFC15D0(uint64_t a1, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  uint64_t v6 = *(uint64_t *)((char *)a3 + a4 - 8);
  uint64_t v7 = sub_24CFD3588();
  MEMORY[0x270FA5388](v7);
  long long v9 = (char *)&v14 - v8;
  uint64_t v10 = *a3;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - v8, a1);
  uint64_t v12 = type metadata accessor for SceneSettings();
  swift_retain();
  return SceneSettings.subscript.setter(v9, v10, v12, v6);
}

void (*SceneSettings.subscript.modify(void *a1, void *a2, uint64_t a3, uint64_t a4))(uint64_t ***a1, char a2)
{
  long long v9 = malloc(0x40uLL);
  *a1 = v9;
  _OWORD v9[2] = a4;
  v9[3] = v4;
  *long long v9 = a2;
  v9[1] = a3;
  uint64_t v10 = sub_24CFD3588();
  _OWORD v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  SceneSettings.subscript.getter(a2, (uint64_t)v13);
  return sub_24CFC1804;
}

void sub_24CFC1804(uint64_t ***a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (char *)(*a1)[6];
  uint64_t v4 = (char *)(*a1)[7];
  if (a2)
  {
    long long v5 = v2[4];
    uint64_t v6 = v2[5];
    uint64_t v7 = (uint64_t)v2[2];
    long long v9 = *v2;
    uint64_t v8 = (uint64_t)v2[1];
    ((void (*)(uint64_t *, char *, uint64_t *))v6[2])((*a1)[6], v4, v5);
    swift_retain();
    SceneSettings.subscript.setter(v3, v9, v8, v7);
    ((void (*)(char *, uint64_t *))v6[1])(v4, v5);
  }
  else
  {
    uint64_t v10 = (uint64_t)v2[2];
    size_t v12 = *v2;
    uint64_t v11 = (uint64_t)v2[1];
    swift_retain();
    SceneSettings.subscript.setter(v4, v12, v11, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t SceneSettings.subscript.getter@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRetain();
  sub_24CFC196C(a1, 154, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFC1964@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24CFC196C(a1, 154, a2);
}

uint64_t sub_24CFC196C@<X0>(void *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  void (*v23)(_OWORD *__return_ptr, uint64_t);
  uint64_t v24;
  _OWORD v25[2];
  long long v26;
  uint64_t v27;
  uint64_t vars8;

  uint64_t v6 = *(void *)(*MEMORY[0x263F8E100] + *a1 + 8);
  uint64_t v7 = sub_24CFD3588();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - v9;
  uint64_t v11 = *v3;
  if (*(void *)(v11 + 16))
  {
    uint64_t v12 = swift_retain();
    unint64_t v13 = sub_24CFC3064(v12);
    if (v14)
    {
      v22[0] = v8;
      v22[1] = a2;
      uint64_t v23 = *(void (**)(_OWORD *__return_ptr, uint64_t))(*(void *)(v11 + 56) + 96 * v13 + 48);
      uint64_t v24 = a3;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v15 = swift_release();
      v23(v25, v15);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_24CFC47E0(v25, &v26);
      sub_24CFC47F0((uint64_t)&v26, (uint64_t)v25);
      int v16 = swift_dynamicCast();
      uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
      if (v16)
      {
        uint64_t v18 = *(void *)(v6 - 8);
        v17(v10, 0, 1, v6);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
        uint64_t v19 = v24;
        (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v24, v10, v6);
        return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v17)(v19, 0, 1, v6);
      }
      else
      {
        v17(v10, 1, 1, v6);
        (*(void (**)(char *, uint64_t))(v22[0] + 8))(v10, v7);
        *(void *)&v25[0] = 0;
        *((void *)&v25[0] + 1) = 0xE000000000000000;
        sub_24CFD36C8();
        sub_24CFD33F8();
        sub_24CFD39D8();
        sub_24CFD33F8();
        swift_bridgeObjectRelease();
        sub_24CFD33F8();
        __swift_project_boxed_opaque_existential_1(&v26, v27);
        sub_24CFD3898();
        uint64_t result = sub_24CFD37B8();
        __break(1u);
      }
      return result;
    }
    swift_release();
  }
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v21(a3, 1, 1, v6);
}

uint64_t SceneSettings.subscript.setter(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  sub_24CFC56F8(a1, a2, a3, a4, a5);
  uint64_t v6 = sub_24CFD3588();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(a1, v6);
}

uint64_t sub_24CFC1E14(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*a2 + *MEMORY[0x263F8E100] + 8);
  v27[1] = a4;
  uint64_t v28 = (uint64_t *)type metadata accessor for FBValue();
  v27[0] = *(v28 - 1);
  MEMORY[0x270FA5388](v28);
  uint64_t v8 = (uint64_t **)((char *)v27 - v7);
  uint64_t v9 = sub_24CFD3588();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)v27 - v12;
  uint64_t v14 = *(void *)(v6 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v27 - v18;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  v20(v13, (uint64_t)a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v6) == 1)
  {
    uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
    v21(v13, v9);
    sub_24CFC3354((uint64_t)a2, v32);
    v21(v30, v9);
    sub_24CFC3470(v32);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v13, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v6);
    sub_24CFAE3B4(a2, (uint64_t)v17, v8);
    uint64_t v23 = v28;
    sub_24CFADD28(v28, v32);
    uint64_t v24 = *(void (**)(uint64_t **, uint64_t *))(v27[0] + 8);
    swift_retain_n();
    v24(v8, v23);
    uint64_t v25 = v29;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v31 = *v25;
    *uint64_t v25 = 0x8000000000000000;
    sub_24CFC4574(v32, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v25 = v31;
    swift_release_n();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v30, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v6);
  }
}

void (*SceneSettings.subscript.modify(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5))(uint64_t **a1, char a2)
{
  uint64_t v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  _OWORD v11[4] = v5;
  v11[1] = a3;
  _OWORD v11[2] = a4;
  *uint64_t v11 = a2;
  uint64_t v12 = sub_24CFD3588();
  v11[5] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  _OWORD v11[6] = v13;
  size_t v14 = *(void *)(v13 + 64);
  v11[7] = malloc(v14);
  uint64_t v15 = malloc(v14);
  void v11[8] = v15;
  SceneSettings.subscript.getter(a3, (uint64_t)v15);
  return sub_24CFC2310;
}

void sub_24CFC2310(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[7];
  uint64_t v4 = (void *)(*a1)[8];
  uint64_t v5 = (*a1)[5];
  uint64_t v6 = (*a1)[6];
  uint64_t v7 = (*a1)[3];
  uint64_t v9 = (uint64_t *)(*a1)[1];
  uint64_t v8 = (*a1)[2];
  uint64_t v10 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[7], v4, v5);
    swift_retain();
    sub_24CFC56F8((uint64_t)v3, v10, v9, v8, v7);
    uint64_t v11 = *(void (**)(void *, uint64_t))(v6 + 8);
    v11(v3, v5);
    v11(v4, v5);
  }
  else
  {
    swift_retain();
    sub_24CFC56F8((uint64_t)v4, v10, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_24CFC2434(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  sub_24CFC4DFC(v2, (uint64_t)sub_24CFC5320, 0, isUniquelyReferenced_nonNull_native, &v5);
  *uint64_t v1 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CFC24CC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24CF8DB54(MEMORY[0x263F8EE78]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t static SceneSettings.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24CFC2510(*a1, *a2);
}

uint64_t sub_24CFC2510(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v20 = result;
  int64_t v2 = 0;
  uint64_t v18 = result + 64;
  uint64_t v3 = 1 << *(unsigned char *)(result + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(result + 64);
  int64_t v19 = (unint64_t)(v3 + 63) >> 6;
  while (1)
  {
    if (v5)
    {
      uint64_t v23 = (v5 - 1) & v5;
      int64_t v24 = v2;
      unint64_t v6 = __clz(__rbit64(v5)) | (v2 << 6);
      goto LABEL_24;
    }
    int64_t v7 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v7 >= v19) {
      return 1;
    }
    unint64_t v8 = *(void *)(v18 + 8 * v7);
    int64_t v9 = v2 + 1;
    if (!v8)
    {
      int64_t v9 = v7 + 1;
      if (v7 + 1 >= v19) {
        return 1;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v9);
      if (!v8)
      {
        int64_t v9 = v7 + 2;
        if (v7 + 2 >= v19) {
          return 1;
        }
        unint64_t v8 = *(void *)(v18 + 8 * v9);
        if (!v8)
        {
          int64_t v9 = v7 + 3;
          if (v7 + 3 >= v19) {
            return 1;
          }
          unint64_t v8 = *(void *)(v18 + 8 * v9);
          if (!v8) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v23 = (v8 - 1) & v8;
    int64_t v24 = v9;
    unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
LABEL_24:
    uint64_t v11 = *(void *)(*(void *)(result + 48) + 8 * v6);
    uint64_t v12 = *(void *)(result + 56) + 96 * v6;
    uint64_t v13 = *(void *)v12;
    long long v28 = *(_OWORD *)(v12 + 24);
    long long v29 = *(_OWORD *)(v12 + 8);
    long long v26 = *(_OWORD *)(v12 + 56);
    long long v27 = *(_OWORD *)(v12 + 40);
    long long v25 = *(_OWORD *)(v12 + 72);
    uint64_t v14 = *(void *)(v12 + 88);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    unint64_t v15 = sub_24CFC3064(v11);
    char v17 = v16;
    swift_release();
    if ((v17 & 1) == 0)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return 0;
    }
    uint64_t v22 = *(uint64_t (**)(uint64_t *))(*(void *)(a2 + 56) + 96 * v15 + 16);
    uint64_t v31 = v13;
    long long v32 = v29;
    long long v33 = v28;
    long long v34 = v27;
    long long v35 = v26;
    long long v36 = v25;
    uint64_t v37 = v14;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    char v30 = v22(&v31);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = v20;
    unint64_t v5 = v23;
    int64_t v2 = v24;
    if ((v30 & 1) == 0) {
      return 0;
    }
  }
  int64_t v10 = v7 + 4;
  if (v10 >= v19) {
    return 1;
  }
  unint64_t v8 = *(void *)(v18 + 8 * v10);
  if (v8)
  {
    int64_t v9 = v10;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v9 >= v19) {
      return 1;
    }
    unint64_t v8 = *(void *)(v18 + 8 * v9);
    ++v10;
    if (v8) {
      goto LABEL_23;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t SceneSettings.description.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_24CFC296C(v0);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849710);
  sub_24CFB7B34(qword_269849718, &qword_269849710);
  uint64_t v1 = sub_24CFD3378();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24CFC296C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v3 = a1;
  uint64_t v32 = MEMORY[0x263F8EE78];
  sub_24CFC510C(0, v1, 0);
  uint64_t v2 = v32;
  uint64_t result = sub_24CFC5298(v3);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v24 = v3 + 80;
  int64_t v25 = v1;
  int v26 = v5;
  uint64_t v27 = v3 + 64;
  uint64_t v28 = v3;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v29 = v7;
    uint64_t v12 = *(void *)(*(void *)(v3 + 48) + 8 * v6);
    uint64_t v13 = *(void (**)(uint64_t))(*(void *)(v3 + 56) + 96 * v6 + 80);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v14 = sub_24CFC5668(v12, v13);
    uint64_t v30 = v15;
    uint64_t v31 = v14;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    unint64_t v17 = *(void *)(v32 + 16);
    unint64_t v16 = *(void *)(v32 + 24);
    if (v17 >= v16 >> 1) {
      uint64_t result = sub_24CFC510C(v16 > 1, v17 + 1, 1);
    }
    *(void *)(v32 + 16) = v17 + 1;
    uint64_t v18 = v32 + 16 * v17;
    *(void *)(v18 + 32) = v31;
    *(void *)(v18 + 40) = v30;
    uint64_t v3 = v28;
    int64_t v9 = 1 << *(unsigned char *)(v28 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = v27;
    uint64_t v19 = *(void *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v26;
    if (*(_DWORD *)(v28 + 36) != v26) {
      goto LABEL_27;
    }
    unint64_t v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      int64_t v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v21 = v11 + 1;
      unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            unint64_t v23 = *(void *)(v24 + 8 * v11++);
            if (v23)
            {
              unint64_t v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v7 = v29 + 1;
    uint64_t v6 = v9;
    if (v29 + 1 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24CFC2C30@<X0>(void *a1@<X8>)
{
  sub_24CFC5998();
  uint64_t result = sub_24CFD30B8();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFC2C80()
{
  return sub_24CFD30C8();
}

uint64_t sub_24CFC2CE0(uint64_t *a1, void (*a2)(uint64_t *))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *a1;
  sub_24CF949B8(0, &qword_269848FE8);
  swift_bridgeObjectRetain();
  sub_24CF8DB54(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  uint64_t v7 = v4;
  a2(&v7);
  uint64_t v6 = v7;
  sub_24CFC2434(&v6);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t View.sceneSettings<A>(_:_:)()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CF949B8(0, &qword_269848FE8);
  swift_bridgeObjectRetain();
  sub_24CF8DB54(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  sub_24CFD3208();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t View.sceneSettings<A>(_:_:)(uint64_t a1, void (*a2)(unint64_t *))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v5 = sub_24CF8DB54(MEMORY[0x263F8EE78]);
  a2(&v5);
  swift_getKeyPath();
  sub_24CF949B8(0, &qword_269848FE8);
  sub_24CF8DB54(v3);
  swift_bridgeObjectRelease();
  sub_24CFD3208();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

unint64_t sub_24CFC3064(uint64_t a1)
{
  sub_24CFD35F8();
  uint64_t v2 = sub_24CFD3358();
  return sub_24CFC3174(a1, v2);
}

unint64_t sub_24CFC30D4(uint64_t a1)
{
  uint64_t v2 = sub_24CFD3568();
  return sub_24CFC3240(a1, v2, &qword_269849AD0);
}

unint64_t sub_24CFC3124(uint64_t a1)
{
  uint64_t v2 = sub_24CFD3568();
  return sub_24CFC3240(a1, v2, &qword_2698497B0);
}

unint64_t sub_24CFC3174(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_24CFD35F8();
    do
    {
      if (sub_24CFD3388()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24CFC3240(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_24CF949B8(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_24CFD3578();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_24CFD3578();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_24CFC3354@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CFC3064(a1);
  LOBYTE(a1) = v7;
  uint64_t result = swift_bridgeObjectRelease();
  long long v9 = 0uLL;
  long long v10 = 0uLL;
  long long v11 = 0uLL;
  long long v12 = 0uLL;
  long long v13 = 0uLL;
  long long v14 = 0uLL;
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    uint64_t v24 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24CFC4A20();
      uint64_t v16 = v24;
    }
    swift_release();
    unint64_t v17 = (long long *)(*(void *)(v16 + 56) + 96 * v6);
    long long v22 = v17[1];
    long long v23 = *v17;
    long long v20 = v17[3];
    long long v21 = v17[2];
    long long v18 = v17[5];
    long long v19 = v17[4];
    sub_24CFC41BC(v6, v16);
    *uint64_t v3 = v16;
    uint64_t result = swift_bridgeObjectRelease();
    long long v14 = v18;
    long long v13 = v19;
    long long v12 = v20;
    long long v11 = v21;
    long long v10 = v22;
    long long v9 = v23;
  }
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  a2[4] = v13;
  a2[5] = v14;
  return result;
}

uint64_t *sub_24CFC3470(uint64_t *a1)
{
  return a1;
}

uint64_t sub_24CFC34C4(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24CFC3548(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_24CFC3124(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      uint64_t *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_24CFC4C5C(&qword_2698489A0);
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_24CFD3788();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24CFD3638();
  uint64_t v9 = sub_24CFC38F0(v5, v8);
  swift_retain();
  a1 = sub_24CFC3124((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_24CFC4390(a1, v9);
  uint64_t *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_24CFC36A0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269848A18);
    uint64_t v2 = sub_24CFD37F8();
    uint64_t v18 = v2;
    sub_24CFD3768();
    uint64_t v3 = sub_24CFD3798();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_24CF949B8(0, &qword_269849AD0);
      do
      {
        swift_dynamicCast();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698497D0);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_24CFC3EEC(v12 + 1, 1, &qword_269848A18);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_24CFD3568();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_24CFD3798();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_24CFC38F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698489A0);
    uint64_t v2 = sub_24CFD37F8();
    uint64_t v18 = v2;
    sub_24CFD3768();
    uint64_t v3 = sub_24CFD3798();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_24CF949B8(0, &qword_2698497B0);
      do
      {
        swift_dynamicCast();
        sub_24CF949B8(0, &qword_2698497B8);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_24CFC3EEC(v12 + 1, 1, &qword_2698489A0);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_24CFD3568();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_24CFD3798();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_24CFC3B4C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698489A8);
  char v35 = a2;
  uint64_t v6 = sub_24CFD37E8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
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
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v34[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v34[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v35)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v34[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      uint64_t v29 = *(void *)(v5 + 56) + 96 * v20;
      uint64_t v30 = *(void *)v29;
      long long v39 = *(_OWORD *)(v29 + 24);
      long long v40 = *(_OWORD *)(v29 + 8);
      long long v37 = *(_OWORD *)(v29 + 56);
      long long v38 = *(_OWORD *)(v29 + 40);
      long long v36 = *(_OWORD *)(v29 + 72);
      uint64_t v31 = *(void *)(v29 + 88);
      if ((v35 & 1) == 0)
      {
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
      }
      sub_24CFD35F8();
      uint64_t result = sub_24CFD3358();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v7 + 48) + 8 * v17) = v28;
      uint64_t v18 = *(void *)(v7 + 56) + 96 * v17;
      *(void *)uint64_t v18 = v30;
      *(_OWORD *)(v18 + 8) = v40;
      *(_OWORD *)(v18 + 24) = v39;
      *(_OWORD *)(v18 + 40) = v38;
      *(_OWORD *)(v18 + 56) = v37;
      *(_OWORD *)(v18 + 72) = v36;
      *(void *)(v18 + 88) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CFC3EEC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v7 = sub_24CFD37E8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  long long v37 = v3;
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v15 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12) {
      break;
    }
    char v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v37;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v15 >= v12) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v15 = v26;
      }
    }
LABEL_30:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    uint64_t v31 = 8 * v22;
    uint64_t v32 = *(void **)(*(void *)(v6 + 48) + v31);
    int64_t v33 = *(void **)(*(void *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      id v35 = v33;
    }
    uint64_t result = sub_24CFD3568();
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v37;
  char v24 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v6 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v36;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

unint64_t sub_24CFC41BC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CFD3608();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      sub_24CFD35F8();
      do
      {
        uint64_t result = sub_24CFD3358();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            uint64_t v12 = *(void *)(a2 + 48);
            uint64_t v13 = (void *)(v12 + 8 * v3);
            uint64_t v14 = (void *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1) {
              *uint64_t v13 = *v14;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t result = v15 + 96 * v3;
            uint64_t v16 = (const void *)(v15 + 96 * v6);
            if (v3 != v6 || (int64_t v3 = v6, result >= (unint64_t)v16 + 96))
            {
              uint64_t result = (unint64_t)memmove((void *)result, v16, 0x60uLL);
              int64_t v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
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

void sub_24CFC4390(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_24CFD3608();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_24CFD3568();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *uint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              void *v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    BOOL v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    BOOL v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *BOOL v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_24CFC4544(uint64_t a1, void *a2, char a3)
{
}

uint64_t sub_24CFC4574(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_24CFC3064(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_24CFC4A20();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      unint64_t v17 = (_OWORD *)(v16[7] + 96 * v10);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      long long v19 = a1[3];
      long long v17[2] = a1[2];
      void v17[3] = v19;
      long long v20 = a1[5];
      void v17[4] = a1[4];
      v17[5] = v20;
      long long v21 = a1[1];
      *unint64_t v17 = *a1;
      v17[1] = v21;
      return result;
    }
    goto LABEL_11;
  }
  sub_24CFC3B4C(v13, a3 & 1);
  unint64_t v22 = sub_24CFC3064(a2);
  if ((v14 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_24CFD35F8();
    uint64_t result = sub_24CFD38C8();
    __break(1u);
    return result;
  }
  unint64_t v10 = v22;
  uint64_t v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  *(void *)(v16[6] + 8 * v10) = a2;
  uint64_t v24 = (_OWORD *)(v16[7] + 96 * v10);
  long long v25 = a1[1];
  *uint64_t v24 = *a1;
  v24[1] = v25;
  long long v26 = a1[5];
  long long v24[4] = a1[4];
  v24[5] = v26;
  long long v27 = a1[3];
  v24[2] = a1[2];
  v24[3] = v27;
  uint64_t v28 = v16[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v30;
  return swift_retain();
}

uint64_t sub_24CFC4744@<X0>(void *a1@<X8>)
{
  sub_24CFC5998();
  uint64_t result = sub_24CFD30B8();
  *a1 = v3;
  return result;
}

uint64_t sub_24CFC4798()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CFC47D0(uint64_t *a1)
{
  return sub_24CFC2CE0(a1, *(void (**)(uint64_t *))(v1 + 40));
}

_OWORD *sub_24CFC47E0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24CFC47F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24CFC484C(uint64_t a1, void *a2, char a3)
{
}

void sub_24CFC487C(uint64_t a1, void *a2, char a3, uint64_t (*a4)(void *), uint64_t *a5, unint64_t *a6)
{
  unint64_t v10 = v6;
  uint64_t v13 = *v6;
  unint64_t v15 = a4(a2);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v19 = v14;
  uint64_t v20 = *(void *)(v13 + 24);
  if (v20 >= v18 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_24CFC4C5C(a5);
LABEL_7:
    long long v21 = (void *)*v10;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];

      *(void *)(v22 + 8 * v15) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24CFC3EEC(v18, a3 & 1, a5);
  uint64_t v23 = a4(a2);
  if ((v19 & 1) != (v24 & 1))
  {
LABEL_17:
    sub_24CF949B8(0, a6);
    sub_24CFD38C8();
    __break(1u);
    return;
  }
  unint64_t v15 = v23;
  long long v21 = (void *)*v10;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  v21[(v15 >> 6) + 8] |= 1 << v15;
  uint64_t v25 = 8 * v15;
  *(void *)(v21[6] + v25) = a2;
  *(void *)(v21[7] + v25) = a1;
  uint64_t v26 = v21[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v21[2] = v28;
  id v29 = a2;
}

void *sub_24CFC4A20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698489A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CFD37D8();
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 96 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 88);
    long long v22 = *(_OWORD *)(v19 + 8);
    long long v29 = *(_OWORD *)(v19 + 24);
    long long v23 = *(_OWORD *)(v19 + 40);
    long long v30 = *(_OWORD *)(v19 + 56);
    long long v24 = *(_OWORD *)(v19 + 72);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v25 = *(void *)(v4 + 56) + v18;
    *(void *)uint64_t v25 = v20;
    *(_OWORD *)(v25 + 8) = v22;
    *(_OWORD *)(v25 + 24) = v29;
    *(_OWORD *)(v25 + 40) = v23;
    *(_OWORD *)(v25 + 56) = v30;
    *(_OWORD *)(v25 + 72) = v24;
    *(void *)(v25 + 88) = v21;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_24CFC4C5C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24CFD37D8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    uint64_t v19 = *(void **)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(void *)(*(void *)(v5 + 56) + v17) = v19;
    id v20 = v18;
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24CFC4DFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  unint64_t v43 = a5;
  uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = ~v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = -v6;
  v40[13] = a1;
  v40[14] = a1 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  v40[15] = v7;
  v40[16] = 0;
  v40[17] = v10 & v8;
  v40[18] = a2;
  v40[19] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24CFC53D0((uint64_t)v41);
  sub_24CFC5930((uint64_t)v41, (uint64_t)v40);
  sub_24CFC5930((uint64_t)v41, (uint64_t)v42);
  if (v42[0])
  {
    while (1)
    {
      uint64_t v14 = v40[0];
      uint64_t v13 = v40[1];
      uint64_t v15 = v40[2];
      uint64_t v16 = v40[3];
      uint64_t v17 = v40[4];
      uint64_t v32 = v40[5];
      uint64_t v33 = v40[6];
      uint64_t v34 = v40[7];
      uint64_t v35 = v40[8];
      uint64_t v36 = v40[9];
      uint64_t v37 = v40[10];
      uint64_t v38 = v40[11];
      uint64_t v39 = v40[12];
      uint64_t v18 = (void *)*v43;
      unint64_t v20 = sub_24CFC3064(v40[0]);
      uint64_t v21 = v18[2];
      BOOL v22 = (v19 & 1) == 0;
      uint64_t v23 = v21 + v22;
      if (__OFADD__(v21, v22)) {
        break;
      }
      char v24 = v19;
      if (v18[3] >= v23)
      {
        if ((a4 & 1) == 0) {
          sub_24CFC4A20();
        }
      }
      else
      {
        sub_24CFC3B4C(v23, a4 & 1);
        unint64_t v25 = sub_24CFC3064(v14);
        if ((v24 & 1) != (v26 & 1)) {
          goto LABEL_19;
        }
        unint64_t v20 = v25;
      }
      unint64_t v27 = (void *)*v43;
      if (v24)
      {
        swift_release();
        uint64_t v12 = (uint64_t *)(v27[7] + 96 * v20);
        *uint64_t v12 = v13;
        v12[1] = v15;
        void v12[2] = v16;
        v12[3] = v17;
        uint64_t v12[4] = v32;
        v12[5] = v33;
        v12[6] = v34;
        v12[7] = v35;
        v12[8] = v36;
        v12[9] = v37;
        v12[10] = v38;
        v12[11] = v39;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        v27[(v20 >> 6) + 8] |= 1 << v20;
        *(void *)(v27[6] + 8 * v20) = v14;
        int64_t v28 = (uint64_t *)(v27[7] + 96 * v20);
        *int64_t v28 = v13;
        v28[1] = v15;
        v28[2] = v16;
        v28[3] = v17;
        v28[4] = v32;
        v28[5] = v33;
        v28[6] = v34;
        v28[7] = v35;
        v28[8] = v36;
        v28[9] = v37;
        v28[10] = v38;
        v28[11] = v39;
        uint64_t v29 = v27[2];
        BOOL v30 = __OFADD__(v29, 1);
        uint64_t v31 = v29 + 1;
        if (v30) {
          goto LABEL_18;
        }
        void v27[2] = v31;
      }
      sub_24CFC53D0((uint64_t)v41);
      sub_24CFC5930((uint64_t)v41, (uint64_t)v40);
      sub_24CFC5930((uint64_t)v41, (uint64_t)v42);
      a4 = 1;
      if (!v42[0]) {
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    sub_24CFD35F8();
    uint64_t result = sub_24CFD38C8();
    __break(1u);
  }
  else
  {
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    sub_24CFB9DC4();
    return swift_release();
  }
  return result;
}

uint64_t sub_24CFC510C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CFC512C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24CFC512C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698497C8);
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
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_24CFD3818();
  __break(1u);
  return result;
}

uint64_t sub_24CFC5298(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_24CFC5320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v5;
  *(void *)(a2 + 96) = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_24CFC53D0@<X0>(uint64_t a1@<X8>)
{
  void (*v30)(_OWORD *__return_ptr, void *);
  _OWORD v31[6];
  uint64_t v32;
  void v33[2];
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  uint64_t v39;

  uint64_t v3 = *v1;
  int64_t v5 = v1[3];
  unint64_t v4 = v1[4];
  int64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = (v4 - 1) & v4;
    unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    uint64_t v9 = *(void *)(*(void *)(v3 + 48) + 8 * v8);
    uint64_t v10 = *(void *)(v3 + 56) + 96 * v8;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)(v10 + 88);
    BOOL v30 = (void (*)(_OWORD *__return_ptr, void *))v1[5];
    v33[0] = v9;
    v33[1] = v11;
    uint64_t v34 = *(_OWORD *)(v10 + 8);
    long long v13 = *(_OWORD *)(v10 + 40);
    uint64_t v35 = *(_OWORD *)(v10 + 24);
    uint64_t v36 = v13;
    long long v14 = *(_OWORD *)(v10 + 56);
    long long v15 = *(_OWORD *)(v10 + 72);
    v1[3] = v6;
    v1[4] = v7;
    uint64_t v37 = v14;
    uint64_t v38 = v15;
    uint64_t v39 = v12;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v30(v31, v33);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    long long v17 = v31[0];
    long long v18 = v31[1];
    long long v19 = v31[2];
    long long v20 = v31[3];
    long long v21 = v31[4];
    long long v22 = v31[5];
    uint64_t v23 = v32;
LABEL_23:
    *(_OWORD *)a1 = v17;
    *(_OWORD *)(a1 + 16) = v18;
    *(_OWORD *)(a1 + 32) = v19;
    *(_OWORD *)(a1 + 48) = v20;
    *(_OWORD *)(a1 + 64) = v21;
    *(_OWORD *)(a1 + 80) = v22;
    *(void *)(a1 + 96) = v23;
    return result;
  }
  int64_t v24 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    int64_t v25 = (unint64_t)(v1[2] + 64) >> 6;
    if (v24 < v25)
    {
      uint64_t v26 = v1[1];
      unint64_t v27 = *(void *)(v26 + 8 * v24);
      if (v27)
      {
LABEL_7:
        uint64_t v7 = (v27 - 1) & v27;
        unint64_t v8 = __clz(__rbit64(v27)) + (v24 << 6);
        int64_t v6 = v24;
        goto LABEL_3;
      }
      int64_t v28 = v5 + 2;
      int64_t v6 = v5 + 1;
      if (v5 + 2 < v25)
      {
        unint64_t v27 = *(void *)(v26 + 8 * v28);
        if (v27)
        {
LABEL_10:
          int64_t v24 = v28;
          goto LABEL_7;
        }
        int64_t v6 = v5 + 2;
        if (v5 + 3 < v25)
        {
          unint64_t v27 = *(void *)(v26 + 8 * (v5 + 3));
          if (v27)
          {
            int64_t v24 = v5 + 3;
            goto LABEL_7;
          }
          int64_t v28 = v5 + 4;
          int64_t v6 = v5 + 3;
          if (v5 + 4 < v25)
          {
            unint64_t v27 = *(void *)(v26 + 8 * v28);
            if (v27) {
              goto LABEL_10;
            }
            int64_t v24 = v5 + 5;
            int64_t v6 = v5 + 4;
            if (v5 + 5 < v25)
            {
              unint64_t v27 = *(void *)(v26 + 8 * v24);
              if (v27) {
                goto LABEL_7;
              }
              int64_t v6 = v25 - 1;
              int64_t v29 = v5 + 6;
              while (v25 != v29)
              {
                unint64_t v27 = *(void *)(v26 + 8 * v29++);
                if (v27)
                {
                  int64_t v24 = v29 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t v23 = 0;
    v1[3] = v6;
    v1[4] = 0;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CFC5668(uint64_t a1, void (*a2)(uint64_t))
{
  sub_24CFD35C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698497C0);
  uint64_t v5 = sub_24CFD33B8();
  uint64_t v3 = sub_24CFD33F8();
  a2(v3);
  sub_24CFD33F8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CFC56F8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_24CFD3588();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v14 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - v9, a1);
  return sub_24CFC1E14(v10, a3, v12, a5);
}

uint64_t sub_24CFC5810()
{
  return 24;
}

__n128 sub_24CFC581C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for SceneSettings()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFC5848(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(a1, &qword_269848D38, (unint64_t *)&qword_269848D40);
}

uint64_t sub_24CFC5870(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(a1, &qword_2698497A0, &qword_2698497A8);
}

uint64_t get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getWitnessTable();
}

uint64_t sub_24CFC5930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698497D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CFC5998()
{
  unint64_t result = qword_2698497E0;
  if (!qword_2698497E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698497E0);
  }
  return result;
}

ValueMetadata *_s19__Key_sceneSettingsVMa()
{
  return &_s19__Key_sceneSettingsVN;
}

ValueMetadata *type metadata accessor for ApplyActivationViewModifier()
{
  return &type metadata for ApplyActivationViewModifier;
}

uint64_t sub_24CFC5A0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CFC5A28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698497E8);
  v22[0] = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698497F0);
  uint64_t v24 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  int64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  v22[1] = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v23 = v6;
  swift_getKeyPath();
  uint64_t v33 = v1;
  sub_24CFC6100();
  sub_24CFD2ED8();
  swift_release();
  long long v7 = *(_OWORD *)(v1 + 104);
  v38[0] = *(_OWORD *)(v1 + 88);
  v38[1] = v7;
  char v39 = *(unsigned char *)(v1 + 120);
  sub_24CFB19AC((uint64_t)v38, (void (*)(void, void, void, void, void))sub_24CFA98E4);
  swift_release();
  swift_retain();
  sub_24CFBF738(v38, (uint64_t)sub_24CFC6158, v1, (uint64_t)v4);
  swift_release();
  sub_24CFB19AC((uint64_t)v38, (void (*)(void, void, void, void, void))sub_24CFA99F0);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v33 = v1;
  sub_24CFD2ED8();
  swift_release();
  char v8 = *(unsigned char *)(v1 + 72);
  swift_release();
  LOBYTE(v28) = v8;
  swift_retain();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698496F8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849700);
  unint64_t v11 = sub_24CFC6170();
  unint64_t v12 = sub_24CFB631C();
  uint64_t v33 = v10;
  uint64_t v34 = &type metadata for SceneActivationPolicy;
  unint64_t v35 = v11;
  unint64_t v36 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v9;
  uint64_t v34 = &type metadata for SceneActivationPolicy;
  unint64_t v35 = OpaqueTypeConformance2;
  unint64_t v36 = v12;
  uint64_t v14 = swift_getOpaqueTypeConformance2();
  uint64_t v15 = MEMORY[0x263F8D4F8];
  uint64_t v16 = v23;
  uint64_t v17 = v27;
  sub_24CFD3258();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22[0] + 8))(v4, v17);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v33 = v2;
  sub_24CFD2ED8();
  swift_release();
  swift_beginAccess();
  sub_24CFB1910(v2 + 16, (uint64_t)&v33);
  swift_release();
  uint64_t v18 = v36;
  uint64_t v19 = v37;
  __swift_project_boxed_opaque_existential_1(&v33, v36);
  char v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19) & 1;
  swift_retain();
  uint64_t v28 = v27;
  uint64_t v29 = v15;
  uint64_t v30 = v14;
  uint64_t v31 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v25;
  sub_24CFD3258();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  return swift_release();
}

uint64_t sub_24CFC6040@<X0>(uint64_t a1@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFC5A28(a1);
  return swift_release();
}

unint64_t sub_24CFC6100()
{
  unint64_t result = qword_269849368;
  if (!qword_269849368)
  {
    type metadata accessor for ApplyActivationModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849368);
  }
  return result;
}

uint64_t sub_24CFC6158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CFB0ACC(a1, a2, a3);
}

uint64_t sub_24CFC6168()
{
  return sub_24CFB135C();
}

unint64_t sub_24CFC6170()
{
  unint64_t result = qword_269849708;
  if (!qword_269849708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849700);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849708);
  }
  return result;
}

uint64_t sub_24CFC61D4()
{
  return sub_24CFB1364();
}

uint64_t sub_24CFC61DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t View.onSceneActivationPolicyError(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 171, (uint64_t)&unk_26FF599B8, (uint64_t)sub_24CFC78C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC633C()
{
  unint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = v0[4];
  unint64_t v6 = v0[5];
  switch(v6 >> 61)
  {
    case 1uLL:
      strcpy((char *)v15, "invalidate-");
      HIDWORD(v15[1]) = -352321536;
      if (!v1) {
        goto LABEL_14;
      }
      sub_24CFC79DC((id)v1, v2, v4, v3, v5, v6);
      id v8 = objc_msgSend((id)v1, sel_description);
      goto LABEL_6;
    case 2uLL:
      id v10 = (id)v1;
      sub_24CFD36C8();
      swift_bridgeObjectRelease();
      strcpy((char *)v15, "clientConnect-");
      HIBYTE(v15[1]) = -18;
      id v9 = objc_msgSend(v10, sel_bundleIdentifier);
      if (v9) {
        goto LABEL_8;
      }
      goto LABEL_14;
    case 3uLL:
      v15[0] = 0;
      v15[1] = 0xE000000000000000;
      sub_24CFD33F8();
      type metadata accessor for FBSceneContentState(0);
      sub_24CFD3758();
      return v15[0];
    case 4uLL:
      id v12 = (id)(v6 & 0x1FFFFFFFFFFFFFFFLL);
      swift_bridgeObjectRetain();
      sub_24CFD36C8();
      swift_bridgeObjectRelease();
      v15[0] = 0xD000000000000011;
      v15[1] = 0x800000024CFD9540;
      id v13 = (id)(v6 & 0x1FFFFFFFFFFFFFFFLL);
      swift_bridgeObjectRetain();
      sub_24CFD36C8();
      sub_24CFD33F8();
      swift_bridgeObjectRetain();
      sub_24CFD33F8();
      swift_bridgeObjectRelease();
      sub_24CFD33F8();
      swift_getErrorValue();
      sub_24CFD3898();

      swift_bridgeObjectRelease();
      sub_24CFD33F8();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      return v15[0];
    case 5uLL:
      if (v6 == 0xA000000000000000 && (v4 | v2 | v1 | v3 | v5 | v0[6] | v0[7]) == 0) {
        return 0x697463416C6C6977;
      }
      else {
        return 0x7669746341646964;
      }
    default:
      id v7 = (id)v1;
      sub_24CFD36C8();
      swift_bridgeObjectRelease();
      v15[0] = 0x636165446C6C6977;
      v15[1] = 0xEF2D657461766974;
      if (!v1) {
        goto LABEL_14;
      }
      id v8 = objc_msgSend(v7, sel_description);
LABEL_6:
      id v9 = v8;
LABEL_8:
      unint64_t v11 = v9;
      sub_24CFD33A8();

LABEL_14:
      sub_24CFD33F8();
      swift_bridgeObjectRelease();
      sub_24CFB1E10((void *)v1, v2, v4, v3, v5, v6);
      return v15[0];
  }
}

uint64_t sub_24CFC6770()
{
  uint64_t v2 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  sub_24CFD33F8();
  sub_24CFC633C();
  sub_24CFD33F8();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_24CFC680C(void *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

uint64_t (*sub_24CFC6828())(uint64_t)
{
  sub_24CFB6488();
  sub_24CFD30B8();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_24CFC812C;
}

uint64_t sub_24CFC6894(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_24CFD3238();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFC69CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = (void *)swift_allocObject();
  _OWORD v7[2] = a2;
  v7[3] = a3;
  v7[4] = sub_24CFAB850;
  v7[5] = v6;
  swift_retain();
  swift_release();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_24CFC7DEC;
  *(void *)(result + 24) = v7;
  *(void *)a1 = sub_24CFC7DF8;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CFC6B00(uint64_t *a1, void (*a2)(uint64_t *), uint64_t a3, void (*a4)(uint64_t *))
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v14 = a1[8];
  uint64_t v15 = a1[7];
  uint64_t v12 = a1[10];
  uint64_t v13 = a1[9];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = v4;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  uint64_t v25 = v15;
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  uint64_t v28 = v12;
  a2(&v18);
  uint64_t v18 = v4;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  uint64_t v25 = v15;
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  uint64_t v28 = v12;
  a4(&v18);
  return swift_release();
}

uint64_t View.onSceneWillActivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 87, (uint64_t)&unk_26FF599E0, (uint64_t)sub_24CFC78D0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC6C88(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t v12 = *a1;
  uint64_t v2 = a1[4];
  uint64_t v14 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v5 = a1[7];
  unint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[10];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v6 >> 61 == 5 && v6 == 0xA000000000000000 && (v2 | v14 | v4 | v3 | v5 | v7 | v8) == 0) {
    a2(v12);
  }
  return swift_release();
}

uint64_t View.onSceneDidActivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 97, (uint64_t)&unk_26FF59A08, (uint64_t)sub_24CFC78D8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC6DD8(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t v14 = *a1;
  uint64_t v2 = a1[4];
  uint64_t v16 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v5 = a1[7];
  unint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = a1[10];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v6 >> 61 == 5 && v6 == 0xA000000000000000 && v16 == 1 && (v4 | v2 | v3 | v5) == 0 && (v8 | v7) == 0) {
    a2(v14);
  }
  return swift_release();
}

uint64_t View.onSceneWillDeactivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 110, (uint64_t)&unk_26FF59A30, (uint64_t)sub_24CFC78E0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))View.onSceneDeactivate(_:));
}

uint64_t sub_24CFC6F28(uint64_t a1, id a2, void (*a3)(uint64_t, id))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2) {
    a2 = objc_msgSend(a2, sel_error);
  }
  a3(a1, a2);

  return swift_release();
}

uint64_t View.onSceneDeactivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 119, (uint64_t)&unk_26FF59A58, (uint64_t)sub_24CFC78E8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC7050(uint64_t *a1, void (*a2)(uint64_t, void *))
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[3];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[4];
  unint64_t v5 = a1[8];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[6];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (!(v5 >> 61))
  {
    id v6 = v4;
    a2(v3, v4);
    sub_24CFB1E10(v4, v11, v10, v9, v8, v5);
  }
  return swift_release();
}

uint64_t View.onSceneInvalidate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 132, (uint64_t)&unk_26FF59A80, (uint64_t)sub_24CFC78F0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))View.onSceneInvalidated(_:));
}

uint64_t sub_24CFC71A0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a3(a1);
  return swift_release();
}

uint64_t View.onSceneInvalidated(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 141, (uint64_t)&unk_26FF59AA8, (uint64_t)sub_24CFC78F8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC7290(uint64_t *a1, void (*a2)(uint64_t, void *))
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[3];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[4];
  unint64_t v5 = a1[8];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[6];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v5 >> 61 == 1)
  {
    id v6 = v4;
    a2(v3, v4);
    sub_24CFB1E10(v4, v11, v10, v9, v8, v5);
  }
  return swift_release();
}

uint64_t View.onSceneClientConnect(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 151, (uint64_t)&unk_26FF59AD0, (uint64_t)sub_24CFC7900, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC73E4(uint64_t *a1, void (*a2)(uint64_t, void *))
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[3];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[4];
  unint64_t v5 = a1[8];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[6];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v5 >> 61 == 2)
  {
    a2(v3, v4);
    sub_24CFB1E10(v4, v10, v9, v8, v7, v5);
  }
  return swift_release();
}

uint64_t View.onSceneContentState(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC7538(a1, a2, a3, a4, 161, (uint64_t)&unk_26FF59AF8, (uint64_t)sub_24CFC7908, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24CFC6894);
}

uint64_t sub_24CFC7538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  a8(a7, v12, a3, a4);
  swift_release();
  return swift_release();
}

uint64_t sub_24CFC7658(uint64_t *a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[3];
  unint64_t v5 = a1[8];
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v5 >> 61 == 3) {
    a2(v3, v4);
  }
  return swift_release();
}

uint64_t sub_24CFC7730(uint64_t *a1, void (*a2)(uint64_t, void *, void *))
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  unint64_t v7 = a1[8];
  uint64_t v8 = a1[10];
  uint64_t v11 = a1[9];
  uint64_t v12 = *a1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v7 >> 61 == 4)
  {
    v15[0] = v2;
    v15[1] = v3;
    void v15[2] = v4;
    v15[3] = v5;
    char v16 = v6;
    v14[0] = v7 & 0x1FFFFFFFFFFFFFFFLL;
    v14[1] = v11;
    void v14[2] = v8;
    sub_24CFA98E4(v2, v3, v4, v5, v6);
    id v9 = (id)(v7 & 0x1FFFFFFFFFFFFFFFLL);
    swift_bridgeObjectRetain();
    a2(v12, v15, v14);

    swift_bridgeObjectRelease();
    sub_24CFA99F0(v2, v3, v4, v5, v6);
  }
  return swift_release();
}

uint64_t sub_24CFC7890()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFC78C8(uint64_t *a1)
{
  return sub_24CFC7730(a1, *(void (**)(uint64_t, void *, void *))(v1 + 16));
}

uint64_t sub_24CFC78D0(uint64_t *a1)
{
  return sub_24CFC6C88(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_24CFC78D8(uint64_t *a1)
{
  return sub_24CFC6DD8(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_24CFC78E0(uint64_t a1, void *a2)
{
  return sub_24CFC6F28(a1, a2, *(void (**)(uint64_t, id))(v2 + 16));
}

uint64_t sub_24CFC78E8(uint64_t *a1)
{
  return sub_24CFC7050(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

uint64_t sub_24CFC78F0(uint64_t a1, uint64_t a2)
{
  return sub_24CFC71A0(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t sub_24CFC78F8(uint64_t *a1)
{
  return sub_24CFC7290(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

uint64_t sub_24CFC7900(uint64_t *a1)
{
  return sub_24CFC73E4(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

uint64_t sub_24CFC7908(uint64_t *a1)
{
  return sub_24CFC7658(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_24CFC7910()
{
  return swift_getWitnessTable();
}

unint64_t sub_24CFC7980()
{
  unint64_t result = qword_269849800;
  if (!qword_269849800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698497F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849800);
  }
  return result;
}

id sub_24CFC79DC(id result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, unint64_t a6)
{
  switch(a6 >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      unint64_t result = result;
      break;
    case 4uLL:
      unint64_t v7 = (void *)(a6 & 0x1FFFFFFFFFFFFFFFLL);
      sub_24CFA98E4((uint64_t)result, a2, a3, a4, a5);
      id v8 = v7;
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for SceneEvent(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  unint64_t v7 = *(void *)(a1 + 64);
  sub_24CFB1E10(v2, v3, v4, v5, v6, v7);
}

void *initializeWithCopy for SceneEvent(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  unint64_t v10 = *(void *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  id v13 = v3;
  swift_bridgeObjectRetain();
  sub_24CFC79DC(v5, v6, v7, v8, v9, v10);
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  return a1;
}

uint64_t assignWithCopy for SceneEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  unint64_t v12 = *(void *)(a2 + 64);
  uint64_t v14 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 80);
  sub_24CFC79DC(v7, v8, v9, v10, v11, v12);
  uint64_t v15 = *(void **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  unint64_t v20 = *(void *)(a1 + 64);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v13;
  sub_24CFB1E10(v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SceneEvent(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  unint64_t v11 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  sub_24CFB1E10(v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneEvent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneEvent()
{
  return &type metadata for SceneEvent;
}

uint64_t sub_24CFC7DA4(uint64_t a1)
{
  return sub_24CFC69CC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24CFC7DAC()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CFC7DEC(uint64_t *a1)
{
  return sub_24CFC6B00(a1, *(void (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32));
}

uint64_t sub_24CFC7DF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

ValueMetadata *_s23__Key_sceneEventHandlerVMa()
{
  return &_s23__Key_sceneEventHandlerVN;
}

void destroy for SceneEvent.Kind(uint64_t a1)
{
}

void *initializeWithCopy for SceneEvent.Kind(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  sub_24CFC79DC(*(id *)a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return a1;
}

uint64_t assignWithCopy for SceneEvent.Kind(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  sub_24CFC79DC(*(id *)a2, v4, v5, v6, v7, v8);
  unint64_t v11 = *(void **)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  unint64_t v16 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  sub_24CFB1E10(v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SceneEvent.Kind(uint64_t a1, _OWORD *a2)
{
  long long v3 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  long long v9 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v9;
  long long v10 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v10;
  sub_24CFB1E10(v3, v5, v4, v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneEvent.Kind(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 32) >> 2;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for SceneEvent.Kind(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 64) = 1;
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
      double result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 32) = 4 * -a2;
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_24CFC8080(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) >> 61;
  if (v1 <= 4) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_24CFC809C(uint64_t result)
{
  *(void *)(result + 40) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_24CFC80AC(uint64_t result, uint64_t a2)
{
  if (a2 < 5)
  {
    uint64_t v2 = *(void *)(result + 40) & 0xFFFFFFFFFFFFFF8 | (a2 << 61);
    *(void *)(result + 32) &= 3uLL;
    *(void *)(result + 40) = v2;
  }
  else
  {
    *(void *)double result = (a2 - 5);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 40) = 0xA000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneEvent.Kind()
{
  return &type metadata for SceneEvent.Kind;
}

uint64_t View.transactionalOnChange<A>(of:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = a4;
  uint64_t v23 = a8;
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v21 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v15 = (char *)&v20 - v14;
  sub_24CFD3488();
  uint64_t v22 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = a4;
  void v16[3] = a5;
  v16[4] = a6;
  v16[5] = a7;
  v16[6] = a2;
  v16[7] = a3;
  swift_retain();
  sub_24CFD3258();
  swift_release();
  uint64_t v17 = (void *)swift_allocObject();
  long long v17[2] = a4;
  void v17[3] = a5;
  void v17[4] = a6;
  v17[5] = a7;
  void v17[6] = a2;
  v17[7] = a3;
  swift_retain();
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  swift_getOpaqueTypeConformance2();
  uint64_t v18 = OpaqueTypeMetadata2;
  sub_24CFD3248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v18);
  return swift_release();
}

uint64_t sub_24CFC83B8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (sub_24CFD3388()) {
    a3(a1, a2, 1);
  }
  return swift_release();
}

uint64_t sub_24CFC84B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24CFC84E8(uint64_t a1, uint64_t a2)
{
  return sub_24CFC83B8(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 48));
}

uint64_t sub_24CFC84F8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a4(a1, a2, a3);
  return swift_release();
}

uint64_t sub_24CFC85C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CFC84F8(a1, a2, a3, *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 48));
}

uint64_t sub_24CFC85F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t View.onSceneAction(_:)(uint64_t a1, uint64_t a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_24CFD3238();
  swift_release();
  swift_release();
  return swift_release();
}

BOOL static SceneActionResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SceneActionResult.hash(into:)()
{
  return sub_24CFD3958();
}

uint64_t SceneActionResult.hashValue.getter()
{
  return sub_24CFD3978();
}

BOOL sub_24CFC8870(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CFC8888()
{
  return sub_24CFD3978();
}

uint64_t sub_24CFC88D0()
{
  return sub_24CFD3958();
}

uint64_t sub_24CFC88FC()
{
  return sub_24CFD3978();
}

void sub_24CFC8940(void *a1@<X8>)
{
  *a1 = sub_24CFABCE4;
  a1[1] = 0;
}

uint64_t (*sub_24CFC8958())(uint64_t, uint64_t)
{
  sub_24CFB6434();
  sub_24CFD30B8();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_24CFC8FC8;
}

uint64_t sub_24CFC89CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = a2;
  v7[3] = a3;
  v7[4] = sub_24CFAB858;
  v7[5] = v6;
  swift_retain();
  swift_release();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_24CFC8F70;
  *(void *)(result + 24) = v7;
  *(void *)a1 = sub_24CFC8F7C;
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CFC8B00()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CFC8B38(uint64_t a1)
{
  return sub_24CFC89CC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_24CFC8B44()
{
  unint64_t result = qword_269849808;
  if (!qword_269849808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849808);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SceneActionResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SceneActionResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CFC8D00);
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

uint64_t sub_24CFC8D28(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CFC8D30(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SceneActionResult()
{
  return &type metadata for SceneActionResult;
}

uint64_t sub_24CFC8D4C()
{
  return swift_getWitnessTable();
}

unint64_t sub_24CFC8DBC()
{
  unint64_t result = qword_269849818;
  if (!qword_269849818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269849810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269849818);
  }
  return result;
}

uint64_t sub_24CFC8E18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, uint64_t)@<X2>, void (*a4)(uint64_t *__return_ptr, uint64_t, uint64_t)@<X4>, unsigned char *a5@<X8>)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a3((uint64_t *)((char *)&v12 + 1), a1, a2);
  if (BYTE1(v12) == 1)
  {
    a4(&v12, a1, a2);
    uint64_t result = swift_release();
    char v11 = v12;
  }
  else
  {
    uint64_t result = swift_release();
    char v11 = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t sub_24CFC8F30()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CFC8F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_24CFC8E18(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 16), *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 32), a3);
}

uint64_t sub_24CFC8F7C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

ValueMetadata *_s24__Key_sceneActionHandlerVMa()
{
  return &_s24__Key_sceneActionHandlerVN;
}

uint64_t sub_24CFC8FCC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24CFC8FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

id sub_24CFC9008()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFC95E4();
  sub_24CFD2ED8();
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + 24);
  swift_release();
  swift_release();
  return v1;
}

void sub_24CFC9144(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFC95E4();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

void sub_24CFC9270(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = a2;
  id v5 = a2;
  swift_release();
  swift_release();
}

uint64_t sub_24CFC937C()
{
  swift_unknownObjectUnownedDestroy();

  id v1 = (char *)v0 + OBJC_IVAR____TtC12DrawingBoard18HostedPreviewModel___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t UIUserInterfaceStyle.description.getter(unint64_t a1)
{
  if (a1 > 2) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aUnspeciflight[8 * a1];
  }
}

uint64_t sub_24CFC946C()
{
  return UIUserInterfaceStyle.description.getter(*v0);
}

uint64_t sub_24CFC9474()
{
  return type metadata accessor for HostedPreviewModel();
}

uint64_t type metadata accessor for HostedPreviewModel()
{
  uint64_t result = qword_269849828;
  if (!qword_269849828) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFC94C8()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_24CFC9570@<X0>(void *a1@<X8>)
{
  id result = sub_24CFC9008();
  *a1 = result;
  return result;
}

void sub_24CFC959C(id *a1)
{
}

void sub_24CFC95C8()
{
  sub_24CFC9270(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_24CFC95E4()
{
  unint64_t result = qword_269849838[0];
  if (!qword_269849838[0])
  {
    type metadata accessor for HostedPreviewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269849838);
  }
  return result;
}

uint64_t sub_24CFC963C(uint64_t TupleTypeMetadata, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t i = a5;
  unint64_t v5 = a3;
  BOOL v7 = (void *)(a4 & 0xFFFFFFFFFFFFFFFELL);
  unint64_t v8 = a3 - 1;
  if (a3 == 1)
  {
    uint64_t v9 = *v7;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    char v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v5)
    {
      unint64_t v12 = 0;
      if (v5 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v11 - (char *)v7) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v12 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v13 = (long long *)(v7 + 2);
      uint64_t v14 = v11 + 16;
      unint64_t v15 = v5 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v16 = *v13;
        *(v14 - 1) = *(v13 - 1);
        *uint64_t v14 = v16;
        v13 += 2;
        v14 += 2;
        v15 -= 4;
      }
      while (v15);
      if (v12 != v5)
      {
LABEL_9:
        unint64_t v17 = v5 - v12;
        uint64_t v18 = v12;
        uint64_t v19 = &v11[8 * v12];
        uint64_t v20 = &v7[v18];
        do
        {
          uint64_t v21 = *v20++;
          *(void *)uint64_t v19 = v21;
          v19 += 8;
          --v17;
        }
        while (v17);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v9 = TupleTypeMetadata;
  }
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v25 = (char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v48 = &v45;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = *(void (**)(void))(v22 + 16);
  uint64_t v49 = (char *)&v45 - v27;
  v26();
  uint64_t v50 = v25;
  uint64_t v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v26)(v25, a2, v9);
  if (v5)
  {
    uint64_t v46 = v22;
    uint64_t v47 = v9;
    unint64_t v53 = v8;
    unint64_t v29 = i & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v30 = (_DWORD *)(v9 + 32);
    for (i = v5; ; unint64_t v5 = i)
    {
      char v51 = v7;
      uint64_t v52 = &v45;
      uint64_t v31 = *v7;
      uint64_t v32 = *(void *)(*v7 - 8);
      uint64_t v33 = MEMORY[0x270FA5388](v28);
      unint64_t v35 = (char *)&v45 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x270FA5388](v33);
      uint64_t v37 = (char *)&v45 - v36;
      int v38 = v5 == 1 ? 0 : *v30;
      char v39 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
      v39(v35, &v49[v38], v31);
      int v40 = i == 1 ? 0 : *v30;
      v39(v37, &v50[v40], v31);
      char v41 = sub_24CFD3388();
      uint64_t v42 = *(void (**)(char *, uint64_t))(v32 + 8);
      v42(v37, v31);
      uint64_t v28 = ((uint64_t (*)(char *, uint64_t))v42)(v35, v31);
      if ((v41 & 1) == 0 || !v53) {
        break;
      }
      --v53;
      v30 += 4;
      v29 += 8;
      BOOL v7 = v51 + 1;
    }
    uint64_t v22 = v46;
    uint64_t v9 = v47;
  }
  else
  {
    char v41 = 1;
  }
  unint64_t v43 = *(void (**)(char *, uint64_t))(v22 + 8);
  v43(v50, v9);
  v43(v49, v9);
  return v41 & 1;
}

uint64_t sub_24CFC9A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CFC963C(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), *(void *)(a4 - 8));
}

uint64_t sub_24CFC9A2C(uint64_t a1)
{
  if (*(void *)(a1 + 16) == 1)
  {
    uint64_t result = swift_checkMetadataState();
    if (v3 > 0x3F) {
      return result;
    }
LABEL_13:
    v19[1] = *(void *)(result - 8) + 64;
    swift_initStructMetadata();
    return 0;
  }
  MEMORY[0x270FA5388](a1);
  unsigned int v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    unint64_t v7 = 0;
    unint64_t v8 = *(void *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL;
    if (v4 < 4) {
      goto LABEL_10;
    }
    if ((unint64_t)&v6[-v8] < 0x20) {
      goto LABEL_10;
    }
    unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v9 = (long long *)(v8 + 16);
    uint64_t v10 = v6 + 16;
    unint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      long long v12 = *v9;
      *(v10 - 1) = *(v9 - 1);
      *uint64_t v10 = v12;
      v9 += 2;
      v10 += 2;
      v11 -= 4;
    }
    while (v11);
    if (v4 != v7)
    {
LABEL_10:
      unint64_t v13 = v4 - v7;
      uint64_t v14 = 8 * v7;
      unint64_t v15 = &v6[8 * v7];
      long long v16 = (uint64_t *)(v8 + v14);
      do
      {
        uint64_t v17 = *v16++;
        *(void *)unint64_t v15 = v17;
        v15 += 8;
        --v13;
      }
      while (v13);
    }
  }
  uint64_t result = swift_getTupleTypeMetadata();
  if (v18 <= 0x3F) {
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_24CFC9B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      long long v12 = (long long *)(v11 + 16);
      unint64_t v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *unint64_t v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        unint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)unint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (**(uint64_t (***)(uint64_t, uint64_t))(TupleTypeMetadata - 8))(a1, a2);
}

uint64_t sub_24CFC9CCC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a2 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      unint64_t v8 = 0;
      unint64_t v9 = *(void *)(v5 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v4 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v7[-v9] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v8 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v10 = (long long *)(v9 + 16);
      unint64_t v11 = v7 + 16;
      unint64_t v12 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *unint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v4 != v8)
      {
LABEL_9:
        unint64_t v14 = v4 - v8;
        uint64_t v15 = 8 * v8;
        unint64_t v16 = &v7[8 * v8];
        uint64_t v17 = (uint64_t *)(v9 + v15);
        do
        {
          uint64_t v18 = *v17++;
          *(void *)unint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)(TupleTypeMetadata - 8) + 8))(a1);
}

uint64_t sub_24CFC9DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v12 = (long long *)(v11 + 16);
      long long v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *long long v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        uint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)uint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 16))(a1, a2);
  return a1;
}

uint64_t sub_24CFC9F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v12 = (long long *)(v11 + 16);
      long long v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *long long v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        uint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)uint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 24))(a1, a2);
  return a1;
}

uint64_t sub_24CFCA078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v12 = (long long *)(v11 + 16);
      long long v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *long long v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        uint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)uint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 32))(a1, a2);
  return a1;
}

uint64_t sub_24CFCA1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v12 = (long long *)(v11 + 16);
      long long v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *long long v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        uint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)uint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 40))(a1, a2);
  return a1;
}

uint64_t sub_24CFCA2F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CFCA30C);
}

uint64_t sub_24CFCA30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      unint64_t v10 = 0;
      unint64_t v11 = *(void *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v9[-v11] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v12 = (long long *)(v11 + 16);
      long long v13 = v9 + 16;
      unint64_t v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v15 = *v12;
        *(v13 - 1) = *(v12 - 1);
        *long long v13 = v15;
        v12 += 2;
        v13 += 2;
        v14 -= 4;
      }
      while (v14);
      if (v6 != v10)
      {
LABEL_9:
        unint64_t v16 = v6 - v10;
        uint64_t v17 = 8 * v10;
        uint64_t v18 = &v9[8 * v10];
        uint64_t v19 = (uint64_t *)(v11 + v17);
        do
        {
          uint64_t v20 = *v19++;
          *(void *)uint64_t v18 = v20;
          v18 += 8;
          --v16;
        }
        while (v16);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 48))(a1, a2);
}

uint64_t sub_24CFCA448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CFCA45C);
}

uint64_t sub_24CFCA45C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a4 + 16) == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(a4 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    unint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v7)
    {
      unint64_t v11 = 0;
      unint64_t v12 = *(void *)(v8 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v7 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v10[-v12] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v11 = v7 & 0xFFFFFFFFFFFFFFFCLL;
      long long v13 = (long long *)(v12 + 16);
      unint64_t v14 = v10 + 16;
      unint64_t v15 = v7 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v16 = *v13;
        *(v14 - 1) = *(v13 - 1);
        *unint64_t v14 = v16;
        v13 += 2;
        v14 += 2;
        v15 -= 4;
      }
      while (v15);
      if (v7 != v11)
      {
LABEL_9:
        unint64_t v17 = v7 - v11;
        uint64_t v18 = 8 * v11;
        uint64_t v19 = &v10[8 * v11];
        uint64_t v20 = (uint64_t *)(v12 + v18);
        do
        {
          uint64_t v21 = *v20++;
          *(void *)uint64_t v19 = v21;
          v19 += 8;
          --v17;
        }
        while (v17);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata - 8) + 56))(a1, a2, a2);
}

uint64_t type metadata accessor for Tuple()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CFCA5B0()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for DeactivationSceneActivationPolicyModel()
{
  return self;
}

uint64_t sub_24CFCA614()
{
  return sub_24CFD3578() & 1;
}

uint64_t sub_24CFCA65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = *(void *)(v2 + 16);
  unsigned __int8 v8 = sub_24CFCCAB0();
  swift_release();
  if ((v8 & 1) == 0) {
    goto LABEL_10;
  }
  v17[7] = v3;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v17[0] = v7;
  sub_24CFCABAC((unint64_t *)&qword_269848A10, 255, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v9 = *(void **)(v7 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v10 = v9;
  swift_release();
  if (v9)
  {
    unint64_t v11 = (void *)swift_allocObject();
    _OWORD v11[2] = a1;
    v11[3] = a2;
    _OWORD v11[4] = v10;
    v11[5] = v4;
    uint64_t v12 = swift_allocObject();
    long long v13 = sub_24CFCAC44;
    *(void *)(v12 + 16) = sub_24CFCAC44;
    *(void *)(v12 + 24) = v11;
    void v17[4] = sub_24CFA092C;
    v17[5] = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    long long v17[2] = sub_24CF90E04;
    void v17[3] = &block_descriptor_4;
    unint64_t v14 = _Block_copy(v17);
    id v15 = v10;
    sub_24CF92778(a1);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_deactivate_, v14);
    _Block_release(v14);
    swift_release();

    swift_release();
  }
  else
  {
LABEL_10:
    swift_release();
    long long v13 = 0;
  }
  return sub_24CF928C4((uint64_t)v13);
}

uint64_t sub_24CFCA9A8(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2) {
    a2(a4, a1);
  }
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a1);
  return swift_release();
}

uint64_t sub_24CFCAA8C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned __int8 v0 = sub_24CFCCAB0();
  swift_release();
  return v0 & 1;
}

uint64_t sub_24CFCAB28(uint64_t a1, uint64_t a2)
{
  return sub_24CFCA65C(a1, a2);
}

uint64_t sub_24CFCAB4C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24CFCABAC((unint64_t *)&unk_2698498C0, a2, (void (*)(uint64_t))type metadata accessor for DeactivationSceneActivationPolicyModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CFCABAC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24CFCABF4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CFCAC44(uint64_t a1)
{
  return sub_24CFCA9A8(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24CFCAC50()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_24CFCAC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for LocalSceneSettingsExtension()
{
  return self;
}

void *sub_24CFCACFC(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_24CFC30D4((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_24CFD3788();

  if (!v4) {
    return 0;
  }
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698497D0);
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void *sub_24CFCADC4(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_24CFC3124((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_24CFD3788();

  if (!v4) {
    return 0;
  }
  sub_24CF949B8(0, &qword_2698497B8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_24CFCAE9C()
{
  return sub_24CFD3978();
}

unint64_t sub_24CFCAF9C(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F69747265737361;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x656E6563536F6ELL;
      break;
    case 4:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 1701736302;
      break;
  }
  return result;
}

uint64_t sub_24CFCB054(unsigned __int8 *a1, char *a2)
{
  return sub_24CF9D744(*a1, *a2);
}

uint64_t sub_24CFCB060()
{
  return sub_24CFCAE9C();
}

uint64_t sub_24CFCB068()
{
  return sub_24CF9D910();
}

uint64_t sub_24CFCB070()
{
  return sub_24CF9D9FC();
}

uint64_t sub_24CFCB078@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CFCC318();
  *a1 = result;
  return result;
}

unint64_t sub_24CFCB0A8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24CFCAF9C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_24CFCB0D4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ProcessMonitor());
  id result = sub_24CFCB8E4();
  qword_26984D200 = (uint64_t)result;
  return result;
}

uint64_t sub_24CFCB108()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = MEMORY[0x25331A8E0](v0);
  if (v1)
  {
    uint64_t v2 = (char *)v1;
    id v3 = *(void **)(v0 + 8);
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    unint64_t v4 = (uint64_t *)&v2[OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_processExitContexts];
    swift_beginAccess();
    uint64_t v5 = *v4;
    id v6 = v3;
    char v7 = sub_24CFCADC4(v6, v5);

    swift_endAccess();
    if (v7)
    {
      uint64_t v8 = sub_24CFCB818();
      swift_release();

      swift_release();
    }
    else
    {
      swift_release();

      swift_release();
      return 0;
    }
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    return 4;
  }
  return v8;
}

void sub_24CFCB2F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x25331A8E0](v0);
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = *(void **)(v1 + 8);
    uint64_t v8 = sub_24CFD34A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
    sub_24CFD3488();
    id v9 = v7;
    id v10 = v6;
    uint64_t v11 = sub_24CFD3478();
    uint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8F500];
    void v12[2] = v11;
    v12[3] = v13;
    uint64_t v12[4] = v10;
    v12[5] = v9;
    sub_24CF9A4D8((uint64_t)v4, (uint64_t)&unk_269849970, (uint64_t)v12);
    swift_release();
  }
  swift_unknownObjectWeakDestroy();
}

uint64_t sub_24CFCB450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[7] = sub_24CFD3488();
  v5[8] = sub_24CFD3478();
  uint64_t v7 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CFCB4EC, v7, v6);
}

uint64_t sub_24CFCB4EC()
{
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities;
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities), sel_removeObject_, v1);
  if (objc_msgSend(*(id *)(v2 + v3), sel_containsObject_, v1))
  {
    swift_release();
  }
  else
  {
    unint64_t v4 = (void *)v0[6];
    swift_beginAccess();
    id v5 = v4;
    uint64_t v6 = (void *)sub_24CFC3548((unint64_t)v5);
    swift_endAccess();

    swift_release();
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24CFCB63C(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities);
  id v4 = objc_msgSend(a1, sel_identity);
  unsigned int v5 = objc_msgSend(v3, sel_containsObject_, v4);

  if (v5)
  {
    id v6 = objc_msgSend(a1, sel_identity);
    id v7 = objc_msgSend(a1, sel_exitContext);
    swift_beginAccess();
    if (v7)
    {
      sub_24CFCC058((uint64_t)v7, (uint64_t)v6, (void (*)(uint64_t, uint64_t, uint64_t))sub_24CFC484C, sub_24CFC38F0);
    }
    else
    {
      uint64_t v9 = sub_24CFC3548((unint64_t)v6);

      id v6 = (id)v9;
    }

    swift_endAccess();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_24CFCB818()
{
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_launchError);
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849378);
    sub_24CF949B8(0, (unint64_t *)&unk_269849950);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      unint64_t v2 = (unint64_t)objc_msgSend(v3, sel_code);

      if ((v2 & 0x8000000000000000) != 0)
      {
        return 0;
      }
      else if (v2 > 8)
      {
        return 4;
      }
      else
      {
        return byte_24CFD7E2A[v2];
      }
    }
  }
  return result;
}

id sub_24CFCB8E4()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities;
  id v3 = objc_allocWithZone(MEMORY[0x263F08760]);
  id v4 = v0;
  *(void *)&v0[v2] = objc_msgSend(v3, sel_init);
  uint64_t v5 = OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_processExitContexts;
  *(void *)&v4[v5] = sub_24CF8DA1C(MEMORY[0x263F8EE78]);

  v11.receiver = v4;
  v11.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v11, sel_init);
  id v7 = self;
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_sharedInstance);
  objc_msgSend(v9, sel_addObserver_, v8);

  return v8;
}

uint64_t type metadata accessor for ProcessMonitor()
{
  return self;
}

uint64_t sub_24CFCBAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD v5[2] = a4;
  v5[3] = a5;
  sub_24CFD3488();
  v5[4] = sub_24CFD3478();
  uint64_t v7 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CFCBB70, v7, v6);
}

uint64_t sub_24CFCBB70()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  sub_24CFCB63C(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_24CFCBD3C()
{
}

uint64_t sub_24CFCBD60(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_24CFCBD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakTakeAssign();
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t sub_24CFCBDC8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24CFCBE10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *sub_24CFCBE4C()
{
  return &unk_26FF5A038;
}

uint64_t sub_24CFCBE60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CFA8908;
  return sub_24CFCB450(a1, v4, v5, v7, v6);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CFCBF6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CF9A3CC;
  return sub_24CFCBAD8(a1, v4, v5, v7, v6);
}

uint64_t sub_24CFCC02C(uint64_t a1, uint64_t a2)
{
  return sub_24CFCC058(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_24CFC4544, sub_24CFC36A0);
}

uint64_t sub_24CFCC058(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4;
  uint64_t v9 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v9 < 0) {
      uint64_t v11 = *v4;
    }
    else {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_24CFD3638();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v6 = a4(v11, result + 1);
  }
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  a3(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v6 = v14;
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for PreventActivationReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreventActivationReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CFCC280);
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

unsigned char *sub_24CFCC2A8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreventActivationReason()
{
  return &type metadata for PreventActivationReason;
}

unint64_t sub_24CFCC2C4()
{
  unint64_t result = qword_269849990[0];
  if (!qword_269849990[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269849990);
  }
  return result;
}

uint64_t sub_24CFCC318()
{
  unint64_t v0 = sub_24CFD3828();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t type metadata accessor for Delegate()
{
  return self;
}

void sub_24CFCC694(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

id sub_24CFCC7F0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    id v1 = objc_msgSend(v2, sel_uiPresentationManager);
    swift_release();
  }
  else
  {
    swift_release();
  }
  return v1;
}

void *sub_24CFCC99C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v2 = v1;
  swift_release();
  return v1;
}

id sub_24CFCCAB0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    id v3 = objc_msgSend(v2, sel_isActive);
    swift_release();
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_24CFCCCA8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken;
  swift_beginAccess();
  if (*(void *)(v1 + 8))
  {
    uint64_t v2 = sub_24CFCB108();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v2 = 3;
  }
  swift_release();
  return v2;
}

void sub_24CFCCDE8(void *a1)
{
  unint64_t v2 = v1;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  unint64_t v26 = v1;
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v6 = v5;
  swift_release();
  if (!v5)
  {
    v28[0] = 0;
    v28[1] = 0;
    uint64_t v18 = v2 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken;
    swift_beginAccess();
    sub_24CF92868(v18, (uint64_t *)&unk_269849AC0);
    sub_24CFCFEB8((uint64_t)v28, v18);
    swift_endAccess();
    if (!a1)
    {
LABEL_23:
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      unint64_t v26 = v2;
      sub_24CFD2ED8();
      swift_release();
      uint64_t v19 = *(void **)(v2 + v4);
      id v20 = v19;
      swift_release();
      if (v19)
      {
        objc_msgSend(v20, sel_addObserver_, v2);
        swift_release();
      }
      else
      {
        swift_release();
      }
      return;
    }
    goto LABEL_21;
  }
  id v25 = v6;
  id v7 = objc_msgSend(v6, sel_identityToken);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = *(id *)(v2 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken);
  swift_release();
  sub_24CF949B8(0, &qword_269849AD0);
  char v9 = sub_24CFD3578();

  if (v9)
  {
    if (a1)
    {
      sub_24CF949B8(0, (unint64_t *)&qword_269849528);
      id v10 = v25;
      id v11 = a1;
      char v12 = sub_24CFD3578();

      if (v12)
      {

LABEL_22:
        objc_msgSend(v11, sel_removeObserver_, v2);
        goto LABEL_23;
      }
    }
    if (qword_2698488A8 != -1) {
      swift_once();
    }
    uint64_t v13 = (void *)qword_26984D200;
    id v14 = sub_24CF90E50();
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    unint64_t v27 = (unint64_t)v14;
    id v15 = v14;
    long long v16 = v13;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)&v16[OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities], sel_addObject_, v15);

    swift_release();
    sub_24CFCFF20((uint64_t)&v26, (uint64_t)v28);

    swift_release();
    uint64_t v17 = v2 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken;
    swift_beginAccess();
    sub_24CF92868(v17, (uint64_t *)&unk_269849AC0);
    sub_24CFCFEB8((uint64_t)v28, v17);
    swift_endAccess();
    if (!a1) {
      goto LABEL_23;
    }
LABEL_21:
    id v11 = a1;
    goto LABEL_22;
  }
  swift_release();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD36C8();
  swift_bridgeObjectRelease();
  unint64_t v26 = 0xD00000000000001CLL;
  unint64_t v27 = 0x800000024CFD9880;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v21 = v8;
  swift_release();
  id v22 = objc_msgSend(v21, sel_description);
  sub_24CFD33A8();

  sub_24CFD33F8();
  swift_bridgeObjectRelease();
  sub_24CFD33F8();
  id v23 = objc_msgSend(v25, sel_identityToken);
  id v24 = objc_msgSend(v23, sel_description);
  sub_24CFD33A8();

  sub_24CFD33F8();
  swift_release();

  swift_bridgeObjectRelease();
  sub_24CFD37B8();
  __break(1u);
}

void sub_24CFCD544(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a2;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  *(void *)(a1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene) = a2;
  id v6 = v4;
  sub_24CFCCDE8(v5);
  swift_release();
  swift_release();
}

id sub_24CFCD67C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  unint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    id v3 = objc_msgSend(v2, sel_contentState);
    swift_release();
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_24CFCD874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_24CFD3488();
  *(void *)(v4 + 24) = sub_24CFD3478();
  uint64_t v6 = sub_24CFD3468();
  return MEMORY[0x270FA2498](sub_24CFCD90C, v6, v5);
}

uint64_t sub_24CFCD90C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  id v2 = (void *)(v1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate);
  id v3 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate);
  if (v3)
  {
    void *v2 = 0;
    v2[1] = 0;
    swift_retain();
    uint64_t v4 = sub_24CF928C4((uint64_t)v3);
    v3(v4);
    sub_24CF928C4((uint64_t)v3);
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

char *sub_24CFCD9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v3[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v3[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers;
  char v9 = self;
  id v10 = v3;
  *(void *)&v3[v8] = objc_msgSend(v9, sel_weakObjectsHashTable);
  uint64_t v11 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers;
  *(void *)&v10[v11] = objc_msgSend(v9, sel_weakObjectsHashTable);
  uint64_t v12 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene;
  *(void *)&v10[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene] = 0;
  sub_24CFD2F08();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = *(void **)(a3 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace);
  id v14 = (void *)sub_24CFD3398();
  id v15 = objc_msgSend(v13, sel_sceneIdentityTokenForIdentifier_, v14);
  swift_bridgeObjectRelease();
  swift_release();

  *(void *)&v10[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken] = v15;
  long long v16 = *(void **)&v10[v12];
  id v17 = v15;

  *(void *)&v10[v12] = 0;
  v25[0] = 0;
  v25[1] = 0;
  swift_beginAccess();
  sub_24CF92868((uint64_t)v7, (uint64_t *)&unk_269849AC0);
  sub_24CFCFEB8((uint64_t)v25, (uint64_t)v7);
  swift_endAccess();

  v24.receiver = v10;
  v24.super_class = ObjectType;
  uint64_t v18 = (char *)objc_msgSendSuper2(&v24, sel_init);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v20 = (void (*)())swift_allocObject();
  *((void *)v20 + 2) = v19;
  *((void *)v20 + 3) = a3;
  *((void *)v20 + 4) = v17;
  id v21 = (void (**)())&v18[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  uint64_t v22 = *(void *)&v18[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  *id v21 = sub_24CFD1AC4;
  v21[1] = v20;
  sub_24CF928C4(v22);
  return v18;
}

void sub_24CFCDC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 16;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25331A8E0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v8 = objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace), sel_sceneWithIdentityToken_, a3);
    swift_release();
    if (v8)
    {
      id v9 = v8;
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
      sub_24CFD2EC8();
      swift_release();
      swift_release();
    }
    sub_24CF8E414((uint64_t)v7);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

char *sub_24CFCDED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = &v7[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v7[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers;
  id v15 = self;
  long long v16 = v7;
  *(void *)&v7[v14] = objc_msgSend(v15, sel_weakObjectsHashTable);
  uint64_t v17 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers;
  *(void *)&v16[v17] = objc_msgSend(v15, sel_weakObjectsHashTable);
  uint64_t v18 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene;
  *(void *)&v16[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene] = 0;
  sub_24CFD2F08();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v19 = *(void **)(a5 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace);
  id v20 = (void *)sub_24CFD3398();
  id v21 = objc_msgSend(v19, sel_sceneIdentityTokenForIdentifier_, v20);
  swift_release();

  *(void *)&v16[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken] = v21;
  uint64_t v22 = *(void **)&v16[v18];
  id v23 = v21;

  *(void *)&v16[v18] = 0;
  v35[0] = 0;
  v35[1] = 0;
  swift_beginAccess();
  sub_24CF92868((uint64_t)v13, (uint64_t *)&unk_269849AC0);
  sub_24CFCFEB8((uint64_t)v35, (uint64_t)v13);
  swift_endAccess();

  v34.receiver = v16;
  v34.super_class = ObjectType;
  objc_super v24 = (char *)objc_msgSendSuper2(&v34, sel_init);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v26 = (void (*)())swift_allocObject();
  *((void *)v26 + 2) = v25;
  *((void *)v26 + 3) = a5;
  *((void *)v26 + 4) = v23;
  *((void *)v26 + 5) = a1;
  *((void *)v26 + 6) = a2;
  *((void *)v26 + 7) = a3;
  *((void *)v26 + 8) = a4;
  *((void *)v26 + 9) = a6;
  *((void *)v26 + 10) = a7;
  unint64_t v27 = (void (**)())&v24[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  uint64_t v28 = *(void *)&v24[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  void *v27 = sub_24CFD1B38;
  v27[1] = v26;
  sub_24CF928C4(v28);
  return v24;
}

void sub_24CFCE174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void (*a8)(id))
{
  uint64_t v13 = a1 + 16;
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x25331A8E0](v13);
  if (v14)
  {
    id v15 = (void *)v14;
    sub_24CFD3478();
    sub_24CFD3468();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v16 = objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC12DrawingBoard14SceneWorkspace_fbWorkspace), sel_sceneWithIdentityToken_, a3);
    swift_release();
    if (v16)
    {
      id v17 = v16;
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
      sub_24CFD2EC8();
      swift_release();
      swift_release();
    }
    else
    {
      uint64_t v19 = (void *)sub_24CF8E63C(a4, a5, a6, a7, a8);
      sub_24CFD3478();
      sub_24CFD3468();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v20 = swift_getKeyPath();
      MEMORY[0x270FA5388](v20);
      sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
      sub_24CFD2EC8();

      swift_release();
      swift_release();
    }
    sub_24CF8E414((uint64_t)v15);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

id sub_24CFCE56C(void *a1)
{
  id v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = &v2[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_onUpdate];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC12DrawingBoard11SceneFuture_processToken];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers;
  id v8 = self;
  id v9 = v2;
  *(void *)&v2[v7] = objc_msgSend(v8, sel_weakObjectsHashTable);
  uint64_t v10 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers;
  *(void *)&v9[v10] = objc_msgSend(v8, sel_weakObjectsHashTable);
  uint64_t v11 = OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene;
  *(void *)&v9[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene] = 0;
  sub_24CFD2F08();
  id v12 = objc_msgSend(a1, sel_identityToken);
  *(void *)&v9[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken] = v12;
  uint64_t v13 = *(void **)&v9[v11];
  id v14 = a1;

  *(void *)&v9[v11] = a1;
  if (qword_2698488A8 != -1) {
    swift_once();
  }
  id v15 = (void *)qword_26984D200;
  id v16 = sub_24CF90E50();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  id v23 = v16;
  id v17 = v16;
  uint64_t v18 = v15;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC12DrawingBoard14ProcessMonitor_trackedProcessIdentities], sel_addObject_, v17);

  swift_release();
  sub_24CFCFF20((uint64_t)v22, (uint64_t)v24);

  swift_release();
  swift_beginAccess();
  sub_24CF92868((uint64_t)v6, (uint64_t *)&unk_269849AC0);
  sub_24CFCFEB8((uint64_t)v24, (uint64_t)v6);
  swift_endAccess();

  v21.receiver = v9;
  v21.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v21, sel_init);
  objc_msgSend(v14, sel_addObserver_, v19);

  return v19;
}

uint64_t sub_24CFCE86C(uint64_t a1)
{
  swift_getObjectType();
  sub_24CF8DDCC(a1, (uint64_t)v8);
  if (!v9)
  {
    sub_24CF92868((uint64_t)v8, &qword_2698488B0);
    goto LABEL_6;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    char v5 = 0;
    return v5 & 1;
  }
  if (v7 == v1)
  {

    char v5 = 1;
  }
  else
  {
    id v3 = *(void **)&v7[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__identityToken];
    sub_24CF949B8(0, (unint64_t *)&qword_269848FC0);
    id v4 = v3;
    char v5 = sub_24CFD3578();
  }
  return v5 & 1;
}

uint64_t sub_24CFCEB48()
{
  return type metadata accessor for SceneFuture();
}

uint64_t type metadata accessor for SceneFuture()
{
  uint64_t result = qword_269849AB0;
  if (!qword_269849AB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CFCEB9C()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CFCEC5C()
{
  if (MEMORY[0x263F8EEE0]) {
    return __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269849AC0);
  }
  else {
    return MEMORY[0x263F8EE60] + 8;
  }
}

uint64_t sub_24CFCEC84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, v5, a5);
}

uint64_t sub_24CFCEC90()
{
  return sub_24CFD3028();
}

uint64_t sub_24CFCEC98()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269849960);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = *v0;
  uint64_t v5 = sub_24CFD34A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  sub_24CFD3488();
  id v6 = v4;
  uint64_t v7 = sub_24CFD3478();
  id v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  void v8[4] = v6;
  sub_24CF9A4D8((uint64_t)v3, (uint64_t)&unk_269849AE0, (uint64_t)v8);
  return swift_release();
}

void sub_24CFCEDB0(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a2;
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0x2000000000000000;
  id v3 = a2;
  sub_24CFCEE8C((uint64_t)&v4);
  swift_release();
}

uint64_t sub_24CFCEE8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = *(void **)a1;
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 24);
  uint64_t v22 = *(void *)(a1 + 32);
  unint64_t v23 = *(void *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 56);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v26[0] = v1;
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene);
  id v4 = v3;
  swift_release();
  if (!v3) {
    goto LABEL_25;
  }
  id v5 = v4;
  sub_24CFC79DC(v18, v19, v20, v21, v22, v23);
  id v6 = objc_msgSend(v5, sel_identifier);
  uint64_t v16 = sub_24CFD33A8();
  uint64_t v17 = v7;

  id v8 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_eventHandlers), sel_allObjects));
  unint64_t v9 = sub_24CFD3438();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24CFD37C8();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_8;
    }
LABEL_23:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_24CFB1E10(v18, v19, v20, v21, v22, v23);
    return swift_release();
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    goto LABEL_23;
  }
LABEL_8:
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = MEMORY[0x253319E30](i, v9);
      }
      else
      {
        uint64_t v13 = *(void *)(v9 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      swift_getObjectType();
      if (swift_conformsToProtocol2()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      if (v14)
      {
        sub_24CFD3478();
        sub_24CFD3468();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v12 = *(void (**)(void *))(v14 + 16);
        v26[0] = v5;
        v26[1] = v16;
        v26[2] = v17;
        v26[3] = v18;
        v26[4] = v19;
        v26[5] = v20;
        v26[6] = v21;
        v26[7] = v22;
        v26[8] = v23;
        v26[9] = v24;
        v26[10] = v25;
        v12(v26);
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  sub_24CFC79DC(v18, v19, v20, v21, v22, v23);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD36C8();
  swift_bridgeObjectRelease();
  sub_24CFC633C();
  sub_24CFD33F8();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24CFD37B8();
  __break(1u);
  return result;
}

uint64_t sub_24CFCF3BC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFCF514(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_msgSend(a2, sel_contentState);
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0x6000000000000000;
  sub_24CFCEE8C((uint64_t)&v4);
  return swift_release();
}

uint64_t sub_24CFCF80C()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = 1;
  long long v2 = 0u;
  long long v3 = 0u;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v4 = 0xA000000000000000;
  sub_24CFCEE8C((uint64_t)&v1);
  return swift_release();
}

void sub_24CFCF9AC(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v4 = a2;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  id v3 = a2;
  sub_24CFCEE8C((uint64_t)&v4);
  swift_release();
}

void sub_24CFCFAA0(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(void *))
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  a6(a4);
  swift_release();
}

void sub_24CFCFB9C(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v4 = a2;
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0x4000000000000000;
  id v3 = a2;
  sub_24CFCEE8C((uint64_t)&v4);
  swift_release();
}

uint64_t sub_24CFCFEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269849AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CFCFF20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CFCFF7C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CFCFFBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24CF9A3CC;
  return sub_24CFCD874(a1, v4, v5, v6);
}

uint64_t sub_24CFD0070(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CFD0144(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CFC47F0((uint64_t)v12, *a3);
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
      sub_24CFC47F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CFD0144(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CFD35A8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CFD0300(a5, a6);
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
  uint64_t v8 = sub_24CFD36F8();
  if (!v8)
  {
    sub_24CFD37A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CFD3818();
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

uint64_t sub_24CFD0300(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CFD0398(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CFD0578(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CFD0578(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CFD0398(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CFD0510(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CFD36D8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CFD37A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CFD3408();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CFD3818();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CFD37A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CFD0510(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269849AF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CFD0578(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269849AF8);
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
  uint64_t result = sub_24CFD3818();
  __break(1u);
  return result;
}

uint64_t sub_24CFD06C8()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFD0820()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFD0974()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFD0ACC()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2EC8();
  swift_release();
  return swift_release();
}

void sub_24CFD0C24(unint64_t a1)
{
  uint64_t v2 = sub_24CFD2F48();
  unint64_t v3 = *(char **)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  size_t v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CFD3488();
  uint64_t v60 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v64 = v5;
  uint64_t v65 = v2;
  v81[1] = (id)MEMORY[0x263F8EE88];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24CFD3628();
    sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
    sub_24CF91064();
    sub_24CFD34E8();
    a1 = (unint64_t)v81[2];
    uint64_t v68 = v81[3];
    id v8 = v81[4];
    id v9 = v81[5];
    unint64_t v10 = (unint64_t)v81[6];
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v68 = (void *)(a1 + 56);
    uint64_t v13 = ~v11;
    uint64_t v14 = -v11;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v10 = v15 & v12;
    swift_bridgeObjectRetain();
    id v8 = (id)v13;
    id v9 = 0;
  }
  uint64_t v66 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  id v59 = v8;
  int64_t v67 = ((unint64_t)v8 + 64) >> 6;
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v62 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v61 = v81;
  uint64_t v69 = MEMORY[0x263F8EE50] + 8;
  *(void *)&long long v7 = 136446466;
  long long v58 = v7;
  v57[1] = MEMORY[0x263F8EE58] + 8;
  unint64_t v71 = a1;
  uint64_t v77 = v6;
  while (1)
  {
LABEL_11:
    if ((a1 & 0x8000000000000000) != 0)
    {
      uint64_t v19 = sub_24CFD3668();
      if (!v19) {
        goto LABEL_75;
      }
      uint64_t v80 = v19;
      sub_24CF949B8(0, (unint64_t *)&qword_269848B88);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v20 = v81[0];
      swift_unknownObjectRelease();
      uint64_t v18 = (char *)v9;
      uint64_t v16 = v10;
      if (!v20) {
        goto LABEL_75;
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v16 = (v10 - 1) & v10;
        unint64_t v17 = __clz(__rbit64(v10)) | ((void)v9 << 6);
        uint64_t v18 = (char *)v9;
      }
      else
      {
        uint64_t v21 = (uint64_t)v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_77:
          __break(1u);
          goto LABEL_78;
        }
        if (v21 >= v67)
        {
LABEL_75:
          sub_24CFB9DC4();
          swift_release();
          return;
        }
        unint64_t v22 = v68[v21];
        uint64_t v18 = (char *)v9 + 1;
        if (!v22)
        {
          uint64_t v18 = (char *)v9 + 2;
          if ((uint64_t)v9 + 2 >= v67) {
            goto LABEL_75;
          }
          unint64_t v22 = v68[(void)v18];
          if (!v22)
          {
            uint64_t v18 = (char *)v9 + 3;
            if ((uint64_t)v9 + 3 >= v67) {
              goto LABEL_75;
            }
            unint64_t v22 = v68[(void)v18];
            if (!v22)
            {
              uint64_t v18 = (char *)v9 + 4;
              if ((uint64_t)v9 + 4 >= v67) {
                goto LABEL_75;
              }
              unint64_t v22 = v68[(void)v18];
              if (!v22)
              {
                unint64_t v23 = (char *)v9 + 5;
                do
                {
                  if ((char *)v67 == v23) {
                    goto LABEL_75;
                  }
                  unint64_t v22 = v68[(void)v23++];
                }
                while (!v22);
                uint64_t v18 = v23 - 1;
              }
            }
          }
        }
        uint64_t v16 = (v22 - 1) & v22;
        unint64_t v17 = __clz(__rbit64(v22)) + ((void)v18 << 6);
      }
      id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
      if (!v20) {
        goto LABEL_75;
      }
    }
    id v24 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v70
                                                                + OBJC_IVAR____TtC12DrawingBoard11SceneFuture_actionHandlers), sel_allObjects));
    unint64_t v25 = sub_24CFD3438();

    if (v25 >> 62) {
      break;
    }
    unint64_t v3 = *(char **)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v76 = v3;
    if (v3) {
      goto LABEL_34;
    }
LABEL_74:

    swift_bridgeObjectRelease();
    id v9 = v18;
    unint64_t v10 = v16;
    a1 = v71;
  }
  swift_bridgeObjectRetain();
  unint64_t v3 = (char *)sub_24CFD37C8();
  swift_bridgeObjectRelease();
  uint64_t v76 = v3;
  if (!v3) {
    goto LABEL_74;
  }
LABEL_34:
  uint64_t v73 = v18;
  id v74 = v20;
  unint64_t v72 = v16;
  uint64_t v78 = (void *)(v25 & 0xC000000000000001);
  uint64_t v26 = 4;
  unint64_t v27 = v76;
  unint64_t v75 = v25;
  while (1)
  {
    unint64_t v3 = (char *)(v26 - 4);
    if (v78)
    {
      uint64_t v28 = MEMORY[0x253319E30](v26 - 4, v25);
      uint64_t v29 = v26 - 3;
      if (__OFADD__(v3, 1)) {
        goto LABEL_76;
      }
    }
    else
    {
      uint64_t v28 = *(void *)(v25 + 8 * v26);
      swift_unknownObjectRetain();
      uint64_t v29 = v26 - 3;
      if (__OFADD__(v3, 1))
      {
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
    }
    swift_getObjectType();
    uint64_t v30 = swift_conformsToProtocol2() ? v28 : 0;
    if (v30) {
      break;
    }
LABEL_36:
    swift_unknownObjectRelease();
    ++v26;
    if ((char *)v29 == v27)
    {

      swift_bridgeObjectRelease();
      unint64_t v10 = v72;
      id v9 = v73;
      a1 = v71;
      goto LABEL_11;
    }
  }
  uint64_t v79 = sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v31 = *(void *)(v30 + 56);
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v32 = *(unsigned __int8 **)(v31 + 88);
  unint64_t v3 = (char *)sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v81[0] = v32;
  sub_24CFD1968((unint64_t *)&qword_269848BF0, (void (*)(uint64_t))type metadata accessor for UIPresenterObserver);
  sub_24CFD2ED8();
  swift_release();
  int v33 = v32[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];
  swift_release();
  swift_release();
  swift_release();
  if (v33 != 1) {
    goto LABEL_35;
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v81[0] = (id)v30;
  sub_24CFD1968(&qword_269849AF0, (void (*)(uint64_t))type metadata accessor for Presentation);
  sub_24CFD2ED8();
  swift_release();
  objc_super v34 = (char *)*(id *)(v30 + 48);
  swift_release();
  unint64_t v3 = (char *)sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v81[0] = v34;
  sub_24CFD1968((unint64_t *)&qword_269848A10, (void (*)(uint64_t))type metadata accessor for SceneFuture);
  sub_24CFD2ED8();
  swift_release();
  unint64_t v35 = *(void **)&v34[OBJC_IVAR____TtC12DrawingBoard11SceneFuture__scene];
  id v36 = v35;
  swift_release();

  swift_release();
  if (!v35)
  {
LABEL_35:
    swift_release();
    unint64_t v27 = v76;
    unint64_t v25 = v75;
    goto LABEL_36;
  }
  (*(void (**)(uint64_t *__return_ptr, id, id))(v30 + 32))(&v80, v36, v74);
  swift_release();

  unint64_t v27 = v76;
  unint64_t v25 = v75;
  if (v80) {
    goto LABEL_36;
  }
  swift_bridgeObjectRelease();
  id v37 = v74;
  sub_24CFA2830(v81, v37);

  if (qword_2698488A0 != -1) {
    swift_once();
  }
  uint64_t v38 = v65;
  uint64_t v39 = __swift_project_value_buffer(v65, (uint64_t)qword_26984D1E0);
  int v40 = v64;
  (*v63)(v64, v39, v38);
  id v41 = v37;
  swift_unknownObjectRetain_n();
  unint64_t v3 = (char *)v41;
  uint64_t v42 = sub_24CFD2F28();
  LODWORD(v79) = sub_24CFD3528();
  BOOL v43 = os_log_type_enabled(v42, (os_log_type_t)v79);
  a1 = v71;
  unint64_t v44 = v72;
  uint64_t v45 = v73;
  if (!v43)
  {

    swift_unknownObjectRelease_n();
    (*v62)(v40, v38);
    id v9 = v45;
    unint64_t v10 = v44;
    goto LABEL_11;
  }
  uint64_t v46 = swift_slowAlloc();
  uint64_t v78 = (void *)swift_slowAlloc();
  v81[0] = v78;
  *(_DWORD *)uint64_t v46 = v58;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v80 = v30;
  type metadata accessor for Presentation();
  swift_unknownObjectRetain();
  uint64_t v47 = sub_24CFD33B8();
  unint64_t v49 = v48;
  swift_release();
  uint64_t v80 = sub_24CFD0070(v47, v49, (uint64_t *)v81);
  sub_24CFD3598();
  swift_unknownObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v46 + 12) = 2082;
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v50 = v42;
  id v51 = objc_msgSend(v3, sel_succinctDescription);
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = sub_24CFD33A8();
    unint64_t v55 = v54;
    swift_release();

    uint64_t v80 = sub_24CFD0070(v53, v55, (uint64_t *)v81);
    sub_24CFD3598();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CF8B000, v50, (os_log_type_t)v79, "#action_handling %{public}s handled action %{public}s", (uint8_t *)v46, 0x16u);
    unint64_t v56 = v78;
    swift_arrayDestroy();
    MEMORY[0x25331A7D0](v56, -1, -1);
    MEMORY[0x25331A7D0](v46, -1, -1);

    swift_unknownObjectRelease();
    (*v62)(v64, v65);
    unint64_t v10 = v72;
    id v9 = v73;
    a1 = v71;
    goto LABEL_11;
  }
LABEL_78:

  __break(1u);
}

uint64_t sub_24CFD1968(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24CFD19B8()
{
  sub_24CFCFB9C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24CFD19D4()
{
  sub_24CFCF9AC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CFD19F0()
{
  return sub_24CFCF80C();
}

uint64_t sub_24CFD1A0C()
{
  return sub_24CFCF514(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24CFD1A28()
{
  sub_24CFCEDB0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CFD1A44()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CFD1A7C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24CFD1AC4()
{
  sub_24CFCDC34(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CFD1AD0()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

void sub_24CFD1B38()
{
  sub_24CFCE174(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56), *(void *)(v0 + 64), *(void (**)(id))(v0 + 72));
}

uint64_t sub_24CFD1B70()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2768();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  swift_release();
  return v1;
}

void sub_24CFD1C50(void *a1)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD2768();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
}

BOOL SnapshotSource.isActive.getter()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2768();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    id v3 = sub_24CFCD67C();
    swift_release();

    return v3 != (id)2;
  }
  else
  {
    sub_24CFD3478();
    sub_24CFD3468();
    if (swift_task_isCurrentExecutor())
    {
      swift_release();
      swift_release();
      return 1;
    }
    else
    {
      uint64_t v4 = 1;
      swift_task_reportUnexpectedExecutor();
      swift_release();
      swift_release();
    }
  }
  return v4;
}

uint64_t SnapshotSource.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_24CFD32A8();
  *(void *)(v0 + 24) = 0;
  sub_24CFD2F08();
  return v0;
}

uint64_t SnapshotSource.update<A>(snapshot:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  long long v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  uint64_t v8 = sub_24CFD32A8();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v11[-2] = v2;
  v11[-1] = v8;
  v11[1] = v2;
  sub_24CFD2768();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t SnapshotSource.update(snapshot:)()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CFD32A8();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD2768();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFD2398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFD1B70();
  *a1 = result;
  return result;
}

uint64_t sub_24CFD23C4()
{
  return sub_24CFD23F0();
}

uint64_t sub_24CFD23F0()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CFD2768();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CFD2520(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 16) = a2;
  swift_retain();
  swift_release();
  return swift_release();
}

void *sub_24CFD25D4()
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CFD2768();
  sub_24CFD2ED8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  swift_release();
  return v1;
}

void *sub_24CFD26B0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24CFD25D4();
  *a1 = result;
  return result;
}

void *sub_24CFD26DC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_24CFD25D4();
  *a1 = result;
  return result;
}

void sub_24CFD2708(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24CFD1C50(v1);
}

void sub_24CFD2738(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24CFD1C50(v1);
}

unint64_t sub_24CFD2768()
{
  unint64_t result = qword_269848C18;
  if (!qword_269848C18)
  {
    type metadata accessor for SnapshotSource();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269848C18);
  }
  return result;
}

uint64_t type metadata accessor for SnapshotSource()
{
  uint64_t result = qword_269849B08;
  if (!qword_269849B08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24CFD280C(uint64_t a1, void *a2)
{
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = a2;
  id v5 = a2;
  swift_release();
}

uint64_t SnapshotSource.__allocating_init<A>(snapshot:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v4 = sub_24CFD2B84(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t SnapshotSource.init<A>(snapshot:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CFD2B84(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t SnapshotSource.init()()
{
  *(void *)(v0 + 16) = sub_24CFD32A8();
  *(void *)(v0 + 24) = 0;
  sub_24CFD2F08();
  return v0;
}

uint64_t SnapshotSource.deinit()
{
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC12DrawingBoard14SnapshotSource___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SnapshotSource.__deallocating_deinit()
{
  swift_release();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC12DrawingBoard14SnapshotSource___observationRegistrar;
  uint64_t v2 = sub_24CFD2F18();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CFD2B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CFD1B70();
  *a1 = result;
  return result;
}

uint64_t sub_24CFD2B3C()
{
  return sub_24CFD23F0();
}

uint64_t sub_24CFD2B68()
{
  return sub_24CFD2520(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CFD2B84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  long long v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = sub_24CFD32A8();
  *(void *)(v2 + 24) = 0;
  sub_24CFD2F08();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  uint64_t v8 = sub_24CFD32A8();
  sub_24CFD3488();
  sub_24CFD3478();
  sub_24CFD3468();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v11[-2] = v2;
  v11[-1] = v8;
  v11[1] = v2;
  sub_24CFD2768();
  sub_24CFD2EC8();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_24CFD2D90()
{
  return type metadata accessor for SnapshotSource();
}

uint64_t sub_24CFD2D98()
{
  uint64_t result = sub_24CFD2F18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SnapshotSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnapshotSource);
}

uint64_t dispatch thunk of SnapshotSource.__allocating_init<A>(snapshot:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of SnapshotSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_24CFD2E80()
{
  return sub_24CFD2B68();
}

uint64_t sub_24CFD2E98()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CFD2EA8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CFD2EB8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CFD2EC8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24CFD2ED8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24CFD2EE8()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24CFD2EF8()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24CFD2F08()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24CFD2F18()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24CFD2F28()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CFD2F38()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CFD2F48()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CFD2F58()
{
  return MEMORY[0x270F821E0]();
}

uint64_t sub_24CFD2F68()
{
  return MEMORY[0x270EFF1B0]();
}

uint64_t sub_24CFD2F78()
{
  return MEMORY[0x270EFF1D0]();
}

uint64_t sub_24CFD2F88()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_24CFD2F98()
{
  return MEMORY[0x270EFF1E8]();
}

uint64_t sub_24CFD2FA8()
{
  return MEMORY[0x270EFF1F0]();
}

uint64_t sub_24CFD2FB8()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24CFD2FC8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24CFD2FD8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24CFD2FE8()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_24CFD3008()
{
  return MEMORY[0x270EFFD30]();
}

uint64_t sub_24CFD3028()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_24CFD3038()
{
  return MEMORY[0x270EFFEA8]();
}

uint64_t sub_24CFD3048()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24CFD3058()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24CFD3068()
{
  return MEMORY[0x270F00340]();
}

uint64_t sub_24CFD3078()
{
  return MEMORY[0x270F00960]();
}

uint64_t sub_24CFD3088()
{
  return MEMORY[0x270F00970]();
}

uint64_t sub_24CFD3098()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24CFD30A8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24CFD30B8()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_24CFD30C8()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_24CFD30D8()
{
  return MEMORY[0x270F01360]();
}

uint64_t sub_24CFD30E8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24CFD30F8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24CFD3108()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24CFD3118()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24CFD3138()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24CFD3148()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24CFD3158()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24CFD3168()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24CFD3178()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24CFD3188()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24CFD31A8()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24CFD31B8()
{
  return MEMORY[0x270F01CF8]();
}

uint64_t sub_24CFD31C8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24CFD31D8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24CFD31E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24CFD31F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24CFD3208()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_24CFD3218()
{
  return MEMORY[0x270F03560]();
}

uint64_t sub_24CFD3228()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24CFD3238()
{
  return MEMORY[0x270F03C48]();
}

uint64_t sub_24CFD3248()
{
  return MEMORY[0x270F03CB0]();
}

uint64_t sub_24CFD3258()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24CFD3268()
{
  return MEMORY[0x270F04600]();
}

uint64_t sub_24CFD3278()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24CFD3288()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_24CFD3298()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_24CFD32A8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24CFD32B8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24CFD32C8()
{
  return MEMORY[0x270F04DA0]();
}

uint64_t sub_24CFD32D8()
{
  return MEMORY[0x270F04DB0]();
}

uint64_t sub_24CFD32E8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24CFD32F8()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_24CFD3308()
{
  return MEMORY[0x270F051C8]();
}

uint64_t sub_24CFD3318()
{
  return MEMORY[0x270F051D0]();
}

uint64_t sub_24CFD3328()
{
  return MEMORY[0x270F051F0]();
}

uint64_t sub_24CFD3338()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24CFD3348()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24CFD3358()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24CFD3368()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24CFD3378()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24CFD3388()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24CFD3398()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CFD33A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CFD33B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CFD33C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24CFD33D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CFD33E8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24CFD33F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CFD3408()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CFD3428()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CFD3438()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CFD3448()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CFD3458()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CFD3468()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CFD3478()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CFD3488()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CFD3498()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CFD34A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CFD34B8()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24CFD34C8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24CFD34D8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24CFD34E8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24CFD34F8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24CFD3508()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CFD3518()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24CFD3528()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CFD3538()
{
  return MEMORY[0x270F82520]();
}

uint64_t sub_24CFD3548()
{
  return MEMORY[0x270F82908]();
}

uint64_t sub_24CFD3558()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_24CFD3568()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24CFD3578()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24CFD3588()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CFD3598()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CFD35A8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CFD35B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CFD35C8()
{
  return MEMORY[0x270F9E680]();
}

uint64_t sub_24CFD35D8()
{
  return MEMORY[0x270F9E690]();
}

uint64_t sub_24CFD35E8()
{
  return MEMORY[0x270F9E6A0]();
}

uint64_t sub_24CFD35F8()
{
  return MEMORY[0x270F9E6B0]();
}

uint64_t sub_24CFD3608()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CFD3618()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24CFD3628()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24CFD3638()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24CFD3648()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24CFD3668()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24CFD3678()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_24CFD3688()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24CFD3698()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24CFD36A8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24CFD36B8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24CFD36C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CFD36D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CFD36E8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CFD36F8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CFD3708()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CFD3718()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24CFD3728()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24CFD3738()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24CFD3748()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24CFD3758()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CFD3768()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24CFD3778()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_24CFD3788()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_24CFD3798()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24CFD37A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CFD37B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CFD37C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CFD37D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CFD37E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CFD37F8()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_24CFD3808()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CFD3818()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CFD3828()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CFD3838()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24CFD3848()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24CFD3858()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_24CFD3868()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CFD3878()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CFD3888()
{
  return MEMORY[0x270F9F500]();
}

uint64_t sub_24CFD3898()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24CFD38A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CFD38B8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24CFD38C8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CFD38D8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24CFD38F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CFD3908()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CFD3918()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CFD3928()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CFD3938()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24CFD3948()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CFD3958()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CFD3968()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24CFD3978()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CFD3988()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CFD3998()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24CFD39A8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_24CFD39D8()
{
  return MEMORY[0x270FA0128]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}