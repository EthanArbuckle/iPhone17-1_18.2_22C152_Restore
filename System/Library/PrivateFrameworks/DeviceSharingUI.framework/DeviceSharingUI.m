uint64_t sub_24CD0D284()
{
  char *v0;
  char *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t result;
  void *v8;
  void aBlock[6];

  v1 = v0;
  if (qword_26982B8A0 != -1) {
    swift_once();
  }
  v2 = sub_24CD16BE0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982C1C0);
  v3 = sub_24CD16BC0();
  v4 = sub_24CD16FD0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24CD0B000, v3, v4, "setupSceneHosting()", v5, 2u);
    MEMORY[0x253312880](v5, -1, -1);
  }

  if (*(void *)&v1[OBJC_IVAR____TtC15DeviceSharingUI20RemoteViewController_hostingController])
  {
    sub_24CD0D910();
    swift_allocError();
    *v6 = 0xD00000000000002DLL;
    v6[1] = 0x800000024CD17E00;
    return swift_willThrow();
  }
  else
  {
    aBlock[4] = sub_24CD0D50C;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24CD0D5E8;
    aBlock[3] = &block_descriptor;
    v8 = _Block_copy(aBlock);
    objc_msgSend(v1, sel__beginDelayingPresentation_cancellationHandler_, v8, 3.0);
    _Block_release(v8);
    result = sub_24CD170B0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CD0D50C()
{
  if (qword_26982B8A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CD16BE0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26982C1C0);
  v1 = sub_24CD16BC0();
  os_log_type_t v2 = sub_24CD16FB0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_24CD0B000, v1, v2, "_beginDelayingPresentation timed out", v3, 2u);
    MEMORY[0x253312880](v3, -1, -1);
  }

  return 0;
}

uint64_t sub_24CD0D5E8(uint64_t a1, uint64_t a2)
{
  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a2) = v3(a2);
  swift_release();
  return a2 & 1;
}

id sub_24CD0D85C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteViewController()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24CD0D910()
{
  unint64_t result = qword_26982B9E8;
  if (!qword_26982B9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982B9E8);
  }
  return result;
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

void *initializeBufferWithCopyOfBuffer for RemoteViewController.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RemoteViewController.Error()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RemoteViewController.Error(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RemoteViewController.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteViewController.Error(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteViewController.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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

uint64_t sub_24CD0DABC()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteViewController.Error()
{
  return &type metadata for RemoteViewController.Error;
}

uint64_t SceneVisibilityManager.bundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CD0DB0C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CD0DC9C();
  sub_24CD16B90();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_24CD0DB84()
{
  return swift_release();
}

uint64_t sub_24CD0DC24()
{
  swift_getKeyPath();
  sub_24CD0DC9C();
  sub_24CD16B90();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

unint64_t sub_24CD0DC9C()
{
  unint64_t result = qword_26982BB18;
  if (!qword_26982BB18)
  {
    type metadata accessor for SceneVisibilityManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BB18);
  }
  return result;
}

uint64_t type metadata accessor for SceneVisibilityManager()
{
  uint64_t result = qword_26982BB20;
  if (!qword_26982BB20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_24CD0DD40()
{
  swift_getKeyPath();
  sub_24CD0DC9C();
  sub_24CD16B90();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  return v1;
}

id sub_24CD0DDB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CD0DC9C();
  sub_24CD16B90();
  swift_release();
  v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_24CD0DE40(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_24CD0DC9C();
  id v2 = v1;
  sub_24CD16B80();
  swift_release();
}

uint64_t SceneVisibilityManager.__allocating_init(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  sub_24CD16BA0();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  return v4;
}

uint64_t SceneVisibilityManager.init(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0;
  sub_24CD16BA0();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

void sub_24CD0DF98()
{
  id v1 = sub_24CD0E4CC();
  swift_getKeyPath();
  uint64_t v9 = v0;
  sub_24CD0DC9C();
  sub_24CD16B80();
  swift_release();

  if (qword_26982B8A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CD16BE0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982C1D8);
  swift_retain_n();
  uint64_t v3 = sub_24CD16BC0();
  os_log_type_t v4 = sub_24CD16FD0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)v5 = 136315138;
    uint64_t v7 = sub_24CD0E404();
    sub_24CD0EC68(v7, v8, &v9);
    sub_24CD16FF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD0B000, v3, v4, "%s Scene visibility manager activated.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253312880](v6, -1, -1);
    MEMORY[0x253312880](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void sub_24CD0E1B4()
{
  swift_getKeyPath();
  uint64_t v8 = v0;
  sub_24CD0DC9C();
  sub_24CD16B90();
  swift_release();
  objc_msgSend(*(id *)(v0 + 40), sel_invalidate);
  swift_getKeyPath();
  sub_24CD16B80();
  swift_release();
  if (qword_26982B8A8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CD16BE0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982C1D8);
  swift_retain_n();
  uint64_t v2 = sub_24CD16BC0();
  os_log_type_t v3 = sub_24CD16FD0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)os_log_type_t v4 = 136315138;
    uint64_t v6 = sub_24CD0E404();
    sub_24CD0EC68(v6, v7, &v8);
    sub_24CD16FF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD0B000, v2, v3, "%s Scene visibility manager invalidated.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253312880](v5, -1, -1);
    MEMORY[0x253312880](v4, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_24CD0E404()
{
  return 91;
}

id sub_24CD0E4CC()
{
  id v0 = objc_msgSend(self, sel_configurationForDefaultMainDisplayMonitor);
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  v5[4] = sub_24CD0F768;
  v5[5] = v1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_24CD0E68C;
  v5[3] = &block_descriptor_0;
  uint64_t v2 = _Block_copy(v5);
  swift_release();
  objc_msgSend(v0, sel_setTransitionHandler_, v2);
  _Block_release(v2);
  id v3 = objc_msgSend(self, sel_monitorWithConfiguration_, v0);

  return v3;
}

void sub_24CD0E600()
{
}

uint64_t sub_24CD0E618(void *a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CD0F788(a1, a2);
    return swift_release();
  }
  return result;
}

void sub_24CD0E68C(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

BOOL sub_24CD0E72C(void *a1)
{
  uint64_t v2 = v1;
  id v3 = objc_msgSend(a1, sel_elements);
  sub_24CD0F410();
  unint64_t v4 = sub_24CD16F30();

  swift_retain();
  unint64_t v5 = sub_24CD0F450(v4, v2);
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_26982B8A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CD16BE0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26982C1D8);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v7 = sub_24CD16BC0();
  os_log_type_t v8 = sub_24CD16FA0();
  unint64_t v9 = v5 >> 62;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v22[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = sub_24CD0E404();
    sub_24CD0EC68(v12, v13, v22);
    sub_24CD16FF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2048;
    if (v9)
    {
      swift_bridgeObjectRetain();
      sub_24CD170C0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_24CD16FF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD0B000, v7, v8, "%s Handling layout monitor transition, scene element count = %ld.", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253312880](v11, -1, -1);
    MEMORY[0x253312880](v10, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24CD170C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  swift_retain_n();
  v15 = sub_24CD16BC0();
  os_log_type_t v16 = sub_24CD16FA0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v22[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v19 = sub_24CD0E404();
    sub_24CD0EC68(v19, v20, v22);
    sub_24CD16FF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 1024;
    sub_24CD16FF0();
    _os_log_impl(&dword_24CD0B000, v15, v16, "%s Is any scene visible = %{BOOL}d.", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x253312880](v18, -1, -1);
    MEMORY[0x253312880](v17, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return v14 != 0;
}

uint64_t SceneVisibilityManager.deinit()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC15DeviceSharingUI22SceneVisibilityManager___observationRegistrar;
  uint64_t v2 = sub_24CD16BB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SceneVisibilityManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15DeviceSharingUI22SceneVisibilityManager___observationRegistrar;
  uint64_t v2 = sub_24CD16BB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24CD0EC68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CD0ED3C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CD0F654((uint64_t)v12, *a3);
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
      sub_24CD0F654((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24CD0ED3C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CD17000();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CD0EEF8(a5, a6);
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
  uint64_t v8 = sub_24CD17040();
  if (!v8)
  {
    sub_24CD170A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CD170D0();
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

uint64_t sub_24CD0EEF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CD0EF90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CD0F170(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CD0F170(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CD0EF90(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CD0F108(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CD17020();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CD170A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CD16F10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CD170D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CD170A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CD0F108(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CD0F170(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB38);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24CD170D0();
  __break(1u);
  return result;
}

uint64_t sub_24CD0F2C0()
{
  return type metadata accessor for SceneVisibilityManager();
}

uint64_t sub_24CD0F2C8()
{
  uint64_t result = sub_24CD16BB0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SceneVisibilityManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneVisibilityManager);
}

uint64_t dispatch thunk of SceneVisibilityManager.isSceneVisible.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SceneVisibilityManager.__allocating_init(bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of SceneVisibilityManager.activate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SceneVisibilityManager.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

unint64_t sub_24CD0F410()
{
  unint64_t result = qword_26982BB30;
  if (!qword_26982BB30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982BB30);
  }
  return result;
}

uint64_t sub_24CD0F450(unint64_t a1, uint64_t a2)
{
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x2533122D0](v5, a1);
LABEL_9:
        int64_t v7 = v6;
        unint64_t v8 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_22;
        }
        id v9 = objc_msgSend(v6, sel_bundleIdentifier);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = sub_24CD16EF0();
          uint64_t v13 = v12;

          if (v11 == *(void *)(a2 + 16) && v13 == *(void *)(a2 + 24))
          {
            swift_bridgeObjectRelease();
LABEL_18:
            sub_24CD17050();
            sub_24CD17070();
            sub_24CD17080();
            sub_24CD17060();
            goto LABEL_5;
          }
          char v15 = sub_24CD170E0();
          swift_bridgeObjectRelease();
          if (v15) {
            goto LABEL_18;
          }
        }

LABEL_5:
        ++v5;
        if (v8 == v4) {
          return v17;
        }
      }
      if (v5 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      uint64_t v4 = sub_24CD170C0();
      if (!v4) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v6 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
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

uint64_t sub_24CD0F654(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

void sub_24CD0F6F8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = v2;
  id v4 = v2;
}

uint64_t sub_24CD0F730()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CD0F768(void *a1, void *a2)
{
  return sub_24CD0E618(a1, a2);
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

void sub_24CD0F788(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (a2)
  {
    uint64_t v5 = qword_26982B8A8;
    id v6 = a2;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24CD16BE0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26982C1D8);
    id v8 = v6;
    swift_retain_n();
    id v9 = v8;
    uint64_t v10 = sub_24CD16BC0();
    os_log_type_t v11 = sub_24CD16FA0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = v28;
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v13 = sub_24CD0E404();
      sub_24CD0EC68(v13, v14, &v29);
      sub_24CD16FF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2112;
      id v15 = v9;
      sub_24CD16FF0();
      void *v27 = a2;

      _os_log_impl(&dword_24CD0B000, v10, v11, "%s Handling layout monitor transition for layout = %@.", (uint8_t *)v12, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB40);
      swift_arrayDestroy();
      MEMORY[0x253312880](v27, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253312880](v28, -1, -1);
      MEMORY[0x253312880](v12, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    sub_24CD0E72C(v9);
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    uint64_t v29 = v3;
    sub_24CD0DC9C();
    sub_24CD16B80();

    swift_release();
  }
  else
  {
    if (qword_26982B8A8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24CD16BE0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26982C1D8);
    swift_retain_n();
    id v18 = a1;
    uint64_t v19 = sub_24CD16BC0();
    os_log_type_t v20 = sub_24CD16FB0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      v22 = (void *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = v23;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v24 = sub_24CD0E404();
      sub_24CD0EC68(v24, v25, &v29);
      sub_24CD16FF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2112;
      id v26 = v18;
      sub_24CD16FF0();
      void *v22 = v18;

      _os_log_impl(&dword_24CD0B000, v19, v20, "%s Could not handle layout monitor transition because could not get layout for layout monitor = %@.", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB40);
      swift_arrayDestroy();
      MEMORY[0x253312880](v22, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253312880](v23, -1, -1);
      MEMORY[0x253312880](v21, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_24CD0FC88()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 32) = *(unsigned char *)(v0 + 24);
}

void sub_24CD0FC98()
{
}

uint64_t RemoteView.init(target:)()
{
  uint64_t v0 = sub_24CD16BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26982B8A0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26982C1C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_24CD16BC0();
  os_log_type_t v6 = sub_24CD16FD0();
  if (os_log_type_enabled(v5, v6))
  {
    swift_slowAlloc();
    swift_slowAlloc();
    uint64_t result = sub_24CD170B0();
    __break(1u);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

id RemoteView.makeUIViewController(context:)()
{
  if (qword_26982B8A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CD16BE0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26982C1C0);
  uint64_t v1 = sub_24CD16BC0();
  os_log_type_t v2 = sub_24CD16FD0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_24CD0B000, v1, v2, "Creating RemoteViewController", v3, 2u);
    MEMORY[0x253312880](v3, -1, -1);
  }

  uint64_t v4 = (objc_class *)type metadata accessor for RemoteViewController();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC15DeviceSharingUI20RemoteViewController_hostingController] = 0;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
  sub_24CD0D284();

  return v6;
}

id sub_24CD10038()
{
  return RemoteView.makeUIViewController(context:)();
}

uint64_t sub_24CD1005C()
{
  return sub_24CD16D60();
}

uint64_t sub_24CD10098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CD10218();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_24CD100FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24CD10218();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_24CD10160()
{
  return sub_24CD16E20();
}

void sub_24CD1017C()
{
}

unint64_t sub_24CD101A8()
{
  unint64_t result = qword_26982BB50;
  if (!qword_26982BB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BB50);
  }
  return result;
}

uint64_t sub_24CD101FC()
{
  return MEMORY[0x263F1BB58];
}

ValueMetadata *type metadata accessor for RemoteView()
{
  return &type metadata for RemoteView;
}

unint64_t sub_24CD10218()
{
  unint64_t result = qword_26982BB58;
  if (!qword_26982BB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BB58);
  }
  return result;
}

void RemoteViewTarget.description.getter()
{
}

uint64_t static RemoteViewTarget.== infix(_:_:)()
{
  return 1;
}

uint64_t RemoteViewTarget.hash(into:)()
{
  return sub_24CD17140();
}

uint64_t RemoteViewTarget.hashValue.getter()
{
  return sub_24CD17150();
}

uint64_t sub_24CD1033C()
{
  return 1;
}

uint64_t sub_24CD10344()
{
  return sub_24CD17150();
}

uint64_t sub_24CD10388()
{
  return sub_24CD17140();
}

uint64_t sub_24CD103B0()
{
  return sub_24CD17150();
}

unint64_t sub_24CD103F4()
{
  unint64_t result = qword_26982BB60;
  if (!qword_26982BB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BB60);
  }
  return result;
}

void sub_24CD10448()
{
}

uint64_t getEnumTagSinglePayload for RemoteViewTarget(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for RemoteViewTarget(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CD10598);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteViewTarget()
{
  return &type metadata for RemoteViewTarget;
}

uint64_t dispatch thunk of RemoteViewConfiguration.encode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static RemoteViewConfiguration.decode(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

Swift::String __swiftcall String.localized(bundle:)(NSBundle bundle)
{
  uint64_t v1 = sub_24CD16B70();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::Void __swiftcall UIViewController.embed(childController:)(UIViewController *childController)
{
  int v2 = v1;
  objc_msgSend(v1, sel_addChildViewController_, childController);
  id v4 = objc_msgSend(v1, sel_view);
  uint64_t v5 = [(UIViewController *)childController view];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    sub_24CD170B0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = v5;
    id v8 = v4;
    uint64_t v24 = v7;
    objc_msgSend(v8, sel_addSubview_, v24);
    [(UIView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB68);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_24CD17AC0;
    os_log_type_t v11 = [(UIView *)v24 leadingAnchor];
    id v12 = objc_msgSend(v8, sel_leadingAnchor);
    id v13 = [(NSLayoutXAxisAnchor *)v11 constraintEqualToAnchor:v12];

    *(void *)(v10 + 32) = v13;
    unint64_t v14 = [(UIView *)v24 trailingAnchor];
    id v15 = objc_msgSend(v8, sel_trailingAnchor);
    id v16 = [(NSLayoutXAxisAnchor *)v14 constraintEqualToAnchor:v15];

    *(void *)(v10 + 40) = v16;
    uint64_t v17 = [(UIView *)v24 topAnchor];
    id v18 = objc_msgSend(v8, sel_topAnchor);
    id v19 = [(NSLayoutYAxisAnchor *)v17 constraintEqualToAnchor:v18];

    *(void *)(v10 + 48) = v19;
    os_log_type_t v20 = [(UIView *)v24 bottomAnchor];
    id v21 = objc_msgSend(v8, sel_bottomAnchor);
    id v22 = [(NSLayoutYAxisAnchor *)v20 constraintEqualToAnchor:v21];

    *(void *)(v10 + 56) = v22;
    sub_24CD16F40();
    sub_24CD109B4();
    uint64_t v23 = (void *)sub_24CD16F20();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_activateConstraints_, v23);

    [(UIViewController *)childController didMoveToParentViewController:v2];
  }
}

unint64_t sub_24CD109B4()
{
  unint64_t result = qword_26982BB70;
  if (!qword_26982BB70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982BB70);
  }
  return result;
}

uint64_t TextWithAnimatedEllipsis.init(localizedText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  swift_storeEnumTagMultiPayload();
  uint64_t result = type metadata accessor for TextWithAnimatedEllipsis();
  uint64_t v7 = (uint64_t *)((char *)a3 + *(int *)(result + 20));
  *uint64_t v7 = a1;
  v7[1] = a2;
  return result;
}

uint64_t TextWithAnimatedEllipsis.body.getter()
{
  uint64_t v1 = type metadata accessor for TextWithAnimatedEllipsis();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  int64x2_t v19 = vdupq_n_s64(0x3FC999999999999AuLL);
  uint64_t v20 = 0x3FC999999999999ALL;
  sub_24CD126B8(v0, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_24CD12720((uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB88);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BB90);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BB98);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BBA0);
  uint64_t v9 = sub_24CD13390(&qword_26982BBA8, &qword_26982BBA0);
  uint64_t v10 = sub_24CD13390(&qword_26982BBB0, &qword_26982BB98);
  unint64_t v14 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v15 = v8;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v10;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v14 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = OpaqueTypeConformance2;
  uint64_t v18 = v10;
  swift_getOpaqueTypeConformance2();
  sub_24CD127D0();
  return sub_24CD16C50();
}

uint64_t sub_24CD10CC0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24CD16C30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CD133D4((uint64_t)v7);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F18DC8])
  {
    type metadata accessor for TextWithAnimatedEllipsis();
    swift_bridgeObjectRetain();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v9 = sub_24CD16DE0();
    *(void *)&long long v92 = a2;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    char v14 = v13;
    swift_release();
    uint64_t v15 = sub_24CD16DF0();
    uint64_t v17 = v16;
    char v19 = v18 & 1;
    sub_24CD1368C(v10, v12, v14 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v20 = sub_24CD16DE0();
    uint64_t v22 = v21;
    char v24 = v23;
    swift_release();
    uint64_t v25 = sub_24CD16DF0();
    uint64_t v90 = v26;
    *(void *)&long long v91 = v27;
    LODWORD(v89) = v28 & 1;
    sub_24CD1368C(v20, v22, v24 & 1);
    swift_bridgeObjectRelease();
    sub_24CD1368C(v15, v17, v19);
    swift_bridgeObjectRelease();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v29 = sub_24CD16DE0();
    uint64_t v31 = v30;
    char v33 = v32;
    swift_release();
    uint64_t v34 = v90;
    uint64_t v35 = sub_24CD16DF0();
    uint64_t v37 = v36;
    uint64_t v88 = v38;
    uint64_t v40 = v39 & 1;
    sub_24CD1368C(v29, v31, v33 & 1);
    swift_bridgeObjectRelease();
    uint64_t v41 = v25;
    a2 = v92;
    sub_24CD1368C(v41, v34, v89);
    swift_bridgeObjectRelease();
    *(void *)&long long v93 = v35;
    *((void *)&v93 + 1) = v37;
    *(void *)&long long v94 = v40;
    *((void *)&v94 + 1) = v88;
    LOBYTE(v95) = 0;
    sub_24CD1369C(v35, v37, v40);
    swift_bridgeObjectRetain();
    sub_24CD16CF0();
    long long v93 = v96;
    long long v94 = v97;
    __int16 v95 = v98;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBC8);
    sub_24CD1284C();
    sub_24CD16CF0();
    uint64_t v42 = v35;
    uint64_t v43 = v37;
    char v44 = v40;
  }
  else
  {
    int v45 = v8;
    int v46 = *MEMORY[0x263F18DD0];
    v47 = (void *)(a1 + *(int *)(type metadata accessor for TextWithAnimatedEllipsis() + 20));
    uint64_t v48 = v47[1];
    if (v45 != v46)
    {
      *(void *)&long long v93 = *v47;
      *((void *)&v93 + 1) = v48;
      *(void *)&long long v94 = 0;
      *((void *)&v94 + 1) = MEMORY[0x263F8EE78];
      __int16 v95 = 256;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBC8);
      sub_24CD1284C();
      sub_24CD16CF0();
      long long v92 = v96;
      long long v91 = v97;
      unsigned __int8 v85 = v98;
      char v86 = v99;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      long long v84 = v91;
      long long v83 = v92;
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v49 = sub_24CD16DE0();
    uint64_t v51 = v50;
    char v53 = v52;
    swift_release();
    uint64_t v54 = sub_24CD16DF0();
    *(void *)&long long v92 = a2;
    uint64_t v55 = v54;
    uint64_t v57 = v56;
    char v59 = v58 & 1;
    sub_24CD1368C(v49, v51, v53 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v60 = sub_24CD16DE0();
    uint64_t v62 = v61;
    LOBYTE(v51) = v63;
    swift_release();
    char v64 = v51 & 1;
    uint64_t v65 = sub_24CD16DF0();
    uint64_t v90 = v66;
    *(void *)&long long v91 = v67;
    LOBYTE(v51) = v68 & 1;
    sub_24CD1368C(v60, v62, v64);
    swift_bridgeObjectRelease();
    sub_24CD1368C(v55, v57, v59);
    swift_bridgeObjectRelease();
    sub_24CD16E50();
    sub_24CD16E60();
    swift_release();
    uint64_t v69 = sub_24CD16DE0();
    uint64_t v71 = v70;
    char v73 = v72;
    swift_release();
    LOBYTE(v57) = v73 & 1;
    uint64_t v74 = v90;
    uint64_t v88 = sub_24CD16DF0();
    uint64_t v76 = v75;
    uint64_t v89 = v77;
    uint64_t v79 = v78 & 1;
    sub_24CD1368C(v69, v71, v57);
    swift_bridgeObjectRelease();
    sub_24CD1368C(v65, v74, v51);
    swift_bridgeObjectRelease();
    *(void *)&long long v93 = v88;
    *((void *)&v93 + 1) = v76;
    char v80 = v79;
    *(void *)&long long v94 = v79;
    *((void *)&v94 + 1) = v89;
    LOBYTE(v95) = 1;
    uint64_t v81 = v88;
    sub_24CD1369C(v88, v76, v80);
    swift_bridgeObjectRetain();
    sub_24CD16CF0();
    long long v93 = v96;
    long long v94 = v97;
    __int16 v95 = v98;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBC8);
    sub_24CD1284C();
    sub_24CD16CF0();
    uint64_t v42 = v81;
    uint64_t v43 = v76;
    char v44 = v80;
    a2 = v92;
  }
  sub_24CD1368C(v42, v43, v44);
  uint64_t result = swift_bridgeObjectRelease();
  long long v83 = v96;
  long long v84 = v97;
  unsigned __int8 v85 = v98;
  char v86 = v99;
LABEL_7:
  *(_OWORD *)a2 = v83;
  *(_OWORD *)(a2 + 16) = v84;
  *(unsigned char *)(a2 + 32) = v85;
  *(unsigned char *)(a2 + 33) = v86;
  return result;
}

uint64_t sub_24CD114F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB80);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v1);
  int v45 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB90);
  uint64_t v46 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB98);
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v38 - v9;
  MEMORY[0x270FA5388](v8);
  char v52 = (char *)&v38 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBA0);
  uint64_t v54 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v53 = (char *)&v38 - v15;
  swift_getKeyPath();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC00);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BC08);
  uint64_t v18 = sub_24CD13390(&qword_26982BC10, &qword_26982BC08);
  uint64_t v56 = (ValueMetadata *)MEMORY[0x263F8D538];
  uint64_t v57 = v17;
  uint64_t v58 = v17;
  uint64_t v59 = v18;
  uint64_t v60 = v18;
  uint64_t v38 = (void (*)(char *, uint64_t))MEMORY[0x263F1A368];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v50 = v14;
  sub_24CD16C10();
  uint64_t v40 = sub_24CD13390(&qword_26982BBA8, &qword_26982BBA0);
  uint64_t v39 = v11;
  MEMORY[0x253311F00](v14);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t))(v54 + 8);
  v54 += 8;
  uint64_t v41 = v20;
  v20(v14, v11);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC18);
  uint64_t v56 = (ValueMetadata *)MEMORY[0x263F8D538];
  uint64_t v57 = v16;
  uint64_t v58 = v17;
  uint64_t v59 = OpaqueTypeConformance2;
  uint64_t v60 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v51;
  sub_24CD16C10();
  uint64_t v22 = sub_24CD13390(&qword_26982BBB0, &qword_26982BB98);
  MEMORY[0x253311F00](v21, &type metadata for TextWithAnimatedEllipsis.TextOpacity, v5, v22);
  uint64_t v24 = v55 + 8;
  char v23 = *(void (**)(char *, uint64_t))(v55 + 8);
  v23(v21, v5);
  uint64_t v38 = v23;
  uint64_t v55 = v24;
  swift_getKeyPath();
  uint64_t v25 = v42;
  sub_24CD16C10();
  MEMORY[0x253311F00](v25, &type metadata for TextWithAnimatedEllipsis.TextOpacity, v5, v22);
  v23(v25, v5);
  uint64_t v26 = v39;
  uint64_t v27 = v40;
  MEMORY[0x253311F30](v53, &type metadata for TextWithAnimatedEllipsis.TextOpacity, v39, v40);
  char v28 = v43;
  sub_24CD16C80();
  uint64_t v56 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v57 = v26;
  uint64_t v58 = v5;
  uint64_t v59 = v27;
  uint64_t v60 = v22;
  uint64_t v29 = swift_getOpaqueTypeConformance2();
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v51;
  sub_24CD16C80();
  uint64_t v56 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v57 = v30;
  uint64_t v58 = v5;
  uint64_t v59 = v29;
  uint64_t v60 = v22;
  uint64_t v33 = swift_getOpaqueTypeConformance2();
  uint64_t v34 = v47;
  MEMORY[0x253311F10](v31, &type metadata for TextWithAnimatedEllipsis.TextOpacity, v47, v33);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v34);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v28, v30);
  uint64_t v35 = v41;
  v41(v50, v26);
  uint64_t v36 = v38;
  v38(v32, v5);
  v36(v52, v5);
  return v35(v53, v26);
}

uint64_t sub_24CD11BCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v1 = sub_24CD16EE0();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC08);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v16 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v17 = 0x3FECCCCCCCCCCCCDLL;
  sub_24CD16ED0();
  uint64_t v12 = MEMORY[0x263F8D538];
  sub_24CD16C20();
  uint64_t v13 = sub_24CD13390(&qword_26982BC10, &qword_26982BC08);
  MEMORY[0x253311FB0](v9, v12, v2, v13);
  char v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v9, v2);
  uint64_t v17 = 0x3FC999999999999ALL;
  sub_24CD16ED0();
  sub_24CD16C20();
  MEMORY[0x253311FB0](v6, v12, v2, v13);
  v14(v6, v2);
  MEMORY[0x253311FD0](v11, v12, v2, v13);
  sub_24CD16D20();
  v14(v6, v2);
  v14(v9, v2);
  return ((uint64_t (*)(char *, uint64_t))v14)(v11, v2);
}

uint64_t sub_24CD11EA0@<X0>(uint64_t a1@<X8>)
{
  return sub_24CD11EC0(a1);
}

uint64_t sub_24CD11EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_24CD11EC0(a1);
}

uint64_t sub_24CD11EC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC00);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v26 = v1;
  uint64_t v27 = v2;
  MEMORY[0x270FA5388](v1);
  uint64_t v25 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CD16EE0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC08);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v24 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v24 - v16;
  uint64_t v29 = 0x3FC999999999999ALL;
  sub_24CD16EC0();
  uint64_t v18 = MEMORY[0x263F8D538];
  sub_24CD16C20();
  uint64_t v19 = sub_24CD13390(&qword_26982BC10, &qword_26982BC08);
  MEMORY[0x253311FB0](v15, v18, v5, v19);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v15, v5);
  uint64_t v29 = 0x3FECCCCCCCCCCCCDLL;
  sub_24CD16ED0();
  sub_24CD16C20();
  MEMORY[0x253311FB0](v12, v18, v5, v19);
  v20(v12, v5);
  uint64_t v29 = 0x3FC999999999999ALL;
  sub_24CD16ED0();
  sub_24CD16C20();
  MEMORY[0x253311FB0](v9, v18, v5, v19);
  v20(v9, v5);
  MEMORY[0x253311FD0](v17, v18, v5, v19);
  uint64_t v21 = v25;
  sub_24CD16D20();
  uint64_t v29 = v18;
  uint64_t v30 = v5;
  uint64_t v31 = v5;
  uint64_t v32 = v19;
  uint64_t v33 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v26;
  sub_24CD16D20();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
  v20(v9, v5);
  v20(v12, v5);
  v20(v15, v5);
  return ((uint64_t (*)(char *, uint64_t))v20)(v17, v5);
}

uint64_t sub_24CD12328(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  int64x2_t v19 = vdupq_n_s64(0x3FC999999999999AuLL);
  uint64_t v20 = 0x3FC999999999999ALL;
  sub_24CD126B8(v1, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_24CD12720((uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB88);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BB90);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BB98);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BBA0);
  uint64_t v9 = sub_24CD13390(&qword_26982BBA8, &qword_26982BBA0);
  uint64_t v10 = sub_24CD13390(&qword_26982BBB0, &qword_26982BB98);
  uint64_t v14 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v15 = v8;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v10;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = &type metadata for TextWithAnimatedEllipsis.TextOpacity;
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = OpaqueTypeConformance2;
  uint64_t v18 = v10;
  swift_getOpaqueTypeConformance2();
  sub_24CD127D0();
  return sub_24CD16C50();
}

uint64_t sub_24CD1257C()
{
  return sub_24CD16CA0();
}

uint64_t sub_24CD125A0(uint64_t a1)
{
  uint64_t v2 = sub_24CD16C30();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24CD16CB0();
}

uint64_t type metadata accessor for TextWithAnimatedEllipsis()
{
  uint64_t result = qword_26982BBD8;
  if (!qword_26982BBD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CD126B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextWithAnimatedEllipsis();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CD12720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextWithAnimatedEllipsis();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

unint64_t sub_24CD127D0()
{
  unint64_t result = qword_26982BBB8;
  if (!qword_26982BBB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BB88);
    sub_24CD1284C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BBB8);
  }
  return result;
}

unint64_t sub_24CD1284C()
{
  unint64_t result = qword_26982BBC0;
  if (!qword_26982BBC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BBC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BBC0);
  }
  return result;
}

uint64_t sub_24CD128B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TextWithAnimatedEllipsis(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CD16C30();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TextWithAnimatedEllipsis(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24CD16C30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TextWithAnimatedEllipsis(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CD16C30();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TextWithAnimatedEllipsis(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CD12C74((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CD16C30();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24CD12C74(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for TextWithAnimatedEllipsis(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CD16C30();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for TextWithAnimatedEllipsis(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CD12C74((uint64_t)a1);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CD16C30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TextWithAnimatedEllipsis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CD12EB0);
}

uint64_t sub_24CD12EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBD0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TextWithAnimatedEllipsis(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CD12F8C);
}

uint64_t sub_24CD12F8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BBD0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_24CD13050()
{
  sub_24CD130E4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CD130E4()
{
  if (!qword_26982BBE8)
  {
    sub_24CD16C30();
    unint64_t v0 = sub_24CD16C00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26982BBE8);
    }
  }
}

uint64_t sub_24CD1313C()
{
  return sub_24CD13390(&qword_26982BBF0, &qword_26982BBF8);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TextWithAnimatedEllipsis.TextOpacity(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TextWithAnimatedEllipsis.TextOpacity(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TextWithAnimatedEllipsis.TextOpacity()
{
  return &type metadata for TextWithAnimatedEllipsis.TextOpacity;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(type metadata accessor for TextWithAnimatedEllipsis() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24CD16C30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CD13310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TextWithAnimatedEllipsis() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_24CD10CC0(v4, a1);
}

uint64_t sub_24CD13390(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CD133D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CD16CD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CD136AC(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24CD16C30();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_24CD16FC0();
    uint64_t v14 = sub_24CD16DD0();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_24CD0EC68(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_24CD16FF0();
      _os_log_impl(&dword_24CD0B000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253312880](v18, -1, -1);
      MEMORY[0x253312880](v16, -1, -1);
    }

    sub_24CD16CC0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24CD1368C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CD1369C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24CD136AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_24CD137F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SceneSpecification()
{
  return self;
}

uint64_t sub_24CD1384C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_24CD13884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CD16CE0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24CD16CF0();
}

uint64_t sub_24CD1397C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24CD16CE0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24CD16CF0();
}

uint64_t View.isHidden(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v36 = a4;
  uint64_t v37 = a3;
  LODWORD(v33) = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_24CD16C40();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v18 = sub_24CD16D00();
  uint64_t v35 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v32 - v19;
  if (v33)
  {
    uint64_t v33 = v18;
    uint64_t v21 = v37;
    sub_24CD16E30();
    unint64_t v22 = sub_24CD13E8C();
    uint64_t v38 = v21;
    unint64_t v39 = v22;
    uint64_t WitnessTable = swift_getWitnessTable();
    char v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v23(v17, v15, v11);
    uint64_t v24 = *(void (**)(char *, uint64_t))(v12 + 8);
    v24(v15, v11);
    v23(v15, v17, v11);
    uint64_t v18 = v33;
    sub_24CD13884((uint64_t)v15, v11);
    v24(v15, v11);
    v24(v17, v11);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v25(v10, WitnessTable, a2);
    v25(v8, (uint64_t)v10, a2);
    unint64_t v26 = sub_24CD13E8C();
    uint64_t v44 = v37;
    unint64_t v45 = v26;
    swift_getWitnessTable();
    sub_24CD1397C((uint64_t)v8, v11, a2);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v8, a2);
    v27(v10, a2);
  }
  unint64_t v28 = sub_24CD13E8C();
  uint64_t v29 = v37;
  uint64_t v42 = v37;
  unint64_t v43 = v28;
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v41 = v29;
  swift_getWitnessTable();
  uint64_t v30 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v36, v20, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, v18);
}

unint64_t sub_24CD13E8C()
{
  unint64_t result = qword_26982BC28;
  if (!qword_26982BC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982BC28);
  }
  return result;
}

uint64_t sub_24CD13EE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CD13F88(uint64_t a1)
{
  return sub_24CD1403C(a1, qword_26982C1C0);
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

uint64_t sub_24CD14010(uint64_t a1)
{
  return sub_24CD1403C(a1, qword_26982C1D8);
}

uint64_t sub_24CD1403C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24CD16BE0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24CD16BD0();
}

uint64_t sub_24CD140B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982BCD0);
  sub_24CD16E80();
  return v1;
}

uint64_t sub_24CD1410C()
{
  return sub_24CD16E90();
}

uint64_t AsyncButton.init(role:action:label:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  os_log_type_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for AsyncButton();
  uint64_t v17 = &a7[v16[11]];
  char v22 = 0;
  sub_24CD16E70();
  uint64_t v18 = v24;
  *uint64_t v17 = v23;
  *((void *)v17 + 1) = v18;
  sub_24CD142F4(a1, (uint64_t)&a7[v16[10]]);
  *(void *)a7 = a2;
  *((void *)a7 + 1) = a3;
  uint64_t v19 = swift_retain();
  a4(v19);
  swift_release();
  sub_24CD16820(a1, &qword_26982BC30);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(&a7[v16[9]], v15, a6);
}

uint64_t type metadata accessor for AsyncButton()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CD142F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AsyncButton.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v31 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BC30);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v28 = v9;
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = sub_24CD16EB0();
  uint64_t v33 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v30 = (char *)&v28 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BC38);
  uint64_t v14 = sub_24CD16C40();
  uint64_t v34 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v29 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v32 = (char *)&v28 - v17;
  sub_24CD142F4(v2 + *(int *)(a1 + 40), (uint64_t)v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  unint64_t v18 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v10;
  *(void *)(v19 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v19 + v18, v6, a1);
  uint64_t v36 = v10;
  uint64_t v37 = v11;
  uint64_t v38 = v2;
  uint64_t v20 = v30;
  sub_24CD16EA0();
  sub_24CD140B4();
  uint64_t WitnessTable = swift_getWitnessTable();
  char v22 = v29;
  sub_24CD16E40();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v12);
  unint64_t v23 = sub_24CD1512C();
  uint64_t v39 = WitnessTable;
  unint64_t v40 = v23;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = v32;
  sub_24CD13848(v22, v14, v24);
  unint64_t v26 = *(void (**)(char *, uint64_t))(v34 + 8);
  v26(v22, v14);
  sub_24CD13848(v25, v14, v24);
  return ((uint64_t (*)(char *, uint64_t))v26)(v25, v14);
}

uint64_t sub_24CD14758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AsyncButton();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982BCD8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CD1410C();
  uint64_t v13 = sub_24CD16F90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_24CD16F70();
  uint64_t v14 = sub_24CD16F60();
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *((void *)v16 + 2) = v14;
  *((void *)v16 + 3) = v17;
  *((void *)v16 + 4) = a2;
  *((void *)v16 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v16[v15], v9, v6);
  sub_24CD14E7C((uint64_t)v12, (uint64_t)&unk_26982BCE8, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24CD14958()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AsyncButton();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + *(int *)(v2 + 36), v1);
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 40);
  uint64_t v7 = sub_24CD16BF0();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_24CD14AE8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(type metadata accessor for AsyncButton() - 8);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_24CD14758(v4, v1, v2);
}

uint64_t sub_24CD14B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_24CD16F70();
  v6[5] = sub_24CD16F60();
  uint64_t v8 = sub_24CD16F50();
  v6[6] = v8;
  v6[7] = v7;
  return MEMORY[0x270FA2498](sub_24CD14C08, v8, v7);
}

uint64_t sub_24CD14C08()
{
  uint64_t v3 = (uint64_t (*)(void))(**(void **)(v0 + 16) + ***(int ***)(v0 + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_24CD14CD4;
  return v3();
}

uint64_t sub_24CD14CD4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24CD14DF4, v3, v2);
}

uint64_t sub_24CD14DF4()
{
  swift_release();
  type metadata accessor for AsyncButton();
  sub_24CD1410C();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CD14E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CD16F90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CD16F80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CD16820(a1, &qword_26982BCD8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CD16F50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CD15028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AsyncButton();
  sub_24CD13848(a1 + *(int *)(v9 + 36), a2, a3);
  sub_24CD13848(v8, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_24CD15120()
{
  return sub_24CD15028(v0[4], v0[2], v0[3]);
}

unint64_t sub_24CD1512C()
{
  unint64_t result = qword_26982BC40[0];
  if (!qword_26982BC40[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982BC38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26982BC40);
  }
  return result;
}

uint64_t sub_24CD15188()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CD151D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void sub_24CD151D8()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_24CD16398();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_24CD152BC(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v30 = sub_24CD16BF0();
  uint64_t v10 = *(void *)(v30 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v9 + v11;
  uint64_t v13 = (v9 + v11 + ((v8 + 16) & ~v8)) & ~v11;
  if (*(_DWORD *)(v10 + 84)) {
    size_t v14 = *(void *)(v10 + 64);
  }
  else {
    size_t v14 = *(void *)(v10 + 64) + 1;
  }
  size_t v15 = v14 + 7;
  uint64_t v16 = *a2;
  if ((v11 | (unint64_t)v7) > 7
    || ((*(_DWORD *)(v10 + 80) | v7) & 0x100000) != 0
    || ((v14 + 7 + v13) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    *a1 = v16;
    a1 = (void *)(v16
                  + (((v11 | v7) & 0xF8 ^ 0x1F8) & ((v11 | v7) + 16)));
  }
  else
  {
    uint64_t v19 = ~v11;
    uint64_t v20 = a2[1];
    *a1 = v16;
    a1[1] = v20;
    uint64_t v21 = (char *)a2 + v8;
    uint64_t v22 = ((unint64_t)a1 + v8 + 16) & ~v8;
    uint64_t v23 = (unint64_t)(v21 + 16) & ~v8;
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_retain();
    v24(v22, v23, v5);
    uint64_t v25 = (void *)((v22 + v12) & v19);
    unint64_t v26 = (const void *)((v23 + v12) & v19);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))((v23 + v12) & v19, 1, v30))
    {
      memcpy(v25, v26, v14);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v25, v26, v30);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v30);
    }
    unint64_t v27 = ((unint64_t)v25 + v15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v28 = ((unint64_t)v26 + v15) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v27 = *(unsigned char *)v28;
    *(void *)(v27 + 8) = *(void *)(v28 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_24CD15520(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v8 = sub_24CD16BF0();
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8)) {
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v10, v8);
  }
  return swift_release();
}

void *sub_24CD15650(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_retain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48);
  uint64_t v12 = sub_24CD16BF0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v11 + v14;
  uint64_t v16 = (void *)((v11 + v14 + v9) & ~v14);
  uint64_t v17 = (const void *)((v15 + v10) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v17, 1, v12))
  {
    int v18 = *(_DWORD *)(v13 + 84);
    uint64_t v19 = *(void *)(v13 + 64);
    if (v18) {
      size_t v20 = *(void *)(v13 + 64);
    }
    else {
      size_t v20 = v19 + 1;
    }
    memcpy(v16, v17, v20);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v16, v17, v12);
    uint64_t v22 = *(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56);
    uint64_t v21 = v13 + 56;
    v22(v16, 0, 1, v12);
    int v18 = *(_DWORD *)(v21 + 28);
    uint64_t v19 = *(void *)(v21 + 8);
  }
  if (v18) {
    uint64_t v23 = v19;
  }
  else {
    uint64_t v23 = v19 + 1;
  }
  unint64_t v24 = ((unint64_t)v16 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = ((unint64_t)v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_retain();
  return a1;
}

void *sub_24CD157F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 40);
  uint64_t v13 = sub_24CD16BF0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  uint64_t v17 = (void *)((v12 + v15 + v10) & ~v15);
  int v18 = (void *)((v16 + v11) & ~v15);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(v17, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (v11)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v17, v18, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v17, v18, v13);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v24 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v14 + 64) + 1;
  }
  unint64_t v25 = ((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = ((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24CD15A30(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t v10 = sub_24CD16BF0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = (void *)((v9 + v12 + v7) & ~v12);
  uint64_t v14 = (const void *)((v9 + v12 + v8) & ~v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v14, 1, v10))
  {
    int v15 = *(_DWORD *)(v11 + 84);
    size_t v16 = *(void *)(v11 + 64);
    if (v15) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v16 + 1;
    }
    memcpy(v13, v14, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v13, v14, v10);
    uint64_t v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56);
    uint64_t v18 = v11 + 56;
    v19(v13, 0, 1, v10);
    int v15 = *(_DWORD *)(v18 + 28);
    size_t v16 = *(void *)(v18 + 8);
  }
  if (v15) {
    size_t v20 = v16;
  }
  else {
    size_t v20 = v16 + 1;
  }
  *(_OWORD *)(((unint64_t)v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v14 + v20 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

_OWORD *sub_24CD15BC0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 24);
  uint64_t v12 = sub_24CD16BF0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v11 + v14;
  size_t v16 = (void *)((v11 + v14 + v9) & ~v14);
  size_t v17 = (void *)((v15 + v10) & ~v14);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v10) = v18(v16, 1, v12);
  int v19 = v18(v17, 1, v12);
  if (v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v16, v17, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
      goto LABEL_12;
    }
    int v20 = *(_DWORD *)(v13 + 84);
    size_t v21 = *(void *)(v13 + 64);
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v16, v17, v12);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v16, v12);
    int v20 = *(_DWORD *)(v13 + 84);
    size_t v21 = *(void *)(v13 + 64);
  }
  if (v20) {
    size_t v22 = v21;
  }
  else {
    size_t v22 = v21 + 1;
  }
  memcpy(v16, v17, v22);
LABEL_12:
  if (*(_DWORD *)(v13 + 84)) {
    uint64_t v23 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v23 = *(void *)(v13 + 64) + 1;
  }
  unint64_t v24 = ((unint64_t)v16 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = ((unint64_t)v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_release();
  return a1;
}

uint64_t sub_24CD15DEC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(sub_24CD16BF0() - 8);
  uint64_t v9 = v8;
  unsigned int v10 = *(_DWORD *)(v8 + 84);
  unsigned int v11 = v10 - 1;
  if (!v10) {
    unsigned int v11 = 0;
  }
  if (v7 <= v11) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = v7;
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = v12;
  }
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = *(void *)(v6 + 64);
  uint64_t v16 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = *(void *)(v8 + 64);
  uint64_t v18 = 7;
  if (!v10) {
    uint64_t v18 = 8;
  }
  if (!a2) {
    return 0;
  }
  if (v13 < a2)
  {
    unint64_t v19 = ((v18 + v17 + ((v15 + v16 + ((v14 + 16) & ~v14)) & ~v16)) & 0xFFFFFFFFFFFFFFF8) + 16;
    uint64_t v20 = v19 & 0xFFFFFFF8;
    if ((v19 & 0xFFFFFFF8) != 0) {
      unsigned int v21 = 2;
    }
    else {
      unsigned int v21 = a2 - v13 + 1;
    }
    if (v21 >= 0x10000) {
      unsigned int v22 = 4;
    }
    else {
      unsigned int v22 = 2;
    }
    if (v21 < 0x100) {
      unsigned int v22 = 1;
    }
    if (v21 >= 2) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    switch(v23)
    {
      case 1:
        int v24 = *((unsigned __int8 *)a1 + v19);
        if (!v24) {
          break;
        }
        goto LABEL_28;
      case 2:
        int v24 = *(unsigned __int16 *)((char *)a1 + v19);
        if (v24) {
          goto LABEL_28;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24CD16068);
      case 4:
        int v24 = *(_DWORD *)((char *)a1 + v19);
        if (!v24) {
          break;
        }
LABEL_28:
        int v25 = v24 - 1;
        if (v20)
        {
          int v25 = 0;
          LODWORD(v20) = *a1;
        }
        return v13 + (v20 | v25) + 1;
      default:
        break;
    }
  }
  if ((v12 & 0x80000000) == 0)
  {
    uint64_t v27 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v27) = -1;
    }
    return (v27 + 1);
  }
  uint64_t v28 = ((unint64_t)a1 + v14 + 16) & ~v14;
  if (v7 != v13)
  {
    if (v10 >= 2)
    {
      unsigned int v30 = (*(uint64_t (**)(uint64_t))(v9 + 48))((v28 + v15 + v16) & ~v16);
      if (v30 >= 2) {
        return v30 - 1;
      }
      else {
        return 0;
      }
    }
    return 0;
  }
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  return v29(v28, v7, v5);
}

void sub_24CD1607C(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v32 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  int v10 = 0;
  uint64_t v11 = *(void *)(sub_24CD16BF0() - 8);
  uint64_t v12 = v11;
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  if (v13) {
    unsigned int v14 = v13 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = *(void *)(v8 + 64);
  uint64_t v17 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v18 = *(void *)(v11 + 64);
  if (v9 <= v14) {
    unsigned int v19 = v14;
  }
  else {
    unsigned int v19 = v9;
  }
  if (v19 <= 0x7FFFFFFF) {
    unsigned int v20 = 0x7FFFFFFF;
  }
  else {
    unsigned int v20 = v19;
  }
  uint64_t v21 = 7;
  if (!v13) {
    uint64_t v21 = 8;
  }
  size_t v22 = ((v21 + v18 + ((v16 + v17 + ((v15 + 16) & ~v15)) & ~v17)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v20 < a3)
  {
    if (((v21 + v18 + ((v16 + v17 + ((v15 + 16) & ~v15)) & ~v17)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v23 = a3 - v20 + 1;
    }
    else {
      unsigned int v23 = 2;
    }
    if (v23 >= 0x10000) {
      int v24 = 4;
    }
    else {
      int v24 = 2;
    }
    if (v23 < 0x100) {
      int v24 = 1;
    }
    if (v23 >= 2) {
      int v10 = v24;
    }
    else {
      int v10 = 0;
    }
  }
  if (a2 > v20)
  {
    if (v22) {
      int v25 = 1;
    }
    else {
      int v25 = a2 - v20;
    }
    if (v22)
    {
      int v26 = ~v20 + a2;
      bzero(a1, v22);
      *(_DWORD *)a1 = v26;
    }
    switch(v10)
    {
      case 1:
        *((unsigned char *)a1 + v22) = v25;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v22) = v25;
        return;
      case 3:
        goto LABEL_55;
      case 4:
        *(_DWORD *)((char *)a1 + v22) = v25;
        return;
      default:
        return;
    }
  }
  switch(v10)
  {
    case 1:
      *((unsigned char *)a1 + v22) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 2:
      *(_WORD *)((char *)a1 + v22) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 3:
LABEL_55:
      __break(1u);
      JUMPOUT(0x24CD16370);
    case 4:
      *(_DWORD *)((char *)a1 + v22) = 0;
      goto LABEL_38;
    default:
LABEL_38:
      if (a2)
      {
LABEL_39:
        if ((v19 & 0x80000000) != 0)
        {
          uint64_t v28 = ((unint64_t)a1 + v15 + 16) & ~v15;
          if (v9 == v20)
          {
            uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
            v29(v28, a2, v9, v7);
          }
          else if (v13 >= 2)
          {
            uint64_t v30 = (v28 + v16 + v17) & ~v17;
            uint64_t v31 = *(void (**)(uint64_t, void))(v12 + 56);
            v31(v30, (a2 + 1));
          }
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v27 = a2 ^ 0x80000000;
            a1[1] = 0;
          }
          else
          {
            uint64_t v27 = (a2 - 1);
          }
          *a1 = v27;
        }
      }
      return;
  }
}

void sub_24CD16398()
{
  if (!qword_26982BCC8)
  {
    sub_24CD16BF0();
    unint64_t v0 = sub_24CD16FE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26982BCC8);
    }
  }
}

uint64_t sub_24CD163F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CD1648C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for AsyncButton();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + *(int *)(v2 + 36), v1);
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 40);
  uint64_t v7 = sub_24CD16BF0();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_24CD16624(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for AsyncButton() - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  int v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *int v10 = v2;
  v10[1] = sub_24CD1672C;
  return sub_24CD14B6C(a1, v7, v8, v9, v4, v5);
}

uint64_t sub_24CD1672C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CD16820(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CD1687C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24CD16958;
  return v6(a1);
}

uint64_t sub_24CD16958()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CD16A50()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CD16A88(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24CD1672C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26982BCF0 + dword_26982BCF0);
  return v6(a1, v4);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24CD16B70()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24CD16B80()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24CD16B90()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24CD16BA0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24CD16BB0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24CD16BC0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CD16BD0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CD16BE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CD16BF0()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24CD16C00()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24CD16C10()
{
  return MEMORY[0x270EFF7C0]();
}

uint64_t sub_24CD16C20()
{
  return MEMORY[0x270EFFA78]();
}

uint64_t sub_24CD16C30()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_24CD16C40()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24CD16C50()
{
  return MEMORY[0x270F003D8]();
}

uint64_t sub_24CD16C60()
{
  return MEMORY[0x270F00418]();
}

uint64_t sub_24CD16C70()
{
  return MEMORY[0x270F00430]();
}

uint64_t sub_24CD16C80()
{
  return MEMORY[0x270F00438]();
}

uint64_t sub_24CD16C90()
{
  return MEMORY[0x270F00448]();
}

uint64_t sub_24CD16CA0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_24CD16CB0()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_24CD16CC0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24CD16CD0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24CD16CE0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24CD16CF0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24CD16D00()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24CD16D10()
{
  return MEMORY[0x270F024D8]();
}

uint64_t sub_24CD16D20()
{
  return MEMORY[0x270F024E0]();
}

uint64_t sub_24CD16D30()
{
  return MEMORY[0x270F024E8]();
}

uint64_t sub_24CD16D40()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24CD16D50()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24CD16D60()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24CD16D80()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24CD16D90()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24CD16DA0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24CD16DC0()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24CD16DD0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24CD16DE0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24CD16DF0()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_24CD16E00()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24CD16E10()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24CD16E20()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24CD16E30()
{
  return MEMORY[0x270F04028]();
}

uint64_t sub_24CD16E40()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_24CD16E50()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24CD16E60()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24CD16E70()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24CD16E80()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24CD16E90()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24CD16EA0()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24CD16EB0()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_24CD16EC0()
{
  return MEMORY[0x270F05340]();
}

uint64_t sub_24CD16ED0()
{
  return MEMORY[0x270F05350]();
}

uint64_t sub_24CD16EE0()
{
  return MEMORY[0x270F05358]();
}

uint64_t sub_24CD16EF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CD16F00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CD16F10()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CD16F20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CD16F30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CD16F40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CD16F50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CD16F60()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CD16F70()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CD16F80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CD16F90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CD16FA0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24CD16FB0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CD16FC0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24CD16FD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CD16FE0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CD16FF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CD17000()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CD17010()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CD17020()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CD17030()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CD17040()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CD17050()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CD17060()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CD17070()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CD17080()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CD17090()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CD170A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CD170B0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CD170C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CD170D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CD170E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CD170F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CD17100()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CD17110()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CD17120()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CD17130()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CD17140()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CD17150()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CD17160()
{
  return MEMORY[0x270FA0128]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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